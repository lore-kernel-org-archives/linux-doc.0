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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43070C47080
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 02:52:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1DC3F6128A
	for <linux-doc@archiver.kernel.org>; Tue,  1 Jun 2021 02:52:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232364AbhFACyK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 31 May 2021 22:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232268AbhFACyK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 31 May 2021 22:54:10 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8974EC061574
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 19:52:28 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id 69so6100368plc.5
        for <linux-doc@vger.kernel.org>; Mon, 31 May 2021 19:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=vixFD5H+N+esnKfEKaB5FqaZzXCQN5adn9auSim8buM=;
        b=LiTNLWqaCabTnnr8M/lpyMafIo4C5eqer6ToVuqFjtsvsuETe+ZlEHMAx3v1IS2Ir+
         r1oWtPEEYsZH8xTfRrHTAz7OSstTxrRr9A16aVAlm4Q9EvsAmcBK70sa5MFgb+hR2Ggp
         UdBmNHIfo57pXJNUVoZIHFvzWm6EEy4S/CoijxzRSMTXv7FTMQ+jU8DWxzewUAP+01bY
         qZ6CfZimX0Pfw09lcSmXOtTphMkZbskprvUvcl2vjCO+akIGOOpOqdYVMoDTo9RH3Fv9
         12sG2wE2ziQyPT2r897XwMghPXRZ/+1JOkghhNSl9Iv/Yry8blHsFu6ESGo9PnwbyS/c
         3/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=vixFD5H+N+esnKfEKaB5FqaZzXCQN5adn9auSim8buM=;
        b=LfZFjCc7KcmSCY69Wl/a+x7UtVfUCIPKRL6yj7SBBJ9+3d3u2aYgu0wwF7VCkFsFNB
         plxujZXWLzty7raPzjX/9ICpvhsPxQ4e6cS/QeZ6Qh3XeeIz5l6sgCKwjTo4zS4oDxc6
         JlOOLSapELWboJA6FxwgVgRFvu9wubzNDvaP39xzyzYdZ/6itEO9jrkJifL130rfjo2R
         tWoG3vW7gfcilNdDjDm0Z73e/HHXGp9y86TOTcSz3bxEFe+rIMUU9MpzrcWHWKDSmwSO
         rD+8QBeOFK3IS+TluzjkqDdwdAGB29r9x23eVlmcgOEBW7tftZEoQW5a00QB+ZtUw8wl
         Ar8w==
X-Gm-Message-State: AOAM533Scirl8jHXbGWRdhhm4GFaBvawpWcDsurOQdqxTn0pXsGbd40A
        wq6D6793gDlzdyYL0mijCyY=
X-Google-Smtp-Source: ABdhPJxKjHqYVHeZdbw9jgC15eM9UQhlR90M3ZvocT7ZJEsbf9MEko6e0bw+uSqm1XKtROVNWVsMrQ==
X-Received: by 2002:a17:90b:1b4c:: with SMTP id nv12mr22168705pjb.55.1622515948019;
        Mon, 31 May 2021 19:52:28 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id ev11sm604759pjb.36.2021.05.31.19.52.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 May 2021 19:52:27 -0700 (PDT)
Subject: Re: [PATCH v3] docs/zh_CN:add core-api padata translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com
References: <20210531124105.946859-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <f6b9156e-b8c5-c49c-be55-fd2377b016ba@gmail.com>
Date:   Tue, 1 Jun 2021 10:52:21 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210531124105.946859-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/31 下午8:41, Yanteng Si wrote:
> diff --git a/Documentation/translations/zh_CN/core-api/padata.rst b/Documentation/translations/zh_CN/core-api/padata.rst
> new file mode 100644
> index 000000000000..c627f8f131f9
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/padata.rst
> @@ -0,0 +1,158 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/padata.rst
> +:Translator: Yanteng Si <siyanteng@loongson.cn>
> +
> +.. _cn_core_api_padata.rst:
> +


Also a proofreader is better for credit and responsibility.

Thanks
Alex 
