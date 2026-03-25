Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A3E36CE1C;
	Wed, 25 Mar 2026 20:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774471377; cv=fail; b=TB1QSQ+rJVxFZpDannZd1+3YLC6l1Zhtqr8PbRYpJP9mWyrBHlgqJ4rCRy/OH9ojmoG0z30T8XAOiYqMbtl6Nq2XLlkY2v/Isnyc7Sa1PnEVEkFkPYMQcqBX3jm7D9+Z5jdjWIuOU/jQDTqAzq4togJI2lp8QnGn5aDLb5AjMsY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774471377; c=relaxed/simple;
	bh=eB8fR9VTbuXexLi09FGnnRAt+Nzb2wZ7OynF3MntTUY=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=CEWrqy+GNY4LJq7HlK4AfwCqlksWOWfCf+uzufGOuiofvEBhoyL3EWWe0xWb73EMXJCeWEGBG0Ef8rC4iVxvgiB0H5lV0kLvKN4lDs9CcGO34nZ+nrwfvICbBd0qnJ3JVh5aFAHe3gGOZedELmgMtNt7hM6I/L23YFJ+gd8/+nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XMHitC6q; arc=fail smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XMHitC6q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774471375; x=1806007375;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=eB8fR9VTbuXexLi09FGnnRAt+Nzb2wZ7OynF3MntTUY=;
  b=XMHitC6qy3CUzVW0/1uUqWiflkN5c5LoIiXeoCHvPH0jBp6Joe2ctZLG
   Wfczb2wtEf+4uMbiSvGvunaKcoiPT0iSH1NenINdmL6Rq7YA8uWNdPTua
   Tj/q6I4gQp0UJrBVFr1iw/YR0uRPe3Zxordf0d1Vl8XRTgLGP3eGdNDF/
   Jg1dj+bMUddtE6Qf/ct7IyNIkJKWiB0aWnitgvN+04+fRIDlYVMSqFUOa
   s/KNGfMuYWfpqDgmETXRNJMklbG/ggJyVp7wjuIxraVxS0r+NPLuFpxd5
   tFvYsNwgRt8qOHv2dsa5dGSGNvT7DpJu0+KcooKvO18cxBNNH3pFqW7/+
   g==;
X-CSE-ConnectionGUID: VPTyEqX/QDOIdF7Bz7ytsg==
X-CSE-MsgGUID: ykwsV7JPSMyJzRPRNSWfQQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11740"; a="86999894"
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="86999894"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 13:42:54 -0700
X-CSE-ConnectionGUID: aa8iZIT/QMmXr0AxlqeYdQ==
X-CSE-MsgGUID: 79O42h4KRrqq66E2FH0hjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,140,1770624000"; 
   d="scan'208";a="226424868"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 13:42:54 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 13:42:53 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 25 Mar 2026 13:42:53 -0700
Received: from BL0PR03CU003.outbound.protection.outlook.com (52.101.53.61) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 25 Mar 2026 13:42:51 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IwQHusuktbBf/HjhooJb8texI28Pwxd6MsLrWY6pU3t4CDEELtP7MueVHkQpTVTvK68ybcu+xzln3/EkLRYsEx29n9mNZJW0kXzgtgwaclK0yhQVRM9f6sB1bKcDhC9yYCD1jzb/onf1FGjxnkWrh4Cx3xAPvXfik5raWyR1Rl/ngmGgzGhOnB2LdXAB2RmVb4ELMDWL8jbg06tMisKkBqGRnRje/uHTX69b4C2JOktGnEgpowPSTEHaZsQbhRYjR5rgFCqCfDfre/voVVMQcWdTCoUogtaTCGEJNXf9j8I/Q29DcmkoQDy/mr7Hl+t5YTicgrJU6UYr1voQKFwLJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EPW0AdwKW+fs+jrla1KwmO9KLvuOh80VLSYmNYMB9Jw=;
 b=hmaoitncggXAhyT9x03ofLcxXs1h7qC/hGcdE1R7/8u+s5AmOhFtLxKi/TqrPMhFLnCibeEm4LBdvMGDYyeG3eXkwMMm8UDXxKIvlQTE/vcwKjmvA0BR0crRI9X2xyMcgAeqale+RYb8JmbnzjEIIE85ONlj9SDoetYu5d/JIrTJqUHqdpGXW4rjUeg1IRCSmAHcAeKxRrd/kxuFmEiVNGTogsxqPQIfPOfZArEosBZOwAmnmcSurZICMnKKganALKVctir3Yf5nma2YDMDOi33dbarJpFS6WeKoMBEFmVQwXrNX4Ea7rjHBBdgJXr1DgI5LsYulqkAbf4Gr7o9LhA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7579.namprd11.prod.outlook.com (2603:10b6:8:14d::5) by
 DS0PR11MB8205.namprd11.prod.outlook.com (2603:10b6:8:162::17) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9745.20; Wed, 25 Mar 2026 20:42:48 +0000
