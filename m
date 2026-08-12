Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 897B840BCDB;
	Wed, 12 Aug 2026 23:34:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577702; cv=fail; b=hCtvuQBWoZn4c9n96qbcm194KcbYUOG/041e5g8t5ai9w/fknWwveIutFrF/6Vs60nS72mQIaxI36YeHLqUqBoR/J+rE6RFpGRJFtiIM5E2RjjtKvP6rdUFbitIr6wd89U01zSqSwW4n9j8FSawz4eTyZmknEXD55YCe0Q15TeI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577702; c=relaxed/simple;
	bh=u7VgVGP0bRImIzuKkucWhHygloRQU8iN9nGXWLkCt+Y=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=l5BtxCM6a1GQHwV4O0TXaOjCQLZYLu6oqQolxyCiWRYSQxzE4Eqb+NRfuRZRxGFSUcfDYrGqDwxca76LB5DrcDS04UmCdtsbhhTzELJbZNI25rvv7E+NeBSxiN0cqnHitNsqDAADkt9ZG9tNXU6UPNPfIZj9X92h8/6yp3l4XxM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R6dLOqCh; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R6dLOqCh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786577700; x=1818113700;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=u7VgVGP0bRImIzuKkucWhHygloRQU8iN9nGXWLkCt+Y=;
  b=R6dLOqChz/+OVM9ytJERWJuky8wEqwUAoz5z5LkTfoKbv1FvjpsOX6PJ
   AJw9YrbF7G0PohCPWNmdjEEkySt6ccgowSeBeChG+wnUrD1Cq7MkOzQZL
   DN4JrJWhOgbo9wJP9nR1M4r7uy3O3asdn9JCitvIUILosityvYzckqkWM
   26rBKR9k+MFg9bYdWILrVGDsoJxlzVygIAjHtDWoMf90gx9usjJMqSQ36
   2aUy5nxlW7HHv/7vul37Tb9psYXn08NcO+p+aU9Kxih3/hscVZYuSiBET
   JoMcYgzTay3N167pOu9lNmrGavfGcaEdnB7VPyg97mZEcvfAFFl7pmICA
   Q==;
X-CSE-ConnectionGUID: FET3u87XRJOGKio0TU2IKA==
X-CSE-MsgGUID: 99/ED1CVSBywHMf6BTKVQA==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="87026672"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="87026672"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:34:58 -0700
X-CSE-ConnectionGUID: r5UejfyCR8iMBg4TFyRj8Q==
X-CSE-MsgGUID: rB1OJfIvRnGMoVwwFaGnGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="268956578"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:34:57 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 16:34:57 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 16:34:57 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.62) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 16:34:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jw4JCP7qJE9BxWeK5WB2cf1e3z8FPP/ZmDZdANOmwZXdvSomgC+PuqU0cOIxjm0afoWcEaC45cyNiLbtJRMmrLF+ddsxCVzLOWjU61xWMF8SscvFVdYcvDut4mrl3rpyKfXw6xRostS2fIoA9y91E5qFB2KMJwhgymiDzBJ2A0/HVYHb+rzAC8nrTl1hoxq4A+jUCjrW00zVzw9y4bzt2Yo27nEmXZlUWN7izQMpwQN+zMlzJQcj5o0mic33Y43sRIpGxgVY4Liedj/HYUSiSesY883dS/zysf+daN8zxd1YnHBiXtEO04XdKp40WAb6v50asJRYyveaKnLE4jF5IA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EyRXn0mVUQiJ+MDC45TxMexLQ3Rd7QyGZu0VzX7ak+Q=;
 b=F+io1tJfgl5cat6ADsHqPh5xINItl6ENDGQlhsmyUn4KqvCW8P1saQ2GRPdSFCiE5bERFxZyv3bYaNiZuZjhxJc1j7V95yMaspFK5FhSBOS6SsuOVxrBnGQa8D1Tiw1BO3gGB37sPqc3FgT9mazDUMWdWOFOZ+ll5+hsQWHIsbR1xeyKmXDGJ9gXi23rk7cseI3YdXefUW6/MQFRfHuhf9GR11GTLh2PXmXICaEhY5en6+8H1uokwq1WHkGX/j/emwrZpN9vzZq7nEe7kDhua+1yi6Njc3si6Ew2qDlVAWTF+ThQRJ7gdIHLDnhKyhCkJlvFaiDB7AdK4iqfF3Q7og==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 23:34:54 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 23:34:53 +0000
