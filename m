Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01olkn2036.outbound.protection.outlook.com [40.92.99.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6C14620
	for <linux-doc@vger.kernel.org>; Sun, 10 Mar 2024 00:48:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.99.36
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710031710; cv=fail; b=uFeZpA/lIZRRKOjVrbWm9xaPezX6jcGdjUDqJ1Qr7Ff5oxnrJDbKfv4SR3GWzxYp/UwWmszbJ74fc5ksQOv1CU4w5gBj+hQKFlxhvaihYzjOs2WQM7Wix9M/ftbV2EusKUoBgktsGU3y+96rVf1nFxdoLNt/zIeZ22/Wk1s6Gfs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710031710; c=relaxed/simple;
	bh=3Bu6+n5KE1uDKl2F3eiEukDUDBk8Mixbl67FviBAivk=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=LJPZal2bIyAkkzPx8xm54vaM8q5ZskoizxRJw8hMbM5fXtw1zxGtd5os8QM62nHlUpDcXWR/hODimdbYVSjfhvrPTlsX30oOLBXKhUot2a7bSRLu6/vIccSpyV6bunbunCHrH05ae1Yv3xtnmcQ8X94uZvMEQJkM5/2Obr5hvUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=u53Vai3g; arc=fail smtp.client-ip=40.92.99.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="u53Vai3g"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SYM3VZ0y+WqDhAIIX4gLt1JsN7XNUHKvv+5UlTRmFsPghXwyT0MZOGWyANX0xYJSLuJtuf9QefS2KtVzroJ/5kDlqedihZw4bncvX9rkTxhFRwTxDUBCTp2TaK93g/7Yekc1UBH3JIejAdV+Z8t4JgiN9mxMVoAnAJsUbOwMvLFiI7NwrZptOTKMKNvU/KSBk8u29Tng3Y3JdQQkj9EZQMeodWZocbBuDb5AEUM3bCW1ZtDMCNMkN8FD1dNrpKI5admky3m4wAvuQb4cG3Tkdx/rnf7cbhiN+AkZ40i3nYCZ48b2sKcKbXmYP6uXJ1Tvc0daXJOt4ABqJFfsDpgQew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FGaJrwrsf9Z2tB7hL7P+GdeO5cNbCyMeIBX+xFMJNxo=;
 b=R+bcgapuUB+f6NSAUBLwxok6Ec9uPi5xd6GLDuAsReqUHuDo/0AACBMLgBLNJY/cykTCyoNwpoHmH/Cg3TbsoSpDCRSWqmG2OP5vOWMOhPxjbhrwsfOqOuoBVXORw5JuDPEJ80o+75UzWwsQY+C+YO2b3KxwH71PStEyb+pg/NSmV1gJC6eqsmw7ZRo35ROa3ZfiqjieN6UPJM28llNtQ8yGZdKyuuys/y68eFPC5939JNiwrx72MYmKv+QTAEBKOqRQBha3QMsoJ90jYW/stD70ecf383aBAeks71FFO4Dy0eNEssf4Cyx0eEaiCDNHd4SMr6IwGVgU822kQI1KkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FGaJrwrsf9Z2tB7hL7P+GdeO5cNbCyMeIBX+xFMJNxo=;
 b=u53Vai3g2huhXryNavhB87wZoMKMcJLrijfjhDebJ4yzKpseaVqL3bKKQZTgKbrBt5kzV3nDr3+gkawo7zRhDya8mk/e7+mt3d1LdWLBgB5Ybju/h6r+PbR4Wgh8vlZxVijV1AsNnXbRaCv20DOew+W5qtoxzem8xfBoEjSCc5vjTsAp1zoAtsvavV0TcUhxEJ2YatCJr2y7Vud2SgFEOI7c/K2Yj6BrAyxGTFX6SB6YvU3u4HrrhVqM6fHmQLTzn6q1SZadW1ns/DcX6HIfLjAeTjyfDp4IiQcxRmn1fYti+S+9ULHgAVZpKgyKrPKtX9erwEu0peFC2nHesV7qfw==
Received: from OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:15d::10)
 by TYYP286MB3072.JPNP286.PROD.OUTLOOK.COM (2603:1096:400:30c::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.33; Sun, 10 Mar
 2024 00:48:25 +0000
Received: from OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
 ([fe80::7e6c:132b:7b52:47ee]) by OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
 ([fe80::7e6c:132b:7b52:47ee%2]) with mapi id 15.20.7362.031; Sun, 10 Mar 2024
 00:48:25 +0000
From: jinyilong <longjinyii@outlook.com>
To: alexs@kernel.org,
	siyanteng@loongson.cn,
	corbet@lwn.net,
	longjinyii@outlook.com,
	linux-doc@vger.kernel.org
Subject: [PATCH -next] Signed-off-by: jinyilong <longjinyii@outlook.com>
Date: Sun, 10 Mar 2024 08:47:58 +0800
Message-ID:
 <OSZP286MB23305246FD79A66606B3B35AC2252@OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [AkmMHlhWZzjwk4k/1Jt8TiqnkN+fdjvdtQv6yzP4pTQ=]
X-ClientProxiedBy: SI2P153CA0033.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::21) To OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:15d::10)
X-Microsoft-Original-Message-ID:
 <20240310004758.3662-1-longjinyii@outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZP286MB2330:EE_|TYYP286MB3072:EE_
