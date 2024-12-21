Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2068.outbound.protection.outlook.com [40.107.223.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22E3A1F8683;
	Sat, 21 Dec 2024 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.68
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734788721; cv=fail; b=Dn3YLywiF0l87XLqLC5UWcsBUzfZy+GyzGE39+h63FlnZV0joifpdc7Feps07zBuiOOHSiFBQc8zqB3v00FprJsQVNWte5/IQkhZPtXB+qSntNKfuyd7PF49LV+9vBWnCa4gpxHfOCXoZibrU0Fth6Lxe7P1Dg+a50iaXXaugq0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734788721; c=relaxed/simple;
	bh=Pnm6GJ27kREuAy7X5DXUy8JS7Ra2t2w3EcU+ALXjrNU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hqSKJk7LNMHDc/IF5MAZwHdkibL8l0QmadaajaVDkwdIxiglt0paqsq4EiqvwjfAC8S9qu5sS4cNTdbyI5gOSOFKxH48vdhAyJ3+Yvwaau09fWE430bwfRK8QjDvhz/hvLRcvtJoGe59y1keJgKyy9UGLdN3Du1WSO/TQ3XrtIg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=f2CK+T2Q; arc=fail smtp.client-ip=40.107.223.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="f2CK+T2Q"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VFS3Gb64yTQXcCDfWnI4Yqrst2aVXsQB+xeokfHDx0ZliSAwL6D0P18Fp5fE5+XoVEJkoJjSSN/kWHxFw/BkVMcUZiPsR13r0w7jxG7Q30NX4DdKJeXK+UmAa3O0rHDzym+uQRzFEMxbHZ/g+yO6/VxwIc2jmiM+oiKcl8kYI3PlTB40V61QkCEIb4XkYU55UXGjHd/65EihRZjqRGMsnvKkhUMaWUGDfBKdA4+ytmgPHItw9oAQT9p0SaZBjPmoItOeTAqRMsCHuLE7oJGsnH60dq2dHruSIdbZbhozTtl5SZUdi8nIs3tqoWLcsJZk3g7BUZC2bFa2BEvb4WVJEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RX/xBe/V/hsFftGHXHGGOs/bx+AzrMXVw5ptqb2Wc5M=;
 b=b89x/obMbR77cdxC7+/IHEdXfL3YFQ/tRmVRofv67ZPy4itGCDTRBIXdCRUOgNLaSpZFpH0+eJH4SgPJLTi+7BB6na9sTSCYNnP8wQWlTq0mBzq3ZG0FpPbMxGupOzgHOhmgs71Cplss465jL9wpmnvknqPNkxYFVP0T8eafZCMeZPz9XO17q8VBuw+Tnf7Lp/Ut//ClWecxdpBcQ7PqFWh9XfxBnmVGaBMWIcUPVadJnoBob41x+PVPVxqtyJ9QABtczEXNuIJvKwnhLF3gYLREndnFY031gzsLcr+9P9zQbzkiQ3o4GNVARsm5a0qNZQ6jMkPANtyqDorEq9EFkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RX/xBe/V/hsFftGHXHGGOs/bx+AzrMXVw5ptqb2Wc5M=;
 b=f2CK+T2QdsxFoYFQosWAqEt35vFLVe35cUag9WAozU4VjmrZr+yudh7nX2iGPaCG+cMv/NwiI24r0HOt8iEXHLG66nDY1eAl1Zc2ajRX9vt0q6t7Cl+p7Yb4Z0gGlgcJfnj17JwjHqAJaPFNreX1thlbJgCmR3BBP8TGjbpfdOo=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SN7PR12MB7936.namprd12.prod.outlook.com (2603:10b6:806:347::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Sat, 21 Dec
 2024 13:45:15 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 13:45:14 +0000
Message-ID: <007b8995-8865-40e9-ad74-33b5562d5dcf@amd.com>
Date: Sat, 21 Dec 2024 07:45:09 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 18/24] x86/resctrl: Auto assign/unassign counters when
 mbm_cntr_assign is enabled
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
 <35e1b0915fe08bb0ef093e23ca3d520fc6aa32ab.1734034524.git.babu.moger@amd.com>
 <6bc0816c-d926-45de-ba97-459fb0fca9ff@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <6bc0816c-d926-45de-ba97-459fb0fca9ff@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0093.namprd13.prod.outlook.com
 (2603:10b6:806:24::8) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SN7PR12MB7936:EE_
X-MS-Office365-Filtering-Correlation-Id: a7216911-218c-4ff0-d827-08dd21c5b2a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cllWcmV1Y1BTUGo2U0Njd1cxU0R1VlowU09HQ01PT042Nk05SUpCOEpXNHcr?=
 =?utf-8?B?RC9Fczk2T05KbEpZUXNsZml2Rm9LU1R3UnFZVTk2cGJQMTRTbkpDUGhSRXJR?=
 =?utf-8?B?YTUyNkpPRlBFbWl1QUk1cEQxQkpGZ0lMenh0MEFjaXBrS0UrUUFXbTJjNVF4?=
 =?utf-8?B?azExenBPM1JMVUpvODRLbXgyTEZUdzAvWVFLblNWYVNvMWRQSE4renRzRUVS?=
 =?utf-8?B?enNGcFd2OGttU00wYW16cmw5a2NhWVBYVllMeHdqRTFDRmJ0Mi9ZKzZwUjdC?=
 =?utf-8?B?eGZ5VUk2VU40K3RtSHF2NXFkWW96YnNRUXZNczB1aG1CRWc3c0ZNZ203R1o0?=
 =?utf-8?B?aWtOUjFXdytJc29rTUJ0dXJPdjlWc1JqQXI1Yi9mQlNsVEZBYVV3VlRUZ0Vw?=
 =?utf-8?B?QVZpMFdvUXFJdzY1Z1JRRmhIZXJNODIzaTRDdFYxUklRMlNaMG5IRWVzS0pn?=
 =?utf-8?B?YjAwaExnM2NWZXFJQVY3TWlac1BZV1BocUJtTmd3TnpCUGg5N2RoVEIweWdu?=
 =?utf-8?B?anFna1VPZnJkRGxPYjFzTXNJaTZ1RE9kaEttemNPNFI5N1JpbmlhU2J1TXlm?=
 =?utf-8?B?RHhhZm5DWGhLd0xNNW9HMlFzMnlBbllzNTl6TzBpWmQ2RWxrb0dSMVcyK2Er?=
 =?utf-8?B?cC96TkhkVTVJL29OTFRRdmdISFlhWUp5YkVDVmtTUzRXK00xZXFaSndqbEZp?=
 =?utf-8?B?MjhUb0xQWHR3OW40NUJXYnpZMTRCQ3llRGVHSlRhM0MrdDNjanlqcXFZVC9L?=
 =?utf-8?B?S3FOektYZ0tPbWRpYzVITUVFaDdMWUpma2hjM2gwM3JHSUxlbmM1NUVKSUo0?=
 =?utf-8?B?RVlpZy9xdmhtWGpBWU1pRGxyZkhCZERRT0ZEcWovTy93NkRRTE9UMmN4anpX?=
 =?utf-8?B?TzR3MWUzMm1HUUd1ZElLcFRzVUR6UFJQUnNLdUV5TDErTXdPNURZMCtMV3lw?=
 =?utf-8?B?SU80MVFYMTNWMTV2cGJLYVBoblJCTDZqdTVqd3FHOWRhTDdWRHFSYVVuNnRj?=
 =?utf-8?B?WFVIOTJwak9PZUlHWUxvcmsrdXdWeEQ2bXRxdng0bTVFYnNIQzBTc0p6bGVZ?=
 =?utf-8?B?WkdBVHM1QTdNMDcrSzFqSEs5blFIU1JpakZaUWlJTklpWWpXL1VkMHg0VEZS?=
 =?utf-8?B?M0tEc3lBZDJ4eVFiOTBHY0x2czVzZXFtb2ZVN0JxSEJuWGR4YnUrbkE1ZndC?=
 =?utf-8?B?VGE0a2VqdVBPYjh6ajRkb2QyNm5PbWR0WVBCcVd1UFdJcXFmWEQrM1BPK1g0?=
 =?utf-8?B?d1lUaTFYeHIrQlRNQlVWbUlpcDdvdU5pVjI5ZmxSS0NJd3RJMHhpWVZPK2w2?=
 =?utf-8?B?UGpPSUFXWWkzbU5hSEc1NTFqcmpvZUF3SjNPZTQwcUxpc3R4STliOW04WGIv?=
 =?utf-8?B?aHR6WFN5ai93Slk5SUIxSUFoRW82RWhnczhXcWdKUWRMdUlKYTlzR0J3QktV?=
 =?utf-8?B?WHl6SzhFWkkzTWhtcHVSQVVtVXRyVkpseFg0cndUNmtyQUt4S0N5QWRYNzVF?=
 =?utf-8?B?clVvZHpXbmVOZzdFZzhUb013Ni91R2VBd2h6UzZEZm9yT2lScWdXUGRQVTNU?=
 =?utf-8?B?ZlpMK3dKSmRIdVlCSnBIWW4rbm9oa1NpTHV4cU0wOGNQdGIwUXNxSWFMY0xW?=
 =?utf-8?B?V0dleC9WS1djeEt5MTV2aHFMZ1hKbEFNZ0hQVlg2NExRMDdBZmNQR3dYOGdI?=
 =?utf-8?B?VlppVmFRWlBzZ3BOUnVXRDlQYkI1Z1RrZlJzZ0JNRXZsemVKaDd5Umo3ekEr?=
 =?utf-8?B?cFBpTWgyN2xEYkNrZGpmNFhySjErK2J3WGpXbHpXWndrRUk1MEc1N1pWNks4?=
 =?utf-8?B?RU9aU3E4WEVkUk9IQWRzS0RFTXV3bUpKcmhxeGRVRUs4aGdobmgyKzFEbHhN?=
 =?utf-8?Q?qC98W5py4He1q?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RGZxV0xMNE9lV2YvMUFLRWordWVOR2t4WDhhQUtybzlLY0xrRkc1c003ZzlB?=
 =?utf-8?B?Zk1jMnoxWE9nRG02VjBhZWRPUFcyS2JjS2Y2b1RhYU45V0N1eFpSSU5zVlZw?=
 =?utf-8?B?dEhPRTE0TncyM3ZKV0xzMGJ1V1JkRmVVaWxCRVYrK1N6eGZpN0oyUDlHSS9n?=
 =?utf-8?B?VFhTYUdvOEczZk80bHA1NEVkUkNaLzBNdmFjSFMvSEdtTFJDZmozVWRWeTkx?=
 =?utf-8?B?VnR2WWRESG5RUXpKUDNLSTNlbThWbitDdDUzNnpjZm5QNXFRWTRkWDJScVln?=
 =?utf-8?B?bm1pTk5YRXNTZkFscnhOL01aMjFWS3hJL2lFeDZUbVZyeE84Tklyem9Qc2VD?=
 =?utf-8?B?WmhEV0ZSSDk0dkJlQmE3NTR3aDVZTlRseUJDeFREU0l3S21CWnpWNjZTRVpL?=
 =?utf-8?B?WFpKc0YzU0ZLeGFRTXl1UFJmUlNtUmVEZHd0dDNkbHVpSW5Yd05CTkRHellj?=
 =?utf-8?B?cHB2Y0tLeG9Hc3IyVWU5amdxaS9YQyswbjJQZE5GdUxDVnpHTzJaOE9jOHBC?=
 =?utf-8?B?QytGWWhLYzFubXhsdGQvTWprNVVCTXA4ZkxDQmtFeUZtNGRBZlFZSDF6QXVK?=
 =?utf-8?B?N0hhWlhhVUlUVFg2Rm5RbUk1WFdqZU0rT0xiLzE4V2ZzdDhVYXhyV2tFZnV4?=
 =?utf-8?B?WktzNTJUMEJpSnlaRWN5NERiWWttLzM0YURWa05kaWQ5UDZwallkSUZhNjVZ?=
 =?utf-8?B?eklDYWovWlk1TVNBelpEVXNmOHpQWXhyaHJZYWNLMm1iYms0SEYzeXd4bTRj?=
 =?utf-8?B?ZXhnRVdKV05OazVhbXFQaWFieTdHcXArSHFpRUFnaVlXMENKcUZBdXB6OGlZ?=
 =?utf-8?B?YnB6cWJSVEVIck1kOEczWmR6WWx3bFJ0TTlxRnFQdC8yRllPN3JqcHhFbmlX?=
 =?utf-8?B?cGJ3dmpLMTdlcW1tTFc3THViUkNQTFA1bDIrdURSU3RUN0YyYVdsaFV3UUFh?=
 =?utf-8?B?R0hSL3ZpYnJmby9Yb2JXUVBCRjI0bHRkM20yNXFOQ243VDRjdTQxMDhORDJE?=
 =?utf-8?B?Z1BFczlkM3h1M1hQem9wNWZIMEt0elcyaE9ZZ1ZWVldQMkJCMHloMXJ3QXJ3?=
 =?utf-8?B?QWpMQUFyWDBDZFRjVmpSdlgraHliMThBY1hKS1A3akFUTnkrY2hRcWx4Z2NM?=
 =?utf-8?B?SlRZTUxkM1VMU2szMituNHNVRitxYmMxZENIRjZJam5RSW9Mb2dQUXJGdDJN?=
 =?utf-8?B?WFhHdVFTb0FDKzVKc2IvaHptVWNJVGtPcHBaMjRhRjBIa0hWMGY4TGhmZkN2?=
 =?utf-8?B?USt5cFNsdXNYS3dEWW9zM3plMUtjZU1CdVVSOG1XeVlEQjdqbW1Wd09xYVZu?=
 =?utf-8?B?NDFFU0RybWFSZkJBalFVNnl6eXRRZ0R2c2Q0bkF2UDE0NHZzbGZwZy9wdFhu?=
 =?utf-8?B?SHN4ZUFYVXI1TXFTeW5kc2N1bWIxVTRPdkxQYmRtVGE5RGREdEloZ040d01z?=
 =?utf-8?B?VUpWVGlteGt1c1RsTEsrRFc1cFF2NmJkcUIyN3pSVXBzUlduTk1jbzhNYUNY?=
 =?utf-8?B?SklRZVYrSW83RXE4TUxSUW5ZZXFHL2FvV2liamR1RUFTVU5EVGlqdXRoRnhs?=
 =?utf-8?B?bXhrOTl5VU44dFhRTGY1am1PRVA4STVOdlFlaWhYQnh6TnlCUjZ4bVduS1NX?=
 =?utf-8?B?cGgxUGRUSmZJMFQ5MkwvUzlKcG5zVHdTWEZ5bkZYeDIwMFBLWXdYb25sQWRY?=
 =?utf-8?B?NVlMaHZwVWhsMkl0Z01EZWVqVlJyQXh1eHhrK2JNQnBaTFpOSm5qOGNQVXcz?=
 =?utf-8?B?VHlIWTJmNmpVdjU3RHpDbGU4NStRejJJMVBvbHFpTlc2WFN5OGZqSzR5elZi?=
 =?utf-8?B?K1d3R3RjNXY2MDBTMEJKLzFPMlEzZU8wVTVFVnAxV0NxeHY2cGtFZEpFV0FS?=
 =?utf-8?B?UExJd0ErSUs4TXo5Zml2YUVGUzQ2K2lvcTluYkF1VGRRYnoxbDZKZS90REJx?=
 =?utf-8?B?SlRKY0F2NFZ5S0g2V01QUFpEOGhyczMwTDNiaEtlTExnOFVaTHhKK1lnS0tG?=
 =?utf-8?B?MTE0dDZjN2NQMGs5UGppYXJxR0RyVDBpMTVKbmdvNnRXcStidW9HWWdLZzVJ?=
 =?utf-8?B?TUx4VG5RRVkrNWM2aG1Ubm9LUWVncTh4VFRvOEZLTXdyTlJJejdjTHdjQ0lD?=
 =?utf-8?Q?Kxgz3GEqIL7zw5FMYxUJuKk7e?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7216911-218c-4ff0-d827-08dd21c5b2a8
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 13:45:14.7914
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DGmxMlc9avLovqrM2EG3ckYyV39PO02ghQKTpxKAOGKIIGPFZpIKMs1VuOBfq0Ge
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7936

Hi Reinette,

On 12/19/2024 5:39 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Assign/unassign counters on resctrl group creation/deletion. Two counters
>> are required per group, one for MBM total event and one for MBM local
>> event.
>>
>> There are a limited number of counters available for assignment. If these
>> counters are exhausted, the kernel will display the error message: "Out of
>> MBM assignable counters". However, it is not necessary to fail the
>> creation of a group due to assignment failures. Users have the flexibility
>> to modify the assignments at a later time.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> ---
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 81 +++++++++++++++++++++++++-
>>   1 file changed, 79 insertions(+), 2 deletions(-)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index a71a8389b649..5acae525881a 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -920,6 +920,25 @@ static int rdtgroup_available_mbm_cntrs_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +static void mbm_cntr_reset(struct rdt_resource *r)
>> +{
>> +	struct rdt_mon_domain *dom;
>> +
>> +	/*
>> +	 * Hardware counters will reset after switching the monitor mode.
>> +	 * Reset the architectural state so that reading of hardware
>> +	 * counter is not considered as an overflow in the next update.
>> +	 * Also reset the domain counter bitmap.
>> +	 */
>> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>> +		list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>> +			memset(dom->cntr_cfg, 0,
>> +			       sizeof(*dom->cntr_cfg) * r->mon.num_mbm_cntrs);
>> +			resctrl_arch_reset_rmid_all(r, dom);
> 
> This looks to be missing reset of resctrl monitor state (from get_mbm_state()).

Yes. Will do.

> 
> ...
> 
>>   static int rdt_get_tree(struct fs_context *fc)
>>   {
>>   	struct rdt_fs_context *ctx = rdt_fc2context(fc);
>> @@ -3023,6 +3082,8 @@ static int rdt_get_tree(struct fs_context *fc)
>>   		if (ret < 0)
>>   			goto out_info;
>>   
>> +		rdtgroup_assign_cntrs(&rdtgroup_default);
>> +
>>   		ret = mkdir_mondata_all(rdtgroup_default.kn,
>>   					&rdtgroup_default, &kn_mondata);
>>   		if (ret < 0)
> 
> If this mkdir_mondata_all() fails it calls "goto out_mongrp" ...

Sure.

> 
>> @@ -3058,8 +3119,10 @@ static int rdt_get_tree(struct fs_context *fc)
>>   out_psl:
>>   	rdt_pseudo_lock_release();
>>   out_mondata:
>> -	if (resctrl_arch_mon_capable())
>> +	if (resctrl_arch_mon_capable()) {
>>   		kernfs_remove(kn_mondata);
>> +		rdtgroup_unassign_cntrs(&rdtgroup_default);
>> +	}
>>   out_mongrp:
>>   	if (resctrl_arch_mon_capable())
>>   		kernfs_remove(kn_mongrp);
> 
> Looks like this will miss counter cleanup on failure of mkdir_mondata_all().

Sure.
> 
>> @@ -3238,6 +3301,7 @@ static void free_all_child_rdtgrp(struct rdtgroup *rdtgrp)
>>   
>>   	head = &rdtgrp->mon.crdtgrp_list;
>>   	list_for_each_entry_safe(sentry, stmp, head, mon.crdtgrp_list) {
>> +		rdtgroup_unassign_cntrs(sentry);
>>   		free_rmid(sentry->closid, sentry->mon.rmid);
>>   		list_del(&sentry->mon.crdtgrp_list);
>>   
>> @@ -3278,6 +3342,8 @@ static void rmdir_all_sub(void)
>>   		cpumask_or(&rdtgroup_default.cpu_mask,
>>   			   &rdtgroup_default.cpu_mask, &rdtgrp->cpu_mask);
>>   
>> +		rdtgroup_unassign_cntrs(rdtgrp);
>> +
>>   		free_rmid(rdtgrp->closid, rdtgrp->mon.rmid);
>>   
>>   		kernfs_remove(rdtgrp->kn);
>> @@ -3309,6 +3375,8 @@ static void rdt_kill_sb(struct super_block *sb)
>>   	for_each_alloc_capable_rdt_resource(r)
>>   		reset_all_ctrls(r);
>>   	rmdir_all_sub();
>> +	rdtgroup_unassign_cntrs(&rdtgroup_default);
>> +	mbm_cntr_reset(&rdt_resources_all[RDT_RESOURCE_L3].r_resctrl);
>>   	rdt_pseudo_lock_release();
>>   	rdtgroup_default.mode = RDT_MODE_SHAREABLE;
>>   	schemata_list_destroy();
>> @@ -3772,6 +3840,8 @@ static int mkdir_rdt_prepare_rmid_alloc(struct rdtgroup *rdtgrp)
>>   	}
>>   	rdtgrp->mon.rmid = ret;
>>   
>> +	rdtgroup_assign_cntrs(rdtgrp);
>> +
>>   	ret = mkdir_mondata_all(rdtgrp->kn, rdtgrp, &rdtgrp->mon.mon_data_kn);
>>   	if (ret) {
>>   		rdt_last_cmd_puts("kernfs subdir error\n");
> 
> Cleanup of assigned counters if mkdir_mondata_all() fails seems to be missing here also.

Sure.

Thanks
Babu

