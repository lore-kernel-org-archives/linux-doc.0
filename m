Received: from NAM11-CO1-obe.outbound.protection.outlook.com (mail-co1nam11on2066.outbound.protection.outlook.com [40.107.220.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBBB191F8E;
	Thu, 23 Jan 2025 19:53:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.220.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737662018; cv=fail; b=mgeaxab3/fMsaageLyMgWfk+iXrisSod7c6x6GUfc6EcxAzCNYVE0sEExqRYGue7dD+HzjOM3aLi2HrFpKil6LbrsNJGx2v62HuhgWyXen1KWlvrW0CRBvCET7V4tXxCWH4RkyJWqCrGMTqIqIe/L3hWJCisNLFDtByxsy9yZQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737662018; c=relaxed/simple;
	bh=BbKqQ+R68ZW2xPhdGn8bRwutz7N5gaekbAx7XLY2Mxc=;
	h=Message-ID:Date:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:MIME-Version; b=t9+JCVTtCf1t9UatE3y9mPPO74n40TWCyMa1QBGpHbEyHa3JEXMkh2pynM9aWQAlnm2AevyK2ajVBQyzaQDpH3675EOrS+Ua/qQclxNQL3ukfGdjKwl9m3ogpoT2+SQxYSMn4g1Yv1UJ2eOv4tQXInLWRBQ30VHQukNjMvIJdT0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=cBuJjZTz; arc=fail smtp.client-ip=40.107.220.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="cBuJjZTz"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jrKIkhkvmdSGdOodeO1quSLD12/5cA/5H1V6KajlcW4EiW+NThvGWLGb9Q6QN3qi3K4xbPKdLKR9SIDB+CPQPSVjSaq9CWC98hvjn+wFUSfiGFxCoNqMCJcOLyZmJl45z6PyV9rFi/xKeaAWQ+jzxvl+Fjah3wIxgLYYKHqy4Nz9s3xPYBPRyYAQ2hO4uJgQUwK7U+9u6Dlu/97kaMcKP1oho4TBmNeQzVaeyxOzUD4grA7g3EMeoZwx0cOXZYyfAQO/aQhHTHCZvakLCTU5HrrD6bwguohhuCBpCXG6McgFrjkUgIbBqlSUpv6lAlWckLAbnLGT1nK77EuLNA6pLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YyRhU4uELFweRX1XkSUB9pusH+RdTNcLTpmWrcbgbAU=;
 b=HvZCoghojwc6tqyT1z1bAwXYGR5gz8AgykA+ESzOrblqIH4F2axZA0BFpvc0bMSUP7I1Fx3EOyVDNCv5ipHF/F3vQ34ri83jnVYVarSfsGdtdXZXanjYlEMq2uU46Tk1idr20acMNL/oSOaJHtlCfWB/jJ3D0irCQSKgNwWZS3m2MfjCzuxXeflBy+SAHWfQm2zjr2oRxMeoT5r/xeitjVQ6eSMJmTMa2gCRIJC8txIBh/Rde6vzUaMNOvze/N3ZYetQtyrrF1ImTXaTZvFAP9GZdPe9EurogMZEvzzI30iOTjtu3V9srVHSsCMGKC5764/fU8d0tJ++lfCStxlo6A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YyRhU4uELFweRX1XkSUB9pusH+RdTNcLTpmWrcbgbAU=;
 b=cBuJjZTzjaMmEk0gfIyQalMr6oLSXxCZJb+4MqZ19nVkz6enuUFYBg4+xAkcCO5g05FNEKHH6v+P1nENOAkDfiqHWpwzK01L7eWfvHHXW+rAPc6NIPA3+sS7jTy/MRfhXRq/ML6PWa+XgU8As/D58gQb7fNqnfv1pQGiH2HPIWw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by MN0PR12MB5763.namprd12.prod.outlook.com (2603:10b6:208:376::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.16; Thu, 23 Jan
 2025 19:53:33 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 19:53:33 +0000
Message-ID: <894e5a04-8659-4734-8a19-98c562667560@amd.com>
Date: Thu, 23 Jan 2025 13:53:27 -0600
User-Agent: Mozilla Thunderbird
From: "Moger, Babu" <babu.moger@amd.com>
Subject: Re: [PATCH v2 5/7] x86/resctrl: Add interface to enable/disable
 io_alloc feature
Reply-To: babu.moger@amd.com
To: Reinette Chatre <reinette.chatre@intel.com>, tglx@linutronix.de,
 mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com
Cc: fenghua.yu@intel.com, x86@kernel.org, hpa@zytor.com,
 akpm@linux-foundation.org, paulmck@kernel.org, thuth@redhat.com,
 rostedt@goodmis.org, xiongwei.song@windriver.com,
 pawan.kumar.gupta@linux.intel.com, jpoimboe@kernel.org,
 daniel.sneddon@linux.intel.com, thomas.lendacky@amd.com, perry.yuan@amd.com,
 sandipan.das@amd.com, kai.huang@intel.com, seanjc@google.com,
 xin3.li@intel.com, ebiggers@google.com, andrew.cooper3@citrix.com,
 mario.limonciello@amd.com, tan.shaopeng@fujitsu.com, james.morse@arm.com,
 tony.luck@intel.com, peternewman@google.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, eranian@google.com, corbet@lwn.net
References: <cover.1734556832.git.babu.moger@amd.com>
 <467077e6fcf2ffeb9f20204671b6902b85974820.1734556832.git.babu.moger@amd.com>
 <6f7064af-0680-4b5d-9165-1687137eaba9@intel.com>
Content-Language: en-US
In-Reply-To: <6f7064af-0680-4b5d-9165-1687137eaba9@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SA1P222CA0116.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:3c5::20) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|MN0PR12MB5763:EE_
X-MS-Office365-Filtering-Correlation-Id: db2bae4d-3717-4809-3940-08dd3be79e4e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NjZOdnJVNFo1d28zLzNtQkRqdkFnZUNFeE5seEJabUNtRk13TGM5ODEzbFVj?=
 =?utf-8?B?MlEyYldLM2dIWDRlQXdpb0czT3Bpb2lIbmVwVUFtbXlLaGNSL2U5R09EL3RD?=
 =?utf-8?B?Sk5QWXRSRVY4QnF5ayt0QUNFUEZnRjAvNDZzUjlaK3pSbFFZMVJ5K24xUklu?=
 =?utf-8?B?cGc3Y2N5Z29ORzhKUW9vNklCaE1xVVdnQ1hHaXphSm5CaWFOSDViYWx1U0dn?=
 =?utf-8?B?N1pGZ3MyRHh1TmYrRzZqdnE1aFdKRWt3MXhkNksxUnRpYWg4dGhvRDJvcTJk?=
 =?utf-8?B?T08waVM0dm1CbEZIMnc3MlMrTzVjMGVaamtwcnl0UGlrWlJjSE9XSVFONndC?=
 =?utf-8?B?dzZidFFVUDdGYlhQUnVPbnlBdFpFdjVqS0F3M1Ftd0gycUprbjdRT0N4WHJD?=
 =?utf-8?B?NFZtMXpNSFRNMFRKcng2VkJra1FUQ0VHbzJqb2xHcnZITmw0enduSTNsalBJ?=
 =?utf-8?B?TmJpVnpRRHJiN2ZnZ1hiOFdIMk13aUtoRTVWV25MY0hiVFkxWHFEaCtWSjNx?=
 =?utf-8?B?SDRtY3E2OFl4dk9vYTNyK0l3cFNzV0diTkxjbEJLTUFsY2IyalZSa0IwRy9R?=
 =?utf-8?B?aTk2bENORXprdGlLWFFvcFRWa2xWTk54N2dQOEc3eWFQZXdzOGZPMXNid25r?=
 =?utf-8?B?YWJCOGw2VmkrNHd5OGJMdWRsMDUxT3gxektEb3JmcWc3azBiL05LaGZRa3VJ?=
 =?utf-8?B?UzJsV3E2MUFtTVlhVlBSZkU0UVMxOHgyMDVCV0FFbjhIOEUwVC91azh0L3BT?=
 =?utf-8?B?SWZaQmRjeVNUVWNQd1ROazQxSFFHcGcxSWgwZ3BVd0pOZnBkeGdUWDIvYWJz?=
 =?utf-8?B?NjMxQzF0NHhNT05JSE16N2NkbGJqRmJ4NVB0UVFHSzByNkJvZisxekxkMHFp?=
 =?utf-8?B?Q3RNT2gxR3A2UUhuRTRtT0RkREFtRkp2RU1PRkRsU1JkeVZmcVFkVElPUFZ2?=
 =?utf-8?B?cXRWcDRRVHk4N2RYR2c0RDVTbmhMYURVdHo3UkNFNzJDeVFrRmtsQS8rakVp?=
 =?utf-8?B?NUFzdEZvOHYyUVlhcXFxalh6SU1yT0cvSkRhS0Q4K1dEZ1BJRnk3NWFjZXZQ?=
 =?utf-8?B?N084ai9yQ2NhYWc4NndFUFNFSmNvOVV4eEpDMUMwQnRiVmxma2MrRmNHTWpz?=
 =?utf-8?B?bkZ0NytIU0lTbmJSN3ExaGVobVJpQVVZU1hrOUhVbjBOTmtWR0owTDFRYXV1?=
 =?utf-8?B?SHhCdHJhMjB5REovd0ltVmNCQ1lkMUhSQ1lxd09kdkRQektPZ2ZBTWhjeVpo?=
 =?utf-8?B?MyszOFlnSTVMem5YL2RnRkFQUjk1MDVJT1RSanNCQWFEOC8vekxwZGFjNkp1?=
 =?utf-8?B?ZVFUL3JyLzB6TFdoZU1iR1hIRnZUVW84bXJMcHk5Q3RvbXpOVVUzYXhwbmpv?=
 =?utf-8?B?OXBLTzk1Uk5CdHAyREs3bGpxN2ozL0dmRzA2WXF4NlczSmdpcDFvV3JCMmFt?=
 =?utf-8?B?T0VRVThjTnpFZVQ4L3IrcE5RVWwyRVdoYm44cGgwZXNVL1oxa1JLU3h4WUJu?=
 =?utf-8?B?b0Z2c1N3MmlRbWZIOWxQM3RSak56QVRseEh0Um9DaTAwMGVXZzNpaDU0Rm9O?=
 =?utf-8?B?ZTh5ZHBIYmFLYm8rZzlTRmtGTi9KTGZvQ1pCOVBrdkNLN3Q4ZGF4ZTJJT084?=
 =?utf-8?B?dVZFd01yendIdHJ5VFQvN1hnM3FMb3EvbTZueVBlN2hBNFNLcHpOSENGVkZR?=
 =?utf-8?B?WGRUbEZZZ0lPUXNHY1c5WVQ4UGhBakF5d2lMTmNRQ09CM0JQTjZmNUxrbm5a?=
 =?utf-8?B?MXU3aVNPM2FxZlZpR2VpSXVWVHIwaFhXM3RZcmRmT1FSRzVFY09RMC9keGJG?=
 =?utf-8?B?YndkT0tsZU1kYmN3RGhxbktoNWdTN2Z1UFVJWmIwU1lwUUlqVGsrckFFOCtz?=
 =?utf-8?Q?7auyee5t5ULZa?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?aGhpcWVTMzR5NUdzRE5NTnhnUFdmT0x2enRVd2ExNVNoc1ZieGZNWWZZZE5s?=
 =?utf-8?B?MzJqQjBJdis0UllRL2x3cVpRWENmNUVIV2lQU05QeTRyc0k0L0tzZzhMMnor?=
 =?utf-8?B?bk04eEQ0djd0M1dUbmpDYzBkUGVVb2VabDlIVFozMFNwWGhWQ0dBNFJ6UjU5?=
 =?utf-8?B?RWdoeFYySkFlWXZLczlmQW40SlBLMk9nb2tFNXhkUnZucCtpWWVFQ0JBNjZk?=
 =?utf-8?B?eFREY2pKU1kzblp4TzlLVU52YkRleTM5TkdTa3hyVDYrRGRaOThzeS90bjU4?=
 =?utf-8?B?cWluWnJXSm9XNGVWT0U5aFVVa3lZVWVSc1VOWmJYV1Y2SjlXYWJOMVJ1ZjN6?=
 =?utf-8?B?RDgrZzUxdXFSS0R5ZTlGYVdISHlQRVdHWWY4YjBCTGQ5YWkvdTUzb0N6MmNs?=
 =?utf-8?B?MkQ3ZUtKbDhRQk95cTJkWVVRQlBXdS9vNVNYV1lqT1NwS1BWVW5KNWxXQVkx?=
 =?utf-8?B?Vk55b2U5KzJLODBFdlpxOUJzbmx0T3V5Z2djYUhJS2hkdWl0L0Y2SlgyVGNO?=
 =?utf-8?B?ZkFya3ZzTUk3bHFhZ08wNG0ycHN4SG5NalNDcjd0eEhNcnVNbjl1WitYMmdl?=
 =?utf-8?B?VjFKd1hYUDIrWmVvbDlQajJneTc5eWJTcVJlbGkzdC9POWdtekc5VUZKS210?=
 =?utf-8?B?Z2E3WUtIanNEU1hhVlFIUjhHQ2tWM0pNMEMzbWZqREJjcjV5OGRXaUFlMW91?=
 =?utf-8?B?LzRscVpEYkJLQURncTdpT0QwMGJmVGRFTm1Gd25Ebjc0VTRyU3NrblZBdFRJ?=
 =?utf-8?B?dDcrcjVFNlEvdVUxRVF0U28yQWxZRHJCWG9BQzhrZzY1anZjSzRSaWRlVS9k?=
 =?utf-8?B?SGg4dmN3V1VNaGF5MW92UlF6ZmptZGQrTWpQeWNNWGxtbW1sb1BTZGNFVWg3?=
 =?utf-8?B?S1hPRS82NDh2YnFuUjBrZTdtd3pndVBGMWR5VTh3VGNlaHNGRXhJY0NzeHdR?=
 =?utf-8?B?bTZxRHFrSnNJekZrMnkraXVNS0RpQlV6dnFHUFY0em1Ga2Zzd0pXYzkwNSt4?=
 =?utf-8?B?dk53MGdoU2R5WDBuQzcxbzZ4KzR0eXM3c3pzRkwvMWtIY3lpNUFpSDEwYlAr?=
 =?utf-8?B?dW9wQXVHRVJyeUJRc3BNbG1ZMHE0R24xOHdBcy85T0tiUkdCdmZiWFpwZFpn?=
 =?utf-8?B?b0VNaFlkMkJSVnYvdUk5NEs5VWxlYUhPV3JtQ3Y5SVZ1MmFvVmVZa0NtbGZt?=
 =?utf-8?B?cXlRWWN0UzczVGNDM3ZIKy9EZyt5eHJaT2haM0JkaFJVcGY1S2F4QkRyRzY5?=
 =?utf-8?B?emg3dEQ5NUhTMG1Ra2NkV3Q1Z3gxbEVHM1d3cHFjUE1keTloR0xsOVdiaDlH?=
 =?utf-8?B?OFVYcDRrQTNuSkFLcElHbFJjUE4yaDVmb3ZmeXg0UkpTVS9sU1ZObUkySmQ3?=
 =?utf-8?B?UTJXRkVUaHhuMWxzL0xzSUxKVERSNUh5RVJWN1VNR3R0WGhPdmRFWXQ1dHZ4?=
 =?utf-8?B?ZEo3WG9mRFBRWkFVbVJ4NzRQNFBTN2tDdXl3Y2p4T1lOMjBuMFl2R3BaSHdD?=
 =?utf-8?B?SGpKRUoydm9PU2h2eEwwNFo1VWM4ZWtjVVBNV2JFcUhzSGRzUTl1aDIrQ3Av?=
 =?utf-8?B?Q1c3Z1NJUFNLOURRT1lZOWsxYnVrbVErUG5ObzY2N013YlBIb290MldSQ0dF?=
 =?utf-8?B?dno1TmRPV3dHcWJOUlhlZXMxMG1xZkZGUVB5QVVjUjRkb3RFSTJvenhlVTRI?=
 =?utf-8?B?MmI1Q2IzeDA4a2V1dU1sMzVkVzc2WFFTZmQzTlR3L2szSzB2UVF6ZWxDa1R1?=
 =?utf-8?B?ckJSbmZZb0p0OUhoYzBOWXM5ZzJxWTdhaTJtb2RBMlg1TDVBckd0akhVZDBp?=
 =?utf-8?B?NzY5cDlvcjFWbzlUQzlmRXMzYzU5cnJOazViRjhhdW8ycUw4TWdjSDZNQ0VB?=
 =?utf-8?B?eURuNitoN0lnUHlqUTd4M2R6NWFHKzI3c1B5NSthN2NJQVBmRGcwUEFyTjB0?=
 =?utf-8?B?M25WaDNyVTN3bzVwQzNUOTR6OFRrNk1CcVR0ZXVRTTYxQ0FBZXFKU2ZlQndh?=
 =?utf-8?B?MWxsaWczczdrNUNWVGVjOGxmNnBLTXBqUktqWUxhQWpLQ2lRZUhiaWRTbzdJ?=
 =?utf-8?B?ek5oZ2QrWDhuS0hBTVZvd2FiK0hYejJOamI5L2F5aVlXbkhHQUNtNmp4VFky?=
 =?utf-8?Q?VSnw=3D?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: db2bae4d-3717-4809-3940-08dd3be79e4e
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 19:53:33.7020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ya4xmCwg2eqk0scwoLGdUoOzlx06RVcErNHnZ5Q4MGiUjDh+pnYpATY1da1yNLOs
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5763

Hi Reinette,

On 12/23/24 15:37, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/18/24 1:38 PM, Babu Moger wrote:
>> The io_alloc feature in resctrl enables system software to configure
>> the portion of the L3 cache allocated for I/O traffic.
>>
> 
> Above is about resctrl feature.
> 
>> Smart Data Cache Injection (SDCI) is a mechanism that allows direct
>> insertion of data from I/O devices into the L3 cache. By caching I/O
>> data directly in the L3 cache, instead of writing it to DRAM first,
>> SDCI reduces DRAM bandwidth usage and lowers latency for the processor
>> consuming the I/O data.
>>
>> When enabled, SDCIAE forces all SDCI lines to be placed into the L3 cache
>> partitions identified by the highest-supported L3_MASK_n register as
>> reported by CPUID Fn0000_0010_EDX_x1.MAX_COS. For example, if MAX_COS=15,
>> SDCI lines will be allocated into the L3 cache partitions determined by
>> the bitmask in the L3_MASK_15 register.
> 
> Above is about AMD feature.
> 
>>
>> Introduce interface to enable/disable "io_alloc" feature on user input.
> 
> Back to resctrl feature.
> 
> Please do not jump from resctrl to AMD feature in a way that makes it seem that
> they are interchangeable. To help with this you could use similar style as in
> ABMC where the text flows like:
> 
> 	<resctrl feature description>.
> 
> 	On AMD <resctrl feature> is backed by <AMD feature> that <AMD feature details>.

Yes. Need to rewrite the commit log.

> 
>>
>> Signed-off-by: Babu Moger <babu.moger@amd.com>
>> ---
>> v2: Renamed the feature to "io_alloc".
>>     Added generic texts for the feature in commit log and resctrl.rst doc.
>>     Added resctrl_io_alloc_init_cat() to initialize io_alloc to default
>>     values when enabled.
>>     Fixed io_alloc show functinality to display only on L3 resource.
>> ---
>>  Documentation/arch/x86/resctrl.rst     |  27 ++++++
>>  arch/x86/kernel/cpu/resctrl/core.c     |   2 +
>>  arch/x86/kernel/cpu/resctrl/rdtgroup.c | 118 +++++++++++++++++++++++++
>>  3 files changed, 147 insertions(+)
>>
>> diff --git a/Documentation/arch/x86/resctrl.rst b/Documentation/arch/x86/resctrl.rst
>> index 6768fc1fad16..52679175ee14 100644
>> --- a/Documentation/arch/x86/resctrl.rst
>> +++ b/Documentation/arch/x86/resctrl.rst
>> @@ -135,6 +135,33 @@ related to allocation:
>>  			"1":
>>  			      Non-contiguous 1s value in CBM is supported.
>>  
>> +"io_alloc":
>> +		The "io_alloc" feature in resctrl enables system software to
>> +		configure the portion of the L3 cache allocated for I/O traffic.
>> +
>> +		Smart Data Cache Injection (SDCI) is a mechanism that allows
>> +		direct insertion of data from I/O devices into the L3 cache.
>> +		By caching I/O data directly in the L3 cache, instead of writing
>> +		it to DRAM first, SDCI reduces DRAM bandwidth usage and lowers
>> +		latency for the processor consuming the I/O data.
>> +
>> +		When enabled the feature forces all SDCI lines to be placed
>> +		into the L3 cache partitions identified by the highest-supported
>> +		CLOSID (num_closids-1). This CLOSID will not be available to the
>> +		resctrl group.
> 
> Same comment as V1. The above two paragraphs cannot be guaranteed to be
> specific to the "io_alloc" feature ... it is only specific to SDCIAE. 

Yes. Need to rewrite.

> 
>> +
>> +			"0":
>> +			    I/O device L3 cache control is not enabled.
>> +			"1":
>> +			    I/O device L3 cache control is enabled, allowing users
>> +			    to manage the portions of the L3 cache allocated for
>> +			    the I/O device.
>> +
>> +		Feature can be enabled/disabled by writing to the interface.
>> +		Example::
>> +
>> +			# echo 1 > /sys/fs/resctrl/info/L3/io_alloc
> 
> Similar to comment of V1 there is no information about what user can
> expect when enabling this. For example, if this fails then one cause may
> be that a resource group already owns that CLOSID and that removing that resource
> group would make it possible to enable this feature. Even so, user space does not
> know about CLOSIDs, only resource groups, making it difficult to correct without
> more help. 

Yes. Additional documentation required.

> 
>> +
>>  Memory bandwidth(MB) subdirectory contains the following files
>>  with respect to allocation:
>>  
>> diff --git a/arch/x86/kernel/cpu/resctrl/core.c b/arch/x86/kernel/cpu/resctrl/core.c
>> index 39e110033d96..066a7997eaf1 100644
>> --- a/arch/x86/kernel/cpu/resctrl/core.c
>> +++ b/arch/x86/kernel/cpu/resctrl/core.c
>> @@ -309,6 +309,8 @@ static void rdt_get_cdp_config(int level)
>>  static void rdt_get_sdciae_alloc_cfg(struct rdt_resource *r)
>>  {
>>  	r->cache.io_alloc_capable = true;
>> +	resctrl_file_fflags_init("io_alloc",
>> +				 RFTYPE_CTRL_INFO | RFTYPE_RES_CACHE);
>>  }
>>  
>>  static void rdt_get_cdp_l3_config(void)
>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> index 398f241b65d5..e30731ce9335 100644
>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>> @@ -62,6 +62,7 @@ static char last_cmd_status_buf[512];
>>  
>>  static int rdtgroup_setup_root(struct rdt_fs_context *ctx);
>>  static void rdtgroup_destroy_root(void);
>> +static int rdtgroup_init_cat(struct resctrl_schema *s, u32 closid);
>>  
>>  struct dentry *debugfs_resctrl;
>>  
>> @@ -180,6 +181,25 @@ void closid_free(int closid)
>>  	__set_bit(closid, &closid_free_map);
>>  }
>>  
>> +/*
>> + * io_alloc (SDCIAE) feature uses max CLOSID to route the SDCI traffic.
> 
> Please do not use io_alloc and SDCIAE interchangeably.

ok

> 
>> + * Get the max CLOSID number
>> + */
>> +static u32 resctrl_io_alloc_closid_get(struct rdt_resource *r)
>> +{
>> +	return resctrl_arch_get_num_closid(r) - 1;
>> +}
>> +
>> +static int resctrl_io_alloc_closid_alloc(struct rdt_resource *r)
>> +{
>> +	u32 io_alloc_closid = resctrl_io_alloc_closid_get(r);
>> +
>> +	if (__test_and_clear_bit(io_alloc_closid, &closid_free_map))
>> +		return io_alloc_closid;
>> +	else
>> +		return -ENOSPC;
>> +}
> 
> This does not look right. The way resctrl manages CLOSID is to use the
> *minimum* of all CLOSID supported across all resources. It may thus be possible
> for the L3 resource to support more CLOSID than other resources causing
> the closid_free_map to be sized to a value smaller than the L3 max CLOSID.
> The bit being tested/cleared here may thus exceed what is in the bitmap.

That is correct, though chances of that happening is rare.

Hardware needs to program L3 max CLOSID to support this feature.

So, our option is to add a check here to verify that. If the check fails
we can report error and exit.

> 
> Also, during V1 we discussed how CDP was not handled and I am not able to
> see where/if it is handled in this version.

https://lore.kernel.org/lkml/ecdffce0-796b-4ebe-8999-73f2be1e703b@amd.com/

This is another case where we need to allow SDCIAE even when CLOS 15 is
already taken by CDP. Will add the check and documentation about it.



> 
>> +
>>  /**
>>   * closid_allocated - test if provided closid is in use
>>   * @closid: closid to be tested
>> @@ -1832,6 +1852,97 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>>  	return 0;
>>  }
>>  
>> +static int resctrl_io_alloc_show(struct kernfs_open_file *of,
>> +				 struct seq_file *seq, void *v)
>> +{
>> +	struct resctrl_schema *s = of->kn->parent->priv;
>> +	struct rdt_resource *r = s->res;
>> +
>> +	seq_printf(seq, "%x\n", resctrl_arch_get_io_alloc_enabled(r->rid));
>> +	return 0;
>> +}
>> +
>> +/*
>> + * Initialize the io_alloc feature default when enabled
> 
> It is not clear what this comment describes.

Yes. Need more details here.

> 
>> + */
>> +static int resctrl_io_alloc_init_cat(struct rdt_resource *r, u32 closid)
>> +{
>> +	struct resctrl_schema *s;
>> +	int ret = 0;
>> +
>> +	rdt_staged_configs_clear();
>> +
>> +	list_for_each_entry(s, &resctrl_schema_all, list) {
>> +		r = s->res;
>> +		if (r->rid == RDT_RESOURCE_L3) {
> 
> It looks like the function ignores the resource provided to it via function
> parameter and instead uses internal hardcode of which resource to act on?

Yes. This check is not required. We can get the schemata directly.

> 
>> +			ret = rdtgroup_init_cat(s, closid);
>> +			if (ret < 0)
>> +				goto out_init_cat;
>> +
>> +			ret = resctrl_arch_update_domains(r, closid);
>> +			if (ret < 0)
>> +				goto out_init_cat;
>> +		}
>> +	}
>> +
>> +out_init_cat:
>> +	if (ret)
>> +		rdt_last_cmd_puts("Failed to initialize io_alloc allocations\n");
>> +
>> +	rdt_staged_configs_clear();
>> +	return ret;
>> +}
>> +
>> +static ssize_t resctrl_io_alloc_write(struct kernfs_open_file *of, char *buf,
>> +				      size_t nbytes, loff_t off)
>> +{
>> +	struct resctrl_schema *s = of->kn->parent->priv;
>> +	struct rdt_resource *r = s->res;
>> +	u32 io_alloc_closid;
>> +	bool enable;
>> +	int ret;
>> +
>> +	if (!r->cache.io_alloc_capable)
>> +		return -EINVAL;
>> +
>> +	ret = kstrtobool(buf, &enable);
>> +	if (ret)
>> +		return ret;
>> +
>> +	cpus_read_lock();
>> +	mutex_lock(&rdtgroup_mutex);
>> +
>> +	rdt_last_cmd_clear();
>> +
>> +	io_alloc_closid = resctrl_io_alloc_closid_get(r);
>> +
>> +	if (resctrl_arch_get_io_alloc_enabled(r->rid) != enable) {
>> +		if (enable) {
>> +			ret = resctrl_io_alloc_closid_alloc(r);
>> +			if (ret < 0) {
>> +				rdt_last_cmd_puts("io_alloc CLOSID is not available\n");
> 
> Can this be more useful to the user? The user does not know what the CLOSID is nor
> what can be remedied to fix this. What if the message instead contains the name of
> the resource group to which the CLOSID is assigned so that user knows which resource
> group could be removed to be able to enable io_alloc?

Yes. We can do that.

> 
>> +				goto out_io_alloc;
>> +			}
>> +			ret = resctrl_io_alloc_init_cat(r, io_alloc_closid);
>> +			if (ret) {
>> +				closid_free(io_alloc_closid);
> 
> Could you please make a resctrl_io_alloc_closid_free() that is symmetrical to
> resctrl_io_alloc_closid_alloc()?

Sure.

> 
>> +				goto out_io_alloc;
>> +			}
>> +
>> +		} else {
>> +			closid_free(io_alloc_closid);
>> +		}
>> +
>> +		ret = resctrl_arch_io_alloc_enable(r, enable);
>> +	}
>> +
>> +out_io_alloc:
>> +	mutex_unlock(&rdtgroup_mutex);
>> +	cpus_read_unlock();
>> +
>> +	return ret ?: nbytes;
>> +}
>> +
>>  /* rdtgroup information files for one cache resource. */
>>  static struct rftype res_common_files[] = {
>>  	{
>> @@ -1984,6 +2095,13 @@ static struct rftype res_common_files[] = {
>>  		.seq_show	= rdtgroup_schemata_show,
>>  		.fflags		= RFTYPE_CTRL_BASE,
>>  	},
>> +	{
>> +		.name		= "io_alloc",
>> +		.mode		= 0644,
>> +		.kf_ops		= &rdtgroup_kf_single_ops,
>> +		.seq_show	= resctrl_io_alloc_show,
>> +		.write		= resctrl_io_alloc_write,
>> +	},
>>  	{
>>  		.name		= "mba_MBps_event",
>>  		.mode		= 0644,
> 
> Reinette
> 

-- 
Thanks
Babu Moger
