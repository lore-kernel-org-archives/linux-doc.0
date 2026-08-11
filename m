Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9EBE39B94F;
	Tue, 11 Aug 2026 03:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786418185; cv=fail; b=o7ZLsI6qBErbzY6oWqZa4yZU2pg9ABrmAsROZncQoGXnUeRII/S28QBNXWEKeIp/xVjdlBmoSlPWBBJJYnb//QaE28xRAU76OLDb607ZqfCfj/9XG+Te8/vFwW83aWF6qKpkffYBrcuu3v0WqWzstusE9++DujKIrk83GRm23nU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786418185; c=relaxed/simple;
	bh=LV+tsZehoj9kHoZe7ZnhtVPp8Swc7KrOmDae3SdXttc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=VrpCKdJLKwM/5EFIm/WQjhFdIBWemF0jWgIBQf3joRqYdlwxiSlomJ5AilVHQOZat802+PMsmpxpQYbKzY/zENj2XCjmWISXy6K31czk5iftt5pyQueVeRIs0x8kSUXhV+q4woyl3ExmODSQIfyCxWc1k04USr7chddiYuTL+Gc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JopU6z1Z; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JopU6z1Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786418182; x=1817954182;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=LV+tsZehoj9kHoZe7ZnhtVPp8Swc7KrOmDae3SdXttc=;
  b=JopU6z1ZQ63oIR+vGb73faCFKv8KxTgayoeyHRqlvnWgF2emK7eNsmLN
   jFIJBEhEL6ODt9QL+ABFnG74HNoGR+GMorfUIheat5swKGvP06fMbpQV9
   H3tY5AA1w541DzUGVzTAZdFPHCcZlBhSkjR/BtOLCvH9SFgyrmbCOQ47u
   UBzaIjJdfOZjyMXyztxHgY8dBBjzxsoJu53mZHyebUNLyEJkg/hhtPtAf
   flTjEKJlS7PQgLaJ7OQ/uY9lu4X+MBZNW0U2irHSifX+duo/E9wzlrK9f
   Vwo5YwN/XgZo7lMA7EckjGbbjh7cRHj342YkEps3xB1YSdsIKWpKTI7Kl
   A==;
