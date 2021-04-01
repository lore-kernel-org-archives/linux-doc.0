Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE621C433ED
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 09:58:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7C2C9610CA
	for <linux-doc@archiver.kernel.org>; Thu,  1 Apr 2021 09:58:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233616AbhDAJ6H (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 1 Apr 2021 05:58:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233736AbhDAJ57 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 1 Apr 2021 05:57:59 -0400
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com [IPv6:2607:f8b0:4864:20::1034])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0D0DAC0613E6
        for <linux-doc@vger.kernel.org>; Thu,  1 Apr 2021 02:57:59 -0700 (PDT)
Received: by mail-pj1-x1034.google.com with SMTP id gb6so902726pjb.0
        for <linux-doc@vger.kernel.org>; Thu, 01 Apr 2021 02:57:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=RFGlNVKgaLKR7sIVL9m2l+nAr8BgS+6SahEqv86zsz0=;
        b=he0ufgFAdFfUy8uVJltbxJ0D1a51hCHNZYbZ6MqxWde5yTC5dt6C/fwlvQfr8EPxtS
         b24ed/xPLJNbQ+DAhk3BT7Ang+hT1K+BHZHEs1D3sYQO2JiEHSsqk619G53Rft+ata0m
         VTfLSQwtTZ+WeqdMaucTJwo7A7czugzPIUUxf/ScQnpDM4vxWJb40LAhotMpthMIaTZ9
         z35DbWLUbfNL+8q4dIFSWuJzBK/YnmriYvrn5UzaGDp973evc+pBRn9W2aTmFsqHxvc8
         Se36Bcf1pbZubzj3yD749mwZfvCUFfCCWfJl80b8TaF8u90Zwoby4NM+EwM0DtqizFRE
         yaeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=RFGlNVKgaLKR7sIVL9m2l+nAr8BgS+6SahEqv86zsz0=;
        b=ZVAi2w3KMh2kOeJfUVRF4Wd1b3/000Wug+YSAUPz7VfAiyIb/NutsOueWiOIPIcWlo
         r0GYVk2Yz4ePxaA87HnYHXFwBKlxL+kzDLbrC13GgllWc+9qwq/DARfZFJGzcVu3baTC
         cPOhGYbIyLjQTeYEtcw0+ie2Z3EFidgJnGq2ArWKxloqRXGuYhHEZjm496bA3c+5yVSU
         O5JeKceR5vjVXa7VQDYV6ZRnpbyHEZC8hvs4S8cssdQzSrJw58u1wC1PTcd5YF+U5fCT
         eSI02/BOZfme5mJD8tU2xkppFUtmeA17pXsyyg29XDUw3+mtbIGA0pghbBNVa1Jaqagi
         mBBw==
X-Gm-Message-State: AOAM531t7tCZRrzCRpeef7svhml0M4p2uIPJffmhPdHM53xlniZxjAbf
        8zwtQPeIdg3FFTkSZbfH8uNBR16x7IO+ZA==
X-Google-Smtp-Source: ABdhPJwcH+2X7D0HOyjiUpwaVKx9A4xNrg+yKZkslle1NoRebxihLjKW0JHcE/lUXBLlTHpWbx/zBw==
X-Received: by 2002:a17:90b:92:: with SMTP id bb18mr7795381pjb.40.1617271078383;
        Thu, 01 Apr 2021 02:57:58 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id 77sm1251846pgf.55.2021.04.01.02.57.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 01 Apr 2021 02:57:58 -0700 (PDT)
Subject: Re: [PATCH 0/5] docs/zh_CN: Add translations in zh_CN/doc-guide/
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
References: <cover.1617260163.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <62f16e84-d583-5cfd-8fb5-19217eccd19e@gmail.com>
Date:   Thu, 1 Apr 2021 17:57:54 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <cover.1617260163.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Cc Yanteng Si <siyanteng@loongson.cn>

On 2021/4/1 下午3:05, Wu XiangCheng wrote:
> Hi all,
> 
> This set of patches add some translations in zh_CN/doc-guide/
> 
> Thanks!
> 
> base: next tree
>   commit 3501c960dfda ("docs/zh_CN: Add translations in zh_CN/kernel-hacking/")
> 
> Wu XiangCheng (5):
>   docs/zh_CN: Add translation zh_CN/doc-guide/index.rst
>   docs/zh_CN: Link zh_CN/doc-guide to zh_CN/index.rst
>   docs/zh_CN: Add translation zh_CN/doc-guide/sphinx.rst
>   docs/zh_CN: Add two image example files
>   docs/zh_CN: Add translation zh_CN/doc-guide/kernel-doc.rst
> 
>  .../translations/zh_CN/doc-guide/hello.dot    |   3 +
>  .../translations/zh_CN/doc-guide/index.rst    |  30 ++
>  .../zh_CN/doc-guide/kernel-doc.rst            | 497 ++++++++++++++++++
>  .../translations/zh_CN/doc-guide/sphinx.rst   | 415 +++++++++++++++
>  .../zh_CN/doc-guide/svg_image.svg             |  10 +
>  Documentation/translations/zh_CN/index.rst    |   1 +
>  6 files changed, 956 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/index.rst
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/kernel-doc.rst
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/sphinx.rst
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg
> 
