Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A61AC00528
	for <linux-doc@archiver.kernel.org>; Thu,  3 Aug 2023 21:45:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229496AbjHCVpH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 3 Aug 2023 17:45:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45458 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232023AbjHCVpG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 Aug 2023 17:45:06 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6A9473581;
        Thu,  3 Aug 2023 14:45:04 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-977e0fbd742so190341666b.2;
        Thu, 03 Aug 2023 14:45:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1691099103; x=1691703903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=HaYuvNho82/3JoIW9uMM5DA1w2BZFEEN1dpOn4dOCYA=;
        b=LEQB97gs15C5drjFPsRX6pNFUhJGKZn6eMeQrdeX6RjGV90W75skz29QmAIUZSpjnF
         DckI8rCCgo/OckbHuFmUUpTchAcesH1E7h7qwLhmb3jPDimwShZ/3NE6bgfeiylM1vFU
         QwxvjHZ/IrVcxv5yHZdsaaiQGdvyiF3F+lbX1cq9WZ9k6CxolLqPM3K6sCPrRgJqvnQF
         KcLZoZ6wHPTqFQhhDsSi8Ttynylva+zEdRH9ddjaXRJA0Ve7LilnOthVF2oF7o24u7XI
         MojGiZYOzIc5po41zrXFtG4AYp3ey6tlZKR16r2YGNg1G/SdiOL+XHfXYVXzJYumXSK+
         +y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691099103; x=1691703903;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HaYuvNho82/3JoIW9uMM5DA1w2BZFEEN1dpOn4dOCYA=;
        b=AnWE2n3GHE9zVBHNf6ryIyJB0qJWO7568XTvEHSbb+7eACMm2YIP308pj0xOQJ29/L
         DX8S/21O0kKcqCwU0feY9GlXk2pVxBRZzM6wXd3QxITEEj8hhnLKJcrTX8R2yfX2wEbo
         Yvh4ClXnbNxCMXcXAKL158mRPjrLkF/7VIdUjCTVG8VBjWapTvityOz8mGLLr7m5lkFE
         Y4Htn0j4mr4wvj16EkfAprsMs7Y1TuChWfYJZedC3pzdbYOQAjWT3yey/YGqclem6Ygy
         j7IplHc5UvlMh6fhGkQ5Gg/CQ1fXnodPFvE9j/dCO4MExBolBifAYSpQvJaWmc+clVaL
         bmGA==
X-Gm-Message-State: ABy/qLb5ptxuHslYv42Bwc37H6SmnzrgxSQZfrCWMSyR1yG5DCj+6JRq
        5UjayN6Goi8nNexihCxdVAASI8Quww8GUQ2CDFM=
X-Google-Smtp-Source: APBJJlHLoJ0PkDsLRAMOkZtbDvcgvvv90dTf90+lzyvmgHkOa6lr/3F5tgLbEzninHt+i8hbZRMAwZ9c1jrVaieJPAs=
X-Received: by 2002:a17:907:760d:b0:99b:f3d1:7735 with SMTP id
 jx13-20020a170907760d00b0099bf3d17735mr7746784ejc.29.1691099102603; Thu, 03
 Aug 2023 14:45:02 -0700 (PDT)
MIME-Version: 1.0
References: <20230803165238.8798-1-dakr@redhat.com>
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
From:   Dave Airlie <airlied@gmail.com>
Date:   Fri, 4 Aug 2023 07:44:50 +1000
Message-ID: <CAPM=9tyAD=ZGvgdNDrNpa7BOUnUv7T+6MuTbbtL4jy_ZzXRGkw@mail.gmail.com>
Subject: Re: [PATCH drm-misc-next v9 00/11] Nouveau VM_BIND UAPI & DRM GPUVA
 Manager (merged)
To:     Danilo Krummrich <dakr@redhat.com>
Cc:     daniel@ffwll.ch, tzimmermann@suse.de, mripard@kernel.org,
        corbet@lwn.net, christian.koenig@amd.com, bskeggs@redhat.com,
        Liam.Howlett@oracle.com, matthew.brost@intel.com,
        boris.brezillon@collabora.com, alexdeucher@gmail.com,
        ogabbay@kernel.org, bagasdotme@gmail.com, willy@infradead.org,
        jason@jlekstrand.net, donald.robson@imgtec.com,
        dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 4 Aug 2023 at 02:52, Danilo Krummrich <dakr@redhat.com> wrote:
>
> This patch series provides a new UAPI for the Nouveau driver in order to
> support Vulkan features, such as sparse bindings and sparse residency.
>

Now that Faith has reviewed the uAPI and userspace work, I think we
should try and steer this in.

I think the only thing I see is the SPDX + MIT header in some places,
I think we can drop the MIT bits where SPDX is there, and leave
copyright and authorship (if you like), personally I've been leaving
authorship up to git, as it saves trouble with people randomly
emailing you about things you wrote 10 years ago.

Otherwise for the series:
Reviewed-by: Dave Airlie <airlied@redhat.com>

Dave.
