Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F35C1C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 11:46:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229634AbiLJLqL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Dec 2022 06:46:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLJLqK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Dec 2022 06:46:10 -0500
Received: from out-248.mta0.migadu.com (out-248.mta0.migadu.com [IPv6:2001:41d0:1004:224b::f8])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4B841AA0A
        for <linux-doc@vger.kernel.org>; Sat, 10 Dec 2022 03:46:09 -0800 (PST)
Date:   Sat, 10 Dec 2022 19:45:57 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670672767;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=01vuSWE/hdIAdota2M/wo1tx9+FEZlIUGGNyVb3HMMc=;
        b=S5T8THju/ix3ZoR0C1rjLhGzUCSTathRUAnh8UJJYrO629hbEB/5LwOt+UyqPKODQ31dCR
        PmijCYHqf7WxO1eSVlhDQ1tI1tQx1g3Xi+9Kcgb9b2hZGm4HAT4lMRzw0Kil8MKnGVUuyj
        Wwc+07NuBsQQIioQIMYR/wovmENEWaI=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 07/13] docs/zh_CN: Update the translation of
 testing-overview to 6.1-rc8
Message-ID: <Y5RxddddjGU14p0L@bobwxc.mipc>
References: <cover.1670642548.git.siyanteng@loongson.cn>
 <f3ae5e63502fed7e904f5a801168d2324c71f014.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <f3ae5e63502fed7e904f5a801168d2324c71f014.1670642548.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-12-10 (六) 11:26:34 +0800 Yanteng Si 曰：
> Update to commit a32d5c0fc12b ("Documentation: dev-tools:
> Enhance static analysis section with discussion")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,

> ---
>  .../zh_CN/dev-tools/testing-overview.rst      | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

