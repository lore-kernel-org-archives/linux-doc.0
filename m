Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012011.outbound.protection.outlook.com [52.101.48.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FB2443031F;
	Mon, 27 Jul 2026 23:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785194991; cv=fail; b=JnQ3m3aocnYSKz2PfucpjuIKng9qAKsDQrdK1rakOhqPBV//Ia4g52STiaIp/kfH5y/JFQ6ZNAU+ajbdczMKLuhku7R0It9Czlq1Z2MyL6S4Q6F5RN1zKCruJcFZzl9ilOFVIiOeBipfA8V8ia+POamPStnAhVih57uwyd1Ep4I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785194991; c=relaxed/simple;
	bh=QQvdVEixetMGVzx6IAhJ0jHGwmsbPuWfXiU8fwAH/78=;
	h=Message-ID:Date:Subject:From:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=Jp8cAXoJLiPXDhYNC/B0kEVZDC/F4Ijc6PpedLPqUTDuL2PNvwSbdjXOJnBoELizqojLohfEbAtKTebcLrnk9MbbXj1nC7CsHzdaqN/JPjMESCajr2E7DneesaE9tDRYhrj8a3XEqwfp8bwNFbDd8XJXLrCMnTcKla4fCB+/3Q4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=48qrf2QY; arc=fail smtp.client-ip=52.101.48.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="48qrf2QY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CbVv9ZQpHRoat7Jc4YxpcMFwKni2B7/gFk6TAqWrwu4GT9vKvBiwP3JI0MGfLdCL/P1Q5IIPz/Zg52Rs7yYwWpUvVgXWi5Y6sdXM44UxDQFZTf+zyPYSNmeCdl2AS91alrJsRxeRCsBUkeJ7cBb1A2FBB1MZOitZjrvf5rfJ9xe79pw2NLyW+mhzNK1KX5Nh6BndbWrUe7Fk2onykMFVeBqTJHMgzXQhbL7fM+3G9zUmPTaGgbnm8GFAvVnWuCZrAWg8WHG+QbdDKn8c1qu8CLOiSKxU5HWKErVyXP+kPWDf5pQb9RWXofanGniH42+cWqQB/jNOdf+pJUno9oVYRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S9VAFBIF8ZW3XV0UMawFjKsEaY65hxSKQpWXick5Xn4=;
 b=FNYj+dn5Yk97XaEvUx6Tv8WfFOnd3kilo7crZA1a5Eqo1k5AF+05mwZ1zV0vAT/R1yDbL4DZw1iF2RsnfRw286aT1S8GY3aetX9o+uXxXS20rkJdVoAjPxPZ3dUlepsNgQgYP4MRq09Qm6dtAjTkJTkDrgTSb+CV9op+WCSyRhtcuDE1AjRgmesqkTNSCtKGWKd/dpbZQdOrLg/X8VWwXghw468vRguJDtVByfdk3josF7z/o3NKIffctHBYQdUGmbUYey0RT296qxG7Z2TIrhFyC2UOBzl6UgPxFi75yc8Ahl7e5MRoNrc7XCyHs6jIAi3qiFG3GuJQS4/9U6qCOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S9VAFBIF8ZW3XV0UMawFjKsEaY65hxSKQpWXick5Xn4=;
 b=48qrf2QYERp7O0CneLvmhXmFM96CPk5gEBBW7i9ozr8cZ01eYIK3eIcCsAyCje4N8NfmGCENw29ogFm+Z6fEWJLDmOTtkg4rHJlMnt2tDvyriRE8xxoADd5O2jE07JjM1DoRPr/xpQ+jqyagPCrFHxl2DF8oc0LwT92r5sMLqEM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from BL1PR12MB5320.namprd12.prod.outlook.com (2603:10b6:208:314::17)
 by DS0PR12MB8271.namprd12.prod.outlook.com (2603:10b6:8:fb::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.245.13; Mon, 27 Jul 2026 23:29:44 +0000
Received: from BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1]) by BL1PR12MB5320.namprd12.prod.outlook.com
 ([fe80::1876:4a6d:2cf5:b8d1%5]) with mapi id 15.21.0245.012; Mon, 27 Jul 2026
 23:29:43 +0000
