Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F1692BF3F3;
	Mon, 22 Jun 2026 16:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=192.198.163.17
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782146858; cv=fail; b=SWRPa84f0WWZKoTI7cP/sQ/YO6w8R7GZtm8hGzIjTZISSf+8fiHxL1cIkZ12tby7jnhmhHw7zittwXQW92RO/F1Tlwn5kcpwMmO2ntbZi05eh4iOjcVGZz4gNpcTjmboZozVkdc7abZjByfaJ0mAZPG4s534bECooAXDHPp2ccA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782146858; c=relaxed/simple;
	bh=OvREX4NeQHbVKM4M/eqBHGNqohkZlW3uICOOnYc9NZw=;
	h=Message-ID:Date:Subject:To:CC:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=V39BW6R8Td0bBdbZ25oQPriK3r6qLQVaq58x/+qCZvHZoXpyGOW9c8RGkf7gnQSGkTyKuyaIOFdJEsP920SWLTtsUUyGUnCAseqpi2NNCa/PG6752kk+Nxbyd97J+vB7Gb/+7JCi25xXOE91o5NdBaH5PaTlVF/8GTECQnxwh4c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k+kWIU7L; arc=fail smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k+kWIU7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782146857; x=1813682857;
  h=message-id:date:subject:to:cc:references:from:
   in-reply-to:content-transfer-encoding:mime-version;
  bh=OvREX4NeQHbVKM4M/eqBHGNqohkZlW3uICOOnYc9NZw=;
  b=k+kWIU7LCiXU+C5ZwhIz+kg8ctkR2j4uFoAj8h+3f/ZfoSh+E9mjfgS2
   iGEa4SV1Q0Dj76+tDKqEjjdWwSY2K2xd2qbGN8sAReY5ZJ7751czqSkS4
   wUPFxm4AGeJwQxqgSug6tz4pW4XF4H2ujQVVIYAr94S3VAKwibQDXoCkn
   jDxoBiQGiWfC2TNVOJUM15HzPV3xSP6WAgEWzrzMi6h7HkG8r22NHV3dx
   V/0Jy40xROV7F43o3n0oZEX+3bJwxPdTNwUjQgMlq19fpfQELte1EvqAv
   Vt2pmYUuihUEbg1XI3cyG7yJcT6aDV4vO+SeU1YA3qvIyHKxhBlxff5dj
   Q==;
X-CSE-ConnectionGUID: 22dlAfMKTCC3+iLlSC9Taw==
X-CSE-MsgGUID: mr0jFbcmSoaY0uMgKgGT/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="82752215"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="82752215"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 09:47:36 -0700
X-CSE-ConnectionGUID: HisPOJKVRjKNRwWWrr7t0g==
X-CSE-MsgGUID: TE9sEWsfT0OV8cDaS0vnYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="248394257"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
  by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 09:47:36 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 09:47:35 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Mon, 22 Jun 2026 09:47:35 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.50) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Mon, 22 Jun 2026 09:47:35 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QjJiK/1QEew/SMIXW+TYiwAv3MCNaFqXVXqsRUktgF2twKAHJZV9tO6tmlNWvmDYA/hk0ezPXIrM1mvu/6qN4PATvefVIQbsUCkKeoBYsVlPkxEM6u+gPqgBs1Eka2KUMay3gXFI4YGnyYo9Se3K8H8tY6aa/rylGm4x/8Yisyt14dZl+eROmFcvTpD2YWggaKtsWrh3GBE3sgyJo2Lr0dMuLgOo+fs/VmcboS3yztFx8mEB0zHbK0ginwylWaWE45KM+3muXN+te2p+8OvLczWLuLicTLQY/rSq7f/M0aiBnxov94fs79Kfv60f0YjTWqtRtygcHPoG8GKVR9w6+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iP8Im8SnIj7GGeRX4rcRgF6n94Qew0PR6EaEcDzEj5M=;
 b=PYnO9LAxXLEyCV2T7ypLu2PDQ53/zuI6mGXiEWsH3IFxS8OANzd2qvFtZunMo2egr/2Qikv6JgxxrNxphmYFAhOzb++Qv0zavryCXMqmWJXa8SVMiQm8seiZnCDfjOONzTXw7Dq+CUrZYA9Ci12X9vxOw/GFboIfgyhDA7azb+t3rylEUln0HWc/zywiIbh+hNVBcj6zp77qJfsivmHn1gn2ZENHNFSwXH9Fil9q8OvBWbeSbCGrcgjKtBRZ/Rlwip7BkyBPcWVlcPCMJV4X/TEsVwf1XqFWVg10sRuyNagZ1XFHQRT2a2owdSJfSiEQLhhHNxmPvCV7fC9i5xb4bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com (2603:10b6:a03:540::20)
 by PH0PR11MB4792.namprd11.prod.outlook.com (2603:10b6:510:32::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.139.19; Mon, 22 Jun
 2026 16:47:32 +0000
Received: from SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc]) by SJ2PR11MB8370.namprd11.prod.outlook.com
 ([fe80::b6cf:ce77:3cdf:7cc%5]) with mapi id 15.21.0139.018; Mon, 22 Jun 2026
 16:47:31 +0000
