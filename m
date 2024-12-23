Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57081A8F80;
	Mon, 23 Dec 2024 16:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.8
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734970867; cv=fail; b=UUYlh9RV6yfUvUj0kRf4gzVkcmYzw0w4Dn/PDIh8VBomfccRAYdZTvPfhfgl6b+zIovRWZpWS3G+2xVGlxawPoPgHKAn9sV4zwNh/viL0eVtuNxheYGufs61+mBhvn59P5GPiOI+6LSTDOyTmgNWHhJDAFKYNn1yL+O+WQ+qEas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734970867; c=relaxed/simple;
	bh=raNIvYCZD3/l+dZyjaRcViZSFjvTGWKXZllUTLz+pKU=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=iFnheUHmrMNnGMmUSkcKUVOC4WAEIxtTq9MPZGZyOgow8ZfBBHnIsIVB8Ruxrp2CuzAMU2EubfsKf7oqX43AwWO2ftU0H4tqSNTsxRU33IcDDRkkeLJJg7TT2H3rJzeqCxYuM6FGYI8YQ4Lisr1jV1UrUZOLeokwPqOi3jPoyhk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aWHYRbnL; arc=fail smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aWHYRbnL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734970865; x=1766506865;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=raNIvYCZD3/l+dZyjaRcViZSFjvTGWKXZllUTLz+pKU=;
  b=aWHYRbnL0XxJC49LYn2YV37/YRtV0qRxJ0e3GogJJWjl4jNdTopq/0US
   nWyFhReO1bq6h7lDzwsMc6qEsv173ZfDK7/g9oYaIq7sjNKOaVJCLV/mf
   4qCwhzx7zHzHkHSRL90XYMxyBiEzY52UFzFLt+h9J3LNH4AUy4YomHspD
   tr+JroZu2LFI9PNLPAirucMKzo1oWtYFVzkXBptkStv0AHxm5B+WoPPeP
   JZ282MzWuBKPAsN9RAnjcxPq5wLB1W0NNd1FEj+6TjVNs2MVDCke4CCkN
   sHmHV83Yri/QZ00ZdJyUNQUV5agZnMSHagTvjBcY8d77t/r2e4BQe8vmN
   w==;
X-CSE-ConnectionGUID: IyagPKvtTZmvpcjEnyWfsA==
X-CSE-MsgGUID: WnAIUOmEQbm5OH2dLZOhSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="52969038"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="52969038"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 08:20:56 -0800
X-CSE-ConnectionGUID: w+vt4YvLQuC3WflBucOqDg==
X-CSE-MsgGUID: 32CcJ7NQRsOnP3fA2eN3zg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="103337279"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 23 Dec 2024 08:20:55 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Mon, 23 Dec 2024 08:20:54 -0800
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Mon, 23 Dec 2024 08:20:54 -0800
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.45) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 23 Dec 2024 08:20:54 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fOxqUGS+4nVqfsAV4MEGDZGEFtCDANdiDlORofIU3x69hoOZ0ej28EmEpOyoTFf1aeL6ZhalfNj3SUgRdifkX+gLU65MHCvd2Bke0qur2y4O+z4UF7qMzgm7rCq/kkpkOuiphEmTYUTJmKsVA/XBi4WfkkcfYA9Cqb6x3u9x6zTVmnu1hAeeW6fdoGB03LqNGMNbVwbUebkmgwlUFfzuinnmJwNDgH81HvxF0db1eVYIxTAL98jjt40AGCIuOTPz5qhfApQpRWho4wPfvCKtMwKZJh0HTc38+HQS4BqaZ9HVEwQ6A11g9Ojwm+Xw7VazU2O2DM+zQrFvItXFhLKKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q3buTM3wXUfkbNlzXCRVJOj+0SF/TIsgwG9dLelfJQs=;
 b=GOERwpKWAxuAN3bes54QYhho7HRlAOIVG9cEB/ZMP8i+l+CBm1KsWHk5of1A/Waz4dYu4VMBD8VupGK4WN/wpgHA8QuFaczHeMfJhy+hFykRwTJWx0dWiSfGGRt3rviBCUVFbNPQPNW9i784hkUDlg9Y9WYJFDo8kyPOrgpjyxivJpAgQy+PuQ7UPHnqnBLueJPkAxLOO9OtdpjnQZDxKsx5fXX+KB49afMdn6AigInZEf04Sv658nuZImws0HdaPDhQHf3RD93Ts7DeNIE9S3nphk7mnDHseUIBSEABl0RPJ4tdoTGV3bxQQxrSXA2EW2QhOrF2dxeiXkLAPaTQnQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SN7PR11MB7566.namprd11.prod.outlook.com (2603:10b6:806:34d::7)
 by DM4PR11MB6095.namprd11.prod.outlook.com (2603:10b6:8:aa::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.21; Mon, 23 Dec
 2024 16:20:45 +0000
Received: from SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15]) by SN7PR11MB7566.namprd11.prod.outlook.com
 ([fe80::2b7:f80e:ff6b:9a15%5]) with mapi id 15.20.8272.013; Mon, 23 Dec 2024
 16:20:45 +0000
