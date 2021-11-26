Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59DE1C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 26 Nov 2021 15:48:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344954AbhKZPvu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Nov 2021 10:51:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346814AbhKZPtt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Nov 2021 10:49:49 -0500
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDB1C0613BF
        for <linux-doc@vger.kernel.org>; Fri, 26 Nov 2021 07:42:17 -0800 (PST)
Received: by mail-wr1-x436.google.com with SMTP id c4so19493721wrd.9
        for <linux-doc@vger.kernel.org>; Fri, 26 Nov 2021 07:42:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ffwll.ch; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=0jmBIGm9etaxaix5uxjkvGNUnF/oZVAs9V5NKTQZuhY=;
        b=JRAN0g+WT9VPSW+zbgt3eZ4Lyw5ZtHN7Dax+y+I31E7Hjj/STE+Mf62k0UALft/JcK
         GqGwoih0sbLbKadO/8/D8E94Qo4yFxGbW7V5wVf63vG9WTtghM1KNDVzTLZgBCY+uk0S
         jq8FA7QN1VY+uf/KF9g5q9YQWZ1NHAWph8+Jk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=0jmBIGm9etaxaix5uxjkvGNUnF/oZVAs9V5NKTQZuhY=;
        b=p+25KNv2sIBiaoTHsFzPZSFVAzUwWm5hV//+r1JaAd2dXITFecw0W38apQEIjSavTZ
         A0i1c3h8vElgv3X9YXmUivamxdA96UB1aQ27b0Kfm1mBebi1ZKbro0OMXh+LBS9uTAuS
         KaLKEIIL/VNaFAiFu6QMi387yVw7BtYDWIoSe62TUCZfcRa3vAZqw6MZ5gu1Bhtz73cz
         DLcydjaHf3DiwhzD5Fek++uQr2Cd1WyVkBvWLYWDblougVsA4RqbttP3wUNcdhDc3Okb
         u1GnisEZixLhOEoPhe3lYjxKA3Ko7UgRGPX8cHMBoWxtS4JCZwEU+qASGdVe4HcBSyQK
         FxQw==
X-Gm-Message-State: AOAM532hbRAjJUTcrw26wGVcxvN6XJ8MT1JLgYib/PJSDXU1TVOfhuTJ
        b7d2JdY3GxcnlDd+RojHU2l+Zw==
X-Google-Smtp-Source: ABdhPJxdyw+Ig3X4fU52AeiADISQ78Fn00fP9ouSNNLiuoc2si0wuvX8wEUprxeIojVbxc2HRn5ung==
X-Received: by 2002:adf:d1e2:: with SMTP id g2mr15328537wrd.362.1637941335819;
        Fri, 26 Nov 2021 07:42:15 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
        by smtp.gmail.com with ESMTPSA id b11sm11284666wmj.35.2021.11.26.07.42.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Nov 2021 07:42:15 -0800 (PST)
Date:   Fri, 26 Nov 2021 16:42:13 +0100
From:   Daniel Vetter <daniel@ffwll.ch>
To:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Simon Ser <contact@emersion.fr>,
        Michel =?iso-8859-1?Q?D=E4nzer?= <michel@daenzer.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Marek =?utf-8?B?T2zFocOhaw==?= <marek.olsak@amd.com>,
        Roman Gilg <subdiff@gmail.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Harry Wentland <Harry.Wentland@amd.com>,
        Mark Yacoub <markyacoub@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        linux-doc@vger.kernel.org, qingqing.zhuo@amd.com, roman.li@amd.com,
        amd-gfx@lists.freedesktop.org, aurabindo.pillai@amd.com,
        nicholas.choi@amd.com, dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        bhawanpreet.lakha@amd.com,
        Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: Re: [PATCH 1/6] Documentation/gpu: Reorganize DC documentation
Message-ID: <YaEAVV3Ka2lG/iOh@phenom.ffwll.local>
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com>
 <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211125153830.1352994-2-Rodrigo.Siqueira@amd.com>
