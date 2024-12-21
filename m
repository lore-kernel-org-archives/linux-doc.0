Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2082.outbound.protection.outlook.com [40.107.243.82])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3FA1BCA0F;
	Sat, 21 Dec 2024 15:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.82
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734794948; cv=fail; b=NeZI0A572dg5E+MgppVsnDFIHIyfUCaBTn2HmXfLgww+fPzwsNQIPshxgq3r1z+JJ23mL4l3dnvO1YVyH2ih1SSax706szBRJOLdTVFYSiL6Yrx9nW53myAkMpnIAa6gjCiitCfkVe/7OB9WRZaUbqJVt6Yrc2Hazjs/otyE24k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734794948; c=relaxed/simple;
	bh=NkDzbvzGvPGSP8szpwVvPfky6Lx2XG3kanRmFQxp2rE=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=kB3+9MmLRfxsMTZhEwRIgo5Fh94CV38JL0mWT5KNx9whhWDex7+ZFxH+2igcv/DBjh6SqpZ9pvXTrD+8V3rX2YHcOOX9pzuLo/4x2bOGy4eKQANpVIFAqEPtRmPQ1YtAo7/U3wRXgFOTWx0Ezwa1kjx6ukYnWUZwrnKWJpAfj8c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=fDKOAie4; arc=fail smtp.client-ip=40.107.243.82
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="fDKOAie4"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Zk0TOSiSZp17YuVtGccB9rsgsrfYEvjeYFIB203QVgkIEn+oBIeeLhNagln2g51lO1iWm9/MWrFL7UpvUr1ytTiMHu00dDlpFMu1Es2/jo32XJKMuCPxNXN59Z5dmCDat42KiQYtEzRHHhJcM8gAkQew3ioBECAdyNIAwBqrCNUyESRtQ78FwvlZWFUPWtalDVB2pOJ34dyB2BCfV6yWkMewEZucg2CJsq2CInI0/++zFtpbvBm/Yvc5IUyOBtw0GtsHRxcuzjyvds/i1IYzE3PU3QxcuyrlLsnhD+Jc+zmgAzklfPDKA85F0skzqb9itfCc4xVWYSFw/7CGo12cPQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Uh/aocUqCy9I36c+n3kc6SNXzQTBUBnDEsJmoh3tFzo=;
 b=W7W+33tgxqk1d4usStQBr70F5bYdSYDLw64VYm31YAgmjZ6yu6QB7hC0xfuOAhPb57D8/TzEFwCnCcDaRZwdvDGw5jVvPBQrW7FX8IM6D+8hQGRo3lgrE2Ow/pgWA5gdH8CQ5bDEPyG3OMHCIoQAiSZQhFAVku/Kjjryw2be/UfXMitTdiE3kfR+YF16UBq58EvAPZinCgWp+7ZVIOzBlYNRL67UwVj9uYLkMPHo2Br+IqDj+zDcJKAb6QiVOoeFzMhJrdxMXcIRmeg4wdY2pd108FDCLIkBESd8J1Z1UUUlv3HMcy6194dAJcLKtG5uBlfHyTye6aB4ZWsKbJVA0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Uh/aocUqCy9I36c+n3kc6SNXzQTBUBnDEsJmoh3tFzo=;
 b=fDKOAie4rut887ammrwQ9QZIy4HH478cQ+1ZC3A5YT17wQQjqWzl0qUiWUSHWra6YFou2tOXtdpI0v5xttjyPvAQdEHkSh+PwczwxX1LJQvZ0Ay7aJRWpsQjKwO5pe2v+t274g++UFVFDw+im3qaiSZmdL5vtjbX4kSukiYAc+4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB7316.namprd12.prod.outlook.com (2603:10b6:930:50::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Sat, 21 Dec
 2024 15:28:59 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 15:28:59 +0000
Message-ID: <d5e40586-909b-44f2-ad37-e138b3328015@amd.com>
Date: Sat, 21 Dec 2024 09:28:54 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 24/24] x86/resctrl: Introduce interface to modify
 assignment states of the groups
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
 <2da72f1a57beb1f3de5cb2bdeda2269bdade8c76.1734034524.git.babu.moger@amd.com>
 <a14c9534-6176-4459-af24-9668d35abcd3@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <a14c9534-6176-4459-af24-9668d35abcd3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0160.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::6) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB7316:EE_
