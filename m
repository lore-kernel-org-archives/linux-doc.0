Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9D9E257855;
	Wed, 17 Jun 2026 00:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781654448; cv=fail; b=DLm4xPnHqSpeFaDxsjdOgDLQHRQ0NzXoWiBthvnYW0bvCqaAhuASsZkH5aDGGisjuX8x6jiiCawO09wgLYLUuOXlo41gT2EQd4J6BDQaN2MMA74/15BtWHJDYY2wBQwU8NeKoIE/AClTWt9kWmxeIbwuCTue+kFs+hy+5ZKMwoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781654448; c=relaxed/simple;
	bh=/rocFkQNVUT4M0hCahxEiGNoljRwtyumrsW1dDM850E=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=GaaNfidOldZArVfH0vsEM7D8hbDg6uDM0G0kXPO/f4/31UycKqNhZSbpevqupXjTFSFbBCyc2VJsR05HtclLaxKINQmOqeG/hJsZeSRkNP/87bELaH93u79p6XeXqsGJC8IK43C4wJ+SChAXg7cdvTLvMW21qibmE5XmrZZkG4M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KktYxe2p; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KktYxe2p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781654446; x=1813190446;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=/rocFkQNVUT4M0hCahxEiGNoljRwtyumrsW1dDM850E=;
  b=KktYxe2pt/nyvmftQ89Mx2JI/sEe8EmEJmSpB0GdHgQcNNXp6HoLNnWw
   lZ/8/inz94+ttHSGupzHww4Q+hmk2LWSJOBrh3aEHT+MkRb0PcJ+sYZc0
   ocpppWjO5hX82V6OJyURuCjqg80hXXXZVsNZO+diU95BuFUhMLCHjDmr6
   m4pofB9vywoMmdL0fUlAAdTy0GDEiLcn+29Jrm/6jFn0I+z7wn+F7dBnu
   qircKSL7RedW35Gxn1sAM53ONN8AMGqC0kh9mTPneowo3iSMnBksddvRX
   xSXqTNUeQdo9Qghf65CS2Teqkvjuq9uk3Zsu7NEH41okqySDrtBYOY+2D
   A==;
X-CSE-ConnectionGUID: O1exdCNrRO6oa9VG1usgGQ==
X-CSE-MsgGUID: cW3BifN+RbuKX7+T8bQ/PQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="100006487"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="100006487"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 17:00:45 -0700
X-CSE-ConnectionGUID: oU+gO2DRQ2ueNWECDyK9tg==
X-CSE-MsgGUID: kqt/7GQJSKaoT9m05UkLWw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="243540414"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 17:00:45 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 17:00:45 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 17:00:45 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.0) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 17:00:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gJtuul9kl4okCXNo/74S2CXC+zRwy873tcA/T8ZPi5GEnf1Ss6NsGer9+coYycCalX/r2ozFoMvRIGZBZy+Itlx2yhpj46J7hxmc4HElgtbXG/NTmAg7EYQQ1VUMVU2/v8I9XRXlB/IyIG3bcW74VH6JkhLRtaNTpQ+O0lHVUPzOZ4B7eSLqEja8pGZxvji27y8avt1q1Ul1NVngu/c5Rtp2fSuDz0VaSXE8K6N/6up6YdqND9PwGPyoZaL2pc/Zz2WKaXLkQeHUUjLaFhFdMcSuw6nu0xfozt6JDbwrC0qotazcXKB10ix2fXPRh5/gReShll3s2ru3niM2a4WJ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsqbOfqenqp9qvHDuS0wFPIQZ2/NxH2kTD0DpBHGfvw=;
 b=you74j0Ecxe1rR2/UBsEe7ypobOEHALMW4ITknC5Ch6fEsBnrqLIYrEEApVN3IHmXGrZEoCianKG2JWFhfV5xKUEeoTkvHWGfzp+cJJcatAJQrw3NM4spSZImJYQm4spaxu+5/U5/hfn/2Xq2AzT9FEcMpvV/f19yvbsHwF7GqTW+idns8BLLEb6bUwrO8JsA24zkH+ZKROc5Sxkif9iXdAIVaOUViF7eRV/JpKZYJUiOZV5y46Z1ccRPhRRcQ8InESiZab+N/RuRuIat893Bcorw6jCD7KPxmkqSA8YZOfeOIa7SF8ejzvcLKUJFEL3gZS92uAT1L4WUYuIq6PgVg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB7663.namprd11.prod.outlook.com (2603:10b6:510:27c::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Wed, 17 Jun
 2026 00:00:41 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Wed, 17 Jun 2026
 00:00:41 +0000
Message-ID: <353185bd-2b3e-484e-bf4c-e774c70ea63c@intel.com>
Date: Tue, 16 Jun 2026 17:00:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/12] x86/resctrl: Support Privilege-Level Zero
 Association (PLZA)
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tony.luck@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <f59c7f5404f29b2901af68d8032ee615b7f0efea.1777591496.git.babu.moger@amd.com>
 <081b5cd6-37a3-4aaf-862b-b41e9536bb66@intel.com>
 <a737ae9e-9cbc-46bb-b565-0b888e69f0ea@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <a737ae9e-9cbc-46bb-b565-0b888e69f0ea@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0047.namprd03.prod.outlook.com
 (2603:10b6:303:8e::22) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB7663:EE_
