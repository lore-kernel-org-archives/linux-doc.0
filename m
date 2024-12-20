Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2044.outbound.protection.outlook.com [40.107.223.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD6E321A443;
	Fri, 20 Dec 2024 15:41:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734709298; cv=fail; b=a6b+/Lc3U2KKnk1eJQ7fxRRYkD80rnArfcNPLrptWtWTIA4BiaYeh+3ooCv4Nwix3iK7qzV5a1vsTv++QeGJugDOA/DGEWBVxTMejJMtNyFfXhKp7Q56Ppu0yy0U3+3cl5h5tUwjja3znj/V6hbaZFgnOUzpgk4HwDHBp/03HqM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734709298; c=relaxed/simple;
	bh=KSE+s5AKCbjFniTmSQ8IZ0mQuJtCmmJLm/H6V0yDuJI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=lmL1MhjZLbJSqvzwpChDAGe2JiJB6/oq0gGc6JACtZzX0vRg3fKHMLRqtWecotm/qWnBXVJmRniDcStOg8QT26JR+mDTd68LZA78x5yKTzLtZXdoLyvEFo6pvyY4+1fsJogKT+ncPx4Byna9WKezqWhap7yvF9d2DxTngqVQROw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bglX+Nmd; arc=fail smtp.client-ip=40.107.223.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bglX+Nmd"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pIByymj7RtvOBptTTSh7s/urYRZrRArC/0TbDalf8GKf1HY25VecPrGYlvDKZr66VDvSNbRqgVZZCVzYkpKSYO1l+Zgzu9JOxXzu5S2cyOFWiwKJFFpL/9surRHD5S1YQiqQXgbA/rDe1qSG+Q5nynnWsE7O3e0qaKccnGlt6x+J/hebuq0dmHF5HMmjynwK2Ul1ganNHs9l42sZ17tC13mZ7dhjOz2k8aaOSqeVq4VKR1rwNIe6N4RHT7SnwbBpaoGPJUxvR9wXK9GIOTravjPU1UZGNnFsCdWUsvhsmKQJEPtHVO0umNljM2sIBAE8aZ2qUAPlTv7Tv1QZDDuYQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uhcq3aSFdV6p0ipv2KVNFvtzqUnz6+wDgyER4/c8gKQ=;
 b=mifahqPAKci/OWoJLeNnihPRpIwEQvNNQY3rIv2twIDRhSd0fSELXXEoUnuXr1CgYZgUkEyDxRglJJyQN+gFLiyUx5LcEplJz184A4XmzQpQt2ZDiUYa/qz05MtPoGAGOSCKfQibKlmP1n0iSm5cSrMG91ya3Y2odBxF0J8EIJ5X18nCaNMIUZ8e7hSDJKvlffkRCiTwmlF2tSOQw5YZDAB6N8TUYPti3EVuIv2MXKHqdBQ7NoCPhOpEpowOI5ZHA/T34wq8mKi1TlpCpNlH33ETvHsuXyg6TweNiftdpUMLmhOJ6+d3YCNXLHfb9eI40Se2UMpglnbtgDCAcb+LpQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uhcq3aSFdV6p0ipv2KVNFvtzqUnz6+wDgyER4/c8gKQ=;
 b=bglX+Nmd1SXJuV21k7Pu6KLF7ci/9uPaBho+3omoeC/V37wkFqzoBiYSBM3WKmrYZXWp2hikjE8WCXe12FKw9+y2RiOpiDHbNDBSj8gOAzai5SzWj4huLpbRKnFDH6q53lUO0wLuLSr/LYzTfj6MNJTw0NsW6LbHLSXcwqZJsh0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CYYPR12MB8731.namprd12.prod.outlook.com (2603:10b6:930:ba::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 15:41:34 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:41:33 +0000
Message-ID: <ee8c0576-7609-4f57-97a3-303adcf49faa@amd.com>
Date: Fri, 20 Dec 2024 09:41:29 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/24] x86/resctrl: Introduce interface to display
 number of monitoring counters
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 kai.huang@intel.com, xiaoyao.li@intel.com, seanjc@google.com,
 xin3.li@intel.com, andrew.cooper3@citrix.com, ebiggers@google.com,
 mario.limonciello@amd.com, james.morse@arm.com, tan.shaopeng@fujitsu.com,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 maciej.wieczor-retman@intel.com, eranian@google.com
References: <cover.1734034524.git.babu.moger@amd.com>
 <5aead3f35b7799239b8f9952675b4435f6e7644a.1734034524.git.babu.moger@amd.com>
 <a1672556-5771-493c-930f-749d721b73df@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <a1672556-5771-493c-930f-749d721b73df@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0167.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c3::15) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CYYPR12MB8731:EE_