Received: from DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e]) by DS0PR11MB7579.namprd11.prod.outlook.com
 ([fe80::4199:4cb5:cf88:e79e%5]) with mapi id 15.20.9769.004; Wed, 25 Mar 2026
 20:42:46 +0000
Message-ID: <297f6ef2-1760-4b85-a55e-73a2f061d641@intel.com>
Date: Wed, 25 Mar 2026 13:42:44 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: kernel-doc overly verbose with V=0
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
CC: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List
	<linux-doc@vger.kernel.org>, Shuah Khan <skhan@linuxfoundation.org>, "Randy
 Dunlap" <rdunlap@infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
References: <9367d899-53af-4d9c-9320-22fc4dbadca5@intel.com>
 <20260325125020.533f2042@localhost>
From: Jacob Keller <jacob.e.keller@intel.com>
Content-Language: en-US
In-Reply-To: <20260325125020.533f2042@localhost>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR04CA0176.namprd04.prod.outlook.com
 (2603:10b6:303:85::31) To DS0PR11MB7579.namprd11.prod.outlook.com
 (2603:10b6:8:14d::5)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7579:EE_|DS0PR11MB8205:EE_
X-MS-Office365-Filtering-Correlation-Id: 7b4b2a44-5c78-4dbd-24ac-08de8aaf1223
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|18002099003|56012099003|22082099003;
X-Microsoft-Antispam-Message-Info: OAeuKmEWRM+d2fOvnutfN9llK/odDMzoyF2/RWrFB+0ON59ThctRfWJzcokh+GmUwMvJSRjMHYVb3rzG10vl99xJ5orthePeOpGCXc61b0V0i1+4FSHbIFqg6Ka82Y9tpjSGbQoUKdgqcRAGjPid9CgLYIQqVkajYRAo0jWOhCB83kDT3Nz2dhC8BLcfNS6SskWvMXQpUySqQdRqHWszse4eZ1f8p8jfRxgJRTA2YEX1NlUYqHCFPfOOp5Re+PKecoQn3U5JoBYYgz8T8PqLHSP5Rh7MF/PAP+35SRlwKDP/acHm8pa6yJkOPMPAFQfKCMzuh0d5PoOdNA9uySqg9PD4ED3DeBkJI3pPMt9Dw8IiWWgvz+AcO5p8P7W/aUP92zmWGmjsPhtsh6mqNFmlgOpcOdRQHUpZq7wJMsMhgzd4wNci5iKbP43FFs6VGlP2CCcq4I+2JGZdQP8kIcqU/30EIx+tI6r+/k1LzvO9PWmZccUA6ER2bGRqVcajPFl6WPDTU094k8h6Hv7gyLlJdY5X+o1TIQrmBSZSndfaBwn3ubKXFPD/YkTEI4lqFncMVeyHf83jbvxoFn+n2jmiETSpD/UKrQEucGbROhXqW7xqKu38LYV+s2SlYYY6kHHp94I7zFWJl8OQ0eQUrU4LwNuTRi90txtJZ0FAygm3c5Zx12X+BwMY89Y6+lOWW1uK/snhnijTUjpulpmL8huMLGdBvp6+4Vr/VRaEAxyVbik=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS0PR11MB7579.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(18002099003)(56012099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ak5iMFNIc3ZhVFkrYkFjQlZwRzJlK3NybVd1RkE3a0k2cnJxZ2szc0xzUy9T?=
 =?utf-8?B?M0tQU2hVR3ZCSTJ6aHBhZk1FQk9iaUU1NE0wNUJVZDNTTWl3VC8rNkdDQUpJ?=
 =?utf-8?B?aG5mdGxpMlZnOVFCaEF3RDhTbUlFcCs0RCtVS0xyRklyV2lwUTlyTlFSbk9S?=
 =?utf-8?B?SWRQN3E3QXNwc1N1ZGJHV2hhcHpVMFU2ZkkxUmxlOXdXQXQzYWFxWlNuT01P?=
 =?utf-8?B?a2JJQ2pieEtFWkZHNWZvK0N2M1ZCRTlCeFFKQzUzVFVQbmJQZ3FsN3lGR1Fv?=
 =?utf-8?B?eDdWMm5DUXVzSzc3d0V1VkpIMkhadGlEblk2VWIrKzRnK3hZZDg4WmltWGZt?=
 =?utf-8?B?T01GSUhjUTkrclZtWUcvT0Q5Tjh0K0UzMDFNRTFPS29nU29nSTFvNkpOVWFy?=
 =?utf-8?B?azQxZU1TZkM5WjBabWxUcWhCSkxmNEswZXF1RVRHMk9oaWdYVE9sdVZqS3hO?=
 =?utf-8?B?MVBNR0pkdkJQSnJoSGd2a1RyblFnNDAxQU96T2x2a05GWm0xV3dGbU8waXhu?=
 =?utf-8?B?S3VQM09VZmtXSkpNL2FwdDRUVWZaejluV0NCZVErTGp6NG9vSGErT0Eyc3FV?=
 =?utf-8?B?a1JhTTlUWXpXMUFUc2JKT2FJOElnZk94TzBkK3BNeDF5T0tWd2RieFREYlJB?=
 =?utf-8?B?SC93VTU0TWY5WlBnam96dEF0bWFNSXFqcWRTNzhteHoyMC9YdFkyTGh1NE5u?=
 =?utf-8?B?Z1FKZnBhYUlxYWhwRklLOXV2bzVPczkvSzRWVVBnb282eCtHa2hYb1lHcVVU?=
 =?utf-8?B?VGhDa1UxeWVUNGJtY2FlVXJPTzZIdmwySlhaR0tzOWRWajArcXVxbURoRWxM?=
 =?utf-8?B?aEszSXladk9EOTVsZXdzUEVVYnVSVUpLM2ZvOEdMQUtMRjJjQ0RwQXdzQmxj?=
 =?utf-8?B?OEFmcmNaUlhmTjJHckV3eGhWVUNKa256eU1rd1U5ZXhrRXV0OVd0VFhtMVFN?=
 =?utf-8?B?bnJZRW45ejFVWElPWlpYWmZEK0lkRjhzMTFzTVQ0b1J3NXFBNWxmNy9VUlBj?=
 =?utf-8?B?NUs0ZzRrQ2JjamtuRVlyU3ZXTHc4ZGRDS1Nja1UzYWc3Zm1uaU85VlUwYVhH?=
 =?utf-8?B?WE5uZ3R3T1I3WW5XWndEak9vNTNPVERkeGJTNUF5bjdsbDR0ZFpaUkR2ajdj?=
 =?utf-8?B?UkVIalhlZENBWjNCQ2ZON0RSS2dXK3FBbzJjUHdHUFVGWFcveUdheVlGdkw2?=
 =?utf-8?B?NmN1S2dBOTdZcS81UU5yRXJleXlJc2p4eWorVWgvWjNHQlpyRTRQcHBYNVVn?=
 =?utf-8?B?SnVnTlRUbzMzcFl5Z0ROK1NiQ0lQVVhIcWdlbDhlNnhPdngzZTNwdGJIR2do?=
 =?utf-8?B?TFNNZlVzUlN0R1pQM1dPbnpNcDg0S3lQdjk4cHVhVW9ub2dWclUvQUw1Sndn?=
 =?utf-8?B?ODNNUENrLzBybTRYLzlhVHRBZkxwK0pvOFhRRUxNL2R6TExWSUxmc3BxY1VL?=
 =?utf-8?B?SWF1cnF5cUE4VmtCdHBXeHdVUmZmMGI2U2NtdjB0VFRYMnJtTUpHSmdQTC9q?=
 =?utf-8?B?eHRTSnVtUStYQlpmWGNWVkZtbVdPWDJDVnNLL1NnNUdQQTFDNUU4VTRTUDRa?=
 =?utf-8?B?N2laL1dlVi92Q3laVHJXR1pLc3MrYmJIcloyc1NIcE1wR292RWVJR2p6UE8x?=
 =?utf-8?B?WmRPQnFrUG9iMWI3M09CRllCTHpkbTdDcEJ2VWdxN3lUaUNYZkw3dGFTVzhR?=
 =?utf-8?B?ckpvcXZEZmJTTkgxZVdEVFdRSXE0aFJmRmpEZUV3S2FBZHZqQ2phOWNnSTNs?=
 =?utf-8?B?dHErS0l6bFloQWEyajgrdGUwdlFLRXBURGlkdXhuN0J2TDFSeXZyQ0l0Qk83?=
 =?utf-8?B?T1pLSi8xcFEzWEtyUldNMkpCUGJGSGd0VE1Nc0EyQkxmMDhCanB6Zm9PNEgx?=
 =?utf-8?B?QjVPTlAxNmtEaXlzMnMreCt2M3BYa2ZLVEJTL1pTdXVhME5KK3ZoVnZYOGpW?=
 =?utf-8?B?VitsU01LNzRXU2VXNzdvMFRVVDhwYVNIMGZ4VUVscXZ5Rm52Y3JjR2c4STVM?=
 =?utf-8?B?dUJtNm9uK3Y5eWtFZkpSb3JFTDc1OGxLa0R4R3hycVZ0SEowZUNZSUtEb3RZ?=
 =?utf-8?B?a202cnY1V3N0YS9yc3FYNDNVUysvdzdPdXMrV2paQVJaT2s4dlZpd2hUMDd6?=
 =?utf-8?B?RHNFTFBqK1ErQmJZdnpESHZFbzdVNGFJWHd2aEdWOHJQQ0JrTjVGTkEyVzZJ?=
 =?utf-8?B?SGlFWWFsZ1NOdlBxMzRSUFhzaHBXWW9DdXpvdGlJVEd6ODZCbGh0dFExYkwz?=
 =?utf-8?B?SjR6UTJsenJNS1k5clFKNnZ4d244UU5EQWI4R3IzN1hOam1yUnVJbVZ2cTdF?=
 =?utf-8?B?Zlp2bnpRRVJKVFl3ZExoRW5XbmFFTXRWVUxTN2Z5NzVtaDFwTmt1Q1ltWTJa?=
 =?utf-8?Q?EQuBeARTSJ9gqa3M=3D?=
X-Exchange-RoutingPolicyChecked: I20qj/waM2TzyaAbO0SOiRVS6VZjDIP4iM7rcMiLkTS9Dx9QEjylQW4KcW6oDg2EKyswNTWSEFIZ+on460dJWhIvebMDz/IhymGLzQA9GplmkcvFSUa0QgxaO/DZKI7qCE3aY0XBCjjt0qp5724qacrzexzgBYQ3Anj3pgVb1yAoEkwtSxoYPLBPdKNh6KeIj9e2gl0gpXGVH8fVEgntwuuNry84BHeleKdBMVuLBs1f9fEAo/5XLgYaTnvVIzDqZT/NGdsZWoBeBEiGQrTFCRnFpLH/TXcBB/NgA12xj6C9QW+kBv7t3BVszlVbS0jYgRF0YgaLxsuaDbD2ly3apw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7b4b2a44-5c78-4dbd-24ac-08de8aaf1223
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7579.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Mar 2026 20:42:46.2632
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aH2WnZ/EKHEPCuWHrz5JUTtZoYW1ixk/33PCbvSuyvhh1iDj8CZcH+pzd7uz4Zan5Gp15MwA+qRqUNiX6NAgz1Yem/xYNgnEvpwv+0uyLQ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB8205
X-OriginatorOrg: intel.com

On 3/25/2026 4:50 AM, Mauro Carvalho Chehab wrote:
> On Tue, 24 Mar 2026 13:37:39 -0700
> Jacob Keller <jacob.e.keller@intel.com> wrote:
> 
>> Hi,
>>
>> I recently saw some strange behavior with the Python kernel-doc. I was
>> seeing the verbose info lines from the kernel-doc script, i.e.:
>>
>>> Info: ice_ptp_hw.c:5377 Scanning doc for function ice_cgu_get_pin_freq_supp
>>> Info: ice_ptp_hw.c:5406 Scanning doc for function ice_cgu_get_pin_name
>>> Info: ice_ptp_hw.c:5441 Scanning doc for function ice_cgu_state_to_name
>>> Info: ice_ptp_hw.c:5463 Scanning doc for function ice_get_dpll_ref_sw_status
>>> Info: ice_ptp_hw.c:5505 Scanning doc for function ice_set_dpll_ref_sw_status
>>> Info: ice_ptp_hw.c:5544 Scanning doc for function ice_get_cgu_state
>>> Info: ice_ptp_hw.c:5612 Scanning doc for function ice_get_cgu_rclk_pin_info
>>> Info: ice_ptp_hw.c:5671 Scanning doc for function ice_cgu_get_output_pin_state_caps
>>> Info: ice_ptp_hw.c:5733 Scanning doc for function ice_ptp_lock
>>> Info: ice_ptp_hw.c:5770 Scanning doc for function ice_ptp_unlock
>>> Info: ice_ptp_hw.c:5782 Scanning doc for function ice_ptp_init_hw
>>> Info: ice_ptp_hw.c:5811 Scanning doc for function ice_ptp_write_port_cmd
>>> Info: ice_ptp_hw.c:5834 Scanning doc for function ice_ptp_one_port_cmd
>>> Info: ice_ptp_hw.c:5866 Scanning doc for function ice_ptp_port_cmd
>>> Info: ice_ptp_hw.c:5901 Scanning doc for function ice_ptp_tmr_cmd
>>> Info: ice_ptp_hw.c:5934 Scanning doc for function ice_ptp_init_time
>>> Info: ice_ptp_hw.c:5986 Scanning doc for function ice_ptp_write_incval
>>> Info: ice_ptp_hw.c:6035 Scanning doc for function ice_ptp_write_incval_locked
>>> Info: ice_ptp_hw.c:6056 Scanning doc for function ice_ptp_adj_clock
>>> Info: ice_ptp_hw.c:6107 Scanning doc for function ice_read_phy_tstamp
>>> Info: ice_ptp_hw.c:6134 Scanning doc for function ice_clear_phy_tstamp
>>> Info: ice_ptp_hw.c:6164 Scanning doc for function ice_ptp_reset_ts_memory
>>> Info: ice_ptp_hw.c:6183 Scanning doc for function ice_ptp_init_phc
>>> Info: ice_ptp_hw.c:6215 Scanning doc for function ice_get_phy_tx_tstamp_ready
>>> Info: ice_ptp_hw.c:6247 Scanning doc for function ice_check_phy_tx_tstamp_ready
>>> Info: ice_ptp_hw.c:6273 Scanning doc for function ice_ptp_config_sfd
>>> Info: ice_ptp_hw.c:6293 Scanning doc for function refsync_pin_id_valid  
>>
>> I didn't understand why I was seeing this as it should only be happening
>> if running kernel-doc in verbose mode. Then I discovered I had set
>> KBUILD_VERBOSE=0 in my environment.
>>
>> The python kernel-doc implementation reads this in the __init__ for
>> KernelFiles() on line 165:
>>
>>>         if not verbose:
>>>             verbose = bool(os.environ.get("KBUILD_VERBOSE", 0))  
>>
>> After some debugging, I realized this reads KBUILD_VERBOSE as a string,
>> then converts it to a boolean using python's standard rules, so "0"
>> becomes true, which enables the verbose output.
> 
> Looking at tools/docs/sphinx-build-wrapper, it implements verbosity
> by doing:
> 
> 	verbose = bool(os.environ.get("KBUILD_VERBOSE", "") != "")
> 
> which will also have the same problem as the one you detected.
> 

Yep.

> Perhaps the right fix would be to first convert to int then to bool
> on both places, in a way that "" will also be handled properly.
> Perhaps with:
> 
> 	try:
> 	    verbose = bool(int(os.environ.get("KBUILD_VERBOSE", 0)))
> 	except ValueError:
> 	    # Handles an eventual case where verbosity is not a number
> 	    # like KBUILD_VERBOSE=""
> 	    verbose = False
> >> This is in contrast to the (now removed) kernel-doc.pl script which
>> checked the value for a 1:
>>
>>>  if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1')   
>> The same behavior happens if you assign V=0 on the command line or to
>> any other non-empty string, since when V is set on the command line it
>> sets KBUILD_VERBOSE.
> 
> That's funny... we did test make V=0 htmldocs / make V=1 htmldocs 
> 

Strange. The Makefile does this:

ifeq ("$(origin V)", "command line")
  KBUILD_VERBOSE = $(V)
endif

I can see KBUILD_VERBOSE=0 from the top level Makefile, but you're right
it doesn't seem to trigger the environment variable..

> It sounds that the problem is only if you explicitly set it without
> relying on gnu make.
> 

Adding some warn prints I do see the Makefile sets KBUILD_VERBOSE=0 when
you do V=0.. and it has an export clause for KBUILD_VERBOSE

Oh, it might be your particular build doesn't have W=1 so checkdoc isn't
being defined and thus kernel-doc isn't running?

If I do "make W=1 V=0" I do actually see these lines:

> Info: ../drivers/pci/pci.c:3646 Scanning doc for function pci_acs_init
> Info: ../drivers/pci/pci.c:3663 Scanning doc for function pci_enable_atomic_ops_to_root
> Info: ../drivers/pci/pci.c:3746 Scanning doc for function pci_release_region
> Info: ../drivers/pci/pci.c:3772 Scanning doc for function __pci_request_region
> Info: ../drivers/pci/pci.c:3820 Scanning doc for function pci_request_region
> Info: ../drivers/pci/pci.c:3841 Scanning doc for function pci_release_selected_regions
> Info: ../drivers/pci/pci.c:3879 Scanning doc for function pci_request_selected_regions
> Info: ../drivers/pci/pci.c:3894 Scanning doc for function pci_request_selected_regions_exclusive
> Info: ../drivers/pci/pci.c:3910 Scanning doc for function pci_release_regions
> Info: ../drivers/pci/pci.c:3925 Scanning doc for function pci_request_regions
> Info: ../drivers/pci/pci.c:3944 Scanning doc for function pci_request_regions_exclusive
> Info: ../drivers/pci/pci.c:4026 Scanning doc for function pci_remap_iospace
> Info: ../drivers/pci/pci.c:4062 Scanning doc for function pci_unmap_iospace
> Info: ../drivers/pci/pci.c:4097 Scanning doc for function pcibios_setup
> Info: ../drivers/pci/pci.c:4109 Scanning doc for function pcibios_set_master
> Info: ../drivers/pci/pci.c:4136 Scanning doc for function pci_set_master
> Info: ../drivers/pci/pci.c:4150 Scanning doc for function pci_clear_master
> Info: ../drivers/pci/pci.c:4160 Scanning doc for function pci_set_cacheline_size
> Info: ../drivers/pci/pci.c:4198 Scanning doc for function pci_set_mwi
> Info: ../drivers/pci/pci.c:4229 Scanning doc for function pci_try_set_mwi
> Info: ../drivers/pci/pci.c:4248 Scanning doc for function pci_clear_mwi
> Info: ../drivers/pci/pci.c:4268 Scanning doc for function pci_disable_parity
> Info: ../drivers/pci/pci.c:4285 Scanning doc for function pci_intx
> Info: ../drivers/pci/pci.c:4310 Scanning doc for function pci_wait_for_pending_transaction
> Info: ../drivers/pci/pci.c:4326 Scanning doc for function pcie_flr
> Info: ../drivers/pci/pci.c:4366 Scanning doc for function pcie_reset_flr
> Info: ../drivers/pci/pci.c:4443 Scanning doc for function pci_pm_reset
> Info: ../drivers/pci/pci.c:4497 Scanning doc for function pcie_wait_for_link_status
> Info: ../drivers/pci/pci.c:4527 Scanning doc for function pcie_retrain_link
> Info: ../drivers/pci/pci.c:4592 Scanning doc for function pcie_wait_for_link_delay
> Info: ../drivers/pci/pci.c:4642 Scanning doc for function pcie_wait_for_link
> Info: ../drivers/pci/pci.c:4679 Scanning doc for function pci_bridge_wait_for_secondary_bus
> Info: ../drivers/pci/pci.c:4818 Scanning doc for function pci_bridge_secondary_bus_reset
> Info: ../drivers/pci/pci.c:5077 Scanning doc for function __pci_reset_function_locked
> Info: ../drivers/pci/pci.c:5135 Scanning doc for function pci_init_reset_methods
> Info: ../drivers/pci/pci.c:5167 Scanning doc for function pci_reset_function
> Info: ../drivers/pci/pci.c:5214 Scanning doc for function pci_reset_function_locked
> Info: ../drivers/pci/pci.c:5252 Scanning doc for function pci_try_reset_function


>> Of course, I can remove KBUILD_VERBOSE from my environment, I'm not
>> entirely sure when or why I added it.
>>
>> Would think it would make sense to update the kdoc_files.py script to
>> check and interpret the string value the same way the perl script used
>> to? It seems reasonable to me that users might set "V=0" thinking that
>> it disables the verbosity. Other verbosity checks are based on the
>> string containing a 1,
> 
> kernel-doc has a set of "-W" flags to control its verbosity. Direct
> support for KBUILD_VERBOSE was added there just to make it bug-compatible
> with kernel-doc.pl when building via Makefile.
> 

Right.

> Yet, as using it via "make htmldocs" don't use "-W", IMO it makes
> sense to ensure that "-Wall" is enabled if V=1.
> 

We enable -Wall if KBUILD_EXTRA_WARN contains a 2:

ifeq ($(KBUILD_EXTMOD),)
ifneq ($(KBUILD_EXTRA_WARN),)
  cmd_checkdoc = PYTHONDONTWRITEBYTECODE=1 $(PYTHON3) $(KERNELDOC) -none
$(KDOCFLAGS) \
        $(if $(findstring 2, $(KBUILD_EXTRA_WARN)), -Wall) \
        $<
endif
endif

If KBUILD_EXTRA_WARN has 2 we do -Wall, and if its any non-zero value we
enable checkdoc. KBUILD_VERBOSE is handled internally to the script so
not part of the Make invocation.

So V=0 only manifests if KBUILD_EXTRA_WARN is set.

We set KBUILD_EXTRA_WARN in top level:

ifeq ("$(origin W)", "command line")
  KBUILD_EXTRA_WARN := $(W)
endif

export KBUILD_EXTRA_WARN

>> (some even use 2 for even more printing).
> 
> Documentation had support for V=2, but this was dropped on this
> commit:
> 	c0d3b83100c8 ("kbuild: do not print extra logs for V=2")
> 

Looks like there's some stale leftover bits then:

#
# If KBUILD_VERBOSE contains 1, the whole command is echoed.
# If KBUILD_VERBOSE contains 2, the reason for rebuilding is printed.
#
# To put more focus on warnings, be less verbose as default
# Use 'make V=1' to see the full commands
I don't have strong opinions either way.


>> I'm not entirely sure what the best implementation for python is to
>> avoid this misinterpretation, so I haven't drafted a proper patch yet.
> 
> Perhaps something like the patch below (untested).
> 

The patch seems reasonable, though I don't know about the enabling other
errors, as those are controlled by W=2 right now. I don't personally
have objections to enabling them with V as well, but others might?

Thanks,
Jake
