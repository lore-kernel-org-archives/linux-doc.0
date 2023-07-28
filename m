Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD2D5C001DE
	for <linux-doc@archiver.kernel.org>; Fri, 28 Jul 2023 05:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232768AbjG1F0z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 Jul 2023 01:26:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60162 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232323AbjG1F0w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 28 Jul 2023 01:26:52 -0400
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com [IPv6:2607:f8b0:4864:20::f2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B658730FF
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 22:26:50 -0700 (PDT)
Received: by mail-qv1-xf2b.google.com with SMTP id 6a1803df08f44-63cf6b21035so11406876d6.1
        for <linux-doc@vger.kernel.org>; Thu, 27 Jul 2023 22:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fooishbar-org.20221208.gappssmtp.com; s=20221208; t=1690522010; x=1691126810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
        b=trpErXEJEPDZtUwJrLhT56jOvw/TASEnxJqiim24u87Ey219zXjICSpgcrZjP+hIvC
         YOisNcRp1EFcZBuqaw0v47KkdLVd0rFI+qxA+sXUlebSorcP7hGjMv3NkVKwxd1A+1fM
         +cPBg+wk6aUxXSizYt9OOW8K2HwaRZylnOeA2baYNkYAkyTSt3uSNK4bqSBTUKRlrYKH
         veSyepWn/C4JI0VyBkgwNf9ieJKzWg0hb3tCI/tmQqhFz8s1wdV5XOJi6PQyomubgQDL
         AUwaUxnOfbqg6WW2SXOJHHuKT2fULl3OjCF9EdNHMtPrrV+gZMyo2wDTP0lf87ec5+Bk
         zCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690522010; x=1691126810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cE7yzj/ShJctTo/cH8TMuQ/2VH0iD1G1+5KA9qirh/Y=;
        b=YlPHM6pF1IhUdRz6CFouGrrM42VJ08VYfCkqCHtijAvG/4qSgp9jMiclqcCtb2d+9o
         EBVk6/nZc5M4Cf6WmO8PrmB0zCggONL+kkaxacmJELkzrF82BgE8cZ/Gk57Jc0byX2vW
         P44s6gyzAvvZXwZQpHsaX2P3saYoI8govSnXwDf/KAmGycFgV9K0Zydcmj1BY3sNvAt5
         NMSUEFgUDstj28jICanRsQVJ64weKmS6E6d0BQKwiTXb2gt2Qm0Zz+7Qc7Un3scxdBSi
         3X7Erhq3tPTGW5YR8jSPT6PuXanKS0fXC0NhBiL4QmH7UMqZXmjdAd1304hiheMPI3d+
         7tRg==
X-Gm-Message-State: ABy/qLZQvVKLKo/e3U6ygjDgfe8wvrJg9HhDWOaxVjG+qWm2tw6qFJmM
        3LMSzYOvfuK082rz1DOuBiwNQt1gUbULylo59CrpxQ==
X-Google-Smtp-Source: APBJJlGaHKu68l916QbJnESfurRQ8GLdxdUM6h1VlhU7qK1FfkFxQTpsfGqhPqGZxqp+5PbL922CfRISxETZ4hSkBS0=
X-Received: by 2002:ad4:45a9:0:b0:63c:fc39:3c0d with SMTP id
 y9-20020ad445a9000000b0063cfc393c0dmr1353378qvu.62.1690522009771; Thu, 27 Jul
 2023 22:26:49 -0700 (PDT)
MIME-Version: 1.0
References: <20230720152737.102382-1-helen.koike@collabora.com>
 <CAF6AEGtXL5vjp3Uup6Mk19MiY8E26-tpyXVmxXYhMd3fiadykQ@mail.gmail.com> <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
In-Reply-To: <CAF6AEGsxLg4og1EkCdno6P8x31KK=rJfmerJa8uMeNR-n7RVRg@mail.gmail.com>
From:   Daniel Stone <daniel@fooishbar.org>
Date:   Fri, 28 Jul 2023 06:26:39 +0100
Message-ID: <CAPj87rPNyJ=mX1Um6yaN_jTV2gH5MhMxr3mnSb7=nB7NEOf2Ag@mail.gmail.com>
Subject: Re: [PATCH v10] drm: Add initial ci/ subdirectory
To:     Rob Clark <robdclark@gmail.com>
Cc:     Helen Koike <helen.koike@collabora.com>, emma@anholt.net,
        linux-doc@vger.kernel.org, david.heidelberg@collabora.com,
        dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        jbrunet@baylibre.com, robdclark@google.com, corbet@lwn.net,
        khilman@baylibre.com, sergi.blanch.torne@collabora.com,
        gustavo.padovan@collabora.com, linux-rockchip@lists.infradead.org,
        daniels@collabora.com, martin.blumenstingl@googlemail.com,
        mripard@kernel.org, anholt@google.com,
        linux-mediatek@lists.infradead.org, robclark@freedesktop.org,
        matthias.bgg@gmail.com, linux-arm-kernel@lists.infradead.org,
        angelogioacchino.delregno@collabora.com, neil.armstrong@linaro.org,
        guilherme.gallo@collabora.com, linux-kernel@vger.kernel.org,
        tzimmermann@suse.de, Dave Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 27 Jul 2023 at 22:47, Rob Clark <robdclark@gmail.com> wrote:
> > I did run into a bit of a chicken vs. egg problem with testing the "in
> > tree" version (compared to earlier versions which kept most of the yml
> > and scripts in a separate tree), is that it actually requires this
> > commit to exist in the branch you want to run CI on.  My earlier
> > workaround of pulling the drm/ci commit in via
> > ${branchname}-external-fixes no longer works.
>
> After unwinding some more gitlab repo settings that were for the
> previous out-of-tree yml setup, I have this working.
>
> Tested-by: Rob Clark <robdclark@gmail.com>
> Acked-by: Rob Clark <robdclark@gmail.com>

And it's also:
Acked-by: Daniel Stone <daniels@collabora.com>

It's been back and forth a few times by now and reviewed pretty
heavily by all the people who are across the CI details. I think the
next step is to answer all the workflow questions by actually getting
it into trees and using it in anger. There was some discussion about
whether this should come in from drm-misc, or the core DRM tree, or a
completely separate pull, but I'm not sure what the conclusion was ...
maintainers, thoughts?

Cheers,
Daniel
