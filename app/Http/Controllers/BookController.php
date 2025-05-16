<?php

namespace App\Http\Controllers;

use App\Models\Book;
use Illuminate\Http\Request;

class BookController extends Controller
{
    // Prikaz svih knjiga
    public function index()
    {
        $books = Book::all();
        return view('books.index', compact('books'));
    }

    // Prikaz forme za dodavanje nove knjige
    public function create()
    {
        return view('books.create');
    }

    // Čuvanje nove knjige u bazi
    public function store(Request $request)
    {
        $validated = $request->validate([
            'title' => 'required',
            'author' => 'required',
        ]);
        Book::create($validated);

        return redirect()->route('books.index');
    }

    // Prikaz jedne knjige
    public function show(Book $book)
    {
        return view('books.show', compact('book'));
    }

    // Prikaz forme za izmenu knjige
    public function edit(Book $book)
    {
        return view('books.edit', compact('book'));
    }

    // Ažuriranje knjige u bazi
    public function update(Request $request, Book $book)
    {
        $validated = $request->validate([
            'title' => 'required',
            'author' => 'required',
        ]);
        $book->update($validated);

        return redirect()->route('books.index');
    }

    // Brisanje knjige iz baze
    public function destroy(Book $book)
    {
        $book->delete();

        return redirect()->route('books.index');
    }
}