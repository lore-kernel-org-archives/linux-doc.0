Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9169CC48BE5
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 08:21:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7ED99610F7
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 08:21:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230152AbhFWIXq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 04:23:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60720 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230061AbhFWIXp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 04:23:45 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 386B0C061756
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 01:21:28 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id l11so1065370pji.5
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 01:21:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=/vpjqLnLja8zZg9F85wBmeicNZJ5E0kfTwub6S5I0nY=;
        b=qyjoMEneFPyQG6FmpAm+blLv6qUuFnSfiHq9cwsD6vkL+N14a/IYUIUTUqOY2t15qU
         orTFA+SzPPKYQEg/vg6aUJWkEx4TNqvO2RtgVWJyvQui+pZ/TnKX2y/OlFv2vaDUb+hu
         VkuvJASiJfLUZ1yJJ2NAquzoKz2lDAduMIwIg8GEvgocPlEJinWAs1aMnQ9o5SDiwVWA
         Tb+Cfp7SYSHZRtDLkBPMD1NQlBDQEHQ3ig7VsNPKaUOn3isd1x2Ziyr37iLaozV2eDeS
         lGHyBldZdyHiqvHwnT6yiHmAVW525lIsaTkLsMit19GQWxbdY/vVswfJvppCEZBlKmwE
         JnGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=/vpjqLnLja8zZg9F85wBmeicNZJ5E0kfTwub6S5I0nY=;
        b=j0cD4F7C5bzGw3x7/WQLkPUWSdUq46TI68j8SOxs+CDZVu3MtAeQgFae7Q0i+9g96y
         0YGD0PByZXzdozEagOz9VDRIVI418THmipM51pW+asJc49cPlF15vjQ/aPOyCIjv8jVt
         rn8klalWHa4eksEgOh0Il/E7w+ltU3izu+wx7U5LV/zRS1sGzdWeFaz2JX/HhFL9lPy9
         pQRaGWoRj8zhHbU5ElrfmxJTvwlMMvG3cV/tZHwbtD1y3hrNLvVy4u+IEBnx7S04iGj/
         1zCFQG24m0nU6fAlGlJ7kulpXcQf9jx+m3Zj5rOtK+MV16pL7fhSJjXhMSjK3UBwXnuV
         y+6g==
X-Gm-Message-State: AOAM532F+vsA4Y3JaiAd/qNZFLP59sVBVj1kdv4f+58Ah8fYhWnAM0V2
        RklGGJEt31B4zwTgOPcyd5FUgQ==
X-Google-Smtp-Source: ABdhPJyYaZ9+qPtqUGE0ix2e6z0tzu895F8iK8HYriQ9ex3rYbT2jDNvHbujgnZHhKfsy+6HIyxy5A==
X-Received: by 2002:a17:90a:4ec8:: with SMTP id v8mr8506910pjl.178.1624436487667;
        Wed, 23 Jun 2021 01:21:27 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:1102:c007:eee:4478? ([240b:10:c9a0:ca00:1102:c007:eee:4478])
        by smtp.gmail.com with ESMTPSA id d13sm1552726pfn.136.2021.06.23.01.21.24
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 01:21:26 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     =?UTF-8?Q?Michel_D=c3=a4nzer?= <michel@daenzer.net>,
        Pekka Paalanen <ppaalanen@gmail.com>
Cc:     devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <9853d0a9-6053-db64-9c79-40b7e0689eec@suse.de>
 <85593f2f-5aa9-6023-ecba-c5275a468b71@igel.co.jp>
 <20210622105757.2b9dec32@eldfell>
 <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
From:   Esaki Tomohito <etom@igel.co.jp>
Message-ID: <0fd18324-f396-ba76-1c8b-d048e5b72dca@igel.co.jp>
Date:   Wed, 23 Jun 2021 17:21:24 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <01a20860-8fe2-2762-5678-d9a75f70e20a@daenzer.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


On 2021/06/23 17:04, Michel Dänzer wrote:
> On 2021-06-22 9:57 a.m., Pekka Paalanen wrote:
>> On Tue, 22 Jun 2021 13:02:59 +0900
>> Esaki Tomohito <etom@igel.co.jp> wrote:
>>
>>> Hi, Thomas
>>> Thank you for reply.
>>>
>>> On 2021/06/21 16:10, Thomas Zimmermann wrote:
>>>> Hi
>>>>
>>>> Am 21.06.21 um 08:27 schrieb Tomohito Esaki:  
>>>>> Virtual DRM splits the overlay planes of a display controller into
>>>>> multiple
>>>>> virtual devices to allow each plane to be accessed by each process.
>>>>>
>>>>> This makes it possible to overlay images output from multiple
>>>>> processes on a
>>>>> display. For example, one process displays the camera image without
>>>>> compositor
>>>>> while another process overlays the UI.  
>>>>
>>>> I briefly looked over your patches. I didn't understand how this is
>>>> different to the functionality of a compositor? Shouldn't this be solved
>>>> in userspace?  
>>>
>>> I think when latency is important (e.g., AR, VR, for displaying camera
>>> images in IVI systems), there may be use cases where the compositor
>>> cannot be used.
>>
>> Hi,
>>
>>> Normally, when the image is passed through the compositor, it is
>>> displayed after 2 VSYNC at most, because the compositor combines the
>>> image with VSYNC synchronization.
>>
>> This is not a universal fact. You can write a Wayland compositor that
>> consistently reaches app-to-screen latency of less than one monitor
>> refresh cycle, while also using KMS planes.
>>
>> I believe Weston succeeds in this already if you write the Wayland
>> application accordingly.
> 
> For a specific example, https://gitlab.gnome.org/GNOME/mutter/-/merge_requests/1620 allows app-to-screen latency as low as ~6 ms (including a fixed 2 ms buffer to avoid skipped frames). mutter doesn't use KMS planes yet, but if anything I'd expect that to help rather than hurt for latency (if the compositor doesn't need to draw anything).

Thank you for providing specific examples.

Best regards
Esaki
