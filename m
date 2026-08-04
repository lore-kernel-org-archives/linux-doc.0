Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CE63750AC;
	Tue,  4 Aug 2026 23:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785886549; cv=fail; b=JEs590xDTjQg5PqIgBWmSeFxhR9PRhsoeTzmOPJqqTNJb/Jb+VkTNAk537zXJi08vMKnNkQdiTqc7igcp3y9iLbn04VyLoUWz+rGWDo16eWFlzgdZfzjvLUtuAPacqCfEFSZLM+5drIOSW+hN+crqcXLwi74mh5oVlBl/5lYyR4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785886549; c=relaxed/simple;
	bh=O2JkonnuyMl+UQT1aCJDKuu3spBOBNQi5F6v5L6M0q8=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=KeAIGuP3gAqaqeIJUyzJAqkHCUBIM81fd0tiklswqMOwYfzevMYyocb6ZQd6nQta94jF9qWkobOD0N8t8QKO262t/1c44wbre2FifVgTL6ar5q2tbsphkL1yieDi4kaV1a1pbBNF4puAVyrwXsjmSzsZQQzHQxUATtFShu4wFwE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VKqVB8zx; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VKqVB8zx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785886548; x=1817422548;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=O2JkonnuyMl+UQT1aCJDKuu3spBOBNQi5F6v5L6M0q8=;
  b=VKqVB8zxySoUUvLGjsPe0/vwytmPgRqGZHPHadHmnP1/YQ8kyTQ0tjng
   uoDL9sjhU5iqsbQwyGkuA99SReQDjhBvy7MqZqUTF5chphN2zLcCPkFQK
   Ll7KOgUU84+MsSE0CMIgt2R09zEwOX3iX7FfAKcGTvLfJvZ+7oEjvo3r0
   +zUAowP5RMEcYJwGUyT8hRYnMO3vm+pKDt23kXUemCW0/6xW7BAVXNFUV
   +RhDGrAGvi8TK96sEJWsQW54wZ3pb0fC2F+cFlLOUISD70G2qEV4sgkxj
   oknN2M0pfRJ+hTfh5kmHjLTx+HYL0dks8lc7SfFalXTKq+Bge8atPE406
   g==;
