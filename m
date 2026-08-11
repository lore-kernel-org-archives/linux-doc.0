Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5078E2139C9;
	Tue, 11 Aug 2026 02:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.15
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786417095; cv=fail; b=sKf91JzbbuevJcz7z5v2+Sap0w5KxU0ezrKkqll5YX3FckWUVje7nhmGqxM8cbP8e2wSUuosZ1JrXHXTX6M4w4oRjIMZvLktzKJuUzkUSr6GNwjT4eygOVxffZo1dp7/kTcGQHdBzyGwujoTeYQhK4Aw3zhQxZ2BqlFctSzETTQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786417095; c=relaxed/simple;
	bh=pGI4w+WTSPVaHniuYdpqDWZr7aBaVbm9jkp6Xa5/ISI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=piQUjQMnFcGHsdzH59Z2U0ZTXo916aIDd7Vw7W0aSdnyYzLWnv9GMqq1FkFMsUI0fpLWS725I+1Fokf9Qx4PbDtHf04FVg4XQ7yF6D1EMpWPv29nYnp0N6uinwesczi2cKux3N4hIgq0NrS3034Wjq689VQbW0jY3+tTiZYgquo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gpf/eYVj; arc=fail smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gpf/eYVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786417093; x=1817953093;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=pGI4w+WTSPVaHniuYdpqDWZr7aBaVbm9jkp6Xa5/ISI=;
  b=Gpf/eYVjQp72tDhED8kqTKMABRNxQ47Y2SGcuB5mGfqycweeou7WO09/
   5SjUi8RIds205D3EvpJw5nmCq5CJzFZrWWGw1DOekGzb4KgM+3BKmIlld
   9ycyBXoLQUMWFtNhEbty1Viaz2D6sqp8OOU+dS2GscK85BS4QlSOOg13t
   fdoKNgtC9dys3t0vcURWAEd6sRQ7pylr8Y7jYiEle2/+VHYL80namw554
   V6jh9Nzy3zdf41kH9rrLEC4AdgFrDxKlYR+6ipvl6pZgCtwTgR78E1Y04
   O6GFCFaF0Xnr7egDZNp27ZV+W48dO59phuz2g1Kcbjwj9fBnG/oQ6F3qf
   w==;
X-CSE-ConnectionGUID: nQOGEEZNQzyYVfgNOcBDzw==
X-CSE-MsgGUID: ffI96WMDQbyvmGFNFxzVAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11871"; a="87061896"
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="87061896"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 19:58:12 -0700
X-CSE-ConnectionGUID: e6DDeqECQT6w/I9cErheWg==
X-CSE-MsgGUID: ppuGOiQIRYmPuCYthxTsnw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,217,1779174000"; 
   d="scan'208";a="266697123"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Aug 2026 19:58:12 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 19:58:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Mon, 10 Aug 2026 19:58:11 -0700
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.57) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Mon, 10 Aug 2026 19:58:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f4ucQehYRA80ZtcWrlZr/iw37vBuIiQSct2Y9IH4/qvef8naDxD7Iav7qCCcPhjCXeAtx20QGgUh0WVQ/hodAXRY0MW3Y4fGVYzsQZxdWTEqGwslEZkRfmLOOKqg6fspqqHNOXTk3yvoJRY6JwMvkogd6vNCqD5kD20BcF7FLT4QbXp1oI36fEJN/WT/Hqsl6ynwHocYFqc79LontoFpXY4QTHZwoyqyWYiHtf+a1+4CfniPV5vfF8AufSKXx3NFjFE8iBhQVCUNN4LJN2N1krGvpwnMQ065IF79hKyQvm5WxNkb1RZLti+8Hn9wqxTeixxcdtakwgYJqSvvJA6FfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+qxXScd+LfngAJMwyNSCpWpbRbsG5Z9eOaDgzf5bvNo=;
 b=vjXbxJk1h9TwgeQ4HCxt6bvqSKAkPeae4sEyO5vWodAo4cfv4D/9xuvORwOfVgEbMzviwO2xwiDiS7arQFO+e23YXCmfRDZgeKBAwzqiXjGXq6hkLZs5jv7A9XZal1i6qOhM/L6ZicqbByPD0u+KC5D/waaU/ppGQGzW0J0gj6RoBU4DRznGNLqc90o9g5bIH5A7zRf1TuYU0Avz5lI1iZW1IqnGActx9zOm4/cd8Jrp9Xu9+PXm5XBQKVaCrN5StZudbO2S4ltF/AExSXwNzh2T0vPZyXNyMZ6VMz52Xq1OZGzTbfUc9cYC6OJQ0N16/8Ei467ZL3X5o5yhe9hnsw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH3PPF8C0509479.namprd11.prod.outlook.com (2603:10b6:518:1::d37) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.292.25; Tue, 11 Aug
 2026 02:58:08 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0292.024; Tue, 11 Aug 2026
 02:58:08 +0000
