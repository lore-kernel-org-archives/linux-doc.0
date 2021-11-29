Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55033C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 22:37:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234041AbhK2WlH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:41:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230478AbhK2WkZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Nov 2021 17:40:25 -0500
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com [IPv6:2607:f8b0:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2A971C093B5E
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 12:09:07 -0800 (PST)
Received: by mail-ot1-x32c.google.com with SMTP id u18-20020a9d7212000000b00560cb1dc10bso27093412otj.11
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 12:09:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=EuI2cChVvE6zgamPFlSyZnNuvIW/4yZ/lDHIRhEQpvE=;
        b=lKq1yMLaXpb2ZgEms17e/ODenZsGC7ET+B7PxdBu+CIZTFKQgmvfpnjbTeTg2VP7eB
         SbBH+AaT1OORBHNeOWzZRma1H3/EuvSR2blRXAzyFqHwdQs+esNdUl7sn9Hcd6UOwJe7
         sdeIMtf0bewp7wKcL4B0Ah0vaNuXgZpRnWDxWFShCnkrAd18c5iSTt0PQZ80EnDI0oXu
         +fWUh2GbzCAkCLauAbdaKdNqXSkXhNLFAMp3BlOokB1ynwrkbNMyo9+uY7YS5Serwgw9
         Z9OKrB7CiWOaW622m2HuS8c/lAhJgB4LblUYcdkQghWJyGAT8a4DY8Sp8ALDiPGsk0Rm
         074Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=EuI2cChVvE6zgamPFlSyZnNuvIW/4yZ/lDHIRhEQpvE=;
        b=Ac88LorSyY2QGIEakvzUP2L8HrfEtUi6xSsetEpN33/sDj8JjhnWu+nrSoNcVSa6mT
         aEshzV/XE3H4do7OnlVVvX/6WLmYxVbqn+FpdgFbv0bji8qC9DHQeOnSo0CmNtUkElTK
         SbaoGkbxK53Mk7ytn5dt63d3J+bfdMHvUoW2eoxEPtJe5Lhn+jIROJfqVckyCW6Ohm2j
         P/7DgjY5hwoxyCPwPzC3u87nuQnVToLxya5/JKuDA1FG68Kk+O4oT0l1/7HDAboLF6cU
         wPRc2hvaGDSm0Xf5Ix4bEOVKOOHNG1s0y9FK5yw7ozOAPQ9eChEFr2f8Ww+ZLNw28adx
         /6uQ==
X-Gm-Message-State: AOAM531Yrz9WGZDcaTdaheiUVFw6xrRUi+p/5JAClFn1bIfOgZEAWKa5
        JmP/eSVaeExqFPYt2ARnHK05LU3wEhp9xNJgrbQ=
X-Google-Smtp-Source: ABdhPJybJNhP30NO8iC6nFg8fWwvBXS8z2cGTZnjb3rWI/Au30aYxL5DQtZ8NHjFiqiTIB83WR98Y8ZUXEhwyiSq92g=
X-Received: by 2002:a9d:6855:: with SMTP id c21mr48268083oto.357.1638216546543;
 Mon, 29 Nov 2021 12:09:06 -0800 (PST)
MIME-Version: 1.0
References: <20211125153830.1352994-1-Rodrigo.Siqueira@amd.com> <20211125153830.1352994-7-Rodrigo.Siqueira@amd.com>
In-Reply-To: <20211125153830.1352994-7-Rodrigo.Siqueira@amd.com>
From:   Alex Deucher <alexdeucher@gmail.com>
Date:   Mon, 29 Nov 2021 15:08:55 -0500
Message-ID: <CADnq5_NVcHizoY_xRM4d09B2s9DzWwDhn=YrgJ-3COXNANzE3A@mail.gmail.com>
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
To:     Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Simon Ser <contact@emersion.fr>,
        =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel@daenzer.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
        Roman Gilg <subdiff@gmail.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>,
        Harry Wentland <Harry.Wentland@amd.com>,
        Mark Yacoub <markyacoub@chromium.org>,
        Sean Paul <seanpaul@chromium.org>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Roman Li <roman.li@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        nicholas.choi@amd.com,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>,
        Alex Deucher <alexander.deucher@amd.com>,
        Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 25, 2021 at 10:40 AM Rodrigo Siqueira
<Rodrigo.Siqueira@amd.com> wrote:
>
> In the DC driver, we have multiple acronyms that are not obvious most of
> the time. This commit introduces a DC glossary in order to make it
> easier to navigate through our driver.
>
> Signed-off-by: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
> ---
>  Documentation/gpu/amdgpu-dc/amdgpu-dc.rst   |   2 +-
>  Documentation/gpu/amdgpu-dc/dc-glossary.rst | 257 ++++++++++++++++++++
>  2 files changed, 258 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/gpu/amdgpu-dc/dc-glossary.rst
>
> diff --git a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> index 2e45e83d9a2a..15405c43786a 100644
> --- a/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> +++ b/Documentation/gpu/amdgpu-dc/amdgpu-dc.rst
> @@ -26,4 +26,4 @@ table of content:
>     amdgpu-dcn-overview.rst
>     amdgpu-dm.rst
>     amdgpu-dc-debug.rst
> -
> +   dc-glossary.rst
> diff --git a/Documentation/gpu/amdgpu-dc/dc-glossary.rst b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> new file mode 100644
> index 000000000000..48698fc1799f
> --- /dev/null
> +++ b/Documentation/gpu/amdgpu-dc/dc-glossary.rst
> @@ -0,0 +1,257 @@
> +===========
> +DC Glossary
> +===========
> +
> +.. glossary::
> +
> +    ABM
> +      Adaptive Backlight Modulation
> +
> +    APU
> +      Accelerated Processing Unit
> +
> +    ASIC
> +      Application-Specific Integrated Circuit
> +
> +    ASSR
> +      Alternate Scrambler Seed Reset
> +
> +    AZ
> +      Azalia (HD audio DMA engine)
> +
> +    BPC
> +      Bits Per Colour/Component
> +
> +    BPP
> +      Bits Per Pixel
> +
> +    Clocks
> +      * PCLK: Pixel Clock
> +      * SYMCLK: Symbol Clock
> +      * SOCCLK: GPU Engine Clock
> +      * DISPCLK: Display Clock
> +      * DPPCLK: DPP Clock
> +      * DCFCLK: Display Controller Fabric Clock
> +      * REFCLK: Real Time Reference Clock
> +      * PPLL: Pixel PLL
> +      * FCLK: Fabric Clock
> +      * MCLK: Memory Clock
> +      * CPLIB: Content Protection Library

CPLIB is not a clock.  It should be split out as its own item.

> +
> +    CRC
> +      Cyclic Redundancy Check
> +
> +    CRTC
> +      Cathode Ray Tube Controller - commonly called "Controller" - Generates
> +      raw stream of pixels, clocked at pixel clock
> +
> +    CVT
> +      Coordinated Video Timings
> +
> +    DAL
> +      Display Abstraction layer
> +
> +    DC (Software)
> +      Display Core
> +
> +    DC (Hardware)
> +      Display Controller
> +
> +    DCC
> +      Delta Colour Compression
> +
> +    DCE
> +      Display Controller Engine
> +
> +    DCHUB
> +      Display Controller Hub
> +
> +    ARB
> +      Arbiter
> +
> +    VTG
> +      Vertical Timing Generator
> +
> +    DCN
> +      Display Core Next
> +
> +    DCCG
> +      Display Clock Generator block
> +
> +    DDC
> +      Display Data Channel
> +
> +    DFS
> +      Digital Frequency Synthesizer
> +
> +    DIO
> +      Display IO
> +
> +    DPP
> +      Display Pipes and Planes
> +
> +    DSC
> +      Display Stream Compression (Reduce the amount of bits to represent pixel
> +      count while at the same pixel clock)
> +
> +    dGPU
> +      discrete GPU
> +
> +    DMIF
> +      Display Memory Interface
> +
> +    DML
> +      Display Mode Library
> +
> +    DMCU
> +      Display Micro Controller Unit
> +
> +    DMCUB
> +      Display Micro-Controller Unit, version B

Make Micro Controller vs. Micro-Controller consistent for these.

> +
> +    DPCD
> +      DisplayPort Configuration Data
> +
> +    DPM(S)
> +      Display Power Management (Signaling)
> +
> +    DRR
> +      Dynamic Refresh Rate
> +
> +    DWB
> +      Display writeback
> +
> +    ECP
> +      Enhanced Content Protection
> +
> +    FB
> +      Frame Buffer
> +
> +    FBC
> +      Frame Buffer Compression
> +
> +    FEC
> +      Forward Error Correction
> +
> +    FRL
> +      Fixed Rate Link
> +
> +    GCO
> +      Graphical Controller Object
> +
> +    GMC
> +      Graphic Memory Controller
> +
> +    GSL
> +      Global Swap Lock
> +
> +    iGPU
> +      integrated GPU
> +
> +    IH
> +      Interrupt Handler
> +
> +    ISR
> +      Interrupt Service Request
> +
> +    ISV
> +      Independent Software Vendor
> +
> +    KMD
> +      Kernel Mode Driver
> +
> +    LB
> +      Line Buffer
> +
> +    LFC
> +      Low Framerate Compensation
> +
> +    LTTPR
> +      Link Training Tunable Phy Repeater
> +
> +    LUT
> +      Lookup Table
> +
> +    MALL
> +      Memory Access at Last Level
> +
> +    MC
> +      Memory Controller
> +
> +    MPC
> +      Multiple pipes and plane combine
> +
> +    MPO
> +      Multi Plane Overlay
> +
> +    MST
> +      Multi Stream Transport
> +
> +    NBP State
> +      Northbridge Power State
> +
> +    NBIO
> +      North Bridge Input/Output
> +
> +    ODM
> +      Output Data Mapping
> +
> +    OPM
> +      Output Protection Manager
> +
> +    OPP
> +      Output Plane Processor
> +
> +    OPTC
> +      Output Pipe Timing Combiner
> +
> +    OTG
> +      Output Timing Generator
> +
> +    PCON
> +      Power Controller
> +
> +    PGFSM
> +      Power Gate Finite State Machine
> +
> +    PPLib
> +      PowerPlay Library

Maybe say that powerplay is the power management component.

> +
> +    PSR
> +      Panel Self Refresh
> +
> +    SCL
> +      Scaler
> +
> +    SDP
> +      Scalable Data Port
> +
> +    SMU
> +      System Management Unit
> +
> +    SLS
> +      Single Large Surface
> +
> +    SST
> +      Single Stream Transport
> +
> +    TMDS
> +      Transition-Minimized Differential Signaling
> +
> +    TMZ
> +      Trusted Memory Zone
> +
> +    TTU
> +      Time to Underflow
> +
> +    VRR
> +      Variable Refresh Rate
> +
> +    UVD
> +      Unified Video Decoder
> +
> +    VCE
> +      Video Compression Engine
> +
> +    VCN
> +      Video Codec Next
> --
> 2.25.1
>
