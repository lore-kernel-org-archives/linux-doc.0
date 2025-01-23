Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2056.outbound.protection.outlook.com [40.107.92.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D43619066D;
	Thu, 23 Jan 2025 19:51:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.56
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737661876; cv=fail; b=W9cUwU9iOToE5B+dv0/6xFDum0/jsro3s+Pkdw9s7yqndDMX9YIA64CTtTdBum5RnyG8ec7zc0LDduRUgyvKaT4o3FcVFvzykCWetF+w1lwzpj2+b3LCzzkIVGkii1Mx97mDi6sOHxKqBIOYKt3qwTGnWFNbms2PBtux++2PJ+4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737661876; c=relaxed/simple;
	bh=CQbibzEWObUS9erVZYU1ounSR7F/lMdlcMsMIIfMQrQ=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=UDzHffKe/SEP//4MO9Htv0vfPlqOppK0zN4RA1+PlagwwwF3whxc6GSV1ZKHRdojB4/XeJZjVKjz1jnpvf/tsMwn5oFEfkqSZmXQ2H3ztndyp8S7VAzhG04Z4wqdTxeu5/B0vdtu24kqNbgNXeuEHAWjIr38VY1reB7+zAmdogk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=yvEs9xe2; arc=fail smtp.client-ip=40.107.92.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="yvEs9xe2"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DLSxEH7WqN20GogiBOu3jRySbAykhBDyzlK6MiEPdPyj8UlRC4V0RO8QRmRQGJ2VUS2ga9e904AJJwQ/h7ZL80yWF9bGcf46V0IKQRj6QiNhtsSDoqrZUA2xrLpNxbXp31sgv1a790nJA40l7AXeNygf7p6gsB0MtujvT+KTT3daWryNaPxjxU2wg8/5QJ9YS0ozfTvuYFKixFfycl33eVyLmBeduzN32N3qeLlJvg3DmNeTkOg8oZUD8gr0UqlnyN/Smdiq5sfqdo490gbLdmJvJwfzmxjSRlfWCFD8hbp7EoH34EkplxlpD2J/TM4bzenzUUSFpKnVP/h2A8I2SQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yMlRnGGGLDgJalNDxgaSIE9P/DWAKcvXT580U5P1iG8=;
 b=WO5l5X1qzZM9fFkuw8yfvt8J+tLvolcpArRVJ4Gu5fVxjNj928EjZFl7OipIrtc5DLlttvT+oSjfwe6BzKz5CVtzyjyH2pk1IrUSHGD9KA7hkuGrlX2NQHvBC2xlvSPSmYWxlXrlWYtZ/+sav2vK1OoO3W9uG4tqcSgvewRlN2GXk62c/94I9nLf9w/CBlPj1XyetbVcl5bYups2Xugug83MUpf3/E2Z05LdMHzRDxzB4mjlOuAdYIQo0iXUQOJVvUJSm6ZpLfr1H2MV5kVy4Sgrwn6OGNEOG+kFUCDzbstDsQMkGmVvvY5PrVkRLNpwGbieAO7SipFWhedQSmwskQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yMlRnGGGLDgJalNDxgaSIE9P/DWAKcvXT580U5P1iG8=;
 b=yvEs9xe2X83t+L8r5aSuKH/1PZnyC8BDcDLoK+bz6JSTvDShXJagpZG/R2fnRB8A53wdn4ngUBJi0jsnerXcy8s5aswQAfPhfCoQWGP5Rs3XhYXLx447tA7HzMnRZ5AEGwRjeGDnUUVPQ7UczmXKOoCIUGxriWQ/9y2d5qkmvaw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CY8PR12MB7635.namprd12.prod.outlook.com (2603:10b6:930:9e::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.21; Thu, 23 Jan
 2025 19:51:10 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 19:51:10 +0000
Message-ID: <a83edc6e-0fb5-4a1b-b1ab-3502cb458d70@amd.com>
Date: Thu, 23 Jan 2025 13:51:06 -0600
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v2 3/7] x86/resctrl: Detect Smart Data Cache Injection
 Allocation Enforcement
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, paulmck@kernel.org, thuth@redhat.com,
 rostedt@goodmis.org, xiongwei.song@windriver.com,
 pawan.kumar.gupta@linux.intel.com, jpoimboe@kernel.org,
 daniel.sneddon@linux.intel.com, thomas.lendacky@amd.com, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, seanjc@google.com,
 xin3.li@intel.com, ebiggers@google.com, andrew.cooper3@citrix.com,
 mario.limonciello@amd.com, tan.shaopeng@fujitsu.com, james.morse@arm.com,
 tony.luck@intel.com, peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1734556832.git.babu.moger@amd.com>
 <ffcbf189201c4b79b91a2f94cfe219acdab807d5.1734556832.git.babu.moger@amd.com>
 <8f7f2839-4c96-46f5-8d39-5d2a974f6fbd@intel.com>
Content-Language: en-US
In-Reply-To: <8f7f2839-4c96-46f5-8d39-5d2a974f6fbd@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1PR03CA0003.namprd03.prod.outlook.com
 (2603:10b6:806:2d3::14) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CY8PR12MB7635:EE_
X-MS-Office365-Filtering-Correlation-Id: 3372343d-d37f-4120-3571-08dd3be748f6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?WVl1ZW5Bbi9QMzN6QzlheWdQeEpyUjJpZEhrdjEyN1RtOTNSMzNlMUd6bitT?=
 =?utf-8?B?V0UvWTIzTVFabFhRaXFSQ25ROWpXN0NWU2UwZ2RDOU55Tm8wMFVUcjJmUGt6?=
 =?utf-8?B?YmZRWHByaW5qdVZQUnd4THNieVJlNldTeXpzT2JwM21NWDloeVp5YjRpc0lT?=
 =?utf-8?B?ZGlVV2R2WEF0dUJKcDU4a2M5djdKdy9icVRBU0lrWDhyMzk5eFhVUnJPSys3?=
 =?utf-8?B?cll5LzA5NDVOenRBZ0M1bWR1TUNUcEphbXlTZXhKaEcrQTRnaGxBVWZnTVIz?=
 =?utf-8?B?ZWlxUTBIYTg3UXBuWjFNSStXSW1rdzIyVTY3dzNPYVBPbkptSzhHMEY5Z01t?=
 =?utf-8?B?Ni9ObWZIakwvK3FjYmFkOFBDeC9nWm4wUzk1bE85SnJpcjNpT0dOYkMrSitu?=
 =?utf-8?B?YWV6algrbCtzb0Njd2FzOFNMU01kTjVvVnhkdlBoa3hoZ3laeUZGbVRSd1lV?=
 =?utf-8?B?SFNGSkVkUjNuZlp2K3JTUnU1R2F2bXJQNFhucnd3QVBHZm1sWVBYc09TSE9F?=
 =?utf-8?B?cUphS0FvOFdhbnR6S3JuSnlNNldZSXMrb1pQVkJDRTg1cEZzRGVqWS9jeXV5?=
 =?utf-8?B?ZmdYTitkUTBxdmhYa0Qvbm9tVnU0bGRvZ3lTWGRaRWRHWHZBUEFJeGZwMGJR?=
 =?utf-8?B?VXFNS0FDZittbnBtN1JZdzBpWGpNMXN2ZFNUSW5rWERUTG9CSGRQRk1EaEcx?=
 =?utf-8?B?bmdzZzlOMmpleVJQMmx0cTd5WmhLemFucGpEMCtIVzR1YTBVOHQ1dUhNVCt4?=
 =?utf-8?B?MUpKZHRTRTJxeGo3YWQ3SjhxaG5KbXJDcXdBWW91YjR3VzFwQkZlVUhBbzlN?=
 =?utf-8?B?OHJ6UUs1a0lNMnMyZHJqTkhPTFg2L3M0VnRKMXRoUHJZcVdUZkNCamwxbm1w?=
 =?utf-8?B?YWVTS0hYb2ljRU9TK3RtaUJIN2xram5Zdmd2VFk0dnNkdVk3dlBhSHJZUDZJ?=
 =?utf-8?B?dHhTcXpOQUpHMDdHdGlKTGU3MGtqcUhRUnNrcTI1RnMxaUJWZGV4RkFLdkta?=
 =?utf-8?B?YTN5d01xRmpqbW5LZ0F1ZjFhbTBuS1BobnpFK3ZUaXRQSjVjRzRTVDJiRnhx?=
 =?utf-8?B?SzZaWkg0Q3dHYWR5SStBYVVNTHU0SjNxRVRDQUQzaVJNYmFXM0FpRWFEQXJj?=
 =?utf-8?B?cnBTY0ZCaUZrN3RxM2o3RElMbVBQRGxZWW9waU1pUUQ4eVBneEZDOHR0ekVu?=
 =?utf-8?B?cHo1Q0psMVpqTFdOaXduMVF0Y2lOeUtSWFRKR2QranBQVks5MEZCbEpFMmta?=
 =?utf-8?B?ejh5TFhCTW1ZcWtvZldBdlZWQ2poRS9IYk1XeDhqUDhGK2dLbjBhbklvc0hO?=
 =?utf-8?B?Nkl5eWprRllzZU1NYTlRK3JkZlViQzZ4NVp2bmFBeVZNM3ZObWYzTTd2Y2p6?=
 =?utf-8?B?eGc5MnY3VDJ3eFV0QTVLQ0FuMEhWaTM1QTdNc0MrWVQzaFRqN21tK1JjVmNp?=
 =?utf-8?B?OEdWRFpja2RnNVBSdmtqVC9DQ2ZTWE5Ick1XVzJ4QUtyNnBjOURtMDhXN3Jh?=
 =?utf-8?B?amg2QjJkTXNvSnBzQmZ6OU01UjF4Tmd2d3hyZ1p1TUF2SGEvUEdMNjIwYVpw?=
 =?utf-8?B?ZEtwOGpYSVVxY1pZakY5MUx1d1NzSHNmaURSZjRiWjUxd084SGdXOWpUM2JX?=
 =?utf-8?B?SlljcXZ5NXNjN1YvOWJXT21nK242L2ZoeCtiV3dJeUxWTXc4d3ZLY0gxNCtv?=
 =?utf-8?B?T0NDdm5Sa3BDOGVhT1JxZUdCM3gzUVJNQ2d6Skc2ejFwd25ab0tiTFRqREFi?=
 =?utf-8?B?c3Y5WFR4U2xkS0RhajJzcW80dGM0c1l3MFRhZXppTy9kM2pDVmhYS0sxcEVo?=
 =?utf-8?B?dERnUk5aUExacFJyRVovUDZPc01EL3djZVgxR0hWTFZvRDBMTHVUNTNVKzNj?=
 =?utf-8?Q?faUSaHW9EUhRR?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZmdEbUhEcWJCblRva1dHdGJiVkx6Um4zK3Fmb2d4bGdqeVRFL09WYWpSL1dy?=
 =?utf-8?B?NnRiSXlMU0N4dmU4cGJyVDY4a2dzVnBiL20za0VXUVpFbGZqemdHSnZId29O?=
 =?utf-8?B?QUM3WnBsL1UvZHpxOUIyMlJLV0VJNjdLWDhyd3dCY09DMlF2RjNqd2d6RFlY?=
 =?utf-8?B?eW9JUVk1SGNjNTFGQlBRREx1cXpEWVNzY2dMRXpCSGVwZEtUZjhTVzZjbzlH?=
 =?utf-8?B?QXdPMWVCZ3l3MDhINXB1TlhtcmF1UnpLTk12OXdEMXVMZ2kvVUdYMHBQdlhV?=
 =?utf-8?B?K1Y5bitMbnpyeXF6V0pZOC9NMVhHYWpqbDU4UGJsYkRpZ21FSVJHTHpDU1NY?=
 =?utf-8?B?a3p5d3FyUVlqL1BmLzRidG1BK2RaTFh2a1Y3TFJpaDNWTlpBN1NsWGJWT1Bp?=
 =?utf-8?B?YmhPRFVFWnVoV0VUdENqeG5Zb21ZblJ6ZndRV2gwdytxWGtnWlExUFU2QWxy?=
 =?utf-8?B?UWpSWE0rYTI5SnFvbFkxSE5IbVk3Umg3ODM4UndMVUk3NFpFeUdKU0cvRGJW?=
 =?utf-8?B?b0JZL0Fkb1VFcGgxM3M2RDd5STREMkczTUFoemFnTFdpRTJtQ0psWnlaRmFr?=
 =?utf-8?B?TW1WODIrWkwrNzkvSUJKbVdpWDMzeDByRkRnVGd4NTFIVnJjMUo4bkVqeTNZ?=
 =?utf-8?B?OHhZZTZXQmVDelJWRW9NSDY4U0t0aGNFUTE4Z0V6M3B0L2lRWkQzUUVMbFhs?=
 =?utf-8?B?ZDNLRENia0pWV2ZpNXJONFF1ai82N0o1ZXEwcnhTK24rb3ZpdHY2ZmhPSW9N?=
 =?utf-8?B?OVBkQ3Bvc2pNWDdtM2U1aFlBcWIza2l6bWYwMHJmQUhHQ0MzOGFZclhuc2tw?=
 =?utf-8?B?OEZSZC94dXBTYWRKN0NaVlJlR1pDRTA2eUEvTHJ2bHZWcnJRVzVZdXVrM3Ez?=
 =?utf-8?B?dEQ3QVVlVkR5bUdydHZNZnRvVG13VDJubHd6T1JENGE2ZUxiWGx4ZzdXU2Ra?=
 =?utf-8?B?MSs2OFdBTjcyTTBhZitrRGd4dERzNU9OVzVoWmQ4bDM1eTFCNWtmcHZITkw4?=
 =?utf-8?B?YjdJbnJnRHhsaEtHd2JpbXBWSFQ4RVlrK2xnc2pXc0FvTkNlZ3lXMmJrVjNw?=
 =?utf-8?B?bm5BZHUxUVZBU09yWHZTc1hzTEZ1S1dzZXNUWnZueXcrV2hLL0dUczBBQm1U?=
 =?utf-8?B?RGNlbnFjZWZ4WEpReFR3bnlQTjJ5MytmcTk0YS9XVXJwMVVLSWZXbmVJdWxl?=
 =?utf-8?B?TzlpQVJONGRUaEJFL2I1UnQ0UXVGdjhUTmlXZlM3MG5kTlR6TUlENVgycGJ5?=
 =?utf-8?B?QzFmWjRCVVJrS0xOR0FOcDR0Q3FwcU5mc0hBZGV0L1VkZmswWnU3R25XakJZ?=
 =?utf-8?B?WWxEb3VHUzNyeWwyUHpuWnBhVWwvREUrakwwWDV1UmNSYjFRcGQvSVpQTGVR?=
 =?utf-8?B?WU5IeUY2NzMrb3JIU2Vzb2RNVXF1VzZkemJZNkZpVFhrQkZWMEEzZUQwM1JH?=
 =?utf-8?B?VGJycjUzd3BWMGM3U0RsZjcyWGNEMlJBaDZWSEw3Q2VRS0t3dk11SzBHaWQ1?=
 =?utf-8?B?R1hQMWVJZDRZbGxaTXpYeUMreWRraUNLcWtUQlZxNkdqNWZiRG1Zckltc2cw?=
 =?utf-8?B?cVhnY1AyK3RibkNqQWRud3pvWXZWM0dxb21aaW5WSWJORjFGaW03aFkxaklM?=
 =?utf-8?B?YnYwaTBORWtZUEp1Nm1KaHphVjhIQkZiR1hpeFpNYkxaRXBpcUd2MGE5UC94?=
 =?utf-8?B?K3IzYmVrRHJ5VUlQTm5NMVEyWUczd1JsZkxMbU1kVTNuYWxUaThIelZCOTBr?=
 =?utf-8?B?QXFVVmUwSU5jWlhSWUlxVVBjL2FGWHV1eTZQWHM2VVlyaUN1dlNjTUZ0cmli?=
 =?utf-8?B?bTE2M0ZJMUhGanlmdmMvcU9leEw5UjdIWk82aGJ4bmdYeXF0Yy80ZVRJemtv?=
 =?utf-8?B?MEdGK0ZmOWZFY3JCODlwYlRQeVB2VVdlS0lKaURobmRvaDFmUTVOaHdSSTho?=
 =?utf-8?B?d3p2UkFGNEUzTXh4VXRSKzN3MngwK21BQVN2TEJnSlp5NkZPb2R6ZDBYNS9o?=
 =?utf-8?B?aHl0U3J1STlYUi93cHdTelZKUWZJelBEUGRWQm1LNFhsYlRCdzg2eFZvd3lP?=
 =?utf-8?B?YTViZmRkOGtBdnlFVHZlREVMUHVuRGF4NFV1all3eUM1TlM3U3gvcTBVNTlD?=
 =?utf-8?Q?6NRE=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3372343d-d37f-4120-3571-08dd3be748f6
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:51:10.6338
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: usmEomScJ3G9z380dOC/g/lEYSerj2UZzm4Vk9WhpRcW6tQ90MQz4/ZRPl4ccPkC
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7635

Hi Reinette,

Sorry.. Was on a vacation.  Addressing the comments now.

On 12/23/24 15:13, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/18/24 1:37 PM, Babu Moger wrote:
>> Introduce io_alloc_capable in struct resctrl_cache to detect SDCIAE
>> (L3 Smart Data Cache Injection Allocation Enforcement) feature.
> 
> Please distinguish clearly between the resctrl feature ("io_alloc_capable")
> and the architecture specific feature (SDCIAE) that backs it. This is similar
> to what you have done for ABMC and makes the work much easier to understand.
> When the resctrl and arch feature is used interchangeably it becomes confusing.

Sure. Will rewrite the commit text.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: Changed sdciae_capable to io_alloc_capable to make it generic feature.
>>     Also moved the io_alloc_capable in struct resctrl_cache.
>> ---
>>  arch/x86/kernel/cpu/resctrl/core.c | 7 +++++++
>>  include/linux/resctrl.h            | 4 ++++
>>  2 files changed, 11 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index c2450cd52511..39e110033d96 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -306,6 +306,11 @@ static void rdt_get_cdp_config(int level)
>>  	rdt_resources_all[level].r_resctrl.cdp_capable = true;
>>  }
>>  
>> +static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
>> +{
>> +	r->cache.io_alloc_capable = true;
>> +}
> 
> rdt_get_sdciae_alloc_cfg() looks like one that should have "set" in its name, not "get".
> This also does not seem architecture specific so "sdciae" should not be in the name.
> rdt_set_io_alloc_capable()?

