Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5BA267D2F0
	for <lwn-linux-doc@archive.lwn.net>; Tue, 23 Jul 2019 09:26:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729232AbfGWJ02 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 23 Jul 2019 05:26:28 -0400
Received: from mga11.intel.com ([192.55.52.93]:64630 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727266AbfGWJ01 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 23 Jul 2019 05:26:27 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 23 Jul 2019 02:26:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,298,1559545200"; 
   d="scan'208";a="344686884"
Received: from fmsmsx105.amr.corp.intel.com ([10.18.124.203])
  by orsmga005.jf.intel.com with ESMTP; 23 Jul 2019 02:26:26 -0700
Received: from bgsmsx105.gar.corp.intel.com (10.223.43.197) by
 FMSMSX105.amr.corp.intel.com (10.18.124.203) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Tue, 23 Jul 2019 02:26:26 -0700
Received: from bgsmsx101.gar.corp.intel.com ([169.254.1.176]) by
 BGSMSX105.gar.corp.intel.com ([169.254.3.139]) with mapi id 14.03.0439.000;
 Tue, 23 Jul 2019 14:56:23 +0530
From:   "Gote, Nitin R" <nitin.r.gote@intel.com>
To:     Joe Perches <joe@perches.com>, Kees Cook <keescook@chromium.org>
CC:     "corbet@lwn.net" <corbet@lwn.net>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "apw@canonical.com" <apw@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>
Subject: RE: [PATCH v5] Documentation/checkpatch: Prefer strscpy/strscpy_pad
 over strcpy/strlcpy/strncpy
Thread-Topic: [PATCH v5] Documentation/checkpatch: Prefer
 strscpy/strscpy_pad over strcpy/strlcpy/strncpy
Thread-Index: AQHVPFiM9cWMTc5Km0imVXiG0lTtQKbWkWuAgAAC7gCAAUjQQA==
Date:   Tue, 23 Jul 2019 09:26:23 +0000
Message-ID: <12356C813DFF6F479B608F81178A561587ABA9@BGSMSX101.gar.corp.intel.com>
References: <20190717043005.19627-1-nitin.r.gote@intel.com>
         <201907221029.B0CBED4F@keescook>
 <28404b52d58efa0a3e85ce05ce0b210049ed6050.camel@perches.com>
In-Reply-To: <28404b52d58efa0a3e85ce05ce0b210049ed6050.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiMjBhMDJiYjQtNTEzYy00MzQ5LTlkYTktNTRlZThhY2JhNjhlIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiOW9FcGxDcGpvbTJ1eHdcLzRvWURPVXdVWTZ4MDh4OXVpbkFrd2h1WGFjaDg5aUhRYmhJV1g0WkFaNVFJSUkxVTQifQ==
x-originating-ip: [10.223.10.10]
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


> -----Original Message-----
> From: Joe Perches [mailto:joe@perches.com]
> Sent: Monday, July 22, 2019 11:11 PM
> To: Kees Cook <keescook@chromium.org>; Gote, Nitin R
> <nitin.r.gote@intel.com>
> Cc: corbet@lwn.net; akpm@linux-foundation.org; apw@canonical.com;
> linux-doc@vger.kernel.org; kernel-hardening@lists.openwall.com
> Subject: Re: [PATCH v5] Documentation/checkpatch: Prefer
> strscpy/strscpy_pad over strcpy/strlcpy/strncpy
> 
> On Mon, 2019-07-22 at 10:30 -0700, Kees Cook wrote:
> > On Wed, Jul 17, 2019 at 10:00:05AM +0530, NitinGote wrote:
> > > From: Nitin Gote <nitin.r.gote@intel.com>
> > >
> > > Added check in checkpatch.pl to
> > > 1. Deprecate strcpy() in favor of strscpy().
> > > 2. Deprecate strlcpy() in favor of strscpy().
> > > 3. Deprecate strncpy() in favor of strscpy() or strscpy_pad().
> > >
> > > Updated strncpy() section in Documentation/process/deprecated.rst
> > > to cover strscpy_pad() case.
> > >
> > > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> >
> > Reviewed-by: Kees Cook <keescook@chromium.org>
> >
> > Joe, does this address your checkpatch concerns?
> 
> Well, kinda.
> 
> strscpy_pad isn't used anywhere in the kernel.
> 
> And
> 
> +        "strncpy"				=> "strscpy, strscpy_pad or for non-
> NUL-terminated strings, strncpy() can still be used, but destinations should
> be marked with __nonstring",
> 
> is a bit verbose.  This could be simply:
> 
> +        "strncpy" => "strscpy - for non-NUL-terminated uses, strncpy() dst
> should be __nonstring",
> 

But, if the destination buffer needs extra NUL-padding for remaining size of destination, 
then safe replacement is strscpy_pad().  Right?  If yes, then what is your opinion on below change :

        "strncpy" => "strscpy, strcpy_pad - for non-NUL-terminated uses, strncpy() dst
should be __nonstring",


> And I still prefer adding stracpy as it
> reduces code verbosity and eliminates defects.
> 

-Nitin
