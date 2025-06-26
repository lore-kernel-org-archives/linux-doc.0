Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94D19143C61
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 03:32:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=198.175.65.20
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750908757; cv=fail; b=j/XG1y+VPHtdH2ox4t3NBBTVSctURyNuS1T+bcUoKBTSgQ6kBnXsslBVFHvGnzNI3bflFg2rIE8FBwbiOH5GEaLfFGlUSbwr+uuU82MsGYkS/69yhT4CdUiv8D6SyR7631gGaWUq7g8rUdCjMMdsA2xGPH5+OauyhWJ3xIdsVLE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750908757; c=relaxed/simple;
	bh=c/4i1gxFT1Xc2Gv8+/EnLXjN68NHzcL0quSVZ4EVIOY=;
	h=Date:From:To:CC:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GHcGfDugkAI9ReGQnKA4Am9ulY3OS1t1O5DN7gLxIsODUr3AmFHZm3zoL7BSm0kmAVIcDQa4DtXgsd6OpoSTZPZBn60q2TAJiqzsxh5/w1zzsfItKC0yQ2rxymsmACb/7+lAqWlQnSLgjSSQhQ/uUvVSGbhI6KEuXh2n6iljpX4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F1aK3FHB; arc=fail smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F1aK3FHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750908756; x=1782444756;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=c/4i1gxFT1Xc2Gv8+/EnLXjN68NHzcL0quSVZ4EVIOY=;
  b=F1aK3FHBxM2LN1PqxqxrfMNephqBksKas1vHnxiyAMwldvA2TKMvG9qm
   /RPLV8VxyCtMvdftcPTGml0wRaUd4J05PloSwShg10GtelgbyeXx7a6NI
   Zo3ILFEwZN/pTTJC2Bq/6ysvxSkJhPDv/mKVH2tTgmxvQGoQ0woJIo2Cd
   5OteaN2AZa661ktiRQyLodUYVUu8mFpTZJ5N8R7FfYf/talCq2qeMaPbA
   O+2M6Kt8Ys5Mz8hNdOsxNzN7zKqZH5yNyTpR9RPHDGfEGMBURMgOKWX58
   jnaNfo85+XLwiquV6z98F9iqHueMuITcNQlN5Tfif3p9WB8IxAmt6AbNa
   Q==;
X-CSE-ConnectionGUID: kC8Gsu8/Sr2F6GiI/Zpiug==
X-CSE-MsgGUID: 5iVV3MCDRLSrtHDzKJIonQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="52914861"
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="52914861"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 20:32:35 -0700
X-CSE-ConnectionGUID: I6HDYz2rRQmSahly8/RMPQ==
X-CSE-MsgGUID: BhbTl8KERxOxpdiVn1DuWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,266,1744095600"; 
   d="scan'208";a="183283334"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
  by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2025 20:32:35 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:32:34 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Wed, 25 Jun 2025 20:32:34 -0700
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (40.107.223.57)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Wed, 25 Jun 2025 20:32:31 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sxyVPRAEcg4aNn92t5soz/qxsE9c719R7Fj2uF1PleOjN2FLUFsU0bQQhujm5hzZscAV8JMjCOsvlhNuJxO07EdmLtXDzBVu6D5nyI35+hBpu+0a49UuZ7BzPkUj+LjTzd5WHWVwWgm6u8j1Dn56NagPUJzOByaP/engaqA+OUH4foLJB8PYokNaLZoL/hAwTuMegjRlmoIbbW6NKYwqtyHuTkx9/SQHPCZCM1JQ9xtBtXPJcsAyutaE0PMLH3UGyn++7uVDz4xN2e7daYe1Cg/tOmCJ9npPd1Ij7rjcXUgfXp6kIftPOT3aixbtHJQECCJMF3hHMDRZehcNjyM/aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VO1B1+534M4vF5Zag4qf/7688CSVovtusAiDbqewVLM=;
 b=xoO8yFzKiY2c50LR9WLwQIOInY+U+h76kXUiojAUiVcvE2WCTmv4B8jxq9fTr4loojoc4+UKcvjQroij3WK9RqL7aEV6UEzz6C8bs4Q5mK+H5/jUKpjhE2x3FRvWjzUaPrnKw4UM3nzjde7pHQ0lJGLbsHgDpY4V5ZP6Z2NJQXMNW7GTZslO2zBgoVlpetTofwnI84QOpjoHr5O0C2ObK6KXaBca1HnWq4H3txyJNuJJWjS+4O1WAljTT6oamCe7674xDv2zS53xZGSF+bPVtrQlY8CQycCGSiTZUX+h1D/sVv2DgrItLsyq4nEsu7EOOj8Ez7NRqxAyRGoD3eRRiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com (2603:10b6:f:fc02::9)
 by CH3PR11MB7913.namprd11.prod.outlook.com (2603:10b6:610:12e::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Thu, 26 Jun
 2025 03:32:10 +0000
Received: from DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::8254:d7be:8a06:6efb]) by DS4PPF0BAC23327.namprd11.prod.outlook.com
 ([fe80::8254:d7be:8a06:6efb%7]) with mapi id 15.20.8769.022; Thu, 26 Jun 2025
 03:32:09 +0000
