Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12on2050.outbound.protection.outlook.com [40.107.244.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4711CBA;
	Thu, 19 Dec 2024 19:45:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.244.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734637553; cv=fail; b=WkYlKVQmrA6Qv2mZkuYfoqfgY8QJ+8sz0/WN0xxJBBDG6qIHDsztv8saCWOySaPMgDMtES5t1sxDlC/6firoRTQ5zlxg9yQjR0Cndz09a16ZDFahZY9Z3iQmIn732qkucAJKUbwRYAeKNA1Uws6iZCK2XbcPn6zE5rBQPvaMevQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734637553; c=relaxed/simple;
	bh=jSHJ3954VRJ/nwD3zA0pCvqFwwJYHiq5dpv0ECkQbcQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=tzYAZNGxM1lieLK245fyuNV/E9Ta80wnkTkwt9VrWV8JxYJCfUnlOkwL28qLgPShFQudEQks9cfRGPnywMP6WOrMuy2EvnJNU8THChqDbC6qxmR4/jwBm0Ycb6PZQT1dBlrCXGKnyLodkHsQOlDoPi/OC+zUO15qFuCNUQxGxak=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=rlC1V5HP; arc=fail smtp.client-ip=40.107.244.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="rlC1V5HP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dkMNIsU+vhbwcDc6o6PLm7TbkwsUOxGySJELLKjKvGiVUWel2YKk3y8DXsA7NclASSzQNRWLuVHO5UpWsagbqut0mU1xF/vDfunBdcvXgaFmPSiinHtRunWjxu5dqINNlKbYqVCoISXhnqkkoQvlcDGjvTIDQrqjmcCieX+yWR+b2HwUyZVbYVud6yxcUKoeOa3GeDzL561UsgHJoltjhj6nUPismx9foNl/lG99AdGd4zFHUzjkYATtVx4gWDarno2/CUyISyvg7zBdknpF+IX4I8xbSmCTPZSuoHS+ffg2PXwu+GeZujmbHxRgW8/JT0SgYRGmKBJLDc64+o9UKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=znrAvN1UVfrCbCN3pDOTrV2gFOtR5kpP45xOV8TzsNI=;
 b=o7pn5zaxSkMq9k/go3oxnaf3+JZlIicwpJTGSEAKxQt9uqff/8eQVMBKmp5H/um4TMmF13KnOXO6WbBs6Ed+Q7/KZAEuBzixLtlKY/c7CUAhNitDKQ/a8Uin8yUJjd33t0VJgMaL8P3K2q8gOfvTc5V49bEx3JR7jP2ajt6iIc5FKc9j1SCwebrUH+xySns0OkSnZTAOQfsM4dqgWiXcnlWyxk0ZYbr20LzMGTM7IGBWZVfgWC+U2HzIT4QD2nv2IPu3HxvjnejfO16VhPkMqNt5MQOkeA6fjS+C/j3Fqlil/RB86r6LgyEiTnE4qSIbu4LTV+RY+EBFNMhEAqlBaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=znrAvN1UVfrCbCN3pDOTrV2gFOtR5kpP45xOV8TzsNI=;
 b=rlC1V5HPlwnEzv/48DruJzIenD2BJJ8RjH7sqyhVPtx5KNErDa2n0YGENFn7H2zyGoy3NTs4Lc/gzBsO7oYOGInothcSqpndB1mhqMlhMr5LEPo4FiI4h8G1g9RD08PoyY0GAy1/rXwtvqwC5h5pVCBQriXuV2Fb8i84tNgaclk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by LV2PR12MB5728.namprd12.prod.outlook.com (2603:10b6:408:17c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.13; Thu, 19 Dec
 2024 19:45:49 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 19:45:49 +0000
Message-ID: <8e96f411-14ac-4d41-82b4-e3076f1c13f1@amd.com>
Date: Thu, 19 Dec 2024 13:45:43 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
To: Reinette Chatre <reinette.chatre@intel.com>,
 "Luck, Tony" <tony.luck@intel.com>, Babu Moger <babu.moger@amd.com>
Cc: "corbet@lwn.net" <corbet@lwn.net>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "Yu, Fenghua" <fenghua.yu@intel.com>, "x86@kernel.org" <x86@kernel.org>,
 "hpa@zytor.com" <hpa@zytor.com>, "paulmck@kernel.org" <paulmck@kernel.org>,
 "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
 "thuth@redhat.com" <thuth@redhat.com>,
 "rostedt@goodmis.org" <rostedt@goodmis.org>,
 "xiongwei.song@windriver.com" <xiongwei.song@windriver.com>,
 "pawan.kumar.gupta@linux.intel.com" <pawan.kumar.gupta@linux.intel.com>,
 "daniel.sneddon@linux.intel.com" <daniel.sneddon@linux.intel.com>,
 "jpoimboe@kernel.org" <jpoimboe@kernel.org>,
 "perry.yuan@amd.com" <perry.yuan@amd.com>, "Huang, Kai"
 <kai.huang@intel.com>, "Li, Xiaoyao" <xiaoyao.li@intel.com>,
 "seanjc@google.com" <seanjc@google.com>, "Li, Xin3" <xin3.li@intel.com>,
 "andrew.cooper3@citrix.com" <andrew.cooper3@citrix.com>,
 "ebiggers@google.com" <ebiggers@google.com>,
 "mario.limonciello@amd.com" <mario.limonciello@amd.com>,
 "james.morse@arm.com" <james.morse@arm.com>,
 "tan.shaopeng@fujitsu.com" <tan.shaopeng@fujitsu.com>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "Wieczor-Retman, Maciej" <maciej.wieczor-retman@intel.com>,
 "Eranian, Stephane" <eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <a72e23d8fe43038cd319403ed68b657fb36e23df.1734034524.git.babu.moger@amd.com>
 <Z1tzyrUYTFR_iHuJ@agluck-desk3>
 <e43b10b7-60b0-412a-b55f-96271764faa1@amd.com>
 <SJ1PR11MB60831C44DEE7711F93C3C26CFC382@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <8cffb2ad-6645-45a4-8d05-c967c82eb111@amd.com>
 <f8073d8c-7dd0-4e8d-a196-183acef13d66@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <f8073d8c-7dd0-4e8d-a196-183acef13d66@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SA0PR11CA0062.namprd11.prod.outlook.com
 (2603:10b6:806:d2::7) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|LV2PR12MB5728:EE_
X-MS-Office365-Filtering-Correlation-Id: f8592fb6-3cb9-42a1-5884-08dd2065bce4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cnZyQkNIZTltMU81VU01Zmh6RUhYc3BIRHJlMElVeEJlalB3VGgxb05Ib0F1?=
 =?utf-8?B?MTR6UDNjQUlLMEJnanVZT3h1OUxxOGhXUFNyaXRBdDZGNTVUcEFNb0hCajRI?=
 =?utf-8?B?VXJBamthQnpiUXNMQjJ1WThZVVFBSDNoc3ZrdUNXSGtscFdnc3RhU3hLM3VO?=
 =?utf-8?B?OVpjVUs4dWhKRVpNR1dsWXFHbXE1ZFpMTEk2REZYRXk0RUdwUGREN0FwaWs1?=
 =?utf-8?B?cHBDdzdzTWdZS2JhbGV2S0xuSWs1MUM4bWtteGQzYWxRUTMvUVdOdGJQT1lq?=
 =?utf-8?B?ZDI2dElCMVpyWnkwMXRnM1gyMVhFWlJUMWtQdXBjbHBwbDdXK3B1MGNoRnpI?=
 =?utf-8?B?elE4TXBCeUxHdU1rdVc2YmdxMjFka0xUYjc2VHZFeXNqY0RYU2dFQzBhOUF0?=
 =?utf-8?B?UDlzdTBSOWszN2hnUzVUWHVYNnp2ZjBaeTN5cnhwK2RuSGNXV29Kb3hvOGxS?=
 =?utf-8?B?QWhrZmM4a2NVYU1pbzR1U3Z6ZEVDVENWOXJuMHRrRUl2U1k2WHUvWThnUGZm?=
 =?utf-8?B?bW1XTXVLdmlsMVBzdHhCbzFRa3pnNmVJM25xcFFYZnJtTlVSSzBRT1ZkdDRk?=
 =?utf-8?B?VENCMGpqNUZ5WVNmOFl6UzhhaUQweTNFbEkrVVE2VFFMbXo3K0FzbG9UaFBF?=
 =?utf-8?B?Rm5aQ281dzROVHVnWU93ZDlTUmlpZmk4NTJZazhGVzkybHJVU1R4WTFhUmFD?=
 =?utf-8?B?a0dHRXdDQmhaMEUxdXQzMlhUVE1DQnErUFJjS2M5V2hiQlVhUGdLZm0wQVJN?=
 =?utf-8?B?b3BVTFdJWDRGL0orc0Y0SzRCcklMUVRaazR0UWRFSlR4aVpQNlhEMi9vWjVh?=
 =?utf-8?B?c21nclpHeTJnSzhld29SaXNkLzVJaWI2L29Kd0VxOTVCMGx6Zkk3d1RaS3ZP?=
 =?utf-8?B?OFNOUmZYZFdaQjV6ZkJEQ3V1YkFlTnFTcFY3bFRMODFmRFNrOFAwYkJ4aUV5?=
 =?utf-8?B?R2JqY3lyTVlwRTRRTG5iMHhHWmdTWnQ5a3drbVJQa2VIa3psbUY0cUhzRUNX?=
 =?utf-8?B?YlNWSjgxQTZVRzNSLzNXSG5WQ09paEU1YWF5MEErMzZMa25EeHk5NTBXWHBG?=
 =?utf-8?B?NXg4eGxhaktHZUZQaHlRN2gxL2d5VlV6bzZkODl6VlRqVlRFc0pCYTJKN1FN?=
 =?utf-8?B?cUR1QlVORU9TWjJKQkF0bzgxcEJ4K1grWjd5SXRQczRxYjh5VktPUkRaTWlS?=
 =?utf-8?B?alBBdE83ak1xTHhZMVRIclhnMmNVQlpkb2hRWmNNWGdzdU1nOWxkd2l5dGZh?=
 =?utf-8?B?bmY0aTJvdnJjb0VzQk1JN292K3ZOUWw3THZ0ZWo1ZHZXQ1BIZG1peFhkL09r?=
 =?utf-8?B?YUZOTEEvRnc1Rk02NkVGVU5HVTRJc21CTmlrbFh0VGlFV1dWVm5ZUkFsR2Vs?=
 =?utf-8?B?MnNwdmM3d0R0NlJ5L1BBeUFEWldXQkszQUVuOS9jN2tUQS95Qjd2SmtrRElD?=
 =?utf-8?B?SHp2Tm0xUW1zTnJTMEVNWXArMU40d3hFSzN6OXJlb2llZ0hkWWJOcVozV3d0?=
 =?utf-8?B?aS9jWVhsRUVlMTNvbHlUM1RRRUgwbzFHNHY5bkczTWhlVVlUZ1FaK3p3czBq?=
 =?utf-8?B?R01PTFJrQzVSNWFSV1NldHhyTW83ZmFQeExwVmRWeVFUR2VDSmxiakoyY1B0?=
 =?utf-8?B?SDdER0pLR2p6Zno5RklCc2FvSWpQSFFCNXZVN3YzdXRuZkI0UnhvY0pkTEdi?=
 =?utf-8?B?NVVMT2dHUCtrN005R25yRWZFN0dkVm5UaUdlUzVUc2E4ZkUzNFB4dTlkMms2?=
 =?utf-8?B?WjZaRktmWkFYQWlNZElobTVKSDFiS2hDdjhmZEt3WWRLd0FMSDRLQkUzWENt?=
 =?utf-8?B?RUlHMEM2aEVUV2szdldSZVZhS0FRRFlNR1MvaVRWSVBvUVNscWJrYnB0UzBJ?=
 =?utf-8?Q?XxWdHNGtERS2S?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?R2phSThMckRKUWtacTdHMlRQS0VsaWU4SWxMdVF2aXo3MWJER2R6VVZWSmJO?=
 =?utf-8?B?NFVWdkxhTlpNWTgrM0ZzUW1TQzJaTkppZUxtVU1PMkFQQ21RSm5hdDM4bDVF?=
 =?utf-8?B?NGwrcnlNZzZYYzNibE9oT0dESTdFZTkxdU53b2pQTkx0RDJIdjZ4VDR5cDJZ?=
 =?utf-8?B?bTIvTGpaMHpONUVBd1FqN2lKVk5Vem5pd1hhd0R1bVFBVUxSZktRZDNwZEFT?=
 =?utf-8?B?R1NNQlFTK1NTQlltWnZ1UDVSTWF0NlBkYkUxSk9wWjZDdmNWNEtlTVBPTW8y?=
 =?utf-8?B?TS9Sb3N3eVVWSFZiUVNWQUJmOG1HNTlodUhGMGxGbWlrSmdqQUQxcGoyZTd5?=
 =?utf-8?B?TDJFRWRSR1h3TU9qQ3dNL1VHQXJTNnNnS3F6YkdDdGEweFRhMlhnUzhZNDNB?=
 =?utf-8?B?QVVEOWFNaXVXaEhBa05uSW52M3JZTlRYei9JOXZGenRoOVZMbS84cEJGdWR6?=
 =?utf-8?B?aFpoMjJwTGxyQ1JYMk9mTTcrZWlTSFQyMDdzcVdLeVp2WnZVZjkwdWcwZEVy?=
 =?utf-8?B?dk43TExPd0ZtNzZwZnhjMlJ4ZXd6R1ZGdm8wMUpMaWwxTmRJbDltT2NiWFI0?=
 =?utf-8?B?aEV5aUhpMElzSkRGODdsSFFqWXNzelNmUjBwZW1MQ0k4blpLMlluUDBnZ3lw?=
 =?utf-8?B?VWZabE1mZUlLNjVKNXloV3UyRkl1RU1QbGkxWURkWDBQdDY2S2g0OHhLcG4v?=
 =?utf-8?B?Z1NnZmFYQkkrblBHMGpJYWFmV3A0NlllMjV4UExTcW1jZHg5Vjl0aGRWeU93?=
 =?utf-8?B?dytEYVliMjB1MlB4OHNIRWRMOXRHTmtjZkdpYllMTStySVg5clNNNm10bWU0?=
 =?utf-8?B?NEI5NkFNR25CN2Z5MDY3VFlGdXVXZXZCQlhYRG5BcFdyYUVRa0ZmRkcwbUY5?=
 =?utf-8?B?QVYrTzltZG9EM0VmSlcrazhCNDQ4UFhiOHV3UFFVS0o0NG5HMzN2Wm1hV3V0?=
 =?utf-8?B?bTJBRytuR2xJcFdsUkQvRGhVU3piaGVWUzRxRWxjcjJ0SDhyTUxDUFY0Q0lh?=
 =?utf-8?B?NG9aT0FPNWMzVDIzL0JRNENTTlUzR3lTS3ZBdXdGZGVHNENvWis2Tm5MbTlO?=
 =?utf-8?B?NFJtTm9oak1OeGJkMGRma2REeENHazBKSzl0em9aVUF2NDdDTmtxRmd5UTFN?=
 =?utf-8?B?TnVvRjRFZjlmTXEyUzAreHk2ZVg3akludHBSTkhNcW1xN296T1R5WWNmbHpa?=
 =?utf-8?B?Q0k0eUIvL21UVXd1TDZnclpMVzcyMitjSnJxS3ZHb1YwRFYreHNZczJCUFBG?=
 =?utf-8?B?SFV0MTlWR1pkMGlnQ0lqRnNWeDZXSUhVcDJCZFdXeHdBcit5V0c1RTZLRDc5?=
 =?utf-8?B?YkZGdTNKYmR5d2pVKzFtMXZ2VnoxdFBhYkU2SU1NcG1lU3VFUVZMckJONWxB?=
 =?utf-8?B?eDlZSzNwZWJkSDZzV3FrY3BXVG5PSGRSTWw2dU1Rd0xMMUJMUmlWaVd2S1Yw?=
 =?utf-8?B?bTVZM3hLL2JTU256aUMwL1hFQ3VLeEY4T081c2NBdVZJY1RRTkZSckE1OHlz?=
 =?utf-8?B?b2syeUtMZThUbVdTSGt2ZEM3QTRHNStPeE9JeTNJM01iVVZ5WmtGYlFVVlNB?=
 =?utf-8?B?NlhTK3RJV0FQa1U5Z0VtYXBGQ3RqUXNQSWQ1S3pQR2RnbVVCUnRTblNyZU5D?=
 =?utf-8?B?MWdlZjFBZWxOWkhtQms1NkZ1OW9IaUVTQU82RG8rRnYwYVhSaWpDbnJwZWE5?=
 =?utf-8?B?RlZ3V3B2ODkvQW9uQ3hiUnFJbHJZMVlhOU9MS2pPcytrTDhZNlRIQ3F2dC9C?=
 =?utf-8?B?dVlVOHgxem9xeFVrZElsMzhHd05zaDErckE0bm4vV1dCaHFKT2NlQzMwcFFI?=
 =?utf-8?B?MEdpZmdZTHpGeHZqS0RpQzFka3NkaDZMbmplTTA0enhKeUgzLytuOWV3L0Fs?=
 =?utf-8?B?cmJjejNJSlNoTW5uKzJKZ1lpeFhpUEVvb1B5NkpvbHNrN1E2aTIxQWlvakZ1?=
 =?utf-8?B?cjhTaTZRWGV3c2lLM1lRT21Oa2ppNDg0L1d2dDUzZGdMd1Iwd2JmeUxBRmEv?=
 =?utf-8?B?djdsVUF1QmZ0UlhYWDhIM1JSR0dXRGQyZHJmVERDV0VZTDlNRTlTUnpiZzlx?=
 =?utf-8?B?RHV1MUNBcHUyME54clNKY05sWmw5SDhlNkEwNWhVa3pxZ29OdVZiN1NoYlNB?=
 =?utf-8?Q?6K58=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f8592fb6-3cb9-42a1-5884-08dd2065bce4
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 19:45:49.2689
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VH+5dWaMowkJKhMHDuaNg3IhjY3l1rjmhX8Y2loSlkyE/3O+6RRPZgBN+hSEu2bS
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR12MB5728

Hi Reinette,

On 12/18/2024 4:01 PM, Reinette Chatre wrote:
> 
> 
> On 12/13/24 8:54 AM, Moger, Babu wrote:
>> On 12/13/2024 10:24 AM, Luck, Tony wrote:
>>>> It is right thing to continue assignment if one of the domain is out of
>>>> counters. In that case how about we save the error(say error_domain) and
>>>> continue. And finally return success if both ret and error_domain are zeros.
>>>>
>>>>      return ret ?  ret : error_domain:
>>>
>>> If there are many domains, then you might have 3 succeed and 5 fail.
>>>
>>> I think the best you can do is return success if everything succeeded
>>> and an error if any failed.
>>
>> Yes. The above check should take care of this case.
>>
> 
> If I understand correctly "error_domain" can capture the ID of
> a single failing domain. If there are multiple failing domains like
> in Tony's example then "error_domain" will not be accurate and thus
> can never be trusted. Instead of a single check of a failure user
> space is then forced to parse the more complex "mbm_assign_control"
> file to learn what succeeded and failed.
> 
> Would it not be simpler to process sequentially and then fail on
> first error encountered with detailed error message? With that
> user space can determine exactly which portion of request
> succeeded and which portion failed.

One more option is to print the error for each failure and continue. And 
finally return error.

"Group mon1, domain:1 Out of MBM counters"

We have the error information as well as the convenience of assignment 
on domains where counters are available when user is working with 
"*"(all domains).

Note: I will be out of office starting next week Until Jan 10.

> 
>>>
>>> You have the same issue if someone tries to update multiple things
>>> with a single write to mbm_assign_control:
>>>
>>> # cat > mbm_assign_control << EOF
>>> c1/m78/0=t;1=l;
>>> c1/m79/0=t;1=l
>>> c1/m80/0=t;1=l;
>>> c1/m81/0=t;1=l;
>>> EOF
>>>
>>> Those get processed in order, some may succeed, but once a domain
>>> is out of counters the rest for that domain will fail.
>>
>> Yes. I see the similar type of processing for schemata.
>> It is processed sequentially. If one fails, it returns immediately.
>>
>> ret = rdtgroup_parse_resource(resname, tok, rdtgrp);
>> if (ret)
>>        goto out;
>>
>> I feel it is ok to keep same level of processing.
>>
> 
> resctrl also does sequential processing when, for example, the user requests
> move of several tasks. resctrl returns with failure right away with error message
> containing failing PID. This gives clear information to user what
> portion of request succeeded without requiring user space to
> do additional queries.
> 
> 
> Reinette
> 

