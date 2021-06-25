Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DFD3C2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 05:04:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3654D6141C
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 05:04:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230359AbhFYFHO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 01:07:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42784 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230193AbhFYFHO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jun 2021 01:07:14 -0400
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FB44C061574
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 22:04:54 -0700 (PDT)
Received: by mail-pl1-x634.google.com with SMTP id f10so4139990plg.0
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 22:04:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vdRkA0G6L/3wuQW2XhcEFmwQEh1NSF/qfRRNJp14DH8=;
        b=V6pFTp/oj8rbgge5ZYBZBLDSsbAK30+c2M+j7RWZvYWVou8bYQKt8XBa6sn7m4dcMU
         RKhtYuROyCZkeb4ULP7jKHEERIS59JUrnsW8epAtjlWpVAUkjCt4sAc0HzzFu0POFGAK
         5+sW45SG2BIDsd+JWfmWYdLFTPI4RaLYSE+zlQLLPF5oGhZ2rkKnJU6BA394rB5qi/3o
         aARQJO5uCoZt4YnqHicbeByTkFw5EOs9upunFRufTQTIWkCffwd6aLKVGqs8ZOShtg75
         mDttKfTCkJiITJsJtUaXpzMRUUsZ7Wf5M1sFhy4yOU9pHuKivZEmxG2FTzltH5uamIap
         V+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vdRkA0G6L/3wuQW2XhcEFmwQEh1NSF/qfRRNJp14DH8=;
        b=D8JblNdcsXfLHDY/9ILxZz5vO45ulHC4d5zYbdjT7clGS0TQJ3feluy3r7JQ0cy2VJ
         biV0vwy3EYuwNmQYGBlDVcrYmtrdaGju9oVtYRfujcw6nohro/I935ca43r9gOpD+Fmf
         uYhUAZAXQj7UiaSRA2e10vaBVhYyDn+NlOcck+Wkwug8DI4DGxRlUSiG07k1roSLFO6q
         vovfSbqCCtj20VADN9u33RW7P50f7bxFSMwymm8B4pv4QYsnrUE8kb331sVVF1xFaTKM
         R34o+z41C3iwaGBSyzzTuf0mUNRI1rjltQwZHKzvl0Iyx4BJujh5ae0o31aUcZErwzRk
         A8oQ==
X-Gm-Message-State: AOAM533680mGNJo+RNA9J7biZ1T9w/3SIcBEixuuKsDXj6eQ5GBz9Xhl
        GxYSoxQBLju7HRlZXyYWFIA=
X-Google-Smtp-Source: ABdhPJyjDtJddHrIhz9U8FZUqoAAJ3IjxPxmKgbaLr49qpgEJU6tZIowjEvZHaffpvqlLVkeJN5gHg==
X-Received: by 2002:a17:90a:e50f:: with SMTP id t15mr9271598pjy.75.1624597493872;
        Thu, 24 Jun 2021 22:04:53 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id k9sm3969862pgq.27.2021.06.24.22.04.49
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 22:04:53 -0700 (PDT)
Subject: Re: [PATCH v4 1/2] docs/zh_CN: add core api memory_hotplug
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
References: <cover.1624517569.git.siyanteng@loongson.cn>
 <2e3f18827d9405337e00d47b3425125fdbbdde09.1624517569.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <75800da2-67ea-600b-8728-b1f28d6546dd@gmail.com>
Date:   Fri, 25 Jun 2021 13:04:47 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <2e3f18827d9405337e00d47b3425125fdbbdde09.1624517569.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/24/21 3:30 PM, Yanteng Si wrote:
> Translate Documentation/core-api/memory_hotplug.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
Reviewed-by: Alex Shi <alexs@kernel.org>
