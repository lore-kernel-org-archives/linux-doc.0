Return-Path: <SRS0=XnAq=2G=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F295C2D0BF
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 16:23:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6325C206D7
	for <linux-doc@archiver.kernel.org>; Mon, 16 Dec 2019 16:23:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726320AbfLPQXB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 Dec 2019 11:23:01 -0500
Received: from ms.lwn.net ([45.79.88.28]:37294 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726092AbfLPQXB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 16 Dec 2019 11:23:01 -0500
Received: from localhost.localdomain (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7428E2CD;
        Mon, 16 Dec 2019 16:22:59 +0000 (UTC)
Date:   Mon, 16 Dec 2019 09:22:55 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Jani Nikula <jani.nikula@linux.intel.com>
Cc:     Russell King - ARM Linux admin <linux@armlinux.org.uk>,
        Linus Walleij <linus.walleij@linaro.org>,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] docs: Document the Link: tag formally
Message-ID: <20191216092255.3adb1202@lwn.net>
In-Reply-To: <87woawz4kv.fsf@intel.com>
References: <20191216093859.9196-1-linus.walleij@linaro.org>
        <877e2w1kfj.fsf@intel.com>
        <20191216133322.GJ25745@shell.armlinux.org.uk>
        <874ky01i8z.fsf@intel.com>
        <20191216141611.GK25745@shell.armlinux.org.uk>
        <871rt41gvb.fsf@intel.com>
        <20191216144348.GL25745@shell.armlinux.org.uk>
        <87woawz4kv.fsf@intel.com>
Organization: LWN.net
X-Mailer: Claws Mail 3.17.4 (GTK+ 2.24.32; x86_64-redhat-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 16 Dec 2019 17:13:20 +0200
Jani Nikula <jani.nikula@linux.intel.com> wrote:

> The *only* question is, whether we should both use the tag Foo: for the
> different meanings and different workflows, or whether one should use
> Foo: and the other should use Bar:.

This is, of course, a part of the wider discussion on patch tracking IDs
and such; I kind of doubt that this relatively small group can resolve
it for the community as a whole.  It seems to be agreed that it's good
for a patch submission to reference previous postings; I'm not sure that
we've decided on Link: as the way to do that.

That creates a bit of a problem for me; I don't want to be trying to
create community policy through the docs; I'd rather accept patches that
I know reflect an existing consensus.

The practice of using Link: tags to refer to previous discussions is well
established in the TIP tree neighborhood, if nowhere else.  So there are
precedents for using it the way Russell is wanting to.  Multiple tags can
reflect the discussion at various points.

I do hesitate a bit to put this into submitting-patches.rst for a couple
of reasons, though.  One is that I'm not at all sure we want to encourage
submitters to add these tags; it sounds like a recipe for maintainers
having to follow them all and decide which ones really belong there, and
maintainers don't really need more to do.  That document is already *way*
too long, to the point that it's a barrier that new contributors have to
overcome; I worry about making it even longer.

Probably we'll end up adding something like this.  I do think I would
agree with Jani, though, that we should at least lightly discourage
developers from adding these tags all over the place.

Sorry for the stream-of-consciousness dump...

jon
