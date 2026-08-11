Received: from DM5PR21CU001.outbound.protection.outlook.com (mail-centralusazon11011018.outbound.protection.outlook.com [52.101.62.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 952DE395254;
	Tue, 11 Aug 2026 20:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.62.18
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786478610; cv=fail; b=euPaWD0dWvCaXkN1malW4KgfE3wBasygCybKFURr0Vh9L8hwuPmcZTsI9PoAj+qwgnvy6ayZrnsH8vBb7XAi7pCe+DQ4/hNeA0WUWtuNhh8hLZtM3+wuMAwiOjGTTUYi5aDBxsctfHRpmZQrAFBQbiGIURpCyLY+OOplOH419do=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786478610; c=relaxed/simple;
	bh=pGLQf2ZnRaO9Qj3SGUWakQK4kkFCJ6GkrR0O6+/pv14=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=JYxGQ31vwZTqtgyyTP9G3/ogPMM0O1oFGi8goDLlWmHEGHefWOCQDt/r/IbOG1hMfbJ9h3rAD6McJSncWqvJy7JwkFBRo+HoEyh7vPyEMH/Nho0UHAoe0V4BtBHL3Ypz6+dDNu/NV/F2KSnqyb/KcsdSBIXXqCVN8ORjUx6/L+Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=BlVCFs/I; arc=fail smtp.client-ip=52.101.62.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="BlVCFs/I"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=oH6bVzIuoFYaw5cxwkpmDVjYjuLGcQ0LSwBdTpgNUQScLoi91D0Srx1jYtPJQQZ6X1tIPKzAm+DlIvEZueGhyqC1jSMi/woEtVIE/FoWmAe20uCAV9/AzFUWt0PGaCog2oTt9IfHiNni4T0eZaNEsjgbwVbabeBHkcsG/WnVVGx9nDXFBC++RS8MVnMtpTv11WCoGgPs44htse4xAb9F7T01R94tp20lXrI0JV47SLwNfYl/ICuErPPEnRBgyRkNwt10RcSgwzqbum6IUFdSBk7p2MmYSVI5iYf0H/pPv0DTQxUwtSxYtIJQnNiVoTBzRRSxDX/xUbA47rrhjvvW5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5su+T85Ke3A2A2gMAAaw7pcLwy802Cd02bXz6YSNGhk=;
 b=Y9LkuyFjKh2iusK0+9Gz2RtpnOzfjmZIRp7H0HINBpoGKVD3xmqF2PAKBZTI0aLCbeEj8HquPuzgcoe6ZcDRz+AIk3ppH/WpKWbH8JSfhLrMRuRv6++GxtUI4bjFSDtgKCI2gGgmly9lSS0VLc4p/JqKjXNIoWGHarpWSZsJamMz7Ai7TaWdwlaJBH+Qep/JUY65txBPZARPczg9tJ177Nt7PQL5nqcop+/ipUvZYSh96WfveS/IXzZaTt8l/FLqU23R3QZZqtDNIokh6pfmS1vK8nuAAs8KsQHIa08VQFOK03fK5Bz20Bd+tZXO75oCiOF5yVpElNYekKncdsnOjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5su+T85Ke3A2A2gMAAaw7pcLwy802Cd02bXz6YSNGhk=;
 b=BlVCFs/IP306LhWRtwYXa6Kxuq6aEa8eOYWSKzJr79OwUkEDjuAut17TqnBUZkj0VLQqPMbjm3fu1a99De95NE1osJf0QOnMEinCUcA++6eqF9xpfV/tm60hhTDK8le3VVXET8kugNXApKXhnFu/JOzIuTytKcVjo/JKJbcMYl0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by MW4PR12MB7466.namprd12.prod.outlook.com (2603:10b6:303:212::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.11; Tue, 11 Aug
 2026 20:03:25 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0315.008; Tue, 11 Aug 2026
 20:03:23 +0000
Message-ID: <21503e4f-710a-429b-b6e4-957141d31fa1@amd.com>
Date: Tue, 11 Aug 2026 15:03:20 -0500
User-Agent: Mozilla Thunderbird
From: Babu Moger <babu.moger@amd.com>
Subject: Re: [RESEND PATCH v4 02/15] x86/resctrl: Add PLZA support to
 command-line options
To: Reinette Chatre <reinette.chatre@intel.com>, corbet@lwn.net,
 tony.luck@intel.com, Dave.Martin@arm.com, james.morse@arm.com,
 tglx@kernel.org, bp@alien8.de, ben.horgan@arm.com, fenghuay@nvidia.com
Cc: skhan@linuxfoundation.org, x86@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, akpm@linux-foundation.org,
 rdunlap@infradead.org, peterz@infradead.org, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 kuba@kernel.org, ebiggers@kernel.org, lirongqing@baidu.com,
 seanjc@google.com, nikunj@amd.com, xin@zytor.com,
 pawan.kumar.gupta@linux.intel.com, tiala@microsoft.com,
 chang.seok.bae@intel.com, kprateek.nayak@amd.com, prathyushi.nangia@amd.com,
 kim.phillips@amd.com, naveen@kernel.org, darwi@linutronix.de,
 elena.reshetova@intel.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, thomas.lendacky@amd.com, eranian@google.com,
 peternewman@google.com, qinyuntan@linux.alibaba.com
References: <cover.1783461016.git.babu.moger@amd.com>
 <d16019e92bef7c284aa69da7f7a36477c1623f0e.1783461016.git.babu.moger@amd.com>
 <d828905f-2194-4447-a1c2-7b604407bafb@intel.com>
Content-Language: en-US
In-Reply-To: <d828905f-2194-4447-a1c2-7b604407bafb@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0P223CA0020.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::10) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|MW4PR12MB7466:EE_
X-MS-Office365-Filtering-Correlation-Id: aaef6b46-3c1e-48a4-7c0a-08def7e3996f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|7416014|366016|23010399003|6133799003|10067099003|56012099006|11063799006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	3a+LPFFm4WAg6lSXyDCvzzOGcIqGt253Xtd0vke5/vSgMcW4GLSi6wgluG+4N6rRi5/SWPyoXuup13IOYiZfzbS9CI/KtDgs4IrGsECv6J7A4IPFr8reuTNK5kjSJl8NtoznBcl11Q6FCBaOGZPqdp3QHeksZt/9DQq3pN3h/crVGhwi/JHCztKuMCPOrm4psOuHFxFamkVFab8xUorEgNUKdBawFTdlas0qwfyEas68BNSAgXjJ9TI1NCCJyPQsI3QyNEN4mtPJIZF5ZZmSfbOTbSW+Oh8JM5Zue3YOqEgoQtBCY9q8TYEIV9p8t06st0KzgWrIunnHyZ3RS7mxKfY7EOB+sjr+IWre5ZpXC+s1bM8yB6Fvo1lj95lyiyhUZgxCsf6ze1uWHxO+1KrXQanwgwICg9PoWwA8WObEVu14Y/1NpuNSl1MkfL65UWxKa9O+oDfGmdiJJAWBaADRlQFNCf5/NSdnNL3kuBUh7viRX1HejpmOcqy7ioIfCDrTehJ99tb5JPbB5RbSv2iwskM56heDdqKUi/YJDt1KpQVnggpn32pCGOCYfGPqPudhHdCJ8q5A4W07JgaSx2mshSZrqbFn+0pdqRKDgeCCqBeGNX9tLkXbxLfBoHHTzHVqi9+3LVqmjHiueZM/dPxa11V4PNMzZwn09g2OZ1ELeqU=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016)(23010399003)(6133799003)(10067099003)(56012099006)(11063799006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SHdpb0dsWUJFUmU2QkVjUUtwSkMxby8xT1RnUkh2YzcwUGNDQ0VYTmxKL0dZ?=
 =?utf-8?B?d0JOMHU0VzNHbjVNS3Q0cHE3d2V5UVZtdWQrT1VNUE5JOUl1ZThyN1laQzFB?=
 =?utf-8?B?Wlh2WWpXQU0wcEFWSCtIekZ2UllISUlaeFZ1ckM2KzkremtzM2VlYWFYdWUw?=
 =?utf-8?B?ei9pYWFrOHdiaUZ2UFdYNk9JZlg3a1hBYlNaVVFuSUpleTVleWlBNWRYYmZy?=
 =?utf-8?B?bXZFZG9kM1VtejJxYkJhd3hVV3p5Z084Q1pUSDFXNUdEMHNDRE1UQUNGd3o1?=
 =?utf-8?B?dVJxVi80WE9tUTZpd3ZtaXc1VUR4bFJuQlVlU2wyYW43RmVXUDl2SlRRS3FF?=
 =?utf-8?B?N3daRi9QNFFHMDVqY2RGTSt6ZEprblBZdkhDM3J6c0grNkVkc2RZL01pZWV2?=
 =?utf-8?B?YjhrNGNTR0swVVdDTWR1MncrYU5YUk9MS1U0Uk54VmRzWlVyVHp2QW1BZ1hZ?=
 =?utf-8?B?VENxQlByaDlZR1V1Q054WllRaXIvQTFEazNXbmlmNXphRVIxeW9OQlAzYWU1?=
 =?utf-8?B?VzNMeENUN096WlRGQkt0NkNnSlI5c0FsTS9IN2R0dWd3Rm82MTRybHM0Y1Jh?=
 =?utf-8?B?RkFsdlJwU1ljV2wwTysrM0JWckFNR0VvMW5uRXFkNGpYNlpEM1pxbGpMRTMx?=
 =?utf-8?B?T3ovb1NEaklUUFRqQW9ESWpORHk1R0w0QlhPb2FqZ1NlRW1zSXBBV05yMWtR?=
 =?utf-8?B?K2ZqdVg4YUkwdEQwUXp2czVPcXR5Si9Denk2Smp4NFpyYzVDNXBBYkxYcURt?=
 =?utf-8?B?aGsxVmVlTS82cFJDM3p4WFhwcnp5ZjUxSzdCZjlHeStxK0JNcGNxM3RyRUJC?=
 =?utf-8?B?Z0ptRWFvcGFEcG9rc2lNMDVwS3Y5ckF1UXFnMWVNTGVNcys5TUtLTFIzeVkr?=
 =?utf-8?B?UXNCQ2tEU0lDS0R0cTVvbHJUemlMYmo1LzdvM2cxNVFoWGJXVitZRVdkcW1h?=
 =?utf-8?B?S1BvdFpTSmZJSWp3dVRMZVdxUlVUNy93TUhCWlV1SWpqY3dXNGhaVzd4YnVX?=
 =?utf-8?B?UUFzekVNcDJZN3ZIdW15ZFhKT0ttZE1mNTRMTTVnZS9qc0lJVmtFN2ZRcW5Y?=
 =?utf-8?B?eFpQYlkrYTd6Smp5UWZ0VE5UVW5iMHN1QS9WZWxzYzk0Q0lRYW11dW1FYjND?=
 =?utf-8?B?VCtaSGs0NTVTOVo3RGNuVFRMekZpQTZTbXZNRkQ3NGV2aDZIbWxQbmlneFRD?=
 =?utf-8?B?QkIxaDFEbGJNQUNFMGZ0ZW9DaDlRdHI3cURuSzk1YVg1YmMvZXdqZjZtSFZD?=
 =?utf-8?B?dlpQeit5SFZ3WE8xZXpzYWNYWkd2cnRnbS9qYjkvTDRpVnVTemdIOUlDc2E4?=
 =?utf-8?B?eGVOS0tTWDB5eHpoOCtYTE1TZUJpQlV5aEtJUnRFakpiQnprZlhvZVk5WTl2?=
 =?utf-8?B?V3oyQ1RGaDV1M1YwZmJEdUtoNEF1dzhBSG5uV1RJUGtRVUI5R3hzTXZIQmtL?=
 =?utf-8?B?cG9wMmRvMTNzMlpsb0tXa0NCWHFBUFRWVzQwVi9QS2xFV3NTK0xNc1pQUUdF?=
 =?utf-8?B?MnBqdytHdEtMNUxUeVpGdnR1a1ZYMk9VbEM3WWNRSE9Hb2VnNkI0bXI0TTVa?=
 =?utf-8?B?cXVqaXI1Ulp6UnZoUGx5c1BGa0QyQjBSa29jQllnQzVqcVBic1hVZW1JR2NU?=
 =?utf-8?B?S1hqMzBaekpJNDZrNzlrWVhwbTk5RVBvNHMvYWxCblVyRjR2a2xlU0taUVZK?=
 =?utf-8?B?OG01QVNGY2sxRnhEM1FpeXhaWlhsZkxlKzhiMExUT3JDZGN3M3J4TG1MTWtI?=
 =?utf-8?B?RGNRVWVabVFVOHlnRk8wY3UvSzlGWTV2TkRudkRxR2E0ZEwvWWNPWjRSN1JI?=
 =?utf-8?B?bEt4cXBwN0hkOFhoUjhQNkhQOVVIbUlQTzBoTFBxZnNsdmQxeStmZkJXVmV6?=
 =?utf-8?B?Umg2N0ZFaWluUHRnd3ZqVlRjZDA4MG1oaFpvRG9NTDlXajZRTERnbllXVURD?=
 =?utf-8?B?L1EyZDFqQWRsYlJkTnhWTWlLZkpvbzArOE1HcmpvUUZkVGc4MnpsQ3R4dFlM?=
 =?utf-8?B?SzEyVytobEVaK0RXQ0paWk5yNmp1VTk5UEpYVGVOenVUeVdXRDBqR1BVa1pI?=
 =?utf-8?B?RXdPU2dVK1I3KzgwQ2Mzejg4d3JlcC8xZzAwR2IwOTM2QjVvZWpBbEU0cG9a?=
 =?utf-8?B?dTdKUTZpemJ0c1lhaWFBakF3ZDk3Qk4xcnVZYXV5QTFVeElkWVM5QksraEtq?=
 =?utf-8?B?eFFILzl2N3dxR0IxM29PK1prUjQ0NWRod3FyTUdGM20yOEdQTUNZY1dXVGM2?=
 =?utf-8?B?a2I4ek9vMW5SS3kwVDhuY1NZdm0za09ZMkpsMzBISFVLNlVJOHlMaXNPeUUv?=
 =?utf-8?Q?xezbawZA3GOUDWj8NH?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aaef6b46-3c1e-48a4-7c0a-08def7e3996f
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 20:03:23.8664
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nqi/whVnRL3EzMrl294h3iQitpnKGDqIP9a7JD2NHeKGVpydNkERkfkg+5nVl6Jf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7466

Hi Reinette,

On 8/10/26 21:53, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/7/26 2:50 PM, Babu Moger wrote:
>> Add a kernel command-line parameter to enable or disable the exposure of
>> the PLZA (Privilege Level Zero Association) feature to resctrl.
>>
>> This allows administrators to control PLZA visibility at boot time via the
>> rdt= option (e.g. rdt=plza or rdt=!plza).
> 
> nit: Since this provides examples of the only two supported usages it may be helpful
> to make clear when these options are required since users should not need to always
> boot with rdt=plza to use this feature.
> 
Will add text:

On systems that support PLZA, resctrl exposes kernel-mode PLZA control
by default without requiring any explicit rdt= option. The rdt=!plza
parameter can be used to disable PLZA exposure to resctrl, while
rdt=plza explicitly enables it.

Thanks
Babu
