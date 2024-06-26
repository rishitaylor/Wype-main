class FAQ {
  String question;
  List<String> answer;

  FAQ({required this.question, required this.answer});
}

List<FAQ> faqs = [
  FAQ(question: '1) كيفية التسجيل في تطبيق غسيل؟', answer: [
    'قم بتنزيل تطبيق "غسيل اب" من متجر بلاي او اب ستور',
    '-أدخل الاسم',
    'أدخل رقم الهاتف المحمول-',
    '-إنشاء كلمة المرور الخاصة بك',
    '-حدد نوع الجنس',
    '-اضغط هنا للتسجيل'
  ]),
  FAQ(question: '2) كيفية إضافة مركبة الخاص بك؟', answer: [
    'حدد قائمة السيارة',
    '-اختر نوع سيارتك',
    '-اختر الموديل',
    '- أدخل رقم لوحة السيارة لتحديد سيارتك',
    '-اضغط هنا للإضافة',
  ]),
  FAQ(question: '3) كيفية الحجز؟', answer: [
    '-اضغط على زر الحجز الآن',
    '-اختر الموقع',
    '-اختر السيارة',
    '-اختر الخدمة الرئيسية',
    '-اختر خدمة إضافية إذا لزم الأمر',
    '-اضغط على زر المتابعة',
    '-اختر التوقيت',
    '-اضغط على زر تأكيد الحجز',
    '-اختر طريقة الدفع'
  ]),
  FAQ(question: '4) طريقة بحث الحجوزات المستقبلة/ السابقة ؟', answer: [
    'أ) متابعة الحجز المسبق',
    '- اختر قائمة الحجز',
    '- اضغط على الحجز المسبق',
    '- اعرض الحجز المتاح',
    'ب) متابعة الحجز السابق',
    '- اختر قائمة الحجز الخاصة بك',
    '- اختر الحجز السابق',
    '- عرض الحجوزات السابقة',
  ]),
  FAQ(question: '5) كيفية الاشتراك؟', answer: [
    '- اضغط على قائمة الحساب',
    '- اضغط على الباقات',
    '- قم بشراء اي باقة'
  ])
];
