Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9ADF7C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 11:40:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 73E8261177
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 11:40:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbhEPLln (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 07:41:43 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:33383 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231135AbhEPLlm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 07:41:42 -0400
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.nyi.internal (Postfix) with ESMTP id CCBC85C021B;
        Sun, 16 May 2021 07:40:27 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Sun, 16 May 2021 07:40:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=n
        IjmgEyfIaJmJjkF/dLvwtf2X8jXZWhk0dCRY9Xp3sM=; b=DjQN4P8vuuM6h5B+U
        Gd1sS2s05fR9qFY+BMWK2jkGXvhUEA7/WnWRHcDUS4RBzLyUpsKGSG87u6hNW+Gj
        FQlt7KaQRklS4hGsfqarVTKd3rH28NZfpVfcKxu+/kEgBsxRRgg8EpzdVN/Qalp1
        4gJorATI1kDIZa5rJDliIcgLEyCRcFh3IXFqchN0uDhzIdb2MY/sGVhZio23aYa8
        WyW52n/19jkEZRkXXt8C0wSVaoImaaKhtbeqfcNkFPoL+pMqQTeU1esbYK01Z7im
        e6KFkyqoOf9KV0QyessfApo1imA+YUgbhLKhjkrKDl2ltReTbssb4pGjlipQMMok
        T4x8w==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=nIjmgEyfIaJmJjkF/dLvwtf2X8jXZWhk0dCRY9Xp3
        sM=; b=nCMllb3SLny/o6i4qv8SCpUGoH8Oz5aKoDU+LSXdb/B7deSRzbudStTpV
        wKzanB2i/39Sf3mV7HGBdNmH7ylUMqWUFUf96/p3olUneHsc/no94cCYW6hE0o0X
        g/JCbk7TpunmHZ+aY+zcMLO1SBt/FIb1hHdsbNU7eTSUvVN6+aRBR+Cga6QI/Cr3
        ubTmWbGAJ/jcb0KNQfy4yOB8OjHy28Lcv7zZdDwbPHN1W4o5Z5tmZG+S403dyCYy
        /ZHP5QKMPkxX4dN+oEi6vAOeAquOpbE++8iIiwSv2BYvnNXlKPAsxx1Jo1XNzBIw
        SZM2YP0/V8KHVMNjRd9dMeCaNG9iA==
X-ME-Sender: <xms:qgShYFvn7wu1z8tGtR2csfOjQ-Sc4hRGYpQ-kf0WCbJw0-ye2ujkVQ>
    <xme:qgShYOdf2xjudkdh7J8ni6Jf62-s0gVpLIYWdrIvvkuXT3OG4b2E9YzkHKKmwo-G8
    8MF7cAEhMznxGBQuOY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeifedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepiedtrddukeeirddvvdejrddukeehnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:qgShYIy35V9w3XdnQ9aCPp6pfNBVE8M_XkBuJbnW8lV8KCvsJp3H-w>
    <xmx:qgShYMNaqhmbcFoc716T7YGrFJyYOPOIl86BKdhgTqh0cHeDPT-f4Q>
    <xmx:qgShYF-bG_3RnE825YKvbwc7pfgwKVSvKqNOjGQxpPHjdubxHoTR_w>
    <xmx:qwShYFzZYYjjb0mbG5_GQJmQVGWTD3peKVesxTP2CPDNfj34rK4-dw>
Received: from [192.168.14.19] (unknown [60.186.227.185])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Sun, 16 May 2021 07:40:23 -0400 (EDT)
Subject: Re: [PATCH v6 3/3] docs/zh_CN: add core-api printk-formats.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
References: <cover.1621062577.git.siyanteng@loongson.cn>
 <ff5bfdf71ffbb248a7eca480bb7028fb7f30c083.1621062577.git.siyanteng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <ceb73924-868b-8ee8-b46a-84d39da74e10@flygoat.com>
Date:   Sun, 16 May 2021 19:40:21 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <ff5bfdf71ffbb248a7eca480bb7028fb7f30c083.1621062577.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/5/15 16:10, Yanteng Si 写道:
> This patch translates Documentation/core-api/printk-formats.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Jiaxun Yang <jaixun.yang@flygoat.com>

Thanks.

- Jiaxun
> ---
>
