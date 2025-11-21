Received: from BL2PR02CU003.outbound.protection.outlook.com (mail-eastusazon11011001.outbound.protection.outlook.com [52.101.52.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F78C25F96D;
	Fri, 21 Nov 2025 14:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.52.1
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763733861; cv=fail; b=WqAseReGMFOf3ZomrUkyAtqLO1x6eu1E8ibHRuUoJ/N92FGXuYIDyrTMA9ZFGBrLzpeu4mPSRU6qtNavjeEew0CqcNZvhT9Ig3uSQEHgbdP4GnZDJT+aN28Gy9U+oqbjsMu3M9EKQSKNN1BZmvwSVxwX7Mnbglm3U78dmzkgSbs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763733861; c=relaxed/simple;
	bh=xsYxZ/lU/JFr7iYyGp4CD28AJYWKWnG68JX84wQ4F60=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I4seOhH3z2AnEVXjC5d+S2cL9F1Fm8EG6Kyy+RnYkkITrXCyqdM1wn178XWUK0EZUo31jfr4tu0sZtydnCXjpXxNFFuG31b7Fxp2JieC1skRoiVpo9XZ8pMG4vUDnvMi6k2rX9P3cczxLgos7FE+OHWrB/6GJxzXMOyHYHbT9Cw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=hlMAPzkT; arc=fail smtp.client-ip=52.101.52.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="hlMAPzkT"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Y05lq535EJ4DBFZLL4uYxjtOiFBc6DrYVOOkZpcDqYC8Vvnc7IQrJ6QjVBJNdKsiJg7bU5re1LtSqJjrVLgP16Jq2ysEkSYFNa3zTLE1BZv5UIM5SDyDhDhVHIzs4cTZ3yz8KxTnDd1N6iX4V9uicHos5UaCNhThIinJQGsNv88rfiXB1gwPmuKw/WMx3n7565HjxCk5x2z61E3dyGQ8YtbCUcaG/uQatSnsHlCwrvgDZIKIG1BdGc8Dxj4UpKCXWwV/pYsSG6meo6dAfpCpS3hGtlyYMRvkX5BOPwcSIt10IONf/ZVoJdO7zoLW1wg0CDLpqACgbdpJkPBMbUJZSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dj/1lHH1LmXj1IaJm8OoktoQZI4V8fZdmVgE8TR01Go=;
 b=W5UBL+tCDWHlal6W989dTEWno1JYMIo5Eom5k9vc3pHJlajH/ck4Wko51Uns0+2TTB03NOkQAJLpBAGcCNX5+OHbBLMevm4iyK7XQvKgdvesZFxfdHHrhiYS2Ia+RqhNCwZsK6l5D7+N9HJKKaqtkxix9HkT2QcdhhydubG+roAo5+Ugsi2YUuyTkUaeirv/gactvM0Zg2eqHAca3/G7QXL6JxU1DDtrsDwwsNOYw2DBhz7I4TiVDcQgjbbX5avTIdry108sqnQXHIZ673kjb8NqWtOcZvDWFIQcfW4unygkvJDUZ8Uxv0c4VyUjy4yIFQbQIbd1d2rpjNvZrape2A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dj/1lHH1LmXj1IaJm8OoktoQZI4V8fZdmVgE8TR01Go=;
 b=hlMAPzkTdp9FWGkmMC3hpT23gxO8Flj6zUiAF/aDhVpanJtQuRPyNUHdzHuV2wmw1NNjt5d9Gd4NRJ3IIpm71vL+KtOlZ/n4/LKIR9he4pqo5B5Ncxe9RmaemYydkbVE9jJzdcjthZfsxOFo1T4DEKVEFksRplkx0scPYqZmSH8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc) by CY8PR12MB7660.namprd12.prod.outlook.com
 (2603:10b6:930:84::12) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Fri, 21 Nov
 2025 14:04:15 +0000
Received: from IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 ([fe80::8d61:56ca:a8ea:b2eb]) by IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 ([fe80::8d61:56ca:a8ea:b2eb%8]) with mapi id 15.20.9343.011; Fri, 21 Nov 2025
 14:04:15 +0000
Message-ID: <73c0c936-9b5d-41ac-b028-d8d2009312a2@amd.com>
Date: Fri, 21 Nov 2025 08:04:08 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] fs/resctrl: Add user interface to
 enable/disable io_alloc feature
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, tony.luck@intel.com, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: corbet@lwn.net, Dave.Martin@arm.com, james.morse@arm.com, x86@kernel.org,
 hpa@zytor.com, akpm@linux-foundation.org, paulmck@kernel.org,
 rdunlap@infradead.org, pmladek@suse.com, kees@kernel.org, arnd@arndb.de,
 fvdl@google.com, seanjc@google.com, pawan.kumar.gupta@linux.intel.com,
 xin@zytor.com, thomas.lendacky@amd.com, sohil.mehta@intel.com,
 jarkko@kernel.org, chang.seok.bae@intel.com, ebiggers@google.com,
 elena.reshetova@intel.com, ak@linux.intel.com, mario.limonciello@amd.com,
 perry.yuan@amd.com, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 peternewman@google.com, feng.tang@linux.alibaba.com