X-CSE-ConnectionGUID: v8J2Z+aoQPyFBlymjmHW6w==
X-CSE-MsgGUID: cslJjnh7Sz2Y4ncC8WZpKg==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86328103"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86328103"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:35:47 -0700
X-CSE-ConnectionGUID: pfnOJQMSQ4ycd2kHF5WmGg==
X-CSE-MsgGUID: PdeFyCwgRSGcMmSv71HxbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="261706045"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 16:35:47 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 16:35:46 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 16:35:46 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.19) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 16:35:45 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j3sqFm6nxUK+QQfpJtvLoL+XdsNkxUEcq+Cg1T7yO8g1gFPB3HD91hXKUKAY7wMvE6ddyIHL9xuTVLB3p7RbPJA+VX9UA+l/9iszYispMmDLmjfFQNVcP+2tz6dhlsz4xlGpplMG/zEysXv/QNWWr1TjWLqcSBjVA9KoKd3eqyIYlU2j7wKj5Of24lbmnUUkfShS07cJchrzwfmhu387RoWY2vjBYidWVNH9HvRhPLej9OV9r2VZfTtmz3KxPaEX9m8ywISNw04ieLVMHjoqurRmrtQq/IatuCIehZLgJCC/04Im+B94V/fycaa7NW6pRA1YSfZTyqpqDmcZOAxJuw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLKQhDDdqOcTGoxfGLrck3cr2do2utabMaVso1cn5aY=;
 b=eNaT0ZNMiZEjjohVB/qpzeZ9XrMddsdY8yMcRxp4VNMC2GRdbVZkwjUuhjeiM7W4vSoGRbLSD9CdH47I89y8DNYltq1pF8WIK8BYfn062bOe/dw8QkOM+Nm5K/Xyh1g17wLH9zeSxXRH911ePdv26lC/nfKhUO4bMfgM1CmWJlNlP1KdV+5oxMJ8cMHXNvT22OmeSIQ5wfY15hPeIatDxNMCWPU9iFL1WIVS2J3bBsG/oFJI5IsABe5XhjZxcLEdMoBFxdPGGI4HkAUzL32vzb3Ju6sDClQMBApohxAeg+wQUJgvm9JnfCYYPBVkgrB/4NeoRB6Er7W6mldf2bKNGQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by DS0PR11MB7310.namprd11.prod.outlook.com (2603:10b6:8:11d::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.18; Tue, 4 Aug
 2026 23:35:41 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0270.016; Tue, 4 Aug 2026
 23:35:41 +0000
Message-ID: <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
Date: Tue, 4 Aug 2026 16:35:38 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>
CC: Babu Moger <babu.moger@amd.com>, "Luck, Tony" <tony.luck@intel.com>,
	"Moger, Babu" <bmoger@amd.com>, "x86@kernel.org" <x86@kernel.org>,
	"Dave.Martin@arm.com" <Dave.Martin@arm.com>, "james.morse@arm.com"
	<james.morse@arm.com>, "corbet@lwn.net" <corbet@lwn.net>,
	"skhan@linuxfoundation.org" <skhan@linuxfoundation.org>, "tglx@kernel.org"
	<tglx@kernel.org>, "mingo@redhat.com" <mingo@redhat.com>,
	"dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>, "hpa@zytor.com"
	<hpa@zytor.com>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>, "linux-doc@vger.kernel.org"
	<linux-doc@vger.kernel.org>, "Eranian, Stephane" <eranian@google.com>,
	"peternewman@google.com" <peternewman@google.com>
References: <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
 <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
 <20260801012227.GEam1KUyMz601QOzrT@fat_crate.local>
 <5f10ceab-5569-409b-8e78-c4a4f232489f@intel.com>
 <20260804191608.GDanI6eK2Q07w6pNcb@fat_crate.local>
 <98be93cc-f2d8-4bad-bbb0-f309e912054c@intel.com>
 <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <20260804224703.GFanJr52UbKBrCOTij@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0169.namprd03.prod.outlook.com
 (2603:10b6:303:8d::24) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|DS0PR11MB7310:EE_
X-MS-Office365-Filtering-Correlation-Id: 68ea4e7e-fd44-4a9f-075f-08def2811876
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|23010399003|366016|1800799024|6133799003|10067099003|11063799006|4143699003|56012099006|22082099003|18002099003|3023799007;
X-Microsoft-Antispam-Message-Info: o53DPmbNsEwPmTSFH9zk1Gvlpe+NHHOVZz2txlwyc+OIy5Q9XhDhb4e5tjAsukN3Ir6uAZZ+11utemKC6tZentjlVeFZvfHboh4njk+DjG4pa+U1odQvuK4NJoAlCHC/ROZAnarsjo9aSjuIfrN+XdoYloA3AGmKpZVbES3b+cwUvc4iR91Nlv1rtpvySSszKbG7Vhyo5uz4u73yM61vrcWt5jxZBRJ+RxHKXJSvHxoSSJWKQwTPsZPqDsn8jfWIruIqPGVO4RoAcSbpR1yPqR38kfoNL9bHHufJuRVWROKqdL9ZVTl+7fbNoQA6L07JXzYoHq1dOtKm9wMmu8w7k9Xbd2MHMEfr8uy7CpdnFRt4i65MB8myAuriDzh1ofAbHiMlZRD40GP1MHM0IMIvRnawZ4bxVDRfr5qeYPEXbnK1amuG1SmMp13iw2C3addhDO3oC8uaI4q87RebhjZyyuDZZ4nvKIBQi/aEJ5+a5VqxAak0Y38eLm2+DPLndn58QEdQHt6AwLAyREjihXX6jg/vO7CCNNgJsMdIfmijxBZboF74crHkWTgMjy9R8Q9MZUPAYwz/d0GeddrUTbXZXdqgz7GAq52mtP8gB8HM1uyTIia3ArNc1aCKekQQWstZ3y7nGIt9RcZd9RxOcABEJ4YUAHqQSsUuTx3Nccs9PKo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(23010399003)(366016)(1800799024)(6133799003)(10067099003)(11063799006)(4143699003)(56012099006)(22082099003)(18002099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THBSUnByRExUVlpFYkJLUFVSL2c5a1ZmRGN1SWJCWW9TNStKZHlrUjA4czNY?=
 =?utf-8?B?VlNqcVgxTDhLS1NzYVl2UU44MHVpNmk0SFJsaGF0a1o1SzN6V0MxemdUM05K?=
 =?utf-8?B?WXpwdzN5MHJjTlE5aUFsZjN0K2xQQXFjM01aT3Y0K1pXRFNGUk5nejZVSWxv?=
 =?utf-8?B?dlZkMDdJUmduRldLbnZ5T0JQWW5YeGhHazRqQkJ1d0d6SVBaS25qVHl5YUdl?=
 =?utf-8?B?ckFWS1ExTjdlemlPM2ZwcERqRURNQXVjNHc4RTdQczRPSE5VWUdRRHh6blRo?=
 =?utf-8?B?eE9yeFAwUktmTjlRbzJia1pxZThPSmtyd0ZQdW5NVFFGL2YyeDIxemNzQTB6?=
 =?utf-8?B?dk5XMy90aloyR1EzRjdmMWV2TFErRldqZEdaQ2krV09OOVBTSzFVZWtpbXc1?=
 =?utf-8?B?TlUxb1MwRWVTcXFtbVRlc1YxQ05qQjkvUXZSMVFNQ0J4RUo4WldrdFBNekhK?=
 =?utf-8?B?cEFzM3d2Q3lVbzlMajJHaVR2VU9pVXJScGF2ZDhmdmx0ZXZGOXBpNm9FdlBs?=
 =?utf-8?B?clJ4ZU1IZWg4UUxIVzlqVVRmRlowYkFJcDdtZktkR2pyY1hGdml3K01Ba0xW?=
 =?utf-8?B?RE5ML2dZOHBjNzAwUXNWTWdXVUJkeXdrYkR3RnJqL25mN1ZIenJuaEcrWjZu?=
 =?utf-8?B?M1FxZUUyQWEzc1NDOTIxWjg4dWk4K0tEdnQrY0xoTTJGVG94MStzQ3BKZmh1?=
 =?utf-8?B?Q0UxcFJ5V0NOVndFWDZZSjRpaXJNRkE2SVNlTi9KQzd1VWh2VHNkTFk5YWxV?=
 =?utf-8?B?Nnh6OVVZYjcxRE9EcmlFaTJlOU91ZFBPd1JuWXk5MVBWRGcwNnp3SmV6N0tT?=
 =?utf-8?B?YUgzVnJGOG9xNnc4VlhlejYyRWxIWTNSS1JIS2UyK2tvazMwNWNsM1htQUQr?=
 =?utf-8?B?dmtCRWcwVlpZb2daZW5GMEtzVTcvVHFvc0NRUnhxdVRNcWJOdHlPUlpGNUdF?=
 =?utf-8?B?NXllcWUyYUtBT1NnRjBZSWFUY0ZEVWVEU3J4TXVVbXFIaUtyd1JBZWNPZ3ZM?=
 =?utf-8?B?WktOdXdDNGttNWp4WDFSSXUwMk00WUtCM2daZGlNYWxCQlpxMytCa3BqQUN3?=
 =?utf-8?B?bTZSS1ZhaEZ0S3l4NjBGZHEvVE8vdjA0ZHA0NUJUeTY1S3A1dFJZdUQ4YWp0?=
 =?utf-8?B?UVVmb2U3dkEvcnZQRVZGdmNsNm1oTlVYK3pMaFBQME9wWTdOZ1FSeG5MZkdN?=
 =?utf-8?B?MEljT3Y5ZHNCSnVZdVdCdVBnS2lKVWlrMjBjRDRkUkpDWU5oZU1ya3U4V3F1?=
 =?utf-8?B?emtGVCtWbms3ZjEwa254ejBNK2d6bjJuV2F2SEVDeXNuSG9Pa0g2d2ZKc2Yw?=
 =?utf-8?B?eDhMN3YvVUd6MCtIWm1ITGJyUUcza0Q1bDFJNEQ2RzZ3aG9zaXRIU3ljTE5t?=
 =?utf-8?B?RTdsNUN1WE1pNncyZmtJNUNIUTJoa3EzeE1rcmttcjkxMGNITTErRkdkdHNE?=
 =?utf-8?B?SFc4cjFhcVZaYURCRjdYL2pkVHVybFZURTVYNm8wT3p3VHJsTE1LbUU3T0p1?=
 =?utf-8?B?M05OYytuem9seWRsVVVQTEZ0TGdYZnlsRDNmQm8rZk5sUTZGRlV1a2NmWms0?=
 =?utf-8?B?NE5CdzBKSG5BM28zVWV5UHpCQXlEWGE0MnNjVVVURlp6d1FseXNHMFYreGhG?=
 =?utf-8?B?dktLM2pJdHJsQ2JSMDlhckZ2Yzk3T24xUjJYQzRrU1c0YXhGeC95a0g4Zjln?=
 =?utf-8?B?UHUzNEphUHkxZitBZ0d1UllWQjB6c0dZbWowNWtCNEZoYmZ3R2dIQmVvY3ly?=
 =?utf-8?B?MnMvZ0QvVHorWVRYS1NyTGtiRkdpdW1xR0d0dm4yb3lMMlE0U3BPSWpJdXY4?=
 =?utf-8?B?VEZ4WURCSmV4UlZMbWFtbWNBVUpmR0krMHY3MkZKdDlYa0hYbXBDZ0VuYWFN?=
 =?utf-8?B?eEhVR0VoT29yanl4R2Z6NkwwNno5VDdOOVI1azR1c0RQN25zZFlTUTFHQjFG?=
 =?utf-8?B?SkJlU0VxSWkzZ3dMZCs5UmlpOWtJcHdMaTJwRlVqUDhXNFBFS0V6M1BVaUdo?=
 =?utf-8?B?aU93VTQwZWlmRlAwWWhhL3JneElDeWlxOENCaVlnK0R0VUx4eDJSMThVbFV0?=
 =?utf-8?B?ZmNhbDN4ZmoyUWxrSVlOQ0lDVUFPbVRCOG1SVElCZzdoNkJOcTFhZEQxczlM?=
 =?utf-8?B?YTFNQnNsMEpxQkxtZVNVcnJncnk1a1hVT3lweVFFbjdrY1BLai81WUtDOVBW?=
 =?utf-8?B?QVA5ZWpIOGhCR2dIaW5Db1hOc0NYZEkxektEcGZsY1NBWHhycSt0NXRKZk1D?=
 =?utf-8?B?aUZIcVh6a2pCQlpod2ZmM28zVGpiR0VsdEFIcDN4bUFuNCtxQmVyKzV2dDVY?=
 =?utf-8?B?aHdEeGJjaU5iZWlCVGZUU3dUeDhNQXFOc0tObmNFK0FMcnB5WFBKbXBuQTA0?=
 =?utf-8?Q?G5fDVfqwL6lBxdlA=3D?=
X-Exchange-RoutingPolicyChecked: RXSzLjFNH+cqT75rlguNpMnaLYC20TwsjQId/8jS3RDWsNJm19W4ZqQbw5wz2N+cocCQYeDLz+xBXxZ23ML2+C1G/Z0k85QXrpf1oCmZa8TnsxfxnEJCd7MLOCkKnEtmj1MW6k5MovPVnq6Qe1tDuyWUf6kpTxUnoM/ue4CW8hBN1iWxUDcKzoS/qr6/hzs8WAZihJcCCoanlHGk2kXZEey/srk0HJeAObKbZ/dtoASoHJ2PK2aXdRFO2/9ihJUzON08yx6EnP1EltWj+1wbANcLJxgZ4J4RxQKEXlLSvvtcCZ9tRxc/RI3JkDZsYpfTx/NYzstHcQjmWjskAJJnDg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 68ea4e7e-fd44-4a9f-075f-08def2811876
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2026 23:35:41.0270
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Y/OHdwYCieeOLXI1BzgMpOkGVxTEUBroiQmV40/zRngkowXFs8lzJzzSr2HfZJGeUzpqac+Tnqa3r86zVgefhVkuokUDvD45RL9/Ae9lOuk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7310
X-OriginatorOrg: intel.com

Hi Boris,

On 8/4/26 3:47 PM, Borislav Petkov wrote:
> On Tue, Aug 04, 2026 at 03:10:18PM -0700, Reinette Chatre wrote:
>>> So, long story short - and I appreciate the explaining - we should switch
>>> AMD's default behavior back to RMID + 64 counters - exactly like it is on
>>> Intel - and the ABMC thing will be explicitly selectable by the user.
>>
>> nit: s/exactly like it is on Intel//
> 
> What does that mean?
> 
> What's the difference between Intel's RMID mode + 64 counters and AMD's?

Expanding on what Tony answered ...

The 64 magic number only applies to AMD.

In default mode both Intel and AMD enumerates the number of RMIDs supported
by each resource and both Intel and AMD limits the number of monitor groups
a user can create to the minimum RMID ("minRMID" below) supported across all
resources.

On Intel the monitoring behavior is consistent no matter how many monitor groups the
user creates. User can create up to minRMID monitor groups and reading monitoring
data from all the monitor groups always return accurate data (never "Unavailable").

On AMD the monitoring behavior (without assignable counters, aka "default mode") changes
depending on how many monitor groups the user creates:
User creates 0 to 64 monitor groups:
	reading monitoring data from any of these monitor groups will always return data
	and it will be accurate

User creates from 65 to minRMID monitor groups:
	reading monitoring data from *any* monitor group may return "Unavailable" and
	vary in accuracy


>> ok. 
>>
>>> This way there are no surprises when running any tools on either vendor and if
>>> one wants something special, one selects it.
>> This patch, once minimized for easier backporting and marked for stable, would
>> accomplish this.  
>>
>> Two nitpicks:
>> * "no surprises" should be "no surprises (as long as AMD hardware does not return
>>   "Unavailable")".
> 
> AFAIK, Babu was unable to reproduce that.

If this cannot be reproduced on AMD hardware then AMD did not need to create ABMC, no?

> 
>>    There is the known issue with the default mode on AMD where return of "Unavailable"
>>    is treated as wraparound by pqos.
> 
> I guess Babu can address that.
> 
>> * "one wants something special" should be "one wants accurate data".
>>    Caveat: User does not know how inaccurate data is in default mode. Users need to learn
>>    about existence of accurate data from outside resctrl via external sources, possibly
>>    leaving it up to the tools considered here.
> 
> With my simple thinking, I would expect that accurate data means, the number
> of counters being in use is not hitting the arch limit. The moment that
> happens, I guess one could deem that measurement innacurate.

Agreed and matches above summary. The arch limit here would be the 64 RMID that can
be guaranteed to be counted. resctrl does not limit the number of monitor groups to
this number though but instead uses the number enumerated from hardware (4096 on this hardware).
To guarantee accurate data in "default" mode a solution could be to add model specific
information that teaches resctrl about "64" and it can use that as RMID limit instead.

>> What is the plan with https://github.com/intel/intel-cmt-cat/issues/311 ?
> 
> I guess that should be closed once we switch back the default.

I expect so also. Even so, it does open a new question of if and how tools are
expected to interact with assignable counters. Instead of this bug I would propose
that AMD work with pqos folks on expectations from tools to support assignable
counters. To me this bug implies that AMD considers enabling assignable mode on
a system as a bug. 

Reinette