Message-ID: <a3bcdddf-70bd-43b2-8483-7f018bd3c4b0@intel.com>
Date: Mon, 10 Aug 2026 19:58:04 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND PATCH v4 03/15] x86/resctrl: Add data structures and
 definitions for PLZA configuration
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
 <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <e8bd9b22dcec5b90e5be0d4c4559874971a00ba0.1783461016.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0071.namprd04.prod.outlook.com
 (2603:10b6:303:6b::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH3PPF8C0509479:EE_
X-MS-Office365-Filtering-Correlation-Id: 3300c58e-ebb1-4f09-3039-08def7545f2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|11063799006|56012099006|10067099003|4143699003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: JDxkrt8uDSEn2pp1S7cu6CBNOs9OLoug0L6AJdM9P3XORWeQHcEMb1tTwwhrr4DnidZ6lEiicvZbRxDwVIRrd2CSAxfUdD0vus5GVQIDFo1cNyNFBDG+fa6oA4+8gOnyH+Yc7RohG/7iyta4cT8/Lba2gwADzQEFVQslxnFy/UGWJwNFQEE+qEnQMfKGHfpTjoKQ8pXY3WIGVz9GbCowT1viMem3xG/pK4zn7lE2aOhQWnDskutxy6PULneia5680GZ9lXc7l9dtOkZiG4M6Q7EY+3rnTPSDmeA2KDFp39/bdoP+95jl6Dt4oH/1f3qN1bqyr/0r8RjXX8M8ibpicCP8mygPVsMkERoPLwAYY/Y8qPOQ4kaaTZ4w+JXvIvp0ogs50IWllcpEK6T0S7I0VfIVbTAs1A0lqIWrWOTgDN1G8H8oLohzrvg6+udLfYepoy+5O1yldTPJDNzLBBRM4Pmy4K93Q5BS3/JIRsCO+PWVwKUV8fIEuPed6aKB8GINR91fIsw8P6j5jX7Np7P8TwANeyIcE8HCwBqtFjQ5idKkGBsY1UbaGdMFK8eb8HQRYebx7v06Zv3Dy+mqcLhCKPCDy1pEERsoqx00RQOJGWqWuygCPzHYyBbrEA07N3TxNcbWC1F2UDzbNdLrBHppiQyMzQEBelieL9zK8ET5TWI=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(11063799006)(56012099006)(10067099003)(4143699003)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?R0FZQ3V3T1NYTldseTEvbEFZRzBsNlVLbEZ2QUVXMG0veWtqUkpXaWZjanFi?=
 =?utf-8?B?cHNFZGZFcDF3cERCM3VXVkxrbXBmOVgzTVhrcGZkK2FoZFdQRWdmeCtFVHQ3?=
 =?utf-8?B?Uy9OMzdvWlRENjduTmlGUDdEVUtST3BwWWFkcENnVjQyR3NTQk1vMG9JcE5J?=
 =?utf-8?B?YW1zN1FkNWVOdDJ4YTRqSTJTRzh4UjYrbE5SRzgva2htSk94VXhCUjNOeDdJ?=
 =?utf-8?B?ZjM4dTBERXpTOHk1cjNHVURhb290dFJTQUNMVUJTbU9qL2VNZlNTbTRoK3ZH?=
 =?utf-8?B?S0dMZ0dZbVNxNmhwK25UR2NXcWlEYnUyUFQyTVpwYldGWFoycC92aHQ5OFVx?=
 =?utf-8?B?KzF2NDA4K0Z2MVBhSDM4clFQMVpSeVJsMnRCYmx0U3JYTTRjbzk0bmhwN1Fh?=
 =?utf-8?B?Y1BxVnR2eStjZ1hIUk4zekFKWFo1SEJqbEtLanlYTElMcktnVlZ4cTVwTzFr?=
 =?utf-8?B?TTMrMVhaNDFQUE9vZzRoMXM1KzFnMEQyemF3ME9TVVIxbmZIS2czbDcvdVp0?=
 =?utf-8?B?L1Z2OWNWTzd4TTNNR1dyRW9vMUhmUG10YXZvYW9BdlROZ2Znc0p5R3dwa2Y5?=
 =?utf-8?B?Qk5CdmlwQ3daaSt6RTBrVlhoajQ5RHphc1FxVDg2MFA1dGdoOS9qaUJ6WjNN?=
 =?utf-8?B?eHZSSU1GLzRHTWxWMldVVUwzeFA0akNsQXlsOUVBdWR6bmU1azZSajZkRTV1?=
 =?utf-8?B?d2lsYjFLTHFyTGxkZ0RQLzRxNFFTTE5WSGxwWkxIS05Zb1RZRE5qdUlDa2pO?=
 =?utf-8?B?NlFSdEdGb2U5Yk9ucHRrRGN4TzYyVUxyVEdsZGhyTHNpU21NRk1UTWtWeXlU?=
 =?utf-8?B?Q2NxTkZZWE9LVzF1Q2tQbzFSVkpqb3hxZzJFM2IybXVYc3ppSjZsM2htb2F0?=
 =?utf-8?B?ZUp2cHprZTNpcVlQcjl3Q0l2SUNISEE2cGpPZzFSVi9uVk9raDNkRXNjTFc0?=
 =?utf-8?B?VG1GSk03aTB2NzRVL3kzN3NRNi9MYStOOWVSMVdRNmhUaW1MTEFNS2J6clZ4?=
 =?utf-8?B?aCtOLzM0eE5LTDJnZFMvMjhOd2F5YUNwWFJIeHN5bEdDQ01ZaXNMSzQwVzU2?=
 =?utf-8?B?WWV1akdSSEJmY21RNGVHaFBVQUhVNFFEQWZjdTUrR3dWRG8yRys5bVN0NklC?=
 =?utf-8?B?WGV4Y2ZZWmt1TTA1WHJpc2NWTmxFc25lb2V5TFZRemtKN2RlOWx5dkpBY0k3?=
 =?utf-8?B?a3FRQkEzODJKN3NoMFduSldhdUxVRXhnU2J2YXYrT2piZnB6QUtDNjB3Rnk0?=
 =?utf-8?B?YTlBZ1VCTGd1Ky9tV3BFL2J4RUM4dHNzdXBmRWFmdkJQb1dOOEUvRCtieFF4?=
 =?utf-8?B?ODBYTWQvaUYzYTBnWWJ5aE5HQmJVbFNmZndGN0Z4SnFTLzF4bWFxanlvV1JE?=
 =?utf-8?B?NDJXOEFQb3hjdHdaSG5VZFd6VWRBNU9ZZTdORTFodm1Ldzc0Q0ZVTDFLWUFY?=
 =?utf-8?B?MnVLOEMxVVdicXBMQWJIY1A2anIyWVRnQTJiS3IvdStUeEZ3S1Zxb0ZqQTk2?=
 =?utf-8?B?WUlLMGtBRS9NZ2dLMkd5RFNBYVBscmVtTmxqTTM3L1d3R2RZeGR6RndvQ2Ru?=
 =?utf-8?B?aVNhSm1GQ1NGbWN5MVJGZ0ZiTHNkUEFuU2t4enE0M2w0TmRHNjhMSVZNNmhB?=
 =?utf-8?B?a0xqREpXYVBJekdzOUpPVVgvVEN3Q0J6azlMMG04MERSck13SmVKZ1BBd0Z4?=
 =?utf-8?B?ZnBkcW5NejVXNEVuUUVIN2lIUDl5VjUzN2I2bDVuQnZyVFJYUHk0TlhoZjFR?=
 =?utf-8?B?emtSclloUjBXYkIwYU10b3R2Zzg3MFhkZjl4b05mc2FIWlVHY0VxcHVXYTcx?=
 =?utf-8?B?ZHVUZncrUURheXEyRnJUbzZYejAyMW9DMW11NHF6ekgvcDRySEM2QUFENHU4?=
 =?utf-8?B?UjNQWVNzMnBlNVpJeUd4dStkREo4WVZLMVFDYm5oK1lkN25ocXJOQTJKMVdr?=
 =?utf-8?B?YTZ4U3Z0TU50MHZOaEp5NHh6Y1VTSEJmTHJseWE5dW1obkF1VVd5OS9UbmJ4?=
 =?utf-8?B?SDJubTFuaUQrZmUvYnJWU1NpV3ZPMDNBNUhSWm13eFYxOGFPaGJMZ2Q2ZXFt?=
 =?utf-8?B?aGh0U1p6V2xoS1gweWZSSGxiMXVUWENFbFNGb0NwRGxjaS8wMWt3Q0xIZXlT?=
 =?utf-8?B?d09YOG0vUjhZRDFzTG5na1ZpT01sVkpWL3lHWlV1YmVLdVZMNEd5bms3UG5V?=
 =?utf-8?B?QUFJR2lDWlVjMDRGaTBYWGZ0T3VvVjVja1pQcmNqWlVGNzNnRUN2U0p1Skty?=
 =?utf-8?B?bGVmSW16VWJuQXNYVml2Uk1ISlBvL2M4c1U0Nnowb2lneE4vc29OUk92WFNz?=
 =?utf-8?B?cTR6U1o2VkF2OUFmRUZuV2VaWGhITVBvUXZDa1F6NnByS0dRUzFSb2syR3gx?=
 =?utf-8?Q?kiwkje5adXR1xG5I=3D?=
X-Exchange-RoutingPolicyChecked: AhgBYrMYKCYDWPzTnKNVMM/HNpmoWlJtPb39pkdJ6W5fdY+Q8eGqvdgCrV+txslikuPWH+B8+ZBy7E5FHAVGohKDaKyUTwyXJzHCh9yy0chsP3ra4FLJ/HGfr30lkUbqz+TzvcL1BrKHp7ayyFDHg8CiZF+37SRX03hNZ2QBxBZgDqVaVXdOHrP/vYiI3zt0rO2Gl05IwIaXdikwSk2mf0mFTUpHDQnpmq2qS0QS0ObZV6XIAM3LogPHR3Gk2nZwb+n5qRTgx/2O+UWSd64fFc5RcfffWHRNf6Fbc5yX132Z0U+jdlQTLsNNM7+/a0hhGFSem4NUb5s/kpO5SXb3EA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3300c58e-ebb1-4f09-3039-08def7545f2d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Aug 2026 02:58:08.1059
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hvUMJdoCws94UNvgjtltOFPWGWRECT1kjEPinyF3iTrmxuXxWykcIRq6V5+OkWKmoeBT8ve8Sm8TFoN03l73veNwZlDxw8QPpOj7H+yUJbY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF8C0509479
X-OriginatorOrg: intel.com

Hi Babu,

On 7/7/26 2:50 PM, Babu Moger wrote:
> Privilege Level Zero Association (PLZA) allows the kernel to use a
> different CLOSID (and optionally RMID) than user mode on entry to kernel
> mode. The CLOSID/RMID association is programmed per CPU via

CLOSID is also optional, no? I am not able to recall now why this is not made
optional in this implementation though. Could you please remind me and add
it to the changelog for next time?

> MSR_IA32_PQR_PLZA_ASSOC (0xc00003fc), using RMID/CLOSID values and their
> respective enable bits.
> 
> Add the MSR definition and union msr_pqr_plza_assoc to represent the MSR
> bitfield layout used by subsequent PLZA programming.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---
> v4: Re-wrote the changelog and code comment.
> 
> v3: No code changes. Patch order changed. Improved changelog.
> 
> v2: No changes. Just rebasing on top of the latest tip branch.
> ---
>  arch/x86/include/asm/msr-index.h       |  1 +
>  arch/x86/kernel/cpu/resctrl/internal.h | 37 ++++++++++++++++++++++++++
>  2 files changed, 38 insertions(+)
> 
> diff --git a/arch/x86/include/asm/msr-index.h b/arch/x86/include/asm/msr-index.h
> index 18c4be75e927..2503451a95fe 100644
> --- a/arch/x86/include/asm/msr-index.h
> +++ b/arch/x86/include/asm/msr-index.h
> @@ -1292,6 +1292,7 @@
>  /* - AMD: */
>  #define MSR_IA32_MBA_BW_BASE		0xc0000200
>  #define MSR_IA32_SMBA_BW_BASE		0xc0000280
> +#define MSR_IA32_PQR_PLZA_ASSOC		0xc00003fc
>  #define MSR_IA32_L3_QOS_ABMC_CFG	0xc00003fd
>  #define MSR_IA32_L3_QOS_EXT_CFG		0xc00003ff
>  #define MSR_IA32_EVT_CFG_BASE		0xc0000400
> diff --git a/arch/x86/kernel/cpu/resctrl/internal.h b/arch/x86/kernel/cpu/resctrl/internal.h
> index e3cfa0c10e92..020ebc2c8a1f 100644
> --- a/arch/x86/kernel/cpu/resctrl/internal.h
> +++ b/arch/x86/kernel/cpu/resctrl/internal.h
> @@ -222,6 +222,43 @@ union l3_qos_abmc_cfg {
>  	unsigned long full;
>  };
>  
> +/*
> + * Privilege Level Zero Association (PLZA) is configured by writing to
> + * MSR_IA32_PQR_PLZA_ASSOC. The MSR must be programmed on every CPU in
> + * the QoS domain. Each domain supports only one PLZA CLOSID and/or RMID
> + * association. All fields other than PLZA_EN must hold the same value
> + * across the domain for consistent operation.
> + *
> + * When PLZA_EN is set, the CLOSID/RMID association used at CPL 0 is
> + * taken from MSR_IA32_PQR_PLZA_ASSOC instead of MSR_IA32_PQR_ASSOC.
> + *
> + * @rmid		: RMID associated with PLZA.
> + * @reserved1		: Reserved.
> + * @rmid_en		: Enable RMID association for PLZA.
> + * @closid		: CLOSID associated with PLZA.
> + * @reserved2		: Reserved.
> + * @closid_en		: Enable CLOSID association for PLZA.
> + * @reserved3		: Reserved.
> + * @plza_en		: Enable PLZA. When enabled, PLZA applies to the
> + *			  given CPU. When PLZA is disabled for a CPU, the
> + *			  CLOSID and RMID association defined in the
> + *			  PQR_ASSOC MSR applies, regardless of the CPU's

To support grep: "the PQR_ASSOC MSR" -> "MSR_IA32_PQR_ASSOC"

> + *			  privilege level.

Could this also please highlight the relationship between plza_en, rmid_en,
and closid_en? For example, if I understand correctly, when "rmid_en" is 0
then RMID is taken from MSR_IA32_PQR_ASSOC, similarly, when "closid_en" is 0
then CLOSID is taken from MSR_IA32_PQR_ASSOC. Thus, plza_en could be 1, but
if both "rmid_en" and "closid_en" are 0 then, the same behavior results as
described for plza_en == 0: "CLOSID and RMID association defined
in MSR_IA32_PQR_ASSOC applies, regardless of the CPU's privilege level".

> + */
> +union msr_pqr_plza_assoc {
> +	struct {
> +		unsigned long rmid	:12,
> +			      reserved1	:19,
> +			      rmid_en	: 1,
> +			      closid	: 4,
> +			      reserved2	:11,
> +			      closid_en	: 1,
> +			      reserved3	:15,
> +			      plza_en	: 1;
> +	} split;
> +	unsigned long full;
> +};
> +
>  void rdt_ctrl_update(void *arg);
>  
>  int rdt_get_l3_mon_config(struct rdt_resource *r);

Reinette
