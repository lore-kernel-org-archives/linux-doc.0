Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D2FEC433ED
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:35:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0443F6135B
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 07:35:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230368AbhEUHgl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 03:36:41 -0400
Received: from m32-153.88.com ([43.250.32.153]:22249 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230050AbhEUHgj (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 03:36:39 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=+zKQjOMGl+a8TUgfLxvBgVvH50an1StIfdIa8
        OEAawU=; b=R7XfepCBVy9Zr7YJNRhH0bYtcDhPzCX9QM/KYpgEGsH41BHoDzXen
        RhIIauGy6O6F4xU9I7sk2CvPifsmypX/z6uDwBe9oEea1ovS028IQOVGJPiNlUOy
        1j7LBVyyP0sP7NXyAcl4s36pDRea1kvC95+42RJ6CNRBjuGHb6u+eI=
Received: from bobwxc.top (unknown [120.238.248.9])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgAHVliqYqdgJSs_AA--.25978S2;
        Fri, 21 May 2021 15:35:08 +0800 (CST)
Date:   Fri, 21 May 2021 15:35:06 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        realpuyuwang@gmail.com, siyanteng01@gmail.com
Subject: Re: [PATCH v2 1/2] docs/zh_CN:add core-api refcount-vs-atomic.rst
 translation.
Message-ID: <20210521073506.GA17489@bobwxc.top>
References: <cover.1621579507.git.siyanteng@loongson.cn>
 <9162060ee59edb51586a950cf00ad9f6e2bbecdb.1621579507.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="RnlQjJ0d97Da+TV1"
Content-Disposition: inline
In-Reply-To: <9162060ee59edb51586a950cf00ad9f6e2bbecdb.1621579507.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgAHVliqYqdgJSs_AA--.25978S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5B7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW7JVWDJwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwA2z4x0Y4vEx4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW8Jr
        0_Cr1UM2AIxVAIcxkEcVAq07x20xvEncxIr21le4C267I2x7xF54xIwI1l5I8CrVACY4xI
        64kE6c02F40Ex7xfMcIj6x8ErcxFaVAv8VWxJr1UJwAm72CE4IkC6x0Yz7v_Jr0_Gr1lF7
        xvr2IY64vIr41l42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x0zR_Oz3UUUUU=
X-Originating-IP: [120.238.248.9]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--RnlQjJ0d97Da+TV1
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 03:10:36PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/refcount-vs-atomic.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/index.rst     |   3 +-
>  .../zh_CN/core-api/refcount-vs-atomic.rst     | 154 ++++++++++++++++++
>  2 files changed, 156 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/refcount-vs=
-atomic.rst
>=20

--RnlQjJ0d97Da+TV1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCnYqYACgkQtlsoEiKC
sIVhYgv+P+OdR1BqJwR0U92xYuNFyMNJDiBWOmXZq+V1VQbgq49em9ex8f0WTEps
23bE5CB0R1FXqMIgenOyA+gh5sUq61k0PPRpu/6gSrKVwpQvu29o4YrNKBX6Grt2
fWuDWsQvdE8q6bregzJ2+kP0dASwTTi3ba5vKZMwtwzIG3ifVA8MWsxnvAwNIKj3
M4mArKzVb+0UW/W0iQyiFnXhrplSC0AYJIwwU3FyImLS6QKLjvYuYmqrLl9STYxT
ObLUxcKFEKar5vivPm6D0TB8tHTE7UChfsxs9d5Kucwlkz8UbxB6Cw5yUZ/hnt23
hTJG1eYpsr/CJ1MnsG70hbaEIyP797rrwHFqLewyOsioDRpPwZPk+kNZ0BU4xLwg
VvEHZ2BdRUx+2pKAdr2l7Fo96xBebrZX1yIY61+yAmR/UbNNjLJ1BB/NR/1Z2q/S
M/Hq9gP4crUEwM/bySd5HOVzJrmt8ICUYc11HcGcpPI2CcibNxftPJm02sYs+yN0
WXiwJu4K
=plnN
-----END PGP SIGNATURE-----

--RnlQjJ0d97Da+TV1--

