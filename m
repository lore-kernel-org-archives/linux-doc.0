Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3D264C07E99
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 13:17:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B9666141C
	for <linux-doc@archiver.kernel.org>; Mon,  5 Jul 2021 13:17:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231183AbhGENUU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jul 2021 09:20:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhGENUU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jul 2021 09:20:20 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 56F1CC061574
        for <linux-doc@vger.kernel.org>; Mon,  5 Jul 2021 06:17:42 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id n11so11727093pjo.1
        for <linux-doc@vger.kernel.org>; Mon, 05 Jul 2021 06:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=CA4lKBLIfCnHeeLSMChbNVL6bUEjGUTAYtJBq/ykWSA=;
        b=tihtwCagp1/AG89GrBQiRoN6PuWEShojkxNyTLRKkbdb8IUR36BVMQsY+yyy7F0UcX
         CLkWfnrzjWqzL5NFberWYkaciwZama18SVw+IFmt97vT0QH8foWx/ntuX7u4QlOBtX6P
         wy536QUWQPOiROVpN/zEToTd0AtBq7R4XQ1PqIwC9iiSpne8RF/orkUdE4mJ/dHWJ7QZ
         9MQqtNbIxdoYaZQTVGavng6M40PZWJ5dWR8FEIQZKkGPfzppqvJvMPgi2F+gFj/Jsqzk
         +cBrNe9pR3RAhNqGOcBmG8ZDzOcyshvnQ5+GVMsJKh0p0a0L3nZ2Ci5EUpJ9TBFYIa8X
         EeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=CA4lKBLIfCnHeeLSMChbNVL6bUEjGUTAYtJBq/ykWSA=;
        b=AQRbpPzeSxTaoDr/QOjMi45jjzPCfySOZZ6e8zcaUxa8g2yqtkAK8c/edwJnwuhCaM
         zXgf5kyQ1l4zz8hgCXiOcUTeCcnJcycmElgPP4IFw/3acom+hVYNDrU6OE+T6aA9w+l/
         cFRtSNtJfuMfxLppB++fLheL7KDTQ9M0MkuBT6vHbhJAiNFw7RibwpilWYEPuOQ60mKR
         BMokRdW4mldvWxUKpwdWbk9wpE8AqgJe52mMG7KPFpI7dN/HWdgwCVIjFkK4PPuZCpe/
         5lho6jhGC1KNy+21HkHwEAtp1afrd7NOpNrUdAsnTDwtc+pl5NLApBWrvZsFROQplLSU
         rs5w==
X-Gm-Message-State: AOAM532s2LXYljFlFKB+HZv3BZWrSNeDAL6gIfUEwKCvyzjCoEblfYWP
        yVh94cjXdf0dbZH1synU1FU=
X-Google-Smtp-Source: ABdhPJybe5suxgZdHQfcdv+QyPz4gBH/OT06SlysOTq6oS7kMYwn+OwMOhyrWePTHa4lFPSRnjYWHQ==
X-Received: by 2002:a17:90a:de89:: with SMTP id n9mr15310445pjv.221.1625491061880;
        Mon, 05 Jul 2021 06:17:41 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id e21sm3450603pge.64.2021.07.05.06.17.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jul 2021 06:17:41 -0700 (PDT)
Subject: Re: [PATCH 2/6] docs/zh_CN: add core-api unaligned-memory-access
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
References: <cover.1625048200.git.siyanteng@loongson.cn>
 <a2cbbe2eb022b41943008825ebf18858c50636e9.1625048200.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <a148801f-4a2b-24ff-e6b3-ca2171127e83@gmail.com>
Date:   Mon, 5 Jul 2021 21:17:35 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <a2cbbe2eb022b41943008825ebf18858c50636e9.1625048200.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/30/21 6:23 PM, Yanteng Si wrote:
> 上所述，你可能遇到非对齐访问问题的两种主要情况包括:
> +
> + 1. 将变量定义不同长度的类型
> + 2. 指针算术后可访问至少2个字节的数据

指针运算后访问至少2个字节的数据?


Thanks
Alex
> +
