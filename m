Return-Path: <SRS0=KUUv=ED=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=BAYES_00,DATE_IN_PAST_12_24,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F039C55179
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 22:26:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A7D320706
	for <linux-doc@archiver.kernel.org>; Wed, 28 Oct 2020 22:26:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E91sXcD3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733073AbgJ1W0O (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Oct 2020 18:26:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55030 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733054AbgJ1W0O (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Oct 2020 18:26:14 -0400
Received: from mail-oo1-xc41.google.com (mail-oo1-xc41.google.com [IPv6:2607:f8b0:4864:20::c41])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9546C0613CF;
        Wed, 28 Oct 2020 15:26:13 -0700 (PDT)
Received: by mail-oo1-xc41.google.com with SMTP id c25so254751ooe.13;
        Wed, 28 Oct 2020 15:26:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FK45UsEFUJMqjnQFfEw2JOOplxSwJOaVgJWuuCrbxGQ=;
        b=E91sXcD3l4E8upi2Jm/K8WbyFI3KhHE0/7BKcniyKEi8wGansk/FBJQXKyeuliJWJ9
         79j4Yb2qaVaSSg4ylBSTEATL8LBRnAe8mpyKw62A3aYfuz9PHYeqFGG5hMxzuLF3VFmg
         PacdQ8OzYXhFS5kXmSXCFwpFHteXnuCLXKad50LzlZRf+JhaZFs+amM6xZxb/dRFAWDq
         9F2dh/o8LoqJaWAV/jFO/yPlZGwU6aFiUmE1bdzMLWC5MA5i8t0roAOdJfg3eeaya5y2
         QHOCpB6K2J1MVmvDhivLgPod3NEk2BgYke05yKIHLEdw9/1CUGj5g0lJ3z+d6kYUBgRF
         lc1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FK45UsEFUJMqjnQFfEw2JOOplxSwJOaVgJWuuCrbxGQ=;
        b=iEfhjs47mnYBwG9QuxsnrNdEGpdp104L0J0FNt5b/OJSOMZxBbcXuBsNmEDcUHEi0B
         9AlVXulnFnBMAeqqxgq+FjjM7gPeYVw+TOf0MNzrgsxPwtZ/9PPmuThceW2kXAOrsMSV
         sp+dvVGQ+wF0sKQM9GbmTYhSCu3nWqOdYI7/ruU99GgrYuE7+2Oj2x1m1Q7EHQougtB5
         PJCjGMH1D92Ji/rO+YOrGDrkh7r9LigJuaztSAZCXxqFL3NDAV+hWQOdYMnKf0Gv3kKn
         z3cWFr3YlqoTK9Wjouug4bOYl5B0Q9LT1MZaqXMXekXdAogeCh6hdUgf99dO6IPOzVh4
         5BdA==
X-Gm-Message-State: AOAM531odZKYmLitr0y2bToIT0LMwNPdFmrWGHZN4vmVbYzOrXKmauTB
        gqI1ZOBKXr6XKtg4wsBriKMWRiPwGb9PBefWU7vTNGui7tM=
X-Google-Smtp-Source: ABdhPJzAWDKe7Om5QMAw8dmU/sek2nFcNeyNm7ZIqqXouZ54rMExbLH9ZQklwYJv4CtxUIyds2QUuSAPYJRVigCVm8w=
X-Received: by 2002:a4a:a2ca:: with SMTP id r10mr4041487ool.90.1603851893453;
 Tue, 27 Oct 2020 19:24:53 -0700 (PDT)
MIME-Version: 1.0
References: <1597873980-204052-1-git-send-email-raphael.norwitz@nutanix.com> <d81c567970db5aefcc59d6f967c82f17@kernel.org>
In-Reply-To: <d81c567970db5aefcc59d6f967c82f17@kernel.org>
From:   Raphael Norwitz <raphael.s.norwitz@gmail.com>
Date:   Tue, 27 Oct 2020 22:24:42 -0400
Message-ID: <CAFubqFtywPbUtQ+T8widqoeaZyzRU6sJMiksKUQ0umQ7PTL5Kg@mail.gmail.com>
Subject: Re: [PATCH] Fix typo in irq_domain documentation
To:     Marc Zyngier <maz@kernel.org>
Cc:     Raphael Norwitz <raphael.norwitz@nutanix.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Ping - looks like this was never applied?

On Tue, Aug 25, 2020 at 6:23 AM Marc Zyngier <maz@kernel.org> wrote:
>
> On 2020-08-19 22:53, Raphael Norwitz wrote:
> > The irq_domain documentation states that "Here the interrupt number
> > loose all kind of correspondence to hardware interrupt numbers:...".
> > It's clear from the context that the author means to use "loses"
> > instead
> > of "loose". To avoid future confusion, this change fixes the
> > aforementioned wording.
> >
> > Signed-off-by: Raphael Norwitz <raphael.norwitz@nutanix.com>
> > ---
> >  Documentation/core-api/irq/irq-domain.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/Documentation/core-api/irq/irq-domain.rst
> > b/Documentation/core-api/irq/irq-domain.rst
> > index 096db12..eba5e41 100644
> > --- a/Documentation/core-api/irq/irq-domain.rst
> > +++ b/Documentation/core-api/irq/irq-domain.rst
> > @@ -15,7 +15,7 @@ such as GPIO controllers avoid reimplementing
> > identical callback
> >  mechanisms as the IRQ core system by modelling their interrupt
> >  handlers as irqchips, i.e. in effect cascading interrupt controllers.
> >
> > -Here the interrupt number loose all kind of correspondence to
> > +Here the interrupt number loses all kind of correspondence to
> >  hardware interrupt numbers: whereas in the past, IRQ numbers could
> >  be chosen so they matched the hardware IRQ line into the root
> >  interrupt controller (i.e. the component actually fireing the
>
> Acked-by: Marc Zyngier <maz@kernel.org>
>
>          M.
> --
> Jazz is not dead. It just smells funny...
