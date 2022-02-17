Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49602C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 17 Feb 2022 13:56:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236814AbiBQN5A (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Feb 2022 08:57:00 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:47786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241403AbiBQN47 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Feb 2022 08:56:59 -0500
Received: from mail-il1-x136.google.com (mail-il1-x136.google.com [IPv6:2607:f8b0:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16697654F
        for <linux-doc@vger.kernel.org>; Thu, 17 Feb 2022 05:56:45 -0800 (PST)
Received: by mail-il1-x136.google.com with SMTP id h11so2293644ilq.9
        for <linux-doc@vger.kernel.org>; Thu, 17 Feb 2022 05:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=h173/Xyn7am4xw7Q8qgjD5LVQXMcqogBYHyQssYWdeY=;
        b=et/Wkx7eMqOr23ZQDXBvVEa2RRHNT6eOBMPzyoyDSYRkQuR1eeFKtVmlAWBNkTH8kv
         +1glznOspkz5evjz/M/tpQ1Ac4c9mu72rgwiPl4rWqAl0MONIpFYZ1YRYId8oYGZCPaO
         daQk3aecrukNEc9L8Wbc5mOQL94ECaDmrfSSpIP/Y3rncJU6G6q1HjDktBFAIOmYhVEn
         t+hQnGTTP3UR/I0flXauZr9ounnFCd7fAD6RFU2vxJ019rSRoe/3rT6OqVkYDj1Fias8
         WSlZxnO5A6S7zuSkr9MbeTFkYTT3mJrx+YjAj6oqHDKIvim8uOXxOcYMfszoD2/Gjz2L
         W8fQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=h173/Xyn7am4xw7Q8qgjD5LVQXMcqogBYHyQssYWdeY=;
        b=wwfCF0aKD/4TVCZi3ubhJDA0W/O23xbg6nMqPCeBlVU8n33l2KxsqtvrmPMD7OD7K8
         9Tx0FM2a0MzxPRrHidRhL/LOrM5cwmd1Fe4gdI1pw1PgZTs3FKes/4UfInYPhCR5fqiI
         7iRKAA1THurh6S2WxeUBt7GDz62lv9lDjY6oPIe9R1JtrxEdZo9w462i4zqQLgwQ4ifx
         Fmqb4Tj9xHNJXTmz1b258FgsJlTAz4VGOOOxUkxKgwyxHpN/8SASytJjFcH9Y7FPrl6n
         8XU6Gm2aGIeCR3gSwLhdjWZWCw0APykPgdMj4+OLPNVdWtsM7zd93IvIyGxqmdffVY+1
         sWpA==
X-Gm-Message-State: AOAM532BcxZukZrxNaC/1QdffUV8nYQwvzsDSV8ape7va/NgBJUcCAZE
        fXdcZ61ZOaSy1RjB0je6Rm0jQhqW02vIePasyx+zstrQqsE=
X-Google-Smtp-Source: ABdhPJwNWruDqc8gzXUhdfv/dZiPgTvO8Ur4b0qRy/QfIut/Pn/I+RIcKXgCFtbtPr5CTgNEMWOsP5KsZf288BM1Sjk=
X-Received: by 2002:a05:6e02:20ce:b0:2bf:6dd8:abf7 with SMTP id
 14-20020a056e0220ce00b002bf6dd8abf7mr2102359ilq.221.1645106204546; Thu, 17
 Feb 2022 05:56:44 -0800 (PST)
MIME-Version: 1.0
References: <cover.1645003763.git.siyanteng@loongson.cn> <0e3f618a914980ad649d956a43aeca93d71c1f79.1645003763.git.siyanteng@loongson.cn>
In-Reply-To: <0e3f618a914980ad649d956a43aeca93d71c1f79.1645003763.git.siyanteng@loongson.cn>
From:   Alex Shi <seakeel@gmail.com>
Date:   Thu, 17 Feb 2022 21:56:08 +0800
Message-ID: <CAJy-AmnkobznP4_kaZBvBuk2UJj4RYmjHS6cuYLFBaY8F_brxw@mail.gmail.com>
Subject: Re: [PATCH 2/5] docs/zh_CN: add admin-guide damon index translation
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     corbet@lwn.net, alexs@kernel.org,
        Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 16, 2022 at 5:38 PM Yanteng Si <siyanteng01@gmail.com> wrote:
>
> Translate .../admin-guide/mm/damon/index.rst into Chinese.
>
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Alex Shi <alexs@kernel.org>

> ---
>  .../zh_CN/admin-guide/mm/damon/index.rst      | 26 +++++++++++++++++++
>  .../zh_CN/admin-guide/mm/index.rst            |  2 +-
>  2 files changed, 27 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/damon=
/index.rst
>
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/damon/index.=
rst b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> new file mode 100644
> index 000000000000..4581e1bc2506
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/damon/index.rst
> @@ -0,0 +1,26 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +.. include:: ../../../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/admin-guide/mm/damon/index.rst
> +
> +:=E7=BF=BB=E8=AF=91:
> +
> + =E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
> +
> +:=E6=A0=A1=E8=AF=91:
> +
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +=E7=9B=91=E6=B5=8B=E6=95=B0=E6=8D=AE=E8=AE=BF=E9=97=AE
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +:doc:`DAMON </vm/damon/index>` =E5=85=81=E8=AE=B8=E8=BD=BB=E9=87=8F=E7=
=BA=A7=E7=9A=84=E6=95=B0=E6=8D=AE=E8=AE=BF=E9=97=AE=E7=9B=91=E6=B5=8B=E3=80=
=82=E4=BD=BF=E7=94=A8DAMON=EF=BC=8C
> +=E7=94=A8=E6=88=B7=E5=8F=AF=E4=BB=A5=E5=88=86=E6=9E=90=E4=BB=96=E4=BB=AC=
=E7=B3=BB=E7=BB=9F=E7=9A=84=E5=86=85=E5=AD=98=E8=AE=BF=E9=97=AE=E6=A8=A1=E5=
=BC=8F=EF=BC=8C=E5=B9=B6=E4=BC=98=E5=8C=96=E5=AE=83=E4=BB=AC=E3=80=82
> +
> +.. toctree::
> +   :maxdepth: 2
> +
> +Todolist:
> +
> +*   start
> +*   usage
> +*   reclaim
> diff --git a/Documentation/translations/zh_CN/admin-guide/mm/index.rst b/=
Documentation/translations/zh_CN/admin-guide/mm/index.rst
> index b2c114075090..181eb4cd6aae 100644
> --- a/Documentation/translations/zh_CN/admin-guide/mm/index.rst
> +++ b/Documentation/translations/zh_CN/admin-guide/mm/index.rst
> @@ -29,12 +29,12 @@ Linux=E5=86=85=E5=AD=98=E7=AE=A1=E7=90=86=E6=9C=89=E5=
=AE=83=E8=87=AA=E5=B7=B1=E7=9A=84=E6=9C=AF=E8=AF=AD=EF=BC=8C=E5=A6=82=E6=9E=
=9C=E4=BD=A0=E8=BF=98=E4=B8=8D=E7=86=9F=E6=82=89=E5=AE=83=EF=BC=8C=E8=AF=B7=
=E8=80=83=E8=99=91=E9=98=85
>  .. toctree::
>     :maxdepth: 1
>
> +   damon/index
>     ksm
>
>  Todolist:
>  * concepts
>  * cma_debugfs
> -* damon/index
>  * hugetlbpage
>  * idle_page_tracking
>  * memory-hotplug
> --
> 2.27.0
>
