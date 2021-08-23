Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_NONE autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D2AD0C4338F
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 18:25:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B9F49613BD
	for <linux-doc@archiver.kernel.org>; Mon, 23 Aug 2021 18:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231402AbhHWS0T (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Aug 2021 14:26:19 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:58149 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232035AbhHWS0T (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Aug 2021 14:26:19 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1629743136;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=IoMQGNtx/jy2zBvOcw1dOvmgoSr0RnxRSETPbPR47uM=;
        b=CsR/6aGPZkJPkJsSyjBOr7WAFvCxocsMp5nq9YTQE1KgWEqanJ2R2wB9GVg+MXyIZrou1L
        sg2+KOZQXcnPuiC0W/E0gSIR+gbg73++LIs/sJvA+EDxuX5L7aR9FsmVV8RatPNHkxqdHe
        ZUh3iBwUmLkJNrygI3E9kMJvE5AKnPg=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-21-TEzVR_9uOMSA3jGWzjqu_g-1; Mon, 23 Aug 2021 14:25:34 -0400
X-MC-Unique: TEzVR_9uOMSA3jGWzjqu_g-1
Received: by mail-qt1-f199.google.com with SMTP id r5-20020ac85e85000000b0029bd6ee5179so8614398qtx.18
        for <linux-doc@vger.kernel.org>; Mon, 23 Aug 2021 11:25:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=IoMQGNtx/jy2zBvOcw1dOvmgoSr0RnxRSETPbPR47uM=;
        b=afrYC4bQt754dxq96KPpQEh3tsiIDzC21/VR4lQuF0NzvvyM73wODHq4bvNVjez/1u
         OY5tTzEMPQD8RZ1PbtcTB8wksZ/VeTwTjyMrjHCgGG3gH4Mk11elbcGN3M98dYf0wFRC
         Po66/Ee4l7SUnYREW4gZVcWAMBarCwrsyNSgYKqdL7sX30lGUSwsI7pNmceXPltHWwNE
         PHug5QbarXXwfKhjAqYLGp+X/G1MeWwA5wMjs/yKN3NXdvhfPl1offUdLwvsG10nlbgj
         LJ+a9q5H2xl/g9mxCgt5VMhBYl/wLT6HaImkrqgsOptf0g9qtHVwR8QpiqbyDe3agGA5
         CtUg==
X-Gm-Message-State: AOAM5336fw4JF3a/GjEiVX+MHaET0cRejAk0O+W9DYeVPl2Q7u9lwI/M
        PN8TLgi4fW3JmZ0kWvGVOFeeERoDnmmGrHyIUsJeem6hzfo0jED8V3AbM6hyhmfg9ljbt4oWrQt
        5kQjVuqPhI+6Ox7JZpIzRjw4Wtr/m5mAfRktd
X-Received: by 2002:a0c:c34f:: with SMTP id j15mr2795860qvi.15.1629743133902;
        Mon, 23 Aug 2021 11:25:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwtyueUptRb4amZTMySRu1SxUMFKNIehue92wAEuO+A7CrbnTDS+tQvD/YjzcM0Qqg8xw8f/s0gVqokMITc0J0=
X-Received: by 2002:a0c:c34f:: with SMTP id j15mr2795840qvi.15.1629743133700;
 Mon, 23 Aug 2021 11:25:33 -0700 (PDT)
MIME-Version: 1.0
References: <20210823171546.1686907-1-aahringo@redhat.com> <YSPcxzujfgmVhsLF@casper.infradead.org>
In-Reply-To: <YSPcxzujfgmVhsLF@casper.infradead.org>
From:   Alexander Aring <aahringo@redhat.com>
Date:   Mon, 23 Aug 2021 14:25:22 -0400
Message-ID: <CAK-6q+jkyy6jUG+S2BSiASbJxi6cXamYKX7J=biU1s774bYXJg@mail.gmail.com>
Subject: Re: [PATCH] Documentation: locking: fix references
To:     Matthew Wilcox <willy@infradead.org>
Cc:     corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi,

On Mon, Aug 23, 2021 at 1:56 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Mon, Aug 23, 2021 at 01:15:46PM -0400, Alexander Aring wrote:
> > -boosting logic [see rt-mutex-desgin.txt] For the purposes of
> > +boosting logic [see rt-mutex-desgin.rst] For the purposes of
>
> desgin?
>

oh, indeed. Yes, thanks. I will send a v2. :)

I was copy&pasting it and deleted some characters at the end of the
string. Then I spammed the tab key, now I know why it took longer than
just deleting the last three characters.

Thanks.

- Alex

