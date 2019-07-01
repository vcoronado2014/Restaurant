USE [master]
GO

/****** Object:  Database [Savina_db_eng]    Script Date: 28-08-2018 16:49:13 ******/
CREATE DATABASE [Savina_db_eng]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Savina_db_eng', FILENAME = N'D:\DATA\Savina_db_eng.mdf' , SIZE = 73728KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Savina_db_eng_log', FILENAME = N'D:\LOG\Savina_db_eng_log.ldf' , SIZE = 139264KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO

ALTER DATABASE [Savina_db_eng] SET COMPATIBILITY_LEVEL = 130
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Savina_db_eng].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Savina_db_eng] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Savina_db_eng] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Savina_db_eng] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Savina_db_eng] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Savina_db_eng] SET ARITHABORT OFF 
GO

ALTER DATABASE [Savina_db_eng] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Savina_db_eng] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Savina_db_eng] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Savina_db_eng] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Savina_db_eng] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Savina_db_eng] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Savina_db_eng] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Savina_db_eng] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Savina_db_eng] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Savina_db_eng] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Savina_db_eng] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Savina_db_eng] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Savina_db_eng] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Savina_db_eng] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Savina_db_eng] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Savina_db_eng] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Savina_db_eng] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Savina_db_eng] SET RECOVERY FULL 
GO

ALTER DATABASE [Savina_db_eng] SET  MULTI_USER 
GO

ALTER DATABASE [Savina_db_eng] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Savina_db_eng] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Savina_db_eng] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Savina_db_eng] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO

ALTER DATABASE [Savina_db_eng] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Savina_db_eng] SET QUERY_STORE = OFF
GO

USE [Savina_db_eng]
GO

ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO

ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO

ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO

ALTER DATABASE [Savina_db_eng] SET  READ_WRITE 
GO

USE [Savina_db_eng]
GO

/****** Object:  Table [dbo].[agreement_workplaces__workplace_agreements]    Script Date: 28-08-2018 16:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreement_workplaces__workplace_agreements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agreement_workplaces] [int] NULL,
	[workplace_agreements] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agreements]    Script Date: 28-08-2018 16:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreements](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[quota] [int] NULL,
	[deletedAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[specialtyId] [int] NULL,
	[creatorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[agreementWorkplaces]    Script Date: 28-08-2018 16:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[agreementWorkplaces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[agreementId] [int] NULL,
	[workplaceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[checkupModes]    Script Date: 28-08-2018 16:51:03 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[checkupModes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[file_request_attachment__request_attachment_files]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[file_request_attachment__request_attachment_files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[file_request_attachment] [int] NULL,
	[request_attachment_files] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[fileRequestAttachments]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[fileRequestAttachments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[fileId] [int] NULL,
	[requestAttachmentId] [int] NULL,
	[icdId] [int] NULL,
	[requestId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[files]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[files](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[mimetype] [nvarchar](255) NOT NULL,
	[filename] [nvarchar](max) NOT NULL,
	[filesize] [int] NOT NULL,
	[path] [nvarchar](255) NOT NULL,
	[md5] [nvarchar](255) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[genders]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[genders](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
	[value] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[icd_request_answer_diagnosis_icds__request_answer_diagnosis_icds]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icd_request_answer_diagnosis_icds__request_answer_diagnosis_icds](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[icd_request_answer_diagnosis_icds] [int] NULL,
	[request_answer_diagnosis_icds] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[icd_request_icds__request_icds]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icd_request_icds__request_icds](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[icd_request_icds] [int] NULL,
	[request_icds] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[icdRequestAnswerDiagnoses]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icdRequestAnswerDiagnoses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[icdId] [int] NULL,
	[requestAnswerDiagnosisId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[icdRequests]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icdRequests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[icdId] [int] NULL,
	[requestId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[icds]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[icds](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[code] [nvarchar](255) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[links]    Script Date: 28-08-2018 16:51:04 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[links](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hash] [nvarchar](255) NOT NULL,
	[url] [nvarchar](max) NOT NULL,
	[expiresAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[requestId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[sender_user] [int] NULL,
	[sender_workplace] [int] NULL,
	[request] [int] NULL,
	[type] [nvarchar](max) NULL,
	[body] [nvarchar](max) NULL,
	[sentAt] [datetime2](7) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[motives]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[motives](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[notifications]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[notifications](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[foreignKey] [int] NOT NULL,
	[action] [nvarchar](255) NOT NULL,
	[model] [nvarchar](255) NOT NULL,
	[seenAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[senderId] [int] NULL,
	[receiverId] [int] NULL,
	[workplaceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[patients]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[patients](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[firstname] [nvarchar](max) NOT NULL,
	[lastname] [nvarchar](max) NOT NULL,
	[run] [nvarchar](255) NOT NULL,
	[birth] [datetime2](7) NOT NULL,
	[city] [nvarchar](max) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[genderId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[preferences]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[preferences](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[emailRequestAttached] [bit] NULL,
	[emailRequestAnswered] [bit] NULL,
	[emailRequestReturned] [bit] NULL,
	[emailRequestMessaged] [bit] NULL,
	[emailRequestClosed] [bit] NULL,
	[emailRequestTaken] [bit] NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[userId] [int] NULL,
	[emailRequestCreated] [bit] NULL,
	[soundNotifications] [bit] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[priorities]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[priorities](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request_answer_diagnoses]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request_answer_diagnoses](
	[request_answer] [int] NULL,
	[evaluation] [varchar](max) NULL,
	[confirmed] [bit] NULL,
	[description] [nvarchar](max) NULL,
	[therapeutic_plan] [varchar](max) NULL,
	[checkup_date] [datetime2](7) NULL,
	[checkup_exams_required] [bit] NULL,
	[checkup_same_specialist] [bit] NULL,
	[checkup_comment] [varchar](max) NULL,
	[checkup_mode] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request_answer_diagnosis_exams]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request_answer_diagnosis_exams](
	[name] [nvarchar](max) NULL,
	[same_place] [bit] NULL,
	[request_answer_diagnosis] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request_answers]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request_answers](
	[creator_user] [int] NULL,
	[creator_workplace] [int] NULL,
	[request] [int] NULL,
	[diagnosis] [int] NULL,
	[comment] [varchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[seenAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request_attachments]    Script Date: 28-08-2018 16:51:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request_attachments](
	[creator_user] [int] NULL,
	[creator_workplace] [int] NULL,
	[request] [int] NULL,
	[name] [nvarchar](max) NULL,
	[description] [varchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
	[seenAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[request_messages]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[request_messages](
	[sender_user] [int] NULL,
	[sender_workplace] [int] NULL,
	[request] [int] NULL,
	[type] [nvarchar](max) NULL,
	[body] [nvarchar](max) NULL,
	[sentAt] [datetime2](7) NULL,
	[receivedAt] [datetime2](7) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
	[createdAt] [datetime2](7) NULL,
	[updatedAt] [datetime2](7) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestAnswerDiagnoses]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestAnswerDiagnoses](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[evaluation] [nvarchar](max) NOT NULL,
	[confirmed] [bit] NULL,
	[description] [nvarchar](max) NOT NULL,
	[therapeuticPlan] [nvarchar](max) NULL,
	[checkupDate] [datetime2](7) NULL,
	[checkupExamsRequired] [bit] NULL,
	[checkupSameSpecialist] [bit] NULL,
	[checkupComment] [nvarchar](max) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[requestAnswerId] [int] NULL,
	[checkupModeId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestAnswerDiagnosisExams]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestAnswerDiagnosisExams](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[samePlace] [bit] NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[requestAnswerDiagnosisId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestAnswers]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestAnswers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[comment] [nvarchar](max) NULL,
	[seenAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[requestId] [int] NULL,
	[workplaceId] [int] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestAttachments]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestAttachments](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[description] [nvarchar](max) NOT NULL,
	[seenAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[workplaceId] [int] NULL,
	[requestId] [int] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestMessages]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestMessages](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](255) NULL,
	[body] [nvarchar](max) NULL,
	[sentAt] [datetime2](7) NOT NULL,
	[receivedAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[workplaceId] [int] NULL,
	[requestId] [int] NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requests]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requests](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[hypothesis] [nvarchar](max) NOT NULL,
	[comment] [nvarchar](max) NULL,
	[closedAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[specialtyId] [int] NULL,
	[priorityId] [int] NULL,
	[patientId] [int] NULL,
	[motiveId] [int] NULL,
	[requestTypeId] [int] NULL,
	[creatorUserId] [int] NULL,
	[creatorWorkplaceId] [int] NULL,
	[specialistUserId] [int] NULL,
	[specialistWorkplaceId] [int] NULL,
	[rayenSicId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[requestTypes]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[requestTypes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[roles]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[roles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SequelizeMeta]    Script Date: 28-08-2018 16:51:06 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SequelizeMeta](
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[specialties]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[specialties](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slug] [nvarchar](255) NOT NULL,
	[name] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_checkups]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_checkups](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_genders]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_genders](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[value] [int] NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_motives]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_motives](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_priorities]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_priorities](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_request_types]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_request_types](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_roles]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_roles](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[static_specialties]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[static_specialties](
	[slug] [nvarchar](255) NULL,
	[name] [nvarchar](max) NULL,
	[id] [int] IDENTITY(1,1) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tokens]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tokens](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[secret] [nvarchar](255) NOT NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[userId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[user_workplaces__workplace_users]    Script Date: 28-08-2018 16:51:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[user_workplaces__workplace_users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[user_workplaces] [int] NULL,
	[workplace_users] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[users]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[users](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[email] [nvarchar](255) NOT NULL,
	[password] [nvarchar](max) NOT NULL,
	[deletedAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[specialtyId] [int] NULL,
	[roleId] [int] NULL,
	[creatorId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[userWorkplaces]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[userWorkplaces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[userId] [int] NULL,
	[workplaceId] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[workplaces]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[workplaces](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](max) NOT NULL,
	[private] [bit] NOT NULL,
	[deletedAt] [datetime2](7) NULL,
	[createdAt] [datetime2](7) NOT NULL,
	[updatedAt] [datetime2](7) NOT NULL,
	[creatorId] [int] NULL,
	[deis] [nvarchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[agreement_workplaces__workplace_agreements] ON 
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (1, 1, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (2, 1, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (3, 2, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (4, 2, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (5, 3, 3)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (6, 3, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (7, 4, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (8, 4, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (9, 5, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (10, 5, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (11, 6, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (12, 6, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (13, 7, 3)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (14, 7, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (15, 8, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (16, 8, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (17, 9, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (18, 9, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (19, 10, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (20, 10, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (21, 11, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (22, 11, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (23, 12, 3)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (24, 12, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (25, 13, 5)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (26, 13, 6)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (27, 14, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (28, 14, 7)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (29, 15, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (30, 15, 7)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (31, 16, 3)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (32, 16, 7)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (33, 17, 5)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (34, 17, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (36, 18, 8)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (37, 18, 9)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (38, 19, 10)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (39, 19, 11)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (40, 20, 12)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (41, 20, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (42, 21, 12)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (43, 21, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (44, 22, 12)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (45, 22, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (46, 23, 12)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (47, 23, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (48, 24, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (49, 24, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (50, 25, 3)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (51, 25, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (52, 26, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (53, 26, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (54, 27, 12)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (55, 27, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (56, 28, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (57, 28, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (58, 29, 3)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (59, 29, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (60, 30, 2)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (61, 30, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (62, 31, 12)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (63, 31, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (64, 32, 5)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (65, 32, 6)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (66, 33, 13)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (67, 33, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (68, 34, 13)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (69, 34, 4)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (70, 35, 5)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (71, 35, 6)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (72, 36, 5)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (73, 36, 6)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (74, 37, 1)
GO
INSERT [dbo].[agreement_workplaces__workplace_agreements] ([id], [agreement_workplaces], [workplace_agreements]) VALUES (75, 37, 4)
GO
SET IDENTITY_INSERT [dbo].[agreement_workplaces__workplace_agreements] OFF
GO
SET IDENTITY_INSERT [dbo].[agreements] ON 
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (1, N'urology Hospital Illapel', 10, NULL, CAST(N'2015-09-15T01:18:27.3710000' AS DateTime2), CAST(N'2018-08-27T21:15:49.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (2, N'Urología Hospital Los Vilos', 10, NULL, CAST(N'2015-09-15T01:19:05.3090000' AS DateTime2), CAST(N'2015-10-19T21:50:41.3560000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (3, N'Urología Hospital Salamanca', 10000, NULL, CAST(N'2015-09-15T01:22:11.4180000' AS DateTime2), CAST(N'2015-10-20T21:02:14.4630000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (4, N'Nefrologia Illapel 26_09_2015', 1000, CAST(N'2016-12-06T19:56:13.0210000' AS DateTime2), CAST(N'2015-09-26T12:39:54.6510000' AS DateTime2), CAST(N'2016-12-06T19:56:13.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (5, N'Nefrologia Hospital de Illapel', 1000, CAST(N'2016-12-06T19:56:26.2860000' AS DateTime2), CAST(N'2015-09-28T15:48:45.5800000' AS DateTime2), CAST(N'2016-12-06T19:56:26.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (6, N'Nefrologia Hospital de Los Vilos', 1000, CAST(N'2016-12-06T19:56:34.2080000' AS DateTime2), CAST(N'2015-09-28T15:49:25.1990000' AS DateTime2), CAST(N'2016-12-06T19:56:34.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (7, N'Nefrologia Hospital de Salamanca', 1000, CAST(N'2016-12-06T19:56:41.4900000' AS DateTime2), CAST(N'2015-09-28T15:50:15.1100000' AS DateTime2), CAST(N'2016-12-06T19:56:41.0000000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (8, N'Neurología Infantil Hospital de Illapel', 1000, CAST(N'2016-12-06T19:57:10.9580000' AS DateTime2), CAST(N'2015-09-28T15:51:49.9960000' AS DateTime2), CAST(N'2016-12-06T19:57:10.0000000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (9, N'Neurología Infantil Hospital de Los Vilos', 1000, CAST(N'2016-12-06T19:57:26.3490000' AS DateTime2), CAST(N'2015-09-28T15:52:49.9180000' AS DateTime2), CAST(N'2016-12-06T19:57:26.0000000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (10, N'Neurocirugía Hospital de Illapel', 1000, CAST(N'2016-12-06T19:57:43.8180000' AS DateTime2), CAST(N'2015-09-28T15:55:21.6210000' AS DateTime2), CAST(N'2016-12-06T19:57:43.0000000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (11, N'Neurocirugía Hospital de Los Vilos', 1000, CAST(N'2016-12-06T19:58:11.0990000' AS DateTime2), CAST(N'2015-09-28T15:56:00.7780000' AS DateTime2), CAST(N'2016-12-06T19:58:11.0000000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (12, N'Neurocirugía Hospital de Salamanca', 1000, NULL, CAST(N'2015-09-28T15:57:04.6050000' AS DateTime2), CAST(N'2015-09-28T15:57:04.6520000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (13, N'PRUEBA DE UROLOGIA', 1000, NULL, CAST(N'2015-09-30T17:39:06.2050000' AS DateTime2), CAST(N'2015-09-30T17:39:06.2360000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (17, N'urologia de prueba para centro 1', 1000, CAST(N'2016-04-05T14:16:21.8860000' AS DateTime2), CAST(N'2015-10-22T03:15:23.3090000' AS DateTime2), CAST(N'2016-04-05T14:16:21.8860000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (18, N'Farmacias MED Consultas Piloto', 1000, NULL, CAST(N'2015-10-26T15:04:58.3240000' AS DateTime2), CAST(N'2015-10-27T00:07:46.3720000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (19, N'Convenio Neurología', 1000, NULL, CAST(N'2015-11-06T13:37:19.4480000' AS DateTime2), CAST(N'2015-11-06T13:37:19.4950000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (20, N'Urología para Hospital de Combarbalá', 1000, NULL, CAST(N'2015-11-09T16:07:55.9700000' AS DateTime2), CAST(N'2015-11-09T16:07:56.1700000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (21, N'Neurologia Infantil para  Hospital de Combarbalá', 1000, NULL, CAST(N'2015-11-09T16:10:16.9600000' AS DateTime2), CAST(N'2015-11-09T16:10:16.1270000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (22, N'Neurocirugía para  Hospital de Combarbalá', 1000, NULL, CAST(N'2015-11-09T16:11:51.5330000' AS DateTime2), CAST(N'2015-11-09T16:11:51.5640000' AS DateTime2), 4, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (23, N'Nefrología para  Hospital de Combarbalá', 1000, NULL, CAST(N'2015-11-09T16:13:08.4090000' AS DateTime2), CAST(N'2015-11-09T16:13:08.4400000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (24, N'Neurología Adulto para Hospital de Illapel', 1000, CAST(N'2016-12-06T19:58:37.3340000' AS DateTime2), CAST(N'2015-11-18T15:53:30.7670000' AS DateTime2), CAST(N'2016-12-06T19:58:37.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (25, N'Neurología Adulto para Hospital de Salamanca', 1000, NULL, CAST(N'2015-11-18T15:53:52.7040000' AS DateTime2), CAST(N'2015-11-18T15:53:52.7360000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (26, N'Neurología Adulto para Hospital de Los Vilos', 1000, CAST(N'2016-12-06T20:03:37.2400000' AS DateTime2), CAST(N'2015-11-18T15:54:16.7040000' AS DateTime2), CAST(N'2016-12-06T20:03:37.0000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (27, N'Neurología Adulto para Hospital de Combarbalá', 1000, NULL, CAST(N'2015-11-18T15:54:48.9700000' AS DateTime2), CAST(N'2015-11-18T15:54:49.1000000' AS DateTime2), 2, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (28, N'Traumatología para Hospital de Illapel', 10000, NULL, CAST(N'2015-11-18T16:49:47.2270000' AS DateTime2), CAST(N'2015-11-18T16:49:47.2580000' AS DateTime2), 6, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (29, N'Traumatología para Hospital de Salamanca', 10000, NULL, CAST(N'2015-11-18T16:50:10.5550000' AS DateTime2), CAST(N'2015-11-18T16:50:10.5860000' AS DateTime2), 6, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (30, N'Traumatología para Hospital de Los Vilos', 1000, CAST(N'2016-12-06T20:01:59.3180000' AS DateTime2), CAST(N'2015-11-18T16:50:32.8990000' AS DateTime2), CAST(N'2016-12-06T20:01:59.0000000' AS DateTime2), 6, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (31, N'Traumatología para Hospital de Combarbalá', 10000, NULL, CAST(N'2015-11-18T16:51:08.2270000' AS DateTime2), CAST(N'2015-11-18T16:51:08.2580000' AS DateTime2), 6, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (32, N'Nefrologia España', 100, NULL, CAST(N'2015-12-23T14:03:37.1260000' AS DateTime2), CAST(N'2015-12-23T14:03:37.2510000' AS DateTime2), 8, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (33, N'Urologia para Departamento de Salud Salamanca', 1000, CAST(N'2016-01-06T20:11:02.8410000' AS DateTime2), CAST(N'2016-01-06T20:09:33.2000000' AS DateTime2), CAST(N'2016-01-06T20:11:02.8410000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (34, N'UROLOGIA DEPTO. SALUD SALAMANCA', 10000, NULL, CAST(N'2016-01-06T20:11:33.8100000' AS DateTime2), CAST(N'2016-01-06T20:11:33.8410000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (35, N'Neurología Infantil', 1000, NULL, CAST(N'2016-03-22T21:10:37.8440000' AS DateTime2), CAST(N'2016-03-22T21:10:37.8750000' AS DateTime2), 3, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (36, N'Medicina General', 1000, NULL, CAST(N'2016-03-31T13:31:46.2100000' AS DateTime2), CAST(N'2016-03-31T13:31:46.3040000' AS DateTime2), 13, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (37, N'Broncopulmonar para Hospital de Illapel', 1000, CAST(N'2016-12-06T20:01:22.7710000' AS DateTime2), CAST(N'2016-04-11T20:04:51.6160000' AS DateTime2), CAST(N'2016-12-06T20:01:22.0000000' AS DateTime2), 11, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (38, N'ACHS MEDICINA GENERAL', NULL, NULL, CAST(N'2016-06-10T18:48:01.0000000' AS DateTime2), CAST(N'2016-06-10T18:48:01.0000000' AS DateTime2), 13, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (39, N'CONVENIO QA CARDIO', NULL, NULL, CAST(N'2016-09-13T17:50:41.0000000' AS DateTime2), CAST(N'2016-09-13T17:50:41.0000000' AS DateTime2), 7, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (40, N'Prueba Teleoftalmología', NULL, NULL, CAST(N'2016-12-06T19:11:31.0000000' AS DateTime2), CAST(N'2016-12-06T19:11:31.0000000' AS DateTime2), 15, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (41, N'Teleoftalmología', NULL, NULL, CAST(N'2016-12-06T20:11:55.0000000' AS DateTime2), CAST(N'2016-12-06T20:11:55.0000000' AS DateTime2), 15, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (42, N'Teleoftalmología', NULL, NULL, CAST(N'2016-12-06T20:26:11.0000000' AS DateTime2), CAST(N'2016-12-06T20:26:11.0000000' AS DateTime2), 15, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (43, N'Teleoftalmología', NULL, NULL, CAST(N'2016-12-06T20:26:47.0000000' AS DateTime2), CAST(N'2016-12-06T20:26:47.0000000' AS DateTime2), 15, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (44, N'test', NULL, NULL, CAST(N'2017-01-13T23:32:11.0000000' AS DateTime2), CAST(N'2017-01-13T23:32:11.0000000' AS DateTime2), 1, 1)
GO
INSERT [dbo].[agreements] ([id], [name], [quota], [deletedAt], [createdAt], [updatedAt], [specialtyId], [creatorId]) VALUES (45, N'los vilos espcialista 2', NULL, NULL, CAST(N'2017-09-12T15:44:20.0000000' AS DateTime2), CAST(N'2017-09-12T15:44:20.0000000' AS DateTime2), 15, 1)
GO
SET IDENTITY_INSERT [dbo].[agreements] OFF
GO
SET IDENTITY_INSERT [dbo].[agreementWorkplaces] ON 
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (1, 1, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (2, 1, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (3, 2, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (4, 2, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (5, 3, 3)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (6, 3, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (7, 4, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (8, 4, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (9, 5, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (10, 5, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (11, 6, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (12, 6, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (13, 7, 3)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (14, 7, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (15, 8, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (16, 8, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (17, 9, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (18, 9, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (19, 10, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (20, 10, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (21, 11, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (22, 11, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (23, 12, 3)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (24, 12, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (25, 13, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (26, 13, 6)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (33, 17, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (34, 17, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (36, 18, 8)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (37, 18, 9)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (38, 19, 10)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (39, 19, 11)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (40, 20, 12)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (41, 20, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (42, 21, 12)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (43, 21, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (44, 22, 12)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (45, 22, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (46, 23, 12)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (47, 23, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (48, 24, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (49, 24, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (50, 25, 3)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (51, 25, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (52, 26, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (53, 26, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (54, 27, 12)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (55, 27, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (56, 28, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (57, 28, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (58, 29, 3)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (59, 29, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (60, 30, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (61, 30, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (62, 31, 12)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (63, 31, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (64, 32, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (65, 32, 6)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (66, 33, 13)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (67, 33, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (68, 34, 13)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (69, 34, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (70, 35, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (71, 35, 6)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (72, 36, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (73, 36, 6)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (74, 37, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (75, 37, 4)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (76, 38, 14)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (77, 38, 14)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (78, 39, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (79, 39, 6)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (80, 40, 5)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (82, 40, 7)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (84, 41, 17)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (86, 41, 1)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (87, 42, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (88, 42, 17)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (89, 43, 13)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (90, 43, 17)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (91, 44, 19)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (92, 44, 19)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (93, 45, 2)
GO
INSERT [dbo].[agreementWorkplaces] ([id], [agreementId], [workplaceId]) VALUES (94, 45, 7)
GO
SET IDENTITY_INSERT [dbo].[agreementWorkplaces] OFF
GO
SET IDENTITY_INSERT [dbo].[checkupModes] ON 
GO
INSERT [dbo].[checkupModes] ([id], [slug], [name]) VALUES (1, N'on-line-deferred', N'En línea - Diferido')
GO
INSERT [dbo].[checkupModes] ([id], [slug], [name]) VALUES (2, N'on-line-simultaneous', N'En línea - Simultáneo')
GO
INSERT [dbo].[checkupModes] ([id], [slug], [name]) VALUES (3, N'on-site', N'Presencial')
GO
SET IDENTITY_INSERT [dbo].[checkupModes] OFF
GO
SET IDENTITY_INSERT [dbo].[fileRequestAttachments] ON 
GO
INSERT [dbo].[fileRequestAttachments] ([id], [fileId], [requestAttachmentId], [icdId], [requestId]) VALUES (1, 1, 1, NULL, NULL)
GO
SET IDENTITY_INSERT [dbo].[fileRequestAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[files] ON 
GO
INSERT [dbo].[files] ([id], [mimetype], [filename], [filesize], [path], [md5], [createdAt], [updatedAt]) VALUES (1, N'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet', N'transformaciones_mensajes_no_considerados.xlsx', 21122, N'\requests\2\attachments\48d2d909-db80-402b-9ac4-b54316af620c.xlsx', N'0e0d7941c097d9c7b12568b1fa2f548a', CAST(N'2018-08-27T15:18:31.0000000' AS DateTime2), CAST(N'2018-08-27T15:18:31.0000000' AS DateTime2))
GO
SET IDENTITY_INSERT [dbo].[files] OFF
GO
SET IDENTITY_INSERT [dbo].[genders] ON 
GO
INSERT [dbo].[genders] ([id], [slug], [name], [value]) VALUES (1, N'male', N'male', 2)
GO
INSERT [dbo].[genders] ([id], [slug], [name], [value]) VALUES (2, N'female', N'female', 3)
GO
SET IDENTITY_INSERT [dbo].[genders] OFF
GO
SET IDENTITY_INSERT [dbo].[icdRequestAnswerDiagnoses] ON 
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (2, 7751, 2)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (3, 6252, 4)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (4, 7751, 5)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (5, 6134, 10)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (6, 2068, 13)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (7, 6226, 14)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (8, 6245, 15)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (9, 6226, 16)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (10, 4679, 16)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (11, 6142, 17)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (12, 6153, 18)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (13, 6226, 19)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (14, 6153, 20)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (15, 6226, 21)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (16, 6226, 22)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (17, 6252, 24)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (18, 6226, 25)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (19, 6153, 26)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (20, 6153, 27)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (21, 6219, 29)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (22, 6219, 30)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (23, 6219, 31)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (24, 6226, 33)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (25, 6144, 34)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (26, 3003, 35)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (27, 3033, 36)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (28, 6136, 37)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (29, 1529, 38)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (30, 6226, 38)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (31, 6013, 38)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (32, 6276, 39)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (33, 4679, 39)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (34, 6226, 40)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (35, 6276, 41)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (36, 6226, 42)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (37, 6226, 43)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (38, 6226, 44)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (39, 8290, 46)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (40, 6252, 48)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (41, 8290, 49)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (42, 3030, 49)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (43, 3138, 50)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (44, 4003, 50)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (45, 1585, 51)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (46, 1588, 51)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (47, 6229, 53)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (48, 6226, 54)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (49, 3100, 56)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (50, 3098, 57)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (51, 8218, 58)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (52, 8218, 59)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (53, 6226, 60)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (54, 6353, 61)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (55, 8218, 62)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (56, 6229, 63)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (57, 6226, 64)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (58, 8218, 65)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (59, 8218, 66)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (60, 6353, 67)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (61, 8218, 68)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (62, 6229, 69)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (63, 6097, 70)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (64, 6226, 71)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (65, 6229, 72)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (66, 5694, 73)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (67, 3098, 73)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (68, 6232, 74)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (69, 6226, 75)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (70, 6244, 76)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (71, 6226, 77)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (72, 6226, 78)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (73, 6226, 79)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (74, 3754, 80)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (75, 6226, 83)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (76, 6124, 84)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (77, 6124, 85)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (78, 6266, 86)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (79, 6148, 87)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (80, 6244, 88)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (81, 6226, 89)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (82, 6226, 90)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (83, 2938, 92)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (84, 2942, 92)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (85, 6097, 93)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (86, 1227, 94)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (87, 6241, 95)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (88, 6241, 96)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (89, 6124, 98)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (90, 6226, 98)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (91, 6140, 98)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (92, 6252, 99)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (93, 6277, 99)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (94, 6226, 100)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (95, 1227, 100)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (96, 6226, 100)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (97, 7751, 101)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (98, 7751, 102)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (99, 8225, 103)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (100, 6097, 104)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (101, 6232, 106)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (102, 1227, 106)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (103, 6226, 107)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (104, 1227, 107)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (105, 6226, 107)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (106, 6266, 108)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (107, 6148, 109)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (108, 6141, 109)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (109, 5705, 109)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (110, 6097, 111)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (111, 6141, 111)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (112, 6226, 112)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (113, 6252, 113)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (114, 6277, 113)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (115, 6252, 114)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (116, 6277, 114)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (117, 8225, 115)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (118, 7751, 116)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (119, 6226, 117)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (120, 1227, 117)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (121, 6226, 118)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (122, 6151, 119)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (123, 6141, 119)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (124, 6151, 120)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (125, 6141, 120)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (126, 8783, 121)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (127, 6153, 122)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (128, 6141, 122)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (129, 6124, 124)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (130, 6226, 124)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (131, 6140, 124)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (132, 4117, 125)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (133, 4138, 125)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (134, 4117, 127)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (135, 4499, 131)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (136, 8218, 132)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (137, 6223, 132)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (138, 2921, 133)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (139, 8203, 133)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (140, 3133, 133)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (141, 8218, 134)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (142, 8218, 135)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (143, 1227, 135)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (144, 6203, 135)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (145, 7786, 136)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (146, 7789, 136)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (147, 623, 137)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (148, 4707, 137)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (149, 4244, 137)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (150, 4707, 137)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (151, 623, 139)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (152, 4707, 139)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (153, 4244, 139)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (154, 4707, 139)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (155, 6226, 143)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (156, 6226, 144)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (157, 6227, 144)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (158, 3754, 145)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (159, 1105, 145)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (160, 3519, 147)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (161, 7209, 149)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (162, 3540, 158)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (163, 3538, 158)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (164, 3462, 161)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (165, 3538, 169)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (166, 3538, 171)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (167, 3538, 173)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (168, 3274, 179)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (169, 3564, 190)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (170, 3519, 199)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (171, 3462, 272)
GO
INSERT [dbo].[icdRequestAnswerDiagnoses] ([id], [icdId], [requestAnswerDiagnosisId]) VALUES (172, 3, 1)
GO
SET IDENTITY_INSERT [dbo].[icdRequestAnswerDiagnoses] OFF
GO
SET IDENTITY_INSERT [dbo].[icdRequests] ON 
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (3, 6252, 4)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (4, 6226, 15)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (5, 6245, 16)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (6, 6226, 17)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (7, 6142, 18)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (8, 6153, 19)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (9, 6226, 20)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (10, 6153, 21)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (11, 6226, 22)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (12, 6226, 23)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (13, 6252, 25)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (14, 6226, 26)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (15, 6153, 27)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (16, 6153, 28)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (17, 6219, 30)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (18, 6219, 31)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (19, 6226, 35)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (20, 3754, 37)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (21, 6226, 38)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (22, 3754, 40)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (23, 3003, 41)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (24, 3033, 42)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (25, 1529, 43)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (26, 8290, 44)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (27, 6276, 45)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (28, 6226, 46)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (29, 6276, 47)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (30, 6226, 48)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (31, 6226, 49)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (32, 6226, 50)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (33, 3138, 52)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (34, 8290, 53)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (35, 3138, 54)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (36, 6252, 55)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (37, 1585, 56)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (38, 6226, 58)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (39, 4037, 59)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (40, 5694, 63)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (41, 6229, 65)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (42, 6226, 66)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (43, 8218, 68)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (44, 8218, 69)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (45, 6226, 70)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (46, 6353, 71)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (47, 8218, 72)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (48, 2938, 73)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (49, 6229, 74)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (50, 6097, 75)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (51, 6229, 76)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (52, 6232, 78)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (53, 6226, 79)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (54, 6244, 80)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (55, 6226, 81)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (56, 6226, 82)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (57, 6226, 83)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (58, 6226, 84)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (59, 6124, 85)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (60, 6266, 86)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (61, 6148, 87)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (62, 6226, 89)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (63, 6226, 92)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (64, 6140, 92)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (65, 6097, 93)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (66, 1227, 94)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (67, 6241, 95)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (68, 6277, 97)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (69, 6252, 97)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (70, 6226, 98)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (71, 7751, 99)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (72, 8225, 100)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (73, 6097, 101)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (74, 6228, 102)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (75, 6226, 103)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (76, 1227, 106)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (77, 6277, 107)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (78, 6252, 107)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (79, 6151, 108)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (80, 6153, 110)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (81, 6013, 111)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (82, 4117, 112)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (83, 6013, 113)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (84, 4117, 114)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (85, 1247, 120)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (86, 6226, 120)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (87, 4499, 122)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (88, 8218, 123)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (89, 2921, 124)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (90, 8203, 124)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (91, 8218, 126)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (92, 7786, 127)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (93, 8941, 128)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (94, 623, 129)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (95, 4707, 129)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (96, 6226, 136)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (97, 3754, 138)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (98, 3754, 139)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (99, 3519, 140)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (100, 3519, 141)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (101, 3519, 142)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (102, 3519, 143)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (103, 3570, 144)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (104, 3519, 145)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (105, 3570, 146)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (106, 7209, 147)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (107, 8504, 148)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (108, 3296, 149)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (109, 3547, 150)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (110, 5597, 151)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (111, 3547, 152)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (112, 3442, 153)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (113, 3347, 154)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (114, 3452, 155)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (115, 3427, 156)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (116, 3423, 157)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (117, 3452, 158)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (118, 3452, 159)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (119, 3449, 160)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (120, 3422, 161)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (121, 3422, 162)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (122, 3519, 163)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (123, 3519, 164)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (124, 3519, 165)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (125, 3519, 166)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (126, 3519, 167)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (127, 3519, 168)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (128, 3519, 169)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (129, 3388, 170)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (130, 3519, 171)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (131, 3274, 172)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (132, 3519, 173)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (133, 3519, 174)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (134, 3519, 175)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (135, 3519, 176)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (136, 3519, 177)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (137, 3519, 178)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (138, 3519, 179)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (139, 3296, 180)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (140, 3442, 181)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (141, 3519, 182)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (142, 3536, 183)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (143, 3351, 184)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (144, 3446, 185)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (145, 3452, 186)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (146, 3280, 187)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (147, 9867, 188)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (148, 3424, 189)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (149, 3544, 190)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (150, 3564, 191)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (151, 3545, 192)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (152, 3544, 193)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (153, 3505, 194)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (154, 3505, 195)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (155, 3505, 196)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (156, 3505, 197)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (157, 3505, 198)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (158, 3505, 199)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (159, 3505, 200)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (160, 3505, 201)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (161, 3505, 202)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (162, 3505, 203)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (163, 3505, 204)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (164, 9867, 206)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (165, 3505, 207)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (166, 3505, 208)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (167, 3038, 209)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (168, 3295, 210)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (169, 3293, 211)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (170, 3519, 212)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (171, 3293, 213)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (172, 3519, 214)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (173, 3038, 215)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (174, 3293, 216)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (175, 3519, 217)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (176, 3519, 218)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (177, 3274, 220)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (178, 3293, 221)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (179, 3511, 222)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (180, 3515, 222)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (181, 3422, 225)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (182, 3537, 226)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (183, 3460, 227)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (184, 1630, 228)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (185, 1630, 229)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (186, 587, 230)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (187, 3519, 231)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (188, 3538, 232)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (189, 3462, 233)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (190, 3538, 234)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (191, 3540, 235)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (192, 3538, 236)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (193, 3540, 237)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (194, 3272, 238)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (195, 3296, 241)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (196, 3274, 242)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (197, 3321, 243)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (198, 2289, 244)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (199, 3272, 245)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (200, 3272, 246)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (201, 3272, 247)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (202, 3537, 249)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (203, 3538, 249)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (204, 3462, 250)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (205, 3272, 251)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (206, 3296, 252)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (207, 5275, 253)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (208, 3322, 255)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (209, 3274, 257)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (210, 3462, 258)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (211, 3462, 259)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (212, 3462, 260)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (213, 3462, 261)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (214, 3462, 262)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (215, 3462, 263)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (216, 3462, 264)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (217, 3462, 265)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (218, 3462, 266)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (219, 3296, 267)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (220, 3462, 271)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (221, 3462, 279)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (222, 3462, 281)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (223, 3462, 282)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (224, 3272, 283)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (225, 3296, 284)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (226, 3321, 285)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (227, 3272, 286)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (228, 3296, 287)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (229, 3462, 288)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (230, 3462, 289)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (231, 3462, 290)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (232, 3462, 293)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (233, 3462, 295)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (234, 3462, 300)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (235, 3272, 303)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (236, 3462, 304)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (237, 3462, 305)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (238, 3462, 307)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (239, 3272, 308)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (240, 3296, 311)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (241, 3462, 312)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (242, 3462, 313)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (243, 3462, 314)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (244, 3462, 315)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (245, 3462, 316)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (246, 3462, 320)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (247, 4179, 384)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (248, 4179, 386)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (249, 363, 387)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (250, 5, 388)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (251, 262, 1)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (252, 3, 2)
GO
INSERT [dbo].[icdRequests] ([id], [icdId], [requestId]) VALUES (253, 5, 3)
GO
SET IDENTITY_INSERT [dbo].[icdRequests] OFF
GO
SET IDENTITY_INSERT [dbo].[icds] ON 
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1, N'A000', N'Cholera due to Vibrio cholerae 01, biovar cholerae')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2, N'A001', N'Cholera due to Vibrio cholerae 01, biovar eltor')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (3, N'A009', N'Cholera, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (4, N'A0100', N'Typhoid fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (5, N'A0101', N'Typhoid meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (6, N'A0102', N'Typhoid fever with heart involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (7, N'A0103', N'Typhoid pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (8, N'A0104', N'Typhoid arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (9, N'A0105', N'Typhoid osteomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (10, N'A0109', N'Typhoid fever with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (11, N'A011', N'Paratyphoid fever A')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (12, N'A012', N'Paratyphoid fever B')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (13, N'A013', N'Paratyphoid fever C')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (14, N'A014', N'Paratyphoid fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (15, N'A020', N'Salmonella enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (16, N'A021', N'Salmonella sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (17, N'A0220', N'Localized salmonella infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (18, N'A0221', N'Salmonella meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (19, N'A0222', N'Salmonella pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (20, N'A0223', N'Salmonella arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (21, N'A0224', N'Salmonella osteomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (22, N'A0225', N'Salmonella pyelonephritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (23, N'A0229', N'Salmonella with other localized infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (24, N'A028', N'Other specified salmonella infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (25, N'A029', N'Salmonella infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (26, N'A030', N'Shigellosis due to Shigella dysenteriae')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (27, N'A031', N'Shigellosis due to Shigella flexneri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (28, N'A032', N'Shigellosis due to Shigella boydii')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (29, N'A033', N'Shigellosis due to Shigella sonnei')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (30, N'A038', N'Other shigellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (31, N'A039', N'Shigellosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (32, N'A040', N'Enteropathogenic Escherichia coli infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (33, N'A041', N'Enterotoxigenic Escherichia coli infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (34, N'A042', N'Enteroinvasive Escherichia coli infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (35, N'A043', N'Enterohemorrhagic Escherichia coli infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (36, N'A044', N'Other intestinal Escherichia coli infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (37, N'A045', N'Campylobacter enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (38, N'A046', N'Enteritis due to Yersinia enterocolitica')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (39, N'A047', N'Enterocolitis due to Clostridium difficile')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (40, N'A0471', N'Enterocolitis due to Clostridium difficile, recurrent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (41, N'A0472', N'Enterocolitis due to Clostridium difficile, not specified as recurrent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (42, N'A048', N'Other specified bacterial intestinal infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (43, N'A049', N'Bacterial intestinal infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (44, N'A050', N'Foodborne staphylococcal intoxication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (45, N'A051', N'Botulism food poisoning')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (46, N'A052', N'Foodborne Clostridium perfringens [Clostridium welchii] intoxication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (47, N'A053', N'Foodborne Vibrio parahaemolyticus intoxication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (48, N'A054', N'Foodborne Bacillus cereus intoxication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (49, N'A055', N'Foodborne Vibrio vulnificus intoxication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (50, N'A058', N'Other specified bacterial foodborne intoxications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (51, N'A059', N'Bacterial foodborne intoxication, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (52, N'A060', N'Acute amebic dysentery')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (53, N'A061', N'Chronic intestinal amebiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (54, N'A062', N'Amebic nondysenteric colitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (55, N'A063', N'Ameboma of intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (56, N'A064', N'Amebic liver abscess')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (57, N'A065', N'Amebic lung abscess')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (58, N'A066', N'Amebic brain abscess')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (59, N'A067', N'Cutaneous amebiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (60, N'A0681', N'Amebic cystitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (61, N'A0682', N'Other amebic genitourinary infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (62, N'A0689', N'Other amebic infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (63, N'A069', N'Amebiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (64, N'A070', N'Balantidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (65, N'A071', N'Giardiasis [lambliasis]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (66, N'A072', N'Cryptosporidiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (67, N'A073', N'Isosporiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (68, N'A074', N'Cyclosporiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (69, N'A078', N'Other specified protozoal intestinal diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (70, N'A079', N'Protozoal intestinal disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (71, N'A080', N'Rotaviral enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (72, N'A0811', N'Acute gastroenteropathy due to Norwalk agent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (73, N'A0819', N'Acute gastroenteropathy due to other small round viruses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (74, N'A082', N'Adenoviral enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (75, N'A0831', N'Calicivirus enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (76, N'A0832', N'Astrovirus enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (77, N'A0839', N'Other viral enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (78, N'A084', N'Viral intestinal infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (79, N'A088', N'Other specified intestinal infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (80, N'A09', N'Infectious gastroenteritis and colitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (81, N'A150', N'Tuberculosis of lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (82, N'A154', N'Tuberculosis of intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (83, N'A155', N'Tuberculosis of larynx, trachea and bronchus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (84, N'A156', N'Tuberculous pleurisy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (85, N'A157', N'Primary respiratory tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (86, N'A158', N'Other respiratory tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (87, N'A159', N'Respiratory tuberculosis unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (88, N'A170', N'Tuberculous meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (89, N'A171', N'Meningeal tuberculoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (90, N'A1781', N'Tuberculoma of brain and spinal cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (91, N'A1782', N'Tuberculous meningoencephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (92, N'A1783', N'Tuberculous neuritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (93, N'A1789', N'Other tuberculosis of nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (94, N'A179', N'Tuberculosis of nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (95, N'A1801', N'Tuberculosis of spine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (96, N'A1802', N'Tuberculous arthritis of other joints')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (97, N'A1803', N'Tuberculosis of other bones')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (98, N'A1809', N'Other musculoskeletal tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (99, N'A1810', N'Tuberculosis of genitourinary system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (100, N'A1811', N'Tuberculosis of kidney and ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (101, N'A1812', N'Tuberculosis of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (102, N'A1813', N'Tuberculosis of other urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (103, N'A1814', N'Tuberculosis of prostate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (104, N'A1815', N'Tuberculosis of other male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (105, N'A1816', N'Tuberculosis of cervix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (106, N'A1817', N'Tuberculous female pelvic inflammatory disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (107, N'A1818', N'Tuberculosis of other female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (108, N'A182', N'Tuberculous peripheral lymphadenopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (109, N'A1831', N'Tuberculous peritonitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (110, N'A1832', N'Tuberculous enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (111, N'A1839', N'Retroperitoneal tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (112, N'A184', N'Tuberculosis of skin and subcutaneous tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (113, N'A1850', N'Tuberculosis of eye, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (114, N'A1851', N'Tuberculous episcleritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (115, N'A1852', N'Tuberculous keratitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (116, N'A1853', N'Tuberculous chorioretinitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (117, N'A1854', N'Tuberculous iridocyclitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (118, N'A1859', N'Other tuberculosis of eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (119, N'A186', N'Tuberculosis of (inner) (middle) ear')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (120, N'A187', N'Tuberculosis of adrenal glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (121, N'A1881', N'Tuberculosis of thyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (122, N'A1882', N'Tuberculosis of other endocrine glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (123, N'A1883', N'Tuberculosis of digestive tract organs, not elsewhere classified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (124, N'A1884', N'Tuberculosis of heart')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (125, N'A1885', N'Tuberculosis of spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (126, N'A1889', N'Tuberculosis of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (127, N'A190', N'Acute miliary tuberculosis of a single specified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (128, N'A191', N'Acute miliary tuberculosis of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (129, N'A192', N'Acute miliary tuberculosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (130, N'A198', N'Other miliary tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (131, N'A199', N'Miliary tuberculosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (132, N'A200', N'Bubonic plague')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (133, N'A201', N'Cellulocutaneous plague')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (134, N'A202', N'Pneumonic plague')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (135, N'A203', N'Plague meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (136, N'A207', N'Septicemic plague')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (137, N'A208', N'Other forms of plague')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (138, N'A209', N'Plague, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (139, N'A210', N'Ulceroglandular tularemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (140, N'A211', N'Oculoglandular tularemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (141, N'A212', N'Pulmonary tularemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (142, N'A213', N'Gastrointestinal tularemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (143, N'A217', N'Generalized tularemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (144, N'A218', N'Other forms of tularemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (145, N'A219', N'Tularemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (146, N'A220', N'Cutaneous anthrax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (147, N'A221', N'Pulmonary anthrax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (148, N'A222', N'Gastrointestinal anthrax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (149, N'A227', N'Anthrax sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (150, N'A228', N'Other forms of anthrax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (151, N'A229', N'Anthrax, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (152, N'A230', N'Brucellosis due to Brucella melitensis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (153, N'A231', N'Brucellosis due to Brucella abortus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (154, N'A232', N'Brucellosis due to Brucella suis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (155, N'A233', N'Brucellosis due to Brucella canis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (156, N'A238', N'Other brucellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (157, N'A239', N'Brucellosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (158, N'A240', N'Glanders')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (159, N'A241', N'Acute and fulminating melioidosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (160, N'A242', N'Subacute and chronic melioidosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (161, N'A243', N'Other melioidosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (162, N'A249', N'Melioidosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (163, N'A250', N'Spirillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (164, N'A251', N'Streptobacillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (165, N'A259', N'Rat-bite fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (166, N'A260', N'Cutaneous erysipeloid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (167, N'A267', N'Erysipelothrix sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (168, N'A268', N'Other forms of erysipeloid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (169, N'A269', N'Erysipeloid, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (170, N'A270', N'Leptospirosis icterohemorrhagica')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (171, N'A2781', N'Aseptic meningitis in leptospirosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (172, N'A2789', N'Other forms of leptospirosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (173, N'A279', N'Leptospirosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (174, N'A280', N'Pasteurellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (175, N'A281', N'Cat-scratch disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (176, N'A282', N'Extraintestinal yersiniosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (177, N'A288', N'Other specified zoonotic bacterial diseases, not elsewhere classified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (178, N'A289', N'Zoonotic bacterial disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (179, N'A300', N'Indeterminate leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (180, N'A301', N'Tuberculoid leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (181, N'A302', N'Borderline tuberculoid leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (182, N'A303', N'Borderline leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (183, N'A304', N'Borderline lepromatous leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (184, N'A305', N'Lepromatous leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (185, N'A308', N'Other forms of leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (186, N'A309', N'Leprosy, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (187, N'A310', N'Pulmonary mycobacterial infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (188, N'A311', N'Cutaneous mycobacterial infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (189, N'A312', N'Disseminated mycobacterium avium-intracellulare complex (DMAC)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (190, N'A318', N'Other mycobacterial infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (191, N'A319', N'Mycobacterial infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (192, N'A320', N'Cutaneous listeriosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (193, N'A3211', N'Listerial meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (194, N'A3212', N'Listerial meningoencephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (195, N'A327', N'Listerial sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (196, N'A3281', N'Oculoglandular listeriosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (197, N'A3282', N'Listerial endocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (198, N'A3289', N'Other forms of listeriosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (199, N'A329', N'Listeriosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (200, N'A33', N'Tetanus neonatorum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (201, N'A34', N'Obstetrical tetanus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (202, N'A35', N'Other tetanus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (203, N'A360', N'Pharyngeal diphtheria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (204, N'A361', N'Nasopharyngeal diphtheria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (205, N'A362', N'Laryngeal diphtheria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (206, N'A363', N'Cutaneous diphtheria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (207, N'A3681', N'Diphtheritic cardiomyopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (208, N'A3682', N'Diphtheritic radiculomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (209, N'A3683', N'Diphtheritic polyneuritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (210, N'A3684', N'Diphtheritic tubulo-interstitial nephropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (211, N'A3685', N'Diphtheritic cystitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (212, N'A3686', N'Diphtheritic conjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (213, N'A3689', N'Other diphtheritic complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (214, N'A369', N'Diphtheria, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (215, N'A3700', N'Whooping cough due to Bordetella pertussis without pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (216, N'A3701', N'Whooping cough due to Bordetella pertussis with pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (217, N'A3710', N'Whooping cough due to Bordetella parapertussis without pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (218, N'A3711', N'Whooping cough due to Bordetella parapertussis with pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (219, N'A3780', N'Whooping cough due to other Bordetella species without pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (220, N'A3781', N'Whooping cough due to other Bordetella species with pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (221, N'A3790', N'Whooping cough, unspecified species without pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (222, N'A3791', N'Whooping cough, unspecified species with pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (223, N'A380', N'Scarlet fever with otitis media')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (224, N'A381', N'Scarlet fever with myocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (225, N'A388', N'Scarlet fever with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (226, N'A389', N'Scarlet fever, uncomplicated')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (227, N'A390', N'Meningococcal meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (228, N'A391', N'Waterhouse-Friderichsen syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (229, N'A392', N'Acute meningococcemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (230, N'A393', N'Chronic meningococcemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (231, N'A394', N'Meningococcemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (232, N'A3950', N'Meningococcal carditis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (233, N'A3951', N'Meningococcal endocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (234, N'A3952', N'Meningococcal myocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (235, N'A3953', N'Meningococcal pericarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (236, N'A3981', N'Meningococcal encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (237, N'A3982', N'Meningococcal retrobulbar neuritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (238, N'A3983', N'Meningococcal arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (239, N'A3984', N'Postmeningococcal arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (240, N'A3989', N'Other meningococcal infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (241, N'A399', N'Meningococcal infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (242, N'A400', N'Sepsis due to streptococcus, group A')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (243, N'A401', N'Sepsis due to streptococcus, group B')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (244, N'A403', N'Sepsis due to Streptococcus pneumoniae')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (245, N'A408', N'Other streptococcal sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (246, N'A409', N'Streptococcal sepsis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (247, N'A4101', N'Sepsis due to Methicillin susceptible Staphylococcus aureus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (248, N'A4102', N'Sepsis due to Methicillin resistant Staphylococcus aureus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (249, N'A411', N'Sepsis due to other specified staphylococcus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (250, N'A412', N'Sepsis due to unspecified staphylococcus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (251, N'A413', N'Sepsis due to Hemophilus influenzae')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (252, N'A414', N'Sepsis due to anaerobes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (253, N'A4150', N'Gram-negative sepsis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (254, N'A4151', N'Sepsis due to Escherichia coli [E. coli]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (255, N'A4152', N'Sepsis due to Pseudomonas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (256, N'A4153', N'Sepsis due to Serratia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (257, N'A4159', N'Other Gram-negative sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (258, N'A4181', N'Sepsis due to Enterococcus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (259, N'A4189', N'Other specified sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (260, N'A419', N'Sepsis, unspecified organism')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (261, N'A420', N'Pulmonary actinomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (262, N'A421', N'Abdominal actinomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (263, N'A422', N'Cervicofacial actinomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (264, N'A427', N'Actinomycotic sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (265, N'A4281', N'Actinomycotic meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (266, N'A4282', N'Actinomycotic encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (267, N'A4289', N'Other forms of actinomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (268, N'A429', N'Actinomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (269, N'A430', N'Pulmonary nocardiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (270, N'A431', N'Cutaneous nocardiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (271, N'A438', N'Other forms of nocardiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (272, N'A439', N'Nocardiosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (273, N'A440', N'Systemic bartonellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (274, N'A441', N'Cutaneous and mucocutaneous bartonellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (275, N'A448', N'Other forms of bartonellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (276, N'A449', N'Bartonellosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (277, N'A46', N'Erysipelas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (278, N'A480', N'Gas gangrene')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (279, N'A481', N'Legionnaires disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (280, N'A482', N'Nonpneumonic Legionnaires disease [Pontiac fever]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (281, N'A483', N'Toxic shock syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (282, N'A484', N'Brazilian purpuric fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (283, N'A4851', N'Infant botulism')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (284, N'A4852', N'Wound botulism')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (285, N'A488', N'Other specified bacterial diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (286, N'A4901', N'Methicillin susceptible Staphylococcus aureus infection, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (287, N'A4902', N'Methicillin resistant Staphylococcus aureus infection, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (288, N'A491', N'Streptococcal infection, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (289, N'A492', N'Hemophilus influenzae infection, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (290, N'A493', N'Mycoplasma infection, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (291, N'A498', N'Other bacterial infections of unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (292, N'A499', N'Bacterial infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (293, N'A5001', N'Early congenital syphilitic oculopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (294, N'A5002', N'Early congenital syphilitic osteochondropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (295, N'A5003', N'Early congenital syphilitic pharyngitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (296, N'A5004', N'Early congenital syphilitic pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (297, N'A5005', N'Early congenital syphilitic rhinitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (298, N'A5006', N'Early cutaneous congenital syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (299, N'A5007', N'Early mucocutaneous congenital syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (300, N'A5008', N'Early visceral congenital syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (301, N'A5009', N'Other early congenital syphilis, symptomatic')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (302, N'A501', N'Early congenital syphilis, latent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (303, N'A502', N'Early congenital syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (304, N'A5030', N'Late congenital syphilitic oculopathy, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (305, N'A5031', N'Late congenital syphilitic interstitial keratitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (306, N'A5032', N'Late congenital syphilitic chorioretinitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (307, N'A5039', N'Other late congenital syphilitic oculopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (308, N'A5040', N'Late congenital neurosyphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (309, N'A5041', N'Late congenital syphilitic meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (310, N'A5042', N'Late congenital syphilitic encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (311, N'A5043', N'Late congenital syphilitic polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (312, N'A5044', N'Late congenital syphilitic optic nerve atrophy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (313, N'A5045', N'Juvenile general paresis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (314, N'A5049', N'Other late congenital neurosyphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (315, N'A5051', N'Cluttons joints')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (316, N'A5052', N'Hutchinson"s teeth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (317, N'A5053', N'Hutchinson"s triad')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (318, N'A5054', N'Late congenital cardiovascular syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (319, N'A5055', N'Late congenital syphilitic arthropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (320, N'A5056', N'Late congenital syphilitic osteochondropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (321, N'A5057', N'Syphilitic saddle nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (322, N'A5059', N'Other late congenital syphilis, symptomatic')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (323, N'A506', N'Late congenital syphilis, latent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (324, N'A507', N'Late congenital syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (325, N'A509', N'Congenital syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (326, N'A510', N'Primary genital syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (327, N'A511', N'Primary anal syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (328, N'A512', N'Primary syphilis of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (329, N'A5131', N'Condyloma latum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (330, N'A5132', N'Syphilitic alopecia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (331, N'A5139', N'Other secondary syphilis of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (332, N'A5141', N'Secondary syphilitic meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (333, N'A5142', N'Secondary syphilitic female pelvic disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (334, N'A5143', N'Secondary syphilitic oculopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (335, N'A5144', N'Secondary syphilitic nephritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (336, N'A5145', N'Secondary syphilitic hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (337, N'A5146', N'Secondary syphilitic osteopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (338, N'A5149', N'Other secondary syphilitic conditions')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (339, N'A515', N'Early syphilis, latent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (340, N'A519', N'Early syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (341, N'A5200', N'Cardiovascular syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (342, N'A5201', N'Syphilitic aneurysm of aorta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (343, N'A5202', N'Syphilitic aortitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (344, N'A5203', N'Syphilitic endocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (345, N'A5204', N'Syphilitic cerebral arteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (346, N'A5205', N'Other cerebrovascular syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (347, N'A5206', N'Other syphilitic heart involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (348, N'A5209', N'Other cardiovascular syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (349, N'A5210', N'Symptomatic neurosyphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (350, N'A5211', N'Tabes dorsalis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (351, N'A5212', N'Other cerebrospinal syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (352, N'A5213', N'Late syphilitic meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (353, N'A5214', N'Late syphilitic encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (354, N'A5215', N'Late syphilitic neuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (355, N'A5216', N'Charcot"s arthropathy (tabetic)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (356, N'A5217', N'General paresis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (357, N'A5219', N'Other symptomatic neurosyphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (358, N'A522', N'Asymptomatic neurosyphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (359, N'A523', N'Neurosyphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (360, N'A5271', N'Late syphilitic oculopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (361, N'A5272', N'Syphilis of lung and bronchus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (362, N'A5273', N'Symptomatic late syphilis of other respiratory organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (363, N'A5274', N'Syphilis of liver and other viscera')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (364, N'A5275', N'Syphilis of kidney and ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (365, N'A5276', N'Other genitourinary symptomatic late syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (366, N'A5277', N'Syphilis of bone and joint')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (367, N'A5278', N'Syphilis of other musculoskeletal tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (368, N'A5279', N'Other symptomatic late syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (369, N'A528', N'Late syphilis, latent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (370, N'A529', N'Late syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (371, N'A530', N'Latent syphilis, unspecified as early or late')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (372, N'A539', N'Syphilis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (373, N'A5400', N'Gonococcal infection of lower genitourinary tract, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (374, N'A5401', N'Gonococcal cystitis and urethritis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (375, N'A5402', N'Gonococcal vulvovaginitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (376, N'A5403', N'Gonococcal cervicitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (377, N'A5409', N'Other gonococcal infection of lower genitourinary tract')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (378, N'A541', N'Gonococcal infection of lower genitourinary tract with periurethral and accessory gland abscess')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (379, N'A5421', N'Gonococcal infection of kidney and ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (380, N'A5422', N'Gonococcal prostatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (381, N'A5423', N'Gonococcal infection of other male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (382, N'A5424', N'Gonococcal female pelvic inflammatory disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (383, N'A5429', N'Other gonococcal genitourinary infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (384, N'A5430', N'Gonococcal infection of eye, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (385, N'A5431', N'Gonococcal conjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (386, N'A5432', N'Gonococcal iridocyclitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (387, N'A5433', N'Gonococcal keratitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (388, N'A5439', N'Other gonococcal eye infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (389, N'A5440', N'Gonococcal infection of musculoskeletal system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (390, N'A5441', N'Gonococcal spondylopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (391, N'A5442', N'Gonococcal arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (392, N'A5443', N'Gonococcal osteomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (393, N'A5449', N'Gonococcal infection of other musculoskeletal tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (394, N'A545', N'Gonococcal pharyngitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (395, N'A546', N'Gonococcal infection of anus and rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (396, N'A5481', N'Gonococcal meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (397, N'A5482', N'Gonococcal brain abscess')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (398, N'A5483', N'Gonococcal heart infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (399, N'A5484', N'Gonococcal pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (400, N'A5485', N'Gonococcal peritonitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (401, N'A5486', N'Gonococcal sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (402, N'A5489', N'Other gonococcal infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (403, N'A549', N'Gonococcal infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (404, N'A55', N'Chlamydial lymphogranuloma (venereum)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (405, N'A5600', N'Chlamydial infection of lower genitourinary tract, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (406, N'A5601', N'Chlamydial cystitis and urethritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (407, N'A5602', N'Chlamydial vulvovaginitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (408, N'A5609', N'Other chlamydial infection of lower genitourinary tract')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (409, N'A5611', N'Chlamydial female pelvic inflammatory disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (410, N'A5619', N'Other chlamydial genitourinary infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (411, N'A562', N'Chlamydial infection of genitourinary tract, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (412, N'A563', N'Chlamydial infection of anus and rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (413, N'A564', N'Chlamydial infection of pharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (414, N'A568', N'Sexually transmitted chlamydial infection of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (415, N'A57', N'Chancroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (416, N'A58', N'Granuloma inguinale')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (417, N'A5900', N'Urogenital trichomoniasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (418, N'A5901', N'Trichomonal vulvovaginitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (419, N'A5902', N'Trichomonal prostatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (420, N'A5903', N'Trichomonal cystitis and urethritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (421, N'A5909', N'Other urogenital trichomoniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (422, N'A598', N'Trichomoniasis of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (423, N'A599', N'Trichomoniasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (424, N'A6000', N'Herpesviral infection of urogenital system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (425, N'A6001', N'Herpesviral infection of penis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (426, N'A6002', N'Herpesviral infection of other male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (427, N'A6003', N'Herpesviral cervicitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (428, N'A6004', N'Herpesviral vulvovaginitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (429, N'A6009', N'Herpesviral infection of other urogenital tract')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (430, N'A601', N'Herpesviral infection of perianal skin and rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (431, N'A609', N'Anogenital herpesviral infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (432, N'A630', N'Anogenital (venereal) warts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (433, N'A638', N'Other specified predominantly sexually transmitted diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (434, N'A64', N'Unspecified sexually transmitted disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (435, N'A65', N'Nonvenereal syphilis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (436, N'A660', N'Initial lesions of yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (437, N'A661', N'Multiple papillomata and wet crab yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (438, N'A662', N'Other early skin lesions of yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (439, N'A663', N'Hyperkeratosis of yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (440, N'A664', N'Gummata and ulcers of yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (441, N'A665', N'Gangosa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (442, N'A666', N'Bone and joint lesions of yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (443, N'A667', N'Other manifestations of yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (444, N'A668', N'Latent yaws')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (445, N'A669', N'Yaws, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (446, N'A670', N'Primary lesions of pinta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (447, N'A671', N'Intermediate lesions of pinta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (448, N'A672', N'Late lesions of pinta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (449, N'A673', N'Mixed lesions of pinta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (450, N'A679', N'Pinta, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (451, N'A680', N'Louse-borne relapsing fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (452, N'A681', N'Tick-borne relapsing fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (453, N'A689', N'Relapsing fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (454, N'A690', N'Necrotizing ulcerative stomatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (455, N'A691', N'Other Vincent"s infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (456, N'A6920', N'Lyme disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (457, N'A6921', N'Meningitis due to Lyme disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (458, N'A6922', N'Other neurologic disorders in Lyme disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (459, N'A6923', N'Arthritis due to Lyme disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (460, N'A6929', N'Other conditions associated with Lyme disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (461, N'A698', N'Other specified spirochetal infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (462, N'A699', N'Spirochetal infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (463, N'A70', N'Chlamydia psittaci infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (464, N'A710', N'Initial stage of trachoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (465, N'A711', N'Active stage of trachoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (466, N'A719', N'Trachoma, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (467, N'A740', N'Chlamydial conjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (468, N'A7481', N'Chlamydial peritonitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (469, N'A7489', N'Other chlamydial diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (470, N'A749', N'Chlamydial infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (471, N'A750', N'Epidemic louse-borne typhus fever due to Rickettsia prowazekii')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (472, N'A751', N'Recrudescent typhus [Brill"s disease]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (473, N'A752', N'Typhus fever due to Rickettsia typhi')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (474, N'A753', N'Typhus fever due to Rickettsia tsutsugamushi')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (475, N'A759', N'Typhus fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (476, N'A770', N'Spotted fever due to Rickettsia rickettsii')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (477, N'A771', N'Spotted fever due to Rickettsia conorii')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (478, N'A772', N'Spotted fever due to Rickettsia siberica')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (479, N'A773', N'Spotted fever due to Rickettsia australis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (480, N'A7740', N'Ehrlichiosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (481, N'A7741', N'Ehrlichiosis chafeensis [E. chafeensis]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (482, N'A7749', N'Other ehrlichiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (483, N'A778', N'Other spotted fevers')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (484, N'A779', N'Spotted fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (485, N'A78', N'Q fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (486, N'A790', N'Trench fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (487, N'A791', N'Rickettsialpox due to Rickettsia akari')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (488, N'A7981', N'Rickettsiosis due to Ehrlichia sennetsu')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (489, N'A7989', N'Other specified rickettsioses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (490, N'A799', N'Rickettsiosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (491, N'A800', N'Acute paralytic poliomyelitis, vaccine-associated')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (492, N'A801', N'Acute paralytic poliomyelitis, wild virus, imported')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (493, N'A802', N'Acute paralytic poliomyelitis, wild virus, indigenous')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (494, N'A8030', N'Acute paralytic poliomyelitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (495, N'A8039', N'Other acute paralytic poliomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (496, N'A804', N'Acute nonparalytic poliomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (497, N'A809', N'Acute poliomyelitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (498, N'A8100', N'Creutzfeldt-Jakob disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (499, N'A8101', N'Variant Creutzfeldt-Jakob disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (500, N'A8109', N'Other Creutzfeldt-Jakob disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (501, N'A811', N'Subacute sclerosing panencephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (502, N'A812', N'Progressive multifocal leukoencephalopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (503, N'A8181', N'Kuru')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (504, N'A8182', N'Gerstmann-Straussler-Scheinker syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (505, N'A8183', N'Fatal familial insomnia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (506, N'A8189', N'Other atypical virus infections of central nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (507, N'A819', N'Atypical virus infection of central nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (508, N'A820', N'Sylvatic rabies')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (509, N'A821', N'Urban rabies')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (510, N'A829', N'Rabies, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (511, N'A830', N'Japanese encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (512, N'A831', N'Western equine encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (513, N'A832', N'Eastern equine encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (514, N'A833', N'St Louis encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (515, N'A834', N'Australian encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (516, N'A835', N'California encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (517, N'A836', N'Rocio virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (518, N'A838', N'Other mosquito-borne viral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (519, N'A839', N'Mosquito-borne viral encephalitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (520, N'A840', N'Far Eastern tick-borne encephalitis [Russian spring-summer encephalitis]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (521, N'A841', N'Central European tick-borne encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (522, N'A848', N'Other tick-borne viral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (523, N'A849', N'Tick-borne viral encephalitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (524, N'A850', N'Enteroviral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (525, N'A851', N'Adenoviral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (526, N'A852', N'Arthropod-borne viral encephalitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (527, N'A858', N'Other specified viral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (528, N'A86', N'Unspecified viral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (529, N'A870', N'Enteroviral meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (530, N'A871', N'Adenoviral meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (531, N'A872', N'Lymphocytic choriomeningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (532, N'A878', N'Other viral meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (533, N'A879', N'Viral meningitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (534, N'A880', N'Enteroviral exanthematous fever [Boston exanthem]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (535, N'A881', N'Epidemic vertigo')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (536, N'A888', N'Other specified viral infections of central nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (537, N'A89', N'Unspecified viral infection of central nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (538, N'A90', N'Dengue fever [classical dengue]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (539, N'A91', N'Dengue hemorrhagic fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (540, N'A920', N'Chikungunya virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (541, N'A921', N'O"nyong-nyong fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (542, N'A922', N'Venezuelan equine fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (543, N'A9230', N'West Nile virus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (544, N'A9231', N'West Nile virus infection with encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (545, N'A9232', N'West Nile virus infection with other neurologic manifestation')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (546, N'A9239', N'West Nile virus infection with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (547, N'A924', N'Rift Valley fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (548, N'A925', N'Zika virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (549, N'A928', N'Other specified mosquito-borne viral fevers')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (550, N'A929', N'Mosquito-borne viral fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (551, N'A930', N'Oropouche virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (552, N'A931', N'Sandfly fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (553, N'A932', N'Colorado tick fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (554, N'A938', N'Other specified arthropod-borne viral fevers')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (555, N'A94', N'Unspecified arthropod-borne viral fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (556, N'A950', N'Sylvatic yellow fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (557, N'A951', N'Urban yellow fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (558, N'A959', N'Yellow fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (559, N'A960', N'Junin hemorrhagic fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (560, N'A961', N'Machupo hemorrhagic fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (561, N'A962', N'Lassa fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (562, N'A968', N'Other arenaviral hemorrhagic fevers')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (563, N'A969', N'Arenaviral hemorrhagic fever, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (564, N'A980', N'Crimean-Congo hemorrhagic fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (565, N'A981', N'Omsk hemorrhagic fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (566, N'A982', N'Kyasanur Forest disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (567, N'A983', N'Marburg virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (568, N'A984', N'Ebola virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (569, N'A985', N'Hemorrhagic fever with renal syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (570, N'A988', N'Other specified viral hemorrhagic fevers')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (571, N'A99', N'Unspecified viral hemorrhagic fever')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (572, N'B000', N'Eczema herpeticum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (573, N'B001', N'Herpesviral vesicular dermatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (574, N'B002', N'Herpesviral gingivostomatitis and pharyngotonsillitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (575, N'B003', N'Herpesviral meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (576, N'B004', N'Herpesviral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (577, N'B0050', N'Herpesviral ocular disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (578, N'B0051', N'Herpesviral iridocyclitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (579, N'B0052', N'Herpesviral keratitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (580, N'B0053', N'Herpesviral conjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (581, N'B0059', N'Other herpesviral disease of eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (582, N'B007', N'Disseminated herpesviral disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (583, N'B0081', N'Herpesviral hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (584, N'B0082', N'Herpes simplex myelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (585, N'B0089', N'Other herpesviral infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (586, N'B009', N'Herpesviral infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (587, N'B010', N'Varicella meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (588, N'B0111', N'Varicella encephalitis and encephalomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (589, N'B0112', N'Varicella myelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (590, N'B012', N'Varicella pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (591, N'B0181', N'Varicella keratitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (592, N'B0189', N'Other varicella complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (593, N'B019', N'Varicella without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (594, N'B020', N'Zoster encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (595, N'B021', N'Zoster meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (596, N'B0221', N'Postherpetic geniculate ganglionitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (597, N'B0222', N'Postherpetic trigeminal neuralgia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (598, N'B0223', N'Postherpetic polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (599, N'B0224', N'Postherpetic myelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (600, N'B0229', N'Other postherpetic nervous system involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (601, N'B0230', N'Zoster ocular disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (602, N'B0231', N'Zoster conjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (603, N'B0232', N'Zoster iridocyclitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (604, N'B0233', N'Zoster keratitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (605, N'B0234', N'Zoster scleritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (606, N'B0239', N'Other herpes zoster eye disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (607, N'B027', N'Disseminated zoster')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (608, N'B028', N'Zoster with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (609, N'B029', N'Zoster without complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (610, N'B03', N'Smallpox')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (611, N'B04', N'Monkeypox')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (612, N'B050', N'Measles complicated by encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (613, N'B051', N'Measles complicated by meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (614, N'B052', N'Measles complicated by pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (615, N'B053', N'Measles complicated by otitis media')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (616, N'B054', N'Measles with intestinal complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (617, N'B0581', N'Measles keratitis and keratoconjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (618, N'B0589', N'Other measles complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (619, N'B059', N'Measles without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (620, N'B0600', N'Rubella with neurological complication, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (621, N'B0601', N'Rubella encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (622, N'B0602', N'Rubella meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (623, N'B0609', N'Other neurological complications of rubella')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (624, N'B0681', N'Rubella pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (625, N'B0682', N'Rubella arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (626, N'B0689', N'Other rubella complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (627, N'B069', N'Rubella without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (628, N'B070', N'Plantar wart')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (629, N'B078', N'Other viral warts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (630, N'B079', N'Viral wart, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (631, N'B08010', N'Cowpox')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (632, N'B08011', N'Vaccinia not from vaccine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (633, N'B0802', N'Orf virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (634, N'B0803', N'Pseudocowpox [milker"s node]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (635, N'B0804', N'Paravaccinia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (636, N'B0809', N'Other orthopoxvirus infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (637, N'B081', N'Molluscum contagiosum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (638, N'B0820', N'Exanthema subitum [sixth disease], unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (639, N'B0821', N'Exanthema subitum [sixth disease] due to human herpesvirus 6')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (640, N'B0822', N'Exanthema subitum [sixth disease] due to human herpesvirus 7')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (641, N'B083', N'Erythema infectiosum [fifth disease]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (642, N'B084', N'Enteroviral vesicular stomatitis with exanthem')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (643, N'B085', N'Enteroviral vesicular pharyngitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (644, N'B0860', N'Parapoxvirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (645, N'B0861', N'Bovine stomatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (646, N'B0862', N'Sealpox')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (647, N'B0869', N'Other parapoxvirus infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (648, N'B0870', N'Yatapoxvirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (649, N'B0871', N'Tanapox virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (650, N'B0872', N'Yaba pox virus disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (651, N'B0879', N'Other yatapoxvirus infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (652, N'B088', N'Other specified viral infections characterized by skin and mucous membrane lesions')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (653, N'B09', N'Unspecified viral infection characterized by skin and mucous membrane lesions')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (654, N'B1001', N'Human herpesvirus 6 encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (655, N'B1009', N'Other human herpesvirus encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (656, N'B1081', N'Human herpesvirus 6 infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (657, N'B1082', N'Human herpesvirus 7 infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (658, N'B1089', N'Other human herpesvirus infection')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (659, N'B150', N'Hepatitis A with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (660, N'B159', N'Hepatitis A without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (661, N'B160', N'Acute hepatitis B with delta-agent with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (662, N'B161', N'Acute hepatitis B with delta-agent without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (663, N'B162', N'Acute hepatitis B without delta-agent with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (664, N'B169', N'Acute hepatitis B without delta-agent and without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (665, N'B170', N'Acute delta-(super) infection of hepatitis B carrier')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (666, N'B1710', N'Acute hepatitis C without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (667, N'B1711', N'Acute hepatitis C with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (668, N'B172', N'Acute hepatitis E')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (669, N'B178', N'Other specified acute viral hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (670, N'B179', N'Acute viral hepatitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (671, N'B180', N'Chronic viral hepatitis B with delta-agent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (672, N'B181', N'Chronic viral hepatitis B without delta-agent')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (673, N'B182', N'Chronic viral hepatitis C')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (674, N'B188', N'Other chronic viral hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (675, N'B189', N'Chronic viral hepatitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (676, N'B190', N'Unspecified viral hepatitis with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (677, N'B1910', N'Unspecified viral hepatitis B without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (678, N'B1911', N'Unspecified viral hepatitis B with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (679, N'B1920', N'Unspecified viral hepatitis C without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (680, N'B1921', N'Unspecified viral hepatitis C with hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (681, N'B199', N'Unspecified viral hepatitis without hepatic coma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (682, N'B20', N'Human immunodeficiency virus [HIV] disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (683, N'B250', N'Cytomegaloviral pneumonitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (684, N'B251', N'Cytomegaloviral hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (685, N'B252', N'Cytomegaloviral pancreatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (686, N'B258', N'Other cytomegaloviral diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (687, N'B259', N'Cytomegaloviral disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (688, N'B260', N'Mumps orchitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (689, N'B261', N'Mumps meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (690, N'B262', N'Mumps encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (691, N'B263', N'Mumps pancreatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (692, N'B2681', N'Mumps hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (693, N'B2682', N'Mumps myocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (694, N'B2683', N'Mumps nephritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (695, N'B2684', N'Mumps polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (696, N'B2685', N'Mumps arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (697, N'B2689', N'Other mumps complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (698, N'B269', N'Mumps without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (699, N'B2700', N'Gammaherpesviral mononucleosis without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (700, N'B2701', N'Gammaherpesviral mononucleosis with polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (701, N'B2702', N'Gammaherpesviral mononucleosis with meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (702, N'B2709', N'Gammaherpesviral mononucleosis with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (703, N'B2710', N'Cytomegaloviral mononucleosis without complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (704, N'B2711', N'Cytomegaloviral mononucleosis with polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (705, N'B2712', N'Cytomegaloviral mononucleosis with meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (706, N'B2719', N'Cytomegaloviral mononucleosis with other complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (707, N'B2780', N'Other infectious mononucleosis without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (708, N'B2781', N'Other infectious mononucleosis with polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (709, N'B2782', N'Other infectious mononucleosis with meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (710, N'B2789', N'Other infectious mononucleosis with other complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (711, N'B2790', N'Infectious mononucleosis, unspecified without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (712, N'B2791', N'Infectious mononucleosis, unspecified with polyneuropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (713, N'B2792', N'Infectious mononucleosis, unspecified with meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (714, N'B2799', N'Infectious mononucleosis, unspecified with other complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (715, N'B300', N'Keratoconjunctivitis due to adenovirus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (716, N'B301', N'Conjunctivitis due to adenovirus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (717, N'B302', N'Viral pharyngoconjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (718, N'B303', N'Acute epidemic hemorrhagic conjunctivitis (enteroviral)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (719, N'B308', N'Other viral conjunctivitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (720, N'B309', N'Viral conjunctivitis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (721, N'B330', N'Epidemic myalgia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (722, N'B331', N'Ross River disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (723, N'B3320', N'Viral carditis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (724, N'B3321', N'Viral endocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (725, N'B3322', N'Viral myocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (726, N'B3323', N'Viral pericarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (727, N'B3324', N'Viral cardiomyopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (728, N'B333', N'Retrovirus infections, not elsewhere classified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (729, N'B334', N'Hantavirus (cardio)-pulmonary syndrome [HPS] [HCPS]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (730, N'B338', N'Other specified viral diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (731, N'B340', N'Adenovirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (732, N'B341', N'Enterovirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (733, N'B342', N'Coronavirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (734, N'B343', N'Parvovirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (735, N'B344', N'Papovavirus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (736, N'B348', N'Other viral infections of unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (737, N'B349', N'Viral infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (738, N'B350', N'Tinea barbae and tinea capitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (739, N'B351', N'Tinea unguium')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (740, N'B352', N'Tinea manuum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (741, N'B353', N'Tinea pedis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (742, N'B354', N'Tinea corporis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (743, N'B355', N'Tinea imbricata')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (744, N'B356', N'Tinea cruris')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (745, N'B358', N'Other dermatophytoses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (746, N'B359', N'Dermatophytosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (747, N'B360', N'Pityriasis versicolor')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (748, N'B361', N'Tinea nigra')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (749, N'B362', N'White piedra')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (750, N'B363', N'Black piedra')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (751, N'B368', N'Other specified superficial mycoses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (752, N'B369', N'Superficial mycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (753, N'B370', N'Candidal stomatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (754, N'B371', N'Pulmonary candidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (755, N'B372', N'Candidiasis of skin and nail')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (756, N'B373', N'Candidiasis of vulva and vagina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (757, N'B3741', N'Candidal cystitis and urethritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (758, N'B3742', N'Candidal balanitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (759, N'B3749', N'Other urogenital candidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (760, N'B375', N'Candidal meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (761, N'B376', N'Candidal endocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (762, N'B377', N'Candidal sepsis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (763, N'B3781', N'Candidal esophagitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (764, N'B3782', N'Candidal enteritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (765, N'B3783', N'Candidal cheilitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (766, N'B3784', N'Candidal otitis externa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (767, N'B3789', N'Other sites of candidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (768, N'B379', N'Candidiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (769, N'B380', N'Acute pulmonary coccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (770, N'B381', N'Chronic pulmonary coccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (771, N'B382', N'Pulmonary coccidioidomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (772, N'B383', N'Cutaneous coccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (773, N'B384', N'Coccidioidomycosis meningitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (774, N'B387', N'Disseminated coccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (775, N'B3881', N'Prostatic coccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (776, N'B3889', N'Other forms of coccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (777, N'B389', N'Coccidioidomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (778, N'B390', N'Acute pulmonary histoplasmosis capsulati')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (779, N'B391', N'Chronic pulmonary histoplasmosis capsulati')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (780, N'B392', N'Pulmonary histoplasmosis capsulati, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (781, N'B393', N'Disseminated histoplasmosis capsulati')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (782, N'B394', N'Histoplasmosis capsulati, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (783, N'B395', N'Histoplasmosis duboisii')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (784, N'B399', N'Histoplasmosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (785, N'B400', N'Acute pulmonary blastomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (786, N'B401', N'Chronic pulmonary blastomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (787, N'B402', N'Pulmonary blastomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (788, N'B403', N'Cutaneous blastomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (789, N'B407', N'Disseminated blastomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (790, N'B4081', N'Blastomycotic meningoencephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (791, N'B4089', N'Other forms of blastomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (792, N'B409', N'Blastomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (793, N'B410', N'Pulmonary paracoccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (794, N'B417', N'Disseminated paracoccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (795, N'B418', N'Other forms of paracoccidioidomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (796, N'B419', N'Paracoccidioidomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (797, N'B420', N'Pulmonary sporotrichosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (798, N'B421', N'Lymphocutaneous sporotrichosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (799, N'B427', N'Disseminated sporotrichosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (800, N'B4281', N'Cerebral sporotrichosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (801, N'B4282', N'Sporotrichosis arthritis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (802, N'B4289', N'Other forms of sporotrichosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (803, N'B429', N'Sporotrichosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (804, N'B430', N'Cutaneous chromomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (805, N'B431', N'Pheomycotic brain abscess')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (806, N'B432', N'Subcutaneous pheomycotic abscess and cyst')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (807, N'B438', N'Other forms of chromomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (808, N'B439', N'Chromomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (809, N'B440', N'Invasive pulmonary aspergillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (810, N'B441', N'Other pulmonary aspergillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (811, N'B442', N'Tonsillar aspergillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (812, N'B447', N'Disseminated aspergillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (813, N'B4481', N'Allergic bronchopulmonary aspergillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (814, N'B4489', N'Other forms of aspergillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (815, N'B449', N'Aspergillosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (816, N'B450', N'Pulmonary cryptococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (817, N'B451', N'Cerebral cryptococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (818, N'B452', N'Cutaneous cryptococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (819, N'B453', N'Osseous cryptococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (820, N'B457', N'Disseminated cryptococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (821, N'B458', N'Other forms of cryptococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (822, N'B459', N'Cryptococcosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (823, N'B460', N'Pulmonary mucormycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (824, N'B461', N'Rhinocerebral mucormycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (825, N'B462', N'Gastrointestinal mucormycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (826, N'B463', N'Cutaneous mucormycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (827, N'B464', N'Disseminated mucormycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (828, N'B465', N'Mucormycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (829, N'B468', N'Other zygomycoses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (830, N'B469', N'Zygomycosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (831, N'B470', N'Eumycetoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (832, N'B471', N'Actinomycetoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (833, N'B479', N'Mycetoma, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (834, N'B480', N'Lobomycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (835, N'B481', N'Rhinosporidiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (836, N'B482', N'Allescheriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (837, N'B483', N'Geotrichosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (838, N'B484', N'Penicillosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (839, N'B488', N'Other specified mycoses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (840, N'B49', N'Unspecified mycosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (841, N'B500', N'Plasmodium falciparum malaria with cerebral complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (842, N'B508', N'Other severe and complicated Plasmodium falciparum malaria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (843, N'B509', N'Plasmodium falciparum malaria, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (844, N'B510', N'Plasmodium vivax malaria with rupture of spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (845, N'B518', N'Plasmodium vivax malaria with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (846, N'B519', N'Plasmodium vivax malaria without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (847, N'B520', N'Plasmodium malariae malaria with nephropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (848, N'B528', N'Plasmodium malariae malaria with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (849, N'B529', N'Plasmodium malariae malaria without complication')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (850, N'B530', N'Plasmodium ovale malaria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (851, N'B531', N'Malaria due to simian plasmodia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (852, N'B538', N'Other malaria, not elsewhere classified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (853, N'B54', N'Unspecified malaria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (854, N'B550', N'Visceral leishmaniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (855, N'B551', N'Cutaneous leishmaniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (856, N'B552', N'Mucocutaneous leishmaniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (857, N'B559', N'Leishmaniasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (858, N'B560', N'Gambiense trypanosomiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (859, N'B561', N'Rhodesiense trypanosomiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (860, N'B569', N'African trypanosomiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (861, N'B570', N'Acute Chagas disease with heart involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (862, N'B571', N'Acute Chagas disease without heart involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (863, N'B572', N'Chagas disease (chronic) with heart involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (864, N'B5730', N'Chagas disease with digestive system involvement, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (865, N'B5731', N'Megaesophagus in Chagas disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (866, N'B5732', N'Megacolon in Chagas disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (867, N'B5739', N'Other digestive system involvement in Chagas disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (868, N'B5740', N'Chagas disease with nervous system involvement, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (869, N'B5741', N'Meningitis in Chagas disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (870, N'B5742', N'Meningoencephalitis in Chagas disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (871, N'B5749', N'Other nervous system involvement in Chagas disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (872, N'B575', N'Chagas disease (chronic) with other organ involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (873, N'B5800', N'Toxoplasma oculopathy, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (874, N'B5801', N'Toxoplasma chorioretinitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (875, N'B5809', N'Other toxoplasma oculopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (876, N'B581', N'Toxoplasma hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (877, N'B582', N'Toxoplasma meningoencephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (878, N'B583', N'Pulmonary toxoplasmosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (879, N'B5881', N'Toxoplasma myocarditis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (880, N'B5882', N'Toxoplasma myositis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (881, N'B5883', N'Toxoplasma tubulo-interstitial nephropathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (882, N'B5889', N'Toxoplasmosis with other organ involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (883, N'B589', N'Toxoplasmosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (884, N'B59', N'Pneumocystosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (885, N'B600', N'Babesiosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (886, N'B6010', N'Acanthamebiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (887, N'B6011', N'Meningoencephalitis due to Acanthamoeba (culbertsoni)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (888, N'B6012', N'Conjunctivitis due to Acanthamoeba')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (889, N'B6013', N'Keratoconjunctivitis due to Acanthamoeba')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (890, N'B6019', N'Other acanthamebic disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (891, N'B602', N'Naegleriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (892, N'B608', N'Other specified protozoal diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (893, N'B64', N'Unspecified protozoal disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (894, N'B650', N'Schistosomiasis due to Schistosoma haematobium [urinary schistosomiasis]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (895, N'B651', N'Schistosomiasis due to Schistosoma mansoni [intestinal schistosomiasis]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (896, N'B652', N'Schistosomiasis due to Schistosoma japonicum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (897, N'B653', N'Cercarial dermatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (898, N'B658', N'Other schistosomiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (899, N'B659', N'Schistosomiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (900, N'B660', N'Opisthorchiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (901, N'B661', N'Clonorchiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (902, N'B662', N'Dicroceliasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (903, N'B663', N'Fascioliasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (904, N'B664', N'Paragonimiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (905, N'B665', N'Fasciolopsiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (906, N'B668', N'Other specified fluke infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (907, N'B669', N'Fluke infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (908, N'B670', N'Echinococcus granulosus infection of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (909, N'B671', N'Echinococcus granulosus infection of lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (910, N'B672', N'Echinococcus granulosus infection of bone')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (911, N'B6731', N'Echinococcus granulosus infection, thyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (912, N'B6732', N'Echinococcus granulosus infection, multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (913, N'B6739', N'Echinococcus granulosus infection, other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (914, N'B674', N'Echinococcus granulosus infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (915, N'B675', N'Echinococcus multilocularis infection of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (916, N'B6761', N'Echinococcus multilocularis infection, multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (917, N'B6769', N'Echinococcus multilocularis infection, other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (918, N'B677', N'Echinococcus multilocularis infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (919, N'B678', N'Echinococcosis, unspecified, of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (920, N'B6790', N'Echinococcosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (921, N'B6799', N'Other echinococcosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (922, N'B680', N'Taenia solium taeniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (923, N'B681', N'Taenia saginata taeniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (924, N'B689', N'Taeniasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (925, N'B690', N'Cysticercosis of central nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (926, N'B691', N'Cysticercosis of eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (927, N'B6981', N'Myositis in cysticercosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (928, N'B6989', N'Cysticercosis of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (929, N'B699', N'Cysticercosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (930, N'B700', N'Diphyllobothriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (931, N'B701', N'Sparganosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (932, N'B710', N'Hymenolepiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (933, N'B711', N'Dipylidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (934, N'B718', N'Other specified cestode infections')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (935, N'B719', N'Cestode infection, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (936, N'B72', N'Dracunculiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (937, N'B7300', N'Onchocerciasis with eye involvement, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (938, N'B7301', N'Onchocerciasis with endophthalmitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (939, N'B7302', N'Onchocerciasis with glaucoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (940, N'B7309', N'Onchocerciasis with other eye involvement')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (941, N'B731', N'Onchocerciasis without eye disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (942, N'B740', N'Filariasis due to Wuchereria bancrofti')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (943, N'B741', N'Filariasis due to Brugia malayi')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (944, N'B742', N'Filariasis due to Brugia timori')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (945, N'B743', N'Loiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (946, N'B744', N'Mansonelliasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (947, N'B748', N'Other filariases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (948, N'B749', N'Filariasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (949, N'B75', N'Trichinellosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (950, N'B760', N'Ancylostomiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (951, N'B761', N'Necatoriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (952, N'B768', N'Other hookworm diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (953, N'B769', N'Hookworm disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (954, N'B770', N'Ascariasis with intestinal complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (955, N'B7781', N'Ascariasis pneumonia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (956, N'B7789', N'Ascariasis with other complications')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (957, N'B779', N'Ascariasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (958, N'B780', N'Intestinal strongyloidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (959, N'B781', N'Cutaneous strongyloidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (960, N'B787', N'Disseminated strongyloidiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (961, N'B789', N'Strongyloidiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (962, N'B79', N'Trichuriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (963, N'B80', N'Enterobiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (964, N'B810', N'Anisakiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (965, N'B811', N'Intestinal capillariasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (966, N'B812', N'Trichostrongyliasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (967, N'B813', N'Intestinal angiostrongyliasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (968, N'B814', N'Mixed intestinal helminthiases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (969, N'B818', N'Other specified intestinal helminthiases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (970, N'B820', N'Intestinal helminthiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (971, N'B829', N'Intestinal parasitism, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (972, N'B830', N'Visceral larva migrans')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (973, N'B831', N'Gnathostomiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (974, N'B832', N'Angiostrongyliasis due to Parastrongylus cantonensis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (975, N'B833', N'Syngamiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (976, N'B834', N'Internal hirudiniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (977, N'B838', N'Other specified helminthiases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (978, N'B839', N'Helminthiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (979, N'B850', N'Pediculosis due to Pediculus humanus capitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (980, N'B851', N'Pediculosis due to Pediculus humanus corporis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (981, N'B852', N'Pediculosis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (982, N'B853', N'Phthiriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (983, N'B854', N'Mixed pediculosis and phthiriasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (984, N'B86', N'Scabies')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (985, N'B870', N'Cutaneous myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (986, N'B871', N'Wound myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (987, N'B872', N'Ocular myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (988, N'B873', N'Nasopharyngeal myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (989, N'B874', N'Aural myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (990, N'B8781', N'Genitourinary myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (991, N'B8782', N'Intestinal myiasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (992, N'B8789', N'Myiasis of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (993, N'B879', N'Myiasis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (994, N'B880', N'Other acariasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (995, N'B881', N'Tungiasis [sandflea infestation]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (996, N'B882', N'Other arthropod infestations')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (997, N'B883', N'External hirudiniasis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (998, N'B888', N'Other specified infestations')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (999, N'B889', N'Infestation, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1000, N'B89', N'Unspecified parasitic disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1001, N'B900', N'Sequelae of central nervous system tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1002, N'B901', N'Sequelae of genitourinary tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1003, N'B902', N'Sequelae of tuberculosis of bones and joints')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1004, N'B908', N'Sequelae of tuberculosis of other organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1005, N'B909', N'Sequelae of respiratory and unspecified tuberculosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1006, N'B91', N'Sequelae of poliomyelitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1007, N'B92', N'Sequelae of leprosy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1008, N'B940', N'Sequelae of trachoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1009, N'B941', N'Sequelae of viral encephalitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1010, N'B942', N'Sequelae of viral hepatitis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1011, N'B948', N'Sequelae of other specified infectious and parasitic diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1012, N'B949', N'Sequelae of unspecified infectious and parasitic disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1013, N'B950', N'Streptococcus, group A, as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1014, N'B951', N'Streptococcus, group B, as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1015, N'B952', N'Enterococcus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1016, N'B953', N'Streptococcus pneumoniae as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1017, N'B954', N'Other streptococcus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1018, N'B955', N'Unspecified streptococcus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1019, N'B9561', N'Methicillin susceptible Staphylococcus aureus infection as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1020, N'B9562', N'Methicillin resistant Staphylococcus aureus infection as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1021, N'B957', N'Other staphylococcus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1022, N'B958', N'Unspecified staphylococcus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1023, N'B960', N'Mycoplasma pneumoniae [M. pneumoniae] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1024, N'B961', N'Klebsiella pneumoniae [K. pneumoniae] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1025, N'B9620', N'Unspecified Escherichia coli [E. coli] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1026, N'B9621', N'Shiga toxin-producing Escherichia coli [E. coli] (STEC) O157 as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1027, N'B9622', N'Other specified Shiga toxin-producing Escherichia coli [E. coli] (STEC) as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1028, N'B9623', N'Unspecified Shiga toxin-producing Escherichia coli [E. coli] (STEC) as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1029, N'B9629', N'Other Escherichia coli [E. coli] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1030, N'B963', N'Hemophilus influenzae [H. influenzae] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1031, N'B964', N'Proteus (mirabilis) (morganii) as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1032, N'B965', N'Pseudomonas (aeruginosa) (mallei) (pseudomallei) as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1033, N'B966', N'Bacteroides fragilis [B. fragilis] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1034, N'B967', N'Clostridium perfringens [C. perfringens] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1035, N'B9681', N'Helicobacter pylori [H. pylori] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1036, N'B9682', N'Vibrio vulnificus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1037, N'B9689', N'Other specified bacterial agents as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1038, N'B970', N'Adenovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1039, N'B9710', N'Unspecified enterovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1040, N'B9711', N'Coxsackievirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1041, N'B9712', N'Echovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1042, N'B9719', N'Other enterovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1043, N'B9721', N'SARS-associated coronavirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1044, N'B9729', N'Other coronavirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1045, N'B9730', N'Unspecified retrovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1046, N'B9731', N'Lentivirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1047, N'B9732', N'Oncovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1048, N'B9733', N'Human T-cell lymphotrophic virus, type I [HTLV-I] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1049, N'B9734', N'Human T-cell lymphotrophic virus, type II [HTLV-II] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1050, N'B9735', N'Human immunodeficiency virus, type 2 [HIV 2] as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1051, N'B9739', N'Other retrovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1052, N'B974', N'Respiratory syncytial virus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1053, N'B975', N'Reovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1054, N'B976', N'Parvovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1055, N'B977', N'Papillomavirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1056, N'B9781', N'Human metapneumovirus as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1057, N'B9789', N'Other viral agents as the cause of diseases classified elsewhere')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1058, N'B998', N'Other infectious disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1059, N'B999', N'Unspecified infectious disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1060, N'C000', N'Malignant neoplasm of external upper lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1061, N'C001', N'Malignant neoplasm of external lower lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1062, N'C002', N'Malignant neoplasm of external lip, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1063, N'C003', N'Malignant neoplasm of upper lip, inner aspect')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1064, N'C004', N'Malignant neoplasm of lower lip, inner aspect')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1065, N'C005', N'Malignant neoplasm of lip, unspecified, inner aspect')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1066, N'C006', N'Malignant neoplasm of commissure of lip, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1067, N'C008', N'Malignant neoplasm of overlapping sites of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1068, N'C009', N'Malignant neoplasm of lip, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1069, N'C01', N'Malignant neoplasm of base of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1070, N'C020', N'Malignant neoplasm of dorsal surface of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1071, N'C021', N'Malignant neoplasm of border of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1072, N'C022', N'Malignant neoplasm of ventral surface of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1073, N'C023', N'Malignant neoplasm of anterior two-thirds of tongue, part unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1074, N'C024', N'Malignant neoplasm of lingual tonsil')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1075, N'C028', N'Malignant neoplasm of overlapping sites of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1076, N'C029', N'Malignant neoplasm of tongue, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1077, N'C030', N'Malignant neoplasm of upper gum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1078, N'C031', N'Malignant neoplasm of lower gum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1079, N'C039', N'Malignant neoplasm of gum, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1080, N'C040', N'Malignant neoplasm of anterior floor of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1081, N'C041', N'Malignant neoplasm of lateral floor of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1082, N'C048', N'Malignant neoplasm of overlapping sites of floor of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1083, N'C049', N'Malignant neoplasm of floor of mouth, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1084, N'C050', N'Malignant neoplasm of hard palate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1085, N'C051', N'Malignant neoplasm of soft palate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1086, N'C052', N'Malignant neoplasm of uvula')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1087, N'C058', N'Malignant neoplasm of overlapping sites of palate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1088, N'C059', N'Malignant neoplasm of palate, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1089, N'C060', N'Malignant neoplasm of cheek mucosa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1090, N'C061', N'Malignant neoplasm of vestibule of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1091, N'C062', N'Malignant neoplasm of retromolar area')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1092, N'C0680', N'Malignant neoplasm of overlapping sites of unspecified parts of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1093, N'C0689', N'Malignant neoplasm of overlapping sites of other parts of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1094, N'C069', N'Malignant neoplasm of mouth, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1095, N'C07', N'Malignant neoplasm of parotid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1096, N'C080', N'Malignant neoplasm of submandibular gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1097, N'C081', N'Malignant neoplasm of sublingual gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1098, N'C089', N'Malignant neoplasm of major salivary gland, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1099, N'C090', N'Malignant neoplasm of tonsillar fossa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1100, N'C091', N'Malignant neoplasm of tonsillar pillar (anterior) (posterior)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1101, N'C098', N'Malignant neoplasm of overlapping sites of tonsil')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1102, N'C099', N'Malignant neoplasm of tonsil, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1103, N'C100', N'Malignant neoplasm of vallecula')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1104, N'C101', N'Malignant neoplasm of anterior surface of epiglottis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1105, N'C102', N'Malignant neoplasm of lateral wall of oropharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1106, N'C103', N'Malignant neoplasm of posterior wall of oropharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1107, N'C104', N'Malignant neoplasm of branchial cleft')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1108, N'C108', N'Malignant neoplasm of overlapping sites of oropharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1109, N'C109', N'Malignant neoplasm of oropharynx, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1110, N'C110', N'Malignant neoplasm of superior wall of nasopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1111, N'C111', N'Malignant neoplasm of posterior wall of nasopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1112, N'C112', N'Malignant neoplasm of lateral wall of nasopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1113, N'C113', N'Malignant neoplasm of anterior wall of nasopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1114, N'C118', N'Malignant neoplasm of overlapping sites of nasopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1115, N'C119', N'Malignant neoplasm of nasopharynx, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1116, N'C12', N'Malignant neoplasm of pyriform sinus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1117, N'C130', N'Malignant neoplasm of postcricoid region')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1118, N'C131', N'Malignant neoplasm of aryepiglottic fold, hypopharyngeal aspect')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1119, N'C132', N'Malignant neoplasm of posterior wall of hypopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1120, N'C138', N'Malignant neoplasm of overlapping sites of hypopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1121, N'C139', N'Malignant neoplasm of hypopharynx, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1122, N'C140', N'Malignant neoplasm of pharynx, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1123, N'C142', N'Malignant neoplasm of Waldeyer"s ring')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1124, N'C148', N'Malignant neoplasm of overlapping sites of lip, oral cavity and pharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1125, N'C153', N'Malignant neoplasm of upper third of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1126, N'C154', N'Malignant neoplasm of middle third of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1127, N'C155', N'Malignant neoplasm of lower third of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1128, N'C158', N'Malignant neoplasm of overlapping sites of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1129, N'C159', N'Malignant neoplasm of esophagus, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1130, N'C160', N'Malignant neoplasm of cardia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1131, N'C161', N'Malignant neoplasm of fundus of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1132, N'C162', N'Malignant neoplasm of body of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1133, N'C163', N'Malignant neoplasm of pyloric antrum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1134, N'C164', N'Malignant neoplasm of pylorus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1135, N'C165', N'Malignant neoplasm of lesser curvature of stomach, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1136, N'C166', N'Malignant neoplasm of greater curvature of stomach, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1137, N'C168', N'Malignant neoplasm of overlapping sites of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1138, N'C169', N'Malignant neoplasm of stomach, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1139, N'C170', N'Malignant neoplasm of duodenum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1140, N'C171', N'Malignant neoplasm of jejunum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1141, N'C172', N'Malignant neoplasm of ileum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1142, N'C173', N'Meckels diverticulum, malignant')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1143, N'C178', N'Malignant neoplasm of overlapping sites of small intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1144, N'C179', N'Malignant neoplasm of small intestine, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1145, N'C180', N'Malignant neoplasm of cecum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1146, N'C181', N'Malignant neoplasm of appendix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1147, N'C182', N'Malignant neoplasm of ascending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1148, N'C183', N'Malignant neoplasm of hepatic flexure')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1149, N'C184', N'Malignant neoplasm of transverse colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1150, N'C185', N'Malignant neoplasm of splenic flexure')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1151, N'C186', N'Malignant neoplasm of descending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1152, N'C187', N'Malignant neoplasm of sigmoid colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1153, N'C188', N'Malignant neoplasm of overlapping sites of colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1154, N'C189', N'Malignant neoplasm of colon, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1155, N'C19', N'Malignant neoplasm of rectosigmoid junction')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1156, N'C20', N'Malignant neoplasm of rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1157, N'C210', N'Malignant neoplasm of anus, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1158, N'C211', N'Malignant neoplasm of anal canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1159, N'C212', N'Malignant neoplasm of cloacogenic zone')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1160, N'C218', N'Malignant neoplasm of overlapping sites of rectum, anus and anal canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1161, N'C220', N'Liver cell carcinoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1162, N'C221', N'Intrahepatic bile duct carcinoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1163, N'C222', N'Hepatoblastoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1164, N'C223', N'Angiosarcoma of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1165, N'C224', N'Other sarcomas of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1166, N'C227', N'Other specified carcinomas of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1167, N'C228', N'Malignant neoplasm of liver, primary, unspecified as to type')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1168, N'C229', N'Malignant neoplasm of liver, not specified as primary or secondary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1169, N'C23', N'Malignant neoplasm of gallbladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1170, N'C240', N'Malignant neoplasm of extrahepatic bile duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1171, N'C241', N'Malignant neoplasm of ampulla of Vater')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1172, N'C248', N'Malignant neoplasm of overlapping sites of biliary tract')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1173, N'C249', N'Malignant neoplasm of biliary tract, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1174, N'C250', N'Malignant neoplasm of head of pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1175, N'C251', N'Malignant neoplasm of body of pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1176, N'C252', N'Malignant neoplasm of tail of pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1177, N'C253', N'Malignant neoplasm of pancreatic duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1178, N'C254', N'Malignant neoplasm of endocrine pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1179, N'C257', N'Malignant neoplasm of other parts of pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1180, N'C258', N'Malignant neoplasm of overlapping sites of pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1181, N'C259', N'Malignant neoplasm of pancreas, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1182, N'C260', N'Malignant neoplasm of intestinal tract, part unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1183, N'C261', N'Malignant neoplasm of spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1184, N'C269', N'Malignant neoplasm of ill-defined sites within the digestive system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1185, N'C300', N'Malignant neoplasm of nasal cavity')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1186, N'C301', N'Malignant neoplasm of middle ear')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1187, N'C310', N'Malignant neoplasm of maxillary sinus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1188, N'C311', N'Malignant neoplasm of ethmoidal sinus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1189, N'C312', N'Malignant neoplasm of frontal sinus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1190, N'C313', N'Malignant neoplasm of sphenoid sinus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1191, N'C318', N'Malignant neoplasm of overlapping sites of accessory sinuses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1192, N'C319', N'Malignant neoplasm of accessory sinus, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1193, N'C320', N'Malignant neoplasm of glottis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1194, N'C321', N'Malignant neoplasm of supraglottis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1195, N'C322', N'Malignant neoplasm of subglottis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1196, N'C323', N'Malignant neoplasm of laryngeal cartilage')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1197, N'C328', N'Malignant neoplasm of overlapping sites of larynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1198, N'C329', N'Malignant neoplasm of larynx, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1199, N'C33', N'Malignant neoplasm of trachea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1200, N'C3400', N'Malignant neoplasm of unspecified main bronchus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1201, N'C3401', N'Malignant neoplasm of right main bronchus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1202, N'C3402', N'Malignant neoplasm of left main bronchus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1203, N'C3410', N'Malignant neoplasm of upper lobe, unspecified bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1204, N'C3411', N'Malignant neoplasm of upper lobe, right bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1205, N'C3412', N'Malignant neoplasm of upper lobe, left bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1206, N'C342', N'Malignant neoplasm of middle lobe, bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1207, N'C3430', N'Malignant neoplasm of lower lobe, unspecified bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1208, N'C3431', N'Malignant neoplasm of lower lobe, right bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1209, N'C3432', N'Malignant neoplasm of lower lobe, left bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1210, N'C3480', N'Malignant neoplasm of overlapping sites of unspecified bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1211, N'C3481', N'Malignant neoplasm of overlapping sites of right bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1212, N'C3482', N'Malignant neoplasm of overlapping sites of left bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1213, N'C3490', N'Malignant neoplasm of unspecified part of unspecified bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1214, N'C3491', N'Malignant neoplasm of unspecified part of right bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1215, N'C3492', N'Malignant neoplasm of unspecified part of left bronchus or lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1216, N'C37', N'Malignant neoplasm of thymus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1217, N'C380', N'Malignant neoplasm of heart')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1218, N'C381', N'Malignant neoplasm of anterior mediastinum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1219, N'C382', N'Malignant neoplasm of posterior mediastinum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1220, N'C383', N'Malignant neoplasm of mediastinum, part unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1221, N'C384', N'Malignant neoplasm of pleura')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1222, N'C388', N'Malignant neoplasm of overlapping sites of heart, mediastinum and pleura')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1223, N'C390', N'Malignant neoplasm of upper respiratory tract, part unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1224, N'C399', N'Malignant neoplasm of lower respiratory tract, part unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1225, N'C4000', N'Malignant neoplasm of scapula and long bones of unspecified upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1226, N'C4001', N'Malignant neoplasm of scapula and long bones of right upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1227, N'C4002', N'Malignant neoplasm of scapula and long bones of left upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1228, N'C4010', N'Malignant neoplasm of short bones of unspecified upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1229, N'C4011', N'Malignant neoplasm of short bones of right upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1230, N'C4012', N'Malignant neoplasm of short bones of left upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1231, N'C4020', N'Malignant neoplasm of long bones of unspecified lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1232, N'C4021', N'Malignant neoplasm of long bones of right lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1233, N'C4022', N'Malignant neoplasm of long bones of left lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1234, N'C4030', N'Malignant neoplasm of short bones of unspecified lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1235, N'C4031', N'Malignant neoplasm of short bones of right lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1236, N'C4032', N'Malignant neoplasm of short bones of left lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1237, N'C4080', N'Malignant neoplasm of overlapping sites of bone and articular cartilage of unspecified limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1238, N'C4081', N'Malignant neoplasm of overlapping sites of bone and articular cartilage of right limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1239, N'C4082', N'Malignant neoplasm of overlapping sites of bone and articular cartilage of left limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1240, N'C4090', N'Malignant neoplasm of unspecified bones and articular cartilage of unspecified limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1241, N'C4091', N'Malignant neoplasm of unspecified bones and articular cartilage of right limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1242, N'C4092', N'Malignant neoplasm of unspecified bones and articular cartilage of left limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1243, N'C410', N'Malignant neoplasm of bones of skull and face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1244, N'C411', N'Malignant neoplasm of mandible')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1245, N'C412', N'Malignant neoplasm of vertebral column')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1246, N'C413', N'Malignant neoplasm of ribs, sternum and clavicle')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1247, N'C414', N'Malignant neoplasm of pelvic bones, sacrum and coccyx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1248, N'C419', N'Malignant neoplasm of bone and articular cartilage, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1249, N'C430', N'Malignant melanoma of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1250, N'C4310', N'Malignant melanoma of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1251, N'C4311', N'Malignant melanoma of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1252, N'C4312', N'Malignant melanoma of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1253, N'C4320', N'Malignant melanoma of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1254, N'C4321', N'Malignant melanoma of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1255, N'C4322', N'Malignant melanoma of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1256, N'C4330', N'Malignant melanoma of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1257, N'C4331', N'Malignant melanoma of nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1258, N'C4339', N'Malignant melanoma of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1259, N'C434', N'Malignant melanoma of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1260, N'C4351', N'Malignant melanoma of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1261, N'C4352', N'Malignant melanoma of skin of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1262, N'C4359', N'Malignant melanoma of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1263, N'C4360', N'Malignant melanoma of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1264, N'C4361', N'Malignant melanoma of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1265, N'C4362', N'Malignant melanoma of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1266, N'C4370', N'Malignant melanoma of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1267, N'C4371', N'Malignant melanoma of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1268, N'C4372', N'Malignant melanoma of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1269, N'C438', N'Malignant melanoma of overlapping sites of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1270, N'C439', N'Malignant melanoma of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1271, N'C4400', N'Unspecified malignant neoplasm of skin of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1272, N'C4401', N'Basal cell carcinoma of skin of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1273, N'C4402', N'Squamous cell carcinoma of skin of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1274, N'C4409', N'Other specified malignant neoplasm of skin of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1275, N'C44101', N'Unspecified malignant neoplasm of skin of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1276, N'C44102', N'Unspecified malignant neoplasm of skin of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1277, N'C44109', N'Unspecified malignant neoplasm of skin of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1278, N'C44111', N'Basal cell carcinoma of skin of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1279, N'C44112', N'Basal cell carcinoma of skin of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1280, N'C44119', N'Basal cell carcinoma of skin of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1281, N'C44121', N'Squamous cell carcinoma of skin of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1282, N'C44122', N'Squamous cell carcinoma of skin of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1283, N'C44129', N'Squamous cell carcinoma of skin of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1284, N'C44191', N'Other specified malignant neoplasm of skin of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1285, N'C44192', N'Other specified malignant neoplasm of skin of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1286, N'C44199', N'Other specified malignant neoplasm of skin of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1287, N'C44201', N'Unspecified malignant neoplasm of skin of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1288, N'C44202', N'Unspecified malignant neoplasm of skin of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1289, N'C44209', N'Unspecified malignant neoplasm of skin of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1290, N'C44211', N'Basal cell carcinoma of skin of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1291, N'C44212', N'Basal cell carcinoma of skin of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1292, N'C44219', N'Basal cell carcinoma of skin of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1293, N'C44221', N'Squamous cell carcinoma of skin of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1294, N'C44222', N'Squamous cell carcinoma of skin of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1295, N'C44229', N'Squamous cell carcinoma of skin of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1296, N'C44291', N'Other specified malignant neoplasm of skin of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1297, N'C44292', N'Other specified malignant neoplasm of skin of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1298, N'C44299', N'Other specified malignant neoplasm of skin of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1299, N'C44300', N'Unspecified malignant neoplasm of skin of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1300, N'C44301', N'Unspecified malignant neoplasm of skin of nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1301, N'C44309', N'Unspecified malignant neoplasm of skin of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1302, N'C44310', N'Basal cell carcinoma of skin of unspecified parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1303, N'C44311', N'Basal cell carcinoma of skin of nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1304, N'C44319', N'Basal cell carcinoma of skin of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1305, N'C44320', N'Squamous cell carcinoma of skin of unspecified parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1306, N'C44321', N'Squamous cell carcinoma of skin of nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1307, N'C44329', N'Squamous cell carcinoma of skin of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1308, N'C44390', N'Other specified malignant neoplasm of skin of unspecified parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1309, N'C44391', N'Other specified malignant neoplasm of skin of nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1310, N'C44399', N'Other specified malignant neoplasm of skin of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1311, N'C4440', N'Unspecified malignant neoplasm of skin of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1312, N'C4441', N'Basal cell carcinoma of skin of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1313, N'C4442', N'Squamous cell carcinoma of skin of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1314, N'C4449', N'Other specified malignant neoplasm of skin of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1315, N'C44500', N'Unspecified malignant neoplasm of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1316, N'C44501', N'Unspecified malignant neoplasm of skin of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1317, N'C44509', N'Unspecified malignant neoplasm of skin of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1318, N'C44510', N'Basal cell carcinoma of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1319, N'C44511', N'Basal cell carcinoma of skin of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1320, N'C44519', N'Basal cell carcinoma of skin of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1321, N'C44520', N'Squamous cell carcinoma of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1322, N'C44521', N'Squamous cell carcinoma of skin of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1323, N'C44529', N'Squamous cell carcinoma of skin of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1324, N'C44590', N'Other specified malignant neoplasm of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1325, N'C44591', N'Other specified malignant neoplasm of skin of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1326, N'C44599', N'Other specified malignant neoplasm of skin of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1327, N'C44601', N'Unspecified malignant neoplasm of skin of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1328, N'C44602', N'Unspecified malignant neoplasm of skin of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1329, N'C44609', N'Unspecified malignant neoplasm of skin of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1330, N'C44611', N'Basal cell carcinoma of skin of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1331, N'C44612', N'Basal cell carcinoma of skin of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1332, N'C44619', N'Basal cell carcinoma of skin of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1333, N'C44621', N'Squamous cell carcinoma of skin of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1334, N'C44622', N'Squamous cell carcinoma of skin of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1335, N'C44629', N'Squamous cell carcinoma of skin of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1336, N'C44691', N'Other specified malignant neoplasm of skin of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1337, N'C44692', N'Other specified malignant neoplasm of skin of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1338, N'C44699', N'Other specified malignant neoplasm of skin of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1339, N'C44701', N'Unspecified malignant neoplasm of skin of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1340, N'C44702', N'Unspecified malignant neoplasm of skin of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1341, N'C44709', N'Unspecified malignant neoplasm of skin of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1342, N'C44711', N'Basal cell carcinoma of skin of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1343, N'C44712', N'Basal cell carcinoma of skin of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1344, N'C44719', N'Basal cell carcinoma of skin of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1345, N'C44721', N'Squamous cell carcinoma of skin of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1346, N'C44722', N'Squamous cell carcinoma of skin of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1347, N'C44729', N'Squamous cell carcinoma of skin of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1348, N'C44791', N'Other specified malignant neoplasm of skin of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1349, N'C44792', N'Other specified malignant neoplasm of skin of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1350, N'C44799', N'Other specified malignant neoplasm of skin of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1351, N'C4480', N'Unspecified malignant neoplasm of overlapping sites of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1352, N'C4481', N'Basal cell carcinoma of overlapping sites of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1353, N'C4482', N'Squamous cell carcinoma of overlapping sites of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1354, N'C4489', N'Other specified malignant neoplasm of overlapping sites of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1355, N'C4490', N'Unspecified malignant neoplasm of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1356, N'C4491', N'Basal cell carcinoma of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1357, N'C4492', N'Squamous cell carcinoma of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1358, N'C4499', N'Other specified malignant neoplasm of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1359, N'C450', N'Mesothelioma of pleura')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1360, N'C451', N'Mesothelioma of peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1361, N'C452', N'Mesothelioma of pericardium')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1362, N'C457', N'Mesothelioma of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1363, N'C459', N'Mesothelioma, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1364, N'C460', N'Kaposis sarcoma of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1365, N'C461', N'Kaposis sarcoma of soft tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1366, N'C462', N'Kaposis sarcoma of palate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1367, N'C463', N'Kaposis sarcoma of lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1368, N'C464', N'Kaposis sarcoma of gastrointestinal sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1369, N'C4650', N'Kaposis sarcoma of unspecified lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1370, N'C4651', N'Kaposis sarcoma of right lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1371, N'C4652', N'Kaposis sarcoma of left lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1372, N'C467', N'Kaposis sarcoma of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1373, N'C469', N'Kaposis sarcoma, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1374, N'C470', N'Malignant neoplasm of peripheral nerves of head, face and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1375, N'C4710', N'Malignant neoplasm of peripheral nerves of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1376, N'C4711', N'Malignant neoplasm of peripheral nerves of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1377, N'C4712', N'Malignant neoplasm of peripheral nerves of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1378, N'C4720', N'Malignant neoplasm of peripheral nerves of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1379, N'C4721', N'Malignant neoplasm of peripheral nerves of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1380, N'C4722', N'Malignant neoplasm of peripheral nerves of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1381, N'C473', N'Malignant neoplasm of peripheral nerves of thorax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1382, N'C474', N'Malignant neoplasm of peripheral nerves of abdomen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1383, N'C475', N'Malignant neoplasm of peripheral nerves of pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1384, N'C476', N'Malignant neoplasm of peripheral nerves of trunk, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1385, N'C478', N'Malignant neoplasm of overlapping sites of peripheral nerves and autonomic nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1386, N'C479', N'Malignant neoplasm of peripheral nerves and autonomic nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1387, N'C480', N'Malignant neoplasm of retroperitoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1388, N'C481', N'Malignant neoplasm of specified parts of peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1389, N'C482', N'Malignant neoplasm of peritoneum, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1390, N'C488', N'Malignant neoplasm of overlapping sites of retroperitoneum and peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1391, N'C490', N'Malignant neoplasm of connective and soft tissue of head, face and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1392, N'C4910', N'Malignant neoplasm of connective and soft tissue of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1393, N'C4911', N'Malignant neoplasm of connective and soft tissue of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1394, N'C4912', N'Malignant neoplasm of connective and soft tissue of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1395, N'C4920', N'Malignant neoplasm of connective and soft tissue of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1396, N'C4921', N'Malignant neoplasm of connective and soft tissue of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1397, N'C4922', N'Malignant neoplasm of connective and soft tissue of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1398, N'C493', N'Malignant neoplasm of connective and soft tissue of thorax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1399, N'C494', N'Malignant neoplasm of connective and soft tissue of abdomen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1400, N'C495', N'Malignant neoplasm of connective and soft tissue of pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1401, N'C496', N'Malignant neoplasm of connective and soft tissue of trunk, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1402, N'C498', N'Malignant neoplasm of overlapping sites of connective and soft tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1403, N'C499', N'Malignant neoplasm of connective and soft tissue, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1404, N'C49A0', N'Gastrointestinal stromal tumor, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1405, N'C49A1', N'Gastrointestinal stromal tumor of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1406, N'C49A2', N'Gastrointestinal stromal tumor of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1407, N'C49A3', N'Gastrointestinal stromal tumor of small intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1408, N'C49A4', N'Gastrointestinal stromal tumor of large intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1409, N'C49A5', N'Gastrointestinal stromal tumor of rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1410, N'C49A9', N'Gastrointestinal stromal tumor of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1411, N'C4A0', N'Merkel cell carcinoma of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1412, N'C4A10', N'Merkel cell carcinoma of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1413, N'C4A11', N'Merkel cell carcinoma of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1414, N'C4A12', N'Merkel cell carcinoma of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1415, N'C4A20', N'Merkel cell carcinoma of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1416, N'C4A21', N'Merkel cell carcinoma of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1417, N'C4A22', N'Merkel cell carcinoma of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1418, N'C4A30', N'Merkel cell carcinoma of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1419, N'C4A31', N'Merkel cell carcinoma of nose')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1420, N'C4A39', N'Merkel cell carcinoma of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1421, N'C4A4', N'Merkel cell carcinoma of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1422, N'C4A51', N'Merkel cell carcinoma of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1423, N'C4A52', N'Merkel cell carcinoma of skin of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1424, N'C4A59', N'Merkel cell carcinoma of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1425, N'C4A60', N'Merkel cell carcinoma of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1426, N'C4A61', N'Merkel cell carcinoma of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1427, N'C4A62', N'Merkel cell carcinoma of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1428, N'C4A70', N'Merkel cell carcinoma of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1429, N'C4A71', N'Merkel cell carcinoma of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1430, N'C4A72', N'Merkel cell carcinoma of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1431, N'C4A8', N'Merkel cell carcinoma of overlapping sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1432, N'C4A9', N'Merkel cell carcinoma, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1433, N'C50011', N'Malignant neoplasm of nipple and areola, right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1434, N'C50012', N'Malignant neoplasm of nipple and areola, left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1435, N'C50019', N'Malignant neoplasm of nipple and areola, unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1436, N'C50021', N'Malignant neoplasm of nipple and areola, right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1437, N'C50022', N'Malignant neoplasm of nipple and areola, left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1438, N'C50029', N'Malignant neoplasm of nipple and areola, unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1439, N'C50111', N'Malignant neoplasm of central portion of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1440, N'C50112', N'Malignant neoplasm of central portion of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1441, N'C50119', N'Malignant neoplasm of central portion of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1442, N'C50121', N'Malignant neoplasm of central portion of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1443, N'C50122', N'Malignant neoplasm of central portion of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1444, N'C50129', N'Malignant neoplasm of central portion of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1445, N'C50211', N'Malignant neoplasm of upper-inner quadrant of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1446, N'C50212', N'Malignant neoplasm of upper-inner quadrant of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1447, N'C50219', N'Malignant neoplasm of upper-inner quadrant of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1448, N'C50221', N'Malignant neoplasm of upper-inner quadrant of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1449, N'C50222', N'Malignant neoplasm of upper-inner quadrant of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1450, N'C50229', N'Malignant neoplasm of upper-inner quadrant of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1451, N'C50311', N'Malignant neoplasm of lower-inner quadrant of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1452, N'C50312', N'Malignant neoplasm of lower-inner quadrant of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1453, N'C50319', N'Malignant neoplasm of lower-inner quadrant of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1454, N'C50321', N'Malignant neoplasm of lower-inner quadrant of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1455, N'C50322', N'Malignant neoplasm of lower-inner quadrant of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1456, N'C50329', N'Malignant neoplasm of lower-inner quadrant of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1457, N'C50411', N'Malignant neoplasm of upper-outer quadrant of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1458, N'C50412', N'Malignant neoplasm of upper-outer quadrant of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1459, N'C50419', N'Malignant neoplasm of upper-outer quadrant of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1460, N'C50421', N'Malignant neoplasm of upper-outer quadrant of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1461, N'C50422', N'Malignant neoplasm of upper-outer quadrant of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1462, N'C50429', N'Malignant neoplasm of upper-outer quadrant of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1463, N'C50511', N'Malignant neoplasm of lower-outer quadrant of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1464, N'C50512', N'Malignant neoplasm of lower-outer quadrant of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1465, N'C50519', N'Malignant neoplasm of lower-outer quadrant of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1466, N'C50521', N'Malignant neoplasm of lower-outer quadrant of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1467, N'C50522', N'Malignant neoplasm of lower-outer quadrant of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1468, N'C50529', N'Malignant neoplasm of lower-outer quadrant of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1469, N'C50611', N'Malignant neoplasm of axillary tail of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1470, N'C50612', N'Malignant neoplasm of axillary tail of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1471, N'C50619', N'Malignant neoplasm of axillary tail of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1472, N'C50621', N'Malignant neoplasm of axillary tail of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1473, N'C50622', N'Malignant neoplasm of axillary tail of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1474, N'C50629', N'Malignant neoplasm of axillary tail of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1475, N'C50811', N'Malignant neoplasm of overlapping sites of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1476, N'C50812', N'Malignant neoplasm of overlapping sites of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1477, N'C50819', N'Malignant neoplasm of overlapping sites of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1478, N'C50821', N'Malignant neoplasm of overlapping sites of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1479, N'C50822', N'Malignant neoplasm of overlapping sites of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1480, N'C50829', N'Malignant neoplasm of overlapping sites of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1481, N'C50911', N'Malignant neoplasm of unspecified site of right female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1482, N'C50912', N'Malignant neoplasm of unspecified site of left female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1483, N'C50919', N'Malignant neoplasm of unspecified site of unspecified female breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1484, N'C50921', N'Malignant neoplasm of unspecified site of right male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1485, N'C50922', N'Malignant neoplasm of unspecified site of left male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1486, N'C50929', N'Malignant neoplasm of unspecified site of unspecified male breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1487, N'C510', N'Malignant neoplasm of labium majus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1488, N'C511', N'Malignant neoplasm of labium minus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1489, N'C512', N'Malignant neoplasm of clitoris')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1490, N'C518', N'Malignant neoplasm of overlapping sites of vulva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1491, N'C519', N'Malignant neoplasm of vulva, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1492, N'C52', N'Malignant neoplasm of vagina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1493, N'C530', N'Malignant neoplasm of endocervix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1494, N'C531', N'Malignant neoplasm of exocervix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1495, N'C538', N'Malignant neoplasm of overlapping sites of cervix uteri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1496, N'C539', N'Malignant neoplasm of cervix uteri, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1497, N'C540', N'Malignant neoplasm of isthmus uteri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1498, N'C541', N'Malignant neoplasm of endometrium')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1499, N'C542', N'Malignant neoplasm of myometrium')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1500, N'C543', N'Malignant neoplasm of fundus uteri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1501, N'C548', N'Malignant neoplasm of overlapping sites of corpus uteri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1502, N'C549', N'Malignant neoplasm of corpus uteri, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1503, N'C55', N'Malignant neoplasm of uterus, part unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1504, N'C561', N'Malignant neoplasm of right ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1505, N'C562', N'Malignant neoplasm of left ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1506, N'C569', N'Malignant neoplasm of unspecified ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1507, N'C5700', N'Malignant neoplasm of unspecified fallopian tube')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1508, N'C5701', N'Malignant neoplasm of right fallopian tube')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1509, N'C5702', N'Malignant neoplasm of left fallopian tube')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1510, N'C5710', N'Malignant neoplasm of unspecified broad ligament')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1511, N'C5711', N'Malignant neoplasm of right broad ligament')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1512, N'C5712', N'Malignant neoplasm of left broad ligament')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1513, N'C5720', N'Malignant neoplasm of unspecified round ligament')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1514, N'C5721', N'Malignant neoplasm of right round ligament')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1515, N'C5722', N'Malignant neoplasm of left round ligament')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1516, N'C573', N'Malignant neoplasm of parametrium')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1517, N'C574', N'Malignant neoplasm of uterine adnexa, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1518, N'C577', N'Malignant neoplasm of other specified female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1519, N'C578', N'Malignant neoplasm of overlapping sites of female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1520, N'C579', N'Malignant neoplasm of female genital organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1521, N'C58', N'Malignant neoplasm of placenta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1522, N'C600', N'Malignant neoplasm of prepuce')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1523, N'C601', N'Malignant neoplasm of glans penis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1524, N'C602', N'Malignant neoplasm of body of penis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1525, N'C608', N'Malignant neoplasm of overlapping sites of penis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1526, N'C609', N'Malignant neoplasm of penis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1527, N'C61', N'Malignant neoplasm of prostate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1528, N'C6200', N'Malignant neoplasm of unspecified undescended testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1529, N'C6201', N'Malignant neoplasm of undescended right testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1530, N'C6202', N'Malignant neoplasm of undescended left testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1531, N'C6210', N'Malignant neoplasm of unspecified descended testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1532, N'C6211', N'Malignant neoplasm of descended right testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1533, N'C6212', N'Malignant neoplasm of descended left testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1534, N'C6290', N'Malignant neoplasm of unspecified testis, unspecified whether descended or undescended')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1535, N'C6291', N'Malignant neoplasm of right testis, unspecified whether descended or undescended')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1536, N'C6292', N'Malignant neoplasm of left testis, unspecified whether descended or undescended')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1537, N'C6300', N'Malignant neoplasm of unspecified epididymis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1538, N'C6301', N'Malignant neoplasm of right epididymis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1539, N'C6302', N'Malignant neoplasm of left epididymis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1540, N'C6310', N'Malignant neoplasm of unspecified spermatic cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1541, N'C6311', N'Malignant neoplasm of right spermatic cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1542, N'C6312', N'Malignant neoplasm of left spermatic cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1543, N'C632', N'Malignant neoplasm of scrotum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1544, N'C637', N'Malignant neoplasm of other specified male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1545, N'C638', N'Malignant neoplasm of overlapping sites of male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1546, N'C639', N'Malignant neoplasm of male genital organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1547, N'C641', N'Malignant neoplasm of right kidney, except renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1548, N'C642', N'Malignant neoplasm of left kidney, except renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1549, N'C649', N'Malignant neoplasm of unspecified kidney, except renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1550, N'C651', N'Malignant neoplasm of right renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1551, N'C652', N'Malignant neoplasm of left renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1552, N'C659', N'Malignant neoplasm of unspecified renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1553, N'C661', N'Malignant neoplasm of right ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1554, N'C662', N'Malignant neoplasm of left ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1555, N'C669', N'Malignant neoplasm of unspecified ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1556, N'C670', N'Malignant neoplasm of trigone of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1557, N'C671', N'Malignant neoplasm of dome of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1558, N'C672', N'Malignant neoplasm of lateral wall of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1559, N'C673', N'Malignant neoplasm of anterior wall of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1560, N'C674', N'Malignant neoplasm of posterior wall of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1561, N'C675', N'Malignant neoplasm of bladder neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1562, N'C676', N'Malignant neoplasm of ureteric orifice')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1563, N'C677', N'Malignant neoplasm of urachus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1564, N'C678', N'Malignant neoplasm of overlapping sites of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1565, N'C679', N'Malignant neoplasm of bladder, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1566, N'C680', N'Malignant neoplasm of urethra')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1567, N'C681', N'Malignant neoplasm of paraurethral glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1568, N'C688', N'Malignant neoplasm of overlapping sites of urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1569, N'C689', N'Malignant neoplasm of urinary organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1570, N'C6900', N'Malignant neoplasm of unspecified conjunctiva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1571, N'C6901', N'Malignant neoplasm of right conjunctiva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1572, N'C6902', N'Malignant neoplasm of left conjunctiva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1573, N'C6910', N'Malignant neoplasm of unspecified cornea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1574, N'C6911', N'Malignant neoplasm of right cornea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1575, N'C6912', N'Malignant neoplasm of left cornea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1576, N'C6920', N'Malignant neoplasm of unspecified retina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1577, N'C6921', N'Malignant neoplasm of right retina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1578, N'C6922', N'Malignant neoplasm of left retina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1579, N'C6930', N'Malignant neoplasm of unspecified choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1580, N'C6931', N'Malignant neoplasm of right choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1581, N'C6932', N'Malignant neoplasm of left choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1582, N'C6940', N'Malignant neoplasm of unspecified ciliary body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1583, N'C6941', N'Malignant neoplasm of right ciliary body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1584, N'C6942', N'Malignant neoplasm of left ciliary body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1585, N'C6950', N'Malignant neoplasm of unspecified lacrimal gland and duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1586, N'C6951', N'Malignant neoplasm of right lacrimal gland and duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1587, N'C6952', N'Malignant neoplasm of left lacrimal gland and duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1588, N'C6960', N'Malignant neoplasm of unspecified orbit')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1589, N'C6961', N'Malignant neoplasm of right orbit')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1590, N'C6962', N'Malignant neoplasm of left orbit')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1591, N'C6980', N'Malignant neoplasm of overlapping sites of unspecified eye and adnexa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1592, N'C6981', N'Malignant neoplasm of overlapping sites of right eye and adnexa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1593, N'C6982', N'Malignant neoplasm of overlapping sites of left eye and adnexa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1594, N'C6990', N'Malignant neoplasm of unspecified site of unspecified eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1595, N'C6991', N'Malignant neoplasm of unspecified site of right eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1596, N'C6992', N'Malignant neoplasm of unspecified site of left eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1597, N'C700', N'Malignant neoplasm of cerebral meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1598, N'C701', N'Malignant neoplasm of spinal meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1599, N'C709', N'Malignant neoplasm of meninges, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1600, N'C710', N'Malignant neoplasm of cerebrum, except lobes and ventricles')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1601, N'C711', N'Malignant neoplasm of frontal lobe')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1602, N'C712', N'Malignant neoplasm of temporal lobe')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1603, N'C713', N'Malignant neoplasm of parietal lobe')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1604, N'C714', N'Malignant neoplasm of occipital lobe')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1605, N'C715', N'Malignant neoplasm of cerebral ventricle')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1606, N'C716', N'Malignant neoplasm of cerebellum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1607, N'C717', N'Malignant neoplasm of brain stem')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1608, N'C718', N'Malignant neoplasm of overlapping sites of brain')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1609, N'C719', N'Malignant neoplasm of brain, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1610, N'C720', N'Malignant neoplasm of spinal cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1611, N'C721', N'Malignant neoplasm of cauda equina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1612, N'C7220', N'Malignant neoplasm of unspecified olfactory nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1613, N'C7221', N'Malignant neoplasm of right olfactory nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1614, N'C7222', N'Malignant neoplasm of left olfactory nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1615, N'C7230', N'Malignant neoplasm of unspecified optic nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1616, N'C7231', N'Malignant neoplasm of right optic nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1617, N'C7232', N'Malignant neoplasm of left optic nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1618, N'C7240', N'Malignant neoplasm of unspecified acoustic nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1619, N'C7241', N'Malignant neoplasm of right acoustic nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1620, N'C7242', N'Malignant neoplasm of left acoustic nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1621, N'C7250', N'Malignant neoplasm of unspecified cranial nerve')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1622, N'C7259', N'Malignant neoplasm of other cranial nerves')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1623, N'C729', N'Malignant neoplasm of central nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1624, N'C73', N'Malignant neoplasm of thyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1625, N'C7400', N'Malignant neoplasm of cortex of unspecified adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1626, N'C7401', N'Malignant neoplasm of cortex of right adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1627, N'C7402', N'Malignant neoplasm of cortex of left adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1628, N'C7410', N'Malignant neoplasm of medulla of unspecified adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1629, N'C7411', N'Malignant neoplasm of medulla of right adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1630, N'C7412', N'Malignant neoplasm of medulla of left adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1631, N'C7490', N'Malignant neoplasm of unspecified part of unspecified adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1632, N'C7491', N'Malignant neoplasm of unspecified part of right adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1633, N'C7492', N'Malignant neoplasm of unspecified part of left adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1634, N'C750', N'Malignant neoplasm of parathyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1635, N'C751', N'Malignant neoplasm of pituitary gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1636, N'C752', N'Malignant neoplasm of craniopharyngeal duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1637, N'C753', N'Malignant neoplasm of pineal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1638, N'C754', N'Malignant neoplasm of carotid body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1639, N'C755', N'Malignant neoplasm of aortic body and other paraganglia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1640, N'C758', N'Malignant neoplasm with pluriglandular involvement, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1641, N'C759', N'Malignant neoplasm of endocrine gland, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1642, N'C760', N'Malignant neoplasm of head, face and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1643, N'C761', N'Malignant neoplasm of thorax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1644, N'C762', N'Malignant neoplasm of abdomen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1645, N'C763', N'Malignant neoplasm of pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1646, N'C7640', N'Malignant neoplasm of unspecified upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1647, N'C7641', N'Malignant neoplasm of right upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1648, N'C7642', N'Malignant neoplasm of left upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1649, N'C7650', N'Malignant neoplasm of unspecified lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1650, N'C7651', N'Malignant neoplasm of right lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1651, N'C7652', N'Malignant neoplasm of left lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1652, N'C768', N'Malignant neoplasm of other specified ill-defined sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1653, N'C770', N'Secondary and unspecified malignant neoplasm of lymph nodes of head, face and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1654, N'C771', N'Secondary and unspecified malignant neoplasm of intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1655, N'C772', N'Secondary and unspecified malignant neoplasm of intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1656, N'C773', N'Secondary and unspecified malignant neoplasm of axilla and upper limb lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1657, N'C774', N'Secondary and unspecified malignant neoplasm of inguinal and lower limb lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1658, N'C775', N'Secondary and unspecified malignant neoplasm of intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1659, N'C778', N'Secondary and unspecified malignant neoplasm of lymph nodes of multiple regions')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1660, N'C779', N'Secondary and unspecified malignant neoplasm of lymph node, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1661, N'C7800', N'Secondary malignant neoplasm of unspecified lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1662, N'C7801', N'Secondary malignant neoplasm of right lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1663, N'C7802', N'Secondary malignant neoplasm of left lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1664, N'C781', N'Secondary malignant neoplasm of mediastinum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1665, N'C782', N'Secondary malignant neoplasm of pleura')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1666, N'C7830', N'Secondary malignant neoplasm of unspecified respiratory organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1667, N'C7839', N'Secondary malignant neoplasm of other respiratory organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1668, N'C784', N'Secondary malignant neoplasm of small intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1669, N'C785', N'Secondary malignant neoplasm of large intestine and rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1670, N'C786', N'Secondary malignant neoplasm of retroperitoneum and peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1671, N'C787', N'Secondary malignant neoplasm of liver and intrahepatic bile duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1672, N'C7880', N'Secondary malignant neoplasm of unspecified digestive organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1673, N'C7889', N'Secondary malignant neoplasm of other digestive organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1674, N'C7900', N'Secondary malignant neoplasm of unspecified kidney and renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1675, N'C7901', N'Secondary malignant neoplasm of right kidney and renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1676, N'C7902', N'Secondary malignant neoplasm of left kidney and renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1677, N'C7910', N'Secondary malignant neoplasm of unspecified urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1678, N'C7911', N'Secondary malignant neoplasm of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1679, N'C7919', N'Secondary malignant neoplasm of other urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1680, N'C792', N'Secondary malignant neoplasm of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1681, N'C7931', N'Secondary malignant neoplasm of brain')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1682, N'C7932', N'Secondary malignant neoplasm of cerebral meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1683, N'C7940', N'Secondary malignant neoplasm of unspecified part of nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1684, N'C7949', N'Secondary malignant neoplasm of other parts of nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1685, N'C7951', N'Secondary malignant neoplasm of bone')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1686, N'C7952', N'Secondary malignant neoplasm of bone marrow')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1687, N'C7960', N'Secondary malignant neoplasm of unspecified ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1688, N'C7961', N'Secondary malignant neoplasm of right ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1689, N'C7962', N'Secondary malignant neoplasm of left ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1690, N'C7970', N'Secondary malignant neoplasm of unspecified adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1691, N'C7971', N'Secondary malignant neoplasm of right adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1692, N'C7972', N'Secondary malignant neoplasm of left adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1693, N'C7981', N'Secondary malignant neoplasm of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1694, N'C7982', N'Secondary malignant neoplasm of genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1695, N'C7989', N'Secondary malignant neoplasm of other specified sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1696, N'C799', N'Secondary malignant neoplasm of unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1697, N'C7A00', N'Malignant carcinoid tumor of unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1698, N'C7A010', N'Malignant carcinoid tumor of the duodenum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1699, N'C7A011', N'Malignant carcinoid tumor of the jejunum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1700, N'C7A012', N'Malignant carcinoid tumor of the ileum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1701, N'C7A019', N'Malignant carcinoid tumor of the small intestine, unspecified portion')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1702, N'C7A020', N'Malignant carcinoid tumor of the appendix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1703, N'C7A021', N'Malignant carcinoid tumor of the cecum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1704, N'C7A022', N'Malignant carcinoid tumor of the ascending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1705, N'C7A023', N'Malignant carcinoid tumor of the transverse colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1706, N'C7A024', N'Malignant carcinoid tumor of the descending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1707, N'C7A025', N'Malignant carcinoid tumor of the sigmoid colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1708, N'C7A026', N'Malignant carcinoid tumor of the rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1709, N'C7A029', N'Malignant carcinoid tumor of the large intestine, unspecified portion')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1710, N'C7A090', N'Malignant carcinoid tumor of the bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1711, N'C7A091', N'Malignant carcinoid tumor of the thymus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1712, N'C7A092', N'Malignant carcinoid tumor of the stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1713, N'C7A093', N'Malignant carcinoid tumor of the kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1714, N'C7A094', N'Malignant carcinoid tumor of the foregut, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1715, N'C7A095', N'Malignant carcinoid tumor of the midgut, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1716, N'C7A096', N'Malignant carcinoid tumor of the hindgut, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1717, N'C7A098', N'Malignant carcinoid tumors of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1718, N'C7A1', N'Malignant poorly differentiated neuroendocrine tumors')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1719, N'C7A8', N'Other malignant neuroendocrine tumors')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1720, N'C7B00', N'Secondary carcinoid tumors, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1721, N'C7B01', N'Secondary carcinoid tumors of distant lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1722, N'C7B02', N'Secondary carcinoid tumors of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1723, N'C7B03', N'Secondary carcinoid tumors of bone')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1724, N'C7B04', N'Secondary carcinoid tumors of peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1725, N'C7B09', N'Secondary carcinoid tumors of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1726, N'C7B1', N'Secondary Merkel cell carcinoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1727, N'C7B8', N'Other secondary neuroendocrine tumors')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1728, N'C800', N'Disseminated malignant neoplasm, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1729, N'C801', N'Malignant (primary) neoplasm, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1730, N'C802', N'Malignant neoplasm associated with transplanted organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1731, N'C8100', N'Nodular lymphocyte predominant Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1732, N'C8101', N'Nodular lymphocyte predominant Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1733, N'C8102', N'Nodular lymphocyte predominant Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1734, N'C8103', N'Nodular lymphocyte predominant Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1735, N'C8104', N'Nodular lymphocyte predominant Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1736, N'C8105', N'Nodular lymphocyte predominant Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1737, N'C8106', N'Nodular lymphocyte predominant Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1738, N'C8107', N'Nodular lymphocyte predominant Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1739, N'C8108', N'Nodular lymphocyte predominant Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1740, N'C8109', N'Nodular lymphocyte predominant Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1741, N'C8110', N'Nodular sclerosis Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1742, N'C8111', N'Nodular sclerosis Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1743, N'C8112', N'Nodular sclerosis Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1744, N'C8113', N'Nodular sclerosis Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1745, N'C8114', N'Nodular sclerosis Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1746, N'C8115', N'Nodular sclerosis Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1747, N'C8116', N'Nodular sclerosis Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1748, N'C8117', N'Nodular sclerosis Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1749, N'C8118', N'Nodular sclerosis Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1750, N'C8119', N'Nodular sclerosis Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1751, N'C8120', N'Mixed cellularity Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1752, N'C8121', N'Mixed cellularity Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1753, N'C8122', N'Mixed cellularity Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1754, N'C8123', N'Mixed cellularity Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1755, N'C8124', N'Mixed cellularity Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1756, N'C8125', N'Mixed cellularity Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1757, N'C8126', N'Mixed cellularity Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1758, N'C8127', N'Mixed cellularity Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1759, N'C8128', N'Mixed cellularity Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1760, N'C8129', N'Mixed cellularity Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1761, N'C8130', N'Lymphocyte depleted Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1762, N'C8131', N'Lymphocyte depleted Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1763, N'C8132', N'Lymphocyte depleted Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1764, N'C8133', N'Lymphocyte depleted Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1765, N'C8134', N'Lymphocyte depleted Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1766, N'C8135', N'Lymphocyte depleted Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1767, N'C8136', N'Lymphocyte depleted Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1768, N'C8137', N'Lymphocyte depleted Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1769, N'C8138', N'Lymphocyte depleted Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1770, N'C8139', N'Lymphocyte depleted Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1771, N'C8140', N'Lymphocyte-rich Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1772, N'C8141', N'Lymphocyte-rich Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1773, N'C8142', N'Lymphocyte-rich Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1774, N'C8143', N'Lymphocyte-rich Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1775, N'C8144', N'Lymphocyte-rich Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1776, N'C8145', N'Lymphocyte-rich Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1777, N'C8146', N'Lymphocyte-rich Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1778, N'C8147', N'Lymphocyte-rich Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1779, N'C8148', N'Lymphocyte-rich Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1780, N'C8149', N'Lymphocyte-rich Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1781, N'C8170', N'Other Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1782, N'C8171', N'Other Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1783, N'C8172', N'Other Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1784, N'C8173', N'Other Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1785, N'C8174', N'Other Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1786, N'C8175', N'Other Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1787, N'C8176', N'Other Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1788, N'C8177', N'Other Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1789, N'C8178', N'Other Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1790, N'C8179', N'Other Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1791, N'C8190', N'Hodgkin lymphoma, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1792, N'C8191', N'Hodgkin lymphoma, unspecified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1793, N'C8192', N'Hodgkin lymphoma, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1794, N'C8193', N'Hodgkin lymphoma, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1795, N'C8194', N'Hodgkin lymphoma, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1796, N'C8195', N'Hodgkin lymphoma, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1797, N'C8196', N'Hodgkin lymphoma, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1798, N'C8197', N'Hodgkin lymphoma, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1799, N'C8198', N'Hodgkin lymphoma, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1800, N'C8199', N'Hodgkin lymphoma, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1801, N'C8200', N'Follicular lymphoma grade I, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1802, N'C8201', N'Follicular lymphoma grade I, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1803, N'C8202', N'Follicular lymphoma grade I, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1804, N'C8203', N'Follicular lymphoma grade I, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1805, N'C8204', N'Follicular lymphoma grade I, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1806, N'C8205', N'Follicular lymphoma grade I, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1807, N'C8206', N'Follicular lymphoma grade I, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1808, N'C8207', N'Follicular lymphoma grade I, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1809, N'C8208', N'Follicular lymphoma grade I, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1810, N'C8209', N'Follicular lymphoma grade I, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1811, N'C8210', N'Follicular lymphoma grade II, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1812, N'C8211', N'Follicular lymphoma grade II, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1813, N'C8212', N'Follicular lymphoma grade II, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1814, N'C8213', N'Follicular lymphoma grade II, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1815, N'C8214', N'Follicular lymphoma grade II, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1816, N'C8215', N'Follicular lymphoma grade II, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1817, N'C8216', N'Follicular lymphoma grade II, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1818, N'C8217', N'Follicular lymphoma grade II, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1819, N'C8218', N'Follicular lymphoma grade II, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1820, N'C8219', N'Follicular lymphoma grade II, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1821, N'C8220', N'Follicular lymphoma grade III, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1822, N'C8221', N'Follicular lymphoma grade III, unspecified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1823, N'C8222', N'Follicular lymphoma grade III, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1824, N'C8223', N'Follicular lymphoma grade III, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1825, N'C8224', N'Follicular lymphoma grade III, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1826, N'C8225', N'Follicular lymphoma grade III, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1827, N'C8226', N'Follicular lymphoma grade III, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1828, N'C8227', N'Follicular lymphoma grade III, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1829, N'C8228', N'Follicular lymphoma grade III, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1830, N'C8229', N'Follicular lymphoma grade III, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1831, N'C8230', N'Follicular lymphoma grade IIIa, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1832, N'C8231', N'Follicular lymphoma grade IIIa, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1833, N'C8232', N'Follicular lymphoma grade IIIa, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1834, N'C8233', N'Follicular lymphoma grade IIIa, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1835, N'C8234', N'Follicular lymphoma grade IIIa, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1836, N'C8235', N'Follicular lymphoma grade IIIa, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1837, N'C8236', N'Follicular lymphoma grade IIIa, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1838, N'C8237', N'Follicular lymphoma grade IIIa, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1839, N'C8238', N'Follicular lymphoma grade IIIa, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1840, N'C8239', N'Follicular lymphoma grade IIIa, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1841, N'C8240', N'Follicular lymphoma grade IIIb, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1842, N'C8241', N'Follicular lymphoma grade IIIb, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1843, N'C8242', N'Follicular lymphoma grade IIIb, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1844, N'C8243', N'Follicular lymphoma grade IIIb, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1845, N'C8244', N'Follicular lymphoma grade IIIb, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1846, N'C8245', N'Follicular lymphoma grade IIIb, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1847, N'C8246', N'Follicular lymphoma grade IIIb, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1848, N'C8247', N'Follicular lymphoma grade IIIb, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1849, N'C8248', N'Follicular lymphoma grade IIIb, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1850, N'C8249', N'Follicular lymphoma grade IIIb, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1851, N'C8250', N'Diffuse follicle center lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1852, N'C8251', N'Diffuse follicle center lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1853, N'C8252', N'Diffuse follicle center lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1854, N'C8253', N'Diffuse follicle center lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1855, N'C8254', N'Diffuse follicle center lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1856, N'C8255', N'Diffuse follicle center lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1857, N'C8256', N'Diffuse follicle center lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1858, N'C8257', N'Diffuse follicle center lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1859, N'C8258', N'Diffuse follicle center lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1860, N'C8259', N'Diffuse follicle center lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1861, N'C8260', N'Cutaneous follicle center lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1862, N'C8261', N'Cutaneous follicle center lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1863, N'C8262', N'Cutaneous follicle center lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1864, N'C8263', N'Cutaneous follicle center lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1865, N'C8264', N'Cutaneous follicle center lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1866, N'C8265', N'Cutaneous follicle center lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1867, N'C8266', N'Cutaneous follicle center lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1868, N'C8267', N'Cutaneous follicle center lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1869, N'C8268', N'Cutaneous follicle center lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1870, N'C8269', N'Cutaneous follicle center lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1871, N'C8280', N'Other types of follicular lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1872, N'C8281', N'Other types of follicular lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1873, N'C8282', N'Other types of follicular lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1874, N'C8283', N'Other types of follicular lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1875, N'C8284', N'Other types of follicular lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1876, N'C8285', N'Other types of follicular lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1877, N'C8286', N'Other types of follicular lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1878, N'C8287', N'Other types of follicular lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1879, N'C8288', N'Other types of follicular lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1880, N'C8289', N'Other types of follicular lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1881, N'C8290', N'Follicular lymphoma, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1882, N'C8291', N'Follicular lymphoma, unspecified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1883, N'C8292', N'Follicular lymphoma, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1884, N'C8293', N'Follicular lymphoma, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1885, N'C8294', N'Follicular lymphoma, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1886, N'C8295', N'Follicular lymphoma, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1887, N'C8296', N'Follicular lymphoma, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1888, N'C8297', N'Follicular lymphoma, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1889, N'C8298', N'Follicular lymphoma, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1890, N'C8299', N'Follicular lymphoma, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1891, N'C8300', N'Small cell B-cell lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1892, N'C8301', N'Small cell B-cell lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1893, N'C8302', N'Small cell B-cell lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1894, N'C8303', N'Small cell B-cell lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1895, N'C8304', N'Small cell B-cell lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1896, N'C8305', N'Small cell B-cell lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1897, N'C8306', N'Small cell B-cell lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1898, N'C8307', N'Small cell B-cell lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1899, N'C8308', N'Small cell B-cell lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1900, N'C8309', N'Small cell B-cell lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1901, N'C8310', N'Mantle cell lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1902, N'C8311', N'Mantle cell lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1903, N'C8312', N'Mantle cell lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1904, N'C8313', N'Mantle cell lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1905, N'C8314', N'Mantle cell lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1906, N'C8315', N'Mantle cell lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1907, N'C8316', N'Mantle cell lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1908, N'C8317', N'Mantle cell lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1909, N'C8318', N'Mantle cell lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1910, N'C8319', N'Mantle cell lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1911, N'C8330', N'Diffuse large B-cell lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1912, N'C8331', N'Diffuse large B-cell lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1913, N'C8332', N'Diffuse large B-cell lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1914, N'C8333', N'Diffuse large B-cell lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1915, N'C8334', N'Diffuse large B-cell lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1916, N'C8335', N'Diffuse large B-cell lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1917, N'C8336', N'Diffuse large B-cell lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1918, N'C8337', N'Diffuse large B-cell lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1919, N'C8338', N'Diffuse large B-cell lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1920, N'C8339', N'Diffuse large B-cell lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1921, N'C8350', N'Lymphoblastic (diffuse) lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1922, N'C8351', N'Lymphoblastic (diffuse) lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1923, N'C8352', N'Lymphoblastic (diffuse) lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1924, N'C8353', N'Lymphoblastic (diffuse) lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1925, N'C8354', N'Lymphoblastic (diffuse) lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1926, N'C8355', N'Lymphoblastic (diffuse) lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1927, N'C8356', N'Lymphoblastic (diffuse) lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1928, N'C8357', N'Lymphoblastic (diffuse) lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1929, N'C8358', N'Lymphoblastic (diffuse) lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1930, N'C8359', N'Lymphoblastic (diffuse) lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1931, N'C8370', N'Burkitt lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1932, N'C8371', N'Burkitt lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1933, N'C8372', N'Burkitt lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1934, N'C8373', N'Burkitt lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1935, N'C8374', N'Burkitt lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1936, N'C8375', N'Burkitt lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1937, N'C8376', N'Burkitt lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1938, N'C8377', N'Burkitt lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1939, N'C8378', N'Burkitt lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1940, N'C8379', N'Burkitt lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1941, N'C8380', N'Other non-follicular lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1942, N'C8381', N'Other non-follicular lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1943, N'C8382', N'Other non-follicular lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1944, N'C8383', N'Other non-follicular lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1945, N'C8384', N'Other non-follicular lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1946, N'C8385', N'Other non-follicular lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1947, N'C8386', N'Other non-follicular lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1948, N'C8387', N'Other non-follicular lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1949, N'C8388', N'Other non-follicular lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1950, N'C8389', N'Other non-follicular lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1951, N'C8390', N'Non-follicular (diffuse) lymphoma, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1952, N'C8391', N'Non-follicular (diffuse) lymphoma, unspecified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1953, N'C8392', N'Non-follicular (diffuse) lymphoma, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1954, N'C8393', N'Non-follicular (diffuse) lymphoma, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1955, N'C8394', N'Non-follicular (diffuse) lymphoma, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1956, N'C8395', N'Non-follicular (diffuse) lymphoma, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1957, N'C8396', N'Non-follicular (diffuse) lymphoma, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1958, N'C8397', N'Non-follicular (diffuse) lymphoma, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1959, N'C8398', N'Non-follicular (diffuse) lymphoma, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1960, N'C8399', N'Non-follicular (diffuse) lymphoma, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1961, N'C8400', N'Mycosis fungoides, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1962, N'C8401', N'Mycosis fungoides, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1963, N'C8402', N'Mycosis fungoides, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1964, N'C8403', N'Mycosis fungoides, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1965, N'C8404', N'Mycosis fungoides, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1966, N'C8405', N'Mycosis fungoides, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1967, N'C8406', N'Mycosis fungoides, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1968, N'C8407', N'Mycosis fungoides, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1969, N'C8408', N'Mycosis fungoides, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1970, N'C8409', N'Mycosis fungoides, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1971, N'C8410', N'Sezary disease, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1972, N'C8411', N'Sezary disease, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1973, N'C8412', N'Sezary disease, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1974, N'C8413', N'Sezary disease, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1975, N'C8414', N'Sezary disease, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1976, N'C8415', N'Sezary disease, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1977, N'C8416', N'Sezary disease, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1978, N'C8417', N'Sezary disease, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1979, N'C8418', N'Sezary disease, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1980, N'C8419', N'Sezary disease, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1981, N'C8440', N'Peripheral T-cell lymphoma, not classified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1982, N'C8441', N'Peripheral T-cell lymphoma, not classified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1983, N'C8442', N'Peripheral T-cell lymphoma, not classified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1984, N'C8443', N'Peripheral T-cell lymphoma, not classified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1985, N'C8444', N'Peripheral T-cell lymphoma, not classified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1986, N'C8445', N'Peripheral T-cell lymphoma, not classified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1987, N'C8446', N'Peripheral T-cell lymphoma, not classified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1988, N'C8447', N'Peripheral T-cell lymphoma, not classified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1989, N'C8448', N'Peripheral T-cell lymphoma, not classified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1990, N'C8449', N'Peripheral T-cell lymphoma, not classified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1991, N'C8460', N'Anaplastic large cell lymphoma, ALK-positive, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1992, N'C8461', N'Anaplastic large cell lymphoma, ALK-positive, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1993, N'C8462', N'Anaplastic large cell lymphoma, ALK-positive, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1994, N'C8463', N'Anaplastic large cell lymphoma, ALK-positive, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1995, N'C8464', N'Anaplastic large cell lymphoma, ALK-positive, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1996, N'C8465', N'Anaplastic large cell lymphoma, ALK-positive, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1997, N'C8466', N'Anaplastic large cell lymphoma, ALK-positive, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1998, N'C8467', N'Anaplastic large cell lymphoma, ALK-positive, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (1999, N'C8468', N'Anaplastic large cell lymphoma, ALK-positive, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2000, N'C8469', N'Anaplastic large cell lymphoma, ALK-positive, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2001, N'C8470', N'Anaplastic large cell lymphoma, ALK-negative, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2002, N'C8471', N'Anaplastic large cell lymphoma, ALK-negative, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2003, N'C8472', N'Anaplastic large cell lymphoma, ALK-negative, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2004, N'C8473', N'Anaplastic large cell lymphoma, ALK-negative, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2005, N'C8474', N'Anaplastic large cell lymphoma, ALK-negative, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2006, N'C8475', N'Anaplastic large cell lymphoma, ALK-negative, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2007, N'C8476', N'Anaplastic large cell lymphoma, ALK-negative, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2008, N'C8477', N'Anaplastic large cell lymphoma, ALK-negative, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2009, N'C8478', N'Anaplastic large cell lymphoma, ALK-negative, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2010, N'C8479', N'Anaplastic large cell lymphoma, ALK-negative, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2011, N'C8490', N'Mature T/NK-cell lymphomas, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2012, N'C8491', N'Mature T/NK-cell lymphomas, unspecified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2013, N'C8492', N'Mature T/NK-cell lymphomas, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2014, N'C8493', N'Mature T/NK-cell lymphomas, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2015, N'C8494', N'Mature T/NK-cell lymphomas, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2016, N'C8495', N'Mature T/NK-cell lymphomas, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2017, N'C8496', N'Mature T/NK-cell lymphomas, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2018, N'C8497', N'Mature T/NK-cell lymphomas, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2019, N'C8498', N'Mature T/NK-cell lymphomas, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2020, N'C8499', N'Mature T/NK-cell lymphomas, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2021, N'C84A0', N'Cutaneous T-cell lymphoma, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2022, N'C84A1', N'Cutaneous T-cell lymphoma, unspecified lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2023, N'C84A2', N'Cutaneous T-cell lymphoma, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2024, N'C84A3', N'Cutaneous T-cell lymphoma, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2025, N'C84A4', N'Cutaneous T-cell lymphoma, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2026, N'C84A5', N'Cutaneous T-cell lymphoma, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2027, N'C84A6', N'Cutaneous T-cell lymphoma, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2028, N'C84A7', N'Cutaneous T-cell lymphoma, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2029, N'C84A8', N'Cutaneous T-cell lymphoma, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2030, N'C84A9', N'Cutaneous T-cell lymphoma, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2031, N'C84Z0', N'Other mature T/NK-cell lymphomas, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2032, N'C84Z1', N'Other mature T/NK-cell lymphomas, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2033, N'C84Z2', N'Other mature T/NK-cell lymphomas, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2034, N'C84Z3', N'Other mature T/NK-cell lymphomas, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2035, N'C84Z4', N'Other mature T/NK-cell lymphomas, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2036, N'C84Z5', N'Other mature T/NK-cell lymphomas, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2037, N'C84Z6', N'Other mature T/NK-cell lymphomas, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2038, N'C84Z7', N'Other mature T/NK-cell lymphomas, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2039, N'C84Z8', N'Other mature T/NK-cell lymphomas, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2040, N'C84Z9', N'Other mature T/NK-cell lymphomas, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2041, N'C8510', N'Unspecified B-cell lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2042, N'C8511', N'Unspecified B-cell lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2043, N'C8512', N'Unspecified B-cell lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2044, N'C8513', N'Unspecified B-cell lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2045, N'C8514', N'Unspecified B-cell lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2046, N'C8515', N'Unspecified B-cell lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2047, N'C8516', N'Unspecified B-cell lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2048, N'C8517', N'Unspecified B-cell lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2049, N'C8518', N'Unspecified B-cell lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2050, N'C8519', N'Unspecified B-cell lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2051, N'C8520', N'Mediastinal (thymic) large B-cell lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2052, N'C8521', N'Mediastinal (thymic) large B-cell lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2053, N'C8522', N'Mediastinal (thymic) large B-cell lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2054, N'C8523', N'Mediastinal (thymic) large B-cell lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2055, N'C8524', N'Mediastinal (thymic) large B-cell lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2056, N'C8525', N'Mediastinal (thymic) large B-cell lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2057, N'C8526', N'Mediastinal (thymic) large B-cell lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2058, N'C8527', N'Mediastinal (thymic) large B-cell lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2059, N'C8528', N'Mediastinal (thymic) large B-cell lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2060, N'C8529', N'Mediastinal (thymic) large B-cell lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2061, N'C8580', N'Other specified types of non-Hodgkin lymphoma, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2062, N'C8581', N'Other specified types of non-Hodgkin lymphoma, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2063, N'C8582', N'Other specified types of non-Hodgkin lymphoma, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2064, N'C8583', N'Other specified types of non-Hodgkin lymphoma, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2065, N'C8584', N'Other specified types of non-Hodgkin lymphoma, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2066, N'C8585', N'Other specified types of non-Hodgkin lymphoma, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2067, N'C8586', N'Other specified types of non-Hodgkin lymphoma, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2068, N'C8587', N'Other specified types of non-Hodgkin lymphoma, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2069, N'C8588', N'Other specified types of non-Hodgkin lymphoma, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2070, N'C8589', N'Other specified types of non-Hodgkin lymphoma, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2071, N'C8590', N'Non-Hodgkin lymphoma, unspecified, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2072, N'C8591', N'Non-Hodgkin lymphoma, unspecified, lymph nodes of head, face, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2073, N'C8592', N'Non-Hodgkin lymphoma, unspecified, intrathoracic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2074, N'C8593', N'Non-Hodgkin lymphoma, unspecified, intra-abdominal lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2075, N'C8594', N'Non-Hodgkin lymphoma, unspecified, lymph nodes of axilla and upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2076, N'C8595', N'Non-Hodgkin lymphoma, unspecified, lymph nodes of inguinal region and lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2077, N'C8596', N'Non-Hodgkin lymphoma, unspecified, intrapelvic lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2078, N'C8597', N'Non-Hodgkin lymphoma, unspecified, spleen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2079, N'C8598', N'Non-Hodgkin lymphoma, unspecified, lymph nodes of multiple sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2080, N'C8599', N'Non-Hodgkin lymphoma, unspecified, extranodal and solid organ sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2081, N'C860', N'Extranodal NK/T-cell lymphoma, nasal type')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2082, N'C861', N'Hepatosplenic T-cell lymphoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2083, N'C862', N'Enteropathy-type (intestinal) T-cell lymphoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2084, N'C863', N'Subcutaneous panniculitis-like T-cell lymphoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2085, N'C864', N'Blastic NK-cell lymphoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2086, N'C865', N'Angioimmunoblastic T-cell lymphoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2087, N'C866', N'Primary cutaneous CD30-positive T-cell proliferations')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2088, N'C880', N'Waldenstrom macroglobulinemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2089, N'C882', N'Heavy chain disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2090, N'C883', N'Immunoproliferative small intestinal disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2091, N'C884', N'Extranodal marginal zone B-cell lymphoma of mucosa-associated lymphoid tissue [MALT-lymphoma]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2092, N'C888', N'Other malignant immunoproliferative diseases')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2093, N'C889', N'Malignant immunoproliferative disease, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2094, N'C9000', N'Multiple myeloma not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2095, N'C9001', N'Multiple myeloma in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2096, N'C9002', N'Multiple myeloma in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2097, N'C9010', N'Plasma cell leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2098, N'C9011', N'Plasma cell leukemia in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2099, N'C9012', N'Plasma cell leukemia in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2100, N'C9020', N'Extramedullary plasmacytoma not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2101, N'C9021', N'Extramedullary plasmacytoma in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2102, N'C9022', N'Extramedullary plasmacytoma in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2103, N'C9030', N'Solitary plasmacytoma not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2104, N'C9031', N'Solitary plasmacytoma in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2105, N'C9032', N'Solitary plasmacytoma in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2106, N'C9100', N'Acute lymphoblastic leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2107, N'C9101', N'Acute lymphoblastic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2108, N'C9102', N'Acute lymphoblastic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2109, N'C9110', N'Chronic lymphocytic leukemia of B-cell type not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2110, N'C9111', N'Chronic lymphocytic leukemia of B-cell type in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2111, N'C9112', N'Chronic lymphocytic leukemia of B-cell type in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2112, N'C9130', N'Prolymphocytic leukemia of B-cell type not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2113, N'C9131', N'Prolymphocytic leukemia of B-cell type, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2114, N'C9132', N'Prolymphocytic leukemia of B-cell type, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2115, N'C9140', N'Hairy cell leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2116, N'C9141', N'Hairy cell leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2117, N'C9142', N'Hairy cell leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2118, N'C9150', N'Adult T-cell lymphoma/leukemia (HTLV-1-associated) not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2119, N'C9151', N'Adult T-cell lymphoma/leukemia (HTLV-1-associated), in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2120, N'C9152', N'Adult T-cell lymphoma/leukemia (HTLV-1-associated), in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2121, N'C9160', N'Prolymphocytic leukemia of T-cell type not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2122, N'C9161', N'Prolymphocytic leukemia of T-cell type, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2123, N'C9162', N'Prolymphocytic leukemia of T-cell type, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2124, N'C9190', N'Lymphoid leukemia, unspecified not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2125, N'C9191', N'Lymphoid leukemia, unspecified, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2126, N'C9192', N'Lymphoid leukemia, unspecified, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2127, N'C91A0', N'Mature B-cell leukemia Burkitt-type not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2128, N'C91A1', N'Mature B-cell leukemia Burkitt-type, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2129, N'C91A2', N'Mature B-cell leukemia Burkitt-type, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2130, N'C91Z0', N'Other lymphoid leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2131, N'C91Z1', N'Other lymphoid leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2132, N'C91Z2', N'Other lymphoid leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2133, N'C9200', N'Acute myeloblastic leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2134, N'C9201', N'Acute myeloblastic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2135, N'C9202', N'Acute myeloblastic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2136, N'C9210', N'Chronic myeloid leukemia, BCR/ABL-positive, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2137, N'C9211', N'Chronic myeloid leukemia, BCR/ABL-positive, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2138, N'C9212', N'Chronic myeloid leukemia, BCR/ABL-positive, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2139, N'C9220', N'Atypical chronic myeloid leukemia, BCR/ABL-negative, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2140, N'C9221', N'Atypical chronic myeloid leukemia, BCR/ABL-negative, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2141, N'C9222', N'Atypical chronic myeloid leukemia, BCR/ABL-negative, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2142, N'C9230', N'Myeloid sarcoma, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2143, N'C9231', N'Myeloid sarcoma, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2144, N'C9232', N'Myeloid sarcoma, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2145, N'C9240', N'Acute promyelocytic leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2146, N'C9241', N'Acute promyelocytic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2147, N'C9242', N'Acute promyelocytic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2148, N'C9250', N'Acute myelomonocytic leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2149, N'C9251', N'Acute myelomonocytic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2150, N'C9252', N'Acute myelomonocytic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2151, N'C9260', N'Acute myeloid leukemia with 11q23-abnormality not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2152, N'C9261', N'Acute myeloid leukemia with 11q23-abnormality in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2153, N'C9262', N'Acute myeloid leukemia with 11q23-abnormality in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2154, N'C9290', N'Myeloid leukemia, unspecified, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2155, N'C9291', N'Myeloid leukemia, unspecified in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2156, N'C9292', N'Myeloid leukemia, unspecified in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2157, N'C92A0', N'Acute myeloid leukemia with multilineage dysplasia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2158, N'C92A1', N'Acute myeloid leukemia with multilineage dysplasia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2159, N'C92A2', N'Acute myeloid leukemia with multilineage dysplasia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2160, N'C92Z0', N'Other myeloid leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2161, N'C92Z1', N'Other myeloid leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2162, N'C92Z2', N'Other myeloid leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2163, N'C9300', N'Acute monoblastic/monocytic leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2164, N'C9301', N'Acute monoblastic/monocytic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2165, N'C9302', N'Acute monoblastic/monocytic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2166, N'C9310', N'Chronic myelomonocytic leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2167, N'C9311', N'Chronic myelomonocytic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2168, N'C9312', N'Chronic myelomonocytic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2169, N'C9330', N'Juvenile myelomonocytic leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2170, N'C9331', N'Juvenile myelomonocytic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2171, N'C9332', N'Juvenile myelomonocytic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2172, N'C9390', N'Monocytic leukemia, unspecified, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2173, N'C9391', N'Monocytic leukemia, unspecified in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2174, N'C9392', N'Monocytic leukemia, unspecified in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2175, N'C93Z0', N'Other monocytic leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2176, N'C93Z1', N'Other monocytic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2177, N'C93Z2', N'Other monocytic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2178, N'C9400', N'Acute erythroid leukemia, not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2179, N'C9401', N'Acute erythroid leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2180, N'C9402', N'Acute erythroid leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2181, N'C9420', N'Acute megakaryoblastic leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2182, N'C9421', N'Acute megakaryoblastic leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2183, N'C9422', N'Acute megakaryoblastic leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2184, N'C9430', N'Mast cell leukemia not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2185, N'C9431', N'Mast cell leukemia, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2186, N'C9432', N'Mast cell leukemia, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2187, N'C9440', N'Acute panmyelosis with myelofibrosis not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2188, N'C9441', N'Acute panmyelosis with myelofibrosis, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2189, N'C9442', N'Acute panmyelosis with myelofibrosis, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2190, N'C946', N'Myelodysplastic disease, not classified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2191, N'C9480', N'Other specified leukemias not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2192, N'C9481', N'Other specified leukemias, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2193, N'C9482', N'Other specified leukemias, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2194, N'C9500', N'Acute leukemia of unspecified cell type not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2195, N'C9501', N'Acute leukemia of unspecified cell type, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2196, N'C9502', N'Acute leukemia of unspecified cell type, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2197, N'C9510', N'Chronic leukemia of unspecified cell type not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2198, N'C9511', N'Chronic leukemia of unspecified cell type, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2199, N'C9512', N'Chronic leukemia of unspecified cell type, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2200, N'C9590', N'Leukemia, unspecified not having achieved remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2201, N'C9591', N'Leukemia, unspecified, in remission')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2202, N'C9592', N'Leukemia, unspecified, in relapse')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2203, N'C960', N'Multifocal and multisystemic (disseminated) Langerhans-cell histiocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2204, N'C962', N'Malignant mast cell tumor')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2205, N'C9620', N'Malignant mast cell neoplasm, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2206, N'C9621', N'Aggressive systemic mastocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2207, N'C9622', N'Mast cell sarcoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2208, N'C9629', N'Other malignant mast cell neoplasm')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2209, N'C964', N'Sarcoma of dendritic cells (accessory cells)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2210, N'C965', N'Multifocal and unisystemic Langerhans-cell histiocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2211, N'C966', N'Unifocal Langerhans-cell histiocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2212, N'C969', N'Malignant neoplasm of lymphoid, hematopoietic and related tissue, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2213, N'C96A', N'Histiocytic sarcoma')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2214, N'C96Z', N'Other specified malignant neoplasms of lymphoid, hematopoietic and related tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2215, N'D0000', N'Carcinoma in situ of oral cavity, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2216, N'D0001', N'Carcinoma in situ of labial mucosa and vermilion border')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2217, N'D0002', N'Carcinoma in situ of buccal mucosa')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2218, N'D0003', N'Carcinoma in situ of gingiva and edentulous alveolar ridge')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2219, N'D0004', N'Carcinoma in situ of soft palate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2220, N'D0005', N'Carcinoma in situ of hard palate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2221, N'D0006', N'Carcinoma in situ of floor of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2222, N'D0007', N'Carcinoma in situ of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2223, N'D0008', N'Carcinoma in situ of pharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2224, N'D001', N'Carcinoma in situ of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2225, N'D002', N'Carcinoma in situ of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2226, N'D010', N'Carcinoma in situ of colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2227, N'D011', N'Carcinoma in situ of rectosigmoid junction')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2228, N'D012', N'Carcinoma in situ of rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2229, N'D013', N'Carcinoma in situ of anus and anal canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2230, N'D0140', N'Carcinoma in situ of unspecified part of intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2231, N'D0149', N'Carcinoma in situ of other parts of intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2232, N'D015', N'Carcinoma in situ of liver, gallbladder and bile ducts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2233, N'D017', N'Carcinoma in situ of other specified digestive organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2234, N'D019', N'Carcinoma in situ of digestive organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2235, N'D020', N'Carcinoma in situ of larynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2236, N'D021', N'Carcinoma in situ of trachea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2237, N'D0220', N'Carcinoma in situ of unspecified bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2238, N'D0221', N'Carcinoma in situ of right bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2239, N'D0222', N'Carcinoma in situ of left bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2240, N'D023', N'Carcinoma in situ of other parts of respiratory system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2241, N'D024', N'Carcinoma in situ of respiratory system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2242, N'D030', N'Melanoma in situ of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2243, N'D0310', N'Melanoma in situ of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2244, N'D0311', N'Melanoma in situ of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2245, N'D0312', N'Melanoma in situ of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2246, N'D0320', N'Melanoma in situ of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2247, N'D0321', N'Melanoma in situ of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2248, N'D0322', N'Melanoma in situ of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2249, N'D0330', N'Melanoma in situ of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2250, N'D0339', N'Melanoma in situ of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2251, N'D034', N'Melanoma in situ of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2252, N'D0351', N'Melanoma in situ of anal skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2253, N'D0352', N'Melanoma in situ of breast (skin) (soft tissue)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2254, N'D0359', N'Melanoma in situ of other part of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2255, N'D0360', N'Melanoma in situ of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2256, N'D0361', N'Melanoma in situ of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2257, N'D0362', N'Melanoma in situ of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2258, N'D0370', N'Melanoma in situ of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2259, N'D0371', N'Melanoma in situ of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2260, N'D0372', N'Melanoma in situ of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2261, N'D038', N'Melanoma in situ of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2262, N'D039', N'Melanoma in situ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2263, N'D040', N'Carcinoma in situ of skin of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2264, N'D0410', N'Carcinoma in situ of skin of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2265, N'D0411', N'Carcinoma in situ of skin of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2266, N'D0412', N'Carcinoma in situ of skin of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2267, N'D0420', N'Carcinoma in situ of skin of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2268, N'D0421', N'Carcinoma in situ of skin of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2269, N'D0422', N'Carcinoma in situ of skin of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2270, N'D0430', N'Carcinoma in situ of skin of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2271, N'D0439', N'Carcinoma in situ of skin of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2272, N'D044', N'Carcinoma in situ of skin of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2273, N'D045', N'Carcinoma in situ of skin of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2274, N'D0460', N'Carcinoma in situ of skin of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2275, N'D0461', N'Carcinoma in situ of skin of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2276, N'D0462', N'Carcinoma in situ of skin of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2277, N'D0470', N'Carcinoma in situ of skin of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2278, N'D0471', N'Carcinoma in situ of skin of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2279, N'D0472', N'Carcinoma in situ of skin of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2280, N'D048', N'Carcinoma in situ of skin of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2281, N'D049', N'Carcinoma in situ of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2282, N'D0500', N'Lobular carcinoma in situ of unspecified breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2283, N'D0501', N'Lobular carcinoma in situ of right breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2284, N'D0502', N'Lobular carcinoma in situ of left breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2285, N'D0510', N'Intraductal carcinoma in situ of unspecified breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2286, N'D0511', N'Intraductal carcinoma in situ of right breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2287, N'D0512', N'Intraductal carcinoma in situ of left breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2288, N'D0580', N'Other specified type of carcinoma in situ of unspecified breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2289, N'D0581', N'Other specified type of carcinoma in situ of right breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2290, N'D0582', N'Other specified type of carcinoma in situ of left breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2291, N'D0590', N'Unspecified type of carcinoma in situ of unspecified breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2292, N'D0591', N'Unspecified type of carcinoma in situ of right breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2293, N'D0592', N'Unspecified type of carcinoma in situ of left breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2294, N'D060', N'Carcinoma in situ of endocervix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2295, N'D061', N'Carcinoma in situ of exocervix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2296, N'D067', N'Carcinoma in situ of other parts of cervix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2297, N'D069', N'Carcinoma in situ of cervix, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2298, N'D070', N'Carcinoma in situ of endometrium')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2299, N'D071', N'Carcinoma in situ of vulva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2300, N'D072', N'Carcinoma in situ of vagina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2301, N'D0730', N'Carcinoma in situ of unspecified female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2302, N'D0739', N'Carcinoma in situ of other female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2303, N'D074', N'Carcinoma in situ of penis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2304, N'D075', N'Carcinoma in situ of prostate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2305, N'D0760', N'Carcinoma in situ of unspecified male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2306, N'D0761', N'Carcinoma in situ of scrotum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2307, N'D0769', N'Carcinoma in situ of other male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2308, N'D090', N'Carcinoma in situ of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2309, N'D0910', N'Carcinoma in situ of unspecified urinary organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2310, N'D0919', N'Carcinoma in situ of other urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2311, N'D0920', N'Carcinoma in situ of unspecified eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2312, N'D0921', N'Carcinoma in situ of right eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2313, N'D0922', N'Carcinoma in situ of left eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2314, N'D093', N'Carcinoma in situ of thyroid and other endocrine glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2315, N'D098', N'Carcinoma in situ of other specified sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2316, N'D099', N'Carcinoma in situ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2317, N'D100', N'Benign neoplasm of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2318, N'D101', N'Benign neoplasm of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2319, N'D102', N'Benign neoplasm of floor of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2320, N'D1030', N'Benign neoplasm of unspecified part of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2321, N'D1039', N'Benign neoplasm of other parts of mouth')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2322, N'D104', N'Benign neoplasm of tonsil')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2323, N'D105', N'Benign neoplasm of other parts of oropharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2324, N'D106', N'Benign neoplasm of nasopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2325, N'D107', N'Benign neoplasm of hypopharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2326, N'D109', N'Benign neoplasm of pharynx, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2327, N'D110', N'Benign neoplasm of parotid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2328, N'D117', N'Benign neoplasm of other major salivary glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2329, N'D119', N'Benign neoplasm of major salivary gland, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2330, N'D120', N'Benign neoplasm of cecum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2331, N'D121', N'Benign neoplasm of appendix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2332, N'D122', N'Benign neoplasm of ascending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2333, N'D123', N'Benign neoplasm of transverse colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2334, N'D124', N'Benign neoplasm of descending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2335, N'D125', N'Benign neoplasm of sigmoid colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2336, N'D126', N'Benign neoplasm of colon, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2337, N'D127', N'Benign neoplasm of rectosigmoid junction')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2338, N'D128', N'Benign neoplasm of rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2339, N'D129', N'Benign neoplasm of anus and anal canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2340, N'D130', N'Benign neoplasm of esophagus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2341, N'D131', N'Benign neoplasm of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2342, N'D132', N'Benign neoplasm of duodenum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2343, N'D1330', N'Benign neoplasm of unspecified part of small intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2344, N'D1339', N'Benign neoplasm of other parts of small intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2345, N'D134', N'Benign neoplasm of liver')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2346, N'D135', N'Benign neoplasm of extrahepatic bile ducts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2347, N'D136', N'Benign neoplasm of pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2348, N'D137', N'Benign neoplasm of endocrine pancreas')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2349, N'D139', N'Benign neoplasm of ill-defined sites within the digestive system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2350, N'D140', N'Benign neoplasm of middle ear, nasal cavity and accessory sinuses')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2351, N'D141', N'Benign neoplasm of larynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2352, N'D142', N'Benign neoplasm of trachea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2353, N'D1430', N'Benign neoplasm of unspecified bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2354, N'D1431', N'Benign neoplasm of right bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2355, N'D1432', N'Benign neoplasm of left bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2356, N'D144', N'Benign neoplasm of respiratory system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2357, N'D150', N'Benign neoplasm of thymus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2358, N'D151', N'Benign neoplasm of heart')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2359, N'D152', N'Benign neoplasm of mediastinum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2360, N'D157', N'Benign neoplasm of other specified intrathoracic organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2361, N'D159', N'Benign neoplasm of intrathoracic organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2362, N'D1600', N'Benign neoplasm of scapula and long bones of unspecified upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2363, N'D1601', N'Benign neoplasm of scapula and long bones of right upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2364, N'D1602', N'Benign neoplasm of scapula and long bones of left upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2365, N'D1610', N'Benign neoplasm of short bones of unspecified upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2366, N'D1611', N'Benign neoplasm of short bones of right upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2367, N'D1612', N'Benign neoplasm of short bones of left upper limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2368, N'D1620', N'Benign neoplasm of long bones of unspecified lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2369, N'D1621', N'Benign neoplasm of long bones of right lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2370, N'D1622', N'Benign neoplasm of long bones of left lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2371, N'D1630', N'Benign neoplasm of short bones of unspecified lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2372, N'D1631', N'Benign neoplasm of short bones of right lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2373, N'D1632', N'Benign neoplasm of short bones of left lower limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2374, N'D164', N'Benign neoplasm of bones of skull and face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2375, N'D165', N'Benign neoplasm of lower jaw bone')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2376, N'D166', N'Benign neoplasm of vertebral column')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2377, N'D167', N'Benign neoplasm of ribs, sternum and clavicle')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2378, N'D168', N'Benign neoplasm of pelvic bones, sacrum and coccyx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2379, N'D169', N'Benign neoplasm of bone and articular cartilage, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2380, N'D170', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of head, face and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2381, N'D171', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2382, N'D1720', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of unspecified limb')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2383, N'D1721', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of right arm')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2384, N'D1722', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of left arm')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2385, N'D1723', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of right leg')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2386, N'D1724', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of left leg')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2387, N'D1730', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of unspecified sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2388, N'D1739', N'Benign lipomatous neoplasm of skin and subcutaneous tissue of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2389, N'D174', N'Benign lipomatous neoplasm of intrathoracic organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2390, N'D175', N'Benign lipomatous neoplasm of intra-abdominal organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2391, N'D176', N'Benign lipomatous neoplasm of spermatic cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2392, N'D1771', N'Benign lipomatous neoplasm of kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2393, N'D1772', N'Benign lipomatous neoplasm of other genitourinary organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2394, N'D1779', N'Benign lipomatous neoplasm of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2395, N'D179', N'Benign lipomatous neoplasm, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2396, N'D1800', N'Hemangioma unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2397, N'D1801', N'Hemangioma of skin and subcutaneous tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2398, N'D1802', N'Hemangioma of intracranial structures')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2399, N'D1803', N'Hemangioma of intra-abdominal structures')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2400, N'D1809', N'Hemangioma of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2401, N'D181', N'Lymphangioma, any site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2402, N'D190', N'Benign neoplasm of mesothelial tissue of pleura')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2403, N'D191', N'Benign neoplasm of mesothelial tissue of peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2404, N'D197', N'Benign neoplasm of mesothelial tissue of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2405, N'D199', N'Benign neoplasm of mesothelial tissue, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2406, N'D200', N'Benign neoplasm of soft tissue of retroperitoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2407, N'D201', N'Benign neoplasm of soft tissue of peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2408, N'D210', N'Benign neoplasm of connective and other soft tissue of head, face and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2409, N'D2110', N'Benign neoplasm of connective and other soft tissue of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2410, N'D2111', N'Benign neoplasm of connective and other soft tissue of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2411, N'D2112', N'Benign neoplasm of connective and other soft tissue of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2412, N'D2120', N'Benign neoplasm of connective and other soft tissue of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2413, N'D2121', N'Benign neoplasm of connective and other soft tissue of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2414, N'D2122', N'Benign neoplasm of connective and other soft tissue of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2415, N'D213', N'Benign neoplasm of connective and other soft tissue of thorax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2416, N'D214', N'Benign neoplasm of connective and other soft tissue of abdomen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2417, N'D215', N'Benign neoplasm of connective and other soft tissue of pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2418, N'D216', N'Benign neoplasm of connective and other soft tissue of trunk, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2419, N'D219', N'Benign neoplasm of connective and other soft tissue, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2420, N'D220', N'Melanocytic nevi of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2421, N'D2210', N'Melanocytic nevi of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2422, N'D2211', N'Melanocytic nevi of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2423, N'D2212', N'Melanocytic nevi of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2424, N'D2220', N'Melanocytic nevi of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2425, N'D2221', N'Melanocytic nevi of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2426, N'D2222', N'Melanocytic nevi of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2427, N'D2230', N'Melanocytic nevi of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2428, N'D2239', N'Melanocytic nevi of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2429, N'D224', N'Melanocytic nevi of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2430, N'D225', N'Melanocytic nevi of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2431, N'D2260', N'Melanocytic nevi of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2432, N'D2261', N'Melanocytic nevi of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2433, N'D2262', N'Melanocytic nevi of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2434, N'D2270', N'Melanocytic nevi of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2435, N'D2271', N'Melanocytic nevi of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2436, N'D2272', N'Melanocytic nevi of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2437, N'D229', N'Melanocytic nevi, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2438, N'D230', N'Other benign neoplasm of skin of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2439, N'D2310', N'Other benign neoplasm of skin of unspecified eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2440, N'D2311', N'Other benign neoplasm of skin of right eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2441, N'D2312', N'Other benign neoplasm of skin of left eyelid, including canthus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2442, N'D2320', N'Other benign neoplasm of skin of unspecified ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2443, N'D2321', N'Other benign neoplasm of skin of right ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2444, N'D2322', N'Other benign neoplasm of skin of left ear and external auricular canal')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2445, N'D2330', N'Other benign neoplasm of skin of unspecified part of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2446, N'D2339', N'Other benign neoplasm of skin of other parts of face')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2447, N'D234', N'Other benign neoplasm of skin of scalp and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2448, N'D235', N'Other benign neoplasm of skin of trunk')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2449, N'D2360', N'Other benign neoplasm of skin of unspecified upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2450, N'D2361', N'Other benign neoplasm of skin of right upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2451, N'D2362', N'Other benign neoplasm of skin of left upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2452, N'D2370', N'Other benign neoplasm of skin of unspecified lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2453, N'D2371', N'Other benign neoplasm of skin of right lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2454, N'D2372', N'Other benign neoplasm of skin of left lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2455, N'D239', N'Other benign neoplasm of skin, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2456, N'D241', N'Benign neoplasm of right breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2457, N'D242', N'Benign neoplasm of left breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2458, N'D249', N'Benign neoplasm of unspecified breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2459, N'D250', N'Submucous leiomyoma of uterus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2460, N'D251', N'Intramural leiomyoma of uterus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2461, N'D252', N'Subserosal leiomyoma of uterus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2462, N'D259', N'Leiomyoma of uterus, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2463, N'D260', N'Other benign neoplasm of cervix uteri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2464, N'D261', N'Other benign neoplasm of corpus uteri')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2465, N'D267', N'Other benign neoplasm of other parts of uterus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2466, N'D269', N'Other benign neoplasm of uterus, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2467, N'D270', N'Benign neoplasm of right ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2468, N'D271', N'Benign neoplasm of left ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2469, N'D279', N'Benign neoplasm of unspecified ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2470, N'D280', N'Benign neoplasm of vulva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2471, N'D281', N'Benign neoplasm of vagina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2472, N'D282', N'Benign neoplasm of uterine tubes and ligaments')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2473, N'D287', N'Benign neoplasm of other specified female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2474, N'D289', N'Benign neoplasm of female genital organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2475, N'D290', N'Benign neoplasm of penis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2476, N'D291', N'Benign neoplasm of prostate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2477, N'D2920', N'Benign neoplasm of unspecified testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2478, N'D2921', N'Benign neoplasm of right testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2479, N'D2922', N'Benign neoplasm of left testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2480, N'D2930', N'Benign neoplasm of unspecified epididymis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2481, N'D2931', N'Benign neoplasm of right epididymis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2482, N'D2932', N'Benign neoplasm of left epididymis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2483, N'D294', N'Benign neoplasm of scrotum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2484, N'D298', N'Benign neoplasm of other specified male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2485, N'D299', N'Benign neoplasm of male genital organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2486, N'D3000', N'Benign neoplasm of unspecified kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2487, N'D3001', N'Benign neoplasm of right kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2488, N'D3002', N'Benign neoplasm of left kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2489, N'D3010', N'Benign neoplasm of unspecified renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2490, N'D3011', N'Benign neoplasm of right renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2491, N'D3012', N'Benign neoplasm of left renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2492, N'D3020', N'Benign neoplasm of unspecified ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2493, N'D3021', N'Benign neoplasm of right ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2494, N'D3022', N'Benign neoplasm of left ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2495, N'D303', N'Benign neoplasm of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2496, N'D304', N'Benign neoplasm of urethra')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2497, N'D308', N'Benign neoplasm of other specified urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2498, N'D309', N'Benign neoplasm of urinary organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2499, N'D3100', N'Benign neoplasm of unspecified conjunctiva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2500, N'D3101', N'Benign neoplasm of right conjunctiva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2501, N'D3102', N'Benign neoplasm of left conjunctiva')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2502, N'D3110', N'Benign neoplasm of unspecified cornea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2503, N'D3111', N'Benign neoplasm of right cornea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2504, N'D3112', N'Benign neoplasm of left cornea')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2505, N'D3120', N'Benign neoplasm of unspecified retina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2506, N'D3121', N'Benign neoplasm of right retina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2507, N'D3122', N'Benign neoplasm of left retina')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2508, N'D3130', N'Benign neoplasm of unspecified choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2509, N'D3131', N'Benign neoplasm of right choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2510, N'D3132', N'Benign neoplasm of left choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2511, N'D3140', N'Benign neoplasm of unspecified ciliary body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2512, N'D3141', N'Benign neoplasm of right ciliary body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2513, N'D3142', N'Benign neoplasm of left ciliary body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2514, N'D3150', N'Benign neoplasm of unspecified lacrimal gland and duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2515, N'D3151', N'Benign neoplasm of right lacrimal gland and duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2516, N'D3152', N'Benign neoplasm of left lacrimal gland and duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2517, N'D3160', N'Benign neoplasm of unspecified site of unspecified orbit')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2518, N'D3161', N'Benign neoplasm of unspecified site of right orbit')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2519, N'D3162', N'Benign neoplasm of unspecified site of left orbit')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2520, N'D3190', N'Benign neoplasm of unspecified part of unspecified eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2521, N'D3191', N'Benign neoplasm of unspecified part of right eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2522, N'D3192', N'Benign neoplasm of unspecified part of left eye')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2523, N'D320', N'Benign neoplasm of cerebral meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2524, N'D321', N'Benign neoplasm of spinal meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2525, N'D329', N'Benign neoplasm of meninges, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2526, N'D330', N'Benign neoplasm of brain, supratentorial')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2527, N'D331', N'Benign neoplasm of brain, infratentorial')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2528, N'D332', N'Benign neoplasm of brain, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2529, N'D333', N'Benign neoplasm of cranial nerves')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2530, N'D334', N'Benign neoplasm of spinal cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2531, N'D337', N'Benign neoplasm of other specified parts of central nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2532, N'D339', N'Benign neoplasm of central nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2533, N'D34', N'Benign neoplasm of thyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2534, N'D3500', N'Benign neoplasm of unspecified adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2535, N'D3501', N'Benign neoplasm of right adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2536, N'D3502', N'Benign neoplasm of left adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2537, N'D351', N'Benign neoplasm of parathyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2538, N'D352', N'Benign neoplasm of pituitary gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2539, N'D353', N'Benign neoplasm of craniopharyngeal duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2540, N'D354', N'Benign neoplasm of pineal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2541, N'D355', N'Benign neoplasm of carotid body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2542, N'D356', N'Benign neoplasm of aortic body and other paraganglia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2543, N'D357', N'Benign neoplasm of other specified endocrine glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2544, N'D359', N'Benign neoplasm of endocrine gland, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2545, N'D360', N'Benign neoplasm of lymph nodes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2546, N'D3610', N'Benign neoplasm of peripheral nerves and autonomic nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2547, N'D3611', N'Benign neoplasm of peripheral nerves and autonomic nervous system of face, head, and neck')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2548, N'D3612', N'Benign neoplasm of peripheral nerves and autonomic nervous system, upper limb, including shoulder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2549, N'D3613', N'Benign neoplasm of peripheral nerves and autonomic nervous system of lower limb, including hip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2550, N'D3614', N'Benign neoplasm of peripheral nerves and autonomic nervous system of thorax')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2551, N'D3615', N'Benign neoplasm of peripheral nerves and autonomic nervous system of abdomen')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2552, N'D3616', N'Benign neoplasm of peripheral nerves and autonomic nervous system of pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2553, N'D3617', N'Benign neoplasm of peripheral nerves and autonomic nervous system of trunk, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2554, N'D367', N'Benign neoplasm of other specified sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2555, N'D369', N'Benign neoplasm, unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2556, N'D3701', N'Neoplasm of uncertain behavior of lip')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2557, N'D3702', N'Neoplasm of uncertain behavior of tongue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2558, N'D37030', N'Neoplasm of uncertain behavior of the parotid salivary glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2559, N'D37031', N'Neoplasm of uncertain behavior of the sublingual salivary glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2560, N'D37032', N'Neoplasm of uncertain behavior of the submandibular salivary glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2561, N'D37039', N'Neoplasm of uncertain behavior of the major salivary glands, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2562, N'D3704', N'Neoplasm of uncertain behavior of the minor salivary glands')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2563, N'D3705', N'Neoplasm of uncertain behavior of pharynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2564, N'D3709', N'Neoplasm of uncertain behavior of other specified sites of the oral cavity')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2565, N'D371', N'Neoplasm of uncertain behavior of stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2566, N'D372', N'Neoplasm of uncertain behavior of small intestine')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2567, N'D373', N'Neoplasm of uncertain behavior of appendix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2568, N'D374', N'Neoplasm of uncertain behavior of colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2569, N'D375', N'Neoplasm of uncertain behavior of rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2570, N'D376', N'Neoplasm of uncertain behavior of liver, gallbladder and bile ducts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2571, N'D378', N'Neoplasm of uncertain behavior of other specified digestive organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2572, N'D379', N'Neoplasm of uncertain behavior of digestive organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2573, N'D380', N'Neoplasm of uncertain behavior of larynx')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2574, N'D381', N'Neoplasm of uncertain behavior of trachea, bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2575, N'D382', N'Neoplasm of uncertain behavior of pleura')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2576, N'D383', N'Neoplasm of uncertain behavior of mediastinum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2577, N'D384', N'Neoplasm of uncertain behavior of thymus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2578, N'D385', N'Neoplasm of uncertain behavior of other respiratory organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2579, N'D386', N'Neoplasm of uncertain behavior of respiratory organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2580, N'D390', N'Neoplasm of uncertain behavior of uterus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2581, N'D3910', N'Neoplasm of uncertain behavior of unspecified ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2582, N'D3911', N'Neoplasm of uncertain behavior of right ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2583, N'D3912', N'Neoplasm of uncertain behavior of left ovary')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2584, N'D392', N'Neoplasm of uncertain behavior of placenta')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2585, N'D398', N'Neoplasm of uncertain behavior of other specified female genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2586, N'D399', N'Neoplasm of uncertain behavior of female genital organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2587, N'D3A00', N'Benign carcinoid tumor of unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2588, N'D3A010', N'Benign carcinoid tumor of the duodenum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2589, N'D3A011', N'Benign carcinoid tumor of the jejunum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2590, N'D3A012', N'Benign carcinoid tumor of the ileum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2591, N'D3A019', N'Benign carcinoid tumor of the small intestine, unspecified portion')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2592, N'D3A020', N'Benign carcinoid tumor of the appendix')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2593, N'D3A021', N'Benign carcinoid tumor of the cecum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2594, N'D3A022', N'Benign carcinoid tumor of the ascending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2595, N'D3A023', N'Benign carcinoid tumor of the transverse colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2596, N'D3A024', N'Benign carcinoid tumor of the descending colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2597, N'D3A025', N'Benign carcinoid tumor of the sigmoid colon')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2598, N'D3A026', N'Benign carcinoid tumor of the rectum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2599, N'D3A029', N'Benign carcinoid tumor of the large intestine, unspecified portion')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2600, N'D3A090', N'Benign carcinoid tumor of the bronchus and lung')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2601, N'D3A091', N'Benign carcinoid tumor of the thymus')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2602, N'D3A092', N'Benign carcinoid tumor of the stomach')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2603, N'D3A093', N'Benign carcinoid tumor of the kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2604, N'D3A094', N'Benign carcinoid tumor of the foregut, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2605, N'D3A095', N'Benign carcinoid tumor of the midgut, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2606, N'D3A096', N'Benign carcinoid tumor of the hindgut, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2607, N'D3A098', N'Benign carcinoid tumors of other sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2608, N'D3A8', N'Other benign neuroendocrine tumors')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2609, N'D400', N'Neoplasm of uncertain behavior of prostate')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2610, N'D4010', N'Neoplasm of uncertain behavior of unspecified testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2611, N'D4011', N'Neoplasm of uncertain behavior of right testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2612, N'D4012', N'Neoplasm of uncertain behavior of left testis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2613, N'D408', N'Neoplasm of uncertain behavior of other specified male genital organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2614, N'D409', N'Neoplasm of uncertain behavior of male genital organ, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2615, N'D4100', N'Neoplasm of uncertain behavior of unspecified kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2616, N'D4101', N'Neoplasm of uncertain behavior of right kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2617, N'D4102', N'Neoplasm of uncertain behavior of left kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2618, N'D4110', N'Neoplasm of uncertain behavior of unspecified renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2619, N'D4111', N'Neoplasm of uncertain behavior of right renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2620, N'D4112', N'Neoplasm of uncertain behavior of left renal pelvis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2621, N'D4120', N'Neoplasm of uncertain behavior of unspecified ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2622, N'D4121', N'Neoplasm of uncertain behavior of right ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2623, N'D4122', N'Neoplasm of uncertain behavior of left ureter')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2624, N'D413', N'Neoplasm of uncertain behavior of urethra')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2625, N'D414', N'Neoplasm of uncertain behavior of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2626, N'D418', N'Neoplasm of uncertain behavior of other specified urinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2627, N'D419', N'Neoplasm of uncertain behavior of unspecified urinary organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2628, N'D420', N'Neoplasm of uncertain behavior of cerebral meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2629, N'D421', N'Neoplasm of uncertain behavior of spinal meninges')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2630, N'D429', N'Neoplasm of uncertain behavior of meninges, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2631, N'D430', N'Neoplasm of uncertain behavior of brain, supratentorial')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2632, N'D431', N'Neoplasm of uncertain behavior of brain, infratentorial')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2633, N'D432', N'Neoplasm of uncertain behavior of brain, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2634, N'D433', N'Neoplasm of uncertain behavior of cranial nerves')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2635, N'D434', N'Neoplasm of uncertain behavior of spinal cord')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2636, N'D438', N'Neoplasm of uncertain behavior of other specified parts of central nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2637, N'D439', N'Neoplasm of uncertain behavior of central nervous system, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2638, N'D440', N'Neoplasm of uncertain behavior of thyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2639, N'D4410', N'Neoplasm of uncertain behavior of unspecified adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2640, N'D4411', N'Neoplasm of uncertain behavior of right adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2641, N'D4412', N'Neoplasm of uncertain behavior of left adrenal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2642, N'D442', N'Neoplasm of uncertain behavior of parathyroid gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2643, N'D443', N'Neoplasm of uncertain behavior of pituitary gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2644, N'D444', N'Neoplasm of uncertain behavior of craniopharyngeal duct')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2645, N'D445', N'Neoplasm of uncertain behavior of pineal gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2646, N'D446', N'Neoplasm of uncertain behavior of carotid body')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2647, N'D447', N'Neoplasm of uncertain behavior of aortic body and other paraganglia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2648, N'D449', N'Neoplasm of uncertain behavior of unspecified endocrine gland')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2649, N'D45', N'Polycythemia vera')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2650, N'D460', N'Refractory anemia without ring sideroblasts, so stated')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2651, N'D461', N'Refractory anemia with ring sideroblasts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2652, N'D4620', N'Refractory anemia with excess of blasts, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2653, N'D4621', N'Refractory anemia with excess of blasts 1')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2654, N'D4622', N'Refractory anemia with excess of blasts 2')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2655, N'D464', N'Refractory anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2656, N'D469', N'Myelodysplastic syndrome, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2657, N'D46A', N'Refractory cytopenia with multilineage dysplasia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2658, N'D46B', N'Refractory cytopenia with multilineage dysplasia and ring sideroblasts')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2659, N'D46C', N'Myelodysplastic syndrome with isolated del(5q) chromosomal abnormality')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2660, N'D46Z', N'Other myelodysplastic syndromes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2661, N'D470', N'Histiocytic and mast cell tumors of uncertain behavior')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2662, N'D4701', N'Cutaneous mastocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2663, N'D4702', N'Systemic mastocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2664, N'D4709', N'Other mast cell neoplasms of uncertain behavior')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2665, N'D471', N'Chronic myeloproliferative disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2666, N'D472', N'Monoclonal gammopathy')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2667, N'D473', N'Essential (hemorrhagic) thrombocythemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2668, N'D474', N'Osteomyelofibrosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2669, N'D479', N'Neoplasm of uncertain behavior of lymphoid, hematopoietic and related tissue, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2670, N'D47Z1', N'Post-transplant lymphoproliferative disorder (PTLD)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2671, N'D47Z2', N'Castleman disease')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2672, N'D47Z9', N'Other specified neoplasms of uncertain behavior of lymphoid, hematopoietic and related tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2673, N'D480', N'Neoplasm of uncertain behavior of bone and articular cartilage')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2674, N'D481', N'Neoplasm of uncertain behavior of connective and other soft tissue')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2675, N'D482', N'Neoplasm of uncertain behavior of peripheral nerves and autonomic nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2676, N'D483', N'Neoplasm of uncertain behavior of retroperitoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2677, N'D484', N'Neoplasm of uncertain behavior of peritoneum')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2678, N'D485', N'Neoplasm of uncertain behavior of skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2679, N'D4860', N'Neoplasm of uncertain behavior of unspecified breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2680, N'D4861', N'Neoplasm of uncertain behavior of right breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2681, N'D4862', N'Neoplasm of uncertain behavior of left breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2682, N'D487', N'Neoplasm of uncertain behavior of other specified sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2683, N'D489', N'Neoplasm of uncertain behavior, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2684, N'D490', N'Neoplasm of unspecified behavior of digestive system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2685, N'D491', N'Neoplasm of unspecified behavior of respiratory system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2686, N'D492', N'Neoplasm of unspecified behavior of bone, soft tissue, and skin')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2687, N'D493', N'Neoplasm of unspecified behavior of breast')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2688, N'D494', N'Neoplasm of unspecified behavior of bladder')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2689, N'D495', N'Neoplasm of unspecified behavior of other genitourinary organs')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2690, N'D49511', N'Neoplasm of unspecified behavior of right kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2691, N'D49512', N'Neoplasm of unspecified behavior of left kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2692, N'D49519', N'Neoplasm of unspecified behavior of unspecified kidney')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2693, N'D4959', N'Neoplasm of unspecified behavior of other genitourinary organ')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2694, N'D496', N'Neoplasm of unspecified behavior of brain')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2695, N'D497', N'Neoplasm of unspecified behavior of endocrine glands and other parts of nervous system')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2696, N'D4981', N'Neoplasm of unspecified behavior of retina and choroid')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2697, N'D4989', N'Neoplasm of unspecified behavior of other specified sites')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2698, N'D499', N'Neoplasm of unspecified behavior of unspecified site')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2699, N'D500', N'Iron deficiency anemia secondary to blood loss (chronic)')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2700, N'D501', N'Sideropenic dysphagia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2701, N'D508', N'Other iron deficiency anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2702, N'D509', N'Iron deficiency anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2703, N'D510', N'Vitamin B12 deficiency anemia due to intrinsic factor deficiency')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2704, N'D511', N'Vitamin B12 deficiency anemia due to selective vitamin B12 malabsorption with proteinuria')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2705, N'D512', N'Transcobalamin II deficiency')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2706, N'D513', N'Other dietary vitamin B12 deficiency anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2707, N'D518', N'Other vitamin B12 deficiency anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2708, N'D519', N'Vitamin B12 deficiency anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2709, N'D520', N'Dietary folate deficiency anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2710, N'D521', N'Drug-induced folate deficiency anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2711, N'D528', N'Other folate deficiency anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2712, N'D529', N'Folate deficiency anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2713, N'D530', N'Protein deficiency anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2714, N'D531', N'Other megaloblastic anemias, not elsewhere classified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2715, N'D532', N'Scorbutic anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2716, N'D538', N'Other specified nutritional anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2717, N'D539', N'Nutritional anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2718, N'D550', N'Anemia due to glucose-6-phosphate dehydrogenase [G6PD] deficiency')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2719, N'D551', N'Anemia due to other disorders of glutathione metabolism')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2720, N'D552', N'Anemia due to disorders of glycolytic enzymes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2721, N'D553', N'Anemia due to disorders of nucleotide metabolism')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2722, N'D558', N'Other anemias due to enzyme disorders')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2723, N'D559', N'Anemia due to enzyme disorder, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2724, N'D560', N'Alpha thalassemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2725, N'D561', N'Beta thalassemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2726, N'D562', N'Delta-beta thalassemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2727, N'D563', N'Thalassemia minor')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2728, N'D564', N'Hereditary persistence of fetal hemoglobin [HPFH]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2729, N'D565', N'Hemoglobin E-beta thalassemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2730, N'D568', N'Other thalassemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2731, N'D569', N'Thalassemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2732, N'D5700', N'Hb-SS disease with crisis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2733, N'D5701', N'Hb-SS disease with acute chest syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2734, N'D5702', N'Hb-SS disease with splenic sequestration')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2735, N'D571', N'Sickle-cell disease without crisis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2736, N'D5720', N'Sickle-cell/Hb-C disease without crisis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2737, N'D57211', N'Sickle-cell/Hb-C disease with acute chest syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2738, N'D57212', N'Sickle-cell/Hb-C disease with splenic sequestration')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2739, N'D57219', N'Sickle-cell/Hb-C disease with crisis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2740, N'D573', N'Sickle-cell trait')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2741, N'D5740', N'Sickle-cell thalassemia without crisis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2742, N'D57411', N'Sickle-cell thalassemia with acute chest syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2743, N'D57412', N'Sickle-cell thalassemia with splenic sequestration')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2744, N'D57419', N'Sickle-cell thalassemia with crisis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2745, N'D5780', N'Other sickle-cell disorders without crisis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2746, N'D57811', N'Other sickle-cell disorders with acute chest syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2747, N'D57812', N'Other sickle-cell disorders with splenic sequestration')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2748, N'D57819', N'Other sickle-cell disorders with crisis, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2749, N'D580', N'Hereditary spherocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2750, N'D581', N'Hereditary elliptocytosis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2751, N'D582', N'Other hemoglobinopathies')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2752, N'D588', N'Other specified hereditary hemolytic anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2753, N'D589', N'Hereditary hemolytic anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2754, N'D590', N'Drug-induced autoimmune hemolytic anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2755, N'D591', N'Other autoimmune hemolytic anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2756, N'D592', N'Drug-induced nonautoimmune hemolytic anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2757, N'D593', N'Hemolytic-uremic syndrome')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2758, N'D594', N'Other nonautoimmune hemolytic anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2759, N'D595', N'Paroxysmal nocturnal hemoglobinuria [Marchiafava-Micheli]')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2760, N'D596', N'Hemoglobinuria due to hemolysis from other external causes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2761, N'D598', N'Other acquired hemolytic anemias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2762, N'D599', N'Acquired hemolytic anemia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2763, N'D600', N'Chronic acquired pure red cell aplasia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2764, N'D601', N'Transient acquired pure red cell aplasia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2765, N'D608', N'Other acquired pure red cell aplasias')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2766, N'D609', N'Acquired pure red cell aplasia, unspecified')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2767, N'D6101', N'Constitutional (pure) red blood cell aplasia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2768, N'D6109', N'Other constitutional aplastic anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2769, N'D611', N'Drug-induced aplastic anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2770, N'D612', N'Aplastic anemia due to other external agents')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2771, N'D613', N'Idiopathic aplastic anemia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2772, N'D61810', N'Antineoplastic chemotherapy induced pancytopenia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2773, N'D61811', N'Other drug-induced pancytopenia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2774, N'D61818', N'Other pancytopenia')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2775, N'D6182', N'Myelophthisis')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2776, N'D6189', N'Other specified aplastic anemias and other bone marrow failure syndromes')
GO
INSERT [dbo].[icds] ([id], [code], [description]) VALUES (2777, N'D619', N'Aplastic anemia, unspecified')
GO
SET IDENTITY_INSERT [dbo].[icds] OFF
GO
SET IDENTITY_INSERT [dbo].[links] ON 
GO
INSERT [dbo].[links] ([id], [hash], [url], [expiresAt], [createdAt], [updatedAt], [requestId]) VALUES (1, N'V1-HEb6IS', N'/requests/room/2', NULL, CAST(N'2018-08-27T15:13:36.0000000' AS DateTime2), CAST(N'2018-08-27T15:13:36.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[links] ([id], [hash], [url], [expiresAt], [createdAt], [updatedAt], [requestId]) VALUES (2, N'V1ODrbpLr', N'/requests/room/2#attachments', NULL, CAST(N'2018-08-27T15:18:31.0000000' AS DateTime2), CAST(N'2018-08-27T15:18:31.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[links] ([id], [hash], [url], [expiresAt], [createdAt], [updatedAt], [requestId]) VALUES (3, N'410drWaIH', N'/requests/room/2#answers', NULL, CAST(N'2018-08-27T15:18:54.0000000' AS DateTime2), CAST(N'2018-08-27T15:18:54.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[links] ([id], [hash], [url], [expiresAt], [createdAt], [updatedAt], [requestId]) VALUES (4, N'V129uXpUH', N'/requests/2', NULL, CAST(N'2018-08-27T17:48:43.0000000' AS DateTime2), CAST(N'2018-08-27T17:48:43.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[links] ([id], [hash], [url], [expiresAt], [createdAt], [updatedAt], [requestId]) VALUES (5, N'4JBGjQpUB', N'/requests/room/3', NULL, CAST(N'2018-08-27T17:59:16.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:16.0000000' AS DateTime2), 3)
GO
INSERT [dbo].[links] ([id], [hash], [url], [expiresAt], [createdAt], [updatedAt], [requestId]) VALUES (6, N'4ygEsXaUS', N'/requests/room/3', NULL, CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), 3)
GO
SET IDENTITY_INSERT [dbo].[links] OFF
GO
SET IDENTITY_INSERT [dbo].[motives] ON 
GO
INSERT [dbo].[motives] ([id], [slug], [name]) VALUES (1, N'diagnosis-doubts', N'diagnosis-doubts')
GO
INSERT [dbo].[motives] ([id], [slug], [name]) VALUES (2, N'exam-results-doubts', N'exam-results-doubts')
GO
INSERT [dbo].[motives] ([id], [slug], [name]) VALUES (3, N'patient-not-evolving-as-expected', N'patient-not-evolving-as-expected')
GO
SET IDENTITY_INSERT [dbo].[motives] OFF
GO
SET IDENTITY_INSERT [dbo].[notifications] ON 
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (1, 2, N'seen', N'request', CAST(N'2018-08-27T15:12:48.1830000' AS DateTime2), CAST(N'2018-08-27T15:12:48.0000000' AS DateTime2), CAST(N'2018-08-27T15:12:48.0000000' AS DateTime2), 72, 73, NULL)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (2, 2, N'taken', N'request', CAST(N'2018-08-27T15:20:17.3180000' AS DateTime2), CAST(N'2018-08-27T15:13:36.0000000' AS DateTime2), CAST(N'2018-08-27T15:20:17.0000000' AS DateTime2), NULL, 72, 7)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (3, 2, N'attached', N'request', CAST(N'2018-08-27T15:20:23.0990000' AS DateTime2), CAST(N'2018-08-27T15:18:31.0000000' AS DateTime2), CAST(N'2018-08-27T15:20:23.0000000' AS DateTime2), 73, 72, 7)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (4, 2, N'answered', N'request', CAST(N'2018-08-27T15:20:24.9250000' AS DateTime2), CAST(N'2018-08-27T15:18:53.0000000' AS DateTime2), CAST(N'2018-08-27T15:20:24.0000000' AS DateTime2), 73, 72, 7)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (5, 2, N'closed', N'request', CAST(N'2018-08-27T17:59:02.2140000' AS DateTime2), CAST(N'2018-08-27T17:48:43.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:02.0000000' AS DateTime2), NULL, 73, 2)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (6, 3, N'seen', N'request', CAST(N'2018-08-27T17:58:48.3100000' AS DateTime2), CAST(N'2018-08-27T17:58:48.0000000' AS DateTime2), CAST(N'2018-08-27T17:58:48.0000000' AS DateTime2), 72, 73, NULL)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (7, 3, N'taken', N'request', NULL, CAST(N'2018-08-27T17:59:16.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:16.0000000' AS DateTime2), NULL, 72, 7)
GO
INSERT [dbo].[notifications] ([id], [foreignKey], [action], [model], [seenAt], [createdAt], [updatedAt], [senderId], [receiverId], [workplaceId]) VALUES (8, 3, N'messaged', N'request', NULL, CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), 73, 72, 7)
GO
SET IDENTITY_INSERT [dbo].[notifications] OFF
GO
SET IDENTITY_INSERT [dbo].[patients] ON 
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (1, N'Lucas Benjamín', N'Pontigo Rubio', N'23416786', CAST(N'2010-09-06T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-15T15:28:04.2000000' AS DateTime2), CAST(N'2015-09-15T15:28:04.2000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (2, N'Javier Alejandro', N'Bruna Cortés', N'24377431', CAST(N'2013-09-11T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-15T15:47:13.4570000' AS DateTime2), CAST(N'2015-09-15T15:47:13.4570000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (3, N'Jaime', N'Pinto Contreras', N'61425160', CAST(N'1948-11-02T00:00:00.0000000' AS DateTime2), N'illapel', CAST(N'2015-09-16T12:13:43.1410000' AS DateTime2), CAST(N'2015-09-16T12:13:43.1410000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (4, N'Christopher Alexander', N'Jofré Vega', N'232094532', CAST(N'2009-12-26T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-22T20:01:14.7830000' AS DateTime2), CAST(N'2015-09-22T20:01:14.7830000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (5, N'Juan Esteban', N'Cortes Cepeda', N'2766153k', CAST(N'1927-11-16T00:00:00.0000000' AS DateTime2), N'illapel', CAST(N'2015-09-26T13:03:19.4820000' AS DateTime2), CAST(N'2015-09-26T13:03:19.4820000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (6, N'Alicia', N'Pizarro Diaz', N'24676234', CAST(N'1921-04-23T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-26T13:13:36.7480000' AS DateTime2), CAST(N'2015-09-26T13:13:36.7480000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (7, N'Rosa', N'Lemus Astudillo', N'72765648', CAST(N'1964-04-18T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-26T13:27:08.1410000' AS DateTime2), CAST(N'2015-09-26T13:27:08.1410000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (8, N'Daniel Del Carmen', N'Campos Escobar', N'41550481', CAST(N'1937-11-02T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-26T13:34:28.5630000' AS DateTime2), CAST(N'2015-09-26T13:34:28.5630000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (9, N'Manuel Segundo', N'Brito Cortes', N'51768957', CAST(N'1943-06-29T00:00:00.0000000' AS DateTime2), N'salamanca', CAST(N'2015-09-26T13:50:59.6900000' AS DateTime2), CAST(N'2015-09-26T13:50:59.6900000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (10, N'Manuela', N'Guerrero Garcia', N'71560678', CAST(N'1941-05-14T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-26T13:56:20.6280000' AS DateTime2), CAST(N'2015-09-26T13:56:20.6280000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (11, N'Ines De Jesus', N'Aguilera Aguilera', N'82758569', CAST(N'1931-09-01T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-26T14:03:58.7540000' AS DateTime2), CAST(N'2015-09-26T14:03:58.7540000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (12, N'Diamantina Del Carmen', N'Alvarez Alvarez', N'39612356', CAST(N'1936-10-15T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-09-26T14:10:51.7240000' AS DateTime2), CAST(N'2015-09-26T14:10:51.7240000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (13, N'Paciente De Prueba', N'Prueba', N'123123123', CAST(N'2009-09-03T03:00:00.0000000' AS DateTime2), N'SANTIAGO', CAST(N'2015-09-30T17:40:27.6270000' AS DateTime2), CAST(N'2016-09-13T17:51:38.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (14, N'Samuel', N'Carmona Carmona', N'63306630', CAST(N'1950-07-29T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2015-10-09T16:02:38.4010000' AS DateTime2), CAST(N'2015-10-09T16:02:38.4010000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (15, N'Ibar Del Carmen', N'Cofré Carvajal', N'93757424', CAST(N'1962-10-29T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2015-10-09T16:05:45.1050000' AS DateTime2), CAST(N'2015-10-09T16:05:45.1050000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (16, N'Manuel Enrique', N'Cortés Ortiz', N'48401163', CAST(N'1939-05-05T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2015-10-09T16:09:51.2930000' AS DateTime2), CAST(N'2015-10-09T16:09:51.2930000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (17, N'Raúl Alejandro', N'Espinoza Contreras', N'165059212', CAST(N'1987-08-07T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2015-10-09T17:57:44.6340000' AS DateTime2), CAST(N'2015-10-09T17:57:44.6340000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (18, N'Karen Cecilia', N'Tordecilla Romero', N'159776808', CAST(N'1985-03-27T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T17:57:38.3970000' AS DateTime2), CAST(N'2015-10-14T17:57:38.3970000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (19, N'Rolando Del Carmen', N'Acosta Acosta', N'44592185', CAST(N'1939-09-10T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:02:20.7000000' AS DateTime2), CAST(N'2015-10-14T18:02:20.7000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (20, N'Claudia Veronica', N'Pérez Castillo', N'119412366', CAST(N'1972-05-29T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:15:26.1480000' AS DateTime2), CAST(N'2015-10-14T18:15:26.1480000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (21, N'Pedro Antonio', N'González Arredondo', N'61621792', CAST(N'1948-05-10T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:19:51.8060000' AS DateTime2), CAST(N'2015-10-14T18:19:51.8060000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (22, N'Leonardo Emilio', N'López Santa Cruz', N'21461075', CAST(N'1930-11-06T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:28:34.7440000' AS DateTime2), CAST(N'2015-10-14T18:28:34.7440000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (23, N'Manuel Antonio', N'Castillo Cuevas', N'56949267', CAST(N'1948-06-15T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:34:49.6670000' AS DateTime2), CAST(N'2015-10-14T18:34:49.6670000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (24, N'Emilio Vicente', N'Guerra Orellana', N'111630763', CAST(N'1967-03-16T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:39:53.5890000' AS DateTime2), CAST(N'2015-10-14T18:39:53.5890000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (25, N'Jose Domingo', N'Vargas Guerra', N'59468804', CAST(N'1949-10-29T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:44:05.1360000' AS DateTime2), CAST(N'2015-10-14T18:44:05.1360000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (26, N'Silvana Valericia', N'Escobar Pinto', N'129460687', CAST(N'1975-12-25T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:48:06.3080000' AS DateTime2), CAST(N'2015-10-14T18:48:06.3080000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (27, N'Nelly Del Carmen', N'Bugueño Lanas', N'105641087', CAST(N'1964-04-02T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2015-10-14T18:51:25.1300000' AS DateTime2), CAST(N'2015-10-14T18:51:25.1300000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (28, N'Alberto', N'Ramirez', N'88152972', CAST(N'1965-01-16T03:00:00.0000000' AS DateTime2), N'santiago', CAST(N'2015-10-26T15:40:20.4070000' AS DateTime2), CAST(N'2016-09-07T14:12:56.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (29, N'Pedro', N'Rivera Espinoza', N'31371813', CAST(N'1933-12-26T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2015-10-28T16:12:56.4440000' AS DateTime2), CAST(N'2015-10-28T16:12:56.4440000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (30, N'Bernardo', N'Villalobos Ramirez', N'8810918k', CAST(N'1960-02-03T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-11-03T14:50:58.6040000' AS DateTime2), CAST(N'2015-11-03T14:50:58.6040000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (31, N'Marilu', N'Cortes Ramirez', N'65172224', CAST(N'1950-07-22T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-11-05T13:26:17.5850000' AS DateTime2), CAST(N'2015-11-05T13:26:17.5850000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (32, N'Juan Pablo', N'Rodriguez Mendez', N'169787328', CAST(N'2005-11-06T00:00:00.0000000' AS DateTime2), N'Philips 40 , Santiago .Chile', CAST(N'2015-11-06T13:52:41.6850000' AS DateTime2), CAST(N'2015-11-06T13:52:41.6850000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (33, N'Edwardo', N'Mendez Apablza', N'202539696', CAST(N'2003-11-06T00:00:00.0000000' AS DateTime2), N'Merced 480 , Santiago .Chile', CAST(N'2015-11-06T14:07:03.3730000' AS DateTime2), CAST(N'2015-11-06T14:07:03.3730000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (34, N'Fabian Enrique', N'Delgado Madrid', N'21328944', CAST(N'1924-02-20T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-11T18:40:07.3310000' AS DateTime2), CAST(N'2015-11-11T18:40:07.3310000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (35, N'Olga Del Carmen', N'Fierro Fierro', N'75758871', CAST(N'1956-03-20T00:00:00.0000000' AS DateTime2), N'Los Vilos', CAST(N'2015-11-13T15:02:51.1570000' AS DateTime2), CAST(N'2015-11-19T20:09:52.6620000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (36, N'Wildo Israel', N'Astudillo Valle', N'113130180', CAST(N'1968-06-21T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-13T17:37:59.9250000' AS DateTime2), CAST(N'2015-11-13T17:37:59.9250000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (37, N'Oscar', N'Olivares', N'29429596', CAST(N'1929-12-18T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-13T20:27:59.1640000' AS DateTime2), CAST(N'2015-11-13T20:27:59.1640000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (38, N'Mauricio', N'Veas Veas', N'166891248', CAST(N'1987-03-24T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-13T20:49:44.6510000' AS DateTime2), CAST(N'2015-11-13T20:49:44.6510000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (39, N'Oriel', N'Aguilera Aguilera', N'43221019', CAST(N'1944-07-01T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-13T20:54:53.9790000' AS DateTime2), CAST(N'2015-11-13T20:54:53.9790000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (40, N'Manuel Mario', N'Ramírez Ramírez', N'56784934', CAST(N'1947-11-12T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-13T23:27:01.1300000' AS DateTime2), CAST(N'2015-11-13T23:27:01.1300000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (41, N'Cruz Manuel', N'Araya Orrego', N'34188866', CAST(N'1933-04-06T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-13T23:33:19.7170000' AS DateTime2), CAST(N'2015-11-13T23:33:19.7170000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (42, N'Carla Francesca', N'Cataldo Plaza', N'20384008k', CAST(N'2000-02-21T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-14T16:04:01.9580000' AS DateTime2), CAST(N'2015-11-14T16:04:01.9580000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (43, N'Luis', N'Ramirez Castillo', N'68541778', CAST(N'2015-11-17T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2015-11-17T20:52:25.9010000' AS DateTime2), CAST(N'2015-11-24T14:46:45.3870000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (44, N'Sergio Aliro', N'Flores Flores', N'92269590', CAST(N'1961-08-17T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-25T19:57:33.6870000' AS DateTime2), CAST(N'2015-11-25T19:57:33.6870000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (45, N'Jeraldin Estefanía', N'Plaza Ibarra', N'202032583', CAST(N'1999-07-15T00:00:00.0000000' AS DateTime2), N'Combarbalá', CAST(N'2015-11-26T18:37:46.8780000' AS DateTime2), CAST(N'2015-11-26T18:37:46.8780000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (46, N'Armando De La Cruz', N'Perez Valencia', N'109603805', CAST(N'1972-07-24T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-01-05T22:57:47.7010000' AS DateTime2), CAST(N'2016-01-05T22:57:47.7010000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (47, N'Andres Valerio', N'Rosas Rosas', N'150459834', CAST(N'1982-11-29T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-01-05T23:07:06.5770000' AS DateTime2), CAST(N'2016-01-05T23:07:06.5770000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (48, N'Lissette Jacqueline', N'Argandoña Sancho', N'129455209', CAST(N'1975-12-26T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-01-05T23:11:45.4370000' AS DateTime2), CAST(N'2016-01-05T23:11:45.4370000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (49, N'Gloria Soledad', N'Lemus Aracena', N'100695103', CAST(N'1963-12-04T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-01-05T23:14:47.8440000' AS DateTime2), CAST(N'2016-01-05T23:14:47.8440000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (50, N'Jose Victoriano', N'Araya Santander', N'66655725', CAST(N'1953-10-28T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-01-05T23:24:06.1260000' AS DateTime2), CAST(N'2016-01-05T23:24:06.1260000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (51, N'Pedro Del Carmen', N'Guerra Calderon', N'101028348', CAST(N'1964-03-14T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-01-05T23:29:27.4080000' AS DateTime2), CAST(N'2016-01-07T15:27:29.2980000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (52, N'Maria Angelica', N'Tapia Sanchez', N'85631985', CAST(N'1958-01-12T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-01-08T16:13:48.6600000' AS DateTime2), CAST(N'2016-01-08T16:13:48.6600000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (53, N'Esminda Angelica', N'Espinoza Tapia', N'85555669', CAST(N'1957-12-19T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-01-08T16:23:05.3600000' AS DateTime2), CAST(N'2016-01-08T16:23:05.3600000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (54, N'Guillermo', N'Tapia Calderon', N'65338866', CAST(N'1950-07-25T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-01-08T16:27:33.9740000' AS DateTime2), CAST(N'2016-01-08T16:27:33.9740000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (55, N'Marta', N'Villalon Porras', N'55338450', CAST(N'1942-01-09T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-01-08T18:29:20.9880000' AS DateTime2), CAST(N'2016-01-08T18:29:20.9880000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (56, N'Leontina De Las Mercedes', N'Leiva Navea', N'68879477', CAST(N'1951-08-01T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-01-08T18:37:10.4420000' AS DateTime2), CAST(N'2016-01-08T18:37:10.4420000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (57, N'Judith Del Carmen', N'Muñoz Muñoz', N'50023168', CAST(N'1944-01-11T00:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2016-01-11T22:21:02.1330000' AS DateTime2), CAST(N'2016-01-11T22:21:02.1330000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (58, N'Graciela', N'Vicencio Villalobos', N'5195937k', CAST(N'1933-05-05T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-01-13T12:23:10.4930000' AS DateTime2), CAST(N'2016-01-13T12:23:10.4930000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (59, N'Jose', N'Sanchez Soto', N'456456456', CAST(N'1950-01-04T00:00:00.0000000' AS DateTime2), N'Santiago', CAST(N'2016-01-20T14:25:14.2910000' AS DateTime2), CAST(N'2016-05-12T13:29:04.4370000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (60, N'Apolinario', N'Manque Vega', N'57026928', CAST(N'1946-07-23T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-20T18:28:53.1020000' AS DateTime2), CAST(N'2016-01-20T18:28:53.1020000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (61, N'Iván Gabriel', N'Serrano Tamayo', N'47292816', CAST(N'1946-10-28T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-20T18:35:06.6970000' AS DateTime2), CAST(N'2016-01-20T18:35:06.6970000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (62, N'Juan Domingo', N'Tapia Moyano', N'117845249', CAST(N'1970-12-13T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-20T18:42:42.4100000' AS DateTime2), CAST(N'2016-01-20T18:42:42.4100000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (63, N'Hipolito', N'Lemus Pallero', N'87319032', CAST(N'1960-06-13T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-20T18:47:15.3540000' AS DateTime2), CAST(N'2016-01-20T18:47:15.3540000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (64, N'Carlos Enrique', N'Vásquez Escalona', N'59849271', CAST(N'1943-05-16T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-20T18:50:58.5890000' AS DateTime2), CAST(N'2016-01-20T18:50:58.5890000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (65, N'Ricardo', N'Santelices Yañez', N'58283568', CAST(N'1951-12-18T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-20T18:57:27.2620000' AS DateTime2), CAST(N'2016-01-20T18:57:27.2620000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (66, N'Honorio', N'Arredondo Cortés', N'27661270', CAST(N'1927-08-10T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-21T11:44:47.5970000' AS DateTime2), CAST(N'2016-01-21T11:44:47.5970000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (67, N'Heriberto', N'González Tapia', N'49002610', CAST(N'1942-07-12T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-21T12:02:29.4590000' AS DateTime2), CAST(N'2016-01-21T12:02:29.4590000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (68, N'Francisco Javier', N'Cepeda Cepeda', N'144770048', CAST(N'1978-04-13T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-21T12:24:40.6330000' AS DateTime2), CAST(N'2016-01-21T12:24:40.6330000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (69, N'Patricia Cecilia', N'Alarcón Duran', N'107612068', CAST(N'1965-07-19T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-01-21T12:44:33.5430000' AS DateTime2), CAST(N'2016-01-21T12:44:33.5430000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (70, N'Isabel Del Tránsito', N'Roco Bugueño', N'90286528', CAST(N'1963-02-22T00:00:00.0000000' AS DateTime2), N'Coirón', CAST(N'2016-02-02T20:11:43.7300000' AS DateTime2), CAST(N'2016-02-02T20:11:43.7300000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (71, N'Victor', N'Mahuida Godoy', N'39540967', CAST(N'1934-05-03T00:00:00.0000000' AS DateTime2), N'Tranquilla', CAST(N'2016-02-02T22:02:08.7120000' AS DateTime2), CAST(N'2016-02-02T22:02:08.7120000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (72, N'Jaime', N'Roble Alfaro', N'45921131', CAST(N'1940-04-15T00:00:00.0000000' AS DateTime2), N'El Tambo', CAST(N'2016-02-02T22:07:44.7140000' AS DateTime2), CAST(N'2016-02-02T22:07:44.7140000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (73, N'Juan De La Cruz', N'Robles Orrego', N'86494833', CAST(N'1958-05-14T00:00:00.0000000' AS DateTime2), N'Cunlagua', CAST(N'2016-02-02T22:12:36.1990000' AS DateTime2), CAST(N'2016-02-02T22:12:36.1990000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (74, N'David Plácido', N'Chávez Maldonado', N'37359688', CAST(N'1932-10-05T03:00:00.0000000' AS DateTime2), N'Panguesillo', CAST(N'2016-02-02T22:19:25.9960000' AS DateTime2), CAST(N'2017-03-29T15:13:31.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (75, N'Juan', N'Aguilera Nuñez', N'2825525k', CAST(N'1928-04-20T00:00:00.0000000' AS DateTime2), N'Chillepin', CAST(N'2016-02-02T22:28:35.9100000' AS DateTime2), CAST(N'2016-02-02T22:28:35.9100000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (76, N'Benjamin', N'Fernandez Olivares', N'236202895', CAST(N'2011-04-16T00:00:00.0000000' AS DateTime2), N'Batuco', CAST(N'2016-02-02T22:33:57.7640000' AS DateTime2), CAST(N'2016-02-02T22:33:57.7640000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (77, N'María', N'Arredondo Díaz', N'11784661k', CAST(N'1971-04-07T00:00:00.0000000' AS DateTime2), N'Tranquilla', CAST(N'2016-02-02T22:41:44.2330000' AS DateTime2), CAST(N'2016-02-02T22:41:44.2330000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (78, N'Margarita', N'Castillo Castillo', N'7857884k', CAST(N'1949-07-25T00:00:00.0000000' AS DateTime2), N'Peladeros', CAST(N'2016-02-02T23:05:12.3020000' AS DateTime2), CAST(N'2016-02-02T23:05:12.3020000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (79, N'Manuel', N'Maldonado Navia', N'54590962', CAST(N'1945-06-16T00:00:00.0000000' AS DateTime2), N'Tranquilla', CAST(N'2016-02-12T21:03:12.9360000' AS DateTime2), CAST(N'2016-02-12T21:03:12.9360000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (80, N'Fresia De La Cruz', N'Castillo Astudillo', N'111817685', CAST(N'1966-11-20T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-02-24T18:15:11.8470000' AS DateTime2), CAST(N'2016-02-24T18:15:11.8470000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (81, N'Elbis', N'Ardiles Riveros', N'185806154', CAST(N'1993-08-19T00:00:00.0000000' AS DateTime2), N'illapel', CAST(N'2016-03-07T12:55:50.8700000' AS DateTime2), CAST(N'2016-03-07T12:55:50.8700000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (82, N'Patricia', N'Araya Araya', N'124207096', CAST(N'1972-04-19T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-03-07T17:59:48.6800000' AS DateTime2), CAST(N'2016-03-07T17:59:48.6800000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (83, N'Hernán', N'Cortés Cortés', N'36002344', CAST(N'1933-01-27T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-03-07T18:06:00.3060000' AS DateTime2), CAST(N'2016-03-07T18:25:34.7770000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (84, N'Héctor', N'Jofré Guerra', N'86189259', CAST(N'1959-03-10T00:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2016-03-07T18:15:29.5570000' AS DateTime2), CAST(N'2016-03-07T18:15:29.5570000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (85, N'Victor Manuel', N'Ramirez Vega', N'203007450', CAST(N'1999-12-23T00:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2016-03-08T12:14:22.5900000' AS DateTime2), CAST(N'2016-03-08T12:14:22.5900000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (86, N'María', N'Alfaro Rojas', N'129460245', CAST(N'1976-10-10T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2016-03-14T12:41:00.4140000' AS DateTime2), CAST(N'2016-03-14T12:41:00.4140000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (87, N'Isabel', N'Peña Vidal', N'154265716', CAST(N'1976-03-18T00:00:00.0000000' AS DateTime2), N'Valencia', CAST(N'2016-03-21T11:24:14.8200000' AS DateTime2), CAST(N'2016-03-23T15:37:36.5930000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (88, N'Luis', N'Rodriguez Sepulveda', N'49538286', CAST(N'1942-09-11T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-03-31T14:15:57.9500000' AS DateTime2), CAST(N'2016-04-05T20:13:51.5600000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (89, N'Virginia', N'Rodriguez Sepulveda', N'30531655', CAST(N'1931-02-20T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-03-31T14:27:28.7620000' AS DateTime2), CAST(N'2016-03-31T14:27:28.7620000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (90, N'Amelia', N'Olivares Loza', N'111358710', CAST(N'1966-07-10T00:00:00.0000000' AS DateTime2), N'ILLAPEL', CAST(N'2016-04-05T20:21:58.4990000' AS DateTime2), CAST(N'2016-04-05T20:21:58.4990000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (91, N'Sebastian', N'Calderon Olivares', N'201662400', CAST(N'1999-11-04T00:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2016-04-06T16:15:07.7260000' AS DateTime2), CAST(N'2016-04-06T16:15:07.7260000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (92, N'Dionisa', N'Cortés Alviña', N'3209869k', CAST(N'1928-02-01T00:00:00.0000000' AS DateTime2), N'illapel', CAST(N'2016-04-11T02:03:23.4860000' AS DateTime2), CAST(N'2016-04-11T02:03:23.4860000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (93, N'Natalia', N'Gomez', N'235630826', CAST(N'1990-12-06T03:00:00.0000000' AS DateTime2), N'SANTIAGO', CAST(N'2016-12-06T19:21:51.0000000' AS DateTime2), CAST(N'2016-12-06T19:21:51.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (94, N'Francisca', N'Poblete', N'148623562', CAST(N'1980-04-01T03:00:00.0000000' AS DateTime2), N'SANTIAGO', CAST(N'2016-12-06T19:26:43.0000000' AS DateTime2), CAST(N'2016-12-06T19:26:43.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (95, N'Malladyt Majalen', N'Vicencio González', N'179659158', CAST(N'1992-01-30T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:28:04.0000000' AS DateTime2), CAST(N'2017-01-09T12:28:04.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (96, N'Guido Damián', N'Aguilera Valenzuela', N'169742855', CAST(N'1988-09-22T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:31:38.0000000' AS DateTime2), CAST(N'2017-01-09T12:31:38.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (97, N'Alejandra Del Carmen', N'Castro Videla', N'134216220', CAST(N'1978-04-09T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:35:04.0000000' AS DateTime2), CAST(N'2017-01-09T12:35:04.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (98, N'Kerima Ester', N'Cisternas Palacios', N'107591699', CAST(N'1966-08-23T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:37:44.0000000' AS DateTime2), CAST(N'2017-01-09T12:37:44.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (99, N'Edison Yerco', N'Pizarro Díaz', N'208110942', CAST(N'2001-11-19T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:40:53.0000000' AS DateTime2), CAST(N'2017-01-09T12:40:53.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (100, N'Jordy Cristobal', N'Ugalde Araya', N'217355117', CAST(N'2004-12-15T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:47:07.0000000' AS DateTime2), CAST(N'2017-01-09T12:47:07.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (101, N'Maite Alejandra', N'Rivera Vera', N'210652612', CAST(N'2003-09-13T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:50:32.0000000' AS DateTime2), CAST(N'2017-01-09T12:50:32.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (102, N'Milendra Carolina', N'López Cuevas', N'254448214', CAST(N'2016-07-10T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:54:42.0000000' AS DateTime2), CAST(N'2017-01-09T12:54:42.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (103, N'Nicolas Benjamín', N'Huanel Villalobos', N'239282784', CAST(N'2012-04-19T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T12:58:08.0000000' AS DateTime2), CAST(N'2017-01-09T12:58:08.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (104, N'Agustín Patricio', N'Aguilera Gallardo', N'247758240', CAST(N'2014-10-20T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T13:00:58.0000000' AS DateTime2), CAST(N'2017-01-09T13:00:58.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (105, N'Angélica Carmen', N'Olivares Araya', N'13182128k', CAST(N'1976-03-22T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T15:53:18.0000000' AS DateTime2), CAST(N'2017-01-09T15:53:18.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (106, N'Elías Ruben', N'Brito Mondaca', N'162996150', CAST(N'1986-02-07T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T15:56:20.0000000' AS DateTime2), CAST(N'2017-01-09T15:56:20.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (107, N'Fabiola Del Carmen', N'Muñoz Vargas', N'90204432', CAST(N'1961-05-06T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T15:58:52.0000000' AS DateTime2), CAST(N'2017-01-09T15:58:52.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (108, N'Yolanda Emelina', N'Ossandón Tapia', N'125830293', CAST(N'1974-06-07T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:02:35.0000000' AS DateTime2), CAST(N'2017-01-09T16:02:35.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (109, N'Blanca Yesenia', N'Pizarro Aros', N'150469570', CAST(N'1982-10-27T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:06:28.0000000' AS DateTime2), CAST(N'2017-01-09T16:06:28.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (110, N'Regina De Mercedes', N'Fajardo Pérez', N'66063046', CAST(N'1949-11-10T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:12:46.0000000' AS DateTime2), CAST(N'2017-01-09T16:12:46.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (111, N'Analia Maricela', N'Alfaro Guerra', N'142966301', CAST(N'1975-05-13T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:18:46.0000000' AS DateTime2), CAST(N'2017-01-09T16:18:46.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (112, N'Camilo Enrique', N'Castro Barraza', N'70053616', CAST(N'1956-12-12T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:24:23.0000000' AS DateTime2), CAST(N'2017-01-09T16:24:23.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (113, N'Ramón Alonso', N'Escobar Astudillo', N'5986470k', CAST(N'1949-09-24T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:29:51.0000000' AS DateTime2), CAST(N'2017-01-09T16:29:51.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (114, N'Isabel Del Transito', N'Plaza Araya', N'64958615', CAST(N'1950-08-15T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:40:35.0000000' AS DateTime2), CAST(N'2017-01-09T16:40:35.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (115, N'Carmen América', N'Mayega Ossandón', N'81507716', CAST(N'1956-03-12T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:43:26.0000000' AS DateTime2), CAST(N'2017-01-09T16:43:26.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (116, N'Gloria Dore', N'Tirado Solís', N'65793814', CAST(N'1952-05-19T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:46:11.0000000' AS DateTime2), CAST(N'2017-01-09T16:46:11.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (117, N'Eddyzon José', N'Villalón Córtes', N'117281965', CAST(N'1971-11-07T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:48:11.0000000' AS DateTime2), CAST(N'2017-01-09T16:48:11.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (118, N'Jordán Marcelo', N'Castillo Vivanco', N'179691701', CAST(N'1992-03-17T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:49:54.0000000' AS DateTime2), CAST(N'2017-01-09T16:49:54.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (119, N'José Luis', N'Castro Guerra', N'150477387', CAST(N'1984-05-29T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T16:58:36.0000000' AS DateTime2), CAST(N'2017-01-09T16:58:36.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (120, N'Aracely Andrea', N'Ibacache Gómez', N'189994400', CAST(N'1995-11-19T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:00:38.0000000' AS DateTime2), CAST(N'2017-01-09T17:00:38.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (121, N'Roxana Del Carmen', N'Arredondo Calderón', N'189714300', CAST(N'1995-10-27T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:03:31.0000000' AS DateTime2), CAST(N'2017-01-09T17:03:31.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (122, N'Belén Jocelyn', N'Carvajal Flores', N'137499622', CAST(N'1980-03-26T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:05:06.0000000' AS DateTime2), CAST(N'2017-01-09T17:05:06.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (123, N'Paola Andrea', N'Villagrán Villaroel', N'128383956', CAST(N'1974-12-16T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:07:02.0000000' AS DateTime2), CAST(N'2017-01-09T17:07:02.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (124, N'Darío Antonio', N'Barraza Contreras', N'217560144', CAST(N'2005-01-10T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:09:10.0000000' AS DateTime2), CAST(N'2017-01-09T17:09:10.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (125, N'Mathías Agustín', N'Hidalgo Aguilera', N'246195668', CAST(N'2014-04-30T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:11:19.0000000' AS DateTime2), CAST(N'2017-01-09T17:11:19.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (126, N'Rosa Ester', N'Gallo Valenzuela', N'76074453', CAST(N'1959-01-19T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:13:52.0000000' AS DateTime2), CAST(N'2017-01-09T17:13:52.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (127, N'Héctor Del Tránsito', N'Piñones Galaz', N'109497843', CAST(N'1967-03-30T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:16:12.0000000' AS DateTime2), CAST(N'2017-01-09T17:16:12.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (128, N'Carlos Alid', N'Santana Salas', N'204078742', CAST(N'2000-01-23T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:18:05.0000000' AS DateTime2), CAST(N'2017-01-09T17:18:05.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (129, N'Rocío Alejandra', N'Gómez Rojas', N'215446999', CAST(N'2004-04-02T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:21:34.0000000' AS DateTime2), CAST(N'2017-01-09T17:21:34.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (130, N'Carolina Dominic', N'Nuñez Ramirez', N'21449650k', CAST(N'2003-11-20T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:23:22.0000000' AS DateTime2), CAST(N'2017-01-09T17:23:22.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (131, N'Isidora Ignacia', N'Valdes Molina', N'217198127', CAST(N'2004-11-17T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:25:23.0000000' AS DateTime2), CAST(N'2017-01-09T17:25:23.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (132, N'Nathacha Magdalena', N'Guerra Alfaro', N'216303113', CAST(N'2004-04-03T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:27:14.0000000' AS DateTime2), CAST(N'2017-01-09T17:27:14.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (133, N'María Jesús', N'General Navarro', N'209056127', CAST(N'2001-10-24T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:29:12.0000000' AS DateTime2), CAST(N'2017-01-09T17:29:12.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (134, N'Neila Bernardina', N'Barrera Flores', N'64198955', CAST(N'1948-04-04T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:40:08.0000000' AS DateTime2), CAST(N'2017-01-09T17:40:08.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (135, N'Nancy Del Carmen', N'Rojas Alquinta', N'86147092', CAST(N'1946-11-20T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:42:27.0000000' AS DateTime2), CAST(N'2017-01-09T17:42:27.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (136, N'Leonel Del Tránsito', N'Tello Tapía', N'78343877', CAST(N'1955-09-25T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:47:05.0000000' AS DateTime2), CAST(N'2017-01-09T17:47:05.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (137, N'Erica Del Rosario', N'Valencia Valenzuela', N'66484505', CAST(N'1951-06-27T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:49:31.0000000' AS DateTime2), CAST(N'2017-01-09T17:49:31.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (138, N'Carlos Antonio', N'Candia González', N'103269008', CAST(N'1967-05-12T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T17:51:23.0000000' AS DateTime2), CAST(N'2017-01-09T17:51:23.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (139, N'Jade Nasmia', N'Estay Flores', N'234701142', CAST(N'2010-10-30T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:55:31.0000000' AS DateTime2), CAST(N'2017-01-09T17:55:31.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (140, N'María Cristina', N'Calderón Lizama', N'70887320', CAST(N'1950-06-22T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T17:58:52.0000000' AS DateTime2), CAST(N'2017-01-09T17:58:52.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (141, N'Nancy Estrella', N'Fuentes Ordenes', N'58365769', CAST(N'1945-12-02T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:02:37.0000000' AS DateTime2), CAST(N'2017-01-09T18:02:37.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (142, N'Juana Feliza', N'Barrera Flores', N'64151924', CAST(N'1945-03-17T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:05:36.0000000' AS DateTime2), CAST(N'2017-01-09T18:05:36.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (143, N'Benedicto Alfonso', N'Tapia Valencia', N'43958410', CAST(N'1940-03-04T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:07:57.0000000' AS DateTime2), CAST(N'2017-01-09T18:07:57.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (144, N'Ayleen Belén', N'Carvajal Lucka', N'236268861', CAST(N'2011-04-19T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-09T18:12:00.0000000' AS DateTime2), CAST(N'2017-01-09T18:12:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (145, N'Plaverino Antonio', N'Pinto Pérez', N'3656833k', CAST(N'1933-02-15T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:14:58.0000000' AS DateTime2), CAST(N'2017-01-09T18:14:58.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (146, N'Alisson Masciel', N'Sagredo Ramirez', N'247653953', CAST(N'2014-10-09T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:16:58.0000000' AS DateTime2), CAST(N'2017-01-09T18:16:58.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (147, N'Patricio', N'Herrera Atora', N'71290573', CAST(N'1957-06-11T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:18:47.0000000' AS DateTime2), CAST(N'2017-01-09T18:18:47.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (148, N'Miryam Soledad', N'Tapia Donoso', N'85748564', CAST(N'1960-12-16T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:21:27.0000000' AS DateTime2), CAST(N'2017-01-09T18:21:27.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (149, N'María Ximena', N'Palacios Moreno', N'80162952', CAST(N'1961-02-21T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:23:23.0000000' AS DateTime2), CAST(N'2017-01-09T18:23:23.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (150, N'Violeta Del Mercedes', N'Olivares Contreras', N'106158096', CAST(N'1966-06-27T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:24:50.0000000' AS DateTime2), CAST(N'2017-01-09T18:24:50.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (151, N'Paola Jessica', N'Núñez Cruz', N'113841567', CAST(N'1969-06-06T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:26:31.0000000' AS DateTime2), CAST(N'2017-01-09T18:26:31.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (152, N'Isabel Del Rosario', N'Martínez Tapia', N'81449252', CAST(N'1962-05-16T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:28:06.0000000' AS DateTime2), CAST(N'2017-01-09T18:28:06.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (153, N'Marco Antonio', N'González Cisternas', N'204752443', CAST(N'2000-04-21T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:29:56.0000000' AS DateTime2), CAST(N'2017-01-09T18:29:56.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (154, N'Marisol Maribel', N'Carvajal Carvajal', N'150499844', CAST(N'1997-01-27T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:32:02.0000000' AS DateTime2), CAST(N'2017-01-09T18:32:02.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (155, N'Ibania Del Carmen', N'Leyton Cortés', N'113289090', CAST(N'1968-05-30T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:34:27.0000000' AS DateTime2), CAST(N'2017-01-09T18:34:27.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (156, N'María Pilar', N'Cortés Rodríguez', N'115142348', CAST(N'1970-09-20T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:37:00.0000000' AS DateTime2), CAST(N'2017-01-09T18:37:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (157, N'Teresa Ismenia', N'Astorga Plaza', N'61265635', CAST(N'1946-09-01T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:38:40.0000000' AS DateTime2), CAST(N'2017-01-09T18:38:40.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (158, N'Ana Mercedes', N'Segovia Cortés', N'54833407', CAST(N'1939-04-15T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:40:27.0000000' AS DateTime2), CAST(N'2017-01-09T18:40:27.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (159, N'Manuel Segundo', N'Vinet Argandoña', N'48725511', CAST(N'1939-04-11T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T18:43:46.0000000' AS DateTime2), CAST(N'2017-01-09T18:43:46.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (160, N'Agustina', N'González Vicencio', N'36590831', CAST(N'1926-09-24T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:07:49.0000000' AS DateTime2), CAST(N'2017-01-09T19:07:49.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (161, N'Daniel Alejandro', N'Navea Moyano', N'185893979', CAST(N'1994-05-10T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:10:48.0000000' AS DateTime2), CAST(N'2017-01-09T19:10:48.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (162, N'Fernando Emilio', N'Huerta Casanga', N'238437776', CAST(N'2012-01-11T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:12:53.0000000' AS DateTime2), CAST(N'2017-01-09T19:12:53.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (163, N'Vidal Del Rosario', N'Acevedo Cruz', N'44715171', CAST(N'1938-10-20T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:14:30.0000000' AS DateTime2), CAST(N'2017-01-09T19:14:30.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (164, N'Narcisa Daisi', N'González Montaño', N'230645698', CAST(N'1967-05-15T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:18:26.0000000' AS DateTime2), CAST(N'2017-01-09T19:18:26.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (165, N'Gabriel Alexis', N'Jamett Serrano', N'241436004', CAST(N'2012-12-16T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:20:57.0000000' AS DateTime2), CAST(N'2017-01-09T19:20:57.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (166, N'Anthony Dariel', N'Olmos Zavala', N'241520536', CAST(N'2012-12-28T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:25:21.0000000' AS DateTime2), CAST(N'2017-01-09T19:25:21.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (167, N'Víctor Hugo German', N'Orrego Gallardo', N'217409896', CAST(N'2004-12-29T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:27:29.0000000' AS DateTime2), CAST(N'2017-01-09T19:27:29.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (168, N'Matías Ignacio', N'Vega Vega', N'245568827', CAST(N'2014-03-06T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:29:29.0000000' AS DateTime2), CAST(N'2017-01-09T19:29:29.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (169, N'Damaris Abigail', N'Tapia Cortés', N'20166456k', CAST(N'1999-10-07T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:33:48.0000000' AS DateTime2), CAST(N'2017-01-09T19:33:48.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (170, N'Nayadeth Catalina', N'Uribe Lanas', N'212482986', CAST(N'2003-02-28T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:35:42.0000000' AS DateTime2), CAST(N'2017-01-09T19:35:42.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (171, N'Emily Yeray', N'English Villalobos', N'233848263', CAST(N'2010-07-27T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:37:46.0000000' AS DateTime2), CAST(N'2017-01-09T19:37:46.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (172, N'Alan Rodrigo', N'Oro Vega', N'217911885', CAST(N'2005-03-06T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:39:26.0000000' AS DateTime2), CAST(N'2017-01-09T19:39:26.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (173, N'Jade Sasha', N'Maldonado Miranda', N'226631577', CAST(N'2008-03-06T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:42:57.0000000' AS DateTime2), CAST(N'2017-01-09T19:42:57.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (174, N'Constanza Pascal', N'Espinoza Carvajal', N'237361199', CAST(N'2011-03-03T03:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:44:52.0000000' AS DateTime2), CAST(N'2017-01-09T19:44:52.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (175, N'Giuliana Rafaela', N'Aracena Oyazún', N'254210390', CAST(N'2016-06-24T04:00:00.0000000' AS DateTime2), N'Illapel', CAST(N'2017-01-09T19:47:15.0000000' AS DateTime2), CAST(N'2017-01-09T19:47:15.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (176, N'Luis', N'Lopez', N'75616767', CAST(N'1983-01-12T04:00:00.0000000' AS DateTime2), N'salamanca', CAST(N'2017-01-13T15:59:48.0000000' AS DateTime2), CAST(N'2017-01-13T15:59:48.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (177, N'Sofia', N'Astorga', N'23926252K', CAST(N'2017-01-03T03:00:00.0000000' AS DateTime2), N'SANTIAGO', CAST(N'2017-01-13T16:37:34.0000000' AS DateTime2), CAST(N'2017-01-13T16:37:34.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (178, N'Esteban', N'Valenzuela', N'168007507', CAST(N'2017-01-13T03:00:00.0000000' AS DateTime2), N'santiago', CAST(N'2017-01-13T17:44:31.0000000' AS DateTime2), CAST(N'2017-01-13T17:44:31.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (179, N'Judith', N'Aguilera Cuevas', N'150474892', CAST(N'1983-11-11T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-13T19:23:00.0000000' AS DateTime2), CAST(N'2017-01-13T19:23:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (180, N'Otilia', N'Vasquez Silva', N'97523762', CAST(N'1963-06-16T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-13T19:30:45.0000000' AS DateTime2), CAST(N'2017-01-13T19:30:45.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (181, N'Armanda', N'Puebla Aguilera', N'49554419', CAST(N'1944-07-28T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-13T19:32:44.0000000' AS DateTime2), CAST(N'2017-01-13T19:32:44.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (182, N'Alonso', N'González Miranda', N'88009908', CAST(N'1962-07-01T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-13T19:36:43.0000000' AS DateTime2), CAST(N'2017-01-13T19:36:43.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (183, N'Monica', N'Barraza Moyano', N'10075360k', CAST(N'1966-05-01T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-13T19:38:32.0000000' AS DateTime2), CAST(N'2017-01-13T19:38:32.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (184, N'Marcial', N'Valencia Cruz', N'129469323', CAST(N'1978-11-09T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-13T19:41:01.0000000' AS DateTime2), CAST(N'2017-01-13T19:41:01.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (185, N'Sofia', N'Astorga', N'196457887', CAST(N'1980-01-02T03:00:00.0000000' AS DateTime2), N'SANTIAGO', CAST(N'2017-01-14T01:07:59.0000000' AS DateTime2), CAST(N'2017-01-14T01:07:59.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (186, N'Luis', N'Carvajal Fredes', N'98735429', CAST(N'1963-12-08T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-18T12:33:49.0000000' AS DateTime2), CAST(N'2017-01-18T12:33:49.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (187, N'Pablina', N'Campos Lopez', N'91945169', CAST(N'1965-02-28T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-18T12:37:06.0000000' AS DateTime2), CAST(N'2017-01-18T12:37:06.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (188, N'Fanny', N'Calderon Jorquera', N'150453763', CAST(N'1982-01-29T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-18T12:39:02.0000000' AS DateTime2), CAST(N'2017-01-18T12:39:02.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (189, N'Sofia', N'Morel Alfaro', N'193515215', CAST(N'1996-01-06T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-18T13:32:24.0000000' AS DateTime2), CAST(N'2017-01-18T13:32:24.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (190, N'Claudia', N'Plaza Alzamora', N'119403103', CAST(N'1972-05-19T04:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-18T18:42:47.0000000' AS DateTime2), CAST(N'2017-01-18T18:42:47.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (191, N'Sandra', N'Molina Cortes', N'11783722K', CAST(N'1970-10-19T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-01-18T18:54:15.0000000' AS DateTime2), CAST(N'2017-01-18T18:54:15.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (192, N'Paz Antonia', N'Zumerzu Ollarzu', N'213232509', CAST(N'2003-06-21T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T15:39:12.0000000' AS DateTime2), CAST(N'2017-02-17T15:39:12.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (193, N'Maria', N'Collao Collao', N'75311982', CAST(N'1953-01-06T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T15:45:47.0000000' AS DateTime2), CAST(N'2017-02-17T15:45:47.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (194, N'Roberto', N'Arredondo Henriquez', N'75926529', CAST(N'1957-10-02T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T15:51:58.0000000' AS DateTime2), CAST(N'2017-02-17T15:51:58.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (195, N'Sara', N'Inostroza Astudillo', N'115150421', CAST(N'1970-01-05T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T15:55:05.0000000' AS DateTime2), CAST(N'2017-02-17T15:55:05.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (196, N'Sergio', N'Delgado Barraza', N'205562664', CAST(N'2001-02-27T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:02:21.0000000' AS DateTime2), CAST(N'2017-02-17T16:02:21.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (197, N'Nestor', N'Trigo Trigo', N'61658599', CAST(N'1950-06-05T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:06:13.0000000' AS DateTime2), CAST(N'2017-02-17T16:06:13.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (198, N'Hermes', N'Gallardo Gallardo', N'102647823', CAST(N'1965-02-24T03:00:00.0000000' AS DateTime2), N'los vilos', CAST(N'2017-02-17T16:09:23.0000000' AS DateTime2), CAST(N'2017-02-17T16:09:23.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (199, N'Romelia', N'Sagredo Rojo', N'110091788', CAST(N'1965-02-19T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:12:21.0000000' AS DateTime2), CAST(N'2017-02-17T16:12:21.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (200, N'Martina', N'Astudillo Aguilera', N'220131645', CAST(N'2005-12-29T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:15:36.0000000' AS DateTime2), CAST(N'2017-02-17T16:15:36.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (201, N'Alexis', N'Vicencio Collao', N'232300833', CAST(N'2010-01-18T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:21:43.0000000' AS DateTime2), CAST(N'2017-02-17T16:21:43.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (202, N'Jessica', N'Martinez Gonzalez', N'191438337', CAST(N'1995-06-06T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:24:47.0000000' AS DateTime2), CAST(N'2017-02-17T16:24:47.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (203, N'Eduardo', N'Escobar Flores', N'165051661', CAST(N'1987-06-18T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:27:34.0000000' AS DateTime2), CAST(N'2017-02-17T16:27:34.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (204, N'Moises', N'Jamett Moyano', N'81687978', CAST(N'1959-04-15T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T16:30:45.0000000' AS DateTime2), CAST(N'2017-02-17T16:30:45.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (205, N'Ruben', N'Tordecilla Gonzalez', N'79455768', CAST(N'1960-10-26T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:21:34.0000000' AS DateTime2), CAST(N'2017-02-17T17:21:34.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (206, N'Julian', N'Astudillo Ibacache', N'245923090', CAST(N'2014-04-07T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:24:48.0000000' AS DateTime2), CAST(N'2017-02-17T17:24:48.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (207, N'Benjamin', N'Lopez Mendoza', N'201401488', CAST(N'1999-04-14T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:28:34.0000000' AS DateTime2), CAST(N'2017-02-17T17:28:34.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (208, N'Susana', N'Rojas Gonzalez', N'102466292', CAST(N'1966-10-29T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:31:40.0000000' AS DateTime2), CAST(N'2017-02-17T17:31:40.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (209, N'Demerik', N'Olivares Gutierrez', N'250063296', CAST(N'2015-06-03T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:35:08.0000000' AS DateTime2), CAST(N'2017-02-17T17:35:08.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (210, N'Jaqueline', N'Cadenas Cruzatt', N'144802446', CAST(N'1972-04-02T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:40:12.0000000' AS DateTime2), CAST(N'2017-02-17T17:40:12.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (211, N'Grimaldina', N'Godoy Alvarado', N'87084000', CAST(N'1960-09-15T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:43:04.0000000' AS DateTime2), CAST(N'2017-02-17T17:43:04.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (212, N'Marcelino', N'Flores Zamora', N'80518196', CAST(N'1960-05-28T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:46:14.0000000' AS DateTime2), CAST(N'2017-02-17T17:46:14.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (213, N'Marta', N'Rojas Quijada', N'75899297', CAST(N'1957-11-05T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:49:03.0000000' AS DateTime2), CAST(N'2017-02-17T17:49:03.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (214, N'Marta', N'Salinas Villarroel', N'53727484', CAST(N'1946-03-18T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:51:59.0000000' AS DateTime2), CAST(N'2017-02-17T17:51:59.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (215, N'Maria', N'Castillo Ramos', N'55345228', CAST(N'1947-09-28T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:54:52.0000000' AS DateTime2), CAST(N'2017-02-17T17:54:52.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (216, N'Hipolito', N'Cuba Gallardo', N'63147389', CAST(N'1950-08-13T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:57:04.0000000' AS DateTime2), CAST(N'2017-02-17T17:57:04.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (217, N'Mary', N'Legua Tordecilla', N'106019908', CAST(N'1959-06-13T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T17:59:25.0000000' AS DateTime2), CAST(N'2017-02-17T17:59:25.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (218, N'Eloisa', N'Badillo Olivares', N'56563903', CAST(N'2017-02-17T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:01:12.0000000' AS DateTime2), CAST(N'2017-02-17T18:01:12.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (219, N'Carlos', N'Tapia Soto', N'83630272', CAST(N'1957-07-22T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:03:39.0000000' AS DateTime2), CAST(N'2017-02-17T18:03:39.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (220, N'Ceferina', N'Colipe Benavente', N'6171586k', CAST(N'1938-11-23T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:06:04.0000000' AS DateTime2), CAST(N'2017-02-17T18:06:04.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (221, N'Yolanda', N'San Martin Gonzalez', N'58183024', CAST(N'1950-04-18T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:12:50.0000000' AS DateTime2), CAST(N'2017-02-17T18:12:50.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (222, N'Margarita', N'Godoy Castillo', N'37947865', CAST(N'1929-06-12T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:15:29.0000000' AS DateTime2), CAST(N'2017-02-17T18:15:29.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (223, N'Fresia', N'Olivares Badillo', N'79984604', CAST(N'1950-04-25T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:18:00.0000000' AS DateTime2), CAST(N'2017-02-17T18:18:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (224, N'Maria', N'Torres Salgado', N'80500491', CAST(N'1955-06-13T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:22:07.0000000' AS DateTime2), CAST(N'2017-02-17T18:22:07.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (225, N'Luis', N'Avalos Collao', N'40213481', CAST(N'1936-04-02T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:25:28.0000000' AS DateTime2), CAST(N'2017-02-17T18:25:28.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (226, N'Jose', N'Cortes Briceño', N'51463285', CAST(N'1943-05-23T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:27:47.0000000' AS DateTime2), CAST(N'2017-02-17T18:27:47.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (227, N'Nilda', N'Godoy Carmona', N'105430620', CAST(N'1964-09-16T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:30:07.0000000' AS DateTime2), CAST(N'2017-02-17T18:30:07.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (228, N'Olga', N'Ollarzu Leiva', N'47131278', CAST(N'1936-04-11T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:32:37.0000000' AS DateTime2), CAST(N'2017-02-17T18:32:37.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (229, N'Gricelda', N'Carrasco Ibarra', N'38499890', CAST(N'1937-11-22T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:34:33.0000000' AS DateTime2), CAST(N'2017-02-17T18:34:33.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (230, N'Rosa', N'Riquelme Torrealba', N'71732029', CAST(N'1952-09-16T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:36:45.0000000' AS DateTime2), CAST(N'2017-02-17T18:36:45.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (231, N'Eliana', N'Cañete Manriquez', N'72296028', CAST(N'1957-11-04T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:38:39.0000000' AS DateTime2), CAST(N'2017-02-17T18:38:39.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (232, N'Jose', N'Huerta Tapia', N'144379519', CAST(N'1971-07-08T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:43:12.0000000' AS DateTime2), CAST(N'2017-02-17T18:43:12.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (233, N'Silvio', N'Gonzalez Cesped', N'40048634', CAST(N'1936-05-06T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:46:58.0000000' AS DateTime2), CAST(N'2017-02-17T18:46:58.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (234, N'Tomas', N'Cesped Guerrero', N'219408269', CAST(N'2005-09-15T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:48:52.0000000' AS DateTime2), CAST(N'2017-02-17T18:48:52.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (235, N'Wilson', N'Astudillo Riffo', N'58776815', CAST(N'1954-09-24T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:51:13.0000000' AS DateTime2), CAST(N'2017-02-17T18:51:13.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (236, N'Juan', N'Tapia Olmos', N'52104203', CAST(N'1944-05-26T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:53:21.0000000' AS DateTime2), CAST(N'2017-02-17T18:53:21.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (237, N'Silvia', N'Ahumada Aguilera', N'6988329k', CAST(N'1956-02-22T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:55:49.0000000' AS DateTime2), CAST(N'2017-02-17T18:55:49.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (238, N'Ramon', N'Garcia Saavedra', N'34822735', CAST(N'1940-09-02T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T18:57:59.0000000' AS DateTime2), CAST(N'2017-02-17T18:57:59.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (239, N'Judith', N'Carrillo Carrillo', N'89241790', CAST(N'1961-10-26T03:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T19:00:02.0000000' AS DateTime2), CAST(N'2017-02-17T19:00:02.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (240, N'Javiera', N'Silva Plaza', N'236829146', CAST(N'2011-07-01T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T19:02:09.0000000' AS DateTime2), CAST(N'2017-02-17T19:02:09.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (241, N'Felipe', N'Mejias Lavin', N'246991413', CAST(N'2014-07-30T04:00:00.0000000' AS DateTime2), N'LOS VILOS', CAST(N'2017-02-17T19:08:49.0000000' AS DateTime2), CAST(N'2017-02-17T19:08:49.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (242, N'Eduvilde', N'Plaza Gonzalez', N'67720776', CAST(N'1940-10-10T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:11:07.0000000' AS DateTime2), CAST(N'2017-02-17T19:11:07.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (243, N'Ramon', N'Alvarez Alvarez', N'35692967', CAST(N'1930-05-15T04:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:13:25.0000000' AS DateTime2), CAST(N'2017-02-17T19:13:25.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (244, N'Lucila', N'Muñoz Muñoz', N'33958536', CAST(N'1932-05-19T04:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:15:27.0000000' AS DateTime2), CAST(N'2017-02-17T19:15:27.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (245, N'Gloria', N'Elgueta Alucema', N'80869541', CAST(N'1958-11-14T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:17:41.0000000' AS DateTime2), CAST(N'2017-02-17T19:17:41.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (246, N'Hortencia', N'Meneses Cortes', N'106572054', CAST(N'1966-08-02T04:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:20:09.0000000' AS DateTime2), CAST(N'2017-02-17T19:20:09.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (247, N'Eva', N'Robles Robles', N'106738025', CAST(N'1961-10-12T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:22:20.0000000' AS DateTime2), CAST(N'2017-02-17T19:22:20.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (248, N'Eliana', N'Vilches Pizarro', N'70275635', CAST(N'1944-10-08T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:24:48.0000000' AS DateTime2), CAST(N'2017-02-17T19:24:48.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (249, N'Brunilda', N'Ugueño Zambra', N'66655547', CAST(N'1954-01-19T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:28:03.0000000' AS DateTime2), CAST(N'2017-02-17T19:28:03.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (250, N'Juan', N'Avalos Barraza', N'61678298', CAST(N'1948-08-23T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:30:04.0000000' AS DateTime2), CAST(N'2017-02-17T19:30:04.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (251, N'Corina', N'Carvajal Sanchez', N'57543159', CAST(N'1949-08-02T04:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:33:24.0000000' AS DateTime2), CAST(N'2017-02-17T19:33:24.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (252, N'Cecilia', N'Gonzalez Tabilo', N'101407829', CAST(N'1967-03-30T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:35:24.0000000' AS DateTime2), CAST(N'2017-02-17T19:35:24.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (253, N'Sergio', N'Chaparro Rivera', N'45388417', CAST(N'1940-02-23T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:39:43.0000000' AS DateTime2), CAST(N'2017-02-17T19:39:43.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (254, N'Andres', N'Rojas Rojo', N'72285948', CAST(N'1951-02-09T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:41:24.0000000' AS DateTime2), CAST(N'2017-02-17T19:41:24.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (255, N'Samuel', N'Avalos Avalos', N'61047913', CAST(N'1948-08-30T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:43:29.0000000' AS DateTime2), CAST(N'2017-02-17T19:43:29.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (256, N'Emelina', N'Barraza Martinez', N'59713353', CAST(N'1938-02-12T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:45:43.0000000' AS DateTime2), CAST(N'2017-02-17T19:45:43.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (257, N'Monserrat', N'Astorga Castillo', N'245006438', CAST(N'2013-12-29T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:48:07.0000000' AS DateTime2), CAST(N'2017-02-17T19:48:07.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (258, N'Guillermo', N'Carvajal Leyton', N'128155414', CAST(N'1975-04-19T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:52:45.0000000' AS DateTime2), CAST(N'2017-02-17T19:52:45.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (259, N'Ruth', N'Vega Pereira', N'8595265k', CAST(N'1953-02-28T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:55:35.0000000' AS DateTime2), CAST(N'2017-02-17T19:55:35.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (260, N'Mauricio', N'Vicencio Plaza', N'205562745', CAST(N'2001-03-07T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T19:58:01.0000000' AS DateTime2), CAST(N'2017-02-17T19:58:01.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (261, N'Irma', N'Berrera', N'97307229', CAST(N'1960-08-18T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:00:10.0000000' AS DateTime2), CAST(N'2017-02-17T20:00:10.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (262, N'Gumercinda', N'Briceño Tello', N'103618436', CAST(N'1964-01-13T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:03:00.0000000' AS DateTime2), CAST(N'2017-02-17T20:03:00.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (263, N'Fanny', N'Plaza Araya', N'13360281k', CAST(N'1978-09-30T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:05:06.0000000' AS DateTime2), CAST(N'2017-02-17T20:05:06.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (264, N'Honorino', N'Jorquera Carmona', N'113289988', CAST(N'1968-10-10T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:06:48.0000000' AS DateTime2), CAST(N'2017-02-17T20:06:48.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (265, N'Maria', N'Bugueño Cisternas', N'96368410', CAST(N'1960-02-14T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:08:28.0000000' AS DateTime2), CAST(N'2017-02-17T20:08:28.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (266, N'Guacolda', N'Olivares Galleguillos', N'77666435', CAST(N'1949-08-27T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:10:48.0000000' AS DateTime2), CAST(N'2017-02-17T20:10:48.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (267, N'Grimaldina', N'Avalos Astudillo', N'66791270', CAST(N'1952-02-01T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:14:44.0000000' AS DateTime2), CAST(N'2017-02-17T20:14:44.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (268, N'Maria', N'Saavedra Rojas', N'70900017', CAST(N'1953-09-02T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:18:10.0000000' AS DateTime2), CAST(N'2017-02-17T20:18:10.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (269, N'Maria', N'Bugueño Lemus', N'76015570', CAST(N'1935-02-08T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:20:03.0000000' AS DateTime2), CAST(N'2017-02-17T20:20:03.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (270, N'Honoria', N'Ledezma Bugueño', N'80544189', CAST(N'1957-12-18T03:00:00.0000000' AS DateTime2), N'CANELA', CAST(N'2017-02-17T20:23:29.0000000' AS DateTime2), CAST(N'2017-02-17T20:23:29.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (271, N'Jose', N'Rojo Castillo', N'66607720', CAST(N'1955-01-05T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T15:40:50.0000000' AS DateTime2), CAST(N'2017-03-07T15:40:50.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (272, N'Anibal', N'Meza Rojas', N'37764108', CAST(N'1935-10-08T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T15:47:19.0000000' AS DateTime2), CAST(N'2017-03-07T15:47:19.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (273, N'Iris', N'Gonzalez Arredondo', N'80584512', CAST(N'1946-01-05T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T15:53:58.0000000' AS DateTime2), CAST(N'2017-03-07T15:53:58.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (274, N'Clelia', N'Tapia Gonzalez', N'68543096', CAST(N'1939-11-20T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T15:59:18.0000000' AS DateTime2), CAST(N'2017-03-07T15:59:18.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (275, N'Maria', N'Rojo Jorquera', N'82110631', CAST(N'1958-05-28T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T16:05:21.0000000' AS DateTime2), CAST(N'2017-03-07T16:05:21.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (276, N'Eva', N'Barraza Zepeda', N'61836950', CAST(N'1944-12-13T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T16:10:06.0000000' AS DateTime2), CAST(N'2017-03-07T16:10:06.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (277, N'Dagoberto', N'Ossandon Aguilera', N'65117347', CAST(N'1951-01-15T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-07T16:14:36.0000000' AS DateTime2), CAST(N'2017-03-07T16:14:36.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (278, N'Gladys', N'Nanco Macaya', N'67713273', CAST(N'1951-03-16T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-03-07T16:23:09.0000000' AS DateTime2), CAST(N'2017-03-07T16:23:09.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (279, N'Leonilda', N'Cortes Garcia', N'60535361', CAST(N'1944-04-16T03:00:00.0000000' AS DateTime2), N'EL TAMBO', CAST(N'2017-03-14T18:14:21.0000000' AS DateTime2), CAST(N'2017-03-14T18:14:21.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (280, N'Ismenia', N'Cortes Araya', N'85563467', CAST(N'1954-02-06T03:00:00.0000000' AS DateTime2), N'EL TAMBO', CAST(N'2017-03-14T18:22:42.0000000' AS DateTime2), CAST(N'2017-03-14T18:22:42.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (281, N'Jesica Natalia', N'Moreno Valenzuela', N'131818815', CAST(N'1977-05-01T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-21T18:05:27.0000000' AS DateTime2), CAST(N'2017-03-21T18:05:27.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (282, N'Niza', N'Tapia Vega', N'78768479', CAST(N'1953-04-17T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-21T18:14:21.0000000' AS DateTime2), CAST(N'2017-03-21T18:14:21.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (283, N'Elena', N'Quiroz Barraza', N'72270568', CAST(N'1940-03-09T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-21T18:22:09.0000000' AS DateTime2), CAST(N'2017-03-21T18:22:09.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (284, N'Agustin', N'Bugueño Moreno', N'58028541', CAST(N'1947-04-20T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-21T18:29:41.0000000' AS DateTime2), CAST(N'2017-03-21T18:29:41.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (285, N'Juana', N'Castillo Castillo', N'65858282', CAST(N'1952-02-27T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-21T18:39:13.0000000' AS DateTime2), CAST(N'2017-03-21T18:39:13.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (286, N'Elizardo', N'Carvajal Carvajal', N'51104404', CAST(N'1941-09-20T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-21T18:56:34.0000000' AS DateTime2), CAST(N'2017-03-21T18:56:34.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (287, N'Angela', N'Bugueño Moreno', N'68382092', CAST(N'1941-04-22T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T18:12:29.0000000' AS DateTime2), CAST(N'2017-03-24T18:12:29.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (288, N'Gladys', N'Pizarro Ardiles', N'75653603', CAST(N'1956-08-10T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T18:19:19.0000000' AS DateTime2), CAST(N'2017-03-24T18:19:19.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (289, N'Juan', N'Pizarro Saldivar', N'47136571', CAST(N'1941-05-25T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T18:23:12.0000000' AS DateTime2), CAST(N'2017-03-24T18:23:12.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (290, N'Lucinda', N'Astudillo Astudillo', N'51961021', CAST(N'1944-07-14T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T18:35:10.0000000' AS DateTime2), CAST(N'2017-03-24T18:35:10.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (291, N'Maria', N'Cadiu Arancibia', N'83888806', CAST(N'1948-10-02T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T18:39:16.0000000' AS DateTime2), CAST(N'2017-03-24T18:39:16.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (292, N'Daniela', N'Barraza Valenzuela', N'179657007', CAST(N'1991-06-23T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T18:57:57.0000000' AS DateTime2), CAST(N'2017-03-24T18:57:57.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (293, N'Fabiola', N'Tapia Tapia', N'120226819', CAST(N'1968-03-28T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:00:33.0000000' AS DateTime2), CAST(N'2017-03-24T19:00:33.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (294, N'Juana', N'Saavedra Saavedra', N'55045518', CAST(N'1947-08-30T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:06:19.0000000' AS DateTime2), CAST(N'2017-03-24T19:06:19.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (295, N'Manuel', N'Fernandez Olivares', N'6850189K', CAST(N'1953-01-03T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:09:50.0000000' AS DateTime2), CAST(N'2017-03-24T19:09:50.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (296, N'Martina', N'Tapia Gonzalez', N'49221010', CAST(N'1927-10-20T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:13:18.0000000' AS DateTime2), CAST(N'2017-03-24T19:13:18.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (297, N'Ricardina', N'Castillo Camaño', N'61389474', CAST(N'1954-08-03T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:20:01.0000000' AS DateTime2), CAST(N'2017-03-24T19:20:01.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (298, N'Rosa', N'Maya Villalobos', N'70522756', CAST(N'1946-11-14T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:23:06.0000000' AS DateTime2), CAST(N'2017-03-24T19:23:06.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (299, N'Carolina', N'Calderon Payacan', N'12428354K', CAST(N'1973-08-15T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:27:02.0000000' AS DateTime2), CAST(N'2017-03-24T19:27:02.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (300, N'Elia', N'Layana Layana', N'68880564', CAST(N'1935-01-28T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:31:48.0000000' AS DateTime2), CAST(N'2017-03-24T19:31:48.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (301, N'Luis', N'Tapia Olivares', N'52300940', CAST(N'1943-11-19T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-24T19:59:55.0000000' AS DateTime2), CAST(N'2017-03-24T19:59:55.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (302, N'Silvia', N'Olivares Valencia', N'6420288K', CAST(N'1946-08-31T03:00:00.0000000' AS DateTime2), N'Salamanca', CAST(N'2017-03-29T12:39:07.0000000' AS DateTime2), CAST(N'2017-03-29T12:39:07.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (303, N'Clotilde', N'Valencia Tapia', N'59679384', CAST(N'1944-09-18T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T12:44:10.0000000' AS DateTime2), CAST(N'2017-03-29T12:44:10.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (304, N'Florinda', N'Aguilera Rojo', N'71128598', CAST(N'1954-07-02T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T12:48:12.0000000' AS DateTime2), CAST(N'2017-03-29T12:48:12.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (305, N'Herminia', N'Campos Alvarez', N'93742877', CAST(N'1962-11-23T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T12:51:26.0000000' AS DateTime2), CAST(N'2017-03-29T12:51:26.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (306, N'Irelba', N'Guerra Puelles', N'68880572', CAST(N'1924-02-27T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T12:55:46.0000000' AS DateTime2), CAST(N'2017-03-29T12:55:46.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (307, N'Jalima', N'Suarez Suarez', N'68880459', CAST(N'1948-12-27T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T12:59:30.0000000' AS DateTime2), CAST(N'2017-03-29T12:59:30.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (308, N'Juana', N'Valencia Acevedo', N'8692093K', CAST(N'1955-11-08T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:04:57.0000000' AS DateTime2), CAST(N'2017-03-29T13:04:57.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (309, N'Leonardo', N'Valencia Vargas', N'10735686K', CAST(N'1966-10-13T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:13:29.0000000' AS DateTime2), CAST(N'2017-03-29T13:13:29.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (310, N'Maria', N'Briceño Camus', N'77070915', CAST(N'1949-03-18T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:16:37.0000000' AS DateTime2), CAST(N'2017-03-29T13:16:37.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (311, N'Maria', N'Rojo Saavedra', N'75195494', CAST(N'1953-10-02T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:20:39.0000000' AS DateTime2), CAST(N'2017-03-29T13:20:39.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (312, N'Sara', N'Martinez Leon', N'91789175', CAST(N'1962-08-10T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:24:46.0000000' AS DateTime2), CAST(N'2017-03-29T13:24:46.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (313, N'Isia', N'Soto Rojas', N'88111079', CAST(N'1953-02-12T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:29:13.0000000' AS DateTime2), CAST(N'2017-03-29T13:29:13.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (314, N'Manuel', N'Figueroa Rocco', N'57564512', CAST(N'1946-07-01T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:33:38.0000000' AS DateTime2), CAST(N'2017-03-29T13:33:38.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (315, N'Rosa', N'Maldonado Pinto', N'57078650', CAST(N'1944-06-01T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T13:56:23.0000000' AS DateTime2), CAST(N'2017-03-29T13:56:23.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (316, N'Silvia', N'Chavez Vega', N'66185869', CAST(N'1946-08-01T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:02:41.0000000' AS DateTime2), CAST(N'2017-03-29T14:02:41.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (317, N'Hugo', N'Chaparro Castillo', N'41109378', CAST(N'1939-07-14T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:06:43.0000000' AS DateTime2), CAST(N'2017-03-29T14:06:43.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (318, N'Petronila', N'Dubo Cortes', N'67625331', CAST(N'1926-01-31T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:10:26.0000000' AS DateTime2), CAST(N'2017-03-29T14:10:26.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (319, N'Clementina', N'Castro Aguilera', N'66856143', CAST(N'1936-09-15T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:13:51.0000000' AS DateTime2), CAST(N'2017-03-29T14:13:51.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (320, N'Marcial', N'Espinoza Olivares', N'31415675', CAST(N'1930-09-28T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:18:23.0000000' AS DateTime2), CAST(N'2017-03-29T14:18:23.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (321, N'Lidia', N'Saavedra Cortes', N'36019298', CAST(N'1928-03-15T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:23:22.0000000' AS DateTime2), CAST(N'2017-03-29T14:23:22.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (322, N'Rosa', N'Plaza Chavez', N'41504382', CAST(N'1935-11-12T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:29:30.0000000' AS DateTime2), CAST(N'2017-03-29T14:29:30.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (323, N'Elena', N'Valencia Acevedo', N'5112555K', CAST(N'1939-05-03T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:38:16.0000000' AS DateTime2), CAST(N'2017-03-29T14:38:16.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (324, N'Juan', N'Suarez Barraza', N'124280400', CAST(N'1969-12-04T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:51:41.0000000' AS DateTime2), CAST(N'2017-03-29T14:51:41.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (325, N'Ema', N'Ortega Ortega', N'90804758', CAST(N'1961-04-15T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T14:56:35.0000000' AS DateTime2), CAST(N'2017-03-29T14:56:35.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (326, N'Roxana', N'Vicencio Barraza', N'109207578', CAST(N'1968-12-16T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T15:02:17.0000000' AS DateTime2), CAST(N'2017-03-29T15:02:17.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (327, N'Mercedes', N'Collao Carrasco', N'55820368', CAST(N'1948-09-30T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T15:09:37.0000000' AS DateTime2), CAST(N'2017-03-29T15:09:37.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (328, N'Victoria', N'Vargas Latin', N'68880157', CAST(N'1947-09-15T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T15:30:08.0000000' AS DateTime2), CAST(N'2017-03-29T15:30:08.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (329, N'Cristina', N'Godoy Cortes', N'64202898', CAST(N'1946-06-18T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T15:37:35.0000000' AS DateTime2), CAST(N'2017-03-29T15:37:35.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (330, N'Elsa', N'Arredondo Cortes', N'87097234', CAST(N'1958-12-03T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T17:31:05.0000000' AS DateTime2), CAST(N'2017-03-29T17:31:05.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (331, N'Luis', N'Mondaca Saavedra', N'87319040', CAST(N'1960-09-07T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T17:35:27.0000000' AS DateTime2), CAST(N'2017-03-29T17:35:27.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (332, N'Jose', N'Castillo Moyano', N'57540060', CAST(N'1947-04-11T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T17:40:50.0000000' AS DateTime2), CAST(N'2017-03-29T17:40:50.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (333, N'Hilda', N'Pizarro Maldonado', N'53404952', CAST(N'1943-08-11T04:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T17:45:59.0000000' AS DateTime2), CAST(N'2017-03-29T17:45:59.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (334, N'Maria', N'Olivares Aguilera', N'51959809', CAST(N'1942-09-01T03:00:00.0000000' AS DateTime2), N'SALAMANCA', CAST(N'2017-03-29T17:50:43.0000000' AS DateTime2), CAST(N'2017-03-29T17:50:43.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (335, N'Victor', N'Coronado', N'125353061', CAST(N'1973-05-02T04:00:00.0000000' AS DateTime2), N'Santiago', CAST(N'2017-05-22T21:46:14.0000000' AS DateTime2), CAST(N'2018-08-23T20:37:38.0000000' AS DateTime2), 1)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (336, N'Prueba', N'Prueba', N'104526918', CAST(N'1987-05-05T03:00:00.0000000' AS DateTime2), N'Santiago', CAST(N'2017-05-22T21:47:46.0000000' AS DateTime2), CAST(N'2017-05-22T21:47:46.0000000' AS DateTime2), 2)
GO
INSERT [dbo].[patients] ([id], [firstname], [lastname], [run], [birth], [city], [createdAt], [updatedAt], [genderId]) VALUES (337, N'Francisca', N'Mansilla', N'178302914', CAST(N'1986-10-25T03:00:00.0000000' AS DateTime2), N'Santiago', CAST(N'2017-05-25T15:26:36.0000000' AS DateTime2), CAST(N'2017-05-25T15:26:36.0000000' AS DateTime2), 2)
GO
SET IDENTITY_INSERT [dbo].[patients] OFF
GO
SET IDENTITY_INSERT [dbo].[preferences] ON 
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (1, 1, 1, 0, 1, 0, 1, CAST(N'2016-02-11T19:20:39.8630000' AS DateTime2), CAST(N'2016-09-13T17:18:00.0000000' AS DateTime2), 19, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (2, 1, 1, 1, 1, 1, 0, CAST(N'2016-03-31T13:40:49.3680000' AS DateTime2), CAST(N'2016-09-13T17:18:00.0000000' AS DateTime2), 20, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (3, 1, 1, 1, 1, 1, 1, CAST(N'2016-09-05T19:57:55.0000000' AS DateTime2), CAST(N'2016-09-13T17:18:00.0000000' AS DateTime2), 56, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (4, 1, 1, 1, 1, 1, 1, CAST(N'2016-09-05T19:59:34.0000000' AS DateTime2), CAST(N'2016-09-13T17:18:00.0000000' AS DateTime2), 57, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (5, 1, 1, 1, 1, 1, 1, CAST(N'2016-09-07T12:59:04.0000000' AS DateTime2), CAST(N'2016-09-13T17:18:00.0000000' AS DateTime2), 32, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (6, 1, 1, 1, 1, 1, 1, CAST(N'2016-11-04T11:47:31.0000000' AS DateTime2), CAST(N'2016-11-04T11:47:31.0000000' AS DateTime2), 46, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (7, 1, 1, 1, 1, 1, 1, CAST(N'2016-11-23T19:15:47.0000000' AS DateTime2), CAST(N'2016-11-23T19:15:47.0000000' AS DateTime2), 51, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (8, 0, 0, 0, 0, 0, 1, CAST(N'2016-12-06T19:17:51.0000000' AS DateTime2), CAST(N'2016-12-06T19:18:04.0000000' AS DateTime2), 65, 0, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (9, 0, 0, 1, 0, 1, 0, CAST(N'2016-12-06T19:19:01.0000000' AS DateTime2), CAST(N'2016-12-06T19:19:04.0000000' AS DateTime2), 64, 1, 0)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (10, 1, 1, 1, 1, 1, 1, CAST(N'2016-12-30T15:09:08.0000000' AS DateTime2), CAST(N'2016-12-30T15:09:08.0000000' AS DateTime2), 68, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (11, 1, 1, 1, 1, 1, 1, CAST(N'2017-01-09T13:15:16.0000000' AS DateTime2), CAST(N'2017-01-09T13:15:16.0000000' AS DateTime2), 63, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (12, 1, 1, 1, 1, 1, 1, CAST(N'2017-01-09T13:22:55.0000000' AS DateTime2), CAST(N'2017-01-09T13:22:55.0000000' AS DateTime2), 70, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (13, 1, 1, 1, 1, 1, 1, CAST(N'2017-01-09T18:35:08.0000000' AS DateTime2), CAST(N'2017-01-09T18:35:08.0000000' AS DateTime2), 69, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (14, 1, 1, 1, 1, 1, 1, CAST(N'2017-01-13T16:40:09.0000000' AS DateTime2), CAST(N'2017-01-13T16:40:09.0000000' AS DateTime2), 71, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (15, 1, 1, 1, 1, 1, 1, CAST(N'2017-01-13T23:33:25.0000000' AS DateTime2), CAST(N'2017-01-13T23:33:25.0000000' AS DateTime2), 72, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (16, 1, 1, 1, 1, 1, 1, CAST(N'2017-01-13T23:42:18.0000000' AS DateTime2), CAST(N'2017-01-13T23:42:18.0000000' AS DateTime2), 73, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (17, 1, 1, 1, 1, 1, 1, CAST(N'2017-02-23T19:32:51.0000000' AS DateTime2), CAST(N'2017-02-23T19:32:51.0000000' AS DateTime2), 67, 1, 1)
GO
INSERT [dbo].[preferences] ([id], [emailRequestAttached], [emailRequestAnswered], [emailRequestReturned], [emailRequestMessaged], [emailRequestClosed], [emailRequestTaken], [createdAt], [updatedAt], [userId], [emailRequestCreated], [soundNotifications]) VALUES (18, 1, 1, 1, 1, 1, 1, CAST(N'2017-05-22T21:00:49.0000000' AS DateTime2), CAST(N'2017-05-22T21:00:49.0000000' AS DateTime2), 22, 1, 1)
GO
SET IDENTITY_INSERT [dbo].[preferences] OFF
GO
SET IDENTITY_INSERT [dbo].[priorities] ON 
GO
INSERT [dbo].[priorities] ([id], [slug], [name]) VALUES (1, N'low-priority', N'low-priority')
GO
INSERT [dbo].[priorities] ([id], [slug], [name]) VALUES (2, N'important', N'important')
GO
INSERT [dbo].[priorities] ([id], [slug], [name]) VALUES (3, N'urgent', N'urgent')
GO
SET IDENTITY_INSERT [dbo].[priorities] OFF
GO
SET IDENTITY_INSERT [dbo].[requestAnswerDiagnoses] ON 
GO
INSERT [dbo].[requestAnswerDiagnoses] ([id], [evaluation], [confirmed], [description], [therapeuticPlan], [checkupDate], [checkupExamsRequired], [checkupSameSpecialist], [checkupComment], [createdAt], [updatedAt], [requestAnswerId], [checkupModeId]) VALUES (1, N'fgfgfgf', 1, N'comment', N'hghgghghg', NULL, NULL, NULL, NULL, CAST(N'2018-08-27T15:18:53.0000000' AS DateTime2), CAST(N'2018-08-27T15:18:53.0000000' AS DateTime2), 1, NULL)
GO
SET IDENTITY_INSERT [dbo].[requestAnswerDiagnoses] OFF
GO
SET IDENTITY_INSERT [dbo].[requestAnswers] ON 
GO
INSERT [dbo].[requestAnswers] ([id], [comment], [seenAt], [createdAt], [updatedAt], [requestId], [workplaceId], [userId]) VALUES (1, NULL, CAST(N'2018-08-27T15:20:52.1720000' AS DateTime2), CAST(N'2018-08-27T15:18:53.0000000' AS DateTime2), CAST(N'2018-08-27T15:20:52.0000000' AS DateTime2), 2, 2, 73)
GO
SET IDENTITY_INSERT [dbo].[requestAnswers] OFF
GO
SET IDENTITY_INSERT [dbo].[requestAttachments] ON 
GO
INSERT [dbo].[requestAttachments] ([id], [name], [description], [seenAt], [createdAt], [updatedAt], [workplaceId], [requestId], [userId]) VALUES (1, N'fgffgfgfg', N'gfgfgffgfgf', CAST(N'2018-08-27T15:55:08.3570000' AS DateTime2), CAST(N'2018-08-27T15:18:31.0000000' AS DateTime2), CAST(N'2018-08-27T15:55:08.0000000' AS DateTime2), 2, 2, 73)
GO
SET IDENTITY_INSERT [dbo].[requestAttachments] OFF
GO
SET IDENTITY_INSERT [dbo].[requestMessages] ON 
GO
INSERT [dbo].[requestMessages] ([id], [type], [body], [sentAt], [receivedAt], [createdAt], [updatedAt], [workplaceId], [requestId], [userId]) VALUES (1, N'text', N'hello', CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), NULL, CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:43.0000000' AS DateTime2), 2, 3, 73)
GO
SET IDENTITY_INSERT [dbo].[requestMessages] OFF
GO
SET IDENTITY_INSERT [dbo].[requests] ON 
GO
INSERT [dbo].[requests] ([id], [hypothesis], [comment], [closedAt], [createdAt], [updatedAt], [specialtyId], [priorityId], [patientId], [motiveId], [requestTypeId], [creatorUserId], [creatorWorkplaceId], [specialistUserId], [specialistWorkplaceId], [rayenSicId]) VALUES (1, N'stomachache', N'medication', NULL, CAST(N'2018-08-23T20:37:38.0000000' AS DateTime2), CAST(N'2018-08-23T20:37:38.0000000' AS DateTime2), 1, 2, 335, 1, 2, 72, 5, NULL, NULL, NULL)
GO
INSERT [dbo].[requests] ([id], [hypothesis], [comment], [closedAt], [createdAt], [updatedAt], [specialtyId], [priorityId], [patientId], [motiveId], [requestTypeId], [creatorUserId], [creatorWorkplaceId], [specialistUserId], [specialistWorkplaceId], [rayenSicId]) VALUES (2, N'comment', N'comment', CAST(N'2018-08-27T17:48:43.4060000' AS DateTime2), CAST(N'2018-08-27T15:10:34.0000000' AS DateTime2), CAST(N'2018-08-27T17:48:43.0000000' AS DateTime2), 15, 1, 335, 2, 1, 72, 7, 73, 2, NULL)
GO
INSERT [dbo].[requests] ([id], [hypothesis], [comment], [closedAt], [createdAt], [updatedAt], [specialtyId], [priorityId], [patientId], [motiveId], [requestTypeId], [creatorUserId], [creatorWorkplaceId], [specialistUserId], [specialistWorkplaceId], [rayenSicId]) VALUES (3, N'hypothesis', N'comment', NULL, CAST(N'2018-08-27T17:55:44.0000000' AS DateTime2), CAST(N'2018-08-27T17:59:16.0000000' AS DateTime2), 15, 2, 335, 2, 2, 72, 7, 73, 2, NULL)
GO
SET IDENTITY_INSERT [dbo].[requests] OFF
GO
SET IDENTITY_INSERT [dbo].[requestTypes] ON 
GO
INSERT [dbo].[requestTypes] ([id], [slug], [name]) VALUES (1, N'consultation', N'consultation')
GO
INSERT [dbo].[requestTypes] ([id], [slug], [name]) VALUES (2, N'diagnosis', N'diagnosis')
GO
SET IDENTITY_INSERT [dbo].[requestTypes] OFF
GO
SET IDENTITY_INSERT [dbo].[roles] ON 
GO
INSERT [dbo].[roles] ([id], [slug], [name]) VALUES (1, N'admin', N'admin')
GO
INSERT [dbo].[roles] ([id], [slug], [name]) VALUES (2, N'user', N'user')
GO
SET IDENTITY_INSERT [dbo].[roles] OFF
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20160823123000-new-request-notifications.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20160824110000-sound-notifications.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20161109110000-workplace-deis.js')
GO
INSERT [dbo].[SequelizeMeta] ([name]) VALUES (N'20161212150000-request-rayen-id.js')
GO
SET IDENTITY_INSERT [dbo].[specialties] ON 
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (1, N'Urología', N'Urology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (2, N'Neurología adulto', N'Pediatric Neurology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (3, N'Neurología infantil', N'Neurology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (4, N'Neurocirugia', N'Neurosurgery ')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (5, N'Otorrinolaringología', N'Otolaryngology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (6, N'Traumatología', N'Orthopedics')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (7, N'Cardiología ', N'Cardiologyy')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (8, N'Nefrología', N'Nephrology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (9, N'Endocrinología', N'Endocrinology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (10, N'Gastroenterología', N'Gastroenterology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (11, N'Broncopulmonar', N'Pulmonology')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (12, N'Urgencia', N'Urgency')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (13, N'Medicina General', N'General practitioner')
GO
INSERT [dbo].[specialties] ([id], [slug], [name]) VALUES (15, N'ophthalmology', N'Ophthalmology')
GO
SET IDENTITY_INSERT [dbo].[specialties] OFF
GO
SET IDENTITY_INSERT [dbo].[static_checkups] ON 
GO
INSERT [dbo].[static_checkups] ([slug], [name], [id]) VALUES (N'on-line-deferred', N'on-line-deferred', 1)
GO
INSERT [dbo].[static_checkups] ([slug], [name], [id]) VALUES (N'on-line-simultaneous', N'on-line-simultaneous', 2)
GO
INSERT [dbo].[static_checkups] ([slug], [name], [id]) VALUES (N'on-site', N'on-site', 3)
GO
SET IDENTITY_INSERT [dbo].[static_checkups] OFF
GO
SET IDENTITY_INSERT [dbo].[static_genders] ON 
GO
INSERT [dbo].[static_genders] ([slug], [name], [value], [id]) VALUES (N'male', N'male', 2, 1)
GO
INSERT [dbo].[static_genders] ([slug], [name], [value], [id]) VALUES (N'female', N'female', 3, 2)
GO
SET IDENTITY_INSERT [dbo].[static_genders] OFF
GO
SET IDENTITY_INSERT [dbo].[static_motives] ON 
GO
INSERT [dbo].[static_motives] ([slug], [name], [id]) VALUES (N'diagnosis-doubts', N'diagnosis-doubts', 1)
GO
INSERT [dbo].[static_motives] ([slug], [name], [id]) VALUES (N'exam-results-doubts', N'exam-results-doubts', 2)
GO
INSERT [dbo].[static_motives] ([slug], [name], [id]) VALUES (N'patient-not-evolving-as-expected', N'patient-not-evolving-as-expected', 3)
GO
SET IDENTITY_INSERT [dbo].[static_motives] OFF
GO
SET IDENTITY_INSERT [dbo].[static_priorities] ON 
GO
INSERT [dbo].[static_priorities] ([slug], [name], [id]) VALUES (N'low-priority', N'Baja prioridad', 1)
GO
INSERT [dbo].[static_priorities] ([slug], [name], [id]) VALUES (N'important', N'Importante', 2)
GO
INSERT [dbo].[static_priorities] ([slug], [name], [id]) VALUES (N'urgent', N'Urgente', 3)
GO
SET IDENTITY_INSERT [dbo].[static_priorities] OFF
GO
SET IDENTITY_INSERT [dbo].[static_request_types] ON 
GO
INSERT [dbo].[static_request_types] ([slug], [name], [id]) VALUES (N'consultation', N'consultation', 1)
GO
INSERT [dbo].[static_request_types] ([slug], [name], [id]) VALUES (N'diagnosis', N'diagnosis', 2)
GO
SET IDENTITY_INSERT [dbo].[static_request_types] OFF
GO
SET IDENTITY_INSERT [dbo].[static_roles] ON 
GO
INSERT [dbo].[static_roles] ([slug], [name], [id]) VALUES (N'admin', N'admin', 1)
GO
INSERT [dbo].[static_roles] ([slug], [name], [id]) VALUES (N'user', N'user', 2)
GO
SET IDENTITY_INSERT [dbo].[static_roles] OFF
GO
SET IDENTITY_INSERT [dbo].[static_specialties] ON 
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Urología', N'Urology', 1)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Neurología adulto', N'Pediatric Neurology', 2)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Neurología infantil', N'Neurology', 3)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Neurocirugia', N'Neurosurgery ', 4)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Otorrinolaringología', N'Otolaryngology', 5)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Traumatología', N'Orthopedics', 6)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Cardiología ', N'Cardiologyy', 7)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Nefrología', N'Nephrology', 8)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Endocrinología', N'Endocrinology', 9)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Gastroenterología', N'Gastroenterology', 10)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Broncopulmonar', N'Pulmonology', 11)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Urgencia', N'Urgency', 12)
GO
INSERT [dbo].[static_specialties] ([slug], [name], [id]) VALUES (N'Medicina General', N'General practitioner', 13)
GO
SET IDENTITY_INSERT [dbo].[static_specialties] OFF
GO
SET IDENTITY_INSERT [dbo].[tokens] ON 
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (1, N'7b73085311ae68bdd46b076e7844f08c17084d38', CAST(N'2016-03-16T21:47:14.3140000' AS DateTime2), CAST(N'2016-03-16T21:47:14.3140000' AS DateTime2), 19)
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (2, N'1c0e8c0f2deb866109a89a793cf5f773193b2fd8', CAST(N'2016-04-06T20:44:09.8470000' AS DateTime2), CAST(N'2016-04-06T20:44:09.8470000' AS DateTime2), 19)
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (3, N'b810f5265e5559f4a5e5ace5a10f878081a972ec', CAST(N'2016-06-10T16:06:46.0000000' AS DateTime2), CAST(N'2016-06-10T16:06:46.0000000' AS DateTime2), 19)
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (5, N'ab90822703dae96bd4178c316b7bc73040f79e99', CAST(N'2017-01-09T11:33:39.0000000' AS DateTime2), CAST(N'2017-01-09T11:33:39.0000000' AS DateTime2), 69)
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (6, N'960278896e9f73fb75f5a7a98e2595019a4a7686', CAST(N'2017-01-10T19:59:39.0000000' AS DateTime2), CAST(N'2017-01-10T19:59:39.0000000' AS DateTime2), 68)
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (7, N'1ad8bcebf72e9b009e28949676a4c39ea6f9ee54', CAST(N'2017-01-10T20:07:57.0000000' AS DateTime2), CAST(N'2017-01-10T20:07:57.0000000' AS DateTime2), 68)
GO
INSERT [dbo].[tokens] ([id], [secret], [createdAt], [updatedAt], [userId]) VALUES (8, N'64a451c361ea5b2e1606b7986d7b741ac7d89f41', CAST(N'2017-03-13T14:28:26.0000000' AS DateTime2), CAST(N'2017-03-13T14:28:26.0000000' AS DateTime2), 76)
GO
SET IDENTITY_INSERT [dbo].[tokens] OFF
GO
SET IDENTITY_INSERT [dbo].[user_workplaces__workplace_users] ON 
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (1, 3, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (2, 4, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (3, 5, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (4, 6, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (5, 8, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (6, 11, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (7, 12, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (8, 7, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (9, 9, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (10, 10, 3)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (11, 2, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (12, 13, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (13, 14, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (14, 15, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (15, 16, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (16, 17, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (17, 18, 2)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (18, 21, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (19, 22, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (20, 23, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (21, 24, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (22, 19, 5)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (23, 20, 6)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (24, 25, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (25, 26, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (26, 27, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (27, 28, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (28, 29, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (29, 30, 1)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (31, 2, 7)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (32, 31, 8)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (33, 20, 7)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (34, 32, 7)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (35, 2, 9)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (36, 33, 10)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (37, 34, 11)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (38, 35, 12)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (39, 36, 12)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (40, 37, 12)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (41, 38, 12)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (42, 39, 12)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (43, 40, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (44, 41, 3)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (45, 42, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (46, 43, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (47, 44, 5)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (48, 45, 6)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (49, 46, 13)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (50, 47, 13)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (51, 48, 13)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (52, 49, 5)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (53, 50, 6)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (54, 31, 5)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (55, 51, 6)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (56, 32, 6)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (57, 54, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (58, 55, 4)
GO
INSERT [dbo].[user_workplaces__workplace_users] ([id], [user_workplaces], [workplace_users]) VALUES (59, 51, 5)
GO
SET IDENTITY_INSERT [dbo].[user_workplaces__workplace_users] OFF
GO
SET IDENTITY_INSERT [dbo].[users] ON 
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (1, N'Contralor', N'contralor@savina.cl', N'$2a$08$mKP.eea1epGy5jXQfwWequtYotWL9fvk6kgJ3syBGAS24D61mwC8m', NULL, CAST(N'2016-06-01T10:44:21.0800000' AS DateTime2), CAST(N'2016-06-01T10:44:23.2800000' AS DateTime2), NULL, 1, NULL)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (2, N'Dr. Inti Paredes Urologo', N'dr.iparedes@saydex.com', N'$2a$08$wHnUTFEZBEYL0KpR.thYaOekEWuQ8XFYICthzlT4iK8v/aLTDUkpq', CAST(N'2016-11-28T15:46:20.8090000' AS DateTime2), CAST(N'2015-09-14T18:56:14.9510000' AS DateTime2), CAST(N'2016-11-28T15:46:20.0000000' AS DateTime2), 1, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (3, N'Dra. Francisca Saez', N'franciscasaezcorrea@gmail.com', N'$2a$08$hVmKAPzN2Ff8NmXfSw2KLOamO88uY04PHS2Wd5xky29W7Rnfn4K6C', NULL, CAST(N'2015-09-15T00:54:41.8520000' AS DateTime2), CAST(N'2015-09-15T01:00:59.9310000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (4, N'Dra. Maria Soledad Jara', N'msolejarav@gmail.com', N'$2a$08$Y/THjGhN0SUgwly128jcg.nrPa2LtA9/LsynNsRl8qjkZdYOJiiEi', NULL, CAST(N'2015-09-15T00:55:04.8360000' AS DateTime2), CAST(N'2015-09-15T01:01:10.8990000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (5, N'Dr. Gabriel Abudinen', N'gabrielabudinen@gmail.com', N'$2a$08$m9KMqnlUXmYn.denK9eyxOu58csactAms6pcNOsjNL44bWYlv8D7C', CAST(N'2015-10-07T21:13:10.2120000' AS DateTime2), CAST(N'2015-09-15T00:55:33.8680000' AS DateTime2), CAST(N'2015-10-07T21:13:10.2280000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (6, N'Dr. Jorge Novoa', N'jorgenovoarodriguez@gmail.com', N'$2a$08$esgTNPUFUFddbX86W9VRsO4HfjfutkMCWGnWWx1pIaPtMMGok39JG', NULL, CAST(N'2015-09-15T00:55:55.3830000' AS DateTime2), CAST(N'2015-09-15T01:01:39.7740000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (7, N'Dr. Eduardo Briceño', N'edobricort7@gmail.com', N'$2a$08$5s4LW1irW5//i4czAD.38OqlcS7RvN87UrUPR9fayOI32N.27frWa', NULL, CAST(N'2015-09-15T00:56:13.2740000' AS DateTime2), CAST(N'2015-09-15T01:03:36.6810000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (8, N'Dr. Juan Sandoval', N'juansandoval89@gmail.com', N'$2a$08$oQbAd0OoQ71Mf2zImO14HeBRYu3Jbd.BnSAYtGpXuBnvUMsb94T.S', NULL, CAST(N'2015-09-15T00:56:36.4000000' AS DateTime2), CAST(N'2015-09-15T01:01:54.1030000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (9, N'Dr. Pedro Quiroz', N'pelixs@hotmail.com', N'$2a$08$N4d6Is0dundDMHMg5wU7UuQLefCvPWWTdX45RuGWgdsRTw9H/WU/a', CAST(N'2015-09-16T06:17:53.3510000' AS DateTime2), CAST(N'2015-09-15T00:57:50.4000000' AS DateTime2), CAST(N'2015-09-16T06:17:53.3510000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (10, N'Dr. Gabriel Urzua', N'glurzua@gmail.com', N'$2a$08$u8KX5vFuOnVFz6WTxqozQubMvc4/y8Apsj1LtYyP9v1ybD9tFBR5m', NULL, CAST(N'2015-09-15T00:59:27.6180000' AS DateTime2), CAST(N'2015-09-15T01:03:56.5870000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (11, N'Dr. Juan Pablo Sánchez', N'Juan.sanchez.g@redsalud.gov.cl', N'$2a$08$rdjmdu3MCm9S0d6adpVa4Oh9xlGewBqOqsrPashBWWOw0VyEgqWlm', NULL, CAST(N'2015-09-15T00:59:56.9770000' AS DateTime2), CAST(N'2015-09-15T01:02:10.1810000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (12, N'Dr. Iván Ruiz', N'Ivanfelipe40@gmail.com', N'$2a$08$N259gUGWf3wWtmLvB636OObpOzuSNuh1Iuy8/PXpqM8vC.Wf2TBVy', NULL, CAST(N'2015-09-15T01:00:37.5240000' AS DateTime2), CAST(N'2015-09-15T01:02:19.9000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (13, N'Felipe Fernandez', N'f.ferbarr@gmail.com', N'$2a$08$LiCt3fpZpGsp1leOpWyWaeO8S1MXUBuRN3FRxBAyIY0SaWivV5svO', NULL, CAST(N'2015-09-16T06:07:44.4450000' AS DateTime2), CAST(N'2015-09-16T06:12:26.9610000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (14, N'Valentina Ramirez', N'valentina.ramirez@mayor.cl', N'$2a$08$8eoYX5QTThCC3POHKNUD7uTszYxsmsfkypsbQJEsu/KUo0l1BzKoW', NULL, CAST(N'2015-09-16T06:08:39.2110000' AS DateTime2), CAST(N'2015-09-16T06:12:35.7740000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (15, N'Felipe Almendras', N'felipealmendrasm@gmail.com', N'$2a$08$UXp6OcXzm/x9CI.95.HOJ.qvwGTMuikyepD7zkK4.X7IMZtmw64mG', NULL, CAST(N'2015-09-16T06:09:48.4140000' AS DateTime2), CAST(N'2015-09-16T06:12:48.8050000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (16, N'Rodrigo Gonzalez', N'rodrigogonzalezvalderrama@gmail.com', N'$2a$08$FwnhCNHz2zu6WToRrqmr.eIUCJTVEoVJNMzRh2wxmfZ.xaFLmNC7u', NULL, CAST(N'2015-09-16T06:10:22.3050000' AS DateTime2), CAST(N'2015-09-16T06:12:59.7420000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (17, N'Gonzalo Fuentes', N'g.a.fuentes@gmail.com', N'$2a$08$tC2n.i4u5zQhowhQxhpeJOXE2V1ngxnQDYhWiKKJO8iC1.zMN.GHe', NULL, CAST(N'2015-09-16T06:11:18.7420000' AS DateTime2), CAST(N'2015-09-16T06:13:12.5550000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (18, N'Dr. Pedro Quiroz', N'pehxs@hotmail.com', N'$2a$08$06LUJqyEb7j2jTNO/QzDx.p5axXgrhQUl17F76JbO24pWvJOd0iDm', NULL, CAST(N'2015-09-16T06:18:20.7260000' AS DateTime2), CAST(N'2015-09-16T06:18:31.7890000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (19, N'Nelson Larenas', N'nlarenas@saydex.cl', N'$2a$08$e6iURbbOmVH2.N8KRG/FouSBUVyl8DC1tbvMP.L7ApsNhU9Xhuzr6', NULL, CAST(N'2015-09-22T14:42:39.5450000' AS DateTime2), CAST(N'2016-06-10T16:25:31.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (20, N'Dr. Inti Paredes', N'intip@hotmail.com', N'$2a$08$MdGXdKA.pd47vLA5QsFHWekLODWEC1/xlGdeSFUQ8/rnB5NRFWgka', NULL, CAST(N'2015-09-22T14:44:41.2330000' AS DateTime2), CAST(N'2015-10-26T15:51:40.9230000' AS DateTime2), 1, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (21, N'Dr. Esteban Gomez', N'egomezj@gmail.com', N'$2a$08$BGS76/UO7cSH4Rn3yqghDuk1O2ZecCPYW5kEGvbYAjHfLKPWPadke', NULL, CAST(N'2015-09-26T12:38:17.6040000' AS DateTime2), CAST(N'2015-09-26T12:40:27.2600000' AS DateTime2), 8, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (22, N'Medico General Choapa', N'general@savina.cl', N'$2a$08$bMNXMrt3lZ89XEA6.xwzrON5.bqvTIjVD8c0F4lSgizYLqvXPFIA2', NULL, CAST(N'2015-09-26T12:55:55.1370000' AS DateTime2), CAST(N'2015-11-03T15:35:10.4680000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (23, N'Alejandro Cubillos', N'alecubi6211@yahoo.com', N'$2a$08$zZZ0glxipWxTS0LJzWNLfuoVOmBh2bzlNs1IfH1pxKHC0BpNFPrLe', NULL, CAST(N'2015-09-28T15:20:38.4290000' AS DateTime2), CAST(N'2015-09-28T15:57:48.1990000' AS DateTime2), 4, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (24, N'Dr. Guillermo Guzman', N'guillermoguzmanc@gmail.com', N'$2a$08$G7WUjOju08hWj11Nz14DyuWOIE6.8jJJ4R61wSUVrra.Ymo7j6CoO', NULL, CAST(N'2015-09-28T15:22:31.1640000' AS DateTime2), CAST(N'2015-09-28T16:05:37.8410000' AS DateTime2), 3, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (25, N'Dr. Gabriel Abudinén Adauy', N'gabrielabudinena@gmail.com', N'$2a$08$UlSG6el0hT8u8huN06FtQugNx.QCL8H/y/Sd0QzQMiYW86EWkGxcK', NULL, CAST(N'2015-10-07T21:14:16.4000000' AS DateTime2), CAST(N'2015-10-07T21:14:31.4620000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (26, N'Dr. Alfredo Rocheford', N'ajrochefort@miuandes.cl', N'$2a$08$Y2J6VkeNEjLOcHLc955au.VVOu4kRQAInlLVMZSkOy67NRzkIF26K', NULL, CAST(N'2015-10-09T12:43:30.2530000' AS DateTime2), CAST(N'2015-10-09T12:46:19.9410000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (27, N'Dra. Valeria Veliz', N'valeria.veliz.valle@gmail.com', N'$2a$08$Iqi8Z5o/e6U0kKCS8cOsmeCVTw1e8gOhSS7mlXJG6eWyppKtxljVO', NULL, CAST(N'2015-10-09T12:43:59.3500000' AS DateTime2), CAST(N'2015-10-09T12:46:35.5000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (28, N'Dra. Veronica Rivera', N'mv.rivera.ovalle@gmail.com', N'$2a$08$MmGICqt3os.OyHRSgIJ8oejR0RAaDKiw5z6080EGyTlE4cKiLIUny', NULL, CAST(N'2015-10-09T12:44:30.6750000' AS DateTime2), CAST(N'2015-10-09T12:46:45.8000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (29, N'Dr. Bastian Lara', N'dr.bastianlara@gmail.com', N'$2a$08$G4xV.dNTFpEeRbm/CjrPQOktAdxYG0ltoF.l1UyOf3cHTswDkpLf.', NULL, CAST(N'2015-10-09T12:44:58.3940000' AS DateTime2), CAST(N'2015-10-09T12:46:59.4410000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (30, N'Dra. Natacha Paravic', N'nparavic@gmail.com', N'$2a$08$PUzw.t6ccBlLpaKU/XuxfeQdLcvq/Y.KEeb5JB8qHj5ieulgFeF.W', NULL, CAST(N'2015-10-09T12:45:30.3780000' AS DateTime2), CAST(N'2015-10-09T12:47:18.6910000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (31, N'QF Antonio Antonino', N'aantonino@alfatecsistemas.es', N'$2a$08$eIaNr1Ym9y6GwH9UMXMIxej/OmNv5CDdnFhDz6M0TDDLE1Xr2r4EW', NULL, CAST(N'2015-10-26T15:00:50.1530000' AS DateTime2), CAST(N'2016-03-23T19:10:20.1830000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (32, N'Dr. Inti Paredes B.', N'dr.iparedes@saludconecta2.cl', N'$2a$08$fVPJtvL.QdVYTYJVkPywluuCfzhf9Qjg.CC6/SJ6jkxgdYgqhu27O', NULL, CAST(N'2015-10-26T15:55:44.6270000' AS DateTime2), CAST(N'2016-03-31T13:31:05.8980000' AS DateTime2), 13, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (33, N'Dr. Carlos Arevalo', N'carlos.arevaloa@gmail.com', N'$2a$08$iG8YOa54nJqrc6dIoLvhl.Gldp3pLp1/f9KXvzKPwR/TWEPpIeYaC', NULL, CAST(N'2015-11-06T13:28:21.1500000' AS DateTime2), CAST(N'2015-11-06T13:33:54.1820000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (34, N'Dr. Neurologo Infantil', N'neurologo.infantil@gmail.com', N'$2a$08$oyP5WaUCi8EGuTqclPDpBOCNzeM67A4Fr2OqAj.Rrn1zHhDFKQSlm', NULL, CAST(N'2015-11-06T13:31:39.2450000' AS DateTime2), CAST(N'2015-11-06T13:36:17.7140000' AS DateTime2), 3, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (35, N'Dr. Luis Pastrián Vicencio', N'dpastrianv@gmail.com', N'$2a$08$igBq2xGj4gsbo2vsvCPXSOj.8FBPn8hBBQ7BCnWD86/YBf0YBAYTu', NULL, CAST(N'2015-11-09T15:51:51.5300000' AS DateTime2), CAST(N'2015-11-09T16:02:28.9700000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (36, N'Dr. Ignacio Espinoza Ramos', N'inespinozar@gmail.com', N'$2a$08$2LQv0lHIerd6pHXC5nCg1uxAoqvzC7nb90Sgwe2aI4iPkYNFSkwvO', NULL, CAST(N'2015-11-09T15:53:54.4060000' AS DateTime2), CAST(N'2015-11-09T16:02:42.3610000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (37, N'Dr. Valentina Saez Correa', N'valentinasaezcorrea@gmail.com', N'$2a$08$BGtXDJxEs41yJu3AcDVQQebj0.aZTV51DbER3hFh/889UFuU2hNjW', NULL, CAST(N'2015-11-09T15:54:33.2970000' AS DateTime2), CAST(N'2015-11-09T16:02:56.1000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (38, N'Francisco Ramos Bull', N'framosbull@gmail.com', N'$2a$08$J5xNUFBSBRc7WXCYl0LpqOd30ZCBPWQ0ZUQOrku3VR1B1eOnQn9MS', NULL, CAST(N'2015-11-09T15:56:47.9530000' AS DateTime2), CAST(N'2015-11-09T16:03:06.4230000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (39, N'Dr. Fernando Gonzalez Cortes', N'fdoedgardo@gmail.com', N'$2a$08$e1KPx6oW4wKUTp9sm0LWT.9/P20igb5MHsaAd50GJIZMSEH11WjZe', NULL, CAST(N'2015-11-09T15:57:52.6870000' AS DateTime2), CAST(N'2015-11-09T16:03:20.9500000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (40, N'Dr. Pablo Salinas', N'dr.pablosalinas@gmail.com', N'$2a$08$Rj3grma6m2AqslbCnQw0WeEHBLjpFyf/4mmz7j.3AusiSoqzHwEDm', NULL, CAST(N'2015-11-18T15:48:55.4800000' AS DateTime2), CAST(N'2015-11-18T15:49:35.1570000' AS DateTime2), 2, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (41, N'Dr. Josué Hidalgo', N'director.salamanca@gmail.com', N'$2a$08$XxOx0hxvwrJQLuTSyoioUu6NJLeGEFkGNrKFqwlA7SCDYuihDn55i', NULL, CAST(N'2015-11-18T16:02:20.9550000' AS DateTime2), CAST(N'2015-11-18T16:02:39.9400000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (42, N'Dr. Rodrigo Gutierrez', N'rgutierrezmoncluz4@gmail.com', N'$2a$08$GXdhxe0eegCjpl.7UpbM/eCyYNG412Qt3tYVxy6KYlXAN7nFSroDS', NULL, CAST(N'2015-11-18T16:48:33.9610000' AS DateTime2), CAST(N'2015-11-18T16:48:48.1170000' AS DateTime2), 6, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (43, N'Dr. Yerko Cuevas', N'yerkocuevas@gmail.com', N'$2a$08$3eXVn9cuZVoI1m0pW1FQs.NNO42ftWDScFsjiSCahs4tSYt6ucgCO', NULL, CAST(N'2015-11-25T12:20:55.7590000' AS DateTime2), CAST(N'2015-11-25T12:21:17.9930000' AS DateTime2), 6, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (44, N'Auxiliar Prueba de Farmacia', N'auxfarmacia@savina.cl', N'$2a$08$1B6a3r75iC7HV4JKjddgZuxecZy1aaO7JUsVE9rhgIhhlrn3pqKQu', NULL, CAST(N'2015-12-23T13:53:34.3750000' AS DateTime2), CAST(N'2015-12-23T13:53:54.3100000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (45, N'Medico Nefrologo', N'nefrologo@savina.cl', N'$2a$08$U3scqipLztRCcFCdxpT0EuBYLR1wjxK1oQ6ppZx0kxRNHKmP4lH5e', NULL, CAST(N'2015-12-23T14:00:56.6300000' AS DateTime2), CAST(N'2015-12-23T14:01:41.7350000' AS DateTime2), 8, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (46, N'Dra. Romina Bugueño Lara', N'rbugueno@salamanca.cl', N'$2a$08$YH6jxTIDhDpVoedNjrHVM.O7hMs9CK3jvSDlpgGwg8iQUSw2B3OSC', NULL, CAST(N'2016-01-06T20:06:22.6220000' AS DateTime2), CAST(N'2016-01-06T20:08:12.9810000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (47, N'Dra. Daymeris Durañona Arias', N'daynerisda@gmail.com', N'$2a$08$cmcFcObNPtjYqJJTA9am2uEh.FI2Ui8FLDDibh54K86cl5LNwZtTq', NULL, CAST(N'2016-01-06T20:07:01.6370000' AS DateTime2), CAST(N'2016-01-06T20:08:23.2800000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (48, N'Dr. Leonardo Torres Vega', N'leonardotv86@gmail.com', N'$2a$08$N6H3ez3xi2qMJZ/74bSWMu2OGAAbVvN0L10eiPun6DHf24wTDNSIK', NULL, CAST(N'2016-01-06T20:07:49.9100000' AS DateTime2), CAST(N'2016-01-06T20:08:35.4660000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (49, N'Nelson Larenas Ureta', N'nlarenassavina@gmail.com', N'$2a$08$HdUyBar.a.Q1wTqkDV7YkeBf1nk18DDXwv3KXUB//7mBeAWeoqNn6', NULL, CAST(N'2016-02-05T05:01:08.6850000' AS DateTime2), CAST(N'2016-02-05T05:03:28.4660000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (50, N'Dr. José Tomás Guzmán', N'jtguzman@finaldevstudio.com', N'$2a$08$zBDF/mBnF3N8F7NLEn2yM.39j1/aP8rpGdss9JHyCrLEEFWvtu5ma', NULL, CAST(N'2016-02-05T05:02:58.5910000' AS DateTime2), CAST(N'2016-02-05T05:04:09.2010000' AS DateTime2), 1, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (51, N'Dr. Nelson Larenas', N'nlarenas@saludinnova.cl', N'$2a$08$4GM.nsmGGmghsWPV.FsdguWr9agZR1If.iNj3Y0L45gQLWp6izdp6', NULL, CAST(N'2016-03-31T13:18:59.1930000' AS DateTime2), CAST(N'2016-09-13T17:50:07.0000000' AS DateTime2), 7, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (54, N'Dr. José Fernández', N'dr.jfernandez@saydex.cl', N'$2a$08$HT38KS1AfhNyCE3e.JQD/.Z0MbKIcyVYQ1li3ot0/NAsmc4q978lq', CAST(N'2016-04-11T20:26:27.4950000' AS DateTime2), CAST(N'2016-04-11T19:59:22.7410000' AS DateTime2), CAST(N'2016-04-11T20:26:27.4950000' AS DateTime2), 11, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (55, N'Dr. José Fernández', N'dr.jfernandez@saydex.com', N'$2a$08$dQQ1Q1JOfQnvG6CGWM.q.uQ/UAe/bIVTxBXu53jlXTynaFdFELpM2', NULL, CAST(N'2016-04-11T20:27:15.4320000' AS DateTime2), CAST(N'2016-04-11T20:27:52.2750000' AS DateTime2), 11, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (56, N'Dr. Derivador ACHS', N'derivadorachs@gmail.com', N'$2a$08$NBilE4NM6dIyotvEBY5nLOLJipe/w8HhghLe11s9odByorOv/DwJG', NULL, CAST(N'2016-06-10T18:46:08.0000000' AS DateTime2), CAST(N'2016-06-10T18:46:08.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (57, N'Dr. Especialista ACHS', N'especialistaachs@gmail.com', N'$2a$08$GCw9KqdW1kDspM6jzqhYO.tAECSZxBgwcdCrTDyprZ3okzKf67J/6', NULL, CAST(N'2016-06-10T18:46:58.0000000' AS DateTime2), CAST(N'2016-06-10T18:46:58.0000000' AS DateTime2), 13, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (63, N'Roberta Contreras Vega', N'ro.contrerasvega@gmail.com', N'$2a$08$3cdheMW.00fd9DkqutwQSuOXSt4s07bLz20pK.g1FDkTeWjllE.Ga', NULL, CAST(N'2016-12-06T18:51:16.0000000' AS DateTime2), CAST(N'2016-12-06T18:51:16.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (64, N'John Miranda', N'johnleemiranda@gmail.com', N'$2a$08$mXE1pAOWzmLJWLH362Be5u8mwgMGp9BlFG9NR13c7UA/XAv3yRXvK', NULL, CAST(N'2016-12-06T19:13:53.0000000' AS DateTime2), CAST(N'2017-01-13T16:00:06.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (65, N'Medico especialista', N'conacto@saludinnova.cl', N'$2a$08$yf6tLI5vtURA0a034P82iucREQiWjX.8.CqX3WuyzQX7HVSczN5Oi', CAST(N'2016-12-06T19:46:52.9100000' AS DateTime2), CAST(N'2016-12-06T19:15:54.0000000' AS DateTime2), CAST(N'2016-12-06T19:46:52.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (66, N'Medico especialista', N'contacto@saludinnova.cl', N'$2a$08$NigILbRuB6mNJuLf6K/BJe70HGyhxr3MvrX.U42BmGsz7yy/0.mEW', NULL, CAST(N'2016-12-06T19:47:17.0000000' AS DateTime2), CAST(N'2016-12-06T19:47:30.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (67, N'Dr. Matías Ramirez', N'matias.riopuelo@gmail.com', N'$2a$08$5JEi6N86nTEUMCFPFF1yFOttgaKr6VOqdbfa9wd52eaOdGt8W.ugO', NULL, CAST(N'2016-12-12T12:06:53.0000000' AS DateTime2), CAST(N'2016-12-12T12:06:53.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (68, N'Dra. Daniela García Silva', N'danielagarciasilva@gmail.com', N'$2a$08$euizHkjtoNwpFUY1HOUYROTjtDO4O7.EuZlRfuJsp06AmDWIYrdUO', NULL, CAST(N'2016-12-29T20:19:19.0000000' AS DateTime2), CAST(N'2016-12-29T20:19:19.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (69, N'Fanny Calderón Jorquera', N'fcalderonj29@gmail.com', N'$2a$08$0uoX9U.M6aTgoH1j6YRFB.2MDEh/uou22M9V/iPc280xmkMocr.0W', NULL, CAST(N'2017-01-06T20:01:03.0000000' AS DateTime2), CAST(N'2017-01-06T20:01:03.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (70, N'Dr. Mauricio Aguilar V.', N'Aguilar_veloso@hotmail.com', N'$2a$08$9H3HjOdLgbPtrFRoWoiYS.uqN749QjrGBzTBAkpxbFEcef7QsFmYC', NULL, CAST(N'2017-01-09T13:21:26.0000000' AS DateTime2), CAST(N'2017-01-09T13:21:26.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (71, N'Medico General  JM', N'jmiranda@saydex.cl', N'$2a$08$D1P5HQsyYyRCh0B5L7n04ecvsOYjqyxe5hklXQG6H9C4ZiQ9K9a1a', NULL, CAST(N'2017-01-13T16:34:45.0000000' AS DateTime2), CAST(N'2017-01-13T16:34:45.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (72, N'jgeneral', N'jgeneral@savina.cl', N'$2a$08$v.2EDlR9A5k2ycp4S.dijeCHPWngDHRjQJQ5ioSNfB1HWuOHTWM1i', NULL, CAST(N'2017-01-13T17:41:17.0000000' AS DateTime2), CAST(N'2017-01-13T17:41:17.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (73, N'jespecialista', N'jespecialista@savina.cl', N'$2a$08$iA1RkLkRaH81SBC4n5b0S.DFPntByqJJHW/F7x/lxxHhsCm/gXyoa', NULL, CAST(N'2017-01-13T17:42:21.0000000' AS DateTime2), CAST(N'2017-01-13T17:42:21.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (74, N'test', N'test@savina.cl', N'$2a$08$DG84libl6NBE1guks6V9QOy.sAy7nJcZS57fyjl149bic7qsBMQie', NULL, CAST(N'2017-01-13T23:31:15.0000000' AS DateTime2), CAST(N'2017-01-13T23:31:15.0000000' AS DateTime2), NULL, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (75, N'Dra. Ghislaine Lepeley', N'doctoralepeley@gmail.com', N'$2a$08$DlINaCtUkQOnFnEvFAgEv.UfNhbxtHrO9LQ85V.V0qGOrIq18qzwq', NULL, CAST(N'2017-02-08T11:51:32.0000000' AS DateTime2), CAST(N'2017-02-08T11:51:32.0000000' AS DateTime2), 15, 2, 1)
GO
INSERT [dbo].[users] ([id], [name], [email], [password], [deletedAt], [createdAt], [updatedAt], [specialtyId], [roleId], [creatorId]) VALUES (76, N'Kenneth johnson', N'kjohnson@clinicasantamaria.cl', N'$2a$08$GO1TECERaJ5aXJSZTSnNd.Xhq77xJKiH4dFSApU9VBAtgIKgIrJjy', NULL, CAST(N'2017-03-13T14:05:59.0000000' AS DateTime2), CAST(N'2017-03-13T14:05:59.0000000' AS DateTime2), 15, 2, 1)
GO
SET IDENTITY_INSERT [dbo].[users] OFF
GO
SET IDENTITY_INSERT [dbo].[userWorkplaces] ON 
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (1, 3, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (2, 4, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (3, 5, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (4, 6, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (5, 8, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (6, 11, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (7, 12, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (8, 7, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (9, 9, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (10, 10, 3)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (11, 2, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (12, 13, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (13, 14, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (14, 15, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (15, 16, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (16, 17, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (17, 18, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (18, 21, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (19, 22, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (20, 23, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (21, 24, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (22, 19, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (23, 20, 6)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (24, 25, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (25, 26, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (26, 27, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (27, 28, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (28, 29, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (29, 30, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (31, 2, 7)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (32, 31, 8)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (33, 20, 7)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (34, 32, 7)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (35, 2, 9)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (36, 33, 10)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (37, 34, 11)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (38, 35, 12)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (39, 36, 12)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (40, 37, 12)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (41, 38, 12)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (42, 39, 12)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (43, 40, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (44, 41, 3)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (45, 42, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (46, 43, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (47, 44, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (48, 45, 6)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (49, 46, 13)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (50, 47, 13)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (51, 48, 13)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (52, 49, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (53, 50, 6)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (54, 31, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (55, 51, 6)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (56, 32, 6)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (57, 54, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (58, 55, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (59, 51, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (60, 56, 14)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (61, 57, 14)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (62, 64, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (64, 66, 7)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (65, 63, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (66, 63, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (67, 63, 13)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (68, 67, 17)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (69, 68, 17)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (70, 69, 1)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (71, 69, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (72, 69, 13)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (73, 70, 17)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (75, 64, 7)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (76, 71, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (77, 72, 5)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (78, 73, 7)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (79, 74, 4)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (80, 75, 17)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (81, 76, 17)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (82, 73, 2)
GO
INSERT [dbo].[userWorkplaces] ([id], [userId], [workplaceId]) VALUES (83, 72, 7)
GO
SET IDENTITY_INSERT [dbo].[userWorkplaces] OFF
GO
SET IDENTITY_INSERT [dbo].[workplaces] ON 
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (1, N'Hospital de Illapel', 0, NULL, CAST(N'2015-09-15T00:44:36.6160000' AS DateTime2), CAST(N'2015-09-15T00:44:36.6160000' AS DateTime2), 1, N'74B96AC8-59C0-432B-A76D-9A3885B8839F')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (2, N'Hospital de Los Vilos', 0, NULL, CAST(N'2015-09-15T00:44:49.9920000' AS DateTime2), CAST(N'2015-09-15T00:44:49.9920000' AS DateTime2), 1, N'61B97FAA-BABF-4515-B132-E409DCBA7FF5')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (3, N'Hospital de Salamanca', 0, NULL, CAST(N'2015-09-15T00:45:05.6170000' AS DateTime2), CAST(N'2015-09-15T00:45:05.6170000' AS DateTime2), 1, N'CA32C5EC-281F-4871-BF60-F8287604FBB7')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (4, N'Especialistas Piloto Provincia del Choapa y Elqui', 0, NULL, CAST(N'2015-09-15T01:09:23.9320000' AS DateTime2), CAST(N'2015-11-09T16:08:17.3600000' AS DateTime2), 1, N'4DF04904-A507-42E9-9600-6E10D553CB7C')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (5, N'CENTRO DE PRUEBA 1', 0, NULL, CAST(N'2015-09-30T17:36:38.3620000' AS DateTime2), CAST(N'2015-09-30T17:36:38.3620000' AS DateTime2), 1, N'37CC7845-AAA3-49A8-A9F3-8D4DD45C056B')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (6, N'CENTRO DE PRUEBA 2', 0, NULL, CAST(N'2015-09-30T17:36:51.8310000' AS DateTime2), CAST(N'2015-09-30T17:36:51.8310000' AS DateTime2), 1, N'6EDE408F-789F-41D0-8F10-660AF566625D')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (7, N'ESPECIALISTAS PILOTO 2', 1, NULL, CAST(N'2015-10-21T19:36:23.2380000' AS DateTime2), CAST(N'2015-10-21T19:36:23.2380000' AS DateTime2), 1, N'16E58CFC-3D00-4405-8EC3-3FC777FA2560')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (8, N'Farmacia España', 0, NULL, CAST(N'2015-10-26T15:02:16.1840000' AS DateTime2), CAST(N'2015-10-26T15:02:16.1840000' AS DateTime2), 1, N'956B2681-78C7-43A8-BC94-04A8504E3C7E')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (9, N'ESPECIALISTAS PILOTO 3', 0, NULL, CAST(N'2015-10-27T00:05:55.3560000' AS DateTime2), CAST(N'2015-10-27T00:05:55.3560000' AS DateTime2), 1, N'097745DC-525A-49AF-9908-880C9344F2BF')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (10, N'Hospital Intecnova', 0, NULL, CAST(N'2015-11-06T13:32:33.9470000' AS DateTime2), CAST(N'2015-11-06T13:32:33.9470000' AS DateTime2), 1, N'6B3AAFDF-0404-42A9-8FE3-C66A4706AE8E')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (11, N'Hospital Neurológico de Santiago', 0, NULL, CAST(N'2015-11-06T13:33:32.8070000' AS DateTime2), CAST(N'2015-11-06T13:33:32.8070000' AS DateTime2), 1, N'C2B29A98-ED9D-4D92-AC31-2201498BE7F8')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (12, N'Hospital de Combarbalá', 0, NULL, CAST(N'2015-11-09T15:49:26.7640000' AS DateTime2), CAST(N'2015-11-09T15:49:26.7640000' AS DateTime2), 1, N'0EACFA08-7075-49F2-B569-27A1F0DFEBFD')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (13, N'Departamento de Salud Salamanca', 0, NULL, CAST(N'2016-01-06T20:05:30.7780000' AS DateTime2), CAST(N'2016-01-06T20:05:30.7780000' AS DateTime2), 1, N'7187F639-924F-49E4-919B-66646766928B')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (14, N'ACHS', 1, NULL, CAST(N'2016-06-10T18:47:13.0000000' AS DateTime2), CAST(N'2016-06-10T18:47:13.0000000' AS DateTime2), 1, N'4D177445-6BFE-46E0-AB38-41401FE9432E')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (15, N'Empresa Telediagnóstico', 1, NULL, CAST(N'2016-11-28T15:44:59.0000000' AS DateTime2), CAST(N'2016-11-28T15:44:59.0000000' AS DateTime2), 1, N'906F2423-C8B7-44BE-BAF4-0692C992BD5C')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (16, N'Clínico Urología', 0, NULL, CAST(N'2016-11-28T15:45:17.0000000' AS DateTime2), CAST(N'2016-11-28T15:45:17.0000000' AS DateTime2), 1, N'00185817-E874-48E1-9252-107BE08DF7B0')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (17, N'Centro Oftalmológico de Choapa', 0, NULL, CAST(N'2016-12-06T20:10:21.0000000' AS DateTime2), CAST(N'2016-12-06T20:10:21.0000000' AS DateTime2), 1, N'35332D6C-BBCE-4B28-BC51-1777F76CCD3D')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (18, N'Testrerer', 0, NULL, CAST(N'2017-01-13T23:30:40.0000000' AS DateTime2), CAST(N'2017-01-13T23:30:40.0000000' AS DateTime2), 1, N'F03894A2-FA1E-4F71-B9BD-BF61D2ED6FCC')
GO
INSERT [dbo].[workplaces] ([id], [name], [private], [deletedAt], [createdAt], [updatedAt], [creatorId], [deis]) VALUES (19, N'testes', 0, NULL, CAST(N'2017-01-13T23:30:51.0000000' AS DateTime2), CAST(N'2017-01-13T23:30:51.0000000' AS DateTime2), 1, N'D5EEA2DF-DA9E-44D5-B6F8-CBE233BB1B6E')
GO
SET IDENTITY_INSERT [dbo].[workplaces] OFF
GO
/****** Object:  Index [agreementWorkplaces_id_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[agreementWorkplaces] ADD  CONSTRAINT [agreementWorkplaces_id_unique] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__agreemen__3213E83E0942D593]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[agreementWorkplaces] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [checkupModes_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[checkupModes] ADD  CONSTRAINT [checkupModes_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__checkupM__32DD1E4C4ECBE94B]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[checkupModes] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fileRequestAttachments_fileId_requestAttachmentId_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[fileRequestAttachments] ADD  CONSTRAINT [fileRequestAttachments_fileId_requestAttachmentId_unique] UNIQUE NONCLUSTERED 
(
	[fileId] ASC,
	[requestAttachmentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [fileRequestAttachments_id_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[fileRequestAttachments] ADD  CONSTRAINT [fileRequestAttachments_id_unique] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__fileRequ__3213E83E396C531C]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[fileRequestAttachments] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [genders_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[genders] ADD  CONSTRAINT [genders_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__genders__32DD1E4CFC208792]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[genders] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [icdRequestAnswerDiagnoses_id_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[icdRequestAnswerDiagnoses] ADD  CONSTRAINT [icdRequestAnswerDiagnoses_id_unique] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__icdReque__3213E83EC24A884D]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[icdRequestAnswerDiagnoses] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [icdRequests_id_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[icdRequests] ADD  CONSTRAINT [icdRequests_id_unique] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__icdReque__3213E83E6C5F759F]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[icdRequests] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [icds_code_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[icds] ADD  CONSTRAINT [icds_code_unique] UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__icds__357D4CF9A5A33F19]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[icds] ADD UNIQUE NONCLUSTERED 
(
	[code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [links_hash_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[links] ADD  CONSTRAINT [links_hash_unique] UNIQUE NONCLUSTERED 
(
	[hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__links__43B15FA070C7AC57]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[links] ADD UNIQUE NONCLUSTERED 
(
	[hash] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [motives_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[motives] ADD  CONSTRAINT [motives_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__motives__32DD1E4CCA3B883C]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[motives] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [priorities_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[priorities] ADD  CONSTRAINT [priorities_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__prioriti__32DD1E4C2CC5CCD3]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[priorities] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [requestTypes_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[requestTypes] ADD  CONSTRAINT [requestTypes_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__requestT__32DD1E4C1F59BD76]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[requestTypes] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [roles_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[roles] ADD  CONSTRAINT [roles_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__roles__32DD1E4C300DD2FB]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[roles] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [SequelizeMeta_name_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[SequelizeMeta] ADD  CONSTRAINT [SequelizeMeta_name_unique] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Sequeliz__72E12F1BDA7372EB]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[SequelizeMeta] ADD UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [specialties_slug_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[specialties] ADD  CONSTRAINT [specialties_slug_unique] UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__specialt__32DD1E4C9816ACC8]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[specialties] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_c__32DD1E4C419A347A]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_checkups] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_g__32DD1E4C5320963D]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_genders] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_m__32DD1E4CDE445965]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_motives] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_p__32DD1E4CEAEA2DA7]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_priorities] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_r__32DD1E4C8434408F]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_request_types] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_r__32DD1E4CF38EF646]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_roles] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__static_s__32DD1E4CB9E1BD0E]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[static_specialties] ADD UNIQUE NONCLUSTERED 
(
	[slug] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [tokens_secret_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[tokens] ADD  CONSTRAINT [tokens_secret_unique] UNIQUE NONCLUSTERED 
(
	[secret] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__tokens__D36A9DE84F1E663F]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[tokens] ADD UNIQUE NONCLUSTERED 
(
	[secret] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__users__AB6E61640CE96640]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[users] ADD UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [users_email_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[users] ADD  CONSTRAINT [users_email_unique] UNIQUE NONCLUSTERED 
(
	[email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [UQ__userWork__3213E83ED5158A6A]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[userWorkplaces] ADD UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [userWorkplaces_id_unique]    Script Date: 28-08-2018 16:51:08 ******/
ALTER TABLE [dbo].[userWorkplaces] ADD  CONSTRAINT [userWorkplaces_id_unique] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestAttached]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestAnswered]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestReturned]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestMessaged]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestClosed]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestTaken]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [emailRequestCreated]
GO
ALTER TABLE [dbo].[preferences] ADD  DEFAULT ((1)) FOR [soundNotifications]
GO
ALTER TABLE [dbo].[workplaces] ADD  DEFAULT ((0)) FOR [private]
GO
ALTER TABLE [dbo].[workplaces] ADD  DEFAULT (newid()) FOR [deis]
GO
ALTER TABLE [dbo].[agreements]  WITH CHECK ADD FOREIGN KEY([creatorId])
REFERENCES [dbo].[users] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[agreements]  WITH CHECK ADD FOREIGN KEY([specialtyId])
REFERENCES [dbo].[specialties] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[agreementWorkplaces]  WITH CHECK ADD FOREIGN KEY([agreementId])
REFERENCES [dbo].[agreements] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[agreementWorkplaces]  WITH CHECK ADD FOREIGN KEY([workplaceId])
REFERENCES [dbo].[workplaces] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[fileRequestAttachments]  WITH CHECK ADD FOREIGN KEY([fileId])
REFERENCES [dbo].[files] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[fileRequestAttachments]  WITH CHECK ADD FOREIGN KEY([icdId])
REFERENCES [dbo].[icds] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD FOREIGN KEY([receiverId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD FOREIGN KEY([senderId])
REFERENCES [dbo].[users] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[notifications]  WITH CHECK ADD FOREIGN KEY([workplaceId])
REFERENCES [dbo].[workplaces] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[patients]  WITH CHECK ADD FOREIGN KEY([genderId])
REFERENCES [dbo].[genders] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[preferences]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[tokens]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([creatorId])
REFERENCES [dbo].[users] ([id])
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([roleId])
REFERENCES [dbo].[roles] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[users]  WITH CHECK ADD FOREIGN KEY([specialtyId])
REFERENCES [dbo].[specialties] ([id])
ON DELETE SET NULL
GO
ALTER TABLE [dbo].[userWorkplaces]  WITH CHECK ADD FOREIGN KEY([userId])
REFERENCES [dbo].[users] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[userWorkplaces]  WITH CHECK ADD FOREIGN KEY([workplaceId])
REFERENCES [dbo].[workplaces] ([id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[workplaces]  WITH CHECK ADD FOREIGN KEY([creatorId])
REFERENCES [dbo].[users] ([id])
ON DELETE SET NULL
GO
/****** Object:  StoredProcedure [dbo].[SAV0001]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SAV0001]
AS
BEGIN
	SELECT * FROM roles
END
GO
/****** Object:  StoredProcedure [dbo].[SAV0002]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SAV0002]
AS
BEGIN
	SELECT * FROM specialties
END
GO
/****** Object:  StoredProcedure [dbo].[SAV0003]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SAV0003]
(
	@EMAIL VARCHAR(500),
	@PASSWORD VARCHAR(500)
	
)
AS
BEGIN
	select u.id, u.name, u.roleId, u.specialtyId, u.password from users u WHERE u.email = @EMAIL
END
GO
/****** Object:  StoredProcedure [dbo].[SAV0004]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create procedure [dbo].[SAV0004]
(
	@USER_ID INT
)
AS
BEGIN
SELECT TOP 1000 [workplace].[id], [workplace].[name], [users].[id] AS [users.id], [users.userWorkplace].[id] AS [users.userWorkplace.id], [users.userWorkplace].[userId] AS [users.userWorkplace.userId], [users.userWorkplace].[workplaceId] AS [users.userWorkplace.workplaceId] FROM [workplaces] AS [workplace] INNER JOIN ([userWorkplaces] AS [users.userWorkplace] INNER JOIN [users] AS [users] ON [users].[id] = [users.userWorkplace].[userId]) ON [workplace].[id] = [users.userWorkplace].[workplaceId] AND [users].[id] = @USER_ID
END
GO
/****** Object:  StoredProcedure [dbo].[SAV0005]    Script Date: 28-08-2018 16:51:08 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create procedure [dbo].[SAV0005]
(
	@USER_ID INT,
	@WORKPLACEID INT
)
AS
BEGIN
SELECT TOP 1000 
count([notification].[id]) AS [count] 
FROM [notifications] AS [notification] INNER JOIN [requests] AS [request] 
ON [notification].[foreignKey] = [request].[id] 
AND [request].[creatorUserId] = @USER_ID 
AND [request].[specialistUserId] IS NOT NULL 
WHERE [notification].[receiverId] = @USER_ID 
AND [notification].[seenAt] IS NULL 
AND [notification].[workplaceId] = @WORKPLACEID 
AND ((([notification].[action] IN (N'answered', N'attached', N'messaged', N'taken') 
AND [request].[closedAt] IS NULL) OR ([notification].[action] NOT IN (N'answered', N'attached', N'messaged', N'taken') 
AND [request].[closedAt] IS NOT NULL))) 
END
GO
