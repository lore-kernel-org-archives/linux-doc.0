Return-Path: <SRS0=OmAX=5X=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEA18C2D0EC
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:09:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A18EB20747
	for <linux-doc@archiver.kernel.org>; Tue,  7 Apr 2020 22:09:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TiAr3fDg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726407AbgDGWJr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Apr 2020 18:09:47 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43605 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726386AbgDGWJr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Apr 2020 18:09:47 -0400
Received: by mail-pf1-f193.google.com with SMTP id f206so1435895pfa.10
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2020 15:09:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fcP1ygunlzrB+/IY7p+yqz3gEfWJQ5UxEmSMXZ4hLfU=;
        b=TiAr3fDg1TNtdZRr4g2zL0USIyrIxZAONf/SXPMMoySV4wBmGdq4V6jWGUStFp1vVX
         mSu1D1+WE1Yw6ixgtHjDAsV0oVpB0q3Q+c/UBMTU/e14E+POP4Kr0ip3sY2F8OBk5Xo0
         AkIzrwdrbLwkBzSBsGhRBwH2EsZmDcwD5w7n5den2w9vUxG1OpGEWRl9VaqaY1zsQjrR
         FiGfjNeIUbhmwNQ44BRCwP4TDc1jfM8Xy96cfmImCqENqTkO+7pXtVHzQj9T+xvWHFeV
         xF5oyPQPYnEK1cW6S/U/mS5LFgNF9anu0iBupvlK9CMZSyiZ/HZ4qcjIG4diLyTMfgZ1
         6D3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fcP1ygunlzrB+/IY7p+yqz3gEfWJQ5UxEmSMXZ4hLfU=;
        b=X6ct6XR/ZioIPTDcjMwR1uyKT2PM1O/xZz+CNqmIWgWH2hPAehmuSwBHaCoHHSaIYk
         DanYAOe6Thih42ZPmOArPL9QrcHP8rcAPCyr3bgrNOJwNlvfS5C53STogzrl5kAWw123
         kNszFR/O08PXjEzOWDZnhONgMMY52VWUDoQtX1KzkdjelyrMwO86CEHk9004qdO3ZaXo
         ZZITNvhLYmBf7wBfbdjxJGsPh6cND99hUVOQfvJlM30vp22ElDJy+kk6Mp8kPBgW8Tls
         D0LppL3Xm6RKo/Vp2dSDO7J2q/iG2Ktz9GojcEsJ6QnQMoRWl/t7A9c/K1G7UFEOFIBN
         rDKg==
X-Gm-Message-State: AGi0PubuMO0FJMNGfzRnD4+KYQIds/sjRewlneeh/Ed9G7AIka4hHkf/
        uE48IWiQkUCnxHXIEqTQS1evUq45v3xw99oboXoz59eKEZk=
X-Google-Smtp-Source: APiQypJ6bbK90DSlr0QcO9jhVkH/uk6587RVKdaqFhB7pmMUqh3vLwbBjtnPpukohz1+52dIXJZJkFuuZfqZUgJFQZg=
X-Received: by 2002:aa7:97a6:: with SMTP id d6mr4759634pfq.154.1586297386243;
 Tue, 07 Apr 2020 15:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20200406220743.22183-1-l.rubusch@gmail.com> <20200407132442.72d19de7@lwn.net>
In-Reply-To: <20200407132442.72d19de7@lwn.net>
From:   Lothar Rubusch <l.rubusch@gmail.com>
Date:   Wed, 8 Apr 2020 00:09:10 +0200
Message-ID: <CAFXKEHadRuaD7mAOu0193K6DL-9Tr=BV2L3HoTKHGb9Aa4Pzdg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: memory - fix warning
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 7, 2020 at 9:24 PM Jonathan Corbet <corbet@lwn.net> wrote:
>
> On Mon,  6 Apr 2020 22:07:43 +0000
> Lothar Rubusch <l.rubusch@gmail.com> wrote:
>
> > The label in sphinx can refer to a document section but not to the document
> > header.
> >
> > The handle 'memory_allocation' is used in another document(s) to refer to
> > GFP_KERNEL flags description in this modified document.
> >
> > Since the sphinx label does not work as it is placed here, a proposal is to
> > better shift it to the section about memory allocation flags.
> >
> > Signed-off-by: Lothar Rubusch <l.rubusch@gmail.com>
>
> So I don't see any warnings associated with this label; what are you
> seeing and how are you getting it?  Which version of Sphinx are you
> running?

My setup says "Running Sphinx v1.8.4". My sources are cloned from
git://git.kernel.org/pub/scm/linux/kernel/git/gregkh/staging.git from
branch testing-staging
Am I doing this correctly?

I tried
$ git clean -fxd
$ make htmldocs
(...)
writing output... [ 16%] block/request .. crypto/api-akcipher
./include/linux/slab.h:503: WARNING: undefined label:
memory-allocation (if the link has no caption the label must precede a
section header)
writing output... [ 19%] crypto/api-digest .. driver-api/dmaengine/client
(...)

Alternatively, on plain console I see the following
$ make htmldocs
(...)
preparing documents... done
./include/linux/slab.h:503: WARNING: undefined label:
memory-allocation (if the link has no caption the label must precede a
section header)
/home/user/linux/Documentation/networking/devlink/devlink-trap.rst:302:
WARNING: undefined label: generic-packet-trap-groups (if the link has
no caption the label must precede a section header)
writing output... [100%] xtensa/mmu
waiting for workers...
(...)

Is this reproducible to you?

Honestly, I figured out my current patch fixes nothing. I see
definitely a warning there,
but the problem is different:

A working referrer e.g. in Documentation/vm/index.rst:5
:ref:`Documentation/core-api/memory-allocation.rst <memory_allocation>`

The erronous referrer in /include/linux/slab.h:503
:ref:`Documentation/core-api/memory-allocation.rst <memory-allocation>`

Now this is really embarrassing! Can it be that I should rather have
replaced the '-' by a '_'?

I would like to file a patch v2. Please rather consider the second
patch, if this warning is reproducable to you guys.
I appologize for not having checked enough!

Best,
Lothar
