Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84F5DC07E99
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 16:54:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6507C61152
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jul 2021 16:54:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233633AbhGLQ5G (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jul 2021 12:57:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33658 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233620AbhGLQ5F (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jul 2021 12:57:05 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D83AAC0613DD
        for <linux-doc@vger.kernel.org>; Mon, 12 Jul 2021 09:54:16 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 881512ED;
        Mon, 12 Jul 2021 16:54:16 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 881512ED
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1626108856; bh=uvdO8DGVFUl3FgzMc3DbuNRcFh9w5gxtvE9jfOChgr0=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=SGWBjA6EkhYMVl80WV2ymOKXbDhVuHxNEX0QzUkYjkJq8qMna+6eFTnbwPpkzWJ3A
         oPlxi/coPFbJCb4E1I1f2C+y/JawvNWcoGG4WVx+Zm761gGIZ6kVGLWLXac9P1dKPi
         pSm2Ka9rGenL+bfdzXxGQ1BPqq6COAY6qms5/6PP1q0b++Vyjap+KlAHE61zAE3lz/
         cm3AmmOIXs8J+sNK2sljDjv2nbXU7lmZX4kdGup0BlL4nJ6OAUdMiL5HgtGro5ghgt
         bByuzA6WP68D4uoMiACQPYs9zOLCtmffnV1AO7NrvWjzouMXNXdWLhingczkjzgeie
         Sfbu+PuCF7rrw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng@loongson.cn>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com, Yanteng Si <siyanteng@loongson.cn>
Subject: Re: [PATCH v4 ] docs/zh_CN: add core api genericirq translation
In-Reply-To: <20210709030143.548940-1-siyanteng@loongson.cn>
References: <20210709030143.548940-1-siyanteng@loongson.cn>
Date:   Mon, 12 Jul 2021 10:54:16 -0600
Message-ID: <874kczqxqf.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng@loongson.cn> writes:

> translate Documentation/core-api/genericirq.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> Reviewed-by: Wu XiangCheng <bobwxc@email.cn>
> ---
> v4:
>
> * Is anyone else reviewing this set? :-)
>
> v3:
> * pick Xiangcheng's Reviewed-by tag.
>
> v2:
> * Modified some words under Xiangcheng's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>
>  .../zh_CN/core-api/genericirq.rst             | 409 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  2 files changed, 410 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/genericirq.=
rst

Applied, thanks.

jon
