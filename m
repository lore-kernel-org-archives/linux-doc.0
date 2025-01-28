Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2076.outbound.protection.outlook.com [40.107.220.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB224290F;
	Tue, 28 Jan 2025 05:27:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738042037; cv=fail; b=sb0+2tphz7+E/b5A1WPbuN6z4IvRVpccgs8+9KjY20TN/DU5hNayTH2LUaLnJJ24WnAZ24ls93qk8YyEqL12jx/j44ot0zMi/UVvUu986TY1zntUgpi2maNPNVPlNWEIYW/5VIDUCdxwq3mapbpc52nVHkNmERYnLt1NxTE0Ox8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738042037; c=relaxed/simple;
	bh=kU5/Ad7Ggi4r5Q5BrnuPQIvdLnQd//Pdsir9aNfUyNM=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=dGKK4vP7F0bZwesVN/v6kDkFo0P2i0W1slECkqgz2Q5wMnzZzVXdGNTTAZBOxCi7x6ghCaXefKfLpkUGaXzMqi/Xj1Y/vMVciusu9/y+IOf2Ch4ckaEfmL6xIi9rnZnuZscwXCcWA+BENUKyzHih4KKyUjgXlwh84pRJBV1RUs8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=b6e4C6Fu; arc=fail smtp.client-ip=40.107.220.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="b6e4C6Fu"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r4BE3DHlvXhGtVw9su0MXWn8A+j2lsc9wt+KIEFWJ8wZfMYR2s9cNANIIwJF0euhTcNUQkQ2IVjVmKH99Wosj9q2+OqiWagJHtvQTh4kUwumRUzwxMOmJnHB9F17qMQr/tQFZOmRU6oq3x7fah2yXMhqEonzjPMVzTp3VurjdbZtcMTXwrqnphrT5A4VYOouxvEVPy4L9nnspzCUY/p5+AbhpSG4POR6W03CFUAd6PFTp5aXFIibDM+z1mQYbVmqqkLKngiEkQCQfJ6zaeVW7+I6Kuos9YK9Y8ju3AoRdozi9xlhFaJT1P8q9MwOZgUxL9VmUYcxfzSV2az6SV5lyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SgEygM/aC4Fi85fnNSIDQ0OGuFhfSML20bR7r1HV7nc=;
 b=bbo3u3Q9HlcSPm6qXCd8M5w1AQWwCsWBIT1sOc1YWnjwtxh7EummF6xlCM3mBlBZPPhbks0Mq41wS4XX+LAl4p0g3HfKAFe0Pyd3tyqM7+u2twCIA1nxjyN9F9Fsbxr4GGwbuvvPPjbYNQIsjowfpgCJS3l7SqJqOMATeHZ67oe6Cz+HSFe5SWZQlkH24afLOe7HAKG3/ucQeJRXwmlvCfw0bDv3Y/MTQNhgZQxfXPlHE8f80qMnyyMS8yK6UFDMFHr//IrwQGU6Kkv/dF4VQ131rVt1tIzgrJP7PoYEmQVwcFKv6l74LoQUoX0EAWZ3ZpqdG3jRf067mJAt3QcUcw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SgEygM/aC4Fi85fnNSIDQ0OGuFhfSML20bR7r1HV7nc=;
 b=b6e4C6Fu91icm6/FlQZywi0+eHinFPhcUk4QgfoXmXolMnrGd+54KhnvF+TZm8VsR7gj/hN1abRHAeQDYEtOlmDDOR/YXjBj0IWadI7SF/qEsl18yMvfZbgSe0jX6F9NFBMxo9K0s5dCwpuEZRXjAPTXWZw4pH2Tr0exzaF+jp8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from CH2PR12MB4262.namprd12.prod.outlook.com (2603:10b6:610:af::8)
 by DS7PR12MB5959.namprd12.prod.outlook.com (2603:10b6:8:7e::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 05:27:12 +0000
Received: from CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870]) by CH2PR12MB4262.namprd12.prod.outlook.com
 ([fe80::3bdb:bf3d:8bde:7870%5]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 05:27:12 +0000
Message-ID: <c5afb05e-f5c0-4b23-93d8-747b82200230@amd.com>
Date: Tue, 28 Jan 2025 10:56:58 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 00/17] reimplement per-vma lock as a refcount
To: Suren Baghdasaryan <surenb@google.com>, akpm@linux-foundation.org
Cc: peterz@infradead.org, willy@infradead.org, liam.howlett@oracle.com,
 lorenzo.stoakes@oracle.com, david.laight.linux@gmail.com, mhocko@suse.com,
 vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com,
 oliver.sang@intel.com, mgorman@techsingularity.net, david@redhat.com,
 peterx@redhat.com, oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org,
 brauner@kernel.org, dhowells@redhat.com, hdanton@sina.com, hughd@google.com,
 lokeshgidra@google.com, minchan@google.com, jannh@google.com,
 shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com,
 klarasmodin@gmail.com, richard.weiyang@gmail.com, corbet@lwn.net,
 linux-doc@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 kernel-team@android.com