References: <cover.1762995456.git.babu.moger@amd.com>
 <c7d3037795e653e22b02d8fc73ca80d9b075031c.1762995456.git.babu.moger@amd.com>
 <312511a1-ee7c-47da-b351-ee7d9adfe306@amd.com>
 <65f94330-bd8f-436b-b02c-654f87e4bb29@intel.com>
Content-Language: en-US
From: Babu Moger <bmoger@amd.com>
In-Reply-To: <65f94330-bd8f-436b-b02c-654f87e4bb29@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA1PR05CA0001.namprd05.prod.outlook.com
 (2603:10b6:806:2d2::6) To IA0PPF9A76BB3A6.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bdc)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PPF9A76BB3A6:EE_|CY8PR12MB7660:EE_
X-MS-Office365-Filtering-Correlation-Id: 044e6014-b50a-4c0f-8345-08de2906daad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YkJaYUMxRXE3TGZ3R1ZnZnFSOGpEaDloS1IvdkFhWlJacy9rbTB5UVRWVU1F?=
 =?utf-8?B?L3hENE5hZ3hYYXF5Z2F1NnBTZ3B2ajloTVVaM2ZmcitXbFEvQzNGd1grNVRr?=
 =?utf-8?B?T2d3ZE1EdlBCc0pkM2VNNUVNc3JpclJhbzdGeVpTTnVZTU5JU25XcHBtR3Jr?=
 =?utf-8?B?KzFjcnBrVFM4b0FaVnVEcWdZVzJBQWtoYklJdmVvUElQOC9JaDNwbWNsWExu?=
 =?utf-8?B?WEZtalJOc2NMVURmNGFhZG9KajRudUVqQmVNUzMrWnZNU29jMzUrSnNUM01i?=
 =?utf-8?B?T1Z6V2ZXQmtabUxUWjlKZlpDMmloTzdzQ21VK3JqMTU2elh6ZEU2UEkrNE94?=
 =?utf-8?B?RE1yV0xOV3hWbWdLcUZxRWJUUlZENW9MZmkwVnZwODI4TlAwWTQzcGR3R1U0?=
 =?utf-8?B?TzRFS1VGL1FlWDhjdnp1dGNnYVl3cC9oZndXM3luekpaZWcyTldQTFVjK1d5?=
 =?utf-8?B?dFJYR0lFTWE2OWszb0wzNUszRFJXQnhnckdkQUhpUXg1dmpwWWVobjNKSElH?=
 =?utf-8?B?Z3FsSHUzcGt3NG9RNE02UnZCbUd0YS9Fa2U1alBTQ0hvZDhuSldJL1RxSnpZ?=
 =?utf-8?B?eUdTUUhZMmRjK2ZJakRFRXlHY1RwMytFZUp3QnVhcnFNS0tPdHpnM2RLOHlL?=
 =?utf-8?B?V0J1MnB0VlR0TnZYdW1zWEFTY0FraFBQZi81RmtNU3NvRGlGT2FJelFJY3Rj?=
 =?utf-8?B?M3k0WHB4eGFtdG1abFRzQVBKNHVkcXBjTTdaMk4wYS9jMmtMWTlwYVdGNVI0?=
 =?utf-8?B?aEI3UGVFYXgyVjVycWM4M2xJdHpjNmFiSXl1QmxyK3gxaFB5aUF5a09hSy80?=
 =?utf-8?B?d2JkQzlkT1RUcVJLS1NOandYdmhDTUo4QlMvdEZKMTVYY2k4MHpGcTFqL0ty?=
 =?utf-8?B?Qm9ibzFhOXdBNjMxTE10STByVlZHVUNDenhTM0VKY0RYeHh1NXAzREFvVXJo?=
 =?utf-8?B?OFBQTTdoTDkyU0VxMGtIWTc0NWlyRDY2TTVKZzNYOFp3YTJPTkdjVEFXK2Fs?=
 =?utf-8?B?SHJPbHNkajBnMlNaV1JKYk9KTXVVaERLd2ZVMkN1Z09vYWw5cmdpeGxBUUFa?=
 =?utf-8?B?T05tQ2s1OWVIY1JHZU5BTHR5eDZUQ2dJVDFtbWprTTkyZHF3czhHWXU0UDRN?=
 =?utf-8?B?T1pJQVhnWWNJdThwTlQyVlByelVnc2RiQjg0UnVJYW05WGttTHZjZ2QvS3FH?=
 =?utf-8?B?K0NqcGdqSjVGdXEydld6Q3dPMFhHNXFBTWxDMEQrZ3l1Qk5FWWgreDVIb3d1?=
 =?utf-8?B?MkU4ZllqLzZPYUJoS2JWaHN6cml4MmRVRGRybVR0VjJ6dThjWWQwRDdUUmRW?=
 =?utf-8?B?ZHhXdXpnZW9xbUZSVmdobjRhV1BJQXhPdU4zUlgrb0JqL3h1bTFwMFRiSzR3?=
 =?utf-8?B?WnB2N0lyVGowYnhnWEFRODhMRkZXZXB5N2FVbDQ5UTFUay92eFhnU2J0bzEw?=
 =?utf-8?B?aXgvZFlMNW54c3kwTHp1aVF5RWI3aXpzZEdtR1ZLWjdPblhNSXd0U1ZjMjFw?=
 =?utf-8?B?YVVUSGdMZjBsTis0TjdpT25hMnZPakhPekxKcC9HNFl3STJuVVMzMFh4S2dW?=
 =?utf-8?B?Mzd5NHdIZk5BR2JzQVZERkhYOGp5Sy8xdGx3dmdHWlpad25NN1BHWTFtV04r?=
 =?utf-8?B?V2J5cU5TbGM2UjMyYk5vRmR2cDlJWHM3MExHay8rb2Yrdm5nQ2R1SVFEK1lM?=
 =?utf-8?B?aStRWFl6dW5xRTVVc0tjUzhDaWdqSXRqMmFRY0wwRjdXM2Exby93N21CdkJ5?=
 =?utf-8?B?VWJQY3BsSitqc1JvZTVORG5oamFZbUJCNWhSWVNoQ3ZnQ1YvTlZ1OWUzZGww?=
 =?utf-8?B?eG5XdWxWcENPdWJhc2hxSWk5SGlUOTVxZDN5L0FubDVwNnF3RCtReThLVS9h?=
 =?utf-8?B?UFlNT2ZRc3MyQzNpRFc1UE5VMFR4REdpWGRIdTYzVTU0dVhLbklPZ1RMV0Zv?=
 =?utf-8?Q?vJ+qO5keZVmlMKqZbSu+UVc/nQ/WsnJk?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PPF9A76BB3A6.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?anNrN2lWWDJEOThTa2NNclpHeFZuWmVXbFU0UjF2NGowNFcrR0hGWGxuN1Fn?=
 =?utf-8?B?cmZPbS9VZXhYZ1RrTUNaY1hJNTg1ZFkwbnk1TmRQS1RRRmI3UVRlVWdaU1R6?=
 =?utf-8?B?TDFxcFZWMlBsNEU1MXB2cjdCZUM4VkhXT3l5TkJGQTVCRUlkNFoxVSttOWI4?=
 =?utf-8?B?ZFZOVGZ1cXQvdUpSY0JhNEJER1dpdmlERmVKNGVLSThHWXVVTVlPN2ZMZlFV?=
 =?utf-8?B?SVVXODJ6alpKb3hBRGZ4c2JSUmIxRnEwcXltUnNDTmNpc3c0ZHJLdlkzbzVU?=
 =?utf-8?B?dkRaUDlBZnVUdWZacld2MnRyMnBUT0FDakxNOUVBUnF4dTdNWmRxTnQzT2lI?=
 =?utf-8?B?bWhGRGQ2NGd0OEluR1M0eXN0RUpnMmZyaWE1b1Z1YlBsM01UM0trZGUvS2Zz?=
 =?utf-8?B?MWRKQjUrQWZSYjA4cVBFMjBRWW4zWXFxYVYrOEpya2U4UkJxL2hHc1FZVndP?=
 =?utf-8?B?aGQrMjFhQXBBL3krR3M0Ums4bitVN1JIVzg4c0VEdk9SY3kzODBQMDk1UFk0?=
 =?utf-8?B?UmJoY1RjUUhBNFVFOUJCcE5aL3F2eCsvVU0xRGxsNmlBRzBjNUhEUzBnMXp4?=
 =?utf-8?B?SjJmbktUOUQ1SmZ5bjVnMHRBUzFZUFZoMDM3WUFPNW9wMGxUeGZ3aS9UVk82?=
 =?utf-8?B?NmtBRXpGTDFPMmsyVW5zeXMvdTY3amRIajBCNGJBeG5qYi9CbzAwdXhoekpq?=
 =?utf-8?B?Q1daY0NNcnFsc1BmVGYwQU1UQVB1OGJFcHN5WFFCL1VPZ0psT3RtWUprczlP?=
 =?utf-8?B?clBOSmJNbnExaTQzMlhyQmpEZmlDaFBDREEvSHpkUXJmOE5MNWVld0RwR2VL?=
 =?utf-8?B?NGJway81MkplSGZKSnVSTDc3QzNpd3kzeHU3RGVJWTgrdXMyZ1dTejJJakE3?=
 =?utf-8?B?QmlQOWIxdlRXTkhIbTRpZ1pKMHVlRXp0WEdpK0FaZDNHTDdlL0o2aFN4Q1k2?=
 =?utf-8?B?Y29tVGhlVjVIeEliaVM4QkxhLzljV0g5eWpUNnFRTDI4TnI2SUtaZkhtZGlr?=
 =?utf-8?B?QTMzVUJzSE9lUnNOSU1IQ2xXVjZxNkZBVzRqbEhXL2dhZlIwWGxST2lWZDBY?=
 =?utf-8?B?VmVadjY5VFBWenI2WmV6aDkwZ3dHUkM1R1Q5L1ZNdXdPWG1QODN5RitvU1ps?=
 =?utf-8?B?aGdiUnJ6YjNKSjN5dGJvWTdMQWUyRThxdWNjbGF3S1ZobU12dlNCY0gwMXMv?=
 =?utf-8?B?NFJmYk84eHluRUF6bU1kV0txVzFJWkZ0NURYajkyK0xlNnJMSHpyN3BncTNY?=
 =?utf-8?B?THhNZGZXemNyVGQyc25VYWk2TEtBMmJ2ZFloWHdyeVlvRWFrWVFvbnlIM1FO?=
 =?utf-8?B?K0FxZ2pnVmRNRjNpNmdNRVN3RTRXZnd3TlN5TzVSOExaR3NYa1NGQi9lMHBs?=
 =?utf-8?B?RW0xNjc0WFhNMysvK1liWnJRNFdPN1VFNmY4NUtyRlFHQXRvZ1NUUFdic2Np?=
 =?utf-8?B?bWx4ZjVkblhJZnBvcm8vZ0lDSXVKcFBWK0RDUTd0RlhyV1EvNzhRcmRhZXRy?=
 =?utf-8?B?U21pa1NtUFNqREIwWERGUlA2SXgvVDJPY3JXL1VERjV1YUFUSWxmNEVDV3pL?=
 =?utf-8?B?SGgrVCtIaEhBRDdLRXA1eTNKc2haTExiTHgvRTVKK1dmN1c1MlBIUER3RGFF?=
 =?utf-8?B?bWRLYzk5SlRNUXIyZkQvbERhRUZHZHVyNGhJek5TM28wT0xPcDVXcFVScy8x?=
 =?utf-8?B?T3R6RFNLQ1EvbmM2aklPL2FzSGNWTGlHU0I5UVkwamtlR2d0bTBra3E3SFZX?=
 =?utf-8?B?WXlYWklsQlNrZm91ckZwR3ZCYm5GTkFKV1Awdjl6cnFUMXpxZ0thZkRHcnho?=
 =?utf-8?B?TzVPMDZESzY2UVp6Z1lTbWJXa0s0TkppdVFWVzJaMzQvcko4Z0JsNmJXNmxw?=
 =?utf-8?B?WG5oYTliWW5UNTN4NHJWYVpJa3FqOG01Z0lQTy85WWptYmMwZS9BVXJZMG1a?=
 =?utf-8?B?MFZmR0RmNkpqR2I4NlM3S01nd2NBZ3BJanUrblZrVlZHL1MzNW9Wb0ZKT0pZ?=
 =?utf-8?B?VGNmYlQvSUo0TVBHeWI1dC92QkhnL1gwM3hYOWJnWCthbS9YWUZtS0d2SWRt?=
 =?utf-8?B?SWRGeEtPSDlNWFFuaUh4cDVQNTZjb1h0VmdpY1JWT25OeDlteklnY1pCeVNE?=
 =?utf-8?Q?dbBg=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 044e6014-b50a-4c0f-8345-08de2906daad