X-MS-Office365-Filtering-Correlation-Id: fa071e04-1826-40a6-059c-08dc409bcb51
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	nhR3gZNAI0RCmfW+EYuuMVp2j35Z3Gv6/X7gY7X3zC+pOsSIFe+2RYfO2Cd0UBEgpDAgTKgV/f/vT7umCT/MOyVd7MSYJG+Hh8OiWlMpClur95/PTgM5JrE3QZZBWyPCsFNXwQvKbgJ9qyepj6OfVQia36x2wf3+1X4uViHGssXS5Bqald3GGCEZ8KqX5eiG5+H+IxJWi6dprfuBCFNgH6nxS8nlppw/nZv/l0ABFPSeyVK20HhHlG7FUhY8MfwhSZFB7Lzum/Ewt6wcPcnRLhhCmX91IZfvfp5yC3XqhE67uKMVuAKEsF2wZdoH6glR+eYM5Oj5VZ4iHZQjeVe3yQuzyAIweFa8J1J3R8FqfIRLGo/Cy9jOmhzvN29hahznyfMyAQMJTkCdlMZik0V5h/WcMthPURjnodS81RptC7KZJYotMCO4shHdovFrn+sxg5Eb17II2jPPQrhUnLAs+ZFhgD9IXlZo9EoFyQJ9xg5BzRPDO6yREbb564BGYJH2i8gk1do2OFKs/KipYXPmgr6g/Qxj2Lng/zD0CKULtJ9xlc9JSoZ9saAFoXK+gXv5JM8cpjY+0WRkVDAU2DygzBWjLRVHYofCKAw6YFgR/2h50bmOBAjhkEJSMIsHaidEBfk2sjh2UCDcV0Bf+bqlSQ==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bTdsQk05dGxzU0gwbFJnQ0Y0VTFHSmhBV05Vbzd6MThVSHFJUkVzMHg1SHJP?=
 =?utf-8?B?NndUcFQ4bCtzdmxVN3ltUzkzVDdIOE8yUnJ2STF0UGZVQk1aV0gwN0psbUl6?=
 =?utf-8?B?R0hoQ2JhODI3TE83R0F6R0kvZmpxa1RrazF6SmlMdS9LQTlNOGJEd1hmajNt?=
 =?utf-8?B?WnBUeEhZZHFlWjBhT3pTU3RaWXJ5L3VncC92Uk9NSkNPL1F6QVdSazE2Q3kv?=
 =?utf-8?B?Nm1HN2orcSttV2lCQ29XU1Zhd2pFM0duQU1VVkJ2WmFZaEV0azlMWng1N2dE?=
 =?utf-8?B?UTZqVmVqRTBtQ0MvWTVoK1c1Q2l1czVUWUhsbnhWaVp5ZGVwUGR2NE1wTnpo?=
 =?utf-8?B?VlEzd2FXSjIxNWhhNDRwb3hCdy81c0IyMUJwUE9VakxOVGlhOXVUOTMxMERz?=
 =?utf-8?B?WkYrak8wdmtma2lTKzcvK0NIZVFxcFJYWEdqV20zV20vQmxSdnFhZ00wOWhD?=
 =?utf-8?B?U3lKUHJwdlpyWHp4UGJzMml2cWtMSFpaNktIQ3NIMTlrc0NaQXYyeENtbTN3?=
 =?utf-8?B?eFpNdlBLN3M2cTc5NlozZEU2Q0pJL3hVL2pUQ2dSYThRV0REYzNDdHUwL1Bo?=
 =?utf-8?B?Q3NxR0RMbUZKbGpVdWZDNEMrMFM1cVUva3IyazVrM3dYdGoxN0NwUGVrcFRC?=
 =?utf-8?B?cExYMVlvaERzWHRPclRERmtQaFoycllwY29acER1K3lWRmI2dnhVQkY4YXZa?=
 =?utf-8?B?VXRkZzI2THJ3a2FkWVVOWWpxRHc5TEcwc05CUXVaQXZLRHorczNEVzVQZlFt?=
 =?utf-8?B?UFZNd1lBc09YKzEzVkVIeVl0MjZsZlhKL056NkRNUEwzUjR0ekFsSW9nazhr?=
 =?utf-8?B?Nkhka0N3eGNId3FPWHdONVRScFRTdk5RMTFFSWE0WXJQUXY0dXlsWUNKaGFU?=
 =?utf-8?B?R2VZaEhlbkJDakRiU0tHWjQvbGFCTHV2eXdXQ3pxa0g4dDg0aEdPMGV0WmdZ?=
 =?utf-8?B?RjFiYjRzdzhjQ095b2c5VFFuMU5XbGRicnFaTGFXVjFaak53NXFiUEthczlh?=
 =?utf-8?B?QlVNOXBMbnQ0T2pGZk0ydnJCMENyc0F1WW0zYzRjMTJ1aWFFQkQ2b3V6TE9p?=
 =?utf-8?B?dGtQbFI4TlExWENSYkhJczM3cis1djl1RUVrQ0dENHc5MGFLVmFpYlJNbTRS?=
 =?utf-8?B?dzhiazNzTEFjRHV1MDRtM0JSTEJiZElLUGRaaC8vNUp2Q1U3d1ljdVo5YWtM?=
 =?utf-8?B?bmI0VU55VTNHTmpKYWlBUkhaV0NWaktHKzJraUptck5MbDFNd1M5K3dyWlpW?=
 =?utf-8?B?Q2xiMWcxQ1pOQUJybXdQMHZiVmhiRm5Gdlc1SUxHWmFrYmJuWlF2VmlyWmxF?=
 =?utf-8?B?ZVFJQzBPOG9ldWJxVUNMZkxEZkYxdE1ycUhkSDBkUDlGU0N1QTJ6cm9Qd0hV?=
 =?utf-8?B?aVlDRkdqREJBZGlGaUNIVnVmR0tNUFpNcWQ5a1BHRk9DS09JcmM1QlRCSW5U?=
 =?utf-8?B?N3AyMEx3cXR1dnd1QWpoNzhkOUVwa0Y4dU9zc2FVUThNMlZVM0Z4SS8zbFJV?=
 =?utf-8?B?YmkzL0VtZ080SHFXNGgzZXpuQi9rQWhzNkRaYjNTWVdxWDUvd0wvSThXRUVk?=
 =?utf-8?B?UG43NURvSE5CWjVrV0ZraTNJcHhpbFRHR1hwLzYwMlNYWURxSWk0Q3BISE9F?=
 =?utf-8?B?THZqZ2dsdkt6WWlZRThIL0hOb3RyOVRlTkJqQUw3ZE1BZnRDVVZRdXdIbmFS?=
 =?utf-8?Q?sviRDeuztQI1yiQm8wcp?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fa071e04-1826-40a6-059c-08dc409bcb51
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2024 00:48:25.7892
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYYP286MB3072

