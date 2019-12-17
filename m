Return-Path: <SRS0=IxZW=2H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5065AC43603
	for <linux-doc@archiver.kernel.org>; Tue, 17 Dec 2019 10:55:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 20FC32064B
	for <linux-doc@archiver.kernel.org>; Tue, 17 Dec 2019 10:55:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727238AbfLQKzw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Dec 2019 05:55:52 -0500
Received: from mga06.intel.com ([134.134.136.31]:41215 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726655AbfLQKzw (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 17 Dec 2019 05:55:52 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 02:55:52 -0800
X-IronPort-AV: E=Sophos;i="5.69,325,1571727600"; 
   d="scan'208";a="209652097"
Received: from jnikula-mobl3.fi.intel.com (HELO localhost) ([10.237.66.161])
  by orsmga008-auth.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 17 Dec 2019 02:55:50 -0800
From:   Jani Nikula <jani.nikula@linux.intel.com>
To:     Russell King - ARM Linux admin <linux@armlinux.org.uk>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Document the Link: tag formally
In-Reply-To: <20191216160213.GM25745@shell.armlinux.org.uk>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20191216093859.9196-1-linus.walleij@linaro.org> <877e2w1kfj.fsf@intel.com> <20191216133322.GJ25745@shell.armlinux.org.uk> <874ky01i8z.fsf@intel.com> <20191216141611.GK25745@shell.armlinux.org.uk> <871rt41gvb.fsf@intel.com> <20191216144348.GL25745@shell.armlinux.org.uk> <87woawz4kv.fsf@intel.com> <20191216160213.GM25745@shell.armlinux.org.uk>
Date:   Tue, 17 Dec 2019 12:55:47 +0200
Message-ID: <87o8w7z0ek.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Dec 2019, Russell King - ARM Linux admin <linux@armlinux.org.uk> wrote:
> On Mon, Dec 16, 2019 at 05:13:20PM +0200, Jani Nikula wrote:
>> I'm not sure that you understand our workflow. But it doesn't matter;
>> it's clear that they are different. In your workflow, the value for the
>> tag is subjective. In our workflow, it's not, it's unambiguous. And
>> there is really no point in debating the relative merits of the
>> workflows.
>
> I don't see why you think that it's subjective in my workflow. It
> isn't. The proposed patch and the officially submitted patch are
> generally identical. The difference is, which thread is the more
> useful thread to link the patch to - the one with the discussion
> about the patch including why it's needed, or the official submission
> that contains none of that.

In my experience, it's common to have several versions of a patch, often
in several threads. If I were to choose which message to reference,
other than the patch that was actually applied, I'd feel it would be a
subjective choice.

> I guess it depends whether you wish to capture the submission itself
> or the actual useful discussion about the patch with the tag. If
> we're going to be officially defining this tag, then really that
> question needs to be settled.
>
> What worries me at this point is that you seem to want to withdraw
> from the discussion before any concensus has been reached, which
> presents a problem for Linus' proposed patch...

I don't think we can reach a meaningful consensus between ourselves that
other people would care about anyway; indeed this sentiment is echoed in
Jon's and Ted's replies.


BR,
Jani.


-- 
Jani Nikula, Intel Open Source Graphics Center
