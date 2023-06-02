Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3257BC77B7A
	for <linux-doc@archiver.kernel.org>; Fri,  2 Jun 2023 10:41:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235665AbjFBKlc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 2 Jun 2023 06:41:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235784AbjFBKlZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 2 Jun 2023 06:41:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C620E78
        for <linux-doc@vger.kernel.org>; Fri,  2 Jun 2023 03:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1685702381;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=1oIs4hW1Px3lZ0xUVZ1XPcup+O4BGgrBN10BZiIxxqM=;
        b=CmDoS4cOUmSIwNSh5hRIFg/POk86GeFzTlkzVx6Lvz3zcmEaLJImqEdYM6G1jMwGefI5Pl
        z9XGtu2BNwT1HgFLzTsHbyaIzluVwAOC3Mz8SdlxMvTMTm1ZkIoeRPf+lxuHIpwACwVZKC
        cv4NqZko+vdefC3DL/PYMS4Wpy/PI7k=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-zNxuVYLqOX6UF7-WKeR0uw-1; Fri, 02 Jun 2023 06:39:40 -0400
X-MC-Unique: zNxuVYLqOX6UF7-WKeR0uw-1
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-3f5df65f9f4so10540915e9.2
        for <linux-doc@vger.kernel.org>; Fri, 02 Jun 2023 03:39:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685702379; x=1688294379;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1oIs4hW1Px3lZ0xUVZ1XPcup+O4BGgrBN10BZiIxxqM=;
        b=SelnNgVbUF3QCfp9xwI7lGtTuWpmiQxbvzg+L7aDrxdZfmzQzk/iXMxmHgJCLJ77FD
         DpHgbohveEZ3yd70tGPPFlIXgsUP/IuEB5/dHcDtvkppzoBbwHPVhYXyGZT/MkPOkKAW
         05MxAcYcZljfCBhUi0D3sKwp288LlnJngLtFKe3QZxkZoRen9xJoPN3eMegRIdaab1Rz
         zDJe66V1nnZ0s3wp0nCPfHR2xsAKb/3q1VrVctlMm6l4I5qJb780GCHa6x2ljA486xRW
         SN/NdS8RLT3tD4RxgFkyjT5t5Oce0W9oIvTt+UnlDlsLTgxwmcRSVqTIG/dlJuUIKfQm
         B7gg==
X-Gm-Message-State: AC+VfDwA2+lJs/CZE8A5fTTXZcYHOEomDEiTcoXvcbnPFHdGVV+1O+Hy
        nUlIYF3cGp48ieNX+WSdb3NyOx/brrF/dPcBF3mHamYG83d/oye0pLPoasrVV9wse3YVIRZbuQF
        rZSp5MliFZDy0fZTC9UJ9
X-Received: by 2002:adf:ee8e:0:b0:2f5:930:39b1 with SMTP id b14-20020adfee8e000000b002f5093039b1mr3860433wro.38.1685702379774;
        Fri, 02 Jun 2023 03:39:39 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7OG85c64U2efVzPCUJ8A/7RK2BtGqWNJ8vfjLaFCk/P0e6jYLf17E10oKTfMRE/GAF6iGnSw==
X-Received: by 2002:adf:ee8e:0:b0:2f5:930:39b1 with SMTP id b14-20020adfee8e000000b002f5093039b1mr3860417wro.38.1685702379415;
        Fri, 02 Jun 2023 03:39:39 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id g7-20020a5d5407000000b0030903371ef9sm1310817wrv.22.2023.06.02.03.39.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jun 2023 03:39:39 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomba@kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Biju Das <biju.das.jz@bp.renesas.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] drm/todo: Add atomic modesetting references
In-Reply-To: <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
References: <cover.1685696114.git.geert+renesas@glider.be>
 <7cea42cd09540657875a210cd16421125497d690.1685696114.git.geert+renesas@glider.be>
Date:   Fri, 02 Jun 2023 12:39:37 +0200
Message-ID: <878rd2cfme.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

Thanks for your patch.

> The section about converting existing KMS drivers to atomic modesetting
> mentions the existence of a conversion guide, but does not reference it.
> While the guide is old and rusty, it still contains useful information,
> so add a link to it.  Also link to the LWN.net articles that give an
> overview about the atomic mode setting design.
>

This is a great idea and agree that would be very useful to have these.

> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  Documentation/gpu/todo.rst | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
> index 68bdafa0284f55f6..51eb67f5268c5ec1 100644
> --- a/Documentation/gpu/todo.rst
> +++ b/Documentation/gpu/todo.rst
> @@ -49,14 +49,19 @@ converted over. Modern compositors like Wayland or Surfaceflinger on Android
>  really want an atomic modeset interface, so this is all about the bright
>  future.
>  
> -There is a conversion guide for atomic and all you need is a GPU for a
> +There is a conversion guide for atomic[1] and all you need is a GPU for a
>  non-converted driver (again virtual HW drivers for KVM are still all
> -suitable).

Are any of the virtual drivers not yet ported to atomic? This sentence
seems to be outdated and maybe you could remove it on a following patch?

Reviewed-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

