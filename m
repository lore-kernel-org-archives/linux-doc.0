Received: from OS8PR02CU002.outbound.protection.outlook.com (mail-japanwestazon11022084.outbound.protection.outlook.com [40.107.75.84])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC39113C918
	for <linux-doc@vger.kernel.org>; Fri,  3 Jul 2026 01:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.75.84
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783043433; cv=fail; b=E2AQ5R/TRrbQwjiSPEgB3Y3fpMPEPfRJZ2YbhF0ppQc7k+cTZpXuHslOkt20MGR6a39ns62TH8yngigU0BC6nqfv2mbD9NYMs/UWNZUhm09hqsDdz4CD6fXjbsN9idEehnAG4fwuWZR2ADeAlEH05TAoUITGWEVBOrUae5/d6+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783043433; c=relaxed/simple;
	bh=EwJAwpccl7zBjlCheYMcrbSZzXbaAymuyv0J3nN/qdY=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=rIcSkQISv2CaFA3avfAi2fufNc5/N8nsYQjQVCNmj2gveei+ZRNggTJ6Eke+QA3WLbafVU2bZ7Rw7yqs9DBrwpjSN+kbOzw5NRCLrcyfkRZZwrOIz6shQdtvfzoH6u9ynv6Jwi5T+RopBqkTmYtDxrayZuIU/LYiT3OwgTt9uXA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com; spf=pass smtp.mailfrom=transsion.com; dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b=FWkMXWWv; arc=fail smtp.client-ip=40.107.75.84
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=transsion.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=transsion.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=transsion.com header.i=@transsion.com header.b="FWkMXWWv"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m5grVh03k7XzJHuNjhfUlHhOpVf37EtZgjBMkP2H9kmMbAgbcF81J/I6JrygbzdadbzwJuwfcBFlpxQlP7gQYciTAzSWMBb2ch0Za2YmEhqMNdYSeZ5pWe6Gh5MVIfC0QQefbpcj3+80Zm3aPqgCYhinrvgUAfyeEUwi2BJT4ERNjngnxgfXiMV5Gz8/vZmWx7Id80BoROnXfw2spErds/BedyRkES0EoOnv/AqijLS/w91hTy3ogYWrIYPJA93OtWsPujL5DJePi2IclQapo2MZ/XI/vKOuvIJguBJ7IYxWZyI7LyXto5309WQRYDabWhLTcB5DDFo3dKXhHADWnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=w2KTI1OQmbiYJRw+cPcxWr8CxP6apA9ZiTU/V3+B4XI=;
 b=mZFubZ+CLiZI5QexU+3eSSZoludTRSC+rkQ4wv4XRUszSRuzDiARvWZVz+hDk+QpWLRosxreq00UtqtGtMKhJOCVvtnGmlfMCbJ/FTHLiL41+Sxd+fLYzqgeZJterle3fnfXAlj3hC5jlAF3tTC8gg7OyAEjWfm5QmvVUTJ+SusVl8KuANO5fQdqcqDrbVruCajsmwVHeM6MhqhOgun+oGbXSEarr8EEEo307xGXtNG8gJscjtm0oCpsdizzCvzMXdy4xa1MJmn7Jqc8MEr7rtzVjHnMv0zIV2Hcqm59ihTMfOPDXIfKhAYjdpgtqIuQraSP1ecZNHlg1nBoJCafIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=transsion.com; dmarc=pass action=none
 header.from=transsion.com; dkim=pass header.d=transsion.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=transsion.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=w2KTI1OQmbiYJRw+cPcxWr8CxP6apA9ZiTU/V3+B4XI=;
 b=FWkMXWWvRASro2kHQVslrAynmXowSnWPoFvzBRckJBZI/3C7VvbERp2mg1Zd4RvzNMjKl/5vK3h1OwvF51a7zX/a8GZMAW6Gs9DD8iFsDEabq/Lka8d2UoL80XOUIoH6jZkUBA4dcMrjsf8fFgauXvcggJUTpGfPnusu/5gcw/A=
