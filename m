Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2059.outbound.protection.outlook.com [40.107.212.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0991125949C;
	Sat, 21 Dec 2024 14:34:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.212.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734791651; cv=fail; b=NcrtO/NQVzjhcY/bcFPwau/9N4yh52A5RplOexkzCC0OYAB1wrIROlibOmCLWv14QhT7taYiXwxsboW8/nFqagO54TuBpBX0HWJsBbjlThAcPTArOKxgLKyJ3EvzS+eslGV9uTSJ4kP2n99tzXbEAKdJFarV15LWzfauV10fRSo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734791651; c=relaxed/simple;
	bh=Pe5QOlRxWiwNI39hp1NcxIFs1k3yGZgO+PaZhp8Ej3Y=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VWXt+pmqTlHiC6gvEyReEfelsn6Jt7+EWWfZVZwojmJkYzSjV+0UFCyY7aMb1DQGXmcFyCvYFIVGlPzoh2LR635Bre3lbaXALseruu+AfmirxKx3JsUr9tEQEc4o6BCbAHX2d2X2h4LnyZEeutAtJFWx+jPHbWLkq/fNGEq/6Hk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=KVynWBl/; arc=fail smtp.client-ip=40.107.212.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="KVynWBl/"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i6+wQOGLYDElbTLdArD10ECbTuiKPPNl3tcyr3tisNxYdWOLKEVJ1i12BIYQV2ODB2LpCYJn/as9vqaORhdbRTMQxU1eyp0CGUE/SEGF85vCo7sb1Biccomou9BtG4rUBfAxsIpw09mSHqoNC1w09djSFcnzsXFMvDJwPk4mjPTlq+QAfmrb5VxIRsmBJBDHJa3n22IOfbJVJZIYgGWTdn0Pq+FLL77rgDah++7I396NHbdtQiIOLa/S/JoMdCpMHFdppdvdlaQ49Dee5UZOwa56IQ6Hwv0Qgq9XAfeveBVWE265PN7bIR0zUoko5UD9qLhk566TS2AMWhEjbpZpcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0YEeqT3+IlCBzm4MjyMgnIPjtJiNRv7lN4EwKwTdfg=;
 b=rXslamJtu3M/wz45H3zaz+iQ7vHVq7sXE8QRGA1gp1k9hK4b0Mz9Q9DykuTkR86i1NE8Qo7Lfgt9pAwhpKp+fmOpUEbkrkf24yCykNmycE/10zlo3PopFSNt6wEZH8/NnMt8tsbOrgFe9kejUkGSfcayghcGrbRE+hqMcbF0XLFO96/7j8MKvsuK2/nH7NTY0wtJzXhFnXyvV/+c6hSq2faZT5J4bMxeR9/ppWFhG/1boNddmpLk/6KgdxXh2RE44Hm8Zdbsi72lqFOG5u5WMA4IOOgPeiGBlxTa0we24ck6aySZnx1gcrB/dZS2h0cHvbyqZDlDLwFDwDY0DNCgNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0YEeqT3+IlCBzm4MjyMgnIPjtJiNRv7lN4EwKwTdfg=;
 b=KVynWBl/fopr+OaPQmtGMRY7DK3cIbCN1/q0+ejBvHxP8MXBvKZZkYdHRc/bvfrRsrXfxwCktBKx6p8+5HnAlZWfnqbIElwz56oH0TMa96Q+wptfkgQOqpb0VF88znJgu/Bl2QFXVLda4fTW6XhGg5a6UkC035KvZvNGYgLG7bI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from MW3PR12MB4553.namprd12.prod.outlook.com (2603:10b6:303:2c::19)
 by PH0PR12MB7485.namprd12.prod.outlook.com (2603:10b6:510:1e9::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.16; Sat, 21 Dec
 2024 14:34:02 +0000
Received: from MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87]) by MW3PR12MB4553.namprd12.prod.outlook.com
 ([fe80::b0ef:2936:fec1:3a87%5]) with mapi id 15.20.8272.013; Sat, 21 Dec 2024
 14:34:02 +0000
Message-ID: <133a64f2-b509-4108-b3dc-9c58d140b25d@amd.com>
Date: Sat, 21 Dec 2024 08:33:57 -0600
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 21/24] x86/resctrl: Configure mbm_cntr_assign mode if
 supported
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
 <5ef497199a48c72a3a9100ca5e96f6a04ba94f30.1734034524.git.babu.moger@amd.com>
 <7537448f-d46d-402e-9f0c-6609f0626ff9@intel.com>