Message-ID: <510ee961-b3a3-41ef-857f-6dc210b6eb83@intel.com>
Date: Mon, 22 Jun 2026 09:47:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 08/12] fs/resctrl: Make info/kernel_mode writable and
 identify the bound group
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
 <768d4b603542f3202ece4294c808dbbf1a8e3008.1777591497.git.babu.moger@amd.com>
 <57f6324b-6340-4633-b3a0-b40683a5ec12@intel.com>
 <280f2dab-56be-49b9-982f-16f01727a732@amd.com>
From: Reinette Chatre <reinette.chatre@intel.com>
Content-Language: en-US
In-Reply-To: <280f2dab-56be-49b9-982f-16f01727a732@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW3PR06CA0025.namprd06.prod.outlook.com
 (2603:10b6:303:2a::30) To SJ2PR11MB8370.namprd11.prod.outlook.com
 (2603:10b6:a03:540::20)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ2PR11MB8370:EE_|PH0PR11MB4792:EE_
X-MS-Office365-Filtering-Correlation-Id: 1467465d-d4c5-449b-4a30-08ded07df3f7
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|23010399003|7416014|376014|366016|22082099003|18002099003|4143699003|56012099006|11063799006;
X-Microsoft-Antispam-Message-Info: zQOpyL/TRhstg/tI7CZ310b1tua6nCGiGOTpYd5tIXnJ21QTfzuehAL2HLos7TqSWmAR4jJ3qsd7pQbw8N8btuQpay8HD0Gfdc/FDyKALJvvrL5WGpbjCfCnMbo1u7gxHtLruP2l26SOjmcS95Pd07MAM9kW//XIwC775uJrPQCyED1NY/zuG4jmnIfUPhFpzgMoy1JL4kRCMXT8WnMi4HCNhsM47xR+pu8wGfABau+iYehggyjvRBYSdAVz78S3TI5CacYyobC5OxZrZhVbnYleCwl2i60sZAedBba0PYyMVVcSFMx+/4lbDaWZzomn4KxRSxY2SXl+fUuQLerx/42J5IKk37YC847KNitOs1OKf7+W8swcN1gCAaZMwuC3wXZtKpbu7k6dyrZgyFP5Pc6WHMnBPIihx+YvlSJNzR7TWbHCCeI14Ieso/mNxQw/0B5zWczB72LvohJeXWgZPMmqh8xk4oDIWQ8Ltkswl/BeCsFy9YLkZ1v9N8cpiskRYHp2zJmGUmGAb7Rs2dyvomDeR3OjwWhszac+9O/LwPnqKEBo8WpE58U9vWHAp/5zqpbK+tuBiXceKHHRdtK2ParSJx8kOEHtqXXVJGKamQnIvY/HYjY8Y3HRlFomegY5rTEtmF1nRT58bne9pSAbNnryI0T+BeojngzlDRaYrDw=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ2PR11MB8370.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(7416014)(376014)(366016)(22082099003)(18002099003)(4143699003)(56012099006)(11063799006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bVlld1ZvemdveENscFYxL3NBeTludzFiTG1icHBWSFBlNGZmWmgvK1lGUHlt?=
 =?utf-8?B?WE9GZndKdHNKMVp4dWFnN3VjN3BSSVJ6a2p2RW1rVHk3VEN1ZmZMT0k3cEI2?=
 =?utf-8?B?bmZuUnpyRG1pN2VvaUNxZE04OGhLSTlWT3UwQ212WjRmYjFhMVlEOXVNKzAz?=
 =?utf-8?B?TGMzSTlBcjZyZ2hDRktRWVpHbkVPSFlwOU55OUExVGpQbHZ2Wk8xV0xCYWdP?=
 =?utf-8?B?ZjhOUUJyekx5SDRCb29BMTAvWHNSVjNsaEJkOUZlb0doOThSbzZtajgrKzVD?=
 =?utf-8?B?S1I2djJrQUhrNXp0MzdaVWFERC8zQTdpN2d2T1RjUFAzYVhEcUdYallLREJL?=
 =?utf-8?B?cTVqaFp4MldYOW1nUHM2SjJHMTBmOS9vZExSdy8rSlU0elB4cW4wQmc0aUlY?=
 =?utf-8?B?TGhJOFJSUVcrRDJ3R2t3ZS9JRGVNZDdHOWxEOUd6emFjZnQvWGNPMSsxL1cv?=
 =?utf-8?B?QzJja0kvYTVjcWh5SzJ4bC9IWXI5OHdGVWl3TVFxb25kYXBPSjJETVhvWG4w?=
 =?utf-8?B?QWhzMTdtVTFPOTdtOEZMeFBnUldqNEFJN1J3VnF0dmNnQ2RqRWpSM3R4Wk9q?=
 =?utf-8?B?Z1h2T1p0dStvWHh2OG1CTnFsRGpOcjBSQllKalcyNjZ0SW9iWksvSUZqNThT?=
 =?utf-8?B?L1NZeTVTZFRpd1FhN1oybG41cEMwU2kzOHBCRUNrRzVJRk9oNXF6bjhrZXFz?=
 =?utf-8?B?Nm9TNWJIcUdrYnJKSFVIeTEzaVV5cEduOFdPczhKbjFYRXhvOHNpT3VmUnJ4?=
 =?utf-8?B?OWM3eXRrUjRMYmRRNU9MYXZCVWlmQWRMOXB6bVhCZGsyTWRZR2FIZFFibkNz?=
 =?utf-8?B?YWNMSzVuakNMbTBRSFVGaGJLTFZtZGY3NXBsSkhYRHNra2lqelBmcnh6ODNJ?=
 =?utf-8?B?OE51c1dFMGZrMXdocFJ3NFlqVTV0R1VyYmNkeUFmYlc5ME0wYUI2R0pIbEZv?=
 =?utf-8?B?dHQremwyZjdMWnFGeUU1cmZIWExlUWh2N040MlpRTmQvYnExTktiZmNURjkv?=
 =?utf-8?B?dEpVT252b1hMbEFUL01jMDJicHIyYkFnb28wRU1GaTByQmtnS21ZSmw4bCsy?=
 =?utf-8?B?d1o5S2Z5eERQVXhJazVSWDdQN1ljMXNLYkpxaC9wRXhabFZzVUJkSmxKUXBq?=
 =?utf-8?B?dE05RG5GY2gxR3dQd3oxRVBWb1IxSzQzcGJPbmgrdy85aDg0Mys5QXpWWnlj?=
 =?utf-8?B?SGdPK2VRZml6VlhQbWJKcFZBY3hHVXVHcVRLNWNPZXpDL2N1bHo3aFcxMGtl?=
 =?utf-8?B?QmhsUnNkRlZKQWt6S0x5ODFMMGJPYXlDa2lXN010ZzZ6Yko1ckRHbFJERDBk?=
 =?utf-8?B?WGVnWUhTeWJRT0Mrc3UyNEdiMjB3SW5kRUZYZUlycmlCcUlMSnNzYzQ5VW5V?=
 =?utf-8?B?QnJFYzFNcGRHdXF0RkdRZkExYlRQczlITDgxOUorZ3RQclZPV3hPS3d2V1Yv?=
 =?utf-8?B?bnVOZlFZYUJleExBYStKeXl4eElpbTFNZHFjOTZrRS85VjZReVQ5OEE5MVRT?=
 =?utf-8?B?Q2Q2dXBKaUoyVWVYdCtXMGs5WXhsTEFiRklDc1dpbTNDK241TFRQR3ZBT0tX?=
 =?utf-8?B?YXdVMmJtQ01Cak02S0JvWjFBbXd0UTFxUjB1WXZLZGhqMEhPS0VzeUNRR2J0?=
 =?utf-8?B?RFF4NnJOR2g3TzEraFNPYjBSZEY1OUxOTnBwOW02K0NTYkhtSmloK3l0ZEw3?=
 =?utf-8?B?eWhkWEVaU0NtY1B3bUhoR0d5dXhINVR1ZnE1Z3hCbysrRnlra0d6eWc2SHVB?=
 =?utf-8?B?NDJZdzlQRmFuUzhoMkZ0alg1R28rR1lOK3hEWm94dzBHTFhDMEpJTmpNaVV0?=
 =?utf-8?B?OXNaWXZ3WjAyaGFsMXhoVkdJL1JRTDZhVUF5N0NaWXhzOWtBM3cvR05OMEN0?=
 =?utf-8?B?ZTFQZC9SZmMyak5tM2dMa3hQQTNTM0xQRk10eFBWOVplRW5zSUFxenB2S01H?=
 =?utf-8?B?NkJaVUFRMHFQRDZVejliN0NuVWtBSmt4WVVvZVcyLzF6SXhoKzhpWXM0Vnla?=
 =?utf-8?B?RmY2K3djdndqdnNGa2xvRTlxc0Zjd0lTSkh5SGlvRzI1Y1MrUnR3RXJGOFNC?=
 =?utf-8?B?L2FzWDJsT1l6bm92NEMzS0RVVUovU0VFSUVQSlczRjBteXhkYllJSEw1SFBQ?=
 =?utf-8?B?OVdqdTI2eU15ZFN4TC9PeUx6RDlXNXFEb1BOa0pBM3RKcWdRR3ZSS0UwN09j?=
 =?utf-8?B?NGQ1NnI2ZWhMQTFpeldIVmdGNFExNE5MS1lTY090V1VGNExHNGlvT3ZjcTdu?=
 =?utf-8?B?VDlnVXhLd2x1cmR5aUZIY1dkSEZvWHVaaXY4V2lZUS80SGJ2ZU51N25zZVFM?=
 =?utf-8?B?cVI5aGk1THJIQjZLQ0ROa3BkbUFHeENHSCsrZ05DZitIVjFUeElZRHZXd0Ey?=
 =?utf-8?Q?nOsPKuM07h7OKb+Q=3D?=
