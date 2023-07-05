Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4913EB64DA
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jul 2023 20:33:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233533AbjGEUdk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 16:33:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230383AbjGEUdj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 16:33:39 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0890F198D;
        Wed,  5 Jul 2023 13:33:37 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 8EAFA61721;
        Wed,  5 Jul 2023 20:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8EC8C433C8;
        Wed,  5 Jul 2023 20:33:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688589215;
        bh=0KOx7fIYnbHIu2BxvIcZlx+mTxGkXFNuYE0N+HdfH14=;
        h=Date:From:To:Cc:Subject:Reply-To:References:In-Reply-To:From;
        b=Ad6MgZVqsNWU5hHhwrnEBL6OU3bT2xThgnUpFYX9BWvDghQbWGN7ztvVwiSz12LMa
         fY9EsksGT/yLqt8WAsbP5/gR2vdXaIctJeSCwm9ZUnnjDvvJeWgdWzLZFyfnE7ZcKW
         ZqjZgJ8bYWHDmgKjvbN/+iWw6JN56JEIZTOrXujZV+5XPIjmIdfWbLpvRxoBLTOvwx
         TaH47nHfM3bh6XAFna8z/k2NdAjBwufi6yEmeri1NaCfc6SOI8PN9JfNQugXaN81EL
         0G5gKlaNcOOrXayJKUvtMX1XNT7gKrqdUR5FY8goeYcopSw0v4d33XjrwkF6YvixGZ
         OFVrwi0hLe0lA==
Received: by paulmck-ThinkPad-P17-Gen-1.home (Postfix, from userid 1000)
        id 79B33CE27E7; Wed,  5 Jul 2023 13:33:35 -0700 (PDT)
Date:   Wed, 5 Jul 2023 13:33:35 -0700
From:   "Paul E. McKenney" <paulmck@kernel.org>
To:     Masami Hiramatsu <mhiramat@kernel.org>
Cc:     mtk.manpages@gmail.com, corbet@lwn.net, akpm@linux-foundation.org,
        ndesaulniers@google.com, vbabka@suse.cz, hannes@cmpxchg.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        alx@kernel.org, linux-man@vger.kernel.org
Subject: Re: [PATCH] proc.5: Clarify that boot arguments can be embedded in
 image
Message-ID: <d3057de8-39ca-4d2a-aa03-9134f916fac9@paulmck-laptop>
Reply-To: paulmck@kernel.org
References: <433d742b-743b-4335-878f-1ca0f45698f7@paulmck-laptop>
 <20230704215932.c9cab0af086528e52ca0bfbb@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230704215932.c9cab0af086528e52ca0bfbb@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 04, 2023 at 09:59:32PM +0900, Masami Hiramatsu wrote:
> On Fri, 30 Jun 2023 16:33:28 -0700
> "Paul E. McKenney" <paulmck@kernel.org> wrote:
> 
> > With the advent of the CONFIG_BOOT_CONFIG Kconfig option, kernel boot
> > arguments can now be embedded in the kernel image, either attached
> > to the end of initramfs or embedded in the kernel itself.  Document
> > this possibility in the /proc/cmdline entry of proc.5.
> 
> Thanks for update!
> 
> Reviewed-by: Masami Hiramatsu (Google) <mhiramat@kernel.org>

Thank you, Masami!

Adding Alejandro and linux-man on CC.

							Thanx, Paul

> > Signed-off-by: Paul E. McKenney <paulmck@kernel.org>
> > Cc: Michael Kerrisk <mtk.manpages@gmail.com>
> > Cc: Masami Hiramatsu <mhiramat@kernel.org>
> > Cc: Jonathan Corbet <corbet@lwn.net>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Nick Desaulniers <ndesaulniers@google.com>
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Johannes Weiner <hannes@cmpxchg.org>
> > 
> > diff --git a/man5/proc.5 b/man5/proc.5
> > index c6684620e..141a2983c 100644
> > --- a/man5/proc.5
> > +++ b/man5/proc.5
> > @@ -3100,6 +3100,9 @@ Often done via a boot manager such as
> >  .BR lilo (8)
> >  or
> >  .BR grub (8).
> > +Any arguments embedded in the kernel image or initramfs via 
> > +.B CONFIG_BOOT_CONFIG
> > +will also be displayed.
> >  .TP
> >  .IR /proc/config.gz " (since Linux 2.6)"
> >  This file exposes the configuration options that were used
> 
> 
> -- 
> Masami Hiramatsu (Google) <mhiramat@kernel.org>
