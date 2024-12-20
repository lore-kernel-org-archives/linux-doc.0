Received: from NAM12-BN8-obe.outbound.protection.outlook.com (mail-bn8nam12on2064.outbound.protection.outlook.com [40.107.237.64])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35D5D21A45E;
	Fri, 20 Dec 2024 18:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.237.64
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734717954; cv=fail; b=TO563pRuXCJLhhGopP0L2sFldS8SD68EcwQRn6KusLob9Qs5uar/Dj3ip6zieoiHTpqUp2fpVM8SV2uSwO+e0YcfjcJiK9cv1y3/IjpBJJmBrMDQPvsZAKNOcaT14kQ+/wx7jZZmBJ1hzi+x9v1mebczz8rXlKEgVwUKG7BKv84=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734717954; c=relaxed/simple;
	bh=v3KgD2vKpPtF3iv9p6oBRNkGjhebCYJx+WE05i38b14=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=A9WZEsEH+ERetxTXeZSpdQ8SH4ZVTN+ME5ANDe5/Z5rm86Xd3uv/oI4bjeCtwB1pssRB57n8EgfmcmhTKzkAvjI0t8/fbcNyMdJz+dPtDlVukLd8DBTXcYccquJ37w34A1RGfUNw82vUsN3jT5qToeqlUfDj9+InzIn9nTnt+KU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=NP8q7ZRD; arc=fail smtp.client-ip=40.107.237.64
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="NP8q7ZRD"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V1+bUHGcYtVpHnCmMpu05v9UMi6z1hQOCU1P9ErtNPNpNrDpR4DHE0MwjM4QW3Sky9zYTuIuQ8t5lbZK8UhG+A8TKvT1spOnEKbpJJurvRNfnQvamqAa10dWwoLuY2XGou0pid07g5g4aoMWs73Rp1qZFne6/q+yYJfYXlxUggpeEAklKdufb9BOlTp8zwMwED98Sa+ECE1H8chSJ3RlIJ6O5logZXxlkYaFMdx9iexKBmZxBfAXI3wzOZBSttkbMjYXb6HxPY2vdCpgHrF3zmJd5wEGzMftL+BZLQkl/Rm3krGs9tLDDCXYl45pF0oq9vXH2uXsw3wXqiScoofwhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/EW8RiEmWhzWpTC2jOo9d0sh3se8AZ5f6o5ffulk+e0=;
 b=k/Rp3zYManN6ix5ziqAZap0VEbwyQIWdg/rn+PxYU4foFqJGYENk8odO9TUoQJn6fUy/bEXabFTKveQjFN5lh+BVpT0RAIlWs22+dQ1G6neDyBNa+okBWrkhr/sy4lSnslSqNCRouDKjjLxk3uWpzTSL6svfZA8VcQMcf+fZP3eDz6iKKxzjI4o3oJ0aFuDwUGAv4dTGfdMtU4J4ZN0QAw8xZwKYudcV+1SuRzK/TAF+dXTqgMAn4BGV0mOfsFkqPufFpYNWeQq6oylBKkLMl6f+6ExqPYpiUR9+4B3y9WzYuhW2ZFA/JAKM/+NfVZaDxirfOrEO7Q8Pv6EGL5mB1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/EW8RiEmWhzWpTC2jOo9d0sh3se8AZ5f6o5ffulk+e0=;
 b=NP8q7ZRDogPlQXWSBBJll5O0MhPPGvWna937U9I67+jLY5jEvJzbl74AO5cNNogaiq5BsXkgIt0JHPdahKa31yLENwg+GY+YxDCmQ4MfHm95zWnJsEC46DJFdBqOIz0TiVVMlVTPEoP1Em/h2npf6kQQcZBVW73ukSNDunpD+jg=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by IA1PR12MB8539.namprd12.prod.outlook.com (2603:10b6:208:446::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 18:05:49 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:05:49 +0000
Message-ID: <f9fc3950-71e4-471f-a420-73aa8320807f@amd.com>
Date: Fri, 20 Dec 2024 12:05:45 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 13/24] x86/resctrl: Introduce interface to display
 number of free counters
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
 <0376bcf61650e619b3f39ea8c2e59b6807de28b1.1734034524.git.babu.moger@amd.com>
 <bd18ea99-5126-4eef-8906-d90115f4c225@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <bd18ea99-5126-4eef-8906-d90115f4c225@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN4PR0501CA0029.namprd05.prod.outlook.com
 (2603:10b6:803:40::42) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|IA1PR12MB8539:EE_
