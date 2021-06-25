Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAD1C2B9F4
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 05:04:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C4FF56141D
	for <linux-doc@archiver.kernel.org>; Fri, 25 Jun 2021 05:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230173AbhFYFHA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Jun 2021 01:07:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230139AbhFYFG7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Jun 2021 01:06:59 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE1D0C061574
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 22:04:38 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id p4-20020a17090a9304b029016f3020d867so4832975pjo.3
        for <linux-doc@vger.kernel.org>; Thu, 24 Jun 2021 22:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=sRWtm3lVw/PonY56r55HZevy/tAJsBAAZ09qqgiQZmA=;
        b=tYACRf64XW8z12m3Rcu0/CdkkQYOUZ6ecPi5b2zd6tevjez/uVX+mSrnEfHYWViLnv
         sgEbOtxErl394somw5+yMSEKN/lYQhyD2Wnn77VRxys1RaB0bLhKW/DuPj0bbQA/Kdbl
         P0YIhs3Kl6q+GhwYK2lPxSSe5mwv+XTGM02xr/AnQV51TJq4PyLnExHfP+yerTFXtn8A
         ZHwv5Z9McAjgPAARuLTDivMRcfUmKOxE51LJtL0u657tJuV+/GtHL6liVo5h/EwIkBNu
         ivydUPnoVlUtaYlsqv1/FOPEJkv07+onuIXp6n7RSuzsDYYdBZ6VDl3xhgGp1VekcYFb
         nWJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=sRWtm3lVw/PonY56r55HZevy/tAJsBAAZ09qqgiQZmA=;
        b=r0PRA5l8e24h9V4OcqMn5XLoXFxTxvfZ6K44GFdHQ7GdCq2j4yK9u3JE1GJj7Rk8B4
         yyF3kVCGlv6ztumnXBL/oZoF9GTXLwtmowGBgCh8S+DiAip32u+S51vHpfXzPfbfpo6P
         N+G7I/YxayejHq4ID8O7WojL/a6UeejzITZqtPUKU6GYID5bsuHJ72u/ezUGFL9Y1P5Z
         Kc8zWBsnGktDMIkt3veRKg8t5xhVZ5tL9u4WiB0Vp2cI9LErWcDeKTiD/Ax0kAgrDZN8
         1+P+NPpvXfdu1PvpcvUokTwShIC5SaRQnBuK94rvKF8adoj4KSCHwUovhjSOI4mHkwsh
         p7Uw==
X-Gm-Message-State: AOAM53398f8c6kEEfkDvWMsuO0Sxy47nrXxP+M2+vcZ7T6Vg5zYcIsh+
        27G+/8cxbKd0JipNiXgcwnI=
X-Google-Smtp-Source: ABdhPJxQA8fWmLUKf70pPW+TTq49Uw9cqcr8vB7JEXP9tn6k9mwTa6P9zgJBdEhmUcF8sLOxAKOkhA==
X-Received: by 2002:a17:90b:4a90:: with SMTP id lp16mr9127339pjb.137.1624597478474;
        Thu, 24 Jun 2021 22:04:38 -0700 (PDT)
Received: from [172.28.99.179] ([119.28.155.243])
        by smtp.gmail.com with ESMTPSA id s4sm3999403pju.17.2021.06.24.22.04.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Jun 2021 22:04:38 -0700 (PDT)
Subject: Re: [PATCH v4 2/2] docs/zh_CN: add core api protection keys
 translation
To:     Yanteng Si <siyanteng@loongson.cn>, corbet@lwn.net,
        alexs@kernel.org, bobwxc@email.cn
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
References: <cover.1624517569.git.siyanteng@loongson.cn>
 <08eb8c44573add030015b1abb182dde21f8f45d6.1624517569.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <9470c024-b5b2-2063-6e22-08f7dc15bf30@gmail.com>
Date:   Fri, 25 Jun 2021 13:04:31 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <08eb8c44573add030015b1abb182dde21f8f45d6.1624517569.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 6/24/21 3:30 PM, Yanteng Si wrote:
> Translate Documentation/core-api/protection-keys.rst into Chinese.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>