References: <20250111042604.3230628-1-surenb@google.com>
Content-Language: en-US
From: Shivank Garg <shivankg@amd.com>
In-Reply-To: <20250111042604.3230628-1-surenb@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0053.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:22::28) To CH2PR12MB4262.namprd12.prod.outlook.com
 (2603:10b6:610:af::8)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB4262:EE_|DS7PR12MB5959:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ea2bc1-6b04-443e-7451-08dd3f5c6a7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?K01meEFWeXFqa2N0N2FYT2M0VWxTVFM4Ky93a0ZQQm1kWUdqNk9MT0pUWE5C?=
 =?utf-8?B?WWluczBZdlhIbkRKRU0veWI5YkRWMTZrZkV4cS9sM3dLTndxcU1qVTJMcmU3?=
 =?utf-8?B?SkJIcnB6OHJhekZLbngxdXk4WW5KZzhFYkhhNHRBenpDdEg4TVQ2ZTd5ZjQ3?=
 =?utf-8?B?NWtTQUExdC9uUE0wVUlJZGNPQjRWQkhSanMyZ0ZEb21GWUJRK1d0MFdtaER0?=
 =?utf-8?B?NEtoU29naEExaitzN3U3ck4vMzA5YWZnOWlkMHR5SkFzSFV5SGFHOUtrd3hY?=
 =?utf-8?B?OWF0ZUU4citaM2ZmTk85VnhOaEJxdXF0TGZ2d2tFZEkzQk11WTM2L2oyMmZK?=
 =?utf-8?B?NVNleHlLdFZ3SDBRSE93M3A0YmxTbDh0b05LYnBETm4ySzI5S21MK2Y5bzNi?=
 =?utf-8?B?R01CdWNFQmxTUTRjRlFiQm1Ncnh1eFlIVzRSajUvR3ZKOGNZbmdGR2pqWTh0?=
 =?utf-8?B?aC9FZzR5aytwSUgvSWNXMnkrZzZZTmpITDd5MG9Ocm8yNHI3UVVPemFlRzJO?=
 =?utf-8?B?ZnJNMFE4Qk9sb1lRYUlNbmhLdWkzeHRPbVVhL0RSZytna1A1aG1LMm5LZ01E?=
 =?utf-8?B?Yk5uWmFRTDRhTFRmSjBhUDBldEtRWFlTOXBoQmF1OXFOWDhycFNVTHRmMkNW?=
 =?utf-8?B?SGlpcWlvTFVzUEJWcnc2b0dUTUNmMURNVGxxVFRvcHRvTHc4Zk5XVW8wWmVF?=
 =?utf-8?B?aG90cVA1UHVDdnFnaEkrZXF6Q0c2UFZITW1OYis1SU1RU1JlVWN1OUpOL08x?=
 =?utf-8?B?UFpTQzNJRSt2b0dyNXdUMzk2Z0pQN1hsaFFQWVdhVXJYU3VvOGFUT2g5M3Nz?=
 =?utf-8?B?VXlaUUdWbVdhVTV4RTFjMm9QUEdmWVFib0c4a0lWbW1sSTN3bm0wN0dZdXg3?=
 =?utf-8?B?MHVBVjB0V2J3YkdrLy9PVXRObFgwK1lVdC9wRnM3WVJKUzZuY2lUT0lJR3hG?=
 =?utf-8?B?NTRIT3Zud1dqbFVsNDFWdHVXZEt5R0k1VGdnMXlEZ1crU0dZanVCa2pkTjdS?=
 =?utf-8?B?MnZ2bkZ1WVRQQ2MvTFVjMVNGSkliQWlvUDNYaXRMTWM2czh4UnJwM0k3ZFJD?=
 =?utf-8?B?eWpvQ0w3YW5OaUpPdUFwcU5kdEo2YmNNS1pLcnB1dlFvUmZReHlrbDdHdmdG?=
 =?utf-8?B?TTdnRVUvMzF0eExhZFplb1dIZCtUalhoZkVDK1BRUkpKNVdEdHhVa1UvRHFu?=
 =?utf-8?B?RFNzQ05aeXdkTWFzRG43MS9SK1ZpUExPQ29Xc0pzQnFndkRxMSszRDl4TDNt?=
 =?utf-8?B?NkRFYytVOWlYODNCQjV6R1Y3c1ZUSjhGVEZaTi9oMXJTUmxYSW5rR3MxM1pK?=
 =?utf-8?B?Vk1XZHVtNnVON2Z1Tm1XZXJDYm9sazdObVhDZ3B0YkxBR0QzUVBEeWQ2NDBW?=
 =?utf-8?B?N2dweWh4UUs5L2dJVkhGL3pKcE0vVi84UzdrZGFKcDFvcFhUZE9YWmR6VnZU?=
 =?utf-8?B?eDczQllmcEFxV1Jzb3QvMTZnMFEycnlNWGtGc1RWQlB4ZCsyUlBIamFQU1Ey?=
 =?utf-8?B?MmVhVldadjA2anYreWdXc3RDVGM0eDNZTE9EeHZRYUt2Z0J1VU9TcWJuSWN0?=
 =?utf-8?B?Z2tVZEQ3QnpULzhHMURXS0JhVGJtRk1LYlNqZDhTN0s0QWh0cmFCNFhFNm5G?=
 =?utf-8?B?bERaQVN6SGRseWlSMXFleWFsK1gyMW1SdVRCalU0R0V4RTdRNExPcS9XOTg2?=
 =?utf-8?B?bG9BdFc3QnA4dk5jaWtxV0h1QTdvQVdVOTd1NVhPWVpqSEFGUjF4T3R3YlIy?=
 =?utf-8?B?VXV1andrbkc1OXVTK0FldG90Rm9SNExaTkEwZ01sc0IwYW9pSXNWUHQ1NkFX?=
 =?utf-8?B?cFk0U29pb2E3K3RabjMwdz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4262.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R3IrTWdhWC9pR05GUDB2RTRhU29aSW5oTU5DYy9CejRHT0cwck10L2tIVnBa?=
 =?utf-8?B?YXVBYlRtTGVQV1BuOU9RUnpGV1FJb1BrWWxQdEpoRzkvcTlVaytYcHVESHlu?=
 =?utf-8?B?Q0NZQUp4MlVtZncwbkdDTzMzUk5ZbEx4NE1wUHRPRVk3UlFRcUIzL1FGMHlh?=
 =?utf-8?B?MEtjKzNBZHJsbmprRmRnQU04aHp2bGEzUFRMeXFxeUhzS2dLbzc1cWdHcTd3?=
 =?utf-8?B?YjBJaW1HUExhSkd0YVBKMmZpSWNkWmtrUlIwYW9YUXJwUWVqSkRUQ0l0c3JE?=
 =?utf-8?B?ei9lL0ZXYXJnbjhoL20zQjB6RE5Gb0dMR0RTeHI5SnprK05tY0dRUU5iZHVW?=
 =?utf-8?B?RGswUjVkMTY4NXhjTHJ4Vm1HeGp0SUMrQ1QxTkF3U05QenVSMnJ3OWdwOTlT?=
 =?utf-8?B?NjltcHJ6WnRWSGNFaGpxVHpUZXRlT2ovWWh1am93VXMrTjdPbng0QkVKNEth?=
 =?utf-8?B?MEw4RUZBa2JyTEtaTlBOMVZlMk0vcC9tWDVsNXdVSklWSTVFaWJVTzA3c1My?=
 =?utf-8?B?Ym9RMlhuRlRHQVVIMDNndEdUbnh3RUNhZnJLVDUrZktpYnh6Z2VUNzY1Qlhu?=
 =?utf-8?B?dzY4SjZMNVJzTnJCZkVKaFd0NXVyckpTSGhhLyttV0J1aDdOVTZDbVkxVi8v?=
 =?utf-8?B?S3o3cWVjeG9vcjFKNjhhSlhNUE1hVHpWeUNYQXpnZmorZ1VrdlU4cmc1Nm9p?=
 =?utf-8?B?VmhMZ3E3bVFsRWgzRHhrSjJOdzNCVjA1Mm45QldMMlNMZUJNSmpQWUw0QmxM?=
 =?utf-8?B?WHh6RWhJdktLLzB1OUtRcDU1UTk2dDdmL1cvY3RlMVpCcXphRDgrTmx6ZnZ2?=
 =?utf-8?B?UlNiNFZiQTJNQzV5QkplODZjWmtIMWhkMXVhZWUraUZUdmRqWVZYSndJUGQx?=
 =?utf-8?B?Ti8zalM3cEtxZ2Q2MFc2UXNEZWs5TGp5VzhRY0dXdG45am1hc3dYOHdPVjNS?=
 =?utf-8?B?cndPTFlvdHFuZ2VocDlseENRak9Fc2ROY3M1QkxFOGh0dHlLWDZSak4vMkFO?=
 =?utf-8?B?TE0zK2FIQWg2WmJ0ZWF0dUNUUktOUEUxcURiZ0N0SUIrTGh0dTFWc3E2UDhj?=
 =?utf-8?B?SFREYmNnWTkxL0N5NUpmVng0ck82cXZ3N0psWDZOdDFxNTlYamk4b0FGZ29S?=
 =?utf-8?B?SXVIUFhnNGVtOTRvS05Ud0pYRVRSMklPdkNkaE16WjB5RzJyR1JvNmM1Slpr?=
 =?utf-8?B?OHFCcjJjZzRtanFCdzlQMXpQQ0R4T1EyUDNCVlNEZzNOSWo2d29KOERSMU5l?=
 =?utf-8?B?TUlMTVNVUXBZcG95TUo2YXlyam1takQxdDc3ekJsZ2NsQy9jTW1CSStENDBS?=
 =?utf-8?B?eFZtUE9sUkZjb0ZGYVVZaFY0YklhQ2FFMnlsSjA1bjRHU01TZ0RWZ0FZMGJP?=
 =?utf-8?B?SHlYTTV5cndrZTZ0WWl0R2xhOVdkbEVia2J0WGltcUw3THB4ZFFDU0owWkIv?=
 =?utf-8?B?T3pZVTNka0labGlLUWp1TWxMd28xMHpMOWR2eTZYSHdCTW9GRlhOVjJGVHZK?=
 =?utf-8?B?NFVzQ3lhYzNEcUowemMrQ2w5dFRTN1EzeGJDMzk4cjR3WlRrWnRkVFFpc3ND?=
 =?utf-8?B?Wm9ycjJoWjBLeEhrVEpNMzJHUkF4V3JlU09DTUovNU1GRTBPWWc3QVBNSkp3?=
 =?utf-8?B?MFFDYXVMUDZuaC85ZnpZK2dsRlBsYmFuNmhGaDRMVHNqcXZlYXV0ZHNsdHBG?=
 =?utf-8?B?eGlpSjBxbTNhN3JVWnEwa21mVWdaSUlsdmh3bVJIM05NU3RxdW5vSXdzL2xH?=
 =?utf-8?B?SjR6ODZKZ0JucGppOXdhaEtkK2g4VEJYZ1JpSHZma09YUGN3Y3IwRzBrNE1B?=
 =?utf-8?B?QkZKb1kzaEU3WnpGUFE5dS90SG12MktZd1VDOUpQMXIxeFQyWG5BOXhUUUhQ?=
 =?utf-8?B?dHVwZCtXN0p6QmhMVlY2NCtBVnJJSGdzeXRwZXRxdDNPMjNQK1R4a2krVXZF?=
 =?utf-8?B?VVdjM2Y1QnltQUp0aDdpeWFENzdoSmRUc01wdUZEcGsvdVpnamptckZzSWhx?=
 =?utf-8?B?MWsrbDhRTW1Hby9vRTcwa3JsNDJ6S0tvVEZhYmpTVjVkdVdKZndTb1VlcUN4?=
 =?utf-8?B?Umh2RVJVZTBLTzRLQlJjVUdxODc5TDV2VTd4R3hpcktFN2d3UkYrN0FPcHha?=
 =?utf-8?Q?vUMDF4P4X9CSuc1jZbAkSh5UU?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c7ea2bc1-6b04-443e-7451-08dd3f5c6a7c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4262.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 05:27:12.0415
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0E6Le0g4AozaauKw/qx30f3tDAYyltVc6JcbQN7cnfibHxaZ4E12CCwoytgwheZJF869o6JI5fZxGyGB1nHyng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB5959