X-MS-Office365-Filtering-Correlation-Id: b2de6e98-e176-4feb-ae55-08dd210cc812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|7416014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?d28rRXNFbTd6bzdnczJwTUtYVUlmTUZXZ3Nua3ZLeVF4V21sc1dtM0NEQkY0?=
 =?utf-8?B?KzJKcmhtNy9XNEh6RHRySHN3UGxTQjZybWQvdDg1S0xhSnN3TE4rSlVsa0JJ?=
 =?utf-8?B?SmRRT2ZUS0xCd05LWjgxT201VVdQanBmcmVNM2RSU29OL3Z6V1cyWSs0OHFs?=
 =?utf-8?B?aVhpZHphSStwdGM2TjA3cXRlNWdHR2ZJNTdwSHQxQWR6MFNuVWJTZVZwVHpJ?=
 =?utf-8?B?enBaS0w5WGVqSk9DSG85d2Z5Zm1VNW1kUVZORm5JeTM0L2trcGZjRkhhM2Ru?=
 =?utf-8?B?dWo1MHdsQnFKVFRNMGFQRnBDR0M3cHRuclhlYUZacFhaKzBsdmx3ditNNGtB?=
 =?utf-8?B?WnhnWXlPRjhJWXovK3gvVVJNUXB0bkpLYmtZN1pld3ZoQUZoeU1qc1JoelFQ?=
 =?utf-8?B?dGVoNmtIWE1od1RUTVJjK1JqU3BWVDJXc250dXRpYWlYb3ZLaDIwb1c1NHdu?=
 =?utf-8?B?VjN3RitjWEZhM1NxbGV5Wnl6UDJsWDBKQVlpNmdXd3JKck1XTFFHVkwyVm0w?=
 =?utf-8?B?OUlva3VwOXh0NzVjNU9Tb25tRXJTTTBrRVJQbGlnZzBjN014dU5mQUYzUlFz?=
 =?utf-8?B?MDBoMGUvUmoxaGN6anZ6UjRWMTFTaVpENGtpZkRjRVRUbXVPcndHK2FqQ2dG?=
 =?utf-8?B?V0FxaTdGVjdYRUNqK0lPSWltdnpMNnNOOHRzZ0l1K1gwbys3NVpDMmE3NjdI?=
 =?utf-8?B?ZUdMUHlYKy9DVlhaSGlqS0l4MUo4VTBpY0FmSVJaM1ZERHZhRUowUDQ5WmFm?=
 =?utf-8?B?VlErWnhXbkdEYWNzbk1jRTVGcUlhWjhPUzRqTllQQ1RFUGIrQkszQUFLbVlW?=
 =?utf-8?B?T2QyRkpJOXdNZ20wNEpkL0dMSmJUTGduVmZYVEVmUVEvWVFCcUladnVUcjRt?=
 =?utf-8?B?YlBkQlBrdklpcnY2OVErc1VYSllwSit1TnFQc0xRamRyRS9RV0ZKRWFEdUh5?=
 =?utf-8?B?MVhPRUhDUk5aYzQzSmhKRU9pT3gwdFlvdlQwQlZNa3dqZFdzc1Z1SUd0blNO?=
 =?utf-8?B?ZnIvbFg0OStPMkxVRjVCRERxa2xDWFVqR1V0VHpNYTU4aG9yOWRZRkRTSVlV?=
 =?utf-8?B?UnZBWWcxbDQ4d2Q5S0ovLzFqdG9VQTFnb05wbndmSkUraSs3NjZVbm9kS1lt?=
 =?utf-8?B?ckRRRW9SQW9tUkFHTjNrdjU5Mmo0S1VRekZSM3R3enZvSzJZVG5PVVp0TEtK?=
 =?utf-8?B?SU8vVDF1blNuejR1SytDbFkzU0pHREVSV1I5R1cyeUN2cGhXZ1EySmhIMlpP?=
 =?utf-8?B?T2xibVJRODgvZjBjRDhJS3NYYjlVdGZkTzNyRmNzKzJ2cWR4Zk9IQWdIa1ht?=
 =?utf-8?B?RGp0ckRNWG1KWXFUR1pHYW8yVklvOHJDNmFMSHZjaVRoTExuVEZNL2oxK1hW?=
 =?utf-8?B?czZrSUZPT1ozZDRjS2d5QnZuWDVpT0t0MmNGZS92WTJTWTJxYUk3cG9FRUJP?=
 =?utf-8?B?SmJrRVUvU1E2QmI0eUl3dFZLaEJCcTNESWsrL1ZCSjRRU3BWZlpUWXh2c04x?=
 =?utf-8?B?Y2RwbkduTFhkZk1VS25IRmcrbTVQN0x6MFpKUHFzMEd1aENYb3BQYmd5dC92?=
 =?utf-8?B?ZUtGVDVEcU9kOUNRVmk2LzV0a2ErMkJSWjdzb0RhNy9EQlIybkI5UUVIZEVH?=
 =?utf-8?B?RzNwUG8zWHIzK3puUXIwakRHUmQvOVVSakdYQTVpMnVRUFNpRGxZbk9jRWt4?=
 =?utf-8?B?U1ptRVp4VlpnSE5yczFFTGQxaHBTTldKQUg5SkZRYXJqeVg1NlVOOURTT2M0?=
 =?utf-8?B?cFk2L3dVOXBUUnd6ajlzTVVMQnFtVVVTdXU5dVYxRjh0dldrYnB5UWJUWTVi?=
 =?utf-8?B?OURDeW4wL1VkNDZpUVhUbUlxeDR6U1FFbTVPaS83eEliK1EyajVsSmtjK0dO?=
 =?utf-8?Q?kAn9SPtuK88SJ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(7416014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YXRySzNGSWZWM094ZXlQVWsrSUl6ZVF0dVBHYkVvWmtVeC9hNVFuaHNUbWVk?=
 =?utf-8?B?WDFmL1J0eTZNbVRqYnBjUzllM1gxbDh4RW1wTWpLYldmblVWd2xwOW1wZlFW?=
 =?utf-8?B?V095ZWRJdFBHdnpBNzJvRVRadkRzRHhiU2NVaWVmQ2V5NFhmRm5UU3k3MHdW?=
 =?utf-8?B?Mk5ReE1hWURSYXd1aGtWMlNZYlc0MHU5M1l1c3U3bXk4RGhOMFA0L3BxUXlV?=
 =?utf-8?B?WDJLN2RZODdzTnNSNVpmMEs1c3QzN3VlUFhUUTRZVy9QSGN0VlVWaDVkNjV5?=
 =?utf-8?B?MEZneUltWExFMHp5QjA3SGx5Vkk0eWRvbjBCYWo3NFZEREJ3ZEpxS2kwMFRM?=
 =?utf-8?B?MEhPaXlHSEQyRDRZajBLMS9SWFdVMXFwWlRiWjJwTW1MK3hubUcxSzBVZWp2?=
 =?utf-8?B?QWVHQnExNDdGcTlqQnJMaFYyMEJsU2hPR0gwTWNZMm5aa0VtUm84UFNLSVdo?=
 =?utf-8?B?dUlIcTFMK1NVSnJRYjBuQ1dvVGlHZFY3ZFpjZXZjNXVrRDhaaFVvdlNNWE44?=
 =?utf-8?B?cURuWWJCcGEvTEFYZWdSNlczS2o4S2VCSjlGeWhhd28yZTRuQnkrcjFQQ3JL?=
 =?utf-8?B?M0FQcEdXNk5Zc3BLVjM2elYxNWloVE9vc3cxSENJU3hlS2RoQmx6dFIvS0w0?=
 =?utf-8?B?U1VQL1dlK25WNHgxMmdsbU14SURpTVlKQzNGeVdTaFF6dnpZTU91ZVc0c0d0?=
 =?utf-8?B?MGRNZmM5dlNOb3dWZUsvS3Q1SlFiVHo5WjR4SGROWGtlblZiWU96ZU1UZkU3?=
 =?utf-8?B?VUwrRWJjSkVDa0liL01SenZoWnRJa3FpZE1VZUoyRllkMStTMlFLSU54d0VT?=
 =?utf-8?B?c0p4OGdkbDZTdEl6Qi9IWWZwNFRWWkpjTGxXbTcvK1hwS2F2OWtkV3FiL2w0?=
 =?utf-8?B?emNSZ081cG9BTXFuNzNFM1RHT2pjKzFxVDZRUitzekVMTmdMZ2lTeVJGUzJ1?=
 =?utf-8?B?OGRTZVN3WUYwU2RIUFRHMVUyeTJ1UW5QbXh4Z092Y0poOXJMb01SUVlRNy9k?=
 =?utf-8?B?ZFFNVmp3QnBDSkVJQjBaRkNzOUFIQzlnRUVvS00vVkhnOWRrRTJva01rN0FC?=
 =?utf-8?B?Z0JlSE1LbnZkQlh3TEJCaGg1Q3VpajU1ditQM1FOdWt5L1luS2k2NndET0lK?=
 =?utf-8?B?Mmp6bnhvcndyOVVBL0ExWWVLSTMrZXFNaG42WFZ3c3ExUVpjajdPSFZBMTdK?=
 =?utf-8?B?amdwdnpoTmt4aTlaTGtkcEM2blo4NWx6WFNFZHp4ZlVKNUtmNHlHT0JjNHBo?=
 =?utf-8?B?RkJDRjVadVkyU0Z2Yk5uUmFobUlhZTA5TWNhcG5qZjNOR1REVng5M2lYbEZ4?=
 =?utf-8?B?aXBydndDemxKMk5LSWZnbWhwaEtvTUQ0akVpYjFSTWVKV1VWaVJxeEF3T2N5?=
 =?utf-8?B?ak9UaXdlZ2VQdXRpZWMzY3RoL2EzbDBLNnFMcVlSeG9GeFF6SGFGaWY4N1ox?=
 =?utf-8?B?YU4xWC9SWTYwZC9Zd1BTVzhnSHRaVnZ0NGZhZU1xaTlzOThSMEZuTFJPOWZN?=
 =?utf-8?B?M0hVUjA3dGtPYjdvOHpxM00zZUNPcnBVbUtPT05ZL1JLUjFxaHNqWHpYSFhy?=
 =?utf-8?B?QnZEREF6d0FvSUV5YlljMkUrY0R2QmFhZWpXSko1YnZOTlM5UGdaWS9qRitF?=
 =?utf-8?B?WEdBaTBEZnFQK1JEaUI5U3U5eEdpaFE0MW11dytrMHpGL1VMeTNvTWs3eVpN?=
 =?utf-8?B?VEI3cGdoTUJheHZEd1poZjRKL1dxNEJNKzAzVUpUdjJ1aURhcnZ1MTBUTU5L?=
 =?utf-8?B?cTFQN3kyV1VwaTVEb2pGSU9WS0xzT0lWWkRXQkZvSWtYZ1hQM0lBeTJxWHZm?=
 =?utf-8?B?SXR4RS9OOThkODJzd0FnRlppOXNFMy9BaU0zUy91bG5MNGNTMUw2MjZ1d3lh?=
 =?utf-8?B?cTJCa3pMS3dKUUpSa0NxUzlPcG5SbnU2YWM3SFFoZWxEaGIwZkM4Q01DZmF2?=
 =?utf-8?B?Tm1hOWM3M1k5cS80WVhNRG9XbGFnU0tla0Y3RVJWdlJuWWlxWmMxeTBpZ2hE?=
 =?utf-8?B?cnNNb3BQRkdYdmhHcDdYWGJYZmRvVjR4cGV6M29qK1MzSm8xeERpdit3eGJN?=
 =?utf-8?B?WnMyc2lKZ0ZIUndFSWVHeE9zRWwvbU5NbW5tbmdkaGdISE1uNVg0VGc4cDY4?=
 =?utf-8?Q?oXf8=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2de6e98-e176-4feb-ae55-08dd210cc812
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:41:33.8597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /VAXQeckMBGu420s4hpDA7+f3JWLJqUm49vvgjoBVMsTKE0RVkR8raYMkTMgxSrt
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR12MB8731

Hi Reinette,

On 12/19/2024 4:03 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides an option to the user to assign a
>> counter to an RMID, event pair and monitor the bandwidth as long as
>> the counter is assigned. Number of assignments depend on number of
>> monitoring counters available.
>>
>> Provide the interface to display the number of monitoring counters
>> supported. The interface file 'num_mbm_cntrs' is available when an
>> architecture supports mbm_cntr_assign mode.
> 
> How about: "The resctrl file 'num_mbm_cntrs' is visible to user space
> when the system supports mbm_cntr_assign mode." ?

Sure.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v10: No changes.
>>
>> v9: Updated user document based on the comments.
>>      Will add a new file available_mbm_cntrs later in the series.
>>
>> v8: Commit message update and documentation update.
>>
>> v7: Minor commit log text changes.
>>
>> v6: No changes.
>>
>> v5: Changed the display name from num_cntrs to num_mbm_cntrs.
>>      Updated the commit message.
>>      Moved the patch after mbm_mode is introduced.
>>
>> v4: Changed the counter name to num_cntrs. And few text changes.
>>
>> v3: Changed the field name to mbm_assign_cntrs.
>>
>> v2: Changed the field name to mbm_assignable_counters from abmc_counter.
>> ---
>> ---
>>   Documentation/arch/x86/resctrl.rst     | 12 ++++++++++++
>>   arch/x86/kernel/cpu/resctrl/monitor.c  |  1 +
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 16 ++++++++++++++++
>>   3 files changed, 29 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 1e4a1f615496..43a861adeada 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -290,6 +290,18 @@ with the following files:
>>   	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>>   	there is no counter associated with that event.
>>   
>> +"num_mbm_cntrs":
>> +	The number of monitoring counters available for assignment when the
>> +	architecture supports mbm_cntr_assign mode.
> 
> "architecture supports" -> "system supports"

Sure.

> 
>> +
>> +	The resctrl file system supports tracking up to two memory bandwidth
>> +	events per monitoring group: mbm_total_bytes and/or mbm_local_bytes.
>> +	Up to two counters can be assigned per monitoring group, one for each
>> +	memory bandwidth event. More monitoring groups can be tracked by
>> +	assigning one counter per monitoring group. However, doing so limits
>> +	memory bandwidth tracking to a single memory bandwidth event per
>> +	monitoring group.
>> +
>>   "max_threshold_occupancy":
>>   		Read/write file provides the largest value (in
>>   		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/monitor.c b/arch/x86/kernel/cpu/resctrl/monitor.c
>> index 80be91671dc1..c23e94fa6852 100644
>> --- a/arch/x86/kernel/cpu/resctrl/monitor.c
>> +++ b/arch/x86/kernel/cpu/resctrl/monitor.c
>> @@ -1237,6 +1237,7 @@ int __init rdt_get_mon_l3_config(struct rdt_resource *r)
>>   			r->mon.mbm_cntr_assignable = true;
>>   			cpuid_count(0x80000020, 5, &eax, &ebx, &ecx, &edx);
>>   			r->mon.num_mbm_cntrs = (ebx & GENMASK(15, 0)) + 1;
>> +			resctrl_file_fflags_init("num_mbm_cntrs", RFTYPE_MON_INFO);
>>   		}
>>   	}
>>   
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index f25ff1430014..339bb0b09a82 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -869,6 +869,16 @@ static int rdtgroup_mbm_assign_mode_show(struct kernfs_open_file *of,
>>   	return 0;
>>   }
>>   
>> +static int rdtgroup_num_mbm_cntrs_show(struct kernfs_open_file *of,
>> +				       struct seq_file *s, void *v)
> 
> No rdtgroup_ namespace, this can be resctrl_

Yes. Sure.

thanks
Babu
> 
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +
>> +	seq_printf(s, "%d\n", r->mon.num_mbm_cntrs);
>> +
>> +	return 0;
>> +}
>> +
>>   #ifdef CONFIG_PROC_CPU_RESCTRL
>>   
>>   /*
> 
> Reinette
> 
> 

