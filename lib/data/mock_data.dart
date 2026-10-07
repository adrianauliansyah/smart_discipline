import '../models/student.dart';
import '../models/violation.dart';

const students = <Student>[
  Student(
    name: 'Ahmad Rizky Pratama',
    nis: '202601001',
    className: 'XII Multimedia 1',
    disciplineScore: 85,
    violations: 3,
    initials: 'AR',
  ),

  Student(
    name: 'Dinda Safitri',
    nis: '202601002',
    className: 'XII Multimedia 1',
    disciplineScore: 92,
    violations: 1,
    initials: 'DS',
  ),

  Student(
    name: 'Fajar Nugraha',
    nis: '202601003',
    className: 'XI Multimedia 2',
    disciplineScore: 78,
    violations: 5,
    initials: 'FN',
  ),

  Student(
    name: 'Nabila Putri',
    nis: '202601004',
    className: 'XI Multimedia 1',
    disciplineScore: 96,
    violations: 0,
    initials: 'NP',
  ),

  Student(
    name: 'Raka Aditya',
    nis: '202601005',
    className: 'X Multimedia 1',
    disciplineScore: 88,
    violations: 2,
    initials: 'RA',
  ),
];

const violations = <Violation>[
  Violation(
    studentName: 'Ahmad Rizky Pratama',
    initials: 'AR',
    type: 'Terlambat masuk kelas',
    category: 'Ringan',
    points: 5,
    date: '15 Januari 2026',
    time: '08:15',
  ),

  Violation(
    studentName: 'Fajar Nugraha',
    initials: 'FN',
    type: 'Seragam tidak lengkap',
    category: 'Sedang',
    points: 3,
    date: '15 Januari 2026',
    time: '09:20',
  ),

  Violation(
    studentName: 'Dinda Safitri',
    initials: 'DS',
    type: 'Tidak hadir tanpa keterangan',
    category: 'Berat',
    points: 10,
    date: '15 Januari 2026',
    time: '10:05',
  ),

  Violation(
    studentName: 'Raka Aditya',
    initials: 'RA',
    type: 'Menggunakan HP saat pelajaran',
    category: 'Sedang',
    points: 4,
    date: '14 Januari 2026',
    time: '11:10',
  ),
];