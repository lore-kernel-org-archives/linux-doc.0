Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D79AFC41513
	for <linux-doc@archiver.kernel.org>; Sat, 29 Jul 2023 19:19:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229502AbjG2TT0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 29 Jul 2023 15:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229468AbjG2TTZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 29 Jul 2023 15:19:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67488133
        for <linux-doc@vger.kernel.org>; Sat, 29 Jul 2023 12:18:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1690658318;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ojrCzz5wYGS/I4ma6JQZlj8trsaVvDQ8Es+pMaAigF0=;
        b=VqB1P1opOLOpa2WgfheM83iVQ6HyB8F11AndKN+t8iGX06b9NOjPlgTCC54Ory9xjqu2K6
        CJookr7fS0H/AsG4FL45QHjpI3EYAGy6IW5p/V+/yIRYqS9FXJfaxjVw/nnQ+rraNjdOVo
        0hUUin7N9ghyo1namjBX+O9DttCkD4E=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-623-OOzeX5B2OZ69PYut_RryNA-1; Sat, 29 Jul 2023 15:18:35 -0400
X-MC-Unique: OOzeX5B2OZ69PYut_RryNA-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-314275b653eso1574633f8f.1
        for <linux-doc@vger.kernel.org>; Sat, 29 Jul 2023 12:18:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690658314; x=1691263114;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ojrCzz5wYGS/I4ma6JQZlj8trsaVvDQ8Es+pMaAigF0=;
        b=M1ZS+nr1falaMTkQMfCToSY0kGzyWlW0IalBtzO82w2UWc2+apng2hmK6r8lvL3b0H
         81OI86lbmpVPJ9GYDq9uGeESCCiFEM3Ifo8wz5c7xBK80jHeSxYfSmsZ0KCIQuIKRSuT
         YDTzxFhgp21jBsfdUw3YBhSvmG+3+F/9APhLtRgxDmiy+JSR3zwySWnLL8Cne9cDbxSM
         7xCI4QLcvQ9TxKnF6TpYg19aoz353fe5SoRIbITNx6aVqgegeAAp8ZaXNr6GRGgCez8P
         nf/3Dl02ZFIttHs+PxWIPsdTfQqODWmFu6wRk2vDpgo896dfoX2OmEjOE4pUfP4EFHlj
         1GWQ==
X-Gm-Message-State: ABy/qLYZbiqQfI1/vg9Ro5cyQwZezah1m+sZOOb+9R4/F36af/gXaHVR
        kHED3WctDC/KDCVpTrO88pQvBEMHgDr/psstorPsrZqJ+PhzxWviCfr3hnka6yiD/Z+c5vYSype
        Sp9t/BHHDRhK+nldqMCVv
X-Received: by 2002:adf:e743:0:b0:317:6cc7:6b21 with SMTP id c3-20020adfe743000000b003176cc76b21mr3846705wrn.69.1690658314141;
        Sat, 29 Jul 2023 12:18:34 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGMLsHO2EpY96ESRcSjZaJGCQAF4FMTewpjygCkWri2whqJzjkk8u4900Qu5vniN18Ue1k5Gg==
X-Received: by 2002:adf:e743:0:b0:317:6cc7:6b21 with SMTP id c3-20020adfe743000000b003176cc76b21mr3846696wrn.69.1690658313885;
        Sat, 29 Jul 2023 12:18:33 -0700 (PDT)
Received: from localhost (205.pool92-176-231.dynamic.orange.es. [92.176.231.205])
        by smtp.gmail.com with ESMTPSA id y18-20020adff152000000b0031779a6b451sm8128412wro.83.2023.07.29.12.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 29 Jul 2023 12:18:33 -0700 (PDT)
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
Subject: Re: [PATCH v3 2/4] drm/todo: Convert list of fbconv links to footnotes
In-Reply-To: <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
References: <cover.1689779916.git.geert+renesas@glider.be>
 <0761f98d3b6f8df9eea977eae063e35b450fda9e.1689779916.git.geert+renesas@glider.be>
Date:   Sat, 29 Jul 2023 21:18:32 +0200
Message-ID: <87y1iywmpj.fsf@minerva.mail-host-address-is-not-set>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Geert Uytterhoeven <geert+renesas@glider.be> writes:

Hello Geert,

> Convert the references to fbconv links to footnotes, so they can be
> navigated.
>
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v3:
>   - Make main text read correctly when ignoring the footnotes,
>
> v2:
>   - New.
> ---

Acked-by: Javier Martinez Canillas <javierm@redhat.com>

-- 
Best regards,

Javier Martinez Canillas
Core Platforms
Red Hat

