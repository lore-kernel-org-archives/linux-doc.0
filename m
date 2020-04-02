Return-Path: <SRS0=YY78=5S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,UNPARSEABLE_RELAY,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C26ACC43331
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 08:26:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F490206F6
	for <linux-doc@archiver.kernel.org>; Thu,  2 Apr 2020 08:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387547AbgDBI0h (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Apr 2020 04:26:37 -0400
Received: from bhuna.collabora.co.uk ([46.235.227.227]:39462 "EHLO
        bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728612AbgDBI0h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Apr 2020 04:26:37 -0400
Received: from [127.0.0.1] (localhost [127.0.0.1])
        (Authenticated sender: rcn)
        with ESMTPSA id 058DB29790E
Date:   Thu, 2 Apr 2020 10:26:32 +0200
From:   Ricardo =?iso-8859-1?Q?Ca=F1uelo?= <ricardo.canuelo@collabora.com>
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org, pmladek@suse.com,
        kernel@collabora.com
Subject: Re: [PATCH] docs: pr_*() kerneldocs and basic printk docs
Message-ID: <20200402082632.dii3jytk3rhqtoln@rcn-XPS-13-9360>
References: <20200401083121.20961-1-ricardo.canuelo@collabora.com>
 <6e398e11-0c5b-7308-1bda-8d7178c0a42b@infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6e398e11-0c5b-7308-1bda-8d7178c0a42b@infradead.org>
User-Agent: NeoMutt/20171215
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks for the comments, Randy

On mié 01-04-2020 09:46:40, Randy Dunlap wrote:

> s/two/three/
> 
> > +
> > +  - printk() messages can specify a log level
> 
>      - '%n' is not supported

I agree, I'll rephrase the paragraph to cover the format string differences in a
more general way (I think I should also mention that floating point conversion
specifiers aren't supported either).


> > +The log level determines the importance of a message. The kernel decides whether
> 
>                  specifies (?)

> > +would set the console_loglevel to print KERN_WARNING (4) or more severe messages
> 
> s/would set/sets/

> > +would print a ``KERN_INFO`` message.
> 
> s/would print/prints/

I agree.

> > +  #define pr_fmt(fmt) "%s:%s: " fmt, KBUILD_MODNAME, __func__
> 
> "fmt" should be last, not first, in order for modname and func to be
> prefixes.

The way it's used in the pr_*() macros, this is the correct way to get the
prefixes right.

Example:

	pr_emerg("message no. %d", num)

expands to

	printk(KERN_EMERG pr_fmt("message no. %d", num)

which expands to

	printk(KERN_EMERG "%s:%s: " "message no. %d", KBUILD_MODNAME,
			__func__, num)

Cheers,
Ricardo
