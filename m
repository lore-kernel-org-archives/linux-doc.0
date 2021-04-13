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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91AA4C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 04:51:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4953F613A9
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 04:51:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230156AbhDMEwP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 00:52:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230110AbhDMEwP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 00:52:15 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 377C3C061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 21:51:56 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id j6-20020a17090adc86b02900cbfe6f2c96so8354754pjv.1
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 21:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=GecWF6FYvQMBXwaZtUBfb641Juv9Qlm00tNxYSpkvMw=;
        b=cN65D23aOuCr6KLdMqPwXdUWk4e4uaUvCTEMOFZMVZsKaogI7qTqg8D+ZLOQhGWjwO
         QERe5N7UFAV9bc9kHOPMF7yYpsVgPddJBcc8stTYA5dGw6sr0RgtlJAvJz32poKj7SO3
         17Eq78NL1tsVPY7ei9UM2WnbLK2TzFq5O2ZlEKbGq2aM4UvqAPxdom2YNEdOfIGonzAu
         sR7VRK1WDDHTyjFXS8y9ET/zqqanqPbjSsQJ7UR+v75bjMREOX/7AeNrD5uIfIQh26wG
         PmzGir/xDionqN0DjAxsjkrfjqHRz9ZRUtpFR1HR55NbkeVmtJrifxddf3VLi0tcNXLp
         YPKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=GecWF6FYvQMBXwaZtUBfb641Juv9Qlm00tNxYSpkvMw=;
        b=JZDL0NZDYaTwe+XWZs9EjNIa1RhJ7d2y7WpeTd81Al/L4Y43Zi2a2zrcGe5LxcYYE7
         NPMsGvwZGKMyoGEaFNuVhyuITGKePnhkJCWdjGDnLX6/gGOWlAW9YbnDM08EW/RBXBkm
         nsLxAesrDDwxUEul2Tp6mB8159qLDF/OR9cVRQ/H7trUNYzVcjcV1/nRXZn5PEGlJPNm
         i6CRuRvpB/coVMNCAA2p6Mw/K0+rKUpxOetg9xR4PAteTpMtKXIL3dLX0MATWMoV2Df/
         zESmP9wOTKyPkU9tlI7kCHQHJV5gqsKCdoi6dzPtwlmizvr11bEciu9ebu16PckXtZWi
         UkTA==
X-Gm-Message-State: AOAM531pJe5Br7lkHsdWzCmKcmJbJtOTJTm5nu/dAUE9boga5ECfKDPc
        XMx/BQ/Sp68NGp0l1kaaY63MrEOFIZOh8Q==
X-Google-Smtp-Source: ABdhPJx23o1JNbFSLoFozQYjxbLOXvl7Hwxg6jFlG85o+lrAWck2b7NA8DH4rS/aQUM+o2CflMogew==
X-Received: by 2002:a17:90b:4a4e:: with SMTP id lb14mr2809032pjb.155.1618289515557;
        Mon, 12 Apr 2021 21:51:55 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id mj13sm572842pjb.9.2021.04.12.21.51.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 21:51:55 -0700 (PDT)
Subject: Re: [PATCH v3 2/8] docs/zh_CN: Add two image example files
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1617699755.git.bobwxc@email.cn>
 <26826d7401a12a82ced72936c74c698b2875fe93.1617699755.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <c0fb15ba-0433-3d6c-385f-3b5e9d6461a7@gmail.com>
Date:   Tue, 13 Apr 2021 12:51:52 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <26826d7401a12a82ced72936c74c698b2875fe93.1617699755.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/7 下午3:50, Wu XiangCheng wrote:
> Add two image exaple files used by zh_CN/doc-guide/sphinx.rst
>   Documentation/translations/zh_CN/doc-guide/hello.dot
>   Documentation/translations/zh_CN/doc-guide/svg_image.svg
> 

Could we just use/reference to original docs? Looks there no much
meaningful to have Chinese version of them. Also we may save new
translations if original doc changed.

Thanks
Alex

> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  Documentation/translations/zh_CN/doc-guide/hello.dot   |  3 +++
>  .../translations/zh_CN/doc-guide/svg_image.svg         | 10 ++++++++++
>  2 files changed, 13 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/hello.dot
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/svg_image.svg
> 
> diff --git a/Documentation/translations/zh_CN/doc-guide/hello.dot b/Documentation/translations/zh_CN/doc-guide/hello.dot
> new file mode 100644
> index 000000000000..2740ad882e6a
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/hello.dot
> @@ -0,0 +1,3 @@
> +graph G {
> +      你好 -- 世界
> +}
> diff --git a/Documentation/translations/zh_CN/doc-guide/svg_image.svg b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
> new file mode 100644
> index 000000000000..5405f85b8137
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/svg_image.svg
> @@ -0,0 +1,10 @@
> +<?xml version="1.0" encoding="UTF-8"?>
> +<!-- originate: https://commons.wikimedia.org/wiki/File:Variable_Resistor.svg -->
> +<svg xmlns="http://www.w3.org/2000/svg"
> +	version="1.1" baseProfile="full"
> +	width="70px" height="40px" viewBox="0 0 700 400">
> +	<line x1="0" y1="200" x2="700" y2="200" stroke="black" stroke-width="20px"/>
> +	<rect x="100" y="100" width="500" height="200" fill="white" stroke="black" stroke-width="20px"/>
> +	<line x1="180" y1="370" x2="500" y2="50" stroke="black" stroke-width="15px"/>
> +	<polygon points="585 0 525 25 585 50" transform="rotate(135 525 25)"/>
> +</svg>
> 