X-Exchange-RoutingPolicyChecked: D7qqnxlZQeTX5wfp8kf6ykvw3q5tQa+Uh/s9Jl+K9SswnakWSqo98pqEcDy3dtzqJOLEOfBfHL4s62WwiSaiqOHrfbXe/4oqqQd3vzniSe5UpsZl143ZGvNdlWztyWLZxpaFSLpk7eK2GwkGwgpS7R3VvirOOmW+1VOWJkbNqADavxa8DOr+G4MamMpSgmfcL54ObRm0dPDxsGoAYORjZbsiqswNZU/5MPaGMHFVh1WsbwqWFoszzg7bfMGk3x9LX5Ko2xtXztr+iNdp1OzKBkYOp4ZFiHtJ0QmXHkVc6/AqM8OWFJPLmXKRMccjDTNv1w0tvEhgP2pMhDBi3BiWXw==
X-MS-Exchange-CrossTenant-Network-Message-Id: 1467465d-d4c5-449b-4a30-08ded07df3f7
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR11MB8370.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jun 2026 16:47:31.7513
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8i+82BJT/USJrZSt6FY5N0wRSITqW+u9Bzo2vbVVtUdUyHPq7WgKB7VEXjhnCKMnnawVr7zxHbtD4sJuy/NDHDLKAs9MsVBkV+qhOLPHeCc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4792
X-OriginatorOrg: intel.com