Message-ID: <f53a0de4-32b8-4648-a036-108e4369f31d@intel.com>
Date: Mon, 23 Dec 2024 08:20:41 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 22/24] x86/resctrl: Update assignments on event
 configuration changes
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <sandipan.das@amd.com>,
	<kai.huang@intel.com>, <xiaoyao.li@intel.com>, <seanjc@google.com>,
	<xin3.li@intel.com>, <andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <8c8ecf12622c649bd269052b9fcd436710446034.1734034524.git.babu.moger@amd.com>
 <5e1471a0-3484-4273-9be7-94d084d2cc4d@intel.com>
 <d127defc-6f3a-4255-b2d0-b59178089cee@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <d127defc-6f3a-4255-b2d0-b59178089cee@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0096.namprd03.prod.outlook.com
 (2603:10b6:303:b7::11) To SN7PR11MB7566.namprd11.prod.outlook.com
 (2603:10b6:806:34d::7)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN7PR11MB7566:EE_|DM4PR11MB6095:EE_
X-MS-Office365-Filtering-Correlation-Id: 717a042d-b20c-4689-2378-08dd236dc11b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bHJFaUhDako5R2RNYW9qcUJRM3A2eWgvRCtzZWcvdFpQd3BscncwZHhUWElS?=
 =?utf-8?B?YTJaNmRwSklpOTcrMGNUaXEwY3BJSXJUM3Iyb1pWU3JYM0ZYdko4MlVmOVJy?=
 =?utf-8?B?VFU4Y0QySFJqbFo5cVljS3ZUVzJCUTQ0b0JNSDZqOUJjdk1xK0V3WEN0ME02?=
 =?utf-8?B?czFldGxaTDRaRzl0M2lrMmR2UWNvZzB5QnVsNSt3Y1hmeHZOa3NVb3NiY0Fn?=
 =?utf-8?B?QnQwYldQSGxBM3FBSko4a1dIMlZFL1VEUWR5NVB6WWVXVzhQd2xqV3RDQWZF?=
 =?utf-8?B?dmRCWkdtU0I0TWRFMzZwYWxHUXl0RkJtYUVpMFVPYTUzTk1WdXhEb0paV1A1?=
 =?utf-8?B?OWZ0N0VKYUZxMDJ4eTNFc2MrYTl2QkFGUkFGN1lueFVwblkwc0twMEt2VWY0?=
 =?utf-8?B?WFBGN2hlc2lkaEtSSDNlWEpOUlNNRFZ0WHBiYTNjVjZzTnJjMkMzd2ZuL0k1?=
 =?utf-8?B?cnptOE9xRWhYV1JQQzBHcVlIRzYxOExXOFJKRUU2QmNjMm9JelphWDk2TlFr?=
 =?utf-8?B?ZXZxd2taalBtWXhRTkNkdXNZdmRMTnVWb2U2bWg0Q1pRNmFtZjUvM1NLcDVC?=
 =?utf-8?B?NVlrdUtQZEdkODVNYUUvdXZiYVZaQjBiK1RVT3F5RmUwOHdaQllKN0hvSnpP?=
 =?utf-8?B?ZytYN08wYTFZSkgwTVgrT1NxR0RsK2NEMW4zSmlJVWVDNnRIeUY0VzY3a1hM?=
 =?utf-8?B?ZEtESzM4eklzNDMrSFVnczROa1BVc3dpMjNlMXRVWGxMMmwrUmRzSDNOQUxD?=
 =?utf-8?B?MzZ4SnpIdFdRU0VwMnZOVXdsMGZhSkp4UTFFQ3l5S2lMVDByRW9XQktmZlVa?=
 =?utf-8?B?ZW0wR21rYm5KbG0rQUxwdk1TeFQ0T2o3TGR6SDBWYThSNmJxblVqaUl3dXN2?=
 =?utf-8?B?MElEQXdadGdlcUVkYkU4UlJySXRUdTVNSUtHV3RiVUhISExCQ01kMWkvMVBG?=
 =?utf-8?B?cEl6ZkcydWZPV2kxTVdKZm0zYi9CNmdEV25qZlh3NE1aTWdKdDY4MGtQVHh6?=
 =?utf-8?B?OW1RbEFqdFF0cXh2MEt2VU5VaEJFaFR2L2pZS0Y4K0g3UFk0c0RvL29nRno1?=
 =?utf-8?B?UUgwWXFSZi9tT0FVdzFKb0FKNmZ4TEZRRGRVMHJRZUR5RmRESHhSbVFQWDQy?=
 =?utf-8?B?bWJPWjdMemhQK1FkQzFMa3pFL1BNUEIzWi9wNG1yWFl0Qk94d0JCOFhiNVEr?=
 =?utf-8?B?YjMwclVWVzBpakx1NTBiZWhIVHBMV3d1S1V2M1NhSkVpTDE2Sy93QXhFUDND?=
 =?utf-8?B?UjBvS2VHRE9vQm9OMUVyQmNLdUltcHVIYUxZNU5ST29lbmtTNEpGNXR4ajBB?=
 =?utf-8?B?MXdnMzFHejNwcWJQejVoZ3N3Z2U2bjBXSWpCQXFWY1IzQ1kyZVpQcXBTS3dR?=
 =?utf-8?B?WFkxaVBQL3g4Y2VEMnFXTHExTnZKd0l1RDB1SU9JTjhWaHBXN1htK1BzMkZJ?=
 =?utf-8?B?VENLRXdNLzRjVDVzSUJmZUtGMHgwUjhnU2d2T2NaV0E2bTVqdTBjZ2pad0Ja?=
 =?utf-8?B?Sys0bGNhc0lyUnZWNVhxL3FuYlZYaE8yZy8xRGwzRmdhQnJHQTVCYU5SOGNm?=
 =?utf-8?B?eWVxY3RBMkUwU2dHc2VOVnVTaER2VUNqWWlVdzFRQTlZZXVGS2d3WC9aMlcy?=
 =?utf-8?B?YkU1UG1VVWZyd3dnTmw3RXR5R0ZqNngxNGtTTisvcThzZ3JoNTBoUDdCVzdV?=
 =?utf-8?B?YzR3MEkwUDZrYy85QUVaaXU3NkQ5Zk9mS2tacFo1Y1E1aWM0ODMvM2dQcUow?=
 =?utf-8?B?RUI4N2t5Y0c4N2toN1VmUEdodHdFa09OUG5pak5FSjR3UjhzeW5CYmN6N2lh?=
 =?utf-8?B?R2JJc0JraXJLdEFQN0ZrSWo2MEMxRlpZa0RTbkkwUjZVeTZKdU43SzV5MFha?=
 =?utf-8?B?T3hMczE3Si8zNGRXQ3ZHMW40VTl5ZjVwaFc2dDBuMWFHV2tkYmoxMXBhMXY0?=
 =?utf-8?Q?MYOi8ntAF5k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR11MB7566.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7416014)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cHU5dFVlTENsRUErQW5iMVlLbjlqL3lkSkFhTCtKemRZMit3OEJJaFRmQWZJ?=
 =?utf-8?B?eUV0MUczdzhKR0o2NVBvdzF3UTNRbTdtWU9Cd0g3MVZ0UHpNTVFlWm84RjVP?=
 =?utf-8?B?dGVoWFgvNEpqT0E3ZlliM3lBM3JmaGNSaFFYNHVSSW5yODNWampNVlpwak5G?=
 =?utf-8?B?LzdsUEJoNlFZTTd6d3pZc1IxUnpoemlwUHFpb25ub2R1YnU2SVNRTmNrbDJ5?=
 =?utf-8?B?QTFrZWpFQng4RWZLd1dBS0M0TmFZK2p3NVhqK0YySXhqbG9KNWNGTmRVZXM2?=
 =?utf-8?B?ZnRtLzcrS2xNYm1HVGVmdmlFYitabklzZ1kzYXAvUWFkRkpPV0dFQmluM3dR?=
 =?utf-8?B?UEdhTW84R1UxL1lvbURWZWlGdTBJSzlwV3FnMHZDSy93cTR1b1laNlRTSEsr?=
 =?utf-8?B?TWc0QU1qdC9CQSs4NzFROEFlc3hRRFQ4SmNaVVlLa2FqK3duOTloMjlUTFhn?=
 =?utf-8?B?VlJ2R2R0eEQrQlNqamVnbzJHQmJtUHBISGdEODRKalF3b25LTHNKV29RWDRZ?=
 =?utf-8?B?SEhtQm5MM3NGWTNTck4zVE1INjQ5VjFEb0EyWi9NWEIwREh1MVlHa0h6a1Iw?=
 =?utf-8?B?L3FSNWE2YWx6TGtoSlZ6ME83YWdodEk3VW1PeCs1VTF3b1I4bTVyU3BHZVNs?=
 =?utf-8?B?dHl6L2ZPOVErbENzTnIrdWNKK3QwK1kya2VJYXNJNFFQb2NjRHgvL2dnaDhV?=
 =?utf-8?B?cUE3Um5kWXNwSmZ6SytiRFFBRU9rRm1Dc1h2OUxwOXh6OEtVRS9LZHozV094?=
 =?utf-8?B?S3g4cG13aXpRWE5FQmFoT1NMT0RpVW5VYy9sR0J5S3dHYk95NG8zL0tBRnBt?=
 =?utf-8?B?TW9oU0NmRjJyWG1mMWxGRVRLbDdQdEZDUFhRekluaGhXUzR0TTNremVGZFdW?=
 =?utf-8?B?ZnRac28wZTE4NVdwQ3dPaGdtVUhwR09UdDQzQ3VtRGRYbnVjYVZpajMvWWx5?=
 =?utf-8?B?RU1zWENXMHVPeFlGNmQ2RjJOcE4vVjgwS3l1SnhIWTJ4Umh3T1FoS0V4R2pq?=
 =?utf-8?B?T00xcmdXOGk5YWFhK0xZZ2dpdXYvbWQ3ODFGY21WaStBWjAvbFM5N0RZUUR3?=
 =?utf-8?B?cUxRYk5tQlc4OUlGclRqVm1oN3hnN3p3emZVM1NTUXpTalIzT294dHZHYnJV?=
 =?utf-8?B?Zk9aYjlFTkxKODYzbHEvNFFOczlXYkxIMjVjb1RwQkFxQ3NMZkxpVmZqd0ZX?=
 =?utf-8?B?NUZha3NaWDI2ZEI4Y0xyYU5WS0lNNHBLNXpma2tuMFhDRXZEcHdzc0lub3hj?=
 =?utf-8?B?Ti9kUjEvRTJpV2FuYTRra3AyZ0w0bUt6b3FQeUhDbDVVS0ZmL0hTNFV1MFRU?=
 =?utf-8?B?KzNicFpoT0c0T2hmVXhqZUxzeElLM0dCWHNTeUYxOU9PRWZZakhDaVVsTnFM?=
 =?utf-8?B?bVp3b1lnTnRBZ1NmbjdZMVFKVHpkMkE1YW1EM25mWXphckRsTlByYXY4cmZU?=
 =?utf-8?B?ZzV5eCtsdk9EczdUNmxScy82c1YwenJKejFESjlGVXJ4V3JXQVV4OVA5Zjdw?=
 =?utf-8?B?eHlXQ202RXBxOERIVU1pRTNvTWcwZWNYRUdyZmV5UXZtalljYlMyTkJqLzhR?=
 =?utf-8?B?cHVsQys3Q0pLU3VOYnJ2OGYyaDlpbFhMWWdsUngrTDE5Z1pnMWZJS21oMXZu?=
 =?utf-8?B?QU1KanVWNlNZTS94SGUyTmthN2VxSHdUSk1rUXY4RmhxNWdGamQ0NG5Jejcw?=
 =?utf-8?B?ekxaNGo1MHMyNG9LWXVsQWR3UVZ4OERTemU1WmVEN2M3bzZvTG9JVXJ2ZVdB?=
 =?utf-8?B?UjgzclUvb2pVaS9aSWtWYjd4ajZiRTVyNFE2NGMyRm05YzM3eG80b1dQeTFJ?=
 =?utf-8?B?NkhIYlZSTHBHeEZlYUF4SG5FbUNqS3Q0b3NJU0ZXSURENVZHTDkrZFNJQkNK?=
 =?utf-8?B?RUdINDFqODBrTjFiQUZLVmNyVUpQWXkrbVM4YnFWUnpKSkJxK0J4cWlVZVpE?=
 =?utf-8?B?WmRHZkprQW44MGxrUDFwbUZNckx2SlZ6NkJENzdZSE1IanlhMGsyNGxRb29y?=
 =?utf-8?B?TTRwS0hrMUJ2cXpHT01yWnM1SUMyc2w5QjUrb1ZVblJrZ1VTODhhZTMwSVlN?=
 =?utf-8?B?UnI1WGFXVElFK1FaWmFsN3kyQnVqdzZGUlBmUDhQeUhpT0pHd2lhYU4wY1dR?=
 =?utf-8?B?a2Y2UU0rdzc3bXA5MVl6TzRBSjZvcXhnbklNSk11UGlLanYzODJ0QldHUGhQ?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 717a042d-b20c-4689-2378-08dd236dc11b
