Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A5C8C48BE6
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 17:32:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 378B760FE5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Jun 2021 17:32:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230393AbhFPRfE (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:35:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38374 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229741AbhFPRfC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Jun 2021 13:35:02 -0400
Received: from mail-ot1-x32a.google.com (mail-ot1-x32a.google.com [IPv6:2607:f8b0:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D82E5C061574
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 10:32:50 -0700 (PDT)
Received: by mail-ot1-x32a.google.com with SMTP id 102-20020a9d0eef0000b02903fccc5b733fso3293316otj.4
        for <linux-doc@vger.kernel.org>; Wed, 16 Jun 2021 10:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kernel-dk.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=q4gumIsyYAtBcDgBeiPSNtfPvFXvXc8mQGPj94mk7tU=;
        b=0/gByeCCO+jtXT10f358SOv5CX5VuTpPTBsWh15TdpdH0EE81yE6LKrzfDHqsQ31F8
         8Ob01KNdVt+lfSVo4nxcsYFLS6pUMbxntpBCXeA8bpdkhIp5cLJUD/RMwbCGAQxF0S4r
         PJMlL6XrLaBSt42KfMHRD/GEctTRbB7jhZPXRvqDB/uiyVRuLjyGP7ZTfzAl+/WwhPlr
         6x4K6G3tLrXQitckLUrzCMz3DyDi969BG2OHS0T0228CY3yEYX+s8cJWd85mbH7ZFA24
         wwtRvg0KMv4U8qg1mtfBjpEb7WryqWrVQJiRWk6BwOEO0i8rwY8VOaqnrBar84A7Kano
         /Rqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=q4gumIsyYAtBcDgBeiPSNtfPvFXvXc8mQGPj94mk7tU=;
        b=VtbzM9iVT7lBgkMTffztwlQSDZOfgzjh1Qei6V3GlF9hpwLs+2kiYvCwR8cvUQvXM/
         5alE+IBpz/jRrRhA9/qbdicsbdvIVPB6icKgwj3GrWHjn9XcNf1sctuaV69nxYaIwgoC
         94+j+SG5yozYuTUu/a4h1Kj9RUh5a5l+gdNlI7F4E5YNErhNozkiXoZG4XBLY6R3VCf/
         3inOXdLwynhb9rGQZOACJjOAFs0Lw6zxIi/COHYu36Vm0ybsRDMW9P1x3lxggU+0sQ1N
         6lDkWIRhRpo2AHG3sJHCj2A42t66NkONsvMMO8yqXVky5eGAujEZkRvIZ+sc8eawHUSD
         xi9w==
X-Gm-Message-State: AOAM5335RusBvnCrAiuaVDWgpADJe1jILGHkcdbTTqIFWV+Pg98EPdhf
        5EyreM3HjPdXaqZDENR2w0rnfQ==
X-Google-Smtp-Source: ABdhPJwT3egGMHgPimidPdpu6xRLpuEcZUz6jCESt+aYA71rNUIpwBGV1tEHoan34PYS0dkH4sEB4g==
X-Received: by 2002:a9d:7acc:: with SMTP id m12mr911229otn.27.1623864770076;
        Wed, 16 Jun 2021 10:32:50 -0700 (PDT)
Received: from [192.168.1.30] ([207.135.233.147])
        by smtp.gmail.com with ESMTPSA id 26sm627828ooy.46.2021.06.16.10.32.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Jun 2021 10:32:49 -0700 (PDT)
Subject: Re: [PATCH 0/3] add/update/fix BFQ docs
To:     Kir Kolyshkin <kolyshkin@gmail.com>, linux-doc@vger.kernel.org
Cc:     Jonathan Corbet <corbet@lwn.net>, tj@kernel.org,
        paolo.valente@linaro.org, cgroups@vger.kernel.org
References: <20210611030737.1984343-1-kolyshkin@gmail.com>
From:   Jens Axboe <axboe@kernel.dk>
Message-ID: <40174fe2-ef72-99bd-2c75-5f00641f064b@kernel.dk>
Date:   Wed, 16 Jun 2021 11:32:49 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210611030737.1984343-1-kolyshkin@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/10/21 9:07 PM, Kir Kolyshkin wrote:
> Improve BFQ docs: fix formatting, adding a missing piece.
> 
> Fix cgroup v1 blkio docs which are not updated for CFQ -> BFQ.
> 
> Patches are on top of the latest docs-next (commit acda97acb2e98c97895).

Applied, thanks.

-- 
Jens Axboe

