Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51B3F39184B;
	Tue, 16 Jun 2026 23:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.10
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781653372; cv=fail; b=MmnbIJatxL5z1D6gRcNkKMS1OOU+dGPLd+6816LfKIPyVa+yJ4oLfHZjY9ICkN9QxNULbZ/XXH2bahTS3HDe5FZpja346vN+9IQCdbOhlOPmCR4qpIL4dSlI1C32kKajDkIz4YIrFGTDFmpHvZL+5LtIERJ2F81HWEv8+LbUrLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781653372; c=relaxed/simple;
	bh=7YDKp5GljAl98hNBha3b1Z6njeEgQW4UOB4B0Y+GYww=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=JKPVNQBMOghyqQxr5yOBSRxGNpFVhcYF0GgZ7rHQ+Wvp+a8+lDfutSoPe2V6zRjXjZKs7gs0v0BQgivVlr5TENm/kyqap526ZqoHAlZFkSJarf/LRXp4fLPJyg8+/QAy3FSjxnIE6D1fRznV7Dws3/pK9PpoqKxTaGbcIVs8ims=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XGvKZefr; arc=fail smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XGvKZefr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781653371; x=1813189371;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=7YDKp5GljAl98hNBha3b1Z6njeEgQW4UOB4B0Y+GYww=;
  b=XGvKZefrJ0ZPBR/oMNVbZ+1JmhV7qbFzCV+muCknOBG5PcPgWcDdQb+b
   wVmMSFioJ/ZGj70nFDvwBp2kNwu0FJL/Mh1OSJ/w92F+O4j51vTayBF3X
   0yEzMsQbMZRgTygAbWKOq4mr3/g5J2Y/TDajsKxoUjHvJET0iXNdOM9+9
   97IHX/6n7CU8wKxhXu9nAhG32gr8FCMXqeH8XO5Da5LzZcmYsfzxKV1gb
   25mAFiw7QT+VmK4URtozzV+aaYzptf5M16wgYscNuZwGng3dM5P04mffc
   1vfNFJG1qHPo2+j1waIG0KHUq4nwCtpVUhLyU2OImmYXQQZ9hUf6ScKjy
   Q==;
X-CSE-ConnectionGUID: yF6SoJX5TraC3ZzRY8IDcQ==
X-CSE-MsgGUID: KEVpHWZ2RP6XYhBzsINLww==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="93815427"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="93815427"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:42:51 -0700
X-CSE-ConnectionGUID: BjyT0mhcQvWVH2M/h5IHZw==
X-CSE-MsgGUID: +Zg78aSES6WjHTfVf+AXvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="278117881"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:42:50 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:42:49 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:42:49 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.7) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:42:49 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y6DAhNx651wS0P3wXsz14dBzYSpiK/773xq/CwFRYgmU+bTL8IFIvDkzemRkwzfNiyGz0DIa9xwKWceFr4dOSeSm1d7RR8V2SYVanX5/WQGJwAZGt3//DSsBsw6N5MR9jLYqxnTcfpFEts587RuveBb9b5i2i+brzhBFWBSPcEQlIAbKA2/W9T0OXcV2ROU862TyA+QOT7yogFR1u5YmgWbIGQikrDk5Z3iLZIpuHEmewBED2ijNCqEajBf+phoDn0+AhJ8i3UyvQauR229AgsADPj7KXmkgkJ1i8EocLbfDbJi0lHXKgzZIStr9JipaJ+5iHAHgyZcSKWXi4necsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NkeEZOseh8eroaQWQegotxT5p9YNWtBH9tVceoHRsDE=;
 b=ty8OD7r1z92V3uxiBMUNMj7ZHhp6bZOfM7Ntva5O6ToHYQkjmyDdXpQwtGWGfMA0WTUnAYOtNqmt34yuqpLPhd+4Q4KUWr1l927pe1RIGVTYn47AS+ozREFgALJJDTQKA/6E1aEYW684UIXm3k4VED4596Exlih86N1jYqbgl08eQtcaHkJ1AxQ2mPL5HmpnMtoLvicVNuSFgCaaO/q/k2mwqW89aDALVxxM3G3zZKg3z8XG+Amh+Kdxq+devk0ZnpT78awbcWi+K+CDNHungmEsTwpG9F7f/GA5MEg+pb73h1VjyRBFTDYvM+06bYGGp+10N4sQRFDpaj7WDSvuqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFBC9025319.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::84e) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:42:46 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:42:46 +0000
