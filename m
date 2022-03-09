Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BDA20C433EF
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 23:34:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234373AbiCIXf4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Mar 2022 18:35:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232807AbiCIXf4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Mar 2022 18:35:56 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D212525587
        for <linux-doc@vger.kernel.org>; Wed,  9 Mar 2022 15:34:56 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 754862C3;
        Wed,  9 Mar 2022 23:34:56 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 754862C3
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1646868896; bh=9lJgLzkTshePGMmbEPGHCWhGxoc3kMTvyr55DL4fAKA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=KMC6FROmxIUb2DajvbInhM+lGIdISCAi6qIvsjFqDEbtJQ1dpjcp/yO6FnzxRiQEg
         0dGVJ+yvuJDYiuLXn4fG2/EapjFpv7CnXSo2+qVhFlX42c1kIGg5vyaXu6CLNtFySR
         qfTn2AvmDjKSS1m9so4TdqsjFTvcHWZegncHbAGPWU0cBr4KHncRWVEVaZQhk8O/5B
         NbhzUf8yvpiC9PlGgakeTbdgAoXiFm2yQVWor4zPX1wmTkzE/AhXZ42oD9h324IXNR
         agewhF8SF5m0F3dN+2+QStZavNa/bc0ewSIL/PDvIrSTCMwqmH6eO1PFGMNnzYF/rf
         bLVmnfs0L8gcw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     xu xin <xu.xin16@zte.com.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com, Yang Yang <yang.yang29@zte.com.cn>,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v6 1/3] Add Chinese translation for vm/ksm.rst
In-Reply-To: <5c1d9b95b570cc3412b6bf87fdcc35046b3ce606.1646723502.git.siyanteng@loongson.cn>
References: <cover.1646723502.git.siyanteng@loongson.cn>
 <5c1d9b95b570cc3412b6bf87fdcc35046b3ce606.1646723502.git.siyanteng@loongson.cn>
Date:   Wed, 09 Mar 2022 16:34:55 -0700
Message-ID: <87ee3a7l9c.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> From: xu xin <xu.xin16@zte.com.cn>
>
> Translate Documentation/vm/ksm.rst into Chinese.
> Update Documentation/translations/zh_CN/vm/index.rst.
>
> Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org>
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> Signed-off-by: xu xin <xu.xin16@zte.com.cn>
> ---
>  Documentation/translations/zh_CN/vm/index.rst |  1 +
>  Documentation/translations/zh_CN/vm/ksm.rst   | 70 +++++++++++++++++++
>  2 files changed, 71 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

Since you are passing this patch onward, you need to apply your sigoff
to it.

Thanks,

jon
