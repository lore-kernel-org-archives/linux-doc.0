Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E82BC48BE5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 11:47:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 42F286145E
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 11:47:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbhFOLtp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 07:49:45 -0400
Received: from m32-153.88.com ([43.250.32.153]:53471 "EHLO email.cn"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S229520AbhFOLtp (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 15 Jun 2021 07:49:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=57q2zBQzNZf4P9b6U1AyYrYI9pdIYjMQP/d5y
        WD51Mg=; b=eT7eryDEZLxawIuodLxL1bG4t2wQILeE7jMC8FD2aIiuEthmsDTmJ
        oQFeHhJoZeIFPtBjCOD5MYUs9vts7HeMtAZfHT16opJSbqiz5qHld6N41kKafQ1Z
        75yi95x96sEt0hZ3ZZhG10DE3PREPHArGb03w+NNxTzUfYMFEwOJEU=
Received: from bobwxc.top (unknown [110.64.86.229])
        by v_coremail2-frontend-2 (Coremail) with SMTP id GiKnCgBHHfxRk8hgJjAVAA--.43580S2;
        Tue, 15 Jun 2021 19:47:32 +0800 (CST)
Date:   Tue, 15 Jun 2021 19:47:29 +0800
From:   "Wu X.C." <bobwxc@email.cn>
To:     Yanteng Si <siyanteng@loongson.cn>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, realpuyuwang@gmail.com,
        siyanteng01@gmail.com
Subject: Re: [PATCH v2 2/2] docs/zh_CN: add core api cpu_hotplug translation
Message-ID: <20210615114729.GA20806@bobwxc.top>
References: <cover.1623740113.git.siyanteng@loongson.cn>
 <7fbb0d30a575c6c25c7c89951e66bd847021794a.1623740114.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="cNdxnHkX5QqsyA0e"
Content-Disposition: inline
In-Reply-To: <7fbb0d30a575c6c25c7c89951e66bd847021794a.1623740114.git.siyanteng@loongson.cn>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CM-TRANSID: GiKnCgBHHfxRk8hgJjAVAA--.43580S2
X-Coremail-Antispam: 1UD129KBjvJXoW7tFW8uw13tw47uw15GFW7urg_yoW8Xry7p3
        WfK34fGan3Ca42kan7WryUtr1rAFWkXan7uanrJwnxAF95Jw40yF4UKryDWF97XryvvF48
        ur4ftFWUC34jv3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUgab7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r4j6ryUM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r4j6F4UM28EF7xvwVC2
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


--cNdxnHkX5QqsyA0e
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yanteng,

two small problem.

On Tue, Jun 15, 2021 at 03:03:50PM +0800, Yanteng Si wrote:
> Translate Documentation/core-api/cpu_hotplug.rst into Chinese.
>=20
> Signed-off-by: Yanteng Si <siyanteng@loongson.cn>
> ---
>  .../zh_CN/core-api/cpu_hotplug.rst            | 348 ++++++++++++++++++
>  .../translations/zh_CN/core-api/index.rst     |   2 +-
>  2 files changed, 349 insertions(+), 1 deletion(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/cpu_hotplug=
=2Erst
>=20
> diff --git a/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst b/=
Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> new file mode 100644
> index 000000000000..f4174ed3aeca
> --- /dev/null
> +++ b/Documentation/translations/zh_CN/core-api/cpu_hotplug.rst
> @@ -0,0 +1,348 @@
> +.. include:: ../disclaimer-zh_CN.rst
> +
> +:Original: Documentation/core-api/cpu_hotplug.rst
> +:=E7=BF=BB=E8=AF=91:
> +
> +=E5=8F=B8=E5=BB=B6=E8=85=BE Yanteng Si <siyanteng@loongson.cn>
   ^
   need a space at the beginning

[...]
> +CPU=E4=BD=8D=E5=9B=BE
> +=3D=3D=3D=3D=3D=3D=3D
> +
> +``cpu_possible_mask``
> +  =E7=B3=BB=E7=BB=9F=E4=B8=AD=E5=8F=AF=E8=83=BD=E5=8F=AF=E7=94=A8CPU=E7=
=9A=84=E4=BD=8D=E5=9B=BE=E3=80=82=E8=BF=99=E6=98=AF=E7=94=A8=E6=9D=A5=E4=B8=
=BAper_cpu=E5=8F=98=E9=87=8F=E5=88=86=E9=85=8D=E4=B8=80=E4=BA=9B=E5=90=AF=
=E5=8A=A8=E6=97=B6=E7=9A=84=E5=86=85=E5=AD=98=EF=BC=8C=E8=BF=99=E4=BA=9B=E5=
=8F=98=E9=87=8F
> +  =E4=B8=8D=E4=BC=9A=E9=9A=8F=E7=9D=80CPU=E7=9A=84=E5=8F=AF=E7=94=A8=E6=
=88=96=E7=A7=BB=E9=99=A4=E8=80=8C=E5=A2=9E=E5=8A=A0/=E5=87=8F=E5=B0=91=E3=
=80=82=E4=B8=80=E6=97=A6=E5=9C=A8=E5=90=AF=E5=8A=A8=E6=97=B6=E7=9A=84=E5=8F=
=91=E7=8E=B0=E9=98=B6=E6=AE=B5=E8=A2=AB=E8=AE=BE=E7=BD=AE=EF=BC=8C=E8=AF=A5=
=E5=9C=B0=E5=9B=BE=E5=B0=B1=E6=98=AF=E9=9D=99=E6=80=81
                                                                         ^^=
^^
s/=E5=9C=B0=E5=9B=BE/=E6=98=A0=E5=B0=84/

[...]

Please fix them :)
and=20
Reviewed-by: Wu XiangCheng <bobwxc@email.cn>

Thanks,
	Wu X.C.

--cNdxnHkX5QqsyA0e
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmDIk00ACgkQtlsoEiKC
sIUbdQv/apjNPAgA8g4qW31QIWLKZxOagdzAoduZRDNTr8BaNdUHqn+VQ6ixfYhM
bKt7q1xVAscrLHBmx2puSQGhWOn3a90hmDpsqv4uwiU39dycPkVJxqbGuqD3S5j9
UrQageeRSUXdf8tqMNiQ1h+Zi9TLmfupMf5uNu6r+k/Doc2H6yhxkaP5uo0wztb0
EgEZXA+t10KTCMSLd2PGVzICMKlpl/iunoUXfDtWPPo8GrDpX7tzTw3W1loHLBEd
ERsyrzSAo2LNlOX80Emdxc4ehI6A2eXPToBugpiR5GIJ38DzLC3HupNNH4LNLrJ+
4JFDuDNMpOxj7xuDN1b1VU9aRTjaUwJwdsYr+/DD0BZkCbzZgRuAcpExDPtrXF3O
hHh05Yalxa3Fdi6e0kqyqjM11Ds0R6ygnKfmHapGs00LIYQsLTeURhKnl9bvJOBq
silHh/t7XLNZhcsb7jmph6f1mTdteiyZhEQFr5gHbVSkSCLdyRuHdZV50k2Zuicn
Y7nBE9RD
=OJvp
-----END PGP SIGNATURE-----

--cNdxnHkX5QqsyA0e--

