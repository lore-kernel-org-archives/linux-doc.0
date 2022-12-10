Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9486C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 11:44:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbiLJLos (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Dec 2022 06:44:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34228 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229634AbiLJLor (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Dec 2022 06:44:47 -0500
X-Greylist: delayed 103714 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 10 Dec 2022 03:44:44 PST
Received: from out-66.mta0.migadu.com (out-66.mta0.migadu.com [91.218.175.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76CAC1AA07
        for <linux-doc@vger.kernel.org>; Sat, 10 Dec 2022 03:44:44 -0800 (PST)
Date:   Sat, 10 Dec 2022 19:44:11 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670672681;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=mTRNybOeAXqp8Wd8cIINndHVCFFZbCDR4glHXEiOj7M=;
        b=hZRMVLcxUu+x+8gf3JKRQSFoe+/qCQV7fAhqaI7n+8tdrFDu52QYjyaMbp+RACMOd9QryE
        M9AyZ3/cEmg1SC10DGNw1teJOmv/7bgHV7GJ0HCMFLinGkYoo7hH8Xr0jipZgDrRNASFF1
        4rf7fc7sP7DAAkW2XFHXAQliE78cYBU=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 06/13] docs/zh_CN: Update the translation of kasan to
 6.1-rc8
Message-ID: <Y5RxC+4Lsv0Xe2/0@bobwxc.mipc>
References: <cover.1670642548.git.siyanteng@loongson.cn>
 <824d1cea864dac3ef78c0911c2c5a238f36c55ad.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <824d1cea864dac3ef78c0911c2c5a238f36c55ad.1670642548.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-12-10 (六) 11:24:51 +0800 Yanteng Si 曰：
> Update to commit cd36d84d2571 ("kasan: allow sampling
> page_alloc allocations for HW_TAGS")
> 
> Commit 80b92bfe3bb7 ("kasan: dynamically allocate
> stack ring entries")
> Commit 7ebfce331251 ("kasan: support kasan.stacktrace
> for SW_TAGS")
> Commit ca89f2a2e66d ("kasan: move boot parameters
> section in documentation")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,

> ---
>  .../translations/zh_CN/dev-tools/kasan.rst    | 74 ++++++++++---------
>  1 file changed, 41 insertions(+), 33 deletions(-)

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

