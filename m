Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 11ACBC4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 09:22:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF0B360C3F
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 09:22:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230138AbhFWJZJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 05:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230135AbhFWJZI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Jun 2021 05:25:08 -0400
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6CEB0C06175F
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 02:22:51 -0700 (PDT)
Received: by mail-pj1-x1032.google.com with SMTP id l11so1149244pji.5
        for <linux-doc@vger.kernel.org>; Wed, 23 Jun 2021 02:22:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=igel-co-jp.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=XCajk1HrAlj47wC3+mkOuYZYpFGTdG0u/TJUK9omw44=;
        b=ZjaDBmTSrHRM+Wans1JDGrXnF8h56nSyQWJrnDOhiSu9Q2czUooggcFrZeW5OrFfGe
         4InlIJCaoDJvC2qM1tPyx5lrta50x/dPQl987+0qPfsgKDObwYOPDB7LmJS8+1QJB6Ww
         rS4dOgQLwHHqitlVJ9tG0jT4jxLfdMi+JjSzv7Ow1bmZGT5tnQ66jeeP+GqznH6E+7lp
         thH4WClVdZFYI68gRa5P93BRi8ycisjAk5KtuygYecegAGiEiByTGSGKIi1V/awM5lFS
         qvSiNzLRZFXxpal4mpSeK0GodO80oZtbqoDYsqQ5OFx5ifVecqcyFaVxnOkGI1Ao75tN
         jbtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=XCajk1HrAlj47wC3+mkOuYZYpFGTdG0u/TJUK9omw44=;
        b=mRQHtb55/+GDI02EG+kCDpnoWuVrb0k0fl0O2sjvBYj/WPihEboRzJKnNvXKNJB7pn
         HKcc7AcbuhgNgZKgwCN922WWHtkdYkrT567Go1WkF7BS5Y6BrM4YtZkmyJzIT0PXSpiK
         cSZbZ98iAMbP/m7HCTC81CcpdaZRgDmZ+Hr4Ckl3oTDV09YWb/zhwG0sFok7BmPEm68V
         D5VlYB7h75/cGF6gmadL9ZkLfjGBZAEkg40CiKiYbrFd5aJNh43M8ciG0OtZD08PNXmn
         YUqcXAbbEMLTrrrwUIJDii7nRBoeoWbg4nP0QSvTpKDdERX3CF+AEahvQPzC1Uy16j7m
         kV1w==
X-Gm-Message-State: AOAM532r8fGGV75jBxWA3QrF15/GDIJGtAiLw0K5L+Qg5u//MjGhtCPJ
        G47GyvprMFQesOsyW54Z1te1TQ==
X-Google-Smtp-Source: ABdhPJylI81T3ZuU7pYZAujPUun/oGmu1PBLOBoGTzRXKdXQoIrLIXIJFcNz/PaxrTYzrPhhtomd+w==
X-Received: by 2002:a17:902:8601:b029:11c:4b4:e967 with SMTP id f1-20020a1709028601b029011c04b4e967mr26767197plo.75.1624440170945;
        Wed, 23 Jun 2021 02:22:50 -0700 (PDT)
Received: from ?IPv6:240b:10:c9a0:ca00:d428:46bd:365e:3555? ([240b:10:c9a0:ca00:d428:46bd:365e:3555])
        by smtp.gmail.com with ESMTPSA id q9sm460pgt.31.2021.06.23.02.22.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Jun 2021 02:22:50 -0700 (PDT)
Subject: Re: [PATH 0/4] [RFC] Support virtual DRM
To:     Pekka Paalanen <ppaalanen@gmail.com>
Cc:     "Enrico Weigelt, metux IT consult" <lkml@metux.net>,
        devicetree@vger.kernel.org, Takanari Hayama <taki@igel.co.jp>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Damian Hobson-Garcia <dhobsong@igel.co.jp>
References: <20210621062742.26073-1-etom@igel.co.jp>
 <7cde82a9-c60c-e527-eeac-eaad0c5842a1@metux.net>
 <1cfab5f9-f275-aa53-00de-5da3fcea71c5@igel.co.jp>
 <20210622111239.73aa87aa@eldfell>
 <ee0161b5-c88b-40ce-c02f-86e0927b70bb@igel.co.jp>
 <20210623113922.1e603139@eldfell>
From:   Esaki Tomohito <etom@igel.co.jp>
Message-ID: <ab816c34-ff98-911f-e53d-b91cd3be6f2b@igel.co.jp>
Date:   Wed, 23 Jun 2021 18:22:47 +0900
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210623113922.1e603139@eldfell>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2021/06/23 17:39, Pekka Paalanen wrote:
> On Wed, 23 Jun 2021 15:56:05 +0900
> Esaki Tomohito <etom@igel.co.jp> wrote:
> 
>> Hi,
>> Thank you all for your comments.
>>
>> On 2021/06/22 17:12, Pekka Paalanen wrote:
>>> On Tue, 22 Jun 2021 13:03:39 +0900
>>> Esaki Tomohito <etom@igel.co.jp> wrote:
>>>   
>>>> Hi, Enrico Weigelt
>>>> Thank you for reply.
>>>>
>>>> On 2021/06/22 1:05, Enrico Weigelt, metux IT consult wrote:  
>>>>> On 21.06.21 08:27, Tomohito Esaki wrote:
>>>>>
>>>>> Hi,
>>>>>     
>>>>>> Virtual DRM splits the overlay planes of a display controller into multiple
>>>>>> virtual devices to allow each plane to be accessed by each process.
>>>>>>
>>>>>> This makes it possible to overlay images output from multiple processes on a
>>>>>> display. For example, one process displays the camera image without compositor
>>>>>> while another process overlays the UI.    
>>>>>
>>>>> Are you attempting to create an simple in-kernel compositor ?    
>>>>
>>>> I think the basic idea is the same as DRMlease.  
>>>
>>> Hi,
>>>
>>> indeed. Why not use DRM leases instead?
>>>   
>>
>> In this use case, I understand that this is not possible with DRM lease,
>> am I wrong?
>> I understand that it’s not possible to lease a plane and update planes
>> on the same output independently from different processes in current DRM
>> lease.
>>
>> If this is correct, what do you think of adding support for plane leases
>> to the DRM lease to handle this case?
> 
> Hi,
> 
> I would love to see support added for leasing individual planes,
> especially to replace the virtual DRM proposal which seems to be
> eradicating everything that atomic modesetting and nuclear pageflip
> have built over the many years.
> 
> However, please note that "on the same output independently" is
> physically impossible. Semantically, the planes define what a CRTC
> scans out, and the CRTC defines the scanout timings. Therefore it is not
> possible to update individual planes independently, they will all
> always share the timings of the CRTC.
> 
> That combined with KMS not allowing multiple updates to be queued at
> the same time for the same CRTC (atomic commits and legacy pageflips
> returning EBUSY) makes the plane updates very much inter-dependent.
> 
> If you want to avoid EBUSY and have planes update on the vblank you
> intended, you really need a userspace compositor to pull everything
> together *before* submitting anything to the kernel.

Hi,

Thank you for your comments and advice.
I will consider leasing a plane.

Thanks,
Esaki


