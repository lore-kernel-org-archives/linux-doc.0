Received: from NAM11-BN8-obe.outbound.protection.outlook.com (mail-bn8nam11on2054.outbound.protection.outlook.com [40.107.236.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D259233FE;
	Sat, 21 Dec 2024 14:59:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.236.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734793173; cv=fail; b=afdn/hSLDMnfjf4xrBfSlQNrW1MnQZJl5djeb+zvLQpzjBhY7nz9mG6dRWxXleHB7AIfxuklhMVeBO/lmkNdIxraLtPsELetkAYBRS2ozYYeVOCZxq8YrLOIVuD2Hx1Y7rUVgPTHYhkbnHs2fPtWDU1d7Oiu/gAvF3l6sI093S0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734793173; c=relaxed/simple;
	bh=b9T4k6SbXskR6Ns7rR0DwtYcxuXlVlNkTfn7v6Ou21Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=oJ9+DMYzcGwJpVRKVzbvA+dWW8SNNfhL15DLq2OqONWIQOeXbofgsvQNgWd3f47EfNfdYCOsaRlxzaR+tYI4DGBKxIyV9gXfFKbQHb3g0ycBIlXsWPnBui6BAoFlT/SQPth4kOfuX5dIQ+GacQPvG+0a7nr65M+Jm2nrioueAss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=ClSw/aAB; arc=fail smtp.client-ip=40.107.236.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="ClSw/aAB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=n7oERA2En2+Jp1KFGw+pGOiZdb2nMFgECTbR6tN99BMPnqquvr+BxGec0N0m+e2rJUSplVZ/gZvNpp6Ci/OLx+rAoN34NjzADq10Zg4hS8Y5VJ666Z4Wo2Gt6qD1qhnBl3krRJPEP7vfHzc8E90FOEDvi9MPyNuDF2vWEL3paezedU017d3w1MruJBs2OrZuKRIJVSSBkj5nDX1aJ7tRAgqzDMxrmys2LxswdHQdh7ncFw2ra6Jl/hNpYmlXx00WAepTmU/FRJ1gsncptHyxiuRGuhXL2ld3x3GcCrnA+okeQwCAd8kuCVVIrbU671UiauFtQl/N081+YOd2bbv+dQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xRC014oGP/NHeC7WXB/pBCA8Ect8MNz4t7GMQLC+FKs=;
 b=piF1V/uOHqxpytVzn3ncqwtA1uJ2bVnjZ5aNdicuRCGrHSgTQhvAXtAyhRBplj7eKV5Vfp4zc27diByb0Yqer1T4iw25yRc9WFj32XiFJ8fldXtROrt+KYRTl9bnsWnVvQs8PQQyTOvS3w90/oWnb1UD/BNqhJjR8T35vF4N6hXD8POo6KJ3bEYshStQSBj3Y2lkcjzF6v5qB8UWoKdFqz31BEFRBZ/OhdWdlbUJjk8qd1qqj2tUh7bEvPM6qBkwGEGuh9IRm224XtJzWkpaAxgygWwb6vZlgql599Zmqnzco1/w4nLTMqlnuLFI5QWCQvrPVOmLs1b+jIh4ZOwYEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xRC014oGP/NHeC7WXB/pBCA8Ect8MNz4t7GMQLC+FKs=;
 b=ClSw/aAB6jgN7M2zMihBEVvU3BzQSjRs+9bdwuMus265DbRJca7tbr+vyFavKpLipCctO1dEVLIMiA/Jot+LgsHOgnnL5i9ybL2cXVyB/6U9uqjyvGte8eClLjyXFhQ+Qag2CVvEUuzpKEtjLWgIW9n2V92wl2SoQ6uKQbSSPGM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4272.namprd12.prod.outlook.com (2603:10b6:208:1de::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sat, 21 Dec
 2024 14:59:23 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 14:59:21 +0000
Message-ID: <d127defc-6f3a-4255-b2d0-b59178089cee@amd.com>
Date: Sat, 21 Dec 2024 08:59:16 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 22/24] x86/resctrl: Update assignments on event
 configuration changes
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1734034524.git.babu.moger@amd.com>
 <8c8ecf12622c649bd269052b9fcd436710446034.1734034524.git.babu.moger@amd.com>
 <5e1471a0-3484-4273-9be7-94d084d2cc4d@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <5e1471a0-3484-4273-9be7-94d084d2cc4d@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0084.namprd13.prod.outlook.com
 (2603:10b6:806:23::29) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4272:EE_
X-MS-Office365-Filtering-Correlation-Id: 95f7dc13-744f-4657-47fb-08dd21d00d08
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WUpqMmZRcGY4YVFBNWdxSDhYOVNnMWpvMXQ2S1NGZnVHOU5LdG51cEN1cEI1?=
 =?utf-8?B?SkxjRmc3K0JhZmFIZC9FajdXV2dFTUVJZG1TQjk2K3F2SkNaTGZGdndFcXlJ?=
 =?utf-8?B?YXFlVHB3V214WmZaM1htZ3VxVUV4UE9SeXBHNTRoR3c5UzE5am5NY3JhRC9Q?=
 =?utf-8?B?ZS9hWUoxYkdUZytqQWRsL24vbUxlSVhGVDNlVXgxVWc3QjVSZFpoeDBqZXVq?=
 =?utf-8?B?L3Fyc0h5ekU4SU9FRnVrRGFVbjE1SkczSFBPMDc2QjFnVm5Vb0ZNTlBZalZm?=
 =?utf-8?B?V1JDL1RYSHl1Q1g3RHB4TzEySjByRytNM2dYcGxwR1AvVjRpblplQUQ4NWxS?=
 =?utf-8?B?RzljdVN2eHpnSklZU2I1Wmp2RVpoZ3RDdGtYRlF4Rk1iczhUUHY2YWZiTyt5?=
 =?utf-8?B?RnNDeHEybksraCtBVU5uM20rU04wWDVXTUVjVEhPWlJFV1pWcExsWUZpaWln?=
 =?utf-8?B?WnZETDR2QVAzcTJrcUdIL3EranNRbjBnb3VlU3NPUFh2aXh5M2tzOTVsbEda?=
 =?utf-8?B?Y3dhamZrRWI4Rzc3RnZJTUlGVHpwN01wQjBQenRTUVdVdk54NG0xQkMvaXpG?=
 =?utf-8?B?QzFUL1Nwam94K3NIUXpjc0NIQXQ1WWMxTktDV2JQWTZqamJSRXVWM1d6Vll3?=
 =?utf-8?B?L2pKZThUTVpiMlBmaktHNnRFSXJXWVpMbzE0eHQrVEhqSWNBM3phZ1U5UHNv?=
 =?utf-8?B?SGhtYXh4a28vRkoyWlA0U3g4b1dPa25qRjEvRFFrTkN3MUR0a09jMm5hR2pu?=
 =?utf-8?B?by96MnNSYkpzNmRKL0FrUE1GQ0Q3b3VzZk9HYkdkTVJYSEF3Q2NNZ2lZWHha?=
 =?utf-8?B?dU5DZ1NTWmNMc2IrVVJxRzVraG1wZTVXSmNUKzFlWjdwSzR6bVRnQXBQb3ZN?=
 =?utf-8?B?N2M0cDVCOEt0d2NNZU5sQ3dTMEhIZEhmckxaejdpdTV0MkMzd3RSZXphR1Uy?=
 =?utf-8?B?RGNoMlphRDgyUHhNMzFxWTJmUjZEaW5BYmxpZERaSndlbVkxYW1UMkdVcHAr?=
 =?utf-8?B?bjVxM3BxNWJIcnA0clo0SVdyZk84MDIvY0Mxb2EyV3Q4Zy94SDBzOHJUb0g0?=
 =?utf-8?B?RHhzWXVpTUhiZEhnSjRlUFpHMHlFQWxkUmdkdjEwQm51ZWtHUFdiOStJMy9z?=
 =?utf-8?B?aloxNFNCQ3BPdy9xMzVPNmRXYmJNYlBRdWxaYVdBSVlWcG8xNEdVWTlnNkVu?=
 =?utf-8?B?RS9Ha0VPR2hSWXkrME13S0haaytKOStCR09xalQ3bFhmaVpsd1B4U0Y1N1JY?=
 =?utf-8?B?eC9PRlk1VCt3STZDV3hUM2Y2d2FmWjk0a1NDdFpBMXhnbzlCcW1ZN3Y0VkZV?=
 =?utf-8?B?b3owOE92WnhnRUpuYW1zcGJFTDFjaWJMMVBZY2p6eFVKeUxmb2tpTnRZSWQ4?=
 =?utf-8?B?QTZFeVhyTEFLakJsR1RJTjl1aUxwbkJJM2tLbUh6R00zTlVMcFdvK1ZvZkk2?=
 =?utf-8?B?dnpkRWlIYit5elVOL3NwQmR2ZDVzeEQvQ2wrSFVBbUZyTll1eG9uVmdkdmJ3?=
 =?utf-8?B?SmEyT3Q3MXlYR3lYRW1Yc1I1Q2k0SEZmcmFxd1pyMlJhTkMzQXVaWTdyNXJW?=
 =?utf-8?B?VXJjb2VjRFpyeWpFTERHTE51MVdyblFOOE1EQlNjbjJhUUlRaEJYeGlIOUk3?=
 =?utf-8?B?ZDRSMFFzNHdkV2J6ZlBFVEpNZlRqUDNja1J6WnU0Y2VMcjFjMHd6RXBJcUlZ?=
 =?utf-8?B?UEwvWkZoZGxUeDBJL2g2MURTOHNUbm9TdVJYNitHdWh5WEd5UXUrdzROelhM?=
 =?utf-8?B?UUV4SzdKemF5Y2xsUU4wckgxNzdtaEFFUFZaMTFmblNidE5ZTWIvS0xJZjJ6?=
 =?utf-8?B?REIwSERlVHVXeUV5TjhpTXdTc3hoRG9XQTlIUzRJTEVXY2tINy9SSlcybm1Z?=
 =?utf-8?Q?NDCp7pBX3bwJl?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3pCcWFvdE9yTUViN2ZIbGRuYzkwTDB1NytXb1ZoTjRWMGYxdHd5QVNmelhB?=
 =?utf-8?B?NSsrZGhSOWt4ZG1FYTFwRTFKVEc1N1pJcDNrWEp5NWc3TEVTY2NxaUJZTitZ?=
 =?utf-8?B?eG8yK21kK1Mra2pVbUZUbVlybGtEZlMrdnpqY3RoNGxQZ1NrTFBjRTZUMVhs?=
 =?utf-8?B?dUsrUzBFYXFGWkpiMmg5UEh0S2dua0EyYnpva1lqeVVVR0JrWG03UThHWGN0?=
 =?utf-8?B?a0JvMFlIeVk0TkoxbU5SNk14alZldWtScWExRWVQencxSTJ3WGZid0VNeGVx?=
 =?utf-8?B?Z1BmSEMxRWlzdmU4UDVkc0p2bDNVemNFWkpnTUgyUXNhLzFhallqcHBuaFJI?=
 =?utf-8?B?b1lNZzNpQ3dIQ0NVM3RDeWpVZ21uQVRGSUlKVzFXNDJrU3VZY1BCWkVoNHlT?=
 =?utf-8?B?NDFwZjd6RS9GeVA2dS9iUzdUZFVDWFI0WHVUNm56UU1uMXBmSFdnSGlleDYr?=
 =?utf-8?B?T0tUazNZZjlzWXU5Kysrd2NKTnQ3WS9aOGl1T2Rtb2FhUUVNQWJ5WGExbmxU?=
 =?utf-8?B?NnIxdHRJSkYzbW5kZVRBemdSVzVsZlZrVE1vd1o2ZE9sSkFuZkErVVhDVmdp?=
 =?utf-8?B?NlhKLzRFWVR2aVpUT3NPcVJlSXd5ZXc4OUNGNTVmMXRzL1EvZWRTZmtGQjNL?=
 =?utf-8?B?VEJhR25EYjdQakl5cG9MeUgxNmpWdTBHYU4ycnlubzkrTnAyS0k3MDlQZDl5?=
 =?utf-8?B?OVFNbnFVbDZMZ1FmTDFtZzFoa0RkWVFkMlA0K1hDa3JYSGtMd0xqMWMyelJ2?=
 =?utf-8?B?anhKQW4yR0N2NUFac0g4QjZQS3UwSjkzVUNYcEljcmxVSXNhWlZsZ1NPRy92?=
 =?utf-8?B?WVdNUWpQUUFHMWxQeW1STHJybE9xbmJrc0FYb3ZhdmxHTWZJdlBKcWpPUGwz?=
 =?utf-8?B?ZjhyWDlOdjNtWVNMNjRWUHo0THh2cndLTVByRzJaNm8wKzR4blhzSm8yc2dX?=
 =?utf-8?B?U3JYV25CS2w5V1cwaUp5RUM1M1ZUaUllRmNDMFF0d3lSL0FlcisxTndJQzh3?=
 =?utf-8?B?MmFhYTVWdWEwQmhmNlA1QWNEY3lmcDdQcUtFMzJRbUkyV2xvTGlNZHhiN0Z1?=
 =?utf-8?B?cTUxZnRkYWhtRmNPSTB4QWVDQVA5R2xaUlhxTHZRRCs3Z2FRK01XWWRaL1Ni?=
 =?utf-8?B?M0RlZXN5ZzZaS3dmR0ZORFFtaDg3enc4eVNjVEo5V1lyNyt4L0R3NlFVUy96?=
 =?utf-8?B?aVltamcvWFcyTUtKU1BmV0Z4YlhTcXRLOWx4SElqWmsxV1lvWSt0eWtTWStG?=
 =?utf-8?B?ck9hMlNSWDNob2l2T3pxQ0ZJMHJWOWo5eVNxQk80OFduQUsrYW5lT0hzYVVs?=
 =?utf-8?B?MklXRFlEOHNxWVk3ZjU4ZmVzZTVKL3V5TmJQWXQ4VDF5SERFeTRtb29jS005?=
 =?utf-8?B?TDdabHg4WDBLVWszVmJGL0V4OTFUbm5SUHlKY2k2U3FnaHNLN0JaVHhzMXFy?=
 =?utf-8?B?MnBPSStxOHZlZU42aXZLakRjaC9wcjF6MVN4NFhYR1VTK3VtaFFPWWxjU0lY?=
 =?utf-8?B?Y1hKbGN3WE42MVZud0Frd1ZBMldmQTN0S1gwWVl0ODZnYTIrMmxsZVRTcmNx?=
 =?utf-8?B?Q2xjcTFRNmpRUjRNVDE3MjRVTlhFVVV6N1ptamxnNHB0YlpvbmxwbFBUWFZh?=
 =?utf-8?B?a3NlSmpHeEpmN2Ezdk8zSHdrMEsrOFpZNzRNV0MxNC94MC9aV2pvRnZiS3U3?=
 =?utf-8?B?MHEybUdqd1pzNlVaOTVaWUFHeUxmWlJONThod1FtRStnMHI1S2dZVDR3VUVB?=
 =?utf-8?B?ZkVGd1JzVFBNRzl6SFpiTnZrR0JyZ1UvVVlOYzN4ZzNQL0JuYzgwYXAzNXAx?=
 =?utf-8?B?cWRvWHk4a1lsQThsQWhnR0wwK2xlZ3E1b2YycEo0M1p2WWt5bVkrRk1jc3pE?=
 =?utf-8?B?SFMvanBCeURJajdSTC8vb2lTSWw4cm15bVpucnBQUS96VU9LMTBNdlhyR3pJ?=
 =?utf-8?B?REpvVTh5YTJ4dlV3MFV1Z2NuNk9ZbktVWHZ4bzM5MFFKSWE2cDY3YW9zQlBR?=
 =?utf-8?B?VjljVEVvQyt5OUFLYUlHY3RmRlVwQm03Ujh5eEE1Q1hDMVptNHp6aXVjYml0?=
 =?utf-8?B?bTVITjhUSVJlY3N6NG5OS2VWTCtXalc3Qm9PdHIvbHE0MGRPTWljcHV4OFFD?=
 =?utf-8?Q?DDiYp1/ujtGCI1YYzowJ0rRBY?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 95f7dc13-744f-4657-47fb-08dd21d00d08
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 14:59:21.3561
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z5ILKcXwGiqTj51LifM2126vlrX8cVmZNUFMh0382XBF4O+ucRoAdjZyJ8lc8NrZ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4272

Hi Reinette,

On 12/19/2024 9:12 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Resctrl provides option to configure events by writing to the interfaces
>> /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config or
>> /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config when BMEC (Bandwidth
>> Monitoring Event Configuration) is supported.
>>
>> Whenever the event configuration is updated, MBM assignments must be
>> revised across all monitor groups within the impacted domains.
> 
> This needs imperative tone description of what this patch does.

Sure.

> 
>   
> ...
> 
>> @@ -1825,6 +1825,54 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Review the cntr_cfg domain configuration. If a matching assignment is found,
>> + * update the counter assignment accordingly. This is within the IPI Context,
> 
> This "Review the cntr_cfg domain configuration. If a matching assignment is found,"
> is too vague for me to make sense of what it is trying to do. Can this be made more specific?

Does this look ok?

Check the counter configuration in the domain. If the specific event is 
configured, then update the assignment with the new event configuration 
value. This is within the IPI Context,  so call 
resctrl_abmc_config_one_amd directly"


Thanks,
Babu