X-MS-Office365-Filtering-Correlation-Id: 183bd9e8-b76f-47fd-06e2-08decc037878
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|921020|56012099006|11063799006|3023799007|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: hkDTtG8l5Zo8jY22QF+yKuAp4NIHtyHtP5gT9luupjP0AoXZEc9QFihZLJJYRZK37pn5K5XaI8yEXwZCvasRBLplFjrceqz+tAEkKaYGoIVWu0GvjHPjsM5u3AAo7PnwJdwKF9AfFdnwyRIZbLizua0gQI1YbQBu0WAVm7Pck9bUKHUsAjmxAe1ZtbdbMWlRq3Bs+FaijGQqXgt6smhzowLs51BmbqxNY8q5kNYH7HKe1u6vu1dY6jBBQCFVS9tQltp0QcqsWXMvcdKEwQm9z6kvaR5R1K+9QYnFUBf7ed98YnT+K4+2/oOHhOGmSVnrq893YRlRLDkrDP0zfnV8nBwO83lqHao5iwQmDhAecI43YnDtidHg3oPmQxbItSQLXseM3d8hFe+dkapn9ZDO22Q1hDtzfOcia5JOuaYngiuci9wTWUhHDN0UbmJ5W+7cTxj+ctlOQQGw2kFjh+p2Gy+WqrF9YAx8Z7Q2v3LGFauMbM1EbfgySKniuPzJvTJrCZ0xiheUG1C/X0XLCbh3rjFqI/XcMfHyn+Xo41YeFUkBTkxg2GLLzuuBU1ZA/wvEUqKKjWLx6q8vlS0DtwPZ9PrnTlUHEPErQ2ezdsAqVloqzPp4scK3WD0F5WFhgNWlvGpcf9mH1SZzdbEeONp7yi8OYUPXF0q/tVAUBK7UwPvGUVEHLlb/xGSoKtB9mpmO9NGqJKLR8aewg7kroxZXwhF0sNYAPrn6BLao1L0FHUg=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(921020)(56012099006)(11063799006)(3023799007)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VnpiN0xHejI3STF1REZCRU5MU3pPZm4xYWd6SXlNTFNQaStmV3ZPNDhLdGtE?=
 =?utf-8?B?TytaVmxwYVYrNnBMZmJ4Si9tbm5qYU05Ly9SUUlPb1g1NWV5V2pmU1ZUQUtV?=
 =?utf-8?B?R2RjREM3R3J5bVV4TkRQbFBHbjY4bFB0TnpTa2VTZ1FCWllzdG1XVUE3YjMy?=
 =?utf-8?B?NXlBRXpjSFRlUjZlaThhWnd3d3Q1Y0hUN3puanJiSHorRDZZWVdnaHZVN2lE?=
 =?utf-8?B?bWRaOGwvTHFhb29kclZmcVpUK3dmVVg2QytEekIzTno3ZkVqYXF5cTRSWEtC?=
 =?utf-8?B?dFNnYzRuMFRxc2g1dDNxSFd6MXZlV3RHd1QxRGw0ZUlXNEJoZFh4bzlFUnpj?=
 =?utf-8?B?czkxM0xmR09nN3Rjdkt6U3puSTY4TC9Id2Z0QW9uQmo1UVhEaXUxQ1ROdTk2?=
 =?utf-8?B?L3prZDJCc2FXUTR0UmVSZTRTZkRzMTEwaXVUcHZPQUR4dTRhKzdHcG1KNndF?=
 =?utf-8?B?TzF2cHpCL0x1Qk4vODlKekxqQXhHWEttRlhCMnBwNXhWMWoxY01rUTVMUkhT?=
 =?utf-8?B?WS83VnQ0WVpibFVKQlNQb09oYUhXVTY1VlpiREJCMW4zTkNvY2RZaWFmU21F?=
 =?utf-8?B?aWlVa25GZXdkbXhGYTJ0RGtudm9MZzEwcmlyUW5LTmJ0WWRES2RyZGM0QTZj?=
 =?utf-8?B?TFhGYTg1aVZQaEUwU2kySktVcldWNFNzZlUwWk5QVERrUHN1aW5ma3NhN2VJ?=
 =?utf-8?B?KzZtVmxvTWpoOFdaYjg3SGVLZ2tGKyt3VkZsVjByenp6aVlsTHVSeVhMM1dw?=
 =?utf-8?B?djNORnpMOW9JSEliajFJRGFrMGxPL3VhUzNZMjFDaGJ6TjIyWEdORDRxRWRv?=
 =?utf-8?B?QUhJdFptNllzOE52cWhJQWkxUnpXcnMvRW9FNytycktwcjF2U2hpalA1VGhC?=
 =?utf-8?B?VEluK1E0eDl4V0ZMRjRNSEoyUFNYamlFR2U2em5SYmVhdlJIS2h1UmttUXg4?=
 =?utf-8?B?TDhocmYyenN3TnJHOVVvZnhKdW9ZQ0lqWEVwMGVId1AwQm1seUZhRFhBRnpp?=
 =?utf-8?B?OEliRUJvVDlYeEF3eGNmcVRzandTcDdVUEVldlJDTTZJMFgwejNQYlZzZGJ3?=
 =?utf-8?B?d2hSTVpMc2xVZHQ2RHNTMmZCczNwOXo2Z1VkUTZiUkdvcHFLZWZCRGc5Y3Fo?=
 =?utf-8?B?TWR6a3pWd1Y1VGhPenduZnRZNEZXTEZhckNSZmRYajR4Q0kzMEY1QXNiSGlC?=
 =?utf-8?B?eTRZeC85M3N1YjNyMUxMV3QvaFNSQ0FYMnNDbXFHVit0R0JiRHNUTkRkcGFl?=
 =?utf-8?B?a3BFM2JOamwyTy8wZUZMcWJjazczMzFLcHQvYTNTdkszTnF1M0lrU1NERmlY?=
 =?utf-8?B?S28yd1Q4NGd2bk5EYW1kUkhHZVRuRmpoUE1RS2VDZ3phZThlWjJkTUdWYlkz?=
 =?utf-8?B?K2k5UytzbFVVaVdOY2RBb1NvTmEydTZHRFFnMzVpS2owd0Y2RjhjcWg0Tkxl?=
 =?utf-8?B?OHZpQzRJUlg0SmN4VGVueXpwRnJRQmQxeFRPSzZLS0VMQzhUWnh5Qk1DWHJl?=
 =?utf-8?B?SHVFQWxlWkpKSWxaRUlMR1JWVDV1V0hBQzRkMXBab0VQc01LUTVYU0FTRnZ1?=
 =?utf-8?B?OENQRXo3RnFiVDU1a1Y1UDRKaGxpNlg5TG9OQnRldVcvdzRrVmdkdlErNVRU?=
 =?utf-8?B?NW1qbXlhd293SFRpbGx0Z01oRUJMd3B1c3lNb3RvK2pVbTNWa3ZiT3A2dWxT?=
 =?utf-8?B?QWJuZ1lSSmZwSkgySGdwQjRoOEp4N2VoMW9vbWpxMTFuVVE5a1VaREs0elNY?=
 =?utf-8?B?eU9zdklXLzVyL2NvQXliL2lwczlnTmFZdGRKMFcvSk5aVk1vOXgyUzNSOWdN?=
 =?utf-8?B?WXB6czFUM3F6eVRFSnpYVVJwYXl5NVBIRFVTMVZMSC9zTmRhVWFTamZaQW1q?=
 =?utf-8?B?Z2IxYXNNUnRzazN5WThrUllydHJpVXN2YVVQK1NMUkhhQnVGMHJ4SEdEVlRG?=
 =?utf-8?B?UFpFVWtNNkdpQjlVVFMrYzlRN1VqUXczczV4ekZwSmViVDlDNkdVVGp1Q3Jh?=
 =?utf-8?B?NTlCM0lOVnVZc0VCVUFZaW1nOVhZdkZMbnJQakE0MWdnQVVQQUFpRnBzV2Ns?=
 =?utf-8?B?UGgyaS9NYmNzMzJJbVU3WmVKVGN6ZE9mSDZ3NXdnaGlCM0F6WnkxZklwMCtw?=
 =?utf-8?B?cGNUSmVqYzlVT2YwaFJLSzhHdDFuOVNaSnFqSzNyNkhEZjNMMmJPN1VZUkdx?=
 =?utf-8?B?RGFTRGVNT1hUd2JWNExkNWtwT2tVRFJBbzljUUlOdDhlTDlxdWwxRCtLRS83?=
 =?utf-8?B?YkFWeDRENG1KNDVZb1dhMmFveDcyMDIvMmE2UWNROHhUM0I1RWFmcDZKNkRN?=
 =?utf-8?B?S2tnRVdFNHJYRXVSSkhJT0pZMlkvNElzNmFIcDFCRVozM0JXeHhMeDNxL2JZ?=
 =?utf-8?Q?f4RDz3mCFMwd68OE=3D?=