Message-ID: <386b441c-286a-41e5-b878-50a6debb7571@amd.com>
Date: Mon, 27 Jul 2026 18:29:41 -0500
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
From: "Moger, Babu" <bmoger@amd.com>
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, Borislav Petkov <bp@alien8.de>
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
Content-Language: en-US
In-Reply-To: <d393895a-9763-401d-a04c-90bf15f7e9f5@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0199.namprd11.prod.outlook.com
 (2603:10b6:806:1bc::24) To BL1PR12MB5320.namprd12.prod.outlook.com
 (2603:10b6:208:314::17)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL1PR12MB5320:EE_|DS0PR12MB8271:EE_
X-MS-Office365-Filtering-Correlation-Id: daec34fb-3983-410b-9a48-08deec36f048
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|366016|1800799024|376014|23010399003|6133799003|11063799006|5023799004|56012099006|4143699003|10067099003|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	qRq1FQ6tSRNILjLeyH9dWofZyAFqoMSURNMgkb2EjXNTCU7FZKw+GqCui7ajPkDDIwpn8AORFVOtPHhmDGzELw2MACNLfBDtTREVU6ah3O1Bzv3htkbIzoUROL3HuPm52HflxYVNyxkvwcFh0smW098Vn62QqTJmJCv/MHzTwv/ol3pesjeKxaT73rdkyiXjykzrTw1hCX0kq82XxjnXO8GXHP4NUzkyPJ00b2qIDlkgM1h2ImnVAQMkr8THmdRM0yyPhFExOc0PSIGMX/X4oB4BjY/b0NeH4IgZ05ya/atTKYTAAHgQCxRCUPgbl7ULabeUrEKRZRORcPl6BammG1cMKvuqjju3Cp8LQUDatHFYahaZTVvOulCrnY7xRXsZvl++mrDalKa6v+M0M21UKV7a1zcFBYgLOsdK4dMFAqiz38oCVZKx3HPUFJT8bPgjtkh2tviOQley9HYSCKEEuI1f/iz+A7ekmXPxGMK+f648w2FUJrelwfbobm3jyGIhxljxVG/mM+Sp66q+GESE9ysJei/Kg3AarjG+vvStsBl+rwjJu/J5g5BBT/J/qlTkYrZiesiZR9vdyia5pjRPbZyr730lUTfDaQpBx3DmTmRR/W8U2yzSvm0swcGVqscE
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL1PR12MB5320.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(366016)(1800799024)(376014)(23010399003)(6133799003)(11063799006)(5023799004)(56012099006)(4143699003)(10067099003)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cUNxUi94ZW5UN3M0ekhVenloQndSSTVJaVNFampKdnlqOU5CdEdWc2lSdEVK?=
 =?utf-8?B?T1h5Y1RLVHRTM2dhVDVpcFlMQmhpK3Q5Ynl0TFVldWxUbk80MG5HbWxWQmNs?=
 =?utf-8?B?UEhyTXpzUzhPZVVDWmVCdE0wQ09LbDVTVDQ1VFpBaG10VXY1REg0dGxXNlR0?=
 =?utf-8?B?bUR5ajhUMGtUdC9Yalp0c20vWjJSUnVNWFBkQ21ZQU1oVnZzSWtmcGwxUzEr?=
 =?utf-8?B?a0pUL00vN3JCRVBvSlh5QTZKazE0K3pKTTFpRG1uZDVHSS95ZFhORUY5NzRy?=
 =?utf-8?B?VXRPbW5TdDFObUJBVkE4M2IzbmJDVzVJZUNpRTdKaE9Hb01jMDFUaEFRTUV6?=
 =?utf-8?B?MEVMNFgyQ2VXazA3SW5EVXNJUHBzRzBXODFCUCs4T2lzb3dZREdSR1dWT1pP?=
 =?utf-8?B?N3FEV0hlVS9kWE9hQmtad1BWdGFzZ3gvL0tjNkNMcy91QnNjMWpuaWxEcitu?=
 =?utf-8?B?Mk00MlRkdDdVU2Jkdld0clJlenRDNkcvUEdDVUZvNkZ6UkhzUTdtbi9qZ3lI?=
 =?utf-8?B?ZExUNFVFam5YcGtaMzRRNVlWWGd6SGFzUCt0RUw4YjBseWlxWi81OE5hcmhV?=
 =?utf-8?B?TkhEMW0xOVgyT1JvUHczcFhTSmFGOERZWnM2SS9XZUtCeTNLSWdLdllkWG9r?=
 =?utf-8?B?ME9UZHFjV0d2Zlgzb2VPeTJOWDl4Uko4Nmg4dUlXanRkSmN0NUN6OWpSM1I5?=
 =?utf-8?B?dVJ5ZjhMNExlb05sWEFKak5xUFJrVXRITVB5cHZVMFBzS1hVYzZhRWZNMUh6?=
 =?utf-8?B?eWdZOVVnaWxEMlNaNlFybW5CZnRaMHkvS0FMS1hWSGtlaVBLVmZra2dxY2pW?=
 =?utf-8?B?RDJvdWk4ZHRkVy9Gb0pwc0JNbGZTb1NyQy95SjM5a2JaWXUwWnVrZ20zQWdn?=
 =?utf-8?B?a3MwTUo2MHd6V2xldmptWk50eHNuT0RJTzZWN0llU1JlRFNOUDIvZFNHU0Y4?=
 =?utf-8?B?Z1ZvdHBhVU0xNmNFclVnZk9SWEV1UUozblozSk00UWUxRlZSM2xzM05oa090?=
 =?utf-8?B?UXYvdkwwOXFuTlJIaVJGNkExbjh0UFowc1craDFpd1U4c1F3NFM2VVVDdDJz?=
 =?utf-8?B?SzdEZmQyWjcyc0FvNS9CbWhlcUxkeW15d00vYW4yTXNSMGdPODZjUkI4VTY5?=
 =?utf-8?B?UC9mRjgzUTRHS1JFRjVJYXlxb3o1RjVyR0V6VnRwam1GQ0JpbFhrYU4vM0tx?=
 =?utf-8?B?RWRETVRvSTdmYURXUzExRDRqdTZ2Zm5PSGV1UURSK29JWHJIRXJTTG4yRVVo?=
 =?utf-8?B?SHNhaHdINjAyOHp2Ni9SV3pXOC8yVEdWaGMvTUpXcWJKMEpLZ2dnZWpuTlJo?=
 =?utf-8?B?QzdNWmFlbUlwWDlmcVdmN2NIU1Q2cmlsQ3RkbFhrdHlCNXU1MFlhbDdwNzY3?=
 =?utf-8?B?Sk9wY3hDVmhXVFpFRFdXWU9DTHpCVFBYZWwyV0h4b0trSGtoeUk4NytEYVQ1?=
 =?utf-8?B?WGg2NFVjWWFMck82TVFBMU5zS0tkWlkzVkRJdjZ4RFFyNjhCREFEclQ0aHMv?=
 =?utf-8?B?d3NDbTFlQ0N6c1pnUFQwa1B4SS9iMzdrK2pkSDRrblh6MmZEbXpQYXBBbUdI?=
 =?utf-8?B?NjY5L25PZU1BSldJU2lsS2p6YW1wWVVIMkZUa1gyaGIydWtrdWhINXZoQm5F?=
 =?utf-8?B?dVBrdVpYbUx1RUs5bEJiM2RzaWFpSHd4eXFpdVlzS3c0aXhHNy93NSt1Tnhn?=
 =?utf-8?B?clBqaEJzdUExY2FIL2VSQWdNTncyUFk2ZGJML1BHOTVnckhlOExxbHcxS1U0?=
 =?utf-8?B?Z3lwTVd1KzcvUmRYK0EwZGE3WU84TEMvcG0zQVgwczlyM3BjajUwYUVRUmVR?=
 =?utf-8?B?OXpTK25yWE5kN0M5aklISmxsUHVFNnVVTGZPbjd4MXc0N1B0aXJyM2M0RDFG?=
 =?utf-8?B?Rlc2ZzdGWWJ0WDJPUzMzcGFYM3ZoYklhYS9aMXlRbEV5SjZvUC9CRE1ib2lI?=
 =?utf-8?B?VGdWT1pEQnJIbGtJNDdLbUZNWFpVeFI4RkNUbGVwRDV0cXBuNCswQjVQK0tY?=
 =?utf-8?B?MW42TmRQS3ZwRTNaQml3dEVvMnVmd3RubHpYaDZESjFLTnBSa3lVLzlQYm50?=
 =?utf-8?B?QzVibjRZMjVWOU1LdjRWbkNSNHZqR2NPbjRyc3ZzNUxzdUd2cHV4dVArVyty?=
 =?utf-8?B?NnBUb3NycVYvcmxYQTBIc2JxVk5Qem5KSXMvR1M0aGpJZ2pCZFZIRTFMcjZv?=
 =?utf-8?B?Nk9SVEFtUjN4ZGZYZVd4RUhGMFBha1NxREhIOTFWaEVOYXlZU0hIUUlzVU5W?=
 =?utf-8?B?c3RzRm13dFh5Y3dLN3p4UVNmRThldkttTXd1WVp1bWRrYURZTzRDRDc5R05H?=
 =?utf-8?Q?TfZb+lJf1jX75+YgsV?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: daec34fb-3983-410b-9a48-08deec36f048
