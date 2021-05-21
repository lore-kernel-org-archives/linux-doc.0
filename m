Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13A57C433B4
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:38:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DAA5961363
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:38:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232153AbhEUHjr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 03:39:47 -0400
Received: from [43.250.32.171] ([43.250.32.171]:6545 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S230050AbhEUHjq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 03:39:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=64lddD7suh54pLNjxbC5cT6FwSbwlgT7cTu86
        Nf2hys=; b=jzpoyDTbZ+Y4RCDHAQ/wFamwKDssBFYc8EWA7pJUDbM/AUTDXCJdn
        YczFiGFXM9p4PnU1JZf+0EQctwS94Qaaa16Iwv47poP9Sc6OFEMrYEsZvqxxiGv5
        XPQRN0ptwUuPv/w1wtydy8KGANnbbiPIs+JSaYDPK/dxavOiGcXTI0=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBnLkFlY6dgJTY2AA--.63766S2;
        Fri, 21 May 2021 15:38:15 +0800 (CST)
Date:   Fri, 21 May 2021 15:38:13 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 2/2] docs/zh_CN: add core api local_ops.rst translation
Message-ID: <20210521073813.GB17489@bobwxc.top>
References: <cover.1621579507.git.siyanteng@loongson.cn>
 <9014aebd7e42544c34c4b32dbbf535406c60e894.1621579507.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="mojUlQ0s9EVzWg2t"
Content-Disposition: inline
In-Reply-To: <9014aebd7e42544c34c4b32dbbf535406c60e894.1621579507.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBnLkFlY6dgJTY2AA--.63766S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5B7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVW8
        JVWxJwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21le4C267I2x7xF54xIwI1l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7
        xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Gr0_Cr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU=
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--mojUlQ0s9EVzWg2t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 03:10:37PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/local_ops.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/index.rst     |   3 +-
>  .../translations/zh_CN/core-api/local_ops.rst | 194 ++++++++++++++++++
>  2 files changed, 195 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/local_ops.r=
st


--mojUlQ0s9EVzWg2t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCnY2QACgkQtlsoEiKC
sIU//gv/Yg3ad3Vct1ZLYN1BdRvk7JW916WR4llrrOvj5Uijp0OmfsqZcYXDSFXF
Irz+vl1pQD8mHZb4/Q02BWucwZU5++/pK/PhrZvdE3IBq4F9IBwZ/gh/n73Hwir1
VzsLzix63d/80iGWZ3O0RBOFehugKvKBOHigdhf4nXR3tl8bYE+7AToQ9kQykvY5
Q9iZl+KPvA5Nc8Gt1iaPGl/LeeF2v48xwANG85H/vkW70y81rZ7dWbUHhneAEYCz
9OQEsbcvqE+8JZx4USCuRZaBeR5MooLmGo/pim47gOqwrGfVHpyz8ZxAfigV/zyl
KGnFBd8vlyAwdkZK+yK2DFBdmiNgRQ4guOYE5c+rxUojbheqUFhwNJ5mRMN5Tev+
RIFLnptCt3Rq/2fKXd9Mht6pbBv1tvg0dqPvZHV9YheV5no4hjercWuBNEeSXTC4
YwH0dxXm2JXDrwLZ4BQYjKc1jTOiCIqZCmTMGPhV9QrkYrsig+zf8jlPlPUpmrVb
FFWdni/L
=fgLU
-----END PGP SIGNATURE-----

--mojUlQ0s9EVzWg2t--

