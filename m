Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF2430CDC;
	Wed, 12 Aug 2026 23:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786577946; cv=fail; b=H1jXdN9vZivmS/HPVkbyXT6kxPCQ3CJF4LiqcLc24fuyjFP0HdvXqV/0p2BFV8mvZ3FIOzwvxTwkcLdjAePw/PRf3ZNlv8PjnJGOTwfe56/2QgKX3OUJy6MKuhFTqVVDfWvMM2iGdEBfOCKXZ3t4fgxfBJZftWuww3gd26x7uZM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786577946; c=relaxed/simple;
	bh=3ywn0jGq+0Z3X8bs5pxJYLLS0juHMYhjosfK43vaPEs=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=WRvxDpXqTOkVP6eOfm+KGOmvTscGLXBDC1xf0xiM8M4NJCn+oWvcFpjcdlppMSHO4pHnq4uCWz/cL5Yk21qSZczzNp43loNmJR/Be8Dstn8ZJGWniAnF3VT9mIgV7jkkU4DDjAeI6YX+dULb+QodjSYqnY1CirvsSzoMnnK/dX8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OlvOurlw; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OlvOurlw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786577944; x=1818113944;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=3ywn0jGq+0Z3X8bs5pxJYLLS0juHMYhjosfK43vaPEs=;
  b=OlvOurlwl9x8yFOq/B6NfUs8Z1OkTBy6PPLuah6e/ADOx/cMJbRr+wle
   mtG3kwS1aPkIfe/N1ZFmtmg8pUHXKE6BFZ149bSf5WqYbOXlYRL5RJ0LH
   h1t4pAB8Z7qWUiNkpgOTcy1JT8Lx+2bRa0UmHIl7NluwT345ji2r0q9UM
   2K7KJu9x5kjx8jjRL0mSgkKFvjp7LslqN4Xa875quW9UHrTTS09Q9lFwn
   k5qGhAXbGo03QziWst6bWSW10hDlnZ7p+LsuVIjxvgVOMVc87VBQwhPrq
   gL7TmrZHW5p8ja45RpKfejaxhK7VSaJUbYP/lP9xvMbsvOn0A3rglhU0d
   w==;
X-CSE-ConnectionGUID: +gIT1ymkQ/eoagziTnjETA==
X-CSE-MsgGUID: SZFQziJaQ0aYWarpFhP4+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11873"; a="98507438"
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="98507438"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:39:00 -0700
X-CSE-ConnectionGUID: Ef1LwCYMT3K790KipAUX6w==
X-CSE-MsgGUID: SdZZexYMSy6I89YS91DqOQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,220,1779174000"; 
   d="scan'208";a="293728638"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Aug 2026 16:39:00 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 16:38:58 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Wed, 12 Aug 2026 16:38:58 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.28) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Wed, 12 Aug 2026 16:38:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2ujZU1dPAtd2TMAdVT185G1eCNdBwFY7PpwJc8aT4zQO3qc27oAXoGgq48NOph1mh6Kdal1Z9eMrtnjtjinDPjbQiwwY/l4zcUvrgTg47+lqpOHBfeSC7HtWLBm8MBurXoP4tfvpt1H3Sh5fscjc/yFOdHa1tMjEnlaccQhZ1V6/M9kUx4sIoyjhn8SNwwh+OOjEiu6ILvvLlXgIPqobDdiPy4ZK2DIOgthTf/dbWriYK6iLNKvLzf27YGtPFO7H4e6F+wMHOXR8yN+1xdco4ggq53OueJNiucn+Ptx/v4CByQpF51UFeXM0T0Bl3BTBSAZxJUZFG69MgAbgVP2yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=A0p78E3avKJJxAxz0+VVPeK2ZKkJyDCPOcibhtXQesU=;
 b=bHYoy5cDAUJa5BHMT+qb11LR8ejOyY7baWQSeZiUilqJCjw/FTQE10o+VE6BGrXPani61uStGytcK2dcAmtWwT94qLXipsKeP++ucRxoRnWR/bSpx2SyfRrT8Rw9HFTdd19VXuzbLp7ZPcryw0rH4lABQW/4B6aeb6SoopPV0cmOopM+Efvc0il/td/3NsDSPNt123Z9R3cJ64gj172STvvP62UxJ/usO6aMXaN5bHgiI4R7sWQT4VT7EFCZrhGtwuwnd03IIxGu3ngIWqNuyXm53M29F3xLR5HvkzXbNQXyRjvxBJOHfHCkkQG3ZYXyfUBWB1JwMQSqoA95hcXamw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB8379.namprd11.prod.outlook.com (2603:10b6:208:488::20)
 by MN6PR11MB8244.namprd11.prod.outlook.com (2603:10b6:208:470::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.13; Wed, 12 Aug
 2026 23:38:48 +0000
Received: from IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6]) by IA0PR11MB8379.namprd11.prod.outlook.com
 ([fe80::549f:e4b3:e10d:aaa6%6]) with mapi id 15.21.0315.012; Wed, 12 Aug 2026
 23:38:48 +0000