X-Operating-System: Linux phenom 5.10.0-8-amd64 
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 25, 2021 at 10:38:25AM -0500, Rodrigo Siqueira wrote:
> Display core documentation is not well organized, and it is hard to find
> information due to the lack of sections. This commit reorganizes the
> documentation layout, and it is preparation work for future changes.
> 
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  Documentation/gpu/amdgpu-dc.rst               | 74 -------------------
>  .../gpu/amdgpu-dc/amdgpu-dc-debug.rst         |  4 +
>  Documentation/gpu/amdgpu-dc/amdgpu-dc.rst     | 29 ++++++++
>  Documentation/gpu/amdgpu-dc/amdgpu-dm.rst     | 42 +++++++++++
>  Documentation/gpu/drivers.rst                 |  2 +-
>  5 files changed, 76 insertions(+), 75 deletions(-)
>  delete mode 100644 Documentation/gpu/amdgpu-dc.rst
>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
>  create mode 100644 Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> 
> diff --git a/Documentation/gpu/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc.rst
> deleted file mode 100644
> index f7ff7e1309de..000000000000
> --- a/Documentation/gpu/amdgpu-dc.rst
> +++ /dev/null
> @@ -1,74 +0,0 @@
> -===================================
> -drm/amd/display - Display Core (DC)
> -===================================
> -
> -*placeholder - general description of supported platforms, what dc is, etc.*
> -
> -Because it is partially shared with other operating systems, the Display Core
> -Driver is divided in two pieces.
> -
> -1. **Display Core (DC)** contains the OS-agnostic components. Things like
> -   hardware programming and resource management are handled here.
> -2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> -   amdgpu base driver and DRM are implemented here.
> -
> -It doesn't help that the entire package is frequently referred to as DC. But
> -with the context in mind, it should be clear.
> -
> -When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
> -supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
> -Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> -
> -To determine if DC is loaded, search dmesg for the following entry:
> -
> -``Display Core initialized with <version number here>``
> -
> -AMDgpu Display Manager
> -======================
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: overview
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> -   :internal:
> -
> -Lifecycle
> ----------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: DM Lifecycle
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :functions: dm_hw_init dm_hw_fini
> -
> -Interrupts
> -----------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> -   :doc: overview
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> -   :internal:
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
> -
> -Atomic Implementation
> ----------------------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: atomic
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> -
> -Display Core
> -============
> -
> -**WIP**
> -
> -FreeSync Video
> ---------------
> -
> -.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> -   :doc: FreeSync Video
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> new file mode 100644
> index 000000000000..bbb8c3fc8eee
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc-debug.rst
> @@ -0,0 +1,4 @@
> +Display Core Debug tools
> +========================
> +
> +TODO
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> new file mode 100644
> index 000000000000..3685b3b1ad64
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst

While we bikeshed names, I think it'd would make sense to call this
overview.rst or intro.rst or similar, since it's meant to contain the
overall toctree for everything amdgpu related (maybe there will be more in
the future).
-Daniel

> @@ -0,0 +1,29 @@
> +===================================
> +drm/amd/display - Display Core (DC)
> +===================================
> +
> +*placeholder - general description of supported platforms, what dc is, etc.*
> +
> +Because it is partially shared with other operating systems, the Display Core
> +Driver is divided in two pieces.
> +
> +1. **Display Core (DC)** contains the OS-agnostic components. Things like
> +   hardware programming and resource management are handled here.
> +2. **Display Manager (DM)** contains the OS-dependent components. Hooks to the
> +   amdgpu base driver and DRM are implemented here.
> +
> +It doesn't help that the entire package is frequently referred to as DC. But
> +with the context in mind, it should be clear.
> +
> +When CONFIG_DRM_AMD_DC is enabled, DC will be initialized by default for
> +supported ASICs. To force disable, set `amdgpu.dc=0` on kernel command line.
> +Likewise, to force enable on unsupported ASICs, set `amdgpu.dc=1`.
> +
> +To determine if DC is loaded, search dmesg for the following entry:
> +
> +.. toctree::
> +
> +   amdgpu-dm.rst
> +   amdgpu-dc-debug.rst
> +
> +``Display Core initialized with <version number here>``
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> new file mode 100644
> index 000000000000..7ce31f89d9a0
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dm.rst
> @@ -0,0 +1,42 @@
> +======================
> +AMDgpu Display Manager
> +======================
> +
> +.. contents:: Table of Contents
> +    :depth: 3
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.h
> +   :internal:
> +
> +Lifecycle
> +=========
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :doc: DM Lifecycle
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :functions: dm_hw_init dm_hw_fini
> +
> +Interrupts
> +==========
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +   :doc: overview
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_irq.c
> +   :internal:
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :functions: register_hpd_handlers dm_crtc_high_irq dm_pflip_high_irq
> +
> +Atomic Implementation
> +=====================
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :doc: atomic
> +
> +.. kernel-doc:: drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
> +   :functions: amdgpu_dm_atomic_check amdgpu_dm_atomic_commit_tail
> diff --git a/Documentation/gpu/drivers.rst b/Documentation/gpu/drivers.rst
> index b4a0ed3ca961..dffe52d837cd 100644
> --- a/Documentation/gpu/drivers.rst
> +++ b/Documentation/gpu/drivers.rst
> @@ -5,7 +5,7 @@ GPU Driver Documentation
>  .. toctree::
>  
>     amdgpu
> -   amdgpu-dc
> +   amdgpu-dc/amdgpu-dc
>     i915
>     mcde
>     meson
> -- 
> 2.25.1
> 

-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
