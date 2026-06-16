Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F4292853E9;
	Tue, 16 Jun 2026 23:33:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652797; cv=fail; b=BTgMHWEc/pKNybGJ9zvvLsQ7SfCRKeefdOkVB3blsx8a8hUc+xAelmvTYiQypd3rEdH8y2GIlgVBNX+IG6GzP6HxogYJMYi94/qrt4lrk2TvxRQAKXWLG/A+Ix09SfuyWp3K1xvnjto7Bb0Ap1v9f+zJOZxIzTWHv3YQNduvpyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652797; c=relaxed/simple;
	bh=OkvtmANNVZYgyku1LKRmJt3fbVZcFUET1UhFi81NHrc=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=eICZnMHprTA1PDcPrlLlENJEAtl02i5ap9XqFx96uwPQY1FP7uE7M/UY0O6vm6vem9I+Fpq61aEM+evb2oenXzB8FoPNpyTY3RxL9odFS43ANmztilqRSWY2rSRoy5Pk6KUexZKxKhrstiUhOLcvdNEuQ7qRCw8Hs+Q+FRhfViQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HCe81Xud; arc=fail smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HCe81Xud"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781652797; x=1813188797;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OkvtmANNVZYgyku1LKRmJt3fbVZcFUET1UhFi81NHrc=;
  b=HCe81XudQst6u1Bp+bL/A8G61xwCf8C+MnGr9AB8gSFo/G+xPv8ZSPTN
   cuHhSdaJswD9jVLZ92MywwSUxeVgcXczzDneSkq8scWbz3TVclp3gk9BM
   ukTyGldoGq4NZcqmLl+7hS2+LDz/jQbGHUmCpTDBB5moWFkfxT1wgAFqn
   4BcKuyxSeEDcQuZb3w/ePNatGOr+PugC6bwaEhwFKEEykQ9NZMsgfJT08
   Myhl9EbWRpD4h9NuU9LZaYxCPgCmy82rNZR9ZkMBu/Me2ARe3ov0TJjYn
   z2GXF1gxUd5qauZy3dRr7QAcEyj2FY5g7qSsaIfWnZomNPbO9OxrVYSnz
   g==;
X-CSE-ConnectionGUID: BMdjcRCZTLeO5YIu40DfSw==
X-CSE-MsgGUID: 8isvjycbQtK1nQ8BZolhcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11819"; a="82445937"
X-IronPort-AV: E=Sophos;i="6.24,208,1774335600"; 
   d="scan'208";a="82445937"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:33:16 -0700
X-CSE-ConnectionGUID: hqsCEgq7TxyRvjI12g9fww==
X-CSE-MsgGUID: InVvqoRgQCqKeG1tcqAXQw==
X-ExtLoop1: 1
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
  by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2026 16:33:15 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:33:15 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Tue, 16 Jun 2026 16:33:15 -0700
Received: from SN4PR2101CU001.outbound.protection.outlook.com (40.93.195.21)
 by edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Tue, 16 Jun 2026 16:33:15 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uo6uFTDTDHtS9mSlPjJlU05xdbNwJhG3XiM7TXFNc3LYVAOCl7sCkq/mJeyIOsWCm5VCy+UBlFZk05dEWBZonCOJJEKmNr0ueLlzg3OdQKDCzf+Z9hthYqYfCesnQRunhTMJK89RPjF/lv0rOfhRhxN8uj5fMPwOLrp0HO0rrZqMNLpCEoKzvi8H2b4cv7Hm2wMrTs9pqWBFMU9PfKrAhGMkjFIcv5Jbr5Gq9eOr5r/wZVYKI5TQEctiyXC2xhF2tRm0DnWcIeY49HROIK7fVLI4R/snXSTKhY4PRYAB2eDkRHr7UpkawAvRs6VufLRLnCyK68uQZwJzhPl4UdqaVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zxuRZzY9jkwEiuLGj4pHYwAK96L54v4IG86fZQs5N0I=;
 b=WoD4NOaQIVXqDkBCQWP1CZqoxYdIEo65gEXrOsqRMwl9HIKSFSlQWCf1butq8REdeZbV9DvJ7cCnvqfbQsXO/C6aNonlUfkgAkFunsCRfwnU2X1i7lxY0W/k6v6mQfVrRqaIj/W+X/YgqQobOWWoFLsaBcMebDMwufuNDPcORdfN5JcS3EzwaVI7k5gI2qd4bHGf6X0Xv6vCxJCQ7OTRRCRvqhfe3YFZdftd0F/ni5hD6H31Ppdso3nuRwbDLDdB3FZy8E4ljR+qxt3qTtlkzb93LXggujdsWlaXRIVXqdKYVS4JPKxE0eZ1lRyg78V4oxeUKemJRR80JF71UAgOeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by SJ5PPFC35D45AFD.namprd11.prod.outlook.com (2603:10b6:a0f:fc02::853) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Tue, 16 Jun
 2026 23:33:11 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%4]) with mapi id 15.21.0092.017; Tue, 16 Jun 2026
 23:33:11 +0000
