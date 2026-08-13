Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462652EEE80;
	Thu, 13 Aug 2026 18:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.19
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786645158; cv=fail; b=nBtO6RH72nMxEb2U0TTTyDPv4d6/L0KJVF3iXPpu/1cloW75pyL4YneFcO26mRXOMx2RV7lDwKdDVlGJHhG+xf/HWZjvrI3HqRGkFvCoSZomUSQKX+7hzIxa0Kmw39vWipZComCnHGAIBYcJ0Q84bBA5Yf4kgE22ogU0giMeN9M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786645158; c=relaxed/simple;
	bh=O4e0O5MoMLbLOzgPm5qPt8mUH76/es2QmI0hwEssvxg=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hQjie03IQOpuSs6vPWONQQ0Vwf5NgiufLT8YJDBwdK/wT45Dssc4sBnRgGgVQTqjIuhPFicsk9gTTKr5HHX/aA7u9t9jNJMTdWn3IahVu0pfStBY1yd1pSD/Hd8Bh7sT39IBV2UsTpZYg0Q/Dk45yjgl82DEp1bG0HPaIZLpfcQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jQYX+0Yo; arc=fail smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jQYX+0Yo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786645157; x=1818181157;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O4e0O5MoMLbLOzgPm5qPt8mUH76/es2QmI0hwEssvxg=;
  b=jQYX+0YorS84jlfPS+0kzz6HG4nGnuV9QsHrp6wzOKt0maAqkc1hCdk9
   IzA83Z58xTvgjv1/n2PaGEAs5M//IIPAi6ExftgoTM+4v8gppvUb9PFtk
   ivAlQwiaoTssfBmLOWw7R4tpzFxHc6dGZbJtJxLA2H7JNRVc0/TikVUiz
   l7EeSRXsP7m6rC+RktBTaVQHZXdOhlvEtUYywxLiuMFQJ+wqhfA4QjImP
   8NR/Ea4jAuz6U95wnTVUqE2P8MB7rZuia/JocQ+lZ3xgWPSuI59edROsq
   2ptdufTGeTzRxqAGA9KfE3PsjLs6FUzKKui5k7yT4fL1Wu0wC3mSGSRc2
   Q==;
X-CSE-ConnectionGUID: jbaavS64R5qYGyv/uBPzSw==
X-CSE-MsgGUID: H7ezIyA9StOHiB+MO99hhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="87151708"
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="87151708"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:19:16 -0700
X-CSE-ConnectionGUID: Y5CADVPoTDCAPu/wfDX9sQ==
X-CSE-MsgGUID: /uhBjIkQTFWHd06mDa0AnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,221,1779174000"; 
   d="scan'208";a="260203036"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Aug 2026 11:19:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:19:15 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 13 Aug 2026 11:19:15 -0700
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.32) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 13 Aug 2026 11:19:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EeTc23wPpMx6jUyf6AiMags4pxfeCGRLNaX8bQbRLOidPKav4i5TTHcQguOooGNj4djnHu9ZPO5QiElnoGZ5CLpKBPBsQEGrezF4zrwuxjnvEopYE6BCBcTL1TMzAwZUgGNSClt0wq0OhWVe/tvroHx298wfzuRGqsEEwqgOvuRIvGgeAtSEWU7x5487Rd4bpRU/3QPr1A4nBNq4LC+OEVmO5wiL/OfHmUE36ynArUbYn/IXbAAaKpat7pZKBs0DwQsHsVfr7nL+FmdPTB7JzpNWOuMQQwtsVls3nIwfvOUk9Wz+1QUMq5DnufU9IHn0d3OzACF8tCsqsbwQeDDLQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3MQyEWAWC0JoEm3MTmQ7IAwcfiUcv+7yhW4DcTZ1Crk=;
 b=TzWMCxira0r3XLSc3/Bp7ntJNJTbbCzW/RLWJ+JjOJpwYo9hzR0ds+G/hP0UT9E5jXVw31kBN1O1klcNGIcBqk9lkn3kBLONumiOs3cxkUUQuMeM49sneMqn1c8Wj0km+YQIbBzThjrABoZFWMXZzpTzBGTwwzH5zNsue4l+1gzLQo9kF8LvuvAM2srqKKPBQatWZQnQA09qQJ/qEnMinM8kTfqSLp8F8U/HfoAPdfOfhZx9MjTwEHR9RvPXfCnDrBwsviJjUdQM/afaAHXKmEIK54LuqfG4mDgEIycbRH2PG5P2M8RHeuAQ6HDLAvPVKF2sQx8CG2lWLOuKQpOBTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by BY1PR11MB7982.namprd11.prod.outlook.com (2603:10b6:a03:530::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.315.12; Thu, 13 Aug
 2026 18:19:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0315.014; Thu, 13 Aug 2026
 18:19:11 +0000
Message-ID: <98568620-7e61-4d43-b72c-5866a7d3bca1@intel.com>
Date: Thu, 13 Aug 2026 11:19:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 09/15] fs/resctrl: Introduce
 kmode_cpus/kmode_cpus_list per rdtgroup
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
 <27afa5e408453c93790e5aef61fda31355d96ec9.1783461016.git.babu.moger@amd.com>
 <13834492-22f1-4135-8c57-74052544ed17@intel.com>
 <c4311423-cafa-4b59-8e50-189fdc241de8@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <c4311423-cafa-4b59-8e50-189fdc241de8@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0189.namprd03.prod.outlook.com
 (2603:10b6:303:b8::14) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|BY1PR11MB7982:EE_
