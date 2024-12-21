Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2067.outbound.protection.outlook.com [40.107.220.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C2162E64A;
	Sat, 21 Dec 2024 14:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734789903; cv=fail; b=lITJvFlvOVLutOn/zUcS10Jprr5cSzf3qcfQ420CxXM7hXOVhlDS2EvapD6YaweleSxBvwmwxCEbIambcaOlNpAAMZ3k5REqA9j8BQOAHRtwbwXs6v2PWIDHE2PYHE8w5/VEf2eGELNu0hRSmhnC3H1jUwDr7zSYK3LPKP+HmHc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734789903; c=relaxed/simple;
	bh=8o2cHfSDvCPrSIUvZ8Vprl1OUbxmtNpStahVy9DLa0U=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Et8IqUCFdcqKzKDhSUFE+xmYkQUrWY5btaHrLaqrYG1N5TMnYj5Kb5EeTKYaB00WjlwlCOAaMO59ggDx8l+H5vQdJeFArrGKRKY9GW5Ipya0AxLD63rbd7KMBz6rIobnLuI1QGytjOv5EJz23AKNhANqF6PAOH74vs9Cbth8ZI8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=q5GwS20v; arc=fail smtp.client-ip=40.107.220.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="q5GwS20v"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wOIsZkIcxFqJn2jgz/G1S1Xc3lFvv8oY3mOF3LeWJqyoHLW3Y/YnBkrKzbevwOekWauvMAdfKoFj7VpLWUOrzqnZdndHOgR3gNwTx8099o1KwPRxvhuB0BqOFOPfiv5MI0HOfdsAyF+MQLM5D5deJHWRlb22z8+wpq1dRJsqMBTeJq8Dt+8efVAgZ9B9Y8kpG5azxeWMGcw7MWxQ98w0H6XjbIKvgG4YWzXhBChb11On1EmttiDTzqo64FmfjDNCwNk/NDxKTJ2C/KahMLWPmXMahbYJsKgTPT6E4DT2DsaxdHQnCaZYkZrR4l4ae3MsteQO3UD2cQlLCx5CpnycYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SfIW+jIf2IfRmC1cgqvf1rBSjR7z5LFXW9RYSM4dVqw=;
 b=Ie+9tl45L4pRpwjev1xJbuJouET7xL8j7gW+VUeZXWkLfBovyqchSUyq1gAjWAOzi+0WQY45hP7PczAYlfI0DNcJuZHRQx65fAA9I59g01UsqW4HUkqUhvcBMY14JffQ+o1TCAMf+xnsnbKFbu0IPJACtGD8erL2TaIBRKiIP/+wHEaSiB2Y483o5Av695w+5G7KsXwC1w5hrwjI1rtpFgi+t2+AZbEZ+LjajQGjr7gknIeU/RgK1yOC9ur590dPFGamVIZaHZsKNz4drA1In2ukLQPkmUZXVcoZT64u7kH4sZ+07NCCn7oiqFQp5WEBMX5+WoIcpy4Go/ytw0hLUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SfIW+jIf2IfRmC1cgqvf1rBSjR7z5LFXW9RYSM4dVqw=;
 b=q5GwS20vAaWxgOpAlS8OHAsvqj6fzA/DlSkn6ev7Keipjv70nDj1jRTgxfJU4MJENa16cyL0M0TTOul+w6N/BAUVISApGVCp0/uvTLElJYBn8BgoJpFKS0pZ+sZ4Kw0t8PwvJTO+/0Gg1izBGYFvnJfCjvn/oH2B1jWMejUHNUM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA0PR12MB7477.namprd12.prod.outlook.com (2603:10b6:806:24b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.18; Sat, 21 Dec
 2024 14:04:54 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 14:04:54 +0000
Message-ID: <6f42b6c8-bf7d-4c20-b6a4-113b3d9ac817@amd.com>
Date: Sat, 21 Dec 2024 08:04:48 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 19/24] x86/resctrl: Report "Unassigned" for MBM events
 in mbm_cntr_assign mode
To: Reinette Chatre <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>, corbet@lwn.net, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
 tony.luck@intel.com, peternewman@google.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com, paulmck@kernel.org,
 akpm@linux-foundation.org, thuth@redhat.com, rostedt@goodmis.org,
 xiongwei.song@windriver.com, pawan.kumar.gupta@linux.intel.com,
 daniel.sneddon@linux.intel.com, jpoimboe@kernel.org, perry.yuan@amd.com,
 andipan.das@amd.com, kai.huang@intel.com, xiaoyao.li@intel.com,
 seanjc@google.com, xin3.li@intel.com, andrew.cooper3@citrix.com,
 ebiggers@google.com, mario.limonciello@amd.com, james.morse@arm.com,
 tan.shaopeng@fujitsu.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, maciej.wieczor-retman@intel.com,
 eranian@google.com
References: <cover.1734034524.git.babu.moger@amd.com>
 <2b59ada547e0444755201f269fc99240b3195e1f.1734034524.git.babu.moger@amd.com>
 <ec3c179b-87b1-4afc-b688-618f980584ab@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <ec3c179b-87b1-4afc-b688-618f980584ab@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR16CA0050.namprd16.prod.outlook.com
 (2603:10b6:805:ca::27) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA0PR12MB7477:EE_
X-MS-Office365-Filtering-Correlation-Id: 03a35937-68f4-45e9-ee66-08dd21c87175
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NzBKTDFudzZiQVdGYW1XazBDVG92WVhkeDVSdWVCQzJONWpGL0NMQVQ0NHB0?=
 =?utf-8?B?dXppanYyaEhOcnNmajdwRjBkOUg3WjVBSXRDbnQrUCtTVWh4K1lCMWRYT2lT?=
 =?utf-8?B?K2RiV280bmExMVRQZTZCZlNiVnFCU2tIWmdoSGhrMmVXc3VEQ25TbHR0ZVgr?=
 =?utf-8?B?cEhBYlNHUDRKNWdoVW4yT2s2am1YOCtwVnhxbXFuQ3k0VkFyKzJ3dEZlOHNE?=
 =?utf-8?B?cUhNSE9kTFAwRStCMDNzd1o5b3lURkRJWWRFaElhOWxFRVlsWGNyL1hUSjB1?=
 =?utf-8?B?cmR5eEI5ZHIvc05PeEJWVlE4Nlo3NFJvZWFBTzJGNHBIWHVoQWRqdkFTZTht?=
 =?utf-8?B?d3RmOWdnd1U3elh1MUhhcFZhd2Jna21wYWQwdlo5eGs3ZWtJRGRlcnQ4RnNY?=
 =?utf-8?B?bmJrRzNQRWpQd2N1Z2JQM1BtRjB6R2tpU2ZNOGZDRHVHSGhac3liSEpzbXBr?=
 =?utf-8?B?dFIyYlhrNSs0NHZJM0ZGZzhYYzlvdFBUa3l6UnIxbk8xWktPVUR0eFEyaHpy?=
 =?utf-8?B?cGRYYmRzZzBkalFkdllMS2FUbDRwVDBZWk1rM0JVYjRsdlNFODA5bE5wL3o5?=
 =?utf-8?B?Ykt3UXZxaUtCMmhWUkVYTU0xRXRQUkorZUMvUkpxN1FoT3BTck1TeVNVUXJs?=
 =?utf-8?B?TlJudVlZT2ljVmZMMDBkTWR3ZEFlZEVoU1llRjM2Q3d0NUpUZzEzaUdrNUxJ?=
 =?utf-8?B?K0w5MnB2R2l1TXR6blc2L3k0MTBXYTZ3bE5ORW1TY085NnJZYTBOMkJmU09X?=
 =?utf-8?B?SjMwVUJ1ZzVSOVRweWVyUU1qRHpaMUV0OEEremNMY0UxK1NpcEJhT0xCUXJJ?=
 =?utf-8?B?UWNZMHNReGx4NWpieHg2MDQ1eU5PUmhDY3lXdkpTNlBOd0NKeVVjSVM4VCtz?=
 =?utf-8?B?UGJHK1MxMmZmREwzY2F0YjZ5b3BkdWoxSmg3enkrTW1OK080YjkrUkxxQ2hx?=
 =?utf-8?B?a2kvR0JtVFlSU1RrbzV6Y3poSXRIMkVYN2U1NmlzUXRobnFFR1Z6SVVuNitu?=
 =?utf-8?B?OXFOZHpPMDNSYU83SmEweWpHQ01hYmhqWUlNazBrWStOWXN1SDEzMkJCWHlp?=
 =?utf-8?B?am5LS2x0ODh5T0Fmdyt1eGpEMEJYT211aWZEMUtvbE9FV3FCem5ybDRqc0Fz?=
 =?utf-8?B?SXJVK0pZdUxRb2pWYlFqanJwc3BSMlF6TDZZQTc4ZHJtL1Z0WGN0aDl5eXhh?=
 =?utf-8?B?R3ZCbFNZRXVxa3ZTWmYydXFMWFgrbGl2VkFlQzQrbEUyRFFrL0ZYbkozallx?=
 =?utf-8?B?THoyclc3UFppcTBxMHpkNlh0dVFmR3U1dzAydDA2U1VMUzNCT0xSOExkdmJk?=
 =?utf-8?B?L1hsZktXZ0IwN3NvSGVBWUlvaC9lOEc4bFlBYTNSaVN1TGFMazdtNUdpVnNT?=
 =?utf-8?B?YjhYamRvWTEvVld5VElBaXUrZEtYMnptRE9RSGNyWlVXMGlrTTZweXpBZkxn?=
 =?utf-8?B?Tk5oRVpnZEdKSzZTbElaQ29kN1RyNXFJMjdNVE1zd0VQa3NEM2hEQVNoVC9Z?=
 =?utf-8?B?MHFBQTVPQTBGOFBiMGI2Y2dNYVNqRVlQUHRwb2dUdHRralg1S3E5VlhLeUpO?=
 =?utf-8?B?bnAvMUpNOWxSUWl1YVVVWU16QU5hSEduVGV6bjRNaW5XK0JpSTdmZ1NCMWRD?=
 =?utf-8?B?T290aUQ2cHMvWFdmZ1htUyt4bHNIZ0NIdGZwdytYMUtsK2Q1UExyL1JjWVEz?=
 =?utf-8?B?VnhWTlpaRVJZeDNVZzAycWNJa0k2WWdlb29sQkordGwzN1NrV29CemNnWWgv?=
 =?utf-8?B?c3FqY1lMRW9XVnRUSzg1WFBGWXJHbmUwcWs3TWNldCtCMU81bk0rcGU2ZitG?=
 =?utf-8?B?Nzh4ZFc3empsazg2MVNjSk5Vc0IwYzloK0x0djlGTG4xN3g0NGZDTTBsQW5p?=
 =?utf-8?Q?9tGbM+4nmxu9l?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TXArU1RiUzU2UGdseGFGazZjYkdBS0MvMURSaW1GWHp5Y2RMUWxRNWMvWFRh?=
 =?utf-8?B?U2MwVHFjb0g2VjJWMStjLzN4cFJNaFlVSGtyakI2M2JFdDFXSzJkTm1RU0hr?=
 =?utf-8?B?QW9UM1hEdU1xSG5vN3BiVldFMzZJMG4zME5jZ05FaDFoVVA3cXhDclltdVVL?=
 =?utf-8?B?Yko3V0RJcGtpeHlVTWE4cXhFU0I5a1dldmhleTNsZWF1YkVDSVgyOHozYzVX?=
 =?utf-8?B?amxwM0FlSUxQUUFEaytiM1U3S0Z6cGo3S2dudFZudlBzMU9PdGtoY1VXOTVM?=
 =?utf-8?B?a2RKaFVlRk0vQUVoVElLWWtzQ25nSXVleDJlMUs2VlYyLzYybGtTM2liRkEy?=
 =?utf-8?B?NDlkcktGckVvelJKdE1CbHJUZTRINEpYMFZBS21iaG5BMURGK2VjTnFGOWY2?=
 =?utf-8?B?Tys4akg3RlVYMWNZS1RiMDhVYVJTL216eUd3ZTMydDIwQVdQcElFSk0rVmNq?=
 =?utf-8?B?UjlGL3U2NENHb0tKK1BpSldaT2hpZUdnS21EUUg0RTdMK2wwVTUyM1dKKzl6?=
 =?utf-8?B?NHhjMy93V2l1NWJLS3NneVhWQXZhL1dJVTlJMVpXY21GQ25OVmNRQUlMWVBU?=
 =?utf-8?B?WlZ1Ykg1VXpnUVBrL0NyRHd2Z0JLVTVoRUZMTEcvVFQ1U2t1RUxGdWlWU1V0?=
 =?utf-8?B?YTdFR1Q5OVBaWjNmM0t6YkNnNFphL1lJd010U3loQXl1czZLQm1rZ0sra29U?=
 =?utf-8?B?cWJ2Qkcyd2JBTExJRkltRk82b2RFUlY2MU9WVFZZSVA2NDRpZnIzcnNNLytq?=
 =?utf-8?B?NERZQUJsUEhobHZKK0RzTjlaRXJobGtCZ2QwcG4vQmhNWEl5VlUxK1Z4K2Zp?=
 =?utf-8?B?OXlhUmJ1MlFJTnVieVpZNDUrNU4rYUNPZTM3WXhnNTBlR2g4YURyRnFXOFQv?=
 =?utf-8?B?RERFd2NhWmJQVE8vNkNWSVhvY04rWG1zSGZseElqVWg2UDgvSjhNL1F6OGpP?=
 =?utf-8?B?RkhRejBQcXUxaUlXU1BNNldtYnVtdGRudWJOL1BzamRFNDh5NWw4MHV2Qjdi?=
 =?utf-8?B?ZkFuZS81U0VRc21wbVBPdGFybUJxMlVMTHRTV2VTelNDZ1o5Z0t6V3ZhdnlP?=
 =?utf-8?B?aDNzQ29RMnlybForN2dQSnJqbG9qWWVValBpWTdQY0ZUQ3lOSnk3WnVEU2Y0?=
 =?utf-8?B?UkpNb0k5dTJlNXhhSThSNU9HSVBKcWJFRGhxZXNqQlp5QzdiMlFwUjNnOFFC?=
 =?utf-8?B?eDZpNldSMUhaZStVeTFydXVBUWkrQzJ6TFk0OEFoSWVPSCsrMkFNN0JobG54?=
 =?utf-8?B?VGRVNURuSXQvVlZ6d0d2WXBvMzBiNTdGbFN4RndQdVJDaGNhcUk5czJTSU53?=
 =?utf-8?B?RDlWTUN4VWdXUEs3bjJOL1VJWUZvaHp6ampveUxMVUV4UUlVczl0aU5HRTI5?=
 =?utf-8?B?aXJxQnZDdyt0UlZGL0hSRXhDNFBZMGwzQlBrTW9HK1ZkbmExNUx0NHpsdWsr?=
 =?utf-8?B?cHd3a05nN3NiSFM3d0ZSZjZKVDNTWjlmMXJFNFpheFJkNkZGY21VcTZUdGph?=
 =?utf-8?B?QXNlK0JWeDlySUNNUFFlcWRFVXcwd2RuWGhVbEswLytHWGpQRENraW16aElS?=
 =?utf-8?B?ZnpuSk92Q3I5RjhveUpCcXM3V29YN3Q2cDgvaGk2cklQbVJjS2xaMzBZSmtT?=
 =?utf-8?B?cGxhT0h3VVJzQlU5UDBBSFJFd1VTV1JzZU5Rc0FlbzJ0V28vdmpvM2s3OUZu?=
 =?utf-8?B?STNrME1mbzBvUTE2dm9uTmZTT1hsdDZMVVZjQUVhREpFWjlhYUwwdlJueVFr?=
 =?utf-8?B?WVR4U3RlS3BkZWhNRjk4d2NLa1dqWEJyTXpUWFZPMGRmb0IvTnNSREk2a3pL?=
 =?utf-8?B?V0xBVXFhdFRqeHVoTjNsc0x6TnFObkFCWkpGQUtyU2VMTzU3TlV3Qk5Mbjh0?=
 =?utf-8?B?U0FzRlE5TjBaSTBvYW9pUldEYTZCZks1OGpBT0JvOWRRR1p3Z2RES1NXd3lK?=
 =?utf-8?B?c1hHMG92eDdYclFxS0lFU1NHazBTV0huVVkxSGxqMDJxTXVRaG5kRytMNjBi?=
 =?utf-8?B?OUpIWjl2RjlvdWh0RGpnR3RQaHFHS1lhbCtwYjVDR0RIT25uTFdFTlczaVBo?=
 =?utf-8?B?WFhLaGhJSVNaL1NBRTZoMnJidmhaNU9qN1pNakxXWDQ1SGZwdWlIWGY5UGMz?=
 =?utf-8?Q?vdGPwsyzspuK3yj90f2/ZMk1C?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 03a35937-68f4-45e9-ee66-08dd21c87175
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 14:04:53.9974
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UztwUneRVXYh+KhfIZvlrMWcEKHD3Hx+VFohwvaZ8pPQLqlXZxpkdD8ZukXDMZlk
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB7477

Hi Reinette,

On 12/19/2024 5:59 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> In mbm_cntr_assign mode, the hardware counter should be assigned to read
>> the MBM events.
>>
>> Report 'Unassigned' in case the user attempts to read the events without
>> assigning the counter.
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
> 
> ..
> 
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index c075fcee96b7..3ec14c314606 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -430,6 +430,16 @@ When monitoring is enabled all MON groups will also contain:
>>   	for the L3 cache they occupy). These are named "mon_sub_L3_YY"
>>   	where "YY" is the node number.
>>   
>> +	When supported the mbm_cntr_assign mode allows users to assign a
> 
> "When supported" -> "When enabled"? Or perhaps just drop that and start with
> "mbm_cntr_assign mode allows users ..."