X-Exchange-RoutingPolicyChecked: tACUF2+I8Sj2JQHIy+TdiR1FCCsORoWRBoAPFkM8eDQeRNHfnS6vV4+MXgxIK6MA29mjVxmYVWstt3TuKKqxtObsZnsIzn1jRU2DtfP/XayOFnB+qX9ec5d6TWyOGIbryCzaATEctpZUjrk6FJrTt6Jb9P8opXXM4SboACb877Y74CpE8Rn/45Pw5QusV8MEcUwE4vQCsUGLYIjWNuVQx2Dbi6TbzOfRXaHdK9sJQ3RVVo+9XpHnVDv0jKxs6hO5+AA4lNkXGc3S5qgOVW6S3ezb4Oja6iKMp0M3FRikxtw8PFQYhKKFHGzD3KI+CHCzXB7IwPqej9o9Czoo3+YaiA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 183bd9e8-b76f-47fd-06e2-08decc037878
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2026 00:00:41.2669
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bSg25iJyfAuYSQwxh87HrT7v+2f3N8AywDjcPJ5ea8wqKTO+Qmsx+RdxpcfoPNuph+CMabDW32Y97Fex5Vg/xqVISdJx3ofX5hy9SBfiHZc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB7663
X-OriginatorOrg: intel.com