Message-ID: <6273f424-9701-4731-9568-10b3eef8b5fd@intel.com>
Date: Tue, 16 Jun 2026 16:33:07 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 04/12] x86,fs/resctrl: Program PLZA through kmode arch
 hooks
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
	<eranian@google.com>, <peternewman@google.com>
References: <cover.1777591496.git.babu.moger@amd.com>
 <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <0cfd813e10072eefc8f4d84328e83bd9a6220ad4.1777591497.git.babu.moger@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0083.namprd03.prod.outlook.com
 (2603:10b6:303:b6::28) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|SJ5PPFC35D45AFD:EE_
X-MS-Office365-Filtering-Correlation-Id: 7edacd69-83dc-4d1b-d36e-08decbffa0fb
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|23010399003|366016|1800799024|6133799003|56012099006|3023799007|4143699003|5023799004|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: i7jbrQm7ILhHxv7wpcK5GMDoGcBLd5GFyedvaOrmxXQPQco0eKODQBofH4jokZEPf5xHHt4DAJ5MvQuynnRQUTO3YegFjv7nb5ICbxJKnAchWZHOJPzEO7gb1BEu59o/dqow/nFumPzf0IFEzDqpKjgh/yn6pcPPNyG5PS2SOnmVOsmESLkqRCVEEjjnAUM4MF1Cy0aS6iTUc5WyZOKz+FSt5OwZe/31X4uFhEuEnY4vemEzowmCNsniBcCIVdEp8zwTHuVIHh/mIDtlMKq5sWR9XmuqCjieZ1X17L1TUPACDFAYaQL/hkHL7xb0uEW67Eulj8XqLKId0K8aD52fYc6kC/ex+wa+BxsrqFfkRFCmewUsFlMpOxUgwxWSfCbca2xXH4kT7Rwuxl4F46gNVeO+I5xfYRmY3nAGRaAAtZpTLm/h+7PYACLEvsLunwOHNdiquCos3aV7HI5nLUip4nSxyG9t33B4EZ9/H7Klucr3HpxqanwhSL4HZbM55kXuzcX91svmG5WoXjvg3sZT/5/GG5FGBEOD8aNnPI48nkMJdhlGTcQhMpmk9GxX0wJJlRyl4Xeg3obiEsjzdyZqVAC5MK6FTGJ6HgzIiq/dfhkf2tZ0ZIujTXXICf0I42bI6bg1N+gby2kL/zSfrQsDGGOnwX4Ozz24eRUShIhYUYImq7K6607+IFpg4oDJklth
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(23010399003)(366016)(1800799024)(6133799003)(56012099006)(3023799007)(4143699003)(5023799004)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NzROd2VsWFFaTlVFbnRqNjBXdFY0N0pJTEpwRTZNRWNCS1hoRVJXZW92WWM4?=
 =?utf-8?B?REVVa2hqaGdSd2tPQmRNKy82eGlPT2lwWVhXVzJnMFY5ZU5sVkJUL2NvVUhj?=
 =?utf-8?B?SVBCQ1VrdEVjQXNXbEdxd0JkTzdYRkRHSFlrS0ZOd0ZmN2pQblFFMnJadjk2?=
 =?utf-8?B?WEdVZDIzdHY3TXRCdll6Zzk4U3BVZmlUZmcyRWhmc0llWUxtR0F0UTFpSkwv?=
 =?utf-8?B?czdDdVFUcVhOYXYzNDB2T1ZTTUVaK0U3dWY3b2g5TzExUHFOaVM4K3FWOWl0?=
 =?utf-8?B?N0lPcDZNb0xPQUJPL0Jadm4yRUdOdjdGTHpuWW5lbGh4WkJIM21hcCtoWUxG?=
 =?utf-8?B?ODRDb3dKanVvT0hLdGoxNE5ZSEJzcFZRRE92TEp4TkpvY0ttVlBUWFA4SHBa?=
 =?utf-8?B?bUlwcC8zbUxpeHZSdVNIa1NoNlVGNHBwTk45eVJjaUNqaGZjZXR0LzQ3aWNj?=
 =?utf-8?B?RmdveENlcmxhd2RVc2VnRW5WOTd0dlhjVWlWOFdJUy96Mm9yRGVjcTA3SXBh?=
 =?utf-8?B?bDE3YjFWNGpmL3JaWWdVMWV3cVQreW9Bb2F5dGNvYkh1RnlIUU53TEd0WE1h?=
 =?utf-8?B?OHJJVzdVOEY0WjRTWTRDaU85Um5mSXhJSVpTUzduaUZIdFhQc3d5SFBUOEFI?=
 =?utf-8?B?SHhXWW5tOGNDZ3ZQRk5tNWdQTkU3NTlJazZEd2N5R1JRaERxMTllWmR4Q0w0?=
 =?utf-8?B?WlY4WHIwMWNENVhyUHZHSlV4OEcrQ1I3ZjBCb0gzRWxDRWRiVSt5NEt3dGp3?=
 =?utf-8?B?ck0vTU1Ba0Y2ZHlJMFE2b05CcDZVRDFpNnNlNXN6OEVvSHBwMjNicGJjVCth?=
 =?utf-8?B?cUxrdzdWT0hUOU1PQ1RVSnlTa0laY1A4YkRCZHVIalpMQjNxZmxlNG5pV2JL?=
 =?utf-8?B?MzdBL0NZYWoyNXpmYkFEOFRYcVJIa2dIYTczaFBTWURZL3RBdDF6SWxYenJv?=
 =?utf-8?B?cG9XNmFRL2tHTlFGTWVTOXFFd1hlS3dPbDVKYnlyMFZ1VkgvMGJpd3RLK3Zl?=
 =?utf-8?B?UThXbnpqWnRXSkRERFpOdnZsblpnMFNWWTJJUlhvVWd0WDlaWkNRRnl0VWpM?=
 =?utf-8?B?Ui8yYzZ1OGNuTXNwRmw0TEk2STFPNUJoenorYW10YWg4RERrSTg3YVN4SCtt?=
 =?utf-8?B?c2RtVXUzYnA0OGMvb0lMcVU0c05aNmZpWHhMei8rR2RtbHlVZ3MzRHRwR3pq?=
 =?utf-8?B?WDlRZldmUFZLc2RjTXpYRWNJNzV3c2lwOW5yRWFESEplQW9Hc251WWJqV2V5?=
 =?utf-8?B?RWNQSTB4a3Y4MDRoSzQ3b2JXZDJmOHovbTFaSGh3alRuNjNhSXFYTWtUaHZU?=
 =?utf-8?B?NzloMVZSYWEzSCthWWc2MWxwRE1SbFZYNzFlekFHV2tXcGFOeWx5cDh5UEp1?=
 =?utf-8?B?NER2aXZSeURIUms4bXNFNEJlZDhHRVBNNUZpeUpOaUdtaHJSaS8wdEc3OENz?=
 =?utf-8?B?eVdncStDOHpvNTRFdk9uNGM0bUkvYkgwUnhaUnV5c05GVmovRmZEMitzVXIz?=
 =?utf-8?B?MmJnR0J4Y2hDcGFMSFRWWU5hNk8rcUFyUHNiV2hZVlpQKzBZQVpKeWNqdjdt?=
 =?utf-8?B?VUF6VFBvczVZeVFPQ0RsMW1sZmtySUU4N0ROamxDRzlxTmhES0FJZnFGWTZ3?=
 =?utf-8?B?UkduZnFVejQzdTVVS0lUZzJ0U1JUZUJjVnc0cWo4OVo3TFhnMElSdkU3OWht?=
 =?utf-8?B?NVl6d25Zdnd6WmJrd1o4NnlqYXpSZlhFSXI5ZlU5T3p1MmNrcnp6OHprZmpp?=
 =?utf-8?B?N29NRjRyTDQ0SDJGUHkwK3hLZTBsWGRzbExjalhkQ2Q5ZEhsajFoTUFwU0Fk?=
 =?utf-8?B?c0lWeW95U2ZCa1o1UVN1U0JNV3QyaDZ1QW9CVEMzOHJLTEM3V1hlaldqMHR2?=
 =?utf-8?B?alVPY2xBKzh6OTRLRS9QRXJGMDYxajVFVThUd0NGZFNseStEVTZUMUVuV05q?=
 =?utf-8?B?SVQwb3ROdCtmMzBjL1JRWEN4R3ZmcGpHWDg2ZVVFOUU1S3BBQVlwWWVhcmR4?=
 =?utf-8?B?bzdXdWluQlppMGdJWGNiQm9HU1N0eXRmVWh1K3pzSVdDVFBPZjJsYnd1YUM0?=
 =?utf-8?B?M3BDdXhtMXduejl1Sy9IN1ovMkM5MFVIRk00eWJQTHlrOGQ3ZUZsT1hna0Jn?=
 =?utf-8?B?bXlIWVNYNnA3UTJyK2RPN1E2Sm5XdzNiS1gyQlBGY24ybUFUNStVWHVXYTFG?=
 =?utf-8?B?dVhjbnFUMmUrUXN4UU5CbllEVEExcTJXOXQ2cTRZSUkvbmU2RzdUNnVIcTRG?=
 =?utf-8?B?RXV2RHdIcUt3MldkN1N1M0V2V050V2pEY0JaUVZBZjZ5NlhYT0s5cjMyTnQ3?=
 =?utf-8?B?R0I2b3RvcWM0dUwwZ3pnVUQ4ZEk1dk0xbVZjQWlyOGhqNzc4ZlZMU1p3RHNN?=
 =?utf-8?Q?w+KnS3exh7zTe1qQ=3D?=
