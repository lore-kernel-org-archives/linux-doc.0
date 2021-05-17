Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 308BFC433B4
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 12:13:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0D33D61241
	for <linux-doc@archiver.kernel.org>; Mon, 17 May 2021 12:13:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233524AbhEQMPJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 17 May 2021 08:15:09 -0400
Received: from m32-153.88.com ([43.250.32.153]:60780 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S231755AbhEQMPJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 17 May 2021 08:15:09 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=5LcZ5NVdkKz4lu3UF6Nor2DBQSs0o7aNaolWs
        ba970M=; b=jKk8yjBEgB8jkHEmjMAvCp3LhRB34fqlhQzn6g9J2Kj8/+vjOTN84
        JeZkTe5jugPrBYakdcoW+h4XbJrQqEbKYSQnF0Sliu7gh2HGrhxhDTRwr/MQsZnT
        gJAUbkNR53O04+hDcLxTN6sqHCSx4UZ4jgTVTnK8uWZmtYejpBHBD0=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXJlnzXaJgpwE3AA--.8130S2;
        Mon, 17 May 2021 20:13:41 +0800 (CST)
Date:   Mon, 17 May 2021 20:13:39 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com,
        huangjianghui@uniontech.com
Subject: Re: [PATCH v2] docs/zh_CN: add core api kobject translation
Message-ID: <20210517121339.GA15899@bobwxc.top>
References: <20210517095605.3234438-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="zhXaljGHf11kAtnf"
Content-Disposition: inline
In-Reply-To: <20210517095605.3234438-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXJlnzXaJgpwE3AA--.8130S2
X-Coremail-Antispam: 1UD129KBjvJXoW7AF43JF1rJw1fCF4kWry3urg_yoW8ArWkpF
        s2k34Sg3Z8tF17uws7WF4UWF18ZFWfWan8WanFqwnYqrs8Gr4Fvr4UtrZIgFWxXrZ2yFWr
        Za1avr9Yk34jy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgSb7Iv0xC_tr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2Kfnx
        nUUI43ZEXa7IUU0tC7UUUUU==
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--zhXaljGHf11kAtnf
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 17, 2021 at 05:56:05PM +0800, Yanteng Si wrote:
> v2:
>=20
> Modified some words under Xiangcheng Wu's advices.
> Thanks for his review!
> https://lore.kernel.org/linux-doc/CAEensMw+PPjwS4p7k39xouww0hz8D2LZG67Nm1=
hq9vSrRmFqJw@mail.gmail.com/T/#t
>=20
> v1:
>=20

Please write Changelog under three dashes(---), or the commit message
will become:

commit 5a7b5d7ebdb1b6859db90da953c976b887740a7c
Author: Yanteng Si <siyanteng@loongson.cn>
Date:   Mon May 17 17:56:05 2021 +0800

    docs/zh_CN: add core api kobject translation

    v2:

    Modified some words under Xiangcheng Wu's advices.
    Thanks for his review!
    https://lore.kernel.org/linux-doc/CAEensMw+PPjwS4p7k39xouww0hz8D2LZG67N=
m1hq9vSrRmFqJw@mail.gmail.com/T/#t

    v1:

    * This patch translates Documentation/core-api/kobject.rst into Chinese.

    Signed-off-by: Yanteng Si <siyanteng@loongson.cn>



> * This patch translates Documentation/core-api/kobject.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

All others,

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks

> ---
>  .../translations/zh_CN/core-api/index.rst     |   6 +-
>  .../translations/zh_CN/core-api/kobject.rst   | 378 ++++++++++++++++++
>  2 files changed, 383 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/kobject.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index f1fa71e45c77..b4cfb4adfcc3 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst
> @@ -32,9 +32,13 @@ Todolist:
> =20

--zhXaljGHf11kAtnf
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCiXe8ACgkQtlsoEiKC
sIVOlQv/SAh/K9PhV3jE4L34tgnioxcYmwovXw2/cnu0MdW5AkeIum8vPtfdRGsd
rKsJaqMOV26TAV8t8Ki5hzGdNsMw//Pb9aSX6TNKO3CV2PqbZ2elDShYVdMvg1vf
KzN1xkNmN8WcMEK428jWbKlTVo/FH/WluOh27nu75/GXcEn8GYyRdEXRAn6T8uuO
lCGynW96pfbbUcZ5QcSYfCTYfagk71PRom4a36bn59KfWu5QwUylHZ4ULgC+GnIB
8/l8+TcgJ5FR8IhaKBhfSiVcwHVDZ0rEplDEueeGdqUoQKVXslP1Es3A7dzGDvSW
gJLbfkn59FS4WUGiKnhJG33vzt/o9h08/iTgDjZxopo+outHFeAhh36JBuSaGeR0
78dPF1wouwn76Dl+v595f3SyMenYK0XdNlxGN1h6fJhKyAAO1lmNUB8mbtkJtV+n
r6AnCmFpIV7MurLQJKsEYEMOoq7EFgT/E9PiGQMwUywYOVGPCggOuunzCWwORGK1
xnhM22mY
=qKkY
-----END PGP SIGNATURE-----

--zhXaljGHf11kAtnf--

