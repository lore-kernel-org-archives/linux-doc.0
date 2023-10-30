Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0D9D1362
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 05:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWMuBkyO"
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76F4C90
	for <linux-doc@vger.kernel.org>; Sun, 29 Oct 2023 22:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698644533; x=1730180533;
  h=date:from:to:cc:subject:message-id:references:
   in-reply-to:mime-version;
  bh=IPHxK21Jfw3JEpptWPFwsz/ctp8KlXu7HwXwQ0qih5I=;
  b=dWMuBkyOLNASXtpRrFjqrAKEiZ0uJgBaOsXcZlNn7Z/NfQ9SN9TiRJDc
   4zU5QvLfdPcAhMo4eZzI206tm2jE6ymYZDbdeAXIlpWpgU9GVa5xaNvql
   ra/sSFCoersxmHzKul/z3eLrtcBDQVy1H+7qLtw0412sNR86jTpk2lG3h
   OGfjer0SeO5cXUjniYgoOJOUjqs53xslTdHaRZ76WPr/gEJe3iUmyG74V
   3iK4cPVMdKRDyZyPSdlLOA/EVftnL2jQ5K3IA7TN7c1dM3MWvkPerhS5C
   EyQaA1rXVEMkX4ob4vvfkg93f3ewrZXK0rrTbmKjknN0zTN6+DeLUQ93f
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="474248132"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="474248132"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2023 22:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10878"; a="883756152"
X-IronPort-AV: E=Sophos;i="6.03,262,1694761200"; 
   d="scan'208";a="883756152"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
  by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384; 29 Oct 2023 22:42:10 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Sun, 29 Oct 2023 22:42:10 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Sun, 29 Oct 2023 22:42:10 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.101)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Sun, 29 Oct 2023 22:42:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AZmSz5zI4hJda4KlOVAsHwBN1867eOPrdM0tv1vaf1HozMd63DolrentuATMUYGBn6MTG5+euo4HmWO7j8kALP6QIZKxMd93DjbGixTWi66njE9z3WC/oKgxu+GrM4Cx7hRrKJzBscZWImBXF1XAyFJ12wPiMp3SSXcrknksoJCRyRHUQssLwJFoKoNKBHyostRzclUM6oWI19vcWpSbakPJ8gOm4wNRwHNiT20F7bPbJFOOhzzxntqF1bUFmTvxx2C1lFdrh9p0DIlG8ANNEKJJQ7JFGMaHoEvkoSn5fzKBWJgOIb9LJwaDuuXXYEB8vGjL8A6Vk+8smHd+BU4log==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aMhl7Q0R85mJwj0udKIy9GP46Ppvmi3AZcCXZK/jJBA=;
 b=mvTwCcbFCpObtauOFi86M2RSuvrc8F67XebHQvDPd0stGpEfBZag6wen8KtL8HsksqcOF5BSgZrdOMykIxy5a5wjgu8jjqzTI4it487tQOvCFcm1DdC+seWSljZq6axl7re7xHxJlDeBHhgbLSmppY81p6AqlEAWmD57sC6AXPSUqbj2FOPepmQVSNRMnUvuTyOAkPxxCmcpWauBfMco78C/TPhCQoZhOE2qdVzw/1jt8J35IzE9BNtpWLjO0ietfIglEg46N2oDDGHUGBZLCNqeHlVZoMUIVsg/U6JBSigSvy/KHWO48x98BkWKWahMCjqRpiZSVwC+s+TvwIqwXA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6392.namprd11.prod.outlook.com (2603:10b6:930:37::15)
 by PH8PR11MB6562.namprd11.prod.outlook.com (2603:10b6:510:1c1::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.28; Mon, 30 Oct
 2023 05:42:08 +0000
Received: from CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86]) by CY5PR11MB6392.namprd11.prod.outlook.com
 ([fe80::15d3:7425:a09e:1c86%4]) with mapi id 15.20.6933.028; Mon, 30 Oct 2023
 05:42:08 +0000
Date: Mon, 30 Oct 2023 13:37:22 +0800
From: Yujie Liu <yujie.liu@intel.com>
To: Akira Yokosawa <akiyks@gmail.com>, Swarup Laxman Kotiaklapudi
	<swarupkotikalapudi@gmail.com>
CC: <corbet@lwn.net>, <linux-doc@vger.kernel.org>,
	<linux-kernel-mentees@lists.linuxfoundation.org>
