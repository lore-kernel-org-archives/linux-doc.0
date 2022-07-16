Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3E0C43334
	for <linux-doc@archiver.kernel.org>; Sat, 16 Jul 2022 14:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230015AbiGPOG2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 16 Jul 2022 10:06:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60514 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229588AbiGPOG2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 16 Jul 2022 10:06:28 -0400
Received: from email.cn (m218-171.88.com [110.43.218.171])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D35DE1B7AF
        for <linux-doc@vger.kernel.org>; Sat, 16 Jul 2022 07:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=email.cn;
        s=dkim; h=Date:From:To; bh=Q3O6xzzOdEtr/qx6dhmcqT5e20TRGQkFGqui5
        GPrkCw=; b=XOQf9EdxK9kdm1D1K3lC4vd1Bvq2VtLGB4VEzVlecXUu5Exsnhm78
        GWQa9DryXKfEROFGx9Bm45SmQBUXbjyAK4CSlt8WUmTUUxRm27y3AwqWITn4Wwd1
        7Ex0VR15hiA2fV8Nt1uv7HteVO4uJ5RL8PX2U9fQzWKrjYUgT7tYfY=
Received: from bobwxc.mipc (unknown [120.242.68.196])
        by v_coremail2-frontend-1 (Coremail) with SMTP id LCKnCgAn2GTaxdJiu+QvAA--.49903S2;
        Sat, 16 Jul 2022 22:06:19 +0800 (CST)
Date:   Sat, 16 Jul 2022 22:06:18 +0800
From:   Wu XiangCheng <bobwxc@email.cn>
To:     Binbin Zhou <zhoubinbin@loongson.cn>
Cc:     alexs@kernel.org, siyanteng@loongson.cn, corbet@lwn.net,
        chenhuacai@loongson.cn, zhoubb.aaron@gmail.com,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/4] docs/zh_CN: core-api: Add some translations for the
 "Data structures" section(Part 1)
Message-ID: <YtLF2g8fQdi4/aKQ@bobwxc.mipc>
References: <cover.1657796498.git.zhoubinbin@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="PWGjJLEUdZYNJ/dS"
Content-Disposition: inline
In-Reply-To: <cover.1657796498.git.zhoubinbin@loongson.cn>
X-CM-TRANSID: LCKnCgAn2GTaxdJiu+QvAA--.49903S2
X-Coremail-Antispam: 1UD129KBjvJXoWxZr4xGryxKw4fZrW7AFWUArb_yoW5XFW8pF
        13Kr1fG3WDAF17Crs7Wr1UXr1rJFWxW3yqgay2qwnaqFn5trWFvrs0yryagFWfJrn2qFWF
        vr43KrWku34jyrJanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
        9KBjDU0xBIdaVrnRJUUUy2b7Iv0xC_Cr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
        cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
        v20xvE14v26r1j6r1xM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26r1j6r4UM28EF7xvwVC2
        z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26r4UJVWxJr1le2I262IYc4
        CY6c8Ij28IcVAaY2xG8wASzI0EjI02j7AqF2xKxwAqx4xG64xvF2IEw4CE5I8CrVC2j2Wl
        Yx0E74AGY7Cv6cx26F4UJr1UMcvjeVCFs4IE7xkEbVWUJVW8JwACjcxG0xvEwIxGrwCY02
        Avz4vE14v_Xryl42xK82IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VWxJr1UJwCFx2Iq
        xVCFs4IE7xkEbVWUJVW8JwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4vE14v26r
        106r1rMI8E67AF67kF1VAFwI0_JF0_Jw1lIxkGc2Ij64vIr41lIxAIcVC0I7IYx2IY67AK
        xVWUJVWUCwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26cxKx2IYs7
        xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAFwI0_Gr0_
        Gr1UYxBIdaVFxhVjvjDU0xZFpf9x07UjD7-UUUUU=
X-Originating-IP: [120.242.68.196]
X-CM-SenderInfo: pere453f6hztlloou0/
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--PWGjJLEUdZYNJ/dS
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 14, 2022 at 09:05:59PM +0800, Binbin Zhou wrote:
> Hi all:
>=20
> I have translated all the docs for section "Data structures and low-level=
 utilities"
