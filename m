Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9E0EEB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jun 2023 16:58:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229743AbjFVQ6t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jun 2023 12:58:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbjFVQ6s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jun 2023 12:58:48 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D72C110F0
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 09:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687453079;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=gAWxNjxnJA5QCZuC21KgBhCKxi4eQ+4jpeKcX1+CbJE=;
        b=FIVYDFaTyRNXYoRQz21KLaap7EEybzwha2+qtk4h6xSvypJH0ngg8/wy4Ds4HR+GAyx1KB
        2vccQQhr37yXQPbZfnVgOVNRPxHfDeLRxQXiit30WlVqGSmYHYiuVaQgYJMV6Fyq1tQFzT
        WrBgGa1zcmUhWqpucQqUl4enbBZWvSE=
Received: from mail-oa1-f70.google.com (mail-oa1-f70.google.com
 [209.85.160.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-314-b00uXniLNJ-DHwqz0X3d2A-1; Thu, 22 Jun 2023 12:57:54 -0400
X-MC-Unique: b00uXniLNJ-DHwqz0X3d2A-1
Received: by mail-oa1-f70.google.com with SMTP id 586e51a60fabf-1a7e3a83f06so6685302fac.2
        for <linux-doc@vger.kernel.org>; Thu, 22 Jun 2023 09:57:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687453073; x=1690045073;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gAWxNjxnJA5QCZuC21KgBhCKxi4eQ+4jpeKcX1+CbJE=;
        b=hr6fSDpKzpNXtPpviwO4D18blVbiYAmG4EXxR8091xwFjnLIhdYggXgHrELhkNoaJy
         g/ON1y6GlhBbKsM6wr3Gn6QvPvrUn+TW6JG3c92zlSOGp8jXEKZOl17z/R8t3MPZwzRh
         1aHRi9ym2b768kKDe9XnMsFBJv9a8XMSP2ZpULRxLCEjuJvf6EBxrWuXZtwfV1KRD5Rr
         ys80mlBzA7YUlJ2oVnH5lkuGBplPrmMVnFYqcALGeLx8hk6SDtD1yM5k6u/RvcBe/nnM
         XdAh6jPyFBH63PxQpHC+NoS44Rbc2LG3La/6+fDms6KzhG5TzWCdCLnwzRHnOamiaUYz
         2Xkg==
X-Gm-Message-State: AC+VfDwG3a310vaTUgyyn+8WrvzQBwz2gzFuvZKb6cEtpEmhzpExAngt
        jXYvivAOa0a6IMft4YLeJEdFMzdGGnJsx/9rhqcahD3i7+H3Vsak2on8iMv/VxCYMXP3R+QQqfs
        7VlMyGJtRvZaFM87Gb/tkDVCI+kdwNKVG+bmG
X-Received: by 2002:a05:6870:9202:b0:1a2:a6e8:9832 with SMTP id e2-20020a056870920200b001a2a6e89832mr14821067oaf.42.1687453073603;
        Thu, 22 Jun 2023 09:57:53 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7qMzXwVZhsP3YURXvCdNBdCdVaT/83FElq+TxTMvTCIeN2GPAsQiFS/opK9wjGO8ykDYr9ONOA8/x+vU7B/Bk=
X-Received: by 2002:a05:6870:9202:b0:1a2:a6e8:9832 with SMTP id
 e2-20020a056870920200b001a2a6e89832mr14821059oaf.42.1687453073421; Thu, 22
 Jun 2023 09:57:53 -0700 (PDT)
MIME-Version: 1.0
References: <20230622071004.2934698-1-costa.shul@redhat.com> <a0e8aba6-b28f-c460-9bab-5695000727fb@infradead.org>
In-Reply-To: <a0e8aba6-b28f-c460-9bab-5695000727fb@infradead.org>
From:   Costa Shulyupin <costa.shul@redhat.com>
Date:   Thu, 22 Jun 2023 19:57:42 +0300
Message-ID: <CADDUTFy_e61TfMkxE0f7Lnt5QXA09YKi-0rx6ULmw+9LQ00FbA@mail.gmail.com>
Subject: Re: [PATCH] docs: consolidate core subsystems
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 22 Jun 2023 at 18:36, Randy Dunlap <rdunlap@infradead.org> wrote:
> a. I'm not sure that locking is a subsystem (it's a core API IMO).
Actually https://docs.kernel.org/locking/index.html describes more
than just API.

> b. I often have trouble finding "filesystems" and I think that it should be
>    given a higher location in the TOC (somehow).
I plan to put "filesystems" under "Storage subsystems" in the next patch.

Thanks
Costa

