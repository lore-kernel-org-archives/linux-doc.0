Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9E43EC81F;
	Fri, 31 Jul 2026 14:59:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.7
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785509996; cv=fail; b=fyu1Y3dGlxW3OhZNLLOsA7bQblEwGOnfOULJ+FTANBJfIjkn7zr18Jop+YCZ+EWE1xBVBzb9fGhclP1/PYfqT+9wkR8/tW8+y2a7W2oD4G/xirgdN4peTmAVaFoqRwXpLeQu7P8elNsxS5gLiwZElfyAXg2TQ6d/nL2Xc3m5Cg4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785509996; c=relaxed/simple;
	bh=h15zfDGuIN6JqfZLRTzYB98sN9DXmfQ4iL8cXRf154Q=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=MuXfkM74GoZx0sMYhbIG0k/9fCwGnjNLDULunBt239n4W3rkEEWwGalJK7DoQ6ARwgF6HGFFb2pLNHWZ+vbIzPVvbkAwPz5VYcYCYvFYavmQvpncsfyDiCWGYaJK7RSBD2XSPKe1YYiI5MJui+id7WRIsACNFny3Qc/WzRgfuBA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=noczJJHw; arc=fail smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="noczJJHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785509995; x=1817045995;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=h15zfDGuIN6JqfZLRTzYB98sN9DXmfQ4iL8cXRf154Q=;
  b=noczJJHw1vot+Dw1h//tDwHaJY5QEbwb2Wsg3WdsVxquj2UM7BpNX55k
   WLAyYmaEAfI5QdtenPQUN20562dOzrpTcaiI9+4sD4DFZcQY5rDJtSLgQ
   sj7VLugX0UQ4KFd36WM9wvS2sJxOp3ERg15uW+80Q59U405ifOMLSJRXs
   jzM/h6yuhDZreFd+DBsVgCTkyZMN4BXEVcrpCqc97QYW45FkiEW03NmRZ
   N4BNJc8rArY0qguB1rF1iI69UrUwqDGEUs5nMFoK/Panj1XfbbjWfFmlx
   3CpqVuUnE7LQ1k5hVlKUYraerIseWfxUXi4Lkibr8519AEsVjC+qKDCzd
   w==;
X-CSE-ConnectionGUID: TYpvTM5qQbehNyImWiuEwA==
X-CSE-MsgGUID: O/9WcY6pQ1G/GdsFv7jpPw==
X-IronPort-AV: E=McAfee;i="6800,10657,11861"; a="111682235"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="111682235"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:59:54 -0700
X-CSE-ConnectionGUID: x6V5rBHlTS6O2ycioK+PTg==
X-CSE-MsgGUID: RHX/bdh5SACIlTKie6gnPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="290541055"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 07:59:54 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 07:59:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Fri, 31 Jul 2026 07:59:53 -0700
Received: from BYAPR05CU005.outbound.protection.outlook.com (52.101.85.39) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Fri, 31 Jul 2026 07:59:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=EnflvPm9g+1SK10BbVRu2h745A6g3stLnMEMO+zuTPJopGWwZgOvDHI5zDVJWR0u5iaYuArOMkP1koeqC+Oys18CnuYGQjBkY1JFKoYKZ/J7UmD0f0zYzHhXS5ngMzg5aoQ1qBPj4YHtIWYGTwhZMGubkivQLBE+c9GlAsVCh1+qd1tnk05g2l+uUWKU2JZHXoNthT5vfdh++98jFu+maamnbQR/bkMH2sJ85hZmXgh2mlFONRjpbSrEXgrKJ6ITJNSaSJQA1SM3NT80ZLMmqw6oDqEPjN5kusgEh0sLb+UcUd9Z9gpYsGhVewhxaBQPI04vNo515iPchzE6N1ygbQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5nL/O7H0QVDxEvwgMF0yUUwymTJvWFXqeHGl+Bv8dyY=;
 b=C5TXI+HMxUfvnVT+sZC/qk8uOtHlPQ7gCWwQMVCmGfhH9Au4l70DAtQHQY93YcowfWdjuaci2n43LIrLVU8o+m4yL83z0EoYAWynpzaq+o5FfDMxtW2epG7h9E4K9nGf7eTrjVyoTrcoGwPHFZ49SdsQ2QsIBrN5NIbstzyTXCrSTQz+bWC0lz99Sm3fbuTtYb2y437oJWgONvpTUZFtlmxvjLw4yWgh4CZOvw9MOz5+UlPZWIK5DZX4Jk/n5Fo2MtjzSAXK2FWBKdAx6JD6ITmzXpXQz7PkEMR1wyek+FbqPBiOTeGtixd1SjXP+aPBDH1cuJwegknBDBmrTR65bA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH7PR11MB5958.namprd11.prod.outlook.com (2603:10b6:510:1e1::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.245.10; Fri, 31 Jul
 2026 14:59:49 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0270.012; Fri, 31 Jul 2026
 14:59:49 +0000
Message-ID: <4bfafa1e-a7da-4c37-8da9-9fbba14106fd@intel.com>
Date: Fri, 31 Jul 2026 07:59:46 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] x86/resctrl, Documentation: Keep mbm_assign_mode
 "default" on boot
