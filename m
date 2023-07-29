Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2774C001E0
	for <linux-doc@archiver.kernel.org>; Sat, 29 Jul 2023 19:28:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229573AbjG2T2A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Jul 2023 15:28:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229519AbjG2T17 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jul 2023 15:27:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9829A1FC9
        for <linux-doc@vger.kernel.org>; Sat, 29 Jul 2023 12:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690658831;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=FF7YMNnJw4aG4W8Tlud2PZiGmCkxcL5PSVDcb1rl9Nw=;
        b=a6dApWpD4liipd4oLgQQc3bhGRQCYaTpdTbyd9H0YQA2dlvXWgVnLt6KVKe39v6x0w07sg
        gODu/1rx7hPnTSQB7K9fXJ3wU6QgVIONRxpGhgJLTR+nLfafW0aGcMGm/DwIx6JgpbuLae
        IDKH6J+8YLh2v1Mq5mY5tW6azBKAXcA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-272-DKP7Sdw2Ov-I-1j8hEA6AA-1; Sat, 29 Jul 2023 15:27:10 -0400
X-MC-Unique: DKP7Sdw2Ov-I-1j8hEA6AA-1
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-30e4943ca7fso1641398f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 29 Jul 2023 12:27:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690658829; x=1691263629;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FF7YMNnJw4aG4W8Tlud2PZiGmCkxcL5PSVDcb1rl9Nw=;
        b=GTeIhw6G3wMqK2Qlkn5Fs/4I52CGWDRDA8oeId9Np5UUmUamVKwYAiBYRhyrggsMI1
         6pi9ag6qC853TkdaMjCIg0zlW4dv61wZAZypK/YcmLZ5w9VjpktXPmZK8MxsSYeYoF7b
         FLnr+jXTK4v3PVUGnNi0vqD7WhDfLpQvotr6080NvnieikVvI0ubWSvJGgt/CQCYGwwH
         ZT8MjvZnqE4Q0+xU3Gt5POE9EQPQQNgu7ZXEgn94sf++4xkEqGlUhLlBSoB5pMntiPpQ
         9PuOoRIeRZO30jox5LVxR9AnPJ9VcSG6KanTkIROhG3lp3f0oayhNKFZCdd9dDjJfzb2
         IQUQ==
X-Gm-Message-State: ABy/qLYoO21JBs++eenGn7VAzsuur21yOMCiVZkP0Pdu3fIFsXtsP9lf
        RzlxYM0zONo6Im1+dIJF4YgXXq8T+wHpOVMSbslviLuOUAe7Vd2UTGfi2B7P8RDFHbea71Mv7Bf
        MLISX77jfKmfFFa4ipA2a
X-Received: by 2002:adf:ec06:0:b0:317:5948:1fe0 with SMTP id x6-20020adfec06000000b0031759481fe0mr4433305wrn.45.1690658829301;
        Sat, 29 Jul 2023 12:27:09 -0700 (PDT)
X-Google-Smtp-Source: APBJJlE4P4YiFhuI4ynzieVdKtm1Z/PFipBTRtmnhicR2Fu7fVK2AwNkVjGHHEaf2sFTV/ye9YNVSA==
X-Received: by 2002:adf:ec06:0:b0:317:5948:1fe0 with SMTP id x6-20020adfec06000000b0031759481fe0mr4433290wrn.45.1690658828986;
        Sat, 29 Jul 2023 12:27:08 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id x1-20020a5d54c1000000b003176f2d9ce5sm8194584wrv.71.2023.07.29.12.27.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 12:27:08 -0700 (PDT)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Jyri Sarha <jyri.sarha@iki.fi>,
        Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
        Ville =?utf-8?B?U3ly?= =?utf-8?B?asOkbMOk?= 
        <ville.syrjala@linux.intel.com>
Cc:     linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v3 0/4] drm: Atomic modesetting doc and comment
 improvements
In-Reply-To: <cover.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
Date:   Sat, 29 Jul 2023 21:27:08 +0200
Message-ID: <87sf96wmb7.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

>         Hi all,
>
> This patch series contains various improvements to the documentation and
> comments related to atomic modesetting.  Hopefully, it will ease the job
> of DRM novice who want to tackle the daunting task of converting a
> legacy DRM driver to atomic modesetting.
>
> Changes compared to v2[1]:
>   - Make main text read correctly when ignoring the footnotes,
>   - Add Reviewed-by.
>
> Changes compared to v1[2]:
>   - Add Reviewed-by,
>   - Drop double space after full stop,
>   - Use footnotes for references,
>   - Remore reference to unconverted virtual HW drivers,
>   - New patch [2/4],
>   - Drop "first part" in drivers/gpu/drm/drm_plane_helper.c.
>
> Thanks for applying!
>
> [1] https://lore.kernel.org/r/cover.1686318012.git.geert+renesas@glider.be
> [2] https://lore.kernel.org/r/cover.1685696114.git.geert+renesas@glider.be
>
> Geert Uytterhoeven (4):
>   drm/todo: Add atomic modesetting references
>   drm/todo: Convert list of fbconv links to footnotes
>   drm: Remove references to removed transitional helpers
>   drm: Fix references to drm_plane_helper_check_state()
>

Pushed to drm-misc (drm-misc-next). Thanks!

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

