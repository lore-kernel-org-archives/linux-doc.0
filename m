Received: from NAM04-DM6-obe.outbound.protection.outlook.com (mail-dm6nam04on2068.outbound.protection.outlook.com [40.107.102.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4160C39FF3;
	Fri, 20 Dec 2024 16:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.102.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734711006; cv=fail; b=oIMEucOjiH4PtVM2bUSJ3p0IqD3QoU/7BGM3KVm8VhiFePnd5IUmydePwi+PD62Fq9R+dXEdU8vE/j6x9SNwT7OwNpJEA7/HVtIoOqk6W9CNikV5vNbuUuLjFWXBGOMoHRELikHHZAgb1eqA80PmbLiJySTqKBk0aTelULaqZW0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734711006; c=relaxed/simple;
	bh=GOUt3sGxqGWXJGA5CSz23nXVi0yoyHapXPqwKAlvuII=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EkKNMOzWxPy0xsxFO4MfO3uHQfo5/qXwp6jTuTYJQZGopMMN6Bqg1Rtsp3f6m9uspdINH64aoXTWVlVwXIm2dVyph/WbP9U1KPUOx0HHsgve0U29SCUnH31W0pDrdeJcktdBKGWAUt0F+LhNfzNFHGIi/6yEX78h3DRX/VuEWds=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=mR7e2UD2; arc=fail smtp.client-ip=40.107.102.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="mR7e2UD2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=paE1/zqY3U1eVX/AMaM2qzWExeOdzSfstRjzgHYHTa5Y02+nAbnF2srtJrbuAvrSNtpd7nbqH5suxc9oiEFuKGQCJMcltQNMxULO3tyJWpsAh9JFYad+NTf+Xt6a1tvx79eOnsFQfoClEBktqe3kkqsWFmi9r2hqn5i1B5z48a4xcnOWPksM5baflYD220mf9BRnFKk7ToiMc/AwJl4ots6EGogmmwtEPA8i2FRTpRCPTSSrJ99OnFV5ZxK/EsRD3OzoiIO7oApSlTmiGkDPh6dej29UMetU78UCG64LfVIaVdGchedh2/qeAEp92RGMrWO69r2vkNc0ysAryJS+rA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rwiQ2vIixJDMpNZ44A6f5yeNelfD8ginwIPIwuoBquk=;
 b=grVufeA+nnnYP93FGIOeeypwCfJ7e7LxDoFSlRlb2YGUF2HpRpPwz1m0UEkZQgv1WEq1UN+Zv6JSDgMIRDzoLeLpUMkSWfKWXfQX6jHnPWfY6xdbq5+RCjiuExNbCNISOhvh9CuQEGnqgHshKfoyqUqY8kXh59bxoEyiTKcxRrG9SYINAzfAp31SOneVSzK98ylOTxoVzgWUGDtX9/UvHzBLk0tOoG2xUE+6VuQqZAAizwwmV+CYDDl0hJx1jPUFXKmEx2RaDQioEgogovso5dpkMaSMXU6qMPqPbk+CKtxAaokvNRAXmMkL2jSEsUDuX8KWtNgGjMjElk/nm95Zxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rwiQ2vIixJDMpNZ44A6f5yeNelfD8ginwIPIwuoBquk=;
 b=mR7e2UD2gYeM67Q0um3JPFkKVrutCnKItGz3XRg2L0tjIsex4Stz0rgxExbfRbga9A97FfvlKiOScmrKxl8ze7TBC5RV1Ww1NydBrMCBveIPIeiDBeTlF81azxbjCgNB+8ShegFUPryZeWZueiJv2+dBthWmXV8O/4R9oyWgOcw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SJ0PR12MB6757.namprd12.prod.outlook.com (2603:10b6:a03:449::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.16; Fri, 20 Dec
 2024 16:10:02 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 16:10:02 +0000
Message-ID: <d1b79835-f24b-4a37-9e11-60a9834ad98b@amd.com>
Date: Fri, 20 Dec 2024 10:09:56 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 11/24] x86/resctrl: Remove MSR reading of event
 configuration value
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
 <123e82c551444762300a483aa3fa687b70a0ba7f.1734034524.git.babu.moger@amd.com>
 <aa3e7a8c-3145-4358-96e8-bc2f3cc2b4f5@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <aa3e7a8c-3145-4358-96e8-bc2f3cc2b4f5@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0112.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::25) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SJ0PR12MB6757:EE_
X-MS-Office365-Filtering-Correlation-Id: ffdad628-28a4-423d-8f24-08dd2110c229
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDRJMFhHZ3FJQ2xXaEthdTdzTGpZRmE5NW1RMmVJRHpKcEVwVytwYUI3SVlT?=
 =?utf-8?B?aHhUenNpVXZUWlZwVktITXRQZzluYzNjMFZqOXNqcndPVE1BT29HMnFQVXdX?=
 =?utf-8?B?WTJsTWZrY2RzNjhPcFdtckNYRVQ5dklzNXJ5dVJRU0VYZ3FKQzdENTgyYWNm?=
 =?utf-8?B?TTU5dFV0MWxKMnZZZ2VGK281NTBlN1Mwck43OGZEdVZpRm40SFBRalJBeTFG?=
 =?utf-8?B?U0pwNDliamgyYUNmd0lxSEd2MVFCU2M3dFBsOHNrUVo2UVllYVRSNWRBcW11?=
 =?utf-8?B?cEYzRUJpUTdQaEo1VW5UYm1iOWtaSXp2bEVZS1NwV3hoTFVTRnEzN2doU0NC?=
 =?utf-8?B?ZUNmRWxHQVAxeTBSSDJPVEsySXZTa2EyNHNLcjJTelZwZzZ2eE1YMnc4Wmo5?=
 =?utf-8?B?YjVEY3pIbjVLQ1pXTFNpK2NsemhhdWorRlVIQmRabTVKMDJhYW8wUjFlU3Zp?=
 =?utf-8?B?SnEwVjVGbWd0MWxidWwzZTRZRVI3K0hGUWtkOTVKb2pCWndEcGpCZEJ3RU9Q?=
 =?utf-8?B?TExEUVYvVkxNMVVudmdGVE9DSWczRy9hSE1VNUR4RVZNYktIaHdJN1IvR1c4?=
 =?utf-8?B?UzhJeDVhRTg0K2h5VjZnTzZPWWhXQllkZnhtNGtqRTZTci85RHIwNTJlaUhm?=
 =?utf-8?B?NXBYdHN3SXlRbi9wbzhuaXNFeHhJSEhlUGxFdk13N1NZRzFtUURpZGsxelhM?=
 =?utf-8?B?cDAraVBmMFZ3SldpQ2cydUdLY0xaZVR5QWFYTmNEcW5YUm9jcG9waDdtdHpD?=
 =?utf-8?B?NkhGNml5dXZHakRCNlliK21wdWhCK1Y2NjBLY2d1RGNreUdYTlNib1hkRnRC?=
 =?utf-8?B?cU1mN2NIOCtVQkJyQXJ0OEFObG43M0NhSGMvUk1tcGlLbjR0aWNwRjVDekNs?=
 =?utf-8?B?bU1lbllLSFdsSEcyZ2htK01FMXdIN1had0d6b1JTMFM4UzlmekFNeks0UGZx?=
 =?utf-8?B?a0EvYmRDVWd3Mkt3TVdyN0JMSS90c2FJNnJZQ3JMYnArZXNUaU5NUzZHNlBT?=
 =?utf-8?B?WlloenB0OVA1M1BxQWg1aEtiazI4eGRtR2xFcVFMQit3NElaczViQnB2Unl0?=
 =?utf-8?B?ZDN2RGJnK2NuL01hNFJLaEZWRFJwNTh6SXpFRVFVKzJrMk9keWQxby9vcEh3?=
 =?utf-8?B?Q1V3QUFLbUhuVHZBc2lRM1k1RktRelJNSVFFTkpUK1BMMnZNeVJyMVE2UHlK?=
 =?utf-8?B?M1FiRjVYVnRZWXhzQ1ZnV3pEN3JUZWtiUFFjbWVvaitBUzBLc09LZXNxVmoy?=
 =?utf-8?B?byt2Y1lmR1BvcktLU3oxbmVrdmR2NGg0ZGpGL2xwb3ZlSURvWGkrNS9RTXY5?=
 =?utf-8?B?Vm5JTEROOCtzS3FGVnBiTVhwMmVTUXEzN1d6TjM2aEJ1N0xoUFl5elFYQUJs?=
 =?utf-8?B?cHpmWEF0ei9nT09BN2ZxTlVPTE8wd3phZUlXRGpiZ0FjVHdOSzdNOThkTmVG?=
 =?utf-8?B?TUs5QldwK1l0cGN3ZlVXb3RYbWJjaDF4WDRZeVRuSGhZelBvdFp1alNNdHBL?=
 =?utf-8?B?RzBNUXRwTVpLc1hLZzkyQWVJQ1NrVFlDanNUOHdFNDRWZ29iVGNkWXhpWDc0?=
 =?utf-8?B?VVM2Zk4rcVR4WVNUNGIwaXAwWCsvdk9xdE5uMTMxclhjTSs5cVlvbWkzQkdH?=
 =?utf-8?B?QWVUbkpIdmNDRGJFUjN2d0UzbW1VOW4xRldtdWlXZUtmKzIzMCsyWGt5VGJs?=
 =?utf-8?B?NFVlZzZyRHBoYW9aVHZIWDNiQmM3dThWRkQ0cDQ3SElEcmtGNmpqbVNKWnJF?=
 =?utf-8?B?ajlFVDc3Mm51eTlCOUhuUUtacFhENCtycEpCWWhDMlZLazkzZy9rcURMZ0dR?=
 =?utf-8?B?LytnVjY0em5xaGx4ZUN2YnliRHh4SFMrOTNadWd4c2dycEo4MWpYdlprZUlP?=
 =?utf-8?Q?GUEjP1rzl8zv4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?N3FTV2pzZWxYYzgvWTNLcURBdGoxNnUrRGNIU1JVUS80KzNwbWtsSzR2M210?=
 =?utf-8?B?d1ZGL05CSzVOQUF5YmJQZFJocVdFblJWNmd3b0hkQWtxSFZpL2dzNkNmTkE3?=
 =?utf-8?B?a2gyeS9IZnRvd0FHbFpaRVpRSEVhSFJKZFk3TEZWcUpGZWhaWFE1N3NRZU4r?=
 =?utf-8?B?MUx3c3JtS0hYQmNWaGlINzBmNmFOMFBrZS9pRmdPNFNCMXRUZFU1NHFvVGNM?=
 =?utf-8?B?VXRZTENjWkRYTFY3ck9QSzlCRlhqa09YMzYxN3JiU0dUTFNNUXI2czdyYlRo?=
 =?utf-8?B?a0dSamFqUXFHKzdiaFNGKzRMRGYvdU1ZTzJJTWIrSHQxS3o1RXEyTDZMZWVI?=
 =?utf-8?B?dFcyQnd6UkFCV29FN2t2aFJxVkd1dEwxOStrMnlta3IwVmJ2M2Z2QWdnTnhK?=
 =?utf-8?B?eFcrVDQ2NzBUNlRGdXpqM2sxbW5pelVKQ3FtZStXVWxIVXRvaytPQnhuSzhq?=
 =?utf-8?B?bkNHcUQyQ25vUjUrclREMkJ4TGpTNmxJNFozNkNJK1A2NUdTYkRHcnI5MFdk?=
 =?utf-8?B?UVM1TE5TSXB0NWl6WVFIZ0c2d0s4OHozMFNZdlBCN3AwdCsya1FnLzdWZlZy?=
 =?utf-8?B?em5MeXR4WEZqQ2h1WjgxZHpLajZBdGhLWXNPU1JiT0lKRHFlK01YN3lDbFdE?=
 =?utf-8?B?UGVEcEtpL0pnMC9jZmZGSzE4WFpES2xqc3JmTEs4cXRlZG0wV3VLMmRpWUZM?=
 =?utf-8?B?M1crUis4L2pFZEFLV2t6MXRMSWsxOVA4bFJlYXRHQjNoMVRrYXM1NGpkcS9s?=
 =?utf-8?B?YWswOU5KQVlCNGd2VWhMK1U5NFZYZ2pEWGRnVTdHemNMcUEzUTZLUE81b0Zm?=
 =?utf-8?B?VmJzTW10OGxKazgzRTQ3Q0UzWk1DZm5pWjNLdnhhM2hRdVNUcDRGOTI2ckwv?=
 =?utf-8?B?czlUSnF6T3hhdmZWUjUzSGZXTW5seVMwNWIyQWVVZGJtTjBPczR4WGtUajhL?=
 =?utf-8?B?bzNrT0hKdDdXM1pjWURiV3BrR2RWQ0VOSWpGc2VTSXZJTFM2MklpTGczS2FB?=
 =?utf-8?B?MlkyUVY2SGxLMWZIcWJKazIzSUNSTWZSUW1FRlhNZzJXOWdkWGdWMkgvZndt?=
 =?utf-8?B?TWlkVDhjSHRua0pxZFNEM0hXdExWMTc2QmxOdEdPd3BHL1NnaEpUTVVGYTAz?=
 =?utf-8?B?a0FwMmJPbXkyWmRvQ01JZTJrSG9CYjdWTEN1aGN5ZUs5THZRRDI4djg1R0tO?=
 =?utf-8?B?WVdaYmFsRmxGQnF4VkV6MUdjR0pFalczVDF0UHBiaHNPNk4rN0wrSTIwcnRj?=
 =?utf-8?B?K09OTUdXQlZyZXlFdkZMeDMxU3RzQUpQOHNkNXhGUy9Qdnk5ZzByQk1ObFdo?=
 =?utf-8?B?ZG5qMVQxL1Y3RzBiYSs5VFZYOG15TWEyL3JXeGE1b2FYeUgrTVFPNXVXSDAv?=
 =?utf-8?B?eEVUMlloYlpVOVpocWpaTTZ0c1M0S2Z4c0czekJucnpuSGh5d1FiRHAvRGhu?=
 =?utf-8?B?KytORzVqNXl3WWdiYzhHbURzTVNkZGJIaDczd0tsSXlWYVlBWjhBOGZCR013?=
 =?utf-8?B?ZUlrUjJoeG5ESG53TXhuNmNyeVZyc2RKMjJZd3VsNmFCVzJIUVdGd1U3d0hy?=
 =?utf-8?B?bmNwODRhY2dXVTFHYzlmYUdmd1ZlZVNhaUlJUFRTN2xISkZjRFZ6QWhsSXRx?=
 =?utf-8?B?QVUzZnUrTUJQbFBKWmRERDYzdlJBOTE4L3gzelUzQzczc0RWTlkxVTY3eGJK?=
 =?utf-8?B?ZTdnNGR2d2VaUkVNZEc3WGpXK1pJa0FmVXV0T1VRZHhmOTQ0cWFaQUlOVHNS?=
 =?utf-8?B?S0tYd2NjdXlBdThWM0s2MTkvQ3NFUEhXd0wvNEhzM1hVbXNkV0Z6eU54OUNy?=
 =?utf-8?B?ZTV1SkZGRDJzcFVlZWx1K1hVMHExOGxOV0IvRWMrZEVyYWxybDlFMGVIWUZ0?=
 =?utf-8?B?TVIvelBXTGVIcVc2OFEzV2taTVNtdDU0aTdYaG5lT3JKVHAzeG9WUFNSNml0?=
 =?utf-8?B?cTl5MWVCaTd1c1JPY2Q4VUQvYUlCUUJIQ24vV3B1M1VoSkhaR3hUUHJ5Qklv?=
 =?utf-8?B?WTNqOUlyOWZKNUY4emMvVDdVci9pdUpiaWsvZGZieU5xUjVXZUcrcGlpdUhL?=
 =?utf-8?B?M3FEczFEVFAvdmhGSW1lRFVqbmM5aTdKd0s1NDFOajhZVXY2a21rNHhUTE9T?=
 =?utf-8?Q?yuOk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ffdad628-28a4-423d-8f24-08dd2110c229
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 16:10:01.8575
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8FBmR+sts4ZT948Zy7Q7z6IbIVH+e2CDURdATT5tP8xL3UEY3hjPUkPjqcUeb/D6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6757

Hi Reinette,

On 12/19/2024 4:12 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
> 
>> @@ -1604,33 +1645,11 @@ unsigned int mon_event_config_index_get(u32 evtid)
>>   	}
>>   }
>>   
>> -static void mon_event_config_read(void *info)
>> -{
>> -	struct mon_config_info *mon_info = info;
>> -	unsigned int index;
>> -	u64 msrval;
>> -
>> -	index = mon_event_config_index_get(mon_info->evtid);
>> -	if (index == INVALID_CONFIG_INDEX) {
>> -		pr_warn_once("Invalid event id %d\n", mon_info->evtid);
>> -		return;
>> -	}
>> -	rdmsrl(MSR_IA32_EVT_CFG_BASE + index, msrval);
>> -
>> -	/* Report only the valid event configuration bits */
>> -	mon_info->mon_config = msrval & MAX_EVT_CONFIG_BITS;
>> -}
>> -
>> -static void mondata_config_read(struct rdt_mon_domain *d, struct mon_config_info *mon_info)
>> -{
>> -	smp_call_function_any(&d->hdr.cpu_mask, mon_event_config_read, mon_info, 1);
>> -}
>> -
>>   static int mbm_config_show(struct seq_file *s, struct rdt_resource *r, u32 evtid)
>>   {
>> -	struct mon_config_info mon_info;
>>   	struct rdt_mon_domain *dom;
>>   	bool sep = false;
>> +	u32 val;
> 
> Could this variable name be more descriptive? For example, mon_config, or config_val as
> used in mbm_config_write_domain()?

Will change it to config_val.

> 
> ...
> 
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index f11d6fdfd977..c8ab3d7a0dab 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -118,6 +118,18 @@ struct rdt_mon_domain {
>>   	int				cqm_work_cpu;
>>   };
>>   
>> +/**
>> + * struct mon_config_info - Monitoring event configuratiin details
> 
> configuratiin -> configuration

Sure.

> 
> ... but actually, the motivation for moving this struct here was
> to make it available for an arch to interpret the data passed
> via resctrl_arch_mon_event_config_set(). This patch passes data
> in this struct but a later patch modifies
> resctrl_arch_mon_event_config_set() to not use struct anymore ...
> and then leaves struct mon_config_info here.
> 
> Even so, considering Boris's preference this is no longer needed.

ok. I will move the "struct mon_config_info" definition where it is 
used(rdtgroup.c).

> 
>> + * @d:			Domain for the event
>> + * @evtid:		Event type
>> + * @mon_config:		Event configuration value
>> + */
>> +struct mon_config_info {
>> +	struct rdt_mon_domain *d;
>> +	enum resctrl_event_id evtid;
>> +	u32 mon_config;
>> +};
>> +
>>   /**
>>    * struct resctrl_cache - Cache allocation related data
>>    * @cbm_len:		Length of the cache bit mask
>> @@ -352,6 +364,10 @@ void resctrl_arch_reset_rmid(struct rdt_resource *r, struct rdt_mon_domain *d,
>>    */
>>   void resctrl_arch_reset_rmid_all(struct rdt_resource *r, struct rdt_mon_domain *d);
>>   
>> +void resctrl_arch_mon_event_config_set(void *info);
>> +u32 resctrl_arch_mon_event_config_get(struct rdt_mon_domain *d,
>> +				      enum resctrl_event_id eventid);
>> +
> 
> Please move to internal header file instead and consider this for
> all changes to include/linux/resctrl.h

Sure. Thanks

Babu

