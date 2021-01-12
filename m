Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 06CBBC433E0
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 07:17:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B8BC722CAF
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 07:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730933AbhALHRH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 02:17:07 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:32899 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1730397AbhALHRH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 02:17:07 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id EB15F1E37;
        Tue, 12 Jan 2021 02:16:00 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 12 Jan 2021 02:16:01 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=o
        qUAFPTaYPdUE6/PguTdJc7qgCuoAZmWzORcZkgU7xU=; b=0UVI7Co2XE5ftYXh/
        9rfaYdiUUabdwQlxt0KBV4UKSOA/r1uHhEPfG+1TAJ+g3wsJTcvt9LEfTKJzT0n/
        vuYJ+5/HZmpIs93WXJWxDfRra6CENMWM65LcRGdpGXrQ1eNO/PiOPITjYCNwPvfH
        gKuzV7B7ayQact5LM5f/m9pU8bwPgnPRg5e3FdtDIy6oQZ6TIKabhr08LvyVEmAI
        4RcGrAsUZTNHahxwYmkRUugqTufB4at05zcgpio4kdancAKoek9QtjVLp3RwcJ6T
        O4+3SzW9xxyyjO5NsZzeT4zro3eXOxev98avKvpVjGGubZBiFxY6SJPFKTgWsWEq
        v63gQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=oqUAFPTaYPdUE6/PguTdJc7qgCuoAZmWzORcZkgU7
        xU=; b=N4XI0nl4PHcb8FCYhqtN8wCcZs0xPQEf0jaGKj3d0ofzO7xIEnYhJS5tM
        IL9S7UOSF0plfacvZqhXiJL2pAQXUPGSE3NkEm3QUaTVPyDfzxXkhjeqy0RxRgvf
        AKE9/cT/FEV6nvAIJETnnlhrkoP5mZyahQFTo5KDTmxYA1Ol/Eslql6my0nMmNaJ
        H9lUdNF0pRZPtj5lE6e23M0OsiewE5e92/TQgaGdrGok+cfIQFtYkzDfSCRmyJ4k
        5tKYfCSkcB7ttQAEOnzdbda1/gCwxpbeePtQgpqHzeX/C69ZaVjtAMor7D78aj8F
        fU+aSZV+G7gF5DmKJdaT6vFCgPE7A==
X-ME-Sender: <xms:r0z9X0xxROP68-ZFXTfBwtVNN7wD0wqnjid0nFzRlwHc4-R0bjU6Ww>
    <xme:r0z9X4Sh9ONusfk6Qo62PDRauHURNBbV9Ul4s3dctj_OOWCoJX9wRGxsshWfnZ54A
    0EzMPbtf5z9FYnlsas>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffff
    veffueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghruf
    hiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehf
    lhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:r0z9X2W1VS1DuM_O234G5KqKJSsDzwT3P7NsdwOg5GiJPtH1Gl94kg>
    <xmx:r0z9XyhmdmKSZrBZa3-6-7lSiRWscyUgtJIDR5X4xa1dmeWaVP8X5g>
    <xmx:r0z9X2AzVWV2CSX0e46Q45sjfKfwH_dC8uo0uUnjJkixvV7tBpY-Cg>
    <xmx:sEz9X5835O7JCEzl_5s8JTJ2MQPXXMuf6Q2qB7O2fK4dsnaBtWSGHUN3g9c>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id CAFE7108005F;
        Tue, 12 Jan 2021 02:15:55 -0500 (EST)
Subject: Re: [PATCH v4 4/4] doc/zh_CN: add mips ingenic-tcu.rst translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Zhou Yanjie <zhouyanjie@zoho.com>
References: <20210108100221.1370763-1-siyanteng@loongson.cn>
 <20210108100221.1370763-4-siyanteng@loongson.cn>
 <6b6dd58a-0f59-c8c3-2a7a-8ee7c866a970@flygoat.com>
 <CAEensMxVwEzPZaGS9vUunieMJQYj3jGBA9oPn62WCW2hoTS5Ww@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <66520b7e-e911-20b9-dd72-29ff337434d8@flygoat.com>
Date:   Tue, 12 Jan 2021 15:15:51 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <CAEensMxVwEzPZaGS9vUunieMJQYj3jGBA9oPn62WCW2hoTS5Ww@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

在 2021/1/9 上午9:49, yanteng si 写道:
> I think these changes are very good, you will see it in PATCH v5, thank you!
>
> Jiaxun Yang <jiaxun.yang@flygoat.com> 于2021年1月8日周五 下午7:25写道：
>> 在 2021/1/8 下午6:02, Yanteng Si 写道:
[...]
>>> +实现
>>> +====
>>> +
>>> +TCU硬件的功能分布在多个驱动程序：
>>> +
>>> +===========  =====
>>> +时钟         drivers/clk/ingenic/tcu.c
>>> +中断         drivers/irqchip/irq-ingenic-tcu.c
>>> +定时器       drivers/clocksource/ingenic-timer.c
>>> +OST          drivers/clocksource/ingenic-ost.c
>> 晶振？

To correct myself, the OST refers to "Operating System Timer".
So maybe "系统定时器" or just leave it as is.

Thanks.

- Jiaxun.

[...]
