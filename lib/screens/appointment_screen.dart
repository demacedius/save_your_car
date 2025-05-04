import 'package:flutter/material.dart';
import 'package:save_your_car/widgets/Main_scaffold.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:save_your_car/theme/figma_color.dart';
import 'package:save_your_car/theme/figma_text_style.dart';

class AppointmentScreen extends StatefulWidget {
  const AppointmentScreen({super.key});

  @override
  State<AppointmentScreen> createState() => _AppointmentScreenState();
}

class _AppointmentScreenState extends State<AppointmentScreen> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  String _selectedTime = "10:00";
  final textStyle = FigmaTextStyles();

  @override
  Widget build(BuildContext context) {
    return MainScaffold(
      currentIndex: 2,
      child: Scaffold(
        backgroundColor: FigmaColors.neutral00,
        body: SafeArea(
          top: false,
          child: Column(
            children: [
              // AppBar noire
              Container(
                height: 162,
                width: double.infinity,
                color: FigmaColors.neutral100,
                padding: const EdgeInsets.only(top: 68, left: 24, right: 24),
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        shape: BoxShape.circle,
                      ),
                      child: IconButton(
                        padding: EdgeInsets.zero,
                        icon: const Icon(
                          Icons.chevron_left,
                          color: Colors.white,
                          size: 20,
                        ),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                    const Spacer(),
                    Text(
                      "RDV",
                      style: textStyle.textXLSemiBold.copyWith(
                        color: Colors.white,
                      ),
                    ),
                    const Spacer(),
                  ],
                ),
              ),
      
              Expanded(
                child: SingleChildScrollView(
                  padding: const EdgeInsets.only(bottom: 24),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Calendrier
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                        child: Container(
                          padding: const EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: FigmaColors.neutral10,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Column(
                            children: [
                              TableCalendar(
                                firstDay: DateTime.utc(2020, 1, 1),
                                lastDay: DateTime.utc(2030, 12, 31),
                                focusedDay: _focusedDay,
                                selectedDayPredicate:
                                    (day) => isSameDay(_selectedDay, day),
                                onDaySelected: (selected, focused) {
                                  setState(() {
                                    _selectedDay = selected;
                                    _focusedDay = focused;
                                  });
                                },
                                headerStyle: const HeaderStyle(
                                  formatButtonVisible: false,
                                  titleCentered: true,
                                  leftChevronIcon: Icon(
                                    Icons.chevron_left,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  rightChevronIcon: Icon(
                                    Icons.chevron_right,
                                    size: 20,
                                    color: Colors.black,
                                  ),
                                  titleTextStyle: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16,
                                    color: Colors.black,
                                  ),
                                  decoration: BoxDecoration(), // pas de fond
                                ),
                                calendarStyle: CalendarStyle(
                                  selectedDecoration: const BoxDecoration(
                                    color: FigmaColors.primaryMain, // couleur violette
                                    shape: BoxShape.circle,
                                  ),
                                  todayDecoration: BoxDecoration(
                                    color: FigmaColors.primaryFocus,
                                    shape: BoxShape.circle,
                                  ),
                                  defaultTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  weekendTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  selectedTextStyle: const TextStyle(
                                    color: Colors.white,
                                  ),
                                  todayTextStyle: const TextStyle(
                                    color: Colors.black,
                                  ),
                                  outsideTextStyle: const TextStyle(
                                    color: Colors.grey,
                                  ),
                                ),
                                daysOfWeekStyle: const DaysOfWeekStyle(
                                  weekdayStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  weekendStyle: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
      
                              const SizedBox(height: 16),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    _selectedTime,
                                    style: textStyle.textXLSemiBold,
                                  ),
                                  DropdownButton<String>(
                                    value: _selectedTime,
                                    underline: const SizedBox(),
                                    items:
                                        [
                                              "10:00",
                                              "11:00",
                                              "14:00",
                                              "15:00",
                                              "16:00",
                                            ]
                                            .map(
                                              (e) => DropdownMenuItem(
                                                value: e,
                                                child: Text(e),
                                              ),
                                            )
                                            .toList(),
                                    onChanged:
                                        (value) => setState(
                                          () => _selectedTime = value!,
                                        ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
      
                      // Titre
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Text(
                          "Pièces Concernées",
                          style: textStyle.textXLSemiBold,
                        ),
                      ),
                      const SizedBox(height: 12),
      
                      // Liste des pièces
                      SizedBox(
                        height: 154,
                        child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: 4,
                          padding: const EdgeInsets.symmetric(horizontal: 24),
                          itemBuilder: (context, index) {
                            return Container(
                              margin: const EdgeInsets.only(right: 12),
                              width: 160,
                              height: 154,
                              decoration: BoxDecoration(
                                color: FigmaColors.neutral10,
                                borderRadius: BorderRadius.circular(16),
                                border: Border.all(
                                  color:
                                      index == 1
                                          ? FigmaColors.primaryMain
                                          : Colors.transparent,
                                  width: 2,
                                ),
                              ),
                              padding: const EdgeInsets.all(12),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Image.asset(
                                    "assets/images/car-parts 1.png",
                                    height: 50,
                                    width: 61,
                                    fit: BoxFit.contain,
                                  ),
                                  const SizedBox(height: 8),
                                  Text(
                                    "Nom de la pièce",
                                    style: textStyle.textLBold,
                                  ),
                                  const SizedBox(height: 4),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                      horizontal: 6,
                                      vertical: 2,
                                    ),
                                    decoration: BoxDecoration(
                                      color: Colors.blue.shade100,
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: Text(
                                      "Catégorie",
                                      style: textStyle.captionXSMedium,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                      ),
      
                      const SizedBox(height: 24),
      
                      // Bouton
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: SizedBox(
                          width: double.infinity,
                          height: 56,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: FigmaColors.primaryMain,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(12),
                              ),
                            ),
                            onPressed: () {
                              // Logique ici
                            },
                            child: const Text(
                              "Prendre un RDV",
                              style: TextStyle(color: Colors.white, fontSize: 16),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