X-MS-Exchange-CrossTenant-AuthSource: SN7PR11MB7566.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Dec 2024 16:20:45.6145
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8/hhGVyiEBaTnVLF54PGceAPy1RasrtCcC3DuUapZMMdKFOYhtWKk28Ao7xKDylDqHeFsMFzQ0LrFylvBNgzOO4ytX74a0G9RQbHd97qaWI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6095
X-OriginatorOrg: intel.com

Hi Babu,

On 12/21/24 6:59 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 12/19/2024 9:12 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 12/12/24 12:15 PM, Babu Moger wrote:
>>> Resctrl provides option to configure events by writing to the interfaces
>>> /sys/fs/resctrl/info/L3_MON/mbm_total_bytes_config or
>>> /sys/fs/resctrl/info/L3_MON/mbm_local_bytes_config when BMEC (Bandwidth
>>> Monitoring Event Configuration) is supported.
>>>
>>> Whenever the event configuration is updated, MBM assignments must be
>>> revised across all monitor groups within the impacted domains.
>>
>> This needs imperative tone description of what this patch does.
> 
> Sure.
> 
>>
>>   ...
>>
>>> @@ -1825,6 +1825,54 @@ static int mbm_local_bytes_config_show(struct kernfs_open_file *of,
>>>       return 0;
>>>   }
>>>   +/*
>>> + * Review the cntr_cfg domain configuration. If a matching assignment is found,
>>> + * update the counter assignment accordingly. This is within the IPI Context,
>>
>> This "Review the cntr_cfg domain configuration. If a matching assignment is found,"
>> is too vague for me to make sense of what it is trying to do. Can this be made more specific?
> 
> Does this look ok?
> 
> Check the counter configuration in the domain. If the specific event is configured, then update the assignment with the new event configuration value. This is within the IPI Context,  so call resctrl_abmc_config_one_amd directly"

I think it will be easier to understand what this function does if the
comment is made more specific. For example:
	Update hardware counter configuration after event configuration change.         
                                                                                
	Walk the hardware counters of domain @d to reconfigure all assigned
	counters that are monitoring @evtid with the event's new configuration
	@mon_config (or @config_val).                                     
                                                                                
	This is run on a CPU belonging to domain @d so call                             
	resctrl_abmc_config_one_amd() directly.    

Looking closer at architecture specific resctrl_arch_update_cntr() the
reset of non-arch state (get_mbm_state()->memset()) seems out of place.
There is a resctrl_arch_reset_rmid_all() within mbm_config_write_domain() that
resets all architectural state after the event configuration is changed,
should the non-architectural state not also be reset at that time? It looks
to me like it is something that may be needed for existing event
configuration (but not an issue until Peter's new feature lands) and when done,
the reset done within resctrl_arch_update_cntr() will no longer be necessary.

Something else to consider is the resctrl_arch_reset_rmid() within
resctrl_abmc_config_one_amd() seems redundant on this call path since
it is followed by resctrl_arch_reset_rmid_all(). resctrl_arch_reset_rmid() 
does one MSR write and one MSR read for every counter that needs to be
reconfigured and if that is unnecessary it may be worthwhile to optimize
out?

Reinette


