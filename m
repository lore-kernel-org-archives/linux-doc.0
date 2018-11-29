Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 099947D089
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Nov 2018 16:14:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728255AbeK3DUo (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Nov 2018 22:20:44 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:54384 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728136AbeK3DUn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Nov 2018 22:20:43 -0500
Received: by mail-wm1-f66.google.com with SMTP id z18so2867045wmc.4
        for <linux-doc@vger.kernel.org>; Thu, 29 Nov 2018 08:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=reply-to:subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-transfer-encoding:content-language;
        bh=ubUP/bj9lEnEOLmbRB8ce0NXKP0oKmwPhvMEzQpfz7g=;
        b=ncRIeaf95Rhv8nnvMq356Tl8j+nLfIOwXDSVKLTvjXJdghlJow1wPJtOrIlFE+Yhg7
         tToFGlXRr3tpH2LVH7jaFoqcUMgjBQcwjNeVFcMXNoVxZSDdlu2lmfyPR/CcMYpJyvIZ
         gbRCJovU1I/5e9CEJVGAkTw1nybZd4ZL3BFz064cdg39GPFkNbQ76LtA8MbqsjLryXVp
         zXqr+hHSp7+Xk+gK5A5UaDmCu1nZFTSBT5jq4s6b++6e5vMcjVe6L9t4yij7Hfw+D6Bf
         NSDhpcIiYuw5GV79eGv0x1XBqnJcgZ+v6q0kwvDGr/qRGaVUcH2VaGfiqihAkRhR9IJL
         DLRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:reply-to:subject:to:cc:references:from
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-transfer-encoding:content-language;
        bh=ubUP/bj9lEnEOLmbRB8ce0NXKP0oKmwPhvMEzQpfz7g=;
        b=o95m+hrLyTbgWfivQqeN9vchGPumnsruJrlTb7n41zPAFDZh+rVVTQ0jKL05D6Pc+M
         5J19SLcf+cY/slBP6kYOiuDrOlPoXlbLSQmG5wydzRLJfNiZUxHCktJPyzs69wbMOeu1
         iIydj7jSnIt0hw1SvLj3C6CjbaBEnhjc7pVPKnZLPIJufS5LAOPiJGJIwPZp4PXkBWZj
         hZYPSYCuGu7Wa2oHOb0pHLBpIxFLHQETAV1vI06D0prPcrhIgrGIvJfA6z77nQlb0rAi
         yP2Kg3vdEmQVAWsubs9oEN8nBKn3ppwTPLO9/VNIZy14tPN5Sl9tTnblG+v1gFXiO+QM
         /6RQ==
X-Gm-Message-State: AA+aEWaQxxhMiYvkY/dnoh1OTsZuOncwMHE1NwhPp/WNq1QCvveD2t88
        t+vnB6aQkf8ne9IyQRKbkJU=
X-Google-Smtp-Source: AFSGD/Wk2ko0kcndPKzh0MoJ4omXKKehnDsnK95X2YEfbuzlmpr/t6fINrFuPBcwyCAGBXBkzb6MFQ==
X-Received: by 2002:a1c:cc19:: with SMTP id h25mr2301570wmb.80.1543508089641;
        Thu, 29 Nov 2018 08:14:49 -0800 (PST)
Received: from ?IPv6:2a02:908:125b:9a00:a142:2be6:b7be:5a3a? ([2a02:908:125b:9a00:a142:2be6:b7be:5a3a])
        by smtp.gmail.com with ESMTPSA id k73sm2526725wmd.36.2018.11.29.08.14.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Nov 2018 08:14:49 -0800 (PST)
Reply-To: christian.koenig@amd.com
Subject: Re: [PATCH] Documentation: drm: Remove dangling pointer from
 drm-mm.rst
To:     Sean Paul <sean@poorly.run>,
        =?UTF-8?Q?Christian_K=c3=b6nig?= <Christian.Koenig@amd.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Dave Airlie <airlied@linux.ie>, linux-doc@vger.kernel.org,
        dri-devel <dri-devel@lists.freedesktop.org>,
        Alex Deucher <Alexander.Deucher@amd.com>,
        Huang Rui <Ray.Huang@amd.com>,
        Sean Paul <seanpaul@chromium.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Junwei Zhang <Jerry.Zhang@amd.com>
References: <20181129155522.33749-1-sean@poorly.run>
 <1e62c728-3bee-fa29-82fd-449fcb77bab7@amd.com>
 <CAMavQKLVipXjNEycU9SXNEM3imdHco2nMh0sLxVdnO9zqHdd9Q@mail.gmail.com>
From:   =?UTF-8?Q?Christian_K=c3=b6nig?= <ckoenig.leichtzumerken@gmail.com>
Message-ID: <5876d520-021d-47ad-b9d1-0938d154ca18@gmail.com>
Date:   Thu, 29 Nov 2018 17:14:47 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <CAMavQKLVipXjNEycU9SXNEM3imdHco2nMh0sLxVdnO9zqHdd9Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Am 29.11.18 um 17:11 schrieb Sean Paul:
> On Thu, Nov 29, 2018 at 10:58 AM Koenig, Christian
> <Christian.Koenig@amd.com> wrote:
>> Am 29.11.18 um 16:55 schrieb Sean Paul:
>>> From: Sean Paul <seanpaul@chromium.org>
>>>
>>> Fixes htmldocs build error:
>>> Error: Cannot open file ../drivers/gpu/drm/drm_global.c
>>>
>>> Fixes: 2bb42410b1bd ("drm: Remove drm_global.{c,h} v2")
>>> Cc: Thomas Zimmermann <tzimmermann@suse.de>
>>> Cc: Christian König <christian.koenig@amd.com>
>>> Cc: Junwei Zhang <Jerry.Zhang@amd.com>
>>> Cc: Alex Deucher <alexander.deucher@amd.com>
>>> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>> Cc: Maxime Ripard <maxime.ripard@bootlin.com>
>>> Cc: Sean Paul <sean@poorly.run>
>>> Cc: David Airlie <airlied@linux.ie>
>>> Cc: Christian Koenig <christian.koenig@amd.com>
>>> Cc: Huang Rui <ray.huang@amd.com>
>>> Cc: dri-devel@lists.freedesktop.org
>>> Signed-off-by: Sean Paul <seanpaul@chromium.org>
>> Reviewed-by: Christian König <christian.koenig@amd.com>
>>
> Thanks for the review. Perhaps the best course of action for this
> patch is to have Dave pick it directly and then we can backmerge it
> into amdgpu/drm-misc-next from there? I could also spin a topic branch
> that we could all merge.
>
> Thoughts?

My preference is that I pick it up and push it to Dave through Alex 
fixes push.

But just because the patch which broke this came the same way as well.

Either way works for me,
Christian.

>
> Sean
>
>>> ---
>>>    Documentation/gpu/drm-mm.rst | 3 ---
>>>    1 file changed, 3 deletions(-)
>>>
>>> diff --git a/Documentation/gpu/drm-mm.rst b/Documentation/gpu/drm-mm.rst
>>> index d0f3c6b032009..54a696d961a7c 100644
>>> --- a/Documentation/gpu/drm-mm.rst
>>> +++ b/Documentation/gpu/drm-mm.rst
>>> @@ -79,9 +79,6 @@ count for the TTM, which will call your initialization function.
>>>
>>>    See the radeon_ttm.c file for an example of usage.
>>>
>>> -.. kernel-doc:: drivers/gpu/drm/drm_global.c
>>> -   :export:
>>> -
>>>
>>>    The Graphics Execution Manager (GEM)
>>>    ====================================
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

