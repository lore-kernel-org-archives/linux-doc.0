Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2069.outbound.protection.outlook.com [40.107.220.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 464DB1A0B08;
	Fri, 20 Dec 2024 18:32:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.69
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734719542; cv=fail; b=mOsc68dg1RwVd2UdSim+PBkoGMWEKp1lL0KX6eDs1U9NbTi+ArV+6NVJRRpYSj1A1iULX+p9qdhCXBLsz+umLprOzgeV28L62t2Edv8V256kER5EXbAxekSP8U0zBoA20WkzjR8AiniuL1WuymJ6EMc//t36eYmM+ENtIka4KXI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734719542; c=relaxed/simple;
	bh=K3xlOluPnlPKjaIWO1PVwhQwX0TsucL7ovKQ9qwWmsc=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=ZYzfRHHEaeskpCBZ+5KvuHJ080FhCV2qLhS0IHFBjtx+5qmEDTg99bMVG+BzzIWX30Z/S8xOCSACGLbyWHtvz51uN8mKHVEwSkzwkb42NlNIkzh3ARa3x6oML6gJdvME4HmRNLcTLSoBTOwniH35YDpvLC+TlMG3VZ+QnAbVm6k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=X6R/NUoY; arc=fail smtp.client-ip=40.107.220.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="X6R/NUoY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TtCjqsikmCOsdPq/wab8z7ez9NwQhzLa7rpT0z+EPr/h+FAvCVKGHifAWjvS8n6e9uJr1ISVtQfuw/OFxug6PCKTmULrr3R1vYgpQM65NskIzbYRHxBtRgJSbWI/Sq5N6+0brjsUR1ADzVVusxng6bQ15FRqcTE2jHr4yrkMgibJMf/5Mmey6Q4VkGmBw/g05SzasSqaEPuKukqI98u5TPi0OueBCckFGki+HdFGB2ERkBTUm83XvCpWfgU4Yew0ZQYUdf4St5KtUJrxPAlum69m8lDil0Sq+RxSC/MatObj1owEYV1nhS1WwgKHC8Yi2hBeJGKelkXPCA7q6sozog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3r9NiD4P/NjLZoROKFJd2jA1kR7J4u96X9oLJ0ODj3w=;
 b=ueTkmvqmZE4rv0z0aZLp2QoMZDmjOKFHHnG0EPrbNSG7CR27q/L5t7pyYEz0IO9zXIzkS2BNXqFlLx2MB8zCwwbiz331o9t76VjzWAxC1EGpsXabUUTv3SBewdVB3Fn4dF+gKgpNmAGkJ6MBuLVxu4xOJBzup78aWREGBJJDrWPmmI+WiU+LLJxUE7tCMzUnRBWovPkZIwxytdg1Y4jlCBLtMFe9z/AToBKjpC6k/eKFqBKPTX0jk2dC0hCEmq+huAy+h2CiF8WERInm7xwwLFaob/B4DNsBvlMigPFLjqDM6om/Vl4+ZNyAl0kOvelc+g/YxJRPYnyTJW5UzKjHJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3r9NiD4P/NjLZoROKFJd2jA1kR7J4u96X9oLJ0ODj3w=;
 b=X6R/NUoY+1Q72+bFGVh2Qpc+YqGIT9NisD2/e75H/ORc52rzRNU6RwodHjiBufwz05z/CmOPq8j68X6TcrArjT/58NwfCsMatzIs9J74iw85umIgtBCh3/jUvDKIqY4y8cpoBPdnXDGGApAJWCWm7sei+Pd22cGz7J8pieSxvbI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by LV3PR12MB9330.namprd12.prod.outlook.com (2603:10b6:408:217::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Fri, 20 Dec
 2024 18:32:13 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 18:32:13 +0000
Message-ID: <ed9544cf-c4e3-4f67-8f52-aa78e516fe5e@amd.com>
Date: Fri, 20 Dec 2024 12:32:08 -0600
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
X-ClientProxiedBy: SA9P221CA0025.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:806:25::30) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|LV3PR12MB9330:EE_
X-MS-Office365-Filtering-Correlation-Id: 25375a4e-bafb-4ec8-4ab5-08dd21249f19
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?a0xja0lhc0VJeVRseC96Vk1QNkltRDI4OVhUSzkrcVgxUjZRUGozeTI1Y2tZ?=
 =?utf-8?B?Y3BxMmNDWlF0ektjL3ZHT2FNN2F3NCtDN0duc0lLVERXbGxYZ25ucVF5UW8r?=
 =?utf-8?B?dFQyMEF1QzNwQ1dXdWlxcWhTVVdlY2UwbEx5Ylc0Vzk0aWdoaktya2h5c2pN?=
 =?utf-8?B?OTE2OVhvVW5IYmt1ZnhWb0k3U2NhL3hRQmp3emZqUmdNVnRmaHNmSGVQaUlU?=
 =?utf-8?B?WVBuUmpWRDAvbXhmNmQ2U25kbzVMOWZPWU9JV1BTZHF6NFNmaGdTaVZKYXNC?=
 =?utf-8?B?YmFEU3FSckh1eUpycXYzcHRITFdzL0xRd01XQTdUbDNHQ0pvY2dXR2M4VWhj?=
 =?utf-8?B?WkFudmhBZjNFd2pKQjhYN0xxZHREQTBBa1c3RWZTa2MxR1JObHNkczBzUy9l?=
 =?utf-8?B?dzBUclZtcHlvZ1VGODZybGRpRE13cFRzMTg0VlhQb3lSa05GOHBxNllJaWJl?=
 =?utf-8?B?VGhpdkRCVUJQODNhcHZBL0hCMWJBdkQ1RmhUQVVTeGlrMlJXcnFZdWlwdEZn?=
 =?utf-8?B?enlTODRTenpUdURCaHh5bm8wYUpsMW9oa1lUQk9RZjc1Z1Z4SjYzV1QxVmor?=
 =?utf-8?B?b3JWMUpSSHg5eExtbGQ1WWJBTXZrWHJ4WmMvbnltYUxINWlSV1UyN2ZRT3hJ?=
 =?utf-8?B?dTlxMlhtekdsay9JMng0K003dzVSRkFJM1NzdVdydGJDQzZhRlNDc0ZBdVFC?=
 =?utf-8?B?RGNuZW9VRDFnK3ZlQUphWUF4YlVNZW1EUGsxTTNUUW9pU3pDUzFmS0E3Mkxj?=
 =?utf-8?B?c3BGTEFsYkhXYWU4c0thK3BKOGRoR3VuRzBicTRMZlE4alNNUmZMdUpLVXBo?=
 =?utf-8?B?cTJwSG5CNlNKUERVUVh3c1FvNTVONTdlV2RKNVZ1TEdLVTNlS3VCMFpoSUFH?=
 =?utf-8?B?d0p6ekJJVDBBN0Q4bitjRnBEOWlBNmV2THpyTnZ5cm5HSXIvVGZ2L1BDbnF3?=
 =?utf-8?B?YXRJaE91TnM0M3FBZ1ptVHlJdGVKZHJxdWhwbE9zbW5ZQWtGZEZFVURCTTVZ?=
 =?utf-8?B?VzUwM0tsTHNTUmRXVlZxSlJKNFZhRHA1bDVQN0hWZDhYME9WR2dOWE9LUk9x?=
 =?utf-8?B?c1BraEk0bUEwU3FSSWlkc2J0WEZxcE0wVGlBWnBVcHo5Q3c1ME1sZS9jVWQ2?=
 =?utf-8?B?TWl2OW5uZk15Nm1VcG5NbzZPT1JOZkVVT0crbkc3cHp3Rk1LYWg0Nlc1R09O?=
 =?utf-8?B?ZHc4ZS9EUXhJMUpGKzJTQW9SRlZGT3BBUGxrak9Mb0tVWERIaG5iVHFLb1Nk?=
 =?utf-8?B?UjArY3E1MzYvbTR2Y2lTU0xaNkxQVDB3WklMUUlLWkIzUVJjR0NXM1Q0cnIx?=
 =?utf-8?B?VUhmS1o4c2Rqdkx5ZGV4T1F5UVc5bENJbHhlRUhLeDRCTngzNGRLTTMxakFr?=
 =?utf-8?B?aHlpN3FMYlJsYVdoRnRXYzBWeHNnMzV1ckc0RzJiRkZFTnFiNCtyQ2lucEtu?=
 =?utf-8?B?SE5NNlZHaEQ5Zmg1eVdZN0pxOVo2ZzF0MXVmdzdhRmtLUk1OdUgzZURHZ3BM?=
 =?utf-8?B?U3Vqb0lORG5RVE5MZ1ZNZURIREw5U2w3WFkxVUxJd1FZQVV0UmVqUnhXZkhy?=
 =?utf-8?B?S1U1Z1Y2SllpK2t2VzFuV0dGUHBPdEdES0d3aGdJS3Bod0FvSFp0N0Q1WGZF?=
 =?utf-8?B?V3duMklBTTh2c1VTVzNReXVZM1ZRWFlNRUM3blJucUlqMGRYRzdVamdYZDls?=
 =?utf-8?B?aXFmNnJJT0s5bXdwUzJqbEdnMWFtdTRTRDhMVmpwalE3VFJyTThraHhvMGFm?=
 =?utf-8?B?Uk9hczczSTNPNThYcEorTnVaU1ZkamsrVnhJdjllc0tKa0Vib2Rud0NhRGRM?=
 =?utf-8?B?TG1JRnFFYk9yVG1uNmQ1b2hBS3ZQdHFMOEswR2plM0Y2MW9lQTV3OENjZm96?=
 =?utf-8?Q?NKCq6JE0DmNvz?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Y0kxTnZjdmorbjJTbXRXekhwdDRBbUxKOEdHMmpLQUtYOUVpaHNxYW5CTm9P?=
 =?utf-8?B?NFp6VFQvQWJCOTBSMGtSbDZFU1d3azdFenNyaXZGUW1UZ3EzR3pWQm9wcENC?=
 =?utf-8?B?cTY0UkQ2VENJQWlBUVBkWTA4UU5rQ1ZhOVEvMWcyNFFkU3RHem83VHF4M3pS?=
 =?utf-8?B?Y243TDc1YlVpM2NSQUJtRVhhT0Z5MWM1dDkveUZpVFZhNUtVaHhQRGMzRUkv?=
 =?utf-8?B?STdBMVA0RWhSUGlCRE5iclZ3elNobStoN3MzVVR0c0lNcFM4cnd1SnJDWnFa?=
 =?utf-8?B?S1c0R2ZyUUY2N2lZN0tJalFjVDJtcnlWZ2ZBYjY1VmNUR2ltNDE4OEFWNG1W?=
 =?utf-8?B?cmZBTHpGSnVsT3ArUHBKV2tMZUJaRlpweGxRQkQ4amJvd0xHa1dLbmkzN1lN?=
 =?utf-8?B?c05tQkFyZTZsSkFZdG0rVkhSV1VzclY0QlNRMVBrZ1pyNVdCTHJ3QnNDajZy?=
 =?utf-8?B?RjlKUk1Ba3ovWE9NSU5IWHJFLzRZd080SHhtWnl6QWNIWGl5WUJLZ2lHVVlG?=
 =?utf-8?B?SE1oTWZiWXFib2RUQ1JpdjVhZlVNMXNIanFuSlA0Mnd5dVptVWU5SndNRVFo?=
 =?utf-8?B?MEd0NzR6YTNXMU0wOWdQbFNOOUZwVk1CUEhjVFBDelpOT2xRdVlBblB4aUJm?=
 =?utf-8?B?SU9LYUw5RFpnRjR0TUFJa3ZRYjFXbVUrUk1ZM29ReUE3UmNFMTRpT0dEeTFo?=
 =?utf-8?B?dGZ0VWtZUkZqZWtaL3BpQXZJNlVtNTlreGZxMWdIMFlOMGEvSTZjMVdjN0lt?=
 =?utf-8?B?RmNwN3ZaQ05sZVhGNkF5RTR4ekluVEd0dkVMMVNZZXorK1RsNTAwdGpUdElZ?=
 =?utf-8?B?TkVaTXNQaDV6V1llRnY5bkxWb2U4TVRLaTFWNS91WSsvWGErSDhRek1aMHAz?=
 =?utf-8?B?VHJucVJBMzgydDRBRHI0K0RHUmExMEhDK1gvaWNFTGVlVUszVGVEMVdtWDZs?=
 =?utf-8?B?dmc3cHN2UGNnTWJwV1Y5NFQ2eDN6bHNSLzlBWTRWV3BqckFPc3g2ZnFpaTdH?=
 =?utf-8?B?ZlRDTkxVdlZFUUpCdUtpWmZSOHhNdFMwVEFoUVJsdXMvUnh5T1d1WXVPVlh0?=
 =?utf-8?B?SEdvMzdvVDdKZzZ1S2t3bG54LzBwR1dNdzJQVVo2MDBBRCtidVlLMFVEOERF?=
 =?utf-8?B?YjBDQ0I5VHAxNi9LZ0hTdGlkM2VOSXozNHVyT094K3FnR09QdUJwZDF5cFFF?=
 =?utf-8?B?YSsyUkVSNXdDZDg5cmhBdHo1ejBucVRPdllEQW5TSnFUb0R0eFVoSExVNkdP?=
 =?utf-8?B?UmpFMlk0dlZGOTZKdnNCQi9vaTR1R0cycXZRaDAwSGhRYWtFdW9qNEJDTkll?=
 =?utf-8?B?dk1nK3FIclRRT2ZhOGF2QUYxN01ISjNUUzZBalVzZVlQNmhjdyt3UzlDd3hX?=
 =?utf-8?B?bkFwQ0UzNVdjQ1BVdmsyWk9XQlZXLytRSkhiV3VWdGJIdnl1dmE4cGJya1p0?=
 =?utf-8?B?c2ZlQ0tqR3p4czFDSWd1OU5LcWtDYmdaSGhyVVJDVTgyOWhmenVscXloZU1D?=
 =?utf-8?B?YlpsL0Y4NVUyOGRNajNhOFdGSkJnTit1dEI2MjBPUnhyMmo2M0pLcEcyRlJF?=
 =?utf-8?B?SDl3UnNLT1c0SjZXQmZVZjcxT1V5RDlSVEsxRVlITG93cCtBRHRVOU1iQ1FQ?=
 =?utf-8?B?QVk1OVdLVisrbVpHekwrSmE3Wmc1ZmxlNUo4SEpteHQ5bkVpVGVRQlRPKzhB?=
 =?utf-8?B?SzJDa2JjU25UOFdGa0txNkZTdy85d29UTmhiaDVlNVdVRitCREhXc2Ruc1Nw?=
 =?utf-8?B?aE05Uk5WbkwzYmQrY09EK3RJTnJoOHR5MWhKdkh6L2xKdmZCYmJvaUxmam5N?=
 =?utf-8?B?MUlIQXJVdDFlc01lTkFQSFY1ZWdEUC9yMEYyUmxmbFBWNDArcGZlakpUcE96?=
 =?utf-8?B?MnZacW9zaFZDT0hDbk51Z1dGVWJlcjZMVmFYMmxnMGo1Qms0Uk1OelQ2L3Nm?=
 =?utf-8?B?dW9uSEhlWEYyblcrZWcwemRlN2pyTklqVys5SFZ5WjZ3VlJnYXEwTmM0U2NH?=
 =?utf-8?B?NGpWVCtWQnpIVVBNRTJkc3M2NFJidjVxS054RHo4RjUzWXpwaVV6ZHVhb0hw?=
 =?utf-8?B?VU80dEFScTRFSXFSN1YzU3ZZcEtFeXhzQ3JjUlM1c0ZqNG83bHBRWlRpNEl1?=
 =?utf-8?Q?UhYIgmmJ5aNNJzhZCJhOCFdNC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 25375a4e-bafb-4ec8-4ab5-08dd21249f19
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 18:32:12.9797
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bsS7okRZpvo/0s3fDZYwsyqraElXXx8ZyUgnvreLn/x9GF/Gn+1tMa7p5SZlbvve
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9330

Hi Reinette,

On 12/19/2024 4:50 PM, Reinette Chatre wrote:
> (andipan.das@amd.com -> sandipan.das@amd.com to stop sending undeliverable emails)
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

Yes. It needs to be enabled.

The number of monitoring counters available for assignment in each
domain when mbm_cntr_assign mode is enabled on the system.

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

