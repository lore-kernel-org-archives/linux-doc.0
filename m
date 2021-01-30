Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4BCD8C433DB
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 16:45:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1284561481
	for <linux-doc@archiver.kernel.org>; Sat, 30 Jan 2021 16:45:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231202AbhA3QpZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 30 Jan 2021 11:45:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbhA3QpX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 30 Jan 2021 11:45:23 -0500
Received: from mail-ua1-x931.google.com (mail-ua1-x931.google.com [IPv6:2607:f8b0:4864:20::931])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FB3EC061574
        for <linux-doc@vger.kernel.org>; Sat, 30 Jan 2021 08:44:34 -0800 (PST)
Received: by mail-ua1-x931.google.com with SMTP id a31so4305901uae.11
        for <linux-doc@vger.kernel.org>; Sat, 30 Jan 2021 08:44:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8dTgzuZEBtakb3Ls1Rwx8UrlJz4K0vLRzf+dxtiuLc0=;
        b=f8VIFdq0/xiJyYgW5gHz1W5rlrNWZTShgstXT+6szr3w7U3Z20AOXKmUXkXzlTVHI1
         4wRFRHRAGXRxkdVVjqsouywQv36/54Mbtr8WHQsgZ0p1Q2A+xEj9zoQA4IJP9EBctmjF
         51rtK3F7+PHte3ErajhBqBh3H7vHFuPF81f8h4Yqs4G8T6YdN1OsCbztepxOLoXFdLvz
         v39uEjgQF5BCwxzTVKDuwzWzhVsVEMKCz+xp6amH7wMdZbCOwAEZROKchJ0K9idTtgT9
         NG5Ipm66RNR1FHGrQB2jSJX8pmJW+/VJY1/MOB5Dvmc+OI+AYZ6D+C6BVF412ZKSblmi
         YJ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8dTgzuZEBtakb3Ls1Rwx8UrlJz4K0vLRzf+dxtiuLc0=;
        b=MBCcQ4h0BirlFPdTmIF+W8j54u1n6szXKpGuPuWm5MgXJMmLVNm9GmVUYJyppCKZXr
         l4hLjI20rxmdKJyuKDRseUP4loDCiyee0Qf+9CcmwmwUAY/EeUUyEUKn8EHorE9ogERa
         d/EaIg85ewxrCOyb3b1gjiqs/3FkC1qDFUSxCQBppEWGKE1XLziMxee1GX8MIIS9Iedy
         EWO2PKu0UPPQUPnYM94cXplLpO7BHs9ZsdPpW96WF0e8V8rJLI+StN1zObsyH0LRmUpE
         ho+EhFu8dAjaKUZWkNVVrOX+qcMuXyFNWcS5j3C5VjXNqSe0VPbN8LtAnDVnJ6VCYA3s
         P0Mw==
X-Gm-Message-State: AOAM530pB4TBQrfMqEhwbsQgoYEITzLsgLIQhuDEyV+j5KUrVt1HSknD
        vfqsozTAkkpPK5RpDVoUYoHwbdWvNBuLFlRX
X-Google-Smtp-Source: ABdhPJxnui7oJ6u2SPaoG6OyYFuyb3fOFEnKwawSsYD6obvIuVrehcrX3RP5VnQKjU1EmPCYhrYVzw==
X-Received: by 2002:ab0:2851:: with SMTP id c17mr5637698uaq.120.1612025073290;
        Sat, 30 Jan 2021 08:44:33 -0800 (PST)
Received: from ?IPv6:2800:484:5386:cf00:4903:bae6:1ea8:94f2? ([2800:484:5386:cf00:4903:bae6:1ea8:94f2])
        by smtp.gmail.com with ESMTPSA id y74sm1537105vkd.39.2021.01.30.08.44.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 30 Jan 2021 08:44:32 -0800 (PST)
Subject: Re: [PATCH] kbuild: fix typo in Documentation/kbuild/modules.rst
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Jiri Kosina <trivial@kernel.org>
References: <20210130022337.11175-1-nicboul@gmail.com>
 <CAK7LNAQQZqbsnByXkLFWhxJ6HP6QOozxTQsLuamavi57YrAuZA@mail.gmail.com>
From:   Nicolas Bouliane <nicboul@gmail.com>
Message-ID: <8ce8f356-13ef-1685-89f0-382fa5b25d0a@gmail.com>
Date:   Sat, 30 Jan 2021 11:44:30 -0500
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:78.0)
 Gecko/20100101 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQQZqbsnByXkLFWhxJ6HP6QOozxTQsLuamavi57YrAuZA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 1/30/21 12:21 AM, Masahiro Yamada wrote:
> On Sat, Jan 30, 2021 at 11:25 AM Nicolas Bouliane <nicboul@gmail.com> wrote:
>>
>> Signed-off-by: Nicolas Bouliane <nicboul@gmail.com>
> 
> 
> 
> The code is correct.
> '$$' is escaped '$', not a typo.
> 
> NACK.

Oh ! I got confused, my apologies
thank you for your reply

Nick
