Return-Path: <SRS0=8DF0=BV=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFF8AC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 11 Aug 2020 21:25:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9A325206C3
	for <linux-doc@archiver.kernel.org>; Tue, 11 Aug 2020 21:25:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GfgeTZn6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726819AbgHKVZB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 11 Aug 2020 17:25:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726816AbgHKVZA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Aug 2020 17:25:00 -0400
Received: from mail-pl1-x641.google.com (mail-pl1-x641.google.com [IPv6:2607:f8b0:4864:20::641])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAAFAC06174A
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2020 14:24:59 -0700 (PDT)
Received: by mail-pl1-x641.google.com with SMTP id t11so139166plr.5
        for <linux-doc@vger.kernel.org>; Tue, 11 Aug 2020 14:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=DFlBMPyt7J0RGkVcjHVECvZh9R+qJQmjTnftMhGc9oE=;
        b=GfgeTZn6K1IcL3MUGkyDVnbBmlavOTF/EaRjtJeJ24UF15Z/QRUGKapNcftg7Gs1dW
         dEaFRpGiRfLdrrjt1v8cCnkr8mj8Ckn7apw8aTpY6h0D6qiRCfGz0RgjqZUWAlH6UYdd
         4mFx3stCMztBu3Iu47TOCSaTckzQx8+5DY1NU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=DFlBMPyt7J0RGkVcjHVECvZh9R+qJQmjTnftMhGc9oE=;
        b=Zp31adqTgvne8zt9Rhnq4U3X1e8lXKuqAl0HePqigf4YU9ijhXvSltqb9zykUjoJKY
         9BL65oRNS/xLkRuY2eDoLGYBdsQdkMzB6M1Q33sTciDD072FRKwrWIsv1K7ER/5V858D
         JQIYNGKKKV/mddhF8KxlmNApSx1DEpPx74ZI4u5UPnEirdgxGHlZUyyeqWAwOJGjO9fP
         Q2OTLUtUuciNqSFc7wrNWWNWxMP4CcfcFcLnwz5dwgaJ6Jmdvco2yttstsaWDFyeSdgk
         JiMl4BPhwsnN+SLu2l75bCwhXvodYbQ5C1NQDHFnLe8j0HzpkWnmbK8bQvA1m981CAa3
         WJ8A==
X-Gm-Message-State: AOAM531IBrzlF6cts9us3J337jTjYE1a2i7+rZy+H7qkRK4a1cf+Q1tx
        xxu9GM6SnLeDTW65qcKRroVn1CoaPdw=
X-Google-Smtp-Source: ABdhPJxCPu5w1GCWEQMd5TdYawx2fktZItPPByTDo8uB/XfG/L7TDaJjOPvHnm5z/E7MUGh3RG0OYQ==
X-Received: by 2002:a17:90b:384b:: with SMTP id nl11mr3005244pjb.91.1597181099549;
        Tue, 11 Aug 2020 14:24:59 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id 16sm11871pfi.161.2020.08.11.14.24.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2020 14:24:58 -0700 (PDT)
Date:   Tue, 11 Aug 2020 14:24:57 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        "Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH] docs: Fix function name trailing double-()s
Message-ID: <202008111424.91AF109DCB@keescook>
References: <202008072348.3BA3DD14E@keescook>
 <20200811104834.5f5ff007@lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200811104834.5f5ff007@lwn.net>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 11, 2020 at 10:48:34AM -0600, Jonathan Corbet wrote:
> On Fri, 7 Aug 2020 23:49:59 -0700
> Kees Cook <keescook@chromium.org> wrote:
> 
> > I noticed a double-() after a function name in deprecated.rst today. Fix
> > that one and two others in the Documentation/ tree.
> > 
> > Signed-off-by: Kees Cook <keescook@chromium.org>
> > ---
> >  Documentation/RCU/lockdep.rst                           | 2 +-
> >  Documentation/process/deprecated.rst                    | 2 +-
> >  Documentation/translations/it_IT/process/deprecated.rst | 2 +-
> >  3 files changed, 3 insertions(+), 3 deletions(-)
> 
> This one doesn't apply, and it crashes b4 outright.  The problem seems to
> be some sort of encoding confusion...?

Hmmm. Weird. Something in the translation file? Let me try to re-send.

-- 
Kees Cook
