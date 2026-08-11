Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24F211FBEA8;
	Tue, 11 Aug 2026 02:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786416695; cv=fail; b=i8ku/ZNb7SQggWjhrqz6kNHNRE1tI1d/BfhLqVUwPNJszCp2n5LCZNcdhV7dnN4n0Dau3gWjm4QS8SqZjACB+GcKz+oC5BRR7vPI01bl37BHvvyLZAW9Eo6OhlAj6zzVoqbvjZgANa3ShnsJIzIu94usqJ3AIP+26DZfUf4QTtc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786416695; c=relaxed/simple;
	bh=mOuBU9iXdvHChotXf5hErDlOinztR1NBbfhcMRBsE2E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=qXsC05F/7y2hYYj/tAK5J36ys4MlzanUsEJdy8C/ex/ypsLziufpF8WcZgR+Qe5KJ+d7QymhxRu6uTV//L93TfU5YGrZSp+3WtoodLYs6NETUH93f10YUH0I8DU0tH7+wtadz0hqS4BftSnReBgeplWqOlyJfHluxRLkGVqQsCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bu1HcuM+; arc=fail smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bu1HcuM+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786416694; x=1817952694;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=mOuBU9iXdvHChotXf5hErDlOinztR1NBbfhcMRBsE2E=;
  b=Bu1HcuM+a7A5NnVjT0poKPvdxZ73IINZ+IOMMI6ESWFJlBRh/WsERN0X
   ZOq0F76w7z/nlL1gPgb+90M+zjDWNkTmmLG9Bh+ZRlQ2BnA1/tcGh/q9Z
   OgwJl7RNYNWjt+TcxuY3rfbK35K2fc1cQg5wkpmJUA27FhrhoAX13sLG8
   2CWagYwfu0DdufCEz+a1gKZpY/83BMG7dz+WeItP3Z65JxhIdrW1w8k6P
   InZ5joNj0fu+pH3ImeoaECJ/O1sV7nCTiXgyhQmzpN5pB6+AUz0KnLXSX
   /0xpGG0F6wNtz9kUnbBHaby41Cmk8POhn4Fv4MlA9pYI6m7+BTVTC+q9Z
   w==;
X-CSE-ConnectionGUID: wf5EE5XARbObAVX6ybcV+Q==
X-CSE-MsgGUID: xldyOie8TLeBue8U4v5+xA==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="104333266"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="104333266"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 19:51:32 -0700
X-CSE-ConnectionGUID: o14rE+aMQResVI5ViNjabQ==
X-CSE-MsgGUID: WhOcVM36R+C7XoVmtYL0oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="260609307"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 19:51:31 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 19:51:30 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 19:51:30 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.54) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 19:51:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LEt9YMm/ltX3+wpXB86pimvKVsc18W7YHixfjZ5SCBWI5K1RbxEwPGhNLi7oyMQIQ8O3vxi2GpfjCL9BYmPqd9kNJOnSpWRK1x8MP3Qw4UmOL7RjFIZgrWLRB143pGVbM7wHTBlH9e1IIXBST6qzz45WcKVtEB8KwBlhd3gifAHC0Bdurc+7wA0XQXLf4a4iZIJqa3zsI2PZO3hq5NZCNjL1depP27UyLTLjTqo9xM7ZUGEDioRac5hMBZx6/LckUbm2DfW8BgRFOJJY8/LDJH8XeuM2rZd/Jt+NpjNFgtzG78OGayiYlcaY30F9v1JGShn3Ur64MsZvE8lZBqixVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=emMS1O5ooKPUro13VtIiwzCvUbSC7fd8NrdVV07/6oI=;
 b=MQO1TiEYPBI0MtNnOonj5/tL3v+IWzxbhtyUUEwP+al85izkh5mGkphbyztoFRYHHncjlzy8Kh5xsPBTK5P0ugWKY6iPsX13rjZLPWmi6N0Yp27Pjz1Dg5ZCZELjBPWe3l20KtZbWGZfRtx/vouLNr3mSrnPqmgcv+CphdFU4H4Dmu8Ye4sRIlLOF/HMJFYS+PqPIoQCoPLbA7tlgQqSI/RwniALBSRy/UFX8hcIlCrZdTYYGM/b98yJh7OAypPVZeB+27wDS/Zezft3pykZSudY9nuHN55n4wgNzHsO0CzEOEV2DMq8HkBf5IrL+KIwO3iNEax14RsCU8VYfQfJgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DM3PPF453C3BEC4.namprd11.prod.outlook.com (2603:10b6:f:fc00::f1b) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 02:51:27 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 02:51:27 +0000
