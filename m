Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFD0935965;
	Thu, 23 Jan 2025 03:07:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737601661; cv=fail; b=f1TYG+Z+jNBdHMV+2TQsnUWXMMWQ7D/PCbIjuyltdpV0/Z9cYi4D1qXWm9N7MIextQJ3wpf5fpAKAYwUk+Sa4ZmoPQ7GZQeoAAA7kC7JRItgeiimeWrc0D/b6t1ITLhN9kjw+BdmsYYd7s+WnMWlIZuf9ZUHMw850m/rhcAowjY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737601661; c=relaxed/simple;
	bh=rscl//QftjFKSx2+WFGS2X9DfvfLPuBZd8nXjxUyQpg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=EqWZpg4Y/KKnxwL37nXDr2qJWZ4C1Kq9Wxyi2wvs9EfPXU7CCiW71naUlx6TT6tHivZVtGq8bs6+Y5zoDLi7N/bvtR6iWVwMXkNpdVDrD+8lLFvZ0xfn0kWs8f0k8E6JpwWCpHshulnglrlZ92nbW3WV5qu7GmiR+LM3ToECVSM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=dGPCi7YX; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="dGPCi7YX"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kZ1brKfcMlumYpv7rCFhDurI9gF0P4PrVYwkD8Ecm0bSm7F5IpyfW8RSkFbsex6ck/TDZ4mDNH/+DxgvNd14VlK+iROkHnMxRw4p6bKIK+tLZrB/J/5asTITHlusm11+e0uEVvseMWuV2M9pNtWsi3QsuoeBcGyusGduIuo4+MM+Rcg7RxcdI3SiCCES8B15jXTolfUeNIWrMIZdsas1YcZFDRMU7pQuHUJ4PubRNkjQ5TwvlSFDowYylTa1h7lW+5dkcyb1Su7LjV0Hy93XX3Tqoa3GGoKSkujlwkgIX0+ZcmGYBJDEUXJv339SfTfT+3IPC3mFe370gINqOmX/PQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTda9uRokMsLqOT33DiJGX0IYXhjEye7Y4sd19g1eUU=;
 b=cZFy4jYSYgEW0ooWSYviuQS1f4a4lLHoHJYP1busgv8dwoqHHB+WGass0Lxy+i4WUgWQpS5r4DH2fSGAJcPct9kO3wxCVUz4EdnV8Rhn95Xthzbutp50OsVQCq/vG7N7fVfC73frQdueoC4sDkTaAX/yDZiKZViLsYc1k7r/PpTPxz1CnDiRFzqvD58EMH7xcJd6obFjaOrFZmAiDUdq65T92Dvi+0ju40QBWvc+FQuQtKxbv/g/GgsyOU/FmfQJG0C445B6QYKi3L/PcB0hzyay0l+CFbEEre32L00d5tgRZGSdBw4k/9hMiFaeX7440smAiAZW0OLL/tHPvTgzQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTda9uRokMsLqOT33DiJGX0IYXhjEye7Y4sd19g1eUU=;
 b=dGPCi7YXzpmr8582GUp35XsdzW5bZh02a8dTpECo6PLhfHTbXMW7q86Nqz2PT0i1LTV9wEviqaRzy4ccToGqEs1y9hhPc7X8ZsyMOWZ1DIS6nQib0IHORyCOPVi2YA88udu7oQJlzaWTaVZa6Tan5s0iOUsMT0Ya9gqsBDnDpL0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA1PR12MB6434.namprd12.prod.outlook.com (2603:10b6:208:3ae::10)
 by DS7PR12MB6167.namprd12.prod.outlook.com (2603:10b6:8:98::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 03:07:37 +0000
Received: from IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134]) by IA1PR12MB6434.namprd12.prod.outlook.com
 ([fe80::dbf7:e40c:4ae9:8134%7]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 03:07:37 +0000
Message-ID: <8ccedc5a-168d-406d-b363-6fce62f0100a@amd.com>
Date: Thu, 23 Jan 2025 08:37:29 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/6] memory: move conditionally defined enums use
 inside ifdef tags
