Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F45AEB64DA
	for <linux-doc@archiver.kernel.org>; Mon, 10 Jul 2023 22:39:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230266AbjGJWjc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jul 2023 18:39:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35394 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbjGJWja (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jul 2023 18:39:30 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AEDB91;
        Mon, 10 Jul 2023 15:39:30 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E48ED6124C;
        Mon, 10 Jul 2023 22:39:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6C9BEC433C8;
        Mon, 10 Jul 2023 22:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689028769;
        bh=O/CW9tIuzx26NQX0JvkfDKa65lUbxxeZWmHKJIv1YGA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=MsHmKbEA1cwBwXVQm/AJFbzBTfcCW4W9w+qzNOubZKBlyJvvwIAnjWt1Du7gUXOpz
         5DlNeiSw3lmEGcN+VmbWN7SGkRpkT1MgKkqKFvEx5fImdLieCpjibUeYV044c8/aJJ
         Woi3xsyXyiDyYIlrwES5oMhrGuX7Agtvy2xjCPcTHnJD+sbbJbn9YAjvvJMzPPfTNc
         QE6GHDUY5n16HqI4vP/1hf7fSvsGK4MngIfn41UxZA0xJnHtgHKdc0fhBc5eFu9gC2
         uxSi8dP0h8csRKux8QeYA/hp8H2Gmn1pv4E3GsKOP51xxWzYbeZzszODxTSA2peq+I
         YXCWbXmu4LFlw==
Date:   Mon, 10 Jul 2023 23:39:24 +0100
From:   Conor Dooley <conor@kernel.org>
To:     Evan Green <evan@rivosinc.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Anup Patel <apatel@ventanamicro.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3] RISC-V: Show accurate per-hart isa in /proc/cpuinfo
Message-ID: <20230710-frown-boogieman-b36445c1b5a7@spud>
References: <20230710192413.2089085-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="D7ZcV3Z0Ccixd94M"
Content-Disposition: inline
In-Reply-To: <20230710192413.2089085-1-evan@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--D7ZcV3Z0Ccixd94M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Jul 10, 2023 at 12:24:13PM -0700, Evan Green wrote:
> +"isa" vs "hart isa" lines in /proc/cpuinfo
> +-----------------------------------------

This underline is too short :/

--D7ZcV3Z0Ccixd94M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZKyInAAKCRB4tDGHoIJi
0rEwAQCYddZNxdTtB8VIuBY8H5RzTdEtz8EP5J62N/KTxodlPQD/UOlv4155wrff
VqMQUpTDU8K8uut/ONPsUSWLS7LDvgE=
=w2Wn
-----END PGP SIGNATURE-----

--D7ZcV3Z0Ccixd94M--
