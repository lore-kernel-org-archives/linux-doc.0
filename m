Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C34B3DFC8A;
	Tue,  4 Aug 2026 23:44:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785887082; cv=fail; b=D/3R3HiMaLyampiO9vRN+0XHbfiLjk1CRhN5KMlzuDFkAIuG4N7EOBQpRUXqLig374bgvb1ryhXNp4GA949CJ94M2HwfkBpC5xAU5aa8/nAi9JZiyfbaTAHRSjp65hLtLtcW4bIsxb6+e84HVs7yYwLKWx9AKHCiX2DZ0nDIw5U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785887082; c=relaxed/simple;
	bh=dHWjRsfpAB+EegD5LtfrW26LzA4bKldv9+Q35UR7P84=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=LcNjb1vFgAb5Gh/8dIhRs13F/1GSrVnuOKtRhm1hfTYpYbvCbabRUuZBVY2AtiKrjfMJ30icridU6vuE/m5bOw/QuDAdzTzeaLtcYMUkCGMyvhrhraADvvI2+m0IKUlc2vzVdyDloe9aBCiaZV8uoLma87nqERY6KZ7jlOiUN20=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=WCQeGIOS; arc=fail smtp.client-ip=52.101.48.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="WCQeGIOS"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hvJT8UHlFVXckZNpZcLEOwkv9LrX9yQ7lJDnhFfl9kpNF9qua6Eg2OUi5EFsL0r48dZ/W/abwtGYf3poaL5J0Wa4Tu87IApxLt5yb9Bw7eFm9IXwcmBgKZQquZL7pZaAE3ABKhyNBYF/DioANWsGE19Xi1IIaItCWpdVpj7Sp+HLXYsjVs89+VbOjPBktWzOfv4VmoXUnJ1XWkfTayk0y6wga1r5qCJ8xZ50fA+IObd7nji+kXtERewJk0I1YSekpMv3ky/7rGaqrvfV4cl7enSQntDTyHi4trdXfHLHOZJONXhR6WJ9G4UgCitR/L7RJfnLcLt1WG5d/CRC4i9GNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VdpQeWJPmYl4o1bBEUre3oVUTo8DPGyS5RaXyennxoM=;
 b=d7rM4qXq2A+C75R44bE+piFF0+BKvp/VEhYJ2YBRc31VVB6GLxiruZgzRMXODl7nUvvmEXkXpIA9+anUUkFqsoBXD25wBREkO+3grkUOkwdlTxe6NK2RMXOMHjWXAahIyNH2O5NF1HrXlSetydCM47gh1h/wScMSaDRVBVBbqYIPEfFXSXw+gxJ/jp3/FmrZ5IAxIdP1aeeAvbahcGGJrbjJh4eMOie0sC5INCLcKE1dMi/zp57KoHUMdvPdkefeLM8m0cUOS3r5wnAy/FvbIc3/omZupTy2MffbElvt17e89ZFzF6Ts3gQL9Q3gpg7KAHWo8/Y5gmTVrsFRSCv99A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VdpQeWJPmYl4o1bBEUre3oVUTo8DPGyS5RaXyennxoM=;
 b=WCQeGIOShRc/2HYCToQ7URnImZBiakYpqOWZKz2i3IAOVjx8VPRrFeLWgVvGdmsdRaArPZpBY+ff3oncUKF/SvZMQECAZcXr1cqwpjzfF3XRo38b5Vs9bFhZhdsr7IbimMkVWB9a1YQ6pPhCFvgDdr1MO+kIA0hfXDe+7eTLbKk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SJ1PR12MB6241.namprd12.prod.outlook.com (2603:10b6:a03:458::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.15; Tue, 4 Aug
 2026 23:44:35 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.017; Tue, 4 Aug 2026
 23:44:35 +0000
Message-ID: <b067caec-4e20-4095-a7b4-eecb5d8594c2@amd.com>
Date: Tue, 4 Aug 2026 18:44:33 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>, Babu Moger <babu.moger@amd.com>
Cc: "Luck, Tony" <tony.luck@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "Dave.Martin@arm.com" <Dave.Martin@arm.com>,
 "james.morse@arm.com" <james.morse@arm.com>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:610:e5::30) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SJ1PR12MB6241:EE_
