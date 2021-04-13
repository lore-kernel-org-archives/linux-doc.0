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
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EF0FC433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:03:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E0FEF613AB
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 05:03:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbhDMFDz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 01:03:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229515AbhDMFDy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 01:03:54 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD3CEC061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 22:03:35 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id p16so3601720plf.12
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 22:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Sa9pP5SyeGfdWRx4CzKs2aV8lTMoOWjZQzstA8eOCys=;
        b=bboqkXlR1lGiD1kQWd3/h/vUjpgMx0uyNoONANX5EpdBnJ3aytNlbbUBmlxPSu7UIB
         yT4AZQPbzyBzPr7J19EnoGF6JUY6sjaVUuzwfX++56gZAGKtuboEoksaGAUBDGel1JcB
         XF6dVCp5Y5BdKX6F+mPpLVnBRpDyEOqFkP9utGhRZaXhhPg07SbrDwl+UPUSFFtV7Oqs
         Ci9qJauJKyUzpFCm5u+UYaoTkoNpeGZNIzkUkQCtapqhb0Gf3UJwi9MW4dFaVLl6BdJ1
         l85KmVrfJ8x8eVXlyN3oUUuWJwB4YJp+7cPCLzk/zBvYmzi6+mQ2HR4mivYsbSMltUro
         AZNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Sa9pP5SyeGfdWRx4CzKs2aV8lTMoOWjZQzstA8eOCys=;
        b=EU+ZLHwLhWKbke7Jq9Cj1a6mh4tuGKmNYvp0jFWS/CSYJEqMQxdz2A8WZpO6EvW/8K
         cBKh7U5HkUV8RVWqhyewssx21fTj79j2/qukLmPN3Qunx6Fk6vGiYK56X4rd+XmRbRER
         bkV1647fHzRcYhGOPETMM9BV98XbR/DwImxsC3tf490irhM3PWO9QaftmY6UCjYviumx
         VAfB9cpGdiHW1osb35FQ1oE++pjNgCxjknAjKdTNmCHlT1lqHmWiW3H6lL8ryp0X4V8r
         m6mNbAE1xhqfHLI5VZuVoysimIAQdYFxxi1EsIErFwTZYLL++XMdTmyyZJzawxS4qIvx
         9c8A==
X-Gm-Message-State: AOAM532TM3YZQEdVH5DlqBYbR7XgqF4WaZq7b0DnNEJFIAY6sEGPERWy
        BNCNu4cMAAk9rPkf4nK1KL55UOysAlB5xw==
X-Google-Smtp-Source: ABdhPJylM+jX6O3wSHQ3RLQ+5LaRGh/RFkc0Ubvknf924dfMjF4KpzXyWNgujoKndoEa+knQ3Xvvjw==
X-Received: by 2002:a17:902:8604:b029:e6:60ad:6921 with SMTP id f4-20020a1709028604b02900e660ad6921mr30687944plo.15.1618290214782;
        Mon, 12 Apr 2021 22:03:34 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id q25sm573742pfh.83.2021.04.12.22.03.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 22:03:34 -0700 (PDT)
Subject: Re: [PATCH v3 4/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/parse-headers.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1617699755.git.bobwxc@email.cn>
 <ebccf009f3cf77b3340e39e9675f26d8d75ca3f6.1617699755.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <0d7e7e1d-eb35-e4b5-3e40-879c33fdb70c@gmail.com>
Date:   Tue, 13 Apr 2021 13:03:30 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <ebccf009f3cf77b3340e39e9675f26d8d75ca3f6.1617699755.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/7 下午3:51, Wu XiangCheng wrote:
> Add new translation
>   Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> 
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>  .../zh_CN/doc-guide/parse-headers.rst         | 182 ++++++++++++++++++
>  1 file changed, 182 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> 
> diff --git a/Documentation/translations/zh_CN/doc-guide/parse-headers.rst b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> new file mode 100644
> index 000000000000..4f6fa083a3c5
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/doc-guide/parse-headers.rst
> @@ -0,0 +1,182 @@
> +.. SPDX-License-Identifier: GPL-2.0

forget a line here?
:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>

:)

