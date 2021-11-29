Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B419BC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 29 Nov 2021 22:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235138AbhK2W5C (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Nov 2021 17:57:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235385AbhK2W4d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Nov 2021 17:56:33 -0500
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C8F7C061D73
        for <linux-doc@vger.kernel.org>; Mon, 29 Nov 2021 14:02:46 -0800 (PST)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 07E152CD;
        Mon, 29 Nov 2021 22:02:45 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 07E152CD
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1638223366; bh=r0M+Dh8Xj1aqpvWY3kYeso5oa3aMlBR0puKXdY4K+98=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=QiWWsczjvZ1ZYVMKzwN8uFqiYzb+kZDgE5eTYZAX9Ttd3sXJVjmZ/A9BulV35Wy/f
         F/pZ4o9F35NmZ0/drNaOZrXN7R/CcadF1iru2r9KFWeg1PXWY6PUMtZRSPPnXU4IkT
         ddWdqcMOkw8WW521qzaMqI8HpzCQSUu5bKpBUPiYvswyyjRNi9o02rOPXEQAjQYgqC
         c+SdHia6UrgClpi3xncsjrnqHVwvisCo3ipcPFS+OjOvNtL4bIwI6jx/CqlLS4L8GM
         hMKkrwD2lkCkLtT3BCbAK5+UEuC0fzYCLqWBWNq5w/tMkNXtj4YO7pmf9AS3fsCR2/
         E7pORdOPwMhbw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        bobwxc@email.cn, seakeel@gmail.com, leoyang.li@nxp.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com, src.res@email.cn,
        wanjiabing@vivo.com, bernard@vivo.com
Subject: Re: [PATCH v3 0/2] docs/zh_CN: move and update sparse
In-Reply-To: <cover.1636078637.git.siyanteng@loongson.cn>
References: <cover.1636078637.git.siyanteng@loongson.cn>
Date:   Mon, 29 Nov 2021 15:02:45 -0700
Message-ID: <877dcqsjqy.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v3:
>
> * Pick Alex's Reviewed-by tag.
> * Replace *=E6=98=AF* with **=E6=98=AF** at the suggestion of Leo Li.
> * Fix a build warning.
>
> v2:
>
> At the suggestion of Leo Li:
>
> * typo fix.
> * recovert `` `` to =E2=80=9C =E2=80=9D.
>
> v1:
>
> The Chinese sparse documentation is too old, so let's update it to
> the latest version and move it to ../zh_CN/dev-tools/.
>
> Yanteng Si (2):
>   docs/zh_CN: move sparse into dev-tools
>   docs/zh_CN: update sparse translation
>
>  .../translations/zh_CN/dev-tools/index.rst    |  2 +-
>  .../{sparse.txt =3D> dev-tools/sparse.rst}      | 67 ++++++++++++-------
>  2 files changed, 43 insertions(+), 26 deletions(-)
>  rename Documentation/translations/zh_CN/{sparse.txt =3D> dev-tools/spars=
e.rst} (58%)

Set applied, thanks.

jon
