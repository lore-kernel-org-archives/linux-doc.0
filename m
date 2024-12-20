Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2079.outbound.protection.outlook.com [40.107.93.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C341A0B0E;
	Fri, 20 Dec 2024 20:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734726850; cv=fail; b=HdfNa8juQEkm9jHZcMlyNSj4z9UogkgyQnMdWRdjVzGrmt2UAs++asDfTqte/qAg4XNwGm3r7D/QCuSZX9rPtoykc0j4bicomgh8Vmxrz1KBS1SiYYNx2fts8YfnGaIAXz3l86LPP+hckT7giPEnYqyZemmRCXQz9gYY4QPDhCE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734726850; c=relaxed/simple;
	bh=IwnSNknrLiR/dco7+bo14PR9ty68v+7onBzBamTFdeg=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Q+9HVVaVk2GGr+AqeWcKpxV7QAizux7d9msmuD3Cg1E3Pcq6/dlr8UcFuIcG7g8YVh5wMbdGG77+Gx8DPGqBndvkdJAi7LvbirqT4y74b3HHK2IRGgMFbih/8vbcVl0ORjLw+ORX7cy0UHNXB5Ppt5C7g+/cNrG2aQl0hIq5U7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=iLdz3hwb; arc=fail smtp.client-ip=40.107.93.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="iLdz3hwb"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k9OD5G1KKWU1irCfvuJjnPXZddonnZ5D7btyLrYQR/Y13MK6yf87I9G5qUWCnmy00K6vVIjC6QDzA+Xst937+0mh+ELI2bZ+MQbTKEmZojmhfLeZCBEsvNEY3kUjTpaF80IiW6PRburI0tQkDWZIh+jltdgvbXhAKNcQNZulODA9/7jjV0kWapzm99FHjVpN4CPWCg2SMmoLlsHY8LbUIlj/RgYKiDItNJsYYlGNAd4eFFMGJP/ZAviBi+OrXfsaI3GATsv6Paq73eIu2RZ+501OwgGvV8QBn3I2D37aCtyUq330B66l1Y2F0rgbf5ng2n903Q8KkFLIYSMlygPUlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=D3SeMEuUDogKogEwYPlIqdGylGKpwdds8d+AzUL8r6E=;
 b=OJorULCqOwKraqws/w3OG6lRrqkw2OKP+o0/UROpAxiKRN9EJve5X9mhLHWNhkG1ahqfGyzPka8fqQxCorvaxVTWuMrP2tawiIJc6AUiJP9heAYbddIKD3rT5OahcDFBAtcNrZ4UvHGpXqhSilVpXRNcSmwGOuaUXU2f0fMhrmm9l5J+Wnjus1RSvHAqkgwOFOOCBehr8mBxAdDT1/j8cQ8Q182Z949Sxh2pKC28P9fL6Ra0ExynIontcO8BgBSqrgcOj73XbuzVgSBuwUQgW0D7m7iiqum5O7hN2ya4IcHd2o/AIyNOuXjMJ38czZ2XoYBYHt0iopLZNi1c+P5UsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=D3SeMEuUDogKogEwYPlIqdGylGKpwdds8d+AzUL8r6E=;
 b=iLdz3hwbev3hVlSw8TsS2DuhGLr+PVPV8ZAKWpo+8uN0LzQmTYleLG9xX0Ome2CBueyhZENh4B7xCZZ6HHwqUIKs1QCPwkD8P87LssJoscCo5wFdX40meu8800dg99/efUSRVkl+xx6V9q1g6Cacg3UqT+o10bFeA2hJ1QvEq7I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4421.namprd12.prod.outlook.com (2603:10b6:208:26c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Fri, 20 Dec
 2024 20:34:06 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 20:34:06 +0000
Message-ID: <47c64fa8-30e2-47b9-a479-90ea7f8cbbb9@amd.com>
Date: Fri, 20 Dec 2024 14:34:01 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
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
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
 <69d7f38c-2df4-4191-80cc-cc5c724b2050@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <69d7f38c-2df4-4191-80cc-cc5c724b2050@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN1PR12CA0069.namprd12.prod.outlook.com
 (2603:10b6:802:20::40) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4421:EE_
X-MS-Office365-Filtering-Correlation-Id: 53419a03-3e41-41d4-72be-08dd2135a603
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUwwc1oyT21RQmt2KytTMytuVldGdW1iQWRNRk5CZ1d3dUFFNXQ5VTVPMm1N?=
 =?utf-8?B?VVlJQ0tNNkcyNGYxb0R1NEt3TmpmQ2hsQ0hFaXRnQm90WUVyandJdG9hNmlI?=
 =?utf-8?B?WXhHVit5NHJBMVN3OWFvelR1c3Z6aWErUjFZV0NaVzkvWE40Qm1zOE52aEZz?=
 =?utf-8?B?Vi9wMWtUQ2NYbFB1ZEVNNW9WTmJSdTRCNkhIaGVOTktWdm5pTlcxQzEzaEUw?=
 =?utf-8?B?MXJXSWl3ZUlKcitTSzhNWGtQV1JVTHJTOCthaERWNE5uZWlyUEpmY2xQbU1l?=
 =?utf-8?B?cmdoYUN4MHYyYlZ6QU40VUtnQm1paC9Rb09yZWQyLzJiSEVqb3ZrL0t1cmNN?=
 =?utf-8?B?aHAzMzlLQm93UVQ4LzQzY051RTIyck1oN3lBQW1kU29nWVlIbkZveDVJMHVL?=
 =?utf-8?B?TzhiYnlWOTZLdGlYYUFabjZHdWJKR2RETzZ4alJvK0JzSHhPSDBvdnkyUmFh?=
 =?utf-8?B?ZnBGMTF5ZnJvMzYzU2pmbHdUQVcyQ2kza1U4b0t1OWlKeTI3citIeTRYajBU?=
 =?utf-8?B?bGFVSDRIOHJnenZqTFJBS214UUNIYUg4R2ZvclVGUEtGSHBVckJyWUR4Z09C?=
 =?utf-8?B?R01GSkMrS253M0lwbDhsTVp3ZkpuQUFBeHFRaDZaZWppZlJxN2tVbVRDdEl1?=
 =?utf-8?B?Uk5hKzZjR2xlYkpLODBTS25tNmNwT09SQkVsTGVhd01NQlRMYldkclFZeE83?=
 =?utf-8?B?b2F4K1UxRE8yaGwxU1RpYXh6RDRMcktYakF4bUh1K09VZlMrWWRZOFVNaXRV?=
 =?utf-8?B?U2hRbEFnQTM5ZGQ5c0I0czIwT0NQUlV5U0NPZXlFSjRma2dpSERZdWM5Y2l3?=
 =?utf-8?B?Y3IyTXRKdERoL3Q1VU42TWtkY2thRC94d2NhdlBsSjB0NHRNZVBxZTkxM0lT?=
 =?utf-8?B?R0JQbXI0MTRpMUhTNXFMRXRkaEJmdjcrZXQvY0xOOXFmSGRhN3dhWllDSlhx?=
 =?utf-8?B?V0thdmF5SHUrczlpSUxxWGo5U3BSd04rZmt1UGxuZzhVNUpyYlJaK2VsZEgy?=
 =?utf-8?B?Mm5lZlNqMUp0cWR4UWdxeWd3Mm1zb1orZjRBS3djK29CcTZhL0pyUDhRYXVO?=
 =?utf-8?B?Y25EbFcvVENTTHdRVTYyL05aTDVvTStOYVk3NlpLcHNKeWprdWxNR0pLZVIw?=
 =?utf-8?B?UU9PdTJUbnBhQkpQWGVqYTZxNW8rYU5BK3h1aGRJVGdHRUdZcjlkZnJBMmVi?=
 =?utf-8?B?MW1XalRmYlZ4K0ZhYXpUTGVhNnQ3Vi9vMVBvQ241cTgzM293c1VlczU0M1BO?=
 =?utf-8?B?K3M1YWJhYitVbjA5TXFwQnJJaGplcmhLLzU1bzRuRFlReXQxak5YeFlVcVdw?=
 =?utf-8?B?UkpMdWdFZUc0OXd0Y3VyUXlERldrbm0vSnFzY2xXV0R1VXFPT0IzdWdUM1Vo?=
 =?utf-8?B?Z3BZbzcwRGNlUFJyWWZTSHp3ZFpibWhURlhuL0JNeFZTWUl3TEFYcXdjdUVV?=
 =?utf-8?B?MCs5MHBKK1JRRG1uQzlxb2ptYUF4bW5iS3VkVlVPM3pKbUZIYkRHaVk0SmEx?=
 =?utf-8?B?bVJ2NXlaZXpXNGRKbFNWUFo2aHBlaEllZlZKOVRMVzJBNTZkUHJwSWkydnZ0?=
 =?utf-8?B?Wk0wVENlV0hKbkJmQkZwWUQ4am9Balg5Sk52VVkzYTlIZ1dvOEtGMnF6YnZK?=
 =?utf-8?B?S2RCN2tQL2NNdUFyUjU5VzAzdEVhd2ZvTTJGaExlb1RldUhxVmlSNWtzZ3dw?=
 =?utf-8?B?b2lxZG5uelloYnp5TUNFbnNSS2V6L01iV1lkbXdBT3c0THNFUXNoTmt5TERq?=
 =?utf-8?B?TVVaSlZ1bi91Uk16WEZIOGRUa0lpeGNyVHE4a2dZdlh2UDk2Y1BvK0dBTXJC?=
 =?utf-8?B?UXZQdVd4bEpjekZpMTFYYkQvYWlsOS9QcWJCdnpIbVNoUHFqRDNXVE1WUWF3?=
 =?utf-8?Q?Ui4VsiGEotTT9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z2hvR291SkJJeDFjbUhFOWlveSs2aUlGKzVKd0I0QWY1UGRQbkVjZUZMN0sr?=
 =?utf-8?B?MVhHUDlxU085OVlXT3BXb1NvelMvUVlkeFdJWlRiUmJWV1Jzb0JyVjkzNnRK?=
 =?utf-8?B?Zkt6ckUzcWZKNktxSWpJL3VRdmJuZzJXdnliQ2NPM01VRDV4aUQ5Ym9yclg3?=
 =?utf-8?B?eWo0QTltUWozTzZEMGE2SzM1dEZUMXpOdis4SDhnM0VuaXkwbnZxbkZHZzdM?=
 =?utf-8?B?VHlMMHM3cER3V3hna21mQ2ZOZjlkYTdSUWQ3THhGUE5JbmtMKytlclBGcHRh?=
 =?utf-8?B?cDdGSEF4dTJmL0lqRWYyMGxkc0RGR0hhaFRtZXg3Q05pMFFBaEtjVzBOdEE3?=
 =?utf-8?B?czJ2VG5XVFVEK3JBNGtPK0Z6elM0UEExK1U0TmxEaXBjdU1ianVFcFdnem1o?=
 =?utf-8?B?NklxYVdEUlRpSXl0WmlFVDA2bmlSYXVjeE4xM2gzVVJPc1FiODAxc0RnbThZ?=
 =?utf-8?B?Z0NuSjNWV0VYQVJ5VEg3YVZwdFlWcTJRUVZ6VmtVTG5peERyWWdxb24zcXNt?=
 =?utf-8?B?U3FxWVgwSzczUDhWTnJRTklpSVhUNzkzdHFBejBHU2FJQmNUaGpZQnFORTd3?=
 =?utf-8?B?c2V6RmlyZTFFTWMxY2tGRVRMWThGSGIyUHc3SUEwMElJU1VSQnZrMVhsS2xC?=
 =?utf-8?B?ZU9VckJYTVU3ODZHVzBZaDEvbU9UbTVRb3I0VnpOM2g5MlJOMUtXZVVzOUkz?=
 =?utf-8?B?R2RvY25oc1BqdFI1MHdCd0xhM3I2RlJucUFqOVpJMUZxeXVoc2MydkJkWjRF?=
 =?utf-8?B?S1NGT3Z1K3lUdVNIQzl1bHBibldrZmxkcThmWjQxMHZlYzZ6NHpjdFlYUXBO?=
 =?utf-8?B?Z0JuQnllbEd3YmZhMlFTOUJCRXJId3hsZnVrK3VPaEhCeDFyOTZDNkJLTkVM?=
 =?utf-8?B?MU5HMjY1c1dDYVpCWTREMTJGSUtqNHNHcElNWEt5NnhPVDRjeUJLZ0lRWE1T?=
 =?utf-8?B?Q2d3Rjh1ZlBmc29jVkp0M1NPcEx0ZUxiMUkwZG8wdTYybmVkemxyV1gxQUJS?=
 =?utf-8?B?b1BtWTlkV3o3Z2xpakxBV0FRN1kzV3dDZ3kwa2E3ZFVRbjR3emxQTHEyakha?=
 =?utf-8?B?b1hqdVdSMURBRW16MlJMTytyY0NZVk01WjVOOHMrZlU1dkdKMzAwMzcwNVdj?=
 =?utf-8?B?azVvZmtoekkvZ0tjd3orVE5NZ2YyaUJQNXFqSzB5QXlXaE5ZY0pSMENhZHBw?=
 =?utf-8?B?MC9RbEpsVFBIWU1XaFpuYTJ4VzVjaCtsajNuTkNxMHNxUlBtc2pnT3FLTXRu?=
 =?utf-8?B?MXFZVUxaWm5VY2swNkRoU0YzRDY2R1grK2swbFVzVW9MV0JkOFRVMWdLZDBk?=
 =?utf-8?B?bnY1YndiRXc1dGVhOWR5UnpHUjJrN3BscW5xS2xiTk1BUjdnb1lkRFdMY1dI?=
 =?utf-8?B?cG5nNFlyRFBFOHRTdGluUDIwYmxkQVFJT0FEbEZPTWVxYlpvNytZbFlvTUVi?=
 =?utf-8?B?NmU1RFBiWk41eDRuNVEwbG9wTm5PRlkwampwWGVBNTNzSkR0ZkEwRFZtVDgv?=
 =?utf-8?B?L2lFbjBjVStXUGxCQzlKMVB4L05uVmg0cTdodjkrOUZYUTdNYldsM0xUQmFh?=
 =?utf-8?B?b1dIelJJZmRySG1NaWg2ZEd5RWtNR0w0WkEweGRhUDZmRjZDRlhtUDhNanFw?=
 =?utf-8?B?MjJLVjFNc2JIcXoyT3N0bEpWVG0ydHRCKzg3dkRCZkdxTHU5bmN1a2Y5SHIr?=
 =?utf-8?B?RGV2cDRZZVZXZGMvbUVDQXFFMzgrbHh6akxhWUdSVnZiTE95UW1qY3hRRlR3?=
 =?utf-8?B?VXIwVHpIT3hteWdZcWtTTU02aWtlZmNRek45bFpZbFNOdjVpbU51Z1ZXNXds?=
 =?utf-8?B?b0ZVUE9pdVkxVDNCOHhIVXZOd3BXODBiUkR0K25FMjcrM0ZPZXIwZUtObVBy?=
 =?utf-8?B?clNrUVVOUlpodXY0NW01N01yVmVrbjVYMFE0RkRMMVhGRTc4YkZNaUNLUFhv?=
 =?utf-8?B?cjIyRjZDMFo3Nk90bmVHbktmVHpkVDYrTGRHamNJdERIWVBjcUV4VjJzTFcx?=
 =?utf-8?B?THoxS3o4ejEvdWh5cHZWZ3JWeUtwMXl1cHd0Y2pTaTBnUXZMVnYvNThXK1Js?=
 =?utf-8?B?UGNFNWRBUWRrUzhvYW5rQnRnSUhCeVJ3azQ5V3RvT0NyY2RmNnNDWHFjTE1D?=
 =?utf-8?Q?mEYq1IYmEZa+38ke6mI7XHDfU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53419a03-3e41-41d4-72be-08dd2135a603
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 20:34:06.0463
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DuEtsFcwWMkqEV//xRWVOey/ix9wpHeKuFjkqA2xZQXNrxbU8L+6/lQUKBqOZEiJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4421

Hi Reinette,


On 12/19/2024 5:22 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode offers several counters that can be assigned
>> to an RMID, event pair and monitor the bandwidth as long as it is
>> assigned.
>>
>> Counters are managed at the domain level. Introduce the interface to
>> allocate/free/assign the counters.
> 
> Changelog of previous patch also claimed to "Provide the interface to assign the
> counter ids to RMID." Please let changelogs describe the change more accurately.
> 
> (This still does not provide a user interface so what is meant by interface is
> unclear)

How about this?

The mbm_cntr_assign mode offers several counters that can be assigned
to an RMID, event pair and monitor the bandwidth as long as it is
assigned.

Counters are managed at the domain level. Introduce the functionality to 
allocate/free/assign the counters.

If the user requests assignments across all domains, assignments will 
abort on first failure. The error will be logged in 
/sys/fs/resctrl/info/last_cmd_status.


> 
> 
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 849bcfe4ea5b..70d2577fc377 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -704,5 +704,8 @@ unsigned int mon_event_config_index_get(u32 evtid);
>>   int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   			     enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>   			     u32 cntr_id, bool assign);
>> -
>> +int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +			       struct rdt_mon_domain *d, enum resctrl_event_id evtid);
> 
> Could you please be consistent in the ordering of parameters?
> 
> int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdt_mon_domain *d,
> 			       struct rdtgroup *rdtgrp, enum resctrl_event_id evtid);