X-MS-Exchange-CrossTenant-AuthSource: IA0PPF9A76BB3A6.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 14:04:15.0877
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FNppaZnhqaQjLyardu//H/krMnG1bt0CmlyCuv+MrznmR8aLfApudxDp5sT/qs8i
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7660

Hi Reinette,

On 11/20/25 22:40, Reinette Chatre wrote:
> Hi Babu,
>
> On 11/20/25 10:35 AM, Babu Moger wrote:
>> Hi Reinette,
>>
>> On 11/12/25 18:57, Babu Moger wrote:
>>> AMD's SDCIAE forces all SDCI lines to be placed into the L3 cache portions
>>> identified by the highest-supported L3_MASK_n register, where n is the
>>> maximum supported CLOSID.
>>>
>>> To support AMD's SDCIAE, when io_alloc resctrl feature is enabled, reserve
>>> the highest CLOSID exclusively for I/O allocation traffic making it no
>>> longer available for general CPU cache allocation.
>>>
>>> Introduce user interface to enable/disable io_alloc feature and encourage
>>> users to enable io_alloc only when running workloads that can benefit from
>>> this functionality. On enable, initialize the io_alloc CLOSID with all
>>> usable CBMs across all the domains.
>>>
>>> Since CLOSIDs are managed by resctrl fs, it is least invasive to make
>>> "io_alloc is supported by maximum supported CLOSID" part of the initial
>>> resctrl fs support for io_alloc. Take care to minimally (only in error
>>> messages) expose this use of CLOSID for io_alloc to user space so that this
>>> is not required from other architectures that may support io_alloc
>>> differently in the future.
>>>
>>> When resctrl is mounted with "-o cdp" to enable code/data prioritization,
>>> there are two L3 resources that can support I/O allocation: L3CODE and
>>> L3DATA.  From resctrl fs perspective the two resources share a CLOSID and
>>> the architecture's available CLOSID are halved to support this.  The
>>> architecture's underlying CLOSID used by SDCIAE when CDP is enabled is the
>>> CLOSID associated with the CDP_CODE resource, but from resctrl's perspective
>>> there is only one CLOSID for both CDP_CODE and CDP_DATA. CDP_DATA is thus
>>> not usable for general (CPU) cache allocation nor I/O allocation. Keep the
>>> CDP_CODE and CDP_DATA I/O alloc status in sync to avoid any confusion to
>>> user space. That is, enabling io_alloc on CDP_CODE does so on CDP_DATA and
>>> vice-versa, and keep the I/O allocation CBMs of CDP_CODE and CDP_DATA in
>>> sync.
>>>
>>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>>> ---
>>> v12: Minor format fix in resctrl.rst.
>>>        Added text about writable files in the info section.
>>>        Removed Reviewed-by tag from Reinette as there are some new text changes from Dave.
>> Only this patch needs "Reviewed-by" tag.
>>
>> Gentle reminder with upcoming holidays.
> Thank you. I just added my "Reviewed-by" tag.


Thank you.

>
>> Hoping this series will be queued for next merge window.
>>
> I think it is getting late for new things.
>

Oh, okay. The series is ready now. It’s a pretty simple one, so I’ll let 
you decide

Thanks

Babu


