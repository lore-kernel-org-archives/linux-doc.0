Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53053219A74;
	Fri, 20 Dec 2024 17:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734715027; cv=fail; b=jr6nAUy99BtGPbVv/tV5pzf0bo+jaOZg6yA16TQ6Slb0eM5GSsBDb1ZoZqy1BHbvaZDdtpWhZ80u6p8kfW+9li3TYimGKz8odvWAVKJNtpdMvXcdwHRrk/XX5DfRi8C+LDLr4hvSmpQ9cAAh/SJEsgx6215g9wvcg9Ovx8GYXgQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734715027; c=relaxed/simple;
	bh=S/hw9aWp27c3HgCiQ3kivXLV3iba8dnmsBcndGZS9yI=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AvOl3vhNBxqB2xe9LN38/R/uc0NXP9SzGucCwbVHIpeoR341229cprzoWbBr0541BzGNPbOotmci9AwSzNCU3ZiJfYQEFPH6lYW6z/UJHV77YEwmViVkYl+CeqEwqoByFkbvvucObvfTp98PwsYCd2QYpopHtFN/EhZHnVQlBN4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gamU+8qM; arc=fail smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gamU+8qM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734715025; x=1766251025;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=S/hw9aWp27c3HgCiQ3kivXLV3iba8dnmsBcndGZS9yI=;
  b=gamU+8qMkD33vin18zSqkN6rFpMypdV+nKnmItdJKl9HNv+LVJbdPXOo
   L9KQCeq/H986F5eW7OcUZCJAiFzllCd3hoJoMZKhBC4NS4vaomacQfP08
   uK92wx1CyMxV5DWREEc7vFrfkyZVbaQVCCbylcfWfICpDdIg82mntYhvn
   js2O5gI0OvAMIsArD95UaR5YDmnWyuKfT32c3pPHT/NwZZktgx1bRaDmu
   lXYzTgzWfK5egz/4/e7RvOdw7xkYwAjG2uc/So/JM2MF+3DiSG8sIMta9
   ZLPFY5lqK6+zD2ekvq3w1I+90v0UKsN3xadWmaKCKtQ1JSooV/UTZlfIO
   A==;
X-CSE-ConnectionGUID: 4kPHifPNRcKF0tJGvHPDDg==
X-CSE-MsgGUID: KiR+xY8aS6ayFkFxeVGPgw==
X-IronPort-AV: E=McAfee;i="6700,10204,11292"; a="45959789"
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="45959789"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Dec 2024 09:17:04 -0800
X-CSE-ConnectionGUID: 2a0m0ERJQ8yXHIbXqV7BDw==
X-CSE-MsgGUID: qG6Xj2kpRd2zBqyz7GQmXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,251,1728975600"; 
   d="scan'208";a="98381396"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
  by fmviesa007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 20 Dec 2024 09:17:04 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 20 Dec 2024 09:17:03 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 20 Dec 2024 09:17:03 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 20 Dec 2024 09:17:01 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=m1ESxywO4J0Kv7kBc53uqEdTgGQ/6a2vrjJCtgSIEocB/USKOnRMnaygI4jz8LskDj0TzMDHfPu5/RYkjyYIQNpsiAgahhJxDxQEHPZlY/CKP7SOg14qhoFo+WTIKLXFpMVgZxAt4DIJX0XfO8yGjhZeKiViXcarM4eInCP0l1SJkR6hvKKy6anNffPhW1giyucioJj0jTJ9tkTUs5beFeXLtqCV6PtWWO5+pxK4W3iQ6YkVRBGnKTmmUir7e9W6sxr7fkfkFkCPs96Jgt5CSh4F3m2Canm3o6oFcvWhue/qmOKsIOIohmoHYkhYG17VQ6dxIGByPm0faKdQUoFirg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GcviW6gsfNk4PL2u2FmA+oJGCaMVR2sDJ4LGqHgUHNo=;
 b=tR3wPUyNUIy0r6VjGkFsBLZV1leRkIWJm7LVxmkvx8Xw7Gve86lDudIhzxfLgX9VaAVm0vULO4NttvJfQn4eqh5cr+BsmwFOEe3EfQqk2cRC6nkgI8to0//7FTUcngMqPSJY6KN8PSSScDbw0KJ5Rcz19n0d1APkZmM+UtxudBLWOdcIO9FBrrPPKS4lw7DV58yQBFirkXtfhke14151DdRKhCHZuVRAjCqOxOH47B1zvAsLaxBrx7liFioLB0VRLoD0/IBcWgNf4OyW9gcgeyCB2LUERNT7Y+0ie8zrCQTbZbBU5MVKFzyQQkiKBw6SNft3t5Fyq5GJmpO61N94Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com (2603:10b6:a03:4d2::10)
 by DS0PR11MB7558.namprd11.prod.outlook.com (2603:10b6:8:148::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.20; Fri, 20 Dec
 2024 17:16:44 +0000
Received: from SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf]) by SJ2PR11MB7573.namprd11.prod.outlook.com
 ([fe80::61a:aa57:1d81:a9cf%7]) with mapi id 15.20.8272.005; Fri, 20 Dec 2024
 17:16:44 +0000
