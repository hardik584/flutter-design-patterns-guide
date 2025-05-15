import 'package:template_method/impl/student_json_bmi_calculator.dart';
import 'package:template_method/impl/student_xml_bmi_calculator.dart';
import 'package:template_method/impl/teenage_student_json_bmi_calculator.dart';
import 'student_section.dart';
import 'package:flutter/material.dart';

// Defines the skeleton of an algorithm in the superclass
// but lets subclasses override specific steps of the algorithm
// without changing its structure.

// Imagine that you’re creating a data mining application that analyzes corporate documents.
// Users feed the app documents in various formats (PDF, DOC, CSV),
// and it tries to extract meaningful data from these docs in a uniform format.

// The first version of the app could work only with DOC files.
// In the following version, it was able to support CSV files.
// A month later, you “taught” it to extract data from PDF files.

// Solutions
// The Template Method pattern suggests that you break down an algorithm into a series of steps, turn these steps into methods,
// and put a series of calls to these methods inside a single template method.
// The steps may either be abstract, or have some default implementation.
// To use the algorithm, the client is supposed to provide its own subclass, implement all abstract steps,
// and override some of the optional ones if needed (but not the template method itself).

// Let’s see how this will play out in our data mining app.
// We can create a base class for all three parsing algorithms.
// This class defines a template method consisting of a series of calls to various document-processing steps.
class TemplateMethodExample extends StatelessWidget {
  const TemplateMethodExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Template Method Design Pattern')),
      body: const SafeArea(
        child: ScrollConfiguration(
          behavior: ScrollBehavior(),
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: LayoutConstants.paddingL,
              vertical: LayoutConstants.paddingL,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                StudentsSection(
                  bmiCalculator: StudentsXmlBmiCalculator(),
                  headerText: 'Students from XML data source:',
                ),
                SizedBox(height: LayoutConstants.spaceL),
                StudentsSection(
                  bmiCalculator: StudentsJsonBmiCalculator(),
                  headerText: 'Students from JSON data source:',
                ),
                SizedBox(height: LayoutConstants.spaceL),
                StudentsSection(
                  bmiCalculator: TeenageStudentsJsonBmiCalculator(),
                  headerText:
                      'Students from JSON data source (teenagers only):',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LayoutConstants {
  static const double paddingL = 8;
  static const double spaceL = 20;
}
//  Pros and Cons

//  1. You can let clients override only certain parts of a large algorithm, 
//     making them less affected by changes that happen to other parts of the algorithm.
//  2. You can pull the duplicate code into a superclass.

// Cons
//  1. Some clients may be limited by the provided skeleton of an algorithm.
//  2. You might violate the Liskov Substitution Principle by suppressing a default step implementation via a subclass.
//  3. Template methods tend to be harder to maintain the more steps they have.