X-MS-Office365-Filtering-Correlation-Id: df4452d5-3a4e-4316-1720-08def282571c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|366016|376014|1800799024|6133799003|56012099006|10067099003|4143699003|11063799006|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	r0VmfO4awEGOmcNGUCE7bgKAlxpwl7xAJMJ/8HLNnI04DR1Ts8+FYpjx/K/jwYMe4ijdflzPIyy0hVefWY+HOukwXO66rWHb3LXEyJKxdjag+g5WGK89HhOkrMQ1rqpTGG0Fvqt2xDvt7JRP2IuBi1RAaSBWjiOr86Bn9xHI07FNJTcbf6nXL4YOCgSIbGWAqmyUx7ga12ky/XGBAgJjnMDLPtqsEENEoNX7pwYLRlYBH6gouJO1khQ/GTJ6Gjf+cq7m4kjiivnLHqHKJDBgjq4WhS4j/PvAfOjRWBa1oxxRB3yj2czn5xusvbrzvbAAUy+1uxCK7qGpNd/9Z1uwpl/GYH0FGUI4jV/XgYGkExZGtr2P6Pz2ws5F8px+AKTWLxWl7ux+PqvR4+VxQb/QIkwW0K+DDpzafI2iv49o006hVH4ukNGiCfjABIM6jfl05+gVAq3nTg03hcurvbB0E8FwSjTWNqwaV9LASGgEC4mmptpKNo8GRPhxn5428DSg7V80OJz5mjV5+zkg2+Ic+sUsOfGl0zxbi6A0lzW+qdxUO9yCUcR3mx89xi3moV6zVDRMoecPjBTLFB3dqbsgZNsJzt5PN0nIirw95MtIEa48oxvZADaFOgGLD8oZ5W/nwukd1mVdC8RumBrj2f7PG/lRzJhVqt0wqZc3sxwPI4Q=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(366016)(376014)(1800799024)(6133799003)(56012099006)(10067099003)(4143699003)(11063799006)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OEU5QnFHNHBHelBMd2QvYi8vUmRjdkZ6OCtyZTJ1bDFwY2F3OW9BVjVlTTVh?=
 =?utf-8?B?RWo4OEppKzkzeVd6cU5oVWM4dDVCTDRVOEZDQ3kwMjJhS3dYdE4wMTFqdk04?=
 =?utf-8?B?VTRmZXFtU3hhVTVOam4yOS9BdnYvMnlKdThGNDN6bElZOEY0bVNXUFY0VDh4?=
 =?utf-8?B?M25ReVFXald6eXBMdHVHcGpjUzl3Y2l2Wi9RNVBhWm9hU1RBcnpSN1ZuOW1v?=
 =?utf-8?B?UXNhbHE3bkJtL0NQUVluZ1JEdWFFMDRULzlQV0hSa3Z5bDhtWVlqS0w4dTh6?=
 =?utf-8?B?ZWpzUTZrTTZmZS80RmNJNGFjQ1FqRTM3V052KzhRNC90WmlLUTYzWDdJTFRR?=
 =?utf-8?B?OHlkekUvNnNXY05KcS82U3IrdHUybk4vellBam1ZVno2bFl1RWwyQ0VpMXNW?=
 =?utf-8?B?V2lSVGw0cUJvMDZrRzZ0bWZaSkQrWEdvajhsY1JTbmVsR0NTVVJkd2VRQmJq?=
 =?utf-8?B?a29qeHllYXRmQjUveEtlVkdmTjBma1h4SGV6WDNlWjZCcmhzS2FmY1FBY3ZX?=
 =?utf-8?B?TWpHZkROVVhqbzdtT2xmN0FFMDArTWQxc0pLZlBsTUpLZFhtTU9zcUNmbXo5?=
 =?utf-8?B?RGpRRlVNZlZEV042S1UvNmlzc1lzUTRwQ1djaUdOTkRCWi9uMXJMei9kZnV5?=
 =?utf-8?B?a015MGhHQjF6VFgxWjFmelpXVmJqSXRTZC9FQ1pjY2VUcW1kbU45ZnZjNFZm?=
 =?utf-8?B?VFJ4dFhVTjdLVmtsc0s1OWtmcXNCSGdla1BlclVnM0tJL2dyYUVCOUtMaEYz?=
 =?utf-8?B?a1JjU0hmdWM1dlJVSXg0TXpwbS8rTFpkTjFqN2FkV2NuNnVvNFpQcExwOFhN?=
 =?utf-8?B?cjU0d0JSdFdHY2REMnQ0Nkludnp3MGlrbHo0bjQ1TEwyRWdGdG5pbzZ1dUtJ?=
 =?utf-8?B?Vmxsb1RoUWxVbHRmWHlyUW1COS9ISUE5emEwbHZOb0tFZ0RqbVRLZ0RRZEFn?=
 =?utf-8?B?aHVvV1hucW5sMGdjN0xNR2ZsaHJreFFrOEY4aGJpR0RUVFFXQ3Y5T3hHcXA0?=
 =?utf-8?B?VlB4VzJhMkgrVkxRcEdiVXFHanpVV1F6SGtnTlZZS2RoLzNRak5HT2ZabWVR?=
 =?utf-8?B?eXdVUDdlekJxeGMxQmFUbnBReFhOYnFpVWVTZkNPdTB2T3V1R0EvaHZqcW0z?=
 =?utf-8?B?RGRkQ1hQWm0wMEN1MktNVVo5K0pEVm5mYTM4OGxGcFJuWTRUYjFnK2V4L3Mw?=
 =?utf-8?B?alNoWFBYci9yY0NWaFFjMDhQejBWOVAzeXo3TnlFdWp0NUpvWm1NK0NIWm1C?=
 =?utf-8?B?VTFaR0dMRHJYK3cxbUN1MHAzcWdidms4V0VPUE5nSzZEbUQ2bXB5M3d3dlk0?=
 =?utf-8?B?WElaSGJFSVgzbDB1VWhscWM5WCtjOHd3N2RWMDU0RTQvbERiajVFQWp6RmVS?=
 =?utf-8?B?QlE4WXNrN2ZpUC9UNG5HSHMySVY0UWRaRVgyOHdoTndxSU5IbUxIa0I4V2J4?=
 =?utf-8?B?RS9ZM0ZzdGxpN0dhNUZkaW96VFgxenhMcThPNFdKaFNlWUdzOHY2QmJHWm85?=
 =?utf-8?B?S3puYmYzd1pRNkJvcEx0UlRUUmlFVm12STRxOG41QVZzQWhrbTlwMmFjeTcr?=
 =?utf-8?B?ZzFyM255bnF5OW91R0VWMjZpSVhnZDZCNlRWd043SlpsdHp0VmdJd0Y4L1Zv?=
 =?utf-8?B?dmxSWGhhVDg2UDk3L2VDTGhsbFp5amo0NlJnNklnUWFNTnBIL3pRVGJPN3hu?=
 =?utf-8?B?VDd1eVJGYW42K0NneiswWVZOTzRiMGxiREhWeGovUXR4dW1FSDRQOTJOZjFv?=
 =?utf-8?B?QSsybnBNTlNha3dHb0JSZUdGSXo4VDI3Y1Z4ejEyMHlZN2FwbGVyd2xndzR5?=
 =?utf-8?B?SW9oMENBZDY2azBnVkNWZWZhTm13RUF6eWRsdUxMNFdETXBmaVhiZ2w1amZw?=
 =?utf-8?B?bjFOcjZ5UitJaWdnY0xLTnRzVktEVlVZd2hubzNoSE9YdnRHc2pHVFhmQmdZ?=
 =?utf-8?B?SFhLK2d6NTJJRWgxem95ZFRac0s1aGI2UmlnY21XdzYzV29sTy81UUk1VUxD?=
 =?utf-8?B?bzlHYk9Ec0pHTEZKbjY3ZzZzR1oycjgvUzd0TytGQ1krcTRPYlFYUUJIbUNP?=
 =?utf-8?B?VXV4dTdUNXNwREN4TDFLOExZZW1ob3ZXMGJxOGZveFN1WEQ5N2FCNlYzN1Zm?=
 =?utf-8?B?WEozdXVxc2V3NFFlR01WMTVtM2dRM2QreDBEQmpHc1lkYmNGOTFFNy80MVZB?=
 =?utf-8?B?QnRWRUFJOUxQR0Y3dWU0MFZsM0htdUNHVkIrck8rbUlTakR6ZEszdkZEdUs2?=
 =?utf-8?B?QnE0TFV0YXN5VHducGc3Q2gvM05XYWtQMXVQSHRST05iNXJKaGNKRVNRVGt5?=
 =?utf-8?Q?jeKxETeCkawsMOvWfU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df4452d5-3a4e-4316-1720-08def282571c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 23:44:35.5278
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mAlSXehPJkG5wDvnPsJwUlYtyHbQTVgIunVbb9GOGe93/ZDEsfdOsJu9SMAjRLQA
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6241

