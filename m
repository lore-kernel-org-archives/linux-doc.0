Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30123C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 09:21:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236664AbiCGJWe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 04:22:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53022 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236599AbiCGJWR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 04:22:17 -0500
Received: from gandalf.ozlabs.org (gandalf.ozlabs.org [150.107.74.76])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A9DA66623
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 01:20:30 -0800 (PST)
Received: from authenticated.ozlabs.org (localhost [127.0.0.1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by mail.ozlabs.org (Postfix) with ESMTPSA id 4KBtGh2tF8z4xxT;
        Mon,  7 Mar 2022 20:20:28 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canb.auug.org.au;
        s=201702; t=1646644829;
        bh=xJ6rl0GllZlkqYuOmGW/xyASBR1ctCIdBXavU+EjvxI=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=mgqd5NV8ZrTEMVsTcX/73zOSBTHCXRPia2Rnw24Zwe+p1PgyLM5DESo9BL8LmptR/
         pgwQb4GFQ2Cv/MwvGu3W9zH4MnbDIBBgc4H+m2Vup5jiBM0lJ52YpeoiH6MRlDg6jv
         PMmKSjPxx/0eQh/9ykHCLZ0nfFp1JD+oVh1FeijKr4RSoe5hKzkh6PG2njoUntlp6z
         UcfLNJQuUAojbCJeDZ5k+IR/dYZPlah9Ihslj/7sczHwId7zaKkjdGXfZv9T2haTpk
         s6jHUvGqZKFd+9sAdDd4WpinJwDEeMlCzBaNTiUXU95fn7vpxkxj2ZK6o8wfxoZfa8
         G1iGYKAm4k+BQ==
Date:   Mon, 7 Mar 2022 20:20:26 +1100
From:   Stephen Rothwell <sfr@canb.auug.org.au>
To:     Yanteng Si <siyanteng01@gmail.com>
Cc:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com,
        Chengming Zhou <zhouchengming@bytedance.com>,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, Shuah Khan <shuah@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH v3 1/5] kselftest/vm: override TARGETS from arguments
Message-ID: <20220307202026.3f2dc395@canb.auug.org.au>
In-Reply-To: <a43902460ff47a3aea8c7b01119cb7db647103e6.1646640696.git.siyanteng@loongson.cn>
References: <cover.1646640696.git.siyanteng@loongson.cn>
        <a43902460ff47a3aea8c7b01119cb7db647103e6.1646640696.git.siyanteng@loongson.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/oAOGiPURY/rrSZcXYphGCdo";
 protocol="application/pgp-signature"; micalg=pgp-sha256
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/oAOGiPURY/rrSZcXYphGCdo
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Yanteng,

On Mon,  7 Mar 2022 16:17:15 +0800 Yanteng Si <siyanteng01@gmail.com> wrote:
>
> From: Chengming Zhou <zhouchengming@bytedance.com>
>=20
> We can specify which testcases to build using TARGETS argument, for
> example: make -C tools/testing/selftests TARGETS=3Dvm, cause the ordinary
> assignment of TARGETS in Makefile will be ignored.  So we need to use
> override directive to change that.
>=20
> Link: https://lkml.kernel.org/r/20220227055330.43087-1-zhouchengming@byte=
dance.com
> Signed-off-by: Chengming Zhou <zhouchengming@bytedance.com>
> Cc: Shuah Khan <shuah@kernel.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> Signed-off-by: Stephen Rothwell <sfr@canb.auug.org.au>

Please do not take my Signed-off-by lines from linux-next.  It is only
there because I publish Andrew's patch queue as part of the linux-next
tree, and so is only relevant in the linux-next tree.

--=20
Cheers,
Stephen Rothwell

--Sig_/oAOGiPURY/rrSZcXYphGCdo
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCAAdFiEENIC96giZ81tWdLgKAVBC80lX0GwFAmIlzloACgkQAVBC80lX
0GziOwf+Ph8nGvXzjtlvmWHD6Poh+69WN1tFnKQVzZUTLSEMLYXIX53I5NLGf9Ej
dFJjkULkWZhxGp1vi5E41YgbdPr4R3d4XdXos7sfbneaxBZDUvp0B5hDJ0GaPoHA
AuZ8KcQ1fZa4i2fdzWxlNuggvS6c0VV0+02wFsppdXtTNBmezrTHTsYjv78Uypzn
h1rpUcvbE0wToSxv6+2IapadL603bTgB4dUJucsM7RqdwwHRYRSytRtX/vNjSEBV
JbPazew+bI0cgefhDKilj2l6heutEIBFAkNalFby45tYKlaaHKwoCLl2M2NDTykl
TNKB7DXB1C25C9kKUlaqpq81vCumtQ==
=IT15
-----END PGP SIGNATURE-----

--Sig_/oAOGiPURY/rrSZcXYphGCdo--
