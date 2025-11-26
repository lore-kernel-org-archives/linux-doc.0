Received: from AM0PR83CU005.outbound.protection.outlook.com (mail-westeuropeazon11010036.outbound.protection.outlook.com [52.101.69.36])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF7F12DFA48;
	Wed, 26 Nov 2025 18:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.69.36
ARC-Seal:i=3; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764180006; cv=fail; b=AFZbxAywFnoy7Lq1ah3z9k/C9RfcLsGqKgYvgkJV/hNHVhWu1bV2yKQ7+Tjv0ar380cTYfkboCVCCNKzVXttfyicEAZSFAAby4kc8f/UaKWlu03gZiPMn+eP6orIDuVFpBPBzFAnmkShk28xwtw99c9k8b6Aj0Qz6xpW5osWY4s=
ARC-Message-Signature:i=3; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764180006; c=relaxed/simple;
	bh=jxgd5x181alQXsS4Twmg4q9KZ6nlhVqNRWbywBs1CN4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=t7Wu/+8hJG2kmM4EkliMg4QfH6QSPkNYw/lY2xQOgvhP+J3/M9cZS5OzTQsxdd+0539LBSWKm2eWC0zEw4yesWdAp2WrX1ZLrFmZtstQKYGdXiyh8BroEQ952oqWJTlXxymFB5x3UXuILPcgpKSX+njgChu88tiTkEXC5rJz9ks=
