Received: from NAM12-DM6-obe.outbound.protection.outlook.com (mail-dm6nam12on2066.outbound.protection.outlook.com [40.107.243.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FCDE21B1AA;
	Fri, 20 Dec 2024 21:39:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.243.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734730745; cv=fail; b=m/J80V3kzaCFTT/E+q6MD3UfHLezKVpBMF/gA5Ma2MmqFo/Ky6woX5NSGhADmQKCIs0FkltNZ6sMAort6biAbHD0peBsBFIVvuHOx4s2JaJH9Va69g0iipHo92cGk8RNcm7gUz+hpjiBHmOdXw33qStog8jnD/Bg9k7Hun4Oxw0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734730745; c=relaxed/simple;
	bh=FzXDjf3BwzCpQSDnpsz/IaGHOQXSvRnPofHy12IlXcw=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=vER9uZMS83BzhlFTbYDwNDSC0IR5geJJPjuCUN4/5vkJmjIhU6LsngDEsls7kUHUDejiHfICBvq+eAxNosKvBcjmqfrPbd111IWyr+dDtRGHN2Mf5s5puX8Frxec+Ad6pepxfL1jZXda/Mfd9WqNSMRd4K3Y85rPnaWKtSgE54s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Z9luxFxB; arc=fail smtp.client-ip=40.107.243.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Z9luxFxB"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ahtYRT/YqabHW0nZZLeREivdRsXkkCH/1FrJuzGZXmxaQgTqk2Qj85gm/WM321+NAhZ3XtUANEHuRbM0DyNKou57pfEwkAhoUjLeFE6bMfYQWpCWmB5nvJDV4cnqnZp04b9AATR0j9U8lTlO8zkGLmCpLbfwTs25httRCNEzXnBKZNrmGyAphghxaVZ6NtZHlDtSog8pqsGyeufo3tl0yvXYel5VjV7Zte+IAErCBlVXlL7bggsnt6wJRgAHY63Ot5fIHW7JJ65AlzyBKGvbCs67hyiJP6n9AY8lIfQbauXxjO85Z0Wf+QlxyQ+dPeZfXj2QejK1FPR8VYBRfTcFWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OTeJ9R9OoNEZIon0MN1MKSKNurufB6L9KuLHqgcS3Tw=;
 b=xmLOkb8eoW8nZEt+vwugBpasYHUaqh7wd3OhiMl8/BHmumGeItO+pY4oOWvDB/KJAL6tvWyEbxCgBAz4wYrljF0sYd5BDH/8jBzE8pd2m/EmKcfSKWfJwN0wCW8cvsjHh9rseHrxySDVKsX859Gg+XspQ+e/PJCUg9rYM6/fsnRSPNhxOcndA3dEnnqn7pHeWuw/+IkEn2204oHwI23VhiQAZRMgIiEllAkURa8Fqv3pCWq3Q64H96EBScZDHZJCENmRrdHvDF6+alGq5MHJ4crQwGi9GD6GS4YH3m3bBtMLOEtk/fnePEg36G7tSvlmIXnuwC3rtNBwXgmiCSYleg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OTeJ9R9OoNEZIon0MN1MKSKNurufB6L9KuLHqgcS3Tw=;
 b=Z9luxFxB/C5LX9OXRgng7dREz67JzICmr3XF3DhD6MM7G9scIRdDNd78ihOQtQw/PUAD2xFwjrUp79YnfsnbpZsVvqcAmrBMpC+6K2CuLMszP0IBHJlenpmshT6Aor9n6uP22al6ByaNcscpoarECui+pmkjVl0kz6dF73aQc3I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by CH3PR12MB8935.namprd12.prod.outlook.com (2603:10b6:610:169::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Fri, 20 Dec
 2024 21:39:00 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Fri, 20 Dec 2024
 21:38:59 +0000
Message-ID: <f51e2bec-b530-4d24-a72c-a5e41c82e984@amd.com>
Date: Fri, 20 Dec 2024 15:38:55 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 17/24] x86/resctrl: Add the interface to unassign a
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
 <0619fcb4307f6d20d214980f61421825c67a969d.1734034524.git.babu.moger@amd.com>
 <e636c720-5651-410d-8efc-468ecf6e6aa9@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <e636c720-5651-410d-8efc-468ecf6e6aa9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN7P222CA0004.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::18) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|CH3PR12MB8935:EE_
X-MS-Office365-Filtering-Correlation-Id: 02243c10-dde9-4d27-7b88-08dd213eb6e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TVFGTy9JN2taYnBFUmkwdVYzQXp3cjRQMGZNRDF3U3Z5SjAxYmk2SzFQQmI5?=
 =?utf-8?B?WDRkYWE2R1BtRlcyWGkydTBBSEVBcGpIWThLNkxTM0wxQXY0OS9KOEh3MHVy?=
 =?utf-8?B?MFp2emFuNFlGRE56aFBSK25tQkxTdHBUSldKQWZMVVpicGt2bk9OWHVhbDFv?=
 =?utf-8?B?RjliOGRyWk5Yc21GQjVZQlBKMDRpUS9qb1YxM20xVlo5aS9aZ3ZiWVlMMHJq?=
 =?utf-8?B?S281cGRxc2t3WVcxK1g0Ymhkd2J0dzVOWU40RUJHTlVpOVgxckVzZjFGR01R?=
 =?utf-8?B?VXU0RmVPbnpreWExRnNOL0ZNVDRReWlldU9PZXdDcHozb0tOdGQwc1lrdVFU?=
 =?utf-8?B?YldPUkc3N0FKV0tmK3luMFJZbVJGOUsvRGdZWXhJYzErV3M5ZzZWQXhmZ3BC?=
 =?utf-8?B?b05jem42QWpzQS9TV0xnVHlaNjhrck51cnI0NlExMU1oRDJLVkZNcU5BVUZC?=
 =?utf-8?B?c1dGQXlTdDRQTCtOM0piWG1nR1h0elMxUlYrT2UramFhMHlGMTAwcWJINTdz?=
 =?utf-8?B?a3VqRmJRZ2ovRDRST0t5Z29SdExYUmFWbnJYdm1GQUZEUlByTks1Q3lGMWIy?=
 =?utf-8?B?NURJc1dDNUU0NjhhTW9jbzZKaklQdnFKR1BNNzFxWGN6S3pOWUpxaE8zVTlp?=
 =?utf-8?B?TnBuNEVKWjhwV1A5OVRuY3ZMcGpHekJvRWdzVElFOG9iQi9DVTdQMm0veXpN?=
 =?utf-8?B?cUlpYVdDSnRZbmRrRStMQlNuL0hmSCsva2Q3NDJiVElUbkFLazBKK1BQVTds?=
 =?utf-8?B?eWlzWE1JZEZqRFNTcEJSMFFPVUVsVzBrM1N1N0RoaFhleGdTVWN0emdZcWdS?=
 =?utf-8?B?SGlOV21iK1lvM1p2M1NseVVJbUhPUXN4Tnl0VjMrRGhoY2RrK0ZwY0ZTTXdp?=
 =?utf-8?B?ektEVnFlYy9NM2hsb1YrbGZxam1RVmtyNVd3cXFHcE9wWW1EZHNLdDFFZlUz?=
 =?utf-8?B?U2x2VTA1endtSzRRZGtoZmdSYUNCSUk5U3Z0R1FUNGRRRzFGdkRMR2tFZzc1?=
 =?utf-8?B?cXBNd01CNmcrNU1ibWJkcThzWEFTeU9TRXlGbkw0SVRRNjhxdXUrQkRWelA3?=
 =?utf-8?B?R2RPSmc5RGVUMjVHTThoVHhjUUJFM0pMbG5GY05kSTU4enliMm40TzV2SGph?=
 =?utf-8?B?eERiY04xVjVhQVhUSHlxVGhwcjdLWEVjbUdBRUUweCt2MW82MmllRU1lR2F4?=
 =?utf-8?B?TUdaTTBnL2NuT0I2Ukk1eWtnbTlTNXJqdDdKcXVLS0ZTaFY4OVF0dktLSDJu?=
 =?utf-8?B?NGJ6LyttSWxRbTJweWpVWGo2QWI4R0x4VWhha1BnK283eFlXS3hqSUUvOG9N?=
 =?utf-8?B?QU4wcitvU1Q4LzRHYmpsbWMweE9WeDJ3YlFJNkovK2ltYTZySlZGOGRXMVU4?=
 =?utf-8?B?aXVQWTF3bXIrTGM0aDV2WWd3NEM5WVc4eFFDQnhOQ3hsdWFWczhvOGZyRjZh?=
 =?utf-8?B?a2J1NmlvZ2xERTRaRTFJUkdzbktBOTFGNkhOTFlRS0hweFBaQWYwWHA5d2pQ?=
 =?utf-8?B?bEJYRlhBWThBdSt4TlpNM1RDbm9YUEhEYm9YL2FDMndEWW5DalZ6SncrM0Y1?=
 =?utf-8?B?cnFhRFRYZmJWMmY5T28zVkhod0YzeEFGUzViNjdQTmhtUG8xcXh6KzNJQUd2?=
 =?utf-8?B?Uy9aRlFiL1NobHpEVllGRWhhRWhRY3M3cUJpV2s2by9ncWw5QjVHQm0wdE04?=
 =?utf-8?B?b25uMWx6UEx6VWNvYWFmSmtUeVg3bjczSXpVVW9KQVBRdDlNYnhNS2lnRjFR?=
 =?utf-8?B?bU9jWTV3eHNxQThtb2NpVS9WN3pJUG03andvejQ3MVlsYTV5Rkd4WjRxOUpx?=
 =?utf-8?B?YUt3ZUpERnlnMXh1OThVRHlHRllkVGdsUGVHYVJ6cjUzQ3ZMUGhBbW9CT2Fs?=
 =?utf-8?Q?eBmooINRjXtY8?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bkpPMW5CdERNTWJXRUt2NUlJeTh4VitPZ0pWbXFsc3J5NUxhbTdtakJLYnQ5?=
 =?utf-8?B?M0o0US8vZ1ZCMGJZdjRxRE1qang2UW42Q0xlcmlmMU9jN1Y0ZFlzSGF5TjBV?=
 =?utf-8?B?WlRlZVpqanpMcXg3ZCtCdWVUK0I1eXZxL3VNczYzZ2VHQzlxcmtyaVhKcGNo?=
 =?utf-8?B?d0lSVklWL3VKdUxIamNEczY5d0pPVlMvb2xBb0RiZHhDR0JlcFpMUXRuQTZW?=
 =?utf-8?B?U0xFejlpSG5ucjlXbEJZUkx0c3BOSTNNV0NJYzZYcFBQdjkrSmVoUDBOK2M4?=
 =?utf-8?B?aEJabnRGUVoxVnkrTVJwQkhYQTU2Wit2VWxVN2g5Y2svYjV2OGpITVZ5VjBR?=
 =?utf-8?B?WWhHY2dqN1QvU0dXRUJYRkJKSU5QTTkyVVlab0tQRzRNaTl0cksrbWQ1OW1Z?=
 =?utf-8?B?eE9JMFdQL21iMjJZK2Y5c0hKSWNHL01QNC9IVlM1YmtGK1pmUVNCNDRiMjAx?=
 =?utf-8?B?Ui9ueVlZYW9YNWpkZ3JPOGhUdWs4VkgrUzNpdzR5a1dQR0puem9vMHR3L291?=
 =?utf-8?B?TmhYV2RwbDBkY2YyOWxMTzRZdnhXS1RlZkd0SDBmQXZNWWxxaXB3d25vakRu?=
 =?utf-8?B?ZW5QcGI4eGc4enNwY1J5RjJaYlFheHlqVytoSDF5RGxtNExuK1RTRUdtVERC?=
 =?utf-8?B?Tk9xMUxGc29HVzV4OGFOcVhFeUE3aDFub1FaMEJmNTIyVWhXVmg3RzBHeFA2?=
 =?utf-8?B?VkFCYmE4cU8zWGdTVVhzeFNmZnFjT29MT1NpOGJ3SHJiTnZCQzRGekpQREgr?=
 =?utf-8?B?SlhwMFBMRm9NWVdKVXo4WVhXUTd5MkpDOTN0LzNaOEJ0MEp5UmlFVWNud0hj?=
 =?utf-8?B?dVV1Q1d5UFNyQkVwRysxb2hFMjJ5OEorZTNjTzdBRWpTNVBBdG1ZMkhmS3lx?=
 =?utf-8?B?ejBqNG92ZmJyakt2K3NMdVIyQkRyNXhRUEF0UEVnSmtYS1FDcjlKbS9kZTBG?=
 =?utf-8?B?c2lGbUppMlhNZE1BNGtkaWFScENOMnJNMGxQVDZndmd3YXk2YzdJUmo3NTZT?=
 =?utf-8?B?aG0yODc3SWlNajRaQXFJa2FITWZJQVlJQUlUdGR1TFkvNUwzemJpNDU0NlVl?=
 =?utf-8?B?WGlNZ2dnK1FEbGZnWnVud1lDR2pxdDE4ZUJzWGUzVWxaanNvd0Vna1FyUUhG?=
 =?utf-8?B?YklMNW45NUlES20zR0ljOU1YcVJWb3VHVEp6cFpSbkI4ODJVVC9qY0F2cldF?=
 =?utf-8?B?OTBmZkg2VFJaZU5CeEVzVlZCcU14WFdpTjliMksrUm9oNXFnWTVJM0hNSVc2?=
 =?utf-8?B?cVZHSDRhZER5MFl0ZW9peDdtSkhDcGs1RG41WVJDUjY0b1RTYktjTzdId3BB?=
 =?utf-8?B?Z3gvelQ4SzFpMDVJNEQ1MXRmM3FyVTVwQk80TWNIMzBwL3lsVHlTeWdzdFc0?=
 =?utf-8?B?Q0w5N1pUaTdvSENMZzNIZ2dSL1RickZ6VEtHSWN2NkNrelV4bTVybndCY1Y0?=
 =?utf-8?B?N09sZ3hJM3RObDBQSmhlQlFPend4NG04UmdJL3RHYjBUOVdKSDBnSTA5cDlJ?=
 =?utf-8?B?Ly9EMUtSZ0RRMmRwR0Y1MUFFak5NMjIzSisyU3pzMFdicDlyaWVEbXZvQ294?=
 =?utf-8?B?SHoybFRCREE5NjBlVjJUdjRCYmpFamFRbWJqTEs5L3AwT2FXeW9Oa3Fzc3hX?=
 =?utf-8?B?UW1Mejg1NDZqWlBXUElFZkNNanZDTXZFNEI3U3NraUU4djVmUXc5Y05leTdO?=
 =?utf-8?B?WWo1THZORmNZNjJIUlN5djMvdjVmcHpGdjhuODIwSzhvQVRsVkVHTDRsdnAw?=
 =?utf-8?B?MTB4d0hzVE1BcDc5VCs4MTFqaS9TRGhCRzduUDJIUGhTdFliTGcyc1FaSGNB?=
 =?utf-8?B?UDROMk95Z0VBd3ZIVjhieEpXY3VoUjZJR3pGejVnOGN2aTNZdDJHMkVkMG1H?=
 =?utf-8?B?TU9SSjRPNWdpdWNiYU5Kb2xKbEdTdm1CM0x1T29BZ29mWnNydDA4cWxraHNI?=
 =?utf-8?B?NDlOVzM4TWZqRHQ3bVN3Sm9CMG5QQm5XaDQ1U2p5NWpqMU5IVU4rWmNya0N5?=
 =?utf-8?B?dU9zNWg1bHdyajJ3ck91U1RoS3pVNTR4Qjk1Y0lDVjFSUjVKdmI1QVJXODI3?=
 =?utf-8?B?L09NN1YwWVJXNkZYWkxrb0pyMDIzUTlSQVVsNEVOMUgvSnJwUzBHSkY5ZktC?=
 =?utf-8?Q?XTA99PBlnfTQ653nQ8i+TksoP?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 02243c10-dde9-4d27-7b88-08dd213eb6e1
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 21:38:59.8147
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wCbBC/2uJqrsHKNm9X4BRzsYLIbx33130OiiP3kv/GydpEFBlGiGzy1zJ2XAQ+BN
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8935

Hi Reinette,

On 12/19/2024 5:32 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> The mbm_cntr_assign mode provides a limited number of hardware counters
>> that can be assigned to an RMID, event pair to monitor bandwidth while
>> assigned. If all counters are in use, the kernel will show an error
>> message: "Out of MBM assignable counters" when a new assignment is
>> requested. To make space for a new assignment, users must unassign an
>> already assigned counter.
>>
>> Introduce an interface that allows for the unassignment of counter IDs
>> from the domain.
> 
> Subject and changelog claims this introduces an interface, there is no new
> resctrl interface introduced here. Can this be more specific?

Sure. Let me rewrite the subject and description.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> ---
>>   arch/x86/kernel/cpu/resctrl/internal.h |  2 +
>>   arch/x86/kernel/cpu/resctrl/rdtgroup.c | 52 ++++++++++++++++++++++++++
>>   2 files changed, 54 insertions(+)
>>
>> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
>> index 70d2577fc377..f858098dbe4b 100644
>> --- a/arch/x86/kernel/cpu/resctrl/internal.h
>> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
>> @@ -706,6 +706,8 @@ int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   			     u32 cntr_id, bool assign);
>>   int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>>   			       struct rdt_mon_domain *d, enum resctrl_event_id evtid);
>> +int rdtgroup_unassign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +				 struct rdt_mon_domain *d, enum resctrl_event_id evtid);
> 
> (please use consistent parameter ordering)