X-MS-Office365-Filtering-Correlation-Id: 2e9d336a-0753-498d-c242-08def9675fb0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|23010399003|376014|366016|11063799006|6133799003|10067099003|5023799004|56012099006|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: 4vLmymWFHYJn3PKpKEBMx3+iqK45xzgbgbtqD7I48ptga6/dZ44vHS+IsoxM3zvaZS+V3XBEc/EpQ0Ti8XxV8sw17iMtky3XrR/KcQlGO8zE1XGflT4zh9y3iaMuK5GzvxrDSSi+mTgaa7IhVS+7gR4b4fjYz3/i5/ZGP/udtU9fJYJwSuPyEXEfAtPRbBdGoSxWqp/t/FyMLYdTPQERxjyTGLsGzlRZnXrp2srRxCmB9YT+6ld2Z0jbnWh19uQdyjgjwKY0qS/2ZwdpisA2vs1vz27Q+7YapwBhMjoYgUCu4Ps724B0462q20qrmzUNXtaulDHVnd96ymDn5vR26AQFWWo3u0/yrQv1hLokWpqojFgUT/LJ9oQFDVxvsRYFdTnltF/U55b3skLA8vfyZl2ewoiuLAgKr0Or2TZ2JyejTtW4ev2nx51Eu0QX+87Rn7XWTgHM9ctbEtUcF+WWpSqo3Xf6mZskV/vrcn9WQXwrjb5wzWpaesKn+oGErqUlsfV2Xcz0uzvkps5S5i29IlNh0iuDjjLn244a7POGOMnbU2Fc7gzcxlbyCcPPnJmeb2edj1LNTOnsgee6iVX6c6Eoxb71doL8m9dF5QPZregEGBa0vMYpMQpda+OUjiaWeibnDNFPkxjvqGCMEpWkM9CSbtflD6hHCo5fNtPxjKI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(23010399003)(376014)(366016)(11063799006)(6133799003)(10067099003)(5023799004)(56012099006)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?OVh5VzJZUEhkZmQ3OWJTUkxUZ0F4VG9qTXg2KyswOVB2b0xLczhJWWkyMXdD?=
 =?utf-8?B?b0hMVndxMUxGclRpU05mQU80VDlIUDJvUk1oVW9wUzZrOU5pVnR3L3hCZDlX?=
 =?utf-8?B?QVBuVWQ2MktHQVhxUXJWOG9zVHplWjZ4Zm5PcnlnL1RETUdDd25kL0NQblJs?=
 =?utf-8?B?NWNVa01hR2QyVjBDb1J2bWN3QVA1LzZITXN5djdjdURQbVVWMlB6Y0NYN3ZH?=
 =?utf-8?B?UHhhazdhYWpRcE5ReXBQdUFGbXFHS3VlcEVoUExVbEo2M3JMMHB2Y1UwMlp1?=
 =?utf-8?B?N21wQXA1b3A3SDc2NkdJZFFSU1hkRm9MMlpZVHpKZ3JUK0FkWlE5ZTh5QnVL?=
 =?utf-8?B?QlE1dFRTZkFFYlk3SVVpaVRHRGlZOWZ2SGxQcjJJYnVlWVRSU3l0eEJEVU0y?=
 =?utf-8?B?QzRDMVJuWXRiaUkwcDArK0NpclJaN2pQaHBUWjhCT2NIV252ckowM1MzUkFp?=
 =?utf-8?B?WWZ0MEsySEF4RWVROC9MdU9CaC9ZVXN2TWRnTzdiMmRTb1U4c1MyVFhpRmJ5?=
 =?utf-8?B?M1pUdHREeHhDQlVaaDE1YnpSWlIxMHdVZWcyZkpTdVB0NWxLclFUZy95RDZy?=
 =?utf-8?B?c2JrZGowTDVnQUh3VlI2QlVSaSsySkR0UUV0elBFWlA3eUl6aEV5QVA5WlZY?=
 =?utf-8?B?ZXUxZnFVS1o5bDlDc09WTy91SXdQaks0Znh5OHZQMVZhNHZ1bGY1ZXpWMWVH?=
 =?utf-8?B?cHlMNFREMW45bVE3Yk5lSUxDWWc4VjN5NVFQUlNQYU0wb1JoYm54OU0vV0xs?=
 =?utf-8?B?RGNOcVVFSHBtbDhPeWVjWVB6VE9PQk8xNC9NVTQxV3pPcWJ3UmNqMWVnbG83?=
 =?utf-8?B?Tk5tck9qcDVuRllJMS8xTDJDWnJocm5IQVB0R0NCYk9rTkVuL0I2SzZnOVRj?=
 =?utf-8?B?eWd1RURXNUVEdU9tenFrKzBlaEc0eHU5eUxuZFZ4SEVxQk1lME8xVThsYjk2?=
 =?utf-8?B?dWpMUXphQ3UwSE10NTQvWHI2YWNkUk1EYmQyR1BSaUpDbTQxZVdMblpjZEtr?=
 =?utf-8?B?YTJ3aUl4VUFxMHp0Sjk0emJMdzdVWHJwWlJCQXo3ZVQ4aVlwbDZYTFMwRGpp?=
 =?utf-8?B?OUlyOEpkcTY0Vk5Id0FJV0JXUmdxOG80UmFkOEx6NU1abVlRT2RyYyttaG53?=
 =?utf-8?B?R25yWnk4UEdOckkrdWtjTnh6UTZRYUlNaS9QZy90ZkZ2d2NGZU1ZZUtWQ0d5?=
 =?utf-8?B?RURWTGljL1Uxd29yQ2NwU01VMCswUUR4WFFMK1NzcVc2YitqbjBwS2dqL3Zz?=
 =?utf-8?B?cS9lVVVkQStJNHJFcmRVeVNUY0d0K0gzajF2aUwzaE1BRE9JcG50MnhPQUhm?=
 =?utf-8?B?MW1ZTmZpd09uNnRsOHJ1N05BWlpOZE9LeXhzQ2ovK3pxcXFmdnZiZ0cwQ21q?=
 =?utf-8?B?dXlkRDZ5a21teHQyaG9vVGtwZ2R3cXVoa3ZtZ3lzMTZxajRhemxSWmhBcUJ6?=
 =?utf-8?B?QU54VjFEa2xueldKNzdOUDR5SGhDTnFkcHE4Nm9FN3pLMnV5c0haU3YxUmlG?=
 =?utf-8?B?UHJxbUwxRjlvK0Z3ZmY4SXlURFBMSlAzTjIzc1MrdS9ITnN3QzI3TnBPU3gv?=
 =?utf-8?B?ZW9oS3ZkU0FRSE1BaENtRDNabnNzQjVodUNOSG13NTlDb3oweTl0MFRzQ2FZ?=
 =?utf-8?B?RFA0MExaNW0vSzBVMFp2OXNKaklFS2VzeWxDYVRTRTVhdVltWFFleERCYWkw?=
 =?utf-8?B?aURvcHZSSk5idFNEdzBYbGhCejJyY3BMMnNOY2t3Tzg5OVQrUFRRNWZkblRV?=
 =?utf-8?B?YnJERnA3d2VCSEVIS2hnU0o1Z0huQWpxMFJFUWcvV002eUE1UzlmODUyYjlE?=
 =?utf-8?B?T3BVdzNLb20yOHNhWG1RRlhncEhTa1djYkRQUkRCZ2tkaDFueW1CcUoyeE56?=
 =?utf-8?B?Y2VIdnB2NjFXenBXVm5obVBqanJQSDR3SUFZcnJkMDJlakdPR1FZWTRPTXFi?=
 =?utf-8?B?YjJDbk0xK2RWcFc4WjJacnQzSjlqQUNvcHJScC9OYWM4c1hvUUhLdmUvRFVq?=
 =?utf-8?B?ZWRPMk02N1Z5Uk5CVkxJSDJCS1VWL3RlaWNFelE5cG1Xd3BkTXQwU1MrMjdw?=
 =?utf-8?B?S2VwQzU2YlZObE9rSU9KcGh5dFd2Mkl5bjhLdDVTcUFweTlhZWpFMjZ1SVZ5?=
 =?utf-8?B?VTVKOG50elh3eC9FbUtKY0ZjUHM3VTZpZ1YzVHJkN3dVUUVsT2dQWFMzM0tV?=
 =?utf-8?B?dTRtVXd1N01kSU92ZGRRMXZ5c0ZKY3NkK2dzVlZ2emVXSmVST2Z3Z0RSMUFE?=
 =?utf-8?B?Uk9OdkhsaGYrZWVMbTNSNWVDZ3hNMnZVUWVNa2szUjI4VlI2aVdqQTN0TTMr?=
 =?utf-8?B?bXRTeWRSaGYzYjc3T3FUQWtQaUVSTTJFaGR6U3pRMlo0YVkrOWk1WkN5a25L?=
 =?utf-8?Q?GVt4kAypTWsAKG40=3D?=
