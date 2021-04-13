Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7438CC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:23:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 471A86117A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:23:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243667AbhDMFX1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:23:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52058 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243324AbhDMFX0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 01:23:26 -0400
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com [IPv6:2607:f8b0:4864:20::1036])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F9B0C061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 22:23:07 -0700 (PDT)
Received: by mail-pj1-x1036.google.com with SMTP id t23so7855208pjy.3
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 22:23:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lgpLizWnsLBjChgV/o4F9mWhs4sloF+1QbtHySkN3l0=;
        b=ENXi8AC2MRztd5TUpOikxB6Wp2V759ZvUNrE+6BoO28gBJAeWwNw/RzIAGv2QTiArG
         4FZmttWocnfPqvNjif9BlkgWuSt29YutXOMNX6b2qegDSzF4Rog6OG2XUWoEY1Ug43qa
         c/XcSA3Bp8R1MvyVLE65PASVbal9yZYQ2Bgm7jYhh08O8s0dsVTtGTD5yrdJEFR3Uy+5
         /E5LF3rVgctGYhWF9gUIfNVEpJ7eQOkefMH4ARv30ahVmv64/AKWV1fQnbeafHjjIX4U
         FfFKaiyMI0NYq0vk3kqQDOrWK/GbBMIaoGesOrr6sqjJZxOy9yT35lD0jGPpFZyKMnUL
         rvOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=lgpLizWnsLBjChgV/o4F9mWhs4sloF+1QbtHySkN3l0=;
        b=p7UJEjq0Ld/Nqk13Go81u67nzC4+hjoFWFEluFKBxAXASafBe3ZHmNnpDZzMBj/XOw
         OUTlGFxzhB91VFnYAUBr4/R86SGB80ZVn4gMf+W48AmX04HBZYcItXRULfIFGg0Djn2M
         kvvEGo4+3ck6YLn+M6WOY6dXjoK9Bc02d8qiGSsVaZ5T9vWaonoE/lInSSrsEDzlWd2m
         tmmZwm4PhwYL03TCfJ8/nowhyKLlSwKA8fYhihYM5IbqiuqAk28GiqRUBQyycXlXtija
         6lQQxM4NMZld9xQr54IWApLpGlkSAlbljLlHZen/hvextUgqAR5+FKHOp3Z0k45APnwx
         1MUA==
X-Gm-Message-State: AOAM531j7rXX8MTnPZSBE21HmtNVal56SUuiYfqY/XYoXn0idLZP7FpX
        +skNlUirFX0AX7HNod5yhZ9AbmWP0W4DsQ==
X-Google-Smtp-Source: ABdhPJzoe7G2Gg6g1GwlO7if+x73P7uk91cOp6z2D5Ew0RdWIYA3iD1cB2AIGIr68jI7V87onmKX5Q==
X-Received: by 2002:a17:90a:5b0b:: with SMTP id o11mr2878885pji.150.1618291386853;
        Mon, 12 Apr 2021 22:23:06 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id j30sm13423540pgm.59.2021.04.12.22.23.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 22:23:06 -0700 (PDT)
Subject: Re: [PATCH v2 03/11] docs/zh_CN: add core-api/irq/irq-domain.rst
 translation
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>
References: <20210409091013.2493988-1-siyanteng@loongson.cn>
 <20210409091013.2493988-4-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <01468459-2057-c361-6afc-c0d12efd40c2@gmail.com>
Date:   Tue, 13 Apr 2021 13:23:01 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210409091013.2493988-4-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/9 下午5:10, Yanteng Si wrote:
> +树状映射
> +----------

Ops, please keep the signs number equal to the title char, like
here the '-' should be 8 for 4 Chinese chars, since a Chinese char
takes 2 times width as English char.

And check for all similar signs in your patches.

Thanks
Alex
> +
