Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C911C4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 05:34:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 47BE0608FE
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 05:34:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229758AbhFWFhG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 01:37:06 -0400
Received: from m32-153.88.com ([43.250.32.153]:26810 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229665AbhFWFhG (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 01:37:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=bpukb5ZEIpEhOWbx0Jc4tB2OJGavh3UCtW/yz
        QlKs7w=; b=OnaOAZWRejQKHZT6OyA+keIZ67MaBVt/yFlw+T2zBSuTXfIeX7FRt
        YBCqM8VukQ0P7NNbz1+uOqbcBZIXfxpuVsRTyvowoQaJ2fsnxNN74GZ/y91lSmGg
        zxP/c+JBnFygpUXDuKzmQ6/I3JYr0nko3q0nacZlgWJJ4duaieTqg8=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgDXrfzux9Jgr70lAA--.14949S2;
        Wed, 23 Jun 2021 13:34:40 +0800 (CST)
Date:   Wed, 23 Jun 2021 13:34:38 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2] docs/zh_CN: add core api genericirq translation
Message-ID: <20210623053438.GA17155@bobwxc.top>
References: <20210622134109.1872740-1-siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="NzB8fVQJ5HfG6fxh"
Content-Disposition: inline
In-Reply-To: <20210622134109.1872740-1-siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgDXrfzux9Jgr70lAA--.14949S2
X-Coremail-Antispam: 1UD129KBjvdXoW7GrWUZF13Cw47uF1rZw1fZwb_yoWDXwb_Aa
        1kAFW0kF4jvFn3KF4rJF1UJrW7uF4Sk34kKFn8t3s8J3y5Gr4kCw1kXF95WayDCanrurZr
        Ka9ruwn2qFnFgjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1l84ACjcxK6I8E
        87Iv67AKxVWxJr0_GcWl84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvj4RRbyZUUUUU
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--NzB8fVQJ5HfG6fxh
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 09:41:09PM +0800, Yanteng Si wrote:
> translate Documentation/core-api/genericirq.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
> v2:
> * Modified some words under Xiangcheng's advices;
> * add =E6=A0=A1=E8=AF=91=E8=80=85(proofreading) sign.If you don't want me=
 to do this, please let me know.
>=20
>  .../zh_CN/core-api/genericirq.rst             | 409 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  2 files changed, 410 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/genericirq.=
rst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/genericirq.rst b/D=
ocumentation/translations/zh_CN/core-api/genericirq.rst
> new file mode 100644
> index 000000000000..be0066cdbe38
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/genericirq.rst
> @@ -0,0 +1,409 @@
[...]

Thanks,
	Wu X.C.

--NzB8fVQJ5HfG6fxh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDSx+sACgkQtlsoEiKC
sIWMygwAxZRK9pZKM+QDlSoXklxkO6t9reGLIwSffKiOzAOE2SpQli6HyKGskq5V
HbltxNYlV3JhPqNWVXEvBeWSrw5MCCITNaqu3aw9U8GzQVo+piTp5wIuJIDvwjOa
4sN9NO0MSTSKdau7VA9GsgECdp20pwmMupEBqOEYsDiID9V8JwuGJkYH1E8GkWXv
GBBWyNgvlh21s7W3ZV7EpaQ0S6gDGoqLK5bzp+4NPUNNvzgkgpxcfWnaxFMeVZwN
oEEtaZxByar6Tejdmp7yaN/Jovqzi3zafWWV/nt5Fv2CACs0jgPXJXnZEnx32KMR
VzQnJ3lY8lJZ0dooGoAkFTH/Q4FcZAJeUMp7XT4fEWiNuC0VyqWcR2/J1Di1LGqu
3cqEgcwWBMjNTYugOHOEtxbYqjCrouMYH4csomcbi9WruyvuzjrSJpnbtgAjKd9N
oE8E8m/VaT9ttFCAeM7z/pZeBPdM4IPKY4uBOUr9a4Wt0ebR75evqmi7v3R7qQs1
S27FffAq
=EP3U
-----END PGP SIGNATURE-----

--NzB8fVQJ5HfG6fxh--