X-Exchange-RoutingPolicyChecked: Ngm3PwFhu8feHHOWAZFozPdqdgQeYxwoxxRT+BKtegHd1SjGKX6qgLMh667S/MA4wqEeIeVfw1pqGkebDkPDcFtFj5LXldUR697pO596xRTLntPz3o4VLQ4CoIeG8+xZ/aiVswyQZZkm6TVbgT8nvqOcHZQ+iU9pis1oxcmi97IAX57AaUVa29iCEFB/u1i67IEtCweTAQKOM+/cPJjM0fyY+1p5FLiVFWbxnXS2exgRWKRDJ+6/heujp18iGHMh1+sdK7IcnYY/7T3kDwiFP431dxIS/pSBVPd1OFJ1ikzmzzt8FhUY4QRF+BpHDHSuhT1wETGIoVuyzIA2HHLn3g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7edacd69-83dc-4d1b-d36e-08decbffa0fb
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jun 2026 23:33:11.2267
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cMueEh6qbO8ohvNhou7MksxalhOwQgyNZyD9QQryCMBpr924+2y4Md35H9Kf7CL4AP60jYCZD4kA7Qr+E0Wr8D5i0OJanKAbzGDRwgM6Dxs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC35D45AFD
X-OriginatorOrg: intel.com