docs/zh_CN: Added ioctl Chinese translation documentation

The content submitted this time:
Added ioctl to the translation/zh_CN/driver-api directory,
and modified the build and TODOLIST in index.rst

Signed-off-by: jinyilong <longjinyii@outlook.com>
---
 .../translations/zh_CN/driver-api/index.rst   |  2 +-
 .../translations/zh_CN/driver-api/ioctl.rst   | 57 +++++++++++++++++++
 2 files changed, 58 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/driver-api/ioctl.rst

diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 92ff1b7fc3d3..b9d49e93a93b 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -22,6 +22,7 @@ Linux驱动实现者的API指南
    :maxdepth: 2
 
    gpio/index
+   ioctl
    io_ordering
 
 Todolist:
@@ -29,7 +30,6 @@ Todolist:
 *   driver-model/index
 *   basics
 *   infrastructure
-*   ioctl
 *   early-userspace/index
 *   pm/index
 *   clk
diff --git a/Documentation/translations/zh_CN/driver-api/ioctl.rst b/Documentation/translations/zh_CN/driver-api/ioctl.rst
new file mode 100644
index 000000000000..a361efc87290
--- /dev/null
+++ b/Documentation/translations/zh_CN/driver-api/ioctl.rst
@@ -0,0 +1,57 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. include:: ../disclaimer-zh_CN.rst
+
+:Original: Documentation/driver-api/ioctl.rst
+
+:翻译:
+ 龙锦毅 Long JinYi <longjinyii@outlook.com>
+
+:校译:
+
+==========
+ioctl接口
+==========
+
+ioctl()是应用程序与设备驱动程序交互的常用方式，可以通过添加新命令来进行拓展,并且
+可以通过文件描述符向字符设备、块设备以及套接字进行控制。
+
+------------
+命令编号定义
+------------
+
+命令编号是传递给ioctl()的第二个参数，是一个用于标识特定驱动程序的操作的
+32位整数，但是这个参数也有相关的编写约定。在include/uapi/asm-generic/ioctl.h中定义了四个宏。
+
+_IO/_IOR/_IOW/_IOWR
+
+宏指定了参数的使用方式。它可以是指向要传递到内核（_IOW）、传递出内核（_IOR）或两者兼而有之（_IOWR）。
+_IO可以用于无参数的命令，也可以用于传递整数值而不是指针的命令。
+
+参数列表：
+
+type: 一个8位的整数，通常是特定于子系统或者驱动程序的字符序列，并列在ioctl编号中
+
+nr: 标识特定命令的8位整数，用于标识唯一type
+
+size：用于标识所传递的数据字节大小
+
+---------
+接口版本
+---------
+
+通过向ioctl添加带有新编号的命令。为了兼容旧命令，使得仍需要在内核中实现
+
+
+-------
+返回码
+-------
+
+ioctl()可以返回错误码，例如errno(3)。这些值在用户空间中转换为errno值。
+若正常执行应该返回0，也可以返回非0的正数（不建议）
+
+-------------
+32位系统兼容
+-------------
+
+为了支持64位计算机上运行的32位用户程序，每个子系统或者驱动程序还应该实现compat_ioctl函数
-- 
2.34.1

