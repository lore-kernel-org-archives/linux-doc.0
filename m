Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4443AC433F5
	for <linux-doc@archiver.kernel.org>; Mon, 25 Apr 2022 09:50:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230012AbiDYJxQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Apr 2022 05:53:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240487AbiDYJw3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Apr 2022 05:52:29 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id B6D363F33D
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 02:49:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1650880158;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=kKNwuusliPtIsiMP1NCPfSy6f0NI8bGmv/mZPssyDJg=;
        b=g6B/a6BRVF57tmm2hir8zrvHsWbyLwu1KKchwYdwykD0UAMuv7vTsQ66ZTho3OH4p73CNh
        ZDKyzjc35XcTHl92cVoSDTOR/bQN6U8clqze2DLLFKv6onuOCiTjUMfvQ1dz1JlFDv7GC1
        GPacwf6y/fdTolmrgdpanY08qIQ0tZ4=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-523-4Fi8vMDlOUa4y7xHqbKDSQ-1; Mon, 25 Apr 2022 05:49:16 -0400
X-MC-Unique: 4Fi8vMDlOUa4y7xHqbKDSQ-1
Received: by mail-wm1-f72.google.com with SMTP id y11-20020a7bc18b000000b0038eac019fc0so6939415wmi.9
        for <linux-doc@vger.kernel.org>; Mon, 25 Apr 2022 02:49:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=kKNwuusliPtIsiMP1NCPfSy6f0NI8bGmv/mZPssyDJg=;
        b=FNEgWYDUz0vtu+Os8oZJz07PFTXqk809z8Nx4+4mc2FXiwsGXQcmuEmIHZCBO/b/bY
         n+CkrpWvdNgg2PnCjZnHzaCX+kQP8UIImUBXhx3h+RdeJmy4KrAD0k/j+jxCKyWgXsUV
         lNAz93AS173HfdLl649IKooNxvbR0mbVbFMhnQJzXia3zjgNS0125gkDanh6GMnlV+w2
         p8Oapx2WvSRkf13zl7VDxvz//kDtURDVRxCFBbw4eb26nbG8V0jIGhIqwBdBbS+fHgaE
         df6a2RHNTeSVInGCkSrHmXFaxjTFYlijwG2ZYyH/7X+81MEjmnoIH+73lhBQNaeGnElh
         E6SA==
X-Gm-Message-State: AOAM5319LkCZPpGwpaQH3aq5PJBExySF6Jb8Riy91oMpwBZqNCXhxSZ5
        w8cgqwXtoraAP/J3FEZJ6VmDhbtfIL1nVDjMcJ0ikfkmnXpBzSaDnIyYRNU6SUVInPFDpA4rF9y
        NeuXZ5amnKXT5OQTJZXs7
X-Received: by 2002:adf:e40f:0:b0:20a:d221:b00c with SMTP id g15-20020adfe40f000000b0020ad221b00cmr8504134wrm.11.1650880155731;
        Mon, 25 Apr 2022 02:49:15 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwkqXyEZhA+tMfcWcXkFaRjZ8uyIBBykE5B3d3nfqlK8Sdk4xdSLTeSK5orNTzGtexB97eLjA==
X-Received: by 2002:adf:e40f:0:b0:20a:d221:b00c with SMTP id g15-20020adfe40f000000b0020ad221b00cmr8504119wrm.11.1650880155484;
        Mon, 25 Apr 2022 02:49:15 -0700 (PDT)
Received: from [192.168.1.129] ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id q16-20020adff950000000b00205aa05fa03sm8286883wrr.58.2022.04.25.02.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 02:49:15 -0700 (PDT)
Message-ID: <220929be-91c4-d19c-b04f-312c5f7e9e40@redhat.com>
Date:   Mon, 25 Apr 2022 11:49:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.0
Subject: Re: [PATCH v3 0/5] Fix some race conditions that exists between fbmem
 and sysfb
