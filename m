Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 36940C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 07:14:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0149722CBE
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 07:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388813AbhALHOF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 02:14:05 -0500
Received: from wnew4-smtp.messagingengine.com ([64.147.123.18]:44427 "EHLO
        wnew4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726790AbhALHOF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 02:14:05 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.west.internal (Postfix) with ESMTP id 17E2F1E2B;
        Tue, 12 Jan 2021 02:13:19 -0500 (EST)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Tue, 12 Jan 2021 02:13:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=T
        YBMdLlGb/DdcPyLPDQZUD+xMpfNMPNvQ0GfLizG1zs=; b=Mv+SVcMlwzDecYaxe
        HvKRIwF91pDZJT7Z1h1wpkI8ndFUdPmH16SorRpwHcXiUwjsemTOKLYQxyiPGrUO
        jZacvbsuXgmIOZl+mXYUC44JMOJAmC46xH3PMxNrtxZlJSd/4GY2u13s8rJqpU9Q
        0UVEwsD/47kpNLIk3EdGYdJ8GU/kczKC6qwZzMTGQ3A8MEx8PhT0cwK7Yl+LBbkY
        lAJJJVlqXspPaRlrAXeICRGdlbkLihf1DVyI5HUCKw6xXUAkgAHsl/VDU7mevpiA
        poy+dMcz4489iJpJQKx06KfhLC181XuyunhjKhuqNRTKSSmTEh0rkvu4rVsSWYf6
        noYkw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=TYBMdLlGb/DdcPyLPDQZUD+xMpfNMPNvQ0GfLizG1
        zs=; b=ZerqAe835VSktdqSLrLbRzcjYZn74FgcwT5BgPTs4H5TZ8gQkGWe/X+uU
        DdBLaLQvm7kXO2UWwJ7GIGuOvIwwLINpEQDPgjpwTIV3hZheQxVPfZaucdMK3gel
        36RwDUpQIpMEbcXF6s/fKzSns7HVGxxNfygN4Gfare0yL+DK2GZl1JlfM09FBn+A
        KRkGjjtaEkcYBWeBqls8MhiciDGPSY0QbtSuGdxxJTxItaZvzuIBeCra3PDlnvmJ
        PYu4HNWSXo9mSrWGFs9juodJorw8c/Hm14PBNDDwUvepTh2SM2MJjdzPQKgpBREm
        9rvCXXe83VJLN+MywKkTXkLJRn0Tg==
X-ME-Sender: <xms:DUz9X4stlgnWjCiFmFbr68Q9Vl7Kk-ALBUd5KBWlU-v4wz_Cxmh4pA>
    <xme:DUz9X1di9s9KJ2pAaeRaxUGgP_zFq1AbAEejfyo4LnSttFwKaJR-SLjGvpejLe6VJ
    rIqyO-X5-u1ulUjAEQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedujedrvdehvddguddthecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfgh
    necuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmd
    enucfjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgr
    gihunhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqne
    cuggftrfgrthhtvghrnhepffeileekieeitdffvdeujeekjeefleejhffgfeekleeggfdu
    jeetueeuhedtgeffnecuffhomhgrihhnpehgihhthhhusgdrtghomhdpkhgvrhhnvghlnh
    gvfigsihgvshdrohhrghdpkhgvrhhnvghlrdhorhhgnecukfhppeeghedrfeefrdehtddr
    vdehgeenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhm
X-ME-Proxy: <xmx:DUz9Xzxh1vmi-MrpKpWuSkat_F6mEx_SAVEl5GrwVRG1PjeX093Jzw>
    <xmx:DUz9X7O61uuseT_JForpfR_T5XRCHlaLwNokVCKlM1MPgEXmeswEzA>
    <xmx:DUz9X48UcumfViXJelaoPoFJvblrb7YV11wLm_eQ3f475wp_n3s9OA>
    <xmx:Dkz9X3YOfH9eYFxIlECjT9lRmLBVFOd71ILRZKfSSkKCpgfKChZlSWTUoVM>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id 03702108005B;
        Tue, 12 Jan 2021 02:13:14 -0500 (EST)
Subject: Re: [PATCH v6 1/4] doc/zh_CN: add mips index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>,
        Alex Shi <alex.shi@linux.alibaba.com>,
        Harry Wei <harryxiyou@gmail.com>
References: <20210112041848.11300-1-siyanteng@loongson.cn>
 <b6257e24-75c4-e546-5da7-8182492611df@linux.alibaba.com>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <290e19e1-a08d-76e0-c869-b3817e30da8f@flygoat.com>
Date:   Tue, 12 Jan 2021 15:13:11 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <b6257e24-75c4-e546-5da7-8182492611df@linux.alibaba.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

在 2021/1/12 下午2:24, Alex Shi 写道:
>
> 在 2021/1/12 下午12:18, Yanteng Si 写道:
>> This patch translates Documentation/mips/index.rst into Chinese.
>>
>> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Hi Yanteng,

Welcome to us.

You may try git-publish[1] to make your life easier.

Also I noticed you're top posting when replying us. Please trim your tools
to match our common sense.
Ref: [2], [3]

Thanks.

[1]: https://github.com/stefanha/git-publish
[2]: https://kernelnewbies.org/PatchCulture
[3]: https://people.kernel.org/tglx/

- Jiaxun

> Jonathan asked for one email thread, but you still use 2 threads.
> Would you like to try 'git send-email' for one thread?
>
> And don't forget my reviewed-by here.
>
> Thanks
[...]
