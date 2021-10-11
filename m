Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD68FC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 03:31:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A57BD600CD
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 03:31:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233868AbhJKDdt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Oct 2021 23:33:49 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:37825 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233264AbhJKDds (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Oct 2021 23:33:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1633923109;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=DopLGzlmOB4HEdCaVkJ/RsYex88mvAawbRk2bHl6QL4=;
        b=UdQnChq+otYIX3B4PbPUTcpqle0XxcJAWBnJPW2wf7zv/NkxMP8zT6jnmX+URMVtT76mHM
        YCc6MndyeVHAWVz+pBBZaI4VplP0Y1ER8liMmcDHzLUyTBkVNcCZujpmjoAaey9DM1jRaw
        i++7Kg77hY+TTMk/WM9F026tcoYwkTw=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-434-xXuK27ZhPkO0Dsqy0lF_1Q-1; Sun, 10 Oct 2021 23:31:47 -0400
X-MC-Unique: xXuK27ZhPkO0Dsqy0lF_1Q-1
Received: by mail-lf1-f69.google.com with SMTP id n22-20020a0565120ad600b003fcc09af59fso11587225lfu.21
        for <linux-doc@vger.kernel.org>; Sun, 10 Oct 2021 20:31:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DopLGzlmOB4HEdCaVkJ/RsYex88mvAawbRk2bHl6QL4=;
        b=O+M/4UFQ5IzvT6EP/JbFqus2xfyU6BX9Cs+6cDOaBvTGbls80vc+I6z93qWuanYEF1
         +4+tfBT7Fv45RXSW/BD8xB1Hf0U0zxunSIhAHU6zR5c1kvQ/2JY2O2QRmkULu8t4vSCb
         w2vuzJp65Go9k7m4AptD8/9LU75y9J5N9k1IU7xZTz1Z5kSnXGpF+r6uoTG7dAZQqhMl
         la8tymHBuCIQBY1wOUjaniUW/0SOEbHcoO/hoVkooYuGqPYUr44lMwHG1sVX8ciLLOO4
         vFmi3XC0QUf72oHAtqtMq6rF/Dg5/GlST4znhhjKViwcc4g3LOJ+mdPmAdOLhr2fagXg
         3eOg==
X-Gm-Message-State: AOAM531B0xVYN3hpmqV+jOffesmtUx97NEAd4iZfEOf3DL6+mPStQ9OB
        FCrGqdz8td5CCTW2LZPOviOkpfI8xnJ4i+d+0XpHNqceMJVy6zEbzVzmAM5WJtNgG0z6S0YhnCQ
        em51MLhQVfwbgqx6tBYVOqquxopisOy/8nrOx
X-Received: by 2002:a05:6512:32ca:: with SMTP id f10mr25388729lfg.498.1633923106299;
        Sun, 10 Oct 2021 20:31:46 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxYohr1FlcKG2NxgTdHVVMnCKaJn7rrf94S26N3UdjJfTh6R3wipgXYVNmB+4t0jp2WQTKZQ5h1Rb1nHWApW0c=
X-Received: by 2002:a05:6512:32ca:: with SMTP id f10mr25388719lfg.498.1633923106150;
 Sun, 10 Oct 2021 20:31:46 -0700 (PDT)
MIME-Version: 1.0
References: <20211006202904.30241-1-rdunlap@infradead.org>
In-Reply-To: <20211006202904.30241-1-rdunlap@infradead.org>
From:   Jason Wang <jasowang@redhat.com>
Date:   Mon, 11 Oct 2021 11:31:35 +0800
Message-ID: <CACGkMEvTdhD3GJfKJgb1pGSuxDNRPSFDFN12-zwAmB6=7E1OXw@mail.gmail.com>
Subject: Re: [PATCH] VDUSE: fix documentation underline warning
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     linux-kernel <linux-kernel@vger.kernel.org>,
        Xie Yongji <xieyongji@bytedance.com>,
        "Michael S . Tsirkin" <mst@redhat.com>,
        virtualization <virtualization@lists.linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 7, 2021 at 4:29 AM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> Fix a VDUSE documentation build warning:
>
> Documentation/userspace-api/vduse.rst:21: WARNING: Title underline too short.
>
> Fixes: 7bc7f61897b6 ("Documentation: Add documentation for VDUSE")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Xie Yongji <xieyongji@bytedance.com>
> Cc: Jason Wang <jasowang@redhat.com>
> Cc: Michael S. Tsirkin <mst@redhat.com>
> Cc: virtualization@lists.linux-foundation.org
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> ---

Acked-by: Jason Wang <jasowang@redhat.com>

>  Documentation/userspace-api/vduse.rst |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> --- lnx-515-rc4.orig/Documentation/userspace-api/vduse.rst
> +++ lnx-515-rc4/Documentation/userspace-api/vduse.rst
> @@ -18,7 +18,7 @@ types can be added after the security is
>  is clarified or fixed in the future.
>
>  Create/Destroy VDUSE devices
> -------------------------
> +----------------------------
>
>  VDUSE devices are created as follows:
>
>

