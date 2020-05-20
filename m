Return-Path: <SRS0=+Urr=7C=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_2
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B17D6C433E0
	for <linux-doc@archiver.kernel.org>; Wed, 20 May 2020 07:22:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7B8EA207D3
	for <linux-doc@archiver.kernel.org>; Wed, 20 May 2020 07:22:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726309AbgETHWy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 May 2020 03:22:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726224AbgETHWy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 May 2020 03:22:54 -0400
Received: from bhuna.collabora.co.uk (bhuna.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e3e3])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFB3CC061A0E
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2020 00:22:53 -0700 (PDT)
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 033942A0B86
Message-ID: <8ec034340546a0548ff4a0d63ccf335a19358e66.camel@collabora.com>
Subject: Re: [PATCH] docs: printk-basics: update the pr_debug() kerneldoc
From:   Ricardo =?ISO-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Petr Mladek <pmladek@suse.com>
Cc:     linux-doc@vger.kernel.org, corbet@lwn.net, kernel@collabora.com,
        Sergey Senozhatsky <sergey.senozhatsky@gmail.com>,
        Steven Rostedt <rostedt@goodmis.org>
Date:   Wed, 20 May 2020 09:22:45 +0200
In-Reply-To: <20200519131558.GM7340@linux-b0ei>
References: <20200422140334.23595-1-ricardo.canuelo@collabora.com>
         <20200519131558.GM7340@linux-b0ei>
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5-0ubuntu0.18.04.1 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Petr, thanks for taking the time to review this

On Tue, 2020-05-19 at 15:15 +0200, Petr Mladek wrote:
> It is pity that you did not add other printk maintainers into CC for
> the patches adding this documentation and comments. I was sick
> last two months and was not able to check mails.

I'm sorry for that and I hope you're better now.

> Adding them now. Note that the following patch is already in
> linux-next, see
> https://lore.kernel.org/r/20200403093617.18003-1-ricardo.canuelo@collabora.com

Indeed, I mentioned that in the patch. Maybe I should've been clearer in the
background description.

> Well, I have mixed feelings about this type of documentation. It might explain
> some things that are less obvious, for example, the meaning of
> pr_fmt(). On the other hand:
> 
>   + It might be complicated to keep it in sync.
> 
>   + I wonder how many developers would actually read it.
> 
>   + The doc comments in include/linux/prinkt.h are really
>     long and describe obvious things.
> 
> By other words. These comments make the headers and sources hard to
> read. And at least in this particular case, the gain is questionable.

Well, I think that some things may not be too obvious for beginners and that
documenting them explicitly is a positive thing overall. I don't think this kind
of comments (comment blocks before a function prototype, not interleaved in the
code) pollute the code or make it harder to read, but that's a personal opinion,
I guess.

I agree that this might introduce a maintainance overhead when it comes to
sync'ing the code and the documentation but, on the other hand, printk.h isn't
something that changes too frequently, is it?

Best regards,
Ricardo

