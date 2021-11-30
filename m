Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9608BC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 30 Nov 2021 10:09:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240681AbhK3KNF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Nov 2021 05:13:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235778AbhK3KNF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Nov 2021 05:13:05 -0500
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75996C061574
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 02:09:46 -0800 (PST)
Received: by mail-wr1-x429.google.com with SMTP id d24so43239041wra.0
        for <linux-doc@vger.kernel.org>; Tue, 30 Nov 2021 02:09:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ITFiSZ4BhHXas+EIceF8qBLSIBLMhZ12PvMJFVnP/ww=;
        b=KLr6GPITzampDZ2eyFMi9XdSsDnajFFBytWZy0ui8xT0NoTLgbUJivOUMAmAZPR7iO
         AIkvyq/ESA9VST6LFH4y1D+n1CTRcQfaFOAv4Px15Fi/G7gukdFUkcZIw0mK8KKQcRDP
         jTik919e4bNu6NVnxEve8ShUvJu1iNvFIHob2g5UXKC2noNysswHgUiR5MabL6jgprdq
         gPxDHcL7ADbL5u4t96h4AThskdjLvJxrEI/c+rKh9pzpEJRhwUf96aA0LGpoRjSvV6I7
         BXgfnQHwX4LtdzTSw400nlO4XmHMIXySBTRu5qMDGWi613BnMPdE+iB3nCFu+/hSkuNL
         df+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=ITFiSZ4BhHXas+EIceF8qBLSIBLMhZ12PvMJFVnP/ww=;
        b=r8wZ34ejNL9cE/b8vTD5Qgu4ejn67qEdvsO3EcXvkS3o1f5oDfHSgFWE3LuUpNzqLV
         CS6RkjTqE4lQacSST+FcE/5HvKItMUmLHBFFERwY5l/sPmvSx5B8YZ7HPgPqt7sW5t5Y
         QelVH+PL4JsT9vHPt6FE99odM0neq0Qz0tYRF0NgczWjZKLErxfB4spRhtqOy1YZyovq
         ral4oKcq1f6TF1Yzf6fJRqucKp4l8bvgkxGDFDAi8Pb8qLupWgVhXm8ANY+QTVFuRbM0
         Wr95Iu8t0/vVaYTl1u8uqer/A86Za0ATCaWVR6Gr6K0K+DfJCNOI0jLIrKlib+Th4zHd
         gWQg==
X-Gm-Message-State: AOAM531Lpc7JqH4pM2m0Dcj2p4KlAx+o2Och/x5fwTCvewIiKnShyowN
        Z7+8muzkISj6Ir+XGvS5il4=
X-Google-Smtp-Source: ABdhPJygGh6sjZwL1L17sv4OcCYTg7SUS3HjCnmZZceWcGMOiPpsmozq601UeIAVTQfaulnIhiclqg==
X-Received: by 2002:a5d:4b41:: with SMTP id w1mr39826713wrs.537.1638266985159;
        Tue, 30 Nov 2021 02:09:45 -0800 (PST)
Received: from ?IPv6:2a02:908:1252:fb60:fa20:e17b:e063:b6d3? ([2a02:908:1252:fb60:fa20:e17b:e063:b6d3])
        by smtp.gmail.com with ESMTPSA id n32sm2310101wms.1.2021.11.30.02.09.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 Nov 2021 02:09:44 -0800 (PST)
Subject: Re: [PATCH 6/6] Documentation/gpu: Add DC glossary
To:     ydirson@free.fr, Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc:     Harry Wentland <Harry.Wentland@amd.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Mark Yacoub <markyacoub@chromium.org>,
        =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
        Roman Li <roman.li@amd.com>,
        amd-gfx list <amd-gfx@lists.freedesktop.org>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
        =?UTF-8?B?TWFyZWsgT2zFocOhaw==?= <marek.olsak@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Pekka Paalanen <ppaalanen@gmail.com>,
        Aurabindo Pillai <aurabindo.pillai@amd.com>,
        nicholas choi <nicholas.choi@amd.com>,
        Maling list - DRI developers 
        <dri-devel@lists.freedesktop.org>, Simon Ser <contact@emersion.fr>,
        Alex Deucher <alexdeucher@gmail.com>,
        Sean Paul <seanpaul@chromium.org>,
        Qingqing Zhuo <qingqing.zhuo@amd.com>,
        Roman Gilg <subdiff@gmail.com>,
        Bhawanpreet Lakha <bhawanpreet.lakha@amd.com>,
        Nicholas Kazlauskas <nicholas.kazlauskas@amd.com>
References: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <bc6eb6c0-92f8-2bf9-c735-a8d8c7a427bd@gmail.com>
Date:   Tue, 30 Nov 2021 11:09:43 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.14.0
MIME-Version: 1.0
In-Reply-To: <1254252919.1503545635.1638218918877.JavaMail.root@zimbra39-e7>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



Am 29.11.21 um 21:48 schrieb ydirson@free.fr:
> Hi Rodrigo,
>
> That will really be helpful!
>
> I know drawing the line is a difficult problem (and can even make things
> harder when searching), but maybe it would make sense to keep generic
> acronyms not specific to amdgpu in a separate list.  I bet a number of
> them would be useful in the scope of other drm drivers (e.g. CRTC, DCC,
> MST), and some are not restricted to the drm subsystem at all (e.g. FEC,
> LUT), but still have value as not necessarily easy to look up.
>
> Maybe "DC glossary" should just be "Glossary", since quite some entries
> help to read adm/amdgpu/ too.  Which brings me to the result of my recent
> searches as suggested entries:
>
>   KIQ (Kernel Interface Queue), MQD (memory queue descriptor), HQD (hardware
>   queue descriptor), EOP (still no clue :)

End Of Pipe/Pipeline :)

This means that calculations are done, all caches are flushed and all 
memory is coherent again.

Usually related to an interrupt send or fence value written.

Christian.

>
> Maybe some more specific ones just to be spelled out in clear where they
> are used ?  KCQ (compute queue?), KGQ (gfx queue?)
>
> More suggestions inlined.
>
> Best regards,