Message-ID: <10c18df6-d990-4050-bd79-1ca914eee673@intel.com>
Date: Tue, 16 Jun 2026 16:42:42 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 09/12] fs/resctrl: Reset kernel-mode binding when its
 rdtgroup goes away
To: Babu Moger <babu.moger@amd.com>, <corbet@lwn.net>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <james.morse@arm.com>, <tglx@kernel.org>,
	<bp@alien8.de>, <dave.hansen@linux.intel.com>
CC: <skhan@linuxfoundation.org>, <x86@kernel.org>, <mingo@redhat.com>,
	<hpa@zytor.com>, <akpm@linux-foundation.org>, <rdunlap@infradead.org>,
	<pawan.kumar.gupta@linux.intel.com>, <feng.tang@linux.alibaba.com>,
	<dapeng1.mi@linux.intel.com>, <kees@kernel.org>, <elver@google.com>,
	<lirongqing@baidu.com>, <paulmck@kernel.org>, <bhelgaas@google.com>,
	<seanjc@google.com>, <alexandre.chartre@oracle.com>, <yazen.ghannam@amd.com>,
	<peterz@infradead.org>, <chang.seok.bae@intel.com>, <kim.phillips@amd.com>,
	<xin@zytor.com>, <naveen@kernel.org>, <thomas.lendacky@amd.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<eranian@google.com>, <peternewman@google.com>,
	<sos-linux-ext-patches@mailman-svr.amd.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <280912ae2d2ee068fe5ec94aaf7e6e3f4e1c68b6.1777591497.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <280912ae2d2ee068fe5ec94aaf7e6e3f4e1c68b6.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0302.namprd04.prod.outlook.com
 (2603:10b6:303:82::7) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFBC9025319:EE_
