Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97C84ECAAA2
	for <linux-doc@archiver.kernel.org>; Fri, 26 Aug 2022 00:16:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229986AbiHZAQp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 20:16:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229521AbiHZAQo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 20:16:44 -0400
Received: from out1.migadu.com (out1.migadu.com [91.121.223.63])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30B3E33341
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 17:16:42 -0700 (PDT)
Date:   Fri, 26 Aug 2022 08:16:07 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1661473000;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UCs9n1X/6yxYN5qO1+yW7QiQ5RWy4sR/lVFwSN/MNyU=;
        b=l+JYhWgIi3RlM5AT0F09S5IQGrsvfcP446RYpadiOlaMmlYJiguA6/RHaIn+9UemABJ1t9
        yziaTrgXy46VApE+sCdrNu9KoLcaMo0TQaLYYKemAlD7ZE9uCJeoNHtrT2i/NLwZbm9MTH
        xzpwVtgsHDO34EF2B45qogT6PWNyC2I=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, bobwxc@email.cn, seakeel@gmail.com,
        corbet@lwn.net, chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        xiyou.wangcong@gmail.com, hidave.darkstar@gmail.com,
        tekkamanninja@gmail.com, leoyang.li@nxp.com, src.res@email.cn,
        linux-doc-tw-discuss@lists.sourceforge.net
Subject: Re: [PATCH v1 3/3] docs/zh_TW: Remove oops-tracing
Message-ID: <YwgQxxH+4Rpw460H@bobwxc.mipc>
References: <cover.1661431365.git.siyanteng@loongson.cn>
 <0d22733cea474b0a3784f8de6b4bc4841fbaba77.1661431365.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <0d22733cea474b0a3784f8de6b4bc4841fbaba77.1661431365.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-08-25 (四) 20:53:27 +0800 Yanteng Si 曰：
> The English version of oops-tracing has been
> refactored and has been translated into Chinese.
> Let's remove them.
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Acked-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_TW/oops-tracing.txt       | 212 ------------------
>  1 file changed, 212 deletions(-)
>  delete mode 100644 Documentation/translations/zh_TW/oops-tracing.txt
> 

Thanks,

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