Message-ID: <551265b5-dc7b-4a31-8288-c201684ecf08@intel.com>
Date: Fri, 20 Dec 2024 09:16:42 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 07/24] x86/resctrl: Add support to enable/disable AMD
 ABMC feature
To: "Moger, Babu" <bmoger@amd.com>, Babu Moger <babu.moger@amd.com>,
	<corbet@lwn.net>, <tglx@linutronix.de>, <mingo@redhat.com>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <tony.luck@intel.com>,
	<peternewman@google.com>
CC: <fenghua.yu@intel.com>, <x86@kernel.org>, <hpa@zytor.com>,
	<paulmck@kernel.org>, <akpm@linux-foundation.org>, <thuth@redhat.com>,
	<rostedt@goodmis.org>, <xiongwei.song@windriver.com>,
	<pawan.kumar.gupta@linux.intel.com>, <daniel.sneddon@linux.intel.com>,
	<jpoimboe@kernel.org>, <perry.yuan@amd.com>, <kai.huang@intel.com>,
	<xiaoyao.li@intel.com>, <seanjc@google.com>, <xin3.li@intel.com>,
	<andrew.cooper3@citrix.com>, <ebiggers@google.com>,
	<mario.limonciello@amd.com>, <james.morse@arm.com>,
	<tan.shaopeng@fujitsu.com>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <maciej.wieczor-retman@intel.com>,
	<eranian@google.com>