X-Exchange-RoutingPolicyChecked: pxWZ4XoIcNI96oSwrnb8v2mpiGaIDoOSddLbS92NDH+oCoe7G3ku8oDGhaa5E9lMf5eM4z2qRAQLC64EaOJ1vdFrUB3LAME+fUZqT1MHSo4zzpWXpjH89eNUjio4WiPpV5UtpPoFW+kKizXCa0W05DCX7KpHGpwHpKhccknUIC90qE8qiW779rlNuLaVsOv9OecJsZb8MDrHhbq6ZJDL2Fvnl4sRcBLi3uNX+V+8B3P+c/nc/DMPp/hQSBMllHdH4DtbnkpwAPrKrTLkuTOrH4hES2W86MdFElMU7i+/xAUD1g7HB1Wu7xJmZsM1K1Q6qWPhaBvgOSjvKPhWhbf8BA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e9d336a-0753-498d-c242-08def9675fb0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Aug 2026 18:19:11.6965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 11JtDP0VW+PQbBwDNyvfjPTAD4P8lnNNYp526gGpV6ztDJxmqoai0Fs9CNBlPgU9xw4boVadn0dK1b922vp9+ywZWwSKaDg+gVPgtRBjDRU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY1PR11MB7982
X-OriginatorOrg: intel.com