X-MS-Office365-Filtering-Correlation-Id: 33d59675-9bc0-476a-5de1-08dd21d4309d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?c3cwbUFMMWFZTjBWc0RiMXFrMCtLQXltaVZyeWI4VXZwTWtXSll6NkNxaEwy?=
 =?utf-8?B?TkVDNmFKenIxcllaaTE1am9JYStLWUZNbFN2Ukl4b0hKYmk5dXYvTS9VNHM1?=
 =?utf-8?B?Q1NaRm52U3FvSUxXUjlQbEV2OEhtdUFSNGNiWjlEdWRDQVZWRWJ1cEpJSkF0?=
 =?utf-8?B?YUhTdlVTRzh1S05nRDFxTU0zeWR5UXgwcnFnU2c1eWJjemxPNStoMDROejlq?=
 =?utf-8?B?bUQ1Y3ZTWTgxN01KS0hUUzY4L0xRcWtqZ0w0MWRtakhsazNBNmk4N2FMTkxl?=
 =?utf-8?B?ZzF4NThyQUl4NTRrOXJzTW1QRE0zN21ybThySGdCcUFCcmJTK3RsZ21vSEZt?=
 =?utf-8?B?N3daNFVjUFFNTlpaYkluUXVEWDZ5ajNQY245SDZUbXFzeFlFd3B2YmxnaWxN?=
 =?utf-8?B?MDZNSWFGTWZLUFlzeEgyTVYxZmJ0eXpoektqcEd1dGxmOEN5eDBDZzQrNy9F?=
 =?utf-8?B?TWVaY3h6dzJTaHluS1doZjZFOS8vcmo0SVJuZDdGZGlyNVRkOEJuTFBQVXpn?=
 =?utf-8?B?b1J2VWQxNHVBY0FyOW5wMDU4cFByY0k4WVM5Q2lrM005bFllRVpmejJ3TzRo?=
 =?utf-8?B?UElRZkthM2Yrd3IrTnVyY3c5RHBNU2xrbW9WT2ZOb1dXMnZodmFWM1JjMUtH?=
 =?utf-8?B?ZGJjUUZ6UnAvWVh3Q21YMGR0WkM1Q3o2U3RucVdyQ2xiMzUwdlJ0N3ZFbkxZ?=
 =?utf-8?B?c1RZYXcvSUtDUnlHUEVMc2dBMlg1RWVQam4wbWJkb2F2aUdaOXNnZ09TTHhW?=
 =?utf-8?B?TkNXalpUZ1hORXp1TGVjQU5XeFdTQkVBd2JlLy9hdDFlVWNwaERyNmMreVA0?=
 =?utf-8?B?VUE5QTBKRytTUlM5bkp6djZjZHY3ejdzbE9neTB5Yzd2RXhHNUF1ZlkxRXVp?=
 =?utf-8?B?L083SGlGQ1RibTJJcXJIT3lKWnR3ZUJwNW0rNTBBMkt1TitoRVNQdWhnQ2tM?=
 =?utf-8?B?cENtSUxwVTBWbzFtQjZnbHYyaWFsWkNKdEt3K2J4QlhwNjdxc29WVEkyS0Zv?=
 =?utf-8?B?eW9DT3hOSUNWUEpmNkFsK0JvUEZlNm9LTEFXQTdBS0dna3RVWDZRTElRMVU2?=
 =?utf-8?B?SVlvMTd1MHlJOFZWSTJXTTlvMkZjd0dqa0IrdW14clQzQXNQOFFwSEtoM294?=
 =?utf-8?B?YXZ6cU1meC9ESGV1WTdBVHZxeDJ5dHdPbzIxTm9QKzlidjljYngyUndMcTZW?=
 =?utf-8?B?eDduSjNNamppSGxIbnFFa3NYbzg3Z0lhMmZBeXdEYTRWVGtldjhmc0hMSnVT?=
 =?utf-8?B?NGxhd3p4c24rNUhscmZkcEI0VmlJd1A0dmZGSlpMSnJPV2RKemphN3VIdmdp?=
 =?utf-8?B?bEN4ckhJc0o1bkRtMGtiWVN1cWJKSTI1RjlPeXJWb0gvdU43T09IK3lDR1ha?=
 =?utf-8?B?Y1Z0aGNNVk1Eem00OStDT083blR1cDA1NlZzenFrNW45amNHMFJ4SmpLdzV3?=
 =?utf-8?B?YndwVzdQVWc1ZC9mTDFuSHJsNGJOUDczL2hZS0RBUnI5VmJTODFiRjBpSjk5?=
 =?utf-8?B?TVNCbkoycjVVM3o3MGZIa1FiMEtBbjgrM2Jwb2dYUFYrSDVZTGRUZVRvVEp5?=
 =?utf-8?B?ZEtmdFZhdGJZMW52WFdSTU8reW16YmJha29ZS0tkR0d3U3hYSW9JZWRndzlx?=
 =?utf-8?B?MG1uczJ6bGFlM2xiUTVpQ01PNFJBTVpBYlFCYWxsaFVreXVxMDMrVnN1aktz?=
 =?utf-8?B?ayttWXBpYnFyeWdORWs0SGEvSmNsd1JSVnFaczVOU0FLUVVpNnVSU1UrMUxK?=
 =?utf-8?B?ZmM0MHNBSXhSNGNQclNId0kwMGdHK0ZKVFlSM1V4a2hVM2pUSnBuQ1ZFT0FJ?=
 =?utf-8?B?ODlGT3dVOXZkT1hEeUc1OWJXdHJnQlRwb1NkYXRXcG5Lb2dldVJxd3NiRmIz?=
 =?utf-8?Q?9pDOAM3l6fq4l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?d3BhRGM5bkxUMTJWNzJtT2pnbThEUTZSYW8wOEpQNG51Z0VEUUlWVmpOc0Za?=
 =?utf-8?B?UzJ4bUV4UXZkTzhvcytYcTVPTnJrbXJaS1A5Y2p2dWFjUFVHTWRiaVhmN1ZY?=
 =?utf-8?B?ZkEvOEpKZDFHRmdkTlB1QXEvNXo1VXJYOEZ0ay9COTlyUjN1SEZOS1oxRWhO?=
 =?utf-8?B?UklLRHBmMldXRzFRMlpaY0FOOUxYekRYTUtoNlBOWEJERHpDN2dNUjZlN21I?=
 =?utf-8?B?N3VLeEdiQ3lMWGVFREZoVVI3OW1pVTdmaFFUSVhVVVhhTWQrL0sxZGZYbUhN?=
 =?utf-8?B?ZldMZyt5djNqeHVYdmx3UmtMWjE3WmFmWk9kRUJ6RUY2OThHZ3NDR0hzRGRo?=
 =?utf-8?B?cFdDTDhYTFc3TTNBQzdreUZrRHNlT25rRnVXMzlnOEJodkpWZzNQMUltcThQ?=
 =?utf-8?B?bzR4a2Zja3BZOWxVYUJ5V0xhY3dEejdaTDFRUjFTajZoVko2Sk1Td3hqcUEx?=
 =?utf-8?B?RFJxTFZRT3lVMWtYRk9mZ2lHVkpPL0RtRmpOSWRCdXlqYXhGMlJCNWlzVU84?=
 =?utf-8?B?eDhKU2g1eVdiMHJqdkp2TVE4WlUvb0R3cUxOQ29pWjIvWWhrMWZuMVFaRHVD?=
 =?utf-8?B?eGZST0F2dS9qTWNyWHRDQW4yQnBiQ045ZmtwMzl0NUoyVG0vdlB4ZmZTaGhi?=
 =?utf-8?B?bk5NeFk0WHR4RHRFMkp6YVhGY0R4eUJhUzRXWk0yQjdmVElOQmFPUVM2Q1cz?=
 =?utf-8?B?QzhLajRaWGFmYWNWK3VxTGpOUGhZWlFicTZ5YTQ3OEtTTG13OGt5ZXpEUEds?=
 =?utf-8?B?NkJjZ3JhZ2IybldKQXFleHd4NndqbXhIQllRa3VpYkZGVnp2RkdFNEhhelYy?=
 =?utf-8?B?bVd4dXFrSDQySHJXaVdTellIMjczUGVjSTl4bXA1TWRYY1J3QXA1N3c5U25C?=
 =?utf-8?B?VVpIM1RiQklKREtWcTRLb1hjZmc1MEl3RnFOd2dHb2hJa3gxRzg5VWdjaHBS?=
 =?utf-8?B?NWRqSnJQNXhOdEdZM01EMGJjbkM4R2FhekZBaHFTOFVONWxyYmZiRDY5RFZq?=
 =?utf-8?B?TWR0ZzlDbHhacFZsNEwyYjczUy9CeFZTTVZ1M3UyQ3pXdTJ1eWY4cm9HSGFN?=
 =?utf-8?B?VmhGeENYaHdYbEJTNTh3cmxZZ3Eza215RE9WTDhFbXhCQkd4TS9rQTNzdDZp?=
 =?utf-8?B?RHBjOW5ubHpnNTU3MzRzVzAzZU1xdXRPemxvVGVSNm5PZVlUbWs4Ump6UTdY?=
 =?utf-8?B?R0ltMWt3Qk5VZS9yRWdEUEszd3MxMWtXMFowOGM1eGR0WnRLU2g1d1RhVkR5?=
 =?utf-8?B?ZkF2WW5nbEpvUzlCSWJzcnNWYnhZK2NwVkdtakVmNHpkckZJckc5MTJQUnll?=
 =?utf-8?B?YkRYNEJvWWNITFJaVlVhSjVhanpOVWRVT1NOTDAyZWpIRGtWS3Z3cnJTS1lw?=
 =?utf-8?B?MHFNL0o5UTM5b04weEI5WXlpSTNXVFlDSGJGUHBoYnF6Qmx5ZlJJTDhvYVlq?=
 =?utf-8?B?cmlLRzdXMWwrZ3E4M3kyaEJEd24yYVUvUG5XODVIaHVYaUg2clM4L1FKcDVS?=
 =?utf-8?B?dk5OOVB0UjVLd0ZqUWpHeHQ5Q2wyR1EvcXA2U3YxYkdXV1B4TCs1SkluWUtD?=
 =?utf-8?B?N1JhR0hRcXdxVWluckh0R1Qyb09aaXlYRytnWUJsK3Vlb2NHNVFpWUtpOFRX?=
 =?utf-8?B?OTVOSnpvaUsxK1kvZ1F6QitHakJIY2xIOUV6cWpkVTdHR0s0REhjNXQ4bGxk?=
 =?utf-8?B?OU0vQXBqZ2RjSGJpSTBnSFg0cXU2STU5eVJ1bHBvODJUaXY5V1AyWVRYajNV?=
 =?utf-8?B?d0FiY0ZGbTRHZGlubG1EWlV0ZXlKOFM0aVZHNmY5N3dlbWZBdit4eU5hRG9a?=
 =?utf-8?B?aXJELzdscDZQakFtZmJpSDVMQlgvZm9mRjdIVGFOWVhnVE9MMzRUS2h5MU1r?=
 =?utf-8?B?RzFpcWUzTC82Mzh6Qm9HT0x3UE9KKzBUcDZuRG51SDU4aVlZSnJjU0hWUGM0?=
 =?utf-8?B?NlB6c2VqNlB5UTFMbkZtWFlWTzBDeGhNNEJBcmN4c1ZyUVovRVl4b2hwRms5?=
 =?utf-8?B?aWRpajZ5MXk2Z2JkTlJHZjV4TjFLUnZBUXYrWlFwMTBHcUs1OEp3Tk1rSEVz?=
 =?utf-8?B?UEZURWo0ZGxuTUVpblR0SSttV0ljZ2R3VXdveWU0V0o2S2t4VEVvTDhWVUhY?=
 =?utf-8?Q?BwdEMTDnWZAOOl0uFnbkpsujJ?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33d59675-9bc0-476a-5de1-08dd21d4309d
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 15:28:59.0608
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O4a3QBQ8q4EeIIm0de5WwHV19yRPjup8Sv6sXRpyLiR/dmq722q2OWexSGmrLiad
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7316

Hi Reinette,

On 12/19/2024 9:23 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Introduce the interface to assign MBM events in mbm_cntr_assign mode.
> 
> Seems like something is missing ... there is no mention about what
> MBM events are assigned "to".

Sure. Will add some context.

> 
> ...
> 
>> +	if (assign_state & ASSIGN_LOCAL) {
>> +		ret = rdtgroup_assign_cntr_event(r, rdtgrp, d, QOS_L3_MBM_LOCAL_EVENT_ID);
>> +		if (ret)
>> +			goto out_fail;
>> +	}
>> +
>> +	goto next;
>> +
>> +out_fail:
>> +	sprintf(domain, d ? "%ld" : "*", dom_id);
>> +
> 
> The static checker I tried complains that dom_id can be used uninitialized.

Interesting.
dom_id can be uninitialized. That is why we have check "d ?"

unsigned long dom_id = 0;

This might help.

Thanks
Babu