X-MS-Office365-Filtering-Correlation-Id: 75c715dd-9a3b-410c-4e92-08dd2120ef67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?Z040YnkwNzk5V3lXeXRUNDIwcW5rbkVWemhCZUxZdWp1Z1BmSHJqNExWMklI?=
 =?utf-8?B?MFVUMXV2cG90cmdBWmdjOTN5bGFXUHFSMzczcWtLOFFYQVlIYUcxZi9CaWMy?=
 =?utf-8?B?dFo1b2VLOHdTTTRYNFNDK3pkdHBJekpaanl6VC9jQ2o0dEtuaGxzb1ZxYmlr?=
 =?utf-8?B?b3QrZXhrTk9SQlBmbHQzZXRXZlZrRFJoYmRkemFCRERyT1VBN1RuODE0aWVG?=
 =?utf-8?B?Y3I3eFJtRVpIREE0ZWs1TjA3T0VrZk9PNFVWa1RsU1NtL05YODVtYkpOSjEy?=
 =?utf-8?B?MTBqSGVJMlo5Ykh0eUlaYUhTYW1McFpKM0drcFN1OHFjYzZ5OENLQ1B3U0E0?=
 =?utf-8?B?R0o4cVF5bzUveEQ2MlZBT2c5aG9VaExRVXVqdTdXQ1BJS2Nkb1kvaVpvdi9U?=
 =?utf-8?B?R3B6N0cwNldSbXNsSzZTRE82V1BaNUpvNm14Q2dsRWZUbWh5VUIyc2dNT2Mz?=
 =?utf-8?B?WVBXN2Uxbk1qZmliM2t3c0JPWVFUcTBPWmg0eDVidDNQbWZzL0dzQ0hnaEE0?=
 =?utf-8?B?a0Vuck4xWkRFWU9mRTdVQTVBTmxOWnNyL2cxdEVld3hxV21xdmIxTVRrOVJZ?=
 =?utf-8?B?S0NUbW4rOHZEMDN1QWR4L1lBOVkvcVp6c3RBdm04Z29KVXNOWFRRQWVxYk5D?=
 =?utf-8?B?YWh5NzVOUGk4d3hHZzhKU1FnUDBFOEtudWtCTGFOZ3pWai9rYW5GRzBmdnM4?=
 =?utf-8?B?N1VJblJ1cUpiUmlkaGRTUDVzemVybkNHN2QrYkZhcDlvVjBUUzVzQmRjcEJ2?=
 =?utf-8?B?cFJnUFNuWTJvVkVLaWJGUVhjWE5XTmk3WDhtMDkvNjV1SmdkOFJPVGhUZW8z?=
 =?utf-8?B?MjhYeEpIdDJWVjJDODBSUzhWdEhEdC83eFVYSDVDMFcvVlpWUUpwT3hOb2lx?=
 =?utf-8?B?Z3BPTnpRc3lLUm1rcFJVMkxuUXNrMHEzVGIwYkZrVyswQWZ3b3hZMnBPREQz?=
 =?utf-8?B?TVhiU3lPKzR3MVpvOUY3a0JPMDZBVG04VEpCaldTOW1nK3d5TXl3RzlBcVhp?=
 =?utf-8?B?Uys2bHA0c3A4b285c25FNlhaRWlGSFhibERHc3pzRS83d1YyNVlUU013TlBD?=
 =?utf-8?B?dkJrOUFoMlBzall6Tm9CWXE3MEw2R1ByL2I5dXI5VG1BOC9ENUxpcXBYT1BK?=
 =?utf-8?B?d2JRSStqLzZBSjRFaFN5TFNBZlpQYVdPaUtIN3ZXTkZrK1pKRmRxckUwTUgv?=
 =?utf-8?B?SHRTVENOSkMrN0JPNEhNUGhRaitQMy9uQmw3UE1XZXVBZVdkKzVocXZBWjc3?=
 =?utf-8?B?RC9Bb0RpZkQwOVFQTUtqcDFla3AxZHhZQ2xFVUhxQUd4d0xOazI5ZUNvQzht?=
 =?utf-8?B?dFduTUk0MGx3S280SE4wbzZaRExGL0x4dWltWnp2TlVrcHFTUHIwa09KaEdi?=
 =?utf-8?B?YkhVcm8zZ2RiZHJlL2dlbk8rUWxubkxKWk1tdmtxUEQwQ0dXUmF5Mng2MFl2?=
 =?utf-8?B?SVhNYWpyeWowdnRwcGt4OHVHMXlMclhsT3JHS05OL0pBRlV6NnV5dkRKdnl2?=
 =?utf-8?B?N1NzL3J2Q3g3a1QvRjQvY043ZnVzb002eUtWNFowZGhlcUVCV1BlUDh4QTdU?=
 =?utf-8?B?L2NBWVpxcGRDUSs4alpGTGdSYWpBajlMNnZpWlhSWFVRSzRlTVh3OEUrYnFv?=
 =?utf-8?B?S2lOWWJQODNtYzU0NXlvZjlveXdtVWR2cTh6OHFKY0VGZzFYdG9UdENLQWtS?=
 =?utf-8?B?Z0craG5qcEpYNERZdVM0R2ZOWlArT3hIa0lYaWpEOVNPSmI3dzlnVERheStv?=
 =?utf-8?B?TGhyTm53WEYxYkd0TEo1Y005bHB1VTlLYXVZbXZ0ZTlQU1p0UHEyTDdxVEZX?=
 =?utf-8?B?SjdjYUw0UUx3T2RQUEtWNWloQ1d2K0hyTnFwSzR3R1oyTWhCRFZmMDF0cHZv?=
 =?utf-8?Q?jB3bWNdVJZOI0?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QXA5dUlRNytWN3AvcERiaFMrQXJ1Nmh0a09FQ0t2Y1o3SUhXcXlReHpyb2VH?=
 =?utf-8?B?SVFMc0dCQkNnaExKL0NRbWlVQ1JRRzF6bVlmdDJYcXhTSlV0dUd5N0NoVzVa?=
 =?utf-8?B?aVJiZWxoM2N3SW5BTVNkYVArdUphQzVBb0tXb3Iwa05OZHFCYkpHUS8vY21a?=
 =?utf-8?B?bEJPLzlhSlZuMjlBaU94MDJxZDhyVHYzbmsraDN5d3ZpNGdsYVVTUElFSTJk?=
 =?utf-8?B?SDViUXc5RkZ4WStxZXJPMFZaTk43cWwrYlZoVG54Mm5JajNQNi81NzYwZncr?=
 =?utf-8?B?M0hqajNFOS9ONGc0TG44QVAzREFiMmtZa1Y2YVQxM2pvMnMxODBhUFhpWXdn?=
 =?utf-8?B?bEpRK2ZpVTd1bzdLRlhVZXRjS3UzN0gzVkJtclcxdUtpcUxGLzhPRHpxSzJJ?=
 =?utf-8?B?Q242UnRmSU1EQzMrYkh6SURxcHY4VTZNYmJQbEZORUZZNGhrb2VlWll0bzBE?=
 =?utf-8?B?MndsZlpCVk5YWEZlL01JNE9nbk9HQVprczNLNm5TYS9lVjRBeDN2YkFnaHJi?=
 =?utf-8?B?eFVYQW1ETitMS3ZGYUJkWmpTemZJa1ZhQUJ6d3FzUXpkMnlRbncvckdHQm4w?=
 =?utf-8?B?S2x0NkNBUzdHTHVwdHdyQjBEWGwzY3R6YUk1M2lTVEJicW9ENlBwQUl3bkl0?=
 =?utf-8?B?US9qaThMV2QzTlI1QVJRR3VtaWlSR1ppaFdWV21OR29XL2dud2pVTG00eDEy?=
 =?utf-8?B?WnRZUS9UcmhFNzcxVFZ1Q3RwdUlNaGZNUHZyNzkxZlNTUVRYOVE3c2xvRHVU?=
 =?utf-8?B?ZlNwQ0pHR1BpdGZFVWYzdkVnaUNldUd4c2ZyMkY2T2gzZWFyM0FSVHVhTlVp?=
 =?utf-8?B?ZFhzU2JtNTFzYkYyUjNCb1JYYnFNbFZMVzhqY1pVTXlEZmZwUkJkRDdyTFlM?=
 =?utf-8?B?NWp4YVMwUlQwOC9NMzgyY0Z0STFuZ0IzU3d0QlJwNis4MU1kZmJyYlBaU2JV?=
 =?utf-8?B?Q2JtaXdZeHRvR2Yzam9GZzZJWWlRZTRSUCtrUDhrdSszaFEwQWZkcjFBUVNM?=
 =?utf-8?B?QnRIZVhUTjlYNXJsaEN4dFpPRVVZMTdBa1NxVFZYcnJmUWJiUzFnN0ZzYkln?=
 =?utf-8?B?YWN3MjVEd09ZQ05wNFFtdTI0ZlhKdVh5cHo1blZTT1pRL09WdXNydVZKdU43?=
 =?utf-8?B?SEdiMXVBQXord2Y5cmMrVEpEZTMzd1RlbzVUemp4amxHb1FwT0huR01oNHcz?=
 =?utf-8?B?N1l3YW0ycW5DbThXd1A3N0F4U1BWTTFkSHFWNWoxYnF3Nm5oSms3a2tkRWkv?=
 =?utf-8?B?eXc1RDU1eWlBdU9FK0FTUmw4ajlWT0pqQVNjemV4MHV6Wlg1d2wrQURmZkFQ?=
 =?utf-8?B?c21tL0V1UVVmemtOVkZxMnorTjBsNHNrS2M2T1B0aVBDMnZ2UTZYbE84a0Z1?=
 =?utf-8?B?RThvT1c2SVljYWNkVW9BbkpZbTUycFdQSXFEUnY0aUlXUXEzUzhOYTZvaFRj?=
 =?utf-8?B?NFVxOU9zai9BZElEZUtuUG01TUh6UTFmeHB0WkNVRXUrbHU0SHZ3aGZPaEZq?=
 =?utf-8?B?VnphN2Z5bk50Y0tDWUhlVnJIUFVMbjNyZDRqZXd4ZS9lUjJ6OGtpdHJyOEhF?=
 =?utf-8?B?b0NJV3lKNlk3VzRrU1AzNXEzeXZHaG84ZVlrMDV0eEV0RkxPNU1xVC8yWFBF?=
 =?utf-8?B?SkZMT0QyWWQ5T1NVbDVzb1pBTXYyS2xDeWhuemFPWTRyL0pJQlIwUitXRGha?=
 =?utf-8?B?aENiL0M3TFgvaENLL3BDb3laZWVDTi9jN0NJVjhnM2dFYlB4clc2bmRwWkxv?=
 =?utf-8?B?b1RyR1NEbnBVUEdsUHB0dGpUYms0bXB6NXpCWVVXNjF2bFRnajdTUEpuS2pX?=
 =?utf-8?B?WWp4QXg0NUxwaTVYMWIxdjFBOWVVWnJ2d0pDVzM4eVlJQ3ZXU0tVWUhocDRZ?=
 =?utf-8?B?cExuYTBUNTBCQlJ5aFZseDU2U21hWTJCNHF0Y05abWdpZXZqT0JQTUtZZDA5?=
 =?utf-8?B?dVpaeXRnQ3cxQXdsK0tuRTVrYmpUM3BhSVczeXl3MVNneGVIN1EzUUxzVEdP?=
 =?utf-8?B?RnRhZGJGTDZRZjVvZjdkT3NUVzJNU2RPbk1FMWZMdUZvaUhwbjVrMlNCTFll?=
 =?utf-8?B?UFVRL01rODhaTXdHeUFuRTVCT21adG5lall2NnVEcURVNmtNM2FXTVVaa3M0?=
 =?utf-8?Q?4/kcaNuQ/haB9pyJ2YEgd9AaO?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 75c715dd-9a3b-410c-4e92-08dd2120ef67
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:05:49.7452
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YZUdj88xB+yrzhdqISJjVgxOnxsjPBQQKYZNrMcl6JXwJQx31hD8NePUXaGOZobm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB8539

