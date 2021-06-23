Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC59AC4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 09:07:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D25CB61289
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 09:07:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229958AbhFWJJj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 05:09:39 -0400
Received: from mga09.intel.com ([134.134.136.24]:11271 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229833AbhFWJJi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 05:09:38 -0400
IronPort-SDR: XcJHDQ3vl8odD21STa6BfJVdYPsaDROP8dNpGoLIEAxenx5E1jq8i9sfB+ZHgW1mePULrgUhre
 ZCLfPGTTOStA==
X-IronPort-AV: E=McAfee;i="6200,9189,10023"; a="207163003"
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="207163003"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 02:07:20 -0700
IronPort-SDR: UCdi/PzEUbzatk9xT7i3SGzelM334sHuXSmnQxoxiPa6jZchh/0nt0p9HFLF/ayurpxDcgHoGT
 fgvOXO+eHNhg==
X-IronPort-AV: E=Sophos;i="5.83,293,1616482800"; 
   d="scan'208";a="641918962"
Received: from smile.fi.intel.com (HELO smile) ([10.237.68.40])
  by fmsmga005-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jun 2021 02:07:16 -0700
Received: from andy by smile with local (Exim 4.94.2)
        (envelope-from <andriy.shevchenko@linux.intel.com>)
        id 1lvyql-004hX6-U2; Wed, 23 Jun 2021 12:07:11 +0300
Date:   Wed, 23 Jun 2021 12:07:11 +0300
From:   Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To:     Justin He <Justin.He@arm.com>
Cc:     Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Eric Biggers <ebiggers@google.com>,
        "Ahmed S. Darwish" <a.darwish@linutronix.de>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
        Matthew Wilcox <willy@infradead.org>,
        Christoph Hellwig <hch@infradead.org>, nd <nd@arm.com>
Subject: Re: [PATCH v5 1/4] fs: introduce helper d_path_unsafe()
Message-ID: <YNL5v1I9xOfpLPke@smile.fi.intel.com>
References: <20210622140634.2436-1-justin.he@arm.com>
 <20210622140634.2436-2-justin.he@arm.com>
 <YNH1d0aAu1WRiua1@smile.fi.intel.com>
 <AM6PR08MB43761598697E6DC08A5E71ADF7089@AM6PR08MB4376.eurprd08.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR08MB43761598697E6DC08A5E71ADF7089@AM6PR08MB4376.eurprd08.prod.outlook.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 23, 2021 at 02:02:45AM +0000, Justin He wrote:
> > From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> > Sent: Tuesday, June 22, 2021 10:37 PM
> > On Tue, Jun 22, 2021 at 10:06:31PM +0800, Jia He wrote:

...

> > >   * prepend_name - prepend a pathname in front of current buffer pointer
> > > - * @buffer: buffer pointer
> > > - * @buflen: allocated length of the buffer
> > > + * @p: prepend buffer which contains buffer pointer and allocated length
> > 
> > >   * @name:   name string and length qstr structure
> > 
> > Indentation issue btw, can be fixed in the same patch.
> 
> Okay
> > 
> > >   *
> > >   * With RCU path tracing, it may race with d_move(). Use READ_ONCE() to
> > 
> > Shouldn't this be a separate change with corresponding Fixes tag?
> 
> Sorry, I don't quite understand here.
> What do you want to fix?

Kernel doc. The Fixes tag should correspond to the changes that missed the
update of kernel doc.

-- 
With Best Regards,
Andy Shevchenko


