Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC2CEC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 17:46:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BF03060F44
	for <linux-doc@archiver.kernel.org>; Mon, 27 Sep 2021 17:46:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236393AbhI0Rri (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Sep 2021 13:47:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237111AbhI0Rre (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Sep 2021 13:47:34 -0400
Received: from ms.lwn.net (ms.lwn.net [IPv6:2600:3c01:e000:3a1::42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2B87C041876
        for <linux-doc@vger.kernel.org>; Mon, 27 Sep 2021 10:30:44 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:104d::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 7AD61774;
        Mon, 27 Sep 2021 17:30:44 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7AD61774
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1632763844; bh=IXvy37xlQ9vtaPE3D5XZ5xO3cZOhk5y+wB6sL++JZCU=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=XHSgePGrQ+EKPFSWNxFaif49nH+wRr1t3CflHcV5wZOM896bZRbnx1R3iryvSOFc/
         dAxtDJ2Wq/9qsQM9dtRKub52yuqdySw2b8B5ZVBk9zzVbxJtkEimv4XbNDs/N0W4qo
         GW8ZxuVFpmZrqDNqmxURtEW6RIp17KWmK9a9ufojZUrPXPXe2KVGAikTioG5bxEkb3
         vY9ni0lECP6h9aJOaWklPy2YU72/VwgvVptMNEIUfhI0VGMADXfJJTIwL7uJCn/f+k
         2O8Vr3JLdqAhCiQj8AzX4zhEdDV5A38qJccZmcVGVrREox3HYRz73yKOcJCnNjE35/
         5UHzjoOpAJNiw==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Yanteng Si <siyanteng01@gmail.com>, alexs@kernel.org,
        seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v6 0/6] docs/zh_CN: add core-api Memory management
 translation
In-Reply-To: <cover.1631846923.git.siyanteng@loongson.cn>
References: <cover.1631846923.git.siyanteng@loongson.cn>
Date:   Mon, 27 Sep 2021 11:30:43 -0600
Message-ID: <87fstqhqnw.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Yanteng Si <siyanteng01@gmail.com> writes:

> v6:
>
> warning fix:
> Documentation/translations/zh_CN/core-api/mm-api.rst:35: WARNING: duplica=
te label mm-api-gfp-flags, other instance in /stuff/k/git/kernel/Documentat=
ion/core-api/mm-api.rst
>
> It looks like two identical tags are causing that warning, but I
> tested it in sphinx-2.4.4 and sphinx-4.1.2 and got no warning.
>
> I have modified the tags in the Chinese documentation:
>
> diff --git a/Documentation/translations/zh_CN/core-api/mm-api.rst b/Docum=
entation/translations/zh_CN/core-api/mm-api.rst
>
> -.. _mm-api-gfp-flags:
> +.. _cn_mm-api-gfp-flags:
>=20=20
>  =E5=86=85=E5=AD=98=E5=88=86=E9=85=8D=E6=8E=A7=E5=88=B6
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> v5:
>
> * resent to linux-doc list.
>
> v4:
>
> * pick Alex's Reviewed-by tag.
> * Modified some words under Alex's advices.
>
> v3:
>
> * Modified some words under Jiaxun's advices.[PATCH 5/6]
>
> v2:
>
> * Modified some words under Alex's advices;Many thanks to alex for his re=
view, which
>     kept him busy until the early hours of the morning.Thank you!
>
> Yanteng Si (6):
>   docs/zh_CN: add core-api memory-allocation translation
>   docs/zh_CN: add core-api unaligned-memory-access translation
>   docs/zh_CN: add core-api mm-api translation
>   docs/zh_CN: add core-api genalloc translation
>   docs/zh_CN: add core-api boot-time-mm translation
>   docs/zh_CN: add core-api gfp_mask-from-fs-io translation
>
>  .../zh_CN/core-api/boot-time-mm.rst           |  49 ++++
>  .../translations/zh_CN/core-api/genalloc.rst  | 109 +++++++++
>  .../zh_CN/core-api/gfp_mask-from-fs-io.rst    |  66 +++++
>  .../translations/zh_CN/core-api/index.rst     |  14 +-
>  .../zh_CN/core-api/memory-allocation.rst      | 138 +++++++++++
>  .../translations/zh_CN/core-api/mm-api.rst    | 110 +++++++++
>  .../core-api/unaligned-memory-access.rst      | 229 ++++++++++++++++++
>  7 files changed, 710 insertions(+), 5 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/boot-time-m=
m.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/genalloc.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/gfp_mask-fr=
om-fs-io.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/memory-allo=
cation.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/mm-api.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/unaligned-m=
emory-access.rst

Set applied, thanks.

jon