Message-ID: <99d40aab-2428-4f17-8398-2fec92a2ca44@intel.com>
Date: Wed, 12 Aug 2026 16:34:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 05/15] x86,fs/resctrl: Introduce architecture
 hooks to program kernel-mode
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<ben.horgan@arm.com>, <fenghuay@nvidia.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<dave.hansen@linux.intel.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <peterz@infradead.org>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<elver@google.com>, <enelsonmoore@gmail.com>, <kuba@kernel.org>,
	<ebiggers@kernel.org>, <lirongqing@baidu.com>, <seanjc@google.com>,
	<nikunj@amd.com>, <xin@zytor.com>, <pawan.kumar.gupta@linux.intel.com>,
	<tiala@microsoft.com>, <chang.seok.bae@intel.com>, <kprateek.nayak@amd.com>,
	<prathyushi.nangia@amd.com>, <kim.phillips@amd.com>, <naveen@kernel.org>,
	<darwi@linutronix.de>, <elena.reshetova@intel.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<thomas.lendacky@amd.com>, <eranian@google.com>, <peternewman@google.com>,
	<qinyuntan@linux.alibaba.com>
References: <cover.1783461016.git.babu.moger@amd.com>
 <34a5119a28e102b8d6a0d0cfc3623fb0813a11f7.1783461016.git.babu.moger@amd.com>
 <0764a430-f64a-4655-a44f-5c2ff15f2ed7@intel.com>
 <d0a0ffd1-c759-4c3d-be09-f1d49ead29e5@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <d0a0ffd1-c759-4c3d-be09-f1d49ead29e5@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0289.namprd03.prod.outlook.com
 (2603:10b6:303:b5::24) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: d7c58acf-0a59-488a-08aa-08def8ca4f9f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|7416014|376014|1800799024|23010399003|921020|22082099003|18002099003|11063799006|4143699003|56012099006|10067099003;
