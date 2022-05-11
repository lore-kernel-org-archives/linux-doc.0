Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756F5C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 11 May 2022 00:20:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235627AbiEKAUb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 May 2022 20:20:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235364AbiEKAUa (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 May 2022 20:20:30 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA574282000
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 17:20:28 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id t11-20020a17090ad50b00b001d95bf21996so3383836pju.2
        for <linux-doc@vger.kernel.org>; Tue, 10 May 2022 17:20:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=schmorgal.com; s=google;
        h=message-id:date:mime-version:user-agent:content-language:to:cc
         :references:from:subject:in-reply-to:content-transfer-encoding;
        bh=yekXNmBN6S2XGrUH1FRFBNDuLvVMdR8467Er++Qz778=;
        b=bB26BxCSizFz5cuL6iAICTqnjMH04Z8ga63ZX/6juIpu8Gff/sY5FNXckEGN/xbyKV
         UCX7Tw4S04vmXWxPI94xqoMZKVeMeYz0j43+lfdkFUR7DZ8+2I7mADi84S/wKZpCVgbB
         EVNWCvfTjd1oYt2Y2wJBAD3SGazQeOH098dsU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent
         :content-language:to:cc:references:from:subject:in-reply-to
         :content-transfer-encoding;
        bh=yekXNmBN6S2XGrUH1FRFBNDuLvVMdR8467Er++Qz778=;
        b=KJ9Zr9LcAfoNgKrcvzjXIYC4MnFUeWL4D07PkLimt8POG318uFszW4eewmxvfb5w5q
         xsKfedclLq3a6wsRs/Pql3f/jiAwrJlaubNUPrrJnHw6tSpY/x8Q0BshChNkBA73rIHJ
         /OrohkeunaYM1nwl215kjL1+10MFCKM8Q4fCr63OZE5tE7E5ZW3XE7QH5sVRyc9Ed0vn
         2Jp20buSl++kYutvUZkCRvCJXEnxP2up0CNKWj6DhzoJ7pGhyXQfV9ecvNvJT7ZQA/oj
         9HvpwsEKht3M1C1QzTbLoLDYjTIN/Xz6jnUDRUDLhlPsieJesIPPu9efBH3VGJLAQrOY
         ENfw==
X-Gm-Message-State: AOAM530DF7ThyI1YgItDmzfDeSR8+t8mw6L0Y24mVsU4r3bKV5b2J8g9
        +C7hgxA2S4MW9Jkjl5ggXAtRYnDTPAuubefNIxY=
X-Google-Smtp-Source: ABdhPJxZTPxMNzflE1k675Rx/EB2ZCPN+FJ6J8SJuHDgOm9kwMJxnKWSO/9qX7i2tam/o7ecoBBWvQ==
X-Received: by 2002:a17:903:244d:b0:15e:a3a2:5a6f with SMTP id l13-20020a170903244d00b0015ea3a25a6fmr22274256pls.72.1652228428310;
        Tue, 10 May 2022 17:20:28 -0700 (PDT)
Received: from [192.168.1.33] ([50.45.132.243])
        by smtp.googlemail.com with ESMTPSA id x7-20020aa784c7000000b0050dc76281f7sm123203pfn.209.2022.05.10.17.20.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 May 2022 17:20:27 -0700 (PDT)
Message-ID: <d7076f95-b25b-3694-1ec2-9b9ff93633b7@schmorgal.com>
Date:   Tue, 10 May 2022 17:20:25 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Content-Language: en-US
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        David Miller <davem@davemloft.net>,
        Networking <netdev@vger.kernel.org>,
        Paolo Abeni <pabeni@redhat.com>,
        Eric Dumazet <edumazet@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiapeng Chong <jiapeng.chong@linux.alibaba.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20220509150130.1047016-1-kuba@kernel.org>
 <CAK8P3a0FVM8g0LG3_mHJ1xX3Bs9cxae8ez7b9qvGOD+aJdc8Dw@mail.gmail.com>
 <20220509103216.180be080@kernel.org>
 <9cac4fbd-9557-b0b8-54fa-93f0290a6fb8@schmorgal.com>
 <CAK8P3a1AA181LqQSxnToSVx0e5wmneUsOKfmnxVMsUNh465C_Q@mail.gmail.com>
From:   Doug Brown <doug@schmorgal.com>
Subject: Re: [PATCH net-next] net: appletalk: remove Apple/Farallon LocalTalk
 PC support
In-Reply-To: <CAK8P3a1AA181LqQSxnToSVx0e5wmneUsOKfmnxVMsUNh465C_Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/9/2022 11:48 PM, Arnd Bergmann wrote:
> If I understand this correct, this means we could remove all of
> drivers/net/appletalk/ except for the CONFIG_ATALK Kconfig entry,
> and also remove net/appletalk/dev.c and a few bits of net/appletalk
> that reference localtalk device structures and their ioctls, right?
Yes, I believe so. At that point, would Kconfig get moved to
net/appletalk instead? (Just wondering out of my own curiosity!)
> What about appletalk over PPP (phase1 probing in aarp.c) and
> ARPHRD_LOCALTLK support in drivers/net/tun.c? Are these still
> useful without localtalk device support?

I don't feel qualified enough to answer those ones definitively, but it
looks to me like the ARPHRD_LOCALTLK support in net/tun.c could be
stripped out, because tun_get_addr_len only gets called on a struct
net_device's type, and stripping out LocalTalk would make that condition
impossible (I think?)

The AppleTalk over PPP stuff probably allows Linux to be an AppleTalk
Remote Access server. I'm not aware of anyone using that capability, (or
if it even still works) but I would consider it distinct from LocalTalk.

I would definitely be happy to test any patches to make sure that
EtherTalk still works with netatalk afterward!

Doug