Message-ID: <24adc700-2062-44d1-92f3-4bc18d134b8d@intel.com>
Date: Wed, 12 Aug 2026 16:38:41 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 08/15] fs/resctrl: Add interface to display
 supported and active kernel-mode policy
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
 <c86c7a64f25171b773077ec47a20850b44f73ada.1783461016.git.babu.moger@amd.com>
 <328e237e-3d26-47c0-8167-8ffe5d765daf@intel.com>
 <924aedc6-c2dc-4c09-84d5-2bdf1370ab36@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <924aedc6-c2dc-4c09-84d5-2bdf1370ab36@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0116.namprd03.prod.outlook.com
 (2603:10b6:303:b7::31) To IA0PR11MB8379.namprd11.prod.outlook.com
 (2603:10b6:208:488::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB8379:EE_|MN6PR11MB8244:EE_
X-MS-Office365-Filtering-Correlation-Id: e76fd385-9cad-4bdd-8618-08def8cadb81
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|23010399003|1800799024|11063799006|4143699003|56012099006|10067099003|921020|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: OFveOAcUgikYrhS7xpLeTxS0UGamfM9L/BRomzVqJP6ON2bRMQa04CRAbFjmpLuB8kLXw5V950NLSiXSOxIXkIHkTSlVmxtcQ+XwEGY+0O8LY8NcG5SPmghvE2CaXYg33IOgmEgL89i29zVjhDLIon2nNX4LSwm4EvqoItmBNysiS7MJ6XrqIuvhmi3DdZnF8fxV97VWNvCfGubQrkju/RfdyPHzgKtzQIhXxHaBl/Sbl2UPsMxnGuofXDE2K/5kS8DTUA/W2qs23w+1eZivavHS+1WVpiS07dgmdcXY6R4LhTV6fKrnswb5YJNkYPktpOuvOMhXL36tLPVVof5JbDjFQv3c9QrAhLr0dsIQsVaBo8QeeZWtEbGnn+ZDiEY4NjnkHUetmYN6WtDtk+rqPYE6KvNUSvh8ILHn78+mPE57Roy3pNHVBY5Xj7pK6D+SYJoUDUGS6MXRkedtKVn7O3r0riwgyQpHGu4i+pZllkEShHh9N4idcmOjNaMT4yEvt568CvHYiqsbmIbGkyXPrEueUVdHshlD6A524nn34PVcrRhPeaW0oBhPxtFOeikLramwtbSqpLC7/b0q+GECvhACBAJ5W1/hrMeHlMTLqnaTU+AiM3m1wCJSXJiEy0Bt44FmBSphRHM/bhV+kiHmgMib5CWxk1i5xbEV6/K0rynv7zoGkGTOU0GAnRcimVCacQedL3N9NdwScywvbm8P4Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:IA0PR11MB8379.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(366016)(23010399003)(1800799024)(11063799006)(4143699003)(56012099006)(10067099003)(921020)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZFQrYWdkR0xxVVRkZC9tdHpNUDhmandMa0VNTTAyUXk1ZkNTM25rWDUyb1JN?=
 =?utf-8?B?bFAvME9sRURZZmJQYUNVd1FjODJkQ0RLMGRUY05DK09YUC9vbTlFa1ZzdU53?=
 =?utf-8?B?VS9FMkdXUWFLUk1kTk8yZ2I0VWFBNW02dnFOQUthN3QwdnpqandtZWhEMlNO?=
 =?utf-8?B?bDVhMjhDNW1tcXczS2pPK0orVVpycVdyZkVpeGpndGFNOHpRRS9pY2J6VDJj?=
 =?utf-8?B?aHByemI2QmtoTXp6NFoySk1lU2R6bSt2S0h4ek9xWFFOeU5peGYwVURLNUVM?=
 =?utf-8?B?ejc0MWpYNGZHZTRZRmp1aTlYUGl0eG0rOGh0MEdicjFsQXR1TWxPM3FKd0E4?=
 =?utf-8?B?NTBUa3pVZWs4MnNyVmc3VnpkeWlDZGorQUl1ZmoySEpxRURmSUNKWUcyQnY1?=
 =?utf-8?B?TlordXorOENCK05OeTNnVW50MEhPQWxGRkdpTEZLSDdFS0R4L29iNjcwcWpL?=
 =?utf-8?B?NFRvWjlFZGJ2YklsdDh5Mm00U2o4KzZQUVVBdmRSNTZmVGhhVGJzbHJZSWlh?=
 =?utf-8?B?aHRXNUVwczRUbG9vRGVHRUpjME1GRzdJMWI2NTZYUktuTlM4WlJTNTI1cGJ3?=
 =?utf-8?B?aFNWcFV0dVlaUFNWUE16VGtXd1o4cHBvL09INVEvOEo1WWlXUlM2Um1vL3Ny?=
 =?utf-8?B?SVFaZ0huek00UG1VT1ZLZzVobXFNdjJmbXIwaWNUVmVydXVuMVg5bUZ2S0dq?=
 =?utf-8?B?WitXako1RGkvckpTYjJYOStXaFpwQ2lHdEdjeVRaakdYcVFrcGc4RU8vcVIr?=
 =?utf-8?B?d3JqMXd2UytQQXJRQThlWWgxdXRkbm42aFF1bDI5VVR4SUZwd1RnTWZFcUpF?=
 =?utf-8?B?U3V5SzRyYnlML2lWS1RDNEptVWF6My9sNnhBdGdHaHFXaUtXcEluUWtWcGhy?=
 =?utf-8?B?MFJkb3pES01BVTgzSmlUMlBGMXhibmMwNk5CUktuZUFiSldHeENjdXEwUWpt?=
 =?utf-8?B?L2g3ekRCWURJZy9YNlFzWVppaFVwTUZQNUo5dEJQemI0ZHA2WTRaUlNmQ3p5?=
 =?utf-8?B?dFdWTE1FKzd4bTFNeGpzdlhHbnBIVDdGcUNGTU9QOVlVVm1aNlA0cFk0Qkxy?=
 =?utf-8?B?VlphWVdQbWdtRnBoYXRXNUZPNUhjdEtiNUt4RlVoTG1QYTRTZzg5dlB5Wm10?=
 =?utf-8?B?MFg0RXhCeEJabWkrME43WFF3TmdkYnpCNjlpenhJdElZQTQ0d1QwcHdFeG5q?=
 =?utf-8?B?NHdsK0VWVEZsaThjQ0xIYW9rSWdNQ0xsRXpJL2FBTWZZWmVEWVE4R3lZRnl6?=
 =?utf-8?B?RG5XT0kyU2h3M3kvMUR2ZFVNekR6bUhaRGFIWjZKOVd2eXRXNzlLOUNkaVlC?=
 =?utf-8?B?NGdpcDBPeWJGeVdpS1R4M0Q3Vm9UbTBNZ3RIc0l3blg3U0d0WGY0Ti9wcUJh?=
 =?utf-8?B?ZzljbU1yUnFFMUNvbE5LUkUrejBtQmtHOU5VemVNRDZvcmRCT2VBREs3Vkc5?=
 =?utf-8?B?Zm1vOE9qbkhPZTRzTTJ6RWVJN0xxN0RTc0YyamhRVFNRNzZFOUNMYURJZkw5?=
 =?utf-8?B?ZUhNRlhXaUNWN0FFK2hYRU9sbDFvQUtUZVVhWmNEcFJqdzlMMEJIK0dXVXJv?=
 =?utf-8?B?OTU5WnF6WjhwVjU4QldpZEUzSytIYXN0NEVER0tyOEE5Wk1EYzU2c1EyNUJp?=
 =?utf-8?B?L3NHZWFac3pYZXJncit1OUFSd01GS0gvOEdIYnJ3K2svN09GeklCWjlCRTBM?=
 =?utf-8?B?T2FmTk5nbmJhb1JpclFSSGJ2QmE4ZDFDaGJRZjZqMVcyZ1ZCRGRHa3BaZnE3?=
 =?utf-8?B?UWxLNjFVdEF5cEJ2QXk3ay9NV1Vac0VjUEVTb2JMc1l3Uzdxd0tHNnNUQ1JR?=
 =?utf-8?B?S0hRcUl0WGdHbGtheHY5NDF6dDF5blRhSTF1dWxDSzI0RjAySnpUOUd6QTZD?=
 =?utf-8?B?Zmx2RUVvSklUTXhNWmxuTFVIaU9QSjltL1hDM3p1bnpYTlVYb3ozMUpydjU1?=
 =?utf-8?B?RmEzQW5xUExkeTN1YlhlTzg5MVUvanUvbWJteGI2UStJVEthWjZtUUMwNnVY?=
 =?utf-8?B?UmZ2TVhERVN1VUIzdzUybi95aXA2Z2hKbzdUbW9ST0N3OGpwVUV4ZFY3U2sw?=
 =?utf-8?B?Vjl2WmJhOTB6dHRUNVNQKzNIV3NEZVoySUJZMDlmVWJjNjllUFQwMlFxc0RT?=
 =?utf-8?B?ODd0aFNWczNwNFZZdFFYemo0bTRMTDJGaWxUeUFvUnFxczg3SzgwQlRYeG1B?=
 =?utf-8?B?OXg5cXhmVHFBSVhQaXpqZ2J5MmIrWEpZQ2ZmeGxpR2RJbmRUNjVDU3FucUMw?=
 =?utf-8?B?eGZueFZOeG5zQityQjY4em1zM2tkc3V2V3c2V0NVMW1PeGs1WXVHbWxNMW5k?=
 =?utf-8?B?bkp4ajQ0YkJyT1BTR0hQTExoYTdoSjd1bVhUYkFKOG5QMWxuK1Y1MTFpZjlp?=
 =?utf-8?Q?0hkU4alI/8IjzcXM=3D?=
X-Exchange-RoutingPolicyChecked: FlKlH9XFRLMeagkhoK2gXxO1mR1xr3QODRnWeOrJ6JyJJxAJ9NXh66Fwk8gq6fVXnI3kWsvUUAxCfBCB5Vy2Y/M5lxxMIkKpMKsdc6HFgwXyQqGbxZRPKYZubhD/D/t7fuqE+SLMoac4LVEgGOu8fHe7zh/hSW3qZC3FsQyUYDNw51awhPLpNHORZn17+StvM4TFcbDC7qlBbPrKOJJF8gCNYT62emOponNOJxoX3HP6fNsyZBhz1HBeSp2lApzCm2ERBW0n+pbBxb/DPvi1IBHkGUPPDk6mgep29gEExtD8c/SSDF/KoJMpo8Zz/e0c0RuT8z+xRXuY3zcx1a3TFw==
X-MS-Exchange-CrossTenant-Network-Message-Id: e76fd385-9cad-4bdd-8618-08def8cadb81
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB8379.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2026 23:38:48.5002
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 88mOvx0GYeadb3xLzVYhw05F9w0YzdKO6J4exaAW9G1XlWzjL/MF1/yxyvHL8iixccCgH0vkxga3HOgpEb++QVeGYohBqdrutJ26E2agJ3M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8244
X-OriginatorOrg: intel.com

Hi Babu,

On 8/12/26 3:57 PM, Moger, Babu wrote:
> On 8/10/2026 10:18 PM, Reinette Chatre wrote:
>> On 7/7/26 2:50 PM, Babu Moger wrote:

...

>>> +         */
>>> +        rdtgrp = resctrl_kcfg.k_rdtgrp;
>>> +        if (!rdtgrp) {
>>> +            ret = -ENOENT;
>>> +            goto out_unlock;
>>
>> If this fails there needs to be content in last_cmd_status. Otherwise this
>> fails and then last_cmd_status reads "ok" or worse .. an old failure message.
> 
> if (WARN_ON(!rdtgrp)) {
>     rdt_last_cmd_puts("Invalid kernel mode group\n");
>     ret = -ENOENT;
>     goto out_unlock;
> }
It is not clear to me why the WARN_ON() was added. Is the resource group not being
associated with kernel mode not a legitimate scenario if the kernel mode group was
re-assigned while the reader of this file was blocked on the mutex?

Reinette