X-Microsoft-Antispam-Message-Info: eHkYzdgwkuolQkJ8l+3+1a0G2JfblAamEXJ8boIhkjl5YcdEv9TQutc7KVAExTNq3VXuP4U2EqzSGB1h088cBnp/eWiYDtQHUwI6a+s5IaMXmDROhmSqjsTqGfjm2JGiN9Xm6xL4f3hEP82bVqrJwGXFkruc1Rz4naoi2ftkK1L71HB7tGGlkReY3kjcM8R20QyRzjq3KMXf0zCrhXPI3o0+rQPrnAJaZzdQIJ2VibvlJkso95crNqVPJRFPLnt2lmeeFWYdn8h4AVsInAP177YObAk/L0xcELunXwiA2ogPdMrAQGMwW4ONeJfeng7qQk1tng6E2FJz9ZydU9qmnDGVZybc1NOjJdo+rV2MWh7NM9dsGGNTAGB0mcJCCUp7H/wCYtQNxemE881QfzxCwBPaFfH80kW1sc4omIDELEzBSjBBeiqKwlXueBYvnXlrs2ZCrAKKAAzUWXgqUXFfPoRA6f8YDFCobbZfL1AybvdLgv8IKKl+SilvjSkrGMIk2XkPhoGEBW3yOuXsW+rb+VF6URgZB26chOlVeyJZ/oCk03ep3ecxR0YMYxxDkg8RHVVb7/Gw54K3vvSzwOocRR0UFnR3ML5IqyV+mVLE8JGPTb9MEKrFL7nxP3S6giiTkSPoviY01inlYkdxQZU33wkZkk6IU8FROMldCiz0vvfnfjAzER/gfMiSkXYEd+IpLKNuiZoxSAFra0+jF2AyYw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(23010399003)(921020)(22082099003)(18002099003)(11063799006)(4143699003)(56012099006)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0pUQ0kzREthdEYvdUVSekxtV2k2UGgvOEdQa1Nma05sSVFNTXpLRjVmMlhC?=
 =?utf-8?B?WmZUMkcza2VnZVUrdXU5cnFRT2ZnZ0pETWVUR0FLaktmK21tNFJuZkVmdlJJ?=
 =?utf-8?B?V0VWZFQ5MjFHdW95RTliS1o1TWYrek9kQUdzVjBkZzEwYjhHNnZ2WkJsUW5Q?=
 =?utf-8?B?bERiYXB2UytuTEJ3YUNhQ0xxR2lvV1EraWxkV1BLelpvZEY2SXY3OENoTTd4?=
 =?utf-8?B?K05EMkR2VWpIOUpBUlhLTHN5SDRkcGVaL2huc2JBaEdZeUs1WEVQOGpHNVQw?=
 =?utf-8?B?WE16OGxES0JsbHI0WHNyNDlNZmZYQXk5NG1mL3RTbUovNU5KTTMzYXN2QjZK?=
 =?utf-8?B?a3FFMnlsNWRPTUVMT0dydVN1RUc0RGZjMXB3Q0RBbjFBNnQ5bUZrdzNBMUVU?=
 =?utf-8?B?ckNxL1pBU1ZSUXdsaG1LZUMvK0dDTE1ySkkvS3hOR2J4MVYxanVEMnBWYUlV?=
 =?utf-8?B?OWV0dkZ1VXJCNXBZL0ZXdlMycnJ1SUgyaU9SQ2VNK0pqQVJEeXB5TnN3WFh5?=
 =?utf-8?B?QldDOGNrcng3MERXQysvb0REYXlDbW1EKzRTZlNJcUxTZEZncFByK0NaaEtB?=
 =?utf-8?B?V0E3MmhBNUYra3pIQ1JOR2JZUzhsNG1IZURxbEVURmVLSGVxTUFPdDhlQTNk?=
 =?utf-8?B?RWZOS2hhN2l1aDltNGc2VTZGNlZNVjkwREFyckNqMzY4U3M5SVVndWZjTklu?=
 =?utf-8?B?NVJKbzRhaDd3bi9iY3lIbHlRbXU3MVMyc0RtWG9nUkpGYnMxRm9NbXNQOElz?=
 =?utf-8?B?L1p3N3NTdis2NjRxM2Z5a3JrRndtcWp2WjlyNkxnNjNjbkFnVVB1S2RVOTVK?=
 =?utf-8?B?aUplRFZPSUhnc1FicVg5WDU2OGh2Z1E3ZmN5OUtyaU5WLytLUTQrS1hLV01T?=
 =?utf-8?B?Ym1XcmVwYzMxOXduTWhXM0RYdHNuNkJvOHJhWVdVZUtLa0k2ZzVYdHZNdW1k?=
 =?utf-8?B?WWQ1VW03MnV5SzQwK0lRZ3hrQUFubGdFaHhzVmU5dmd3Q2FLREpFVFBTWGh1?=
 =?utf-8?B?KzBJZ05HQjJHMWJVV2h1QjlERUpjZEVEVUhENEN2LzFneEZDRkJ4TVpEc2di?=
 =?utf-8?B?WEZLaGh6SVdScVJmWGN6Z3ZIbm5COW1ISFBpdG9qR1N2cnB4clRjYVRML2s1?=
 =?utf-8?B?YWREMG9qWTZua0Zvd2tzemJwNEhYMWJLdytJZ3Y4Ti9NQmtmUGUvVXJnRXNU?=
 =?utf-8?B?Mzl1UzFQL2d3MFJmRkpvaXNFM0JrVURTdlhuV285c1JNWlB4TDRnN3QvZnJR?=
 =?utf-8?B?YjFqZWlXUTB5eHRCMEdjbW1sUllVRUhsU2lUaGljclJqbm56VXR4OFVyUkNO?=
 =?utf-8?B?Q2lXaS9DYmxhVEs2dVFUelFRVjBGQUxZRTRtQm55OXI1cEQ2cEdZakp6Unlm?=
 =?utf-8?B?Zlh6VmRSYVdEcko0cHcxbDFETWRJT3BUV004b2JEcnoxVC93Z2tLUFY1QXRt?=
 =?utf-8?B?Ky9LT2JpRks2QmI0NDdTVzdEWVZMcmwzVWRvZVRybDYwdUFDbStuSjBFbFl6?=
 =?utf-8?B?MjltRitVV2dCajFMT1FEb05pNWo5bEhmUkxmWkdlZUJJMEsrcmM3VFE2Z21R?=
 =?utf-8?B?amdEUU16NXVCdzZQZy9tSGplS0kwREpUVHpkaFR0T0JKbVR0cTdoNkw1cCsv?=
 =?utf-8?B?T1hWQkNTSWlQY1lIU1FKSmFyTjY0ZTFwMXhBbTNyNDEyOWtuSUl4aVVhdXZY?=
 =?utf-8?B?a1BScXBqcVhub1BNYXM5MWkwd3I4S0hLd1dRVGtNV0xNQjBFM0N3YzRtNHV4?=
 =?utf-8?B?WWp6bURhK2p5SlRpamJiSU9leW9uWmF5ekFDRE40cWZMa0dweitja2ZrdWZI?=
 =?utf-8?B?eTEybFRTdjl4V0lITGdpajVnRU9rQjJ3YnVybTMwL0ZVb0MvQjhYdUlHY0FR?=
 =?utf-8?B?Yms2QU50ampWWlcwMVNsWDFpeGdSMWN5emEzVUJmamZxOGE5cUVUQUFOZFhp?=
 =?utf-8?B?UUhWbnJ6Smk3Qlg4WnM5Vlc5NGpXU2VvSXo2R1p6Rm1PQkNWTHRmbmdBdHZr?=
 =?utf-8?B?WDFONFNZZ1dsaDU3QXlCSExUYXNkOEFibUMxbGJiNFM5ODJVcnBoQndqeVlv?=
 =?utf-8?B?bUFDSzBIN3BNOHlZVHV0UlZ4ZkdQY3A5b0dxTzhFQ2xSdENkd0pHZWV6dXRM?=
 =?utf-8?B?bWFyMzNEV0k2YmNRWUsrT3prWWZhNUYzT09xU3puWWgvaXFmU2lTd2NUdnc2?=
 =?utf-8?B?a2NvdnVYLzQ2U3gyeFdUUkhhR0tSeEpHenVNbElFaDI5aXVsMXgwak5vSEtr?=
 =?utf-8?B?QzVGWSt5NVVSNU94UGtzNHZzMnYwLzM5enhjc2JZVjlZTG9NMXpnWGp1SzZn?=
 =?utf-8?B?aWh6cUYwSUZaVEJLdE5UYkZXTG5lR1hhc01Vd3ZrOVBsTXZDVmlwSHpoZmdX?=
 =?utf-8?Q?laraVyXQPxi+5ToE=3D?=
