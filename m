Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2044.outbound.protection.outlook.com [40.107.94.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85B4A2C182;
	Fri, 20 Dec 2024 15:14:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707674; cv=fail; b=LecDQtXCTvNkjx1021ridKV3hlczQDXNjH550cmcide6HY1WMWvOlB1L7/6yucd7Rwg/mSmphbcsxpKd8coxW8mIEWsJYPIH2tRVZ/hzJkZCQUlU6EVewAZPenSfan7gpplIiOxY9DNotfezNyCUxACFPUITza3MEuE4DhELQZY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707674; c=relaxed/simple;
	bh=o+0gN4FGYUiK/eRVI1o2Dhiz4AteXcuQXLHaO41cAdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iIagNb21WTk3L/qK4w2hLQu2bWogh6iCDwbEo7WOe5w9i2WzwLDoyyju7cVS/h0guyslzSDXM7yeoppWOSYhJ/2tNnnXZmG/GlnByQ9YOB+XIZBtbNtd/6LAIIJEJjOrs/ppdZZ2pGSV7NTYn/+pcw7Ywv6Zd9m9dBAgd3TWS8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Xd6fUnFi; arc=fail smtp.client-ip=40.107.94.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Xd6fUnFi"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KhFEzomI5g3Oo5gdBN0ZkIJE1EjOot4RC4rk2EbTt6ErUiT0ClV0pCWqfjtjQnnjp2IzxAP9xPdGrHn5VNhWoLk3R0URQYWv9aKMMY+DZ4LyRp0k8k2eCi6jONJcEHgKg61jXHGStzy41bpPB2Qu01MNzPVVIjBuc3o9pXz1qu5YH3uEfputrx60ivobxc/oc89vQ1i5TdJS/mf8k1V9pyS7aP9JLlCB2MW/R3uxvDw6n1dHYrOLYa+j7RUyIgIuXdLJGaU8wAzaZ88K9spHPukZI2LUUbxDe/d1rWGaN+p+5+eAdZA5NS5dV7yR8+xuRGPMfQXd3xFcb8QXwwnapA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DA/o31BnwByBEAsidJUOaRwnTApHuLxdIknmspPG6rY=;
 b=Gb6uJAXT+NmppiZcLcWplXRGQJe3J+bPsNco8v2vR4/l5CHlCvMuis/4wG9T/w7ltvh8dNgKm5afDUD5rdGJwnPsmoZ2pgYzMNsTSjBK9gGkHWZFo+4Gmuuc8mCd9xX8wosfntNsydbntOdYe2eAq3Z/su6MApPcpi+vndWrlNnAuamrfjvxN61VpTYqZW4yW5fv43q7+Jjs7++NTtSK2X2CFshvYLV2YrpRBRfvD0SWZrNoix4+H/DBfFYNW+89dnm2yubhqgUu9tkChHuoKYVD9VwFQI+D5RbegbYXZsZF51LzVZ44ysNX2FvvsZU883bX3R//5o7PBrTS1N/Y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DA/o31BnwByBEAsidJUOaRwnTApHuLxdIknmspPG6rY=;
 b=Xd6fUnFivj+xkpQ4CvUtjtz1NA+y28LAYRgLgg0/Bzlyy6JSnlKdlPzLgJqPFzyk44Jm4VXqaxtjTry42UjuVUcwRSDmDkjq0Oa72ajvixoLHuubAPGD3MIjtC0o7LX6jM7+dDgDlb/NHrCNLoTAx/4j3tZUn856nABWiauRLbU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by BY5PR12MB4164.namprd12.prod.outlook.com (2603:10b6:a03:207::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 15:14:26 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:14:26 +0000
Message-ID: <706a4517-d8d8-4306-99d9-95533818bd4d@amd.com>
Date: Fri, 20 Dec 2024 09:14:21 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/24] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com,
 xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com,
 mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1734034524.git.babu.moger@amd.com>
 <401d9591e0b76133b649f71029965d1eb2391f21.1734034524.git.babu.moger@amd.com>
 <76794aef-757d-4621-8158-d23eba2580eb@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <76794aef-757d-4621-8158-d23eba2580eb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA0PR11CA0066.namprd11.prod.outlook.com
 (2603:10b6:806:d2::11) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|BY5PR12MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: 54386689-2012-47ce-7819-08dd2108fde6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MXpFcSs5eVdLT0cxeVhCM0VvNk5tbjllejlBMVR0WEdLM1N1VkhYN3B2V1lJ?=
 =?utf-8?B?MGJmM2Z6ZS9yc1FqN2dzMVRSU3M2enR2emhNTFFVajlzWUFJSlBrakMwZi8y?=
 =?utf-8?B?dmVMY3BFcHdraFk1ZnlxOFZZbjYxT0IwQnlRcCtpSTZPRTViMmxiL1NtZXhq?=
 =?utf-8?B?UVlVaXhPS2YzTnBmK2Y2b0MxZE05ekdtTE1NdDY3dWlwbE8wN05YVEFBc0ZJ?=
 =?utf-8?B?SFNVNDBpWElFbjhWaEdWVXRGZWNhdUZpWDczYTNBN0M4NWN2TjkyaWIwdndD?=
 =?utf-8?B?MlNwWDNBSFRUVUNaYjBZcTFYN0QvcGU3MTd5NVY3c3ArODVFT1hweGZmbi9G?=
 =?utf-8?B?U0lLcUdoYkhFdEVIOHd2a2ZUYXZhQ3ZOVlZlU1pYdjl6ZWtnSm9QWGNJNUJ2?=
 =?utf-8?B?RjZzVElnaHNheDFQN3BxUzVrR1hnRHE5UlRTc1V5ZUdHbHQ2K1BtU2x0UW5W?=
 =?utf-8?B?MzRzczliNGRFVXAwT2ViT2JTMTNJbFltQWczWGkzZEg3Q211VThxZzhCMDZJ?=
 =?utf-8?B?Mnd6eVBRL2VMa1NzUk5sbEZ2Y0UrK0JnYjl5V3kvWG9ScFM2ZTN3UGY0TExI?=
 =?utf-8?B?VzBnajNNT1ltWEwxZHJVWDl0MExVVzN4cjBRK1dwVThZOHlZSGsvdXJWbHJ0?=
 =?utf-8?B?OFk2U0sxck14cmlVdkFmdmhWT2FTOUEwV3FrUTdTZ3d3Nld5ekhoRS9iWmcr?=
 =?utf-8?B?RzJSd0R3ZmRhT3FIdDNJcVBkdVBQNFhka3A3MDhldHcyWktRYW8vcFR5L2lV?=
 =?utf-8?B?TGd4ZDdRd0w1SnRlTUlHRFF5NkZEZjhVMzcxaUFreUd6V1BRUG9nLzJRVkg3?=
 =?utf-8?B?Y1VIanVyTklVUTI5Vi9IeFdhVGp3K3VxUUh6QVNPa1UzdnJQMzk4b0xhSlpM?=
 =?utf-8?B?QkZ4T0M2dndsNU94a1k1TTVZSzUrb25PVXRXdEtubllKR2ZwbmhYbloydGNm?=
 =?utf-8?B?TWlvd1JXaWRIeUxQVndrMlgzTHdFVnMyekF6Y2FjTjFaOHlVY3B1RWpvYU1m?=
 =?utf-8?B?czZWNHJQZXlpRVJzYzZOamk3OWR6Q3cwMlJZRFYzSnVFRTZqdEkzMzJsUmdq?=
 =?utf-8?B?K09objhwOEV4U1FaRFVZOGM5ZVJ4dDkxa25KRC9jSVQrQWN2czhGZFV3Nk9p?=
 =?utf-8?B?anN0b0M5NGs3TlFVK1FGNGtRS3Uyei9KQUR0U2RCUU9IWTgreE1JUEZpYVN2?=
 =?utf-8?B?d0xpU3M1Rlh3ckVtM1VYYkJXUUJzbUxVKzJrWnM2aVdMUktNcmN0eFJISC9n?=
 =?utf-8?B?SUJZeFRjbWJnUWVPV1puRGVJQ3ZXbzRIMGdCSmFoQzkwa2swV1NZZFh0TVBt?=
 =?utf-8?B?ZUFhZDE3N25hdnd2SzRsSXR2VE1QWmVVVy9yYkEyU1dic0NzRWU1Y2ZMK2g4?=
 =?utf-8?B?VEs2SklseUNrMkc4UVdMSFQxd3FoNGRGdU5vN1VrMjJkOThkYUZzNW51aDh3?=
 =?utf-8?B?S245ekFlSFZFcmNaZnpaQXlPOTl5UjlkbDVzaTc1OEpzTG5hQWliaVFtM0cv?=
 =?utf-8?B?T0RucnFiRm5OSGF5U25LZGsxd2pMRUlXZndJbU9DOUFFdTExR0dvVUZnS2pH?=
 =?utf-8?B?bEpFRWFhMktnWm5zK2FMamdodUpHejI4blRsd3FyRXBQaTVmZDZzWE5tcW0v?=
 =?utf-8?B?c3NwUnI0SE9vNllTZS9ack5aVGdQdFlLd2RKamloRGpWSXp2Si8ydHFJL1lu?=
 =?utf-8?B?TTRVejc1aHFPZUZuaHp6Nm1odlRwSXJQS29SaHQrUmphancvbnhLMm8wOUg4?=
 =?utf-8?B?S09aRHVPZ1ZSWmVkVlhvOXJpRlVaeEU1dTk3SVBaNzltdEprY3lyUW8zSVI2?=
 =?utf-8?B?Qi9vY3BpLzJnN09GS3orMWVyNUpjQUFqNnY0S2VtUDFUK3BoZXY3Tk9DbVNV?=
 =?utf-8?Q?JXhRDu6Tw1HoZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RzYwcEF5aC94VVhNVXlRZjNvM1JWcEQvcUlXOGE4NVVMYXd2STJVRzlCRXBQ?=
 =?utf-8?B?Nm9rTjRhNTdFUFBYSGEvV3M2Q1BaUGptTmtqdW5rekxENmtjR1pPaXFRM1lE?=
 =?utf-8?B?d0FiWldGY0FHYVRjU2xwYytveHMyaU9WMVpnbDEweW5hQkNJMFJ4UHFibDh5?=
 =?utf-8?B?MUttYytvYWlKbndJMjRVL2tuUktMNU9UV3p6UnhsOVlxeFZLSUJWcWxGVldr?=
 =?utf-8?B?SGgxSWJaYzY2ZTFVaG1uMi9NajM4NXlIWFhGMDgyckpPZit4TG96YjdPNWFr?=
 =?utf-8?B?aWJ4UW5TVUc4TFN1b0JHTnJodXl4b09ac0ZaWjVqOURJNlNFVXZQdE5aNnZY?=
 =?utf-8?B?T0xpd1hFVlViMU1tekRzNXlQdUlQUkRsam1PN3VQdExpVjJHVkpxYUFYZTFC?=
 =?utf-8?B?aXp5L0VpYThBTHRrdFA5QnJaSkpRQ1d1aVV1S0pmRE10TWFzRFhqTFZCVzBH?=
 =?utf-8?B?anZJVFRzS1pIdlVaWjA1MWVYa0FxT053dVZVRURYUGNNdXZjdlp4QWhLb2tR?=
 =?utf-8?B?aHhqK3Q1b1M5aXh0R3l5U3NySnhoaHViTTBvOEZaZDlwN1VXb2R2VlFZVk51?=
 =?utf-8?B?WThPNWpqTk1QcjlLZTR4TWQycHBqam5ZSkpHNlRuNGlaVWdkZWdzdk0yWVVM?=
 =?utf-8?B?NVBidkJ2bEIyQ1FGbFB6dUM3ZEVNZVlyQ01UbGp5bTJMcjlhVlR5c0dmWHNp?=
 =?utf-8?B?WUh1b2E4VWVWellSVlpWL1pTUGVxWXVSTFM5SU9EdWdqbDhhaXpBNkpsZ0J2?=
 =?utf-8?B?NDVUNXQ4WGdmdWRtcTdodWRXb2dRTFBtd1IzNVg2cXpiYStLcTU3c3BqTWRV?=
 =?utf-8?B?cXZhSE83QVczZkZzaUFSTzl6Y05qbW1PMHlDMVozdlQ1NXB5c3N3dmpEQ1Zk?=
 =?utf-8?B?ZWpaYm9vUkhxc0lZOFM0OVdkRkdGTWJac3AwSnZoSURJQzZZeWV6U0JFTGhD?=
 =?utf-8?B?ajBzZ1ovZWFKUTFvY0FLS3Z4R3M0SkJsZFJzdndTSHExTGcrUWVaSk5NZG9J?=
 =?utf-8?B?empjbnFWQkxXYnF3QnE2cW0yWkFmWDhlUXgzSGxQSGt3TFZiUGR1eTI3WURo?=
 =?utf-8?B?ZmoxKytqT2ZqeUo3MDhlSkllVmVVbEpQZDBZRSt5MXU3TW1GcExEajNjbGFD?=
 =?utf-8?B?MjNKR0xpSG9pRWlGNFRsb0EwRXZoZVN4MzFac0dXUkdyeEhjVDNBUXVnWEti?=
 =?utf-8?B?T0RJRkZ6Z25YZWR4THpDYkhuZkF6clF5T2lrUkQ2bDdaTjA0MU9UdDlhMHlt?=
 =?utf-8?B?ZlJSMXZ2VmZYVkM1L3RmSnNMUjRQZ1hrZjlGSWM3b09vNGduWlRycjVldDJC?=
 =?utf-8?B?SU9Bdm5pWU91blhPR2E1VG5NVHNnMFloUHQ4S2lMeEwwL3NEaXF0SmVOeUY5?=
 =?utf-8?B?c3ZmVXBOWmtVN1pEVzcvc3IvQitMbThmTmJxbXZoc2hJWlJSaWc2WVM5bGZS?=
 =?utf-8?B?MG83MXlud2lZblBlcStvdlFVZHFLVk9JWE9haDN0QmsweGUrbDFnWmtHNHhV?=
 =?utf-8?B?eStXMTJBR1FCbzhLYW5YRnN5bUdPSkR6cGsvUiszVGV2OG5oNi9ZajlpVHZp?=
 =?utf-8?B?UXVyZndtbnF2SWVka29IZXZFbEZpbHQ0K2ZreEFsZFcrNURmSlFsR2ZFM1lI?=
 =?utf-8?B?NGF4blAyMjR4K3ZQRE81YzdHTjh6NjNOTVBLdy9FWHdsVjVHdU4wUEppZmJM?=
 =?utf-8?B?N2RnSWo0SkNSZUpvYjkvbFZUWUZ0WGlVa1BLays2eTBZbGdrQ2FucHhGQmF5?=
 =?utf-8?B?YjhKSzVNYWZIRXlidnNWKytKU2MxamtPMlduUmNpUWlMRHFuNUxvUFRsR0ZT?=
 =?utf-8?B?OVhybEpmTnQ5Z01FTGNMYlA0cEJhaFRlbEdJNXM4RlBZMVIraXZ0YzNZbndO?=
 =?utf-8?B?dDQ3VTA1R2ZjUWpwMzR2cTBmWlFMamZBekxkbFpwOGFjVUhGTm5QZnpGVXV0?=
 =?utf-8?B?QkovbVU0ZnVRMXBxb3h6QVZIMCtua1loaFhKM2JFUXlZemNyWjNrM05zdHRu?=
 =?utf-8?B?b1k4dndERm5JMWEwVEp4RWJjbTBhZWIxV0ZZMGJjQ2ZGR3l6c1VxcVJSMER2?=
 =?utf-8?B?N1BPek94ZGNiVjZPc3hpZlFsUWdxNm5LcmY4dEZKRU81d243TjBUYmdSMkha?=
 =?utf-8?Q?romc=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54386689-2012-47ce-7819-08dd2108fde6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:14:26.1403
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: olQyuNjwewTTF+hBOmX5DGA2zjrXn/gewlwdeAwbjGRMrpzhL81hw3fhCdFyE+f/
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4164

Hi Reinette,

On 12/19/2024 3:48 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
> 
>>   static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 687d9d8d82a4..d54c2701c09c 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
> 
> These functions are clearly monitoring related. Is there a reason why they are
> in rdtgroup.c and not in monitor.c?

There is no specific reason. Most of these functions are called from 
user interface. User interface handlers are defined in rdtgroup.c.

All the code in this series is related to monitoring. We can move 
everything to monitor.c if you are ok with it.


> 
>> @@ -2402,6 +2402,42 @@ int resctrl_arch_set_cdp_enabled(enum resctrl_res_level l, bool enable)
>>   	return 0;
>>   }
>>   
>> +static void resctrl_abmc_set_one_amd(void *arg)
>> +{
>> +	bool *enable = arg;
>> +
>> +	if (*enable)
>> +		msr_set_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +	else
>> +		msr_clear_bit(MSR_IA32_L3_QOS_EXT_CFG, ABMC_ENABLE_BIT);
>> +}
>> +
>> +/*
>> + * Update L3_QOS_EXT_CFG MSR on all the CPUs associated with the monitor
>> + * domain.
>> + */
>> +static void _resctrl_abmc_enable(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_mon_domain *d;
>> +
>> +	list_for_each_entry(d, &r->mon_domains, hdr.list)
>> +		on_each_cpu_mask(&d->hdr.cpu_mask,
>> +				 resctrl_abmc_set_one_amd, &enable, 1);
>> +}
>> +
>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable)
>> +{
>> +	struct rdt_hw_resource *hw_res = resctrl_to_arch_res(r);
>> +
>> +	if (r->mon.mbm_cntr_assignable &&
>> +	    hw_res->mbm_cntr_assign_enabled != enable) {
>> +		_resctrl_abmc_enable(r, enable);
>> +		hw_res->mbm_cntr_assign_enabled = enable;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>   /*
>>    * We don't allow rdtgroup directories to be created anywhere
>>    * except the root directory. Thus when looking for the rdtgroup
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index 511cfce8fc21..f11d6fdfd977 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -355,4 +355,7 @@ void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *
>>   extern unsigned int resctrl_rmid_realloc_threshold;
>>   extern unsigned int resctrl_rmid_realloc_limit;
>>   
>> +int resctrl_arch_mbm_cntr_assign_set(struct rdt_resource *r, bool enable);
>> +bool resctrl_arch_mbm_cntr_assign_enabled(struct rdt_resource *r);
>> +
>>   #endif /* _RESCTRL_H */
> 
> During the software controller work Boris stated [1] that these APIs should
> only appear in the main header file at the time they are used. This series
> makes a few changes to include/linux/resctrl.h that, considering this
> feedback, should rather be in arch/x86/kernel/cpu/resctrl/internal.h
> until MPAM starts using them.


Sure. We can do that.

> 
> Reinette
> 
> [1] https://lore.kernel.org/all/20241209222047.GKZ1dtPxIu5_Hxs1fp@fat_crate.local/
> 