Hi Babu,

On 8/13/26 10:57 AM, Babu Moger wrote:
> Hi Reinette,
> 
> On 8/10/26 22:20, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 7/7/26 2:50 PM, Babu Moger wrote:
>>> Kernel-mode resctrl policies allow kernel work to be associated with a
>>> specific rdtgroup, optionally restricted to a subset of online CPUs.
>>>
>>> While user space can query the active kernel-mode policy and its associated
>>> rdtgroup through info/kernel_mode, it currently lacks visibility into the
>>> CPU scope of that binding.
>>>
>>> Introduce read-only kmode_cpus and kmode_cpus_list files for each rdtgroup.
>>
>> I think it will be easier to follow if this is deferred to not create these
>> files in all resource groups by default. Instead, at the time they are
>> created it should be obvious that they will only be visible in resource group
>> associated with the active kernel mode.
> 
> I am not clear on this comment. Do you mean create these files when user associates the group to kernel mode? (during rdtgroup_config_kmode)

No. As this changelog states it creates these files in all resource groups. This
is a confusing thing to do at this point in the series since these files are not
expected to be present/visible in all resource groups, only in a resource group that
is assigned to the "global" kernel mode. This commit mentions nothing about this
usage and thus from reader perspective does not seem like the right thing to do here.

> 
> Also, you mentioned about rftype::create_hidden in
> https://lore.kernel.org/lkml/0126a5e5-48cf-416f-a21b-c231a703c18b@intel.com/
> 
> Can you please clarify on this?

resctrl has centralized functions to create files. For example, rdtgroup_add_file()
that takes as parameter the properties of the file, struct rftype. With a new
property, for example rftype::create_hidden the file's default visibility can be
set _at the time it is created_. This simplifies the code by not needing to sprinkle
changes to these files' visibility after the fact at the various places files are created.

One patch can add capability to resctrl to have a file property indicating that the
file should essentially be created with KERNFS_HIDDEN set.

This patch can then follow by using the capability to create the kmode_cpus and
kmode_cpus_list files in all resource groups and it will be clear that the files
are not exposed to user space by default.

Reinette
