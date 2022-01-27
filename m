Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D537C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 27 Jan 2022 18:40:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239902AbiA0Skn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 Jan 2022 13:40:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52788 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229379AbiA0Skm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 27 Jan 2022 13:40:42 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8D431C061714
        for <linux-doc@vger.kernel.org>; Thu, 27 Jan 2022 10:40:42 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 190CF37C;
        Thu, 27 Jan 2022 18:40:42 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 190CF37C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1643308842; bh=dmFlgRKtYhKhFgGD76wFQ5jOhgivU597bGjcsPzxvxA=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=A3IhKiVutSOVYUHRKtNQQo6sfmipLXAWaoVtpOcinUCs3VwacZNKSmrfUAEFRgKES
         OjYQ3HXtzr1m0XjNXRq5X/5NBoD1ox1asMMZLBEOkT1v4viJqhFtyo5lG6dKFYkFXe
         OLAjGuj0Y43s649DrOb+kyLtYshXollO6kGw67AU/J5fpuz4+4bRQFnOrulyk8b4mt
         PEVioaRAs8X1GVn7Lo6y/T+7G9Fbj6Az2VGoawzmI/JWSrWL7m6l4evnW0Ujh8kMeK
         VacXmk/u3P9cZ07YxagjosPEjWECi9NJYGNQrZoTIg/ckVIrZ0ldPMm59VEB2MttJo
         QsstT6XF65FsQ==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/4] docs/zh_CN: add vm damon translation
In-Reply-To: <cover.1642230669.git.siyanteng@loongson.cn>
References: <cover.1642230669.git.siyanteng@loongson.cn>
Date:   Thu, 27 Jan 2022 11:41:13 -0700
Message-ID: <87tudpqawm.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v2=EF=BC=9A
> * Pick Alex's Reviewed-by tag.
>
> v1=EF=BC=9B
> * Translate .../vm/damon/* into Chinese.
>
> Yanteng Si (4):
>   docs/zh_CN: add damon index tronslation
>   docs/zh_CN: add damon faq translation
>   docs/zh_CN: add damon design translation
>   docs/zh_CN: add damon api translation
>
>  .../translations/zh_CN/vm/damon/api.rst       |  32 ++++
>  .../translations/zh_CN/vm/damon/design.rst    | 139 ++++++++++++++++++
>  .../translations/zh_CN/vm/damon/faq.rst       |  48 ++++++
>  .../translations/zh_CN/vm/damon/index.rst     |  33 +++++
>  Documentation/translations/zh_CN/vm/index.rst |   2 +-
>  5 files changed, 253 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/vm/damon/api.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/damon/design.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/damon/faq.rst
>  create mode 100644 Documentation/translations/zh_CN/vm/damon/index.rst

Set applied, thanks.

jon
