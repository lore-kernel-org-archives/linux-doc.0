Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98B28C12002
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 19:04:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 747BB610CB
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 19:04:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240079AbhGNTHW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 15:07:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40090 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhGNTHW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 15:07:22 -0400
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com [IPv6:2a00:1450:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C215C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 12:04:30 -0700 (PDT)
Received: by mail-lf1-x134.google.com with SMTP id v6so5403787lfp.6
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 12:04:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5qboNP9wECqxtAQPwi4Gka7E9oHhS1YQMu+Q8JxA7ak=;
        b=glh504o9Z7GfM84TfN6a9e1MVve+NDS52G62Hq+T8wU2hET7iB2/LaVZ85dbskzDgh
         yAhIlfeW60S6JOo6yc3CQ/IrfJT+6DnE98rLe7dMWar89uMeZPDVQtzoII2b3yZofc4W
         nDIrMzgD5EdLgxaeyj2u+vGDFkWBSBw0uXR4E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5qboNP9wECqxtAQPwi4Gka7E9oHhS1YQMu+Q8JxA7ak=;
        b=BoxiqQe3jAdTWZ6KuxpgJyP+pbbiRRJypjcS+Dvt0OhwAIpKuyVdXOj7RVrZrKrYeG
         FInXQ6kLQe97kJ9t2g3bCxun4AfvmMx/PDQtj7IvEcVEryCLoBk3IvvE2P4U2NnMNrd8
         ol2FBBhKJMKCDsqQriLMWheKHiIbIeEabfM8Z8N50EEdLWNa+S08I3J00MxMql1e32P2
         JY5YrI+VJuCvxNLCk8/n27vS5A46/4jWEw+zipNvAaqesCXFnxIWEfhO/j0fgok8mN63
         vBmxH8QhA91EzI8NcOXEilVzQKClu6Op1nrVaEcDa1pfKfgkn4LanZoF13IYRD1axpBs
         G/2Q==
X-Gm-Message-State: AOAM533nES0mpgHM5MfhOLe2orpdjL4lyKprItCB7V4KuTNDyuLr8wcQ
        Yg+lW7DAP6FIps5StQMNC+ko9FRgWGsSREHW
X-Google-Smtp-Source: ABdhPJzSR6phJNQheefVQEmhtIuTrCOqmHS4huVXqJU9vv7OXvezp2/R52l4FUPnLjY7sT+upwAAiw==
X-Received: by 2002:a05:6512:230c:: with SMTP id o12mr9021206lfu.20.1626289467918;
        Wed, 14 Jul 2021 12:04:27 -0700 (PDT)
Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com. [209.85.208.174])
        by smtp.gmail.com with ESMTPSA id f30sm225127lfj.219.2021.07.14.12.04.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Jul 2021 12:04:24 -0700 (PDT)
Received: by mail-lj1-f174.google.com with SMTP id s18so4968871ljg.7
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 12:04:24 -0700 (PDT)
X-Received: by 2002:a05:651c:1798:: with SMTP id bn24mr10307687ljb.335.1626289464172;
 Wed, 14 Jul 2021 12:04:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210704202756.29107-1-ojeda@kernel.org> <20210704202756.29107-3-ojeda@kernel.org>
 <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
In-Reply-To: <CAKwvOdmhRuF5eTZ2ztZBrL6BvDkA57B7OfVuvCaEMfV8nkLXCQ@mail.gmail.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Wed, 14 Jul 2021 12:04:08 -0700
X-Gmail-Original-Message-ID: <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
Message-ID: <CAHk-=whzXv=Fu7dQshSTyd9H1-JS5=gyKwW-GMNGccAKs4Mwpg@mail.gmail.com>
Subject: Re: [PATCH 02/17] kallsyms: increase maximum kernel symbol length to 512
To:     Nick Desaulniers <ndesaulniers@google.com>
Cc:     Miguel Ojeda <ojeda@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Alex Gaynor <alex.gaynor@gmail.com>,
        Geoffrey Thomas <geofft@ldpreload.com>,
        Finn Behrens <me@kloenk.de>,
        Adam Bratschi-Kaye <ark.email@gmail.com>,
        Wedson Almeida Filho <wedsonaf@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 11:20 AM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> Do we demangle rust symbols when printing a trace from a warn/panic?
> That would be nice.

I think it would be pretty much required. Otherwise stack traces are
going to be very very painful.

In fact, I'm starting to think that Willy is right: we should use
hashes for the "real" symbol name, and have demangled names for
printing, and at no point would the kernel actually want or need to
have the nasty mangled names.

(This wouldn't be rust-specific - using hashes for module linking
sounds like a good diea for C code as well, even if the de-mangled
names for printing are then the regular ones)

Anybody interested in looking into that? It would make this "big
kernel symbols" patch immaterial.

             Linus