Message-ID: <3e655139-8d8d-48d2-be47-0e3200122773@intel.com>
Date: Mon, 10 Aug 2026 19:51:23 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 01/15] x86/resctrl: Support Privilege Level Zero
 Association (PLZA)
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <ben.horgan@arm.com>, <fenghuay@nvidia.com>
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
 <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <d462f5c3d3a4413d4271384f914d1895436f06ac.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0023.namprd03.prod.outlook.com
 (2603:10b6:303:8f::28) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DM3PPF453C3BEC4:EE_
X-MS-Office365-Filtering-Correlation-Id: 06c7b99e-ed46-455a-12e8-08def753700f
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014|23010399003|18002099003|22082099003|56012099006|11063799006|6133799003|10067099003|4143699003;
X-Microsoft-Antispam-Message-Info: 4URrSfWlBmZh4taS0oYlCyE+4DIo2zAdNdaW2fGdpuH5zv1qLxMw0Xbkguin+tcUFiqslb9IdWIL5p1Tpu+aU4mWRo69oVYF9k01x1zLQ+S7F/CTHHZcuNiIpl+bkEyYB5oD/iSTWgF3QLHXYpaDeUr3zoCAUjSBn28+q3ZsHLAxkai8ABbNoEjmVACdUwB3HyNnkM9mnlqaCZVj+DLJBk+hIvKnEFOhCINa66WX+6T+Q3kWE9TxXZdHfXG7vYWeboC9fJqQkVBi9bGcd4O/iaPD2ZG9ohn1mTsOXfKdy17aRTpTR4G++6SksMVTbmw97E23GZiBc7W/gL5mhNM+PHQzJl9ChCelsBDC78ww+zK0kryZ5sfB2NrF3tYC1tMDu3btMMz2CfzBxLPvBehvJxnqOTWLXbBotMrII5SnWp0EPqyEij3hjQh6EIeNrQc279kDWSWbgMKrzEf9EHHR201v5vl1kJWQBJz3DgThLbakvGcbUdRCzo+c2wri88QRtVCxxgXDy4n3vpRtAA2kIASZdqlYPrF5KTKL+R1q72Rw+O0f2gh6eJWW+VSBIFKpL8VZf/q0O2yRntCP8R0qC9yo3N8J5NL/d9kJhE1A6lkPZ/lt3gel/Kz3vTh7M4nz9mbOhs+uKaxeyd59edIAwKLLvKPdUj/5t5f9Y8Z6O8I=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(7416014)(376014)(23010399003)(18002099003)(22082099003)(56012099006)(11063799006)(6133799003)(10067099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZG5RNmIxRFFDamM3S3BRcUR0SVpIeDNNV2pHZHlzSDRUL0Q3Z1MrS0hHZ1BX?=
 =?utf-8?B?aUp1bWFMMDNqUHRtbndZU3VnY012SzlVS3p2QUFMd0NvcWdESDNvUWtJeUVC?=
 =?utf-8?B?MkNOdVRlMWwweUdEamxab01WZnh2MDhzYkQyZFRMREZRdVl6Vjh2eVpPbHkr?=
 =?utf-8?B?R053RVV6MVREUlpiSXdhVnFYRlRoeGxBbjZybTZONDVyM3pHUUViK2hYcHpZ?=
 =?utf-8?B?TUNVS21DSTRMV0IwRnk5UlNaYlNzbS9NNk16dEhaWkd0VUZuQ3RhSmtsV2cr?=
 =?utf-8?B?akJvWlJBV3ZjbTBLekNVL1Btczc1RHRGSjRxYWltRnJ0M0o3Tmp0NXJZQisy?=
 =?utf-8?B?VE8rcTFSNlhKSm9yQlQ3dUUvNUVBcTRQUS8vR1hhcmJja0Yyd0cvdFE1QXRR?=
 =?utf-8?B?MmlpWWxxZGlJNHdCMVEwMmhhZVpRZHdZR1RSTXdoczZCU3NSZVBOMlJNY1ZW?=
 =?utf-8?B?cmxUUVUzQmJ1Z3JtNXAwc1h1bXpTSFJza04wWVB4NUJPYUw0VmhYaFZiVTl2?=
 =?utf-8?B?aDVJNnloRWtobmdtOWx5Q0JoM05GL2tmRktVclpkOHJiUE12RGlUUGNsbzVq?=
 =?utf-8?B?dXFtdXZ2TEYveDE3Szc3THVuMC9KcEVCU1R0Z0NzaWZ4RjFnNmNncUoxMHZi?=
 =?utf-8?B?QlpuUUtyZXp6eW5FVDhuUFJlZ0VNdm05aXRqVCtYRUNWeFJTVGJ2bVdDT2Q5?=
 =?utf-8?B?bVVTc0k5ZzZFbkRUbFRaN3Y1aW55MlZQbEdZdXJXSDVoL3FHUXFVeXdXU2JZ?=
 =?utf-8?B?b0MrVWhCSWtlTVo3dmVOTFR3cmViOGRtL1Z1QmpMY2M5citIaS9KUndnMjk0?=
 =?utf-8?B?K05RWGlOQjN1YVA3aHorNXNEQWZiamczSm5WVkNCV0ZOM0dMcncvNDBtVzNo?=
 =?utf-8?B?WWtwbkxuLzBkTjZVTnFYeksvSmtodjk1akJCb2FvMnRNbGQ2dXkwK1B5VUxB?=
 =?utf-8?B?N3NrQldQbzZoeDE2eUg0ZGJlZkN0ZXJtM1ZrZ2VIU3pXTnVjWUx4Z1BnSWwx?=
 =?utf-8?B?bzg5Zm1jUHBUdVFsT0ozSXYwWGszSDVYS0RUQzdEbFdnSGc4eGp2VmlZRnhn?=
 =?utf-8?B?OXBzais5YjJxemFuN3p4U3pDcUUvZVdRNDB4ZVRIVmNXQ1g5RWxuT1J0ci9K?=
 =?utf-8?B?SGdhVGVvRmNiVFlpcS9UYWREUnNoNlRHWkRJbFZkMzBKREwrMXBuOW5RVE5L?=
 =?utf-8?B?VEhFTWE3K0I3MnZmUUw4NUxZVWxybCtoU0FUNkVWbldVV2RUbHFyQWw4MGVl?=
 =?utf-8?B?Uk00aGFwbWE0ZTVIRS9qVW5TMGhGejJnUDlUL0NHTDRsVjlBY0Y5amxqUC9u?=
 =?utf-8?B?amR5NnpYR0FxQVZ3dHUyclc5OWlYM0toV3I4NUhDbTUwdy8ycW53ZzVZdjhT?=
 =?utf-8?B?N3Z1UlBGKzNXWkdzSEIwNXBpTUxuUi9SSlFFcXBDb0FlOUJJMno0K21qQVJ5?=
 =?utf-8?B?Z1ArbncyMERoK0J5YllpeW5nSHpXOGdUU1FRS0pxanBoaW1hWFVUL0VmYTdF?=
 =?utf-8?B?ZzdWS0d2blV3VU80MDJBcFZDR0szRE1KcHVjb3lQY3VyejhycWZDeDl4YXM1?=
 =?utf-8?B?MWNYU3FkN0ZsSUl6WVlaZDd4QTZjQVdYbmtNZVZiOUt5OWVDNFZCOWd2a3dk?=
 =?utf-8?B?TnMyZWhPNDJkL0QraXEvcHZNN3hJSjJoYi93WXowaHNQYTdBc00yZ1REUWlQ?=
 =?utf-8?B?ekJOd240UFJVQ1J6Vm15RkNyUEMrRVlsYWlMZXI2bFNrSWh3T1FRbmVaL3NO?=
 =?utf-8?B?YVlOd08ycGc3SUcwWk5vMkE0STkrS0htOWVZUEl3STlZQ0dkUE9MZjdyakp3?=
 =?utf-8?B?Z1d1NThFZFlLNW43bU90VUN6UnpGcTVISGp5SFYvQnlYVTQ2RFdXc0NLaW5S?=
 =?utf-8?B?QnFxdldZdFZEYmxUYlh2V0FXa0hHVnpZeUR6eE94SW4vd21ZZGVnSk5NNWRW?=
 =?utf-8?B?V0JnRWNIM3dOMkZGUS96bDJMVTF2aHIzOXpybFFOMWhHZkh0Wm9oZHV3MHBo?=
 =?utf-8?B?REFKell5eFVGajRacnYvQjA1Y0ZIcHZnSGFJcngvWjZ1ZXE5b3crNUcyMEYy?=
 =?utf-8?B?OHZOa3lIVDkxdVk3SjJWY3dYanhDbzZBV3dVQytkUkhVWTl1ajRETWRmb0NM?=
 =?utf-8?B?ellleTF5MzlndTl6MDdRV3YrTlVrR2hQR25qZ0VLV3VpbmgxTXk0SWJFZVRR?=
 =?utf-8?B?MXJKRmEraW5KOVZxY3BLeEdkajNkS1NYUEpGeGpGa1EyUTRiREFVZEQ0K1VC?=
 =?utf-8?B?MjJFSDJOODJ2TTJ0ZjAyMFIvZzRySkdxQXZmVmkvVnUrK1k1RW4zU3BoWTd1?=
 =?utf-8?B?dkFkM05RNXhZMEhwZXI3MUxVditWSEVpRld2T3lnbjhxTW5abWhtbks5MXRW?=
 =?utf-8?Q?dKXCyEk6cTS8F0VQ=3D?=
X-Exchange-RoutingPolicyChecked: Lleim9ssAfh8F+UsIJN8I/oQoMUhUNlnPOQiZJIJmw9pX/A8Mnmwty+ncui/QCv5AyTYV8K8HizKLsDIz1V7jIK9EiLJ1Mo3L9oGUHeVm490A4/ePzn9UxvdHjtYqhzxMn2T6o4vbnqrR3lDDFc+XudI1AjRLDG7qNV4g+s+rByhyu6rYREKlYlbFzeW4CD+06KHA42JSTFBlWNX5unXa1aCmSESkWAyBNhZzFPUrPehUNYtoDuIrk4sTO0bS0n2GmuG6HMlsh+VHj+bZOpfls8bpKkXNKevdqtHvFQESo93pZgwXKxkDbU1SN/4szHC6PNrgWPUn7PaB9/F7Jw3/Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 06c7b99e-ed46-455a-12e8-08def753700f
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 02:51:26.9958
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1oH9F5JKBjzKUxZvU40L3T+OSEbJ7lUhlKEX/y6oVJW8WwP7OboRBPa1bZ3nkqIzAd5YvKsB1JzlKKZYKmv477G4PpiGf0OSDWzIrvai2MI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PPF453C3BEC4
X-OriginatorOrg: intel.com

Hi Babu,

Could you please switch subject prefix to be "x86/cpufeatures:"?

On 7/7/26 2:50 PM, Babu Moger wrote:
> Customers have identified an issue while using the QoS resource control
> feature. If memory bandwidth associated with a CLOSID is aggressively
> throttled, and a task with that CLOSID moves into kernel mode, the kernel
> operations are also aggressively throttled. This can stall forward progress
> and eventually degrade overall system performance.
> 
> AMD hardware supports a feature Privilege Level Zero Association (PLZA),
> which allows the CPU's CLOSID association to be changed during the
> transition from user mode to kernel mode. This allows the kernel to run
> using a different CLOSID than user space, which can improve system
> performance in certain scenarios.

How should user interpret "in certain scenarios"? Could the scenarios 
be highlighted ... or maybe just drop this since it is already preceded
with "can improve system performance".

This description implies that PLZA is a feature that is only related
to memory bandwidth allocation where it can be beneficial. As I understand
the feature impacts all allocation features concurrently, including cache
allocation where it should be used with care?

If the goal is to describe all the feature capabilities then it may be
worth a mention of the impact/usage related to monitoring?

> 
> The feature is detected via CPUID_Fn80000020_EBX_x00 [Bit 9]:
> Privilege Level Zero Association (PLZA).
> 
> The PLZA feature details are documented in [1] available from [2].
> 
> [1] AMD64 Zen6 Platform Quality of Service (PQOS) Extensions:
>     Publication # 69193 Revision: 1.00, Issue Date: March 2026
> 
> Link: https://bugzilla.kernel.org/show_bug.cgi?id=206537 # [2]
> Signed-off-by: Babu Moger <babu.moger@amd.com>

Please follow "Ordering of commit tags" found in Documentation/process/maintainer-tip.rst.

Reinette