Hi Suren,

I tested the patch-series on AMD EPYC Zen 5 system
(2-socket, 64-core per socket with SMT Enabled, 4 NUMA nodes)
using mmtests's PFT (config-workload-pft-threads) benchmark on
mm-unstable.

On 1/11/2025 9:55 AM, Suren Baghdasaryan wrote:
> Back when per-vma locks were introduces, vm_lock was moved out of
> vm_area_struct in [1] because of the performance regression caused by
> false cacheline sharing. Recent investigation [2] revealed that the
> regressions is limited to a rather old Broadwell microarchitecture and
> even there it can be mitigated by disabling adjacent cacheline
> prefetching, see [3].
> Splitting single logical structure into multiple ones leads to more
> complicated management, extra pointer dereferences and overall less
> maintainable code. When that split-away part is a lock, it complicates
> things even further. With no performance benefits, there are no reasons
> for this split. Merging the vm_lock back into vm_area_struct also allows
> vm_area_struct to use SLAB_TYPESAFE_BY_RCU later in this patchset.
> This patchset:
> 1. moves vm_lock back into vm_area_struct, aligning it at the cacheline
> boundary and changing the cache to be cacheline-aligned to minimize
> cacheline sharing;
> 2. changes vm_area_struct initialization to mark new vma as detached until
> it is inserted into vma tree;
> 3. replaces vm_lock and vma->detached flag with a reference counter;
> 4. regroups vm_area_struct members to fit them into 3 cachelines;
> 5. changes vm_area_struct cache to SLAB_TYPESAFE_BY_RCU to allow for their
> reuse and to minimize call_rcu() calls.
> 
> Pagefault microbenchmarks show performance improvement:
> Hmean     faults/cpu-1    507926.5547 (   0.00%)   506519.3692 *  -0.28%*
> Hmean     faults/cpu-4    479119.7051 (   0.00%)   481333.6802 *   0.46%*
> Hmean     faults/cpu-7    452880.2961 (   0.00%)   455845.6211 *   0.65%*
> Hmean     faults/cpu-12   347639.1021 (   0.00%)   352004.2254 *   1.26%*
> Hmean     faults/cpu-21   200061.2238 (   0.00%)   229597.0317 *  14.76%*
> Hmean     faults/cpu-30   145251.2001 (   0.00%)   164202.5067 *  13.05%*
> Hmean     faults/cpu-48   106848.4434 (   0.00%)   120641.5504 *  12.91%*
> Hmean     faults/cpu-56    92472.3835 (   0.00%)   103464.7916 *  11.89%*
> Hmean     faults/sec-1    507566.1468 (   0.00%)   506139.0811 *  -0.28%*
> Hmean     faults/sec-4   1880478.2402 (   0.00%)  1886795.6329 *   0.34%*
> Hmean     faults/sec-7   3106394.3438 (   0.00%)  3140550.7485 *   1.10%*
> Hmean     faults/sec-12  4061358.4795 (   0.00%)  4112477.0206 *   1.26%*
> Hmean     faults/sec-21  3988619.1169 (   0.00%)  4577747.1436 *  14.77%*
> Hmean     faults/sec-30  3909839.5449 (   0.00%)  4311052.2787 *  10.26%*
> Hmean     faults/sec-48  4761108.4691 (   0.00%)  5283790.5026 *  10.98%*
> Hmean     faults/sec-56  4885561.4590 (   0.00%)  5415839.4045 *  10.85%*

