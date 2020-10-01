Return-Path: <SRS0=1/lM=DI=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BD0CC4727E
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 21:49:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0561D20848
	for <linux-doc@archiver.kernel.org>; Thu,  1 Oct 2020 21:49:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726741AbgJAVtA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Oct 2020 17:49:00 -0400
Received: from ms.lwn.net ([45.79.88.28]:39408 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726626AbgJAVtA (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 1 Oct 2020 17:49:00 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id DA37E60C;
        Thu,  1 Oct 2020 21:48:56 +0000 (UTC)
Date:   Thu, 1 Oct 2020 15:48:54 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org,
        "David S. Miller" <davem@davemloft.net>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Alexander Aring <alex.aring@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Daniel Thompson <daniel.thompson@linaro.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jakub Kicinski <kuba@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>,
        Jason Wessel <jason.wessel@windriver.com>,
        Kees Cook <keescook@chromium.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maxime Ripard <mripard@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Moritz Fischer <mdf@kernel.org>, Sean Young <sean@mess.org>,
        Stefan Schmidt <stefan@datenfreihafen.org>,
        Takashi Iwai <tiwai@suse.com>, Tejun Heo <tj@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Tony Luck <tony.luck@intel.com>,
        Viresh Kumar <viresh.kumar@linaro.org>
Subject: Re: [PATCH v4 00/52] Fix html build with Sphinx  3.1 and above
Message-ID: <20201001154854.4311d46a@lwn.net>
In-Reply-To: <cover.1601467849.git.mchehab+huawei@kernel.org>
References: <cover.1601467849.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, 30 Sep 2020 15:24:23 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> This series add proper support for Sphinx 3.1 and above for building the html docs.
> 
> This series comes after the one I wrote fixing the warnings. 
> 
> With this series applied on the top of next-20200922, there are just 12
> warnings:
> 	- 2 of them happens also on Sphinx 2.4.4
> 	 (both seem easy to fix: I'll send later fixes for those);
> 	- 10 happens only on Sphinx 3.2.1.
> 
> The new warnings are all due to duplicated C domain cross-reference symbols. 
> 
> Basically, the C domain on Sphinx doesn't allow to have an struct and
> a function with the same name. I opened an issue on Sphinx.:
> 
>     https://github.com/sphinx-doc/sphinx/issues/8241
> 
> Hopefully, some newer version may have it fixed.
> 
> There is still one thing that requires a fix: the automarkup.py. The
> way cross-references are stored with Sphinx 3 are different.
> I didn't try yet to address it, but I suspect that it shouldn't be
> hard to address it.

Modulo my comment on part 4, I think this is what we want.  It's kind of
unfortunate that it's all necessary, but that's the way things are these
days, I guess.

This part is a bit intimidating, though:

>  288 files changed, 1709 insertions(+), 2183 deletions(-)

Should we maybe position this as an end-of-merge-window blast, once other
stuff has hopefully mostly settled?  I can certainly warn Linus that it's
coming when I send the main docs pull.

I wonder how soon we could pull our minimum version forward to 3.1 and
drop a bunch of stuff?  I fear it may not be for a while, alas...

Thanks for doing all this work,

jon
