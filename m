Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6BDC33A032;
	Fri, 26 Jun 2026 15:55:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.13
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782489329; cv=fail; b=uGuTstk1BX9W+S3zzLrCrA5d0q9qtjMCriATJ4ir9AqRKdIo39xGMgKr/Gjs/cV55Zx4iKe0oKVSPOKNU0SyuzX88eKOn8oAO203lZbR/xaERoj4gH2qY2ixCZ8E4kG9l55SKsKILyBqWrVrq3UpUR3URUdC6KEzm3GiHs3LzUY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782489329; c=relaxed/simple;
	bh=Km3AUUMw1xRP9TQLn1R9NfKDnHl5a3LAEGjZA1pWNQQ=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=OdMjJXHF0pKoEvTkM96zS8t6PYYz8Mf8f5jflod/osNB8OpHNA6WsWpmHWc3yCOxok+JdRQ4R2HsXqj2UQoXx+glNian90gj/F4olWoc30CfHRoCIBWtk/eGD7tQzLoJIH3ZxaZqWdF52tgoxJDGg5jbgLTKcLvaXS53jxdpWNM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ApwDPW9f; arc=fail smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ApwDPW9f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782489328; x=1814025328;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=Km3AUUMw1xRP9TQLn1R9NfKDnHl5a3LAEGjZA1pWNQQ=;
  b=ApwDPW9ftXf9c8m4G0SkgQPGfX2ZizZTlhfKudHgdAsSiwv8Ph08Miyy
   1a4966A6wUC3VdJGAEfzay/ojlc73oJoJI/s2pX5TxjrEBDBuO2ISitC0
   t0wpIQ7LJnNc09bqTMD+awnnmZpgOxkval/0VRIMT1ZN2ntqK7FwYCpMC
   vVbF+XB3WA11B+m783oql9p/GMwrdRmr840dzRKi9JvO2xvmYmDqy6uV7
   6h8Ht+AcjQl0iAhgF0LIyh7fZ8UdCYU8waKjxMbMSjH4utHVV8rOLb/tD
   IJdusBadmSaJVk2/lCe9kAnbsAhAO1rwAd7Rfz1qB8mnsehfxupna/0Xg
   g==;
X-CSE-ConnectionGUID: WjeS3EDITdu48pEJeWg5nw==
X-CSE-MsgGUID: Wcq+qtezTua9yaRJJlTkWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11829"; a="94431335"
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="94431335"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 08:55:27 -0700
X-CSE-ConnectionGUID: wWs5ufljTGy0pxL7vlna9g==
X-CSE-MsgGUID: lfbm61eQTCqfoL1b7iC2Qg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,226,1774335600"; 
   d="scan'208";a="256253856"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa005.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2026 08:55:28 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 08:55:26 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 26 Jun 2026 08:55:26 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.54) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 26 Jun 2026 08:55:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xYrATlE2AThehPlQpSV4amjFGCC/JJpyZ28C48+0uBTd4uUfSQ76jMi0nteNwuY4vbjOu+hkOfV1YVnsIocB3UDdUN1NeZ+xaT0BDnmo03rKcgIxCxuZPsDXeTHneAMNKlLca9LX1s9o6XYpsk2pLISV5mu4kvjCbhRI99N2JvBIiiL/2NAHsecUEJFZGays+MMx/CiZDvLIt+CZODA2F6B2QYDGHtkp7xwcBpEkRQS5PN3mShedvUNrfraI1FMyntFle9gGKfcVWcHNL6FjWhiWK+GDBvukuJSoaJU6TUdQz8mD9RFzknn46DdJYIc8Qpa2JhvSVeFzIMAUTJyGJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aPoYYB7d8Ykfw3a1jFcIGKl3W6lLF2+wZ9FTru6uvBo=;
 b=JM/Z+cqiUc/TKo20NoxzcW/PKcbt/U4r7/7OnwxmDVVp/tUEcoUMRuWJ92XrQuC7FcYWGRxO8C2aCIk7j8gm3jPmD8v6tpRDEVbRLtyOuECqSzGGqPz+CAapnT+iOFCTWb8EPKuh17Mb/Yp1z+PzZZDFd4a9Y2rgUJ6V5/cuwqWE3301M4PL1TXOEh07BsQBMrPFRxg38x+2EcXAIUvtSYyivsaPw78/kdzmOVbsif8ZyYuuWDIdQWnXU6uyRr7RoWtcRHOgJoMJdV9ViaS34ilCTbzHcGCP4W5pxN7YBVyZurx6czI/3CUBdct4cZjsLxJZvN1TcEpAjDOmGuvBwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com (2603:10b6:a03:48a::9)
 by SJ0PR11MB5087.namprd11.prod.outlook.com (2603:10b6:a03:2ad::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.16; Fri, 26 Jun
 2026 15:55:22 +0000
Received: from SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6]) by SJ1PR11MB6083.namprd11.prod.outlook.com
 ([fe80::3454:2577:75f2:60a6%4]) with mapi id 15.21.0159.012; Fri, 26 Jun 2026
 15:55:21 +0000
