Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A2A4C6FA90
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 12:47:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231653AbiIWMrc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 08:47:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33828 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231506AbiIWMr1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 08:47:27 -0400
Received: from out1.migadu.com (out1.migadu.com [IPv6:2001:41d0:2:863f::])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7605113572D
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 05:47:26 -0700 (PDT)
Date:   Fri, 23 Sep 2022 20:47:05 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1663937244;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:  in-reply-to:in-reply-to;
        bh=LkjLgyuoqMC4WRzVJ1lHBSuMdnSypXGRA6Y6/dRfTLU=;
        b=BH2P0yx80HplJJFj5evibSQTi6G29XDhTRSktJ5RLQSnJ6ZO7ju1lg3jUfB0tZ/7x9E5EA
        X2p59MyUm083ck+HF996Qf0rF2KNptr2cuu2roVRra83skcXtM8/IQ2DqHss+ILbHFtN34
        9gw07dYNClXZ3cGSrhVddDeyl/7+Q2k=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, corbet@lwn.net, wu.xiangcheng@linux.dev,
        linux-doc@vger.kernel.org, Yanteng Si <siyanteng@loongson.cn>,
        kernel test robot <lkp@intel.com>
Subject: Re: [PATCH] docs/zh_CN: Fix build warning
Message-ID: <Yy2qyUoRq5in4Q+w@bobwxc.mipc>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20220923040419.3787429-1-siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
X-Migadu-Auth-User: linux.dev
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> Since commit 702f436ab07b ("docs/zh_CN: add dt changesets translation")
> introduce a build warning:
> 
> Warning: Documentation/translations/zh_CN/devicetree/changesets.rst
> references a file that doesn't exist:
> Documentation/Devicetree/changesets.rst
> 
> Change the first letter of Devicetree to lowercase.
> 
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Better a Fixes: tag.

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,

> ---
>  Documentation/translations/zh_CN/devicetree/changesets.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/translations/zh_CN/devicetree/changesets.rst b/Documentation/translations/zh_CN/devicetree/changesets.rst
> index 2ace05f3c377..3df1b03c5695 100644
> --- a/Documentation/translations/zh_CN/devicetree/changesets.rst
> +++ b/Documentation/translations/zh_CN/devicetree/changesets.rst
> @@ -1,7 +1,7 @@
>  .. SPDX-License-Identifier: GPL-2.0
>  .. include:: ../disclaimer-zh_CN.rst
>  
> -:Original: Documentation/Devicetree/changesets.rst
> +:Original: Documentation/devicetree/changesets.rst
>  
>  :翻译:
>  
> -- 
> 2.31.1
> 
> 

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