Sure.

> 
>> +
>>  static void rdt_get_cdp_l3_config(void)
>>  {
>>  	rdt_get_cdp_config(RDT_RESOURCE_L3);
>> @@ -931,6 +936,8 @@ static __init bool get_rdt_alloc_resources(void)
>>  		rdt_get_cache_alloc_cfg(1, r);
>>  		if (rdt_cpu_has(X86_FEATURE_CDP_L3))
>>  			rdt_get_cdp_l3_config();
>> +		if (rdt_cpu_has(X86_FEATURE_SDCIAE))
>> +			rdt_get_sdciae_alloc_cfg(r);
>>  		ret = true;
>>  	}
>>  	if (rdt_cpu_has(X86_FEATURE_CAT_L2)) {
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index d94abba1c716..5837acff7442 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -129,6 +129,8 @@ struct rdt_mon_domain {
>>   * @arch_has_sparse_bitmasks:	True if a bitmask like f00f is valid.
>>   * @arch_has_per_cpu_cfg:	True if QOS_CFG register for this cache
>>   *				level has CPU scope.
>> + * @io_alloc_capable:	Smart Data Cache Injection Allocation Enforcement
>> + *			capable (SDCIAE).
> 
> Please remove arch specific text here. For example,
> "True if portion of the L3 cache can be allocated for I/O traffic."

Sure.
> 
>>   */
>>  struct resctrl_cache {
>>  	unsigned int	cbm_len;
>> @@ -136,6 +138,7 @@ struct resctrl_cache {
>>  	unsigned int	shareable_bits;
>>  	bool		arch_has_sparse_bitmasks;
>>  	bool		arch_has_per_cpu_cfg;
>> +	bool		io_alloc_capable;
>>  };
>>  
>>  /**
>> @@ -202,6 +205,7 @@ enum resctrl_scope {
>>   * @evt_list:		List of monitoring events
>>   * @fflags:		flags to choose base and info files
>>   * @cdp_capable:	Is the CDP feature available on this resource
>> + * @sdciae_capable:	Is SDCIAE feature available on this resource
>>   */
>>  struct rdt_resource {
>>  	int			rid;
> 
> Leftover from previous version?

Yes. Will remove it.

Thanks
Babu Moger
