Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C084C433ED
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:45:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 54A1F6124C
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350401AbhERSqU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 14:46:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234553AbhERSqT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 14:46:19 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3824FC061573;
        Tue, 18 May 2021 11:45:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:
        Subject:Sender:Reply-To:Content-ID:Content-Description;
        bh=ua0bE7OgkNw1FIpTpThZwhG6pubkRRk1Slp87fusRz4=; b=NA3SzPmkCO8a0bdGHc2cEGZ7jT
        g21gdb52o1mWEPmWGzwWH/4FP/b2jYHiwW81fIxjPV6eLv+4tNhe752KcwExznsPzcJ7k+8r8neRp
        Qlvlk+w9izwa2OIz6xee92GXAmAqQ+7N5hGEGbzEMa8glx4M8YujcdUhbGsllcb+Kor6vL/cjU51I
        QqvX8E8azMbsC1QXvk4C4Q69XlCAL3QXigm32EayYUNhe5+pmMQIIgj9FbDuKACsQcjJinBXiQxmy
        VAOkUPTxXZhAhZg+XlSg4Oui/Wf0u9NSOFNp8u4gsW/l+VR8b05N3LaZaSLILCxuY5GxNcZJ+WE99
        gFOJZGIw==;
Received: from [2601:1c0:6280:3f0::7376]
        by bombadil.infradead.org with esmtpsa (Exim 4.94 #2 (Red Hat Linux))
        id 1lj4iA-00EtEI-3B; Tue, 18 May 2021 18:44:58 +0000
Subject: Re: [PATCH] irqchip/irq-omap-intc: fix kernel-doc syntax in file
 header
To:     Aditya Srivastava <yashsri421@gmail.com>,
        linux-kernel@vger.kernel.org
Cc:     lukas.bulwahn@gmail.com,
        linux-kernel-mentees@lists.linuxfoundation.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        grandmaster@al2klimov.de, keescook@chromium.org
References: <20210518182310.14461-1-yashsri421@gmail.com>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <3a5390fb-a9fb-e0da-e923-b2459d403d33@infradead.org>
Date:   Tue, 18 May 2021 11:44:57 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210518182310.14461-1-yashsri421@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 5/18/21 11:23 AM, Aditya Srivastava wrote:
> 
> Provide a simple fix by replacing this occurrence with general comment
> format, i.e. '/*', to prevent kernel-doc from parsing it.
> 
> Signed-off-by: Aditya Srivastava <yashsri421@gmail.com>
> ---
>  include/linux/irqchip/irq-omap-intc.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

-- 
~Randy

