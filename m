Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E55E234AAF2;
	Tue, 24 Mar 2026 20:37:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774384673; cv=fail; b=doOE9ffGmwNwUjn4foQyn9bRCZccUN7AqNykIjL7Z+8NrAwnR34sxx3ppONCyIKpyQowcfkv+9FjrHJ/1Cxdttk1AIzSCtgnR8G36K1ROsCELgFhu/B/0ZNpID9lyM7MjUnlhCDYrINaw2HB9UmddUU882iS5nOXrjqLdmGNKjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774384673; c=relaxed/simple;
	bh=QJFhMl0jP/YJXSTlDCEv4w9pnFnh3DW1Ft3Bzie8osQ=;
	h=Message-ID:Date:From:To:CC:Subject:Content-Type:MIME-Version; b=dfM5sxdBkDtKTHNZR8hjNnBfUtI9+VgoObFtsBGFb+5J4x2HYSfsx2ZiH7lYcPlrem9RW0bwMrFlnteHRDZQUoXfnhlufqvgYETTA7SUnzb68swx2L2hmElWOmG52KKvrIwdRKqyiZC8REXjO7yv1IjJbSO7mc+vwBUZI22b7sQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TJot6QA3; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TJot6QA3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774384672; x=1805920672;
  h=message-id:date:from:to:cc:subject:
   content-transfer-encoding:mime-version;
  bh=QJFhMl0jP/YJXSTlDCEv4w9pnFnh3DW1Ft3Bzie8osQ=;
  b=TJot6QA3i/Uc1ITsTdJeIl/muYlVvb9V4BdR9H5VUUeHEkDFdm+Accjj
   a4Hhuw2kNK3kT5vhBt/l/pph9BtNE/PL7xWlyZnuwar/97/YiczSlfajp
   ZNiyxeLKF1QlcjjQAT7HTa/3mzHdNLTthfVuWWw4Tnqh17FQFjxHd05rN
   CN5Lcb3KRJ+76BBtCSzshR8DNMvOcvo14f7eZ04TWWb4994WiFom5098p
   X1xcb40zCcnya/SPcYkthlgIXW+LWyTMWckygBoZJvHAqqGhaKewPpMXK
   6RCpvOP++nTEULjbfPmdpKMCeIM5VZScLU5QeHBh8IAGVtN2Iu0sKILM3
   Q==;