ok.

> 
> 
>> +	counter to mon_hw_id, event pair enabling bandwidth monitoring for
>> +	as long as the counter remains assigned. The hardware will continue
>> +	tracking the assigned mon_hw_id until the user manually unassigns
>> +	it, ensuring that counters are not reset during this period. With
>> +	a limited number of counters, the system may run out of assignable
>> +	counters. In that case, MBM event counters will return 'Unassigned'
>> +	when the event is read. Users must manually assign a counter to read
>> +	the events.
>> +
>>   "mon_hw_id":
>>   	Available only with debug option. The identifier used by hardware
>>   	for the monitor group. On x86 this is the RMID.
>> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> index 200d89a64027..8e265a86e524 100644
>> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
>> @@ -527,6 +527,12 @@ void mon_event_read(struct rmid_read *rr, struct rdt_resource *r,
>>   	/* When picking a CPU from cpu_mask, ensure it can't race with cpuhp */
>>   	lockdep_assert_cpus_held();
>>   
>> +	if (resctrl_arch_mbm_cntr_assign_enabled(r) && is_mbm_event(evtid) &&
>> +	    !mbm_cntr_assigned(r, d, rdtgrp, evtid)) {
>> +		rr->err = -ENOENT;
>> +		return;
>> +	}
>> +
> 
> hmmm ... d can be NULL here after the SNC support. Since the file that needs a
> sum is essentially software backed I do not think assigning counters would
> apply to it (but it may theoretically apply to the domains it consists of).
> I think it may be safer to just move this check into rdtgroup_mondata_show()
> where it reads data for a single domain.

Sure.

> 
> I am not sure if we need to change the documentation because of this. One option
> could be a rewording to "MBM event counters may return 'Unassigned' or
> 'Unavailable' when the event is read".

ok.
Thanks
Babu
