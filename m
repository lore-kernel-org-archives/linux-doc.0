Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2079.outbound.protection.outlook.com [40.107.223.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A68F2746C;
	Sat, 21 Dec 2024 13:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.223.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734788467; cv=fail; b=HETtwcVgg2YZm64ahihvRJMxxAFrYwcPf05Lg+thMzGfsobX7rF5fMhm4AaYkZJJJLTp/5CAIxqc6ljSkynymAuSGi7nJGp+G0aOsM8G77Sgo9+IigNSXrXHs847/k21wLrjI+DnmYPODb7DZUXCppuT2qBnGIjp1U5nE0NSyfk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734788467; c=relaxed/simple;
	bh=PENCiEhe4u/E3y7jnTil6RUPf5J2/knfOX49ee9/EqI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l2kf20o02/+uRS99uUK4MS8lXUW3LVHlsb2rHvgMAtG9A5/RtMD+YOL7CSuBTRAOcVGv0MFM88UOVWD/uKFcRIyABktXBouMB+Q3EG0rhfstzaB1EuRiPv89CMrlnciwPAhxOF8M8dLyyiDGXF8fY9cfHeJuhk7CaNasmLkwQA4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Jh7wAQJ0; arc=fail smtp.client-ip=40.107.223.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Jh7wAQJ0"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rVbPG8Kc3PZbQedbs7o8rIne1wgRxbDlVx0bJ8mvA7bH9fn4DTFCI7/9duc2PPh2CuxNTrW7TdPTFAmXlsyDZlU3Wf59vM6dYDdJxcY0lFyJgfeQVoeT9U6JG3L50ocqzkxXq1/JdIG4HVIMFJJGzb24z+KD23oRH/wU+RzSJ5qk9vLX8F4aOrTkTyagN59CMn+f7sx2skCRBm4rqvJ1REqwLZFGw7yHgwCWwlpuaZCQixknwDqJMjGQYZ35o4K3SvSk3BUhwgJ1KyW9kMG8p2Peb0dM825dFb8ONvo4cANoeK+Os/l+BjA+uzgqmt3FwwZvDmIPxw/bJ/H4LLLPaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CZ8MQTiwfs8D5TNmcsU8u23zr0S7F4mFtLlm1AZJM6g=;
 b=Rd7j3VRPZs39wuVfG+ZHwIbNYZ6itI00ECRQ00dRiIZeyJqeVSP9Gj8fW1UcWSCcCzmboT1/NCSJDEyZ5dbmIE8vW2g7q0tmzVwOVVGnFNI750/cmWucn9ei3t2SVymnGV7p74J6mEUK+PBXhpGtyUVHypwOWsGqJ4XbzmbS1YrY+9LI7KQQjW8xeJbvjjUw7EcpHS9jtHTs+gjvR7oBVk4P4jQFr7o5lsZ0+O5FeX1vxCcGo/6DaPtYm6zjWg5tHe8pBZ/OPfbZy9TVMFCqXG5JTjzf3aWTIaUmaBMk8NUjjO+qUKW4pVc+vm2rLH5gd9X/hUdgKRcexTl3qfZw3w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CZ8MQTiwfs8D5TNmcsU8u23zr0S7F4mFtLlm1AZJM6g=;
 b=Jh7wAQJ0XE0VV32sfIbk44FMQpKYO7N0UJBphKsgr1b25Nv9RuBFNQIG0GWQ9bsYC4gw2z66Q9R6N9T8TXhEpDrNGo2UrI9QfdfQKh5spaI2DeOvEP8tXZrpADSB3z8/YS2zsn1AIj2MkAOBeIM/QJtGNjvDe1yxLmjGlozyOZw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by SA3PR12MB7902.namprd12.prod.outlook.com (2603:10b6:806:305::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Sat, 21 Dec
 2024 13:41:02 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 13:41:02 +0000
Message-ID: <eb84c593-3f16-49e7-98e9-75a13b8b5890@amd.com>
Date: Sat, 21 Dec 2024 07:40:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 15/24] x86/resctrl: Implement
 resctrl_arch_config_cntr() to assign a counter with ABMC
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
 <9f74a647d9ff929f040c57e32e253ac824d12086.1734034524.git.babu.moger@amd.com>
 <d6bc8c3a-932c-4bb2-8bb4-b44b05baa9db@intel.com>
 <a8b7c71d-b501-4efd-8e79-db14f1704aa6@amd.com>
 <92bd670e-7d06-45c7-ad3c-e52f67e53210@intel.com>
 <e800c0d1-fad7-4388-93ce-0a7a58c4d340@amd.com>
 <08f3d2d7-06d3-4dfc-97ef-5351e93964ec@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <08f3d2d7-06d3-4dfc-97ef-5351e93964ec@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SN7P222CA0006.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:124::19) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|SA3PR12MB7902:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f282b03-f787-4afd-c89c-08dd21c51c15
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?QkpEV0ZhTzNyZkNwSGNHcHZaOVFpQXJORmdUZ2tWOFVxK2o0OFhweWZmS3NK?=
 =?utf-8?B?ZnEvSUtZd0ZkOTlwTHJaWk9rUE8xbXVYYTZ0SThQbWhEcDBGZWJuZitpWVJv?=
 =?utf-8?B?U3JKWU5JY1p5YXNRRU1ITmZka2cwTWFqcUFTM0xmTmc3bkxVeUVCakYzV2pm?=
 =?utf-8?B?cmNsK1NyTkVSQWVQTnNNdVZ1QW4yWm5xamdKd1h0M3FKUThVZ1MvV1NQbjJY?=
 =?utf-8?B?NGc5SlV4aEdLd2ZzQy9WY05QNUdkMTVqUm53cml5dDBERlFQKy8ra1l3MzJ3?=
 =?utf-8?B?MmFEcDh2dFBIRGF4dXhITlhOc2dBbUg4ZUh3UFp2WGIxRU1QckZIS001amx1?=
 =?utf-8?B?ZXZMVFJydWZwUEVXTEZaTlJ0N055aFY1M3hXZjFHTkpTS3pBUXJHdEdQVURh?=
 =?utf-8?B?V1dXRmkzcFRDQnlrNnJETUVHdW5UenQyandUcEEwaEpOTlF3ajhlVTh2bDBw?=
 =?utf-8?B?NjBtN21UUkEyN0VSakdhUkozSVcyTCs5d1pjRUtZR1FkZmg3eVhzM3EvWUxC?=
 =?utf-8?B?RHlSbjlGcitnY3JoV2ZpeVYyeDNtK1p5TzhiVnBvaVkxa1NaTEowK29FNnhq?=
 =?utf-8?B?by9CQTB1MG55THZ2bVgzU2tUUS8vaEhRYTJqVDFvM1hXaHJkYjlzcStHMlJC?=
 =?utf-8?B?akFmUU1DSG5rU1V3WFIrNStQNnoyamFVQ05NL0hYZ2pERk1SNksxUE5Bb1pj?=
 =?utf-8?B?OVdqVVpiZG5LVWZCS1l1ZitXdEdtcncxbDFOQWtUSHphT3BHY2JxWUxveDlZ?=
 =?utf-8?B?dVgrTXFDa2JieG4vYnlMQ0toS3ZibFVKSzBmZk5QMXllNEFNNWN4S2dmbzE3?=
 =?utf-8?B?czk2c213S3p5b2hoQ0tFMGpRME1tenowWDhydDJEVnRjNjBJbUYxRTgzb2Z0?=
 =?utf-8?B?Wnd2aXdHQzdxakVRN1p2VWtHV1AwSmpPQk1EYWw0aWFtOTFrd0hGcXN2NitQ?=
 =?utf-8?B?Tk1reVFWRDE1SUlBbTNId0VqTlJHOG1hWGNVYXlwYnlKUFN3Z1BFM1pHb25J?=
 =?utf-8?B?UStpeW1vWmJoK3psZ3ZYN3RTSXE1elZ4TnZUNStWck1wVStJN0ZXaDlhZ0la?=
 =?utf-8?B?QVorRXhhWWljOFRXeGpTcEg4VXhPdWpWeHVyMXIxbkQvQUE3V2wyd3ZONFdF?=
 =?utf-8?B?TFk0YXVRTHBwNmQ3am5UTFkrenZ4ZENMaDZhUjdvK1l2YTl6Zmlnb0tCR2ox?=
 =?utf-8?B?Q0gycjlJWEFHNGhuVGpDc25qQnhUcGRIQlZOQXFBUkRQY0NIK2tQSU52NTRs?=
 =?utf-8?B?bXkvVnI3bFVpUDlsVHZVRWptRmpPcDZnOXpBMjBySkVKeE9TdkFRRXVjaGI3?=
 =?utf-8?B?SjI1elBRekx3MWlzUkhnUUxTdjNCV2cwb2FUdmRzM0tNSG9DcTdtKzV6UTFn?=
 =?utf-8?B?WmxvZ3pmNlh0Z1d1bHBkc1g3cjdlR3dPOWE4VUhFTXBHT2J3ZlZzRTM4VzlG?=
 =?utf-8?B?MFh1Nk53WE5OdW44ZUN3c2Z2VUV5OERWV1BoeFVJazkrN3U4Nk5ZUXFGQStj?=
 =?utf-8?B?dHZlMHhiSlV2M2NlNjdsVllndVdBZkZlUjhjbW43OUU0UlFxczROanNMYnJr?=
 =?utf-8?B?U3NjZDFGQnFRWklNdFVZbkhmbmRQc0FTTlBoQjV3YWt0YUwvU3FBakZYS2NR?=
 =?utf-8?B?OXIwbERKVkxmTmpYTnpDS1BKQU5RckRpUlJUYkFyYXhrUUlhd2x3ZzF1OXVU?=
 =?utf-8?B?S0doRCs3clJSVWNacmd6b2xUN25EUDkxYVBONUNVUEo5Tm9HQ1Byb3V4WmFj?=
 =?utf-8?B?bUJqdTJybFlySlhtN1ZwY2ZyM0dsWUgvTDZyRnFwZEYrd1M1by8zYUZKaGMz?=
 =?utf-8?B?d3JIZ1plL29uR29HUmpkaFFPU05yNW9uOXQ2SGp0RUoybENDb2tDM1F5ekU2?=
 =?utf-8?Q?8kb98jirnqXJi?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?OUJWUmE5emRRTTk1eHNlK1A1UkRXNFR0cXZDcXBpZ2ZlVU1pSThySmltbTE1?=
 =?utf-8?B?ZkpXL3hoRk9EMkNzYmNieWNoTCtQSDJEWHlZZ0t0T3R2d1k0ZEtrMXVPK1c5?=
 =?utf-8?B?Y0hjYXVrdDZCV3NGaW5TR1AvNnR5TXJlaGFsemcwSm1pTlZ3QWwvcWdraGJ1?=
 =?utf-8?B?UUFkWndDaFdYOFVXRkE2aVlqdnBvTTQ5aFVXQ08xZFUzWlo0RVVwTkFrdm9W?=
 =?utf-8?B?OGU3TEg0N0pTR2FZOE9CYlArbmpPSGFJMGdzVGFxSHhaQ3dkRWs4YjBBc1pI?=
 =?utf-8?B?V25TN1l5QlNDWlU2OHYyWE9XRUsybHlyZE0ySGZSUGJLREdzL2k5RUYzdnE0?=
 =?utf-8?B?RUx6cWJVUEtuckYzNjBDYmh5eE5QYksvRGNiUlF3aWxaYjNwWGk3YjB0OHlT?=
 =?utf-8?B?Wk1xcFVzVXNUdlNDTG1xdWdZV2J1bWw2OU9YMUl2eVdIc3R2Q3B0VWw3TEcz?=
 =?utf-8?B?d3NHYmVyVzNvd0ZTKzF6NWtGMU91V2x5NVBWcFcxaE93UlVWb2MxeG56T2Yy?=
 =?utf-8?B?NXlkUkVidkV2QVdwaEhabEpCMFBWT2ZMTUU2V01SWTRuV1B1Sm1GTm5GTHYr?=
 =?utf-8?B?dFR4RmdDQ2hmaWVRcnNOSFppRTJBb3JCWS9VNkFxdElsVW03eEFZa2dKeHlh?=
 =?utf-8?B?KzhxNG5ZVnovMGRRbDkxSnE5TER6a3RrRFk5VWM1MzVoMnNMeDZzVUFxVzBD?=
 =?utf-8?B?NitqYitTU01iZit6d05IQW9aVWVibGlDR2xLelhiWEVPWEV3alc3U1FmbEQ0?=
 =?utf-8?B?T0QrTG53Sk91R1h0ZjVyMkZmVTFmUVh6WXpCQ1pIQ1BmVUNWMzRRT3lRemRW?=
 =?utf-8?B?WmVHNGV6V1ZJM0Y1WTB0elRSbVgrYU0rOXpNbzJUQXZPM01ESkpjRFNYZG1C?=
 =?utf-8?B?WDRrV01zcVh5amRDK3pmZjRaTjRCYUNwcHVIVlFrcWJQSXVCWGpON2MvK2t3?=
 =?utf-8?B?WXBYeWUyNEt6QUtLTzRmb0J4ekVTbUNQREptVlBsbFN5UlZ6dGRzSkZORTIz?=
 =?utf-8?B?OU8vdWdzK0JZbWhDUmlwcFZicldLY29lZVJmMWxMeEpNKzB1MXgyNUR1SHVH?=
 =?utf-8?B?NFNUYTloRm1yclYvdGJkeE81Q3h2Tm1GcjhGbHNUbnBUL3dDT3F2dHBJd1NN?=
 =?utf-8?B?MEJaUC9ZZ2FxRmIrZi9iUEhzaGRJWE1wcVc1WURpRy8rYkFBdHJIalpDMkNN?=
 =?utf-8?B?TUtUalNwazJuejdSeXluUVl3VTc2SFhLYXIyME5tYWtWZlE1VDJTUnhRNmoy?=
 =?utf-8?B?ckNZaEp2MFpuQUNYWnc2Tlc5RkMxQU1IWEJIZzZXT0QwWlR5eVlzMi9iM2M1?=
 =?utf-8?B?MW05ZStsK0lkd3BKeUpsM2loUGVobjhhVmxxOWRMdW1ibUd3RmVTbTROTUxD?=
 =?utf-8?B?dXNnckxtN1VQdVA2MTk2VkdzN0JQOG5udGxxcXBlTHBmSktkZnQ2MnVmcEEz?=
 =?utf-8?B?ZUVycXY0bTdHb2VhS2FNV2ZrSVgzcXFyOHViYnBNbWlSaEllcWpRclZrOE8w?=
 =?utf-8?B?RzVsdG10akxZanB1TmJuS3RQaGZ6NlVJYUpnODJiOGsxT2R1cG9pbDBZbmJV?=
 =?utf-8?B?L2ZjejdkZVUyZjhlMnVqZ0hXWWxJbzVBMDFrajFJQTdMWVNOUWZ2TVVEUzht?=
 =?utf-8?B?RGpDVkp0Y0w5TjBiOFNodEduZHpEb3k1c3B6SDNNL0FsN0FDdXFxKzlYVThy?=
 =?utf-8?B?N1hpaG5MNVFKVm5EUisrRGlWTG9FeEFyd3F0RVFaTThSRFE0NGN3TXVuN1Jv?=
 =?utf-8?B?NzJYRnUyRkM4N2RsZWJLckMwL2V3cjZxTmpaemo2TmxIcUFMVlplWHN6dW42?=
 =?utf-8?B?SUFxZTRmcWZ6dncwRjJTaWhwVGdsZHhzTU0rZkJUeUc2ZlBwZ2FiNXdaY2J6?=
 =?utf-8?B?VzhiQ0xBMTVGL0R4YkM3OFg1ekRRSWhobng3MVZBQWtHZll4dXdRRVk3U1Ry?=
 =?utf-8?B?VnA1V0NldnN5QVhhVkNSUXk5cGg5Ui9KRjBycWVNVGJvbXBKcWRmZ0poc1NP?=
 =?utf-8?B?VG9xcmw1VE1QM1lPdHpPOGw2Z3NPNlFlTUc3SzRHVDhXQTEySUgwNEpselp0?=
 =?utf-8?B?amc4Z3FCZjVETm5tOGtweXFxK3kzVXFZSHJkVUxwTWlrTVpTQ3MzYURZMDZE?=
 =?utf-8?Q?GZ/jMrI5Vzl2yDyS//JVsDZHw?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f282b03-f787-4afd-c89c-08dd21c51c15
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 13:41:02.4443
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: funb4uDSv6gKAzfaXrJkjnm3dKEJeuc3zy5nYpiM7Nh9cYhMDiP1mdxmxTib/Utr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7902