Results:
                             mm-unstable-vanilla   mm-unstable-v9-pervma-lock
Hmean     faults/cpu-1    2018530.3023 (   0.00%)  2051456.8039 (   1.63%)
Hmean     faults/cpu-4     718869.0234 (   0.00%)   720985.6986 (   0.29%)
Hmean     faults/cpu-7     377965.1187 (   0.00%)   368305.2802 (  -2.56%)
Hmean     faults/cpu-12    215502.5334 (   0.00%)   212764.0061 (  -1.27%)
Hmean     faults/cpu-21    149946.1873 (   0.00%)   150688.2173 (   0.49%)
Hmean     faults/cpu-30    142379.7863 (   0.00%)   143677.5012 (   0.91%)
Hmean     faults/cpu-48    139625.5003 (   0.00%)   156217.1383 *  11.88%*
Hmean     faults/cpu-79    119093.6132 (   0.00%)   140501.1787 *  17.98%*
Hmean     faults/cpu-110   102446.6879 (   0.00%)   114128.7155 (  11.40%)
Hmean     faults/cpu-128    96640.4022 (   0.00%)   109474.8875 (  13.28%)
Hmean     faults/sec-1    2018197.4666 (   0.00%)  2051119.1375 (   1.63%)
Hmean     faults/sec-4    2853494.9619 (   0.00%)  2865639.8350 (   0.43%)
Hmean     faults/sec-7    2631049.4283 (   0.00%)  2564037.1696 (  -2.55%)
Hmean     faults/sec-12   2570378.4204 (   0.00%)  2540353.2525 (  -1.17%)
Hmean     faults/sec-21   3018640.3933 (   0.00%)  3014396.9773 (  -0.14%)
Hmean     faults/sec-30   4150723.9209 (   0.00%)  4167550.4070 (   0.41%)
Hmean     faults/sec-48   6459327.6559 (   0.00%)  7217660.4385 *  11.74%*
Hmean     faults/sec-79   8977397.1421 (   0.00%) 10695351.6214 *  19.14%*
Hmean     faults/sec-110 10590055.2262 (   0.00%) 12309035.9250 (  16.23%)
Hmean     faults/sec-128 11448246.6485 (   0.00%) 13554648.3823 (  18.40%)

