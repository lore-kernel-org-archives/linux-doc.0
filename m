Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B26FEC43461
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 18:08:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 901B66137D
	for <linux-doc@archiver.kernel.org>; Thu, 15 Apr 2021 18:08:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233745AbhDOSI7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Apr 2021 14:08:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232759AbhDOSI7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Apr 2021 14:08:59 -0400
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0096DC06175F
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 11:08:35 -0700 (PDT)
Received: by mail-pj1-x102c.google.com with SMTP id kb13-20020a17090ae7cdb02901503d67f0beso1783559pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 15 Apr 2021 11:08:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=ZmIKFqUHduSAESy/4PeOU4GLOIssUo9k0MhB+rtUuxQ=;
        b=PAAA1ea9mxCTLUm8rMnTT5Bz5uVDe7aIm2+CS58Eq71KP7XnCrvhijNuLJxuEe90BQ
         gv101TXrm7o+GZO8H1bHUb13ljxphmsan9DDXjQ0mfKtiflDz8G3FoWYhAmlLYtJamNC
         AfRa4VoecAaE7wasorSg+6yvy22JlDtKF7w/o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ZmIKFqUHduSAESy/4PeOU4GLOIssUo9k0MhB+rtUuxQ=;
        b=eGMeWuySAIMxIXy69MlMo22Ai6rtIA1CRBBVsFFtO4VWUbOklJr13yGOIJ/3D9uExT
         dAzW/0LUdga0XW1IKX8youQe5Hw/wgEMnw/wvPTBZam64Y7NQaCoZOXW5zKWDF8rTd7W
         ugEdEV8rPxBbRdZqMzOd8Z1YeTXQ5QsI9TyWdITj7tfsRxBolNvH5EYT60KPeA+b5PHC
         SnpYaLTOEbA0BCIdUfOy7mqQSQ8W9cFDs2jQ6JPPFzV/ULwX3I+yTutvRZrPZMzHmtzU
         0RTmaBkgwSzCaE3/F2KIfwT3g+tmllkSfckXkARQ75+djQ+LRoEhpyu/zwDDXYBlVhIY
         crhA==
X-Gm-Message-State: AOAM530TYLomZwUSkZp8U8Tae2OhmvgfYe3Rn1fiMZhQu1m99YkBFByV
        Hbj85rI/HH3lA8I+jV2dEsO9jA==
X-Google-Smtp-Source: ABdhPJwV/iOPwRirOtIF2WPN0bS+rgljCqrBIoMJMtQGrpGIZKfWvo2Q4gixIqblVzkxGsqtn16B8g==
X-Received: by 2002:a17:902:eec5:b029:ea:bffe:2b06 with SMTP id h5-20020a170902eec5b02900eabffe2b06mr5413492plb.8.1618510115438;
        Thu, 15 Apr 2021 11:08:35 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id x194sm2993217pfc.18.2021.04.15.11.08.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Apr 2021 11:08:34 -0700 (PDT)
Date:   Thu, 15 Apr 2021 11:08:31 -0700
From:   Kees Cook <keescook@chromium.org>
To:     David Laight <David.Laight@ACULAB.COM>
Cc:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 00/13] [RFC] Rust support
Message-ID: <202104151107.8E3D919@keescook>
References: <20210414184604.23473-1-ojeda@kernel.org>
 <CAHk-=wh_sNLoz84AUUzuqXEsYH35u=8HV3vK-jbRbJ_B-JjGrg@mail.gmail.com>
 <CANiq72mSMtfdRFPGJKuoqCBFdsa_xHvx9ATjcB7QSunQdDHBuw@mail.gmail.com>
 <202104141820.7DDE15A30@keescook>
 <8eaa65020c0d44ed9122fed5acf945a0@AcuMS.aculab.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8eaa65020c0d44ed9122fed5acf945a0@AcuMS.aculab.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 15, 2021 at 08:26:21AM +0000, David Laight wrote:
> ...
> > Besides just FP, 128-bit, etc, I remain concerned about just basic
> > math operations. C has no way to describe the intent of integer
> > overflow, so the kernel was left with the only "predictable" result:
> > wrap around. Unfortunately, this is wrong in most cases, and we're left
> > with entire classes of vulnerability related to such overflows.
> 
> I'm not sure any of the alternatives (except perhaps panic)
> are much better.
> Many years ago I used a COBOL system that skipped the assignment
> if ADD X to Y (y += x) would overflow.
> That gave a very hard to spot error when the sump of a long list
> way a little too large.
> If it had wrapped the error would be obvious.
> 
> There are certainly places where saturate is good.
> Mostly when dealing with analogue samples.
> 
> I guess the problematic code is stuff that checks:
> 	if (foo->size + constant > limit) goto error;
> instead of:
> 	if (foo->size > limit - constant) goto error;

Right. This and alloc(size * count) are the primary offenders. :)

-- 
Kees Cook
