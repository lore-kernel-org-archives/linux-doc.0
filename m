Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 479EFC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:02:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CE27613B7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 07:02:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237069AbhDMHDF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 03:03:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236895AbhDMHDE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 03:03:04 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1E83C061574
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 00:02:45 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id t23so7968333pjy.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Apr 2021 00:02:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=EB/UVp7nhSks70GVcqxmmsTxrPUR6VWSrmPAZaQO5iM=;
        b=QWJoRe4WmHTYfgI3EDo57HR4FDDeQD6+Y6N6vE+NCV/ta6K8a2IrmOjK0hA6NRgMqv
         yL2dJHkpHsJunYST6hkfIv8VJAr75n434Ixp2pCV0U9LtCUGyX3qGPt9iAPSEPJZLoXZ
         HbOwPkMx0LQSMg7zWmYdiDim/L/K54ok9XlgnnjJsopr1x3yqAa3ojPD8Djd2whTHl63
         7SMbpQGQemn7ELm6XE0BdCJLB3UHDnH/5bQJsAb8gsc5J8KePppvMUSJBsUMgb9DXmiK
         m6ZQP/JR79ItNm2GinwzEY4ndB3qK7PReI33KSnxd4M4eYZOLef9RPra3ZOj3bzwvoBT
         hPpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=EB/UVp7nhSks70GVcqxmmsTxrPUR6VWSrmPAZaQO5iM=;
        b=aNz2X+TnlbhoBlzwLhyjdiqd0L9dDAae9yf0u/e+Z3NKgT+VAzx0OkkG/fvjK12CcH
         vUPcjc5uugrAiPkaMSAKU+G2465iOOuuXh0z8xwU7DadRaSiQKN1u/yPsdxoOSzcn/xS
         GuiizfYL4ZSZ3G5o/yjo8iAC+h2esTqxIT/L9UKOQw/5rSSvuPj1k02WPyEOiqSsbXL5
         MfV54Pv1bmTDG+n3ORNz0SEhxz4oQpCTeT5KZdkstLtXEtBUVbyRrPwomiG0qdDFrTvO
         djn+Z8WfNa+z7d69uSbTVcgb+Y+FKxe22BkrIwhVORlPL1gU3xDKvGmS/JCzSdySDWrG
         zOjQ==
X-Gm-Message-State: AOAM532VxvH2eqIYA+0lw9WOFWCl0Gi3++xHkIKQ20NKF8L+kzAHD4Bf
        f7mGaSyQPwCee0w/K/aAtyR8Chl8XFnekQ==
X-Google-Smtp-Source: ABdhPJwnUikDKaZf8DDm83LdWXgUqgoB8DbtGhsPb3W0nRU0SztggACzyb0uoOsl5pDOXccCoPnkhg==
X-Received: by 2002:a17:902:da91:b029:e5:cd82:b4c3 with SMTP id j17-20020a170902da91b02900e5cd82b4c3mr29874676plx.73.1618297364408;
        Tue, 13 Apr 2021 00:02:44 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id h8sm1318986pjp.37.2021.04.13.00.02.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Apr 2021 00:02:43 -0700 (PDT)
Subject: Re: [PATCH] docs/zh_CN: sync reporting-issues.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>,
        Thorsten Leemhuis <linux@leemhuis.info>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-doc@vger.kernel.org
References: <20210408135659.GA6747@bobwxc.top>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <9c97944e-7a0c-8777-5be0-133a0f104afd@gmail.com>
Date:   Tue, 13 Apr 2021 15:02:40 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210408135659.GA6747@bobwxc.top>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


Nice work!

On 2021/4/8 下午9:57, Wu XiangCheng wrote:
>  
>  
>  为什么有些问题在报告后没有任何回应或仍未解决？
> @@ -1267,3 +1333,4 @@ FLOSS 问题报告的人看，询问他们的意见。同时征求他们关于
>  向 Linux 内核开发者报告问题是很难的：这个文档的长度和复杂性以及字里行间的内
>  涵都说明了这一点。但目前就是这样了。这篇文字的主要作者希望通过记录现状来为
>  以后改善这种状况打下一些基础。
> +

Do we need a empty line? except this point:
Reviewed-by: Alex Shi <alexs@kernel.org>
