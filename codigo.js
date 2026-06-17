document.addEventListener("DOMContentLoaded", function() {
    

    const loginForm = document.getElementById('loginForm');
    
    if (loginForm) {
        loginForm.addEventListener('submit', function(e) {
            e.preventDefault(); 
            // Simular carga con estilo
            const btn = this.querySelector('button');
            const originalText = btn.innerHTML;
            btn.innerHTML = '<i class="fas fa-spinner fa-spin"></i> Accediendo...';
            
            setTimeout(() => {
                document.getElementById('pantalla-login').classList.remove('active');
                document.getElementById('pantalla-dashboard').classList.add('active');
                btn.innerHTML = originalText;
            }, 800);
        });
    }


    window.cambiarVista = function(idVistaTarget, botonPresionado) {

        document.querySelectorAll('.vista').forEach(vista => {
            vista.classList.remove('active');
        });
        

        document.querySelectorAll('.menu-btn').forEach(btn => {
            btn.classList.remove('active');
        });
        

        const nuevaVista = document.getElementById(idVistaTarget);
        if (nuevaVista) nuevaVista.classList.add('active');
        

        if (botonPresionado) botonPresionado.classList.add('active');
    };

    window.cerrarSesion = function() {
        if(confirm("¿Seguro que deseas salir del sistema?")) {
            document.getElementById('pantalla-dashboard').classList.remove('active');
            document.getElementById('pantalla-login').classList.add('active');
            document.getElementById('loginForm').reset();
            cambiarVista('vista-home', document.querySelectorAll('.menu-btn')[0]);
            updateWizardView(1, 'preinscripcionForm'); // Resetear formulario
        }
    };


    window.nextStep = function(stepIndex, formId) {
        if (!validateStep(stepIndex - 1, formId)) {
            alert("⚠️ Por favor, completa todos los campos requeridos marcados en rojo.");
            return;
        }
        updateWizardView(stepIndex, formId);
    };

    window.prevStep = function(stepIndex, formId) {
        updateWizardView(stepIndex, formId);
    };

    function updateWizardView(stepIndex, formId) {
        const form = document.getElementById(formId);
        if (!form) return;


        form.querySelectorAll(".form-step").forEach(step => step.classList.remove("active"));
        const targetStep = form.querySelector(`#step${stepIndex}`);
        if(targetStep) targetStep.classList.add("active");


        const progressBarId = formId === 'preinscripcionForm' ? 'progreso-preinscripcion' : null;
        if (progressBarId) {
            document.getElementById(progressBarId).querySelectorAll(".step").forEach((step, index) => {
                if (index < stepIndex) step.classList.add("active");
                else step.classList.remove("active");
            });
        }
    }


    function validateStep(stepIndex, formId) {
        const form = document.getElementById(formId);
        const currentFieldset = form.querySelector(`#step${stepIndex}`);
        const requiredInputs = currentFieldset.querySelectorAll("[required]");
        let isValid = true;

        requiredInputs.forEach(input => {
            if (!input.value.trim()) {
                isValid = false;
                input.style.borderColor = "var(--danger)";
                input.style.boxShadow = "0 0 0 4px rgba(239, 68, 68, 0.1)";
            } else {
                input.style.borderColor = "var(--border)";
                input.style.boxShadow = "none";
            }
            

            input.addEventListener('input', function() {
                this.style.borderColor = "var(--primary)";
                this.style.boxShadow = "0 0 0 4px rgba(79, 70, 229, 0.1)";
            }, { once: true });
        });

        return isValid;
    }


    const preinscripcionForm = document.getElementById('preinscripcionForm');
    if(preinscripcionForm) {
        preinscripcionForm.addEventListener('submit', function(e) {
            e.preventDefault();
            if (validateStep(3, 'preinscripcionForm')) {
                alert("✅ Preinscripción completada. Los datos del alumno y representante han sido guardados.");
                this.reset();
                updateWizardView(1, 'preinscripcionForm');
                cambiarVista('vista-home', document.querySelectorAll('.menu-btn')[0]);
            }
        });
    }

    const inscripcionForm = document.getElementById('inscripcionForm');
    if(inscripcionForm) {
        inscripcionForm.addEventListener('submit', function(e) {
            e.preventDefault();
            let isValid = true;
            this.querySelectorAll("[required]").forEach(input => {
                if (!input.value.trim()) {
                    isValid = false;
                    input.style.borderColor = "var(--danger)";
                }
            });

            if (isValid) {
                alert("🎓 Expediente evaluado. El estatus del alumno ha sido actualizado formalmente en el sistema.");
                this.reset();
                cambiarVista('vista-home', document.querySelectorAll('.menu-btn')[0]);
            } else {
                alert("⚠️ Seleccione un alumno, un estatus y un tipo de movimiento.");
            }
        });
    }
});


let usuarioRol = "visitante";


function abrirModal(titulo, mensaje) {
    document.getElementById('modal-titulo').innerText = titulo;
    document.getElementById('modal-mensaje').innerText = mensaje;
    document.querySelector('.modal-overlay').style.display = 'flex';
}

function cerrarModal() {
    document.querySelector('.modal-overlay').style.display = 'none';
}




preinscripcionForm.addEventListener('submit', function(e) {
    e.preventDefault();
    abrirModal("Solicitud Recibida", "Su solicitud ha sido procesada. Debe esperar un tiempo estimado de 5 días hábiles para su cita.");
});


inscripcionForm.addEventListener('submit', function(e) {
    e.preventDefault();
    const status = document.getElementById('id_status').value;
    if (status === "2") { 
        abrirModal("¡Éxito!", "El alumno ya puede ser inscrito formalmente.");
    } else {
        abrirModal("Atención", "El alumno no cumple con los requisitos para ser inscrito actualmente.");
    }
});