Content-Language: en-US
From: "Moger, Babu" <bmoger@amd.com>
In-Reply-To: <7537448f-d46d-402e-9f0c-6609f0626ff9@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SN6PR04CA0083.namprd04.prod.outlook.com
 (2603:10b6:805:f2::24) To MW3PR12MB4553.namprd12.prod.outlook.com
 (2603:10b6:303:2c::19)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW3PR12MB4553:EE_|PH0PR12MB7485:EE_
X-MS-Office365-Filtering-Correlation-Id: a2f0a86d-52c4-4260-28b0-08dd21cc8381
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ejZMOVJaUTlHWUtmcjF5dG9tUjIrYkE0aWI4UERkb2tJSGJtRXNjYkloS0FN?=
 =?utf-8?B?SzQ1cE9uQWM3Q1NhSHp3TlpMZkxDWC9Gd0RHZFFHWEhWanFDYzg2b0Vnc0dP?=
 =?utf-8?B?LzZUbW9GNDR2dzJRZDZNQ1NmRTZTNWVrSzBJdXk3QnpLVjQ4aHJ3OGJmbWhH?=
 =?utf-8?B?M0hBNHlZTHhzU2N6elFZdWdIK2IzWnpURmpwb1ZYWmYwaWxzK2JLUWZwMHFH?=
 =?utf-8?B?WWdFalJCRlFUQkREV0NhRHhIY09KWDR4NE9zM1MzRjh5M0VCbjU3Sy9nekRM?=
 =?utf-8?B?aWtaRS9qNUN0eWlOenRweFJvc2pYSi9ZQ2ovN3FkM0YyazJNblFiemRpWDBq?=
 =?utf-8?B?SVp4dHlGenE4R1NaMWZMYTU3MEREUlR4eTJ2WkVrUmpEN0F2eHVyK2JLWkxJ?=
 =?utf-8?B?MkdVYTVESGJpeTB6VERwb2ZXaXZXRkEzNHZsOVBCQXA5NlhjSnA2c3VsVW14?=
 =?utf-8?B?dWdocHFJM3hsVGsyODR0V0hjeFAyQzZmak42UjhBSmRXTzhnS1AzdkpVRHk0?=
 =?utf-8?B?NWIzaktnS3hNNThGOUNORUV3WXNiUEJPWWhXU0tMcDRQb2Vtd3pyQnVXNC9q?=
 =?utf-8?B?dXNoRWIrYzZUbnd1L0RJZU1JSENDNHdTZ1phcDNac01VL1hLOXAyRjM1QllW?=
 =?utf-8?B?R1FwSVRONGJqRWExZ1J0V1RNYms0eEE2aFFnNGRnRm80ZGZWdnYvMVJqOE9Q?=
 =?utf-8?B?Rit5TWFFUlVUR0Q1NXM0aFBDNzd6OERITk9sb3VmZXZpUW9PMjZQeEcwTDIr?=
 =?utf-8?B?OGo4RFpoc2xRVE5nM0owZk56OGVaOEVISFhscEpqd2dtT1pSVkU4ckxvT1FJ?=
 =?utf-8?B?b1BHQlNoQ20vK2RGOXhoUnBZbVhpMm9zWHNLVzZxSUM2cXJsR0I4TFpLcHRp?=
 =?utf-8?B?RGNVOEpZdUFFS2ZiODNsbkdZd3FkSnJoTEtwTmMzZ2RtcmFaVXo0QlFUUUFP?=
 =?utf-8?B?Uy9CdHQ4dFNzZ3ByemgrUXZnVFUwaENGZ01nYWZGR3pCSXpnbFhxSGpCMk1m?=
 =?utf-8?B?ZjIyQkdwMWV3dnNxUmlFTEJKL0IwMFMwUHh6MHlvTmFjM0RETk9FYWJEUDgy?=
 =?utf-8?B?QXBtMHJLVmdNVy9jR1dJNW5ObGdFZ2pWNHFtbzhCd0dYdEptS1VwUVh5ZGZG?=
 =?utf-8?B?YytMWndmTU11djlsZG9HUXl6NE9PKzlJOHZJTGhoQ0pPWDR2cllvdUFERVRE?=
 =?utf-8?B?d0R4aUtrRGVzUEFpQzJ4bEJmTFJldjhBTlpyck9odC9YMm4zSnU1bkgxS2VE?=
 =?utf-8?B?V2VteThIeGE0amkzMnROMjBkZWZxTVcxcUpTYnYrQlZhUncrZm9DTzlsNFlq?=
 =?utf-8?B?aWJMcTdreENMcXRLMVA5czl3NXhxbDlZcUxQQlNQRDNyN05yU1l4d3NTSGpV?=
 =?utf-8?B?OUdDVStTQTJrRkFRSWUyenFHaktpSDlQZE5ITGt3RGdad1RSNjU0SmJPanZ0?=
 =?utf-8?B?YndHRDV4SmRqdXJ1Skg3Q0htdzF5aEdpcy9TS29DRXhYVi81QkVRRit1bWRG?=
 =?utf-8?B?Mm1pQmZSYXNrVWpybnNrRk1jY3BSalZDemJPVlhJaGlrVEJuT3ZXeUVDOWNS?=
 =?utf-8?B?VnM3aFgyUDlNVzI5WGRVQW5DN2t5cS9uYkUwTnFPM2lwa29kVlNzdW16c1dV?=
 =?utf-8?B?MnVVaW9VOEQ0SVB4c0hNbDNaSjZlVG1pU0g0OFZudkxRUjBZTldCV0pHTnFm?=
 =?utf-8?B?V3lmOTRpK2Y4dHp4NFM5Rkc0clRnNisyMVBLbHhiL3I3d0hDWkhTQ2FEYk02?=
 =?utf-8?B?VXYrNmJNc0dZTkVZSjgwZi9UbmxvQlhTcXFEdUY4R3JzVU43b3U4Y2F5TlNL?=
 =?utf-8?B?YWJEL2dud1Q1bFgrTVZSVExtTUJMeGs2NDZrVXJyVjc4QzhDb3RDSExuTjhX?=
 =?utf-8?Q?FwMReOSQFqBGY?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW3PR12MB4553.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YjNiQ3NDQURYUjBCRWpGMEFYSDM0Mkp6emMzdE9LaXRlU3BzODFjRmNmd3hs?=
 =?utf-8?B?Y0VJb0ZXclZEYmZlQzhwU3pkKzJyMzdQNDI0c0hJZllwcFp6N1ZTRlc1MWsy?=
 =?utf-8?B?bEJUZml2enVkSE9nRGY1bFN5ZWlmWlpzL2g2VVNSYi9QNktTcXVZSDlPYXg3?=
 =?utf-8?B?UEtpZlF3NlBBb012OXJkRitWamFPMWN1MHNOT2xFSk5oeXBienZscXJtajZh?=
 =?utf-8?B?RXdNNzcxSVhTU2hWQ2trVG5xL3JPbjFsQndScjM5TjNlY2NIWDBKVVhTWWVY?=
 =?utf-8?B?dWZ2UHl1VElRd3dseHVkN1lOOFRLVnhHelp0WWZub2ZvS1FjQjBUaTdxZmZK?=
 =?utf-8?B?RVg4c2NXYlgwSjZodElpRVdsVE9aYzgxV0FyM1ErRENOZlBETHprcW9ON2xX?=
 =?utf-8?B?QmdwWUZWS09BVnNzR1VKYW1DcFNLbFVNRWJKNTBYL25SR2pFc1duVWxnYXMy?=
 =?utf-8?B?Qlp6VHZVRXM3VDRLMUY5dy9WdkNLM25FYkw4aW45aXAwVnlHZ21iTGF6OCtP?=
 =?utf-8?B?OTZyZm1IdmgrMXIreFQzQkxaTnZFSTFNaXR4Tkc3c0pCOThaRmd1R3NDdVJO?=
 =?utf-8?B?THBodFZoaTcrR2Q2MUp2bitHc2ozMzA2TXF5ejJnTTlOa1l4cmZMb0hwbHNv?=
 =?utf-8?B?bUlCaEtwWFhOMHJiYzcyeHBSTysrb3RMWXhxQnZJc0pYQzExalllMEErY2pB?=
 =?utf-8?B?djJBSG50U0ptUGt5Wm5oN2tyTGxDUEg3U2V2RGkzRTNINmY2dXBtWEd0MHpY?=
 =?utf-8?B?Y3NYVTg5V0JRYkpramJhY3ZJaHhrMVFLYWdXNjdzUjRHT2lxQ1drUEkrSjBB?=
 =?utf-8?B?d0JoWCsvUEFLSksvOGRUVmhBY24vUXdjV0JQUmM4cnBCZDYzRWU0N0w0anRq?=
 =?utf-8?B?bDF4Z2lSZkx1YTI2NU5ScjUxcDY1bUtVVk54UmFuajdjdDg4YjZNcXk4Qitl?=
 =?utf-8?B?YTNyOW9KZTdZSFJ1RFl1NWNPUjZYTTJwNEhibksrVE1Idllyd3YzNkhaam1h?=
 =?utf-8?B?OHdzSzdRaU11MzMveGpHd2xBaEVram1vRVlCUmdtVUxjejRqbWJtZllhVml1?=
 =?utf-8?B?elk0elVjSXU3c1VZUkI4QWhMYkxaeDNsQW5waVNKNEJlVWlHME1jU1pBdTZ4?=
 =?utf-8?B?VkVTSDlSaURndGtoaWpucnlYa29ocG1PYlRPNWpENGFnTW5LRkhycjBld0RI?=
 =?utf-8?B?QXVMYUh5QytwMGN2R0M4N0V0WmdLc1Q2d3BuaXpXb21ZNHpmeEEvVEY1d1BS?=
 =?utf-8?B?a1h6TnpNV0NTRStFN0dtTDJjaDhTSXFySXpkVXZ6UU8xYnlPcUd5M29Tcjdq?=
 =?utf-8?B?ajJSSW9NckswZXNTV1ozL1laRW5Tb0dxQStpNDl2TjVDdTFwYUsvbzhvc3hI?=
 =?utf-8?B?QUFaZGRKeTJOeFlHNElZeHVNbDlaSFlPZFlWZCtuQlJGTXF2d280d1A4SU1z?=
 =?utf-8?B?LzNXZHRDRG9IaHhEc09qMmRubHNvRGFZRmNLTHc3dldBSDNOQmYySVZJUUpT?=
 =?utf-8?B?VFVnZFQyZEJOZmtRUUwrNVFXVm8yTllKZXMzaXlPVTV0Uldqdk1XR0pJSjlk?=
 =?utf-8?B?bnBkNW9QU2c1NHFyQUF6T2lIb1l4SWc4OSs2dTVxTUgwd0FUc3pjdkNTeDdZ?=
 =?utf-8?B?aUtSaHE5RlNUck9jQlQvOTIrVjFHVjV5dnYraDJvbzM2aCtQU0xOVWttOVdu?=
 =?utf-8?B?M1VOaEhRV0EwaXJHejVXY0RYeTErTHpoU0x3QmFHZjh5WUJhcDM0djdheExW?=
 =?utf-8?B?QVBDZ3QxR3I4NmZDc21Mb3FNRWdXcG9XdnEwTWZ4VDRGUmhJUkZ2SzhTQTdC?=
 =?utf-8?B?a0pYeG9pNENjcnpQS3pValhFWjB0WHlqd2R3MVQ0cEpVbGQ2U3QrODNhNm9t?=
 =?utf-8?B?aHRIUnpuNVdEdk5vV08vWmpvOFdSZDg3UW5NQi83ajRVR3ZFZUErRzhFNWN5?=
 =?utf-8?B?NnVQQ2xuUVRQTUFrM0lmOHE0WVF1TENwMFo1dzFObG41ZGNURDZEcXRtZ0FC?=
 =?utf-8?B?YVEyME83eVJKY2JMcHVjSEdKTnMrUUl2dGpPdTcxUzQ5aUVjbW5nNDhCS2Fk?=
 =?utf-8?B?K0FNWGozbkJJRUdBUmRJNFpMK0daN2E1Sy9kbjUxdjZrbGZEOXdIaFg0Qkll?=
 =?utf-8?Q?5SO3y3ariz62+qwp8Fr9/u3WE?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a2f0a86d-52c4-4260-28b0-08dd21cc8381
X-MS-Exchange-CrossTenant-AuthSource: MW3PR12MB4553.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Dec 2024 14:34:02.1613
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JBz5FMtkHV9BRa7yMNtukICRmlYYL6eBTWz3QEwSv0vaJRwz3ars3a5Gu4b3PFdr
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7485

Hi Reinette,

On 12/19/2024 9:03 PM, Reinette Chatre wrote:
> Hi Babu,
> 
> On 12/12/24 12:15 PM, Babu Moger wrote:
>> Configure mbm_cntr_assign on AMD. 'mbm_cntr_assign' mode in AMD is ABMC
>> (Assignable Bandwidth Monitoring Counters). It is enabled by default when
>> supported on the system.
> 
> Needs imperative "Enable mbm_cntr_assign mode ..."

Sure.
> 
>>
>> Ensure that the ABMC is updated on all logical processors in the resctrl
>> domain.
> 
> Needs imperative (for example) "Update the assignable counter mode .."
> 

ok. Sure.

> 
> Please distinguish how it is the architecture that decides what the
> default mode should be. resctrl's part is to ensure that architecture
> gets opportunity to configure every logical processor as it comes online.
> 
Yes. Got.

thanks
Babu