Sure.

> 
>> +struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>> +				u32 rmid, enum resctrl_event_id evtid);
>>   #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index f857af361af1..8823cd97ff1f 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -575,8 +575,8 @@ void free_rmid(u32 closid, u32 rmid)
>>   		list_add_tail(&entry->list, &rmid_free_lru);
>>   }
>>   
>> -static struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>> -				       u32 rmid, enum resctrl_event_id evtid)
>> +struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>> +				u32 rmid, enum resctrl_event_id evtid)
>>   {
>>   	u32 idx = resctrl_arch_rmid_idx_encode(closid, rmid);
>>   
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index e895d2415f22..1c8694a68cf4 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1927,6 +1927,116 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   	return 0;
>>   }
>>   
>> +/*
>> + * Configure the counter for the event, RMID pair for the domain.
> 
> This description can be more helpful ... it essentially just re-writes function
> header.

I can drop this. There is not much to explain here. Code seems easy to 
follow.

> 
>> + */
>> +static int resctrl_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			       enum resctrl_event_id evtid, u32 rmid, u32 closid,
>> +			       u32 cntr_id, bool assign)
>> +{
>> +	struct mbm_state *m;
>> +	int ret;
>> +
>> +	ret = resctrl_arch_config_cntr(r, d, evtid, rmid, closid, cntr_id, assign);
>> +	if (ret)
>> +		return ret;
>> +
>> +	m = get_mbm_state(d, closid, rmid, evtid);
>> +	if (m)
>> +		memset(m, 0, sizeof(struct mbm_state));
>> +
>> +	return ret;
>> +}
>> +
>> +static bool mbm_cntr_assigned(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			      struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			return true;
>> +	}
>> +
>> +	return false;
>> +}
>> +
>> +static int mbm_cntr_alloc(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (!d->cntr_cfg[cntr_id].rdtgrp) {
>> +			d->cntr_cfg[cntr_id].rdtgrp = rdtgrp;
>> +			d->cntr_cfg[cntr_id].evtid = evtid;
>> +			return cntr_id;
>> +		}
>> +	}
>> +
>> +	return -EINVAL;
> 
> This can be -ENOSPC

Sure.
> 
>> +}
>> +
>> +static void mbm_cntr_free(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			  struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			memset(&d->cntr_cfg[cntr_id], 0, sizeof(struct mbm_cntr_cfg));
>> +	}
>> +}
> 
>>From what I can tell the counter ID is always available when the counter is freed so
> it can just be freed directly without looping over array?

Yes. With immediate return on every individual failure, we can do this 
easily.

> 
>> +
>> +/*
>> + * Assign a hardware counter to event @evtid of group @rdtgrp.
>> + * Counter will be assigned to all the domains if rdt_mon_domain is NULL
> 
> (to be consistent) "if rdt_mon_domain is NULL" -> "if @d is NULL"

Sure.

> 
>> + * else the counter will be assigned to specific domain.
> 
> "will be assigned to specific domain" -> "will be assigned to @d"

Sure.
> 
> Reinette
> 
> 

