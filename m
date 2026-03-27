Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE10324B1F;
	Fri, 27 Mar 2026 18:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774636552; cv=fail; b=YGcAAbO+5CYUW+IsPbbnALmR13G8lZg2rQ4xW6+UGdD3OjtJGELc4b4YDZbqN3SxqvoLXKMb6kIRS4WJxlg3s/xkjdPoyp0AYgmbWmOFMgiehO/oc7cvsrrEpJOKlqA65JS1gNICcFKIgSfr1WaEBwG29mkkfdOBwLdtAaxrZIs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774636552; c=relaxed/simple;
	bh=WxqkgYdrYgTR4iySL6hPkHgjglCvWGl7Z7cqX2V005o=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=d1N5v4i3q4QWHrIkHGBKTMdbhcslujcbqJBQPYOL8oISSghFlaB3N8o2vKmS/EnBtjRGhvv7c03TpAC5txnmvZQZNt2BgkIiHUrBhaDz4rTC/vpuw1xFSkuL4XE6LQTUkDRGje3V7bRaffgf1ACFjS4uXCy8UlVaD6zFUAB4I2o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QlaThwnM; arc=fail smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QlaThwnM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774636551; x=1806172551;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=WxqkgYdrYgTR4iySL6hPkHgjglCvWGl7Z7cqX2V005o=;
  b=QlaThwnMvPMwLWBikRvAK9BVpTqsQ9nOpTK4C9P531WOgko4jmfrMfUF
   cxsUp99hxl5QdRjv5uSS27Fb3GwFthjQeLR6kZkpO0jOZrjhbXsZt+Mil
   9q64MstIH7t19Hqtoi/AyaSfDIC8cL0auoPwM+GumqbtPCt1M+AcABBCj
   tN2qhz8in9RKurOq+7scXyYdqJPVX+qwXGy9igi7L6lbY8lf58WMt4dA1
   vJYTiKHiJzH61Y9LHLqFV2CqJfrHoSWC3UMr5LC5yyVyIlYwawQOeCvl6
   AzXfgEbc+AuBJjB927DwMpFqyJs/UO0JOmQK4S/a2ngekjKbyeOMS1agj
   g==;
X-CSE-ConnectionGUID: 3VwWFd5aQmGlToB9n8ru0g==
X-CSE-MsgGUID: ptYhahWnTaCnIROIkCJTew==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86022333"
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="86022333"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:35:50 -0700
X-CSE-ConnectionGUID: XAW/39r0TiydMEbdhezfug==
X-CSE-MsgGUID: aIKGCGXWQgeVSsiZKRzLRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,144,1770624000"; 
   d="scan'208";a="225304478"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
  by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 11:35:49 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 11:35:49 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Fri, 27 Mar 2026 11:35:49 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.13) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Fri, 27 Mar 2026 11:35:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BKPpfMVAm1K95e6jkcgTLm1oI39GZw7cvWaiJNKhf+IKzGlRoOVeSoxd7odBBaVBf0aQwLUXuQgQ2apVIZ3YW421Oikpni3Soqtj87VWKOwqMqkNzGRqiVy+1Krnko9JWwPbGZTQJEnuxP1aPUGciCSVVE1dlwli0r5D+613NkTHweJNfGc8B6L5KUeqc9hBfQXdlotjvXysiA2UafgnjkvvjFb86ONMHQl7wxMwJ8Ks0PbMAj4sLUURRTYZ2k0QDkJneehEYhOxzthyp9q5KV67HcJIrnQ7uiuuzJSKSIhgLrMb3iNHi8/IkioofHixOQbJ3tGg2t9NpRJ2LOJW9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EwjrstgWiIA7vvofR2cnCgY+pqk3XsNOD1xYlcOPktc=;
 b=JsNCosm9W5Wdln0L4Xr5AZJqR+buReIxGzyHxr+ygSieiV6YeUtKZKtJ/mDTrmp3Rn0OZoWOINbYaetfzByp0FCIJdmiqtu92oktsrcYhm21AjAJQMMAMOjVZ+Is9sfxxr+fsSz5zE7TPIMsTuokeKIggqDQ8vamfIfCT8aRIqS0VVh8DnnoqGGjdEjoTy0+WTkfmfVha2OAZ11PfijGUmxIzn8mvCmSGAwrPnxUoru1AQNsus/KDkkE7IoAGeI+S3LRYVW92ba9GNbJGSPjasf0PetAt3x3gYqQFVdjZ0VexV3KGJtQp4LYLMYcuNb0i/Bfsww5f1bV+66QYP+y6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 PH8PR11MB7118.namprd11.prod.outlook.com (2603:10b6:510:216::6) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Fri, 27 Mar 2026 18:35:40 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9769.004; Fri, 27 Mar 2026
 18:35:40 +0000
