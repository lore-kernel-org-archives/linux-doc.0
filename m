Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2076.outbound.protection.outlook.com [40.107.94.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503A445948;
	Fri, 20 Dec 2024 17:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734716007; cv=fail; b=PYgT0vahI2AsyNzTe0oLSdq9/c66kkTbdNoIEs+GCqhgTZ8FW4a4hWwdpy0ZQEUN3NYnblzgauuEFdTblcs0UdyUOqKy+bp9KOzCukdFYVaqZCiVYaaSowCYd/gm4nareUU8eEhISAfgVXDk2VtX2Y0nWzYSl4wd6JMI28ISrGs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734716007; c=relaxed/simple;
	bh=4eN7gKTsbqawW7WhLGww/KZH/f8zH84TKrhRMMd8Mks=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=uRUlT47RrhNo1Pymk8rQk6qWi+sVHw1aV8aAGOfvHl8n2xVl8Lrk4W5U8nT7euGGGD1LrDO7D332sLm7FCaETo+eoI0QVGeTgTMDm4EAULwDhsiANOFA4QPN8k4FM8ElZc22HJCRLv2AM8d/e9rHKPJmS5ntQ1FoxqWEM/uDmSY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gAHeTTzG; arc=fail smtp.client-ip=40.107.94.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gAHeTTzG"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TGGtSuLuPkzVIt0leNjfiOdbZoOpfceMulGma7G6EPWCDHEUHlgr0hFaeRveUKomyOL8rwVKwjbUBopEAy+zHdpmO6kbbIA5v8AgjnaX0NKgHqMb5OLU3wHx0Kxg46jLzFxjzspY2OD8mHVywe/H6hkPLKjL/ycSYWXNsA4uex+Tj3m7YcSI89KM2muZtry+RsysUkdrfQSfKWbA/g9vfgY9DO/92HGwn4iIMGOezv7Nvz6Fvgjg1t92Qi3NCg7UAk1huDKYT7duT7g7YwcKsb9I8WldAuIFvhpZc55ZMEMHvtYrn9Y6YYZVthyPhV0lByT3IcL20fW6dUA9QrPm2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+QqaCqjIIQi2cHQCXU8V0SchK19ijZfUKeg6D4lBzwk=;
 b=fH1IRKJwCdTzRSBblRzPmYfhdMiqKMP9NmsyWH28/iJRzFV1RBdFM8xYteJM3dVGo5cM0rEJj6B4EcWSeimzc2jGcNGOcJKAByd4fm+dKgS2eMvsbW/WWLISFdvh3lk8xztMQXc1vH90nV4EZkcNdYAEpyztnZXwoZ8RQDP8HPwzAGH4uZO+/CMdMMU5ebIgcP5bqjzxMzsl4ojcdk1T4Q/NBaVwMa51KHsFbgdFfR90a44pusNvjkVAPBL65Ff0r4p7hH+29hqSf4N501sLuBal7RBjlBZjGmoJR85fPM5inIS8WgFMu3JQS+QeR1FrcCKUZ2vgCsowISzQqecX1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+QqaCqjIIQi2cHQCXU8V0SchK19ijZfUKeg6D4lBzwk=;
 b=gAHeTTzGlJIUAWYcByZnd8YuRrQEzvPS+fWo8qKJ5MjBDecE5zDl3d7PmP/CYxW0dnN3kvGw+z4MELMxOPRG1+CYLVbfCNJWYVuBLYeYc4iqznwOh8O6n55bhex/8FQelpXdK2oTpuXt4dkmv/xeNWCbLD/r8mtc/3lHocnZCYw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN2PR12MB4335.namprd12.prod.outlook.com (2603:10b6:208:1d4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Fri, 20 Dec
 2024 17:33:16 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 17:33:16 +0000
Message-ID: <5b02cab6-d539-41a9-af1a-e0fee1b9a74d@amd.com>
Date: Fri, 20 Dec 2024 11:33:12 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 12/24] x86/resctrl: Introduce cntr_cfg to track
 assignable counters at domain
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
 <5abf8affeaade3e7b08e9509d11bc78143935800.1734034524.git.babu.moger@amd.com>
 <9a8a0e45-82fd-4126-86d7-a4f7b2d583c3@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <9a8a0e45-82fd-4126-86d7-a4f7b2d583c3@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR01CA0025.prod.exchangelabs.com (2603:10b6:805:b6::38)
 To MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN2PR12MB4335:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a496bba-6f19-468a-7159-08dd211c6322
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?RmJGYnBwMHYyR2Y4TnYvU1BsL09MaFdXbHdGeUxHdEV2RXhCWnM0Y3p2SVpI?=
 =?utf-8?B?S2Q4UlhpY2piQkYwN0xUTklVSEk0eXZZS1ZMZ0sxQWlRZ0doS05LdU54NnI1?=
 =?utf-8?B?OEphKytyV2hsWFF3RFJtZ3FGeEM1VGJxQWQ1a1RCOCtRdFpvQ0dmcm5aeURm?=
 =?utf-8?B?bEFsdkxpYkJ0dlhBVHFCSFZrS2p0OXJaKzlBV2RJMGVKeHJuZmxNNFFKYTl5?=
 =?utf-8?B?S0d5N2ZHYTRkZzVGQ3ArT0UxUGxFR2l6UzZXSGJvWUFYbEdBNnd1WW8xTUl6?=
 =?utf-8?B?cnpOdCtXWFRacGJPbGliUURIVE1obVNTUmJKWVdkS1V2NkIwMEF0N3dDYmp5?=
 =?utf-8?B?QjhubnJBSWNiQmVtY0JVZlM5MnNlVmJlbG1JdG9ENFVLcVZKVThNb2dFQ1Zj?=
 =?utf-8?B?Mlk0REJkSDNjcXJOSnFsN1N3d1creHNhaVBZcjYzeE9PSnFrc1lSdm9QUlNk?=
 =?utf-8?B?emtzQnQzRDJjR2Zvby9idVVQa3pSTmJkd1BtUjBBY0MvVDBXRlhha2tzU1pY?=
 =?utf-8?B?WDlGcXFObkU3V1phWG5CcUl4dWdPOEJqckVNcWdNTHZ1ajEycjZ0M0labzQy?=
 =?utf-8?B?dlZnYnl3emJCRVRySUdaQnl6b2IyRkJwL0JZbktvTW1YMlovWUI0ejVPUzlI?=
 =?utf-8?B?bnNUM1pUZnk0NEM5MWdnZnZXd1VmTGNWSDRuYUFYZ1VlRFhOcmU1dXpaZDAw?=
 =?utf-8?B?bTVmL3dWMXkwY0tEM1BsanY3MXNxM0ZJQmNYdGJ0MWRicW9QditoUVc1QjRk?=
 =?utf-8?B?ZGMrZUpld3FGc3picTVlbjR3cTJaSnFZeFZqNktBSTRETjNvMTVWaFU3QWlJ?=
 =?utf-8?B?TEJZZnZtZ1g3YlkwRmYrREQ0dGZEMUVFcEZSZU55TDIxQW10UGN5ekNHU3Bj?=
 =?utf-8?B?YVQ2b0IyZDVuWDNqcEJPVkh2ZUJleHVNVDNpa3pvd1pCazBZTnp6NXp6RUh6?=
 =?utf-8?B?ZXlRbzZkZWtMbmxhbXc0RmlKdEZ4a1FuNlN4ZFhXMDFGUXJNNDI1U3dON1NV?=
 =?utf-8?B?bWdvV3BjTFg3d2ZFQ21EMXhIbXZGaEdqSVpsNVF5TVF6NGNDcUVuV25WcUE5?=
 =?utf-8?B?dFRSNllSMFlIMXdUSEJTOFhJN1V4NjFiYkhTVWpmOEF6c1BOOFdCczF3ODUz?=
 =?utf-8?B?dHpZVzcvMVNQR3cyS0RMelZrd01oSUhHUWtUSFZqSU9IQ24vQ3ZpZnMyelgw?=
 =?utf-8?B?VXd2bjhaSG1sYW52a1h3Rkg5YjUzaUJzUVZxU0dadXJTZzh4VW5oc1NSclpm?=
 =?utf-8?B?TUYrVUJJbjA3S0s0MDFmcXRlOVhaYmMyZ2g3SjF4QXFjaks4VGdmdUdrOFh0?=
 =?utf-8?B?WEQ3NlhkWlpIbnlYc0VHVjRxNkY2dllLV3pzazJOMzNFeWt5VkJaeC90VHdj?=
 =?utf-8?B?Tnk4N1pvTzBsa2tWa2pHNlNTSC9FQXByZEhZZEt4TE1aS25mTjBpU0FtY2sy?=
 =?utf-8?B?aGVIcFhSYytOV0hOU2o2RFBLcmhiZ3ZPRmxXQ0FHNFk0azJGS1F6SjQzaWd6?=
 =?utf-8?B?b3R2cmdUSHlnMHRGZmg1MmJVaXhzalBxQ0FGM2RNajgwRm1mL0NOdkdOa1Ux?=
 =?utf-8?B?SnV0RWQyRmZRQ0xHU3N5QnRXb1BsZklUYmlSaVozWHBHNlJRblllbGlFOUl0?=
 =?utf-8?B?R1VjblErdEFqU2JHcy9laXB2U3Q3bmVLTnlXN3VtTTdVQTVqMXF4ZFAzZTJ2?=
 =?utf-8?B?T1dqbGViNXhOVHlVcU4wZHJyaHY5clVldWRPTHB2b01jcEd1M2x2YVo2NTlr?=
 =?utf-8?B?WTFVbkl4c1hPN3pLZVRwSDhoZUY1Tjk3aHlaZ0lzSm9RNDBGWFZUMVJJZU1q?=
 =?utf-8?B?dGcvRXpucUc0c2R2TW5lcDFqeWNtTTYxTVBjYWFQYzFTOHFCYVpjd2hNQy9y?=
 =?utf-8?Q?KvQvR4cF/c49W?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RHQzN1NCTE5QdWhDV3NnQzQzWnpUdHNZampSenhMdzFYMDN3dDlCdHF6Uyt5?=
 =?utf-8?B?eDlSZG5IWVBOUzVXUmNYcE1PdTVYcGhwZFJwcHM0T2RzRGFMZWgxeTRvTkZU?=
 =?utf-8?B?WUdrckFZc1lnSHVTQ3Z2aXlUQ3dSMkJpRXpaQlZ3ZGNNOHdYQUVHKzM2cnN0?=
 =?utf-8?B?ZGVYNkR4M0wrNkt0TUZ0Z2hLV0s4RHlBejlzNExwSlBuaEVsTCtiY3lDZklG?=
 =?utf-8?B?WWc0RDl2Nlk3RmJZNXQ1Q2RyQzZoYU01ZktScDBvZ1JXdjBJMkwwNFJlOFdB?=
 =?utf-8?B?bXhPbWdZaENOZTNIWlIwRXBGSjlZK2RIOU5tRld1RFpTallIbG9pVTdLZ0Yz?=
 =?utf-8?B?WlIreXg5amlBMlVtTG9KSFNLMytTUWczdlpMV3VGRExyVkY5MWk4S0YyQllw?=
 =?utf-8?B?MS9WQ0JNR082blI1L01MZkZacUxaU1IwcDFQTFpFUk16K1RqcUhSTzZ4alJp?=
 =?utf-8?B?cWtsTUpubmtzMkNjVlNhTENONjFGWFdMbTNMbW5GWHBSS0h2UG5DbTVoVHdD?=
 =?utf-8?B?dG8zdVFPdzA3cmorRVRPVlEvZGZUOWFkaGY1QVpMaEdZc09VNVZ3b2dESWl4?=
 =?utf-8?B?b1V2S3JGbTlzd0NPL1RlOVZTeVo2UThZN1ZrYWFkeFNlOU5wd0NCbXU4ak9K?=
 =?utf-8?B?Nmk4bVJjNlRvWlY4NDg4S3RDOVFMUVZ3V2R5SkhDWGU4UUQrRzNCUjZiVWVx?=
 =?utf-8?B?YzEydGdXNUxXaXU2Q2pFa0RmMGNuMzFGQWdQQlFmSVhnNjNSa2hWTmx5VmF5?=
 =?utf-8?B?Y0FTZTk1ZGdnb1Juc2piWjBzTGcxU21saGgrcU1MOHlxZllGK1NvWjFYLzBa?=
 =?utf-8?B?d3JMaVkrVVF0UXZuOFlub3ZJV0t6SDgxUHRSc2xhN0VpbURuelRyaXJDY1Jt?=
 =?utf-8?B?eWtMcHVpczJnZVY1OHlBS01TSHhVd1NwMi9scUJpQmNwUDJhQ0dXTzhjeWNn?=
 =?utf-8?B?SG5DTXVkSTBZZjdmQ0hCWE1DVVhhNnJYUmRxK09CRjlxM3ZDMExBalNNSXJO?=
 =?utf-8?B?czRDN2JnSUZiVUdtQTc4MXExdTVNWHZwMU03NGZTeFVvZisydHhyVWQvTVJ2?=
 =?utf-8?B?dDMvM2tYNzFyUjBpZUg4S3dOWitCbXlzUTFFWDFsTW1iUDFtUkROblhPVm5m?=
 =?utf-8?B?UWxSVTEyNko1amFOSFg1b2cwakNiYzROTCszMGxGb0sxYkdLV3psR0x2MHIv?=
 =?utf-8?B?NGMxbTlCZDQzM1NTdHhhTHJEUStUTGgwS3I5Zit5TjVIYk45alR2TWIzSEMw?=
 =?utf-8?B?T3VlcTM0b1JBLzgxaHBJRUQydjdOU1Z6Ync3SzNWMDhpVHV3bTFwWGpGZlk4?=
 =?utf-8?B?cTdLM1pjYlBhWU9lRDM2bnd6ZHorbFkvaEFwZy9ZME5HbkhRcUxqY0R2RERU?=
 =?utf-8?B?TVFKb2VubEpyeDEvbmYraEtJcUMrM05aT3hFaGtsQVhWT2RVUVVwYVhsMjQr?=
 =?utf-8?B?eXVBbEtFSlBWVWJzaEhvOTB5d3dmMnFPZjh2ZHpLMFpIRElmTEZqRXlqbGN0?=
 =?utf-8?B?WXJDRmlPaWpRL0dlSHpGVHhnT3dKbWdYMjIwQWRVN2FHUlhDTnRpak1GSFY2?=
 =?utf-8?B?Nlc4WklCcTc5U0JkK2RYUGRkZ3ZGTklsbUpCOERxNDNhTXFQUVJWcEVBWGVs?=
 =?utf-8?B?OWpSdURXOWhtU3I2UTV4UUt0QlN6MWhkaWhYcThzM1hSR0tBOHlpSm50dzl3?=
 =?utf-8?B?TFJrT3ZEU2ZkNGJ5bHdlQitxeEw4NjNBV2NEb3IzYVg5cGFPOTNlb0lVQ2pC?=
 =?utf-8?B?dG9ZSmlUL2UyejRta2hJSEIrQU9BRGdyWVhoM3UwTGtZYkpsQVp5eXdNWFlU?=
 =?utf-8?B?aHIrNngrOFM5aDgvYlloaTViYWlMT25mTGtiUDlNT2tSS21Ha2s0T3E0NzJv?=
 =?utf-8?B?b3ZPamZOTnJ4U3YxZzN0R3FVYmRlMm1NbzcvOHhMUVFtdkNNMEN2UUtRWE8x?=
 =?utf-8?B?U1MrR3ZDRTk5Y0JDME9YSFFFaHYzY28rbkJYQllrQ3RaazJ1Um5acDV2Y1M3?=
 =?utf-8?B?VTdEMUpxQ2hCdmNjZzBrNUU4L1IrN1kzUG1sVlJpU3R1dTJreXVNbkczSGNC?=
 =?utf-8?B?b3Nsc0RKaHY4NC92cGY3b0wxK0E1d0JkcHhGMk94Mkh6ZDJMQ1RwS0FFbUxl?=
 =?utf-8?Q?/+zeVhYuHbXgUWg+SE0ANeNkb?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a496bba-6f19-468a-7159-08dd211c6322
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 17:33:16.4271
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YXxjDcsxhiohfk8rl6iXME2X7G3ITH2nOLstYwZ2BMzsTREwqL+BMd6ZBmiMjBVT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4335

Hi Reinette,

On 12/19/2024 4:33 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> Did subject intend to use name of new struct?

Yes. Will change it to "mbm_cntr_cfg.
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> In mbm_assign_mode, the MBM counters are assigned/unassigned to an RMID,
>> event pair in a resctrl group and monitor the bandwidth as long as it is
>> assigned. Counters are assigned/unassigned at domain level and needs to
>> be tracked at domain level.
>>
>> Add the mbm_assign_cntr_cfg data structure to struct rdt_ctrl_domain to
> 
> "mbm_assign_cntr_cfg" -> "mbm_cntr_cfg"

Sure.

> 
>> manage and track MBM counter assignments at the domain level.
> 
> This can really use some more information about this data structure. I think
> it will be helpful to provide more information about how the data structure
> looks ... for example, that it is an array indexed by counter ID where the
> assignment details of each counter is stored. I also think it will be helpful
> to describe how interactions with  this data structure works, that a NULL
> rdtgrp means that the counter is free and that it is not possible to find
> a counter from a resource group and arrays need to be searched instead and doing
> so is ok for $REASON (when considering the number of RMID and domain combinations
> possible on AMD). A lot is left for the reader to figure out.

How about this?


In mbm_assign_mode, the MBM counters are assigned/unassigned to an RMID,
event pair in a resctrl group and monitor the bandwidth as long as it is
assigned. Counters are assigned/unassigned at domain level and needs to
be tracked at domain level.

Add the mbm_cntr_cfg data structure to struct rdt_ctrl_domain to
manage and track MBM counter assignments at the domain level.

Each domain will contain num_mbm_cntrs entries, indexed by cntr_id. 
During initialization, all entries will be set to zero. When a counter 
is allocated, its corresponding entry will be populated with the 
assigned struct rdtgroup and enum resctrl_event_id. When the counter is 
released, its entry will be reset to zero.

>>
>> Suggested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v10: Patch changed completely to handle the counters at domain level.
>>       https://lore.kernel.org/lkml/CALPaoCj+zWq1vkHVbXYP0znJbe6Ke3PXPWjtri5AFgD9cQDCUg@mail.gmail.com/
>>       Removed Reviewed-by tag.
>>       Did not see the need to add cntr_id in mbm_state structure. Not used in the code.
>>
>> v9: Added Reviewed-by tag. No other changes.
>>
>> v8: Minor commit message changes.
>>
>> v7: Added check mbm_cntr_assignable for allocating bitmap mbm_cntr_map
>>
>> v6: New patch to add domain level assignment.
>> ---
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 11 +++++++++++
>>   include/linux/resctrl.h                | 12 ++++++++++++
>>   2 files changed, 23 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 682f47e0beb1..1ee008a63d8b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -4068,6 +4068,7 @@ static void __init rdtgroup_setup_default(void)
>>   
>>   static void domain_destroy_mon_state(struct rdt_mon_domain *d)
>>   {
>> +	kfree(d->cntr_cfg);
>>   	bitmap_free(d->rmid_busy_llc);
>>   	kfree(d->mbm_total);
>>   	kfree(d->mbm_local);
>> @@ -4141,6 +4142,16 @@ static int domain_setup_mon_state(struct rdt_resource *r, struct rdt_mon_domain
>>   			return -ENOMEM;
>>   		}
>>   	}
>> +	if (is_mbm_enabled() && r->mon.mbm_cntr_assignable) {
>> +		tsize = sizeof(*d->cntr_cfg);
>> +		d->cntr_cfg = kcalloc(r->mon.num_mbm_cntrs, tsize, GFP_KERNEL);
>> +		if (!d->cntr_cfg) {
>> +			bitmap_free(d->rmid_busy_llc);
>> +			kfree(d->mbm_total);
>> +			kfree(d->mbm_local);
>> +			return -ENOMEM;
>> +		}
>> +	}
>>   
>>   	return 0;
>>   }
>> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
>> index c8ab3d7a0dab..03c67d9156f3 100644
>> --- a/include/linux/resctrl.h
>> +++ b/include/linux/resctrl.h
>> @@ -94,6 +94,16 @@ struct rdt_ctrl_domain {
>>   	u32				*mbps_val;
>>   };
>>   
>> +/**
>> + * struct mbm_cntr_cfg -Assignable counter configuration
> 
> Please compare with style use in rest of the file. For example,
> "-Assignable" -> "- assignable"

Sure.

> 
>> + * @evtid:		Event type
> 
> This description is not useful. Consider: "MBM event to which
> the counter is assigned. Only valid if @rdtgroup is not NULL."
> (This was the first thing that came to my mind, please improve)
> 
>> + * @rdtgroup:		Resctrl group assigned to the counter
> 
> Can add "NULL if counter is free"

Sure.

> 
>> + */
>> +struct mbm_cntr_cfg {
>> +	enum resctrl_event_id	evtid;
>> +	struct rdtgroup		*rdtgrp;
>> +};
>> +
>>   /**
>>    * struct rdt_mon_domain - group of CPUs sharing a resctrl monitor resource
>>    * @hdr:		common header for different domain types
>> @@ -105,6 +115,7 @@ struct rdt_ctrl_domain {
>>    * @cqm_limbo:		worker to periodically read CQM h/w counters
>>    * @mbm_work_cpu:	worker CPU for MBM h/w counters
>>    * @cqm_work_cpu:	worker CPU for CQM h/w counters
>> + * @cntr_cfg:		Assignable counters configuration
> 
> Match capitalization of surrounding text.
> Will be helpful to add that this is an array indexed by counter ID.

ok. Sure.

> 
>>    */
>>   struct rdt_mon_domain {
>>   	struct rdt_domain_hdr		hdr;
>> @@ -116,6 +127,7 @@ struct rdt_mon_domain {
>>   	struct delayed_work		cqm_limbo;
>>   	int				mbm_work_cpu;
>>   	int				cqm_work_cpu;
>> +	struct mbm_cntr_cfg		*cntr_cfg;
>>   };
>>   
>>   /**
> 
> Reinette
> 

