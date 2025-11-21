Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A66622A7E9;
	Fri, 21 Nov 2025 04:41:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763700093; cv=fail; b=ifKL9I3TdEj+sk9K4DaVPr19NVsSotIuAoQvOc9jZ8cvuAnONmh+8rHNsuc7RDrNpzx2mjhk0DkUlasoZBsskUszDh6XtaLaIRe2Lx/WI0WxtobQkCIHYClSUte+pytbNddEJu7d60Y7DHk59s7ZebBvBX7nowlpoXF6PaAym0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763700093; c=relaxed/simple;
	bh=d5OFFS/O34vatyDqhkT2iHTZQhpNnNFUHnWqSeFrsQ0=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=DsYNk11/NVt2xrrOe4FoZrpUl8IDK3v6JD8CtL8lvKxbRA99yRdqdH6KySD/bXSdpFeqJfykpcBB1t+NLVCGI1ossfSH8Ya/kagllnHbrXvQx6FTM5/8a2M/g/HE811ZnDZ/DIGHbbxTWUgR8eZ62XSHMOzodMhwtJbdqP5etik=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bcxH7TJ0; arc=fail smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bcxH7TJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763700091; x=1795236091;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=d5OFFS/O34vatyDqhkT2iHTZQhpNnNFUHnWqSeFrsQ0=;
  b=bcxH7TJ0Ek7g/G5G2XSlR0grG0OOIcKifbrOcIhsY+K1mtDwjo40vfC8
   BIynxnsSNcnCoTgZE6XkWBgiz1VLb/xORpaH/dX7UvCroYMA6GFZqGs8R
   aKHPltyaEqw5XNXlaFpZsT4BoMa/Kkxc205BoxfbZ80zhacWTgP2VEDAX
   EjF/hVWCnqO50zFjasWW3oSRRaSvAD/g60ozTlg3tTAstA5b+t/VX/E8r
   mA3qczHaN4Obyw2Z3z8W0JYg0YXZ4tZ7iJwBoqNVlK7lXOMPg/ZD/1n3v
   a5mui5qRtUIJrfJ+EdmBiDpc4W0Vbua8Q/qJ6ZEJO0a1EkqpQV2+NgsUB
   g==;
X-CSE-ConnectionGUID: i2nJYMJYRhSq8Vnte36Q7g==
X-CSE-MsgGUID: TIdBi7fBRpGHZOQ2Z8eADg==
X-IronPort-AV: E=McAfee;i="6800,10657,11619"; a="68392955"
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="68392955"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:41:30 -0800
X-CSE-ConnectionGUID: rVKHOLtYTLaKfHr3RBjGHA==
X-CSE-MsgGUID: 53hJ47e1Qae9KnNdTsiW5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,214,1758610800"; 
   d="scan'208";a="190874963"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2025 20:41:30 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 20:41:29 -0800
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 20 Nov 2025 20:41:29 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.65) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 20 Nov 2025 20:41:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9sePifmfXrk8HSfw/Qa3eR+zchYzi1Au4V/yLtchdYZKHJzVBMqirk96NgIoS03EVS/deJElyR3+ln5jwIon0uC0U7VPYUNIPmFZTM7u+31QJ2XCF4/xFgXmSIe87iesiR+T1f6CA811QVKdOG12Vplbl6rpx7vvIlWVy6fniclgSdLNbeY/g0ou9xrSGMN4zZciKMjRhwaO2mVqmby0mTdtgVsr6CPErBJvyyiUP5l+1JnhM8lw2ZMlV4d89bPwCNZ4GenN3l+eIusZHIhHFBdhIK+X/oYD7S9RoqiTb6/jpJ4vXVTVpK2uMm4UDn0Lbp7wIf4y789Q9Q+8knGLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YmLb6mPTIPg5YbBZLiWWmkZ1Oap5709phhycA8SS2bw=;
 b=uDvLUuBiPXO2kEZGlinBBxqeBUNjNRsDkFcxAsGIe1F1SBAn7bAczUjNFHdWYe2y1Mc3eojnK/MYWEAfHYU1YV5khLHK4BBnqrWoh88dUPEK6EeaXNxIpNV8mEx2JgCFxK8QoEShkhfJo2ZDsp3OMbva8QvV8vq0TiuXDrBIl2MOjf89ZaJVZh7UCzW4K3Zm010MfNytNhrq3moQGPTR4tpQxnhC4xNMVHaihY3WnSIKHH0kGBaH0P1/rp60fvtPIesOoxkFJp2EuZAmGWFkV/owabAweCwe3gWDf7eA8v39NmSlTW5n9T/MR8RdpM+71gv86hbsxcRcQa4hgKi5+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by MW4PR11MB6863.namprd11.prod.outlook.com (2603:10b6:303:222::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.11; Fri, 21 Nov
 2025 04:41:27 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%3]) with mapi id 15.20.9343.009; Fri, 21 Nov 2025
 04:41:27 +0000
