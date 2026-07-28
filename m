Received: from SN4PR2101CU001.outbound.protection.outlook.com (mail-southcentralusazon11012059.outbound.protection.outlook.com [40.93.195.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EAB47254F;
	Tue, 28 Jul 2026 20:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.195.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785269915; cv=fail; b=qsWD35EZC0nupybRORWWIEDJE1BlQaNmLj+l6kVyXg7HT4frkCGREiqZmDL3dhE118QPXukUHEvWnAWspSdE7cLBm5BnDVTRftn0XH3XQOIuTP68Dv2mWFrN/4B/ieqKcKBPdcXtnsbYk2Q6e62hh1IVl5i9I+KLw2pAmilMcD0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785269915; c=relaxed/simple;
	bh=ULu5B3svkkaCd4XDmasjv1IQRlPcCtK+III3D95nh2A=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=baILzp6DWIqockw0s2IXw5HlBHwkV1Ft947kdMXvWFCxCUxgvilR2r8SaLb4+LkA7xx+XLAshyjT/l9TaR5IopEEMz+w2VbweLyAcJ+j3KbeKKb9e2cH4TfQ72t1xdGd5kae02g7fi2kt9C5Hnzr0NL0B7jntvfOml8LezWd5Z8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=tP83s9qj; arc=fail smtp.client-ip=40.93.195.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="tP83s9qj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q9kzauVf0kKF6oaLwRz9XpgQBIsm71XGVKYPE9ZkYL3ejBoVzfUaM8AqsbQZigunyHWzMerwuHQMavn9nDnF+L5NZIsgCGmCMaU8+aNbiNMtMTqOageNoXczPaDpn0hmS5WnciDzboN+GRzFm7Tb9c9pVD5ysI+34pFwrth1Yx/Rc6bUA0yUAXlJDn6f2TQaHZ/dklhPcYz0DnmeeXLKCWU9jycaYA/cOE4dWn5nysbQkVbaYCzwhqB2mutyUMeMsICsOvVICXkKwEjv7KcjdklEChXs9UhMQCoC5pjiG+/Vaamz8Fqp5jP7iymVyZROibEeDmSq8fuvjbgJGYBkLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m6fs24gb8735YJJ/6v7FlCJC0tzpAs5gR8Pl83YV9SA=;
 b=frdireZShyJAG48HdsVZaaVDDsCBWlUD8fpDygheF2bA2kLdr6Tv67+ilpgBTtRjIHGqvYOyN70ZGODtiU5fpouk/ZScGnUmHhXOFO3IrTUU7y4ZyjEDGWvkdga82edl6+mfn3z7au7xZI9ealRnzLFeo7Gnn3ioZOXvGQKiLt0ZrZCf7rQv8wJaF3osGPvmjop/5w7+P9zEeO1N3dUsm6KzpppFF5a3XTKzt+ONzMwjcGR/vZN8U5O6VQtMy9MjyCbmZWitxSLlImewICUVtrzy7yu0UQxWddKQWbVfhcQxm7DcwJxOoMMUH3X3mMsIVBi8PM8OUwsXNRG4WwCiXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m6fs24gb8735YJJ/6v7FlCJC0tzpAs5gR8Pl83YV9SA=;
 b=tP83s9qj3Tfjj9llvp8WvKUlwhfXVzKNkEWTqx/GPT/3/rmCQpuHGk4zlnRjf0+bmkAz35o6JWvVHuoWNbqCP1jIonCQMvUt3jxqzLxAsTyEJzT2XSAVVp1Bv2jPER+AMCOOKAlqppKIBcWjtMkq4QKMg3PIiRTAF7NJcRcYeU0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SN7PR12MB8770.namprd12.prod.outlook.com (2603:10b6:806:34b::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 20:18:29 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 20:18:29 +0000
Message-ID: <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
Date: Tue, 28 Jul 2026 15:18:26 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: "Luck, Tony" <tony.luck@intel.com>, Borislav Petkov <bp@alien8.de>
Cc: "Chatre, Reinette" <reinette.chatre@intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
 <Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
 "corbet@lwn.net" <corbet@lwn.net>,
 "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "tglx@kernel.org" <tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "Eranian, Stephane" <eranian@google.com>,
 "peternewman@google.com" <peternewman@google.com>
References: <8cb66e18e32e4087a9712c1e68ee6da614efe244.1784322818.git.babu.moger@amd.com>
 <20260728191818.GBamkAeh7BD1d6Gd8X@fat_crate.local>
 <2c098892-5d4b-402b-bdfb-59e3bf164c8d@amd.com>
 <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <SJ1PR11MB6083636E406ABF9F64CE3F25FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR03CA0030.namprd03.prod.outlook.com
 (2603:10b6:610:b0::35) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SN7PR12MB8770:EE_
X-MS-Office365-Filtering-Correlation-Id: bab242ee-0485-4c09-05fe-08deece56322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|366016|7416014|376014|56012099006|4143699003|11063799006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	BOvnPTCt23qk1fv404Eu9HqZKaiEepUCABDHHsfwlsB2lbwVFeVumyQbiAzkNgE+5y5WlI5tLcKuEcfNUICb1he1LYtaTXP6uyDCSs7AZcciBQEKGyHr1a9X64/WKljVi5mActXLWfFhPT5QyGg3QnQ18uHxLmuTF7LJBlQ0Y/KNM9gwTPaSrdymWXqOoc3toEeoQqDMxlh5ATQI/L2rJE5FRjt2DkQ8ZgFe1KXWXnEK7kFlVbeJspFBVKx9/5bf/7WpwFxGeIRi41imCBJQPTmEw4IfW29PmyTvnCYAwUlhDe7icTkKuxYAhvXdznLXvQjctOR3qHEhnasHAzb6P9lU6rokLfLycbH55G7naPKvZarPzkiYC54Bb/Nipjrd6Y9GLI8xX82p8jLV1x3lFMC8BFlpoC951q70RCGIe9qSJ+n3i5U+XG9vFBa5FeS/Gw+nrcsYpNrMYnwL52pNxd6o97PRSo+pmT2frWz+2iMTXpzzW9/gecKZaAQbShYOWnsTT+g6IVBjm7RuAjD/rRizvARq01IdtwfddFRQzxBhneZktqO938SRwMprFX+KRb1TTVhUEYPmcQWzpwXuZtQe+/3D7iNu5DtV3SuYytQy7fDHwRymFvLRrBe0nbX2yHHT9UBZ6yICLwDIC/4PRaG9HgxwlSITIuirHlahuZQ=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(366016)(7416014)(376014)(56012099006)(4143699003)(11063799006)(10067099003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RWF0YTJDK2VDdkRxYUFKUUxPd2h2aWtIVEJhV1VvMmhPL0JMZnRSWHUxeHox?=
 =?utf-8?B?dWZWeFZLcmFFd0RJbGtFR3FzRHQrd2ZOT29kMmRoSWJqWjA0dHJSL3krZmp0?=
 =?utf-8?B?SkF5TnJSNWt6YWR1NUw0NlFzRGRBOE12UWNvT2taa2F5KzJ3UW9zT1pSdFJR?=
 =?utf-8?B?bTFTbVJLWjNhUmh4N2IxVGkyQ2hMSlBrMDFFZ2krQyszYWJaRnZRMktzbmdV?=
 =?utf-8?B?WmIxZG9iWmRwLzAzYXJRQ3R1MjNzakVHdldrZkhaTXUyM01KSUlPblRZV2Zh?=
 =?utf-8?B?RDZCb3BkWmY3b0ZScU43STV3NzRtViswNmRBb05ROGM4NkJvL2xZejlQaWVD?=
 =?utf-8?B?c3RSZzNhaTF3OVZvYWFuSUx5em1LME52ZTNSNkt4LytxNU5rWmJHa2ZKZUxQ?=
 =?utf-8?B?TUNVVFRqZzNFY0FpdFFFYUU3WVY4YUUxaUw0TWk2ckZFNkFGU2hVYUlVZUs1?=
 =?utf-8?B?cVJWUEFjbURkZHhPTnN5MmMrSEtJbi9HNVNlVWJKOWZHbCtqWjBmVGN0Y1Bw?=
 =?utf-8?B?TVNpd1paMW9xU3BKZEpnTWcyZ01PcnFnSjFBUHB0andOanBzSjk4d1B3WW8z?=
 =?utf-8?B?L21GSTdKbjBqSEp1bjliKzQ1NWhmaTgrQU1FbkY1QTQwc2JubGNGVDRaMGg5?=
 =?utf-8?B?T2ZCUG1xZGdHYlZsNUhHUGJHNGFmcTIwY1VpUHVvS1F1OXczaUg5WEVQR3Jp?=
 =?utf-8?B?anBrTmNaVzQvYmlTa1dlaDB1NGkrY09XV1VDMDhqc1MzK25abG5WTzFycHJ2?=
 =?utf-8?B?U1RaNDZNVUhtWmswemVVRVRZNTNzYWcyL1RVcytCaDBETW1DUWdCaUtpVG5x?=
 =?utf-8?B?VjlaempKc2RpaVZKLzU0bVBPeHJ2alJhKzdieHQyYlNIbVhsaDRvcjc0ZEhR?=
 =?utf-8?B?VXUyUzhxbU04RlcrMEU1eVNFSzJha1lpZ2h4TGhjYTFEQWR1eWdZV3kvUkcr?=
 =?utf-8?B?WUJyakJXaHRJTXpRbXRobGdpZzU1aXY4VlN5a0E3dFo2S3Q1N0lNcjdseUxh?=
 =?utf-8?B?TFpmSGg5QzdCMUJUdk5OeDdZWjNnTXpyOEtWQ0ZoR2RzVXpWVDdzaTJQcXA3?=
 =?utf-8?B?Q2FabGNFSzJwSFh5OXlMeHR2Y0dxUTM5MTBCWTVFc25yQ0F3cWx6Z0FGbytQ?=
 =?utf-8?B?TDkvcWN3N2d5U1AwQTVGTFFNYTR4SzBOYTEvRzJJR0x4U0N0UVA1akN1QzJG?=
 =?utf-8?B?TXM4M0pCR3hkRGFVY3pYV1QyWFg4Q0I4Q0VoQnhScjl2ckwzSisyVkw1eXgy?=
 =?utf-8?B?OEtrYWF0UnEvaG55MGhzeXNpZG9SVTY1QUxBZDFENGozUndya3VxcnNtUlZm?=
 =?utf-8?B?WVdCQm10Wm5uTzVPYnZjY1gwT0ZBTHpwTXI4dlQzZFdLVUZSMUE5ZTE5bjNN?=
 =?utf-8?B?ay9acUhXNDFCcTRXUmNtc2ZtRlR6OVlnNWI5d1lldzlVMUZGNkt3V094dUta?=
 =?utf-8?B?S0tFNTVzRktoT2U0VWswOXV6RFJsdTIvcWR4WC8wMlpIanBNb3dmV0MvVTVF?=
 =?utf-8?B?cjBoRFZDVGFTL3dHN0FLUExoMmpkV24wK0RhN1RsMEFpRTNYdkZVUVlZNkhN?=
 =?utf-8?B?SHBmaVZxeWhvVDBnaytMbTR4VHVwVCtEbEt0NUxHU2drc2NFQ3VwR3ZpeGpz?=
 =?utf-8?B?VjdpZ0ZsTkZOVHdtcVRSc0ZvWDBWMnA5YTloVWxUZzdQQURJbGVDNmQ4elBy?=
 =?utf-8?B?SG1haStGNzMyam53U2NkSmt0RzB3ajQvT3pqZDArQXZ2REFwMjc1bFltUFIv?=
 =?utf-8?B?V0tPQnl4NmxOOVBobk9XRlJEb3NSQXJrNFptQUlvTEhDVFRvMHRFYkdDR2M4?=
 =?utf-8?B?NXp1cEljUHVWdExEODlPcnQwTmJMaEdBUGhyWVVzd0hzYjZFeC9kNUlzVEI1?=
 =?utf-8?B?U0V3bDdiWjBzRkt6N2g5RlBjc05UblUwTGVIc1JzSnluaS9Md1UxMHVmRnRr?=
 =?utf-8?B?T2N3MncyUGdOeHR3RWI5RHpmMWwyekRpRDRINjNmMVNjckJnRTFFWHJnTFhX?=
 =?utf-8?B?NFVKYytVR1Y3R3g1Mm92c3pQdlV4T2ViOGhXRitQTHZ4YkZ5Tnl6ZU8weVAw?=
 =?utf-8?B?Z01yR1BNTDl1OEFwbTdOQ3lQclZYSlZmeXJlQXp4TjFOUW4rUk1DaGZmd0xn?=
 =?utf-8?B?TVk3Nkp2QllobUxiamtWb3RSeXlDeWtETkM0UStCbzF1d2syWktiQTA1ZlpM?=
 =?utf-8?B?NVoxYnc4TVpJTkZOWnZTSkZpc0dOUzF5bGVCbXIxOVpWUTRYcU8wRlRpYmt1?=
 =?utf-8?B?bmVZdnhGSWUrVFNoWkI1K05ldVRYbHRORnlaUHpMellEVE1zb3VxSEJlTEsx?=
 =?utf-8?Q?7uSdwMfRnUEnJ//iBF?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bab242ee-0485-4c09-05fe-08deece56322
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 20:18:28.9202
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTHQqJfLh17Ou4RdkCdEOGNVWUIZFBPKpJvVNJqq503co3cZQVQKQXRm80Hyq+fa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8770

Hi Tony,

On 7/28/26 14:58, Luck, Tony wrote:
>> ABMC mode (also referred to as mbm_event mode) relies on ABMC counters,
>> and this system provides only 32 such counters.
>>
>> By comparison, the default mode uses RMIDs, with up to 4096 RMIDs
>> available. However, even though the RMID space is much larger, the
>> hardware can track only 64 RMIDs concurrently. As a result, if pqos
>> attempts to monitor more than 64 groups, the reported bandwidth
>> measurements may become inaccurate.
>>
>> That said, I have not been able to reproduce any bandwidth inaccuracies
>> on the systems I tested. My point is that this may not be a significant
>> issue for the vast majority of users
> 
> How did you try to reproduce? It seems that it should be trivial to create
> more than 64 monitor groups with active tasks assigned to each group.
> That ought to show the issue quickly.

I started "pqos -m" to create 256 monitoring threads. It did not happen 
in this case.

Reinette has already instrumented the kernel to force the issue. So, we 
know the issue can happen.


> 
> What does happen when I'm reading the memory bandwidth from a
> monitor group and the underlying counter for that RMID is stolen for
> use by another group, and then later this group steals a counter from
> someone else?
> 
> I'm expecting "Unavailable" while there is no counter. But I'm not sure
> what happens when a counter is reacquired.
> 
> 1) Does it start over from zero?
> 	Seems a sane option.
> 2) Or does the monitor group see whatever the counter was at
> when being used by some other group?
> 	Seems less sane.

As per this code, it should start over from 0.

  } else if (ret == -EINVAL) {
                 am = get_arch_mbm_state(hw_dom, rmid, eventid);
                 if (am)
                         am->prev_msr = 0;
         }

Thanks
Babu