X-MS-Exchange-CrossTenant-AuthSource: BL1PR12MB5320.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jul 2026 23:29:43.8027
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +QH2av10gFNpgCGx8CgT97lexOHM0M22APByBwnLpcm2MmJ6MzHvz5SY5nRTccKf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8271

Hi Reinette,

I still have to get back to few questions(test details etc..) on this 
thread. Let me get back to on that later tomorrow.
thanks
Babu

On 7/27/2026 5:44 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 7/27/2026 4:42 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 7/27/26 1:17 PM, Babu Moger wrote:
>>> Hi Reinette,
>>>
>>> On 7/27/26 13:12, Reinette Chatre wrote:
>>>> Hi Babu,
>>>>
>>>> On 7/27/26 10:24 AM, Babu Moger wrote:
>>>>> On 7/27/26 10:25, Reinette Chatre wrote:
>>>>>> On 7/27/26 7:05 AM, Borislav Petkov wrote:
>>>>>>> On Fri, Jul 24, 2026 at 04:53:26PM -0700, Reinette Chatre wrote:
>>>>>>>> One clarification here is that as I understand there has not yet 
>>>>>>>> been
>>>>>>>> an actual user complaint. At least not that the pqos utility 
>>>>>>>> mentioned in
>>>>>>>> this thread is aware of. Instead I struggle with the speculation 
>>>>>>>> about possible
>>>>>>>> user complaints with different interpretations on how this 
>>>>>>>> change could be
>>>>>>>> perceived by users.
>>>>>>>
>>>>>>> Sure, but don't you think that it is enough that we know about it?
>>>>>>
>>>>>> Only if we are sure that we have the complete picture. I do not 
>>>>>> believe we do, yet.
>>>>>
>>>>> We already have an issue open for this, and it is fairly
>>>>> straightforward to reproduce. Please let me know if there is
>>>>> anything specific you would like me to try.
>>>>
>>>> Just to be clear, when you refer to issue it means that pqos is 
>>>> returning zero for
>>>> unassigned counters?
>>>
>>> Yes.
>>>
>>>>
>>>> Is this issue public? I am not seeing any related issues in
>>>> https://github.com/intel/intel-cmt-cat/issues
>>>
>>> Opened one:
>>> [1] https://github.com/intel/intel-cmt-cat/issues/311
>>>
>>
>> Oh, now we have a mess, no? You start by stating that you already have 
>> an issue for this and when I
> 
> What mess?
> 
> I mentioned that I have an open issue that was raised against me 
> internally.
> 
> I understood that you wanted me to create a public bug to address the 
> issue, so I went ahead and created one.
> 
> 
>> ask you about it you quickly go create one with the pqos folks for 
>> this behavior we are
>> currently discussing to change! Why not create an issue for 
>> "Unavailable" being treated as zero that
>> I believe all agree is not correct.
>>
>> What are you really expecting from pqos folks based on your bug 
>> report? Or ... are you now just
>> using that bug report as leverage and planning to close it when this 
>> patch of yours is merged?
> 
> I’m not sure what the final fix is at this point. We’ll get to that once 
> we have a confirmed solution.
> 
> 
>>
>> To be honest as AMD representative and the one that enabled ABMC in 
>> resctrl I would expect that
>> a bug report from you would contain guidance how pqos could best 
>> support assignable counters.
> 
> Again, I don’t know what the final resolution will be at this point. 
> Once we agree on the fix, I’ll update the bug with the relevant details.
> 
>>
>> Please take a moment and consider your report from their perspective. 
>> I think it may be
>> reasonable to view the current pqos behavior as correct since that is 
>> what the kernel exposes.
>> If you find current behavior incorrect then please provide some 
>> guidance to pqos folks. For example,
>> do you expect pqos to always switch to default mode when it encounters 
>> mbm_event mode .... or do
>> you expect the pqos should do counter assignment, if so, how should it 
>> go about doing so, or ...?
>>
>> What are you expecting from the pqos folks in response to your bug 
>> report?
> 
> We will discuss that once come to final resolution. They can always say 
> "will not fix" right?
> 
>>
>>>>>> I connected with the friendly pqos folks on this issue. They 
>>>>>> subsequently did an audit of
>>>>>> the tool to understand how it may behave under the different 
>>>>>> scenarios. They found that
>>>>>> the tool currently parses text return values ("Unavailable", 
>>>>>> "Unassigned") as zero.
>>>>>> This could cause incorrect behavior. (more below)
>>>>>>
>>>>>>>
>>>>>>> I mean, the pqos tool shows 0.0 in the MBL/MBR columns now.
>>>>>>>
>>>>>>> And is the
>>>>>>>
>>>>>>>      pqos -m all:[0-191]
>>>>>>>
>>>>>>> invocation not something people would usually run?
>>>>>>
>>>>>> ABMC enabled (mode claimed to be incompatible with pqos)
>>>>>> --------------------------------------------------------
>>>>>> This example is from Babu's email that highlights that when ABMC 
>>>>>> is enabled this returns
>>>>>> zero as bandwidth from pqos perspective. This matches the pqos 
>>>>>> audit that found with text return
>>>>>> states, like the "Unassigned" happening underneath the output 
>>>>>> above, the return value is zero. When
>>>>>> the counters are not assigned then the events will always return 
>>>>>> "Unassigned" (until reassigned)
>>>>>> so having it return zero all the time may not cause issues. Once 
>>>>>> reassigned the event value
>>>>>> will always return a valid value (no text return values).
>>>>>>
>>>>>> ABMC disabled (mode claimed to be compatible with pqos)
>>>>>> -------------------------------------------------------
>>>>>> Without ABMC there are scenarios when events may return 
>>>>>> "Unavailable". These scenarios vary
>>>>>> based on how many monitor groups are created and the workloads 
>>>>>> run. I am not able to test this
>>>>>> but when I attempt to combine what I know about AMD bandwidth 
>>>>>> monitoring with the results from
>>>>>> the pqos audit I am concerned that there may be a problem.
>>>>>>
>>>>>> Consider a scenario where an event may return "Unavailable", for 
>>>>>> example:
>>>>>>
>>>>>> <return A>, <return "Unavailable">, <return B (larger than A)>, 
>>>>>> <return "Unavailable">, ...
>>>>>>
>>>>>> pqos will see:
>>>>>> A, 0, B, 0, ...
>>>>>>
>>>>>> The "pqos -m" usage attempts to determine the bandwidth rate and, 
>>>>>> for example, when going from
>>>>>> "A" to "0" it will be considered counter wraparound that would 
>>>>>> appear as a very large and
>>>>>> wrong bandwidth number.
>>>>>
>>>>> Yes. Agree.  This is known issue.
>>>>
>>>> Has this been reported? I do not recognize it in https://github.com/ 
>>>> intel/intel-cmt-cat/issues
>>>> and the pqos folks I spoke with was not aware of this behavior.
>>>
>>> I was not able to recreate this issue. I just opened for the one I 
>>> have seen [1].
>>
>> So to summarize: it is known that pqos returns zero instead of 
>> Unavailable but it is not reproducible?
>>>>>> Question to Babu
>>>>>> ----------------
>>>>>> Do you perhaps have a test/workloads that, under "default" counter 
>>>>>> assignment mode, can create
>>>>>> many monitor groups (more than 64) and cause "Unavailable" to be 
>>>>>> returned frequently? Would it
>>>>>> be possible to put pqos through its paces in this environment?
>>>>>
>>>>> Yes, I tried to reproduce the "Unavailable" issue with the pqos tool.
>>>>>
>>>>> So far, I have not been able to observe the issue. I created 64
>>>>> monitoring groups, ran MLC, and simultaneously executed pqos.
>>>>
>>>> If I understand correctly 64 monitor groups will still have enough 
>>>> underlying hardware counters
>>>> and always return event counts, never return "Unavailable". It is 
>>>> when the number of
>>>> monitor groups are 65 or more that the hardware counters will start 
>>>> to be re-assigned, no?
>>>
>>> Yes. I created 64 monitoring groups and then ran pqos, which creates 
>>> an additional 15 monitoring groups.
>>>
>>>
>>>>
>>>> Even so, I do not know if 65 would easily trigger the issue ... 
>>>> sounds like it is possible to create
>>>> many more (4096) monitor groups on these systems so there appears to 
>>>> be some room to make it easier to
>>>> create scenario where "Unavailable" is returned.
>>>>
>>>> On a higher level: could you please run the test that can expose 
>>>> pqos to environment where it will
>>>> encounter "Unavailable" and observe how that is handled?
>>>
>>> I was able to reproduce the condition where the hardware reports 
>>> "Unavailable" for some of the MBM counters.
>>>
>>> #cat /sys/fs/resctrl/mon_groups/dir*/mon_data/mon_L3_00/mbm_*
>>> Unavailable
>>> Unavailable
>>> Unavailable
>>> Unavailable
>>> Unavailable
>>> Unavailable
>>
>> Thank you for running this.
>>
>> Do all of these monitor groups have workloads assigned that generate 
>> memory bandwidth so
>> that they do not just keep returning "Unavailable" but often return 
>> data also? I just want
>> to confirm that this is not just a variant of the "Unassigned" test case.
>>
>>
>>> However, the pqos tool continues to operate normally and reports 
>>> valid bandwidth values:
>>> #sudo pqos -m all:[0-191]
>>>
>>>      CORE         IPC      MISSES     LLC[KB]   MBL[MB/s]   MBR[MB/s]
>>>     0-191        2.55      55146k     74496.0        20.0        61.4
>>>
>>>>
>>>>>
>>>>> The issue has not reproduced in any of my tests so far.
>>>>
>>>> I'm confused. It reads like the issue that you mention earlier is a 
>>>> known issue cannot be
>>>> reproduced.
>>>
>>> I meant that the pqos tool continued to work as expected even after
>>> I recreated the condition that caused the hardware to report
>>> "Unavailable".
>>>
>>
>> ack.
>>
>>>
>>>>
>>>>> This might require specific test scenario to recreate.
>>>>
>>>> Right.
>>>>
>>>>>> Of course, "AMBC disabled" scenario also includes AMD systems 
>>>>>> before ABMC was introduced. I do
>>>>>> not know why the issue with "Unavailable" handling (text returns 
>>>>>> in general) has not been reported
>>>>>> until now. I assume the pqos team may do most testing on Intel 
>>>>>> systems that do not return text.
>>>>>> ...
>>>>
>>>>>>>> The patch notes mention that this change is planned to be 
>>>>>>>> reverted at some
>>>>>>>> point in the future and I have not heard of any changes to this 
>>>>>>>> plan.
>>>>>>>
>>>>>>> Where does it say that? I don't see that aspect.
>>>>>>
>>>>>> For convenience, copy of patch notes from original commit [1] is 
>>>>>> below:
>>>>>>
>>>>>>       There are plans to enable "mbm_event" by default once 
>>>>>> additional counters
>>>>>>       are available. For now, keep the default mode to maintain 
>>>>>> compatibility
>>>>>>       with existing tools.
>>>>>
>>>>>
>>>>> I added the text below in the comments section (after ---).
>>>>>
>>>>> On second thought, that was probably my mistake, and I don't think I
>>>>> should have added it. I also don't see this happening anytime soon.
>>>>
>>>> ok.
>>>>
>>>>>
>>>>> Considering all of this, I believe it would make sense to make the
>>>>> "default" mode the preferred mode.
>>>> The original problem statement is that pqos is not able to handle 
>>>> "Unassigned" return values
>>>> that will be encountered when "assignable counter mode" is enabled.
>>>>
>>>> The request is to disable "assignable counter mode" by default to 
>>>> address the problem
>>>> when handling "Unassigned" counters.
>>>>
>>>> Disabling "assignable counter mode" will under certain circumstances 
>>>> cause "Unavailable" to
>>>> be returned on event read.
>>>>
>>>> At this time there seems to be a mismatch in understanding how pqos 
>>>> can handle
>>>> "Unavailable" return values. For me to sign off on this patch I 
>>>> would like to fully understand
>>>> the risk doing so. Could you please confirm from your side that pqos 
>>>> can handle all scenarios of
>>>> the mode that you request to be the default mode?
>>>>
>>>
>>> I created the maximum number of monitoring groups supported by the
>>> system and was able to reproduce the condition where the hardware
>>> reports "Unavailable". Even under those conditions, the pqos tool
>>> appeared to function correctly and continued to report valid results.
>>
>> Could you please share the test details? Just having the maximum 
>> number of
>> monitoring groups would not trigger the issue by itself, it needs 
>> workloads
>> that generate memory traffic that intermittently do return data.
>>
>>>
>>> It's worth keeping in mind that ABMC mode is not available on the
>>> majority of hardware currently accessible to public.
>>>
>>> Furthermore, default mode has been the longstanding behavior in
>>> deployed systems. Moving back to the default mode is therefore not a
>>> new change, but a return to the behavior that users are already
>>> familiar with.
>> ack. "We returned wrong data before. We can do better now but we want to
>> keep returning wrong data since that is what users are used to".
>>
> 
> I think we are getting nowhere here.
> 
> Thanks
> Babu
> 
> 

