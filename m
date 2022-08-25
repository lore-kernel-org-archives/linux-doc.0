Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55C28ECAA24
	for <linux-doc@archiver.kernel.org>; Thu, 25 Aug 2022 18:54:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232482AbiHYSy5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Aug 2022 14:54:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60494 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243577AbiHYSy4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Aug 2022 14:54:56 -0400
Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF55D27B07
        for <linux-doc@vger.kernel.org>; Thu, 25 Aug 2022 11:54:52 -0700 (PDT)
Received: from localhost (unknown [IPv6:2601:281:8300:73::5f6])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 1E08C2E2;
        Thu, 25 Aug 2022 18:54:52 +0000 (UTC)
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1E08C2E2
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
        t=1661453692; bh=yeBgKSaM+6fCDziahgGJEwnMW2UpwO3W83J2tgKJjPY=;
        h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
        b=kWCQ5Sz7c+0lQRz4StvAD3jL57Cgoby3siV9HVVxbuC8uo36e8RCX8Sd3cCcUnQMk
         j/e6GkOGvxCdqMJIvWBzvFHEl3FOniqRINeYi1hzyLw538zxHWP0oyB678MdapSOlo
         nc9T/5zbGwx6P5VfvdzUj3J/zqm2vM/Db++HBIpMo9fizWznqlRKfcT0FGGZKescjE
         O2WTjxn0vI2pwuxxDgxdzebVHj/XzCXSCQxF7pQfAiO+eeLUnRDji6ucK9gjY+OWcv
         /57yhzPbAmNcYCTRr9HoIt7h4NmfMhPc58hvyr8LVbKUNU69EE2l64UCQEQtvn1nkK
         mDrO/ovfP9uag==
From:   Jonathan Corbet <corbet@lwn.net>
To:     Wu XiangCheng <wu.xiangcheng@linux.dev>
Cc:     Alex Shi <alexs@kernel.org>, Yanteng Si <siyanteng@loongson.cn>,
        Li Yang <leoyang.li@nxp.com>,
        linux-doc <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] docs/zh_CN: Fix two missing labels in zh_CN/process
In-Reply-To: <Yv7i1tYMvK9J/NHj@bobwxc.mipc>
References: <87fshtbgoy.fsf@meer.lwn.net>
 <cover.1659406843.git.bobwxc@email.cn> <Yv7i1tYMvK9J/NHj@bobwxc.mipc>
Date:   Thu, 25 Aug 2022 12:54:50 -0600
Message-ID: <871qt4ywzp.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Wu XiangCheng <wu.xiangcheng@linux.dev> writes:

> From: Wu XiangCheng <bobwxc@email.cn>
>
> * Add back still referenced labels in submitting-patches.rst and
>   email-clients.rst.
> * Fix a typo.
>
> Fixes: fdb34b18b959 ("docs/zh_CN: Update zh_CN/process/submitting-patches=
.rst to 5.19")
> Fixes: d7aeaebb920f ("docs/zh_CN: Update zh_CN/process/email-clients.rst =
to 5.19")
> Signed-off-by: Wu XiangCheng <bobwxc@email.cn>
> ---
>
> Hi Jon,
>
> I'm sorry that actually v2 of this set[1] has not been sent yet, still so=
me
> problems need to be fixed.
>
> Please also apply this short patch to fix them.
>
> Thanks,
> 	Wu
>
> [1]: https://lore.kernel.org/linux-doc/87fshtbgoy.fsf@meer.lwn.net/T/#t
>
>
>  Documentation/translations/zh_CN/process/email-clients.rst    | 2 ++
>  .../translations/zh_CN/process/submitting-patches.rst         | 4 +++-
>  2 files changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/translations/zh_CN/process/email-clients.rst b=
/Documentation/translations/zh_CN/process/email-clients.rst
> index fa113f071855..34d51cdadc7b 100644
> --- a/Documentation/translations/zh_CN/process/email-clients.rst
> +++ b/Documentation/translations/zh_CN/process/email-clients.rst
> @@ -2,6 +2,8 @@
>=20=20
>  .. include:: ../disclaimer-zh_CN.rst
>=20=20
> +.. _cn_email_clients:
> +
>  :Original: Documentation/process/email-clients.rst
>=20=20
>  :=E8=AF=91=E8=80=85:
> diff --git a/Documentation/translations/zh_CN/process/submitting-patches.=
rst b/Documentation/translations/zh_CN/process/submitting-patches.rst
> index 26565abcbd8d..f8978f02057c 100644
> --- a/Documentation/translations/zh_CN/process/submitting-patches.rst
> +++ b/Documentation/translations/zh_CN/process/submitting-patches.rst
> @@ -2,6 +2,8 @@
>=20=20
>  .. include:: ../disclaimer-zh_CN.rst
>=20=20
> +.. _cn_submittingpatches:
> +
>  :Original: Documentation/process/submitting-patches.rst

I am totally confused by this patch.  Those labels are present in
docs-next; where do you think this patch is necessary?

Thanks,

jon
