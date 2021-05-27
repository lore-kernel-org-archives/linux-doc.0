Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.5 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,UNWANTED_LANGUAGE_BODY,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF509C47089
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 14:55:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B75B46128D
	for <linux-doc@archiver.kernel.org>; Thu, 27 May 2021 14:55:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236672AbhE0O5D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 27 May 2021 10:57:03 -0400
Received: from [43.250.32.171] ([43.250.32.171]:32990 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S234847AbhE0O5B (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 27 May 2021 10:57:01 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=56CYFu7ltMxKzkiBa1tODJbIqoS3tHuQ9tbXl
        Zodd6o=; b=IyvqWtbNkUXQ9x7WiniyYMbLm/+XpJmJDvjRvOFd62nfn21IlceHT
        v/hTEf+O3eaC5FoaaXB+FV3ZjqL6PRc5lKzOP5ocy45WrIBIKfLro3/aG89r6HyX
        +465/ebb6i2unn/o4ML6K9tiX2EhogWjMI+nNG1DlVPpIVbGuOoym4=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgDnrkHSsq9gEZRBAA--.22454S2;
        Thu, 27 May 2021 22:55:16 +0800 (CST)
Date:   Thu, 27 May 2021 22:55:13 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>
Subject: Re: [PATCH] docs/zh_CN:add core-api padata translation
Message-ID: <20210527145513.GA23113@bobwxc.top>
References: <20210525120501.2149992-1-siyanteng@loongson.cn>
 <20210526171811.GA3700@bobwxc.top>
 <CAEensMxugEQVKmjByUPCfDbDtDDkfVkUYY-oy323xTQShDskkg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PEIAKu/WMn1b1Hv9"
Content-Disposition: inline
In-Reply-To: <CAEensMxugEQVKmjByUPCfDbDtDDkfVkUYY-oy323xTQShDskkg@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgDnrkHSsq9gEZRBAA--.22454S2
X-Coremail-Antispam: 1UD129KBjvdXoW7JF1xur4UKryxCF4fZw4DCFg_yoWfArb_X3
        WDAFWqkr4qq397Ww4xJrnrA39FqFZ5CF1rJa1UZFy7GFsI9FyUZrWUAa1IvF15ZF48Xw47
        Cr15XF4jgFy7XjkaLaAFLSUrUUUUUb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
        9fnUUIcSsGvfJTRUUUbYAYjsxI4VWxJwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
        s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
        8IcVAFwI0_Gr0_Xr1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1l84ACjcxK6I8E
        87Iv67AKxVW0oVCq3wA2z4x0Y4vEx4A2jsIEc7CjxVAFwI0_Gr1j6F4UJwAS0I0E0xvYzx
        vE52x082IY62kv0487M2AExVA0xI801c8C04v7Mc02F40EFcxC0VAKzVAqx4xG6I80ewAv
        7VCjz48v1sIEY20_Cr1UJr1lOx8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxAIw2
        8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_Cr1UJr1l4I8I3I0E4IkC6x0Yz7v_Jr0_
        Gr1lx2IqxVAqx4xG67AKxVWUJVWUGwC20s026x8GjcxK67AKxVWUGVWUWwC2zVAF1VAY17
        CE14v26r1q6r43MIIYrxkI7VAKI48JMIIF0xvE2Ix0cI8IcVAFwI0_Jr0_JF4lIxAIcVC0
        I7IYx2IY6xkF7I0E14v26r1j6r4UMIIF0xvE42xK8VAvwI8IcIk0rVWUJVWUCwCI42IY6I
        8E87Iv67AKxVWUJVW8JwCI42IY6I8E87Iv6xkF7I0E14v26r4j6r4UJbIYCTnIWIevJa73
        UjIFyTuYvj4RRbyZUUUUU
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--PEIAKu/WMn1b1Hv9
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 27, 2021 at 03:07:29PM +0800, yanteng si wrote:
> > > +
> > > +Padata=E6=98=AF=E4=B8=80=E7=A7=8D=E6=9C=BA=E5=88=B6=EF=BC=8C=E9=80=
=9A=E8=BF=87=E8=BF=99=E7=A7=8D=E6=9C=BA=E5=88=B6=EF=BC=8C=E5=86=85=E6=A0=B8=
=E5=8F=AF=E4=BB=A5=E5=B0=86=E5=B7=A5=E4=BD=9C=E5=88=86=E6=95=A3=E5=88=B0=E5=
=A4=9A=E4=B8=AACPU=E4=B8=8A=E5=B9=B6=E8=A1=8C=E5=AE=8C=E6=88=90=EF=BC=8C=E5=
=90=8C=E6=97=B6
> >
> > maybe more compact
> > =E9=80=9A=E8=BF=87=E6=AD=A4=E6=9C=BA=E5=88=B6=E5=86=85=E6=A0=B8=E5=8F=
=AF=E4=BB=A5
> how about:
> =E5=86=85=E6=A0=B8=E5=8F=AF=E4=BB=A5=E9=80=9A=E8=BF=87=E6=AD=A4=E6=9C=BA=
=E5=88=B6

ok

> >
> > > +=E5=8F=AF=E4=BB=A5=E9=80=89=E6=8B=A9=E4=BF=9D=E6=8C=81=E5=AE=83=E4=
=BB=AC=E7=9A=84=E9=A1=BA=E5=BA=8F=E3=80=82
> > > +
> > > +=E5=AE=83=E6=9C=80=E5=88=9D=E6=98=AF=E4=B8=BAIPsec=E5=BC=80=E5=8F=91=
=E7=9A=84=EF=BC=8C=E5=AE=83=E9=9C=80=E8=A6=81=E5=9C=A8=E4=B8=8D=E5=AF=B9=E8=
=BF=99=E4=BA=9B=E6=95=B0=E6=8D=AE=E5=8C=85=E9=87=8D=E6=96=B0=E6=8E=92=E5=BA=
=8F=E7=9A=84=E5=85=B6=E5=89=8D=E6=8F=90=E4=B8=8B=EF=BC=8C=E4=B8=BA=E5=A4=A7=
=E9=87=8F=E7=9A=84=E6=95=B0
> > > +=E6=8D=AE=E5=8C=85=E8=BF=9B=E8=A1=8C=E5=8A=A0=E5=AF=86=E5=92=8C=E8=
=A7=A3=E5=AF=86=E3=80=82=E8=BF=99=E6=98=AF=E7=9B=AE=E5=89=8Dpadata=E7=9A=84=
=E5=BA=8F=E5=88=97=E5=8C=96=E4=BD=9C=E4=B8=9A=E6=94=AF=E6=8C=81=E7=9A=84=E5=
=94=AF=E4=B8=80=E7=94=A8=E9=80=94=E3=80=82
> > > +
> > > +Padata=E8=BF=98=E6=94=AF=E6=8C=81=E5=A4=9A=E7=BA=BF=E7=A8=8B=E4=BD=
=9C=E4=B8=9A=EF=BC=8C=E5=B0=86=E4=BD=9C=E4=B8=9A=E5=B9=B3=E5=9D=87=E5=88=86=
=E5=89=B2=EF=BC=8C=E5=90=8C=E6=97=B6=E5=9C=A8=E7=BA=BF=E7=A8=8B=E4=B9=8B=E9=
=97=B4=E8=BF=9B=E8=A1=8C=E8=B4=9F=E8=BD=BD=E5=9D=87=E8=A1=A1=E5=92=8C=E5=8D=
=8F=E8=B0=83=E3=80=82
> > > +
> > > +=E5=BA=8F=E5=88=97=E5=8C=96=E4=BD=9C=E4=B8=9A=E8=BF=90=E8=A1=8C
> >
> > =E8=BF=90=E8=A1=8C=E5=BA=8F=E5=88=97=E5=8C=96=E4=BD=9C=E4=B8=9A
> s/=E5=BA=8F=E5=88=97=E5=8C=96=E4=BD=9C=E4=B8=9A=E8=BF=90=E8=A1=8C/=E6=89=
=A7=E8=A1=8C=E5=BA=8F=E5=88=97=E5=8C=96=E4=BD=9C=E4=B8=9A/

ok

Thanks,
	Wu X.C.

--PEIAKu/WMn1b1Hv9
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCvssgACgkQtlsoEiKC
sIUwIAwAnebqnCXlaF9QFj/miQPjhz5GYdLHEGDYMhO3MU+5dQV1yzfFqz4nJZB2
VXJf/u+KqC4W1A9s+dVt87TjqetTyiB60n3LoX6CE6y3yimOr9Q0YdvVCFHJPCTa
aQvGEVwBn3jMEz1CzvfFXPCUzAfYOu9FAkXYI7piWro5kKHHgdxc89sagivV2AE8
QOjjP2/i108TskrAsE2dTDUD/2vMFMDoAtXinjoxZ5DV+CycSTfm2NASRSLy5JCF
/OdEbj+EgL6u+JpsZsH4IzRdrVQ6kn1wT48amLbON15ObxvEtnKYrx5TQaE+OtQU
A4dk1bbDnHsNWfYaFbvpA/J0lGDbbZiOPtCqQe2RqGc9m7EBQJJcg6pZzG+pckrk
HTPQfCXMzcKCje5dHeLC72ojput66MuS7plonN4bNJxMhr0D4B23TevgJGdeI7M4
99KnLAYwODp6QBIX7pgyqUapI1vxSgz/e0o8aqEzA9AZ3OpUjAk8fzQPlzCyrfQu
I3XMTvw6
=iunP
-----END PGP SIGNATURE-----

--PEIAKu/WMn1b1Hv9--

