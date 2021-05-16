Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 70500C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 11:38:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D3DC61177
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 11:38:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232059AbhEPLkJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 16 May 2021 07:40:09 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:52685 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231135AbhEPLkI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 16 May 2021 07:40:08 -0400
Received: from compute4.internal (compute4.nyi.internal [10.202.2.44])
        by mailout.nyi.internal (Postfix) with ESMTP id 6CE815C0218;
        Sun, 16 May 2021 07:38:53 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute4.internal (MEProxy); Sun, 16 May 2021 07:38:53 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=flygoat.com; h=
        subject:to:cc:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=G
        6s8ATXR31BDwqP+ZR0ablesz3kOvV0OKIgtjHIT+LQ=; b=lQKwxPeaVFyfnRl2O
        e3lOE7eUtrn9hJyYlfaMS8w2kwbORFYJlZKODisIzeHBp54mYdr2HggJH8Zns6Vg
        kToYXb2zOvZXyuH121frny5KWsDUDqJl6tbd1XpS+ePPZ7RKL9lzD6XGmZ2gCAVe
        TIxm9IxBPD3qDGvYHPCgC090YeItMQYTKmpFDHbb1iVr70s5rmhDIOXI7xtKBeYp
        nZiyjxY6GNSGa7Ut1RIRZnmNVpvGbhjyS5AusLqIBSTStxsrSVVXe4AkBhbjEsh5
        zdFVz4VWtMLAVG4zYsNpVkuRahPj8CiuLeh0Ubs8oapIJFgCPOuL3O7QaUk23GQP
        e7WGQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm2; bh=G6s8ATXR31BDwqP+ZR0ablesz3kOvV0OKIgtjHIT+
        LQ=; b=pCROl43Es0rtv9bo9yTMtumwhm3n9gUzjPH7OSphkf+kZ7jilfmfBMoe0
        hENTXUJIue0sxjuUirZt6K6ihcFFgyMRNIN7DBQ1a0BXki8c5dHnUOG2IQ+6LnKN
        ckMcCa8CTLJWWhhAaUt95MK48/2FOuhAKDP1dMvXc/Nf+mUWwfWI3aKEmA8kC+Xn
        Z80KndimG6gGzHg8hA82dX0ihnoW0NLrOxYtK+898L6TS1rtIZISqBxZB/dUyFel
        ryQZhiykqeVTq38TuhLV+6D3xoc5VLIHcC/suwvbvDDjT7xka70XcGj8EZWrnvNb
        8KggWo3cAHK01+MCsZLS/78ByPWvQ==
X-ME-Sender: <xms:TQShYNa-fsRcIrLwTYcxBa5QBFYTCYaIHIuyBUKctRm9FPkNL7ARzA>
    <xme:TQShYEahqVKUXDZxGOHkPiCcddJyyDuoKMJdzrhnxqQb7tUheX01i6Z6hpl6znkh6
    U0nVQwz_s0DFehudJQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeduledrvdeifedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepuffvfhfhkffffgggjggtgfesthekredttdefjeenucfhrhhomheplfhirgig
    uhhnucgjrghnghcuoehjihgrgihunhdrhigrnhhgsehflhihghhorghtrdgtohhmqeenuc
    ggtffrrghtthgvrhhnpeeihffghfeikedugeejvefgffevgeevgeehfffhudeiieffffev
    ffeugeevfefgfeenucfkphepiedtrddukeeirddvvdejrddukeehnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhhirgiguhhnrdihrghnghes
    fhhlhihgohgrthdrtghomh
X-ME-Proxy: <xmx:TQShYP_mBvEDqG-zNgMqAnIbXrK6nsGJFEm6YtNX9xU5_FikU-g0gw>
    <xmx:TQShYLrgcC2j0G98FlOy6oMzgq5ImX5pupiVn2j8nFxR_Ia06Iiygw>
    <xmx:TQShYIqPsnYWf0ChnHDaLGUcLLYLJb_NeFxK574TfQrQ81X0i4F3ig>
    <xmx:TQShYJeFEUbPXfqR2a3kWgNZbtnwLsUP5GlXPcm9VFFXojkB11AU4w>
Received: from [192.168.14.19] (unknown [60.186.227.185])
        by mail.messagingengine.com (Postfix) with ESMTPA;
        Sun, 16 May 2021 07:38:49 -0400 (EDT)
Subject: Re: [PATCH v6 2/3] docs/zh_CN: add core-api printk-basics.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, bobwxc@email.cn, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
References: <cover.1621062577.git.siyanteng@loongson.cn>
 <88c52f48d18d6a6c16c6dbb63d9b89ccad6824aa.1621062577.git.siyanteng@loongson.cn>
From:   Jiaxun Yang <jiaxun.yang@flygoat.com>
Message-ID: <2ad36de2-abdd-aaf8-34a1-097437a70f7b@flygoat.com>
Date:   Sun, 16 May 2021 19:38:47 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <88c52f48d18d6a6c16c6dbb63d9b89ccad6824aa.1621062577.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



在 2021/5/15 16:10, Yanteng Si 写道:
> This patch translates Documentation/core-api/printk-basics.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
Reviewed-by: Jiaxun Yang <jiaxun.yang@flygoat.com>

Good job~

- Jiaxun

