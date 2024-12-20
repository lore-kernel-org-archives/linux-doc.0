Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2080.outbound.protection.outlook.com [40.107.223.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A4AC215F43;
	Fri, 20 Dec 2024 15:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.80
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734708693; cv=fail; b=Q+8t/A3UKn2GENGeEVtpRQKIywvbQ4WXyjZGbuoeOYECw0gVDvqsYpzfMYMT4su726EHzspExx/08F0LeRIYWSE/80gf1blB/V3a6r1X4maFLiwyuUCPV8hhpU37v6jbXGB5owUneER6MRci2tHFNiI/wnz9KAASTgbjhMGYWZg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734708693; c=relaxed/simple;
	bh=5diX8p3VaSyQiq64burYQFrRev5dR2ZLP6k5ZScMxO4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I2i2SfVpFt0Yh8BpBm+YLetqUWwdAi2PBQ2B8KV5anHZtBWLEjos0g4riNgNjHgrBIwVb2ZCpkoOzF5HzNoAnFROJBDDBn90JBP2xRbKqwcEm2FkPivsXp/aIKTUVu6tx6VWwlnIvd2VCict4tZLQibzN1Nldl5zUD/oHpHq558=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=pEY535Ek; arc=fail smtp.client-ip=40.107.223.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="pEY535Ek"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HE7gikGfbWFmoE5AITK/dVD1LeDfW+27GSS7dtsRQIuJPiPjiSIY1HMe2fE77ihrmkov9laWJurnj/omf7c+XdFQok4W8GJaq93Ku9nghj0sVew8h0JPuzlebaPTG0esyNupQdSjTkGhBvleEmsqHvnBxVhA6BobeWkz7mUMT8/JhUbJy+66K2tuSc8M/AQanxILussf6BEPhx3Pj/sxax1eFfIVC3Rk2XNwNS75J2g84d2NNbw66qHJVEWmbehfDjYveAYdg0MxbcmVTGXrV+scNU+s8m/hKXZzw+LnPQnQrtUWl2c0p7gzlKi0Sl58Pp/G8qJIWwQ5phHX+uqZDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aDmw3VeFXYhG09+w7EwgM7UIwBZ7XXQNosNwm+qYs+A=;
 b=DmtBeb1XxT71Dtl7+IC/2BGdsZNup+OtvMV3VFKH+FqauuPUxK6uxQA0VxKOPrsduA+gycHBSQVl0R6gbIoYvN8GHVCg2K68rw5CMjm4jZTnIuD6m0C4EZLIiv/ALG5W2EIXdGu9G8dz86T5IzicH32rEvc46un5wN7dg4Fj1e59uL0aXPxGPeGrhBm/ckNfiBrp1t4frGIrgw1Rfj5WNfwGXiswD4uuQFxp13UaZRYHRLFp3GjqXh5YERDGb4Fv8rZ36e7Jw605yHvTjMoOlwOYD2UUGDKWBzgh3Grxmdnx7yd5mza5YsM2yu3V+KqgK1kAJ8iBRsAQA5xvkrsaCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aDmw3VeFXYhG09+w7EwgM7UIwBZ7XXQNosNwm+qYs+A=;
 b=pEY535Ek2ahJ2rUCC0QlHI4WjwmfUyy4OQmUuBEXndSzAhz5rnY1KkLuaLmrgQBvIH3T0ZeszZM0DbTKyxxghkWK99ocxQPihqygMgkRs9EisZGDVHaMzRPT9hWilm9J/JQowM5+G8Dexfge6r7lLyvi9rdD3AuScdh1+iu2f7o=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by DS0PR12MB8270.namprd12.prod.outlook.com (2603:10b6:8:fe::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Fri, 20 Dec
 2024 15:31:22 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 15:31:22 +0000
Message-ID: <69638aac-407c-4691-91b8-7ef4ed212db4@amd.com>
Date: Fri, 20 Dec 2024 09:31:14 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 08/24] x86/resctrl: Introduce the interface to display
 monitor mode
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
 <28399c9a82b771695181e8cb69d9c21847ff4c9c.1734034524.git.babu.moger@amd.com>
 <609f0d7c-55bf-4cde-a1ec-2314e353a0f6@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <609f0d7c-55bf-4cde-a1ec-2314e353a0f6@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA9PR13CA0116.namprd13.prod.outlook.com
 (2603:10b6:806:24::31) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|DS0PR12MB8270:EE_
X-MS-Office365-Filtering-Correlation-Id: 64cdfa3e-3f0e-4c0a-152a-08dd210b5bd3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aERCWGIwSmozSTZQKy9CVVUweUIrYVNRMkkxcjdHSEUrb1Ruc1RqT0FDVldJ?=
 =?utf-8?B?Q3dZY2xKZEZzQURoYVg0U05tc1crY1FlRmVSc3NEUGR0WmJtZXRxS0l6Zm9m?=
 =?utf-8?B?emZmTEFWbXRvS0FTUXFGM0Z2dGJmQzlSd29OSFVndDN1T0pVQ0FzOE9Sa1hi?=
 =?utf-8?B?enVHVmZVVUpHQnlpYjFYQjVRNnBGNUlVL0ozQlF3T3doQVNaY2wwM2lGVTFF?=
 =?utf-8?B?NmZSZUdwQVVvV0NSYm1XWGc4elhZTHRpbnRyNmthV1BDVlRYWFQwczdNUm4z?=
 =?utf-8?B?ZE10UXNCeXlUSnRlMjJTdzE0eUN1MUVYamw5M2tvOVpCWlRwM1ppSzBBM2dE?=
 =?utf-8?B?UVBwazlqVjJ5VDV0ZjRFMFJOTEEzNFVrSDlRYlcvT0NGb1B0VnZhbUtsaStP?=
 =?utf-8?B?ZWEwMXZqWlJDdWFVb2lvaWN1OHE4YlJyUmlOKzU2OTBRSFRWSlVKcWpMdEhv?=
 =?utf-8?B?VWVqVW8ySHgrSUtXL0FSSjlHa2RxTFVsNDQ3NDB1aXYzTyttVjJPUlJDMFp0?=
 =?utf-8?B?bHd3azAyK1ZJRjhOMGMrWXVmMHBWSDNORmd6RkY1R1Nlb2RqMUNRMXZRcXdz?=
 =?utf-8?B?VlIzWDFrWkRkZWtlcFBKSTVCajdtSTFDcVBqWndFc0VnR1pqSGlnMmFPYzZo?=
 =?utf-8?B?YU1DNGlCNmNvOExucWNTNG9IOFovaFA2TUpJcXRraW1zK0dwaWIwTFZqSXFu?=
 =?utf-8?B?ckZSNlRQaktzMnZIcEZRVWE3UU9JbTZZVzNZM1I1S3JBUGEyczlnWGMzNVlW?=
 =?utf-8?B?VnVuYnFzUm43VTRqUWhHZllWVVlxbmhZc0E1RXNSYnZvSzU2UVRvdDRpMlBl?=
 =?utf-8?B?dHFQVW00MnV4b3M2cFUvOUFzMGFtdUgxTzRFUWRJZFNXWHF1VkFXSFV4bzV5?=
 =?utf-8?B?czAzOVpPTSsxWmpIaHJXTlJzdUlpWm03WW1iMzMzMGVvMkNzaXFpVlZaSWlR?=
 =?utf-8?B?NERrbE02bEZ0dEM3QWg0SWlOY3lqa1JpMENBWmNUT3NLQTdhdVlvS2lzMW1R?=
 =?utf-8?B?M3grOUpLMWs0SnNPMjBEZjJLNFBJVXAzUFgzYTduekdzdEFZL0lBNEtGdjVp?=
 =?utf-8?B?TGlId2ZFa1dSWUJxbUJmZGZucDhKcTNqM0FiaWRLbWZlT0FOVkVEOVNTamJ5?=
 =?utf-8?B?V1JBbjVqNVovMlk4dkhMV005WVZFajFGVnZSL2ZDeHZGSVgyWm9FWVNPMG4v?=
 =?utf-8?B?RUtqSzM1aEk3NytrbEVaYXM4SU1GaFRLVTliRmF4YUpjSkpKZ1B4dExhVDF4?=
 =?utf-8?B?S0hhSHhUQlBSYUlwT2RabkNBQWpRNGdGbmZWOXV3QXY3bDBjaGZmekF6ZDJu?=
 =?utf-8?B?aFFwcXhuVVBzVE5ORit0bFFGUjNScGY0b05oTkVkQXhtVVRrMDFMcS9uaU91?=
 =?utf-8?B?UEg1UXBwRHlnak9HcEZJVXhRNmcwaEpWREsrQWhDTU05bHdocUpKM3o1bzV3?=
 =?utf-8?B?WFZOUHovVUFra29haUtFSHltUFRTd0ZubDY5NWVabUwzNjROdklNN0RRVFVv?=
 =?utf-8?B?N3JmRnVaei9yb2NIUUdUSU5MQktPMFMzUitkekN3NFFwdlJnQkNuYlljTHdi?=
 =?utf-8?B?Tm1sVEMwY2gwb2JWWVAvaTY3eDRRNVlHTmFqdjdyU1hKN1RKUXdKaC81c0p1?=
 =?utf-8?B?bDVzM0ZyMkR6SEl5dWVReVRuejBGZ2U3K1dqOHBXcExUbmpVcEd5ZkthNVBI?=
 =?utf-8?B?RTlNbjd1NWhycWQ4UDdkc1R0R0ZtZ2hTN0ErUmdHN3laQUxhbERSNVFtcEpV?=
 =?utf-8?B?U1RKcXd0bktnWDBRY05xSTY5c1VZdUsrcUJKNUVPSjNnS3U0UjJwRWRrenNt?=
 =?utf-8?B?RmJnVzY4NllNWFZPbUx2Z1ZCdFJaa3pYOTM4VWV1Q2wyUjFnTFAwMmZHK29a?=
 =?utf-8?Q?jHIivzMTbG3dx?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Z3d1bVFXMDdXV2JsRitRWUVna3hPdWRyV21DUVNLRlo4bHh5WTJ3bnhqcERk?=
 =?utf-8?B?NmJSSFNsOTFQays2RGIzTWNnMGhkWE04dnVtLzhxNUIzSTh1UWZJZDVwT011?=
 =?utf-8?B?SzFtZ1lYUjFReFpmdFFJNU1WbnYveWczVEd3NGZFMEpQa0loUVhLc2NhT29Y?=
 =?utf-8?B?eEZ6SnBTMXNFZlM4QkNVNzFVcmhBZndzWWM3S2RydC80RGhGVkdLTWdXb3FL?=
 =?utf-8?B?ekEvbng5T0VoVUdlWlN4bUliVjVKQ3AwNWVqalI1WkJGckg5eFB2L2RnVVZP?=
 =?utf-8?B?Q2xmOUYrTE5ScXlHQWcreGV6U2w4d3BtUjdsV0FHN1NscHlvK1YwbFBaQVh2?=
 =?utf-8?B?Vzh0N3Q3YmdDaGNHSEthQ0Z4WWtUbE8rY2o2cHVTK1UzQi9qaXdEWTd0OE9k?=
 =?utf-8?B?NzR3dFdRd0kxY2ltTlhlc1BlSGp1SGE0RXVOWGpDb1VPMlNtVDlCczhKZnVV?=
 =?utf-8?B?TkJlb1hxVVZRRTRmcGpBR3VkMjJ4bmxmckNXb2U4b09vZlNTS2JQR2xseFps?=
 =?utf-8?B?dVpJRlhqMFdzd1doOTMzaE8yelNSeDRLc2hWTDBNV2kxTmJ3OXRVQVdLcmEv?=
 =?utf-8?B?VlM1RnVXc216b1NiRGliV3pmUndpMUU1eS9xeWNvUjMyL1piVDd2b2VsZkRC?=
 =?utf-8?B?Y1cvVHl5ZjQ5WFdRb0RxcnJ1cU96T2dRY2tUdEZJSndISFhnN3k5QUZJTWhK?=
 =?utf-8?B?YVdjbkZaTTM4U1ljRm9xdVc4bVNneG9JZjdUUmFzNVlOT0lDMlhjWm55d0h3?=
 =?utf-8?B?ZkFlaW5jTENXd2k1Z2t4dWtaZXhPQ3p3TEloM3YrdkJ4c3pVRFRxSFd6VGsx?=
 =?utf-8?B?akNwcUhjTTFVanp0SFdqR0szRDhHMTNhdG1EZ0p1VTQxSGVlbmRIUUYvSDVx?=
 =?utf-8?B?ZFhSM0k0cm5WUXFoM3NVYWx2cW50WlFwellpTkJIYkxIQ0tDa0UrdWN3QTZH?=
 =?utf-8?B?dGRKRFFSdkxLYkY2UVlUeDh4Yjgzd2Q3WW0rcnN6aU02Zis5VjlBU2NZZ2pn?=
 =?utf-8?B?R1ZrZ1FUUlpQMyttOGxRZ1V2eUFGL2RGNTVDd3VTWERaSTR5aG52dGpzRGIr?=
 =?utf-8?B?VG4zN255N0hMWWpyR2JuZTNCZG9JSnRVMXpzNFhVV1lUeVROcUc4OWNkUi9T?=
 =?utf-8?B?dmpEd0NUTlZmajdPaStqajFlSVNLOXA5aEkvSEM3OGY0Z3ZvZTQvUmtNdlU2?=
 =?utf-8?B?R0tVVTZzQmJITzJvclpwb0tWTXdYSUk4bzBUalN2eHk5dE5lOWx0ak9hVlJs?=
 =?utf-8?B?ckVnZGtlcE5BK1o1Z0xxU3cxVlFMRW8rTUZOOFAwRVc3UVI4bDJ0WVFHOGla?=
 =?utf-8?B?c3pDUWdBM0VWOGlPbjF2S1NvYXVTT3hGVWdCOTVlYllvNXM2b1E0MUZhT0FH?=
 =?utf-8?B?VllhZUFrOGRkbUJmcFpyMWVjQ0p3QmwrbjEvOWNvdXlpMmsxRGFtc3VEUDVn?=
 =?utf-8?B?Q0liNnJySm81WlpRSVhmS0dNK3J0VlBLL0ZMcHJRVzY0VHpmenRKTnM0eUZy?=
 =?utf-8?B?YlNPdXNtSHlzWGMxNi8wUDZMbmxrTnI1cHU2bitWRHFjc2s2OFBGY2hhRExm?=
 =?utf-8?B?dnBrQkRNLzF2SzVuekdnVnVIa3RYbTQwOWJZSTFkeFJ0VWxNRHhCWEZ2QmhM?=
 =?utf-8?B?c1dGNnp3eERDS1ZFZHZ0cmRpZ2dFdDBtdDBURXg2eWF0M0hCVXVyNE1JTTM5?=
 =?utf-8?B?bzNvblY0Q0NxRjR4R2RHYTEvYWVVNW5jTEF0Q0hJem9vR2hFMDRLMnU0V1pl?=
 =?utf-8?B?Uy9INTJnL3UxV3FsS3hEYkNMakV4ckp6V0d3NW5NZHhxdE9yZ1RSQ3lNWmdP?=
 =?utf-8?B?YUNNSWJCbzhwdzMwRnp3Y1pPUzEycnVOVTRrV3NTUjN2eHhaU0txMVJmajJI?=
 =?utf-8?B?OVExN3VMVEFxZW5HUVNZbzY0UThlaklNcTNjcEk2eS9ZeTN5MlBGcUU4eVJE?=
 =?utf-8?B?UWwxbDRXZ3hsSXgxdWdXcisvZ0IwcUpLTUJvL25yNTdybjJtNkJyM1lWMFpO?=
 =?utf-8?B?bjFKd1k2cGhqQTZ3amgyZzhDcEZRSXowZXptalFvVk8vbmhRelA2RnBaWmhh?=
 =?utf-8?B?TE05ODd2T1BEOVR2RkFsWlVqT2ZxYUdFNXltUzNlMGQ5bTR4dFlISTBMajZv?=
 =?utf-8?Q?9oPk=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64cdfa3e-3f0e-4c0a-152a-08dd210b5bd3
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 15:31:22.7845
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vEItQOBCa6panPOWRFZSjXnd/IG/NjlYcTre/F10EQbknXyU713jIKIEhbi+EHEY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB8270

Hi Reinette.

On 12/19/2024 3:59 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Introduce the interface file "mbm_assign_mode" to list monitor modes
>> supported.
>>
>> The "mbm_cntr_assign" mode provides the option to assign a counter to
>> an RMID, event pair and monitor the bandwidth as long as it is assigned.
>>
>> On AMD systems "mbm_cntr_assign" is backed by the ABMC (Assignable
>> Bandwidth Monitoring Counters) hardware feature and is enabled by default.
>>
>> The "default" mode is the existing monitoring mode that works without the
>> explicit counter assignment, instead relying on dynamic counter assignment
>> by hardware that may result in hardware not dedicating a counter resulting
>> in monitoring data reads returning "Unavailable".
>>
>> Provide an interface to display the monitor mode on the system.
>> $ cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> [mbm_cntr_assign]
>> default
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v10: Added few more text to user documentation clarify on the default mode.
>>
>> v9: Updated user documentation based on comments.
>>
>> v8: Commit message update.
>>
>> v7: Updated the descriptions/commit log in resctrl.rst to generic text.
>>      Thanks to James and Reinette.
>>      Rename mbm_mode to mbm_assign_mode.
>>      Introduced mutex lock in rdtgroup_mbm_mode_show().
>>
>> v6: Added documentation for mbm_cntr_assign and legacy mode.
>>      Moved mbm_mode fflags initialization to static initialization.
>>
>> v5: Changed interface name to mbm_mode.
>>      It will be always available even if ABMC feature is not supported.
>>      Added description in resctrl.rst about ABMC mode.
>>      Fixed display abmc and legacy consistantly.
>>
>> v4: Fixed the checks for legacy and abmc mode. Default it ABMC.
>>
>> v3: New patch to display ABMC capability.
>> ---
>>   Documentation/arch/x86/resctrl.rst     | 33 ++++++++++++++++++++++++++
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 31 ++++++++++++++++++++++++
>>   2 files changed, 64 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 30586728a4cd..1e4a1f615496 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -257,6 +257,39 @@ with the following files:
>>   	    # cat /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config
>>   	    0=0x30;1=0x30;3=0x15;4=0x15
>>   
>> +"mbm_assign_mode":
>> +	Reports the list of monitoring modes supported. The enclosed brackets
>> +	indicate which mode is enabled.
>> +	::
>> +
>> +	  # cat /sys/fs/resctrl/info/L3_MON/mbm_assign_mode
>> +	  [mbm_cntr_assign]
>> +	  default
>> +
>> +	"mbm_cntr_assign":
>> +
> 
> The text below jumps into usage with assumption that user space already
> understands the feature. How about starting with some context? Something like
> "A monitoring event can only accumulate data while it is backed by a hardware
> counter."

sure.

> 
>> +	In mbm_cntr_assign mode user-space is able to specify which of the
>> +	events in CTRL_MON or MON groups should have a counter assigned using the
>> +	"mbm_assign_control" file. The number of counters available is described
>> +	in the "num_mbm_cntrs" file. Changing the mode may cause all counters on
>> +	a resource to reset.
>> +
>> +	The mode is useful on AMD platforms which support more CTRL_MON and MON
>> +	groups than hardware counters, meaning 'unassigned' events on CTRL_MON or
>> +	MON groups will report 'Unavailable'.
> 
> The "meaning 'unassigned'" is not clear to me since in "mbm_cntr_assign" mode
> these events will (at end of this series) actually return "Unassigned", no? Perhaps

Yes. It will report "Unassigned".

> this portion can be dropped for now and the text found in patch #20 about returning
> "Unassigned" can be placed here instead ... but this should probably be done in
> patch #19 that adds that capability.

Sure. We can do that.
> 
>> +
>> +	AMD Platforms with ABMC (Assignable Bandwidth Monitoring Counters) feature
>> +	enable this mode by default so that counters remain assigned even when the
>> +	corresponding RMID is not in use by any processor.
>> +
>> +	"default":
>> +
>> +	In default mode, resctrl assumes there is a hardware counter for each
>> +	event within every CTRL_MON and MON group. On AMD platforms, it is
>> +	recommended to use mbm_cntr_assign mode if supported, because reading
>> +	"mbm_total_bytes" or "mbm_local_bytes" will report 'Unavailable' if
>> +	there is no counter associated with that event.
>> +
>>   "max_threshold_occupancy":
>>   		Read/write file provides the largest value (in
>>   		bytes) at which a previously used LLC_occupancy
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index d54c2701c09c..f25ff1430014 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -845,6 +845,30 @@ static int rdtgroup_rmid_show(struct kernfs_open_file *of,
>>   	return ret;
>>   }
>>   
>> +static int rdtgroup_mbm_assign_mode_show(struct kernfs_open_file *of,
>> +					 struct seq_file *s, void *v)
> 
> I remember this topic from earlier version yet I still see many instances
> of the "rdtgroup_" namespace used for functions that do not interact with
> resource groups. Could you please check this series and fix this?

Yes. Sure. I will check on this.
> 
>> +{
>> +	struct rdt_resource *r = of->kn->parent->priv;
>> +
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	if (r->mon.mbm_cntr_assignable) {
>> +		if (resctrl_arch_mbm_cntr_assign_enabled(r)) {
>> +			seq_puts(s, "[mbm_cntr_assign]\n");
>> +			seq_puts(s, "default\n");
>> +		} else {
>> +			seq_puts(s, "mbm_cntr_assign\n");
>> +			seq_puts(s, "[default]\n");
>> +		}
>> +	} else {
>> +		seq_puts(s, "[default]\n");
>> +	}
>> +
>> +	mutex_unlock(&rdtgroup_mutex);
>> +
>> +	return 0;
>> +}
>> +
>>   #ifdef CONFIG_PROC_CPU_RESCTRL
>>   
>>   /*
>> @@ -1901,6 +1925,13 @@ static struct rftype res_common_files[] = {
>>   		.seq_show	= mbm_local_bytes_config_show,
>>   		.write		= mbm_local_bytes_config_write,
>>   	},
>> +	{
>> +		.name		= "mbm_assign_mode",
>> +		.mode		= 0444,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= rdtgroup_mbm_assign_mode_show,
>> +		.fflags		= RFTYPE_MON_INFO,
>> +	},
>>   	{
>>   		.name		= "cpus",
>>   		.mode		= 0644,
> 
> 
> Reinette
> 
> 

