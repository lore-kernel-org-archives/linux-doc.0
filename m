Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80116DDA3
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 09:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U0ss+Xvf"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5EE39A7
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 02:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698657790; x=1730193790;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=X+o7r58DwH6QPr2lw/xiWWe/NWITLivcoCuvEoVm5cA=;
  b=U0ss+XvfJ0HoyrRTh+xfWwHwDnZNGaUE3fLzG69wL9Bo2blxRmK7Pa/p
   HktLnaLJJER+fGV3xipNJJk7kljQXWsYA1QKN7+eXXTo5Hck/ZxUU/cmi
   9Y26sDcIqjugw1wFm6Q9Pt210Z9LCDHS7bXL1YoIcOFVT+lJT4nvVwbPJ
   vdVdSIKISZ4CrU3tSGd0TRMbFQ98IWl50pdowxzAHA3GvNh73sb61ilea
   UKUoyAbAbJaAWDf8gLtP9gaYdTmNS5RzLaI71WU/rMgFJIbH6JEnewwX3
   OUPbtBKC0anqCeU6N21QR7EC4ZR+41bmdlwpQEMx7wmftxpQlGS8mCbJA
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="367386043"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="367386043"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2023 02:23:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="760217943"
X-IronPort-AV: E=Sophos;i="6.03,263,1694761200"; 
   d="scan'208";a="760217943"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
  by orsmga002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 30 Oct 2023 02:23:09 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 02:23:08 -0700
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 30 Oct 2023 02:23:08 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 30 Oct 2023 02:23:08 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 30 Oct 2023 02:23:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V3oxMlfLWJBYFvAHmitSio0jUBx9f2O3LVBoDCcrbK7MOODxo93g1RowbnvcjK4xcxrCLFPGB8ut0ZlH8VuhL7EDHTBIcYZ6qqSh/z4Qk8D9adtFyTmxxQSv3ZO2kpKP7yJvDMbcN9v2ybfquJrR88Q5yolCjXH4RiBHHuO8G0jBUbKQkF3fEuEXXYpzlva+cfp805T86buJ0ACZoGG+xKWnprXTNz989fGyKjaaninPacSGH6kfxNSrlet4L1vdrtROffPe+ahN5XegwvCjWlfot6qhw8hbVRCR1oGxtfOhNdnDmEdFiwHT1gno8Qp6/gBGX/C6y6tcl9DeL7kpRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6AWxSe5hdmmV2u2wEgAn/aXaUY+BUtqx42CB19mVr64=;
 b=Bhgk3kRiNitsPmOTu5p67YL5CAdIFtKlKl2YrEbIEwBYNqhQdh4Ug1McagSMstyk9Tk/qZdNWhmr2Z7wyamK6tmAzIRnhl3cnzdUjMF5s0+NhrFz/TPedtAgeOm7ot1yceLcMbrk8yldzct4FswlwC34JncxHPj8mQxVtUC0crXaMaUD4sAMcm4M1nicBm5ICfauE0Qv7mqrDK8NpqzonSpMWyEAWsv+6fQT5H0NsGlwpRIWLrQOBr2N3X4QQSNcHIgUiSvbMO8qeZ2YfJuzqT7cxuVbq+joaWkpKcq7apnFixR5RLiwZ41scgYqs93wf3ebL2S+i1kgAsxgG9maCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by IA0PR11MB7838.namprd11.prod.outlook.com (2603:10b6:208:402::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 09:23:05 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 09:23:05 +0000
Date: Mon, 30 Oct 2023 17:18:20 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Jonathan Corbet <corbet@lwn.net>
CC: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>,
	<linux-doc@vger.kernel.org>, <linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [PATCH] scripts/kernel-doc: fix make htmldoc warning
Message-ID: <ZT903NuvWk7cLT1q@yujie-X299>
References: <20231028182231.123996-1-swarupkotikalapudi@gmail.com>
 <87a5s15mm5.fsf@meer.lwn.net>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <87a5s15mm5.fsf@meer.lwn.net>
X-ClientProxiedBy: SI2PR06CA0010.apcprd06.prod.outlook.com
 (2603:1096:4:186::6) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|IA0PR11MB7838:EE_
X-MS-Office365-Filtering-Correlation-Id: fc1eea17-fee8-41f1-1eec-08dbd929d26e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZgTCHaZpNa/90rUx6CL+aXMr4rioR9BKCeUX2YVn70RV2NcQeeQTGvf34VvsS9gFVZpyx3K5RwC7Ym975xvonAdNfghK3rxxWwNVh2vy39co5idiBf9VvxHEQYkPJRl54KjloJWQ4Au8y+Q4SyDzUekQr3YCrHPlSKF5DqbqnknP2W3L4YbUhh0Vih4dnbVVvUaTlXDlSQ47CDHCdYuYmAiFqkxbsRTlqHTaujzkOqv7xyTZHpa4Sh0zIOYmy5rxADxglGN2hc/BLvJ+V8gkpO+GeC8VqQpFWa27u/4TX8zTbvMf526il202r9TApXgm2Qi9JzNnwtlnu7Day67Zygm5BfZTMC6DOObvMSPQSQcAlN7+H7cFGd/2t8s/PL5X7UVZ2mLjmd5BUgsCKtghvLV5aswa+RiIn5wguS25aoGSlxMItY8ssCuB/kyGvHymNdtE2vPtqFFrkQuR0O7dvvR82GibLxMKysfPLO0Fhq/Gaf73oxX5xsWbca3iF8i6GnE32gfa6Lnz/LUcKAwRojKFwCqczamqBUamWyf5TMbHvTZ4K5WsuxUAsZ0u2t/6lVioMT49+X+HuxMoRpmxNnQ3BqRiU0DYRNrOwrPxbQIhOhHNoyCyUl1Kjn1Q3MCY
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(366004)(346002)(396003)(39860400002)(376002)(136003)(230922051799003)(230173577357003)(230273577357003)(1800799009)(186009)(64100799003)(451199024)(6506007)(6666004)(6512007)(9686003)(966005)(6486002)(478600001)(83380400001)(26005)(2906002)(5660300002)(33716001)(66946007)(41300700001)(66556008)(6916009)(66476007)(4326008)(44832011)(8936002)(8676002)(316002)(86362001)(38100700002)(82960400001);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?8thhqVMO8ky3RuOpquTHP8cSajj+EUJtoqCi1TB5Vgm26ZKlIrkjBCk1hGXu?=
 =?us-ascii?Q?PVagzx0hWrDfiMBj56UlJIAjfi88Ol8j3X4vP/4kjDHYuabsiN9vIwNNcxVw?=
 =?us-ascii?Q?tJA5OTh09Vf7NkweIfo+Kfku0orE8WBSCf0EDBDfs3Sj+WWnpOJxjvvg7+7x?=
 =?us-ascii?Q?oMDu7ApF29AcaoJduOVs+z6EioTurPQdA4rK/y88+UU8vX+bgvFoUy1TBSbI?=
 =?us-ascii?Q?BCZIG8Fx2D3e5r/4SFXJxz1NSvXvjrRA4b8gmWFYanhf3oY2EtFWtAM88Sy1?=
 =?us-ascii?Q?QHHiYXBqHS5J508C3GgH+bppG9Ew8P3nEEHc8h5IrEbRDGt7zVqkBGSJKf9J?=
 =?us-ascii?Q?W3XE8Q0HRQBy/tSGIsvuE8wDvL6QvFkl9rM0XE7Q+B+fGWuSqbAML1/y5bNs?=
 =?us-ascii?Q?LFkAR0bmwzv9O8cMA3jzUv0CJz2/Fh3ttzzwEhyciVbLCezEJcJOOVR54Jz2?=
 =?us-ascii?Q?TsfUXWMQrcNktXbOD4WPkrd17nrAdjC9q2haDUdAyB8aaRmEy1NxbcW7Yci6?=
 =?us-ascii?Q?gaIFbonTpVUxmVscf2uvHxfc7Tx9wWWyfoT3t3TP3g34cmITGFgl/HwPGj0S?=
 =?us-ascii?Q?xZuufMCZDrfAV17qAR2ibGPnEjEFXrzsrCvekFIs79teG+fF/OtPaQVweHea?=
 =?us-ascii?Q?DTBURtNJUOl2L8LfE38STwZnsqB3TKV5NdP2W0laP1i8jMd6dClBbUMvsZBH?=
 =?us-ascii?Q?tVeHh+ts12k1PDGyHv1uxxxoV4y+VlglG/gdH1JmOedOmqz7hfi69DbAkYr7?=
 =?us-ascii?Q?2Dk4/yhjR7P76zhcsGrKeeBE+sfnozHpaYXyrDGPpZniyWEXOE8yTbqIkKPm?=
 =?us-ascii?Q?m0P2eboJOKzmlAtR0z4A+pjiFfLJtNkymSaxQiyPVV/tRbe2TAP6jblHdXZe?=
 =?us-ascii?Q?b/U8V0BdsXnTAFrR6r67zkF1UOoMgKsuQoJu4NI9PyxSrvdhm2xUNyFA1mvP?=
 =?us-ascii?Q?eN6LNILZqhjTZmpYH+JjSIWx/IWTjV/l7FoiYe3WIX+zWKKpKd3AFX16uQaB?=
 =?us-ascii?Q?9S7bzgOev9Pw/d9Gb0bB2UDa82QHRzdwaivwEQduGl38lJojAqZZKMES2rvo?=
 =?us-ascii?Q?7hIiXd0SwKKtGoLYNLkUzrdWpL2yYg7eume4rFsLGUNKVRt5ene6IaQIUot8?=
 =?us-ascii?Q?764DGb5h3WmSI3KfoNCResLQgOJ/j2izbAj1xhc5m0uPLj0Z5ZJzZFgxqRVy?=
 =?us-ascii?Q?SyyempZxJGaLlJjnmbFz3miRa4yW9mZxFv20eqW9BhcJWf6GUxbDJjwq+o3o?=
 =?us-ascii?Q?F1x2ta0N4Cqucy4KDwrcYbkAEbG8GtPMVrWA9jGGPUepTeZBMBm9vfXSF9+d?=
 =?us-ascii?Q?94tnHY51OPH2htm/JAffacB4xkOkZQwXOy9eAkW0bvv4F9aVk5I6q+OSVBhC?=
 =?us-ascii?Q?kaU7+KV+NDemvPI/EZrs0WX2uJzTkCqv77KM467BTzw7LKENJqEQVReNbuzV?=
 =?us-ascii?Q?doEw6xo3Ex4puNGl4iPdmS5mRS/Wvcsl5W36cJz/ffXEGQPHIOKILlEqv0uw?=
 =?us-ascii?Q?DOqBlA5/zVZ/ptE8PfZQ+vUjxZl55aR30h6UtGhxr4ajJ6iMVhiNzL30MouL?=
 =?us-ascii?Q?8HHeG+4f5hhaXIodL9btJxwD2WvxYZAHTWG4U0Or?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fc1eea17-fee8-41f1-1eec-08dbd929d26e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 09:23:05.1794
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zjvWhojFAPwwIlDzy8rqJYCWQdhKjggL0t4TwsH7EYqqyPGcYNf6u8TQY4B3BJJEXJDaUCjPKyg2lWYA5EWUwA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7838
X-OriginatorOrg: intel.com

On Sun, Oct 29, 2023 at 12:06:58PM -0600, Jonathan Corbet wrote:
> Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> writes:
> 
> > make htmldocs has below warnings:
> >
> > ..
> > Variable length lookbehind is experimental in regex;
> > marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
> > <-- HERE / at ./scripts/kernel-doc line 188.
> > ...
> 
> So how do you get this warning?  I've not seen it.  Which version of
> Perl? 

Hi Jon, I can get this warning with perl v5.34.0, but not with perl
v5.36.0.

I checked the git history of perl, variable length lookbehind is mostly
no longer considered experimental by the commit below that was included
in v5.36.0.

commit c15a34bfb4f54341de8e463d45b5bcbaad235350
Author: Yves Orton <demerphq@gmail.com>
Date:   Wed Feb 23 07:06:22 2022 +0100

    regcomp.c: Reduce scope of experimental warnings with lookbehind


Sorry for accidentally introducing this issue on old version of perl.
The fix patch has been sent at [1]

[1] https://lore.kernel.org/all/20231030085404.3343403-1-yujie.liu@intel.com/

Best Regards,
Yujie

> > "-Werror" option in make command,
> > needs "-Werror" to have space before
> > and after while running make command,
> > hence space checking is sepratly done,
> > and is not part of lookbehind regular expression.
> >
> > Below command also didn't
> > show any error:
> >  make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o
> >
> > Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
> > Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> > ---
> >  scripts/kernel-doc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index d660e1f4b483..aa9e3e198d12 100755
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
> >  if (defined($ENV{'KCFLAGS'})) {
> >  	my $kcflags = "$ENV{'KCFLAGS'}";
> >  
> > -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
> > +	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
> >  		$Werror = 1;
> >  	}
> >  }
> 
> Thanks,
> 
> jon
