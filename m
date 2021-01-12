Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8A62C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 12:17:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76A422310A
	for <linux-doc@archiver.kernel.org>; Tue, 12 Jan 2021 12:17:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732938AbhALMQy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Jan 2021 07:16:54 -0500
Received: from new4-smtp.messagingengine.com ([66.111.4.230]:55329 "EHLO
        new4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1732880AbhALMQy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Jan 2021 07:16:54 -0500
Received: from compute6.internal (compute6.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id B2363580811;
        Tue, 12 Jan 2021 07:16:08 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 12 Jan 2021 07:16:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm1; bh=P
        l+sQRxcdfwP/Fld1vlNfoBZIrtoZmjlXIO7CyoXDxU=; b=guLC8BF0Bxw3m6XH2
        FRIyL7fclEUXX1PdrGKZ+wALEEhlOt8999DvoOacO2U7W2kjEK2IqeDBYGNqn2Ai
        MtcyvPRe5+51wF6DSwhn4pzdkKLKfe6W/KgdkD5w6xVEmmDsEdqkZ4byinb1WjNA
        s1OAJte1sfc02fglwFXxydFtfW8ECF4K6tnWXxHD3aziA+iV7OI3xl3taWP1huSB
        ro5d3F4t/3JQp3npOKV3aKHW4a2D4QbjdSQuIKRNy57fPgCZtFnc0DzC0Q6kqqQP
        HCvfZ94GSZJIdqhaoI0gLBVii1VQdl600wUVdg7rEBu5v2n5WI7l1GHcYHIZN6i9
        D0MvA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Pl+sQRxcdfwP/Fld1vlNfoBZIrtoZmjlXIO7CyoXD
        xU=; b=NpLOfPiYVUzponPR7ecAH559W/ZBmJbLi+QXjnEZzBMqHuBWgjlB9sosU
        8VnVaOAsfMVoAJJnRQ9XD7s5hiChDsJAtAw1Ak04TVwP6IO4HpF3NCSeyDjfBzsb
        jjfIrlap3irz02z0VI3L8Zu6HrDpgUvJEcBCxNoq1Tq2ZEdeWbADYg7iCKhm031K
        d4L8vO2ZjRivRhERSLlwN3WuXA5p7gke1PNgPBve4oiBqMaThh3uW/Xv5CjbbP4n
        RL1QZkO2WWaOMvTRJMicaWp2/jo04oib7jF+8qPoE2PKrhVCZTq+7tFEGE2rdhxN
        pIgDPJ+mkIPBTUjqoWH4UP6ctyNmQ==
X-ME-Sender: <xms:BpP9X7NF1Mn1foiD-2lTHCQdbGJrrwvQ8mEzJ8vqGyyZ2o3ASzDy8w>
    <xme:BpP9X1-b-mjhXXpXzCC8lPRi6kJG8el0uIXLeGEGZFGW92eny5KNupgatq212qIPi
    Jgx8lM54a_mnn1dgwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedukedrtddtgddthecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefuvfhfhffkffgfgggjtgfgsehtkeertddtfeejnecuhfhrohhmpeflihgrgihu
    nhcujggrnhhguceojhhirgiguhhnrdihrghnghesfhhlhihgohgrthdrtghomheqnecugg
    ftrfgrthhtvghrnhepiefhgffhieekudegjeevgfffveegveegheffhfduieeiffffveff
    ueegveefgfefnecukfhppeeghedrfeefrdehtddrvdehgeenucevlhhushhtvghrufhiii
    gvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehjihgrgihunhdrhigrnhhgsehflhih
    ghhorghtrdgtohhm
X-ME-Proxy: <xmx:BpP9X6TZP29UqeP9qAR8e5MDDIxY8IHSQ9Q1ZkYBn1hDOP189IV-Hg>
    <xmx:BpP9X_tuzNvDSUyiPTq37hqogAY586iLCLtFV4BcVgbFm2_h1HJj3w>
    <xmx:BpP9XzeHaHd-xSUNevNR4NZBsWxvtNJzNOMmu2p0eol0xV5brH08sQ>
    <xmx:B5P9X65X8H-VFcUESNuAzyZ8AIqWxgEU9FeJdoxSp_tAJ2jnrN_uBg>
Received: from [0.0.0.0] (li1000-254.members.linode.com [45.33.50.254])
        by mail.messagingengine.com (Postfix) with ESMTPA id B5FB7240062;
        Tue, 12 Jan 2021 07:16:01 -0500 (EST)
Subject: Re: [PATCH v6 1/4] doc/zh_CN: add mips index.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Harry Wei <harryxiyou@gmail.com>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Yanteng Si <siyanteng01@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Huacai Chen <chenhuacai@gmail.com>
References: <20210112115259.217944-1-siyanteng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <1c835149-0d95-1b2b-89c2-02f05d51cdc7@flygoat.com>
Date:   Tue, 12 Jan 2021 20:15:57 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20210112115259.217944-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

在 2021/1/12 下午7:52, Yanteng Si 写道:
> This patch translates Documentation/mips/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Alex Shi <alex.shi@linux.alibaba.com>

Hi Yanteng,

Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Thanks for your l10n works!

Btw: As you have sent v6, it should be v7 instead.
Also it is common practice to include a short changelog between revisions
to help others reviewing your patches easier.
You may include it in cover letter or comment section of commit message.

Thanks

- Jiaxun

[...]
