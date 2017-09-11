function getNumberResults(style, feature) {
     var result;
 
     if (style == null) {
       switch (feature) {
         case null:
           result = "227 Match";
           break;
         case "quiet":
           result = "86 Match";
           break;
         case "powerful":
           result = "89 Match";
           break;
         case "remote":
           result = "7 Match";
           break;
         default:
           result = "227 Match";
       }
     }
     if (style == "rabbit") {
       switch (feature) {
         case null:
           result = "55 Match";
           break;
         case "quiet":
           result = "20 Match";
           break;
         case "powerful":
           result = "26 Match";
           break;
         case "remote":
           result = "1 Match";
           break;
         default:
           result = "55 Match";
       }
     }
     if (style == "bullet") {
       switch (feature) {
         case null:
           result = "71 Match";
           break;
         case "quiet":
           result = "27 Match";
           break;
         case "powerful":
           result = "38 Match";
           break;
         case "remote":
           result = "5 Match";
           break;
         default:
           result = "71 Match";
       }
     }
     if (style == "classic") {
       switch (feature) {
         case null:
           result = "34 Match";
           break;
         case "quiet":
           result = "15 Match";
           break;
         case "powerful":
           result = "18 Match";
           break;
         case "remote":
           result = "0 Match";
           break;
         default:
           result = "34 Match";
       }
     }
     if (style == "realistic") {
       switch (feature) {
         case null:
           result = "69 Match";
           break;
         case "quiet":
           result = "24 Match";
           break;
         case "powerful":
           result = "7 Match";
           break;
         case "remote":
           result = "7 Match";
           break;
         default:
           result = "69 Match";
       }
     }
     return result;
   }