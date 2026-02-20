Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022078.outbound.protection.outlook.com [52.101.126.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EDD63B2A0;
	Fri, 20 Feb 2026 16:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.126.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771603348; cv=fail; b=j8Qt6HbE/+wAH+MLmmtSB0osBv36yfKsAFAwiSQBv2QOlb8gxITtU5M8sTFxzuhgprgdlPPw891Kj0sADf6iz+dOu879Ftpwqo5AvzDwm/m/bK06+N4OEyLHykEKTYjUdGip8KNMp48su/hASzFg1+SAIkXpoldnDYgUSEQse00=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771603348; c=relaxed/simple;
	bh=kg1q7N0RT/JPIgmzUOAlLGdbYkokMSYVX4D0tSAEP6s=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=emrYZOZFKPtoJ69p/DWe/qp20OyepUo90MGnDb/1GWtvI4HKbUNEuN75lBonwUgTKJeKRShIRk4EGyCOozY0U4MF6FMcYTqL8BkrmzFmm+Nd/9S+XF2WfEIUwM1x21XbyJq4Qe/zOYPnv6au4dHrK1spnVR83rECMnZhc5Gm5KA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn; spf=pass smtp.mailfrom=furdevs.cn; dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b=BLLkzzKV; arc=fail smtp.client-ip=52.101.126.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=furdevs.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=furdevs.cn header.i=@furdevs.cn header.b="BLLkzzKV"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q+g5Emye8c7B4PtZYUhqS9WxXdCX1lzGZaCVP5Sptdx0nFKhYyH7nplKhtcSoM6YUi/Xb4ETL5g/o7IGfry1paTrCyU5of7KXBmMaVXkykF/NDT9j2iIZvwzEqjtxhNPrCSa8NwCvGqAN9n9nRUgMWmiSLEmd/JJUSczHzRpRJAC003bgCiv3fkwR5Jlnd/ODgCbHijpcW6zvLLbOggQj3RFljF1OsZ3xwucCkDQE9hucGCvjkOmJFwgRg4R37MSE5UkI5g4Z8yG64Mrxdw6Gx+GGi0z4fqwF3cF+EEHjs3AIjK8EhF28MthdvhKbtTCqhMkt0h55t08YGzg4LR9nA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AyhSgfT2YXu4kk4WlYFo8199JzTXV702ZK8YE5l940Q=;
 b=ZvdSAMtBtsFeRrc5W/reid+gyxggbf7kzbuVG9F09Ym8dAzjShWUaNXjtXTYam5nHlVlaM0vlM7AoHWqqN2XUU1ps8OEUa1XX94AdmuVLf56wsuOjm+P788TZE+S74wJvr9R2k8borwvzjyhdhv3XgZaABVb9p0e1eKPlUnj8dl9fL5kp6iHuaSNzykGImWujnCb32qqw3oMm8FnFrqNcbhFL9SyBeziBz8Vlcqzlc9BH4vdvSettBGCd16hMh52if+RL+d6sIn4eKoFOh0Y7ulSWX7aKV+ZmdmD1BOg3TU5/ZL1uoMW6pfGGF+B3dhdrC2NGszQarfZFrVqfpAshA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=furdevs.cn; dmarc=pass action=none header.from=furdevs.cn;
 dkim=pass header.d=furdevs.cn; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=furdevs.cn;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AyhSgfT2YXu4kk4WlYFo8199JzTXV702ZK8YE5l940Q=;
 b=BLLkzzKVF98xTw0GpE83mzGw3aEOGUNeg7ux5Hu602wjbCd/up+KqRn0BPghK2aeSiQENDF0EU0ZsKJQZQQmTybeCVq7WuRVh0nQHJJXiWonIe5k2ge8jYNOv9w6q6zm47ZrTn8gAjfX4s3HPYrocFAUG1laJkOKa/PTT7+YGJSRg6+T+CCOnc6fg9SmgbsgSCxiN/cmLtU45Mt64vxMeOW0DT4hffOQ69gSK3T9JVCiKM/Bs+n7OainbCbDCGzZd7G9Ifl3E9yQI1c4WFhazjZDFwOixtZYu5dL7kb+mLL1PaeMMy2Wsk47sieCzvSpHnOk6MHR1yUrqADMxMyveg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=furdevs.cn;
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com (2603:1096:400:477::12)
 by KU2PPFB255AF57A.apcprd04.prod.outlook.com (2603:1096:d18::560) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.11; Fri, 20 Feb
 2026 16:02:20 +0000
Received: from TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc]) by TYSPR04MB7125.apcprd04.prod.outlook.com
 ([fe80::a2b:ba98:33bb:56fc%5]) with mapi id 15.20.9632.015; Fri, 20 Feb 2026
 16:02:19 +0000