Hi Reinette,

On 12/20/2024 5:47 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/20/24 2:28 PM, Moger, Babu wrote:
>> On 12/20/2024 3:41 PM, Reinette Chatre wrote:
>>> On 12/20/24 11:22 AM, Moger, Babu wrote:
>>>> On 12/19/2024 5:04 PM, Reinette Chatre wrote:
> 
>>>>>> @@ -1686,6 +1686,34 @@ unsigned int mon_event_config_index_get(u32 evtid)
>>>>>>         }
>>>>>>     }
>>>>>>     +struct cntr_config {
>>>>>> +    struct rdt_resource *r;
>>>>>> +    struct rdt_mon_domain *d;
>>>>>> +    enum resctrl_event_id evtid;
>>>>>> +    u32 rmid;
>>>>>> +    u32 closid;
>>>>>> +    u32 cntr_id;
>>>>>> +    u32 val;
>>>>>> +    bool assign;
>>>>>> +};
>>>>>
>>>>> I think I am missing something because it is not clear to me why this
>>>>> new struct is needed. Why not just use union l3_qos_abmc_cfg?
>>>>
>>>> New struct is needed because we need to call resctrl_arch_reset_rmid() inside IPI. It requires all these parameters.
>>>
>>> Could you please answer my question?
>>
>> May be I did not understand your question here.
>>
>> We need to do couple of things here in the IPI.
>>
>> 1. Configure the counter. This requires the cntr_id, rmid, event config value and assign(or unassign). This is to populate  l3_qos_abmc_cfg and write the MSR.
>>
>> 2. Reset RMID. This requires rdt_resource, rdt_mon_domain, RMID, CLOSID and event.
>>
>> So, I packed all these in a new structure and sent to IPI handler so that both these actions can be done in IPI.
>>
>> Can this be simplified?
> 
> This is all architecture specific code so I think l3_qos_abmc_cfg can be
> initialized once and then passed around. Bouncing the individual members of
> l3_qos_abmc_cfg through struct cntr_config seems unnecessary to me. More specifically,
> would it not make things simpler to make l3_qos_abmc_cfg a member of cntr_config?