Received: from KUZPR04MB8965.apcprd04.prod.outlook.com (2603:1096:d10:4a::6)
 by SEYPR04MB5857.apcprd04.prod.outlook.com (2603:1096:101:80::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Fri, 3 Jul
 2026 01:50:26 +0000
Received: from KUZPR04MB8965.apcprd04.prod.outlook.com
 ([fe80::f38d:58bf:40b6:9438]) by KUZPR04MB8965.apcprd04.prod.outlook.com
 ([fe80::f38d:58bf:40b6:9438%6]) with mapi id 15.21.0181.009; Fri, 3 Jul 2026
 01:50:26 +0000
From: Mingzhu Wang <mingzhu.wang@transsion.com>
To: "corbet@lwn.net" <corbet@lwn.net>
CC: "chris@chrisdown.name" <chris@chrisdown.name>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, Jiazi Li <jiazi.li@transsion.com>, Hongyan Xia
	<hongyan.xia@transsion.com>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, Mingzhu Wang <mingzhu.wang@transsion.com>
Subject: [PATCH] docs: printk-index: refresh sample index entries
Thread-Topic: [PATCH] docs: printk-index: refresh sample index entries
Thread-Index: AQHdCo5RLO98yu3pekW8SyJJHHsI1A==
Date: Fri, 3 Jul 2026 01:50:26 +0000
Message-ID: <20260703014954.780-1-mingzhu.wang@transsion.com>
Accept-Language: zh-CN, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=transsion.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: KUZPR04MB8965:EE_|SEYPR04MB5857:EE_
x-ms-office365-filtering-correlation-id: 378ed433-c934-452c-553f-08ded8a57452
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|376014|1800799024|23010399003|11063799006|56012099006|18002099003|38070700021;
x-microsoft-antispam-message-info:
 smT+kiuSFwHYx8mnNnM9OAqK5CRVbL6oBPkW0s7phCUfc+kNzRuvEiPsEv7p5eO+UfBdT+++i437gtDZuvlCKyJqnDHkokfzk4/h3fW8PRiS3KcjYVJqCuDxF6KIEc8y1MRvuw54lr3uAbAmIXI1fFiV9wf05BJNE2mQWricPnVq49rvOyw5Xuoli0I38/ToNsmiIcQjccb5xkCMB+HL1VLlsfnBVqUrREyMThRMpePVG9tOQLuQT/OJnx+0ump/QWjPIKqfJvuH+m1vZ5hZPma/Cy+znUM63Ukwkm/fxG4Zs2hKcS/cni/mfwYX3aqjfJ5uVW7O2yPJYFz6sYDHpoGa9R9ZZkr8QSA8iAaTEU+8WutO7iuEifYHSyxijni39Y9OjMho0tGGC4dQIARaN3ut3+BUGtg2zxMGsSS+3rIdVfPrs3PTUkFBckq1Y8Mr/QY3KCVorjwpwOVUK2beaaZ4MOu36ZkR54sc4fHBoc2kAK+V5opN8h77gucn2MorwiwXiu1qVY7jM2NBTw6e5K4Lv/JbeWnRxvwsFQ3D7gwQlrPG+tGIS6qZKQCzssJk5TCQ0n7ZkkqDDU+GQzLOJ8+RsS1afgyJxU9uE5sxxTUIl5OW1zr1p3MJnQvqgVeVrXYy3cXP1jXreUVIksQyh+50C0N5tQVj5CfFBFjOYI0lDsRi1MbAMZFYnU3fSMt53HebFrEZtw2uJQERMFw4DN+zjMQVBD2wdpLYX6/0HkY=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KUZPR04MB8965.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(11063799006)(56012099006)(18002099003)(38070700021);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?iso-8859-1?Q?2cL8IIkeJkzisrAy6zfEq2v8M/2jtxfXVtDb3hC+PXQYk566TTS6il1skI?=
 =?iso-8859-1?Q?mqMqtTp5Aupc7+kl1LVINA6mBX9Ow2j6yjxrvPJ6j6whQhuoWAeGD+vluW?=
 =?iso-8859-1?Q?DxmOA/QIlourvSoAMcJ007aAEpVqOTw7TB8PeGsMv2HoZnl+zF9NSYIA+4?=
 =?iso-8859-1?Q?GpP9a8/QU88N3fhkcydkU4wFL0YwvlINGFiz3Z/Wg1yHfiQMS54pTwjb+m?=
 =?iso-8859-1?Q?Fq0wFifoj81fGJuF+gFufhqQvfQVKsvfmyC5Brd/SFtB+452il4ReepQYe?=
 =?iso-8859-1?Q?JxAndMHNKFbb/CM1BTPnaQCYVwz2IzODwfEHz+sXyTyNc5xyr5Y7ky1/h+?=
 =?iso-8859-1?Q?s/vNZsAGrpk6ny6hz1ErpzrDJBm/oDEZInv1OgQ5Yv10W1ouz4AhM/WALZ?=
 =?iso-8859-1?Q?pnW2F1kZpv9oDUAJgOFwsJfyTzKax4NbcUQjcQ6QGccb2wiEPry78lqVpw?=
 =?iso-8859-1?Q?0Sncf58ushg7OwrVs5l4LRdrOjYzJwT0o7P1D2N8Eq+pnqaDZjwZ8/sfoL?=
 =?iso-8859-1?Q?aeT21tnCjIvPyTrYs3KJXY57JVQXE+j6f0UyYz+6jJIR9ohgAua0Ulf6Hf?=
 =?iso-8859-1?Q?dS4nXitONmQ/rvMfpEAEO/1Z2/ttOU3h1RGfUaIduyQ/9/TAwq7b0xqaT1?=
 =?iso-8859-1?Q?3AX33Ug9L9h28lnVMgLyUMtuUfjICuXYdb5aIuN1i5lKVrCPKyu+k0P1os?=
 =?iso-8859-1?Q?V259iyYsXZ+c2Uw3K3kAO4XbGfnqj06XeOCHlPiFL5g2waJeWtEHZwgtei?=
 =?iso-8859-1?Q?Bhk0h3iWTryxFLuRsqg5G8lmHZPHrwzu8ecR+zIwjEx0nT82HZOrYD7AHO?=
 =?iso-8859-1?Q?EqiJmCCkTcqTJp3ZzqKig7DWc6HdLB+FJZ+ImpkvJKOrID2VrmPFR/ol8U?=
 =?iso-8859-1?Q?MMPmRm1fysVd4GnOs1PM2NrQUjUqocy1PgDpwyJMuLrHr7XZbcR/kJYPMs?=
 =?iso-8859-1?Q?i9ItjWNjM1IAN1X+fY4QmNwrIjbiK9euYXaSZ1MNtTzAawu+cT7lTbdTkO?=
 =?iso-8859-1?Q?8Jqz/cdUOb74nqYQNjK1pgO4mPc7DgcPFLey9WDaeOoFEF2dawCQmO6OP2?=
 =?iso-8859-1?Q?yQPS9rkX4eCRmPhjeYCxftDDBzlsMsJ/wTRVfDSkxhsmD6EFSCxfXwBH9r?=
 =?iso-8859-1?Q?r97L+iU03s4ajDrf6oux6XKMORVZIPlrnSn773/9yVFPGu2VcW8z2Yn0jK?=
 =?iso-8859-1?Q?SguF80S4r1CIXW6qd7nV9D5j1I/qt+uuYOyH8bNRIMmZLY+haGtrxgi4KO?=
 =?iso-8859-1?Q?pko7F12SrTbCn4gLINIl1bHScxgLOG7nHqXrGSgSl1NYNcpm5GDavZ5dgY?=
 =?iso-8859-1?Q?Qtp2OZCC3Tfyk3WYAoYh7vFFom5Veplkr5SBpdw0/jNCmL64kQ4S+S/ez+?=
 =?iso-8859-1?Q?yLAaE1eHu7wwq6Djmq6HTnfFJMx/XZdzgxFe4fPATi5Fw6I6tSz7P6EJRY?=
 =?iso-8859-1?Q?geMbJGBHYvVkW80CXr+MySc3ImG7weo0Us6RtL1rvi9xqS4juR4Vc8DqVT?=
 =?iso-8859-1?Q?cL/A/nIUnLfL46vQV00rJsyZGpY0X3zRpFc18SXuh88hVZ3lG9zirc9bNy?=
 =?iso-8859-1?Q?gLU3pj3k2hJoK7Ddf7i59x+tZgFRw+1eBzq4q3iFJtLanXlBFLBQktBpmH?=
 =?iso-8859-1?Q?3y4Snw58Z+5A0xBxjoRcpFNjewfK8nBD0xYXJqMi5lWsdps1TmeiC3gOUW?=
 =?iso-8859-1?Q?Og/8Eol5bimkcbct5bEEleW8NE0bnRkKLpSRo6EmFBFxM1mCQnj4Eqa9bA?=
 =?iso-8859-1?Q?jDzWZjAS91RM6f9fKLRiwGNxciFRaPsgUAL3C9lj7oE2Yirtci4FXlzj9v?=
 =?iso-8859-1?Q?25uiXgzYTg=3D=3D?=
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: transsion.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: KUZPR04MB8965.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 378ed433-c934-452c-553f-08ded8a57452
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jul 2026 01:50:26.5322
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 2e8503a6-2d01-4333-8e36-6ab7c8cd7ae2
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: uGfPcmDKKATn1BTHBt4VM+cwnQQa2xcWlJdOKCIoXvoncE1F7g9PAzkA2gUKf7G05k0WiiJQ8E1e7mif+VT4Pq10I304GruwYYKCp3Pcvbs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR04MB5857

From: Mingzhu Wang <mingzhu.wang@transsion.com>=0A=
=0A=
Update the example printk index lines in the User Interface section to=0A=
match the current source code. The previous examples contained stale=0A=
line numbers, an obsolete function name, and incorrect format strings.=0A=
=0A=
- block/blk-settings.c: disk_stack_limits -> queue_limits_stack_bdev,=0A=
  and use %pg instead of %s for the device pointer=0A=
- kernel/trace/trace.c: update line number for trace_create_file()=0A=
- arch/x86/kernel/hpet.c: update line number for _hpet_print_config()=0A=
- init/do_mounts.c: prepare_namespace -> wait_for_root, with updated=0A=
  line number=0A=
- drivers/acpi/osl.c: update line number, include the "OSL:" prefix=0A=
  from pr_fmt(), and fix capitalization of "Auto-serialization"=0A=
=0A=
Signed-off-by: Mingzhu Wang <mingzhu.wang@transsion.com>=0A=
---=0A=
 Documentation/core-api/printk-index.rst | 12 ++++++------=0A=
 1 file changed, 6 insertions(+), 6 deletions(-)=0A=
=0A=
diff --git a/Documentation/core-api/printk-index.rst b/Documentation/core-a=
pi/printk-index.rst=0A=
index 1979c5dd32fe..40023f7dfe98 100644=0A=
--- a/Documentation/core-api/printk-index.rst=0A=
+++ b/Documentation/core-api/printk-index.rst=0A=
@@ -47,11 +47,11 @@ The content is inspired by the dynamic debug interface =
and looks like::=0A=
 =0A=
    $> head -1 /sys/kernel/debug/printk/index/vmlinux; shuf -n 5 vmlinux=0A=
    # <level[,flags]> filename:line function "format"=0A=
-   <5> block/blk-settings.c:661 disk_stack_limits "%s: Warning: Device %s =
is misaligned\n"=0A=
-   <4> kernel/trace/trace.c:8296 trace_create_file "Could not create trace=
fs '%s' entry\n"=0A=
-   <6> arch/x86/kernel/hpet.c:144 _hpet_print_config "hpet: %s(%d):\n"=0A=
-   <6> init/do_mounts.c:605 prepare_namespace "Waiting for root device %s.=
..\n"=0A=
-   <6> drivers/acpi/osl.c:1410 acpi_no_auto_serialize_setup "ACPI: auto-se=
rialization disabled\n"=0A=
+   <5> block/blk-settings.c:955 queue_limits_stack_bdev "%s: Warning: Devi=
ce %pg is misaligned\n"=0A=
+   <4> kernel/trace/trace.c:7861 trace_create_file "Could not create trace=
fs '%s' entry\n"=0A=
+   <6> arch/x86/kernel/hpet.c:147 _hpet_print_config "hpet: %s(%d):\n"=0A=
+   <6> init/do_mounts.c:413 wait_for_root "Waiting for root device %s...\n=
"=0A=
+   <6> drivers/acpi/osl.c:1455 acpi_no_auto_serialize_setup "ACPI: OSL: Au=
to-serialization disabled\n"=0A=
 =0A=
 , where the meaning is:=0A=
 =0A=
@@ -130,7 +130,7 @@ For example, drivers/acpi/osl.c contains::=0A=
 =0A=
 This results in the following printk index entry::=0A=
 =0A=
-  <6> drivers/acpi/osl.c:1410 acpi_no_auto_serialize_setup "ACPI: auto-ser=
ialization disabled\n"=0A=
+  <6> drivers/acpi/osl.c:1455 acpi_no_auto_serialize_setup "ACPI: OSL: Aut=
o-serialization disabled\n"=0A=
 =0A=
 It helps matching messages from the real log with printk index.=0A=
 Then the source file name, line number, and function name can=0A=
-- =0A=
2.53.0=0A=
=0A=
