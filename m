Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2BD7A7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 24 Jul 2019 18:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387540AbfGXS3T (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 24 Jul 2019 14:29:19 -0400
Received: from smtprelay0050.hostedemail.com ([216.40.44.50]:43984 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S2387457AbfGXS3T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Jul 2019 14:29:19 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay04.hostedemail.com (Postfix) with ESMTP id 25743180AA518;
        Wed, 24 Jul 2019 18:29:18 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: ants48_8b108300b7635
X-Filterd-Recvd-Size: 2301
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf08.hostedemail.com (Postfix) with ESMTPA;
        Wed, 24 Jul 2019 18:29:15 +0000 (UTC)
Message-ID: <0d69778626901a841108ae024b8a105da679d9af.camel@perches.com>
Subject: Re: [PATCH v5] Documentation/checkpatch: Prefer strscpy/strscpy_pad
 over strcpy/strlcpy/strncpy
From:   Joe Perches <joe@perches.com>
To:     "Gote, Nitin R" <nitin.r.gote@intel.com>,
        Kees Cook <keescook@chromium.org>
Cc:     "corbet@lwn.net" <corbet@lwn.net>,
        "akpm@linux-foundation.org" <akpm@linux-foundation.org>,
        "apw@canonical.com" <apw@canonical.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "kernel-hardening@lists.openwall.com" 
        <kernel-hardening@lists.openwall.com>
Date:   Wed, 24 Jul 2019 11:29:13 -0700
In-Reply-To: <12356C813DFF6F479B608F81178A561587AE45@BGSMSX101.gar.corp.intel.com>
References: <20190717043005.19627-1-nitin.r.gote@intel.com>
         <201907221029.B0CBED4F@keescook>
         <28404b52d58efa0a3e85ce05ce0b210049ed6050.camel@perches.com>
         <12356C813DFF6F479B608F81178A561587ABA9@BGSMSX101.gar.corp.intel.com>
         <12356C813DFF6F479B608F81178A561587AE45@BGSMSX101.gar.corp.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 2019-07-24 at 18:17 +0000, Gote, Nitin R wrote:
> Hi,

Hi again.

[]
> > > > > 3. Deprecate strncpy() in favor of strscpy() or strscpy_pad().

Please remember there does not exist a single actual use
of strscpy_pad in the kernel sources and no apparent real
need for it.  I don't find one anyway.

> Could you please give your opinion on below comment.
>  
> > But, if the destination buffer needs extra NUL-padding for remaining size of
> > destination, then safe replacement is strscpy_pad().  Right?  If yes, then what
> > is your opinion on below change :
> > 
> >         "strncpy" => "strscpy, strcpy_pad - for non-NUL-terminated uses,
> > strncpy() dst should be __nonstring",
> > 
> If you agree on this, then I will include this change in next patch version.

Two things:

The kernel-doc documentation uses dest not dst.
I think stracpy should be preferred over strscpy.


