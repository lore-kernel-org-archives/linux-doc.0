Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B1BCFC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 14 Dec 2021 19:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237331AbhLNTWJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Dec 2021 14:22:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45534 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229671AbhLNTWI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Dec 2021 14:22:08 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97DC4C061574
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 11:22:08 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id r10-20020a056830080a00b0055c8fd2cebdso22026051ots.6
        for <linux-doc@vger.kernel.org>; Tue, 14 Dec 2021 11:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9yLYDwGx5cg1ntky6MqjaHTJ+/4qss8QGpdcFwkthKk=;
        b=OyoK+02PlCZX6XlJjNmNZqCTRxarLsNJBXiyftLt5nBAr1pw4dXDJMdhgIELyqvRzX
         DWvsMC8PBdSp6+84tPYRWeacv+DZjtKIByr4ZRdJuWpQqu3GOVHkWUUkuTNq5eifq6uT
         cSo5As3kNwMgY6s9gjbcUk++0te2sDT4UpQn8y+YqvRmzfOS9xiGjJJ/+AmON7jBQre1
         7y4048RBZqhoLN2MqU4YEYD3zOyr9Ah+6J1nzT50oEE86kZ+8MgiU4NY+Z0O8KgxxCgz
         ne5HPdsBAr3uF+J3UpWLPqQEYIciRegfJB1uSykmdbmcC+b8pluRaKgMi339y+poTBIP
         piNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9yLYDwGx5cg1ntky6MqjaHTJ+/4qss8QGpdcFwkthKk=;
        b=stcCdSCeLUKRj3eI/FCD/BkgYKmxJz77Wk32WQ0ou3jZgLRnmMC1jzjjJtZs74VvL+
         xT3THHLgKT63l1rD68cFYlcgT6JKbHLv3UrjvlXG4oAjcrR7dbwTj5tIVoepP+ExmFkF
         g3bx1kghiB8mh/MIqi+hMtObD8JhPdmCP1iQ6fIDU1cTuL7/rbR/sAFz0X4xi3FXdBlL
         WwhPdJrw3804XpP42Fi/VPbSCeQc4gY242nJYMAhXVsxFmucOvIf4kk11hai30UHo3gK
         RT0BYB7yA1euvGjAYe6vik461GqYBhhG6lc32DhtiXA9jd5CA/jdeZ04tDFdqcrBrCd1
         8cjw==
X-Gm-Message-State: AOAM533zLz7sMFEnLkwmg53fcAcBNTe2+9NQpKAoyMWWgUVnOGedSNui
        m27FDMUMcfaM4zwE7qqI1CZpyJ/vLjM6YYfkgis=
X-Google-Smtp-Source: ABdhPJy5U8ShA6A8T2UdYV4soDwnZEFxnsVVCvAPqLjBAiCU8aWLy2PA0B1Ma4odPJoR+NRUXKdi38oG13Ho0yJpWlI=
X-Received: by 2002:a9d:67c1:: with SMTP id c1mr5907475otn.299.1639509728008;
 Tue, 14 Dec 2021 11:22:08 -0800 (PST)
MIME-Version: 1.0
References: <20211213233030.6719-1-ydirson@free.fr>
In-Reply-To: <20211213233030.6719-1-ydirson@free.fr>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Tue, 14 Dec 2021 14:21:56 -0500
Message-ID: <CADnq5_Mn+WeLWNoe6FdN=4Ssbfi2v6o=XorQrzwxdda2Hgk7mg@mail.gmail.com>
Subject: Re: [PATCH v3 0/4] Enrich amdgpu docs from recent threads
To:     Yann Dirson <ydirson@free.fr>
Cc:     amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Applied.  Thanks!

Alex

On Mon, Dec 13, 2021 at 6:30 PM Yann Dirson <ydirson@free.fr> wrote:
>
> This series is basically bringing Alex' descriptions of the hardware and
> driver internals into the doc.
>
> Changes in v3:
> * camel case in titles (Rodrigo Siqueira)
> * link DCN description to DC doc (Rodrigo Siqueira)
> * links to email archive in commit messages (Rodrigo Siqueira)
> * acronym expansion in intro (Rodrigo Siqueira)
> * new commits for kerneldoc content fixes
>
> Changes in v2:
> * fix typos (Harry Wentland)
> * get rid of double headings
>
> Yann Dirson (4):
>   Documentation/gpu: include description of AMDGPU hardware structure
>   Documentation/gpu: include description of some of the GC
>     microcontrollers
>   amdgpu: fix some kernel-doc markup
>   amdgpu: fix some comment typos
>
>  Documentation/gpu/amdgpu/display/index.rst    |   2 +
>  Documentation/gpu/amdgpu/driver-core.rst      | 117 ++++++++++++++++++
>  drivers/gpu/drm/amd/amdgpu/amdgpu_device.c    |   6 +-
>  drivers/gpu/drm/amd/amdgpu/amdgpu_vm.c        |   2 +-
>  drivers/gpu/drm/amd/amdgpu/soc15.c            |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c |   2 +-
>  .../gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h |   4 +-
>  include/uapi/drm/amdgpu_drm.h                 |   2 +-
>  8 files changed, 128 insertions(+), 9 deletions(-)
>
> --
> 2.31.1
>