Message-ID: <81f357c1-aab5-45db-adfe-821efdbd0ae6@intel.com>
Date: Thu, 20 Nov 2025 20:41:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v12 06/10] fs/resctrl: Add user interface to
 enable/disable io_alloc feature
To: Babu Moger <babu.moger@amd.com>, <tony.luck@intel.com>,
	<tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <corbet@lwn.net>, <Dave.Martin@arm.com>, <james.morse@arm.com>,
	<x86@kernel.org>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<paulmck@kernel.org>, <rdunlap@infradead.org>, <pmladek@suse.com>,
	<kees@kernel.org>, <arnd@arndb.de>, <fvdl@google.com>, <seanjc@google.com>,
	<pawan.kumar.gupta@linux.intel.com>, <xin@zytor.com>,
	<thomas.lendacky@amd.com>, <sohil.mehta@intel.com>, <jarkko@kernel.org>,
	<chang.seok.bae@intel.com>, <ebiggers@google.com>,
	<elena.reshetova@intel.com>, <ak@linux.intel.com>,
	<mario.limonciello@amd.com>, <perry.yuan@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<peternewman@google.com>, <feng.tang@linux.alibaba.com>
References: <cover.1762995456.git.babu.moger@amd.com>
 <c7d3037795e653e22b02d8fc73ca80d9b075031c.1762995456.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c7d3037795e653e22b02d8fc73ca80d9b075031c.1762995456.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0261.namprd04.prod.outlook.com
 (2603:10b6:303:88::26) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|MW4PR11MB6863:EE_
X-MS-Office365-Filtering-Correlation-Id: c708928c-ef69-45cc-6e47-08de28b83b7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cFRZWGp6cUtJSXQ0YXBKaUQycTdNTlBRUDg2MGRoY0xUcGhIRzIxSmROc2hW?=
 =?utf-8?B?RUVnUXZLQmNQNlprWTl5eDJselZpS2xqV0VqU2lwY25NUU9XeWRlUEI1aThO?=
 =?utf-8?B?N0lncUJzNzJ2NThFV0RqeGorMmlSOGJwVjJXbHJ3TzAvMTc0WWNKY2NML1Qw?=
 =?utf-8?B?VWV2VzNmcFdGdEVDTzFKT0VBY2duQzNUMitob0ZJTjhESThodG5RQ3d0VUJH?=
 =?utf-8?B?MFA5aUdvYy8yOFdqc2hoMGV1Qjhja2pyaytnQjFpOHk1U2owcGZYdlZZWlRW?=
 =?utf-8?B?SXVyUnIza0p6VEZvWEVKWjEwd29wK0VZdFNWV0tBMm1WZHRSeUpSY3RMVjEx?=
 =?utf-8?B?QUFnbDlxVkFLMzA0NUZMMEY5eWxNTTJtTk5RSnYyT25iUjluWU1WZUgzc0lN?=
 =?utf-8?B?b3Zlb1dFWHgxWEV6b1VwbjVRTG12cHQ5WFJYVGkrUTVMNzJmNVI4bG5qcHB6?=
 =?utf-8?B?eDQxVWlKSVJrQWhaNlZIamhGSVlpODR6Z1Rwck1sUDRoTnJTVDBzUVpDaGh5?=
 =?utf-8?B?Q1pSeGc1cVI1SXI3YWQ4cTRxamhWYkFPbDg0S1BwUWFQeDhGT0ptd2FKMldX?=
 =?utf-8?B?UjVJOFM4R003dVZyOFZYOTQ1dEwxM1Q1Z2tFVUh3eGZPZzczUXBSWlJ4d3ZZ?=
 =?utf-8?B?TENseTlMaElUYkFneTYwRjlsOWd2YVc3L3BmRTAzZTJSYUZzRzczaDM3aUwr?=
 =?utf-8?B?alRmM3dXWC9paTgrV3pIYy95OEx2YncvYzlFVHhDNWErUWNOWjhOVTUyQ1dn?=
 =?utf-8?B?WjJkd3ZEYTJONVdib1FOV0dKdGNXTEtNcWpheDRqcWZubjJnQzRUTzNRd1U5?=
 =?utf-8?B?ZTRzWkxzNmE0WWE1SEVrWk94YXZ6THVVL0E3bWhlWUsveWJmamlTZ0RvbnN3?=
 =?utf-8?B?R0Ryb3crbXZ1eE5OTEIzME5PRzlpRmFSOHR6dWpmbExLcHFrMXpGYVJhRmRy?=
 =?utf-8?B?ZWp4WFJyN2RpV0ZUa3d4cWZMaGNnajNrTTNSOU05Yit0dUNOZ0pBcTllN3dt?=
 =?utf-8?B?aVNnTklvaDFYbml4QlNidlpTQXlEcXpWWmdVNkNxRm44ekdCVlFrbkVLVzB5?=
 =?utf-8?B?R0lIaFNzYmhRS0NwcDhPcm15VXpoeVFYME5JR2dtdUMyZG96MmlGTm13UGlt?=
 =?utf-8?B?QU5SN1haRnR2cWFIanpIbElldDBRZGw2Q0RhcjR3WXE4ZjM4ZFJZYXR4aG92?=
 =?utf-8?B?OHM3NzRGajJ3RWY4VUhhQlNSTmYvTUlZT29SKzRpM3hzRGpoa2N4d0pEeHEz?=
 =?utf-8?B?cEhOR2hXQTZNcEV4Z3kya1MyZ1BOelQxQjV3L3F4TkZGbDVibm5iejdzTWkz?=
 =?utf-8?B?RjZNMGZSTDlhZGJQZllmUER4QUdlNlRPWExQTnlHeStrcUVBem5YU25GdUd0?=
 =?utf-8?B?YmszTmx6RklyUEpuYVhzUS8yU1JiUnRnQ3NQZkxNaklsbFk4bCt6Y0l6K0sv?=
 =?utf-8?B?MTNocTlnN1JsS1B3TjBmQ2tBM2tub0sxVldTS3Faa2c5alc1aEpNbmcxczNC?=
 =?utf-8?B?WmhYZlhPdGFacGg4OGRZc2IzOTlwUCtuSWxKWFo4dFR5Qk11UzhsRFhQZktS?=
 =?utf-8?B?dzFNVUt2cHB3WkRZR2F5YXZtanJRQ3lwYisrNm9jSGhwcEZ0R2xjVEk1bzhi?=
 =?utf-8?B?NmNDYWFOaVlaZjB1MmlqVlVtUXdKbkt2WXpHZ2dMTUttbm1rUGZuWHR5d1ls?=
 =?utf-8?B?SFlPRjV6STVHb2hJcFcvSmVZdE5NVHVxWHJJOGZJTkhmMHRJWU1MLzI1SW13?=
 =?utf-8?B?MVdndFh2bFlMYVJIVUl4VWVKdWg4U2JHOU9ZQUdIUUIvS3NYblVlbEdiRWpr?=
 =?utf-8?B?U2xudUJpTjE0Z2ZPenBXb0ZwcWgrelBUc3BuNTREL2MyODZ0Y1RhMENRMnBR?=
 =?utf-8?B?OC9XTCtpcS9Ga3VZdmVaOHVpcjludVducFM4dWVrUktsbGMxTGcxK3U1VldK?=
 =?utf-8?Q?lEzE0JfTL22qxAxZoWP7oyyN7i3D7bhY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0RmQVZRK1Rzd3hxYURMRTkxbXZ5N1JiU1lvTDNZYjNUY3V0OU01bWNYQ3BT?=
 =?utf-8?B?TFh4WWdQRU9rbWtFeCtvRGQyNEw0TzVDUk5pSFJwUU0yTTEzNTNyTDZqQ3FE?=
 =?utf-8?B?a2NuakxTL09FV0JDeTNheXptQkV4d0h3elRSUVFRc1MzZU50bWpYanhnaTNK?=
 =?utf-8?B?MklSYWtKL21uVE5RSWRUeW5CQTJ3aFAwanQ2cERjZkpMdnJuMVljMnBWQ0dh?=
 =?utf-8?B?N3ZzY05KU0ZTVG8ycXNOK2lYRlo4N2t0VFpsRS9lUzFUNEw4eTUxYldHaVRR?=
 =?utf-8?B?c1RhL3ZMdndrR0NQdytPQkNQNEpkSjJLdDV5a2pmd0Z0Wit0UDF1VW5GZFdj?=
 =?utf-8?B?N0ZmaVc2SDFFQmVuWktUME5wU21uSmNDR3Fyd2RsWEJLK2dzaWNMaWljZXpN?=
 =?utf-8?B?VTlYU0VVdkhjd2c1eEhBVno2SFVrNGE2Qk5oMWdsMmZ4K1hNNytNSlNZTDYr?=
 =?utf-8?B?SHV6OFRWS2h3RUx3akNHNzN6TGdaOGROaEhya3YycnZKZ0RVUy8zMTVaTExi?=
 =?utf-8?B?REdqS3ZSVFE2L2t0L01KYzNpU3dHbnpUMlJaNVlQWXA4bnUzbWhsQkJtY05J?=
 =?utf-8?B?aldIR1NkMHNHS2JqMlRLTlhyZjJqMmNhdFRHaWlWeTVkc3dVeWltZXZlWFJ2?=
 =?utf-8?B?WjlsWVBPRkdGaG5IdERLeEsrQkt1UGFFaDU2SUwrTU9xYnJYNDZJOU5va2pC?=
 =?utf-8?B?bkRRWEpkMzJJbTFmMkJqU1FHd3pLblpSUTJWVWVsQTdtUmJMcEVjbGQ4d1JK?=
 =?utf-8?B?MWt1UGt0NHJRMVBNa3c1U1MxOGhmS01uTXVxc1ZES2d1TENMaWk4VEhsWFVx?=
 =?utf-8?B?L0hYd2c1OHN6ZHI1VW1oSkt4cFgwRWZ6WmJyN29Ua2RJaXUySUhSWkJSNkky?=
 =?utf-8?B?Q1doOXFEQzlMS3A1U0pGbjFQMVNCbmlWMVZpQ2VMTlJSS3NNOFBSekh6OFNP?=
 =?utf-8?B?Zmt6OUJqNXM5NUo4UXJpcGZXVlNRL24rYlpsZWd1Q1R1Q1R0dDNUM0w1QUda?=
 =?utf-8?B?REJKQzJKRE1IMzU3ZFZzVHZqclJwNHZyQWhxL2dPUndLMmtKY0Y3MXRpT0hO?=
 =?utf-8?B?cjlOejQvbnc1VzhTZlo4a0lJV0Z0SWIyOGhDcnNDOURqVHJSYXRSWGhNMWhP?=
 =?utf-8?B?cGxtT0h5SU9wQ2pHVGZlbllQK1NNSTNNQUFGSG5SRWJBc1Q4YTgrRVh1TFdU?=
 =?utf-8?B?bEhlNUNQQjdiUFJRbHJTRTJmZnd1Ny9MUDFBMm1KRXlVM2t5bUVuU2lXc29t?=
 =?utf-8?B?VXhrWUNRcWtDZnkxL09PR21IVzkwbDk2cHdpc0RPZTFuZkNLMkJKV1UvTFU4?=
 =?utf-8?B?NjZ3a1I4WGhTY0xvamU5emQ3UDJlUWx1cVZmTmlEVFM3OVdkNTBUTDhNWXly?=
 =?utf-8?B?RnkycVJqNlk1azB0NHlvc1BQTVZoOWIrTU9Ub2EzYmN2UUxZK0tiQitvQ1Rw?=
 =?utf-8?B?WUZLRUpwdjdaUWYzYmZrRU80ZzRyN2JESVh6ZW5rQUR4c09RU3NaNEx5dkRW?=
 =?utf-8?B?RjMvdFE5OVJYWThNWldwSDhLTTlyQ0dWQ1NvWjFOZzc3OVVBYzVhcEpDSGVj?=
 =?utf-8?B?ZFZXcGRYcCt5ME1icks1S29XTmRBMzVNZmZBNVpDV1p1VlNGcVhmc1I1ZE5O?=
 =?utf-8?B?SWcxNHMrcml0Q0lscEN0d3R1ejdwc0l6NWtqYm9MZkM3QnREMFNSanpVMXBM?=
 =?utf-8?B?aGxxQXQ2azBWYnp1aFBiSE52eW03VGlyVTAyd1JucWkvemFHOHh0RDVCSVA0?=
 =?utf-8?B?T0NweE01cHk4TVVjSHlIM1FuQkxGcTlTWll4TTUvSlpZRlo0NUprN2ZELzB2?=
 =?utf-8?B?dk5mNDlERG8raXp3bzdUdlhDODlocTVxMTM3aGEzUXVuLzFxb0Z2eXBINmNY?=
 =?utf-8?B?YkNUV0RyUHFBZ3lMS1BVZ2pVdEZESDRxWUVEMzByYUFYMmgvbExMQkZYUkFq?=
 =?utf-8?B?aldqSjZsa2dxK3lta0gvcFJZaDVpQUlGWGhka0cwdU9FN0ZyTDFwQWRhSis3?=
 =?utf-8?B?UkQyeHNycW5xRnR6b21pUm4rNk5HU2tLRjB5cTFjZUZBZ0tIbUxaNTN2S1A2?=
 =?utf-8?B?bjNRd2pGNWlXSVR1dW96dkh5VDRXdmpYdXdRRUVNS1lTNmxiUExZL1pqdXdp?=
 =?utf-8?B?OHA2Ui9HZUNYSjJaVVBjVUZnZHNITG02RzhhRm4wSWkyaHRZNFRRTE5jcHJl?=
 =?utf-8?B?c1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c708928c-ef69-45cc-6e47-08de28b83b7a
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2025 04:41:27.1695
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mEolTh6vAKeDDLDn4gx+KEnUqyEFtwOABqdtZJN+6tfgxPl9DR7IdWiSczs+EffMRYG8PPRTqRwnpaZ3+yFm/S07n5oYaLydcSQLM4NwhL4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6863
X-OriginatorOrg: intel.com

