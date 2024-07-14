-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2023 at 03:56 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `clipboard`
--

-- --------------------------------------------------------

--
-- Table structure for table `clip_info`
--

CREATE TABLE `clip_info` (
  `sr_no` int(6) NOT NULL,
  `clip_text` text NOT NULL,
  `clip_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `clip_info`
--

INSERT INTO `clip_info` (`sr_no`, `clip_text`, `clip_date`) VALUES
(13, 'aaa', '2023-12-12 14:04:05'),
(17, '\r\na\r\n a\r\n  a\r\n   a\r\n     \r\n      \r\n \r\n \r\n \r\na', '2023-12-12 16:30:38'),
(18, '\r\na\r\n a\r\n  a\r\n   a\r\n     \r\n \r\n \r\n\r\na', '2023-12-12 16:31:52'),
(19, 'def removeDuplicate(d):\n    lst=[]\n    for i in d:\n        if i not in lst:\n            lst.append(i)\n    return lst\n\n#<---------------------------------------------------------------------------------------->\n\n# Function for finding intersection between two sets (A&B)\n\ndef intersection(lst1,lst2):\n    lst3=[]\n    for val in lst1:\n        if val in lst2:\n            lst3.append(val)\n    return lst3\n\n#<------------------------------------------------------------------------------------------>\n\n# Function for finding union of two sets (A|B)\n\ndef union(lst1,lst2):\n    lst3=lst1.copy()\n    for val in lst2:\n        if val not in lst3:\n            lst3.append(val)\n    return lst3\n\n#<------------------------------------------------------------------------------------------->\n\n# Function for finding difference between two sets (A-B)\n\ndef diff(lst1,lst2):\n    lst3=[]\n    for val in lst1:\n        if val not in lst2:\n            lst3.append(val)\n    return lst3\n\n#<---------------------------------------------------------------------------------------------->\n\n# Function for finding symmetric difference of two sets (A^B)\n\ndef sym_diff(lst1,lst2):\n    lst3=[]\n    D1=diff(lst1,lst2)\n    print(\"Difference between Cricket and Badminton (C-B) is : \", D1)\n    D2=diff(lst2,lst1)\n    print(\"Difference between Badminton and Cricket (B-C) is : \", D2)\n    lst3=union(D1,D2)\n    return lst3\n\n#<------------------------------------------------------------------------------------------------>\n\n# Functon for finding List of students who play both cricket and badminton\n\ndef CB(lst1,lst2):\n    lst3=intersection(lst1,lst2)\n    print(\"\n\nList of students who play both cricket and badminton is : \", lst3)\n    return len(lst3)\n\n#<------------------------------------------------------------------------------------------------>\n\n# Function for finding List of students who play either cricket or badminton but not both\n\ndef eCeB(lst1,lst2):\n    lst3=sym_diff(lst1,lst2)\n    print(\"\nList of students who play either cricket or badminton but not both is : \",lst3)\n    return len(lst3)\n\n#<-------------------------------------------------------------------------------------------------->\n\n# Function for finding Number of students who play neither cricket nor badminton\n\ndef nCnB(lst1,lst2,lst3):\n    lst4=diff(lst1,union(lst2,lst3))\n    print(\"\n\nList of students who play neither cricket nor badminton is : \",lst4)\n    return len(lst4)\n\n#<--------------------------------------------------------------------------------------------------->\n\n# Function for finding Number of students who play cricket and football but not badminton\n\ndef CBnF(lst1,lst2,lst3):\n    lst4=diff(intersection(lst1,lst2),lst3)\n    print(\"\n\nList of students who play cricket and football but not badminton is : \",lst4)\n    return len(lst4)\n\n#<----------------------------------------------------------------------------------------------------->\n\n# Main function\n\n# Creating an empty list for SE COMP\nSEComp = []\nn = int(input(\"\nEnter number of students in SE COMP: \"))\nprint(\"Enter the names of\",n,\"students (Please press ENTER after entering each students name) :\")\nfor i in range(0, n):\n    ele = input()\n    SEComp.append(ele)  # adding the element\nprint(\"Original list of students in SEComp : \" + str(SEComp))\n\n#<------------------------------------------------------------------------------------------------------->\n\n\n# Creating an empty list for Cricket\nCricket = []\nn = int(input(\"\n\nEnter number of students who play cricket : \"))\nprint(\"Enter the names of\",n,\"students who play cricket (Please press ENTER after entering each students name) :\")\nfor i in range(0, n):\n    ele = input()\n    Cricket.append(ele)  # adding the element\nprint(\"Original list of students playing cricket is :\" +str(Cricket))\nCricket=removeDuplicate(Cricket)\nprint(\"The list of students playing cricket after removing duplicates : \" +str(Cricket))\n\n#<------------------------------------------------------------------------------------------------------->\n\n\n# Creating an empty list for Football\nFootball = []\nn = int(input(\"\n\nEnter number of students who play football : \"))\nprint(\"Enter the name of\",n,\"students who play football (Please press ENTER after entering each students name) :\")\nfor i in range(0, n):\n    ele = input()\n    Football.append(ele)  # adding the element\nprint(\"Original list of students playing football :\" +str(Football))\nFootball=removeDuplicate(Football)\nprint(\"The list of students playing football after removing duplicates : \" +str(Football))\n\n#<-------------------------------------------------------------------------------------------------------->\n\n\n# Creating an empty list for Badminton\nBadminton = []\nn = int(input(\"\n\nEnter number of students who play badminton : \"))\nprint(\"Enter the name of\",n,\"students who play badminton (Please press ENTER after entering each students name) :\")\nfor i in range(0, n):\n    ele = input()\n    Badminton.append(ele)  # adding the element\nprint(\"Original list of students playing badminton :\" +str(Badminton))\nBadminton=removeDuplicate(Badminton)\nprint(\"The list of students playing badminton after removing duplicates : \" +str(Badminton))\n\n#<---------------------------------------------------------------------------------------------------------->\n\nflag=1\nwhile flag==1:\n    print(\"\n\n--------------------MENU--------------------\n\")\n    print(\"1. List of students who play both cricket and badminton\")\n    print(\"2. List of students who play either cricket or badminton but not both\")\n    print(\"3. List of students who play neither cricket nor badminton\")\n    print(\"4. Number of students who play cricket and football but not badminton\")\n    print(\"5. Exit\n\")\n    ch=int(input(\"Enter your Choice (from 1 to 5) :\"))\n\n    if ch==1:\n        print(\"Number of students who play both cricket and badminton : \", CB(Cricket,Badminton))\n        a = input(\"\n\nDo you want to continue (yes/no) :\")\n        if a == \"yes\":\n            flag = 1\n        else:\n            flag = 0\n            print(\"Thanks for using this program!\")\n\n    elif ch==2:\n        print(\"Number of students who play either cricket or badminton but not both : \", eCeB(Cricket, Badminton))\n        a = input(\"\n\nDo you want to continue (yes/no) :\")\n        if a == \"yes\":\n            flag = 1\n        else:\n            flag = 0\n            print(\"Thanks for using this program!\")\n\n    elif ch==3:\n        print(\"Number of students who play neither cricket nor badminton : \", nCnB(SEComp,Cricket,Badminton))\n        a = input(\"\n\nDo you want to continue (yes/no) :\")\n        if a == \"yes\":\n            flag = 1\n        else:\n            flag = 0\n            print(\"Thanks for using this program!\")\n\n    elif ch==4:\n        print(\"Number of students who play cricket and football but not badminton : \", CBnF(Cricket,Football,Badminton))\n        a = input(\"\n\nDo you want to continue (yes/no) :\")\n        if a == \"yes\":\n            flag = 1\n        else:\n            flag = 0\n            print(\"Thanks for using this program!\")\n\n    elif ch==5:\n        flag=0\n        print(\"Thanks for using this program!\")\n\n    else:\n        print(\"!!Wrong Choice!! \")\n        a=input(\"\n\nDo you want to continue (yes/no) :\")\n        if a==\"yes\":\n            flag=1\n        else:\n            flag=0\n            print(\"Thanks for using this program!\")', '2023-12-12 17:22:47'),
(22, 'dsd', '2023-12-16 18:19:22'),
(23, 'dsfffdgdfg', '2023-12-16 18:19:28'),
(24, 'fghgfhfghngh  hghgh', '2023-12-16 18:19:35');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clip_info`
--
ALTER TABLE `clip_info`
  ADD PRIMARY KEY (`sr_no`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clip_info`
--
ALTER TABLE `clip_info`
  MODIFY `sr_no` int(6) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
