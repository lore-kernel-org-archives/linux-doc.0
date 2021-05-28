Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10E78C4708C
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 10:04:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA65F611AE
	for <linux-doc@archiver.kernel.org>; Fri, 28 May 2021 10:04:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236479AbhE1KGI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 28 May 2021 06:06:08 -0400
Received: from [43.250.32.171] ([43.250.32.171]:12240 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S236476AbhE1KF7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 28 May 2021 06:05:59 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Il8Xc+jJDepTzPTX3t8pFo98l6j8UWgUtCNhc
        aJJxMU=; b=IxmJB8SNxQaYUF8EOnCuPVqB3+Wl0X4mOshetsKDfeewCKGJA2Bp1
        lXQ7DtfkuJmm7LPEEG0WTLRVaIo25X2gGFPbxHS/dUJjaO5KIi0BzcpyIbhCyx5y
        3HQZDspYX+jPi4nPs3IEHMHZcfYN6a/Le0+OueUZ8uVZL34R0n1tGY=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnrkEbwLBgY_BCAA--.25472S2;
        Fri, 28 May 2021 18:04:14 +0800 (CST)
Date:   Fri, 28 May 2021 18:04:11 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2] docs/zh_CN:add core-api padata translation
Message-ID: <20210528100410.GA2536@bobwxc.top>
References: <20210528092713.2624207-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LZvS9be/3tNcYl/X"
Content-Disposition: inline
In-Reply-To: <20210528092713.2624207-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnrkEbwLBgY_BCAA--.25472S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JFy8Aw4Dur4rAFyrCw45KFg_yoWDGFX_Za
        1kXFWvy39rZFyxKayrGr1UJr409F4Skw1vkFn8t398J34UWrZ7Gr1DXFykZF4UGanrur43
        CFWkur1SqFnrXjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbrAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487M2AExVA0xI801c8C04v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkIec
        xEwVAFwVW8twCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s02
        6xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_Jr
        I_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v2
        6r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj4
        0_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8
        JbIYCTnIWIevJa73UjIFyTuYvj4RROJ5DUUUU
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--LZvS9be/3tNcYl/X
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 28, 2021 at 05:27:13PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/padata.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu X.C.

> ---
> v2:
>=20
> * Modified some words under Xiangcheng's advices.
> * update Documentation/translations/zh_CN/core-api/index.rst diff.
>=20
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../translations/zh_CN/core-api/padata.rst    | 158 ++++++++++++++++++
>  2 files changed, 159 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/padata.rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Docume=
ntation/translations/zh_CN/core-api/index.rst
> index 4b7efb7edb18..b12c1566c29b 100644
> --- a/Documentation/translations/zh_CN/core-api/index.rst
> +++ b/Documentation/translations/zh_CN/core-api/index.rst

--LZvS9be/3tNcYl/X
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCwwBIACgkQtlsoEiKC
sIXdIgv/WE7nyl61VgZOpLw4D5ERkhaEPM2dwFIAYJRt9wFlrp5plk0KaLeiYVjY
x+WBl1fAqDSWj+3W75O0wcic4O2HxzHdWmKrEOhyDugAih3PrAcBAxQHgDpYoMuS
mXfQYETnTljeZhtTD7oL90Vs9C9GeBoCZcWx6onsqEItcjAx9sZ/NO8dhn4B/mT9
2JRMkOdV6aANFM7k+6eQt/LMkpEEja4nYCd8T9LTLHI6+ZxOAtQHiP8qJgK1uyFh
b/HCXj2whgykBhQRi6jx1es4/WPFPvNoT7csYQzUpPCxG9Q41ME+qE92ddSI097G
r7VWQZ4qtKJluJub1UF7iythQFrAKD0IXxg4W/CZf7jLqaOh6EgbB9l3Cll+qBqv
iV9OkkBZlBe2lWckBqz1++Bhx81jkRXyuNP3nIY6cEElrE2hC1ArSgwv6ISoDJfT
dWNOHc6OsP/875yxa1MYGsSO6uik7mRh/vVEV65+OlLRc73FDvH2Zkf4xeHkZECI
o22BlHrr
=p6vC
-----END PGP SIGNATURE-----

--LZvS9be/3tNcYl/X--

