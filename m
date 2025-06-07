Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazolkn19011029.outbound.protection.outlook.com [52.103.32.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09D631F8AD3
	for <linux-doc@vger.kernel.org>; Sat,  7 Jun 2025 08:56:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.32.29
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749286615; cv=fail; b=H5BLm7KGXJJLDfbN81dkX+DLZUataIaAehhuCBp+/PGXkergQGLxZXIMTPJBgpQY3XL852puDLdfE5jerYoLYy90Xaci1OxToOV13YQOjmafeOjOEoLDzK8TiRgqkQQuFPu0gv7ISggrzeprz28zlI4qyDA8Yib0em2Dx0kzRPI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749286615; c=relaxed/simple;
	bh=tS8ZhqXzcCpsK4qGiT0Ejb0yKhsRtBLk61Ecq3Wu1lI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=NNsueBzZhcWBA4UVbeOWoNPZgdpiKoyIioaGtbLWV601jOusBYVDKO+xyv2qG63yGyAohsVCKeb5lvvXzZYcnTaZfyofQ5+5s5oXusKuYxsla9VyNsDObvK5glFQgyR+vp/dIm7MXoBJ8lpk7Xq+xFHE6hdKONN9ouAd3JO2jjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com; spf=pass smtp.mailfrom=hotmail.com; dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b=Pmu2re3Z; arc=fail smtp.client-ip=52.103.32.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=hotmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hotmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=hotmail.com header.i=@hotmail.com header.b="Pmu2re3Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b+MUAh0lewVZrpyK6C3TcjXjH6u8Jv0mKvc0NrNJFHuGh8wTYTp72S5TtO3OBNm+FIeLnSCVkftvBrAaWabaCcw8hGOkIOAJ8u3YRn7MlzsbB+An3fG8ZzDXKezgC3wzIAq+TwuYx33r01sxlNW53U9WXhTYztBy0F1E6GVifsvgWOgRPXKBuVhBEY9Nj5UI+f5PU8NtAynqdSmit2cp8AuYnaJeVS62GBADQtuMUPATWV3SvyWls/nP7AHyTU/Hb9UUVrEPbRTKSu7FwSa7b04sbmdmfUeMOZ7IlgRgUh98rv9p+aP5e29JyeStBC906v787rX0i6HIbHIURZv/vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fnlFgdJj7Z463f/WlpSKTvavh3lGQYfcZ+T32WSpSqU=;
 b=LNN80qw7fG45e4iQSiaKcOxGvll7RmL7L4MoN+Z/u1vGZ97WuX0droG8A1y5TnkRYQT07Yn5A+Tl8nOhbEgdf87JQJyearPuhzcupUZBX+p7P/0Skn6sMKoEHPqPpuu0K1Wc/U3I1Y1JCO9eWRvJJMwoytHj3ko3LkECps/S5CFgeYTsR4RW4VLrM/Qw63r9hw/OUKGwBOVT+0i2bBwhdYiwF6jIkOemIYX1kdeUaWnnJCJrhPZ8noJpVKB/nPYMfwtYtrmBRKiLNJcOiFRC48MXp2cCYiwKNfN4NKPOe7/0VxevCJNMOXA4SG/s4+A07msHxDuHbCNaVG1IiNiqMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=hotmail.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fnlFgdJj7Z463f/WlpSKTvavh3lGQYfcZ+T32WSpSqU=;
 b=Pmu2re3ZB7TVaQ+uHCVRMoy6lOSmku9MSlo3rrjm8tLSSPAvBEH3qP0UPDwd0s6OhUZe87zyK55CM7siUWhWiVAZyuA3R2YjT5U4SshHyHCfb7ckULy6AYoGB2RfJMIOGUSbEZkwZMTL+aVsinOElWsHbjfmGWrRkRZEcKlIARZ21RTSa+xmxOnc0ejI4FuCkl70qVCrHY56LsMb6/FiuBTIuSC5ernUx3vF1GrQHTF7ePDSUPAWWU1zX4Q/3w0gfeWmCkZknHemnpDpNF/0jNkCZQtrP2uv+J3dRRyWB6/1ESdJeGo/L0/hY00rvIGKT16b8Se1341DsoN3NwbFVg==
Received: from PAXPR06MB8224.eurprd06.prod.outlook.com (2603:10a6:102:1a3::13)
 by AM0PR06MB6372.eurprd06.prod.outlook.com (2603:10a6:208:19d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.25; Sat, 7 Jun
 2025 08:56:51 +0000
Received: from PAXPR06MB8224.eurprd06.prod.outlook.com
 ([fe80::9306:451c:f996:14cf]) by PAXPR06MB8224.eurprd06.prod.outlook.com
 ([fe80::9306:451c:f996:14cf%3]) with mapi id 15.20.8813.020; Sat, 7 Jun 2025
 08:56:51 +0000
From: Dante Strock <dantestrock@hotmail.com>
To: "colbert@lwn.net" <colbert@lwn.net>
CC: "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Subject: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify  terms;
 added note.
Thread-Topic: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify
  terms; added note.
Thread-Index: AQHb14n9m+iLSyn4NkycHGawLr50Bg==
Date: Sat, 7 Jun 2025 08:56:50 +0000
Message-ID:
 <PAXPR06MB8224F2CE53A1F4D674969B22A769A@PAXPR06MB8224.eurprd06.prod.outlook.com>
Accept-Language: en-GB, en-US
Content-Language: en-GB
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
msip_labels:
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PAXPR06MB8224:EE_|AM0PR06MB6372:EE_
x-ms-office365-filtering-correlation-id: d6c8a919-0dc6-432b-fb99-08dda5a13e25
x-microsoft-antispam:
 BCL:0;ARA:14566002|15030799003|8060799009|8062599006|7092599006|461199028|19110799006|15080799009|41001999006|3412199025|440099028|102099032;
x-microsoft-antispam-message-info:
 =?iso-8859-1?Q?VLCJZn5rDL/j/Hft/l0wntj0QFa4WfPXgjdvtM30GZsczN6XIFAkIFvFVE?=
 =?iso-8859-1?Q?4FfW+OpytZNUnYrK8DlxD/wQGcl6a+ASk5n0UJheZQTQ3hvnXfCUphUrce?=
 =?iso-8859-1?Q?1eXyN7ISKLWoRFMPl+QCTGb69vqj9wciEOKnxMFCX9Yeb0uzKS876eGfx/?=
 =?iso-8859-1?Q?7f9k7N1yhN4CxriH+tK8Hz3+BPWd5r4/1X13gckV3KejYmmW+eyjFqgkn4?=
 =?iso-8859-1?Q?whmARbnYQU2QQ4QoNCXB/FD5mkJh4MP2n3DaahL0j04rVfCejuyhFHdBGe?=
 =?iso-8859-1?Q?wwfdWM47ymmnXnNGVJaYxBgaCpUajvC8TNhlTCjZtZPgMFA7HLs+rAoyf0?=
 =?iso-8859-1?Q?rIt0chsgqWUVfu11ntMZhpJgy2bOsrauzwTiNPRk44JgP+/ADrU79MyZ/x?=
 =?iso-8859-1?Q?bhCwynFodY2jvhRPaUsj8SIhkdL1QHQi7Qwmjazw2Oqpg/wzLdy3yLCW15?=
 =?iso-8859-1?Q?Itli7UBOyC9CHBwVSEOxAYO+4AgtvjPwGitehN9ZoOnIAai9RgSeaxAlpq?=
 =?iso-8859-1?Q?d1IXzpvfnPwCS3Y1NnZc+nXUDSJtYCrA0exjdFjW0q0PU7jJ6fC3AGuf4Q?=
 =?iso-8859-1?Q?Lrseq83wcU0QDBkIUqCf28ad9lA3cIBrHmJ5vWvTBVDeczrvIJ1/BTDfDl?=
 =?iso-8859-1?Q?i3wd0ywgxNHkEXeekhs0Nx2zSSQSi44Q0zVsUXDXEk+GvfVhkz4rqqqaKL?=
 =?iso-8859-1?Q?2Z2lhySTm2pXBwV/IeT1b58hlCBXm08zGpxQBGFRKI+K/rDqfwQXXRt3XX?=
 =?iso-8859-1?Q?sa2hJWMzqc74unXOtIxS0mVpKgFkvKedj78vor/416/w4kFZH7cEzknpBr?=
 =?iso-8859-1?Q?SbpGgaSZ121iZFe933s7gqtZ1DH014HI+gf3S9Hrao7bU1sKZ6bdug0qXB?=
 =?iso-8859-1?Q?ow0evO1tGbC6U/SCp6a8m4dB9nzgM3SI2cIkaMnqd6riPkzprkHcuR5YrO?=
 =?iso-8859-1?Q?AhURzjt+AQg/RHgoRQSeLiCbiQjPMQuvGXgQHMr1iPmFjyK5axRA3TvYTM?=
 =?iso-8859-1?Q?RKp4OKRIujDcPlD7gax8JE1nHIA3J9eFtoolOtubBWvCHDmS9xr7yb2VML?=
 =?iso-8859-1?Q?CsJGsIQ9hLuLsckirqISQCH3YvjFo6VYEM/O0yNHHN3hy12lOesXI6IOZY?=
 =?iso-8859-1?Q?mQZa6kAT1HHMEZcwV9lZjTwcptog1JvwXPJw/nFWRGpZqRoQFj8hUyi64Y?=
 =?iso-8859-1?Q?X/TWwG+hxHc+iOZlEszDd/KXtmK/G/rHk1I=3D?=
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?r5was3FooeLkzzh51JvxB2ta2Umpn69pMFihZoTkEfSoiiiRTaxtBtV8za?=
 =?iso-8859-1?Q?MqjvNLnOAuVlDKqN0IpxSfUXAABmH1tWCl/mUA7x7STGeGfUl1vCB92qgV?=
 =?iso-8859-1?Q?4+rzDCdFkD5Lg+0B5upPqSAa2YWuUC5wqI37zhvwadZEQvrTB0StkSSMoK?=
 =?iso-8859-1?Q?MfXwonMgeHHOcC0XmCSb1ogWXCtkoaqJeSoUQQQ2mXWPCz/B5/F9bQhz0J?=
 =?iso-8859-1?Q?/aYJYhQ0AvAq34UD1srPY/r+WYC52bjyhdP3gb6RVIeoRzd4fU7Y0jBfRn?=
 =?iso-8859-1?Q?2fPeHGIXtxAkQOPPw+8Upev9f2Kc1BJoSFF6DqI92XVvszeuStvQMViDyr?=
 =?iso-8859-1?Q?iyTSi5RwjluOFCyowxfZRnTG6pI598xaOgVPsDHhuy5ZPmjmc/Kxk1CCky?=
 =?iso-8859-1?Q?dcP41LlQ94gqSGHNlwu8+3mGrVVJ7JIZDi3M0/Erq5gquKVjZJSuWgulYG?=
 =?iso-8859-1?Q?aLaILut/v2jELc2WCwUySjhi7+sWn0x1KxZ7zH7XgRO3htdaq6WYzol4ol?=
 =?iso-8859-1?Q?XaARX7oEd/xAwgwUMoYnFQ0ANnni0CwKkuAaoU0P+y+ckPkASU0TjJGJ6m?=
 =?iso-8859-1?Q?6Davas+dfN9QsEegMdMg60A1Yohdt9LPSaia+x2g4FOQ2fODUkKgf6yYuv?=
 =?iso-8859-1?Q?yiUAA00Tt55LIgHxuTIwu611vVRnUeUWW044/SwjS891BTksSW/TLLBdvd?=
 =?iso-8859-1?Q?OYR5Xm0PWuHbo+RrTbVre+kYqV49t2hPe2S0vxNpJl+5IRjZmrL0jo5oot?=
 =?iso-8859-1?Q?WTbPHV5S0DXLRthWfogPcDQJYo6cn+xDFcI6igItK+eYYHlYqMQln485Dk?=
 =?iso-8859-1?Q?8zAsWoql0vyXZYY0wrMLr1cFuyTkR5dXmqxMpCyrN270SzUe8uoQAwpk7Z?=
 =?iso-8859-1?Q?ihQDH8olh0OeNUBcmQlJC+HIAUaERFF3gzZBKX0S6DXKWkuYBO3ZIYePzn?=
 =?iso-8859-1?Q?BowXkJ3J1qN6ROrS3+h3noLNQfXZjxzvYUeuMXfJ9m9Z+EUxObZfGCU0af?=
 =?iso-8859-1?Q?6zxW5pyGuwiGI92GU9WicKyxWTtb0uNvfTe++2kso5DNlqOkVsUDqyyN0U?=
 =?iso-8859-1?Q?fvsMgYHQ8srUpcCzbC12jUClb3e/A7HnxF8hRyuaNWft+su0DN12vJ+evX?=
 =?iso-8859-1?Q?g16vA9HIWB70T5AYP8zxaTtwy3uBXo/E4s1lli4wG7oc74lHgLOsZvkNyC?=
 =?iso-8859-1?Q?cPVkGHeNay0sUa/2KriEVKB9j9noRh5r1pMSG9NvhVQ7ERO2/hdPJR9FIG?=
 =?iso-8859-1?Q?MP8QABq1YNiDIXqut8QIHw9YUnfHjATTb2DWQN0gmuS7a7Cy3a4HhPFOFi?=
 =?iso-8859-1?Q?CfUWWL7tKqDVeRxtbboATw+HeLxMga1QXXTxiEu20diZh2Y=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: sct-15-20-8534-20-msonline-outlook-c5f2b.templateTenant
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PAXPR06MB8224.eurprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c8a919-0dc6-432b-fb99-08dda5a13e25
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Jun 2025 08:56:50.7355
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM0PR06MB6372

From 1fbe3d56d604a0f8a87ed1d3f092b84c2fab4392 Mon Sep 17 00:00:00 2001=0A=
From: Dante Strock <dantestrock@hotmail.com>=0A=
Date: Sat, 7 Jun 2025 09:29:36 +0100=0A=
Subject: [PATCH] Documentation/process/: Change 5.x to 6.x; clarify=0A=
 terms; added note.=0A=
=0A=
From: Dante Strock <dantestrock@hotmail.com>=0A=
=0A=
As a possible suggestion, might it be worthwhile adding a terminology=0A=
section specific to each section of the kernel documentation? That way=0A=
developers have a handy reference to refer back to for terms they might=0A=
not understand.=0A=
=0A=
---=0A=
=0A=
Documentation/process/2.Process.rst:=0A=
=0A=
- Changed some instances of 5.x to 6.x(though kept some instances of 5.x=0A=
that are used in examples).=0A=
- Clarified the term "rc" in brackets.=0A=
- Added a notice for people installing Git or Mercurial to check their=0A=
distribution repository for the latest version of the software.=0A=
=0A=
Signed-off-by: Dante Strock <dantestrock@hotmail.com>=0A=
---=0A=
 Documentation/process/2.Process.rst | 26 +++++++++++++++-----------=0A=
 1 file changed, 15 insertions(+), 11 deletions(-)=0A=
=0A=
diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.=
Process.rst=0A=
index ef3b116492df..70f8a6603454 100644=0A=
--- a/Documentation/process/2.Process.rst=0A=
+++ b/Documentation/process/2.Process.rst=0A=
@@ -18,17 +18,17 @@ major kernel release happening every two or three month=
s.  The recent=0A=
 release history looks like this:=0A=
 =0A=
 	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=0A=
-	5.0	March 3, 2019=0A=
-	5.1	May 5, 2019=0A=
-	5.2	July 7, 2019=0A=
-	5.3	September 15, 2019=0A=
-	5.4	November 24, 2019=0A=
-	5.5	January 6, 2020=0A=
+	6.10	July 14, 2024=0A=
+	6.11	September 15, 2024=0A=
+	6.12	November 17, 2024=0A=
+	6.13	January 20, 2025=0A=
+	6.14	March 24, 2025=0A=
+	6.15	May 25, 2025=0A=
 	=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=0A=
 =0A=
-Every 5.x release is a major kernel release with new features, internal=0A=
+Every 6.x release is a major kernel release with new features, internal=0A=
 API changes, and more.  A typical release can contain about 13,000=0A=
-changesets with changes to several hundred thousand lines of code.  5.x is=
=0A=
+changesets with changes to several hundred thousand lines of code.  6.x is=
=0A=
 the leading edge of Linux kernel development; the kernel uses a=0A=
 rolling development model which is continually integrating major changes.=
=0A=
 =0A=
@@ -48,9 +48,9 @@ detail later on).=0A=
 =0A=
 The merge window lasts for approximately two weeks.  At the end of this=0A=
 time, Linus Torvalds will declare that the window is closed and release th=
e=0A=
-first of the "rc" kernels.  For the kernel which is destined to be 5.6,=0A=
+first of the "rc"("release candidate") kernels.  For the kernel which is d=
estined to be 6.16,=0A=
 for example, the release which happens at the end of the merge window will=
=0A=
-be called 5.6-rc1.  The -rc1 release is the signal that the time to=0A=
+be called 6.16-rc1.  The -rc1 release is the signal that the time to=0A=
 merge new features has passed, and that the time to stabilize the next=0A=
 kernel has begun.=0A=
 =0A=
@@ -99,7 +99,7 @@ release is made.  In the real world, this kind of perfect=
ion is hard to=0A=
 achieve; there are just too many variables in a project of this size.=0A=
 There comes a point where delaying the final release just makes the proble=
m=0A=
 worse; the pile of changes waiting for the next merge window will grow=0A=
-larger, creating even more regressions the next time around.  So most 5.x=
=0A=
+larger, creating even more regressions the next time around.  So most 6.x=
=0A=
 kernels go out with a handful of known regressions though, hopefully, none=
=0A=
 of them are serious.=0A=
 =0A=
@@ -381,6 +381,10 @@ Some major subsystem maintainers use quilt to manage p=
atches intended to go=0A=
 upstream.  For the management of certain kinds of trees (-mm, for example)=
,=0A=
 quilt is the best tool for the job.=0A=
 =0A=
+Note that not all Linux distributions have the latest version of Git=0A=
+or Mercurial available in their repositories. Consult the package=0A=
+maintainer for your distribution to get the package updated or=0A=
+download it directly from the website.=0A=
-- =0A=
2.43.0=0A=