X-CSE-ConnectionGUID: Rk9B9iDiTvqBImSTe4NzVg==
X-CSE-MsgGUID: 9weFrHuuQz+dWPR7uDWWXA==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="100861561"
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="100861561"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 13:37:51 -0700
X-CSE-ConnectionGUID: GEQyH1VvTkyCTWTFuLadXg==
X-CSE-MsgGUID: bXeEwq79SEid7gmyUYGkRA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,138,1770624000"; 
   d="scan'208";a="228510951"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Mar 2026 13:37:44 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:37:44 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 24 Mar 2026 13:37:44 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.59) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 24 Mar 2026 13:37:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=b0TOP9VSQWtouuUrXnzsZwMzXH1zLMDbC0SXyq5sa5rJsmUj8y0dn2Q3ma/Ss9U/ErrzUakhMTMO6x/pbqpNPK5TafAwcvp6di4oJMyO2/UsFCEno0F4sPB8vTxqjDqcwrxu86JNBIJ2Vu59hG69l9NPUAJoTqPAtvuSXBExD16JSRS/pEHoznPV6fEKFgXV/5yu3iFs6VXSo5aFiYH1E+Ssqa3ARlvTLRsH9NCRqwk3R6VWPpFwlmlMYWXoQEJ5u70koR+0vj1Kyu7axwVuj1csmLB2pvsEPL3MMDtFJAfa/GxSYegQ9KjfwOPsdvxGWbBPjjswPMa4USZUfTxPaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=lXTo0uimieWQdi9AsvRRt/VsyMOJb9Tvi+oLw7ZRLEY=;
 b=LdrbwhU67FIkdoCT1kxbmDvBBwhlxz9vRC6P1keK1Xmsfg8FFoO/uKG8EoQlgdsmiqvKQUOk9C34ogJmQWac3pMSfq9XUrUccmg+4tR2eKzsbdNS668NaqW40bsJ6Y+pxTfndB63jLXDdrektgsGyPysTUcXDzPdnnnjG4bNFUOPNmIx6JTcfSjaYrAszF2+2tWwZzfiaIK5Krb6+jGmCLIfWteUh8ewHqfSCPIFICt2axBeRioLQJQDy4BPvxcRqcwIem8lythfTo/lkESLnIAzvwr3NicANSdc+30c4/buJw004VZ+YxGNXvFlXg+D6vFrwW7exGNZMK1WHfgwQA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 MW5PR11MB5882.namprd11.prod.outlook.com (2603:10b6:303:19e::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Tue, 24 Mar 2026 20:37:41 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9745.019; Tue, 24 Mar 2026
 20:37:41 +0000
Message-ID: <9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com>
Date: Tue, 24 Mar 2026 13:37:39 -0700
User-Agent: Mozilla Thunderbird
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
	<linux-doc@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, Mauro Carvalho Chehab
	<mchehab+huawei@kernel.org>
CC: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: kernel-doc overly verbose with V=0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4P221CA0011.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:303:8b::16) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|MW5PR11MB5882:EE_
X-MS-Office365-Filtering-Correlation-Id: 5bcfcd57-6c60-4ac3-6f89-08de89e531f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|56012099003|18002099003;
X-Microsoft-Antispam-Message-Info: cnTOVnxYGy3PklxHO86zlJ+l6Vrq69wbuRzWOECAa9RIC471FLZXRDuH1TiX+Zk8XV8WoUiZi1uYkhA1n9lsBRYLol3EqpqdBqWhV20BsTGyrnFlwh5+/Zl3JSg7SB/GPqjnDiAT6DUaCyd/5LbBTtwBljeABNvAOT617wZMMlpv7QxKasBEj58aADkLD5ubAyVhmVjgyG0vvBYe6rs+5eVS/EDpQv8G1wNUB8XG9LwWeynbGCm3yUlAgT4+MdtInUh8sQvyeeMuukAbw45ayQzZJBWdpErYvL/b2Zj3AG4IvxEQBIJMhARS6aUEtoZUg6+xsYK5VSj16Th7+nNd/Jba4i/FJ1BjyY9SIOhoT5Qmohu26kymPICd4Sr5t2FWExcQ9iZJ5enKLtaT8REQMcGBF6bG9vP1IOy/ZxXUe3iOk4iaoyO38hpe47VtzEJLkQE/jUtP3Z3cHdwie2nZDaXJLS6tFdSgVY+1cnKiT/NBYPrlgR9agcSEe2gj9ED7DWwzp0DsV1U58HoYBA1/ceahz55Q5BWLW/SDfU1IUD5GLGixA0xkKavnrA0ydWEdT+ooI9t2vJIcUccAosUymwGndMpPAlYT+dM0/FKxYz9AZHyfjd7IVjOYnWW427D884Xm+Q9LFi5wsLGxFsl+gU1EHLPyfqmJj7IL9P8s7jgvIuRQTgix+oBsYd6/z5U3UbJvs9Lcq6Oa5/mJSAVXIJuJzeZirqtwoDJYQRkkOYk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7579.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(56012099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTArRHVWYnBFV1NqZ2lnNkJDQU9zWGs4bXlGUmJpRjFWc2NTS3Zidi9GOXFY?=
 =?utf-8?B?YUJNYzdlMUlWeXl5UWErZlBIVlloMThCODMyMStzQitXME8reDBPSnVBT2wz?=
 =?utf-8?B?cmVMa0I0d0xtQ3V1NE1yVGk4emRuSzROZkRFeHo0SWRoNVdzRnkybUxVUDBT?=
 =?utf-8?B?S0QxNHNXR0J5MUJ2MkJJNVlFWXlBcTRNTHJQME11cS9aR0c0QUdxd1ZkVll6?=
 =?utf-8?B?b1FBNENZRXVUMi84L1lOWXB1SUNaSWNLQ0RidnpaTTd3TVlucGk2eldJUkMy?=
 =?utf-8?B?cVhnUkdPVDRNbjVSd3Iwa0tjanYraVdVVTBjOE5neDZ4NXNPSkRnb2oyY3k5?=
 =?utf-8?B?YXpNL0xZYXV2d3BCZkFmRDRRT29RdE5RbVMreUJaVEFnM2puVnUrbmdFdWJw?=
 =?utf-8?B?dmorZGprREZnWHl2UzFuWjlvdEZHdjhJMXREd1hwV2tIMi9iK0o0cGRGTDRP?=
 =?utf-8?B?cU5xZFpKUXBVMjUxSmtNWjNrME9TY0ZjQWE0dDZtR3dUeFk0OEtScWluNmJK?=
 =?utf-8?B?VVV4UDdsYTNTWENmcHBhdlhHakV4Ky9JSk82U1JTTzcyZU1ScGJSVzhzNGls?=
 =?utf-8?B?MDFuRlVBNjJWVDFXSGpseTZZUE1WVFZpZzlIQUlxOVhEOFhFdHVqRThOOEo0?=
 =?utf-8?B?Z1UzSjRKdjFSTHFON0E5cUFaUjRocno2TWNiNmJFalloNjZCay9iZEF1VlU0?=
 =?utf-8?B?djJOKzUrWUlrYk1JanNKNFdrS2VOQk50b1FyWE1MUmJEZmVQRlRQcXF6NW5T?=
 =?utf-8?B?QWVNL29sN29tTmhSWkhiR2k5bVNhVTRVMzlrNHB2ZHllNjE0MFdVNUVuVi9a?=
 =?utf-8?B?N3hxWUxod3JkTHZjY2MxRWdhR2N0M0EvKzZ2Yzd6TVBzMkhUdldXcFhaZUpr?=
 =?utf-8?B?MDNZd3hZczNwaGZjTFIrNWprMEoyeFFrOEpLRGpyZ3VmV2tqMjJ3eUt2dzFK?=
 =?utf-8?B?Wk9mWDFrNnZJOElPem45dG50Qm5ITjltckZYQXdnUXdPSTluQ3A2UFNzNXYx?=
 =?utf-8?B?RnZKWElpQWdteldydURXdnNmbUlWSE1wT0NlbXJ0ZExMREl3Uk9veENDMmt3?=
 =?utf-8?B?SnFFSWxiTUVzQ1hBS2lnSWFCblN5eVlpUjRqMkVSUVRGRmVmQ2JDSmk4U0FH?=
 =?utf-8?B?MkJYSHpjWFRaK1ptNTEvUktFOHZ4ZE9OdDBJOFJpM3BwMk43YkMzNTh1OFdr?=
 =?utf-8?B?RFJFWHhVYUpOS0t4b2NHOWNmdmtWelJJbXB0RUY3MVY2T2xUalYwckZCdlRK?=
 =?utf-8?B?dUtqY2hoalU2bkhtU3JFbFNXaXVCN3lCODRpRmlXdktDc1MzdUVXQjdvSFlW?=
 =?utf-8?B?S3NHY09GWjVCenpURWN1eWV4aUgxMmpNVTkvOTZSa29TWG0xRGxQQVVHUmVV?=
 =?utf-8?B?V0VFektPRXMydnpCc0w4Qlg5dGNnMHdzelc1eFBZbkpTNmVvY3UzTm1qMDJz?=
 =?utf-8?B?Y2psdzlpKzRaSmtWSmNjWkdnaFpuc1cwQnJUczFNdU9jQ1JkK016SkE2cjBt?=
 =?utf-8?B?d2xVb2xodzB4c1BpVWtQUmd6UFBXcGVnd2ptWnFUNWQ5YUJrcHREWU9NSzVs?=
 =?utf-8?B?RjQ5RXcwQmlRMGcwRDAxWVQ1WGdnRm5LSFlxVTV2M1V4RC9KelNnRU9wR2hv?=
 =?utf-8?B?dUhPaEJlUUQzQkdiak16cHBUWlU2ajBMbXJ2am1HTXN2dkdZU0FqL3JhWjcz?=
 =?utf-8?B?NlVJTHJKeENORm81U2NDVWVLUThQZllyUFFUOURpUDRjTFd3NUlxaVJPQVZ5?=
 =?utf-8?B?ak1IMnRwMkIwaVBNZjRRcU9lSFVIU1M4NHVCbHlXam81SWV5TXVuR1BEUmsr?=
 =?utf-8?B?S3dtTSs2YzhPOTM3MnVMcjdlVXNBWGhKUDBTWDZVNUxXK3loOW13Q3V4cW1G?=
 =?utf-8?B?QnlYMktxL3F2NVlvNHlTQXBDOVVVVG1PQ1o0ejIzRVpFaUhDdmtDVVk4dVht?=
 =?utf-8?B?VldEakd3WnN5a2JONWJ5elZ2b2JKRXg1c0tmMXVLOGFGMjZDTDduU1B4VXJu?=
 =?utf-8?B?b3JCVnhjK2pqeVlqTmYwNHlpZ0VPeEdqaG02Y2pyWHdhZmZaN25jQmRhdlRT?=
 =?utf-8?B?bHU2RjFSRHpLeVMvVVcvNkFIQ3VoRWhocmE0V1ZCTFQ2enJHdDFEZEE0NEJD?=
 =?utf-8?B?U3ZHUGZaWnlOMUZaV2lENDlqSENUMThqYnNnZXBkNk1LREFPYk1tQm5DV1E2?=
 =?utf-8?B?QlM3VHE3REJmU0lUSFlqdTA0YWljdVJDMHNPK2Mwc3JPb3FyeFdoVmhvMmd6?=
 =?utf-8?B?QjlXUlNwdnZEOXFzNlpTUU5uM0FCZ0dlY3J3dHc3WjA3Snp2TUEzdWl0V3JI?=
 =?utf-8?B?Y0NQRS9BWG5TQXNxSlRXZlZUVzk5NHo2M1o2L1hZVmNIVVN3S2JWdUFXLzIr?=
 =?utf-8?Q?U7YTX9TxXMRS5L60=3D?=
X-Exchange-RoutingPolicyChecked: AEaylrVWaIH1FCfcqFu5s33FNe01XhkF3LqoS0a13r7czKuQZl/MdAUZr7+N9543ZMlb7Dv5UOrX9uowJDM5vMdY+Xz4aWdn5qirEYlYE15kwFQVywsuZWcMRNQ1wgSeVyzZseHVBpCUfSl22PLJu6h5oRphAIm8064ajlq6YxWnWF3T9d7SXTc0NLvEt/awgHWrTkqvJsWcC/9d+h+Lcf+MzvIK23uDP0AVoqnwqpvou5a92tMNru6ASNJeS+BWobhoqehdlYiGapk4DhLCU239DV3yLK1wgk3Ry6bnsy2N+H7FGI61yuOzS3pAFX4fW3gzbWIgyuG3ODpYv2kldw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bcfcd57-6c60-4ac3-6f89-08de89e531f2
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Mar 2026 20:37:41.3028
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NGWyvHg/Kx2WJPXOdTd6KWhr8zeoXjE7YRTKMqE3WTrdZ3RDrCEKWuj22UGmlYAwy2KCvUZvoAcBg5KZ0orE0jJmc0F6mguzxb03emlchCY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5882
X-OriginatorOrg: intel.com

Hi,

I recently saw some strange behavior with the Python kernel-doc. I was
seeing the verbose info lines from the kernel-doc script, i.e.:

> Info: ice_ptp_hw.c:5377 Scanning doc for function ice_cgu_get_pin_freq_supp
> Info: ice_ptp_hw.c:5406 Scanning doc for function ice_cgu_get_pin_name
> Info: ice_ptp_hw.c:5441 Scanning doc for function ice_cgu_state_to_name
> Info: ice_ptp_hw.c:5463 Scanning doc for function ice_get_dpll_ref_sw_status
> Info: ice_ptp_hw.c:5505 Scanning doc for function ice_set_dpll_ref_sw_status
> Info: ice_ptp_hw.c:5544 Scanning doc for function ice_get_cgu_state
> Info: ice_ptp_hw.c:5612 Scanning doc for function ice_get_cgu_rclk_pin_info
> Info: ice_ptp_hw.c:5671 Scanning doc for function ice_cgu_get_output_pin_state_caps
> Info: ice_ptp_hw.c:5733 Scanning doc for function ice_ptp_lock
> Info: ice_ptp_hw.c:5770 Scanning doc for function ice_ptp_unlock
> Info: ice_ptp_hw.c:5782 Scanning doc for function ice_ptp_init_hw
> Info: ice_ptp_hw.c:5811 Scanning doc for function ice_ptp_write_port_cmd
> Info: ice_ptp_hw.c:5834 Scanning doc for function ice_ptp_one_port_cmd
> Info: ice_ptp_hw.c:5866 Scanning doc for function ice_ptp_port_cmd
> Info: ice_ptp_hw.c:5901 Scanning doc for function ice_ptp_tmr_cmd
> Info: ice_ptp_hw.c:5934 Scanning doc for function ice_ptp_init_time
> Info: ice_ptp_hw.c:5986 Scanning doc for function ice_ptp_write_incval
> Info: ice_ptp_hw.c:6035 Scanning doc for function ice_ptp_write_incval_locked
> Info: ice_ptp_hw.c:6056 Scanning doc for function ice_ptp_adj_clock
> Info: ice_ptp_hw.c:6107 Scanning doc for function ice_read_phy_tstamp
> Info: ice_ptp_hw.c:6134 Scanning doc for function ice_clear_phy_tstamp
> Info: ice_ptp_hw.c:6164 Scanning doc for function ice_ptp_reset_ts_memory
> Info: ice_ptp_hw.c:6183 Scanning doc for function ice_ptp_init_phc
> Info: ice_ptp_hw.c:6215 Scanning doc for function ice_get_phy_tx_tstamp_ready
> Info: ice_ptp_hw.c:6247 Scanning doc for function ice_check_phy_tx_tstamp_ready
> Info: ice_ptp_hw.c:6273 Scanning doc for function ice_ptp_config_sfd
> Info: ice_ptp_hw.c:6293 Scanning doc for function refsync_pin_id_valid

I didn't understand why I was seeing this as it should only be happening
if running kernel-doc in verbose mode. Then I discovered I had set
KBUILD_VERBOSE=0 in my environment.

The python kernel-doc implementation reads this in the __init__ for
KernelFiles() on line 165:

>         if not verbose:
>             verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))

After some debugging, I realized this reads KBUILD_VERBOSE as a string,
then converts it to a boolean using python's standard rules, so "0"
becomes true, which enables the verbose output.

This is in contrast to the (now removed) kernel-doc.pl script which
checked the value for a 1:

>  if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') 
The same behavior happens if you assign V=0 on the command line or to
any other non-empty string, since when V is set on the command line it
sets KBUILD_VERBOSE.

Of course, I can remove KBUILD_VERBOSE from my environment, I'm not
entirely sure when or why I added it.

Would think it would make sense to update the kdoc_files.py script to
check and interpret the string value the same way the perl script used
to? It seems reasonable to me that users might set "V=0" thinking that
it disables the verbosity. Other verbosity checks are based on the
string containing a 1, (some even use 2 for even more printing).

I'm not entirely sure what the best implementation for python is to
avoid this misinterpretation, so I haven't drafted a proper patch yet.

Thanks,
Jake