Hi Babu,

On 6/18/26 6:29 PM, Babu Moger wrote:
> On 6/16/26 18:42, Reinette Chatre wrote:
>> On 4/30/26 4:24 PM, Babu Moger wrote:

...

>>> +/**
>>> + * rdtgroup_config_kmode_clear() - Tear down the kernel-mode binding on @rdtgrp
>>> + * @rdtgrp:    Resctrl group whose kernel-mode binding is being released.
>>> + *        May be %NULL when no group is currently bound, in which case
>>> + *        this is a no-op.
>>> + * @kmode:    Kernel-mode policy currently active on @rdtgrp, as a
>>> + *        BIT(&enum resctrl_kernel_modes) value.  When this is
>>> + *        BIT(INHERIT_CTRL_AND_MON) the hardware tear-down is skipped
>>> + *        because no MSR was previously programmed.
>>> + *
>>> + * Disables the kernel-mode binding on the CPUs @rdtgrp covers (its
>>> + * @kmode_cpu_mask, or all online CPUs when that mask is empty) and resets
>>> + * the per-group bookkeeping (@kmode and @kmode_cpu_mask).  This is the
>>> + * disable counterpart of rdtgroup_config_kmode() and exists so that a write
>>> + * that transitions the active mode to BIT(INHERIT_CTRL_AND_MON) -- which
>>> + * skips rdtgroup_config_kmode() entirely -- still tears down the previously
>>> + * bound group instead of leaving stale enable bits behind.
>>> + *
>>> + * On allocation failure the function returns -ENOMEM and leaves both the
>>> + * hardware state and @rdtgrp's bookkeeping unchanged so the caller can fail
>>> + * the operation atomically and last_cmd_status reflects reality.
>>> + *
>>> + * Context: Caller must hold rdtgroup_mutex.
>>> + *
>>> + * Return: 0 on success (including the @rdtgrp == %NULL and INHERIT cases),
>>> + * -ENOMEM if cpumask allocation fails.
>>> + */
>>> +static int rdtgroup_config_kmode_clear(struct rdtgroup *rdtgrp, int kmode)
>>> +{
>>> +    cpumask_var_t disable_mask;
>>> +    u32 closid, rmid;
>>> +
>>> +    if (!rdtgrp)
>>> +        return 0;
>>> +
>>> +    if (kmode == BIT(INHERIT_CTRL_AND_MON))
>>> +        goto out_clear;
>>> +
>>> +    if (!zalloc_cpumask_var(&disable_mask, GFP_KERNEL))
>>> +        return -ENOMEM;
>>> +
>>> +    if (rdtgrp->type == RDTMON_GROUP) {
>>> +        closid = rdtgrp->mon.parent->closid;
>>> +        rmid = rdtgrp->mon.rmid;
>>> +    } else {
>>> +        closid = rdtgrp->closid;
>>> +        rmid = rdtgrp->mon.rmid;
>>> +    }
>>
> 
> I can directly use it like below. I dont need to check for RDTMON_GROUP.
> 
>     closid = rdtgrp->closid;
>      rmid = rdtgrp->mon.rmid;
> 
> 
>> Same comment as above ... but actually, why is closid/rmid needed at all? This
>> function is intended to *reset* the kernel mode so needing a valid/active closid and
>> rmid does not look right.
> 
> This is a bit tricky. I may need CLOSID/RMID in
> resctrl_arch_configure_kmode(). According to the specification, only
> the PLZA_EN field is allowed to differ across CPUs where PLZA is
> enabled; all other fields must remain consistent across CPUs within
> the same domain. If CLOSID/RMID are not passed, it could result in
> inconsistent values across CPUs.


I see. Let's revisit this in next version. It is not quite clear to me how
the rework of cpu_mask wrangling will impact the resctrl_arch_configure_kmode()
calls. To simplify this for now resctrl could continue to provide closid and rmid
to architecture (with the API documentation in include/linux/resctrl.h documenting
why it is provided and that it may be unused by architecture). 



>>> +
>>> +    /*
>>> +     * Split "<mode>:group=<spec>"; the ":group=<spec>" suffix is optional
>>> +     * and when omitted the default control group (&rdtgroup_default) is used.
>>> +     */
>>> +    group_str = strstr(buf, ":group=");
>>> +    if (group_str) {
>>> +        *group_str = '\0';
>>> +        group_str += strlen(":group=");
>>> +    }
>>> +    mode_str = buf;
>>> +
>>> +    mutex_lock(&rdtgroup_mutex);
>>> +    rdt_last_cmd_clear();
>>> +
>>> +    for (i = 0; i < RESCTRL_NUM_KERNEL_MODES; i++)
>>> +        if (!strcmp(mode_str, resctrl_mode_str[i]))
>>> +            break;
>>> +    if (i == RESCTRL_NUM_KERNEL_MODES) {
>>> +        rdt_last_cmd_puts("Unknown kernel mode\n");
>>> +        ret = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    if (!(resctrl_kcfg.kmode & BIT(i))) {
>>> +        rdt_last_cmd_puts("Kernel mode not available\n");
>>> +        ret = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>> +
>>> +    kmode = BIT(i);
>>
>> Can kmode be of enum type to be assigned the actual enum value to avoid all these BIT(enum value) usages?
> 
> You mean?
> 
> enum resctrl_kernel_modes {
>     INHERIT_CTRL_AND_MON        = 1U << 0,  /* 1 */
>     GLOBAL_ASSIGN_CTRL_INHERIT_MON    = 1U << 1,  /* 2 */
>     GLOBAL_ASSIGN_CTRL_ASSIGN_MON    = 1U << 2,  /* 4 */
> };
> 
> #define RESCTRL_NUM_KERNEL_MODES  3

No. I mean:
	enum resctrl_kernel_mode kmode;
... with a change like this code like below can be simplified:

>>> +    if (kmode == BIT(GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU) &&

	kmode == GLOBAL_ASSIGN_CTRL_ASSIGN_MON_PER_CPU

>>> +        rdtgrp->type != RDTMON_GROUP) {
>>> +        rdt_last_cmd_puts("global_assign_ctrl_assign_mon_per_cpu requires a monitor group\n");
>>> +        ret = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>> +    if (kmode == BIT(GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU) &&

	kmode == GLOBAL_ASSIGN_CTRL_INHERIT_MON_PER_CPU

>>> +        rdtgrp->type != RDTCTRL_GROUP) {
>>> +        rdt_last_cmd_puts("global_assign_ctrl_inherit_mon_per_cpu requires a control group\n");
>>> +        ret = -EINVAL;
>>> +        goto out_unlock;
>>> +    }
>>> +

Reinette