To: Gregory Price <gourry@gourry.net>
Cc: abhishekd@meta.com, akpm@linux-foundation.org, david@redhat.com,
 donettom@linux.ibm.com, feng.tang@intel.com, hannes@cmpxchg.org,
 kbusch@meta.com, kernel-team@meta.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, nehagholkar@meta.com,
 nphamcs@gmail.com, ying.huang@linux.alibaba.com
References: <20250107000346.1338481-3-gourry@gourry.net>
 <20250121043355.177611-1-bharata@amd.com>
 <Z5Eyg58jl8YqkU_j@gourry-fedora-PF4VCD3F>
Content-Language: en-US
From: Bharata B Rao <bharata@amd.com>
In-Reply-To: <Z5Eyg58jl8YqkU_j@gourry-fedora-PF4VCD3F>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN3PR01CA0123.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:96::13) To IA1PR12MB6434.namprd12.prod.outlook.com
 (2603:10b6:208:3ae::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR12MB6434:EE_|DS7PR12MB6167:EE_
X-MS-Office365-Filtering-Correlation-Id: 6d7f3488-2a7f-4a35-a46e-08dd3b5b16d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bjd5Z3dXRkRSZzZpZ1dlR3hCUTdTNjFvdDdYOUpsZ0U0VjU0d2xGYS92R1hT?=
 =?utf-8?B?MTNuRVBqcjV0bkdWTllsZU9pZ0pKTit5RzFyVHdVdms3bkUyMVRaMStvbnJG?=
 =?utf-8?B?dVN3ZmJMUDQ5dDcyMXhEUHMyYWtOSUdSOCs1T0szRlkyeldGOEVvemtNQkUy?=
 =?utf-8?B?MWpZR3Q5T1IyczdFelJocmRpL1ovNWIvT2J0d3ZGK0Y0SmVRMElLam9nbVlJ?=
 =?utf-8?B?RHJoV1FGbFgzZThvaHJjOXQ5aUNpaW14VE1OSk1hSWpSdUNXZmI1dis5RGpK?=
 =?utf-8?B?VEhYc2ozQzJaY0pXS0FpL29rTjFJREdxdWRKYlFKUkEva3ZMM0NkZFhLSHRF?=
 =?utf-8?B?Vy9aZ0dKb2pZQTkrZU9IVFpWSG9ObXhNT3gra1lKNTVDS2NOMlZqanFxRmJv?=
 =?utf-8?B?eS80OFpGUlRWMmhzY2tlMG5NNWJLQmFrVFlvdzdtQlU3VHBObytsVk5BR0Z3?=
 =?utf-8?B?ZmRyN0MzU1ZJUW1TK2JPTzBSTVVmaDhkYkNqbFhnRk9ZRzFpMTVKOUZIS1pK?=
 =?utf-8?B?SXdYVlZ0K3J6c1N2WGNaNVFuVExqRDdDTUE5NS9zTllIYlNYeWlBUXZlRExX?=
 =?utf-8?B?dkErVWZyeWxkT3I5RWVHTloxSXcvZVBKeU5pQWhHbzFON2lZUlRUMmU2cDNs?=
 =?utf-8?B?SW1QUExkYklIbVd1dFBrc2crSHlKaEtSallmZkdCVkErcGsvdC8rOUR2TC9W?=
 =?utf-8?B?TXl1M1p6ekxiQktYcU93U0EyMHV0YnFNTTJTOVpDYW5nanBJajJ2b2xncVNl?=
 =?utf-8?B?OHdnbVVVaVk4VjRtOXRkdkdUSTZuejBoRWdSL1pLMUpZNm1aRlRhRkZ2WGg2?=
 =?utf-8?B?UHlmY29lN2Mrb2VNUGFGWjNjTkY0amNXODJ2NXY2Tkp0MDJwWTdtOEJDbjBH?=
 =?utf-8?B?ZXRKcXhJTXdyS2l4dUNpa1ZmM1VqVkp6Nk0weFNJc2Z6VnJ2WGZNNXVyZmpX?=
 =?utf-8?B?SFFNVXBDNnVvRUVXWjlBOEs3K0FUbmN2MEZ4Z0VnWXA5TGc5b0dIcU9iZERr?=
 =?utf-8?B?bkU3UHM4TmszZkE2em9KZFRTTjZNTWtONUQ2d0Q0WFdiMk1LbU9ka0VUOXZv?=
 =?utf-8?B?UzhhR2lTaFhja1VvMFpLbFliZEJHSlpmYWdFQmxxVHF5dldxamxtb0Q1RERw?=
 =?utf-8?B?ZUNSK2V6U0NHRnVMZU1WUytmZEsyOU9XQ1dtbVlDNzFDczV3Rm13OFVZeVZD?=
 =?utf-8?B?UlY0L0lOdjBrRE4vMXhoTy9RY0lmK0RWRkE4MlhPNitrOVYyWmVPQ3R0ZmxN?=
 =?utf-8?B?eXpoZzFYamhPVmJZc0E4dExTUnE3V3l3OXVjWHkwaFRpNjF5ejVrMjMrWmZD?=
 =?utf-8?B?U2lMd1IxalloNUxocW40MUpsWWh4VlNPWWxKUWN6T0lKZUJrSnNjWW5odXJL?=
 =?utf-8?B?YjNKMmpYaStRdnd2QndEOEJ4Uk9OR3RraDJLbjRjbitLRG0wRFBJNDR2L2cr?=
 =?utf-8?B?ZE9yVUJuZnkzdDJERVk5RmJZVWNZM3lJZkt3OXRuajMxN1QrdVlMeGVvWm91?=
 =?utf-8?B?R1JHNzl3SDhKWmVJTGt5cFF0WHJsWEErUDRTSmlTQWgvcFFJbVFNdXB4TVNz?=
 =?utf-8?B?bVBxa1p1SENudnJ1MDdoaGxiRXE3enJ5UkJVOHpzeGhPSGRha1RoQ2I2REJy?=
 =?utf-8?B?d0pFRmw4NDNMelloWW56dE96cnBRZHdrQ1RHWm8rTlhNMUpCS085elo2OCtt?=
 =?utf-8?B?eEZ2ZVp3VE9nNXA2NXFTOEJRZWFPMXJ1VmVVSjJyMWw1TjIxNms4Q3M3Mkl1?=
 =?utf-8?B?SlVaQlpickJzbFZFeGE4VmJsV2NGS2dMd0lVdFVPZGpEVisvZW5wZnNCK2hX?=
 =?utf-8?B?cHJhOStPUDY3Z1gyVzNNYXFjZ044TUxhbDlGNEphZ1AxRHpFVDRXa3liSVND?=
 =?utf-8?Q?dNidukezaZbjW?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA1PR12MB6434.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?STh3cmFxaG5CaTMwVDU2Ujl4Z3hYRCt2dTVFOTM3Z2loNitmNnlzT0kzT0J5?=
 =?utf-8?B?amlOZ1VUTExQc2Z6b3RMVWhBSlZvUUNZb1FCSXpNMWxSWjJpRmZ0bGxMTHZC?=
 =?utf-8?B?YjBzWVNXUFlFM0llVlpmKzlCbVJQb21QOVVIMW1kZmk5MHhRODc4ZFhKdUdC?=
 =?utf-8?B?d0ZuNFRFQlN5ZzhXNkdxdnVidktvdU96bWJnLzN2ZXlRZG1KY2toRTBXMXBt?=
 =?utf-8?B?WVRUMDBhZWZEczBxeko0U0w0OGJabTkvc0ZaU1czTDZDa1l4WEgyTTdqdjQ2?=
 =?utf-8?B?bXFQdzlzT2xSSHNrTDEyempWdEtOYmduOHF1bkMrWStPaW5TWWpxMFBWTStP?=
 =?utf-8?B?L0xPREYrdmdYaEMzN3VIcUNBdlgydGNCVExHekZuc0NjQk9ySDNNVEdNRWpP?=
 =?utf-8?B?UmhGajR5b1RiNlBJb1JXWE1QQlZiU285Z0tKN0ZtY3JYdEU4R0srTkdieUJN?=
 =?utf-8?B?TWVnL3o5dWJEMGZtaFFvYXNlYTZNKzNxNGo0MUh2R2xaUnEzUVVjSzFCcVZD?=
 =?utf-8?B?N0dHQWcvcUJUeVUrYlBhWXlPRWxKUnhEK1FNQk9ReHIwdmNOL0EvN3NGTlYw?=
 =?utf-8?B?Mk9wSFR3a25MeldHWnVzNncyMllVbXlPWjdLWkZCZXV1WUowVkNuSGhlb29W?=
 =?utf-8?B?d0owVnFUN2dnYU82T3NPeHhQVlBiamRHWEJCZ2hnYlB1QWx4Q0tmUGVZMjFC?=
 =?utf-8?B?UjByMXpUeFg0cVZuRmhzVWxrQ1ZCQmZhV2QvVy9PZ3BVU3BRcmRaK0s4QThs?=
 =?utf-8?B?dnRpcC8vYUpOL3RZZG42U0J6WWs1bXQ4dHRkbHp0NEhTWVJuaHdCVUwzRVJV?=
 =?utf-8?B?RUtjbzA1WVdvUTFlRkFsVEk2MEdGampkUzF2UHVIWTRYQ0VZOGxaNWYvdit2?=
 =?utf-8?B?andxazNFZUJNQUhJbzV6MlA0SUhrYllLLzA0MkhSdllMTDBPR3Nwb2tHNms3?=
 =?utf-8?B?ZTVPSCtEMmljbEd4QzR6c2VkZTEzekNvV3NjNjBrc09CSzdBT0tVVjdBTXRv?=
 =?utf-8?B?eUNHMTJ4UnN2TWNodWtLUSswdWJ0QTFYTHVQOUZDQWhYUUJiK0Nzai9KazJI?=
 =?utf-8?B?ckdLdVkweENzSmYxYWVsTU83M0VPRnkrelE0cmdlaFhtVmlzSWZNSnBkK2gx?=
 =?utf-8?B?N0NvSGNtb3NjMEYvNjZpRkZGTVk4NEwwcUUzT3dCVGI2UU5RdzhkSXIwcmZ0?=
 =?utf-8?B?MUk5MitBdW56SWlBS0NnOUhpMnQ5WFNDSkN1Wm1PcW1CaWx5QUFsMkZuenIx?=
 =?utf-8?B?SmJtQ2x2dnlCNFZHRkE2N1FJMnFEOGZkYjJ0ZklNNWo3YTZ2MGJjSC9aU2E4?=
 =?utf-8?B?aXRJRVpnNjh1bERtSVAyQ0FYWFBsSHBTMFQyRTR0YlJVV3o0RW1UMDVNc0pL?=
 =?utf-8?B?YWxtc2R1ZGprZE5PL2FxR0ZwbHZvNml0MHVySklJZGwwM25LUmtjMktmUXl3?=
 =?utf-8?B?b3Jqd0NzVm1FYXpWbGs2Mm1yUXV3a0pHdkpnZUNKSTVCbHRScDVCUUZaM3JG?=
 =?utf-8?B?N29WUzVXd2lnVE9IUVdvMEhtaVU0S0JadGVKbWdOd1VLNjhWVFE2eTZFQkFI?=
 =?utf-8?B?dk5qbVBMZll5S3F5M3NtZXgyU1FDb051dVM1WWpZbEM2VWc5emRIVS9uT25O?=
 =?utf-8?B?NEdPNnBES2ZYdzQzVGY4K0ZwMERLM1BkVUxXMER4OUd1QjV5cEJybzdKbk5L?=
 =?utf-8?B?SlZWTCtNVXZVRFB6ZTEyZkxDdkViZUpxVitrMVZZVFovTXQ0TS8rOThDSDRa?=
 =?utf-8?B?Q1RUV0tzTktlZVB3VUwwcEZGMWNuMTdoMDVxMlUwM2Viak1OU3ZUZFVSUVFK?=
 =?utf-8?B?cUozZFBqdThxaWxzbnUyRDFrTjRrdFlUdWFJaHk2dkkrL3Y2KzNkSC81OG1C?=
 =?utf-8?B?NDJqTjkrQjdiVVZ5NDFxQVora29xNk1Od2ZHbjJNQm5nMWhESWFCeTdwWS9U?=
 =?utf-8?B?djNHQk5MNFpRUEZSUkJ3aWJPNHRURjlrWTR3VnpNdmVFdTFhNGxud3hCUExw?=
 =?utf-8?B?bEl1TVAydVprN3VjaklqalNsSm5jakFIMWtqaXo1SENVVFVhUUJaZzlxWDY0?=
 =?utf-8?B?MmpsWi8yQmEyRG5DTXhKMitIN294YWRWWWRRTnIzSU13aEZSNnVKNlJOMUEx?=
 =?utf-8?Q?LUJUdONTHAE7dHEnfsKwjj3Dn?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6d7f3488-2a7f-4a35-a46e-08dd3b5b16d6
X-MS-Exchange-CrossTenant-AuthSource: IA1PR12MB6434.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 03:07:37.0740
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F3ycwD16vQ4rtfKjclG5Oj4aM8FCtix9vUBF1LH8RLkP1dy67IO51MwuzwrSxlKeWxVGhR9axYaTf6rhq6FJfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB6167

On 22-Jan-25 11:31 PM, Gregory Price wrote:
> On Tue, Jan 21, 2025 at 10:03:55AM +0530, Bharata B Rao wrote:
>> I don't think moving count_vm_numa_event() to within
>> CONFIG_NUMA_BALANCING is necessary as it is defined separately as NOP
>> for !CONFIG_NUMA_BALANCING.
>>
> 
> NUMA_HINT_FAULTS and NUMA_HINT_FAULTS_LOCAL are only defined if
> CONFIG_NUMA_BALANCING
> 
> include/linux/vm_event_item.h
> 
> #ifdef CONFIG_NUMA_BALANCING
>                  NUMA_PTE_UPDATES,
>                  NUMA_HUGE_PTE_UPDATES,
>                  NUMA_HINT_FAULTS,
>                  NUMA_HINT_FAULTS_LOCAL,
>                  NUMA_PAGE_MIGRATE,
> #endif

What I meant is

include/linux/vmstat.h has a definition for count_vm_numa_event() for
!CONFIG_NUMA_BALANCING case like below:

#ifdef CONFIG_NUMA_BALANCING
#define count_vm_numa_event(x)     count_vm_event(x)
#define count_vm_numa_events(x, y) count_vm_events(x, y)
#else
#define count_vm_numa_event(x) do {} while (0)
#define count_vm_numa_events(x, y) do { (void)(y); } while (0)
#endif /* CONFIG_NUMA_BALANCING */

and hence moving count_vm_numa_events(NUMA_HINT_FAULTS) to within 
CONFIG_NUMA_BALANCING section in numa_migrate_check() isn't necessary. 
The current code already compiles fine when CONFIG_NUMA_BALANCING is 
turned off.

> 
>> In fact numa_migrate_check() should be within CONFIG_NUMA_BALANCING as
>> it should ideally be  called only if NUMA balancing is enabled. The same
>> could be said for the callers of numa_migrate_check() which are
>> do_numa_page() and do_huge_pmd_numa_page().
>>
> 
> Really what i'm reading is that these functions are in the wrong file,
> since ifdef spaghetti in *.c files is not encouraged.  These functions
> should be moved somewhere else and given stubs if the build option is
> off.

Yes !CONFIG_NUMA_BALANCING stubs for numa_migrate_check(), 
do_numa_page() and do_huge_pmd_numa_page() would be good.

Regards,
Bharata.