Sure.

> 
>>   struct mbm_state *get_mbm_state(struct rdt_mon_domain *d, u32 closid,
>>   				u32 rmid, enum resctrl_event_id evtid);
>>   #endif /* _ASM_X86_RESCTRL_INTERNAL_H */
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 1c8694a68cf4..a71a8389b649 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -1990,6 +1990,20 @@ static void mbm_cntr_free(struct rdt_resource *r, struct rdt_mon_domain *d,
>>   	}
>>   }
>>   
>> +static int mbm_cntr_get(struct rdt_resource *r, struct rdt_mon_domain *d,
>> +			struct rdtgroup *rdtgrp, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id;
>> +
>> +	for (cntr_id = 0; cntr_id < r->mon.num_mbm_cntrs; cntr_id++) {
>> +		if (d->cntr_cfg[cntr_id].rdtgrp == rdtgrp &&
>> +		    d->cntr_cfg[cntr_id].evtid == evtid)
>> +			return cntr_id;
>> +	}
>> +
>> +	return -EINVAL;
> 
> This could be -ENOENT?

Sure.

> 
>> +}
> 
> mbm_cntr_get() seems to be essentially a duplicate of mbm_cntr_assigned() that returns
> actual counter ID instrad of true/false. Could only one be used?

Yes. We can use mbm_cntr_get() alone.

