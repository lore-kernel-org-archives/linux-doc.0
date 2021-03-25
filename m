Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A54A5C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 09:45:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 485BF61A14
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 09:45:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229581AbhCYJpI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 05:45:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229635AbhCYJor (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 05:44:47 -0400
Received: from mail-yb1-xb2f.google.com (mail-yb1-xb2f.google.com [IPv6:2607:f8b0:4864:20::b2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7260FC06174A;
        Thu, 25 Mar 2021 02:44:47 -0700 (PDT)
Received: by mail-yb1-xb2f.google.com with SMTP id j2so1607334ybj.8;
        Thu, 25 Mar 2021 02:44:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+PfQDO+5GIAWlGMTApmz7JCWjFl0RbrHV3jbq4RYJno=;
        b=vBkyt7PulbbHh2XQeZOuV2kZe1ViU1f0eEsNskuhK8f8UaWLJA7HoR13/g+hXNP+GQ
         D9vTpRdNBldW1hIc03DS25fmz6ZF4l9cfpbPPn5C2dgI1djw10iS6OSwzYdWyH8vzvzW
         5juu6YQnf9BAZIIPnPNLB1lGZUDgO4cQ7pO4npTofT2mIFV9XnQRvUnK6nciRskdsQRt
         nQm3CB2IHiXoz3HtIEjoEZT5HtRyMjZD+p+gYSnY7FpwHmGI0bIFquQgCU42tRkQ7+zg
         Peq+NN6uihm4srs6FrP2RU8Zs1dCk5ub01ZbhZJ0Fjg2InqkvFOfzNS+TCM4yhdA0mmc
         K9Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+PfQDO+5GIAWlGMTApmz7JCWjFl0RbrHV3jbq4RYJno=;
        b=X7plR6In46CVD6mxCNZIvSNaICG/U+b36+zew4YVp2dP8i2ykay1DqJFvRJLQBHoQc
         xdsDk3z3rsIdCG5MtFL6u6CV7BKTR5R6Fv9/ZPXzA8CBepPV8RJEvI2F8FcW1LYGF4AU
         2TM2wUxP01s6VqyIKgDTpvNc9MZsXStSXVp+u0U2jsceVkP2NMuJP7zTcz4OWmRQUkCS
         9lAuJm8Wbndq3IF+SkJixgx226Gr7FM4syeXekivGdG8hsThzS23BM1OqGILDiIYq+G2
         oeaYMc8bxtWFy0n/VKDJ0C5/sC0twzXH+Hvbn0L7fjouf5fSvVBGmbflrHcD+d2Mu5kd
         UWnw==
X-Gm-Message-State: AOAM532XpsQVCvsUVm/LEJ6dRH95U4wTNw59nVOwaHiFHC/5mOb5q2+1
        QWqu240KEgEKXh9xUEUu81eQTI3HbHwsIOUVIID1yDYbRzjL6w==
X-Google-Smtp-Source: ABdhPJx8jatvMzExd1kWt4jYqHsKfmdYWME1ump36KR919Lb+Iu8nflUbMlf5w1yMNhSI3KypAO6JVTtDBrHI1YkwWU=
X-Received: by 2002:a25:3b55:: with SMTP id i82mr11517623yba.422.1616665486863;
 Thu, 25 Mar 2021 02:44:46 -0700 (PDT)
MIME-Version: 1.0
References: <16043769.gqpzGLO8mG@pinwheel> <20200703073143.423557-1-danny@kdrag0n.dev>
 <20200703062950.5e8c1785@lwn.net> <9486d1ab-580a-0819-10c9-a62354a255e1@rasmusvillemoes.dk>
 <CAK7LNAQ+M5Cn84tkEAiLDoyaKmrG-cFOyUjPgFC2+ksDGHn3vQ@mail.gmail.com>
In-Reply-To: <CAK7LNAQ+M5Cn84tkEAiLDoyaKmrG-cFOyUjPgFC2+ksDGHn3vQ@mail.gmail.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Thu, 25 Mar 2021 10:44:35 +0100
Message-ID: <CANiq72nq-EyN5G9Atv5TMD+ZVsbYOPf7af18bermXs9b3-w6xg@mail.gmail.com>
Subject: Re: [PATCH v2] editorconfig: Add automatic editor configuration file
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        Jonathan Corbet <corbet@lwn.net>,
        Danny Lin <danny@kdrag0n.dev>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 25, 2021 at 8:02 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is sensible for tools that interface to users.
> Users have no interest in which language is used
> internally.

Agreed in the general case (e.g. everyday tools). In the kernel's
case, however, I think it is not as important.

And I guess most of us tab-autocomplete anyway... :-)

> Rather, I very much like this patch, but I just
> wondered how this case could be handled.

Symlinks might be a good way when there is an installer of some kind.
But in the kernel's case, I would prefer to avoid having symlinks for
every script (in particular if they are in the same folder).

Cheers,
Miguel