X-MS-Office365-Filtering-Correlation-Id: 8029cbea-132c-4278-a0fb-08decc00f7a0
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024|23010399003|56012099006|11063799006|5023799004|4143699003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: mGt7t1YhI1KgOoXdgMueZVw7nB0gjTMGawuvtFl9JPl2VfK5glakPSN0JjtVGD451wA1Eloh5iuEmeW4iJJ68IBAUrEwMbkjoRT9x6ch1Zo9ONvT0vDDinfrzCTTGlRQKbNvQHTGByC79KvLR6HcDH4n6JgRsC7ai09Kelqm57YafPOmESGBgarPR7cWBkERtNgVxnjWNn5gJficSRPRidpB5l/lpBX54g2bNUn0sQD31wyguVAbYW0wRsX7QtCZ+lrjsFu8E9QXskiWooUlyzg100+y3rQCjgrHuEGCne/NPDNlSARmpxtyBQZzZWp7Gz40xiziWnH6eTJ9Zja4gEvJJz+j6/LjdvqiXEkmcvrfntrZlYmZb9E40WqXjXTankXzdetwvNdgXrgxW0tqrzUhMQx2We2W38Ka15I1C3vO6lBmT1oLpFHlEX9taPStpfJHhwHGxGCFX22qSFo0hCgTKoAiw+BnBjpbMSTHnu74utYH7neEDs/kbPI3sQ9J9FBpKClsJdyLmhgnWq6VzIqQelGNI5pcmfWBVYjgGL5x4gOIZ4169VsJnyGAvKZdGtsHCVh2RioNeW7NulYQBV95CaZF9l9dPh/e8k4l7PrJ3Fq/QJy/Xlb7PY+wHnlkWWtoYGnS8MFVKuqJ6Eaa+Hc8EJRiIiU0xIiwnany+PXuVEF63fvBzVU9h220zVeH
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(7416014)(1800799024)(23010399003)(56012099006)(11063799006)(5023799004)(4143699003)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTFRaC9tblZEZzhXUEFhUFpuZjlSUG9wc3UybU1uRGFoenNIN2tuOWZXQ0JH?=
 =?utf-8?B?ckdYaFNCSjFlWTRsdm9KY0x3M3hhV3F4UDBmMkZldUFqS0FMZTZ2RE9mVVRK?=
 =?utf-8?B?NlZlTFVnYnRwTG5od1czTExuNmM0dHpQc1pyZ3I2ckxJd0ZnMzYvOWlPa01B?=
 =?utf-8?B?VW41Q1RFQzdTZmlTbjNTN09odWNBTzV2YWZrSnhkY0RWVDNrNnhkWExRaHVG?=
 =?utf-8?B?bWxNSVBiRmdvSnBJb3djOWtlTkVRUUZySTN4MG42R2xqckFkNndoUmFhMHRN?=
 =?utf-8?B?cldNUjBYNXRhcVQxckYrekZBeWJHbWJsUER0SW9iSWhTcm1XRUdtS3RZdDg4?=
 =?utf-8?B?OUNKbC9Tc0dvYkN0aU00eWVmWFI2dkpTbUJaWVZaaE9iQmVBV2E3OEhhWTVC?=
 =?utf-8?B?SHpxcTNPMFAwU0JHMVBOdU1tVlhkbTdOVk5LNWorWTVPdWxySTh3ak9DWVd3?=
 =?utf-8?B?eUdZb1hRbHUwcTRiRDlERnNYeUtPK1FFQUh4SHA0Sm91Nlk2eDZyeE5VMmpk?=
 =?utf-8?B?eWk5OWwxTkx3SzlrOUhMVXJzNGIyZ09oYkdwRmhGdURGWk1ESzljTlJxTHJB?=
 =?utf-8?B?NHpJN2dTOVk0Nm5rZTVWSVE2L2t3cVFzei9wSUFjS3c4dkV6czZ5d0pZalZT?=
 =?utf-8?B?K2tlSEFmL09obmdja3JjUmxBc1dGV3FPbXU4VnR5cXcyczBMZ3pzWVpISnNR?=
 =?utf-8?B?emFwSHBUNmdUMDJnZ244QkZjMldBdGQ1ZDRNZVpEQVZzdkorWDJhaG9iTWJZ?=
 =?utf-8?B?RUFGRE50N3VRY0Fnc25OVVJBUkhncDVYeUo1NFBGT1dPQlRYOUo2bGZmV2My?=
 =?utf-8?B?MkQyaHZwV3hCM2NLc0ZFUlN5ajFHbjhpNHp5N3FlMDc5T2VxalNpdjFCY1hz?=
 =?utf-8?B?TUtBODJoTTFRZkd2S1NubXVDQkRSdnN6TDZiNEU0elpWVXkwQWtmeUdvSnFK?=
 =?utf-8?B?cDVZajhtTmlqMnltZ3o0djRteW1WT1RERk9SK2JBb1ZzdzE1djZCendtNnRM?=
 =?utf-8?B?cDd3ZjBmVGpSU3Q1T0VjeXNITDgyV3hub0J6UitVbGpDbUZtNVBYdHIwaFVR?=
 =?utf-8?B?ckx4S0d6UmFSMFQ3emtMUWVqd3FxMWNKcmd1ZmZqeWl5RWRNVFkwTFVEL1FR?=
 =?utf-8?B?cjNoNEEvVitxM3NLZDZlMC9CRk1yNXJQTnpVcmErZkluLzNTM2ZYaVQ0aXhY?=
 =?utf-8?B?ZEdUZjB4NHYyZWtVelM0N1NuZnV5aGlIMlI0ZktQQnBpTnBZaGEwazZ0TzVR?=
 =?utf-8?B?VnNMWkI5THgzamVrT3d3WUdnOTk4bjFFNDJjWHd2MGpOTm9vOGNwaGh0b1VF?=
 =?utf-8?B?eWkyRytwMjMxWTRSNHd5UEVNQ0tYdTYzTmdIV2JrelJTdGE3LzlTZGlCNWtF?=
 =?utf-8?B?WXN0NlhVS2V3cWo0dktGR3ZDMWtnNmRWbkk4UnNZZVVCTkxlQW9lbjZYSDR4?=
 =?utf-8?B?ZkNUOUNOaHlEVEpOalBvNXhzekpKaXdIeTZDVnRvNmNIVVNVRjdPK2J0NDlV?=
 =?utf-8?B?SFZsaWtTbTI1eHhNcHk4WlZ3OTIwaGVNbFV2TkRvaE8yVi95STRxeVFDZ1Ja?=
 =?utf-8?B?SFNhMjFkT2ZuZVRoMXJWaHhYTHNxZlFjdEhjc3lNZmJWWW9YTFNEQW5RK21w?=
 =?utf-8?B?SFpPWFgyUG5oYUtOY1ZwOW9WRUF4LzBBSlgveUJudmF0Vk9xSFBSU0c5VSts?=
 =?utf-8?B?UXY0cHlJdCtjcnM0Q0NGRU9JT0didWhhWlAxTHlERjF3SG1wZjhab2VjTFB4?=
 =?utf-8?B?SXZHVHJrZjllWklNT1RPNWQ3YnczOW5VclhUM24vbWIxUEhJNENZSHFoYnpl?=
 =?utf-8?B?cDhJL3VDMjI2U08yenpnWGdpK0xhZVpEZnU4VnhQREg1SEY2WmljSjhWZFRr?=
 =?utf-8?B?ajhjaWlhR1N1OTZLeVlvdE0xMGVqYWUxUHBDNWVFWE1xUndmMTVmOTlZTCtl?=
 =?utf-8?B?V1lQU2tLaGt3V1RQbjBJeURqWEhHTFl3VXRxYXdKWmxWTjFVZTJzRldPT2dD?=
 =?utf-8?B?RVBBdFZUTUV2RDJQbURJUU9URXFVVC9BaXN2d3hPUEJqQVZMWDkrNk80bVVB?=
 =?utf-8?B?eEZnRFQ1SUhLMUFMWlQ0a3pOZWtFYlVncUJQMXJ1UmtoK1dSNkM1RjFJZmsx?=
 =?utf-8?B?amx0ZEhOS09JTTNWTDIvUFZCa0hHM3BLMU9HemxKN2NWRVF6akRtckNWMTZ0?=
 =?utf-8?B?M20rZmVZcXJjY0d4U0VwdzZTbFZwaWdmdFhPOSt3QjZGQmI1VEVXeGQwT0Q3?=
 =?utf-8?B?emd2NUc1WnZXWFlhWjdVdkVvUFpIVFN6OCtoVzRBME1ubU1WK3Y2NW9SRlVl?=
 =?utf-8?B?Z1FQcHJKak5aR2haSzRkMEJkVmpITW1neGNwSklQQm1ZdHZHV0RQSjkra0hp?=
 =?utf-8?Q?rogf2XiSYgv5EUOI=3D?=