X-CSE-ConnectionGUID: 3YPdNnXBT+u3dgLMu1ikkg==
X-CSE-MsgGUID: tPBibJngQ0i3w92iY2Te2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="86820036"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="86820036"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:16:20 -0700
X-CSE-ConnectionGUID: SjVn92SJSTaxobEluI9JJQ==
X-CSE-MsgGUID: 7Jr8EFmmQG65EkLJwl2c1A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="259363760"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 20:16:19 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:16:18 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 20:16:18 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.4) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 20:16:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FmVu2J7QCvJJVppelr8zU5nOxyPyOvfgzCpjVzmdEeMS9OkySvyis17lO72IilAKvv3vW33csEXMo2QI+SiB76zsG9aHL68NhqyFR+7LcxkX2ZxO4Pyp5F6Na1AGfbwncUsVb8lmgQO/zhi6WLQtkFVlBqqSaiYIeGBAFrP3ymdCuAvJ1l493za2ZLEE9K0f4y3Mc2biggVNbfKKg8EqP+BrPthOr1JyeDh1KoMOzpkAGmK6jLWLJazECANuu5rkOkpMJfAJJWkFGXpGQEXIVOqkZSHlzf95NUcCbMKc0Sjd2iWM729mS+bAq3fAUgACTKyOvkZOxbLIGX91Fp0x9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kGKsHbi+ounLXKvoL0UTFepTEsrFiVBWXyABLg5YAVc=;
 b=M0oGc9F39nRoi3Tw1lA5Q0tiuqPXr2BYXmcY4GlWu6MWKEDQsMT3AVkJ2qJZR8RBsBbl3dG2VweFelufX9MLCFXgVL+wFAlxjjdoSBt7nuEPdHKBYBsDsHHtDSv4rNZLESIlLgTRPj6WOq6ZgguIlzvoWZ0738PAZvGmy9pbPuck2zg71P+8ip7eE85ycNHHf07S7f5SwkyjzpLZg4twi30TUkDZWbpS8uwu7dXHbGiyqPDpXuoKNYE8EIoS+ZqIMBZLAmxEqQnaFm9IxGPnO6cWjb7up7+CQwqpF7aQvqg9o1xmqSCuGgj90zVFZ6mTNEalTy1gzQoVxoFJG2N+nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ0PR11MB5085.namprd11.prod.outlook.com (2603:10b6:a03:2db::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 03:16:15 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 03:16:15 +0000
Message-ID: <681e0257-80e0-44c3-b826-20e314a3eb0d@intel.com>
Date: Mon, 10 Aug 2026 20:16:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 06/15] fs/resctrl: Introduce
 resctrl_set_kmode_support() to initialize supported modes
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
 <f4926d9bc70261ba0245a1d1158d8bd3d09bdefb.1783461016.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <f4926d9bc70261ba0245a1d1158d8bd3d09bdefb.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0265.namprd03.prod.outlook.com
 (2603:10b6:303:b4::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ0PR11MB5085:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ee61bec-dc23-448f-9db4-08def756e6df
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|11063799006|56012099006|10067099003|6133799003|22082099003|18002099003|4143699003;
X-Microsoft-Antispam-Message-Info: R4t52zNBB+guFdfTmj5YHhpvDv62kRN+IUCPvpCOGtkYqvR/tebWIlGinlGtlia3vJqYwRFcHenHwRJ7Q6RSFzW4k5zqvA7DMIL0hCS1lYT/Az5c8CpVD/D86wOfvkFsc80rZb/5CE8YmpxZgy5cIXRv31UZ0u/rZzfN7vC8i/bEYJEoSyh+uoUQE3XkmHV/D2x3AdfHbwEtRmRKEtjSZ+e9WZijcdIRERktVzxI93EpGjNTNj2ZSmf0PdFomEl3AZ1zqOUXZtDrgOykksBj5c2uArQji0xxpIOcVmXDf7ixS2mMhEQmxF2WmVZdUbaziUeoNYAuH5fMhtKORRfPa2plM9iEZIpf60svFfnervINMGjUE718MoL4M1fWIP8/Fo4yJeJLwqBgVjXLbsfGLyIWh9TVGCnKLX2tDlKYtTXr9tfFWD3EwiZrGCdeTfvWjbfEGV/+N3WjeVVywLqMsR2Ol8ggSS6QwNsvyXEmAc4+t6nbOrbW/Q+adyhVij9VXAR74Z/YShbB+dDVEPe3wuggtc6srEjaX71Bj2MipPaFh5xfHDJVy6BBSO2WARmXf5diOw74KT6ImjFRhlyEJOwGdNUBOZVUh3bExenSsaXNAaxyN6fCSBiBG63GfzO2ZVYebf+HdBSaJEjGdNdvgzjRfr46T8Kg6+voyc7MME0=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(11063799006)(56012099006)(10067099003)(6133799003)(22082099003)(18002099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R2RSUkFPUkxDelQwTkhNZGZpelFTUkUwTTV5b1FZZkRWaUQ2YldFenI4R0FZ?=
 =?utf-8?B?V0hkNnNmL1pwZUI0eHoySFpmbFFPd0VxdktUTnZ3S0pxS2pDUmpjaTk5dkYv?=
 =?utf-8?B?QURuZm1Ka2lUWHNNVUhHU1Fadkc3QmF1dFFzMFVzaVJRVllKaGE1NEhqczFo?=
 =?utf-8?B?VTZEaS9ZQUN3UGE4b2N5a3JHSmlrODBzbzFBYi92MGZuQ1Z2WWVWWkFmQ1dQ?=
 =?utf-8?B?NlBPK0FwSlZMa3lGL2dyVE9oVEd0alBlOHNOcGljWEJuZlhmU2hFZFZYSVdm?=
 =?utf-8?B?TXBDSU5sU3A3N2tyYTdoYWF3ci9HMkpmUkhRUjB4TGY5K1gxUmtpTG5ROVVv?=
 =?utf-8?B?T0JsRUJpanpacVJKVWNXaC9xRkhCRVZEamQzY2owNVdFemF5Nk9aVk5VeGQr?=
 =?utf-8?B?NXBJdm5vQ2I3UDROVElHbG9vby9EckVnYzhid3I1UE41SEtFWlhkY2dVN1ov?=
 =?utf-8?B?L1l1OTJEeFRHT0QzSG9NUVN3Znk5am1uTUpnQld2OTNrd0dtamlxeUR6ODI5?=
 =?utf-8?B?L3d2eG1QN3d1U2lhY2QwejdXV2Q4WGZqSzFLZTNIVGgvN1FRRnpGam9lY2NY?=
 =?utf-8?B?cWE1TzZJUTc2TWRLeXNCQVRCbEtRdXlkN0NkOWJ4YWRYMi9BYUpRRzduS05G?=
 =?utf-8?B?d0h5UXJBSkhPYWwra2ltcmxvRXNvR1d2Rnd4Tk9GTm5ucHNydlJFQm50ZGZs?=
 =?utf-8?B?QU1oSlk4TmtaYzlTM2l6cUZsb1hTRUNnZkdDTDlNa0FmSHhLK2VXV00xNWpD?=
 =?utf-8?B?S0UrZjZTRmgvZHZxODJacWlGNlZMZTBkdlVvb1ROT1ZFKyswSllFM1ZpUWo5?=
 =?utf-8?B?MmUvdmhRY2Z5cEZuYTQra2tpZDcxdDdJeHNsOWxENlZGT2dzODNsOURlbUVo?=
 =?utf-8?B?cmRDSlp3U3I2MkFtcTFadEUyVWxJaHlycDFNK3JMVjNQU3RKelNUelZ4dlgx?=
 =?utf-8?B?UW5YdzBBTXFqeE96eEZDUmpsYk5ETGZEblZwZGFiWnAyN3NBRDl0QzQyLy9I?=
 =?utf-8?B?MUFPcTVpQ1l5eXZ2TGR3V2h3OWF2ejAwNnRQNkNtSXNvK0VJQVN0ajZHY0Fm?=
 =?utf-8?B?VTZMdmoxSnNlb29GL1BBS09UdCtRQlpkYjcyRUo4dlBZdmtwYlJYL3ZPQ25Q?=
 =?utf-8?B?NW9aTTJPa01VMDEwNEpzcjV0MDlzSUE2K0pURzZkb0JHSVNTb01XKzY3S2po?=
 =?utf-8?B?bUFnbXFKT1k0WnY4N0NmMzY2R0ZxT2wrUTkvTmVTTElrVXlOczVreVVjTElD?=
 =?utf-8?B?WTF2clF3R3VGcDRvc29rMnhhY3lkYTBDN203V2VsT1FKVk95bEZ4eW84T0tU?=
 =?utf-8?B?blUrcmxJYlluaFppRTMrTFczb1VPdS81TUc2bnlLR0w1NXg1NmZ3aXFIaWJ3?=
 =?utf-8?B?R3ZrcU0vbnc0U1dEaU5raDlmMlhGSWQ0bGttU3crSDFvaHI0WDNUc0wwUmZS?=
 =?utf-8?B?ZVBkYXo0QUxnREJmMHVUcmdVSnc4ZFF0ekcvV0RkZVBTSDdoQ1pwbG9PWjRU?=
 =?utf-8?B?MTZvaGJWcEx4SVpUaTlxNWtVUnJmcFNOS1hnY2VqQ0EyM29LR3RzVmhsZHhl?=
 =?utf-8?B?M1hCTzltbGVxQit1RzdoZ2cvclZMcnhsNkNmQzRsLzBmc3BkLy9DaWJNWXJv?=
 =?utf-8?B?amhmWWYyd0xmM2pnOHE2VnhkMkxNOVRYV1lyWithWWphMUZzUzNxa3FXdE1h?=
 =?utf-8?B?bit0R2g2ekFwNk9pV2dkaDlpTmJqTjlNQUVUYnRRb0h2cDF0M1BtcmZ5eUgv?=
 =?utf-8?B?QStqa29kWU5JbnFEVjgwemN0SjlMZVM3YlhzaFV5SkJpa3V0cTlvenZVcU1X?=
 =?utf-8?B?aDNmQlZGNTdGQ0thc0JEZkNRUWVTTlE0eXRheVgycGdyWExkYkhHS0ZhcFFZ?=
 =?utf-8?B?dkwvYlJUTnR2TzM1cDk5ZDl2dFY2T3JzVUNWb3ZMd3gwTm9FTExLM1RYcnFY?=
 =?utf-8?B?OTdaWi9Tbzh5MEhWeEoxanN4SWU2VWdtdHBXYTBjelNRWm5BVTRNVVRyUGw4?=
 =?utf-8?B?dGJHN3A4V1RPTUdjQ0NyUXM0eXY3VVA2c1JUci91cVloaFJpMjNaUlFaWDlT?=
 =?utf-8?B?SnZUQzFXRkdGbitLL21QdDJsakJid1RoSkFPSGtZQUFqaVZUS2pvMVd5N1N2?=
 =?utf-8?B?M3pWNjNjcGFuaE9vWnNsek1tcnZSakwwcWZBQS9meHNxWG4ySzdVSHY2VzBS?=
 =?utf-8?B?SzladkJtVkNHUlJZNmowTEhuMXNLWHAwUjdkMjNmQWlJSzl1WjJSU3dwdmsz?=
 =?utf-8?B?Q1BQd0ZNZ2p4cGI2amNpQlozMmZqNExZYUxjVjVaT2lGY1M0VzQ5aGJYQnJm?=
 =?utf-8?B?VFBNL2VheGhuSzRET2dFZm8raWF2S0Vsck95ZDQ2d1FaTi91YVhGUjJLVlEv?=
 =?utf-8?Q?9dFAP3ZIB4zSsrIA=3D?=
X-Exchange-RoutingPolicyChecked: gzFRBagOKIZEofZmwAzngIITK0qAFcNOVAvbGKDZQzRs+T2nwbm4v5W5XCk6jFvigD4tOLqg4w7i3OlX0J6WIY8qhwfWwFTxU3BW3sy+kIn2R+HTzd9aBMWkNQZ0jygrlhleqi/RX3C4Whv5PKz/UtYv+g07f7jkT9BnuKe2JXla876Gbh1eTFevCVqNc+J8+2PK/1qLAD3DOx5mvhod9SC7ks72raAnThJz4HqWV7t6OvQcdfsBLFL76T3mTtg6J4t122Z1wElJB+F9wDPt+RndwdLCTTE3JqGO0ttp9lFVxJC01WRGtEQOeb+xxvMxP0ROprINT3GW8E6NF4Sw4g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ee61bec-dc23-448f-9db4-08def756e6df
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 03:16:14.8905
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RkZDUeF2/avnbJYPPuD0F6F06+MzK83b7WfoJPeqh9BEmdFg4kuNOqj+3U0u5gocvTTRcRh2xxSNoiYwEpiVPa/FQerbKIOpgbp4gTeOHGA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5085
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Architectures need a way to advertise which kernel-mode resctrl policies

"kernel-mode resctrl policies" -> "kernel modes"?

> they support before generic resctrl exposes those policies through the

"policies" -> "modes" 
(this is related to the earlier "use consistent terminology comment" I
will stop highlighting instances)

> filesystem.
> 
> Add the `struct resctrl_kmode_cfg` to define the default mode statically,
> and introduce `resctrl_set_kmode_support()` so architecture code can
> register supported kernel-mode policies during resctrl initialization. The
> `INHERIT_CTRL_AND_MON` policy is supported by default, so architectures
> only need to register any additional modes.

Please keep changelog high level and not describe the code that can be seen from patch.
When doing so, please write in imperative tone.

> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: New patch to initialize supported kernel-mode's.
>     https://lore.kernel.org/lkml/737a4228-52fb-4583-ac64-8efe79c107e6@intel.com/
>     Changed the kmode_cur to enum resctrl_kernel_mode in resctrl_kmode_cfg.
>     Moved the resctrl_kmode_cfg to filesystem code.
> ---
>  fs/resctrl/internal.h   | 12 ++++++++++++
>  fs/resctrl/rdtgroup.c   | 23 +++++++++++++++++++++++
>  include/linux/resctrl.h | 10 ++++++++++
>  3 files changed, 45 insertions(+)
> 
> diff --git a/fs/resctrl/internal.h b/fs/resctrl/internal.h
> index 48af75b9dc85..178126bb2da5 100644
> --- a/fs/resctrl/internal.h
> +++ b/fs/resctrl/internal.h
> @@ -314,6 +314,18 @@ struct mbm_state {
>  	u32	prev_bw;
>  };
>  
> +/**
> + * struct resctrl_kmode_cfg - Kernel-mode policy snapshot from architecture
"policy snapshot"? what does this mean? This is not just from architecture either.

> + * @kmode:	Bitmap of supported &enum resctrl_kernel_mode values. Each
> + *		supported mode is represented by BIT(mode).
> + * @kmode_cur:	Currently selected kernel-mode policy.

How about "Active kernel mode"?

> + * @k_rdtgrp:	Resource group backing global-assign modes when applicable;

(stray semi-colon)

> + */
> +struct resctrl_kmode_cfg {
> +	unsigned long			kmode;

How about "kmode_sup" to complement the "kmode_cur"?

To make it obvious this is a bitmap you can use something like:
	DECLARE_BITMAP(kmode_sup, RESCTRL_NUM_KERNEL_MODES)


> +	enum resctrl_kernel_mode	kmode_cur;
> +	struct rdtgroup			*k_rdtgrp;
> +};
>  extern struct mutex rdtgroup_mutex;
>  
>  static inline const char *rdt_kn_name(const struct kernfs_node *kn)
> diff --git a/fs/resctrl/rdtgroup.c b/fs/resctrl/rdtgroup.c
> index cc9966ff6cdf..0ee0dfaf9065 100644
> --- a/fs/resctrl/rdtgroup.c
> +++ b/fs/resctrl/rdtgroup.c
> @@ -78,6 +78,16 @@ static void mon_put_kn_priv(void);
>  
>  struct dentry *debugfs_resctrl;
>  
> +/*
> + * Global kernel-mode resctrl policy. Architectures add supported modes before
> + * resctrl is mounted; @kmode_cur tracks the active policy after user selection.

ah - above it is referred to as "active". I find "active" to be more descriptive than
"selected" as highlighted above. The "after user selection" seems distracting.
"@kmode_cur is the active kernel mode" is all that is necessary, no?

> + */
> +static struct resctrl_kmode_cfg resctrl_kcfg = {
> +	.kmode = BIT(INHERIT_CTRL_AND_MON),
> +	.kmode_cur = INHERIT_CTRL_AND_MON,
> +	.k_rdtgrp = NULL
> +};

This initialization needs to be reconsidered to take into account that system may not
support allocation or monitoring. 

Reinette
