Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D3AAC433ED
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:32:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E1DC60FF0
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 18:32:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237092AbhEQSdn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 14:33:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237050AbhEQSdn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 17 May 2021 14:33:43 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 959EFC061573
        for <linux-doc@vger.kernel.org>; Mon, 17 May 2021 11:32:26 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 3725337B;
        Mon, 17 May 2021 18:32:26 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3725337B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1621276346; bh=g2retvIgn8gtQL+DQcjcrKQDlRVme5gVUGNBAFXMmYg=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=K03eQGXmLbPHjNAmjgF/YPZiUrVINezPlLm/C28yoY42bUOhgdE3E18kLcrsvG2rI
         eWaCOAUc5Zqaau87908vikyHGcWdeSPBt4O02DcRzLYGb4lUipu8XdBqc5jdwzf6s0
         aNbT89OLVEZasWoYYUzP4BYWDLNB5M+lkOSmBXgDmFBdkBdyne8EmMEmzTd6oardM6
         EVGOCdQk46XJWxxC8BP5cC8RLlvERokf1PcgTBJUutbR3xnrTZ/DaB3s9hRJCvQElT
         b1KIeynOKt+Lb2aBsmVbHyNVdCVsw8nOWxvECD4uMbXKAd+ZRHFxI89xRVJos2MEVE
         Ce8Z8+j9DseEA==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com, bobwxc@email.cn,
        siyanteng01@gmail.com, huangjianghui@uniontech.com,
        Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v3] docs/zh_CN: add core api kobject translation
In-Reply-To: <20210517133748.3461357-1-siyanteng@loongson.cn>
References: <20210517133748.3461357-1-siyanteng@loongson.cn>
Date:   Mon, 17 May 2021 12:32:25 -0600
Message-ID: <871ra52oue.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


One little detail while it's on my mind...

Yanteng Si <siyanteng@loongson.cn> writes:

> This patch translates Documentation/core-api/kobject.rst into Chinese.

If you look in Documentation/process/submitting-patches.rst, you'll see
that it says not to say "this patch".  Instead, changelogs should be
written in the imperative form: "Translate Documentation/whatever into
Chinese".  I'm not particularly worried about this little rule, but some
other maintainers are quite firm about it, so it's better to just adopt
that habit.

Thanks,

jon