From: Haowen Hu <srcres258@furdevs.cn>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Haowen Hu <srcres258@furdevs.cn>
Subject: [PATCH 1/2] docs/zh_TW: update personal information
Date: Sat, 21 Feb 2026 00:01:25 +0800
Message-ID: <20260220160201.41149-1-srcres258@furdevs.cn>
X-Mailer: git-send-email 2.51.2
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: TP0P295CA0002.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:2::15) To TYSPR04MB7125.apcprd04.prod.outlook.com
 (2603:1096:400:477::12)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYSPR04MB7125:EE_|KU2PPFB255AF57A:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b36803e-edf7-44a9-b5e6-08de70996d0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|786006|366016|41320700013|376014|14052099004|13003099007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?N25yM01YWDF0UzlZckN2aGpzeGtvbVIwVGgwSU9TZktKQS9iMEdjcVBHTkQ2?=
 =?utf-8?B?Nmw0ZXJtRUxUMVJZeGRpdXkwRnV1ZnZsZlNVSWM2NHJudVhZclBIRk9JT3lo?=
 =?utf-8?B?bDRIY09zOFBoaUpxN204cEVFc1MvRENacUdsR1lPWGZqWTRmSUpWUTF4V3FG?=
 =?utf-8?B?cnNpRzF5azJIbW1vMEduSm9veUVlOUlrNFI4Umh1SHpHSFhOZktCTkYreUR3?=
 =?utf-8?B?K3FmeGd0U0FKaHNxc3JIV0NzZStleUZxU3k4ZmViYlprR0g5VHdjeHBZV3Qx?=
 =?utf-8?B?UThycXZRSXBRMHdGM2Joc0RlWVQ1emlWYjZob1FQeDFBektMY0Q4KzRTdTBD?=
 =?utf-8?B?T3VhcWpMWTZLckZvNHBwbmNFY1g1VjlPTWRxOWlybmRTUXpMZkpiMjB4eEl5?=
 =?utf-8?B?VndndmFrZzExUGtDY0tNd1BXQUtHVVBSZUVPRTBYb29JRFo4OXpCblBJdCtw?=
 =?utf-8?B?QjNqZWVLU2t0TmQ2Szc5U0pZQi9RK3JiUFhtZHpLZXI1dFB2TmdVU3VxcFhL?=
 =?utf-8?B?aWlLbndhdHZDc2E3akJ0ejBQL0Vqakl3elAzcHJCc3QxMFRobFc0S29lTnhY?=
 =?utf-8?B?YWhpUkRzUElsUkZyeHk5MW1sSzR6cXRtMkZqM2tzUkFaTzFMNjlTZEYzOThG?=
 =?utf-8?B?SlQydVZjV2JlbVpCRjhmWDNJcDA4Qkh6MVphU2Q2NHpmQ3c2WWZlaWM5YzBL?=
 =?utf-8?B?VU00TVNpVnd2YTBUZzc2NkVHZW1hMEx4OTM4OTYyOWtHa3hHWEdrZDFwMjdO?=
 =?utf-8?B?cXFaRTFGbFpvVEdRb2FJeksyaVB3Z3g4SDkyWVZ5RGNMd2pSNUl4cW1rQ2JJ?=
 =?utf-8?B?YVZRWlVjNS9zQlptdmZhVzAwbWN4U2wvblBia2Vxc1JEVkNHaElYMU5GL3lP?=
 =?utf-8?B?aGx6NzdyVG9FaU1rMW8vVXVONHVwemRDankzTUFDdHFDVm1WOTB3d3ZPT2RK?=
 =?utf-8?B?c2RCUU15c3ZJc1IrbHpWZ0ptUnNDTjdXdnZtNmlHK2lXSkd0NlhqVjZ3N1lK?=
 =?utf-8?B?UVg0Vi94emZ0VEx5WWRDN2NTbllUWERwSWlwVXBXZUNuZFBMcDRzUHRnLzlE?=
 =?utf-8?B?ZGdVR0dzNnJOQ28xb29sZ0g2cTllbDNwLzV6Z3NmNjdCdGFOeS9WaTJiajBK?=
 =?utf-8?B?aVk2QTU2NWFCM0pOQjhoNFpNT09RU0UxNWRjcDNLNWlzdWtvVXgxMTUzcldC?=
 =?utf-8?B?MzNxVnlmSzlmVVU4bSttVVJaRWJZSEZjK0tVU2pYTzhRYldkR0V0MnA4dkxN?=
 =?utf-8?B?YmFVZFRoVzVjV0s2KzJhWGlsSHhEOVV6RWtHQ1lUUTkxWm03L3RwRjg2YlpB?=
 =?utf-8?B?YmY5dEs4aG95T205VVpKRURMYWF1SkRlam9nSS9pWHZ4eWJpbWRFOE1kUm1u?=
 =?utf-8?B?eGRDcUgyU0xWeGZPbWcrL05oN2pDbERVekNnV0FxVUM5TjJKelMwSkN4NTBV?=
 =?utf-8?B?MGh1bzZvaEU3TUZjVW5FazU4KzFkK3ZtTE85OE51d1ZzSEtWMTlOS1IxaHJV?=
 =?utf-8?B?Q3lPSExRejJ4U3o5d1U4ZlZGMUkySllSN1NCZ2FiaXZDT29VZUdCcHRZWTl2?=
 =?utf-8?B?alc5Z0orT2krbWxKTmlRbjIxUGtwL1g1YkJ5R3o0bVZ1ckUyMjlHQTB6cVdV?=
 =?utf-8?B?VDRubTNkM1ZyRE9iS2ozV0k5eXI0Y25RMG5zWlYrTi8xUFNySkszQ0FGWkVh?=
 =?utf-8?B?b2RBOEFBQVJVWDZnM3ZYR21JWXMreHdaNWhLajdyUElvTmV3OHVPL2VWNUx3?=
 =?utf-8?B?SHdyL3NNTTNGQWFlM0NLSWVvZGRqWG9BWTBCMzZJUUFnVW1ZVklKNEY1ajhx?=
 =?utf-8?B?YW14WDYxL1k4TzZPYyt6S1RIYTQ3OUtRQ0NLQkJqckoxUGtWZXpmOTdXZ0lk?=
 =?utf-8?B?bXJnZm9GZDZ0eHF1NUpFakJieVFJOXk3RnlLVEtoY216VlM4alRleTNMY1Vw?=
 =?utf-8?B?bmxWVnRVamJDU3NxcERuYkZNY0ttdzA0UEpCSFpFdjVKNFZiVGxEZEZuZVhK?=
 =?utf-8?B?ZE9FcXZ3Z2h3OFdVczFTUktxQlVxS3FUcjRCUFQwcW4zS0xTTllYQnhvYWEz?=
 =?utf-8?Q?jWLv8/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYSPR04MB7125.apcprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(786006)(366016)(41320700013)(376014)(14052099004)(13003099007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHJaeXhCUDZpdFNsaWRBOTVPK2RLU21POTBWOHJGWm0yS0JQR3BILzR1b0py?=
 =?utf-8?B?ejIyZE5rVC9UR0lraVNDbHM4MFV2NFhiYlU3MitTbC85L1VhRTZkWFlYSm5l?=
 =?utf-8?B?cC91QVhvWVNRdWorclhJYnY2bHNITnV2U1ZGbXdOK1QwV0xSRmF0RHA5VXNj?=
 =?utf-8?B?Nk9GcnlGdXE2NFNLU0ZxMEh3MEFhQUQ4KzZXQkFTNmk2WkVEaFB4WS9HMFVP?=
 =?utf-8?B?bWkySHVHT1NWdXZPMnNxNStXSFM5TFVEYllQUk1kYmhFRlBxNERHRmVkSDFD?=
 =?utf-8?B?RTFVb1lJRno2Rjdjckg2cEwvcXdLVUFSM2lYQVRIK2dIYzA3eGFDcHVYckFm?=
 =?utf-8?B?aEJmOE5ja0hGS3VhSk1PUE0wUWNQRVp5OFR2Mk5vRW83WkxpM2NJNFp3RUlk?=
 =?utf-8?B?aWcvc1JxdUZjamEzZW43RWg5bkIvMGZSaUpNbWd6Nnc5L2dxcHpQMEt1cTlq?=
 =?utf-8?B?TUxEeVVaSFpnMFRmVzg1WEQwUXFRWVNJbzdBRXMwclpMOUhBVmFJZXZ5SWF1?=
 =?utf-8?B?QkpYTDJkUG1qWG9lMEZKalAxNXNOZVdTZVRxeVVpWnhNejhUWHBTSlhaNzYy?=
 =?utf-8?B?TjBscTFBRDZzelkzUnFZY1lmU2xvdklpL0puamd0OGZ1ZkhNTmd5alJoeU5s?=
 =?utf-8?B?aEIvS09ITE8wTFFIWXYvTXpLdzNKSTkrWXp3cldLVzhQb1BQa3BxN1RmN0pq?=
 =?utf-8?B?UXI1YStyUW5BV1VjaGhMRXhkU21ITzNQRlhHS0J2RHRrWHJUZ1Eya1piL1ZT?=
 =?utf-8?B?a2ZLY09KSjRNN0hpd2xpLzFVcXl6ai9XblFXY05LNkcvck5JVDhBbjhEWlpU?=
 =?utf-8?B?S3VjcDhPMGIwMGFpSDlOVHA3SHFHSnQ1MEhpZ1QwZG1yRGIyaVVmUytCQ0Rp?=
 =?utf-8?B?QVJMRmFPbVZZY0VsekhxQUJCaHovZk94TGU1UTV0ak5MUjNwTjJHRUpsNmRq?=
 =?utf-8?B?S05zMnByeGN1QkszLzNiSzZXd0ZkUWJjNTU3M3JkOTlYTERwd0ZlMFZEMUQz?=
 =?utf-8?B?RjRpeUM1aVZNTXptQlhwS3Y1RFRLSkZ2SC8yeGY5eXQrS1VyWjBwNzlzMUlH?=
 =?utf-8?B?L1lkenBMSFdjUHhtYkpuV3NQWG5FYnE1UjBUL3VIdUF6dG9WUjNqTjJVVVpu?=
 =?utf-8?B?eU1lWEtPbVNEQUVFUExTaVU2S0xMTGRLeFpEcWxkTEE5enZiZWNzSVJSblUw?=
 =?utf-8?B?b3oxV1BESXFVSkh1U3ZjRE11bTZzZ2F2L3ArajdNWmhSYk42RWdnOXhuZmxm?=
 =?utf-8?B?eFRwL0tOM2U1emVSRWJDYXpOR3B1VHNSZnRkRmpFRWFuVUJPczczRGlzWXdx?=
 =?utf-8?B?aHloZFdKT0JOOHh5YjhzbEU0dS9SM3Vzd3ZaMERYekdlbGVCaFIyUXhvdS9o?=
 =?utf-8?B?cFZDOTNiZGpxU3VCZUFmS0piWjRNc1dMZ1VYdCtDRDZKQVpZUW10NXRGcmsr?=
 =?utf-8?B?Mm1JZEg4T1NESit5VUN5WDBmczBaRklMSUgvS2lySUlyQWtSeTlTYkU2Y3Ns?=
 =?utf-8?B?Z21vdnhzRko0WTN2UWxJRVVWelo2d3FXM0xscDlRV1Y3MmhpTWhPZ2pybzYw?=
 =?utf-8?B?ZEh1dW05VkFEUHBLVkQySEJJZGpzRGdDZmpFa01IaG0xazZzRXdYcHRCbEZm?=
 =?utf-8?B?b2VkRm55aERLbVZ5VHY0VzZkNHd2NDdidW05N3hiSDNsd0hlVTlJSjBDa29r?=
 =?utf-8?B?bDlpU3QrQ0JWaXlHd2kvdVNrQnpzWHU1eVdOSThkSE0vOHI5TjBRZVF3cXRS?=
 =?utf-8?B?d0owS3Vyb2xHWnk2bVRNK0gva2Vtc01RelNURjdqalRBd2p5VHJyU1ZpUkhw?=
 =?utf-8?B?RklqRjVSWkxGZUVTZVdXM1dWMy9JSWxJMkpzM3gvS0lWMmtkekU2QVdrZDc2?=
 =?utf-8?B?VjBiTVJtK2NkSmIwa2xERW9zcXRPOXRXRFFzT0dFdWZpSmxZTDZreTBHUEMy?=
 =?utf-8?B?NDZmTlhoNnZ3eGRoS3h5WEdhSmZhaVZDdzZxQ3huZFlXOTNzd1ZOa2M5UDJ1?=
 =?utf-8?B?V05FZzIyZXE5d2xaQjdZQnFyM1F4Z1ZhcDJKYU5vWmlDODJxOVVvODM3a2Rv?=
 =?utf-8?B?VklBemJwVmlpdmlZemVJMjcyOVRDbFlRU1QwbWNyWEp6NXVyV0oyaFFDaTRX?=
 =?utf-8?B?ZWtoeG02YkpWV0R0ZHlOaEhJZ2ZZdFJTbTVqSndRbDJjYStLV0QwTSsrS241?=
 =?utf-8?B?a0w5QVM0WVdGbjdWcVlna3NCM21FVU52K0haTW05S1FHcTlXR3FBZGV1UFpY?=
 =?utf-8?B?c1RmZGMvaENUNk5BR21KV0RUdXI1YTc3MVpEWk9UQ0FxY1NVZEJEUEVaRUp1?=
 =?utf-8?B?elVsRnpuUUh5WG9ZeVBNN2F2aGo2K3NtRGNNL01tbFpRTGsyNlhUUT09?=
X-OriginatorOrg: furdevs.cn
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b36803e-edf7-44a9-b5e6-08de70996d0b
X-MS-Exchange-CrossTenant-AuthSource: TYSPR04MB7125.apcprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Feb 2026 16:02:19.8516
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: c15d1683-7bd7-4720-8850-c10d9a967b56
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BtnI/FtQASm8yZm01ZOgpnZ69XfVfZI1vuFx+Z3Tm+c7wj6VfG5TY0UQJd20VJcB2p4c0TGx2yNFq9MZJAb3NA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KU2PPFB255AF57A

Get my personal information updated in the Linux kernel Documentation.
Mainly on:

  * The legacy e-mail (2023002089@link.tyut.edu.cn) had some issue and
    is not accessible now. Replace it with my current e-mail
    (srcres258@furdevs.cn).

  * Correct the spelling of my name. "Hu" is my last name in reality,
    so it is better to pronounce my name in English grammar (Haowen Hu)
    rather than in Chinese spelling order (Hu Haowen).

  * The main branch has been shifted into "i18n" from "doc-zh-tw", so
    get it updated as well.

Signed-off-by: Haowen Hu <srcres258@furdevs.cn>
---
 .../translations/zh_CN/dev-tools/testing-overview.rst     | 2 +-
 Documentation/translations/zh_TW/IRQ.txt                  | 8 ++++----
 Documentation/translations/zh_TW/admin-guide/README.rst   | 2 +-
 .../translations/zh_TW/admin-guide/bug-bisect.rst         | 2 +-
 .../translations/zh_TW/admin-guide/bug-hunting.rst        | 2 +-
 .../translations/zh_TW/admin-guide/clearing-warn-once.rst | 2 +-
 Documentation/translations/zh_TW/admin-guide/cpu-load.rst | 2 +-
 Documentation/translations/zh_TW/admin-guide/index.rst    | 2 +-
 Documentation/translations/zh_TW/admin-guide/init.rst     | 2 +-
 .../translations/zh_TW/admin-guide/reporting-issues.rst   | 2 +-
 .../translations/zh_TW/admin-guide/security-bugs.rst      | 2 +-
 .../translations/zh_TW/admin-guide/tainted-kernels.rst    | 2 +-
 Documentation/translations/zh_TW/admin-guide/unicode.rst  | 2 +-
 Documentation/translations/zh_TW/arch/arm64/amu.rst       | 2 +-
 Documentation/translations/zh_TW/arch/arm64/booting.txt   | 4 ++--
 .../translations/zh_TW/arch/arm64/elf_hwcaps.rst          | 2 +-
 .../translations/zh_TW/arch/arm64/hugetlbpage.rst         | 2 +-
 Documentation/translations/zh_TW/arch/arm64/index.rst     | 2 +-
 .../translations/zh_TW/arch/arm64/legacy_instructions.txt | 4 ++--
 Documentation/translations/zh_TW/arch/arm64/memory.txt    | 4 ++--
 Documentation/translations/zh_TW/arch/arm64/perf.rst      | 2 +-
 .../translations/zh_TW/arch/arm64/silicon-errata.txt      | 4 ++--
 .../translations/zh_TW/arch/arm64/tagged-pointers.txt     | 4 ++--
 Documentation/translations/zh_TW/dev-tools/sparse.rst     | 6 +++---
 .../translations/zh_TW/dev-tools/testing-overview.rst     | 2 +-
 Documentation/translations/zh_TW/disclaimer-zh_TW.rst     | 2 +-
 Documentation/translations/zh_TW/filesystems/debugfs.rst  | 2 +-
 Documentation/translations/zh_TW/filesystems/index.rst    | 2 +-
 Documentation/translations/zh_TW/filesystems/sysfs.txt    | 2 +-
 Documentation/translations/zh_TW/filesystems/virtiofs.rst | 2 +-
 Documentation/translations/zh_TW/index.rst                | 2 +-
 Documentation/translations/zh_TW/io_ordering.txt          | 8 ++++----
 Documentation/translations/zh_TW/process/1.Intro.rst      | 2 +-
 Documentation/translations/zh_TW/process/2.Process.rst    | 2 +-
 .../translations/zh_TW/process/3.Early-stage.rst          | 2 +-
 Documentation/translations/zh_TW/process/4.Coding.rst     | 2 +-
 Documentation/translations/zh_TW/process/5.Posting.rst    | 2 +-
 .../translations/zh_TW/process/6.Followthrough.rst        | 2 +-
 .../translations/zh_TW/process/7.AdvancedTopics.rst       | 2 +-
 Documentation/translations/zh_TW/process/8.Conclusion.rst | 2 +-
 .../zh_TW/process/code-of-conduct-interpretation.rst      | 2 +-
 .../translations/zh_TW/process/code-of-conduct.rst        | 2 +-
 Documentation/translations/zh_TW/process/coding-style.rst | 2 +-
 .../translations/zh_TW/process/development-process.rst    | 2 +-
 .../translations/zh_TW/process/email-clients.rst          | 2 +-
 .../zh_TW/process/embargoed-hardware-issues.rst           | 2 +-
 Documentation/translations/zh_TW/process/howto.rst        | 2 +-
 Documentation/translations/zh_TW/process/index.rst        | 2 +-
 .../zh_TW/process/kernel-driver-statement.rst             | 2 +-
 .../zh_TW/process/kernel-enforcement-statement.rst        | 2 +-
 .../translations/zh_TW/process/license-rules.rst          | 2 +-
 Documentation/translations/zh_TW/process/magic-number.rst | 2 +-
 .../translations/zh_TW/process/management-style.rst       | 2 +-
 .../translations/zh_TW/process/programming-language.rst   | 2 +-
 .../translations/zh_TW/process/stable-api-nonsense.rst    | 2 +-
 .../translations/zh_TW/process/stable-kernel-rules.rst    | 2 +-
 .../translations/zh_TW/process/submit-checklist.rst       | 2 +-
 .../translations/zh_TW/process/submitting-patches.rst     | 2 +-
 .../zh_TW/process/volatile-considered-harmful.rst         | 2 +-
 MAINTAINERS                                               | 4 ++--
 60 files changed, 74 insertions(+), 74 deletions(-)

diff --git a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
index 286ed6b01f65..567e911ea259 100644
--- a/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_CN/dev-tools/testing-overview.rst
@@ -3,7 +3,7 @@
 .. include:: ../disclaimer-zh_CN.rst

 :Original: Documentation/dev-tools/testing-overview.rst
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+:Translator: 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 ============
 内核测试指南
diff --git a/Documentation/translations/zh_TW/IRQ.txt b/Documentation/translations/zh_TW/IRQ.txt
index 8115a7618307..9b27b1f19355 100644
--- a/Documentation/translations/zh_TW/IRQ.txt
+++ b/Documentation/translations/zh_TW/IRQ.txt
@@ -7,7 +7,7 @@ help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.

 Maintainer: Eric W. Biederman <ebiederman@xmission.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
+Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
 ---------------------------------------------------------------------
 Documentation/core-api/irq/index.rst 的繁體中文翻譯

@@ -16,9 +16,9 @@ Documentation/core-api/irq/index.rst 的繁體中文翻譯
 者翻譯存在問題，請聯繫繁體中文版維護者。

 英文版維護者： Eric W. Biederman <ebiederman@xmission.com>
-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版維護者： Haowen Hu <srcres258@furdevs.cn>
+繁體中文版翻譯者： Haowen Hu <srcres258@furdevs.cn>
+繁體中文版校譯者： Haowen Hu <srcres258@furdevs.cn>


 以下爲正文
diff --git a/Documentation/translations/zh_TW/admin-guide/README.rst b/Documentation/translations/zh_TW/admin-guide/README.rst
index c8b7ccfaa656..6e89d1608639 100644
--- a/Documentation/translations/zh_TW/admin-guide/README.rst
+++ b/Documentation/translations/zh_TW/admin-guide/README.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 Linux內核6.x版本 <http://kernel.org/>
 =========================================
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
index 1efe913b8da0..82b90a6d1d1a 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-bisect.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 二分（bisect）缺陷
 +++++++++++++++++++
diff --git a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
index c677dff826f5..c4f95ec6177d 100644
--- a/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
+++ b/Documentation/translations/zh_TW/admin-guide/bug-hunting.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 追蹤缺陷
 =========
diff --git a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
index a3e82ff9daac..9d3cf1aab20e 100644
--- a/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
+++ b/Documentation/translations/zh_TW/admin-guide/clearing-warn-once.rst
@@ -2,7 +2,7 @@

 .. include:: ../disclaimer-zh_TW.rst

-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+:Translator: 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 清除 WARN_ONCE
 --------------
diff --git a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
index 4c25a2105b39..3cdecd6a06ea 100644
--- a/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
+++ b/Documentation/translations/zh_TW/admin-guide/cpu-load.rst
@@ -2,7 +2,7 @@

 .. include:: ../disclaimer-zh_TW.rst

-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+:Translator: 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 ========
 CPU 負載
diff --git a/Documentation/translations/zh_TW/admin-guide/index.rst b/Documentation/translations/zh_TW/admin-guide/index.rst
index 9335c0e9105d..24cb20e4b89b 100644
--- a/Documentation/translations/zh_TW/admin-guide/index.rst
+++ b/Documentation/translations/zh_TW/admin-guide/index.rst
@@ -4,7 +4,7 @@

 :Original: :doc:`../../../admin-guide/index`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+             胡皓文 Haowen Hu <srcres258@furdevs.cn>

 Linux 內核用戶和管理員指南
 ==========================
diff --git a/Documentation/translations/zh_TW/admin-guide/init.rst b/Documentation/translations/zh_TW/admin-guide/init.rst
index 4cef1994c650..25fea615e697 100644
--- a/Documentation/translations/zh_TW/admin-guide/init.rst
+++ b/Documentation/translations/zh_TW/admin-guide/init.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 解釋“No working init found.”啓動掛起消息
 =========================================
diff --git a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
index 1d4e4c7a6750..5fbbd191a157 100644
--- a/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
+++ b/Documentation/translations/zh_TW/admin-guide/reporting-issues.rst
@@ -9,7 +9,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>


 報告問題
diff --git a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst b/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
index cfe1e58e116b..f3173b6ce7fe 100644
--- a/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
+++ b/Documentation/translations/zh_TW/admin-guide/security-bugs.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 安全缺陷
 =========
diff --git a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
index 0d8046576d04..9bce875fff6d 100644
--- a/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
+++ b/Documentation/translations/zh_TW/admin-guide/tainted-kernels.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 受污染的內核
 -------------
diff --git a/Documentation/translations/zh_TW/admin-guide/unicode.rst b/Documentation/translations/zh_TW/admin-guide/unicode.rst
index f43edb2b5ed0..99b9d0b62846 100644
--- a/Documentation/translations/zh_TW/admin-guide/unicode.rst
+++ b/Documentation/translations/zh_TW/admin-guide/unicode.rst
@@ -7,7 +7,7 @@
 :譯者:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 Unicode（統一碼）支持
 ======================
diff --git a/Documentation/translations/zh_TW/arch/arm64/amu.rst b/Documentation/translations/zh_TW/arch/arm64/amu.rst
index 3726c1671ab6..0ff8b28dcaaf 100644
--- a/Documentation/translations/zh_TW/arch/arm64/amu.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/amu.rst
@@ -5,7 +5,7 @@
 :Original: :ref:`Documentation/arch/arm64/amu.rst <amu_index>`

 Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
+            Haowen Hu <srcres258@furdevs.cn>

 ==================================
 AArch64 Linux 中擴展的活動監控單元
diff --git a/Documentation/translations/zh_TW/arch/arm64/booting.txt b/Documentation/translations/zh_TW/arch/arm64/booting.txt
index f1ac96370ace..f80b7a35f3f7 100644
--- a/Documentation/translations/zh_TW/arch/arm64/booting.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/booting.txt
@@ -10,7 +10,7 @@ or if there is a problem with the translation.

 M:	Will Deacon <will.deacon@arm.com>
 zh_CN:	Fu Wei <wefu@redhat.com>
-zh_TW:	Hu Haowen <2023002089@link.tyut.edu.cn>
+zh_TW:	Haowen Hu <srcres258@furdevs.cn>
 C:	55f058e7574c3615dea4615573a19bdb258696c6
 ---------------------------------------------------------------------
 Documentation/arch/arm64/booting.rst 的中文翻譯
@@ -23,7 +23,7 @@ Documentation/arch/arm64/booting.rst 的中文翻譯
 中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版校譯者： 胡皓文  Haowen Hu <srcres258@furdevs.cn>
 本文翻譯提交時的 Git 檢出點爲： 55f058e7574c3615dea4615573a19bdb258696c6

 以下爲正文
diff --git a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
index cada25303e8d..3b490b05b49e 100644
--- a/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/elf_hwcaps.rst
@@ -5,7 +5,7 @@
 :Original: :ref:`Documentation/arch/arm64/elf_hwcaps.rst <elf_hwcaps_index>`

 Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
+            Haowen Hu <srcres258@furdevs.cn>

 ================
 ARM64 ELF hwcaps
diff --git a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
index b6849935e028..6e06c8aa8bfd 100644
--- a/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/hugetlbpage.rst
@@ -5,7 +5,7 @@
 :Original: :ref:`Documentation/arch/arm64/hugetlbpage.rst <hugetlbpage_index>`

 Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
+            Haowen Hu <srcres258@furdevs.cn>

 =====================
 ARM64中的 HugeTLBpage
diff --git a/Documentation/translations/zh_TW/arch/arm64/index.rst b/Documentation/translations/zh_TW/arch/arm64/index.rst
index 86014346792e..eced9980cb00 100644
--- a/Documentation/translations/zh_TW/arch/arm64/index.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/index.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/arch/arm64/index.rst <arm64_index>`
 :Translator: Bailu Lin <bailu.lin@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_arm64_index:

diff --git a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
index 5c664555a71a..6795522267a8 100644
--- a/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/legacy_instructions.txt
@@ -11,7 +11,7 @@ or if there is a problem with the translation.
 Maintainer: Punit Agrawal <punit.agrawal@arm.com>
             Suzuki K. Poulose <suzuki.poulose@arm.com>
 Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
+Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯

@@ -26,7 +26,7 @@ Documentation/arch/arm64/legacy_instructions.rst 的中文翻譯
 中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者：胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版校譯者：胡皓文  Haowen Hu <srcres258@furdevs.cn>

 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/arch/arm64/memory.txt b/Documentation/translations/zh_TW/arch/arm64/memory.txt
index 6ee2239c293f..aa206ef501dd 100644
--- a/Documentation/translations/zh_TW/arch/arm64/memory.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/memory.txt
@@ -10,7 +10,7 @@ or if there is a problem with the translation.

 Maintainer: Catalin Marinas <catalin.marinas@arm.com>
 Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
+Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/memory.rst 的中文翻譯

@@ -24,7 +24,7 @@ Documentation/arch/arm64/memory.rst 的中文翻譯
 中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版校譯者： 胡皓文  Haowen Hu <srcres258@furdevs.cn>

 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/arch/arm64/perf.rst b/Documentation/translations/zh_TW/arch/arm64/perf.rst
index ce083ba63872..0473c0e8c7fb 100644
--- a/Documentation/translations/zh_TW/arch/arm64/perf.rst
+++ b/Documentation/translations/zh_TW/arch/arm64/perf.rst
@@ -5,7 +5,7 @@
 :Original: :ref:`Documentation/arch/arm64/perf.rst <perf_index>`

 Translator: Bailu Lin <bailu.lin@vivo.com>
-            Hu Haowen <2023002089@link.tyut.edu.cn>
+            Haowen Hu <srcres258@furdevs.cn>

 =============
 Perf 事件屬性
diff --git a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
index 16d73b6c309f..fc5ba2be1cf8 100644
--- a/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/silicon-errata.txt
@@ -10,7 +10,7 @@ or if there is a problem with the translation.

 M:	Will Deacon <will.deacon@arm.com>
 zh_CN:	Fu Wei <wefu@redhat.com>
-zh_TW:	Hu Haowen <2023002089@link.tyut.edu.cn>
+zh_TW:	Haowen Hu <srcres258@furdevs.cn>
 C:	1926e54f115725a9248d0c4c65c22acaf94de4c4
 ---------------------------------------------------------------------
 Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
@@ -23,7 +23,7 @@ Documentation/arch/arm64/silicon-errata.rst 的中文翻譯
 中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版校譯者： 胡皓文  Haowen Hu <srcres258@furdevs.cn>
 本文翻譯提交時的 Git 檢出點爲： 1926e54f115725a9248d0c4c65c22acaf94de4c4

 以下爲正文
diff --git a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
index e86ffa893ef6..40184c803a09 100644
--- a/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
+++ b/Documentation/translations/zh_TW/arch/arm64/tagged-pointers.txt
@@ -10,7 +10,7 @@ or if there is a problem with the translation.

 Maintainer: Will Deacon <will.deacon@arm.com>
 Chinese maintainer: Fu Wei <wefu@redhat.com>
-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
+Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
 ---------------------------------------------------------------------
 Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯

@@ -22,7 +22,7 @@ Documentation/arch/arm64/tagged-pointers.rst 的中文翻譯
 中文版維護者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版翻譯者： 傅煒  Fu Wei <wefu@redhat.com>
 中文版校譯者： 傅煒  Fu Wei <wefu@redhat.com>
-繁體中文版校譯者： 胡皓文  Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版校譯者： 胡皓文  Haowen Hu <srcres258@furdevs.cn>

 以下爲正文
 ---------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/dev-tools/sparse.rst b/Documentation/translations/zh_TW/dev-tools/sparse.rst
index 55f0ad2c0beb..c7c56cd76622 100644
--- a/Documentation/translations/zh_TW/dev-tools/sparse.rst
+++ b/Documentation/translations/zh_TW/dev-tools/sparse.rst
@@ -6,7 +6,7 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.

-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
+Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
 -------------------------------------------------------------------------
 Documentation/dev-tools/sparse.rst 的繁體中文翻譯

@@ -14,8 +14,8 @@ Documentation/dev-tools/sparse.rst 的繁體中文翻譯
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。

-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版維護者： 胡皓文 Haowen Hu <srcres258@furdevs.cn>
+繁體中文版翻譯者： 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 以下爲正文
 -------------------------------------------------------------------------
diff --git a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
index 3b08aad1da00..8ba6a9a8a52a 100644
--- a/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
+++ b/Documentation/translations/zh_TW/dev-tools/testing-overview.rst
@@ -3,7 +3,7 @@
 .. include:: ../disclaimer-zh_TW.rst

 :Original: Documentation/dev-tools/testing-overview.rst
-:Translator: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+:Translator: 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 ============
 內核測試指南
diff --git a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
index 28b734c223b6..705fa65eac5c 100644
--- a/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
+++ b/Documentation/translations/zh_TW/disclaimer-zh_TW.rst
@@ -7,5 +7,5 @@

 .. note::
      如果您發現本文檔與原始文件有任何不同或者有翻譯問題，請聯繫該文件的譯者，
-     或者發送電子郵件給胡皓文以獲取幫助：<2023002089@link.tyut.edu.cn>。
+     或者發送電子郵件給胡皓文以獲取幫助：<srcres258@furdevs.cn>。

diff --git a/Documentation/translations/zh_TW/filesystems/debugfs.rst b/Documentation/translations/zh_TW/filesystems/debugfs.rst
index cda7d0e18b9b..e7234ab23c28 100644
--- a/Documentation/translations/zh_TW/filesystems/debugfs.rst
+++ b/Documentation/translations/zh_TW/filesystems/debugfs.rst
@@ -14,7 +14,7 @@ Debugfs
 	中文版維護者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
 	中文版翻譯者： 羅楚成 Chucheng Luo <luochucheng@vivo.com>
 	中文版校譯者:  羅楚成 Chucheng Luo <luochucheng@vivo.com>
-	繁體中文版校譯者: 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+	繁體中文版校譯者: 胡皓文 Haowen Hu <srcres258@furdevs.cn>



diff --git a/Documentation/translations/zh_TW/filesystems/index.rst b/Documentation/translations/zh_TW/filesystems/index.rst
index 88f0e632bfe2..771b8f654011 100644
--- a/Documentation/translations/zh_TW/filesystems/index.rst
+++ b/Documentation/translations/zh_TW/filesystems/index.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/filesystems/index.rst <filesystems_index>`
 :Translator: Wang Wenhu <wenhu.wang@vivo.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_filesystems_index:

diff --git a/Documentation/translations/zh_TW/filesystems/sysfs.txt b/Documentation/translations/zh_TW/filesystems/sysfs.txt
index d1cee02ef1de..e60f1ca8107c 100644
--- a/Documentation/translations/zh_TW/filesystems/sysfs.txt
+++ b/Documentation/translations/zh_TW/filesystems/sysfs.txt
@@ -22,7 +22,7 @@ Documentation/filesystems/sysfs.rst 的中文翻譯
 中文版維護者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
 中文版翻譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
 中文版校譯者： 傅煒 Fu Wei <tekkamanninja@gmail.com>
-繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版校譯者：胡皓文 Haowen Hu <srcres258@furdevs.cn>


 以下爲正文
diff --git a/Documentation/translations/zh_TW/filesystems/virtiofs.rst b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
index 704a0ee44fd2..c66694898ea5 100644
--- a/Documentation/translations/zh_TW/filesystems/virtiofs.rst
+++ b/Documentation/translations/zh_TW/filesystems/virtiofs.rst
@@ -10,7 +10,7 @@
 	中文版維護者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
 	中文版翻譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
 	中文版校譯者： 王文虎 Wang Wenhu <wenhu.wang@vivo.com>
-	繁體中文版校譯者：胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+	繁體中文版校譯者：胡皓文 Haowen Hu <srcres258@furdevs.cn>

 ===========================================
 virtiofs: virtio-fs 主機<->客機共享文件系統
diff --git a/Documentation/translations/zh_TW/index.rst b/Documentation/translations/zh_TW/index.rst
index 660a74d2023c..e055607caa68 100644
--- a/Documentation/translations/zh_TW/index.rst
+++ b/Documentation/translations/zh_TW/index.rst
@@ -15,7 +15,7 @@

 .. note::
    內核文檔繁體中文版的翻譯工作正在進行中。如果您願意並且有時間參與這項工
-   作，歡迎提交補丁給胡皓文 <2023002089@link.tyut.edu.cn>。
+   作，歡迎提交補丁給胡皓文 <srcres258@furdevs.cn>。

 與Linux 內核社區一起工作
 ------------------------
diff --git a/Documentation/translations/zh_TW/io_ordering.txt b/Documentation/translations/zh_TW/io_ordering.txt
index 00b374092d7e..53991a4cd984 100644
--- a/Documentation/translations/zh_TW/io_ordering.txt
+++ b/Documentation/translations/zh_TW/io_ordering.txt
@@ -6,7 +6,7 @@ communicating in English you can also ask the Chinese maintainer for
 help.  Contact the Chinese maintainer if this translation is outdated
 or if there is a problem with the translation.

-Traditional Chinese maintainer: Hu Haowen <2023002089@link.tyut.edu.cn>
+Traditional Chinese maintainer: Haowen Hu <srcres258@furdevs.cn>
 ---------------------------------------------------------------------
 Documentation/driver-api/io_ordering.rst 的繁體中文翻譯

@@ -14,9 +14,9 @@ Documentation/driver-api/io_ordering.rst 的繁體中文翻譯
 交流有困難的話，也可以向繁體中文版維護者求助。如果本翻譯更新不及時或
 者翻譯存在問題，請聯繫繁體中文版維護者。

-繁體中文版維護者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版翻譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
-繁體中文版校譯者： 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+繁體中文版維護者： 胡皓文 Haowen Hu <srcres258@furdevs.cn>
+繁體中文版翻譯者： 胡皓文 Haowen Hu <srcres258@furdevs.cn>
+繁體中文版校譯者： 胡皓文 Haowen Hu <srcres258@furdevs.cn>


 以下爲正文
diff --git a/Documentation/translations/zh_TW/process/1.Intro.rst b/Documentation/translations/zh_TW/process/1.Intro.rst
index 345c4cbe9b55..119d6d0c01db 100644
--- a/Documentation/translations/zh_TW/process/1.Intro.rst
+++ b/Documentation/translations/zh_TW/process/1.Intro.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_process_intro:

diff --git a/Documentation/translations/zh_TW/process/2.Process.rst b/Documentation/translations/zh_TW/process/2.Process.rst
index f45ddba6238f..34255bbe3c0c 100644
--- a/Documentation/translations/zh_TW/process/2.Process.rst
+++ b/Documentation/translations/zh_TW/process/2.Process.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_process:

diff --git a/Documentation/translations/zh_TW/process/3.Early-stage.rst b/Documentation/translations/zh_TW/process/3.Early-stage.rst
index a58fc9e0ea99..c75d9a4ce4ab 100644
--- a/Documentation/translations/zh_TW/process/3.Early-stage.rst
+++ b/Documentation/translations/zh_TW/process/3.Early-stage.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_early_stage:

diff --git a/Documentation/translations/zh_TW/process/4.Coding.rst b/Documentation/translations/zh_TW/process/4.Coding.rst
index e90a6b51fb98..b0bbde25efcc 100644
--- a/Documentation/translations/zh_TW/process/4.Coding.rst
+++ b/Documentation/translations/zh_TW/process/4.Coding.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_coding:

diff --git a/Documentation/translations/zh_TW/process/5.Posting.rst b/Documentation/translations/zh_TW/process/5.Posting.rst
index 38f3a6d618eb..6eef1c3c69f7 100644
--- a/Documentation/translations/zh_TW/process/5.Posting.rst
+++ b/Documentation/translations/zh_TW/process/5.Posting.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_posting:

diff --git a/Documentation/translations/zh_TW/process/6.Followthrough.rst b/Documentation/translations/zh_TW/process/6.Followthrough.rst
index f3b195966632..d36f9bec089c 100644
--- a/Documentation/translations/zh_TW/process/6.Followthrough.rst
+++ b/Documentation/translations/zh_TW/process/6.Followthrough.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_followthrough:

diff --git a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
index b449d67e3ad9..7f61e8b103f3 100644
--- a/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
+++ b/Documentation/translations/zh_TW/process/7.AdvancedTopics.rst
@@ -11,7 +11,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_advancedtopics:

diff --git a/Documentation/translations/zh_TW/process/8.Conclusion.rst b/Documentation/translations/zh_TW/process/8.Conclusion.rst
index d1634421b62c..f0a1e08359c5 100644
--- a/Documentation/translations/zh_TW/process/8.Conclusion.rst
+++ b/Documentation/translations/zh_TW/process/8.Conclusion.rst
@@ -10,7 +10,7 @@
 :校譯:

  吳想成 Wu XiangCheng <bobwxc@email.cn>
- 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_conclusion:

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
index fbe66b001322..2bec4ffb8728 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct-interpretation.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/code-of-conduct-interpretation.rst <code_of_conduct_interpretation>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_code_of_conduct_interpretation:

diff --git a/Documentation/translations/zh_TW/process/code-of-conduct.rst b/Documentation/translations/zh_TW/process/code-of-conduct.rst
index d24f1695bd02..239f52e5c3ec 100644
--- a/Documentation/translations/zh_TW/process/code-of-conduct.rst
+++ b/Documentation/translations/zh_TW/process/code-of-conduct.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/code-of-conduct.rst <code_of_conduct>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_code_of_conduct:

diff --git a/Documentation/translations/zh_TW/process/coding-style.rst b/Documentation/translations/zh_TW/process/coding-style.rst
index 311c6f6bad0b..436a4a7caeac 100644
--- a/Documentation/translations/zh_TW/process/coding-style.rst
+++ b/Documentation/translations/zh_TW/process/coding-style.rst
@@ -17,7 +17,7 @@
  - 管旭東 Xudong Guan <xudong.guan@gmail.com>
  - Li Zefan <lizf@cn.fujitsu.com>
  - Wang Chen <wangchen@cn.fujitsu.com>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
+ - Haowen Hu <srcres258@furdevs.cn>

 Linux 內核代碼風格
 ==================
diff --git a/Documentation/translations/zh_TW/process/development-process.rst b/Documentation/translations/zh_TW/process/development-process.rst
index 305d9472b017..627f233de163 100644
--- a/Documentation/translations/zh_TW/process/development-process.rst
+++ b/Documentation/translations/zh_TW/process/development-process.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/development-process.rst <development_process_main>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_development_process_main:

diff --git a/Documentation/translations/zh_TW/process/email-clients.rst b/Documentation/translations/zh_TW/process/email-clients.rst
index 4543c447d797..ec4f59f2da1a 100644
--- a/Documentation/translations/zh_TW/process/email-clients.rst
+++ b/Documentation/translations/zh_TW/process/email-clients.rst
@@ -15,7 +15,7 @@
  - Yinglin Luan <synmyth@gmail.com>
  - Xiaochen Wang <wangxiaochen0@gmail.com>
  - yaxinsn <yaxinsn@163.com>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
+ - Haowen Hu <srcres258@furdevs.cn>

 Linux郵件客戶端配置信息
 =======================
diff --git a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
index 93d21fd88910..6ce7d438e4e7 100644
--- a/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
+++ b/Documentation/translations/zh_TW/process/embargoed-hardware-issues.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/embargoed-hardware-issues.rst <embargoed_hardware_issues>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 被限制的硬件問題
 ================
diff --git a/Documentation/translations/zh_TW/process/howto.rst b/Documentation/translations/zh_TW/process/howto.rst
index 80c416483e73..2da73b2de42b 100644
--- a/Documentation/translations/zh_TW/process/howto.rst
+++ b/Documentation/translations/zh_TW/process/howto.rst
@@ -16,7 +16,7 @@
                    鍾宇  TripleX Chung <xxx.phy@gmail.com>
                    陳琦  Maggie Chen <chenqi@beyondsoft.com>
                    王聰  Wang Cong <xiyou.wangcong@gmail.com>
-                   胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+                   胡皓文 Haowen Hu <srcres258@furdevs.cn>

 如何參與Linux內核開發
 =====================
diff --git a/Documentation/translations/zh_TW/process/index.rst b/Documentation/translations/zh_TW/process/index.rst
index 65922d9faa20..3a9c08217c6d 100644
--- a/Documentation/translations/zh_TW/process/index.rst
+++ b/Documentation/translations/zh_TW/process/index.rst
@@ -9,7 +9,7 @@

 :Original: :ref:`Documentation/process/index.rst <process_index>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_process_index:

diff --git a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
index 23d5cae9685b..29877a76b84e 100644
--- a/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-driver-statement.rst
@@ -6,7 +6,7 @@

 :Original: :ref:`Documentation/process/kernel-driver-statement.rst <process_statement_driver>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 內核驅動聲明
 ------------
diff --git a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
index 524eb4ac26cc..3fda271581c6 100644
--- a/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
+++ b/Documentation/translations/zh_TW/process/kernel-enforcement-statement.rst
@@ -6,7 +6,7 @@

 :Original: :ref:`Documentation/process/kernel-enforcement-statement.rst <process_statement_kernel>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 Linux 內核執行聲明
 ------------------
diff --git a/Documentation/translations/zh_TW/process/license-rules.rst b/Documentation/translations/zh_TW/process/license-rules.rst
index 594255856b68..e856ffc63939 100644
--- a/Documentation/translations/zh_TW/process/license-rules.rst
+++ b/Documentation/translations/zh_TW/process/license-rules.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/license-rules.rst <kernel_licensing>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_kernel_licensing:

diff --git a/Documentation/translations/zh_TW/process/magic-number.rst b/Documentation/translations/zh_TW/process/magic-number.rst
index 5582df6d7ca7..3d1f0cf82819 100644
--- a/Documentation/translations/zh_TW/process/magic-number.rst
+++ b/Documentation/translations/zh_TW/process/magic-number.rst
@@ -12,7 +12,7 @@
         中文版維護者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
         中文版翻譯者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
         中文版校譯者： 賈威威 Jia Wei Wei <harryxiyou@gmail.com>
-                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+                      胡皓文 Haowen Hu <srcres258@furdevs.cn>

 Linux 魔術數
 ============
diff --git a/Documentation/translations/zh_TW/process/management-style.rst b/Documentation/translations/zh_TW/process/management-style.rst
index 7cb912e89032..9b36099e3bce 100644
--- a/Documentation/translations/zh_TW/process/management-style.rst
+++ b/Documentation/translations/zh_TW/process/management-style.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/management-style.rst <managementstyle>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_managementstyle:

diff --git a/Documentation/translations/zh_TW/process/programming-language.rst b/Documentation/translations/zh_TW/process/programming-language.rst
index d2c64a5599e8..1bf850a9eb43 100644
--- a/Documentation/translations/zh_TW/process/programming-language.rst
+++ b/Documentation/translations/zh_TW/process/programming-language.rst
@@ -4,7 +4,7 @@

 :Original: :ref:`Documentation/process/programming-language.rst <programming_language>`
 :Translator: Alex Shi <alex.shi@linux.alibaba.com>
-             Hu Haowen <2023002089@link.tyut.edu.cn>
+             Haowen Hu <srcres258@furdevs.cn>

 .. _tw_programming_language:

diff --git a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
index 4b8597fed5ae..88e68c8d987e 100644
--- a/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
+++ b/Documentation/translations/zh_TW/process/stable-api-nonsense.rst
@@ -12,7 +12,7 @@
         中文版維護者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
         中文版翻譯者： 鍾宇  TripleX Chung <xxx.phy@gmail.com>
         中文版校譯者： 李陽  Li Yang <leoyang.li@nxp.com>
-                      胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+                      胡皓文 Haowen Hu <srcres258@furdevs.cn>

 Linux 內核驅動接口
 ==================
diff --git a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
index 2f8f064f8629..42c156bcf30a 100644
--- a/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
+++ b/Documentation/translations/zh_TW/process/stable-kernel-rules.rst
@@ -15,7 +15,7 @@
         中文版校譯者：
             - 李陽  Li Yang <leoyang.li@nxp.com>
             - Kangkai Yin <e12051@motorola.com>
-            - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+            - 胡皓文 Haowen Hu <srcres258@furdevs.cn>

 所有你想知道的事情 - 關於linux穩定版發佈
 ========================================
diff --git a/Documentation/translations/zh_TW/process/submit-checklist.rst b/Documentation/translations/zh_TW/process/submit-checklist.rst
index a0cb91a6945f..26a3a63db253 100644
--- a/Documentation/translations/zh_TW/process/submit-checklist.rst
+++ b/Documentation/translations/zh_TW/process/submit-checklist.rst
@@ -6,7 +6,7 @@
 :Translator:
  - Alex Shi <alexs@kernel.org>
  - Wu XiangCheng <bobwxc@email.cn>
- - Hu Haowen <2023002089@link.tyut.edu.cn>
+ - Haowen Hu <srcres258@furdevs.cn>

 .. _tw_submitchecklist:

diff --git a/Documentation/translations/zh_TW/process/submitting-patches.rst b/Documentation/translations/zh_TW/process/submitting-patches.rst
index 64de92c07906..62f3969b5a97 100644
--- a/Documentation/translations/zh_TW/process/submitting-patches.rst
+++ b/Documentation/translations/zh_TW/process/submitting-patches.rst
@@ -14,7 +14,7 @@
 :校譯:
  - 李陽 Li Yang <leoyang.li@nxp.com>
  - 王聰 Wang Cong <xiyou.wangcong@gmail.com>
- - 胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+ - 胡皓文 Haowen Hu <srcres258@furdevs.cn>


 提交補丁：如何讓你的改動進入內核
diff --git a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
index e2723f3cbbb0..2f4a21c4a8fa 100644
--- a/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
+++ b/Documentation/translations/zh_TW/process/volatile-considered-harmful.rst
@@ -17,7 +17,7 @@
         中文版校譯者： 張漢輝  Eugene Teo <eugeneteo@kernel.sg>
                        楊瑞  Dave Young <hidave.darkstar@gmail.com>
                        時奎亮 Alex Shi <alex.shi@linux.alibaba.com>
-                       胡皓文 Hu Haowen <2023002089@link.tyut.edu.cn>
+                       胡皓文 Haowen Hu <srcres258@furdevs.cn>

 爲什麼不應該使用“volatile”類型
 ==============================
diff --git a/MAINTAINERS b/MAINTAINERS
index e08767323763..6984f01bf49d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26538,10 +26538,10 @@ F:	kernel/trace/trace_osnoise.c
 F:	kernel/trace/trace_sched_wakeup.c

 TRADITIONAL CHINESE DOCUMENTATION
-M:	Hu Haowen <2023002089@link.tyut.edu.cn>
+M:	Haowen Hu <srcres258@furdevs.cn>
 S:	Maintained
 W:	https://github.com/srcres258/linux-doc
-T:	git https://github.com/srcres258/linux-doc.git doc-zh-tw
+T:	git https://github.com/srcres258/linux-doc.git i18n
 F:	Documentation/translations/zh_TW/

 TRIGGER SOURCE
--
2.51.2

