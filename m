Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B6C6C001DE
	for <linux-doc@archiver.kernel.org>; Fri, 18 Aug 2023 05:27:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356562AbjHRF1H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Aug 2023 01:27:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59286 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1357830AbjHRF0b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Aug 2023 01:26:31 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D300F3AB6
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 22:26:29 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-1bf3a2f44ffso1953865ad.1
        for <linux-doc@vger.kernel.org>; Thu, 17 Aug 2023 22:26:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1692336389; x=1692941189;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=rk4LUnZhgDX0fAzmHzqei0ex7/pVRshtevMGzPqY4to=;
        b=UtzI73kYLFLtzKgHqDkl/JMuJGgdA2kKxVHo2p5bGwtBas2l80jjTbmLCg5AEAqSFs
         7pcakZl6L+WzC3/LRyPRZlqZpyXLyiecqwf0A+9dDpJBB80p5vDi0dkZNCMn+NNlbxHK
         rOan65qNvcqmRuUWYsW+2mr0S8waWUsY6ZeKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692336389; x=1692941189;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rk4LUnZhgDX0fAzmHzqei0ex7/pVRshtevMGzPqY4to=;
        b=Ms570F+SM2CBtxfmzlaOnPgeF/+xvnzMF9XaHEbAvgvVDpSOgzQMkaZipvJChAXRlF
         +AOrfh7bwFCQEpTDXMl3w+/20BcGiKtKJ7B4KO9TeKwNV1YY3/q+NuZ8bmGYVi+Jouc5
         nffAwIFj7b2Fqk8icLAj33x1O1a2dLnNfhOVV699QEbwYosogC1Ys13nYWYZzSqpkNwI
         K0c//cAuXTb+hwpAtFFxS6N8U/LTVssUltUqBrtuQ6vk9Go6VWpE+IADH/VXUzQplG8A
         D5Os4HfCBm3ddQj4n/2gdTOm8qdHc4plxckiJzi+zQsJ31CjQq43thiJIGkQ5Prk0VKM
         64oA==
X-Gm-Message-State: AOJu0YynKN2BFxOqr6lmNUVuV3qCSVuRonU3wo8o4CWmFXH+AroW+Dww
        XQLVxiVnrhoCuTz/mcm1PSgUeg==
X-Google-Smtp-Source: AGHT+IFgDSpPPvvRGEyBogq5IuenXl71J1nG/CyBKgfUmysleFmyTdi6pHlkTot9nJLekZ6n6DF4Iw==
X-Received: by 2002:a17:902:ead5:b0:1bd:ec9e:59fe with SMTP id p21-20020a170902ead500b001bdec9e59femr1585669pld.68.1692336389311;
        Thu, 17 Aug 2023 22:26:29 -0700 (PDT)
Received: from ?IPV6:2401:fa00:8f:203:4e9f:532f:e004:aaa1? ([2401:fa00:8f:203:4e9f:532f:e004:aaa1])
        by smtp.gmail.com with ESMTPSA id bi9-20020a170902bf0900b001bd99fd1114sm708552plb.288.2023.08.17.22.26.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 17 Aug 2023 22:26:29 -0700 (PDT)
Message-ID: <62ca5d60-1b4b-d102-1a5e-50288dae4c37@chromium.org>
Date:   Fri, 18 Aug 2023 14:26:25 +0900
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.1
Subject: Re: [PATCH v2 2/6] drm/vkms: Support multiple DRM objects (crtcs,
 etc.) per VKMS device
From:   Brandon Ross Pollack <brpol@chromium.org>
To:     marius.vlad@collabora.com
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        hamohammed.sa@gmail.com, jshargo@chromium.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        mairacanal@riseup.net, melissa.srw@gmail.com, mripard@kernel.org,
        rodrigosiqueiramelo@gmail.com, tzimmermann@suse.de
References: <ZNthoImm48DYrBJx@xpredator>
 <20230818033605.2910699-1-brpol@chromium.org>
Content-Language: en-US
In-Reply-To: <20230818033605.2910699-1-brpol@chromium.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Silly addition but I need to apologize for mispelling somone's name in 
my reply.

Maira, please accept my sincere apology.

On 8/18/23 12:36, Brandon Pollack wrote:
> Thanks for taking the time, everyone! Sorry it took so long, we had some
> internal shuffling etc going on and I was building out what we needed these
> chagnes for in the first place, this will be the first of a few replies
> followed by a new version of the series to be sent out.
>
> First up is a respons to Maria, Marius to follow.
>
> ---
>
> Maria,
>
>> -	if (vkms->output.composer_workq)
>> -		destroy_workqueue(vkms->output.composer_workq);
>> +	for (int i = 0; i < vkms->output.num_crtcs; i++)
>> +		destroy_workqueue(vkms->output.crtcs[i].composer_workq);
> I don't believe there is any need for a null check.  If you look in the
> crtc_init, it is zero'd before returning any errors and that is the only place
> it is set.  I don't believe that release can be called by an interrupt/async
> (and if it did it would need a mutex/lock anyway).
>
>>    static const struct drm_plane_funcs vkms_plane_funcs = {
>> -	.update_plane		= drm_atomic_helper_update_plane,
>> -	.disable_plane		= drm_atomic_helper_disable_plane,
>> -	.reset			= vkms_plane_reset,
> Yeah these do seem weirdly formatted on devices that don't treat tabs well.
> The default formatter on my editor has a few suggestions for this file, but
> they are all optional.  I'll send an extra patch that formats stuff and see
> what people think, but ill make it seperate after all this is done.
> For now I reverted this.
>
>>> -	if (IS_ERR(plane))
>>> -		return plane;
>>> +	if (output->num_planes >= VKMS_MAX_PLANES)
>>> +		return ERR_PTR(-ENOMEM);
>>> +
>>> +	plane = &output->planes[output->num_planes++];
>>> +	ret = drm_universal_plane_init(dev, &plane->base, 0, &vkms_plane_funcs,
>>> +				       vkms_formats, ARRAY_SIZE(vkms_formats),
>>> +				       NULL, type, NULL);
>> Wouldn't be possible to use drmm_universal_plane_alloc?
> Maybe, but the *_init pattern allows these things to be inline in the struct as
> they are now, and consistent with the other drm kernel objects in the
> vkms_output struct.  There are also a few other places we could use drmm,
> surely, but to limit the scope/risk why don't we do that as a followup?
>
> ---
>
> Marius,
>
> Yeah those values could safely be completely removed.  Good catch :)