Date: Fri, 26 Jun 2026 08:55:18 -0700
From: "Luck, Tony" <tony.luck@intel.com>
To: Babu Moger <babu.moger@amd.com>
CC: <corbet@lwn.net>, <reinette.chatre@intel.com>, <Dave.Martin@arm.com>,
	<james.morse@arm.com>, <tglx@kernel.org>, <bp@alien8.de>,
	<dave.hansen@linux.intel.com>, <skhan@linuxfoundation.org>, <x86@kernel.org>,
	<mingo@redhat.com>, <hpa@zytor.com>, <akpm@linux-foundation.org>,
	<rdunlap@infradead.org>, <pawan.kumar.gupta@linux.intel.com>,
	<feng.tang@linux.alibaba.com>, <dapeng1.mi@linux.intel.com>,
	<kees@kernel.org>, <elver@google.com>, <lirongqing@baidu.com>,
	<paulmck@kernel.org>, <bhelgaas@google.com>, <seanjc@google.com>,
	<alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
Subject: Re: [PATCH v3 00/12] [PATCH v3 00/12] x86/resctrl: Add kernel-mode
 (e.g., PLZA) support to the resctrl subsystem
Message-ID: <aj6g5jojdWASJ5YJ@agluck-desk3>
References: <cover.1777591496.git.babu.moger@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <cover.1777591496.git.babu.moger@amd.com>
X-ClientProxiedBy: BY5PR03CA0024.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::34) To SJ1PR11MB6083.namprd11.prod.outlook.com
 (2603:10b6:a03:48a::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PR11MB6083:EE_|SJ0PR11MB5087:EE_
X-MS-Office365-Filtering-Correlation-Id: 29c36443-bbac-4845-f201-08ded39b5375
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|23010399003|1800799024|376014|7416014|22082099003|18002099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: ne+EIdDakSdm7uGBPZyMU88ISYpbRZtqpf2MVze/rc9MhhEZr+e4RDAbvcNUcdb8r8hjMJalhXl614L0Hk8WsnJjvmjfDXWt5W2VwYFM4hBYdGbBh0uYY/SZIGVeL/3pKAyeV8j+FMkQbLCYI1sf3mGVzwXRqViMKaOOxVJKdJrXfnnsTtv1boEW/4413XQbRmOEyG+GtxneIrBAqxYRrdTixdXyjPiErUHbX4gR1yT85Ga4K51FyrBL4SZyegPWcSqF6qQjvGmiPAU00FJnJybTALJYRFo4fqxRVPty2ysh6MTRUzqmpbhA1EXqmX0qyGnKsJzCimbEuMJB6Dx9k1yuCd0mjv5ZMSEKI38lXYSQY6RWW+E2XgsJQGVblXZq5N9Ok4wxbUNtFzyu8S+CJI+nRL7cHfgb40ApukIBdlDGRghcA+HQBwH9wIohr6O6T6MZNh5nH+Ysbmgz6xL4ANqv4yUX8/FpgN+DVUms43q1xWhzflxOYG2kRgiQpAah0qxMZs3fyOzKkAH9HanFE29n1/AXV0MXeKLfGfuX2fQNM/5MQXcq1fryWyiH57ReKt+6OfPh3XctV90hQ6jZ9vGzgZS2xv+GaSQMomTVZxKm8p2wZJu3yEabby8crtgVxjcq9xsDelt+IBjIEe9EdhAizug0clDanDl+eRXD+jM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ1PR11MB6083.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(7416014)(22082099003)(18002099003)(11063799006)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?evetqmtM1qVFXqlNpe1e1tJpz6pdJdhr88j9MiTk+K25W+c+iYnCcU9km7kb?=
 =?us-ascii?Q?JBwnJIEinwAQxlkz01zrhqA8gZHbJtNPq3/kxDC9To90I/heNnWoRR9ubF2s?=
 =?us-ascii?Q?jsU8159WmQskLXyz1S+f3yWeURWl39mr+BNxLOb/Kxr7MrlRCAA/2deWLyKj?=
 =?us-ascii?Q?qX9XZtPFQDJgm5U99JhElG/h9DjiVPMzAwdHGqDbJCGkw1/R+CkvDjz9ldvp?=
 =?us-ascii?Q?MB4srZbBofVBBJxIpgpNWkFgnGaKfLrkPgjMQhnYDisLpR4BnGneegi7PMWa?=
 =?us-ascii?Q?rDyfI7jypigN+9iKnJb58fXOWokz40YAGVfW03S3E0P7qjfMFofID6VSvUkm?=
 =?us-ascii?Q?O4gra+axndp7L5S/XDlNtRDVhjAUtimAiu0DraAjixB6/WFBMWrNr75buISg?=
 =?us-ascii?Q?pnSKBmqCQgKglwvZBoj8I/zIX2DSrQO6wSOjmX8rRkPuhUtQ8PhTCjPHg3ZF?=
 =?us-ascii?Q?OmysHwmmKUBp8G3JWrzMfjYfnjQe1kCGkhKx3gN2OMAoKG3ZxpBWG0p+dR1a?=
 =?us-ascii?Q?mehJIsrOyIbRH1eoTk44DrcEW3HAV4TKK1DerzjejUhIiIptBkeuL+TxTJQL?=
 =?us-ascii?Q?XOlHOlsoPXHoScL6w6H1zllmi8q3k1VFbS5vyGmfKCxKo8JwF32ovaTkdS78?=
 =?us-ascii?Q?NsCJ2CfWwN7oOdMtPbC6s0phtPcDFmKAjNax2lQI8kYLFkrKiK6WFXntx2RU?=
 =?us-ascii?Q?xCqh4P+zZrUxujC/MPeblx5d64V2SkFSE75pqlWYKJYT+BaYaZ4nJjVhKEf2?=
 =?us-ascii?Q?1eY67II+MuGqNYb9vdlePUtQ6tRlKZ7cLbWoLxBZtE9CS7i6WCHu3L21jaQM?=
 =?us-ascii?Q?eh2MD+FQtEzNC/gDFVzLheLRaCu83gyqdN80f0TPHdqVm95M9Omdy99y46h8?=
 =?us-ascii?Q?REt3KYyLyiimuf/jvaHqB52xnyhjcZB4aQuGZ2W6O+n+FGokHxQi3rfmBm51?=
 =?us-ascii?Q?Jin3LcZzPBMYGWKxIU9keVTd4jrqxe+/j2perfb6ORQS0eFOnWmnb7ac2BAN?=
 =?us-ascii?Q?Hxb46T4C8NlRkdPJxtNLwkjqcfI7a0SUAQwcvTahtH57fzac3Lbb3r46qqYF?=
 =?us-ascii?Q?rZTSQvo9PSC9MA3y9FJ58HT2UhbXWkR99SMv8lw43V8mAi/FlwfI2f5DzcpH?=
 =?us-ascii?Q?ekeNw+ruvIMMyjKUM/oRSWV91p7qxE/iwU64rJnFOwL4stsB2fxtmoNquVsW?=
 =?us-ascii?Q?+VKi1wQCBeRLgwTwH2nSPh6MrH1m5thnr6Oxv+PiBnok5pj53+CwdNl1lVYK?=
 =?us-ascii?Q?Lrg7+utYjWHJsHnJWt3KqmB7sR7Fdr6QXyn18TllJNAXHPGqMU7Ll14sfkFq?=
 =?us-ascii?Q?I7L1lNduQ30Nb2HPPK8v6O+S9uyXSh7ikGu2DNP3wj1OkK5AuM1k++zPm1Fq?=
 =?us-ascii?Q?ylpxyGeodguholpTbbjO8HbUSWxFw29jvLqQmw7rmg7cUp8OIJwErDfkXbH1?=
 =?us-ascii?Q?aLR3hFP16aJsjuC4rM2nF/HKJty9Eq2VwrYlGxKSaWC/uY5CtAVl+4hneymB?=
 =?us-ascii?Q?n82JsMxD3xb7p7e7S/0rRhd9qyBGDg/S94X82ruQglQf1MZYfcz8fnoVx5PE?=
 =?us-ascii?Q?GZvBYw3MrH9zDi+ZNZhjkl3QqAKKQTuVH1CCZHOyJpbImHSL64aP0bex3owL?=
 =?us-ascii?Q?U88O02g9ecZniTTfsoH/StYTKJu54nGYwllX+tC+N+Q5CW7ulAzT/pDBwzm+?=
 =?us-ascii?Q?Cbts5BZzHwKz9zQBoKKFe2WHuR1EvI1GVSj+ms638TPAXyS0ZTmyppOyHZwM?=
 =?us-ascii?Q?ucW0d9FFFA=3D=3D?=
X-Exchange-RoutingPolicyChecked: hiZIQy+9PEFCSEaQOGZbsMZ+xB7fQOCb5JlEpfwTiWxrifG8u+x2Dj9Y7yposxS0HfUHjSHH5w6DLHTxPtOOEEPy7xkkOv4hAGQSD0HuxrPeZeobKn6XgDCFGQxsMJzc36DyiHPibQWewePg5RwClpNeCai8yffo4pNZHizJrvDyC/MoERh3Y0rU9j/C5R4dKJTAH0e4T2zTxBRkYLrO1EorQmoupoCSd2HEtCQP8+e7Cmp37T0K4cqDnsFR79MdFK0exyvLYasByvqnv8tpvAOPqGzm37xedOK4jRpKB8FrH914QGi7adornjP+F65iLt9z9hzzy3KmnZsv44dfgA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 29c36443-bbac-4845-f201-08ded39b5375
X-MS-Exchange-CrossTenant-AuthSource: SJ1PR11MB6083.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2026 15:55:20.9848
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kFJZFCpOnAlVICk6jPBVfkND3nQuOE9Yi5XsTxNz1V7YeqEYzTXcj+/5tEtOs86lEjzvj+x9eweVV8iPG7VLOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5087
X-OriginatorOrg: intel.com

On Thu, Apr 30, 2026 at 06:24:45PM -0500, Babu Moger wrote:
> 
> Hi,
> 
> This series adds support for AMD's Privilege-Level Zero Association
> (PLZA) so kernel work can be assigned to a resctrl group, and wires it
> up through a small generic "kernel mode" (kmode) layer in fs/resctrl
> so future architectures can plug in without touching core resctrl.
> 
> The features are documented in:
>  
>    AMD64 Zen6 Platform Quality of Service (PQOS) Extensions,
>    Publication # 69193 Revision 1.00, Issue Date March 2026
>  
> available at https://bugzilla.kernel.org/show_bug.cgi?id=206537
> 
> The patches are based on top of commit (7.1.0-rc1)
> Commit 3382329a309d Merge branch into tip/master: 'timers/clocksource'.

Hi Babu,

Have you had any thoughts about a resctrl selftest for PLZA?

I'm not sure there are any easy ways to show that PLZA is effective for
MBA control (as most normal system calls don't do enough to easily detect
whether the kernel CLOSID is applied). But perhaps you have some ideas for this?

A test that sets global_assign_ctrl_assign_mon_per_cpu mode with a dedicated
RMID to track kernel memory traffic would easily show MBM and llc_occupancy
numbers for kernel activity.

-Tony
