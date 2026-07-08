Received: from BL0PR03CU003.outbound.protection.outlook.com (mail-eastusazon11012044.outbound.protection.outlook.com [52.101.53.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6037A44CAEC;
	Wed,  8 Jul 2026 16:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.53.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783529741; cv=fail; b=MLZufvsSE21LttvrUcaps/q9EJpwzwC49QccQf1fWtug248GXk2SuPCrNcNUmDoTbeL5Uo/4GmEVWWWcVXosnbia9dZRA0QNuaKjs3PHh5Y9gI9Bs7V8bR7anjOdRTOht8WG677gOuddqyH/BaamJmJ/U9qkneasoPYUaQuvVx0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783529741; c=relaxed/simple;
	bh=fivOQLpso6RTfKPmKq+RyBLSHKioTXMS0si+gqKIfm0=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=OCkmWUFvbnL/D0cPtYldVUdU4q67Giv3HrKPX8Kl5ca1Nv+s8UgOVDzogQt17tO6rZ0aqpCsWd3KDiajO4E3Ix+FLncDKjkn50e6Wfg3UEoy8WreGQahVyb3xw1renbfWUN1UHbrGuuQfmopnpdTJW9tEfiJe5ST4oLAgkoq/U8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=UUN+1pmS; arc=fail smtp.client-ip=52.101.53.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="UUN+1pmS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cAXlBrLx08xapkGiGEKfYtkhLH2sSDBS/D8IaiaTAIz28G7qeN1rgpvgQEMiZgiU6pP6xCTfqVhC3542iqrg9S2ZTcNon+c4tFW5wHeTSDF8BShokIVvyYC1VF5lialOxwbVy9bh39IxH2Sg30ZaQZqFTggayCk9cyqvskH11mN5HxUppl00mZRWDl2yn8bWqFPLgQGIgGQm2pb74uUFV4+vZdsu+ceFL3AaC/cyzNQxkUQTjIFAqvCQ6Z2vC30bnW0+pQVOCdff4+zPTxA1BuM4/iuqu/G92CodlrW6PGVi3/2QV4JDfWfl0aOacuC1d71qOl0EZ8QnPZ+nDAK8wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zElE5wdKvc7Wmb/ozjBLNVTdncqZTwbfXLpiKssWaW0=;
 b=jTnjmsSeWhKanEXpSfG/ZsjtH1G9/5J5bgrVtxqrZxYeVn88Cx0rWx8bIIDlHZp9HIwruvR3qG1Y05ZjPwu45Cao+dzGiiOrRuXQ7cTli50mqGJ4y0y0elznMLBhO77ePEm31X9sLky1em9xU+sRQuQNohNSdMoDvEGxFmti8nOZfLabN+XDZKjYOyazK2idxGNABQJvILhU48aohxyjvVEBKU+hbQypet/zW+CpDy2io8Bz6bYqh3lu6TdjlYrgH8iLAGDM2XVEL3Zt4n7Br5i7LYKGS+idRPeLbNb13vfBtQzN05HcritBaEPRx8ZLLEKlqC/tihvOXwkS2HyQZQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zElE5wdKvc7Wmb/ozjBLNVTdncqZTwbfXLpiKssWaW0=;
 b=UUN+1pmSx5wPpocqOcrMdU3OfaaVSAkESZiO3UFAakF8lHf/TKoL4TKgnYHrldrDGeJYPqQ26aIo9iMzR74sdgL6Fn6fuxZ8e/SnaPteRzhgar6hy8TvYtEmkhe3GpkzwzAGn6FNCcDnRBRDgFrNFQlVTEI0qLZEEzri4Bzrm4s=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA0PR12MB8930.namprd12.prod.outlook.com (2603:10b6:208:481::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.181.10; Wed, 8 Jul
 2026 16:55:34 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0181.014; Wed, 8 Jul 2026
 16:55:34 +0000
Message-ID: <0af5122c-20df-4aea-8ab4-cba63f71dc3b@amd.com>
Date: Wed, 8 Jul 2026 11:55:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level Zero
 Association (PLZA)
To: corbet@lwn.net, tony.luck@intel.com, reinette.chatre@intel.com,
 Dave.Martin@arm.com, james.morse@arm.com, tglx@kernel.org, bp@alien8.de,
 ben.horgan@arm.com, fenghuay@nvidia.com
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
 <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7PR03CA0170.namprd03.prod.outlook.com
 (2603:10b6:5:3b2::25) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA0PR12MB8930:EE_
X-MS-Office365-Filtering-Correlation-Id: 354948c8-e764-4700-4bbd-08dedd11b9f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|23010399003|1800799024|366016|4143699003|6133799003|11063799006|56012099006|13003099007|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	lsqcpnU5q/uV96ixBKs/89oMiM+0DFhLHO63b5AYAxWMbOvjUUUSFPU9BKkb57NdegoH3OG8ApiNQYdSjhV98Mg2RObOMyxM0a9Y2V46XOH4s5xLHK7UNSyV2ntw+hQHYRvTM9QWodVqje/5gwkLYkgdq/k7TZaAyACJOcx3z9cXF9NZmAzoHzLCA0PB42eCjUeibVO4xdJ7hLwLG0vjhqKQi8rl1cfoX6m6scPylojY0/zagO8bdaUGDiV2Jl+lvRWg3JeARd69pzVT7xhIj8iR05g8GLilyZuwDxs7vD0SikCR1R+IdQZXhAO1PcVZtagz0l1Cdp71GcHOknNvtOq+1yXGGRgTz3tXpcsrrrr4AfQW7JR5O3juZXZNJCd9gqUR6dE0iC3X8sGYzNOyKdNp+2CaZnkMMIks/UbaNbB36ZJOb3hHNKs0w/0glEaucbttH63D9QeSfvuschhBmxliNdyQFDtc4bseLmUhOEqt0GudWYB3EYJOxmWBIrIJNYcbEH57uxlOUlnEJBEZZHFWniCZR7CvJv1c3NJcgNt0uEa5Dh9Zn5O0cNAfdcob1KP2tIT5nMvZnUIpZINlyiRnUqPLTarc6uUOZtHvtLuIGS9Oem3n5++4eOemz/VZaF9sjoxpgV+WCtNKEn8aUltN6FIhszfyMItGqehMgxo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(1800799024)(366016)(4143699003)(6133799003)(11063799006)(56012099006)(13003099007)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aHZVSkM1bVgxZDc2TUlZM25GZ3JPbndaaXlEeklQNzhrOXorcFRVYnRmSE1j?=
 =?utf-8?B?ekVXaFU0WTNlQWtjSXBNenlseHBTY1lTV0xpL05Yb3VGWmZ6WXA5SG1PUDBt?=
 =?utf-8?B?emRNR2hDWkRoRk1ySFNZSkE4dWUraUk2R1RGRTBrY2dtQndkejhsTVZZUXln?=
 =?utf-8?B?S1pzQkhNTjNUdmozRW8vRXBtNlkvRm0yRmhPdlJMRGZ2NTlLWE9hT3VGNVZn?=
 =?utf-8?B?bFFrN3ZuRzhoNFJMeVpWeFI5UEc2cWo1a3ZvdzBNMExzU1JMV3JEQk5pNnZC?=
 =?utf-8?B?elVhcDBBN1BhaTN4ZE56bFYrTGdrb05RUmxhU2tMQUNYR09ESmlQWVJSVW5q?=
 =?utf-8?B?RTZQQTlicnllY01TY1YxUG1hejVmREYyM09hOVNIYUtFN0FpQUNnZHZsbXZI?=
 =?utf-8?B?dUY0cnZEN0hNa2tHRnoyOUs1S3BUZFhFY0tQeW1Lbmg4SEFManhYQTFsUTA2?=
 =?utf-8?B?ZFFMK1dXZkZEbFh6WkFKM0FPc0VQc1ozd1RhaWlZMUJOV2RXT1JGeDdjZFUr?=
 =?utf-8?B?TkpuMlVPWm90RkZHcGozZVl3RHF1VVJBQzUyZk45MHIvVzlDZTJWYjhqMGJ4?=
 =?utf-8?B?cDRybXJtUi9KNDRIZXdmQ2V4ZzRINFZxeUpSRnN4ZzVNbmFUNnVsSVdySE1w?=
 =?utf-8?B?S3JnQVU2ZFNBZUs5RmFJWEpqS2J4bGhRUEZQUmJaeEdwZlpTelZIV1JOeHd0?=
 =?utf-8?B?TTBOaktjYm9VMWtFWGFmUHdSaExSSGV6RjltdUxOM1dGTUlqU0pBamFvT2NW?=
 =?utf-8?B?ZVFqL2thcTFBU0Rka2JzZGY3c1FIS0hrWGorK3drSGRlNzQ0d2toSWtDMCtm?=
 =?utf-8?B?SnNsWmo3MEpLWjRtK0lCdGxsS1BGRFBrM0QraGRVZVpXdE9vVzFtNFd4RG9H?=
 =?utf-8?B?SFBFMkRpQzVKQVErMGxTSjJsdkdLellQUmQrcnBlZFdSeEExVTAyZDlTdXlS?=
 =?utf-8?B?MHZFZ1lCTzRWak51SXR2Q1BubFoyYVNtTXJYMjI0WFNrcDFOWk14Z2xaZ3U1?=
 =?utf-8?B?bE8rUGlFdFV1QjdNK21xdTNjeDJ6byszTnN2eDZHYXpLV3dlU3BiZS9Kc0ow?=
 =?utf-8?B?Y2t6TlR6SERocFE3L2RYSnpaZFBFRzNxWm1lZmQ4SXNUYnU2WDdwcTBobG9l?=
 =?utf-8?B?UDBKZGVpaWZxSnVnWjZMUlNLbTRYV2VZdERFQkc5UjdOVDJGT29MM0diSTA3?=
 =?utf-8?B?SkhQWEFUbzN5L1pNQWgvZEZxNk4xcDQ4QjJzOWNoUXdvY1BXRVFTUlZxZjRn?=
 =?utf-8?B?SHUwTkdockdGZDgyUUxnVDBZQjBEWkt5eWxCRDdLa25QYmI4WFc4VWF1ckZm?=
 =?utf-8?B?M3NMSmlHWmJsUWVJM2duYnczTFRDRllLUmxzS21CQXpDU2FheWZoS25SQlJr?=
 =?utf-8?B?ellZeXl4YUdxckk4OWpoQTZTZDBMUU52Z251SjR3K1dzMGJteGhvU3R1M2Ns?=
 =?utf-8?B?ektEYlJFRU9kQ1NaU0M5R3ZxWHBhYXFIekhZY0xHTEFJN0F4U0U2RnlWTFpj?=
 =?utf-8?B?dkZoNCtRejFDc0Zid2w0YS82eUlYOGJqMzR6Nk1sa201VlZwdWIrZk5GN1hq?=
 =?utf-8?B?K0J2dWdxck03YWN3ai9vVjhxUGZnbmdEZmNQMW1MeE9QajlRc1JFRGNGY1cw?=
 =?utf-8?B?VjdCV0dvRTEwWTc1WHFSSGRBQ0VqOTN2M2hSY002akJUL1lxVVAzSERCa0Fm?=
 =?utf-8?B?eGg1V0RYYzdRNjNBY1k3SUdreWUrUURaTVBkdk01UHdZZFJ3MHozWXZMUERH?=
 =?utf-8?B?KzFEYUNVQjhYRVFIaXNvWUQ2cit4REt3RU1RYW1BMFJvYjNaeFF4RmFxVEZX?=
 =?utf-8?B?M0RIR1NIZitCc2lZNThRN3lPbjNuZjlrSFU5VXpnYzNvNnl4VWFpZjRidGFP?=
 =?utf-8?B?MEN3M2kxalU0YXRvYkFzZkRCcGVCN2tJaHNSeFEzUWhWRXZGTWVmZytoY0JP?=
 =?utf-8?B?dC96RUQwKzh3M3VENHQzQ1dzQVN4S1ZrU2Q3WGdwMDFjZVdmY2Uyb0lwc3BZ?=
 =?utf-8?B?b2RFaGpnMDkrelAyclJFWVhINzM0Vm9nRUVSWGdGc0d1QTFNa3VtTGlkTEtF?=
 =?utf-8?B?ZU8wcUovZXpjTXVOOGpHQWFoa1B2R0J5Si9WS2Njd1o2RjBoREdEdG1XSnhY?=
 =?utf-8?B?MHZZdEhVK1RDcWFOMnBmQ0JlZUVTaGMrZ0pCY3A0VHBRSHNINjI3aVFoVWND?=
 =?utf-8?B?S2VnTTlhQW93SlVrQ3UwYTFqdy9FdXNxblMvcU9QRGxCeFUrVEFsMWREcmNk?=
 =?utf-8?B?ci9pUXVaZ05yVmE4Q3BTeVR3YWV5STBrbTlHQzNXOXlTeTZDbmxhcGxHVFpo?=
 =?utf-8?Q?nkZ18KgdDHdPrn1UF1?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 354948c8-e764-4700-4bbd-08dedd11b9f4
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jul 2026 16:55:33.9236
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IxDX36lWapTn/0XrrzXsGnw8Y4FLj05cbkwDBAnWcsAMf2MpV+eqQwSZ+grhuZHN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8930



On 7/7/26 16:50, Babu Moger wrote:
> Customers have identified an issue while using the QoS resource control
> feature. If memory bandwidth associated with a CLOSID is aggressively
> throttled, and a task with that CLOSID moves into kernel mode, the kernel
> operations are also aggressively throttled. This can stall forward progress
> and eventually degrade overall system performance.
> 
> AMD hardware supports a feature Privilege Level Zero Association (PLZA),
> which allows the CPU's CLOSID association to be changed during the
> transition from user mode to kernel mode. This allows the kernel to run
> using a different CLOSID than user space, which can improve system
> performance in certain scenarios.
> 
> The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]:
> Privilege Level Zero Association (PLZA).
> 
> The PLZA feature details are documented in [1] available from [2].
> 
> [1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>      Publication # 69193 Revision: 1.00, Issue Date: March 2026
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Split the patch into 2. This patch only handles x86 changes.
>      Re-wrote the changelog along the ABMC changes.
> 
> v3: Code did not change. Patch order changed.
>      Added documentation link.
> 
> v2: Rebased on top of the latest tip.
> ---
>   arch/x86/include/asm/cpufeatures.h | 1 +
>   arch/x86/kernel/cpu/scattered.c    | 1 +
>   2 files changed, 2 insertions(+)
> 
> diff --git a/arch/x86/include/asm/cpufeatures.h b/arch/x86/include/asm/cpufeatures.h
> index 1b4a48bff18f..bf6fc71f87fa 100644
> --- a/arch/x86/include/asm/cpufeatures.h
> +++ b/arch/x86/include/asm/cpufeatures.h
> @@ -517,6 +517,7 @@
>   						      * and purposes if CLEAR_CPU_BUF_VM is set).
>   						      */
>   #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support for 4k vCPUs */
> +#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero Association */
>   
>   /*
>    * BUG word(s)
> diff --git a/arch/x86/kernel/cpu/scattered.c b/arch/x86/kernel/cpu/scattered.c
> index 937129ce6a96..1fa4d5aef17e 100644
> --- a/arch/x86/kernel/cpu/scattered.c
> +++ b/arch/x86/kernel/cpu/scattered.c
> @@ -61,6 +61,7 @@ static const struct cpuid_bit cpuid_bits[] = {
>   	{ X86_FEATURE_BMEC,			CPUID_EBX,  3, 0x80000020, 0 },
>   	{ X86_FEATURE_ABMC,			CPUID_EBX,  5, 0x80000020, 0 },
>   	{ X86_FEATURE_SDCIAE,			CPUID_EBX,  6, 0x80000020, 0 },
> +	{ X86_FEATURE_PLZA,			CPUID_EBX,  9, 0x80000020, 0 },
>   	{ X86_FEATURE_TSA_SQ_NO,		CPUID_ECX,  1, 0x80000021, 0 },
>   	{ X86_FEATURE_TSA_L1_NO,		CPUID_ECX,  2, 0x80000021, 0 },
>   	{ X86_FEATURE_AMD_WORKLOAD_CLASS,	CPUID_EAX, 22, 0x80000021, 0 },

Sashiko reported:

--- Patch [1]: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege 
Level Zero Association (PLZA) ---
commit 0f2aa093b81d7a2e0dc203ce3466562f708898df
Author: Babu Moger <babu.moger@amd.com>
x86/resctrl: Support Privilege Level Zero Association (PLZA)
This commit adds support for AMD's Privilege Level Zero Association (PLZA)
feature. It detects the feature via CPUID_Fn80000020_EBX_x00 [Bit 9] and
adds the corresponding feature flag to the x86 cpufeatures array.
Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
 > diff --git a/arch/x86/include/asm/cpufeatures.h 
b/arch/x86/include/asm/cpufeatures.h
 > index 1b4a48bff18f7..bf6fc71f87fab 100644
 > --- a/arch/x86/include/asm/cpufeatures.h
 > +++ b/arch/x86/include/asm/cpufeatures.h
 > @@ -517,6 +517,7 @@
 >  						      * and purposes if CLEAR_CPU_BUF_VM is set).
 >  						      */
 >  #define X86_FEATURE_X2AVIC_EXT		(21*32+20) /* AMD SVM x2AVIC support 
for 4k vCPUs */
 > +#define X86_FEATURE_PLZA		(21*32+21) /* Privilege Level Zero 
Association */
Should this addition also be mirrored in the tools directory copies of
cpufeatures.h and kcpuid.csv?
If tools/arch/x86/include/asm/cpufeatures.h is not updated to match, 
tools like
perf can generate build warnings during check-headers.sh verification. Also,
without updating tools/arch/x86/kcpuid/cpuid.csv, the kcpuid tool will be
unaware of the new PLZA feature bit when users query CPU capabilities.


I thought tools/arch/x86/include/asm/cpufeatures.h would be synced after 
the changes to arch/x86/include/asm/cpufeatures.h are merged. Has that 
process changed?

If the expectation is to update tools/arch/x86/include/asm/cpufeatures.h 
as part of this patch, I can add those changes as well.

Thanks,
Babu