Hi Reinette,

On 12/19/2024 4:50 PM, Reinette Chatre wrote:
> (andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)

Yes. I know. My mistake when I grabbed the get_maintaners list.

> 
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Provide the interface to display the number of monitoring counters
>> available for assignment in each domain when mbm_cntr_assign is supported.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v10: Patch changed to handle the counters at domain level.
>>       https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
>>       So, display logic also changed now.
>>
>> v9: New patch
>> ---
>>   Documentation/arch/x86/resctrl.rst     |  4 +++
>>   arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 47 ++++++++++++++++++++++++++
>>   3 files changed, 52 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 43a861adeada..c075fcee96b7 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -302,6 +302,10 @@ with the following files:
>>   	memory bandwidth tracking to a single memory bandwidth event per
>>   	monitoring group.
>>   
>> +"available_mbm_cntrs":
>> +	The number of monitoring counters available for assignment in each
>> +	domain when the architecture supports mbm_cntr_assign mode.
> 
> "architecture supports" -> "system supports"
> 
> It looks to me as though more than just support is required, the mode
> is also required to be enabled?

sure.

> 
>> +
>>   "max_threshold_occupancy":
>>   		Read/write file provides the largest value (in
>>   		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index b07d60fabf1c..f857af361af1 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1238,6 +1238,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>   			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>>   			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>>   			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
>> +			resctrl_file_fflags_init("available_mbm_cntrs", RFTYPE_MON_INFO);
>>   		}
>>   	}
>>   
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 1ee008a63d8b..72518e0ec2ec 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -879,6 +879,47 @@ static int rdtgroup_num_mbm_cntrs_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +static int rdtgroup_available_mbm_cntrs_show(struct kernfs_open_file *of,
>> +					     struct seq_file *s, void *v)
> 
> rdtgroup_

