Received: from OS0P286CU011.outbound.protection.outlook.com (mail-japanwestazolkn19011003.outbound.protection.outlook.com [52.103.66.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8081636129
	for <linux-doc@vger.kernel.org>; Sat,  9 Mar 2024 14:30:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.66.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709994618; cv=fail; b=dF2/F6fRnwuY/KV7tCivKjg8VnkmO1UdvBpKZjy4NOWntS3HUUpua2X/ewsLYX2UXgh6RIR71tnAIb22Ve68/HBZTIK6u8fqEdGJNPrR6TAr5sJrbTKpr4jPo96SLNd6cSm06GaYCemtLu0AxJYEyVSmvmn65xFIe5b541ECFlE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709994618; c=relaxed/simple;
	bh=o3wec0hbDQzpy03DScGfZfrXDYWa/B+lER/j2GUa6dA=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=c1SKOvE3hTuQZUfQLkUUzfeFd9OR6PeTMXpROlrF0u247doloe7OfvzYng12K9p3pMxxebYbcoJBd+iHmTjLDmMqYBmz9IDvCA7d09+WvywDZwA6ERJHbWkmjAwDS7R1yS7t1aH9ZYzdg6LNPFVIO0PRqgBfiR5MkhL2IJZgw7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=RGKm4KHl; arc=fail smtp.client-ip=52.103.66.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="RGKm4KHl"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PdXY4BaXATFHeBQIDNinEJxEx5EROq/bWE77PDEn+5oT5XuZ87Q+HtJMqQ0G3ApJjE3KFrdvvEtgrIQAqXOz6ZKaiZoMMYc+oBupXFoN36+0aAytEkbOQzybIB0ridj8C7wJX5q/iuFwF8pb/YwXo6wgiHgjo1y1S1d9dUxpoxWxmVyq/5oN1bxiEv+IKfUB7DwX2q57uZooAKBXrdHPAhud6fHXn35DdHO4JwxTEJGl00pmfCJzLRWfD79989PsrfmEQPazgynUPzJjjSp+aB5zS2PqTDQkCk/HNgw8CQyARYiF+UW5wZ+AdxgE/I+u6r/UlXejAPGTM6u0ozu8VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GKSSn/m0SqW1Uaf6xZd00sY58gWeXvYhUCOX90D7hQg=;
 b=OQ0BzjDzYqirNX3hwOAbqYCJpjX8ZfbjIv1YAGDDFFPYAIKa2DON/rOmRUjeHYTRqS9E/k8wEOKEdOWcX/OhaOVVMOTPZ+UiHBgu/ifO96lWeuB7QKetLS5jCxtaReeIQZem0ixGq78doJ4ANjugxclJ9MN/qs47EFf4gYIi8KWYg0UL4T8coiD88pgfCpylvFiGhUgl2pHHaz2JVHLn0DTPPCctoOwdqsITROWeTeSYHh7/+8WcvrBHWWJvUmlUYIBwxCT3tdLu1J0Tv6Tws3dAvv65PtwXURBBy7hdwggUwaB/ew9NcYpVqKo6ypFkppJqtYgyrD2Z6unNIQ39Wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GKSSn/m0SqW1Uaf6xZd00sY58gWeXvYhUCOX90D7hQg=;
 b=RGKm4KHlJj7flazCq6ZDwxQjrABQFqUvgluuEkn6hxEywnyIThnGafZM+t6e6y6DhMPUR8Idj43SOsxk7REn+30GpP4Hz+V3AQwu8RchmB4wPEM1Odqr71hT4tjE2Ckiq4hWezz5TdoCyab22rzAqtyvWn4gonk5M5JH6i/R1T9GN1T6C6exXIqN/CXsb9dT8Vn5U+tTgNIszZnt7zsZdYd3q53kiRODwLIye4P7Iu83kr9sDc3NMRP7BRJYp5mSaxaoaveU5d86pApp4t3upD9JccTJ9jcM3VcK9sQRAMr+687PW4mKkmSjQZ3dUC5ApS//DAUGagk8TRLBQoUOjw==
Received: from OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:15d::10)
 by OS3P286MB2232.JPNP286.PROD.OUTLOOK.COM (2603:1096:604:19e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7362.31; Sat, 9 Mar
 2024 14:30:13 +0000
Received: from OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
 ([fe80::7e6c:132b:7b52:47ee]) by OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
 ([fe80::7e6c:132b:7b52:47ee%2]) with mapi id 15.20.7362.031; Sat, 9 Mar 2024
 14:30:13 +0000
From: jinyilong <longjinyii@outlook.com>
To: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	alexs@kernel.org,
	siyanteng@loongson.cn
Cc: jinyilong <longjinyii@outlook.com>
Subject: [PATCH -next] Signed-off-by: jinyilong <longjinyii@outlook.com>
Date: Sat,  9 Mar 2024 22:29:56 +0800
Message-ID:
 <OSZP286MB2330E53FD16D608C76EDC381C2262@OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM>
X-Mailer: git-send-email 2.34.1
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-TMN: [A1zTHYZ7vPJN6PJWZNdBa2+SHmP0EbMn]
X-ClientProxiedBy: TYCPR01CA0162.jpnprd01.prod.outlook.com
 (2603:1096:400:2b1::20) To OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:604:15d::10)
X-Microsoft-Original-Message-ID:
 <20240309142956.47136-1-longjinyii@outlook.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: OSZP286MB2330:EE_|OS3P286MB2232:EE_
X-MS-Office365-Filtering-Correlation-Id: ac40b181-e71a-441b-9801-08dc40456ed0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info:
	DaHe18ni9z4JE+n5hOS43TLIaELvmT4r35vJEXf1cdbFv83o4lWqPgsTllycf21G5tG24/Jcua6TgcV8gpDokIGk6InpCa0BsrZxCNNHErOKFCXvBo0EImxwq/DngcBOO+tSDgb3z+rrndj8agpEJ42dXgdlIl9WJD8Ps6ysJFy+mW750QXodQMj4tzTk1uMlmWXrnI/+WRjkfaOR8NsM2aVlbUBPEdaj0wL7KIlEMy0N4RJS4TcEZChd3tY0i4VQ5dzAl3eP5DHv8mAN1ndxkPUaEgRFwYjDPSBVGUDEDsEOYl9Z634kbCO5hjqKwxJdTIxII1fQK4kd2aUNz6GmtEPe96Qv8f8PweNgN2+YDhc9vqKafluNy+NNVrcdvaB3yLwNscaSD+LTg5A813VpLsqmM+wZZ4BsuOUFd6zjViOJOJ2T8rn/VJaLfPm7sd5ZZ3nuGDlyzx2xUBGG0JApI4G/RJoZMNvVRLJ2FezPsJDrvf5O2Bs97PYG1X2OBthjN9/pZBCL3cDepG3WvYUotTsc6BwQNUuSOj2w+AhF+lWrwUZB3b77kNu35LUlONiUC+xE/PoDEI/RV5r8RtSP9thjRSdm0eVjK5+4juJI97H8ftMJfsSSQpTRWaRhUiMzHHPtvPDEs6ncmR2EKGD3w==
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?eTBLWExoaFNEN1ltZGprZ05hdmZVSDVxY1RtZjF5bFJaSHU1NzV0TW5wMElo?=
 =?utf-8?B?ZnpnZjRoSzFpOEVNZnhDNncxaHlGdDBOa0FBdFpYVHpDNEdUVTJRejRjTk5L?=
 =?utf-8?B?SWNCVUlrWDZUaFhIWHQxSGRsVy9xeGJRV0tmSlVUenZmRGVqWnV0aFQ3OTdq?=
 =?utf-8?B?eUFNQlp3R3BSVEwyT2NWamxRa1lBelFuOXI3RHU1eFV1RFFYVFpkNG1BZUN2?=
 =?utf-8?B?NTNnMHhUazM4bmpZenhTS3FVb2hua0x4SXZKUCtUQzlLMjhlcmp5VlVVaHNj?=
 =?utf-8?B?Qkc1MzRFOHNNTUM0U1dmRThqOXpWRVRxeUFqTWV1cEpqSFRhMHBkR1hqbzFO?=
 =?utf-8?B?R1MxUFp0ZjUxV0xma1VxOTVvYlkyVmtUOWNBZ0E2amRBaVVPUGdzNkxJRE1L?=
 =?utf-8?B?U2pVTTNyVk5CdEdoaTNjRktOQitHVjJLZSswbGtkcVRoMjFRQ01nZjdtaVpw?=
 =?utf-8?B?ZzdSTjd3c25vWURXWm1LRDFHRmpFcVNpVU5LU25IWjFjaHFNcDV0dVcwUWRT?=
 =?utf-8?B?QzJhSDhoQ0R6Sjlad3RnMUN3dWpVeEhiZ2wrYWNLRDlkYVBKdXdzRGVvMFZo?=
 =?utf-8?B?cHp5bnUvTkRxVHBwOGVZRjRENHBid1FqdTJXQkRtQ0pyUXpIK0tCak9TbW9K?=
 =?utf-8?B?UDV6QmxMcEgrZ0Z6VWFCTDkySGwvK3gxR2RTaWI1U00vMGZ2VVNNWVZ6dmV1?=
 =?utf-8?B?NkJHbVhWeWZIQis2akVZaVY0QXBnQlVBV1dUS05sc01EWmE0R0EzSVdoS2lT?=
 =?utf-8?B?VGlzc1V5Zjg3QkoyZ3VrQzFLSm1kNWhWd2M1WTVXUzZnVDlGdWE3NlFsMEJL?=
 =?utf-8?B?Y2tneDRVTjJkbWxvWnhmMWFVRlNpaHhFMnY2aHRLcXlkQzIzeFU1empqZ1FQ?=
 =?utf-8?B?TGtWT0J0OXlGNU9UcDBwMWdhTWJaa3I2aU9lSE51eDMzeWF3c1gzc3IvN0s4?=
 =?utf-8?B?NTdhOVV3VGg0V1V4SlBhMTlTZ01SWVlQM3l3Rm4xU2FnSExHVjBuZkVvYVlT?=
 =?utf-8?B?Mlh0SElUODgxN1hFMkg2L0dmVXJ1cEJvZVk3cE80NWFlNkl5alpWcXBISlBq?=
 =?utf-8?B?TXZ0eVU2bjE2cGs3V29lNXVmUTcrZTEycnc0WjE3ano2RTZTOXJXaHJlVWQr?=
 =?utf-8?B?ZWE1QXJBOVZrRVB6d1V0MFJwM0J3L1dnVzNBRklYNUZzSlUwTHArSVk1SGxM?=
 =?utf-8?B?NFMwOElEblhsbWtaZThmNG5iakl6cDNMdjIwUjUzZkNTWks0UkduQ2h4cWtM?=
 =?utf-8?B?OUJxSUF6bFpOdlRqK1A5OXdWOGNHR3J5YTBHbzVSV0ZNZmJ3dVdPbzQ0Mk1I?=
 =?utf-8?B?dE5CakhVK1NvQlpOczNId3JLUjdVRkhxMVZTbWZST1V0M2pwN2g5RGZXalBa?=
 =?utf-8?B?Ymo5dzhpbkVEeWYwS0RrN3p6dDE1WFgyOGIvZElvWUxCOVp3YnhGV2VjaG14?=
 =?utf-8?B?OGd5dnVTNE1pN0NGbUJMaUNoOE1DUllobGdXWnlCTXVqZHpOMllMdjBrT01W?=
 =?utf-8?B?QUFEc1czUDR3Z3VTTVhtUFZKVC81cTRTZ2NmclVzSlNSK3htNmM1Q3ZXa1Fy?=
 =?utf-8?B?UHpvblRyWWdwN0QrR3hITHdRUzVDRVVpWDNTWE1uV0tuSHVKY1lMM05kaUFw?=
 =?utf-8?B?eDJpdXMwZzNXYmNWT05ORFVwOHZXOGF6YkFzQnNZODc3RExweTlSb0VWRDdY?=
 =?utf-8?Q?iFGbDxNW1xCwaHqkgA/2?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ac40b181-e71a-441b-9801-08dc40456ed0
X-MS-Exchange-CrossTenant-AuthSource: OSZP286MB2330.JPNP286.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Mar 2024 14:30:13.8097
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3P286MB2232

docs/zh_CN: Updated index.rst and added ioctl document construction to it

The information submitted this time is as follows:
Add ioctl document construction to index.rst

Signed-off-by: jinyilong <longjinyii@outlook.com

Signed-off-by: jinyilong <longjinyii@outlook.com>

docs/zh_CN: Added ioctl Chinese translation document

The content submitted this time:
Added ioctl.rst in the translation/zh_cN/driver API directory,
which describes the Chinese user guide for ioctl
---
 Documentation/translations/zh_CN/driver-api/index.rst | 1 +
 Documentation/translations/zh_CN/driver-api/ioctl.rst | 2 +-
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/driver-api/index.rst b/Documentation/translations/zh_CN/driver-api/index.rst
index 92ff1b7fc3d3..a57e73ff08e5 100644
--- a/Documentation/translations/zh_CN/driver-api/index.rst
+++ b/Documentation/translations/zh_CN/driver-api/index.rst
@@ -22,6 +22,7 @@ Linux驱动实现者的API指南
    :maxdepth: 2
 
    gpio/index
+   ioctl
    io_ordering
 
 Todolist:
diff --git a/Documentation/translations/zh_CN/driver-api/ioctl.rst b/Documentation/translations/zh_CN/driver-api/ioctl.rst
index a361efc87290..488aa136f388 100644
--- a/Documentation/translations/zh_CN/driver-api/ioctl.rst
+++ b/Documentation/translations/zh_CN/driver-api/ioctl.rst
@@ -54,4 +54,4 @@ ioctl()可以返回错误码，例如errno(3)。这些值在用户空间中转
 32位系统兼容
 -------------
 
-为了支持64位计算机上运行的32位用户程序，每个子系统或者驱动程序还应该实现compat_ioctl函数
+为了支持64位计算机上运行的32位用户程序，每个子系统或者驱动程序还应该实现compat_ioctl函数。
-- 
2.34.1