Hi Babu,

On 11/12/25 4:57 PM, Babu Moger wrote:
> AMD's SDCIAE forces all SDCI lines to be placed into the L3 cache portions
> identified by the highest-supported L3_MASK_n register, where n is the
> maximum supported CLOSID.
> 
> To support AMD's SDCIAE, when io_alloc resctrl feature is enabled, reserve
> the highest CLOSID exclusively for I/O allocation traffic making it no
> longer available for general CPU cache allocation.
> 
> Introduce user interface to enable/disable io_alloc feature and encourage
> users to enable io_alloc only when running workloads that can benefit from
> this functionality. On enable, initialize the io_alloc CLOSID with all
> usable CBMs across all the domains.
> 
> Since CLOSIDs are managed by resctrl fs, it is least invasive to make
> "io_alloc is supported by maximum supported CLOSID" part of the initial
> resctrl fs support for io_alloc. Take care to minimally (only in error
> messages) expose this use of CLOSID for io_alloc to user space so that this
> is not required from other architectures that may support io_alloc
> differently in the future.
> 
> When resctrl is mounted with "-o cdp" to enable code/data prioritization,
> there are two L3 resources that can support I/O allocation: L3CODE and
> L3DATA.  From resctrl fs perspective the two resources share a CLOSID and
> the architecture's available CLOSID are halved to support this.  The
> architecture's underlying CLOSID used by SDCIAE when CDP is enabled is the
> CLOSID associated with the CDP_CODE resource, but from resctrl's perspective
> there is only one CLOSID for both CDP_CODE and CDP_DATA. CDP_DATA is thus
> not usable for general (CPU) cache allocation nor I/O allocation. Keep the
> CDP_CODE and CDP_DATA I/O alloc status in sync to avoid any confusion to
> user space. That is, enabling io_alloc on CDP_CODE does so on CDP_DATA and
> vice-versa, and keep the I/O allocation CBMs of CDP_CODE and CDP_DATA in
> sync.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---

Thank you.

Reviewed-by: Reinette Chatre <reinette.chatre@intel.com>

Reinette
