Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F54C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 10 Dec 2022 11:48:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbiLJLsp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 10 Dec 2022 06:48:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34696 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229545AbiLJLso (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Dec 2022 06:48:44 -0500
Received: from out-224.mta0.migadu.com (out-224.mta0.migadu.com [IPv6:2001:41d0:1004:224b::e0])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E60101182C
        for <linux-doc@vger.kernel.org>; Sat, 10 Dec 2022 03:48:42 -0800 (PST)
Date:   Sat, 10 Dec 2022 19:48:26 +0800
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1670672921;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hs/GXKovr5I2Y3igQmzTrB+UZXlXSGDDCUsT8SXbtvg=;
        b=lw4xFBnkAo7gyh0plBQj4SokYE1OwUv+Ul38Ea59tHccXe8u1qQ9f5ZjKJtC7gD3+qfWA6
        32VrpEAY0jJw5gPr4LnbOPl4x+R208737fUtDlBDdCq/lpKl88GLffZkQ1dL7pr0HfMakH
        lH04BiFse1xBKrOOAMvjMWt/BdhK5u8=
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Wu XiangCheng <wu.xiangcheng@linux.dev>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     alexs@kernel.org, seakeel@gmail.com, corbet@lwn.net,
        chenhuacai@kernel.org, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 13/13] docs/zh_CN: Update the translation of
 energy-model to 6.1-rc8
Message-ID: <Y5RyCmt3TV077sgP@bobwxc.mipc>
References: <cover.1670642548.git.siyanteng@loongson.cn>
 <06df12357d64d602a4dfb10a025a7520daeb3ba0.1670642548.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <06df12357d64d602a4dfb10a025a7520daeb3ba0.1670642548.git.siyanteng@loongson.cn>
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

2022-12-10 (六) 11:27:05 +0800 Yanteng Si 曰：
> Update to commit c5d39fae8992 ("Documentation: EM: Switch to
> micro-Watts scale")
> 
> commit f48a0c475c2a ("Documentation: EM: Describe new registration
> method using DT")
> commit 75a3a99a5a98 ("PM: EM: Change the order of arguments in the
> .active_power() callback")
> commit 015f569c4649 ("Documentation: EM: Add artificial EM
> registration description")
> 
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,

> ---
>  .../translations/zh_CN/power/energy-model.rst | 36 ++++++++++++++-----
>  1 file changed, 28 insertions(+), 8 deletions(-)

-- 
Wu XiangCheng	0x32684A40BCA7AEA7