Content-Language: en-US
To:     Thomas Zimmermann <tzimmermann@suse.de>,
        linux-kernel@vger.kernel.org
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Daniel Vetter <daniel.vetter@ffwll.ch>,
        dri-devel@lists.freedesktop.org,
        Alex Deucher <alexander.deucher@amd.com>,
        Borislav Petkov <bp@suse.de>,
        Changcheng Deng <deng.changcheng@zte.com.cn>,
        Daniel Vetter <daniel@ffwll.ch>,
        Hans de Goede <hdegoede@redhat.com>,
        Helge Deller <deller@gmx.de>, Johan Hovold <johan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Miaoqian Lin <linmq006@gmail.com>,
        Peter Jones <pjones@redhat.com>,
        Sam Ravnborg <sam@ravnborg.org>,
        Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>,
        Yizhuo Zhai <yzhai003@ucr.edu>,
        Zhen Lei <thunder.leizhen@huawei.com>,
        linux-doc@vger.kernel.org, linux-fbdev@vger.kernel.org
References: <20220420085303.100654-1-javierm@redhat.com>
 <535ebbe4-605c-daf5-1afb-f5225e4bb3a8@suse.de>
 <093d742f-4c87-2ff3-e9fe-153cd734f8e4@suse.de>
From:   Javier Martinez Canillas <javierm@redhat.com>
In-Reply-To: <093d742f-4c87-2ff3-e9fe-153cd734f8e4@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hello Thomas,

Thanks for the feedback. It was very useful.

On 4/25/22 11:15, Thomas Zimmermann wrote:
> Hi
> 
> Am 25.04.22 um 10:54 schrieb Thomas Zimmermann:
>> Hi
>>
>> Am 20.04.22 um 10:52 schrieb Javier Martinez Canillas:
>>> Hello,
>>>
>>> The patches in this series are mostly changes suggested by Daniel Vetter
>>> to fix some race conditions that exists between the fbdev core (fbmem)
>>> and sysfb with regard to device registration and removal.
>>>
>>> For example, it is currently possible for sysfb to register a platform
>>> device after a real DRM driver was registered and requested to remove the
>>> conflicting framebuffers.
>>>
>>> A symptom of this issue, was worked around with by commit fb561bf9abde
>>> ("fbdev: Prevent probing generic drivers if a FB is already registered")
>>> but that's really a hack and should be reverted.
>>
>> As I mentioned on IRC, I think this series should be merged for the 
>> reasons I give in the other comments.
>>

You meant that should *not* get merged, as we discussed over IRC.

>>>
>>> This series attempt to fix it more properly and revert the mentioned 
>>> hack.
>>> That will also unblock a pending patch to not make the num_registered_fb
>>> variable visible to drivers anymore, since that's internal to fbdev core.
>>
>> Here's as far as I understand the problem:
>>
>>   1) build DRM/fbdev and sysfb code into the kernel
>>   2) during boot, load the DRM/fbdev modules and have them acquire I/O 
>> ranges
>>   3) afterwards load sysfb and have it register platform devices for the 
>> generic framebuffers
>>   4) these devices now conflict with the already-registered DRM/fbdev 
>> devices
>>

That's correct, yes.

>> If that is the problem here, let's simply set a sysfb_disable flag in 
>> sysfb code when the first DRM/fbdev driver first loads. With the flag 
>> set, sysfb won't create any platform devices. We assume that there are 
>> now DRM/fbdev drivers for the framebuffers and sysfb won't be needed.
>>
>> We can set the flag internally from drm_aperture_detach_drivers() [1] 
>> and do_remove_conflicting_framebuffers() [2].
> 
> And further thinking about it, it would be better to set such a flag 
> after successfully registering a DRM/fbdev device.  So we know that 
> there's at least one working display in the system. We don't have to 
> rely on generic framebuffers after that.
>

Exactly, should be done when the device is registered rather than when
the driver is registered or a call is made to remove the conflicting FB.

I'll rework this series with only the bits for sysfb_disable() and drop
the rest. We can go back to the discussion of the remaining parts later
if that makes sense (I still think that patch 3/5 is a better approach,
but let's defer that for a different series).

-- 
Best regards,

Javier Martinez Canillas
Linux Engineering
Red Hat