References: <cover.1734034524.git.babu.moger@amd.com>
 <401d9591e0b76133b649f71029965d1eb2391f21.1734034524.git.babu.moger@amd.com>
 <76794aef-757d-4621-8158-d23eba2580eb@intel.com>
 <706a4517-d8d8-4306-99d9-95533818bd4d@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <706a4517-d8d8-4306-99d9-95533818bd4d@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4P220CA0023.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:303:115::28) To SJ2PR11MB7573.namprd11.prod.outlook.com
 (2603:10b6:a03:4d2::10)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB7573:EE_|DS0PR11MB7558:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a0d3f66-0622-4105-773e-08dd211a141b
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|921020;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VjA2eHVPZHVTblF3cVVNUmtjZUd3eTB6ektZZEg2MGRYZWdZY1JoSUtJWkZT?=
 =?utf-8?B?TzZxak80SmExS2w1NDRBaGpGbWdtRWdmR3oySUN5ckRCTTJGeW82T3RiM3Iv?=
 =?utf-8?B?REowblNGTHRCcVlKSWxtVXh4bXJ1eFgybUY5THI3K2E2M1BMRE1xK1RQU1lq?=
 =?utf-8?B?K2FhK3puQ09IWGdUQ0MvdHU3RXFaRy9YRTB6ajAreVV5MURlSGdJem9XdEto?=
 =?utf-8?B?UkhUcnh6bGpxNEdIM080Z3dhak9QSjlqNGN5Q0oveldjRGRDSGNQb21mZHBj?=
 =?utf-8?B?YzhwY1k3R3dGNCs2Q2JIQXZFd2RnWks3a1FnVmhIVDdjYWV0dXRtaDNDWHFP?=
 =?utf-8?B?djdtcjQyV1FCODJvMEo1d21yYXZTZW12S1dEOTdabkVhL2JvU1o3eW9xTy9R?=
 =?utf-8?B?QXpUUnQ0QnNiRFhJR3p5RlhudkdiZEhvYW5ENGhDWGVnQTBJZDJ5ZmRrWEcx?=
 =?utf-8?B?dlJwUDRyUlQyU3NwT2JkRXRxaXZqNHdwelFIVVRmTzNDeTVkNzN0blBYVVlk?=
 =?utf-8?B?SitDMEsxTnVCMU02aGl3OWh6K2NYdFpWaVJiZkp1Z3VCMTF1MWRwYVVSeVhI?=
 =?utf-8?B?VUwyVHhFWDZFNTd4OHc2UGM4T1hRblQ4TVlZWUFxcWRZR0thb0pDdzRXWFlq?=
 =?utf-8?B?ZjRETU5LZEZVdmRJa1NKVU1qWGFGVVJJaUEwZlBFTGZXaHNQSGNwdnM4K2dF?=
 =?utf-8?B?VXpTTVV0NWt0UG5FQXFSMFdpNUEyNVpWdmt2akhQa1d6STJNWFVsaXJidENx?=
 =?utf-8?B?U1lVZ3c1S1NMOEU2cFhSVytOMTh4aldxYmpHS1FPajlIM29SSHJRRDZGdFlv?=
 =?utf-8?B?dUJ2TEJUSnZVUmRKOUZNQ3NWWmNjSVlCZWovdTdNR3hxODF3TENZS1N6c1VE?=
 =?utf-8?B?MWF5WmhlYithMEx1dE12ZUJHWVdLdTc5SjJYbFFzaUg0K1Q3NXZPUDZpeG1V?=
 =?utf-8?B?UURrUklQUEZ4OGhrMWY0RytDOGpuMTdwNE5iSmZWRnpOa1kwaU0zK2hyOEtx?=
 =?utf-8?B?NTJqUURZZms1c2pVTWlTTEtyMUUxVFJXbXV6NnhVN0JyLzJIRE5BU3JjWmlY?=
 =?utf-8?B?QjY3VGJGdXJSR2x6dWMyQ1gwYTZpT1BRWEZnWEY0aDgwM0cvV2ZNaDdWdjRw?=
 =?utf-8?B?Vi9TYngrMWZqWGRiWHphbHdVVTdpa1Q3d1NDMlRBMXRJb0lrU0dnM0RQazJ2?=
 =?utf-8?B?dldNa2UvTU1DbEYwWmRvS3orK2pCYzJ6U2hnYUx5dDhxRUo1VEt0eE12Sm1B?=
 =?utf-8?B?YlNvUXpPaFBrNk1FQjJqcktkRE10cGw1MmNZajJqa2pBRDdoNWVTRHM2U2c1?=
 =?utf-8?B?Z3RNd3VvQm4xK1I0ZlZMVTZ4bHVFREJQd2FtT1JUNVBJbDJOZ0VkUThnTUdC?=
 =?utf-8?B?elI0SEExbEtKaytvTFUya2V2SEVBODlBaVhuN2V4SjkrMEZqNWkvWkgwSytx?=
 =?utf-8?B?WmRHQ3Nock1WdkQwdGtzR2dubjNZUTJ0aWNMTngzQnFDbUhROGhkbXVUY2Q2?=
 =?utf-8?B?T3VpZFdyMGxpMU14MHFNeDVpNncydk5ON3ZYWjh4S3U3Qm9idGRlNFhkM2dp?=
 =?utf-8?B?RHhra0hQSG9GVW1ZN2crV0FPUU1hUU14bEUvT1dZWHdmb0tMQmlyRmlWZGQw?=
 =?utf-8?B?RmREWkh6WHhkTnZoVGFwSHNXZUFhaksxNmVmWUVuaTlnZXZxY2JBVlU0Snp6?=
 =?utf-8?B?WjN6bUxacDAyeUJaZVV0SWZ0Lyt4U0o3cUhvL3J6d0xqVUpPWU1GQTlQMTlG?=
 =?utf-8?B?dm9NbG0wbFVTQzZXbVVteVU0Rk9iU0VpdkhEMEkrUUplczJ2bEdqODM5WHYw?=
 =?utf-8?B?L2lQU3lkUi8vVElpSHc4Z1ZSLyt6VTZhZjVJK3RubDZFUnVnaURibHNjaXlo?=
 =?utf-8?B?Sy9NWEtJSmpJU1ppUGRhb0k5eHNuV2hYOFc4eDhXQzA2NUd4ZTZRUDRBNlpB?=
 =?utf-8?Q?vFDFSFE53Ww=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB7573.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(921020);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MkhZaCs5VWxnaVJHcFZ2QlpKWXJienY0elRIRmNMVjFEb1hDbXhrc3Nva2NX?=
 =?utf-8?B?cDJMdVBhWG9TS0xBQm5OVnpDV2Nnc2lOYnlsaWFoc3ZPcFFxOWVoVHBKREc2?=
 =?utf-8?B?eEJZbEJiZVRlWHVORHAvMFdaaDhrZGlGbkpzVXYrM1RtNnA1TVJTNkRHSWF5?=
 =?utf-8?B?TEpYRlM0NkJ2RTdZMllsVWxZNElkQjNsSzVpS3RPV3hUZ1I5b084WThJZ1Y2?=
 =?utf-8?B?YUVsYU84RzVrbUE5WXR2emt0RE0zNG5rd3dHakF5QWJVakptTWdCa0VtK2FL?=
 =?utf-8?B?ejc2QWg3dXVFM3ZoemhzUTh4MjVGVUlvMHNZdW10aGgrYmFKSDdyQTZRS0pL?=
 =?utf-8?B?VCtmSWZSaytnZ3FxWndudnVENjZlYVdySzJaY3lEMEVwc3lLZ3lkemNUQ2RX?=
 =?utf-8?B?Kzlnb0xPbzQzZnp1c25EaHhzSGpmTmpRZllKd1M3M1p1OU84eWR0ckRBV1hE?=
 =?utf-8?B?OTFoVFdOT1hjRy9YQWprMnQ4a011dGJkZm1SNXNLSUQ3a25pODZwajMxRlJG?=
 =?utf-8?B?VzJwTTk5T3pWM0pvVWhxdHVCRVJmSDJqeGJrRUVPSGFmUUpBb21WU3h2enVR?=
 =?utf-8?B?czdkQVZYamlOeUoyS2lvNTBiYS9PT3ZCZitIWDVqOStmc3A5NXRWcGxnMmNt?=
 =?utf-8?B?M1JQemVTREtHM3VncHpMT2Y3dGtHa1AzdC8weGJJSjdYci92SitCRDdUQ2pp?=
 =?utf-8?B?S1NrZkhhWGZJZXlKTlQ2VndlT2VVWi8rSHcvdkZEWHNWckFJNThQeHBnWUVz?=
 =?utf-8?B?MElYLzQ3cFR6Wk1wN1dVMDFmKzhPajNzcUtvWXcxem9MVUdjYmoxelN0Ukl0?=
 =?utf-8?B?VU5WalovTmNKZEZKWWY5MlNycTBaWFNBNkJ2UFdrWkV6TlYxbWt2VG5OTFlN?=
 =?utf-8?B?b1FJYkJqWUE1N0FkczRyL1NhSE12RmsyNWtsVlVKWWxBS2tkMlZnUGk2dTlr?=
 =?utf-8?B?NEs0aTdhSHg2UmowTFA3aDZ4aEtFdHp5UlZmRHVTbHJCcmlTalJTbmxhWDha?=
 =?utf-8?B?T1lGWlZONmFoZzBKd3ZrVjEzb0tORmxRa1E0bmlWNkdTenZkUnF2dXd1TXFr?=
 =?utf-8?B?QW9oYXdmYVdRazA4RFFnUDYwb0xsRHRDQkwra3RITlVISFgwdzRWWCs4VjJo?=
 =?utf-8?B?VmZ0a29pRDhRSUUrN3lpRmxJcVZTYlA2LzIxZkV3TmpJOUF3Y3BMZnMwTkUy?=
 =?utf-8?B?WDNaRjZQeUlpRUlHakJlaDRTNHBQVmRwNERwQnhFL1ljbmJqVFlKSUJ0MHdZ?=
 =?utf-8?B?WXRxUXRsNUMzOHJSWDRwUkdXeVlEQXZCTTJnSDB3UU1yejNxMWhJUWVLbXRv?=
 =?utf-8?B?aDMrbk5sTmpjNXFJNy9SdmFkckxOZlB2QWVQS3liRTBvdjZGanZMVURPYldy?=
 =?utf-8?B?SVNlTmZHUlc3endmd2xGdnlDa1RIcTFHNHRBTFprb1lkM1VjMDJ2M1h1WTJ4?=
 =?utf-8?B?QkU3TVRNSWRWdWZBeUpHVThLTTdRa01vMlBpOXY0dEt0cXMyQklIejlEeWEy?=
 =?utf-8?B?YnNGclRsSDIycDZHUzhBK0d5aUdWVDVQRGx3Mmo2M3NBY0pvUm92bTJud1pL?=
 =?utf-8?B?RFZGY0U2eTFpRDBpR20yU2NBM1JYZkE1bklMcHdZWkQ1cUVXai9TekNnOFZv?=
 =?utf-8?B?MjRndGdHcElHeVhNUzNVVHJLbWd5L0VtUGpUUm1oN2Frdm54enlORmxLenRp?=
 =?utf-8?B?OUlHZDRuUk9HM1dZalY3Tnk0SXJZNG9Sb1B0clBZUUJMTld6WjU5ZXh6WnMr?=
 =?utf-8?B?ZGRSS1JsQ0Z0SzBvck80K3N1cXRERlVXOVhTQ1NwelpZWGtUenhhVjAwMDdm?=
 =?utf-8?B?VVVaWm1vaVV3d2RZanM2U3JzTzh6dUs1S1lHRkxEZ2FJUkhSNDdRYjJvRWs3?=
 =?utf-8?B?bzhmc2dKWm03cy8xamZWazNTYjJKUm1JZ1phaGx5cGZRbWEzdjNMcmZQZXhX?=
 =?utf-8?B?TitSSlFpY2tkU0NaeGJhUG94V0JzVDBxOTdoekh0Z1VWMTFBSFZkWU44aC9U?=
 =?utf-8?B?YkNyMy8rdHlnUHpVWGh0cThJNmVrYUt0SWVpQjZFRUlLSTUvUlpLOWhNbG1H?=
 =?utf-8?B?ckFZc0ZLT1BoVnZsYVh5TTVHMWFRdTRueWFDcXcyU3hhV0xEVHdQOFlFTmpQ?=
 =?utf-8?B?Z2dHUXIzWGUzUSsrY0hMR1ZFaUp6WHBmUVFCSUFsMUNuU2t0NnZzeVZ4V1JT?=
 =?utf-8?B?TGc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a0d3f66-0622-4105-773e-08dd211a141b
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB7573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Dec 2024 17:16:44.8200
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZesHx9HhDd6alD4EEqbdB6cpRweYxsdYV34YZYBFTz2fU2G5LbTyq2nVs8VEkmQwSNLNr1ao9HWhTB5nM4dGHsLtzjsmZ7+w9w0k/NJv4gM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7558
X-OriginatorOrg: intel.com

