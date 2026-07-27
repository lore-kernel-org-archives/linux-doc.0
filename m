Received: from SA9PR02CU001.outbound.protection.outlook.com (mail-southcentralusazon11013013.outbound.protection.outlook.com [40.93.196.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B7435B64C;
	Mon, 27 Jul 2026 17:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.196.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785173090; cv=fail; b=Lsa8I6UFIfv78/VixYofK+JMxXispapsUbFbGsGU0e98GJE2ORV0ge5n6x1E1LW+BmiuZIvtT0eMo4pXx/aL3AxaRoXVsulDq4xyD/eFoeeVe3u0+K2R9qtYGlkuH2Hum+7IGmk/UXqmvuJ/WYfka+O9Xy0XIKbGcp05CQCsxeE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785173090; c=relaxed/simple;
	bh=vXUxPlUgq+9ixx01jhZ/XwF40N/5GyU0Kod2fdF009o=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eRyeNOVFpvoukn/0LeRhEhj5uJx2w0OPHjDmdBw14hpIfAeFW97xiLTwiOUzW8v3uaUH01j0YvN6R7RT3rI8jr4/U4LXVCyQS9F1bS6n5nFAlwM34HYAUSwjcD/+ZnbsivGqHj43DzuoaB5/oOv5U9mNIT8l6PIzsTmXJGEnC8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f7cFMG3F; arc=fail smtp.client-ip=40.93.196.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f7cFMG3F"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=co2GVR+nDmz94QBYUsgAM4dph38AaAJSwcjeZyTSyWVqfMQ010Cf6U8AZngK8fwYbuXh0zut/JdIXcfwLRYiB+GjBcHA7mpU7E8VM819W3s8n2taFhjOeRNJmfrZFfwkC5liZ9hnYHuKTTqqQqY590XpuedNW20YodTXmfKbGsUIhZpGm5sVGgT5dXIkQouMALsxafonw9FGCyr2rl7fhgZncrv3sP6GSWgtmOJ5Zqj5vlDPqYJ5KBwKINcEqxV3h/0zKR4qQ2bCTWa6rCjfepd8T63Pd9ZSmJRH2y7b12YadVS7GYpquF6bNPPZmoufRoceN0NlK/0+Ny7tkaV8cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FYbvKSTFm3B3CVuj973gWLdJJrG4Imsr8+2SkXUMuuQ=;
 b=uh1A0Gc5B0NDqnULHT9gSiB7idQlucytAIb7YlLUbDtklE8hNC7Y7zfbWC2pGjZaaxv45mkcA8ER29yyui8Ffq1OKqvdwdlT8QwHISXPRr2FlrzixqiHDZjr9FJWmCAwG5mnWrk0sBWvo280U8KB8WStsoNnQQGkUUxDiaxQN7prNAfTgV6hXzbzeX88dHkqbYFBSoLeky+gYFChh9WqSbuJLEYIC1riJkkA/pBeh38OG9Z3DHJr1m9KJupqaypFxFLfSoXqcPinwuEiV+BjhCFJqPdFrkQpUYQJpliPBqG0LVTa7O4I+9La3SsUTSLWZ3l0XcXeTl1hCrBinzMYkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FYbvKSTFm3B3CVuj973gWLdJJrG4Imsr8+2SkXUMuuQ=;
 b=f7cFMG3FCA+oVItGsMuCyuTe2u9W1VT9VVtIyM3Or7NGFLp1nIdqGGadrhPD4QLjdE86RmBYLmTw0HDAP4D7dg2COdXebxJ3EuT7SLGstgDPX+RedX/CNYIgiN76uoFFzTVmqJb4rHUspdwmIn8LcrUo1vFPowZ856LzAA37lz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by SA1PR12MB6702.namprd12.prod.outlook.com (2603:10b6:806:252::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Mon, 27 Jul
 2026 17:24:32 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 17:24:32 +0000
Message-ID: <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
Date: Mon, 27 Jul 2026 12:24:30 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>,
 Borislav Petkov <bp@alien8.de>
Cc: "Moger, Babu" <bmoger@amd.com>, tony.luck@intel.com, x86@kernel.org,
 Dave.Martin@arm.com, james.morse@arm.com, corbet@lwn.net,
 skhan@linuxfoundation.org, tglx@kernel.org, mingo@redhat.com,
 dave.hansen@linux.intel.com, hpa@zytor.com, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, eranian@google.com, peternewman@google.com
References: <b0dc49dc-ac35-457b-90c6-842a3cfcf8e1@amd.com>
 <f3fd774d-0662-4094-90b6-f0c5a4bc5d26@intel.com>
 <78996219-a8de-4dc3-90ee-db4c19e0d66a@amd.com>
 <dbbe2eac-bb0a-4655-9d0e-6e8feb702717@intel.com>
 <e77ef79c-5241-4f7c-b0af-dde6f131600a@amd.com>
 <bd739e7e-7a86-4291-9c08-f2c72bc2dc3e@intel.com>
 <48fef38f-8e2a-45e3-bb60-f293a1d60be8@amd.com>
 <c1979f4f-eabc-4d71-a711-ab465b9d9c1e@intel.com>
 <20260724231239.GAamPxZ2IZiFYRmAfg@fat_crate.local>
 <911ccf29-e152-4bf1-9773-04680bbe9638@intel.com>
 <20260727140539.GAamdls0q_W0zUmhqw@fat_crate.local>
 <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <119188c4-1127-4155-9a05-dff47e25be85@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CH0PR04CA0050.namprd04.prod.outlook.com
 (2603:10b6:610:77::25) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|SA1PR12MB6702:EE_
X-MS-Office365-Filtering-Correlation-Id: 154b480d-32a4-4d3b-2d81-08deec03ec2c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|7416014|56012099006|11063799006|4143699003|5023799004|10067099003|6133799003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	4gm9HciZOmJIWOMhKGc+2Xy2kkuf4L3Qh7Nbs/ssERP89kaV2Ym79RnmT5vkC4aiEaEq5oSdxA0uUZQJ9Piw2W6ydFkOonC0pmdL5JMYXiGuviXE3hQgsO3BWijOc7P0+0+JW81GGEDZwrZzhy7vMxX1KKEV4QrUEGmNo6i8lgGjkq2Pl2Lx0cnxCy2j1rVQZto9hLtqhripwnTM/yDJmJ9saidevM1Y+GWm0m7Zq7nU5q0gdmHIua4Rl72QXNjYpHeXjlVNb8d5iqe+a9duOYZvTawIfeJhqzHkq1OlfjcCK3qacYhjnhVocyRfd/BKjPJXmrZbHder+KRbkUNF++cgY6iuooZdRbL0n1D/10sBPcd3BUZfrZGfqM/79DYdhofQZE6A5ZEwScFqJOh/94CIUOTTDphOoZphojsOP9AjJuFYXXkbX9Pgx3vJxtLJFusgnxXrDXT6TOGqRhdoLH1gHJn0CmX3fLcFGza2cVj7dA3VxnbgcQSBDb0yCTLAORbkkym/s5+X0ubiskuqpf/wat1QSm3TuauERDWvxq8Q0DKwAwXfeCv3IafdmxJTMXlrlXYEra1ZB4iSQyscvKSvfDcH2FLW8MRo+DqnT59PKarUnAbT2MI98i0DLQbYhWCjlzAaD3VONz5TRmWWu/VwaWpjBqcUhLz8OzDvG0w=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(7416014)(56012099006)(11063799006)(4143699003)(5023799004)(10067099003)(6133799003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZytZdkNYbzhGbjJlVlJWSUkrL2NTQTkwMDAzRHVPKzFTZ01PRkxzcTJac2Nw?=
 =?utf-8?B?R0kvd2I2NCtGWERiWVVKdUF1cnpaa3phdjFGWmIxbjYwQ2xOOEFxZkFSZ09n?=
 =?utf-8?B?T29NU2V6K3Y5NUJXUU96STJUMk1NNjFzTVRsMnp4L0o4UTZkdmNkS3FuaUdH?=
 =?utf-8?B?eWQ0OGdyNWJzQll1b3ZjaDk0RTFmaFZFdkFIdDNUSnAydXgwYUMyOUtUQUJu?=
 =?utf-8?B?N0dFRkhMVm1wajlYVUdrbGZnM3UvTS9LOG1TaVppRnBEMnkvM0FQKzRYVDBX?=
 =?utf-8?B?eDFITnlaRHhOT3ZBNHFWZE5MWUFnK1AwcDhmdWFSWEhKN1NuQk5acWJwSjJY?=
 =?utf-8?B?N3BEL3BLdDRvNHQ4a01jVDRkKzRyQ1JGTkRaYTJUTVdoUWlycWQycHVnbDlz?=
 =?utf-8?B?UC8wckFlejA1QkEvaERZVkVuWUxtOWFPaVdOL2gzWWlGeFJjSlR1RHpibnNV?=
 =?utf-8?B?d0doY2g5RlV2Tm52UlBVSXVzWFZZeWRhMU5PM3RsZHBvd0l0ZDRvWmJqUTdx?=
 =?utf-8?B?cjhYTjN2OE1jeFp5bmR5OWpPYytMaUtaSnlLMzJTRHJwcW9hRVFRNHROTTVx?=
 =?utf-8?B?SlllWGkySXRZclBVek1YN3hOQU12Zm91YU5EK1hiK2F5dWtGV3ZFaXhTTnVQ?=
 =?utf-8?B?ZUZBSHhiREFwM2VvTE45S1Q3bWZYL3lMUFg2Rnh2VFVqR3B4UUJhcDRnYm5T?=
 =?utf-8?B?ZXRkUTVaNkduREtVRmU5OXZTNmVCeFFzbnNJeEhadzJBUzNYdFYzWElSWWs4?=
 =?utf-8?B?NTF0Vk03S0xqaDNoK3YwbkxYdTVJeDRoVGVEQVkwR09RSkRwR05HNEx0Q2k0?=
 =?utf-8?B?eEt5dStpYnQ3UVhleUNyNG11TWZyR3Qwdi9XdHVoSldhRXU5M1NSRlpOTWpn?=
 =?utf-8?B?WThTVTNwZTVNWG0rVFppQTNtS2UvZjRJTUVSNXJ1ZXp1YjVXS0wzU0lMcGUy?=
 =?utf-8?B?UVk2aURhS0pLU3B0RXp0ZzVUdms1dVF2OHVGdEJBZy9Ub1UrcXFTbUkycVB5?=
 =?utf-8?B?YWlDQmZDUWJ4NEt3eFhiWmZqZ3FVV0JuMXhRaUZxeHFueG4yRzM4YzVUeG12?=
 =?utf-8?B?UmNJVjdkeEtuWkhCcDlOTHI4d0JlcDVKTENnZmpjR0lhMXEwSUhzMUxNSU5U?=
 =?utf-8?B?c3FybEY1T2FRSmhZd0wxTnRUS3dqUmplL2NuMUJtNXgxdUs2R2NQc0pKL1d5?=
 =?utf-8?B?TWFJZnJoMlRHRHA1b2VZOUhxQnR4anpBS1dRM0c2dStHU09ndGxOSy9DOGVW?=
 =?utf-8?B?ckt2UVNCZ28zOXc5Sy9kMTlaYmNxWDNROGFva0FmZkdsNDNkVUdVenRqRXQv?=
 =?utf-8?B?SWNGQVg4YVlpYVlZWGg0cmZ5azRQdmxKc1BEVUkrTy83WEtadjFxVzJ6VTRI?=
 =?utf-8?B?SE8rb1VidDBRTHorOWNLNVVpVlo1TUZzYWFLb0VnckRsZzRqVmk5dHJYZkxj?=
 =?utf-8?B?OXJ5QkE3d092TXIrbytOaWQwQ0Q5WVRHU1RjNFVkSjV3dXJEeW95TVRpYmd5?=
 =?utf-8?B?TElaYmhYdEdVMml3eUx0MDl5VWFVem5CckpRMU5pUDhyMS9POXowUGFaWFMv?=
 =?utf-8?B?VTlKeFdUYUM4eEtlVFBRR3Ard3VQeklZUnpRY1JtcXZ0MWVCZzZ2NkxFNy9Q?=
 =?utf-8?B?WE45d2d3NTE0ZjJsaEdLV2t0NXNwUkdwcmg1TW5pdlhaVkFsd1FYVU1UVUMx?=
 =?utf-8?B?UUdsUndMYmtoNHV4MEZHZUNKdEFDSlZTdm5BZkZUTE50ajNtOXBzR1JiQW5Q?=
 =?utf-8?B?a0REQUl3SmpiTERTVWxVNUkzS0N0cmVrZXUxMk1UK1BXL1plcWRxQjlLTVNz?=
 =?utf-8?B?T0oyckNWKzNYSWFXZy82WVVpYmgzdVVvRTZFQjQzU1Jzd3pZaXJaMCt1WE5o?=
 =?utf-8?B?emp3UTlrVzVIZ3c5b2dlTmc0Q1FtSHYwR0pRSXpyZnZBWHo3bGJpY2REQUtk?=
 =?utf-8?B?RGZRWEorY25WenF5MDlGOVdsMDZRVkFGN0xpOWh2cGxQb3F5WnNwdzEzekRy?=
 =?utf-8?B?TmI0a0ljUHU0OVE3L2IvaUNvdmV5RXR5czJTNUovbUxmcEJpTDlES1RrT1FF?=
 =?utf-8?B?dXIxdXhydEhFMnF0NWR0M0kzREVSaHJpMTZWYm9NRzZHR2JCY21XZnFlNytF?=
 =?utf-8?B?RWFISExhWWRTU2VRS3N6L1FITnpFbG9hNDhaRDY1ZFFXWHNZTjVOVURqRGlE?=
 =?utf-8?B?YUoxM0pVY2x2M3hYcFJ1UXJEMlMvQVRwcW1BNUprTFdkdk1PM2orT0ZKbWJE?=
 =?utf-8?B?aHI2bVRzM1lkRXozckdNdzJQWUc0S3NZOXR0ek1ZOHFkL0crNU1sVjlyTXcz?=
 =?utf-8?Q?IKHVFKZbE4Cl+eslo+?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 154b480d-32a4-4d3b-2d81-08deec03ec2c
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 17:24:32.5667
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TSbivL2fkDjDubVnse8atpKcZ2RFAcM7NH2RA1Ylj8vs31fYLcBtQiJm6b6awA6k
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6702

Hi Reinette,

On 7/27/26 10:25, Reinette Chatre wrote:
> Hi Boris and Babu,
> 
> On 7/27/26 7:05 AM, Borislav Petkov wrote:
>> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>>> One clarification here is that as I understand there has not yet been
>>> an actual user complaint. At least not that the pqos utility mentioned in
>>> this thread is aware of. Instead I struggle with the speculation about possible
>>> user complaints with different interpretations on how this change could be
>>> perceived by users.
>>
>> Sure, but don't you think that it is enough that we know about it?
> 
> Only if we are sure that we have the complete picture. I do not believe we do, yet.

We already have an issue open for this, and it is fairly straightforward 
to reproduce. Please let me know if there is anything specific you would 
like me to try.
  >
> I connected with the friendly pqos folks on this issue. They subsequently did an audit of
> the tool to understand how it may behave under the different scenarios. They found that
> the tool currently parses text return values ("Unavailable", "Unassigned") as zero.
> This could cause incorrect behavior. (more below)
> 
>>
>> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
>>
>> And is the
>>
>>    pqos -m all:[0-191]
>>
>> invocation not something people would usually run?
> 
> ABMC enabled (mode claimed to be incompatible with pqos)
> --------------------------------------------------------
> This example is from Babu's email that highlights that when ABMC is enabled this returns
> zero as bandwidth from pqos perspective. This matches the pqos audit that found with text return
> states, like the "Unassigned" happening underneath the output above, the return value is zero. When
> the counters are not assigned then the events will always return "Unassigned" (until reassigned)
> so having it return zero all the time may not cause issues. Once reassigned the event value
> will always return a valid value (no text return values).
> 
> ABMC disabled (mode claimed to be compatible with pqos)
> -------------------------------------------------------
> Without ABMC there are scenarios when events may return "Unavailable". These scenarios vary
> based on how many monitor groups are created and the workloads run. I am not able to test this
> but when I attempt to combine what I know about AMD bandwidth monitoring with the results from
> the pqos audit I am concerned that there may be a problem.
> 
> Consider a scenario where an event may return "Unavailable", for example:
> 
> <return A>, <return "Unavailable">, <return B (larger than A)>, <return "Unavailable">, ...
> 
> pqos will see:
> A, 0, B, 0, ...
> 
> The "pqos -m" usage attempts to determine the bandwidth rate and, for example, when going from
> "A" to "0" it will be considered counter wraparound that would appear as a very large and
> wrong bandwidth number.

Yes. Agree.  This is known issue.

> 
> 
> Question to Babu
> ----------------
> Do you perhaps have a test/workloads that, under "default" counter assignment mode, can create
> many monitor groups (more than 64) and cause "Unavailable" to be returned frequently? Would it
> be possible to put pqos through its paces in this environment?

Yes, I tried to reproduce the "Unavailable" issue with the pqos tool.

So far, I have not been able to observe the issue. I created 64 
monitoring groups, ran MLC, and simultaneously executed pqos.

The issue has not reproduced in any of my tests so far.

This might require specific test scenario to recreate.

> 
> Of course, "AMBC disabled" scenario also includes AMD systems before ABMC was introduced. I do
> not know why the issue with "Unavailable" handling (text returns in general) has not been reported
> until now. I assume the pqos team may do most testing on Intel systems that do not return text.
> 
>>> When considering a change like this, should it be a stable candidate to
>>> help reduce the number of kernels with different behaviors?
>>
>> Yeah. It needs to be minimal too for easier backporting.
> 
> ack.
> 
>>
>>> The patch notes mention that this change is planned to be reverted at some
>>> point in the future and I have not heard of any changes to this plan.
>>
>> Where does it say that? I don't see that aspect.
> 
> For convenience, copy of patch notes from original commit [1] is below:
> 
> 	There are plans to enable "mbm_event" by default once additional counters
> 	are available. For now, keep the default mode to maintain compatibility
> 	with existing tools.


I added the text below in the comments section (after ---).

On second thought, that was probably my mistake, and I don't think I 
should have added it. I also don't see this happening anytime soon.

Considering all of this, I believe it would make sense to make the 
"default" mode the preferred mode.

Thanks,
Babu