Hi Babu,

On 6/12/26 9:56 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 6/11/2026 6:23 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 4/30/26 4:24 PM, Babu Moger wrote:
>>> Customers have identified an issue while using the QoS resource Control
>>
>> "Control" -> "control"?
>>
> 
> ack
> 
>>> feature. If a memory bandwidth associated with a CLOSID is aggressively
>>
>> "a memory bandwidth" -> "memory bandwidth"?
> 
> ack.
> 
>>
>>> throttled, and it moves into Kernel mode, the Kernel operations are also
>>
>> What does "it" refer to here? From text it seems to be the "CLOSID" but that
>> does not sound right? Should "it" instead be something like "a task with that
>> CLOSID"?
> 
> sure.
> 
>>
>> "Kernel" -> "kernel"?
> 
> ack.
>>
>>> aggressively throttled. This can stall forward progress and eventually
>>> degrade overall system performance. AMD hardware supports a feature
>>> Privilege-Level Zero Association (PLZA) to change the association of the
>>> thread as soon as it begins executing.
>>
>> "change the association of the thread as soon as it begins executing." I am
>> not able to parse this.
> 
> How about ?
> 
> Customers have identified an issue while using the QoS resource Control
> feature. If memory bandwidth associated with a CLOSID is aggressively
> throttled, and a task with that CLOSID moves into kernel mode, the kernel operations are also aggressively throttled. This can stall forward progress and eventually degrade overall system performance.
> AMD hardware supports a feature Privilege-Level Zero Association (PLZA)
> to change the CPU association at the user-to-kernel transition, so the kernel execution can use a different association than user mode.

"change the CPU association at the user-to-kernel transition" -> What is this
trying to describe? CPU association of what?

"a different association"? What does this mean?

> 
> Privilege-Level Zero Association (PLZA) allows the user to specify a> CLOSID and/or RMID associated with execution in Privilege-Level
> Zero. When enabled on a CPU, as the CPU enters Privilege-Level Zero,
> allocation and monitoring for that CPU will be associated with the
> PLZA CLOSID and/or RMID. Otherwise, the CPU will be associated with
> the CLOSID and RMID given by PQR_ASSOC.


Sounds like this is vague because MSR_IA32_PQR_PLZA_ASSOC has not been
introduced yet. Could it help to introduce MSR_IA32_PQR_PLZA_ASSOC as
part of this patch and then the changelog can be specific about PLZA
feature introducing this new MSR and how it complements MSR_IA32_PQR_ASSOC?

...

>>>   Documentation/admin-guide/kernel-parameters.txt | 2 +-
>>>   arch/x86/include/asm/cpufeatures.h              | 1 +
>>>   arch/x86/kernel/cpu/resctrl/core.c              | 2 ++
>>>   arch/x86/kernel/cpu/scattered.c                 | 1 +
>>
>> Please split changes to other subsystems and make these changes
>> obvious with their own subject prefix to avoid sneaking changes into
>> other subsystems via resctrl.
>>
> 
> Ok. Will be two patches.
> 1. For Documentation/admin-guide/kernel-parameters.txt
> 2.  arch/x86/include/asm/cpufeatures.h
>     arch/x86/kernel/cpu/resctrl/core.c
>     arch/x86/kernel/cpu/scattered.c

The resctrl changes found in (2) would be documented in (1)? That does not
look right. Why not just split the resctrl changes from the cpufeatures changes?
This would be similar to how you did ABMC enabling. 

Reinette
