Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA3EDC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 16 Dec 2022 20:32:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229506AbiLPUc5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 16 Dec 2022 15:32:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbiLPUcz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 16 Dec 2022 15:32:55 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1AA3FAF8
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 12:32:54 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id n4so3455411plp.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Dec 2022 12:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZHhZ9ZPwjqbZ4BcttSt3Sdnf2qIn3B52gMX2PCgd3xg=;
        b=LWJb4jETCkdIV7xwZtPKFKqnBfRSGtDxr7b66C7yE2bTbTaDzkWz+4OKI39o84LAKl
         0K8UgyhKz8UI++gjYxjpZc42BOykIlvpCB0rQYhwh8+TMTFNEpLpjcKujq9JGiROE6s5
         jTPkLUp4wlnBaeM32SbGfc66gmPSy63uURfoY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZHhZ9ZPwjqbZ4BcttSt3Sdnf2qIn3B52gMX2PCgd3xg=;
        b=siVmXZ6sbZ/R6mIkNh0+w7gUO/u3Yz6w9CfUcmzgz+hP1XgFwf4h511G5eSBY/Milx
         wRbjQb/uNGxkB/RgeshimAo/gChLjj+MJ0u0uH0RXKiAv+31/5cyUC1nL8EyQXRDIykU
         tYiiDf9/sTg2Jg+eYczoQajYY6OzAN0fdRm8q/QRQBbKeVVsYNnIb2jL1kBknkyw/qYL
         cCU4SOUdFjadbHNgQi8EbwRvGM8DdheO/0jJx5GgmKTFuBCqjYuJPNQy4WRCtxcFGdfJ
         Gi2vzF9sOBoetRoXu7JiL2QeHk6gZfB6TIP691rnROK6i8dpQpg4KSRycpbcCxNZzmDM
         N5yg==
X-Gm-Message-State: ANoB5pnOtNtLxvROBV+v0jIDcAtwbQxyJzsq2ah8WzzemK8QFJEWr/G+
        Cp09dMqJs4Bw8B69aHWPLswzzg==
X-Google-Smtp-Source: AA0mqf6Y2ZywjGs0mB+Uova/fqMsnSnunDEP+ZiLAHwTDeXSyAzc/Cvzm2FmPHyyWH35eIUM0u3IWA==
X-Received: by 2002:a17:902:ab8d:b0:187:467f:c76c with SMTP id f13-20020a170902ab8d00b00187467fc76cmr30243669plr.51.1671222774412;
        Fri, 16 Dec 2022 12:32:54 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id v7-20020a170902b7c700b00186e2123506sm2005977plz.300.2022.12.16.12.32.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Dec 2022 12:32:53 -0800 (PST)
Date:   Fri, 16 Dec 2022 12:32:53 -0800
From:   Kees Cook <keescook@chromium.org>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Jann Horn <jannh@google.com>,
        Seth Jenkins <sethjenkins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        "Jason A. Donenfeld" <Jason@zx2c4.com>,
        Eric Biggers <ebiggers@google.com>,
        Huang Ying <ying.huang@intel.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Arnd Bergmann <arnd@arndb.de>, linux-doc@vger.kernel.org,
        "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        Joel Savitz <jsavitz@redhat.com>,
        Laurent Dufour <ldufour@linux.ibm.com>,
        Rob Herring <robh@kernel.org>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH] exit: Allow oops_limit to be disabled
Message-ID: <202212161232.D752E46@keescook>
References: <20221202210617.never.105-kees@kernel.org>
 <Y5x7GXeluFmZ8E0E@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y5x7GXeluFmZ8E0E@hirez.programming.kicks-ass.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Dec 16, 2022 at 03:05:13PM +0100, Peter Zijlstra wrote:
> On Fri, Dec 02, 2022 at 01:06:21PM -0800, Kees Cook wrote:
> 
> > --- a/kernel/exit.c
> > +++ b/kernel/exit.c
> > @@ -954,7 +954,7 @@ void __noreturn make_task_dead(int signr)
> >  	 * To make sure this can't happen, place an upper bound on how often the
> >  	 * kernel may oops without panic().
> >  	 */
> > -	if (atomic_inc_return(&oops_count) >= READ_ONCE(oops_limit))
> > +	if (atomic_inc_return(&oops_count) >= READ_ONCE(oops_limit) && oops_limit)
> >  		panic("Oopsed too often (kernel.oops_limit is %d)", oops_limit);
> >  
> 
> That's dodgy, please write as:
> 
> 	limit = READ_ONCE(oops_limit);
> 	if (atomic_inc_return(&oops_count) >= limit && limit)
> 
> So we don't explicitly add a reload that negates the whole READ_ONCE().

Yup, that's more correct. Sent:
https://lore.kernel.org/lkml/20221216203024.never.640-kees@kernel.org

-- 
Kees Cook