Subject: Re: [PATCH] scripts/kernel-doc: fix make htmldoc warning
Message-ID: <ZT9BEtrVZCs7/pQv@yujie-X299>
References: <87a5s15mm5.fsf@meer.lwn.net>
 <645ffbbc-8b33-4a93-94b6-6487e31c7f4b@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <645ffbbc-8b33-4a93-94b6-6487e31c7f4b@gmail.com>
X-ClientProxiedBy: SG2PR04CA0197.apcprd04.prod.outlook.com
 (2603:1096:4:14::35) To CY5PR11MB6392.namprd11.prod.outlook.com
 (2603:10b6:930:37::15)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6392:EE_|PH8PR11MB6562:EE_
X-MS-Office365-Filtering-Correlation-Id: 59e4667a-7047-4ff9-c2ae-08dbd90af480
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: BejMouNue6aWieRfZGm2FXlSJWKxMlanor4LazWiGmFmshx/MDQ+DhSLAllLd+3QGLfs0OaIBZ5bEHlrYjzvouCgSqrVdCb03kmUbLdprPyDPpb9ThW9AgNd7A3RbfgJBRZfM9u0kfeiOy0SrsEfbFlDirbic0PiWOfYpWfDxapJb3xQ4eethLZdYLREhhpzMRkgI6ZGs0WjAZKoIKk9UoRS4qngvQ/9lGFEC81x337Pen4xJ8Bqew3FxyjntBSzRgwVlydKhXh6tfVfis5bqYgIxKzpXU1wwu0inLgsqseoo89g9R0bVtkQ5rga14e6HuADF0udiXI+8Rs2viRA5tn9UO6tfVkpF7h/WgiFvHeNORKx3MtaBf299MTil8ZTrzd1tlml7g6yUAlPlPtsHysgQ4Fx/5e9r3n0QbPufafcDyI3pd0X7fUfKl3PTDL9ZzyrNVJdlFIJRrMm5J2jmncXEXoJ7I7I+Cd/DGlIaOMObdlb/Mw86h7CZhIiNtOGeLn4Bd6GtD+ij4UJZ9hefFt19XGo6KjgHJ375XUqStSZSsZzzwJjC3GMlRt8IrYwWOdvbUTehXag1OPyJUUapDBZ1Mokmp8ZC2UbHjuov7IMWHHYiMIm34Lss0LCnofX
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CY5PR11MB6392.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(7916004)(376002)(366004)(346002)(136003)(39860400002)(396003)(230273577357003)(230922051799003)(230173577357003)(186009)(64100799003)(451199024)(1800799009)(38100700002)(86362001)(478600001)(6486002)(82960400001)(33716001)(6512007)(6506007)(6666004)(9686003)(41300700001)(8936002)(4326008)(8676002)(44832011)(5660300002)(83380400001)(26005)(2906002)(66946007)(66556008)(66476007)(110136005)(316002);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vb0cG2T6Phdcaf6w3Zh82QegpGmEirUu3JkR2m42gZ8K+Cc/tN+xk5tw6W2Z?=
 =?us-ascii?Q?cnhKi15WkvQoCcMN5hCJYQ49ggpeH43PufN7OukMsTW6CzuUGdZl8B0DrM7n?=
 =?us-ascii?Q?GrcHQkVqXvGR06Ip8F+3CukHsSWic1cqsrdHv4JVT1zA2K1w4VdSyFBvqEKa?=
 =?us-ascii?Q?IwJbXwdA666rR1K/9auRvSD7efp6IMjMrloQip8ACDE+O0twZvZUua+g8wee?=
 =?us-ascii?Q?k8H5KdYKr/0gjAQwbVQ7SGeuENEyCgNdwyUYZxPJuF7JbD4uD6dkaaS4oUoW?=
 =?us-ascii?Q?Npv7AXHJVNEbBweTAw8di40Z/JOQe/pzkBzH9d8i8m1+Ibk9Ev+kKDPCKyzF?=
 =?us-ascii?Q?8OnMCV/15mwSPnE8/7I7ApiK8kV2qpw0IaCpvnPp1Qzl7SzddqvHdTXvEHPf?=
 =?us-ascii?Q?9N6x7Mv6CQqewQ3rwYAaMOeJcUMGO4bGdDJDYeJTQeR52oQHwwv1t77hAUh6?=
 =?us-ascii?Q?nnq3T20HXLTP5ii167IaUB/pVNjB8qv9I2iRWP91pznCuW/Ii6dDz/j55A7T?=
 =?us-ascii?Q?5G81dCNKBQS05fMzYDe4yiHacPPfSFuJY5aUwwC1cC2fw0QQH5CGnb5cu51L?=
 =?us-ascii?Q?QCZu2+a7nUe4hydQqVhCUDL36Hmlv0HGoqA9+Y21Muz8t03V14PlL43Kk/Xq?=
 =?us-ascii?Q?LO2StOOeJpMTTKLNlPFDXCMKFoyjUENqz6o3efgIlIWJGqsBvdCj7Z7/cxBD?=
 =?us-ascii?Q?e7kQSDQRw8xQXdNvp7GgWqDlIsMMq4htn1y6BhHvHGS1CKvvSBe07Q4BJjAA?=
 =?us-ascii?Q?ApKWzEvcS2juRVhfMA9ylbUBVbYggPD0BW1D3c6rvRn0tsYlI8PDVunPnmB/?=
 =?us-ascii?Q?u0Bu9cbWIfJyLtr+UdUxY5EJ5J31A4HRCWw6YoYjnECamUabk7R2LXGtsKb+?=
 =?us-ascii?Q?R2CuNsiXQ30JI2jRVmICaRPW8Yj2Mux9i8tuoet3EGk3u2YdPtC3fGAuvy/2?=
 =?us-ascii?Q?myqNLmWAjO1pd9AE/TGXHflG8xcZ/4HkV/nj4e4pwHhmpEIpt4B3Z3GZVjGD?=
 =?us-ascii?Q?ZzD73wjoQ4cc9h7RzWRq/3nem65WUMiiDS/Kw1NrhwcNZACojuRcRqvnX2s9?=
 =?us-ascii?Q?EwOUr8USzikIBGcxIDjkU0X8dkEGusnj9SC6G/9iAM89V7HRX45MPW52P1DN?=
 =?us-ascii?Q?cDGjM/kQizhdG7H+oduRoVJlSe0QO17Kg3kfjeulBjC81IsopqBsllE8NQKb?=
 =?us-ascii?Q?Nak3IUn24hwHUtvhRZnoX8BhjYR/CyVBqdPE85Z56x8oNnnC2Ugi0U1PIQmu?=
 =?us-ascii?Q?/QRvWxVcbdDcdE+f/VgJDzPD6o7RsCF6ZYnmUb7F8Ip+yFyyykD5J28GpnjX?=
 =?us-ascii?Q?WkPv3wNLdLsAl5UpE95XVajzKR89UFACRUbkzPkxy5CqnnZPhXA5EYcVPhPp?=
 =?us-ascii?Q?6UzlZN63Ge7+MjuTI+7ZIDgsBfi/TlFncsl0dylkcnRdHh2TzHVmRpJIYuE1?=
 =?us-ascii?Q?s/fAi+s4Jo60ZG4k9EXX3D7ghWeraDDGuXLuzIW09viRNslMt8Jv8wbv6J3v?=
 =?us-ascii?Q?vWZGWBzxVgtHjpPjyNJaWh9tB8MPJ2zhVv0SBC2bxxDghVs6OD5DFP4UpQQm?=
 =?us-ascii?Q?evGgvU+CWuK+WCY2/CRjNbVkFSG11iTKQTRtFhxO?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 59e4667a-7047-4ff9-c2ae-08dbd90af480
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6392.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2023 05:42:08.1018
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Phbl9P3ExZkOLhRltlFfSL2pAj6hNpj/nIftXeNSQXVAM45X2vegy29QXpuvAxh+0jTg7QHlkGAMwsmPIAw4Cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB6562
X-OriginatorOrg: intel.com