Hi Babu,

On 4/30/26 4:24 PM, Babu Moger wrote:
> AMD Privilege Level Zero Association (PLZA) exposes kernel CLOSID/RMID
> association through MSR_IA32_PQR_PLZA_ASSOC.  Generic resctrl already
> tracks supported and effective kernel-mode policy in struct
> resctrl_kmode_cfg, but the architecture layer needs a callable entry point
> that can push those values into per-CPU hardware on a chosen CPU mask.
> 
> Declare resctrl_arch_configure_kmode() in linux/resctrl.h with kernel-doc.
> Implement it on x86: add an SMP callback that writes
> MSR_IA32_PQR_PLZA_ASSOC on each targeted CPU, and use on_each_cpu_mask()
> for the broadcast.

Above is clear from the patch. Please start with focus on why this patch is
needed. 

> 
> The hook is unused in this patch; later patches in the series wire it into

Similar to previous work: write changelog in imperative tone and do not
refer to patches in series but instead let each patch stand on its own.

> generic resctrl when an effective kernel-mode policy is selected or a CPU
> mask changes.
> 
> Signed-off-by: Babu Moger <babu.moger@amd.com>
> ---


> ---
>  arch/x86/kernel/cpu/resctrl/ctrlmondata.c | 35 +++++++++++++++++++++++
>  include/linux/resctrl.h                   | 10 +++++++
>  2 files changed, 45 insertions(+)
> 
> diff --git a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> index b20e705606b8..68f1cf503904 100644
> --- a/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> +++ b/arch/x86/kernel/cpu/resctrl/ctrlmondata.c
> @@ -131,3 +131,38 @@ int resctrl_arch_io_alloc_enable(struct rdt_resource *r, bool enable)
>  
>  	return 0;
>  }
> +
> +/*
> + * SMP call-function callback: each CPU writes its own MSR_IA32_PQR_PLZA_ASSOC
> + * (AMD PLZA).  Invoked via on_each_cpu_mask() with wait=1 so the on-stack
> + * union pointed at by @arg is safe.
> + */
> +static void resctrl_kmode_set_one_amd(void *arg)
> +{
> +	union msr_pqr_plza_assoc *plza = arg;
> +
> +	wrmsrl(MSR_IA32_PQR_PLZA_ASSOC, plza->full);

fyi ...
commit 2232959db26d ("x86/msr: Switch wrmsrl() users to wrmsrq()") 
commit b5884070f9da ("x86/msr: Remove wrmsrl()") 

> +}
> +
> +/**
> + * resctrl_arch_configure_kmode() - x86/AMD: program PLZA MSR on a CPU subset
> + * @cpu_mask:	CPUs to receive the update (see on_each_cpu_mask() for online subset).

Why is the caveat added? Will resctrl ever provide offline CPUs in the mask?

> + * @closid:	CLOSID field written into the MSR with CLOSID_EN set.
> + * @rmid:	RMID field written into the MSR with RMID_EN set.
> + * @enable:	Value for the PLZA_EN split field.

Please describe the meaning of the fields instead the mechanics of the code
that are obvious.

> + *
> + * Context: Do not call with IRQs off or from IRQ context except as allowed for
> + * on_each_cpu_mask(); see kernel/smp.c.

Why is this context caveat needed? 

> + */
> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid, bool enable)