Yes. It can be done.

> 
>>>>>> @@ -1869,6 +1897,36 @@ static ssize_t mbm_local_bytes_config_write(struct kernfs_open_file *of,
>>>>>>         return ret ?: nbytes;
>>>>>>     }
>>>>>>     +/*
>>>>>> + * Send an IPI to the domain to assign the counter to RMID, event pair.
>>>>>> + */
>>>>>> +int resctrl_arch_config_cntr(struct rdt_resource *r, struct rdt_mon_domain *d,
>>>>>> +                 enum resctrl_event_id evtid, u32 rmid, u32 closid,
>>>>>> +                 u32 cntr_id, bool assign)
>>>>>> +{
>>>>>> +    struct rdt_hw_mon_domain *hw_dom = resctrl_to_arch_mon_dom(d);
>>>>>> +    struct cntr_config config = { 0 };
>>>>>
>>>>> Please see 29eaa7958367 ("x86/resctrl: Slightly clean-up mbm_config_show()")
>>>>
>>>> This may not apply here.
>>>>
>>>> x86/resctrl: Slightly clean-up mbm_config_show()
>>>>
>>>> "mon_info' is already zeroed in the list_for_each_entry() loop below. There  is no need to explicitly initialize it here. It just wastes some space and cycles.
>>>>
>>>> In our case we are not doing memset again.
>>>
>>> No, but every member is explicitly initialized instead. It may be needed if
>>> union l3_qos_abmc_cfg is used as I asked about earlier where it will be important
>>> to ensure reserve bits are initialized.
>>
>> I missed your comment on reserve bits(Searched in this series). General rule is reserve bits should be written as zeros.
> 
> 
> I do not think I am being clear.
> 
> Back to original comment: resctrl_arch_config_cntr() zeroes the entire struct and then
> initializes every member. I do not think it is necessary to zero the struct if
> every member is initialized. If you want to be explicit about the zero initialization
> you can do so while initializing the struct only once where it is defined.
> See for example, rdtgroup_kn_set_ugid()

Yes. I got it. It was not required as we are initializing all the 
members of config here.

With adding l3_qos_abmc_cfg inside cntr_config,  we may still have to 
keep it.

Thanks
Babu