Hi Babu,

On 12/20/24 7:14 AM, Moger, Babu wrote:
> Hi Reinette,
> 
> On 12/19/2024 3:48 PM, Reinette Chatre wrote:
>> Hi Babu,
>>
>> On 12/12/24 12:15 PM, Babu Moger wrote:
>>
>>>   static inline struct rdt_hw_resource *resctrl_to_arch_res(struct rdt_resource *r)
>>> diff --git a/arch/x86/kernel/cpu/resctrl/rdtgroup.c b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> index 687d9d8d82a4..d54c2701c09c 100644
>>> --- a/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>> +++ b/arch/x86/kernel/cpu/resctrl/rdtgroup.c
>>
>> These functions are clearly monitoring related. Is there a reason why they are
>> in rdtgroup.c and not in monitor.c?
> 
> There is no specific reason. Most of these functions are called from user interface. User interface handlers are defined in rdtgroup.c.
> 

Most, but not all of them, are, yes. With most operations triggered via user
interface we'll end up with most code in the same file if trying to keep all code
triggered by user space together.

> All the code in this series is related to monitoring. We can move everything to monitor.c if you are ok with it.

The read/write callbacks could stay with res_common_files[] to make their definition
simpler. I think it would make things clear if these callback functions call into monitoring
code located in monitor.c. Since you have been staring at this much longer, please let me know
if you find this to actually make things harder to follow and find.

Reinette
