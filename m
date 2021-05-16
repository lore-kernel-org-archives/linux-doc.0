Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5094C433B4
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 03:33:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7520F61151
	for <linux-doc@archiver.kernel.org>; Sun, 16 May 2021 03:33:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232122AbhEPDeN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 15 May 2021 23:34:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58984 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229983AbhEPDeN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 15 May 2021 23:34:13 -0400
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com [IPv6:2607:f8b0:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55C42C061573
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 20:32:59 -0700 (PDT)
Received: by mail-pg1-x530.google.com with SMTP id t30so2337365pgl.8
        for <linux-doc@vger.kernel.org>; Sat, 15 May 2021 20:32:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=rM9iaTbPJ5vmVgx3RNO/XlcTegwDbpOA5MxfqnTRLw8=;
        b=MNKQbQDHEuO1MmqRgtr8YIEbWKdVI8co1MfsvBpa/Vb2GbTVTQqQThY8RtCLi3VJlu
         +rhX02/y+DyCKWVlj30loKruoWIxVSmo56VvvfyroPe/KNDQYYdnBdnD6G+bQCdLgreG
         XLzvmoiLj2FjPOQuYbtBdALp1MdYQJsLWWQDdlilUCvDTan2ubHYi5VErAIxAnpdMtIz
         70LA9/gO1yWJAV3JhKmfrWeqkQbQRkynjumpODyDpUORqDUIhLrIlQLkwOF0Sb/vmunK
         h0SBKYknYEeiVRCKN2b7DkLjqnNrTBMo3ClDwOkodA6lUJc9fjcZrjAenKN1HaHy2B9b
         Ml2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=rM9iaTbPJ5vmVgx3RNO/XlcTegwDbpOA5MxfqnTRLw8=;
        b=Wha6WnPB6JA/jqNBDA0uUShb/SlgRC6uv7Pg09aNddSVe1fpFxbB7ko/dAu9AmocHr
         NYAGh5SFGbDuuhEvCKGYJBzg+wcqxx5YdSPX/Cc/hKx8os+DJKGxypl1bFAnwjd7eHWZ
         f3CO/zyJNhRVEQUvuEPBRPpF7GsoOzDRMdV37l9BFp0SIvCNmXMrrac1T4bbw9+J8LnC
         RXDewMRaj2ApDGaY7o9YaFIDRYiyQdWcuJ1XLes3fW6BsyodGvxGbwMNI5OXbF8DIgxc
         zijfZJIDjsjnsvs2uj0h8Enkc8SbhpNrBB1RthzEuiNobD7/FKANXFlC4tZqLCXs3WUa
         4nCw==
X-Gm-Message-State: AOAM532F+DLd0n4ac1gVlxKnAXbZ9AwcfDc9mIBf4i5t7nR64Dnv+kCX
        8XZ9w6hVCgTXL5p+vdpKAVo=
X-Google-Smtp-Source: ABdhPJxgqvdj9FmZRccgN9qJR67YZl/h81iZwDMsbALI7k+8EzZixjCyXdph9s7pDmr0J6aPjHSrIQ==
X-Received: by 2002:a63:3c56:: with SMTP id i22mr54867164pgn.25.1621135978977;
        Sat, 15 May 2021 20:32:58 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id b12sm3517633pgs.52.2021.05.15.20.32.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 15 May 2021 20:32:58 -0700 (PDT)
Subject: Re: [PATCH v4] docs/zh_CN: add core-api workqueue.rst translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com
References: <20210515082406.2473543-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <dab014b9-ec11-dc12-30f7-1b43a852b296@gmail.com>
Date:   Sun, 16 May 2021 11:32:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210515082406.2473543-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/5/15 下午4:24, Yanteng Si wrote:
> +
> +内核内联文档参考
> +================
> +
> +check the functions in include/linux/workqueue.h in kernel source code.
> +
> +check the functions in kernel/workqueue.c in kernel source code.

Better to combine above 2 lines and use Chinese to introduce them?

Thanks
Alex
