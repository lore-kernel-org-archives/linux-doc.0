Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4D208C433ED
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 06:16:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30B2661004
	for <linux-doc@archiver.kernel.org>; Fri, 21 May 2021 06:16:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230381AbhEUGRq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 May 2021 02:17:46 -0400
Received: from [43.250.32.171] ([43.250.32.171]:60098 "EHLO email.cn"
        rhost-flags-FAIL-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S231816AbhEUGRp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 21 May 2021 02:17:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=BUAG99hsMEHzOAPxz127i5WDo1GE0kz4CSiAM
        WDnXB4=; b=C9UEQDAwkrd1WILpuLkWX5QrxJMYYDciwY6yuHMkPuBIbHitby4Cg
        bZ4KAX4ObVZBNXlorzBFE5Pi1aI8HdKD76FsxSVsrMccfiJCoKNrCnx6hOkNHzxn
        k/SsVGZPTwe9ObqEQIR9c/kMWm7tSgvLotcNRhVBdqp1l76dOH9/wQ=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgCXXkEpUKdgVRs2AA--.63205S2;
        Fri, 21 May 2021 14:16:11 +0800 (CST)
Date:   Fri, 21 May 2021 14:16:09 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     yanteng si <siyanteng01@gmail.com>
Cc:     Yanteng Si <siyanteng@loongson.cn>,
        Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>,
        Huacai Chen <chenhuacai@kernel.org>,
        Jiaxun Yang <jiaxun.yang@flygoat.com>,
        linux-doc@vger.kernel.org, Puyu Wang <realpuyuwang@gmail.com>,
        huangjianghui@uniontech.com
Subject: Re: [PATCH 2/2] docs/zh_CN: add core api local_ops.rst translation
Message-ID: <20210521061609.GA14285@bobwxc.top>
References: <cover.1621255695.git.siyanteng@loongson.cn>
 <d3b3209a81bd225f6c6983c49b16a6ac8d93f054.1621255695.git.siyanteng@loongson.cn>
 <20210519181125.GA24183@bobwxc.top>
 <CAEensMyA8tfYs-yRWb9rVPgqPsY5_Df+hkiKxo78moy05-WBKA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="lrZ03NoBR/3+SXJZ"
Content-Disposition: inline
In-Reply-To: <CAEensMyA8tfYs-yRWb9rVPgqPsY5_Df+hkiKxo78moy05-WBKA@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: LCKnCgCXXkEpUKdgVRs2AA--.63205S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tr4fCFWrAFy7KF43AFW5Wrg_yoW8ZrWkpr
        97KF1fGa1IqF13Cr1Igr17Jr1jyay8Can8WayIqw1YqFnIqF4Dtr4Utr9Igr95Xr97tFW8
        Zr4fKFW7uryjy3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26w1j6s0DM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCF04
        k20xvY0x0EwIxGrwCF04k20xvE74AGY7Cv6cx26F4UJr1UMxC20s026xCaFVCjc4AY6r1j
        6r4UMI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwVAFwI0_JrI_JrWlx4CE17CEb7
        AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv20xvE14v26r1j6r1xMIIF0xvE
        2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4v20xvaj40_Jr0_JF4lIxAIcV
        C2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AKxVWUJVW8JbIYCTnIWIevJa73
        UjIFyTuYvj4RRbyZUUUUU
X-Originating-IP: [110.64.86.229]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--lrZ03NoBR/3+SXJZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 21, 2021 at 09:53:08AM +0800, yanteng si wrote:
> Wu X.C. <bobwxc@email.cn> =E4=BA=8E2021=E5=B9=B45=E6=9C=8820=E6=97=A5=E5=
=91=A8=E5=9B=9B =E4=B8=8A=E5=8D=882:11=E5=86=99=E9=81=93=EF=BC=9A
> >
> > On Tue, May 18, 2021 at 11:08:52AM +0800, Yanteng Si wrote:
> > > Translate Documentation/core-api/local_ops.rst into Chinese.
> > >
> > > Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> > > ---
> > >  .../translations/zh_CN/core-api/index.rst     |   3 +-
> > >  .../translations/zh_CN/core-api/local_ops.rst | 194 ++++++++++++++++=
++
> > >  2 files changed, 195 insertions(+), 2 deletions(-)
> > >  create mode 100644 Documentation/translations/zh_CN/core-api/local_o=
ps.rst
> > >
> > > diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Do=
cumentation/translations/zh_CN/core-api/index.rst
> > > index 8f0b3fe8723d..c7a004bf2bd6 100644
> > > --- a/Documentation/translations/zh_CN/core-api/index.rst
> > > +++ b/Documentation/translations/zh_CN/core-api/index.rst
> > > @@ -59,11 +59,10 @@ Linux=E5=A6=82=E4=BD=95=E8=AE=A9=E4=B8=80=E5=88=
=87=E5=90=8C=E6=97=B6=E5=8F=91=E7=94=9F=E3=80=82 =E8=AF=A6=E6=83=85=E8=AF=
=B7=E5=8F=82=E9=98=85
> > >
> > >     irq/index
> > >     refcount-vs-atomic
> > > -
> > > +   local_ops
> > >
> > >  Todolist:
> > >
> > > -   local_ops
> > >     padata
> > >     ../RCU/index
> > >
> > > diff --git a/Documentation/translations/zh_CN/core-api/local_ops.rst =
b/Documentation/translations/zh_CN/core-api/local_ops.rst
> > > new file mode 100644
> > > index 000000000000..1294cc1864ff
> > > --- /dev/null
> > > +++ b/Documentation/translations/zh_CN/core-api/local_ops.rst
> > > @@ -0,0 +1,194 @@
> > > +.. include:: ../disclaimer-zh_CN.rst
> > > +
> > > +:Original: Documentation/core-api/local_ops.rst
> > > +:Translator: Yanteng Si <siyanteng@loongson.cn>
> > > +
> > > +.. _cn_local_ops:
> > > +
> > > +
> >
> > Which is better for "local" in this article, =E5=B1=80=E9=83=A8 or =E6=
=9C=AC=E5=9C=B0=EF=BC=9F
> > Seems not much different
> =E2=80=9C=E6=9C=AC=E5=9C=B0=E2=80=9D is better.
> If you want to use =E2=80=9C=E5=B1=80=E9=83=A8", The word "local" should =
accompany the word
> "global" in the context.

Agree.

Thanks,
	Wu X.C.

--lrZ03NoBR/3+SXJZ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmCnUCUACgkQtlsoEiKC
sIV21gv+P1WlV/hQG1fpx5G0qwEc+lMUeVPW2hGPEbEHBFK700MbHEap82dWmaQX
pmWJQKQ03lX9aE5jlnlkyoTfx96cSbBanMRuJeYO21IietLlQ8qHQ/xILmhQy9Az
5Z7Dg6IOL8qvC3xwf0/AqFfH8ywksAC0m2oWPtM3TdtyaaOhjZXVAk7TFZSrbL5D
Xd/EnfuEHD+LLspPgwoNW7wDyN1wqn7eLKDfEPpozzO/AcRl8SWysJ8vwKKV6y4M
xvdUAG9uIVcZPzcbMXIDUvrjtQIhmkMgiSy7v6y40cxLmCsmXsYQvwipks8wTuH0
K4ObxWF0vSBWcYpEO+/TnJmTKlUsf9x6Szas9LD/ogm1Qv+TGcw9fvzOSCPfrXxG
5PEwUtY/GvJ76PB4xRIYt7/ApAjXRJOhWMIjlJyorEd43Sv+h3xce58f6GFtykni
RRWr38QlQbceiTU2qUI9RXgzCmosiJ8BpTDEuBD8A4ML9p72EocFfH9NPtP0jaXB
lMm37D6/
=VCd8
-----END PGP SIGNATURE-----

--lrZ03NoBR/3+SXJZ--