ARC-Authentication-Results:i=3; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W48fum4L; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=W48fum4L; arc=fail smtp.client-ip=52.101.69.36
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W48fum4L";
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="W48fum4L"
ARC-Seal: i=2; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=pass;
 b=cNtRbMXQGpL8D7ovVJ/aW7rQW9XEmuV08JPwkjhL+0eUAR+4wQG0LtxUzrvVRtT012WOFog7QH0GB9J+QYt4D6eCsZrIUOgusqnG0nMJzpG+aRczIpnCPQpmOOY5NMS8XYS2S3Pl6c1k/vYZptfEyhwsDyvbIFb02Zd+kD1H4LT6Lw+UoAhdX9qa7TXAJ6C6QsLu350Yf4axJaDcBpepKh+TgYalQKLUICLrHVfs2lnVf5grUU26F46r38pXWrr892kQ2cAf94a7x5eS8lVGONnEIcmSOFqE10gLxCdTSlv2FOTyRRnW/Lgsqlmi2PG4tzagXqZTJMGP+A5oXfY4qQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmI0NB3TKVQGi5J6LL7oTqgdMceEqcBTWJZn5KagmFg=;
 b=YM50mZ85BjNQOVOs2mWHI8aeXy0c+N+kgB8eG1/r0faZoGIrZXG3IVBqajesMMYJ9g96PR5llCfDfBt+2Nd95Z7IFQy9EbXYCsrxZ8xFXKvO1yvNxrBI3ajZZfUv2FhfoH2imG6G3HpIa6sQh4aSBW0Bz5pqf6KSVRf1kSFUeQc/6SQuN69EVySdqg0QkjoyzbxteRY4o1ttFgMbu7Am/LzGkNFg8lI5lSWBnouJPDAxCeaZzbd8F+L/kIYr/G2uk1f1ag/LO/z994JOabIeNTkF/oHb0kAyB2dskaSy95O4YCL8KCW+xKLUVGemKPihogE+quYyTCSi/HH+BYRlJg==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 4.158.2.129) smtp.rcpttodomain=lwn.net smtp.mailfrom=arm.com; dmarc=pass
 (p=none sp=none pct=100) action=none header.from=arm.com; dkim=pass
 (signature was verified) header.d=arm.com; arc=pass (0 oda=1 ltdi=1
 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmI0NB3TKVQGi5J6LL7oTqgdMceEqcBTWJZn5KagmFg=;
 b=W48fum4LJn7E7Lym2I9p929g2OSNPlfk38f7C+y30OIwe7raRGfq2USjbIu02cw06+PdJEDNdMEkxCLzjfLw0klCqzX5cLUm8g4gpz1VTABGUsdvuQfYVRwtyVZWQY41R1rqrOFCY0w0x8vcL4FaAlDVxAjpFc2fzOADYLsGCsM=
Received: from AS9PR06CA0083.eurprd06.prod.outlook.com (2603:10a6:20b:464::27)
 by DB9PR08MB7495.eurprd08.prod.outlook.com (2603:10a6:10:36c::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.11; Wed, 26 Nov
 2025 17:59:56 +0000
Received: from AMS0EPF000001A2.eurprd05.prod.outlook.com
 (2603:10a6:20b:464:cafe::4) by AS9PR06CA0083.outlook.office365.com
 (2603:10a6:20b:464::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.13 via Frontend Transport; Wed,
 26 Nov 2025 17:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 4.158.2.129)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=arm.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 4.158.2.129 as permitted sender) receiver=protection.outlook.com;
 client-ip=4.158.2.129; helo=outbound-uk1.az.dlp.m.darktrace.com; pr=C
Received: from outbound-uk1.az.dlp.m.darktrace.com (4.158.2.129) by
 AMS0EPF000001A2.mail.protection.outlook.com (10.167.16.235) with Microsoft
 SMTP Server (version=TLS1_3, cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.7
 via Frontend Transport; Wed, 26 Nov 2025 17:59:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WGU0lhZ2xS3vZ/lLjiNW79dSPfj2n79eLPrh9wDt6ORoA7CrELaxYsF2tTgLGEif8I27f0JKEYCLu564Nq+NFAGOji3eFK8RNYeFeov9n7doiHMqo9fGnxF/WULXYNmVPA8dvlaePUsAJWfqAkXVDwS4WhYtPOTgUAlZuTLR9Zl6LU7G+SMSIjsxabzoov2H4W6cI6eUprbkOsvheB3IJuv3cXe+lYuGiatbweyWPm2Kji45ajEW+LJkLPnmczUL/qMcrAwsPMbhUu15ReUguNgvxM8pOzxA+K3Yw9PiiuGMXs75LAwABJf5L5OiPeyPeUjPY8Sr3gQa4zZwKojpeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AmI0NB3TKVQGi5J6LL7oTqgdMceEqcBTWJZn5KagmFg=;
 b=cwVbIMgG80VaRr5a/45g3Td82enPcHQCfThD1CAvggD7cvl1jVhtzYbUSoe3+4b1oXfoP3XcXR/NklZmHfLW0NXH5NRHwzkzgqx6lme7pO2uBj98H5vY+01tXrGHphW3ff/DZcUNFp6AnDmBrxB5dz26B8wPWIC0gx46Wwg++7xAl3LMNMbrFaZBCQKl7i0cXxkStOiZzHBMzfbTwxapmlyKP/DHHyIZeWI6wpCIawZV/IVmxfCUp4gWqLJNkoYf4yCyQZHDRtvquYyOVb4jTm3qJ1eIxJNvOcW5Ojhlpkwvz8dovFOqtNOlZaorus/0QQNTGPx5TUbj4ZjEojIRnA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AmI0NB3TKVQGi5J6LL7oTqgdMceEqcBTWJZn5KagmFg=;
 b=W48fum4LJn7E7Lym2I9p929g2OSNPlfk38f7C+y30OIwe7raRGfq2USjbIu02cw06+PdJEDNdMEkxCLzjfLw0klCqzX5cLUm8g4gpz1VTABGUsdvuQfYVRwtyVZWQY41R1rqrOFCY0w0x8vcL4FaAlDVxAjpFc2fzOADYLsGCsM=
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10) by PAVPR08MB9771.eurprd08.prod.outlook.com
 (2603:10a6:102:31f::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.13; Wed, 26 Nov
 2025 17:59:22 +0000
Received: from GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::c046:174b:3152:d74f]) by GV1PR08MB10455.eurprd08.prod.outlook.com
 ([fe80::c046:174b:3152:d74f%3]) with mapi id 15.20.9366.009; Wed, 26 Nov 2025
 17:59:22 +0000
