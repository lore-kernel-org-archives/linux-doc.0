Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9E117D2F0
	for <lwn-linux-doc@archive.lwn.net>; Thu, 25 Jul 2019 07:26:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726622AbfGYH0T convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 25 Jul 2019 03:26:19 -0400
Received: from mga17.intel.com ([192.55.52.151]:29687 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725901AbfGYH0T (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 25 Jul 2019 03:26:19 -0400
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 25 Jul 2019 00:26:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,306,1559545200"; 
   d="scan'208";a="369045294"
Received: from fmsmsx104.amr.corp.intel.com ([10.18.124.202])
  by fmsmga005.fm.intel.com with ESMTP; 25 Jul 2019 00:26:18 -0700
Received: from fmsmsx115.amr.corp.intel.com (10.18.116.19) by
 fmsmsx104.amr.corp.intel.com (10.18.124.202) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 25 Jul 2019 00:26:18 -0700
Received: from bgsmsx106.gar.corp.intel.com (10.223.43.196) by
 fmsmsx115.amr.corp.intel.com (10.18.116.19) with Microsoft SMTP Server (TLS)
 id 14.3.439.0; Thu, 25 Jul 2019 00:26:17 -0700
Received: from bgsmsx101.gar.corp.intel.com ([169.254.1.176]) by
 BGSMSX106.gar.corp.intel.com ([169.254.1.120]) with mapi id 14.03.0439.000;
 Thu, 25 Jul 2019 12:56:15 +0530
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
Thread-Index: AQHVPFiM9cWMTc5Km0imVXiG0lTtQKbWkWuAgAAC7gCAAUjQQIACQMYQ//+ojoCAASyA8A==
Date:   Thu, 25 Jul 2019 07:26:14 +0000
Message-ID: <12356C813DFF6F479B608F81178A561587AF87@BGSMSX101.gar.corp.intel.com>
References: <20190717043005.19627-1-nitin.r.gote@intel.com>
         <201907221029.B0CBED4F@keescook>
         <28404b52d58efa0a3e85ce05ce0b210049ed6050.camel@perches.com>
         <12356C813DFF6F479B608F81178A561587ABA9@BGSMSX101.gar.corp.intel.com>
         <12356C813DFF6F479B608F81178A561587AE45@BGSMSX101.gar.corp.intel.com>
 <0d69778626901a841108ae024b8a105da679d9af.camel@perches.com>
In-Reply-To: <0d69778626901a841108ae024b8a105da679d9af.camel@perches.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-product: dlpe-windows
dlp-version: 11.0.600.7
dlp-reaction: no-action
x-ctpclassification: CTP_NT
x-titus-metadata-40: eyJDYXRlZ29yeUxhYmVscyI6IiIsIk1ldGFkYXRhIjp7Im5zIjoiaHR0cDpcL1wvd3d3LnRpdHVzLmNvbVwvbnNcL0ludGVsMyIsImlkIjoiNjA2MmU2MDMtODE1OS00Y2ZlLTg1OTctYzBlYjYzZTY3ZmZjIiwicHJvcHMiOlt7Im4iOiJDVFBDbGFzc2lmaWNhdGlvbiIsInZhbHMiOlt7InZhbHVlIjoiQ1RQX05UIn1dfV19LCJTdWJqZWN0TGFiZWxzIjpbXSwiVE1DVmVyc2lvbiI6IjE3LjEwLjE4MDQuNDkiLCJUcnVzdGVkTGFiZWxIYXNoIjoiT3lwQWZjNG1Mam05elRjRlwvNkdNaWFXTWRRMDBMZlBVZlpJZlVlK1hYRW1XNkZIUStFMzJTVXkrMUtkeFJ4c0MifQ==
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
> Sent: Wednesday, July 24, 2019 11:59 PM
> To: Gote, Nitin R <nitin.r.gote@intel.com>; Kees Cook
> <keescook@chromium.org>
> Cc: corbet@lwn.net; akpm@linux-foundation.org; apw@canonical.com;
> linux-doc@vger.kernel.org; kernel-hardening@lists.openwall.com
> Subject: Re: [PATCH v5] Documentation/checkpatch: Prefer
> strscpy/strscpy_pad over strcpy/strlcpy/strncpy
> 
> On Wed, 2019-07-24 at 18:17 +0000, Gote, Nitin R wrote:
> > Hi,
> 
> Hi again.
> 
> []
> > > > > > 3. Deprecate strncpy() in favor of strscpy() or strscpy_pad().
> 
> Please remember there does not exist a single actual use of strscpy_pad in
> the kernel sources and no apparent real need for it.  I don't find one anyway.
>

Thanks for clarification. I will remove strscpy_pad() from patch. 

> > Could you please give your opinion on below comment.
> >
> > > But, if the destination buffer needs extra NUL-padding for remaining
> > > size of destination, then safe replacement is strscpy_pad().  Right?
> > > If yes, then what is your opinion on below change :
> > >
> > >         "strncpy" => "strscpy, strcpy_pad - for non-NUL-terminated
> > > uses,
> > > strncpy() dst should be __nonstring",
> > >
> > If you agree on this, then I will include this change in next patch version.
> 
> Two things:
> 
> The kernel-doc documentation uses dest not dst.

Noted. I will correct this.

> I think stracpy should be preferred over strscpy.
> 

Agreed. 
I will use stracpy() instead of strscpy().

Thanks,
Nitin
  


