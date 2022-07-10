Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A869C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 10 Jul 2022 15:00:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229477AbiGJPAC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 10 Jul 2022 11:00:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbiGJPAB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 10 Jul 2022 11:00:01 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6838BDE98
        for <linux-doc@vger.kernel.org>; Sun, 10 Jul 2022 07:59:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=kEbxQeeWmpNqpT98sIgf+ix6ZDZA0MwGzFcKG
        gNb26Y=; b=HgvCBtXWD/PyFwW5mUXXgtFj4u9CwbcKD/1YPmh6a77LdcAeYlpgQ
        cEw8cG6OzvOeP+MwtpdKMCTtZFkXCE+6LYYcML/8z4ur6boDuMfQliZiSZjtixLH
        556Ghjawe20qf3c+TwQkHSc4XEf5SAwaJJ0S9UHKx+fK3GwrfMrItI=
Received: from bobwxc.mipc (unknown [120.242.68.215])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgCHN2Rf6cpizDMkAA--.27533S2;
        Sun, 10 Jul 2022 22:59:45 +0800 (CST)
Date:   Sun, 10 Jul 2022 22:59:41 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, zhoubb.aaron@gmail.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH V3] docs/zh_CN: core-api: Add watch_queue Chinese
 translation
Message-ID: <YsrpXdAowJ4mwLgb@bobwxc.mipc>
References: <20220710133604.31382-1-zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ckQUtaJH/jqYsmRp"
Content-Disposition: inline
In-Reply-To: <20220710133604.31382-1-zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgCHN2Rf6cpizDMkAA--.27533S2
X-Coremail-Antispam: 1UD129KBjvdXoWrZFWfJw13CF1kAFykZFWUArb_yoWDCwc_Zr
        srta40kws8GF92gayrtr1xJry29FWUu3WFgF4DJ398Gr98JrZxWrykWF9Yqay0yws5CrW5
        uF1xXwnavr17WjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYkYjsxI4VW7JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487M2AExVA0xI801c8C04v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r126r1DMIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r1j6r4UYxBIdaVFxhVjvjDU
        0xZFpf9x0pRiZ2fUUUUU=
X-Originating-IP: [120.242.68.215]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--ckQUtaJH/jqYsmRp
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 10, 2022 at 09:36:04PM +0800, Binbin Zhou wrote:
> Translate core-api/watch_queue.rst into Chinese.
>=20
> Last English version used:
> commit f5461124d59b ("Documentation: move watch_queue to core-api").
>=20
> Signed-off-by: Binbin Zhou <zhoubinbin@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu

> ---
>=20
> Changes since v2:
>=20
> Take Xiangcheng's advice and add his proofreading signature to
> watch_queue.rst, thanks.
>=20
> Details:
> https://lore.kernel.org/linux-doc/YsbjmEhOjUrYqml4@bobwxc.mipc/
>=20
> Changes since v1:
>=20
> Take Yanteng's advice and add his proofreading signature to
> watch_queue.rst, thanks.
>=20
> Details:
> https://lore.kernel.org/linux-doc/ea5f1206-f34c-9907-e7c4-f97122e84dce@lo=
ongson.cn/
>=20
> ---
>  .../translations/zh_CN/core-api/index.rst     |   1 +
>  .../zh_CN/core-api/watch_queue.rst            | 313 ++++++++++++++++++
>  2 files changed, 314 insertions(+)
>  create mode 100644 Documentation/translations/zh_CN/core-api/watch_queue=
=2Erst

--ckQUtaJH/jqYsmRp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmLK6VgACgkQtlsoEiKC
sIUrrgwA0b7/OWsIIcwL1yk8fuzYtBSUGAMHa06SNy5Nlxc4iJTrccsmaZ7SGad7
EVYwO9ZNnpV0OWGuo5+4XXcusHZzk0eqElicSaGHqTKEV0YCD/hdkguO6w+lZKWH
U0TRerGEWjc+o6VlMgw6FHclwBJfblAt88d6BEewHXFz+ln3qHXFcx1+5V3t+I6V
mr8wmYnqi0VdrS8t4mOJfKSVEt9fYFZj2pkrNmisSzmpVAEt1RFe4iTdYHSo711l
CkaGF7Q12WhuCFjDjID7njrmPT7ZDWyceX6H0FzO+yLaeJaMTE8J53BNH27EiRlM
63oAZ/q+qQL5+hpWf14uZ98EFr05hV3WPm4wlxMmG82OoZmKApfK74TRhFqZyFrD
sysJ44HSPj/Xtq9Aa2xDoaS0MTiVSElwxglN/oP63VCKMRP1uwukNDRc2W8Pf8ZO
1Wg1fem2UlepHhKoQY9OhS/pibpOE6ZrcLqzj57OVgGI02UHsmDcqrjVRZmrXEbT
qw+wJzXt
=r27G
-----END PGP SIGNATURE-----

--ckQUtaJH/jqYsmRp--

