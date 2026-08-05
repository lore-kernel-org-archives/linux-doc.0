Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0348331F992;
	Wed,  5 Aug 2026 00:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785888789; cv=fail; b=eQWYYJfrv75AuRHBxL6mquCCYLdTG4n13qFXoW9Cajf7FxPvL1yP12n2QT4Lebfr9ZSjk1DAklQRk1opWLO1SARleET3Gp+Mte52nqdgcat/6c154H8DsmOkMQEs/kVA1+/2ekgSX2i46h6sobpsvGnHJ9z1x7z6XLfV+HXf6II=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785888789; c=relaxed/simple;
	bh=4m8YdFtQWWbuJKRyWoP7gIXuKfPFO+tG/y832/2XWb0=;
	h=Message-ID:Date:Subject:From:To:CC:References:In-Reply-To:
	 Content-Type:MIME-Version; b=pHbttU7OgQKtG67fb6QKrDt1khyWISxcyFfMzxoT2hcbiyn1DVEmgZoPh3p3Ns8S5LuoHQikTKjim/22aSrQWCDPN/+MH3JrDUniPOTOk3+5d50JpAFWkCFowBZnXEFHhJ4OtDX4OElQYuGRd1ADMPS2xwLSMolXkJ9hsOb0/aw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UjOVQQE2; arc=fail smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UjOVQQE2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785888788; x=1817424788;
  h=message-id:date:subject:from:to:cc:references:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=4m8YdFtQWWbuJKRyWoP7gIXuKfPFO+tG/y832/2XWb0=;
  b=UjOVQQE2O8h2224v/4RvptfdBkHhlskwaFm/S/SMDDzwD44e+CzK/R4k
   DaMVGJnX1dkYGMG21Po0JyhV/UGuVk2b6E/da8FlhlxiotKh9YQme4WVE
   //Ei76tXV2Vv3eHYKORY8Y/nGkBDDSqYwcXLJcgjFFa1S43+2SHY+feNt
   zjlXtO8TGDv/1wcvLSlbxtC6Eq/AdNeCUzgqPU0SJT7h0/0rbPESi3Cw4
   874IdyX9WnOZEDsixOwvcKSSItgy8SeYHH2ww2LFvoM6rQbYTQ5nuGfyY
   H2bv6pLwN90hiOnc+jd/y+aVLjxYOzHpR28ds5iGZ/AB7Y2oFNNRGZADh
   w==;
