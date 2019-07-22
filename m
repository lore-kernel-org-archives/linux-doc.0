Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 854487D90F
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Jul 2019 17:41:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730297AbfGVRlD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Jul 2019 13:41:03 -0400
Received: from smtprelay0195.hostedemail.com ([216.40.44.195]:36323 "EHLO
        smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726236AbfGVRlC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Jul 2019 13:41:02 -0400
Received: from filter.hostedemail.com (clb03-v110.bra.tucows.net [216.40.38.60])
        by smtprelay05.hostedemail.com (Postfix) with ESMTP id 40BF41802912A;
        Mon, 22 Jul 2019 17:41:01 +0000 (UTC)
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-HE-Tag: worm76_25cee27498045
X-Filterd-Recvd-Size: 2116
Received: from XPS-9350.home (cpe-23-242-196-136.socal.res.rr.com [23.242.196.136])
        (Authenticated sender: joe@perches.com)
        by omf10.hostedemail.com (Postfix) with ESMTPA;
        Mon, 22 Jul 2019 17:40:59 +0000 (UTC)
Message-ID: <28404b52d58efa0a3e85ce05ce0b210049ed6050.camel@perches.com>
Subject: Re: [PATCH v5] Documentation/checkpatch: Prefer strscpy/strscpy_pad
 over strcpy/strlcpy/strncpy
From:   Joe Perches <joe@perches.com>
To:     Kees Cook <keescook@chromium.org>,
        NitinGote <nitin.r.gote@intel.com>
Cc:     corbet@lwn.net, akpm@linux-foundation.org, apw@canonical.com,
        linux-doc@vger.kernel.org, kernel-hardening@lists.openwall.com
Date:   Mon, 22 Jul 2019 10:40:58 -0700
In-Reply-To: <201907221029.B0CBED4F@keescook>
References: <20190717043005.19627-1-nitin.r.gote@intel.com>
         <201907221029.B0CBED4F@keescook>
Content-Type: text/plain; charset="ISO-8859-1"
User-Agent: Evolution 3.30.5-0ubuntu0.18.10.1 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 2019-07-22 at 10:30 -0700, Kees Cook wrote:
> On Wed, Jul 17, 2019 at 10:00:05AM +0530, NitinGote wrote:
> > From: Nitin Gote <nitin.r.gote@intel.com>
> > 
> > Added check in checkpatch.pl to
> > 1. Deprecate strcpy() in favor of strscpy().
> > 2. Deprecate strlcpy() in favor of strscpy().
> > 3. Deprecate strncpy() in favor of strscpy() or strscpy_pad().
> > 
> > Updated strncpy() section in Documentation/process/deprecated.rst
> > to cover strscpy_pad() case.
> > 
> > Signed-off-by: Nitin Gote <nitin.r.gote@intel.com>
> 
> Reviewed-by: Kees Cook <keescook@chromium.org>
> 
> Joe, does this address your checkpatch concerns?

Well, kinda.

strscpy_pad isn't used anywhere in the kernel.

And

+        "strncpy"				=> "strscpy, strscpy_pad or for non-NUL-terminated strings, strncpy() can still be used, but destinations should be marked with __nonstring",

is a bit verbose.  This could be simply:

+        "strncpy" => "strscpy - for non-NUL-terminated uses, strncpy() dst should be __nonstring",

And I still prefer adding stracpy as it
reduces code verbosity and eliminates defects.


