# TechCo Services - Account & Opportunity Interface

## 📌 Project Overview
This project was built for **TechCo Services** to provide account managers a clean, user-friendly interface for viewing **Accounts** and **Opportunities**.  
The solution combines **Visualforce** for tabular account data and a **Lightning Web Component (LWC)** for a graphical summary of opportunities by stage.  

---

## 🚀 How to Access
- **Visualforce Page**: https://resourceful-fox-63tu19-dev-ed.trailblaze.my.salesforce-sites.com/
- **Opportunity Chart**: 

---

## ⚙️ Features Implemented
1. **Visualforce Page (`AccountListVF`)**
   - Displays Accounts with:
     - Account Name (clickable link)
     - Industry (shows "—" if blank)
     - Number of Opportunities  

2. **Lightning Web Component (`oppStageChart`)**
   - Displays a **bar chart** of Opportunities grouped by Stage.  
   - Uses **CSS-based bars** for simplicity and responsiveness.  

3. **Integration**
   - LWC can be embedded into a **Lightning Page** via App Builder for easy access.  

4. **Testing**
   - Verified with multiple user profiles to ensure correct data visibility.  

5. **Styling**
   - Clean layout with custom CSS: headers, spacing, colors, hover effects.  

---

## 📸 Screenshots
1. Account List Visualforce Page:
   <img width="1358" height="680" alt="Screenshot 2025-10-03 094546" src="https://github.com/user-attachments/assets/7aa1ba05-2099-479f-941f-8820bc66adc5" />

2. Opportunity Stage Chart (LWC):
   <img width="1348" height="675" alt="Screenshot 2025-10-03 094859" src="https://github.com/user-attachments/assets/c93843e3-0b14-4e53-9a49-1f23e77bc89c" />

3. Lightning Page with Embedded LWC:
   <img width="1330" height="613" alt="Screenshot 2025-10-03 094636" src="https://github.com/user-attachments/assets/50729587-489e-4f1c-ba13-0afa7d4e729c" />

---

## 🚀 How to Use
1. Deploy the following from this repository to your Salesforce org:
   - Apex classes:
     - `AccountListController`
     - `OpportunityStageController`
   - Visualforce page: `AccountListVF`
   - LWC: `oppStageChart`
2. Add `oppStageChart` to a **Lightning Page** via App Builder.  
3. Open the Visualforce page at `/apex/AccountListVF` to view Accounts.  
4. Access the Lightning page to view the Opportunities chart.  

---

## 🛠️ Technologies Used
- Salesforce **Visualforce**
- Salesforce **Apex**
- Salesforce **Lightning Web Components (LWC)**
- HTML, CSS for layout and styling