Please add my:
Tested-by: Shivank Garg <shivankg@amd.com>

I would be happy to test future versions if needed.

Thanks,
Shivank



> 
> Changes since v8 [4]:
> - Change subject for the cover letter, per Vlastimil Babka
> - Added Reviewed-by and Acked-by, per Vlastimil Babka
> - Added static check for no-limit case in __refcount_add_not_zero_limited,
> per David Laight
> - Fixed vma_refcount_put() to call rwsem_release() unconditionally,
> per Hillf Danton and Vlastimil Babka
> - Use a copy of vma->vm_mm in vma_refcount_put() in case vma is freed from
> under us, per Vlastimil Babka
> - Removed extra rcu_read_lock()/rcu_read_unlock() in vma_end_read(),
> per Vlastimil Babka
> - Changed __vma_enter_locked() parameter to centralize refcount logic,
> per Vlastimil Babka
> - Amended description in vm_lock replacement patch explaining the effects
> of the patch on vm_area_struct size, per Vlastimil Babka
> - Added vm_area_struct member regrouping patch [5] into the series
> - Renamed vma_copy() into vm_area_init_from(), per Liam R. Howlett
> - Added a comment for vm_area_struct to update vm_area_init_from() when
> adding new members, per Vlastimil Babka
> - Updated a comment about unstable src->shared.rb when copying a vma in
> vm_area_init_from(), per Vlastimil Babka
> 
> [1] https://lore.kernel.org/all/20230227173632.3292573-34-surenb@google.com/
> [2] https://lore.kernel.org/all/ZsQyI%2F087V34JoIt@xsang-OptiPlex-9020/
> [3] https://lore.kernel.org/all/CAJuCfpEisU8Lfe96AYJDZ+OM4NoPmnw9bP53cT_kbfP_pR+-2g@mail.gmail.com/
> [4] https://lore.kernel.org/all/20250109023025.2242447-1-surenb@google.com/
> [5] https://lore.kernel.org/all/20241111205506.3404479-5-surenb@google.com/
> 
> Patchset applies over mm-unstable after reverting v8
> (current SHA range: 235b5129cb7b - 9e6b24c58985)
> 
> Suren Baghdasaryan (17):
>   mm: introduce vma_start_read_locked{_nested} helpers
>   mm: move per-vma lock into vm_area_struct
>   mm: mark vma as detached until it's added into vma tree
>   mm: introduce vma_iter_store_attached() to use with attached vmas
>   mm: mark vmas detached upon exit
>   types: move struct rcuwait into types.h
>   mm: allow vma_start_read_locked/vma_start_read_locked_nested to fail
>   mm: move mmap_init_lock() out of the header file
>   mm: uninline the main body of vma_start_write()
>   refcount: introduce __refcount_{add|inc}_not_zero_limited
>   mm: replace vm_lock and detached flag with a reference count
>   mm: move lesser used vma_area_struct members into the last cacheline
>   mm/debug: print vm_refcnt state when dumping the vma
>   mm: remove extra vma_numab_state_init() call
>   mm: prepare lock_vma_under_rcu() for vma reuse possibility
>   mm: make vma cache SLAB_TYPESAFE_BY_RCU
>   docs/mm: document latest changes to vm_lock
> 
>  Documentation/mm/process_addrs.rst |  44 ++++----
>  include/linux/mm.h                 | 156 ++++++++++++++++++++++-------
>  include/linux/mm_types.h           |  75 +++++++-------
>  include/linux/mmap_lock.h          |   6 --
>  include/linux/rcuwait.h            |  13 +--
>  include/linux/refcount.h           |  24 ++++-
>  include/linux/slab.h               |   6 --
>  include/linux/types.h              |  12 +++
>  kernel/fork.c                      | 129 +++++++++++-------------
>  mm/debug.c                         |  12 +++
>  mm/init-mm.c                       |   1 +
>  mm/memory.c                        |  97 ++++++++++++++++--
>  mm/mmap.c                          |   3 +-
>  mm/userfaultfd.c                   |  32 +++---
>  mm/vma.c                           |  23 ++---
>  mm/vma.h                           |  15 ++-
>  tools/testing/vma/linux/atomic.h   |   5 +
>  tools/testing/vma/vma_internal.h   |  93 ++++++++---------
>  18 files changed, 465 insertions(+), 281 deletions(-)
> 