X-Exchange-RoutingPolicyChecked: ka7dxQl5/XpxrU/hfS7dyX/8P/rTVu4SszJOYKo36y8cNBPznl/Gx0bwAIwiJ+le2WvcZk4SYu0RJY00WMn/uU9HeBboYg8NrTJhELkmseeJpud2H1bk8YcUfLS+Lx0kzsEIrG72G2KMuHLqoY2o5+uPl28wGk5Zasjzv4tJdazBpvZKzzbinzirn+wsnXw+XwOgydAPsYpPq4/xw3B8NkMMGx2cWPjhzvkomamYrvf/vUFYngS3H/o8qF8jyHw9Cq2Ku5NTt/WbMK191sbNlYIyxmyRzkGNgsZPItNUA5609AbRX0Fq0US5aECgTs+49jpAaTy/1fEctWpE9MlQ6A==
X-MS-Exchange-CrossTenant-Network-Message-Id: d7c58acf-0a59-488a-08aa-08def8ca4f9f
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:34:53.8348
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: faIdUiLlgioXTMVgNY5cKnRztjtVz2LNpgnMk1azrSx2W5o2+zq8glunTiDvift5IG2P9cPRh/IsQ1zVTj7itDWGuESZVHC4G+RL1krA4oo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-OriginatorOrg: intel.com

Hi Babu,

On 8/12/26 3:11 PM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 8/10/2026 10:14 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>> Kernel-mode policies defined by enum resctrl_kernel_mode must be applied to
>>
>> "Kernel-mode policies" -> "Kernel modes"?
> 
> Ack.
>>
>>> each affected CPU whenever a policy is selected or its scope changes.
>>
>> What is an "affected CPU"?
>>
> 
> Kernel mode policies defined by enum resctrl_kernel_mode must be
> applied to each CPU whenever user space changes the kernel mode or
> modifies the CPUs associated with the active kernel mode.

ok, could this thus just be "each CPU"? I find a lot of text in this series use
unnecessary adjectives and then makes it worse by using inconsistent adjectives.
This makes the text difficult to follow since it is never obvious if the text refers
to the same thing as before. Please remove unnecessary words so that the writing
becomes concise and easier to follow.

Reinette