Message-ID: <61a0b2e5-fa53-4ed2-af26-c519a03a9dc9@arm.com>
Date: Wed, 26 Nov 2025 18:59:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Move Python modules to tools/lib/python
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
 Akira Yokosawa <akiyks@gmail.com>, Jani Nikula <jani.nikula@linux.intel.com>
References: <20251110220430.726665-1-corbet@lwn.net>
Content-Language: en-US
From: =?UTF-8?B?QmVuY2UgQ3PDs2vDoXM=?= <bence.csokas@arm.com>
In-Reply-To: <20251110220430.726665-1-corbet@lwn.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MI1P293CA0011.ITAP293.PROD.OUTLOOK.COM
 (2603:10a6:290:2::20) To GV1PR08MB10455.eurprd08.prod.outlook.com
 (2603:10a6:150:16f::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic:
	GV1PR08MB10455:EE_|PAVPR08MB9771:EE_|AMS0EPF000001A2:EE_|DB9PR08MB7495:EE_
X-MS-Office365-Filtering-Correlation-Id: 1947fc31-4369-44c0-46bd-08de2d159abd
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted:
 BCL:0;ARA:13230040|1800799024|366016|376014|10070799003;
X-Microsoft-Antispam-Message-Info-Original:
 =?utf-8?B?SlkrenNmRms0cGMxZkdGS1ZRellQd3psUkxiMnhkUkgrc1ZpRCswWjI2bC9J?=
 =?utf-8?B?NG5HdmliNklKams5d2N5T3BzdmlUb2FYM1MySTh4UGlqcGxNV3U3VTVGRDFk?=
 =?utf-8?B?OUdlOFkzN2hTWjNUYWYyNDVCdVhHSVVxbTJPSzZrMGszRmRuQmJDSFNucm5x?=
 =?utf-8?B?dEdtaU9WeG9yb2VhMWtxeUx6WE5Pa1VId21pMzNGZVRPVWJ3TklyU1YwK2Mw?=
 =?utf-8?B?aWlFMWtUMUFkWFBxa0o0TEZQLzB6cXZRblJhd2kxek93Q2hqQWgydVZlaWVS?=
 =?utf-8?B?cEIvcTlvRmtDZTZwV0dhRm5EUDNtMFZjSkxiSXo1YVVKL2NIREtHanV6VVll?=
 =?utf-8?B?akVVdWdWMFkzL3N3S1B5VjhIK2hodHdKaWhGaDg4TGhWVnV6MWdxUGQ1b2dK?=
 =?utf-8?B?elhNQkhjS0d3eklsMTJWYXE2VmorMzJ1ZkFzTjRSVkNqd2hyNE5qanZyNnBt?=
 =?utf-8?B?MUtUUUJsZlZ2TjBKbTBTdXZncDMyOWtNWUVMd3IvdjBUTnZOT1E2Mnlhd1M3?=
 =?utf-8?B?dS8xZUR5K0oyZk9RMVkzMVFyYXMrWDlBZXZlSHYvRk1CNnBvYTVRWDdQbzdk?=
 =?utf-8?B?OW9VTHM5OEJIQ1h2TThDV2M3OWU2dDlPdHZyVk9COHd3cTdMUDhxN3JKTlJX?=
 =?utf-8?B?b3FtaVpkeHlVQlUzVUhSam8rSFFFbEs5UlVRM2ZLV1g0UFFJMEYybW13V2kv?=
 =?utf-8?B?L2dkOEdEOUZWREhGM0FyNWp3SDN1WHExZk9XNlQ3eW11QVNSNTZrRWRaOHZY?=
 =?utf-8?B?R21xOHZPUWpuWElCblNIb2JaQStlcHJVZDJ6Q2x2YkdrV0hycmpIaE9yMnJR?=
 =?utf-8?B?RjIrQ0I5TDFWeE5ubzZZWnY2RlRxcDgxcHlSWmN2TFBpd3ZZZXFBWG5OQVln?=
 =?utf-8?B?cjdwMEtnejVxbUVDSU54eDY0NlpuMFVNcGV5d0JaWVFZZXdIWUMyRFVTUnVZ?=
 =?utf-8?B?cEtRWnhXRFFkMkhqZHAzNC9ZVU54S3lZZlBVL3c4aGFKeUIxdDBNQlhrSVpp?=
 =?utf-8?B?N1B0bjMvb3VmVCtoa1pVQzcwYk5EVHkvOEZ6Mm9wL09QNlVxNHYyS0JBS3l1?=
 =?utf-8?B?bWd0QUVML2xxOEJJY2Q2d0dMT2hhT2NRQjZlbFdDdXEvamNNTWJuZUd6YVRm?=
 =?utf-8?B?THBLVzFOZk5HbjlSbklLN2pJNjI3ems4NkIxVld5U2RnZmxScE1SVkdLZWdk?=
 =?utf-8?B?ek9HSU9scHA4NzFRN3RLNUltbzdqK2hoVkk1UGduQVFaV2xWckFnTlRDckRV?=
 =?utf-8?B?SUhUQ3BiMSs0K1psbXRsa2pkb0wzNE9KSTBWQjByVXpQeGpVTGFnRmtrOUJI?=
 =?utf-8?B?bEd0VzJDcUhIcjIyQWhKSkZ4TWJnd3ZVWGdDUjdiM1U2c2J6L2J4S3Z4TWo4?=
 =?utf-8?B?SGtJejQyaDAxR3VUT0N6RWtZMUdXZ1JmbXZaV0pENUdaWFhncE5qVUJkSzF0?=
 =?utf-8?B?V095bGtNMHlwWnRFb3RZS2xmdUtpb21vSkpWQ3YxMkZ2dlNmTGxXVkYvZEN4?=
 =?utf-8?B?QWh5MlZFMWdEbnFnMXQ3blZJcDQ4WHBVZjZyQ3FLenNpKzlXbEQvSDJveHhP?=
 =?utf-8?B?L1MwN2l2RTRSeWtHS2U5TW1JWmp4NXFtT2wxTjhTOEdnVDlPdWpMZ1ZvUitw?=
 =?utf-8?B?dVN2bWpxVnlJYVZRREVHZnVDTjFEVWJlV2d6cERWUlhXcTdhY2pscTUwbTdZ?=
 =?utf-8?B?ejZ0aXo4bHpodVAyTFJxalE3MW5oNHhnVmpRM3lleDMwWTVUYTdNbEE0Vkgw?=
 =?utf-8?B?MGZ3cHdud0xxcVBlcGhJbHlKZGRqQWJEdTZ1SWZHNkg5bnRmb0UxeFlxTTBz?=
 =?utf-8?B?c1VQUTFScFFaRXZFS0Q2SXlSLzVYRHpHY2x5WEw1RmpWV3Bkem90WFZXS0NO?=
 =?utf-8?B?UWpBLzdiSk1GOEJ3NFlGaWJseGQwanE3ZUZFQkZJeVhidU1jaGZUTmJSQ21V?=
 =?utf-8?Q?iM5GO6Zu0oJtKGGkPL/55Y3i1NGDTwy7?=
X-Forefront-Antispam-Report-Untrusted:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV1PR08MB10455.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(10070799003);DIR:OUT;SFP:1101;
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9771
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped:
 AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs:
	564489fc-1ec7-4f0c-a784-08de2d158754
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026|35042699022|14060799003;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVppaFpCdkJwYmRjWE1tM21YUzRyQy9aZEtjREhYL3pMZGlnRUFDeUFKSXJY?=
 =?utf-8?B?dy8xQk5IL0lmVmNPaE9vYXhhZ1VaUXhRcGdsSUNGalFQeE1BMmpvVm1SK2pZ?=
 =?utf-8?B?TXVJWm1KaExyNFVXSHJBQk1GQXhpQU5Fc1hzMmJVM1l0WWQxOVVlNC9xM29i?=
 =?utf-8?B?NDNTbjZQYUFwZkt0bHA5MjdLeURnbDlrT2VnSkFSanFZVCt3MlplbXFlL2tD?=
 =?utf-8?B?V3JZOGNYNUZFWFFIeXFnMGQvenpML0RWcG96QVVzMWw5MXU1UDJvT0VLLzQ4?=
 =?utf-8?B?SzlieUszT3ErYzBwZUJ3WXBaN2lGYmplWmUvcVBCbkhRWXBXaGlOWmorb0h4?=
 =?utf-8?B?QmdFYm91eU0xdHlOVHp0TncxRGxPWDd3eEN1dXpaU1JubUgxM2hZdVk3aTF2?=
 =?utf-8?B?SG9uYTUvNlZ3Um4yaGVIZlVTdWxrN0QwMUUzRHRMOTdOdkN4Q3VnZGRid2dR?=
 =?utf-8?B?OTYzdDZsWTNlcW81RER5bEVxdVgzaUZlMjRoTmJBd2Z0OE0wMkNWcittSDVw?=
 =?utf-8?B?cHpEQWh2TDBCbGt2UXh2djcyenM1clRhUk1MSytYY05acnNlTGtQblNLKzlp?=
 =?utf-8?B?V2N6VUdVSG9lUTBtOW5BdGRWcElSY0ZZd1ZOQnN0RTRKTjlXQ1NZRzRRSkJK?=
 =?utf-8?B?V2RSNmVqcDhuRE5QU2NIVjlxSE1IK2RWSDgvMkhNM0hVR2F0dkRhNXBhR3ll?=
 =?utf-8?B?WmxaY0dOdzI0SjRxSVFLOUR0OU1QQ0xvRGEwbzVZRmNLcG9zclpoR1FMSTNp?=
 =?utf-8?B?K0NuSUQ4elpHZVRrZWI4aXEzSXBlSEVGQ3Q1emtQL1NDb3FUaEhzV0FQSXF6?=
 =?utf-8?B?RzRsVTZhQ1YzMjJZS2lMUTVJS2pGMGRxWGxQaTBjR1N0REhCd3FwK0dYV1U4?=
 =?utf-8?B?S3pxMHFkTFdxZWRvOXNqZ3VoQmRacFZINzJ4UjZ1czlaOUdTS2VHaEFxTjR3?=
 =?utf-8?B?TzBFdmh1czR6Si9jOVkvZnAzeHk1bVJFNFlubkdzYUVoNVZDL1FJNTdhVkZx?=
 =?utf-8?B?NVN5K3R2QklWZ0orbkRxRXlBMkFOZk5VUVlMeE1FcWJaK1RuV2lkWTZuVWh3?=
 =?utf-8?B?MXB5aTVGRGVmZlFHM2ZiZUNuNEpWd0Rib1l2ajJ3Y3Z5em4zbXdWWW5EVVNE?=
 =?utf-8?B?WmhhM3Jmem5iRWVqQjVJanhxODAzbEZOeVBpc2twOXl2b2ZaNFhjZFF0UkxV?=
 =?utf-8?B?WjRIZUsvVDlTNEpKZnQvQXBnTWlKSUhwR2JScnNnc2Vnai83Zi82MmM2amVL?=
 =?utf-8?B?aEhGS2JhR29vQU9ubTNLZm8zNEVvQjdxNUxPQ3I5ZDJtTXF1NCtFVmFVTmd0?=
 =?utf-8?B?ZFdGVU9QRS9ZODRlL2MxaDNsSUpabExhbStFNkdsM1h2dnlzOVFvdTRveWJM?=
 =?utf-8?B?dDk3VmRpRWZ1cGlZRmVZSXlqRkhtTDBTZWtJR0pEdnNhWitPaytOd3ZIYkpn?=
 =?utf-8?B?aldKWlRvNXNMTEprSWpzMTN4K014Y01ZSFd3SDF4NUNsb2JKRE0vU1pWY1M4?=
 =?utf-8?B?cXNLWmgwYmlVTzBxNmFxM0MzVmpQcjY1Q2hzZ1pSYWUzUUJTWlBYRCtoWHZU?=
 =?utf-8?B?Z3J5K0FtRFJjUU9iZUxXVC8zM2FEQ3pvMjRKZXhMYnpJYWMxSzhUb0ZkbDd5?=
 =?utf-8?B?OEUzeXlSdkhmd21LUnhEZDZNdS9TNFowM1JrRng3b2psTW9Ub1NGdmIwSzk1?=
 =?utf-8?B?MHpHN2FOYm1zcHNTbDA1L1JrUG1TK3lGMFA1aGZ2Ui9yajcvb1ZyZkIzZWZW?=
 =?utf-8?B?bDZzRk4vcmttLzN6dkpuMGVrTEE2dDN4Ty8vdDNQNm5vR3ZrWGtUMmR2Y290?=
 =?utf-8?B?ZERhUFJGTkxRajFCL3ZTYjZPRmRpZTRLRGs0Y3NyN3ZScVNoai80aDhiUlpt?=
 =?utf-8?B?UGF5L3FZZmoxUm5RUXMvRGpNQitnME52Wm0xMGorU0QyQ05hTFYxV0NZN2FB?=
 =?utf-8?B?RmU4eEhsOFJuVldsSkJSZlZGT1oya2YwMzByRlUvRzRIRndFcy8vUXhTRTZk?=
 =?utf-8?B?NFVBOHJqb3FtRjI3NG5GTUZ5amxmbE9ySVJUaE5rL2c5cTNYSXdJdXhiUy9s?=
 =?utf-8?B?cmxsS3lPaTNrOE44WWhCOHRNWktRV0RWeUthb1RhTHZkeUk4WFg3SGRIdFpZ?=
 =?utf-8?Q?2ooA=3D?=
X-Forefront-Antispam-Report:
	CIP:4.158.2.129;CTRY:GB;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:outbound-uk1.az.dlp.m.darktrace.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026)(35042699022)(14060799003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Nov 2025 17:59:54.5839
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1947fc31-4369-44c0-46bd-08de2d159abd
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[4.158.2.129];Helo=[outbound-uk1.az.dlp.m.darktrace.com]
X-MS-Exchange-CrossTenant-AuthSource:
	AMS0EPF000001A2.eurprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR08MB7495

Hi,

On 11/10/25 23:04, Jonathan Corbet wrote:
> scripts/lib was always a bit of an awkward place for Python libraries; give
> them a proper home under tools/lib/python.  Put the modules from
> tools/docs/lib there for good measure.
> 
> The second patch ties them into a single package namespace.  It would be
> more aesthetically pleasing to add a kernel layer, so we could say:
> 
>    from kernel.kdoc import kdoc_parser

This is great, the code looks so much cleaner! However, it would've been 
even nicer if the redundant `kdoc_` was done away with.

So instead of:
* `import kdoc.kdoc_files` -> `import kdoc.files`
* `kdoc/kdoc_files.py` -> `kdoc/kdoc_files.py`
* `abi/abi_parser.py` -> `abi/parser.py`

etc.

Will you consider this?

Bence
