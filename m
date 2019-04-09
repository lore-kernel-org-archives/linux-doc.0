Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id CEE927D04D
	for <lwn-linux-doc@archive.lwn.net>; Tue,  9 Apr 2019 14:39:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726582AbfDIOji (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 9 Apr 2019 10:39:38 -0400
Received: from mga17.intel.com ([192.55.52.151]:25920 "EHLO mga17.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726035AbfDIOjh (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 9 Apr 2019 10:39:37 -0400
X-Amp-Result: UNKNOWN
X-Amp-Original-Verdict: FILE UNKNOWN
X-Amp-File-Uploaded: False
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga107.fm.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 09 Apr 2019 07:39:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.60,329,1549958400"; 
   d="scan'208";a="159592611"
Received: from sjchrist-coffee.jf.intel.com (HELO linux.intel.com) ([10.54.74.181])
  by fmsmga002.fm.intel.com with ESMTP; 09 Apr 2019 07:39:36 -0700
Date:   Tue, 9 Apr 2019 07:39:36 -0700
From:   Sean Christopherson <sean.j.christopherson@intel.com>
To:     Jonathan Corbet <corbet@lwn.net>, g@linux.intel.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kernel-doc: Let backtick and backslash escape percent
 sign
Message-ID: <20190409143936.GB23061@linux.intel.com>
References: <20190405211820.17617-1-sean.j.christopherson@intel.com>
 <20190408160314.05bc5ecb@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408160314.05bc5ecb@lwn.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Apr 08, 2019 at 04:03:14PM -0600, Jonathan Corbet wrote:
> On Fri,  5 Apr 2019 14:18:20 -0700
> Sean Christopherson <sean.j.christopherson@intel.com> wrote:
> 
> > There are a handful of instances where kernel doc comments want an
> > actual '%' in the final output, e.g. vsnprintf() wants to display "%n"
> > and "%p" to document format specifiers, and assembly functions that use
> > a custom call ABI may want to document their register usage, e.g. %eax.
> > 
> > Because kernel-doc unconditionally interprets '%' followed by a word
> > character as a constant definition, i.e. %CONST, it's impossible to get
> > an actual '%\w' when kernel-doc is used to translate comments into rst
> > format.  Treat backtick and backlash as escaping '%', the former to
> > handle '%' in a ``LITERAL``, and the latter to allow '%' when using
> > standard formatting.
> 
> So I'm sympathetic toward the goal; we want this stuff to format properly.
> But I'm less convinced about this specific solution.  Starting with the
> details: 
> 
> > -my $type_constant2 = '\%([-_\w]+)';
> > +my $type_constant2 = '(^|[^\`\\\])\%([-_\w]+)';
> 
> This only escapes the % if it occurs *immediately* after the backtick, so
> something like ``foo %p`` will still get processed incorrectly.  Somebody
> will surely run into that at some point and waste a bunch of time trying to
> figure out what's going on.

Argh, yeah.

> Also, believe it or not, I don't think you have enough backslashes; that
> inner expression, I believe, should be:
> 
> 	[^\`\\\\]
> 
> Gosh Perl regexes are fun...  This highlights the danger of adding
> functionality that isn't exercised anywhere; I don't think it works here.

I honestly just added backslashes until it did work (for unmerged docs).
But Perl isn't exactly my strong suit, so it's entirely possible it worked
by sheer dumb luck.

> 
> Now to more general considerations.  Willy's suggestion of using %% instead
> makes some sense, though it may lead to pushback from the "no extra markup
> ever" contingent.  It should be more straightforward to implement
> correctly.

I considered %% as well.  I basically did a mental coin flip between %% and \%.

> I have to wonder if the % thing is actually buying us much, honestly.  It's
> another form of markup that kind of duplicates the Sphinx notation, and
> we've kind of agreed that most of the time, we don't want to clutter our
> text with ``explicit markup`` like that.  I'm curious what people think:
> might the best solution be to just make %const do nothing special, with the
> idea of phasing it out?

Along those lines, what about adding flags into the kernel-doc directive
to opt-out of specific markup?  That would allow removing the old markup
on a case-by-case basis instead of having to do a tree-wide change.  And
once we've reached critical mass the flag can be removed (in theory).

E.g.

.. kernel-doc:: arch/x86/kernel/cpu/sgx/driver/ioctl.c
   :noconsts:
   :functions: sgx_ioc_create_enclave
               sgx_ioc_enclave_add_page
               sgx_ioc_enclave_init

.. kernel-doc:: arch/x86/include/uapi/asm/sgx.h
   :noconsts:
   :nosymbols: sgx_enclave_exception


Another alternative would be to version the kernel-doc directive.  But that
lacks the granularity of opting out of specific markup, and would probably
lead to endless discussion on what exactly should be in "v2" or whatever,
and inevitably a v3, v4, etc...

E.g.:

.. kernel-doc-v2:: arch/x86/kernel/cpu/sgx/driver/ioctl.c
   :functions: sgx_ioc_create_enclave
               sgx_ioc_enclave_add_page
               sgx_ioc_enclave_init

.. kernel-doc-v2:: arch/x86/include/uapi/asm/sgx.h
   :nosymbols: sgx_enclave_exception