To: Borislav Petkov <bp@alien8.de>, "Luck, Tony" <tony.luck@intel.com>
CC: Babu Moger <babu.moger@amd.com>, "Moger, Babu" <bmoger@amd.com>,
	"x86@kernel.org" <x86@kernel.org>, "Dave.Martin@arm.com"
	<Dave.Martin@arm.com>, "james.morse@arm.com" <james.morse@arm.com>,
	"corbet@lwn.net" <corbet@lwn.net>, "skhan@linuxfoundation.org"
	<skhan@linuxfoundation.org>, "tglx@kernel.org" <tglx@kernel.org>,
	"mingo@redhat.com" <mingo@redhat.com>, "dave.hansen@linux.intel.com"
	<dave.hansen@linux.intel.com>, "hpa@zytor.com" <hpa@zytor.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>, "Eranian, Stephane"
	<eranian@google.com>, "peternewman@google.com" <peternewman@google.com>
References: <73737438-01ed-437e-846a-5aa8bd687462@amd.com>
 <SJ1PR11MB60835A80CBA4ADA35A617EF8FCCB2@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <7495c998-4f3f-4ea5-a383-350584afb42c@amd.com>
 <6d006c4c-907a-435f-ac94-32974562ce2d@intel.com>
 <e37866f2-974d-475a-b68a-8b74d6051dc4@amd.com>
 <20260730184626.GIamucAtZxMUUGagGm@fat_crate.local>
 <7d3dd384-9101-49cb-ada4-b8320198233e@amd.com>
 <20260730194328.GEamupYLsURg6VvxBU@fat_crate.local>
 <d364100d-45e4-458e-97d5-05416fbe5bef@amd.com>
 <SJ1PR11MB6083F7EC6D533C4E183D5876FCC92@SJ1PR11MB6083.namprd11.prod.outlook.com>
 <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
Content-Language: en-US
From: Reinette Chatre <reinette.chatre@intel.com>
In-Reply-To: <20260731003436.GKamvtnJlKydaEqstA@fat_crate.local>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0104.namprd04.prod.outlook.com
 (2603:10b6:303:83::19) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH7PR11MB5958:EE_
