Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-19.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89914C4338F
	for <linux-doc@archiver.kernel.org>; Sun, 15 Aug 2021 13:47:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5C31C60FC3
	for <linux-doc@archiver.kernel.org>; Sun, 15 Aug 2021 13:47:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232412AbhHONs1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 15 Aug 2021 09:48:27 -0400
Received: from wout1-smtp.messagingengine.com ([64.147.123.24]:41211 "EHLO
        wout1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231881AbhHONs1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 15 Aug 2021 09:48:27 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.west.internal (Postfix) with ESMTP id 5252432008FC;
        Sun, 15 Aug 2021 09:47:56 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 15 Aug 2021 09:47:56 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=l
        OoP47DOxjh5EQu7wwx1ZFntK116Wsm7ppuC+Z1iRbo=; b=fyHzIYbBI15Hj2lyx
        hfQiO9BBGt3cb/2BbDfUZNsQEpQene86uw17UhmtAicJkjgu150nCnCUtgTiGPWC
        +RU9Gs1LvYxekuvCBDVBRzbZswuT9dUouyZEMUJCil1y/dow+uw/UktlMseHPoLQ
        qRz6IjsWWbev8Rz0QMt4PkwO0deskYtbk4PG+zzMU2Ol1DADirtK8LGcBpUebH3O
        rnUif2OzJ63ZPOhpZIfRWEPsHHPUJp1isjJdYyOTlLivIcCRk6Gj0/ESS4kZZnTX
        droCv4Siec2QuozABErPFWro+pwg0YbhBtSe5O2jARFX3vp9rOfxysjuMwFQHOfe
        3O/yg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=lOoP47DOxjh5EQu7wwx1ZFntK116Wsm7ppuC+Z1iR
        bo=; b=BbGIBebYSmvz7NQ8d1Go3VA5lrZ2IZl6CmS/a/3+zQAPvkGywcpHGcHrP
        LKfHvT+0+pMGSNtvYYw1qW/Tv0tgFb9NcoI9WzHz/bQziZtVDtcWcwP0YTWuCIKU
        0iAGkYanvSJmK9rARBLwPpikp3E1u2FHBgbyeBz2C5HZVPSdVNgvOvOjSxIAti4X
        8C4ez7W8OJrf/1pjHAFxW+FbyK4rD5L/zhdsTO6VTJ+1Ty1mTrE4h39wpqTrIRKB
        LD9Td2Sm1WOMgL33LdfUMimQCgm21xm6CAQV3BLdgbcOWzgJBxYIGnU6q6UqsK56
        MVZSfgthqOXG3EVaixsuqvtcbHeqQ==
X-ME-Sender: <xms:ChsZYYng2mhAplAsHJx8Tb8n3fkhMqfHgDpDL3CwAggig5S_D2AEVQ>
    <xme:ChsZYX3MLl-TB4DBTCSXmUGpEMDiNDies6wVGJpFYG16HV1TqLvvbwLYifWDWdWeH
    JgsIeifBtdNtufNYSU>
X-ME-Received: <xmr:ChsZYWq3QXOWyla47Dycl0aSw5xIuvYCbdnCipkrgAT6hkNaJR4IRUqVpDAH-TC6bv4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvtddrkeelgdeikecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepjhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:ChsZYUnAX2SfuIRqWf8Z4uqnN1HigoYxiyLPz7C97A7aB9cPseCSoQ>
    <xmx:ChsZYW05FpH5P8R83JqCR-WtStSmxJ0cImY37VClArZguytLBq1LLA>
    <xmx:ChsZYbv9cLWIz4iN9dZmCRsjB73IQjgMQG_jcweKy8XjSYO4F-BkMg>
    <xmx:CxsZYflviAOWCBbgkLQvLFB1JPv8tnkhlpE9mZ-V61sAbwgnCxR5fw>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 15 Aug 2021 09:47:50 -0400 (EDT)
Subject: Re: [PATCH v2 5/6] docs/zh_CN: add core-api boot-time-mm translation
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Wu XiangCheng <bobwxc@email.cn>, Alex Shi <seakeel@gmail.com>,
        Huacai Chen <chenhuacai@kernel.org>, linux-doc@vger.kernel.org,
        Puyu Wang <realpuyuwang@gmail.com>
References: <cover.1625795862.git.siyanteng@loongson.cn>
 <223f4142aff4eba5ba7e4442cce77dd87591cc3a.1625795862.git.siyanteng@loongson.cn>
 <d67612cc-e396-25dd-bcc6-1129db8cf08d@flygoat.com>
 <CAEensMzF2F0za7QoYiv8MwpaVLRzptWcHzs4yUigsGNQSVbiJQ@mail.gmail.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <e9661eaf-b06d-174d-1d07-6e026d95b0c9@flygoat.com>
Date:   Sun, 15 Aug 2021 21:47:46 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <CAEensMzF2F0za7QoYiv8MwpaVLRzptWcHzs4yUigsGNQSVbiJQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


在 2021/8/15 14:16, yanteng si 写道:
> Jiaxun Yang <jiaxun.yang@flygoat.com> 于2021年8月11日周三 下午8:24写道：
>>
>> 在 2021/7/9 10:57, Yanteng Si 写道:
>>> Translate Documentation/core-api/boot-time-mm.rst into Chinese.
>>>
>>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
>>> Reviewed-by: Alex Shi <alexs@kernel.org>
>>> ---
>>>    .../zh_CN/core-api/boot-time-mm.rst           | 49 +++++++++++++++++++
>>>    .../translations/zh_CN/core-api/index.rst     |  2 +-
>>>    2 files changed, 50 insertions(+), 1 deletion(-)
>>>    create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-mm.rst
>>>
>>> diff --git a/Documentation/translations/zh_CN/core-api/boot-time-mm.rst b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
>>> new file mode 100644
>>> index 000000000000..ba20dfed1017
>>> --- /dev/null
>>> +++ b/Documentation/translations/zh_CN/core-api/boot-time-mm.rst
>>> @@ -0,0 +1,49 @@
>>> +.. include:: ../disclaimer-zh_CN.rst
>>> +
>>> +:Original: Documentation/core-api/boot-time-mm.rst
>>> +
>>> +:翻译:
>>> +
>>> + 司延腾 Yanteng Si <siyanteng@loongson.cn>
>>> +
>>> +:校译:
>>> +
>>> + 时奎亮<alexs@kernel.org>
>>> +
>>> +.. _cn_core-api_boot-time-mm:
>>> +
>>> +================
>>> +启动时的内存管理
>>> +================
>>> +
>>> +系统初始化早期不能使用“正常”的内存管理，只是因为它还没有被设置好。但是仍
>>> +然需要为各种数据结构分配内存，例如为物理页分配器分配内存。
>> 系统初始化早期“正常”的内存管理由于没有设置完毕无法使用。但是内核仍然需要为各种数据结构分配内存，例如物理页分配器。
> OK!
>>
>>> +
>>> +一个叫做 ``memblock`` 的专用分配器执行启动时的内存管理。特定架构的初始化
>>> +必须在setup_arch()中设置它，并在mem_init()函数中移除它。
>>> +
>>> +一旦早期的内存管理可用，它就为内存分配提供了各种函数和宏。分配请求可以指向
>>> +第一个（也可能是唯一的）节点或NUMA系统中的某个特定节点。有一些API变体在分
>>> +配失败时panic，也有一些不panic的。
>> ^ 不会panic。
> OK!
>>> +
>>> +Memblock还提供了各种控制其自身行为的API。
>>> +
>>> +Memblock概述
>>> +============
>>> +
>>> +该API在以下内核代码中:
>>> +
>>> +mm/memblock.c
>>> +
>>> +
>>> +函数和结构体
>>> +============
>>> +
>>> +下面是关于memblock数据结构、函数和宏的描述。其中一些实际上是内部（内联函数注释）
>>> +的，但由于它们被记录下来，漏掉它们是很愚蠢的。此外，阅读内部函数的注释可以帮助理
>>> +解引擎盖下真正发生的事情。
>> I think internal here means not facing memblock users, 内联函数注释 seems
>> wired.
> OK! remove （内联函数注释）
>
> But I still think it means comments in the code.  :-)

This doesn't make sense to me. If you consist I'd sugguest just drop ().

Thanks

- Jiaxun

>
> how about  "(在代码中的)"？
>
> Thanks,
>
> Yanteng