Hi,

On Mon, Oct 30, 2023 at 09:02:32AM +0900, Akira Yokosawa wrote:
> Hi,
> 
> On Date: Sun, 29 Oct 2023 12:06:58 -0600, Jonathan Corbet wrote:
> > Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com> writes:
> > 
> >> make htmldocs has below warnings:
> >>
> >> ..
> >> Variable length lookbehind is experimental in regex;
> >> marked by <-- HERE in m/(?<=^|\s)-Werror(?=$|\s)
> >> <-- HERE / at ./scripts/kernel-doc line 188.
> >> ...
> > 
> > So how do you get this warning?  I've not seen it.  Which version of
> > Perl? 
> 
> I get this warning on Ubuntu 22.04LTS, whose perl is v5.34.0.
> 
> Swarup's change silences the warning there.
> 
> I could provide a tested-by: tag if I was familiar with that
> "variable length lookbehind" thing ...
> 
>         Thanks, Akira
> 
> > 
> >> "-Werror" option in make command,
> >> needs "-Werror" to have space before
> >> and after while running make command,
> >> hence space checking is sepratly done,
> >> and is not part of lookbehind regular expression.

Thanks a lot for the input, but I'm afraid that "have space before
and after -Werror" is not very general use case.

For example, the following command only has "-Werror" in KCFLAGS env
variable, no space before or after it. The purpose of this command is to
turn all warnings into errors, including kernel-doc ones, but after
applying your fix patch, the kernel-doc warnings are not considered as
errors:

$ make W=1 KCFLAGS="-Werror" kernel/fork.o
...
  CC      kernel/fork.o
kernel/fork.c:1405: warning: Function parameter or member 'mm' not described in 'set_mm_exe_file'
kernel/fork.c:1405: warning: Function parameter or member 'new_exe_file' not described in 'set_mm_exe_file'
kernel/fork.c:1442: warning: Function parameter or member 'mm' not described in 'replace_mm_exe_file'
kernel/fork.c:1442: warning: Function parameter or member 'new_exe_file' not described in 'replace_mm_exe_file'
kernel/fork.c:1494: warning: Function parameter or member 'mm' not described in 'get_mm_exe_file'
kernel/fork.c:1513: warning: Function parameter or member 'task' not described in 'get_task_exe_file'
kernel/fork.c:1537: warning: Function parameter or member 'task' not described in 'get_task_mm'
kernel/fork.c:2112: warning: bad line:
kernel/fork.c:2133: warning: Function parameter or member 'ret' not described in '__pidfd_prepare'
kernel/fork.c:2133: warning: Excess function parameter 'pidfd' description in '__pidfd_prepare'
kernel/fork.c:2182: warning: Function parameter or member 'ret' not described in 'pidfd_prepare'
kernel/fork.c:2182: warning: Excess function parameter 'pidfd' description in 'pidfd_prepare'
kernel/fork.c:3198: warning: expecting prototype for clone3(). Prototype was for sys_clone3() instead
$ echo $?
0

As I described in the message of commit 91f950e8b9d8, this regex should
match the general case that "there needs to be a space *OR* start of string
before -Werror, and a space *OR* end of string after -Werror."

Please feel free to try the followinn cases to see if all of them can
work as expected. MATCH means kernel-doc warnings are considered as
errors, while NO MATCH means not.

    KCFLAGS="-Werror" make W=1 kernel/fork.o [MATCH]
    KCFLAGS="-Werror=return-type" make W=1 kernel/fork.o [NO MATCH]
    KCFLAGS="-Wcomment -Werror" make W=1 kernel/fork.o [MATCH]
    KCFLAGS="-Wcomment -Werror=return-type" make W=1 kernel/fork.o [NO MATCH]
    KCFLAGS="-Werror -Wundef" make W=1 kernel/fork.o [MATCH]
    KCFLAGS="-Werror=return-type -Wundef" make W=1 kernel/fork.o [NO MATCH]
    KCFLAGS="-Wcomment -Werror -Wundef" make W=1 kernel/fork.o [MATCH]
    KCFLAGS="-Wcomment -Werror=return-type -Wundef" make W=1 kernel/fork.o [NO MATCH]

Best Regards,
Yujie

> >>
> >> Below command also didn't
> >> show any error:
> >>  make KCFLAGS="-Werror=return-type" W=1 kernel/fork.o
> >>
> >> Fixes: 91f950e8b9d8 ("scripts/kernel-doc: match -Werror flag strictly")
> >> Signed-off-by: Swarup Laxman Kotiaklapudi <swarupkotikalapudi@gmail.com>
> >> ---
> >>  scripts/kernel-doc | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >> diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> >> index d660e1f4b483..aa9e3e198d12 100755
> >> --- a/scripts/kernel-doc
> >> +++ b/scripts/kernel-doc
> >> @@ -185,7 +185,7 @@ if (defined($ENV{'KBUILD_VERBOSE'}) && $ENV{'KBUILD_VERBOSE'} =~ '1') {
> >>  if (defined($ENV{'KCFLAGS'})) {
> >>  	my $kcflags = "$ENV{'KCFLAGS'}";
> >>  
> >> -	if ($kcflags =~ /(?<=^|\s)-Werror(?=$|\s)/) {
> >> +	if ($kcflags =~ /(?<=^|)(\s)-Werror(?=$|)(\s)/) {
> >>  		$Werror = 1;
> >>  	}
> >>  }
> > 
> > Thanks,
> > 
> > jon
> 