Will change it to resctrl_

> 
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +	struct rdt_mon_domain *dom;
>> +	bool sep = false;
>> +	u32 cntrs, i;
>> +	int ret = 0;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	if (!resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +		rdt_last_cmd_puts("mbm_cntr_assign mode is not enabled\n");
>> +		ret = -EINVAL;
>> +		goto unlock_cntrs_show;
>> +	}
>> +
>> +
> 
> unnecessary empty line
> 

ok.

thanks
Babu

>> +	list_for_each_entry(dom, &r->mon_domains, hdr.list) {
>> +		if (sep)
>> +			seq_puts(s, ";");
>> +
>> +		cntrs = 0;
>> +		for (i = 0; i < r->mon.num_mbm_cntrs; i++) {
>> +			if (!dom->cntr_cfg[i].rdtgrp)
>> +				cntrs++;
>> +		}
>> +
>> +		seq_printf(s, "%d=%d", dom->hdr.id, cntrs);
>> +		sep = true;
>> +	}
>> +	seq_puts(s, "\n");
>> +
>> +unlock_cntrs_show:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret;
>> +}
>> +
>>   #ifdef CONFIG_PROC_CPU_RESCTRL
>>   
>>   /*
>> @@ -1961,6 +2002,12 @@ static struct rftype res_common_files[] = {
>>   		.kf_ops		= &rdtgroup_kf_single_ops,
>>   		.seq_show	= rdtgroup_num_mbm_cntrs_show,
>>   	},
>> +	{
>> +		.name		= "available_mbm_cntrs",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= rdtgroup_available_mbm_cntrs_show,
>> +	},
>>   	{
>>   		.name		= "cpus_list",
>>   		.mode		= 0644,
> 
> Reinette
> 
> 

