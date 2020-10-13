Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9C64C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 13:19:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4014122DA9
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 13:19:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QhM8Yr0/"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728373AbgJMNT0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 09:19:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726648AbgJMNT0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Oct 2020 09:19:26 -0400
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com [IPv6:2a00:1450:4864:20::341])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A1D5C0613D0;
        Tue, 13 Oct 2020 06:19:26 -0700 (PDT)
Received: by mail-wm1-x341.google.com with SMTP id 13so20892066wmf.0;
        Tue, 13 Oct 2020 06:19:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8B+0WtYgA7UeCgdHhqNVOekRpYFEf1vC2587zk4d0MY=;
        b=QhM8Yr0/b9eLK5UJ81fkSr6KAy4hIe4AyujsbxECrW/9PeIenMIlOTh8nc5Uep6G6I
         E3x+Ql1+ZC1Id4hrgbehvsp3X7oYj+A50ES2iRD0rXpT0z1FGnEFAmHlUBcmLwx7MADt
         a101pFNdTjs0rYm7u06xVPJUD53huilrrJgQ2GoR06trQfvJ/cpcY3cZ1u/VWXDWpHcf
         ZLbomTb6xPigrsuCE9sTTYI17skaj3wAAduFVc/MsejnbM5QCahGHao0NkzC/sDVPMcp
         nFMMQxh95HTL/9gXvB4Ya3nIUvFFTt25AAjKX+3fmTGkxdOVeZooHzElp3upWmOavb2z
         Pf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8B+0WtYgA7UeCgdHhqNVOekRpYFEf1vC2587zk4d0MY=;
        b=BT7f4ZnCTPKrwrf6fqA7XGiVmnxSAuBxXoRCxrqYLV8pvDgpZ8F/9Mz6cvUP9fAuhf
         RhewFUeBIZCAXAU0NL0U8BAuucFH1kxKqu6kkMugq+lW+heE6kg479+uP8WJ+Gha8XMb
         WedCLwiI1QAsX2/y2kCEHuokhPYgSXbgDo5e2uquveL0sMiHHUV/x+RasYRpaXO8awpg
         e5dkSgaoj0zCagNRSLOLZtuJftJnj1RfKvWE+gEPfOoKeTB+gvsRrlWI5z3Eox+PqSbc
         GrVitHgaNod+zTG5S8uHoMvq1O/HxVYInQAH6TqdesApR697JPQejOSPnI347IU9nV+J
         4EPw==
X-Gm-Message-State: AOAM53259xI+HG5ckwflvVYzRBq3ilUIIHV8+6lkgDWjiRAT4Dun2hiu
        VafgLuwerAno8O+owbUSlhqTSVzoquy7EFGi8fk=
X-Google-Smtp-Source: ABdhPJxxSyht6Y7/wEQ5OVHDCml+oVdMZYIvBSFPYZ52jZrh7e8w8C8sY6IoaVu8tniA4jmPFgzc40uxHg3h7Wenwn8=
X-Received: by 2002:a1c:49c2:: with SMTP id w185mr15334045wma.70.1602595164758;
 Tue, 13 Oct 2020 06:19:24 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1602589096.git.mchehab+huawei@kernel.org> <6e511c1938e4b5e312474ea50bdde964770c1e44.1602589096.git.mchehab+huawei@kernel.org>
In-Reply-To: <6e511c1938e4b5e312474ea50bdde964770c1e44.1602589096.git.mchehab+huawei@kernel.org>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 13 Oct 2020 09:19:13 -0400
Message-ID: <CADnq5_ND_6uRzxkeXZBo-QpGvB+azZMxPB=6vhF6xGvkOptZaw@mail.gmail.com>
Subject: Re: [PATCH v6 65/80] docs: amdgpu: fix a warning when building the documentation
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
        LKML <linux-kernel@vger.kernel.org>,
        David Airlie <airlied@linux.ie>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied.  Thanks!

Alex

On Tue, Oct 13, 2020 at 7:54 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> As reported by Sphinx:
>
>         Documentation/gpu/amdgpu.rst:200: WARNING: Inline emphasis start-string without end-string.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>  Documentation/gpu/amdgpu.rst | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/gpu/amdgpu.rst b/Documentation/gpu/amdgpu.rst
> index 17112352f605..4ed8ecf1cd86 100644
> --- a/Documentation/gpu/amdgpu.rst
> +++ b/Documentation/gpu/amdgpu.rst
> @@ -197,8 +197,8 @@ pp_power_profile_mode
>  .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>     :doc: pp_power_profile_mode
>
> -*_busy_percent
> -~~~~~~~~~~~~~~
> +\*_busy_percent
> +~~~~~~~~~~~~~~~
>
>  .. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_pm.c
>     :doc: gpu_busy_percent
> --
> 2.26.2
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel
