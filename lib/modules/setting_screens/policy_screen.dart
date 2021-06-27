import 'package:flutter/material.dart';
import '../../components/colors.dart';
import '../../components/components.dart';

class PolicyScreen extends StatelessWidget {
  const PolicyScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(title: 'Privacy Policy'),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Our Policies',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                  color: secondColor,
                ),
              ),
              Text(
                'Smart Eye has adopted this privacy policy (“Privacy Policy”) to explain how Smart Eye collects, stores, and uses the information collected in connection with Smart Eye’s Services.',
                style: TextStyle(
                  color: Colors.black87,
                  fontSize: 18,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                'BY INSTALLING, USING, REGISTERING TO OR OTHERWISE ACCESSING THE SERVICES, YOU AGREE TO THIS PRIVACY POLICY AND GIVE AN EXPLICIT AND INFORMED CONSENT TO THE PROCESSING OF YOUR PERSONAL DATA IN ACCORDANCE WITH THIS PRIVACY POLICY.'
                '\nIF YOU DO NOT AGREE TO THIS PRIVACY POLICY, PLEASE DO NOT INSTALL, USE, REGISTER TO OR OTHERWISE ACCESS THE SERVICES.'
                '\nSmart Eye reserves the right to modify this Privacy Policy at reasonable times, so please review it frequently.'
                '\nIf Smart Eye makes material or significant changes to this Privacy Policy, Smart Eye may post a notice on Smart Eye website along with the updated Privacy Policy.'
                '\nYour continued use of Services will signify your acceptance of the changes to this Privacy Policy.'
                '\nNon-personal data For purposes of this Privacy Policy, “non-personal data” means information that does not directly identify you.'
                '\nThe types of non-personal data Smart Eye may collect and use include, but are not limited to: application properties, including, but not limited to application name, package name and icon installed on your device. Your check in (include like, recommendation) of all Smart Eye users.'
                '\nSmart Eye may use and disclose to Smart Eye’s partners and contractors the collected non-personal data for purposes of analyzing usage of the Services, advertisement serving, managing and providing the Services and to further develop the Services and other Smart Eye services and products.'
                '\nYou recognize and agree that the analytics companies utilized by Smart Eye may combine the information collected with other information they have independently collected from other services or products relating to your activities. These companies collect and use information under their own privacy policies.'
                '\nPersonal Data For purposes of this Privacy Policy, “personal data” means personally identifiable information that specifically identifies you as an individual. Personal information collected by Smart Eye is information voluntarily provided to us by you when you create your account or change your account information.'
                '\nThe information includes your id, name, email,and location . Smart Eye also stores your recommendations and messages. Smart Eye may use collected personal data for purposes of analyzing usage of the Services, providing customer and technical support, managing and providing Services (including managing advertisement serving) and to further develop the Services and other Smart Eye services and products.'
                '\nSmart Eye may combine non-personal data with personal data. Please note that certain features of the Services may be able to connect to your social networking sites to obtain additional information about you. In such cases, Smart Eye may be able to collect certain information from your social networking profile when your social networking site permits it, and when you consent to allow your social networking site to make that information available to Smart Eye.'
                '\nThis information may include, but is not limited to, your name, profile picture, gender, user ID, email address, your country, your language, your time zone, the organizations and links on your profile page, the names and profile pictures of your social networking site “friends” and other information you have included in your social networking site profile. Smart Eye may associate and/or combine as well as use information collected by Smart Eye and/or obtained through such social networking sites in accordance with this Privacy Policy.'
                '\nDisclosure and Transfer of Personal Data Smart Eye collects and processes personal data on a voluntary basis and it is not in the business of selling your personal data to third parties. Personal data may, however, occasionally be disclosed in accordance with applicable legislation and this Privacy Policy. Additionally, Smart Eye may disclose personal data to its parent companies and its subsidiaries in accordance with this Privacy Policy.'
                '\nSmart Eye may hire agents and contractors to collect and process personal data on Smart Eye’s behalf and in such cases such agents and contractors will be instructed to comply with our Privacy Policy and to use personal data only for the purposes for which the third party has been engaged by Smart Eye. These agents and contractors may not use your personal data for their own marketing purposes. Smart Eye may use third party service providers such as credit card processors, e-mail service providers, shipping agents, data analyzers and business intelligence providers.'
                '\nSmart Eye has the right to share your personal data as necessary for the aforementioned third parties to provide their services for Smart Eye. Smart Eye is not liable for the acts and omissions of these third parties, except as provided by mandatory law. Smart Eye may disclose your personal data to third parties as required by law enforcement or other government officials in connection with an investigation of fraud, intellectual property infringements, or other activity that is illegal or may expose you or Smart Eye to legal liability. Smart Eye may also disclose your personal data to third parties when Smart Eye has a reason to believe that a disclosure is necessary to address potential or actual injury or interference with Smart Eye’s rights, property, operations, users or others who may be harmed or may suffer loss or damage, or Smart Eye believes that such disclosure is necessary to protect Smart Eye ’s rights, combat fraud and/or comply with a judicial proceeding, court order, or legal process served on Smart Eye.'
                '\nTo the extent permitted by applicable law, Smart Eye will make reasonable efforts to notify you of such disclosure through Smart Eye’s website or in another reasonable manner. Safeguards Smart Eye follows generally accepted industry standards and maintains reasonable safeguards to attempt to ensure the security, integrity and privacy of the information in Smart Eye’s possession. Only those persons with a need to process your personal data in connection with the fulfillment of their tasks in accordance with the purposes of this Privacy Policy and for the purposes of performing technical maintenance, have access to your personal data in Smart Eye’s possession. Personal data collected by Smart Eye is stored in secure operating environments that are not available to the public.'
                '\nTo prevent unauthorized on-line access to personal data, Smart Eye maintains personal data behind a firewall-protected server. However, no system can be 100% secure and there is the possibility that despite Smart Eye’s reasonable efforts, there could be unauthorized access to your personal data. By using the Services, you assume this risk. Other Please be aware of the open nature of certain social networking and other open features of the Services Smart Eye may make available to you. You may choose to disclose data about yourself in the course of contributing user generated content to the Services. Any data that you disclose in any of these forums, blogs, chats or the like is public information, and there is no expectation of privacy or confidentiality.'
                '\nSmart Eye is not responsible for any personal data you choose to make public in any of these forums.'
                '\nIf you are under 18 years of age or a minor in your country of residence, please ask your legal guardian’s permission to use or access the Services. Smart Eye takes children’s privacy seriously, and encourages parents and/or guardians to play an active role in their children\'s online experience at all times.'
                '\nSmart Eye does not knowingly collect any personal information from children below the aforementioned age and if Smart Eye learns that Smart Eye has inadvertently gathered personal data from children under the aforementioned age, Smart Eye will take reasonable measures to promptly erase such personal data from Smart Eye’s records. Smart Eye may store and/or transfer your personal data to its affiliates and partners in and outside of EU/EEA member states and the United States in accordance with mandatory legislation and this Privacy Policy. Smart Eye may disclose your personal data to third parties in connection with a corporate merger, consolidation, restructuring, the sale of substantially all of Smart Eye’s stock and/or assets or other corporate change, including, without limitation, during the course of any due diligence process provided, however, that this Privacy Policy shall continue to govern such personal data. Smart Eye regularly reviews its compliance with this Privacy Policy. If Smart Eye receives a formal written complaint from you, it is Smart Eye’s policy to attempt to contact you directly to address any of your concerns. Smart Eye will cooperate with the appropriate governmental authorities, including data protection authorities, to resolve any complaints regarding the collection, use, transfer or disclosure of personal data that cannot be amicably resolved between you and Smart Eye.',
                textAlign: TextAlign.start,
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
