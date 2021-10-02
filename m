Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7EBC8C433FE
	for <linux-doc@archiver.kernel.org>; Sat,  2 Oct 2021 00:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5661F61AA4
	for <linux-doc@archiver.kernel.org>; Sat,  2 Oct 2021 00:00:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232168AbhJBACT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 1 Oct 2021 20:02:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232148AbhJBACS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 1 Oct 2021 20:02:18 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFEC8C0613E2
        for <linux-doc@vger.kernel.org>; Fri,  1 Oct 2021 17:00:33 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r201so4900455pgr.4
        for <linux-doc@vger.kernel.org>; Fri, 01 Oct 2021 17:00:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=NyR0BLvLKJGXSob9Ifla3i3P7VKq6NSER7OryFjz5kw=;
        b=D4Rb5NZpuDSNx+ISAjTu3oceC69bI/BD0movoPn7MtXhmP43veptQrEEN/0rzGA4Dm
         zXXstG72cbUCZmZHjnewO0K79iI86YeELhOXvwnrBZ/tLgIw2jvae+0nhAn66b8PX+w1
         mywHvk3IWE87W7vLyN2kUTnHuOvl65/nv3CAA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=NyR0BLvLKJGXSob9Ifla3i3P7VKq6NSER7OryFjz5kw=;
        b=B0AbSqnIs9IrQhxCN+ESqitobhyg/Xu1TuGOGMjpnvfajQEBH7XepY/J3zaXvP1fnQ
         ZIqG8fE2qVFtdZD5zv71G69teOtXi0xGabkMsAsp779yEJ8hNB9dAAhydIprASgjlpM+
         KXvg1+uaSqQDf8SsDhw35XlRqKMtfeVzVEiKzXRCUxXWVesVSyKdHnvbjEgiVbtjHgzG
         a91QhY0dOdvayPyoq8qAkVOx1MUrxmsJS79cCVPf40bi++5KMjl3ZaM1W7ZqjdY0JqES
         Q9BXCIeLZjgvaXp8HSD3bLcdTLT0HORtqKetj8LMhq+gQbAzY0TpXiMqOTMKjGtiBf6D
         XXUA==
X-Gm-Message-State: AOAM533KefCE05L5mJ9SzqcW4+iAiE6O4Pk4BBLbcZSAfliqhG84EuK0
        YxSzXrNMRbyiFm3iRJOcCu2RUw==
X-Google-Smtp-Source: ABdhPJxirD6G77cIgR1B9Ulclv1SoHM6YoexC3zTvyOlIEV0bu2e93K9nYsNB0fJBidlnhqx0zGAWw==
X-Received: by 2002:a63:4457:: with SMTP id t23mr685389pgk.354.1633132833327;
        Fri, 01 Oct 2021 17:00:33 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id j17sm3282047pga.55.2021.10.01.17.00.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Oct 2021 17:00:32 -0700 (PDT)
Date:   Fri, 1 Oct 2021 17:00:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Joe Perches <joe@perches.com>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-hardening@vger.kernel.org
Subject: Re: [PATCH v4] docs: Explain the desired position of function
 attributes
Message-ID: <202110011659.F4F81D4196@keescook>
References: <20210930235754.2635912-1-keescook@chromium.org>
 <CAKwvOdm37zpJZkLvbHvVkXax=XGQ-Ym3iPfx7LtTUnZhADnYCA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKwvOdm37zpJZkLvbHvVkXax=XGQ-Ym3iPfx7LtTUnZhADnYCA@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 01, 2021 at 12:05:25PM -0700, Nick Desaulniers wrote:
> On Thu, Sep 30, 2021 at 4:58 PM Kees Cook <keescook@chromium.org> wrote:
> >
> > While discussing how to format the addition of various function
> > attributes, some "unwritten rules" of ordering surfaced[1]. Capture as
> > close as possible to Linus's preferences for future reference.
> >
> > (Though I note the dissent voiced by Joe Perches, Alexey Dobriyan, and
> > others that would prefer all attributes live on a separate leading line.)
> >
> > [1] https://lore.kernel.org/mm-commits/CAHk-=wiOCLRny5aifWNhr621kYrJwhfURsa0vFPeUEm8mF0ufg@mail.gmail.com/
> >
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> While I appreciate you getting the ball across the finish line (having
> _any_ documentation to point to in future bikesheds), I can't help but
> shake the feeling that the chosen policy will harm the ability of
> existing automated code formatting tools from being able to automate
> code formatting on the kernel.

I am but the messenger here. Is there something specific that'll break
if we follow this?

-- 
Kees Cook
