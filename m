Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CC779C47082
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 10:04:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 993C5610E7
	for <linux-doc@archiver.kernel.org>; Mon, 31 May 2021 10:04:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230521AbhEaKGY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 May 2021 06:06:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41106 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230518AbhEaKGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 06:06:23 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C906C061574
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 03:04:43 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id f8so6349322pjh.0
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 03:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=6x/RuHZyT/Jdi2qUQuhX9JlRMf5T21FeqX3DPu2uc+c=;
        b=DVHVFCTWjO//FHZ+gtr4l81SAZu2i5hxMauda4vZXnH7VbUykO07tGjTv6eVzuDRL9
         9kpfyeVE+wkF+7rXczVfDGjFEmRLEMrTCiwOs0Y2l6uQgJnhXcU02MyEYIMMbknevNmX
         IN9pLy1yOZ4mmzdowNuV5WOfQMarINH1i5RWkw9adWl0hyUIS/4HowpMQlxciKQBaTTu
         hTyPCUCfT1G7lwiOe6kdw8+A6s6/JEUf/+oewmEVKiI0qonhFjGWKvnGsbowvkPIrSTS
         vRXSJ98i8oCFEk2jyyTmLWTUOK6OiF8T3GxhcyVebKzoqW0FXe1OO+WyAHzDiL/fmKSz
         e5Lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=6x/RuHZyT/Jdi2qUQuhX9JlRMf5T21FeqX3DPu2uc+c=;
        b=UlE48hxctq5w1BRx97K06jvMtz61WwbB+dlfSOulcpDnLlLqUU3qae4b42o26MvEfU
         YikrfJaYHzqn1NtazG4GfFWBZ+n5MrXGzQC9ripr2CyKqhFPXuj3IIV32OCAGE8DC6J7
         28GJ3+FApdLkEV1ZAApiSoAXVls6ksCxwGC6PwUBuE25++iWAZeEKUfhxvl0bp2M8vl9
         KOFv7UAi99sBTkx1K8tG2hWLpO2Zh/9+6qL8zeq+Ab9zOPQD8bbsrd8G/iTulq1GdAMy
         gYEJ/wP2ZZwGyXQMwM4V9z0ACZQUOL3mWsphn6DQBCy8QlJc3BR6+urtZ5wYn+XX89Jk
         96DQ==
X-Gm-Message-State: AOAM532nZ+hY1Mw6OsFLNXsQ1iyWYMbpZuDSgsYoz+UtYlkpN5UT5WRd
        gk0XFIybpUsOZ/urwnSXt4CxIhlDFvOg5w==
X-Google-Smtp-Source: ABdhPJxQFB7uFUmlElws3hW04KryxpqbZmiBXyWalRkke2Lj/0sTg8sejwMuZSgzOQX+RDi12oB3EQ==
X-Received: by 2002:a17:90a:fd05:: with SMTP id cv5mr3963711pjb.24.1622455482408;
        Mon, 31 May 2021 03:04:42 -0700 (PDT)
Received: from [172.28.99.179] ([139.226.50.128])
        by smtp.gmail.com with ESMTPSA id q9sm10577314pjm.23.2021.05.31.03.04.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 03:04:41 -0700 (PDT)
Subject: Re: [PATCH] docs/zh_CN: add core api cachetlb translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org
References: <20210527043118.3835070-1-siyanteng@loongson.cn>
 <4fed765c-b2c0-5cb5-8d7a-5b3dec3cd3f0@gmail.com>
 <CAEensMyGHOQ6DMkU_WHByQJbAD8L+-M5uvj1AwVs+Dp=coYLQw@mail.gmail.com>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <bd3b4235-b828-ce63-4cb2-f395c6190f29@gmail.com>
Date:   Mon, 31 May 2021 18:04:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAEensMyGHOQ6DMkU_WHByQJbAD8L+-M5uvj1AwVs+Dp=coYLQw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/31 下午5:18, yanteng si wrote:
> Alex Shi <seakeel@gmail.com> 于2021年5月31日周一 上午11:11写道：
>>
>>
>>
>> On 2021/5/27 下午12:31, Yanteng Si wrote:
>>> diff --git a/Documentation/translations/zh_CN/core-api/cachetlb.rst b/Documentation/translations/zh_CN/core-api/cachetlb.rst
>>> new file mode 100644
>>> index 000000000000..9568c15f4139
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/core-api/cachetlb.rst
>>> @@ -0,0 +1,319 @@
>>> +======================
>>> +Linux下的缓存和TLB冲洗
>>> +======================
>>> +
>>
>> Guys,
>>
>> I don't insist on the 'flush' translation, although it is used to be translated
>> as 刷新. I just never see it was translated as ‘冲洗’ in computer area.
>>
>> Any more comments or suggestions for this?
> Dear Alex,
> 
> I admit that "冲洗" doesn't sound very good. But,How to translate
> "refresh（刷新）"?:-)
> 
> The act of "flush" is to invalidate dirty data，This is obviously not
> consistent with the act of "refreshing", which is simply invalid.
> "刷新"  is actually two operations, i.e. brush off the old one and come
> back to the new one.
> 

This make sense, but would the word 冲刷 better? A brand new word may take
more time to be custom. 


> BTW：
> flush is ambiguous in the description of cache management because it
> can mean both invalidation and write-back, while TLB only has an
> invalidation operation here, so there is no ambiguity in using flush
> here.
> 
> Thanks,
> Yanteng
> 