> 
>> +
>>   /*
>>    * Assign a hardware counter to event @evtid of group @rdtgrp.
>>    * Counter will be assigned to all the domains if rdt_mon_domain is NULL
>> @@ -2037,6 +2051,44 @@ int rdtgroup_assign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>>   	return ret;
>>   }
>>   
>> +/*
>> + * Unassign a hardware counter associated with @evtid from the domain and
>> + * the group. Unassign the counters from all the domains if rdt_mon_domain
>> + * is NULL else unassign from the specific domain.
> 
> (same comment as previous patch about consistency in referring to function
> parameters)
> 
Sure.

>> + */
>> +int rdtgroup_unassign_cntr_event(struct rdt_resource *r, struct rdtgroup *rdtgrp,
>> +				 struct rdt_mon_domain *d, enum resctrl_event_id evtid)
>> +{
>> +	int cntr_id, ret = 0;
>> +
>> +	if (!d) {
>> +		list_for_each_entry(d, &r->mon_domains, hdr.list) {
>> +			if (!mbm_cntr_assigned(r, d, rdtgrp, evtid))
>> +				continue;
>> +
>> +			cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +
> 
> It seems unnecessary to loop over array twice here. mbm_cntr_assigned() seems
> unnecessary. Return value of mbm_cntr_get() can be used to determine if it
> is assigned or not?

Yes. Sure.

> 
>> +			ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
>> +						  rdtgrp->closid, cntr_id, false);
>> +			if (!ret)
>> +				mbm_cntr_free(r, d, rdtgrp, evtid);
> 
> ... and by providing cntr_id to mbm_cntr_free() another unnecessary loop can be avoided.

Sure.


> 
>> +		}
>> +	} else {
>> +		if (!mbm_cntr_assigned(r, d, rdtgrp, evtid))
>> +			goto out_done_unassign;
>> +
>> +		cntr_id = mbm_cntr_get(r, d, rdtgrp, evtid);
>> +
>> +		ret = resctrl_config_cntr(r, d, evtid, rdtgrp->mon.rmid,
>> +					  rdtgrp->closid, cntr_id, false);
>> +		if (!ret)
>> +			mbm_cntr_free(r, d, rdtgrp, evtid);
>> +	}
>> +
>> +out_done_unassign:
>> +	return ret;
>> +}
>> +
>>   /* rdtgroup information files for one cache resource. */
>>   static struct rftype res_common_files[] = {
>>   	{
> 
> Reinette
> 

