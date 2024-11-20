class Himpunan:
    def __init__(self, *elemen):
        self.data = []
        for item in elemen:
            if item not in self.data:
                self.data.append(item)

    def __repr__(self):
        return f"Himpunan({', '.join(map(str, self.data))})"

    def __len__(self):
        return len(self.data)

    def __contains__(self, item):
        return item in self.data

    def __eq__(self, other):
        if not isinstance(other, Himpunan):
            return NotImplemented
        return sorted(self.data) == sorted(other.data)

    def __le__(self, other):
        return all(item in other for item in self.data)

    def __lt__(self, other):
        return self <= other and self != other

    def __ge__(self, other):
        return all(item in self for item in other)

    def __floordiv__(self, other):
        return self == other

    def __add__(self, other):
        if not isinstance(other, Himpunan):
            return NotImplemented
        return Himpunan(*(self.data + [item for item in other.data if item not in self.data]))

    def __sub__(self, other):
        if not isinstance(other, Himpunan):
            return NotImplemented
        return Himpunan(*[item for item in self.data if item not in other.data])

    def __truediv__(self, other):
        if not isinstance(other, Himpunan):
            return NotImplemented
        return Himpunan(*[item for item in self.data if item in other.data])

    def __mul__(self, other):
        if not isinstance(other, Himpunan):
            return NotImplemented
        return Himpunan(*(set(self.data).symmetric_difference(other.data)))

    def __pow__(self, other):
        if not isinstance(other, Himpunan):
            return NotImplemented
        return Himpunan(*[(a, b) for a in self.data for b in other.data])

    def __abs__(self):
        subsets = [[]]
        for element in self.data:
            subsets += [subset + [element] for subset in subsets]
        return len(subsets)

    def ListKuasa(self):
        subsets = [[]]
        for element in self.data:
            subsets += [subset + [element] for subset in subsets]
        return [Himpunan(*subset) for subset in subsets]

    def Komplemen(self, semesta):
        if not isinstance(semesta, Himpunan):
            return NotImplemented
        return Himpunan(*[item for item in semesta.data if item not in self.data])

    def tambah(self, item):
        if item not in self.data:
            self.data.append(item)

    def hapus(self, item):
        if item in self.data:
            self.data.remove(item)

# contoh penggunaan
S = Himpunan(1, 2, 3, 4, 5, 6, 7, 8, 9)
h1 = Himpunan(1, 2, 3)
h2 = Himpunan(3, 4, 5)
h10 = Himpunan(1, 2, 3, 5, 8, 9)

print(len(h1))  # Output: 3
print(4 in h1)  # Output: True
print(h1 == h10)  # Output: False

h1.tambah(4)  # Menambah elemen 4 ke h1
print(h1)  # Output: Himpunan(1, 2, 3, 4)

h3 = h1 / h2  # Irisan
print(h3)  # Output: Himpunan(3, 4)

h4 = h1 + h2  # Gabungan
print(h4)  # Output: Himpunan(1, 2, 3, 4, 5)

h5 = h1 - h2  # Selisih
print(h5)  # Output: Himpunan(1, 2)

h6 = h1.Komplemen(S)  # Komplemen
print(h6)  # Output: Himpunan(5, 6, 7, 8, 9)

print(abs(h1))  # Output: 16 (jumlah subset)
print(h1.ListKuasa())  # Menampilkan semua subset

h9 = h10 + h2  # Gabungan: {1, 3, 4, 5}
print(h9)