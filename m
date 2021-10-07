Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DFE3C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 16:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8051A60EB2
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 16:42:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242787AbhJGQn4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 12:43:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59576 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242789AbhJGQn4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 12:43:56 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F346C061570
        for <linux-doc@vger.kernel.org>; Thu,  7 Oct 2021 09:42:02 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id v17so20947577wrv.9
        for <linux-doc@vger.kernel.org>; Thu, 07 Oct 2021 09:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=8ajzGuCxxALkqNCR+XhT+VAIcrm47k8+MziyY8FwPVc=;
        b=Mwp5XWdJw+rhnpdyUDtr3zlhpvorTxmeLO6G3ozIXikMS6s0PUcyeh+UF5nBeJF4ZG
         t37h83kzMNjaXwICDo0hVfBXWj0Vgbkeui95/7R+rWaHIFlWrRtP426iHBn9y8tpmP5S
         EBu2yzbKv8+nEiACp8FWalnkASYl+o2cN7Fk0zg5QD1az810dCBbxkghrtYL4SJqxQgQ
         6StSfSjZ1ruz8ifgWTD1nn7zaOxdP9/1/eomMBlHGyEpc3Ut2QcAvTrsiZVhQBsgl8K8
         grRP7dyyjxi9MH267r71ZH7jSloJiu4PGplirvxAC3PLQBF7s9um1oxkY+IWyZZT8dlK
         hYRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=8ajzGuCxxALkqNCR+XhT+VAIcrm47k8+MziyY8FwPVc=;
        b=f3Pxgu9t/3oKwplwTiHICpQ3wAhs10/qO5PoyNghXo64SSFI5JURDYDjsTdGqLvscs
         uwB386TIWoD+iwpaHQ74Y9kWD/ykpc49/B/+Rr61uYg5Po0hPBmsfXdzGPtMd8Jb+wl8
         PW1Ux8/gYYWpr9zbINfF4Eli/y4XiOeoILwiYaCev1HJeN0dG9nl+9/APMXmU6ymle8U
         /LihhqAk7Dug/nRfXpRy1h0yStvQTMvsBn7ShhW3P0ZfgheKvp9bF3GIdD/WjV4WfXN+
         qZWbirxd1XUGe9FmP98IXxDJAmZO3DnK/AsGKAaC2VxpMNLSWvq+gVZBlFd6Og/DwfYH
         X8wA==
X-Gm-Message-State: AOAM5319wElAo/TaPMT/0cmzPvHe26vQbcS7NcjWcuO6UrU1b/gSAxrF
        0jVNSvwZh27OI4Azn09vRYIRo0YZ3Qkv9A5E
X-Google-Smtp-Source: ABdhPJy+nvrsw9oOziGHzyYh3otCLg8zWQxb7IvReSS2o2opPk3C7vyanVbcxqhLFBWFiEZCr4vE+A==
X-Received: by 2002:a05:600c:4f12:: with SMTP id l18mr17563231wmq.156.1633624920613;
        Thu, 07 Oct 2021 09:42:00 -0700 (PDT)
Received: from ?IPv6:2a01:e34:ed2f:f020:d502:2b58:17d:d5b? ([2a01:e34:ed2f:f020:d502:2b58:17d:d5b])
        by smtp.googlemail.com with ESMTPSA id y11sm154144wrg.18.2021.10.07.09.41.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 09:42:00 -0700 (PDT)
Subject: Re: [PATCH v2] thermal: Move ABI documentation do Documentation/ABI
To:     "Rafael J. Wysocki" <rafael@kernel.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux PM <linux-pm@vger.kernel.org>
References: <864dd17a1bff58770b1c1dc0b430bd26b6d7fa01.1633595141.git.mchehab+huawei@kernel.org>
 <CAJZ5v0hj1jZtZ-cD_4jy94cjMbyix-=QcN2Qn9pkW7H1kn16LQ@mail.gmail.com>
From:   Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <581a7222-0a01-6292-5b14-ca0e4690bc67@linaro.org>
Date:   Thu, 7 Oct 2021 18:41:58 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAJZ5v0hj1jZtZ-cD_4jy94cjMbyix-=QcN2Qn9pkW7H1kn16LQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 07/10/2021 18:39, Rafael J. Wysocki wrote:
> On Thu, Oct 7, 2021 at 10:25 AM Mauro Carvalho Chehab
> <mchehab+huawei@kernel.org> wrote:
>>
>> The thermal ABI is described, together with the internal
>> development details at:
>>
>>         Documentation/driver-api/thermal/sysfs-api.rst
>>
>> Move the sysfs API description to Documentation/ABI,
>> ensuring that scripts/get_abi.pl will properly parse it.
>>
>> While here, also update MAINTAINERS for it to point to
>> the documentation.
>>
>> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> 
> There is a typo in the subject, but I can fix it up.
> 
> Daniel, would you mind if I applied this?

Acked-by: Daniel Lezcano <daniel.lezcano@linaro.org>




-- 
<http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
