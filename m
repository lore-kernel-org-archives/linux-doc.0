Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D174EC00144
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jul 2022 02:16:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236260AbiG0CQr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 26 Jul 2022 22:16:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232903AbiG0CQq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jul 2022 22:16:46 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094513C17E
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:16:44 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id y141so14830731pfb.7
        for <linux-doc@vger.kernel.org>; Tue, 26 Jul 2022 19:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=08G4jXQ2MzaklCuaFte8+9hZN2svcFqWpRAJsbddWFQ=;
        b=Pj8lTPns4rJhWvLFrvFoJ4NPniSB5ZxbRzn2VqQC6FQLJPkvDpTU6HQeHMpVmoG9WE
         ZjVnP9EU455i3zPTqAhNhq8XOxmqLbj8TI5bAnKlHgF2RYEDttMEBXp+AGTw5F9HJuUm
         4khPzZ9Y/XcG4vk6stEuEXwsof9cbNr+3mNWzueEk9YH0VMusu7xmt4N4FRHRo7Oq8Fe
         8uItQ/MqpmllCcNSulOF4wiZbh2DBMg9kTzl3nJtP09FMjOW3iOCG1t+1cB1iRUmHgO5
         qbCctLBS4Y+gS5bU7XEjcwqnv2QEAcke54M35LyV+u1RqSLlozIXCeNK6a5XJgI4d9/k
         AmvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=08G4jXQ2MzaklCuaFte8+9hZN2svcFqWpRAJsbddWFQ=;
        b=yzLOY6iCGHuhMTMzkmYtBU1poq74+zX+/oly1SoqkYYChQdr+z9CqDONZmDu9mNs04
         4u8OvayIsd53QH8IXYb1IKHoRMDARozjcp4ckV1Uk1Sww3nTbohyrmOhy+2ILlQupfpl
         P1sk35SiglG4J4tW5nXn5yLe+iCjnavmUmkTsoNLhTDZJrbmxQzE8g+5N/4ek/BHIIs4
         ZdtPpydTHb2U4OMCd95NuTdAQxiCtQyaXue8xROqwAUJdfDgLLAYIWveHOkjDQaC8dG1
         7OhdoEoTYzjbXqWM0snR722uc/vmaDsO2lHhOAsDOW/xiku3B9kXqez3rscJFlhNUpK3
         4XxQ==
X-Gm-Message-State: AJIora/8C7LMB+ZN25ApXAtuaQikxjOlQo9xpotcvNhsYsfTzL3lr6RP
        u6XGKhbpUXndbJOibY6LFLA=
X-Google-Smtp-Source: AGRyM1sM1S4rSCsl9KHxhj1aPDrFMBRszRLUclpUEpS4T6l9MupjEQip+6OEyVQTpLwIeHzB0ITpog==
X-Received: by 2002:a63:e80e:0:b0:419:d02c:fc8b with SMTP id s14-20020a63e80e000000b00419d02cfc8bmr16655218pgh.385.1658888203513;
        Tue, 26 Jul 2022 19:16:43 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id oj16-20020a17090b4d9000b001f291c9d3bdsm282367pjb.48.2022.07.26.19.16.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jul 2022 19:16:42 -0700 (PDT)
Message-ID: <a0e3dfea-dbdf-2bcc-0421-1721c6dda0d0@gmail.com>
Date:   Wed, 27 Jul 2022 10:16:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH 3/8] Docs/zh_CN: Update the translation of sparse to
 5.19-rc8
Content-Language: en-US
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn
Cc:     corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        zhoubinbin@loongson.cn, yizhou.tang@shopee.com,
        wanjiabing@vivo.com, leoyang.li@nxp.com, src.res@email.cn
References: <cover.1658740151.git.siyanteng@loongson.cn>
 <4019a3a01f63f6486cae1708d699d48edfd4c793.1658740151.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
In-Reply-To: <4019a3a01f63f6486cae1708d699d48edfd4c793.1658740151.git.siyanteng@loongson.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Reviewed-by: Alex Shi <alexs@kernel.org>

On 7/25/22 17:20, Yanteng Si wrote:
> Update to commit179fd6ba3bac ("Documentation/sparse:
>  add hints about __CHECKER__")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/dev-tools/sparse.rst | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/translations/zh_CN/dev-tools/sparse.rst b/Documentation/translations/zh_CN/dev-tools/sparse.rst
> index 556282437aad..0664c634bc4f 100644
> --- a/Documentation/translations/zh_CN/dev-tools/sparse.rst
> +++ b/Documentation/translations/zh_CN/dev-tools/sparse.rst
> @@ -106,3 +106,5 @@ __releases  - 指定的锁在函数进入时被持有，但在退出时不被持
>  
>  make 的可选变量 CHECKFLAGS 可以用来向 sparse 工具传递参数。编译系统会自
>  动向 sparse 工具传递 -Wbitwise 参数。
> +
> +注意sparse定义了__CHECKER__预处理器符号。
> \ No newline at end of file