Hi Reinette,

On 8/4/2026 5:10 PM, Reinette Chatre wrote:
> Hi Boris and Babu,
> 
> On 8/4/26 12:16 PM, Borislav Petkov wrote:
>> On Sat, Aug 01, 2026 at 04:47:01PM -0700, Reinette Chatre wrote:
>>> ...
>>> On Intel the RMIDs are always counting. Please keep in mind that these RMID do not
>>> actually return raw counts that are verbatim passed on to user space but instead
>>> the returned value is "upscaled" using a hardware provided scaling factor to obtain the
>>> value that is returned to user space. This is done on AMD (with and without ABMC)
>>> and Intel.
>>
>> So, long story short - and I appreciate the explaining - we should switch
>> AMD's default behavior back to RMID + 64 counters - exactly like it is on
>> Intel - and the ABMC thing will be explicitly selectable by the user.
> 
> nit: s/exactly like it is on Intel//
> 
> ok.
> 
>> This way there are no surprises when running any tools on either vendor and if
>> one wants something special, one selects it.
> This patch, once minimized for easier backporting and marked for stable, would
> accomplish this.
> 
> Two nitpicks:
> * "no surprises" should be "no surprises (as long as AMD hardware does not return
>    "Unavailable")".
>     There is the known issue with the default mode on AMD where return of "Unavailable"
>     is treated as wraparound by pqos.
> * "one wants something special" should be "one wants accurate data".
>     Caveat: User does not know how inaccurate data is in default mode. Users need to learn
>     about existence of accurate data from outside resctrl via external sources, possibly
>     leaving it up to the tools considered here.

I can capture these limitations in the documentation(resctrl.rst).
Is that what you're suggesting?

> 
> What is the plan with https://github.com/intel/intel-cmt-cat/issues/311 ?

I see a few possible options:

1. Use a workaround by mounting resctrl, setting mbm_assign_mode to 
default, and rerunning pqos. We can also document this 
limitation(Unavailable).

2. Reference the commit ID once the patch is merged.

3. Reach out to the pqos maintainers to explore any other available options.


> 
> sidenote:
> Separate from this I again would like to propose that AMD work with pqos folks on
> how pqos should handle the various text return values to fix the wraparound
> issue. For example, is the preference for counting to stall at a number until the
> hardware reports data again (so that user space always just sees numbers and not
> be surprised by text) or should the text value (for example "Unavailable") be passed
> on to user space or ...? The current wraparound issue should be fixed but it is
> difficult for me to gauge what solution users would find least surprising. My
> expectations from users do seem to be on the high side.
> 

Yes, this has been a longstanding issue on AMD platforms. So far, we 
haven't found a viable solution. Hopefully, AMD will eventually provide 
support for all the counters that are advertised as supported.

Thanks
Babu


