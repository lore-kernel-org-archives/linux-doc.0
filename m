Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C8C6C433EF
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 17:44:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 814A960F44
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 17:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238050AbhI0RqO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Sep 2021 13:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236683AbhI0RqL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Sep 2021 13:46:11 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 75363C019DAA
        for <linux-doc@vger.kernel.org>; Mon, 27 Sep 2021 10:27:05 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 32146774;
        Mon, 27 Sep 2021 17:27:05 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 32146774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1632763625; bh=8lARwWvNd+Rpe8LpmPOUbYRoXMJKrbKy7znc8I8h8ZE=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=h29aBzzrvQ1MMJSrudfBVvb+iVtxoZvc4S9GiYFgO5QIZjPzSdRdoP74vLAbnSfcz
         PAGiO6R5KCD7qVLwIFcj7NveSYabIDl5Zxx2/2rkgCBLCk2mcwvmhyG0p3Obh9ufpd
         DXhYtAnthEIHNZcX9y6hqnXTmkn5OwFv+noi2RToJpjFeXznFmagzXNJ4cHVt2rX6g
         kvCIZ98n/e0eTtfgh8IeyKfbSqWw2KUKxB4o6B3E793iUB22SOcrSzBhw43lu4YGmc
         g8uZ/VswYspps0Og7/LGMqIz/qWoJSYl2o7WGh1YowV4x/6aLYmnHTISDuP5tEA4Yy
         SCZ18b2zq6oug==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 0/3] docs/zh_CN: improve process translation
In-Reply-To: <cover.1632389476.git.siyanteng@loongson.cn>
References: <cover.1632389476.git.siyanteng@loongson.cn>
Date:   Mon, 27 Sep 2021 11:27:04 -0600
Message-ID: <87sfxqhqtz.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v2:
> *Replace =E5=8F=91=E9=80=81 with =E5=AF=84=E9=80=81.
>
> v1:
> * Modify some content that may mislead the reader, we should describe the=
 patch in English.
> * improve howto.rst and 5.Posting.rst.
> * typo fix.
>
> Yanteng Si (3):
>   docs/zh_CN: Improve zh_CN/process/howto.rst
>   docs/zh_CN: typo fix and improve translation
>   docs/zh_CN: modify some words
>
>  Documentation/translations/zh_CN/process/5.Posting.rst |  8 ++++----
>  Documentation/translations/zh_CN/process/howto.rst     | 10 +++++-----
>  .../translations/zh_CN/process/submitting-patches.rst  |  4 ++--
>  3 files changed, 11 insertions(+), 11 deletions(-)
>
> --=20
> 2.27.0
Applied, thanks.

jon
