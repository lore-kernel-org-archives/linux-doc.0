Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E1D1C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 05:31:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiJUFbn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 01:31:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60250 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229585AbiJUFbm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 01:31:42 -0400
Received: from out0.migadu.com (out0.migadu.com [94.23.1.103])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B35320C985
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 22:31:41 -0700 (PDT)
Date:   Fri, 21 Oct 2022 13:31:29 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1666330299;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=pGeieoBS858G/QX5zwh20dzGFKCb1LvfkkbE2tjPJEY=;
        b=X6VwYc6ZCc69dZNDWcqkv7wIeeE5b4U0F3ovOTYyiNfayd0JJ7GdM+itK+d+LRTTDK+L9j
        fKOtWnAqDhvownyTWajMUJZYc4mWUyCNigPGdEYeJGlfPWo8ud7avWyycf8UqUk6Wzw8kv
        CovVWGdlTuptZtvXG81a9jCImwvWzl0=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Yanteng Si <siyanteng@loongson.cn>,
        Wu XiangCheng <bobwxc@email.cn>,
        Huacai Chen <chenhuacai@loongson.cn>, linux-doc@vger.kernel.org
Subject: Re: [PATCH RESEND V2 2/3] docs/zh_CN: core-api: Add timekeeping
 Chinese translation
Message-ID: <Y1IusUbbgmmRVHeF@bobwxc.mipc>
References: <cover.1666171735.git.zhoubinbin@loongson.cn>
 <8d15ff60aaadd53065b3bc2da7d53a520cf01c53.1666171735.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8d15ff60aaadd53065b3bc2da7d53a520cf01c53.1666171735.git.zhoubinbin@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-10-21 (五) 09:58:08 +0800 Binbin Zhou 曰：
> Translate core-api/timekeeping.rst into Chinese.
> 
> Last English version used:
> 
> commit 3dc6ffae2da2 ("timekeeping: Introduce fast accessor to clock tai").
> 
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Short note for Jon:
	Due to email system problem, this series looks a little messy.
	But I have tested it with b4, still works well.
	$ b4 am cover.1666171735.git.zhoubinbin@loongson.cn
	Got the three patches correctly.

> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/timekeeping.rst            | 177 ++++++++++++++++++
>  2 files changed, 178 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/timekeeping.rst

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