> +
> +===========================
> +包含用户空间API头文件
> +===========================
> +
> +有时，为了描述用户空间API并在代码和文档之间生成交叉引用，需要包含头文件和示例
> +C代码。为用户空间API文件添加交叉引用还有一个好处：如果在文档中找不到相应符号，
> +Sphinx将生成警告。这有助于保持用户空间API文档与内核更改同步。
> +:ref:`parse_headers.pl <parse_headers_zh>` 提供了生成此类交叉引用的一种方法。
> +在构建文档时，必须通过Makefile调用它。有关如何在内核树中使用它的示例，请参阅
> +``Documentation/userspace-api/media/Makefile`` 。
> +
> +.. _parse_headers_zh:
> +
> +parse_headers.pl
> +-----------------
> +
> +脚本名称
> +~~~~~~~~~
> +
> +
> +parse_headers.pl——解析一个C文件，识别函数、结构体、枚举、定义并对Sphinx文档
> +创建交叉引用。
> +
> +
> +用法概要
> +~~~~~~~~~
> +
> +
> +\ **parse_headers.pl**\  [<选项>] <C文件> <输出文件> [<例外文件>]
> +
> +<选项> 可以是： --debug, --help 或 --usage 。
> +
> +
> +选项
> +~~~~~
> +
> +
> +
> +\ **--debug**\
> +
> + 开启脚本详细模式，在调试时很有用。
> +
> +
> +\ **--usage**\
> +
> + 打印简短的帮助信息并退出。
> +
> +
> +
> +\ **--help**\
> +
> + 打印更详细的帮助信息并退出。
> +
> +
> +说明
> +~~~~~
> +
> +
> +通过描述API的文档中的有交叉引用的解析后文本块，将C头文件或源文件（<C文件>）
> +转换进ReStructureText。它接受一个可选的<例外文件>，其中描述了哪些元素将被忽略
> +或指向非默认引用。
> +
> +输出被写入到<输出文件>。
> +
> +它能够识别定义、函数、结构体、typedef、枚举和枚举符号，并为它们创建交叉引用。
> +它还能够区分用于指定Linux ioctl的 ``#define`` 。
> +
> +<例外文件> 包含两种类型的语句： \ **ignore**\  或 \ **replace**\ .
> +
> +ignore标记的语法为：
> +
> +
> +ignore \ **type**\  \ **name**\
> +
> +The \ **ignore**\  意味着它不会为类型为 \ **type**\ 的 \ **name**\ 符号生成
> +交叉引用。
> +
> +
> +replace标记的语法为：
> +
> +
> +replace \ **type**\  \ **name**\  \ **new_value**\
> +
> +The \ **replace**\  味着它将为 \ **type**\ 类型的 \ **name**\ 符号生成交叉引
> +用，但是它将使用 \ **new_value**\ 来取代默认的替换规则。
> +
> +
> +这两种语句中， \ **type**\ 可以是以下任一项：
> +
> +
> +\ **ioctl**\
> +
> + ignore 或 replace 语句应用于ioctl定义，如：
> +
> + #define	VIDIOC_DBG_S_REGISTER 	 _IOW('V', 79, struct v4l2_dbg_register)
> +
> +
> +
> +\ **define**\
> +
> + ignore 或 replace 语句应用于在<C文件>中找到的任何其他 ``#define`` 。
> +
> +
> +
> +\ **typedef**\
> +
> + ignore 和 replace 语句应用于<C文件>中的typedef语句。
> +
> +
> +
> +\ **struct**\
> +
> + ignore 和 replace 语句应用于<C文件>中的结构体名称语句。
> +
> +
> +
> +\ **enum**\
> +
> + ignore 和 replace 语句应用于<C文件>中的枚举名称语句。
> +
> +
> +
> +\ **symbol**\
> +
> + ignore 和 replace 语句应用于<C文件>中的枚举值名称语句。
> +
> + replace语句中， \ **new_value**\  会自动使用 \ **typedef**\ , \ **enum**\
> + 和 \ **struct**\ 类型的 :c:type: 引用；以及 \ **ioctl**\ , \ **define**\  和
> + \ **symbol**\ 类型的  :ref: 。引用的类型也可以在replace语句中显式定义。
> +
> +
> +示例
> +~~~~~
> +
> +
> +ignore define _VIDEODEV2_H
> +
> +
> +忽略<C文件>中的 #define _VIDEODEV2_H 。
> +
> +ignore symbol PRIVATE
> +
> +
> +如下结构体：
> +
> +enum foo { BAR1, BAR2, PRIVATE };
> +
> +不会为 \ **PRIVATE**\ 生成交叉引用。
> +
> +replace symbol BAR1 :c:type:\`foo\`
> +replace symbol BAR2 :c:type:\`foo\`
> +
> +
> +如下结构体：
> +
> +enum foo { BAR1, BAR2, PRIVATE };
> +
> +它会让BAR1和BAR2枚举符号交叉引用C域中的foo符号。
> +
> +
> +
> +缺陷
> +~~~~~
> +
> +
> +请向Mauro Carvalho Chehab <mchehab@kernel.org>报告有关缺陷。
> +
> +中文翻译问题请找中文翻译维护者。

中文翻译问题请找译者。 ?

Thanks
alex

> +
> +
> +版权
> +~~~~~
> +
> +
> +版权所有 (c) 2016 Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
> +
> +许可证 GPLv2：GNU GPL version 2 <https://gnu.org/licenses/gpl.html>
> +
> +这是自由软件：你可以自由地修改和重新发布它。
> +在法律允许的范围内，**没有任何保证**。
> 
