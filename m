Return-Path: <SRS0=ZISZ=CF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75796C433DF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Aug 2020 12:12:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4D1F2207F7
	for <linux-doc@archiver.kernel.org>; Thu, 27 Aug 2020 12:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598530326;
	bh=Eo37Cg9ShVE437x7D2UkoGJWAgAakYGsh7NDHlVSTog=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ZA5TLdrPnNFyf0WS3QOgvKk4R+vODQH9aRQy3Goh/xiWxOd4zJokHB/OUzpLqQnGf
	 Wr+5iUFuMn9vM649bRzCsCbygLYU83YC+rWNHPPq80cmwwpwJzpEh8Xr0IGbyT6w8F
	 T4TpVHKdKCuOnTLoGS+wFhUlt8C/67p0HYS8NwQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728870AbgH0ML5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Aug 2020 08:11:57 -0400
Received: from mail.kernel.org ([198.145.29.99]:36754 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728962AbgH0MLK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 Aug 2020 08:11:10 -0400
Received: from localhost (83-86-89-107.cable.dynamic.v4.ziggo.nl [83.86.89.107])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DC22A20707;
        Thu, 27 Aug 2020 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598530269;
        bh=Eo37Cg9ShVE437x7D2UkoGJWAgAakYGsh7NDHlVSTog=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=h62xXqvv6mgkqxuRe7BPSGFKMRZollVP9R4bTJi8kB/7UME3hm4wPw2d9ySNHCKVK
         VKh5/uYnAs5Tyux1avGVGck0KAy+Wt8FjWnVXmMINM76g2HMwkbeRiqEbqoDCX+o8N
         NYqp3HmXANnE0Tr+LAt4Sr1mL6fsYUBh8KBVw+S0=
Date:   Thu, 27 Aug 2020 14:11:23 +0200
From:   Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To:     Krzysztof Kozlowski <krzk@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Kees Cook <keescook@chromium.org>,
        Konstantin Ryabitsev <konstantin@linuxfoundation.org>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Brooke Basile <brookebasile@gmail.com>,
        Felipe Balbi <balbi@kernel.org>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
Subject: Re: [PATCH 2/2] docs: admin-guide: Not every security bug should be
 kept hidden
Message-ID: <20200827121123.GC417381@kroah.com>
References: <20200827105319.9734-1-krzk@kernel.org>
 <20200827105319.9734-2-krzk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200827105319.9734-2-krzk@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 27, 2020 at 12:53:19PM +0200, Krzysztof Kozlowski wrote:
> Document describes the process of handling security bugs but does not
> mention any criteria what is a "security bug".  Unlike
> submitting-patches.rst which explicitly says - publicly exploitable bug.
> 
> Many NULL pointer exceptions, off-by-one errors or overflows tend
> to look like security bug, so there might be a temptation to discuss
> them behind security list which is not an open list.
> 
> Such discussion limits the amount of testing and independent reviewing.
> Sacrificing open discussion is understandable in the case of real
> security issues but not for regular bugs.  These should be discussed
> publicly.
> 
> At the end, "security problems are just bugs".
> 
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Linus Torvalds <torvalds@linux-foundation.org>
> Cc: Kees Cook <keescook@chromium.org>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> 
> ---
> 
> Follow up to:
> https://lore.kernel.org/linux-usb/1425ab4f-ef7e-97d9-238f-0328ab51eb35@samsung.com/
> ---
>  Documentation/admin-guide/security-bugs.rst | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/admin-guide/security-bugs.rst b/Documentation/admin-guide/security-bugs.rst
> index c32eb786201c..7ebddbd4bbcd 100644
> --- a/Documentation/admin-guide/security-bugs.rst
> +++ b/Documentation/admin-guide/security-bugs.rst
> @@ -78,6 +78,12 @@ include linux-distros from the start. In this case, remember to prefix
>  the email Subject line with "[vs]" as described in the linux-distros wiki:
>  <http://oss-security.openwall.org/wiki/mailing-lists/distros#how-to-use-the-lists>
>  
> +Fixes for non-exploitable bugs which do not pose a real security risk, should
> +be disclosed in a regular way of submitting patches to Linux kernel (see
> +:ref:`Documentation/process/submitting-patches.rst <submitting-patches>`).
> +Just because patch fixes some off-by-one or NULL pointer exception, does not
> +classify it as a security bug which should be discussed in closed channels.

I said this on another thread, but almost always, when we get reports
like this on security@k.o, we do push them back to public lists.

For the most part, this paragraph is not going to help much (mostly for
the reason that no one seems to read it, but that's a different
topic...)  We get crazy reports all the time, and that's fine, because
sometimes, there is a real issue in some of them.  And for that, we do
want to be careful.  We also have many docuemented "off-by-one" bugs
that were real security issues (there's a blog post somewhere about how
a developer turned such a bug into a root hole, can't find it right
now...)

So while I understand the temptation here, based on the current
security@k.o traffic, I doubt this will really change much :(

Also, you should have cc:ed that group when you are changing things that
will affect them.

thanks,

greg k-h
