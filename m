Received: from SN4PR0501CU005.outbound.protection.outlook.com (mail-southcentralusazon11011014.outbound.protection.outlook.com [40.93.194.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BCAF3A6417;
	Tue, 28 Jul 2026 17:25:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.194.14
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785259533; cv=fail; b=cUCtdHUn6hWLsABXA3o1bvm2HwFOO3l57/TB0Agxrln1LmgUV4p8K/zf3+h2UxBAViGJBG+56hRS+8eTrT4hOv93Q9IhZHd7CqY4XBhvQOVpkySHgf50JW3tRw2xvOWlVO/ShBcbEjkCCOwv+EzFAwvnH9KSib5WSPybOfNA464=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785259533; c=relaxed/simple;
	bh=vun4P2eVacQaHxH+T/45O/H7sCB+xJJQNRr/xOa80+Q=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=HbFlM2JQgMJ8p5Xno87Z1dw/H/wsmtWxrroGDQXth4SU7LU9MLdhT/SO6eJJcQ/877Nd2fDTUwUI1aLZcYJXZk9BEAgn1ttF0WB5ddLadDhn7UBsM+bWLXPwytiFWrPD16Zm5gSfUb8fHqINyW4Mgink+QaBToof6lmQRTq44jE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bq62lsAK; arc=fail smtp.client-ip=40.93.194.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bq62lsAK"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=le+bBkyji3/drOuZcLmrIOzvjxga21nxqEi7/eY1dXgOTf1ipMtbdEK6b66sEr8g2D2WUJ3wVJI9QBGddx9REEV1pOtEWHYhGVe+uousie1NIF11uZGwaei/838xqHn/l/OPxCu/V7N9I7SqX5n6za9/JR/znU5ysQptQNYGwBHX5hSWKEPpIPS1tbOmGlmKU9yumxfSU9O+H0y70bzp2xuT0eWVLGhbjsCU0sFpGUTlE6wuL1lB3i+gM0IYQip+XMPFZ4Nd1sx0TReSrbkf8r/m0ZMqXaBire1aR6aeYFttguitXliu0Sd8ev0ZUjPVh+W4LpIYc720gCbr4yddtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IHwBa6zDR2jAZ4qHBN5d7ZnAZbhA6mwM6S+kxRl7H/g=;
 b=kS+BBN1Wnx9N9PX3eKiQTI8QKJkaur4JfOM5fO+nEReeL+Cb7a91mUSpcHmlzjyqQmuXNZpeKeif8HeISJ1h/dbW5YkGF8/O2wftMHoeY5yHP79nolrBjQMoj18Y8rRCBy58bkrfDVeFWFN0vx7YdaD86FgEPFgN16cwE2oxc1FvV0EL5eOE5otx1Sb8POIlIbnSxJ4GLzKskSjLKpHPL3mTlyIS/SsPZQx3spl9vu9n0qyaSYhdywaAjg8nhK7qz1KEmf88oFql5YEkb0rdycKvBM90dpnJLsDXo2o/lOcQ/rNDj+fBxyNeh1wGBE/5mSvrYeXNChZukssHQGVL+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IHwBa6zDR2jAZ4qHBN5d7ZnAZbhA6mwM6S+kxRl7H/g=;
 b=bq62lsAKxSi+RZpOYqnMGGq+51nCl0Dd/OZ1s5kyGP5KebQ6/CKXzcg7MPui7ZKiuoFjBEacR4y8suULziIfGZu9dbCMoFcr4RlmJ2Fh0MFFjj2tL+KGS/KCvwYUPWJKQhPyNayz7PMoL/gh5Xu+bX85Vedas4Q2+idgXS60BDM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by IA1PR12MB8287.namprd12.prod.outlook.com (2603:10b6:208:3f5::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.13; Tue, 28 Jul
 2026 17:25:25 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0270.009; Tue, 28 Jul 2026
 17:25:25 +0000
Message-ID: <4e961028-0a68-42a9-a681-a02736cdafc3@amd.com>
Date: Tue, 28 Jul 2026 12:25:23 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Reinette Chatre <reinette.chatre@intel.com>, "Moger, Babu"
 <bmoger@amd.com>, Borislav Petkov <bp@alien8.de>
Cc: tony.luck@intel.com, x86@kernel.org, Dave.Martin@arm.com,
 james.morse@arm.com, corbet@lwn.net, skhan@linuxfoundation.org,
 tglx@kernel.org, mingo@redhat.com, dave.hansen@linux.intel.com,
 hpa@zytor.com, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 eranian@google.com, peternewman@google.com
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
 <7469f2ae-10ed-4b30-a8c3-9d786c99c746@amd.com>
 <d2c4e17c-2aa3-43a6-980f-ab4bac769852@intel.com>
 <5a8815ce-487c-4ec3-8c38-d9b3c067302f@amd.com>
 <62559344-5182-4d16-a9ad-e22163b20e7a@intel.com>
 <d393895a-9763-401d-a04c-90bf15f7e9f5@amd.com>
 <386b441c-286a-41e5-b878-50a6debb7571@amd.com>
 <77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com>
Content-Language: en-US
From: Babu Moger <babu.moger@amd.com>
In-Reply-To: <77f77d02-fae7-401d-9bb5-c62b244d23cd@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: DS7P220CA0047.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:8:224::15) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|IA1PR12MB8287:EE_
X-MS-Office365-Filtering-Correlation-Id: f5b40e7c-d339-48fd-e9bc-08deeccd3642
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|4143699003|56012099006|11063799006|10067099003|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	EWQER9S5hPR1kR2luFU15zbpxGldNQOb5gPnAKkYqWesBF8C/GZZxtzMJa4623Bzpv1gTGT7N3qK89FaNkZUIPBypsZgOki3B4a0eBwOxvG0h+Aet0feU6dW4mn08HccwVbI03CuDZ2rFaft/l2ujhcRhqpbxrRpt7apWSpApdb1O3AAo6QnGDjNSPQAbRAjRqguuFd4SM/Bhjc3IakfJhIbF0/bmnWNUEa/2JAxnqon00Fj2f4lwUNeHegXfFJKl2uvUawyFUqINMciYxINhTJ6hzHiqd1QgB92TYuB31NQ753loBgwr+ieeaxMu/lKyBS7erKF8PlCjPG3WZ65fEEuGQQy34xfL2QF2u3UBsutgW/OicL/dNq3tv7MAG6sIUOiqQ3Wu1Y1LdJUMIPfLRP3RH+ewzCfCbUf2PHYdD+Jexo8yhjzfpcIEgthUmRV/zdAH6EvPdVgD5n1wzvBTye0I8tGS7FOdXHUNvwBWOSoK3QZ+2scMwroe++Wb+ByeiKrP8IVqXSQGyyRU1ZJlA92zAgNecJNxil5HGnCOjdPfdM2T4otub2LjFpzwLhdd899VYJwt4EXbGYaaJ+UV04ZqhA60MjrdHOtOzXD9YcFTCLr30/1LtdNnkyDyg2ZYoMIW6LcOoqDgUMltVszrrHSeCp2mFuzvSWlb0wvvOo=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(4143699003)(56012099006)(11063799006)(10067099003)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?djBUcEg0Q3phSmRxaHlRbzRQMGxLQXkyV1ZweDdmQ2ptc3J0L2xrVzdBVU1W?=
 =?utf-8?B?c0Nic1o5V0cvMjY2K1hPVnh0Z1Nrc0c5Njh3dnZCQklGU3VieE5MMEg0Wi83?=
 =?utf-8?B?amt6dGVwSldrbVZLRTJyZ0llZnJxalZDZUVpTmtyVERkdVB0VkJyNFNRTHVp?=
 =?utf-8?B?Y1dDUXc4TCtjWlo0aWFFOWs3by9jQlFGM1FHQUdSRFI4ZTIxV0xXZXhLQzQ0?=
 =?utf-8?B?QUpVeXppL1UxRlZvMU9tTnM0T05tUTVKV1RmTEVXSnA0YVJ0aWxESGJaM21m?=
 =?utf-8?B?NW9IbFNqbDdLM0ZKU1Y3L1pReXZLVU1OL3lEb2FIOEpzVGhJNnNPNmxqa2l5?=
 =?utf-8?B?VHhBWXQyTzBWY2pmS1Y3N3dUU0NDdFZ0c0hSSDkrdzAvYlZ5SHc5R2xCR1B2?=
 =?utf-8?B?Q2hoeEhwZFVkc203M3oxS3paL1Z0K0RiTlo2cVdlQ05melhjUHpTam1KOVk2?=
 =?utf-8?B?eVVYcHEwK0s1Y0ZyTVppeng5SWpDSkZqY1hZMnFIVXlVL3B0dU4wOGdTT1JC?=
 =?utf-8?B?NkdxSGNWOXVJNXJUbjFQZVRPRTNVU3E5d3JleWsybGVCQ2I0STVISVhKK3l2?=
 =?utf-8?B?SG84UGtjRmJaT1JiTW0xUXR4Ym5INUVyZEtVYmhoMnZja1RrTElLRktiNEk3?=
 =?utf-8?B?b3Nnb3hHY0hoSExDa2daRXM1ODZVc3Ntejl6dXNCaHpyU21XT3pLaTBpOThM?=
 =?utf-8?B?cEZ4U1RtREw1RncyZkUwbngyd3djQndteXJkWkl1L3c4RXhrSVNNWTBwVXl1?=
 =?utf-8?B?NVdNR2YrMVlpTzlYRzVTT2lHVHEzczBMcEpYQmhzRjlBOURSOHJiMTMzblo3?=
 =?utf-8?B?NkVhcmNzUFF5alc3eGEyOWYzcFAxbWNOUVRmYkYvWnNzNVQ0M2tFMDFLcHpm?=
 =?utf-8?B?ZE1EYUdQTVE4Qnk2ZEhLZjJFRjNZYms2V3JIYVQ1K0l6elpSZzBZa1o1ZDNB?=
 =?utf-8?B?eTZqSnJ0SGtPcEFGUUV0OGV2YWtpMmlWVUhoWG9WS1pja3JmNTh2Q2FWSitM?=
 =?utf-8?B?bHV2aDFaSTEydncyKzBQZFZ5bnVLRUJXM29zTWFrM0tDRHhYYzhIeFdpYTdr?=
 =?utf-8?B?VmxOUmpKVWpkcWw2VVRKeFlFS2dWV25HRXBlaW5reWw1SHlrSVlmN0cxc3Jh?=
 =?utf-8?B?VEZuRVM3c3U3OThaTVVvQ0ZabVBNRWVWVGQySWI1ZnNHT2RXdzh3MUF3ZzhF?=
 =?utf-8?B?VHd1czZLNld6VkxIQmUwTHJJZnVSYjhzcnNKZGxqcEpwbXJRR0p2SkFld2s3?=
 =?utf-8?B?VHJTL1ZrNGtwbmQ0eDZUVW5uejZIdnFxTGl0Snpzb0xMYkZIWXFEU0dIYm8y?=
 =?utf-8?B?R2lEMkU1L0lyMFNmTkZ3NDkyWStCZU80ZkFzOHVNamwvaFlPYjhkV1JVUXBE?=
 =?utf-8?B?Wk5KZkllQWlvN1pTN3JJVU5jU2w5NWhnSkl0OHpnRUplZmNuZjRkbXZaSk1y?=
 =?utf-8?B?djdEbkdiaGJmZXZlNDNZM01QVEMwRTh4dnFSTmJjUWhMOVEydUd4NHdoYWp5?=
 =?utf-8?B?TUZTZzdqVURsM293L01DMTZaZkhCOUVkYmJxS1FsczBFUndCeEJoVk1XenhJ?=
 =?utf-8?B?eXZ1dzNpUDRwd1dHQmYyNGtZUGdCODN6K3NOYnpBL2hPTkJhYm9mUG5TekV3?=
 =?utf-8?B?UWswVWZlRWxVSmFkaStBaEJBRjI0WTZzcGZZSk41QXRySVZTUjJpdk5aMGgr?=
 =?utf-8?B?N0VvSFJudzI0cjVzMW5BU3MrOFFiUk1pRTI2Zmx1cmVyVFdaeXFXRFBNNFhS?=
 =?utf-8?B?dno3eG9yS1h1QkpWbUJTS1h2ZHNVS3hBbU53SFZEMHJ4eVRVVlgyMS9GTTkr?=
 =?utf-8?B?eHRsanpGb0NpYWRtR0FMNlFxZ0R1aHR1Q0xKcFEyT0w5ZWdkUnlSQjVDRElq?=
 =?utf-8?B?Rk5qemlQRUtmL1Y4b0toTkpyVzhDNnlPOGp4cS9hdVVpYjNManZBbjlodGhR?=
 =?utf-8?B?SGM3TTR1K2NiandkTDJwSHgwcjdDcEV2RTR0d2tTWmJqVGhhSEtHaDJzeVl4?=
 =?utf-8?B?eHprUDZjWXlab2crSkxGbkxsWmZLMlNodDF0NEIxWHh5WXJHeTBIdm44VHBk?=
 =?utf-8?B?NXl3dllNY2tTSjhaVmlZWHJ5SFBSSGZIbGQ3YkNTb2NLT3BQTTU1NjIrMDI3?=
 =?utf-8?B?TkdtVEQrWlNiM052VzFmNWhTZlp3UThkTlJRemVzeGlERUtlT3phN1lCL0RJ?=
 =?utf-8?B?TDJwZldzZ1NUQjJjcU1yRkhRQ09Qa3daTGtaeStmL2RGQlZUeTdrR3JnL3pN?=
 =?utf-8?B?MHQvMzE5cERSYkl4Y0JXR3R4UmZCVENCZ1dMWmlGUkFmendHQ2NEUEptNmZ0?=
 =?utf-8?Q?fE4QmqvnhxMiBO3dkq?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f5b40e7c-d339-48fd-e9bc-08deeccd3642
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jul 2026 17:25:25.7116
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zimqtWIwN7qcFB9nl7FkMWpwt36jKyFqNRD49LiKbh/yJ1O8BopzZ6Qld6HGXzXv
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8287

Hi Reinette,

On 7/27/26 19:29, Reinette Chatre wrote:
> Hi Babu,
> 
> On 7/27/26 4:29 PM, Moger, Babu wrote:
>> I still have to get back to few questions(test details etc..) on this thread. Let me get back to on that later tomorrow.
>> thanks
> Don't bother.
> 
> I just installed a distro version of pqos utility and modified resctrl to return "Unavailable"
> once in a while on an Intel system.
> 
> Below is the output on an idle system that confirms the pqos team's analysis that
> it perceives counter wraparound when there is none. This is when I run with something like
> "pqos -m all:0-143" to show all counts. When I run with "pqos -m all:[0-143]" to provide an
> average I see the number repeatedly jump to the large number and back over time.

That is interesting. I am not able to see "large number issue" on any of 
the machines. I ran it on three different machines with threads upto 255.

Here is the output from one machine. Ran both "pqos -m all:0-191" and 
"pqos -m all:[0-191]".


CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
        0        0.00       1238k       256.0        69.6         0.1
        1        0.00        290k      2528.0       162.6         0.1
        2        0.00        284k       512.0       162.1         0.1
        3        0.00        291k      2688.0       162.3         0.1
        4        0.00        286k      2464.0       161.7         0.1
        5        0.00        283k      2784.0       162.5         0.1
        6        0.00        287k      2496.0       161.4         0.1
        7        0.00        280k      2464.0       161.8         0.1
        8        0.00        430k       704.0       140.0         0.1
        9        0.00        425k       928.0       143.8         0.1
       10        0.00        429k       864.0       143.8         0.1
       11        0.00        422k      3808.0       143.8         0.1
       12        0.00        431k      2976.0       143.7         0.1
       13        0.00        429k      3488.0       143.8         0.0
       14        0.00        428k      3168.0       143.7         0.1
       15        0.00        427k       544.0       143.9         0.1
       16        0.00        440k       768.0       141.1         0.1
       17        0.00        432k      1152.0       144.4         0.1
       18        0.00        425k      1088.0       144.1         0.1
       19        0.00        386k      1504.0       144.7         0.1
       20        0.00        389k       768.0       144.6         0.1
       21        0.00        429k      1536.0       144.1         0.1
       22        0.00        382k      4608.0       144.5         0.1
       23        0.00        431k      4992.0       144.3         0.1
       24        0.01        872k      2432.0       425.8         0.1
       25        0.01        889k      2208.0       432.8         0.1
       26        0.01        908k      2144.0       432.6         0.1
       27        0.01        902k      2432.0       432.7         0.1
       28        0.01        863k       608.0       431.3         0.1
       29        0.01       1562k      2368.0       434.1         0.1
       30        0.01        903k      2368.0       430.5         0.1
       31        0.01        878k      2432.0       431.3         0.1
       32        0.01       1578k      4256.0       421.1         0.1
       33        0.01        872k      1056.0       424.4         0.1
       34        0.01        898k      1088.0       423.8         0.1
       35        0.01        875k      3904.0       424.0         0.1
       36        0.01       1259k      2336.0       424.0         0.1
       37        0.01        869k       896.0       423.6         0.0
       38        0.01        842k       576.0       422.8         0.1
       39        0.01       1535k      1824.0       424.6         0.1
       40        0.01        893k      3552.0       425.9         0.1
       41        0.01        859k      3584.0       433.1         0.1
       42        0.01        915k      3584.0       432.4         0.1
       43        0.01        899k       704.0       432.9         0.1
       44        0.01        907k       960.0       431.5         0.1
       45        0.01        883k      3392.0       431.8         0.2
       46        0.01        867k      1088.0       430.1         0.2
       47        0.01        884k       736.0       430.9         0.1
       48        0.00        200k       800.0        66.3         0.1
       49        0.00        197k      1120.0        67.8         0.1
       50        0.00        193k      2560.0        67.5         0.1
       51        0.00        195k      3744.0        67.7         0.1
       52        0.00        188k      1408.0        67.5         0.1
       53        0.00        190k      3616.0        67.5         0.1
       54        0.00        188k      2432.0        67.2         0.1
       55        0.00        189k       960.0        67.3         0.1
       56        0.00        201k      1344.0        65.9         0.1
       57        0.00        201k      2464.0        67.4         0.1
       58        0.00        194k      1184.0        67.8         0.1
       59        0.00        196k      1632.0        68.1         0.1
       60        0.00        192k      3776.0        67.6         0.1
       61        0.00        191k      2432.0        67.8         0.0
       62        0.00        190k      1184.0        67.6         0.1
       63        0.00        193k      2752.0        67.7         0.1
       64        0.00        204k      1184.0        66.5         0.1
       65        0.00        197k      2816.0        68.2         0.0
       66        0.00        191k      1824.0        67.9         0.1
       67        0.00        193k      2016.0        68.1         0.1
       68        0.00        191k      2272.0        67.6         0.1
       69        0.00        192k      1568.0        67.9         0.1
       70        0.00        190k       640.0        67.4         0.1
       71        0.00        198k      1440.0        67.4         0.2
       72        0.00        208k      2752.0        67.0         0.1
       73        0.00        200k       992.0        68.6         0.1
       74        0.00        194k      2848.0        68.1         0.1
       75        0.00        194k      1376.0        68.3         0.1
       76        0.00        193k      1024.0        67.9         0.0
       77        0.00        195k      3424.0        68.2         0.1
       78        0.00        197k      3680.0        67.9         0.1
       79        0.00        195k      2464.0        67.9         0.1
       80        0.00        204k      1696.0        66.8         0.1
       81        0.00        205k      1376.0        68.5         0.1
       82        0.00        196k      2176.0        68.2         0.0
       83        0.00        194k      1536.0        68.5         0.1
       84        0.00        195k      2656.0        67.9         0.1
       85        0.00        197k      1472.0        68.2         0.1
       86        0.00        200k      1600.0        67.6         0.1
       87        0.00        194k      2208.0        68.0         0.1
       88        0.00        198k      2176.0        66.4         0.1
       89        0.00        190k      1856.0        68.0         0.1
       90        0.00        192k      2720.0        67.7         0.1
       91        0.00        187k      1856.0        67.9         0.1
       92        0.00        191k      1440.0        67.5         0.1
       93        0.00        187k      1600.0        67.7         0.1
       94        0.00        192k       992.0        67.3         0.1
       95        0.00        192k      1728.0        67.5         0.1
       96        0.51        178k        64.0         8.4         1.8
       97        0.00        279k      2752.0       162.5         0.1
       98        0.00        288k       544.0       162.1         0.1
       99        0.00        284k      2464.0       162.4         0.1
      100        0.00        286k      2272.0       161.9         0.1
      101        0.00        288k      2464.0       162.6         0.1
      102        0.00        289k      2848.0       161.5         0.1
      103        0.00        286k      2400.0       161.8         0.1
      104        0.00        414k       544.0       143.9         0.1
      105        0.00        433k       992.0       143.9         0.1
      106        0.00        428k       960.0       143.7         0.1
      107        0.00        425k      2560.0       143.9         0.1
      108        0.00        414k      2368.0       143.9         0.1
      109        0.00        426k      3520.0       143.9         0.1
      110        0.00        425k      3648.0       143.8         0.1
      111        0.00        424k       640.0       143.9         0.1
      112        0.00        420k       736.0       144.4         0.1
      113        0.00        432k      1088.0       144.5         0.1
      114        0.00        433k      1248.0       144.2         0.1
      115        0.00        382k      1600.0       144.8         0.1
      116        0.00        378k      1568.0       144.5         0.1
      117        0.00        434k      1280.0       144.2         0.1
      118        0.00        383k      5344.0       144.3         0.1
      119        0.00        433k      2880.0       143.9         0.1
      120        0.01        855k      2144.0       430.8         0.1
      121        0.01        894k      2048.0       432.1         0.0
      122        0.01        916k      2336.0       431.4         0.1
      123        0.01        894k      2272.0       432.0         0.1
      124        0.01        860k       608.0       430.1         0.1
      125        0.01       1549k      2592.0       432.9         0.1
      126        0.01        914k      2432.0       429.8         0.2
      127        0.01        876k      2368.0       430.2         0.1
      128        0.01       1590k      5184.0       426.2         0.1
      129        0.01        874k       832.0       424.2         0.1
      130        0.01        897k      1056.0       423.7         0.1
      131        0.01        869k      3776.0       423.8         0.0
      132        0.01       1248k      3136.0       423.6         0.0
      133        0.01        868k      1120.0       423.5         0.0
      134        0.01        839k       576.0       422.7         0.1
      135        0.01       1556k      2336.0       424.7         0.1
      136        0.01        877k      3232.0       431.7         0.1
      137        0.01        858k      3552.0       432.9         0.1
      138        0.01        917k      3360.0       432.4         0.2
      139        0.01        899k       832.0       432.9         0.1
      140        0.01        904k       992.0       431.4         0.0
      141        0.01        885k      3232.0       431.7         0.4
      142        0.01        884k       768.0       430.2         0.0
      143        0.01        896k       992.0       431.3         0.1
      144        0.00        189k      1440.0        67.9         0.1
      145        0.00        189k       544.0        68.1         0.1
      146        0.00        191k      1824.0        67.6         0.1
      147        0.00        189k      2944.0        67.9         0.1
      148        0.00        192k       896.0        67.4         0.1
      149        0.00        193k      2880.0        67.8         0.1
      150        0.00        189k      2944.0        67.4         0.1
      151        0.00        192k       832.0        67.5         0.1
      152        0.00        190k      1088.0        68.2         0.0
      153        0.00        200k      1408.0        68.3         0.1
      154        0.00        194k      2016.0        67.9         0.1
      155        0.00        192k      1632.0        68.1         0.1
      156        0.00        192k      1312.0        67.6         0.1
      157        0.00        194k       224.0        68.0         0.1
      158        0.00        191k       768.0        67.7         0.1
      159        0.00        190k      2560.0        67.8         0.1
      160        0.00        184k      1568.0        68.1         0.1
      161        0.00        191k       640.0        68.3         0.1
      162        0.00        196k       672.0        68.0         0.1
      163        0.00        192k      3040.0        68.1         0.1
      164        0.00        188k      1344.0        67.8         0.1
      165        0.00        195k      1376.0        68.0         0.1
      166        0.00        191k      2624.0        67.6         0.1
      167        0.00        204k      2208.0        67.3         0.1
      168        0.00        190k      2656.0        67.4         0.1
      169        0.00        198k      1984.0        68.5         0.1
      170        0.00        195k      2048.0        68.0         0.1
      171        0.00        199k      1696.0        68.6         0.1
      172        0.00        201k      1664.0        67.8         0.1
      173        0.00        197k      1696.0        68.2         0.1
      174        0.00        194k      2176.0        67.9         0.1
      175        0.00        194k      2560.0        68.0         0.1
      176        0.00        191k      2304.0        68.8         0.1
      177        0.00        195k      1056.0        68.9         0.1
      178        0.00        194k      2176.0        68.6         0.1
      179        0.00        198k      2112.0        68.7         0.0
      180        0.00        196k      1632.0        68.3         0.1
      181        0.00        193k      1184.0        68.4         0.1
      182        0.00        201k      3040.0        67.6         0.1
      183        0.00        186k      1920.0        68.6         0.1
      184        0.00        185k      1824.0        68.4         0.1
      185        0.00        195k      1152.0        68.4         0.1
      186        0.00        191k      2208.0        68.1         0.1
      187        0.00        195k      1984.0        68.4         0.1
      188        0.00        192k      2496.0        68.0         0.1
      189        0.00        194k      1888.0        68.3         0.1
      190        0.00        191k      2560.0        67.7         0.1
      191        0.00        194k      3392.0        68.0         0.1



     CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
    0-191        0.72        641k      8832.0         3.6         0.0

     CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
    0-191        0.72        800k     10496.0         4.0         0.1


> 
> In summary I see:
> - pqos utility does not support all scenarios of memory bandwidth measurement
>    on AMD systems without ABMC active. pqos may intermittently report very large
>    and incorrect bandwidth numbers.
> - pqos utility reports 0MB/s when there are unassigned counters on AMD systems
>    that support ABMC (and it is enabled).
> 
> As I mused earlier (https://lore.kernel.org/lkml/119188c4-1127-4155-9a05-dff47e25be85@intel.com/),
> I do not know (and can thus only speculate) why the issue with "Unavailable" handling has not
> been reported before.

I don't know. I cannot reproduce it on my systems.

> 
> If you are expecting more pqos usage on AMD systems then users may encounter output like
> below more and more until the fix is created and propagated to users. (sidenote: You may
> want to participate in the fix since it may involve exposing the text state, including
> "Unassigned", to users where currently it is 0.)
> 
> Considering this, could you please confirm that you consider default mode the best
> choice? After all, "it will make things keep working as it used to", which sometimes
> will look something like:

With ABMC enabled the output look something like this all the time.

CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
        0        0.00       1259k       288.0         0.0         0.0
        1        0.00        240k      3360.0         0.0         0.0
        2        0.00        299k       576.0         0.0         0.0
        3        0.00        297k      3040.0         0.0         0.0
        4        0.00        296k       736.0         0.0         0.0
        5        0.00        241k      3328.0         0.0         0.0
        6        0.00        302k       928.0         0.0         0.0
        7        0.00        298k      3424.0         0.0         0.0
        8        0.00        434k       608.0         0.0         0.0
        9        0.00        430k       864.0         0.0         0.0
       10        0.00        432k       832.0         0.0         0.0
       11        0.00        428k      4320.0         0.0         0.0
       12        0.00        437k      3232.0         0.0         0.0
       13        0.00        394k      1440.0         0.0         0.0
       14        0.00        428k      4320.0         0.0         0.0
       15        0.00        428k       992.0         0.0         0.0
       16        0.00        443k       864.0         0.0         0.0
       17        0.00        432k      1280.0         0.0         0.0
       18        0.00        438k      1056.0         0.0         0.0
       19        0.00        443k      1760.0         0.0         0.0
       20        0.00        385k      1248.0         0.0         0.0
       21        0.00        394k      5440.0         0.0         0.0
       22        0.00        393k      2336.0         0.0         0.0
       23        0.00        438k      4320.0         0.0         0.0
       24        0.01        927k       480.0         0.0         0.0
       25        0.01        937k       800.0         0.0         0.0
       26        0.01        909k      2464.0         0.0         0.0
       27        0.01        923k      2304.0         0.0         0.0
       28        0.01        918k      2400.0         0.0         0.0
       29        0.01       1589k      2784.0         0.0         0.0
       30        0.01        885k      2432.0         0.0         0.0


I will leave it you maintainers to decide. I believe all the relevant 
information has been shared at this point. Let me know if you need any 
more information.
Thanks
Babu