X-Exchange-RoutingPolicyChecked: KkGcy23gO9swethTQ7zN/+VLD25Cz2HcMYCFhwBUR9MnA19rIb3KYsIhJVSFDL1lX/fynBC/lxthu7kgOm7jYyXTXEH8pC9eFCz63S5bCp/aWgiZS3bvsd/ug2k6im3xbK/0v/M80qcniN+l3QHjL96y4fCBqCz6aBDJURkNZG2sRrcE/dLE+MDPUBH2I/xQ9P5MQBN1VeXAbhCtcDouUfVgTZQPd1W9nFnSnWfv577NMN1MHCZ6FvcCe9UK/dLw5/M54D9onBVSTkEtvAAZsTG5l1aAQ1W1QSh8ESCI0V28ozOBW6y9dIDYJ5cHAaAvaEdtDhKrr/0SjAXFZDRuPA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 8029cbea-132c-4278-a0fb-08decc00f7a0
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:42:46.1000
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Kimfg+N/bHW931mzGhYj3TP210ncUCsI2pbePQSVHCUIUJW/48HwPqTT15UTFtDoEpGDQ5Vv/6nwCNCsmHCZthULkVGyTB26kqmyQlxJto0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFBC9025319
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> resctrl_kcfg.k_rdtgrp records which rdtgroup currently owns the kernel
> CLOSID/RMID, but nothing cleared that snapshot when the group was
> removed.  rmdir of a control or monitor group, or unmount of the
> resctrl filesystem, left kernel mode enabled on the CPUs the group
> covered and left k_rdtgrp pointing at freed memory; the next read or write of
> info/kernel_mode would dereference a stale rdtgroup under rdtgroup_mutex.

Please do not word the enabling as bugfixes.

> 
> Add rdtgroup_config_kmode_delete() as the disable counterpart of
> rdtgroup_config_kmode().  It clears the kernel-mode binding on the
> group's kmode_cpu_mask (or all online CPUs when that mask is empty),
> drops the per-group kmode/kmode_cpu_mask bookkeeping, and if
> @rdtgrp was the bound, resets resctrl_kcfg to &rdtgroup_default,
> BIT(INHERIT_CTRL_AND_MON)) so subsequent sysfs operations resolve
> to a live group.

Could you please reword these code descriptions to describe why this
patch is needed?

> 
> Call it from rdtgroup_rmdir_mon(), rdtgroup_rmdir_ctrl(), and
> resctrl_fs_teardown(); each call site is gated on rdtgrp->kmode so
> groups that never participated in kernel mode pay nothing.

Does this handle the non-default resource groups removed on unmount?
(see rmdir_all_sub() called from resctrl_fs_teardown())

(please refer to earlier comments that apply to this patch also)

Reinette
