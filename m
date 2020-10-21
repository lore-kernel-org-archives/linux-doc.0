Return-Path: <SRS0=tqpN=D4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44753C4363A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 20:44:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C16072415A
	for <linux-doc@archiver.kernel.org>; Wed, 21 Oct 2020 20:44:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eR/u85b/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440795AbgJUUoe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 21 Oct 2020 16:44:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38596 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2440724AbgJUUoe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 21 Oct 2020 16:44:34 -0400
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com [IPv6:2607:f8b0:4864:20::443])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F409C0613CE
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2020 13:44:34 -0700 (PDT)
Received: by mail-pf1-x443.google.com with SMTP id c20so2190427pfr.8
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2020 13:44:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ToNH8GJuZ5rTdifevtZT8GFNBviH6s2F8SrsK2qyVY0=;
        b=eR/u85b/Zu/amsL8sCxSY2DnlP2Ehk3lIHJnhKz0Lo/gM0vBBdbixGiQlZ5J0xQZlv
         yODucoIDiS4Ab48gtTtCHB/X3vsuT6qGAxVE24qmG8mbpb6olpl5oVeertMysd1tJsGh
         AiYx01TeIjGW48ApOv7+VvBCHqaW4SXpJafYy+HNJhciEPo/XjPuL6fthVdBi039Qcyq
         PBxp/I+h/ujkmKG9JRqjH7UWvXIamXWIJhcfBYz7fdH/cv8hti7OXrGpzkcNYmmeRDK4
         N0nIw3DY+7L0dnJmCLkbJmOC4ie0iYQ0L2VxBD2aac7T10/NYiRhHhY8z5gujzDp6yS2
         srNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ToNH8GJuZ5rTdifevtZT8GFNBviH6s2F8SrsK2qyVY0=;
        b=ZcO1GaUKJvRhBfdLavJW+Kg9YE9v7Q0sS+V3W69woHQJkHlNS93gBjD9zBPOnWnmwZ
         T+eGJXvmY29OJnldijjHn37AO8/L/kWCQ6rEya9GjY8TSce8SdXv9/WgTtclbvdG3x8c
         OV82isnMP5f1rEuFL/KTHOI9Le9ksafpjds+sAFqNc4oa69oqFlxxip6u5oFqtuurBmP
         H3UYzL2WFP+6+rjRqO7b0YsejfLyzrxXjt5ItfEILkaRrtBUboLbGMPUbcqFDPrF08CU
         Rog+ee3WO7nRICUVS2xd29Gq/R1hKzsKg7L5TBJFWfK5UfrefvI1Mml9Um3stMJyVxby
         ZxWQ==
X-Gm-Message-State: AOAM530ypVVUkqJv2hlrOWlXvRR/c4BdUGoOV133ICNvVF2HX480f/b4
        y9EGbCimX4C9B74bFn+dTceI931QzodUmiDfF1Micg==
X-Google-Smtp-Source: ABdhPJxCBzWvlDptnlUC4y/kkY4UVyb3az9b3ad04JiC78/1Nkpox0BI5W6rCZyYsH1x3/hNf+ty4ao55Bww36Fop0U=
X-Received: by 2002:a62:d44d:0:b029:152:ebc:77f8 with SMTP id
 u13-20020a62d44d0000b02901520ebc77f8mr5394843pfl.14.1603313073426; Wed, 21
 Oct 2020 13:44:33 -0700 (PDT)
MIME-Version: 1.0
References: <20201021192518.31187-1-sjpark@amazon.com>
In-Reply-To: <20201021192518.31187-1-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Wed, 21 Oct 2020 13:44:22 -0700
Message-ID: <CAFd5g45cz=8ytDt+xC_kkF19j0rU2TvkM2siiGCpG4nXxe6CEQ@mail.gmail.com>
Subject: Re: [PATCH] Documentation: kunit: Update Kconfig parts for KUNIT's
 module support
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, SeongJae Park <sjpark@amazon.de>,
        Shuah Khan <skhan@linuxfoundation.org>,
        David Gow <davidgow@google.com>,
        "open list:KERNEL SELFTEST FRAMEWORK" 
        <linux-kselftest@vger.kernel.org>,
        KUnit Development <kunit-dev@googlegroups.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 21, 2020 at 12:32 PM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> If 'CONFIG_KUNIT=m', letting kunit tests that do not support loadable
> module build depends on 'KUNIT' instead of 'KUNIT=y' result in compile
> errors.  This commit updates the document for this.
>
> Fixes: 9fe124bf1b77 ("kunit: allow kunit to be loaded as a module")
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: David Gow <davidgow@google.com>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
