Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2014EEE4993
	for <linux-doc@archiver.kernel.org>; Wed, 23 Aug 2023 10:59:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234253AbjHWK76 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Aug 2023 06:59:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51840 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232105AbjHWK75 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Aug 2023 06:59:57 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08B12FB
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 03:59:56 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id d9443c01a7336-1bf5c314a57so22522235ad.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Aug 2023 03:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1692788395; x=1693393195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GYZFq9HoRCm6GUrGyMS4vRuIGoFXcojk2tIii80AOf8=;
        b=hMCv8kaLg9uRTJ7vSvi6IGdU5fZSfTMhlG0zlRPlHSqcYvoDeYlf/0xO+0jJfC14cS
         Bw/WseNRlkcUtziB19vuZoUOtCEHMS/ZTmr/X4WMxnB4mRrckS65mlok1QlaHfFhxJWk
         sCvx4/kcuXPrO7i7krfxqRgWsnc78+OU1y2ROexiQGs+BLzrE+OARml5+vAU4fFs8ULg
         vZc+BkaxQnXvXkkrRzvgPDlePDCUSX3woqMTGCbE1YsycvsZfrDHsQqaTcUoXCtw7MOX
         MBAUxFHt8Uk9IU3BohH1PGp12RZ6tKt7MxNaUPCBmr/H2Ffdj7158cXTW8jz7fZUES/Q
         AYYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692788395; x=1693393195;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GYZFq9HoRCm6GUrGyMS4vRuIGoFXcojk2tIii80AOf8=;
        b=d2yYVJnM+rrDDu2T+Y7tzZWQKyhhHTE0b47KCwgJOnBoXbXm9ShQCjtiVcPa4gLEpm
         oxVapgs2Cb0iVbqHm8QhIvc+kkhO2XD1qVUyIeCv+eYJVLaK43jSUsn7jknvSrBltdpO
         NhGdBeMjWtC2WIbNR5Z5dpC67qyAlnbXmlq6XuKkxQslkjVM2Qre7GSJAPUtJx6HZ+0D
         cgDw/qvt+5WkM+RDekt8UhljFmgrsmW20rfnN7D0dJ6nD382tskCuWJ3RrECyvLRIb4K
         a9R0WFkBjOPYFvN25/QzfZ5BiMn6wcqKcmmaPkMyQS04aM1ctHy1VK86uRBVKE57Om2P
         JmuA==
X-Gm-Message-State: AOJu0YwATjzg2QCWNdk5FoSGBZdNzoxMLz7D9NwraiiDDPm2+C0lNtbB
        fshLOPySsK/veZ/10uTMTWE2ww==
X-Google-Smtp-Source: AGHT+IG9GEvdMxJhiziwd/SHslHP1nERR5FT/wwW48l3HyWAFbQ06s+mBPnSX8kpNLDY/xUfOyXAKg==
X-Received: by 2002:a17:902:ea06:b0:1b2:1b22:196 with SMTP id s6-20020a170902ea0600b001b21b220196mr11544921plg.48.1692788395431;
        Wed, 23 Aug 2023 03:59:55 -0700 (PDT)
Received: from [10.255.208.99] ([139.177.225.251])
        by smtp.gmail.com with ESMTPSA id a7-20020a170902ecc700b001b2069072ccsm10655073plh.18.2023.08.23.03.59.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Aug 2023 03:59:55 -0700 (PDT)
Message-ID: <029cb695-9b8e-8fb3-ef0f-b223f34e7639@bytedance.com>
Date:   Wed, 23 Aug 2023 18:59:49 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.14.0
Subject: Re: [PATCH 4/5] fuse: writeback_cache consistency enhancement
 (writeback_cache_v2)
To:     Bernd Schubert <bernd.schubert@fastmail.fm>,
        Miklos Szeredi <miklos@szeredi.hu>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-fsdevel@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        me@jcix.top
References: <20230711043405.66256-1-zhangjiachen.jaycee@bytedance.com>
 <20230711043405.66256-5-zhangjiachen.jaycee@bytedance.com>
 <CAJfpegtqJo78wqT0EY0=1xfoSROsJogg9BNC_xJv6id9J1Oa+g@mail.gmail.com>
 <699673a6-ff82-8968-6310-9a0b1c429be3@fastmail.fm>
From:   Jiachen Zhang <zhangjiachen.jaycee@bytedance.com>
In-Reply-To: <699673a6-ff82-8968-6310-9a0b1c429be3@fastmail.fm>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2023/8/23 18:35, Bernd Schubert wrote:
> On 8/23/23 11:07, Miklos Szeredi wrote:
>> On Tue, 11 Jul 2023 at 06:36, Jiachen Zhang
>> <zhangjiachen.jaycee@bytedance.com> wrote:
>>>
>>> Some users may want both the high performance of the writeback_cahe mode
>>> and a little bit more consistency among FUSE mounts. Current
>>> writeback_cache mode never updates attributes from server, so can never
>>> see the file attributes changed by other FUSE mounts, which means
>>> 'zero-consisteny'.
>>>
>>> This commit introduces writeback_cache_v2 mode, which allows the 
>>> attributes
>>> to be updated from server to kernel when the inode is clean and no
>>> writeback is in-progressing. FUSE daemons can select this mode by the
>>> FUSE_WRITEBACK_CACHE_V2 init flag.
>>>
>>> In writeback_cache_v2 mode, the server generates official attributes.
>>> Therefore,
>>>
>>>      1. For the cmtime, the cmtime generated by kernel are just 
>>> temporary
>>>      values that are never flushed to server by fuse_write_inode(), 
>>> and they
>>>      could be eventually updated by the official server cmtime. The
>>>      mtime-based revalidation of the fc->auto_inval_data mode is also
>>>      skipped, as the kernel-generated temporary cmtime are likely not 
>>> equal
>>>      to the offical server cmtime.
>>>
>>>      2. For the file size, we expect server updates its file size on
>>>      FUSE_WRITEs. So we increase fi->attr_version in 
>>> fuse_writepage_end() to
>>>      check the staleness of the returning file size.
>>>
>>> Together with FOPEN_INVAL_ATTR, a FUSE daemon is able to implement
>>> close-to-open (CTO) consistency like NFS client implementations.
>>
>> What I'd prefer is mode similar to NFS: getattr flushes pending writes
>> so that server ctime/mtime are always in sync with client.  FUSE
>> probably should have done that from the beginning, but at that time I
>> wasn't aware of the NFS solution.
> 
> 
> I think it would be good to have flush-on-getattr configurable - systems 
> with a distributed lock manager (DLM) and notifications from 
> server/daemon to kernel should not need it.
> 
> 
> Thanks,
> Bernd

Hi Miklos and Bernd,

I agree that flush-on-getattr is a good solution to keep the c/mtime
consistency for the view of userspace applications.

Maybe in the next version, we can add the flush-on-getattr just for the
writeback_cache_v2 mode, as daemons replying on reverse notifications
are likely not need the writeback_cache_v2 mode. What do you think?

Thanks,
Jiachen


