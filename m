Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF7EEC4743C
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 05:54:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9616E611AD
	for <linux-doc@archiver.kernel.org>; Wed, 23 Jun 2021 05:54:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229882AbhFWF43 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Jun 2021 01:56:29 -0400
Received: from [43.250.32.171] ([43.250.32.171]:55240 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S229660AbhFWF43 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 23 Jun 2021 01:56:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=ogn7OtqgyC6Ll1d0xreZzZe5OVRC1T66L2dxg
        kGVBGU=; b=fp9ADgOjjYv65d5KUZwG987B+dE7ziQHFTREG/trz1NSFyR6W04gm
        wP7O3CwLuim4iH4u2Xx/yOZLvW2RBAnNsAsCSr2jf1N2n3PEPcHFGKrz2CAjzdMB
        0pxNhspWV1JMHsUBGdv2KBHNRY+LTCIiAF2X8hOqBSVwzyQimRw0q4=
Received: from bobwxc.top (unknown [120.238.248.220])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgBX8zZ6zNJgZQEgAA--.1031S2;
        Wed, 23 Jun 2021 13:54:05 +0800 (CST)
Date:   Wed, 23 Jun 2021 13:54:02 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH v3 1/2] docs/zh_CN: add core api memory_hotplug
 translation
Message-ID: <20210623055402.GA20108@bobwxc.top>
References: <cover.1624370078.git.siyanteng@loongson.cn>
 <c8363a35d70e0781d81fa678ad7b95a4b5690664.1624370078.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="C7zPtVaVf+AK4Oqc"
Content-Disposition: inline
In-Reply-To: <c8363a35d70e0781d81fa678ad7b95a4b5690664.1624370078.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgBX8zZ6zNJgZQEgAA--.1031S2
X-Coremail-Antispam: 1UD129KBjDUn29KB7ZKAUJUUUUU529EdanIXcx71UUUUU7v73
        VFW2AGmfu7bjvjm3AaLaJ3UjIYCTnIWjp_UUU5C7k0a2IF6F4UM7kC6x804xWl1xkIjI8I
        6I8E6xAIw20EY4v20xvaj40_Wr0E3s1l8cAvFVAK0II2c7xJM28CjxkF64kEwVA0rcxSw2
        x7M28EF7xvwVC0I7IYx2IY67AKxVW5JVW7JwA2z4x0Y4vE2Ix0cI8IcVCY1x0267AKxVWU
        JVW8JwA2z4x0Y4vEx4A2jsIE14v26F4UJVW0owA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr
        1j6F4UJwAS0I0E0xvYzxvE52x082IY62kv0487M2AExVA0xI801c8C04v7Mc02F40EFcxC
        0VAKzVAqx4xG6I80ewAv7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4
        x0Y48IcVAKI48JMxkIecxEwVAFwVW8WwCF04k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv
        6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2
        IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI
        42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42
        IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280
        aVCY1x0267AKxVW8JVW8JrUvcSsGvfC2KfnxnUUI43ZEXa7IUUO6pPUUUUU==
X-Originating-IP: [120.238.248.220]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--C7zPtVaVf+AK4Oqc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 22, 2021 at 10:00:17PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/memory_hotplug.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>

Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

> ---
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  .../zh_CN/core-api/memory-hotplug.rst         | 126 ++++++++++++++++++
>  2 files changed, 127 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/memory-hotp=
lug.rst
[...]

Thanks,
	Wu X.C.

--C7zPtVaVf+AK4Oqc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDSzHkACgkQtlsoEiKC
sIV7ewv/TInD8t+FXc68FO1NEUrKAMVmaTSbc2FXgYRaY55pb43isQwH+iY0DHiK
fg1+oYSCbQDnsFrulf9CEA054VTUEs5/D+AdPxgtfk5s/hEzIuHhMlLwFWQi6SSL
43i5HHgOKLzjV6z3fI7aE5JBmhk/+V6cq+1ZdGZX0rJSnKPC/FO9CK+nZQcSO/cj
9FVFguJhcpFEWsUv24SWUC0AFO3Fd/8MaFnzqgxpEC/qNi8LWnYh8OHj605lSl7w
KXT/CJLh+wdtFSse7gt/xQoe+/Fj1KWrOVaDPf/8kX7A09+oh1tT7KZebjyz7CvL
jHqNIIT7jIgQPu6xeRYjpi+Tb1kbAVtcxztNqIM70Gap329sQ3OV9ZhRrruYATx4
FNjY21e+LWeHknlJsjl6AuB9vvrSzOvzLJKqzlion5HqO1mKWwXa5zOBU6mOzXTA
OP6xF6k+Np5zbwYL3ygZJKFJE+fNMy9gGU1CqD5GerB/VkcdvuNLFalQblrFS6Cl
SKEJY1n7
=+w22
-----END PGP SIGNATURE-----

--C7zPtVaVf+AK4Oqc--