X-MS-Office365-Filtering-Correlation-Id: 0c8762b0-d0e0-4683-fc3d-08deef145e2d
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|23010399003|7416014|22082099003|18002099003|4143699003|56012099006|11063799006|3023799007|6133799003|10067099003;
X-Microsoft-Antispam-Message-Info: cX4CFcL9t5vHFvMDg9F9dumxL4Xti5SEtUE4PhBAA3FadbTDxo0SftIWlrcOWD850q97mwnHw636F6MLGzD78B0UPGsfP2WmJ4Nr9AUM3uRBYBul2mIzRM6H8kuSGtx+DVvUzpyJ7agDHxhZJ0dbgHYQyH2yBoqPjJQ2ug1KNG8KlQ3zDOCzwzOlo5jU9uP2Zphw0+ELUMCGUfziOjqDxgrXG7Inrdg5j9Pp1RkwN20qkRw5SRI5KfxdF/pOU5RtFKNMPIcL7vMqeMoQ8qMG9fyqqs1ECWUF+r8JQxl2UTlIC5p4MP760B3TjRUPGUsVaqHAjkKZzB7grBjjYGKYkNfoQnJRJUqgPcC3ZxCkPn39tPsZKgc47TdJgAKyCasKAjFhTcDQspC3UGWVdkM43sACMDL0Zs2Nl1TJoc2EUidUOqhxUpELrH9I5WJlTfPVUzgfQbq48iwDcQRnW3INhhoMCzLrsElc0fmEJ2Hatg5Acva4Eyy361Bl1OxJoBLOer0tvp6zDHjYzabS4FCL4dWl06MTWSX4dNfyRpLDEONtKsX9RdL30cVWCiZEg5SHq6cn/GUC+mwD6a46puqNYplHBRKiv/i0f4QceKbh/rGEq0munTmzP3m2gMB0myKdSk1tAmzyeSObH7kAnWq9wY/p4hyMSLMkpCetYdHqtzE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(7416014)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006)(3023799007)(6133799003)(10067099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NXpHOHJxRVBUNGtZZ2VLSjF0S0pWWFZqRlhyL0RPTUUrbHhPcS9pUW96SFpq?=
 =?utf-8?B?VTFnbWdub2NBU214Ymp0SURXSVBLYkUzY0cwSmxVMFpJNHh0RVIwSHJ5aVFw?=
 =?utf-8?B?L2hOV1hhQkhVU09TTzJUSmMzVERPSDVjRWF5MC96bE1aR25DQXdZK1pXNDFm?=
 =?utf-8?B?MDdvWFR0dTRkSzN6SWZieWtJZDRBREpEOTlYYUI2VnJDcUJNVEJOeFM0TDVG?=
 =?utf-8?B?RTBoYjcvajRuOWJrM1BKOVIzaDZ2Q25JSnlma0l0N1JnZkgyWmhnajFTU0xS?=
 =?utf-8?B?d01nc2Jmd3o4QUQ2SmQrbHNUMXpoZjcxdlJBY3hhSEJYUlFvaW5mZkVRRVVW?=
 =?utf-8?B?TDhMMUNjOTJDcmMyYWdXSUovVWZWZmduemRwYkl3WU5KaTczekNZd0ZPOWRi?=
 =?utf-8?B?YlZLa1RLaDhRZWFWS1JvZ2pHWFhiWjk5cEFiM3pmWlpFZE9IQkRXNjQ0NVBy?=
 =?utf-8?B?eGt4elpYRkhTTVFkYlJSZi9YSFlSeWVVdGFudGdrdTRkcUw1dVBpUzF2dEV4?=
 =?utf-8?B?NngrMGhrNjE3ODViVDUvSFA2VGYrUXcyZnhIYXFpaEQxWFdsaXVYelFITXdJ?=
 =?utf-8?B?NGpRSGl4OWVMZXFTTHA2bG1EalI5a05sV3VzeHc5am80eFREMGdSYm1KWVpI?=
 =?utf-8?B?RGJLd0c2OGdDc3JsNHVsU2E2cmtFSklEWXJzblQyVFdPZllHTjdWbWp1OW9a?=
 =?utf-8?B?VHBMRWZiMjZjbkw0c25aNjlBSmFXUFh5U2MxTW5HRkd3N2JEYTBTQjdJYWdx?=
 =?utf-8?B?UUx4Rm51N2txWUw5NVVXa2svUHAzdHQycW9ydzFtaXF1aTRBK1dSYTgrWlpl?=
 =?utf-8?B?eFlJT1ovU0N6M3E2Rm1EcnYzSVVVdHJ3Kzg2SEVPWWhyZ2xkU01zc3hyemZU?=
 =?utf-8?B?Q0VPMDc2RzVpWmY5a3JkS3lFdjQrYy82a3BCRHJjTldqOU5xWkNJRWJtTnJE?=
 =?utf-8?B?dDRabmY1bEJ1eEM2UjZFeWRsbTIwVXZYRGxEUUxMYTk3Z0RLNFBzNTVHY2pa?=
 =?utf-8?B?a251eGI2N3lXY3hTODE4Mk16UEpxWFlQaVlXMS9GTGsxUFFNWUR4bGI5RUYw?=
 =?utf-8?B?Z2ZvSzBQRC8zUXQyNnRLbWhOOGJJQyt6YVpRejgzYytnMXBtb3pFNk9CVmQ3?=
 =?utf-8?B?ODV0NGF2c1N2SE94aHVweDJZcmlqYThKaEhTeVJaNjAzNFVRU2lmcmhoTVhO?=
 =?utf-8?B?eTlNZSt6a1NrcEZ2TWFrN2JwOFlQUmVIczBudWNveTh5cDBrcnlDb0tuUm1k?=
 =?utf-8?B?a29DMnlrK3dFTHhYYlhBcUpBT01nN1JYUGJ6MXpEMFZWQ1JJbGhlZUhmY3hn?=
 =?utf-8?B?azVHSUdjdXllR0xKcFJPRjZ4cjdtQnZTdHJQWnFqQ1UxQ3Rra3lBOWd1MTFI?=
 =?utf-8?B?aHpVUm1acEVYYjBLbTFnUU1XNUVaVFVGKzdpMllGdHBnQThvM1B4cG1SZ2V4?=
 =?utf-8?B?N0FTY1hJcWpPSzMyQkRpM1lxN1A5c1dlSitKOHFGeGh3bUQ5bEdRais2S0c2?=
 =?utf-8?B?dnErcFl3UlA4eER6YytUbng4MHo1dGFQbTN5Z0w5ZUlSL0JnSzJEMVVaRitH?=
 =?utf-8?B?bDJmMkdmbTI1STB5RDliNmp5Um9YcnFTWjhwbWtsdzJhNlE1enA4MVZWTG5a?=
 =?utf-8?B?L1pNNEZFNnBKU1pvT3p1SHlSTmJVcjlzbWdrODRiQ2xESjJoeHdlcXNWNERZ?=
 =?utf-8?B?M1NxcHRvMkl5L3J0eTZoT05FODFmc2ViNmZMaVUzK05GTGkzRzZydUZQRFRX?=
 =?utf-8?B?NjVzSzNveHhMWTFDQ0lwUEt1d2MzaHVseUFRL2Z3Y3F2YTV0SldTYUpxR2Nz?=
 =?utf-8?B?QWdmQzBGaGRkaW1mYlZmV3BSZmVwbWl2RzFvV2dqR3p3d0JpUXZsUkpkWDFW?=
 =?utf-8?B?ajNrQW1mYllIb3dleUVlSFJsRDF0UzRueXl0V2ZtMjN5bVdrUTF1aVQ0N3o5?=
 =?utf-8?B?TnNlVWFxaEZoVnZMTjBPTEpLMHRkb1VuN280Mmt5UjZqd3FnWUs4WCtoajN1?=
 =?utf-8?B?L2QyUEdhNzQ0UTN0OU84eGhhRklyNkFXcjRrV1dOUkRvbFdkcm04UU5FZ0ls?=
 =?utf-8?B?UlRsMHdRSEdYS0hHcTlPUXB1ODI2NU9pWEcvSlBZc0RXMFF1YS9jdXg0bDFw?=
 =?utf-8?B?NFZMRjdua241NnVsYkY4dHN0L0E4ZldkVExxcU1aTCtwWlM3ZWN6TU1tdXR4?=
 =?utf-8?B?NDZpWDkxc3JnRUM2S05aU250RmZSM29wMTA2UkhyWmFzL3ZMQkRqMC9mcG5F?=
 =?utf-8?B?eHMreFc5SVJZWHNSM05ldjg1aDFhU3IwNWUyZzZURmlQb1lhU3A3S1doRTVa?=
 =?utf-8?B?ZHhFbjgwRmMrdVd6RjNnRERwZEpBbzBLTCsvMWtUcHdidEh1VlF4SlJmNy94?=
 =?utf-8?Q?Ps8en9ZzoZb8W6gc=3D?=
X-Exchange-RoutingPolicyChecked: NOae5ezeq2EAdKqeiIOhaAMIXiiouPgYrPlOMOUOTxjU4vlPI2SJCS2Gd36kko/hyQ0a0JMigeWPY2LXqayuR/X6+PY4YWpByDmyA1dsN5UqEp6QGSTcscigytGMAKQJGJrVFM0xJ2AUP37giLP8UAmwFgV2TNaM+jCugTO8PjcaTqbiYpnaoGnZTLiXvulW9waTgVxvl6F8wypUGv6xnS29SVTDA761TOCnXM9DY2Q7qkVyY56Q8gRS5xF3sA6rU2bGq23GfHlpWQvfHemWmgy/M5IY+VX/2d24RW7b0UyccX9GKLRVkGP+KTYTARE3RX5DTEr4d8y1YbVQj0nIdA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 0c8762b0-d0e0-4683-fc3d-08deef145e2d
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2026 14:59:49.4597
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3DnbBN3iL87zdVN2acPFrRe5FNY+6wCklewHQZTOt69QR6tRuyPyEzaHQULHf8c0QpZPrc52tHvqWP1tGl+WOxPFDnm3uhOv+KlR6jQzC2w=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5958
X-OriginatorOrg: intel.com

Hi Boris,

On 7/30/26 5:34 PM, Borislav Petkov wrote:
> On Thu, Jul 30, 2026 at 08:40:29PM +0000, Luck, Tony wrote:
>>> In either case, creating more monitoring groups than available counters can
>>> lead to innacuracies during measurement.
>>
>> Is that magic "64" enumerated anywhere? Or are users expected to just know it somehow (or find out
>> the hard way when they get odd results when using more than 64 RMIDs).
> 
> How is this done on Intel?
> 
> How does the resctrl code handle counter exhaustion?

The underlying implementations appear to be different between AMD and Intel.
On Intel side only the RMIDs (not separate hardware counters) need to be considered.
resctrl supports this RMID limit by placing a limit on how many monitoring groups
the user can create.

> 
> Do tools get some -E<error> thing in that last command status?
> 

The Intel/RDT spec does leave room for this to occur but a return of "Unavailable"
when reading a monitoring event is not encountered on current Intel hardware. The user
can always expect a value when reading a monitoring event (on current hardware).

Reinette

