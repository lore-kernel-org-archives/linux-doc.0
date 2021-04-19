Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 756C9C433B4
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 12:45:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4CE37611CE
	for <linux-doc@archiver.kernel.org>; Mon, 19 Apr 2021 12:45:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230211AbhDSMpl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Apr 2021 08:45:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230231AbhDSMpl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Apr 2021 08:45:41 -0400
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com [IPv6:2607:f8b0:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 99ED7C06174A
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 05:45:11 -0700 (PDT)
Received: by mail-pg1-x529.google.com with SMTP id f29so24162666pgm.8
        for <linux-doc@vger.kernel.org>; Mon, 19 Apr 2021 05:45:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kZHe/ltaDB+/rAxlkGBFZ+WBR84jn6zx7Vq6R6BiqnQ=;
        b=t+rSb9RRy7ltaEalSHbhFelPPxKUiauiUbRLyUCXLpoNIh5JA5unYQ8j6bnb1kSInT
         6m2A0zOOpAwjQMO4AqnuPkBP6ZMlZf1P97VxZ2c4TUhIFxxTdAtE9BvGzDTu0d2vLCJN
         3hDu9QPIivPRELuGSMkRHh2vFv1JDrFZOvSEyclJYUdMFUa9pmhw8PJKJB/++E3sqoik
         gecOoZ5ubzm6BNQB4VXjjpCWr88EgjTWBHkwdy1GlT+jAFgq00uyqamqrBwxgsTduKJe
         yNtW6p9JbfId1c01FtgbcL5Y9SGrpxjCYFUsisSdjPBqTjChFX7ZF1J1M4P844y+2Kku
         4oBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=kZHe/ltaDB+/rAxlkGBFZ+WBR84jn6zx7Vq6R6BiqnQ=;
        b=dNqnPrcdVU3Fxphzn3eEE+oHft06M6oSmgbm7tKLoqHn5ckg/CGAx4x4UUzR2wtyAj
         D4vZtuvrGDgrt6Hhqxak/E6AWHXNOmlDE9x2zvSjBOWZqOttFr8MC/xywK1rPmDdw/rm
         nmFiDlY3UDftPGTesfZyzsq0pLuzNgR2y10rvKOXRvxBJO5bgiPjJVD74pZpdHO37jtc
         aumcNSqludFwYIz2Yei167y8tD485Xj4t3CagQXxipK2JqA2B/UB+5o85qmsA7qBtufa
         4qoHqjn/sqHGTEab3U0zSwVlVg6b4DAJ9Lxx9uH5WtbfwLfmSDO6aeARXSegS35WyXNJ
         ga9w==
X-Gm-Message-State: AOAM531WQd0IylMcgsvfBs8nmnWtAyGiEvHOvYPXwpzWRI9i13l5D2gw
        xUgkyjVZYsrOv0uynIXfUls=
X-Google-Smtp-Source: ABdhPJwE/Hz25WFcdbHxL+tPyTibVr1TvPS8ovB8lY+IzCjjeBybM0UusJG+I8H27VgJ5pAq16xYdA==
X-Received: by 2002:aa7:85d7:0:b029:25d:2b00:2c6c with SMTP id z23-20020aa785d70000b029025d2b002c6cmr8912017pfn.3.1618836311132;
        Mon, 19 Apr 2021 05:45:11 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id s22sm7379879pgk.28.2021.04.19.05.45.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Apr 2021 05:45:10 -0700 (PDT)
Subject: Re: [PATCH v6 11/11] docs/zh_CN: add openrisc translation to zh_CN
 index
To:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Alex Shi <alexs@kernel.org>, Alex Shi <alex.shi@linux.alibaba.com>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        Harry Wei <harryxiyou@gmail.com>, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        Wu XiangCheng <bobwxc@email.cn>
References: <20210416032917.2772471-1-siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <8b673807-4713-f226-3c63-ae7d81463fcf@gmail.com>
Date:   Mon, 19 Apr 2021 20:45:03 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210416032917.2772471-1-siyanteng@loongson.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Next time, it's good to fold this patch into the patch set, not a separated one.

Thanks
Alex
On 2021/4/16 上午11:29, Yanteng Si wrote:
> This patch add zh_CN/openrisc to zh_CN/index.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/index.rst | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/translations/zh_CN/index.rst b/Documentation/translations/zh_CN/index.rst
> index 8bb15ee2cf6d..f86fd7d31035 100644
> --- a/Documentation/translations/zh_CN/index.rst
> +++ b/Documentation/translations/zh_CN/index.rst
> @@ -28,6 +28,7 @@
>     iio/index
>     riscv/index
>     core-api/index
> +   openrisc/index
>  
>  目录和表格
>  ----------
> 
