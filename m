Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82EA6C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 15 Feb 2022 23:22:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiBOXWQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Feb 2022 18:22:16 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:40062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242715AbiBOXWP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Feb 2022 18:22:15 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D869E9DF
        for <linux-doc@vger.kernel.org>; Tue, 15 Feb 2022 15:22:05 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C4A83385;
        Tue, 15 Feb 2022 23:22:04 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net C4A83385
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1644967324; bh=cCv+dzwGNZE+NA7qMdezW4qO4twvgf17ZRIhUgsmUDQ=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=c322VFAQoN5UL6o8dTvdPZSOO84n3nG8q12+HWW6mLtomkk05g94BTIK0y4NjZSTD
         38ZSlUKaZekBpP5fVEjPRRjiuuVjMr6nOywsFYyCoH+Zm3IIZzgBslblbgCG5BJQI4
         hnbKFyY4suqU7apps9Dk3rdVPUnD68FOAxMvJYmATHH2uIBrAnS9Jc4N8rfYjzCECk
         9L+8hhU4KHedoaWIj8U16f80crApIHQsc/I91UKdyjrd+7PIDWtZ12HsJSMmUpI1yI
         uxU4sjrpR+HjNM4chy63sNO3Wofda7cRsztCwlyPYONCGb2oEtkBZbxSL/lF1gd+ae
         kiRwh9YC+aCtw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     cgel.zte@gmail.com
Cc:     linux-doc@vger.kernel.org, siyanteng01@gmail.com,
        seakeel@gmail.com, xu xin <xu.xin16@zte.com.cn>,
        Yang Yang <yang.yang29@zte.com.cn>,
        Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3 2/3] zh_CN: Add translations for admin-guide/mm/ksm.rst
In-Reply-To: <20220212080344.1684782-1-xu.xin16@zte.com.cn>
References: <20220212080024.1684590-1-xu.xin16@zte.com.cn>
 <20220212080344.1684782-1-xu.xin16@zte.com.cn>
Date:   Tue, 15 Feb 2022 16:22:03 -0700
Message-ID: <87h78z7m1w.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

cgel.zte@gmail.com writes:

> From: xu xin <xu.xin16@zte.com.cn>
>
> Translate Documentation/admin-guide/mm/ksm.rst into Chinese.
>
> Reviewed-by: Yang Yang <yang.yang29@zte.com.cn>
> Reviewed-by: Alex Shi <alexs@kernel.org> 
> Reviewed-by: Yanteng Si <siyanteng@loongson.cn>
> Signed-off-by: xu xin <xu.xin16@zte.com.cn>
> ---
>  .../translations/zh_CN/admin-guide/mm/ksm.rst      | 148 +++++++++++++++++++++
>  1 file changed, 148 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/ksm.rst

I went to apply these, but...

> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> new file mode 100644
> index 0000000..bbf654c
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
> @@ -0,0 +1,148 @@
> +.. include:: ../disclaimer-zh_CN.rst

This generates a build failure:

> Sphinx parallel build error:
> docutils.utils.SystemMessage: /stuff/k/git/kernel/Documentation/translations/zh_CN/admin-guide/mm/index.rst:1: (SEVERE/4) Problems with "include" directive path:
> InputError: [Errno 2] No such file or directory: 'Documentation/translations/zh_CN/admin-guide/disclaimer-zh_CN.rst'.

Please be sure to actually build your changes before sending them for
inclusion.

Thanks,

jon