Date: Wed, 25 Jun 2025 20:32:02 -0700
From: Alison Schofield <alison.schofield@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
CC: Jonathan Corbet <corbet@lwn.net>, <linux-doc@vger.kernel.org>, "Dan
 Williams" <dan.j.williams@intel.com>
Subject: Re: [PATCH] docs: ABI: make the KernelVersion field optional
Message-ID: <aFy_MoUTFVmNWC4C@aschofie-mobl2.lan>
References: <20250626024101.792073-1-alison.schofield@intel.com>
 <d45396b1-2579-477b-890e-830d52ac2581@infradead.org>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <d45396b1-2579-477b-890e-830d52ac2581@infradead.org>
X-ClientProxiedBy: SJ0PR05CA0051.namprd05.prod.outlook.com
 (2603:10b6:a03:33f::26) To DS4PPF0BAC23327.namprd11.prod.outlook.com
 (2603:10b6:f:fc02::9)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF0BAC23327:EE_|CH3PR11MB7913:EE_
X-MS-Office365-Filtering-Correlation-Id: 982e9fb5-16e5-486d-792e-08ddb4620845
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?S/nTgSYu49QlXw3xny8MpF6VE1RtMd6471u9hCTBzw2yrtRWWad+rb9cbNbK?=
 =?us-ascii?Q?prKCw9GvFBbsi/hwvRnZBRTu7qFTMeHUERjDWqWQTosMAVpoFefUd4odz0Cy?=
 =?us-ascii?Q?UDl5tZ0w9jG393y6IoxQMYp2TmOWV75y2lVRdsjA/6f9kgTV/040p3qDS8rv?=
 =?us-ascii?Q?vA3L/dyqzCrBPyIM7IoBnk0Mo2HLh2p72jHXAFB7wwr18DKGEhp+DXhnGHZo?=
 =?us-ascii?Q?2IHDd4s3DgTPTpVuA00aTmHb9DhDxSAqnD63Qh1z2tGZzTyG+SldzmM2XSOF?=
 =?us-ascii?Q?/jLAG+uRuBK3bgk1vr8S8LKSWDbN5HQC6OELEg3wZ151kd6gwzGx/YG3M8Ts?=
 =?us-ascii?Q?RPESDML3p6PG5d0e+KuOyhb0HSjs1n7/6aP1VoZvHo/x5fTFSvc9kFUwo9hx?=
 =?us-ascii?Q?884rQE/mQWKQfHelyk+I2HO2OSTNYjHiH2UKwYl9HBYEgwaTQQ0YpqwEh5MJ?=
 =?us-ascii?Q?51uHfhUgcOncD/+ylLhGq2aMBAzOg5cRZ4xtoim+i6kcoTuutwuj1mlK2dGx?=
 =?us-ascii?Q?p137FD1UxB60gf5hxfFrPhl7U/nqnogE/Xxq3uxLaQDQ/zBr/5d2MKkyPiz8?=
 =?us-ascii?Q?5fdAF638SeSO4nv0ilTU/eTUoD/ETh+cPy3JxeeyJTveelMfOcboLVNYkMsw?=
 =?us-ascii?Q?Tfb7zj0tmcaaJ2Srfs8OKQfjkJhQnzXa0sgY7ntihwHV9ShW3n4wW8z//QtH?=
 =?us-ascii?Q?OtM3mXu9B1Q1VCyJIscoaR0jakJdGwzAf9W7vh+K0RmgBpnvdYutt+WTYUmS?=
 =?us-ascii?Q?qrxwCPhNPE5pAfP1eH1W/TesRzzkbReTCSmDbMa+B3Mwpn5QVQJ8X8UD5XS4?=
 =?us-ascii?Q?Hy2b0FQjC+jSw0W4B2/jMrCibLG/4OwbZwDqwE0RPXD6fn5yLKfxeF8vLxvu?=
 =?us-ascii?Q?itQH/I1VJC0iCeN/mVo53J3/bvFAAtEow9gK8+u6ZWse2LbksCPVdBfYftCu?=
 =?us-ascii?Q?eMIZbbVFH1ZMVUyf+jTFtAFnI1+PwViOqSfbORwt879aT9R2+rRWwlKnl0ko?=
 =?us-ascii?Q?OAqQBk0hclFyknemu51xkfrlESUSTZc8zqGOYoo6YxW1+p6pJG/5lV8s6uH/?=
 =?us-ascii?Q?V+flAX5vs4+6qL9NSUlUH5xtUTZFt4brMcmOoZQonSmA8M5x5wMvOcddMgyS?=
 =?us-ascii?Q?va1OgDhH3TH5vetF/ZtXpsYkcqBXIWCncNsllBdnDTtHDqyiiCJkexLCQUUF?=
 =?us-ascii?Q?UxUaP/7+b2ld7vzDH0dCp6ELhRkes/l9qzDkM09Tx3uFNlXNXom4ZdOalieO?=
 =?us-ascii?Q?1JR9+hFxBQSe2ycOWjgvX9Wbx1d99w2jONR3Y4+JE4uwIQ1TVwAGxAsqQ0x1?=
 =?us-ascii?Q?NSQvscXoJuSAqflNJhp0r0KhsjKksHJ+3O8PVhe2QRnQRRdLe3Ys+MNAKlU1?=
 =?us-ascii?Q?53CZEgHtGd0n1vIONgpy9SE5nBX4JPTHozdLkv9rq/1D3viwpe7vcHFsp62j?=
 =?us-ascii?Q?uyZcRskwXvk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF0BAC23327.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TRC0OI0LZ5Zp31Mm5ZF3efpuV/OYhB1E58dqIBEQ/xheB7NoCvThBQFCRjZQ?=
 =?us-ascii?Q?87EAgIT+kzG+D8GCowTQh79gBv45ekefge4e6sPXArSSprs+3RfyzsDMPdvC?=
 =?us-ascii?Q?oBxhuDP7cM4uxCTrq+YFrozuD7ozaSIDCdYadLGthoModqolhXME/O57X3el?=
 =?us-ascii?Q?UwwocxHXzjW5t06BiLSjnvLtEAvEqcf5If9YHP7+QJRIEZ4xV+C43ictHA3Z?=
 =?us-ascii?Q?CgEEsy2clnDmIicWDMniL2E5FRI51t1YrCpE/Ha93R6jhrlQEmpKlXSHUADz?=
 =?us-ascii?Q?Cp4Px2Sd475bfFKF/1eVISBPtGoup6VkuuEYvPRiTNRW6ZW8sZozL48amU3j?=
 =?us-ascii?Q?4w/pjVycrB5ikwcN4elYWT4MdL2KBiB2tuG7ZeoIWb/xJftYXms9XgRCcrYR?=
 =?us-ascii?Q?bhMYjVNCP1Cy/rEnCm2NqqS5Lw3wcamMfj/VtfoU2VG0n9Bx/kksN6TJ40Kt?=
 =?us-ascii?Q?+pIEwmo9i8LhW/GJGL2Gbn4fFBN5BHxl9S9xZuJk8h4yShn7z762B9q3zIJS?=
 =?us-ascii?Q?L1jZHf98DrQGhYvk8z3sJKVEwUdZdNfNemD6CuS1hLJQQsU8V2lPoOlfGC6E?=
 =?us-ascii?Q?CQGTSoHgnvOt3BiazljCCx2v1w5L/GkdDEB9l+GowXoNVTDBo8SMmRyD1z7M?=
 =?us-ascii?Q?tbT05e/6pFeDATaRfzpSOzW9U39e+z77yIpA3oaxYJolBmqOTucVbGBSh64T?=
 =?us-ascii?Q?8Y90i6xscMap0kfj9ev1hiQYTdh5XJT9QpY/xqUvvQX4/OecVRb56fCUa0nf?=
 =?us-ascii?Q?poidCF0gV3zCu8fge/nP/I43tzCW5MsPuzDsPG5zE4TlBigMFRG1i7UQ3quX?=
 =?us-ascii?Q?dwRZdT1kuR0VeqRCKdAfBl4vBTzrutt83+zvYdrLAhrE/Ke6vSahT7GN5CWP?=
 =?us-ascii?Q?iTMfq0PdxG64eQObdsuBsAGfF1ROJdCO8CpZ3hjnz3cmZPc7nxkn3HBEeFph?=
 =?us-ascii?Q?Po3xfmP2I9kIN9TERwFDnmLiY/n28R+O7GD0XHCuo4u9kLR1RyaLxN6YjmYR?=
 =?us-ascii?Q?fAek5XjwnX/kxEctKcAjJU/mTfm8Cz/toctau6u9/uQZWWR3YtDX56hQ3nPb?=
 =?us-ascii?Q?pV+EJCC5D9PECliV4xZRo9ncqbwtwIvMB+fGk5My9JWMiuogIVwONDHKml03?=
 =?us-ascii?Q?gITelkLg4wR+bEGgY7g7uPrLXH5BkJx/MJFriXfMTs8C/9bVyoCNkTm+vjw3?=
 =?us-ascii?Q?mBOA3mB9UT+rfGZObpOOCfle5qCu/6hiM51aNUfjpAEnXlIROM0yGVHdbRxG?=
 =?us-ascii?Q?Ko/AZjqRJfRyOemEFrKfNd3GjybVKUnOebhoznabZ4rANOYHoI6SXxeCbIhj?=
 =?us-ascii?Q?x9CWdCZ4/fUwoKOPjVP6bAckd2OO5skq/M43NMlBOgOjubu/cqZdFa6ybLJO?=
 =?us-ascii?Q?cwOVLb87K2dTOYLDzE1RaAU9p8SKFTjmfGiydLf8oUJxiQ8RjQKzeCpgD7eW?=
 =?us-ascii?Q?X7g6nR+KwiD5zRuXyUuS1Z5HF2hTti+ddfBHF/ZjTJitwKuJk/qQd0RPpw6X?=
 =?us-ascii?Q?Hti1H4j6wQY4yKZf3JoqEs7eq05v0UY6cD6WMEGlYse3ICsKg6+bJmH1+JTD?=
 =?us-ascii?Q?ShEwfsWU207QuGhCZTIt+fxZgzWnhT5KUu//sNrZOJTZyk5FR0EDxJj1dTK2?=
 =?us-ascii?Q?Vw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 982e9fb5-16e5-486d-792e-08ddb4620845
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF0BAC23327.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2025 03:32:09.8825
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ST/d2OZh+E55PpiXkksgLqMeTbxUNG4M/zC3oaq9Z7miHaVTdDna02noTf3pGbn2ggNTWXd3PyIiAnHa3CdfnNx067I1Jx64HPoNpbqYCm0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB7913
X-OriginatorOrg: intel.com

