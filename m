Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BE4ED7D922
	for <lwn-linux-doc@archive.lwn.net>; Tue, 13 Aug 2019 12:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727919AbfHMMTw (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 13 Aug 2019 08:19:52 -0400
Received: from mga05.intel.com ([192.55.52.43]:8490 "EHLO mga05.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727872AbfHMMTQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Aug 2019 08:19:16 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 13 Aug 2019 05:19:16 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.64,381,1559545200"; 
   d="scan'208";a="167037187"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.145])
  by orsmga007.jf.intel.com with ESMTP; 13 Aug 2019 05:19:14 -0700
Received: from andy by smile with local (Exim 4.92.1)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1hxVlg-0005oF-VL; Tue, 13 Aug 2019 15:19:12 +0300
Date:   Tue, 13 Aug 2019 15:19:12 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1] kernel-doc: Allow anonymous enum
Message-ID: <20190813121912.GV30120@smile.fi.intel.com>
References: <20190812160631.32844-1-andriy.shevchenko@linux.intel.com>
 <20190812151317.746379b2@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190812151317.746379b2@lwn.net>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Aug 12, 2019 at 03:13:17PM -0600, Jonathan Corbet wrote:
> On Mon, 12 Aug 2019 19:06:31 +0300
> Andy Shevchenko <andriy.shevchenko@linux.intel.com> wrote:
> 
> > In C is a valid construction to have an anonymous enumerator.
> > 
> > Though we have now:
> > 
> >   drivers/pinctrl/intel/pinctrl-intel.c:240: error: Cannot parse enum!
> > 
> > Support it in the kernel-doc script.
> 
> So I don't get this error; I guess the only anonymous enum of interest has
> yet to find its way into the mainline.

The other one is already in mainline (drivers/remoteproc/omap_remoteproc.h),
but suddenly it misses the second * in the header of kernel-doc comment
(perhaps to avoid above error, or for another reason).

> 
> > Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > ---
> >  scripts/kernel-doc | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/scripts/kernel-doc b/scripts/kernel-doc
> > index 6b03012750da..079502bcc5a3 100755
> > --- a/scripts/kernel-doc
> > +++ b/scripts/kernel-doc
> > @@ -1245,7 +1245,7 @@ sub dump_enum($$) {
> >      # strip #define macros inside enums
> >      $x =~ s@#\s*((define|ifdef)\s+|endif)[^;]*;@@gos;
> >  
> > -    if ($x =~ /enum\s+(\w+)\s*\{(.*)\}/) {
> > +    if ($x =~ /enum\s+(\w*)\s*\{(.*)\}/) {
> 
> Ah the joy of regexes...
> 
> Applied, thanks.

Thanks!

-- 
With Best Regards,
Andy Shevchenko