Please replace "cpumask_var_t cpu_mask" with "const struct cpumask *cpu_mask".

> +{
> +	union msr_pqr_plza_assoc plza = { 0 };
> +
> +	plza.split.rmid = rmid;
> +	plza.split.rmid_en = 1;
> +	plza.split.closid = closid;
> +	plza.split.closid_en = 1;
> +	plza.split.plza_en = enable;
> +
> +	on_each_cpu_mask(cpu_mask, resctrl_kmode_set_one_amd, &plza, 1);
> +}

function self has been discussed already

> diff --git a/include/linux/resctrl.h b/include/linux/resctrl.h
> index ce28418df00f..570918e57e24 100644
> --- a/include/linux/resctrl.h
> +++ b/include/linux/resctrl.h
> @@ -712,6 +712,16 @@ bool resctrl_arch_get_io_alloc_enabled(struct rdt_resource *r);
>   */
>  void resctrl_arch_get_kmode_support(struct resctrl_kmode_cfg *kcfg);
>  
> +/**
> + * resctrl_arch_configure_kmode() - Program MSR_IA32_PQR_PLZA_ASSOC on CPUs in @cpu_mask
> + * @cpu_mask:	Target CPUs; on_each_cpu_mask() applies the callback on the online subset.
> + * @closid:	CLOSID written to the MSR with CLOSID_EN set.
> + * @rmid:	RMID written to the MSR with RMID_EN set.
> + * @enable:	PLZA_EN field value for this update.

This is a resctrl fs API - please replace all the AMD architecture specific implementation details
with what the parameters actually mean/represent.

> + */
> +void resctrl_arch_configure_kmode(cpumask_var_t cpu_mask, u32 closid, u32 rmid,
> +				  bool enable);
> +
>  extern unsigned int resctrl_rmid_realloc_threshold;
>  extern unsigned int resctrl_rmid_realloc_limit;
>  

Reinette