X-CSE-ConnectionGUID: F+LiVkLSQ3+kC4YNvcaXoA==
X-CSE-MsgGUID: Ptbs9/GfTj+4TZvu9z3gNA==
X-IronPort-AV: E=McAfee;i="6800,10657,11865"; a="86653213"
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="86653213"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 17:13:08 -0700
X-CSE-ConnectionGUID: UWMMWiiKRAedL/2p/EVqag==
X-CSE-MsgGUID: 46qlNq2pST6d/l0GaAzKkQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,205,1779174000"; 
   d="scan'208";a="255367200"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
  by fmviesa009.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2026 17:13:07 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 17:13:06 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Tue, 4 Aug 2026 17:13:06 -0700
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.26) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Tue, 4 Aug 2026 17:13:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l3SvCxzNs1CBRH4Qa5y3q8Cov6ngzV+Dcj/B7qACfVSPAqVFt53yZiu2Kc3aT6cSZL3o/FMPLQLa9JUbbuGp+W4feXHBuXD8xJ6F45einVoYUPcuCSI/LABYQddhiK5EV7UmGgjQWOHjC5kCLENgae78umSztwiyScAFophrBU3jZAfq6P8r4PtqtBsoYVgTGgwnDgaOpZ5t8/9Cbu3HBp+wRsZm/W3oGnuOMDUVDMzSErnhBwZLP89u5VLuO1Yivs+5tn4vg8k1NJopnZmovAd5FQTIH/J/iTmAlDMoGMDbI+XHtpgeytJfoIF+YMFKD7p7bXhSVosrUiXLX1M/iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nxZJGNt0CBxbEFcpR2vlkuSW68ZjpGE7rz/L14tAdc=;
 b=mZj7bfOxrHPk+fuTFIsJwyrGuh4Fxt+hzorHXtGIjyaS3375so+7imamW2+fs6KbKdaWVsifkElsOUrzleLJYsESp4jLRSlHjYHjnQE9IcMYwP6xMRRFPl+pG9gBRQrAkL6da/2cVdMxPD4WcQgzPAqSqocW1DbfgbchsXee46nWbremIHF5W+Y01uMjH+ckYEjA/nl0k62G8Du/tGGRvbEOU7Qicr95+odRVFXlCqEkXctRHxSxb7og1+k4/4u83ET6w/+GjezEVFCF2gaYVQaUM3jKIQx1sqCqLDaS/KNmXgNoYreCdasPBCISgoGIQpNhIxq2T6Twk7Oids/CjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by IA4PR11MB9279.namprd11.prod.outlook.com (2603:10b6:208:561::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.17; Wed, 5 Aug
 2026 00:13:00 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0270.016; Wed, 5 Aug 2026
 00:13:00 +0000
Message-ID: <b5aa1c1e-a7e8-4307-b9a9-a33286e5d5f2@intel.com>
Date: Tue, 4 Aug 2026 17:12:57 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
From: Reinette Chatre <reinette.chatre@intel.com>
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
 <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
Content-Language: en-US
In-Reply-To: <112cebea-d455-4b75-847b-bb7d4aa4847d@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0131.namprd04.prod.outlook.com
 (2603:10b6:303:84::16) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|IA4PR11MB9279:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e812cfe-14fd-4416-91e6-08def2864f20
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016|23010399003|4143699003|11063799006|5023799004|56012099006|10067099003|3023799007|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: 1qGZmxRnj2VfBYt3WXq0/2L0Ec0rV2lc6sXCw1hupASczFGsZ6j84Cd7LR4DjCbAsCjpig7ddvvRfLUfQiZfzrQkfd7UC2WsK9CkXP36ol/cZNQebwA6rhsWxM9sUeapb46zAeHvjjmnIFiZ3FAUOVVqS5KBRMkr9SUHD8jn+GUk7HiSVKNcYYVm0elkc+bd9ME2Y68/vM1/rTBtqanFJTmQ4NE34DDEz2EGILHcKWPTwTzVpmKOK3MWoeFv3rInqnPDG0CSPsdLMZYQD82BlkJ4IQJ3M8Lxiup3IZ2+5FCuIo8cdixi4RL9QQUHeFVHL2/0fO5E9zNGTmBhoy5xDmtaYPfoMjYTzN5aOPckBfKzXHizNfv8gMp6B6xvTUpOH9rOmK2Hs7L+NNDy2KlblGmY0qYhrTzJGzqIq2ZayZRzf0Ee4StGc8X05B+yVlpe5/Tx36zQ5WdY8P1hxFtBbslczNEl9va4/+7dxTsQuWXxYRpbEo/nHWOtLD1+oFaGScn77Zx4+pJeU2tO8mgfxEithUXgZUaDrCSFyNct5tGpA74Bz2uE9NBT4vkqyBX6M1HHY1NIDlAXqfV7DGry0uzI2N1Gme7JiyW/qpAvGbCGQRr51thCpiIL4eDc1HoNa6pBwBeHTRjBGZPxlTRh1/E9xhxw0j1SngyViAspxY4=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(1800799024)(366016)(23010399003)(4143699003)(11063799006)(5023799004)(56012099006)(10067099003)(3023799007)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TE9yZzlJaGthNmhyQ1pkekRlQUc1SlFpT0pUcnVQWDBLV0lJQ0hZTXY5TDcz?=
 =?utf-8?B?bHlaOVFZQ1M3b3o5cXNqZzVUUUhzaHhvTWJFdHU1RTQ3YXY0NVBKTWpvUjQ2?=
 =?utf-8?B?SFFGRU5UZy9DcEhEVzFyZFpwdlJxbFc5QTZNWUYxYk5tZG1LU1lEVlRwNWVx?=
 =?utf-8?B?eWNLU0VwSldwRXVhRUl2V1JIa0lvOTFkSXJEMFR5YWdxejJ1K0RWMUMzT3BR?=
 =?utf-8?B?QWg5aXhlVG9pQTJCS3NWaDBqYXlDZXh6UWZHOUZZSVpvRk1ML294LzAyeWNt?=
 =?utf-8?B?YXQ4N1RDa1U0cDhPOTZ1c3JtVmZLR0VmOHh4Sk9WNFZ0Tk52K1JwQVpRT0cx?=
 =?utf-8?B?Q2ZzNmVzZDdkVDZ3a1JJVXM0OWFVNTRRZmVIVWZscTc4TDJnRWwzRHpTVnRH?=
 =?utf-8?B?RHRSSVBzZ1R6T1VDMzhVYjhpMGlraEMzT1cra0JpNEQ5dmRNc01PTTZRNFpW?=
 =?utf-8?B?K0svcVREMW52a1Q3dkFta3JRUmtGMkZkS3pucy90alA2dGhwV1RJaEU5M1Js?=
 =?utf-8?B?UHNJQ2ZEZVYrQ0NFZHIvYW5nQXBhNGNzanRpMHNqZWtzeStmSHF6eEtQTWli?=
 =?utf-8?B?amFPMys0QitrblVwVjVJaEVtL3c3THFxTWJWdnRVc0Q4WDlQcW9KUWFuSEhZ?=
 =?utf-8?B?a2daSzNwMGVrL1FuUUd2S0g2OFhmdkFGUlZUWWZJR2NIYmVJMDRRVno2RFRs?=
 =?utf-8?B?NXA0Y3U0cEd0TUhWWHZCSHM2c1ZyM2JSSEpTWXQ5MjRrb3RLalVlNHZLa3Vs?=
 =?utf-8?B?UEhtZWNUTE1sWGsxdm83NDhRaVVKdXZwUVdrRnMrTHFwQTVmdDBnL2tINXdp?=
 =?utf-8?B?ZU5pSkNnRDI1Z05PSEUzdDB3bldHNXJZSWhVdFJici9TbXN0eXFpZ0pjeTY3?=
 =?utf-8?B?dnVzdDQ5YSsyaW94T3hwSFU0NHI3S2U3NFJ3THdYN1lDVjdETHpLUWRHOUxh?=
 =?utf-8?B?RWdpMXkyRUZuTUYrTzhRbmhDekZzQUo4N2dIVE1mNTNKdWZKeGlibmlwdmJl?=
 =?utf-8?B?VTcrTy9FNmtKbHRkTkx4UTU0bnVUUkZGYnd6aEhJT0lsN2FQdnNhMVRhUVhP?=
 =?utf-8?B?NFZPMGhHd2MwSEd4N1VDcHQ5TFlMRG5EbGVmSFpxL2ZkMUtJRksweE5TVFB5?=
 =?utf-8?B?VitYSHNiWENKVlIrd01TWnNYVmdpMGZsQlFROVhKaWhucGtWMkpKK1lBSzly?=
 =?utf-8?B?ZVh2dmROYWVtd0VUZGdqanFDZTFrb21zTGcwYzd0YlJ6eEdYQUdYK2pscmVK?=
 =?utf-8?B?Q05JUkhJTzF1Q3B4Ym13ellYU1RSbis1VUdmcTdEWmtRZEN6V045UWU4VWRt?=
 =?utf-8?B?b24vb2Z4S1RFK0p6K2ZkZ3ZuQktEbVl2ZVI4eDBMaVRUS3pTaDh4Z1pYN2pS?=
 =?utf-8?B?QVdQQ0c3cCthQ1E5UHRnek93OFRYa0Vlc0M4S2gyTjFMdGFRb24vRTFURUlS?=
 =?utf-8?B?V25uYkI1TjFLNmgrRWJyam5YeVQ4aEZQSFNZYnAxVEdZL3J0Sk1lSjIrSXBw?=
 =?utf-8?B?NlhhY09MaGlZRERpL09xdEJON3diNTg0WU80UDRjbkJrVVhkQWJXa254R3FB?=
 =?utf-8?B?RFl1dTNGaHlwRzE1cGNsMTFyR3c5WC84UnVDOVE1THJWNk1NclhHUG5yd0xJ?=
 =?utf-8?B?a2IwK1paQ2hsKzJkUk9tQ2diYkJwdXllSnQwR1VtUFRCaTVtbGRiZmp5Mk93?=
 =?utf-8?B?VU9PUXFRSUs4aUFUbWJMUXBoeTJTN2s5dVBiVmRJOFkvRlNUeElYaFgyL1F6?=
 =?utf-8?B?OEtVK29oejU4S3JmRTRsLzRMalZIYk80RG0rNmVBanpQRGNOT2F2MytUckxI?=
 =?utf-8?B?VGNIeTVJbnByb3FLY0lkcVB4OCsxd3Q0cGFLR3VEV3dkQ0VybG1TN0MwVHph?=
 =?utf-8?B?QmlJRXljcWc0ZGRKa0Fadk5YNS93cmNScHJFODB5SWJtYUxUTUZEUFl0SSt5?=
 =?utf-8?B?WkdNWUJNTjlLQ1dibnBUQWIrY1ZSRmpjYXRNZ0VJTHg2SE85RDZFVGxlWVNC?=
 =?utf-8?B?WW1tbVp4RXU5c2RVZUdlZTZVNXQ4WnhqV082eGgzWElrclltbjlTMFErM1FT?=
 =?utf-8?B?QXkya3VSWWF4NWpSOGcvNHhoWHZReHhOVWdUWm1MQTltV1dCRGVlSzMrUkhm?=
 =?utf-8?B?N1cxMElOQVRXRUJiWEhxL0wrcVNUdCs3eVdPY2lnbXFrR2RYazlBVitEWXpY?=
 =?utf-8?B?b2xnN1JCRUxDOXhCcGlHR2hlMW1ibGd5aVo4TVBEYXliQVFkY0dMNWpvdENV?=
 =?utf-8?B?SWNNK09RUzZzYzdiMldyazR3TjFiUkFhc0FUNGl5bVFxSEdNQkVCNFhxYnpF?=
 =?utf-8?B?UENUeTlROUpTY1lMZjQwekRYYVBsS3ZqL1YvWW9sc0F2MjYwVXpFUHJoNi92?=
 =?utf-8?Q?rnjRk9SGiAQGT0aM=3D?=
X-Exchange-RoutingPolicyChecked: qgQ4H03Y7rm8ausgvWDge7He3758/CJpQwPuvp1LJMDqD1s5u+vAPI5VwQ67qNu6nhB3OmK+f9EcPJa+2a5BOGQ1qwP0mfLAHSdtd7kCGH7IW/XphVgwFp3/XquJBMtHKTm6T5B321UiEYT9Fe6y/EPmudUQDlJOhFhmnBIT3YIHLFvfeAGIZdnuUleyI49rAEEC6/zwdyuVOvU9gcXPoaYN+swTeQM5+oGqE82GKTC8qT5IhgrHyV6oSS+eNN0omUW2mxlgVPNjWTD4mEkELiD4yZUwyrZR44StXrh7UukdG0MPeSs/Hla+oKjZheFXYdzVQUfINkN5NAPxQ7WE4Q==
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e812cfe-14fd-4416-91e6-08def2864f20
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2026 00:13:00.1620
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VT/dU81hzvtRPtkgPPaRj8l0k1HKnDe4QRGQnb6G5sMVDejFsx4C8cqgaoJ580QevLVpfVAZytjvPwPu3BjgHqcAps9KyqLDLr3XT4woVZk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA4PR11MB9279
X-OriginatorOrg: intel.com



On 8/4/26 4:35 PM, Reinette Chatre wrote:
> On 8/4/26 3:47 PM, Borislav Petkov wrote:

>> With my simple thinking, I would expect that accurate data means, the number
>> of counters being in use is not hitting the arch limit. The moment that
>> happens, I guess one could deem that measurement innacurate.
> 
> Agreed and matches above summary. The arch limit here would be the 64 RMID that can
> be guaranteed to be counted. resctrl does not limit the number of monitor groups to
> this number though but instead uses the number enumerated from hardware (4096 on this hardware).
> To guarantee accurate data in "default" mode a solution could be to add model specific
> information that teaches resctrl about "64" and it can use that as RMID limit instead.

As a follow-up this is not as simple since at this time this limit would also be applied
to assignable counter mode, which is not intended.
Another caveat is this will present significantly fewer RMIDs than what users are used to.
The current argument as I see it is that users are used to many RMID with inaccurate data so
this patch aims to keep giving them inaccurate data even though hardware is now capable of
providing accurate data.

Reinette