> of the core-api, and I plan to split them into two patchset submissions.
>=20
> This patchset contains the following files:
>=20
> idr.rst
> circular-buffers.rst
> generic-radix-tree.rst
> packing.rst
>=20
> For more details, please see TODOLIST in core-api/index.rst.
>=20
> Thanks.
>=20
> Binbin Zhou (4):
>   docs/zh_CN: core-api: Add idr Chinese translation
>   docs/zh_CN: core-api: Add circular-buffers Chinese translation
>   docs/zh_CN: core-api: Add generic-radix-tree Chinese translation
>   docs/zh_CN: core-api: Add packing Chinese translation

$ git am ~/Desktop/20220714_zhoubinbin_docs_zh_cn_core_api_add_some_transla=
tions_for_the_data_structures_section_part_1.mbx
=E5=BA=94=E7=94=A8=EF=BC=9Adocs/zh_CN: core-api: Add idr Chinese translation
=E5=BA=94=E7=94=A8=EF=BC=9Adocs/zh_CN: core-api: Add circular-buffers Chine=
se translation
error: =E6=89=93=E8=A1=A5=E4=B8=81=E5=A4=B1=E8=B4=A5=EF=BC=9ADocumentation/=
translations/zh_CN/core-api/index.rst:44
error: Documentation/translations/zh_CN/core-api/index.rst=EF=BC=9A=E8=A1=
=A5=E4=B8=81=E6=9C=AA=E5=BA=94=E7=94=A8
=E6=89=93=E8=A1=A5=E4=B8=81=E5=A4=B1=E8=B4=A5=E4=BA=8E 0002 docs/zh_CN: cor=
e-api: Add circular-buffers Chinese translation

Since your patches are based on linux-next, 2-4 couldn't be applied to
docs-next now.

commit 4313a24985f00340eeb591fd66aa2b257b9e0a69 from linux-next have changed
core-api/index.rst

diff --git a/Documentation/translations/zh_CN/core-api/index.rst b/Document=
ation/translations/zh_CN/core-api/index.rst
index 26d9913fc8b60..c52175fc1b610 100644
--- a/Documentation/translations/zh_CN/core-api/index.rst
+++ b/Documentation/translations/zh_CN/core-api/index.rst
@@ -52,7 +52,6 @@ Todolist:
    circular-buffers
    generic-radix-tree
    packing
-   bus-virt-phys-mapping
    this_cpu_ops
    timekeeping
    errseq

So please rebase your patch set on jc/docs-next.

Thanks,
	Wu

>=20
>  .../zh_CN/core-api/circular-buffers.rst       | 205 ++++++++++++++++++
>  .../zh_CN/core-api/generic-radix-tree.rst     |  23 ++
>  .../translations/zh_CN/core-api/idr.rst       |  74 +++++++
>  .../translations/zh_CN/core-api/index.rst     |   8 +-
>  .../translations/zh_CN/core-api/packing.rst   | 154 +++++++++++++
>  5 files changed, 460 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/translations/zh_CN/core-api/circular-bu=
ffers.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/generic-rad=
ix-tree.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/idr.rst
>  create mode 100644 Documentation/translations/zh_CN/core-api/packing.rst
>=20
> --=20
> 2.20.1

--PWGjJLEUdZYNJ/dS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQGzBAABCgAdFiEERbo3U5kJpaCtFl1PtlsoEiKCsIUFAmLSxc8ACgkQtlsoEiKC
sIVmLAwAqWNQk5zJolUZHHGDK8KU/Tta9oWjjxC0VcDhNUHVKqZ7EFwQQBEM5UWM
epbkeI0CbqxNNu54xsqLHLalV48eGBnE3nys8XhwyKbzykpqLC9GMG14E8Mq2Aht
ePQgVSpHx3ZCIfwXK8kTPwb8EddETpU3RXGMcyLdOLyYo5ZI9oV2mUq7C4fKZ5zp
TnCs46wTXZw8MW1SL5Et7+/timSKbcvgfiNqnTp7aWr4yNVIwqFwFyKojUGPmqo2
eH2vEKJZZ9xYi4uFgcWiidzuuQpCZQLTN1GoiwT5HFsdBbkLMvZTwHye31ih+nnr
/oqk0XJLPdTUL67L6u/LZLNlsqg8hCe1iGOycdmOp8ZaOTZx4RpP1KKpPZGiuyL/
zfnO9RtmF/T3K05rc/dmmMFb0xKvxblYZe+JsK3T8qo2SIEtUhVDd2RGQY7Y6yoN
/KOBSaMKBZ21IFoOEM8gKcpn7YMPqDnlTuCc3rWahAzZxK7EEyGux06G4XvmyWgx
Qw2Np+h9
=6OP9
-----END PGP SIGNATURE-----

--PWGjJLEUdZYNJ/dS--

