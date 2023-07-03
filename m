Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15298EB64DD
	for <linux-doc@archiver.kernel.org>; Mon,  3 Jul 2023 16:17:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230332AbjGCQRJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Jul 2023 12:17:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbjGCQRI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Jul 2023 12:17:08 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4CE5138;
        Mon,  3 Jul 2023 09:17:07 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 6169C60FB7;
        Mon,  3 Jul 2023 16:17:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF160C433C8;
        Mon,  3 Jul 2023 16:17:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1688401026;
        bh=JTevVLvj3EYl1fWMMxi04EGyH5Dsiv3lYD+IRooLid4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=CiCpscVmtLwtlr03C+J+S7pOm5HBjzckjCfZojZuaIiGVt8r77DyLUSGk8NY/Rsbh
         NWzznjLAAzD0GOk0U/pWNhIRGbzeW65vHHQ3e2eooHEbX///fV4ui76SNSIVaK0noN
         ZPQt92CgOTxtsxrmcS2bB62OdVIXhbLh6efBXBbKjuXh6CnA+IF8b+d3aw3pjQjmWt
         4HG1UOlxh000Pjiz9eYovhb1CDPEiVxlF7nshYTi5iPCPAKI7rNBFb518iM18c5N0r
         c6Jkv60zDjasmQAAj8mO8UuBntpS4VHm7DpAa/0VyIytTbr5neZN8ZsGo/ujywc9hj
         gs+Pq4VAeMi7Q==
Date:   Mon, 3 Jul 2023 17:17:01 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     palmer@dabbelt.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Jones <ajones@ventanamicro.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Evan Green <evan@rivosinc.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-riscv@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 02/11] RISC-V: don't parse dt/acpi isa string to get
 rv32/rv64
Message-ID: <20230703-baboon-panning-b8a7268899c7@spud>
References: <20230703-repayment-vocalist-e4f3eeac2b2a@wendy>
 <20230703-foothill-enforced-86baba776d5e@wendy>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="S8rcp5QksxDE+03r"
Content-Disposition: inline
In-Reply-To: <20230703-foothill-enforced-86baba776d5e@wendy>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--S8rcp5QksxDE+03r
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 03, 2023 at 11:27:54AM +0100, Conor Dooley wrote:
> From: Heiko Stuebner <heiko.stuebner@vrull.eu>
>=20
> When filling hwcap the kernel already expects the isa string to start with
> rv32 if CONFIG_32BIT and rv64 if CONFIG_64BIT.
>=20
> So when recreating the runtime isa-string we can also just go the other w=
ay
> to get the correct starting point for it.
>=20
> Signed-off-by: Heiko Stuebner <heiko.stuebner@vrull.eu>
> Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> Co-developed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Conor Dooley <conor.dooley@microchip.com>

=46rom v(n-1) that I forgot:
Reviewed-by: Evan Green <evan@rivosinc.com>
https://lore.kernel.org/all/CALs-HstMTxJFHEoSCaAUtYzT+a-2RSYAhWMQmkVw2+WE=
=3Dy0agQ@mail.gmail.com/

--S8rcp5QksxDE+03r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKL0fQAKCRB4tDGHoIJi
0p+RAP0SaOTCcjlKb7lby+pG6VFLS58+FyrQcXkCBeY7K51RPAEAux82L+HUS/zt
evbKbKhrJ9v/b2UtdBwW0tyrIdyLCQA=
=9aI/
-----END PGP SIGNATURE-----

--S8rcp5QksxDE+03r--