Message-ID: <540ceb4a-fd54-4e95-9431-8f233252259c@intel.com>
Date: Fri, 27 Mar 2026 11:35:39 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] doc tools: better handle KBUILD_VERBOSE
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>
CC: <linux-kernel@vger.kernel.org>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, Shuah Khan
	<skhan@linuxfoundation.org>
References: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
Content-Language: en-US
From: Jacob Keller <jacob.e.keller@intel.com>
In-Reply-To: <7a99788db75630fb14828d612c0fd77c45ec1891.1774591065.git.mchehab+huawei@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0080.namprd03.prod.outlook.com
 (2603:10b6:303:b6::25) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|PH8PR11MB7118:EE_
X-MS-Office365-Filtering-Correlation-Id: 7827d800-ed46-4780-8b08-08de8c2fa5b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|18002099003|22082099003|56012099003;
X-Microsoft-Antispam-Message-Info: drrwbqhZ5hqa2G2eVhteYp3HuyhIhz4cMUTZ1pxoo5en3RK4r+nzYcNZFe9WcJWLJnN4sZmjrTIJvGlj4aMHoge+FCx75fdYURaJlXX9+rpmpGkSq7BB8OPaHV4HyTPbVhN4C51/xvjBZYcfax096FoojJChHvGSlfKdMiRflrkZ77rRDEadHRasQo61gPDgyeEOfgX15HDFIK+ucLRJf8PL4l3e9QQxhnZUvYTCRija6QAIrijJO+v9um0d8jtu38deeHhek7PILoJksJIofB/eF3vc3PTWUCpgSv97wpQawIIiiLxv0dcnzMoImV5afomGFLvHwJ/XB+LHqFccvZGXmt15G8XcKwMNCkNLNNioHgEmpC1duXAKcsh5rHlxWOyxK7Mk/dgGP4bV7CFMvgjU8Xp/hPTXrDDxvAPxN0BORue2Ftrz0ZWrbiG2UTHPHra76rNVrGkpDWuOZfKJS1mdkWalpA/IQS2v+5p2Z3IFjBcZj3zzY3cWnR2/xBP2wUyy+JmdA4bGpu32OE9ziyuDT1rq7TQ5O4JRgWxQhD8oU+iXzvCUqQkbKhBj9243S5qhkUp/KUsfD1LASxjkEAPcOL1d7tOmxWwhphkiBzh39w3KTsz/FomHbQ8dYAJthlcWW034OhsRAunwcYhuT33j9iQ+Z1EO2eA0U/ylMTyGY8z4wBMlTkC5FqeSuAKV
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7579.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(18002099003)(22082099003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?am1pOTFETVJWai9NT0s4N0JHNjRhS1JLLzYzdlFPU1pSN2VXZlBvYmd3SEZR?=
 =?utf-8?B?UkpZdFhGbFVmWURlcEpQL2k1YXFwQUpCSDJobEg3MTVURC9hMEt0N2FhZnM2?=
 =?utf-8?B?dXYyMWFFQkhFTHpCek5TbTZBelJXaFRyNk9PWkVqMVZIeUhodWpMTEVwaWx1?=
 =?utf-8?B?MEpyOGtOWm1KTWpjSlJKL1BrdmV3QlFhakgrTDB5R0RVVWEyVWI3OFlNVjNB?=
 =?utf-8?B?ZzhCVFdsVHdPT1E4bTl5TnJEeXlZZVVKYWJEdWM5cWFuRTltL3ZzaEtENk1m?=
 =?utf-8?B?VFNpYVhJVmdPSXVHSUwrQk1KbXQzWk12N2ozTjhzNkF1K085MWZ0c3poZ3Bu?=
 =?utf-8?B?T2FXUmJ4N1FwVVF3MDVVcldrQ3NvV0hZMmhxN0dwZzRFMUlOdURLc0d1NFI1?=
 =?utf-8?B?TGF3QWY5K2dicHpZSnYxTzhUbm9KU2RYcHN0L1ZMT3JIRXRmaVdwMnUzVlhW?=
 =?utf-8?B?OURtbUNZUU9ockJJZWhwYkRScjBWc1hvbldYeVdjaGUxUENJOGVMOXF6Q3pm?=
 =?utf-8?B?eVNTSFpaMFVQRGxxNnJMT1BtRzlQdW1wUCtiZ1JQcmxvUCtDYlgxUGJnTnlv?=
 =?utf-8?B?aFV2bVdGdmNYNHpOcktWT1FEWHg5Q3RuR09tblRhRy9HQU1UMWRvdG5HWEtT?=
 =?utf-8?B?TFI0OHZhcnN4RnMzaVZRSEhkbUpjV2s2YytDQ29xVHRaSTlWa3V5aTdPSjBl?=
 =?utf-8?B?ZWJ0VDVzZm9WSk1lQWw2dzVaV2xxZ25mQ0J1QnZFc0Z4MllIeWJseDFEZTUy?=
 =?utf-8?B?VkFGamNybFJkQ0M1QldKZEVGcER2bk1EdmU3a3NmUW5TNlNnU09MckN4T3da?=
 =?utf-8?B?akRxa3dQNTh4dDlOMlhGakErKzVHZ2ZmeXJYOER3OVdwdUs5L0lsMkJIeWhy?=
 =?utf-8?B?ekhKclRHb2N0WlpqS0M0NkpaNVU2dWorZVh2ZjBGSldBeTFIeUVzeDBaUHM4?=
 =?utf-8?B?NE9xb2VmRkZGUzFTL0lKbWwrSFdjdHhMN2hXVXl4MC9jNVY2Y0hsRFpyMXNy?=
 =?utf-8?B?ZUYrcW02L2xXeWxLMFd1RzdFY0ZuRDJWaFpGYlRNempWbUlIUkh1VmhUWXIx?=
 =?utf-8?B?MUtwZjBRbUJ2YmUvSElLc1hGYTE0Y3duUGNVRi92S093aVNBdnNYQnpldTdv?=
 =?utf-8?B?YWZUeVVrMEkxVVJRT1hmZTA4UlUrMXZ1cGNOTFN3WitQNWJXdkd1M1VHSlM0?=
 =?utf-8?B?cTZENk80OWNpeHI3MWk4c0NDaTVmQUtBK3J4QjRHdDZTbElHeFRDcm42QWRi?=
 =?utf-8?B?dnJRblBRdDhlSGdYNm8yNFZyL2pTUEhaRFplS3pxSjFSOUxPZFpvbkFPYkFO?=
 =?utf-8?B?UDJhTUFJS1JyYld6Ykd3QnM5Y0xhcFpsTVREVnAweVVlR1podXRnZzNwbndN?=
 =?utf-8?B?alV5YUgzWGJnWmZoOFJyRjNtUWZtSTRNY3YxZVhoRGdpbG1aTVJad2toczhx?=
 =?utf-8?B?OTBlZTZoYjZhZWhpczgzN2hEbmdGUFY0bGdRNW10cXlyMy80ekJHVnQ2dzUx?=
 =?utf-8?B?bm5tL3VhbXdGSkE0bGJ4YnNCMDRKWDlqNTJESjVROG14ZGs2eHRiUmpoazRS?=
 =?utf-8?B?RUlZQ1JweUpzOTdaYTFqM1NyQzQyN1N4b21ZeUVldUJEL01YU0doc2VKSmE4?=
 =?utf-8?B?dm9HbHduMlB1Rm9YRmJsWnBsYWV0cE53YWNkS2JFNzlKdCtZWGJEMGRMU0Q4?=
 =?utf-8?B?UWVtMDdkdGlhL3BIbEJwMHRTdm5jTWlHcktya1N1Q3YyU0t3TitCakplYnht?=
 =?utf-8?B?NDZuWGRQMHUvcWU3TFZIR0xPY1RHdktTVEtUeHZuOFZYQUMxZHJHakJXanA5?=
 =?utf-8?B?TC9lenRxcHJUT21tR0lKMFdNS21oTHBwOUR0R3FEUXM2T2RoYjZub1VSQXg3?=
 =?utf-8?B?bVRVUVorSmpBWEJINkxDR0UxRWxZQWJLRXo0VTMzVmpFaFB3akI3M0R5NWdF?=
 =?utf-8?B?cjEzVjY0bEVaUE1kMDhtMkxUYWxzT3pub3Jmdml4dlA5cC9NL0c2Y3Mydi90?=
 =?utf-8?B?RFVaZlF2ZWtYbTFRMWtRam1YNHZDaXpjZjZveTRlaFFqVnk0anV3UmRndlFR?=
 =?utf-8?B?WTdadDF5K3dGdWd0YVlyOHNGckwyUnMxcTZsMUFad0h6bUdPMThQV1RYTmor?=
 =?utf-8?B?MTMrWmo2MzVyazFkSTNtOUdGeUtYUkhOdHYxL1FQNlRmVzZvTExFaDdPTWc2?=
 =?utf-8?B?cU9XYWIyU3NrNTFYR0I1U284a0U3d3kxTGh0RXRLQVB3eDVtdnR1S2pESFNr?=
 =?utf-8?B?dVJwZHphbzZTRElxcHJvT0xQNEVWUGk5cGhKMEVNengvL1V1dHdKTWZ6WWtw?=
 =?utf-8?B?K1F1MWZUY2pUUTZXOWhsTlpWb0F3VndEVFZsQlNOeHhJMDBuSnZ5dz09?=
X-Exchange-RoutingPolicyChecked: XHUOXbhBGLRyYY8Qtd59zUxrqFPUIWWMB0CVHWG8udx8h1DcouELjxuZ4d3JfTafkJZwrKE3pT1seW2FLnDgFfYcv2FVGZXS8MBkUY4iVXBqZaUN8IAdcNyCZzBtbPT4aMR89JKj6qcpotnqAmQjJgmA+751yMh9jlbeBe1qKN4PFbRiWyHFoYeDmXHMHML//nAZtppRlhUmeuRH0/ZSkQl5IVVGAYIQX6CmSV2Fc95o7Bl1xZMpo5TiLMQpxiY/wRx/wSoLiipJFLW3Ec0QRSKL1/SlIowBeevHT8XplJXcIUWdEPLNifY+i1qs2hpWuggrRcWGYoNGG5EMlUk81A==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7827d800-ed46-4780-8b08-08de8c2fa5b9
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Mar 2026 18:35:40.5937
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tsVCabu8C8c01N2f+hwwa5tppoANjUV0UCaMki7K7ghvn5BH3V/6RJCdpOv9PhEDrKk9dcFEYbJ7Be34fiulyBvdlvGn8XtKWhuacz1GOtI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7118
X-OriginatorOrg: intel.com

On 3/26/2026 10:57 PM, Mauro Carvalho Chehab wrote:
> As reported by Jacob, there are troubles when KBUILD_VERBOSE is
> set at the environment.
> 
> Fix it on both kernel-doc and sphinx-build-wrapper.
> 
> Reported-by: Jacob Keller <jacob.e.keller@intel.com>
> Closes: https://lore.kernel.org/linux-doc/9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com/
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---

I loaded this on my system and tested the build works as expected both
with V=0 and when I export KBUILD_VERBOSE manually.

Thanks for fixing this quickly!

Tested-by: Jacob Keller <jacob.e.keller@intel.com>

>  tools/docs/sphinx-build-wrapper     | 7 ++++++-
>  tools/lib/python/kdoc/kdoc_files.py | 7 ++++++-
>  2 files changed, 12 insertions(+), 2 deletions(-)
> 
> diff --git a/tools/docs/sphinx-build-wrapper b/tools/docs/sphinx-build-wrapper
> index 2c63d28f639d..1bb962202784 100755
> --- a/tools/docs/sphinx-build-wrapper
> +++ b/tools/docs/sphinx-build-wrapper
> @@ -238,7 +238,12 @@ class SphinxBuilder:
>              self.latexopts = os.environ.get("LATEXOPTS", "")
>  
>          if not verbose:
> -            verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
> +            try:
> +                verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
> +            except ValueError:
> +                # Handles an eventual case where verbosity is not a number
> +                # like KBUILD_VERBOSE=""

Strictly speaking I think os.environ.get() will handle the case of an
empty KBUILD_VERBOSE by converting to the default value (in this case 0).

The intent of the comment and code is pretty clear though, so I don't
know that deserves a re-roll.

Thanks,
Jake
