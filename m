Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BB7C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 04:42:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5F9D06109D
	for <linux-doc@archiver.kernel.org>; Tue, 13 Apr 2021 04:42:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230035AbhDMEnC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Apr 2021 00:43:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43352 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230011AbhDMEnC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 13 Apr 2021 00:43:02 -0400
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com [IPv6:2607:f8b0:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9F265C061574
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 21:42:43 -0700 (PDT)
Received: by mail-pf1-x42b.google.com with SMTP id n38so10646030pfv.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Apr 2021 21:42:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=MunXM15myvOJc9BrmIXx2BtkeVuxfUmlYtPt5X92bm4=;
        b=WKHXUtU4gf7vzVf+zxR53/h4TJHmLm76nyQbhqRxg83749UlFneO+GC0ZozxOQcP4w
         stcuUokzRlBR19MPyXCaCJyZIHeZX7o30bXGMvtNjP7/Z7hnLL3rekZfTGKTm3oPx2bY
         kJD89Bb0ljsWbf6+96sJr5spQ01SJNHOitefMBZSQSUONlGC+5XKTawzdlTG8jhV/7+q
         EXlxR7Aj+NR5cdLfFV7qo3UovOX/nLOgGT7BmVz5vm5i84ozDkO41Y2F1+dV5daTDzt9
         f463cfjbNX781JnN9oEQ8QFyMwlNeY76bTCT6bEQGiSOer8iZ8+XEZioKqyQtzsg2pH9
         WHsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=MunXM15myvOJc9BrmIXx2BtkeVuxfUmlYtPt5X92bm4=;
        b=RN4TxBn/+d7enflobXTumCYIFBYFFaOYIGmQjWy3oSdllX+wMir4wUgS3nIyxUSyzJ
         25n5ExYYd57wLMM/EXQLt2aM1rcM+tLS5RvV2JoSu2WeWuUrf9oKbbZ+8KOISiMdHgjH
         sq7XHPw5nme2iQbek87OSGBEmkQHKfTNwqRHcIHzcRswVfCltKjdutHc17Qht12ZYFJ+
         gSKhnxuEMOTLoNmwtSkDw849X1N2Idzpqp9fx1kd7xdm0GseTt6IOQhRwP9fr8AZ9CGz
         xxvl70Vq2Ti7uavrJFt1BXEn6VucLBG6ayb36uXxfmFjh6/ueZg8QCMzboEr4LAq+I/O
         pndA==
X-Gm-Message-State: AOAM531XRfdaUt1znHimdU03jDfhaQQD2mwBXAfkRyv+6nJ7k0KpvK8d
        UjZvMmxpNbOIy97Yw0VS1rAU4u8Acm/Org==
X-Google-Smtp-Source: ABdhPJx4VpJvCKDdhVZMVLtwmChXtqxIt/HOdOjUVPsjPzFQzC773hg85YnbbScwhTXEXAH5OeKuSw==
X-Received: by 2002:a62:6202:0:b029:208:f11c:2143 with SMTP id w2-20020a6262020000b0290208f11c2143mr28199498pfb.32.1618288962894;
        Mon, 12 Apr 2021 21:42:42 -0700 (PDT)
Received: from [192.168.2.225] (93.179.119.173.16clouds.com. [93.179.119.173])
        by smtp.gmail.com with ESMTPSA id z10sm5224880pfe.218.2021.04.12.21.42.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Apr 2021 21:42:42 -0700 (PDT)
Subject: Re: [PATCH v3 1/8] docs/zh_CN: Add translation
 zh_CN/doc-guide/sphinx.rst
To:     Wu XiangCheng <bobwxc@email.cn>, Alex Shi <alexs@kernel.org>
Cc:     Alex Shi <alex.shi@linux.alibaba.com>,
        Jonathan Corbet <corbet@lwn.net>,
        YanTeng Si <sterlingteng@gmail.com>, linux-doc@vger.kernel.org
References: <cover.1617699755.git.bobwxc@email.cn>
 <7c0d782b2d3e2f8e04fbe2393b00b99f2eead304.1617699755.git.bobwxc@email.cn>
From:   Alex Shi <seakeel@gmail.com>
Message-ID: <9b354b27-4ff0-fc16-7566-a7da690d4e34@gmail.com>
Date:   Tue, 13 Apr 2021 12:42:38 +0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <7c0d782b2d3e2f8e04fbe2393b00b99f2eead304.1617699755.git.bobwxc@email.cn>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 2021/4/7 下午3:50, Wu XiangCheng wrote:
> +:译者: 吴想成 Wu XiangCheng <bobwxc@email.cn>
> +
> +.. _sphinxdoc_zh:
> +
> +简介
> +============

all the '=' or '-' or '~' sign number are equal to the title
chars in original doc. we'd better keep this rule. btw, the
Chinese chars take 2 English char width that's need 2 signs.

Thanks
Alex 