On Wed, Jun 25, 2025 at 07:52:58PM -0700, Randy Dunlap wrote:
> Hi,
> 
> On 6/25/25 7:40 PM, alison.schofield@intel.com wrote:
> > From: Alison Schofield <alison.schofield@intel.com>
> > 
> > The KernelVersion field has limited practical value. Git history
> > provides more accurate tracking of when features were introduced
> > and target kernel versions often change during development and
> > merge.
> > 
> > Label it optional.
> > 
> > Signed-off-by: Alison Schofield <alison.schofield@intel.com>
> > ---
> > 
> > Plan B is to remove the field entirely. 
> > 
> > 
> >  Documentation/ABI/README | 4 +++-
> >  1 file changed, 3 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/ABI/README b/Documentation/ABI/README
> > index ef0e6d11e919..315fffe1f831 100644
> > --- a/Documentation/ABI/README
> > +++ b/Documentation/ABI/README
> > @@ -46,7 +46,9 @@ Every file in these directories will contain the following information:
> >  
> >  What:		Short description of the interface
> >  Date:		Date created
> > -KernelVersion:	Kernel version this feature first showed up in.
> > +KernelVersion:	(Optional) Kernel version this feature first showed up in.
> > +		Note: git history often provides more accurate version
> > +		info, so this field may be omitted.
> 
> ISTM that ABI files and git history have different users/audiences.
> Sure, KernelVersion may be incorrect (but close?), but telling a "user"
> that they should install git and clone linux.git to determine the kernel
> version is a lot to ask -- and then they need git instructions for how to
> look up the kernel version.

Hi Randy,

Thanks for the user viewpoint.

As Dan mentioned, it was his feedback on my use of the field that
inspired this. I poked around a bit to see if omitting was becoming
common practice and found that in ABI/testing, 41% of the entries
omit the KernelVersion field (1423 out of 3431), and it's the same
41% for all of ABI/.  That led me to believe this field is already
being treated as optional by kernel developers.

I guess this is just shedding light on current practice. I have no
insight into whether users are hollering about the missing KernelVersion
fields. 

--Alison

> 
> >  Contact:	Primary contact for this interface (may be a mailing list)
> >  Description:	Long description of the interface and how to use it.
> >  Users:		All users of this interface who wish to be notified when
> 
> -- 
> ~Randy
> 
