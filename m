Received: from NAM10-MW2-obe.outbound.protection.outlook.com (mail-mw2nam10on2088.outbound.protection.outlook.com [40.107.94.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03D8B86337;
	Thu, 19 Dec 2024 22:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.94.88
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734647645; cv=fail; b=MYQHPnuGbG2pfdZ8oN0q3QcIgtOAawWDOpdEhpKwB+R5kH02cZdjofl2TvD3/tcfbBj0PbtBZRgO+KzfgcI7M2LFxF9+d+LhWujlbD4LX0LsUsh+rT0rsD4yey2WRoOKd6QJ5nvIFWamS9Sh8EegsDNgkBq9yCECFM7hhXNYqDY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734647645; c=relaxed/simple;
	bh=TCcdJNxL0xGh55w95MWeiLlchBagzLJdcX3jL6GgqLU=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=FxyDqNs4xZQSiYvhkxl926d6DJZQBWQbS8aDxRPSCNlz5aWi6d9dFOTuCGP9qboD3nJ6FvXyOmKqsgAAvyBiSmdhKHwaRe2nM6kmMFN4do3TNE5z7iJO0q54liwTxnHiG6U4ZbKlLMOPJ9K8tEs7/E4gytOSdtaO/8xISxsu3tg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=FlTtstXg; arc=fail smtp.client-ip=40.107.94.88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="FlTtstXg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AZ+Q5L4kUqpWehRwAc9FmxBC+SbkWUiotu9Sz6LDeE3vodkTwQd3HjH1m0ib24JZ176zVs+KEbQxQr1W00NPYJHP7AXTeTi0AkOu2yF8eOLU06LZ2uoMtCg6rVLfAjtk80chBJ8ekLSE0RiQ92OWJR+6vKdaA8VeN24+cH1th8dFBD1E5LhoLuv/9Y9h5D5qXbOm7bZNO3UpuWgKZc+U3JJxypZap6ypUjK76ZkHEyFBkdtSXeqIwZ3uzU7ofwpIOc4KP1oa7RggDloOBFPLypPQJioaoR8Ac/cYT4yydp5lWvaKhJyRSsSWParC4cqVEsGxNcNmJZ1q4d9/o9jWuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0H/VaRcgteJnhZA8/axcZyTpSA8axGyAf7r+yFFgge8=;
 b=uNtK3RAMhWhTLlxWYfYkP0uHe4okeRGCGRzgQyJww2yicFvpl4fx4kwnhrnZJ7BN55cflclLROUtT+OgYIb7dsiks88N7wua0M8hLG0AhjJ/7expHzqqD6BU30UP3OxI0/RKQmAodDfNxM9qvCqVPTS7/+ZWYaekkGOZv7EXrK4l7u02DeRYByxefpumUF5FWj+yXO6yCfXIFyGK2SaPiHu00nTU3fmcavxFfaXU6nUwZosgmNIhgJ6YwuoEGLcVS18hODZcg3YfqWwB1NzZTBpB800D7vx9Fnz0uoQ9AFdd62aS4y3bahLu/fkIx8yvkpgTkFm6hEbQx5wp539ysQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0H/VaRcgteJnhZA8/axcZyTpSA8axGyAf7r+yFFgge8=;
 b=FlTtstXgNW00OJG3ypy00PcY6HauPWxKCBFDW28kBFmdJw1tLZc/BmBYVe26Z/En1+Alx2HcbmpduKVJvBOXka97Epd7Pqerjb8sQE8++8QcxPIt9by7DBP5HnxbfJiF7SSaWNgndnYVmbwiI7ITo4F44QbGzvOqbMX9Ua6LF0k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from SA0PR12MB4557.namprd12.prod.outlook.com (2603:10b6:806:9d::10)
 by SN7PR12MB8146.namprd12.prod.outlook.com (2603:10b6:806:323::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.15; Thu, 19 Dec
 2024 22:34:02 +0000
Received: from SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f]) by SA0PR12MB4557.namprd12.prod.outlook.com
 ([fe80::d22d:666e:be69:117f%7]) with mapi id 15.20.8272.013; Thu, 19 Dec 2024
 22:34:01 +0000
Message-ID: <daa28f1c-1064-4adc-a99c-fdad1bc08a9f@amd.com>
Date: Thu, 19 Dec 2024 16:33:59 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: RE: [PATCH v10 16/24] x86/resctrl: Add interface to the assign
 counter
To: "Luck, Tony" <tony.luck@intel.com>,
 "Chatre, Reinette" <reinette.chatre@intel.com>,
 Babu Moger <babu.moger@amd.com>
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
 <8e96f411-14ac-4d41-82b4-e3076f1c13f1@amd.com>
 <50a4371b-d7a5-48d4-bb79-b9f0f935b5db@intel.com>
 <7db76395-9bc0-4b26-942a-a354d5e3ff45@amd.com>
 <SJ1PR11MB6083B85BDBD3B756574A0E32FC062@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <SJ1PR11MB6083B85BDBD3B756574A0E32FC062@SJ1PR11MB6083.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0196.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c4::23) To SA0PR12MB4557.namprd12.prod.outlook.com
 (2603:10b6:806:9d::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA0PR12MB4557:EE_|SN7PR12MB8146:EE_
X-MS-Office365-Filtering-Correlation-Id: db1ec84a-4999-40c7-f9cf-08dd207d3c9b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TDVYYXhXb2hSbXNGUCtzVnRVL0pEaVFDTjRtNURjWUZVR213U3NWWWlxcm5k?=
 =?utf-8?B?ejFuUFg5K2V5N0xpT1FrT0NGb1hVRDVuQ0lIVzVzRnNRSEF3VUMyR05MTlBx?=
 =?utf-8?B?TEZQWkNCQWU0TEtkTVFRRmtTZ09uWXp5ZXR0Uk1jMkhpMjFrbXlvU3dlSzdE?=
 =?utf-8?B?ekkxc0ttZUkybGpkREhUajd0WHhMYnpIRWhQZE1MRWx1cjdnTXFBUHBtMndl?=
 =?utf-8?B?ZDRCQTVHK2pFM3YvWUhINkNWTEZmWndJYkdSVlF4WUd5Q2Y0dDA1Ymowenpn?=
 =?utf-8?B?NzRWSUYxSlNQVWk2eG02NGx5NXB4eXZQcW5Ja0k5dHVIaEZUVENBV0pnYXZG?=
 =?utf-8?B?bTA3aWdGZ2pvNXBMV1lZMGsyTy8xaFFNMWlyelBoUjhoaHRyNnRqMVNqR3R2?=
 =?utf-8?B?dXpXVkFza1lxblZZOGhnUGp3R0I0aEJvRFNDMHZDWUZJN1Z6dE1KSmxWY2pC?=
 =?utf-8?B?UFhnSlA1cksyZ2RqV0gyMHdqY2o0ZS92STh2OVhCRW93cXBndndOY1RONzhY?=
 =?utf-8?B?R1dJRTc2OFdSbGRxcTI3WmhLMjZQV1BpQ3orMmV4Q1p4T011ZHRUaWJtRWNK?=
 =?utf-8?B?M3lFRzN1Umh3YzRvbFNvNU45WWVreEdzSUR1ckM0OFlSWWdBR2dQWWRVNWkz?=
 =?utf-8?B?dlArU0c0WjhSN3RTZGFZM09HRWFOcVZWZWRMbXFkVVZZOGJ5SlNuemdBcU5v?=
 =?utf-8?B?VVBEbU5VUC9BWk5nRGRNTnc1UGpBVzZ4ckQ0R1p1eXpzQ1JQRjJyTElhRytk?=
 =?utf-8?B?Q3BTanZZTk9sNXpzdVowQitZSXR1d1NQWjZEbUpUSHBrcnFHaW1MRUtBcllN?=
 =?utf-8?B?RlBpcnl1LzJVeU8yelZhNjhzM1I4dmNxV1pWSkdtbS9zczNxSVROQUhmT2dK?=
 =?utf-8?B?K0t1OVVpem5rS3IzdjBUd2F1dnhZMUVaalNiZHpZcHFLYzBweHpYYVZ4cXk2?=
 =?utf-8?B?N29KMzZQU0tFM2p6UThvb05RaHJwN1JhdGFNM1RDT0lPUndqNkY4c2tKdk1V?=
 =?utf-8?B?bWxJVVJhckFxNnJweEI4dzErUUNaYVFjQUpaVGJqb0FIeklXWWRwRUZ1V3dL?=
 =?utf-8?B?NHNoWnQ1bW45dS9US041ank3SThVaUd1RUZtbzd4T2dnWXR5M3ZKMFBnRFRi?=
 =?utf-8?B?b3Z2ajhwQVVGQTY4Q3plcDdneDd0TWZpamtjbU42QnZYRlJJN25WMC81bnl0?=
 =?utf-8?B?aFVZZTZYSTVFS1V6M3VsZjhxa0JtMEtJWlVRRVNPZWF4Ym4vL3cvcDd5SVF1?=
 =?utf-8?B?SnIvV2NLTFhiMGl0VmU0VVlCK0VDQ3ZpcmtwczZUaHJUN0lXbGs0SDdNd2I4?=
 =?utf-8?B?UjZiaUJ2SjBkbUF0NzZTY0ZZUmoyUTB6cUFnaTVzZnhiNkVpcTJSeXREZFR6?=
 =?utf-8?B?ditlZklRL0tMUnRIY1MxUUMzSGo4MXNNNEk5VUpvMzA0RmpqcGNOZll4QUVj?=
 =?utf-8?B?UHVGN2I4Y29NMG9pM2J4SXV1UXlMLzgvaUl6a1I2ZkxoUXRETTkwVVMzWlRC?=
 =?utf-8?B?N1VIUGxLQTlROVhoTlNWZDcvN1FiOXNiZnU3eTdtZklUU05jeXNjMEpyeXNu?=
 =?utf-8?B?MnhqQTBaUEFiWi9UVnhIdEcwaVNBN05iSVJhOThaRXp3cDJHMDM5a3BwZWs1?=
 =?utf-8?B?dXlqTFhpTUpPYXJTcEhhbVhlaVoyYUU0Q3Rqd0laZWdJQktXRmpQM0Q3aVhp?=
 =?utf-8?B?S0Q0TDZUUFVjeGJ2TEZZS0FEbnZIM0hsRDYvMGVRZk5FZ1RpOTFVOVJxQWFi?=
 =?utf-8?B?VlN1WHhPK1cxZGhEVHNFeTltV3M4UEJGbTBXMm9XZG9WeFR1QzdtOCtqS1d1?=
 =?utf-8?B?K2JyVG1XU2kwTXo5UDhreVNqa0pLNC9mcys4WWJZZWVvS29JZ0pUU2ZERmdQ?=
 =?utf-8?Q?91XslVP5lXymK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA0PR12MB4557.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WHhhWVM2YmdRMFI1UjlTbHBIQ2dXZkg5QWtXenZ6bms1bTlIZG5mYU5PaVhV?=
 =?utf-8?B?YTA2OTZHK29EOU1QRnpnVFVhY3VqMGI5TlQ0MGtzbVkyVi9uS0hkY0lJMi9k?=
 =?utf-8?B?V0xZRG8wNzFkVDN1OWRQMUN4b1VjTERJenZqYm9XTFZsZWYzUzl4dGNEZFhu?=
 =?utf-8?B?cnVVdXJ2TkNMZlRGNTdua05MMDVxcW0xTHRFblJPNjVTUngwblljcnJObkZm?=
 =?utf-8?B?TVk1dU1jRk9SQWNTd1IxY1FhdWpDZVYzdjJtSzFBQUVlWDh5VmhZdzB1Y1N0?=
 =?utf-8?B?VDlYVCtiRzBkWE9lUGk2TTJ1S2ZzcEdhanhCSnpkenFpV3hWUy8weXc4amxy?=
 =?utf-8?B?SDBYNW9mUVZybVljYU0yU0VlVE9wcUVhUDV1N0RhYW9Dek10c2hBYnFKbzk4?=
 =?utf-8?B?d01GZ2lsVmxGOVZRUHZCYWlmTmF2bGFNZFV5MkFIeFNUcDBIUUxDSUtzOGdW?=
 =?utf-8?B?YjlEejE3N2hoNWprb0pXQVZWOXhyMW5PLys3STdSVE91K1h4OHpDSHQ2NmhF?=
 =?utf-8?B?TXRwU1ZFTERKdGF1Y0FuSndJUzVzdS9tUHZsbEoyaFJvWm1BMW5CSENjYzlG?=
 =?utf-8?B?T3NHaWM5ZHJVTDFaQnhKZmFkV3FQNXdYN3JCM0pCQS9CWWVHNTNDSXM2MjR0?=
 =?utf-8?B?cG1tSG5LTGN0WFhOTXoxZ0FCYkRhci9QSkM1NEIwdk9LOGFGSEZ2MTVNNGlw?=
 =?utf-8?B?K1NTcmRGRExTR1NpNWp2VlRXUmN5eXN5NFZjbzR2aFo0R05uYW5NTzhNa1oz?=
 =?utf-8?B?c05nL2VxR2NuL041SG0zMmt3K0RHVHY0NnZsV0x4WkMxWUpQNFR1RXRJWDc1?=
 =?utf-8?B?YytvdXNYTGR1ZGduaVdmMjJWZUNTbWdTNit0cHIxR0NldWFPcnRwcDFGcm8w?=
 =?utf-8?B?RUFNSGJCY1RDT0ZKUjQrTXJOdU1BVVRMekFScW81VWFLSFlqSGR0MmJqQ1V5?=
 =?utf-8?B?ZndvQk9lTUpEdEs3WVVKNU8wNExGNjVQcm5yNksxK3YxY21UTjgxRHVJZnR5?=
 =?utf-8?B?VElkdHpVazlieCt3bk5EeUlEWU5MRmZjY0lBWUtpSnZreklRaXh0MFBNK28w?=
 =?utf-8?B?QTlLWThqNHB2L3gyUGRUM1d0cmt1K05JYmhxNGxYVUd1bnVNcmN1Q0dQS2Fv?=
 =?utf-8?B?ZzExQnExL254RDJBcXk3V2JnaHl5WFFmVFhseEoySUZ3bVZub3FDMzFxVTND?=
 =?utf-8?B?ZnlxVmREdVRHTGRmME4zSktvWm5wOHZydHR1OFpmRXplaHpFZ3pwVTJXenRB?=
 =?utf-8?B?REZZOXFzTVNyUDVmTXVWaS9hU1RoZjdhNHZvQWYwbnZPVDRSM3l5M2J6dGh4?=
 =?utf-8?B?UmJCS21hTE9hZmRmOEl3eThweEQrNkgwWElxdmhXV2tuc2wwMFFZdm9GSVR4?=
 =?utf-8?B?M25mMGo1NEJDRDRiMUNSWjZtVzFPUmhXTW1FWCsrZm5IUXVqQVoyU2p4MjA4?=
 =?utf-8?B?bUg1SnpnNS9DcExpNmRGZjNmVUJOWTF6Z3BQclhTQWZJQkdlejYxRFJsU0Ur?=
 =?utf-8?B?U05McGtKSjVwRUZHeXdEdFNDc3BySEpaTnNOU0JuWVFzN2xyQWViNHd2RGRO?=
 =?utf-8?B?TlZ2RkptQkR1QUFOQzVnS2hNZk1NRnVSTDRzMmhqdjQycHV5ZW4vNHMxMXkr?=
 =?utf-8?B?Q3pDdlAyZjdqRGpHZzVLTVNZM1ZEWi90cXd2elMzTHh2enpiUXczUHcyNlZi?=
 =?utf-8?B?ZUo3dUl6eUlXOWNZVXhTSVk4K0FBdURYZ1hDTGRQV3hEZE5YdzNDUUJZa1pk?=
 =?utf-8?B?dGE2SlRBN0RpWXpIL2RUbUVvUHU5TEt3SUlDbDN0dWdNc3RJWHF0b29xUWlN?=
 =?utf-8?B?c0Nxck1aUHhXbWRnMnpTVVhxR200eFB1UllLakRKaytCOHY2dDgwaHBPQlRP?=
 =?utf-8?B?dEJDeTMwTW1uMndjWVJneG9oSk0rVTBSTEFkSC9kOUFlSGtsd1gvdHpTMWps?=
 =?utf-8?B?b1N0alcrWG1VTHFmeXl6aTBvSk5uVmFtTi9QMzJ2RzRHeVkwMFFhUDV1VStN?=
 =?utf-8?B?cmZHdHBCNVdKY2J1Z3JSVmxPL3FMUVFoVkxCZ0dVNnAzK1Bpb1E3cFVXcklS?=
 =?utf-8?B?dFlZazBpeXFDMXFjYXdlemdSVWxKTUdOK3NEYnlJdHhMTTRRc29FUHl2RTFH?=
 =?utf-8?Q?+W4LEz/aOAjjMm4fq8Tuw+prE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db1ec84a-4999-40c7-f9cf-08dd207d3c9b
X-MS-Exchange-CrossTenant-AuthSource: SA0PR12MB4557.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Dec 2024 22:34:01.7907
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jv7G/JM5D08B8UVjaeOr82YVg2aRpni09LU4QbL/VxnMfs+5GDN95qUTE/wD1q+1
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8146

Hi Tony,

On 12/19/2024 3:45 PM, Luck, Tony wrote:
>>>>>>>> It is right thing to continue assignment if one of the domain is out of
>>>>>>>> counters. In that case how about we save the error(say error_domain) and
>>>>>>>> continue. And finally return success if both ret and error_domain are zeros.
>>>>>>>>
>>>>>>>>        return ret ?  ret : error_domain:
>>>>>>>
>>>>>>> If there are many domains, then you might have 3 succeed and 5 fail.
>>>>>>>
>>>>>>> I think the best you can do is return success if everything succeeded
>>>>>>> and an error if any failed.
>>>>>>
>>>>>> Yes. The above check should take care of this case.
>>>>>>
>>>>>
>>>>> If I understand correctly "error_domain" can capture the ID of
>>>>> a single failing domain. If there are multiple failing domains like
>>>>> in Tony's example then "error_domain" will not be accurate and thus
>>>>> can never be trusted. Instead of a single check of a failure user
>>>>> space is then forced to parse the more complex "mbm_assign_control"
>>>>> file to learn what succeeded and failed.
>>>>>
>>>>> Would it not be simpler to process sequentially and then fail on
>>>>> first error encountered with detailed error message? With that
>>>>> user space can determine exactly which portion of request
>>>>> succeeded and which portion failed.
>>>>
>>>> One more option is to print the error for each failure and continue. And finally return error.
> 
> There's limited space allocated for use by last_cmd_*() messages:
> 
> static char last_cmd_status_buf[512];
> 
>          seq_buf_init(&last_cmd_status, last_cmd_status_buf,
>                       sizeof(last_cmd_status_buf));
> 
> If you keep parsing and trying to apply changes from user input you will
> quickly hit that limit.

oh. ok. Good to know.
> 
> 
>>>>
>>>> "Group mon1, domain:1 Out of MBM counters"
>>>>
>>>> We have the error information as well as the convenience of assignment on domains where counters are available when user is working with "*"(all domains).
>>>
>>> This may be possible. Please keep in mind that any errors have to be
>>> easily consumed in an automated way to support the user space tools
>>> that interact with resctrl. I do not think we have thus far focused
>>> on the "last_cmd_status" buffer as part of the user space ABI so this opens
>>> up more considerations.
>>>
>>> At this time the error handling of "all domains" does not seem to be
>>> consistent and obvious to user space. From what I can tell the
>>> implementation continues on to the next domain if one domain is out
>>> of counters but it exits immediately if a counter cannot be configured
>>> on a particular domain.
>>
>> Yes. We can handle both the errors in the same way.
> 
> I think it is simplest to make the "same way" be "fail on first error".

Ok. Sure.  Will do thanks.

-Babu

