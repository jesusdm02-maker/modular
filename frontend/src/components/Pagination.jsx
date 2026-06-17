import React from 'react'

export default function Pagination({ page, totalPages, onPageChange }) {
  if (totalPages <= 1) return null

  const pages = []
  const start = Math.max(1, page - 2)
  const end = Math.min(totalPages, start + 4)

  for (let i = start; i <= end; i += 1) {
    pages.push(i)
  }

  return (
    <div className="pagination">
      <button onClick={() => onPageChange(page - 1)} disabled={page === 1}>
        Anterior
      </button>
      {pages.map(num => (
        <button
          key={num}
          className={num === page ? 'active' : ''}
          onClick={() => onPageChange(num)}
        >
          {num}
        </button>
      ))}
      <button onClick={() => onPageChange(page + 1)} disabled={page === totalPages}>
        Siguiente
      </button>
    </div>
  )
}
