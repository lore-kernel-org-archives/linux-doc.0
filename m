Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0F35DC636CC
	for <linux-doc@archiver.kernel.org>; Wed, 15 Feb 2023 22:09:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229596AbjBOWJU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Feb 2023 17:09:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51170 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbjBOWJU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Feb 2023 17:09:20 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5AD0042DFA;
        Wed, 15 Feb 2023 14:09:19 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E075161DCE;
        Wed, 15 Feb 2023 22:09:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C7F2C4339C;
        Wed, 15 Feb 2023 22:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1676498958;
        bh=Qqz6yS3ExjwKNY1LOZ57WHYVmDwA8NRKmkF1c3n4DgY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Wx6Sh4+TpPW7RHv7Y2gPqBgcrpsNsCou4HUbe10xvxmTqvE8BFbXg/tlq2fK4P18+
         WlFjc70udg2g/7oDBqhmK1aZ6LyU7BYjFOKfclopHBP/p1aaOeQ6b0NULsL4SWUhux
         e0z8yQLKBfVc/JXJ119aAqyp1C4cJG4ICS+QZFsSmT6Je264NHb3V/qP+Rc9ALiwvh
         eMKfw7OWifvGbVj9jA7qZj+2CnrW6goIyJAQK/VNBeqfsemPGxIWKIQz9DO4rxTY9D
         2bklbGXH71ITCTjciEZj0aXG40fto5VWXdP/+dfpup8UegpMwKPfanblVtnKXHc9Eo
         Qs+i5AxrF4KDQ==
Date:   Wed, 15 Feb 2023 22:09:12 +0000
From:   Conor Dooley <conor@kernel.org>
To:     Evan Green <evan@rivosinc.com>
Cc:     Palmer Dabbelt <palmer@rivosinc.com>, vineetg@rivosinc.com,
        heiko@sntech.de, slewis@rivosinc.com,
        Albert Ou <aou@eecs.berkeley.edu>,
        Andrew Bresticker <abrestic@rivosinc.com>,
        Celeste Liu <coelacanthus@outlook.com>,
        Guo Ren <guoren@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        dram <dramforever@live.com>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v2 3/6] RISC-V: hwprobe: Add support for
 RISCV_HWPROBE_BASE_BEHAVIOR_IMA
Message-ID: <Y+1YCC7iKGfzhCCs@spud>
References: <20230206201455.1790329-1-evan@rivosinc.com>
 <20230206201455.1790329-4-evan@rivosinc.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="mNM1TIv0ctRwSSPF"
Content-Disposition: inline
In-Reply-To: <20230206201455.1790329-4-evan@rivosinc.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--mNM1TIv0ctRwSSPF
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 06, 2023 at 12:14:52PM -0800, Evan Green wrote:

> +		case RISCV_HWPROBE_KEY_IMA_EXT_0:
> +			{
> +				u64 val = 0;
> +
> +				if (has_fpu())
> +					val |= RISCV_HWPROBE_IMA_FD;

The indent caught my eye here for a sec so my attention was drawn back
here. Would you mind adding a line of whitespace between these checks?
Cheers,
Conor.

> +				if (elf_hwcap & RISCV_ISA_EXT_c)
> +					val |= RISCV_HWPROBE_IMA_C;
> +				ret = set_hwprobe(pairs, val);
> +			}
> +			break;
> +


--mNM1TIv0ctRwSSPF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCY+1YCAAKCRB4tDGHoIJi
0uGtAQCbl6xjnQJVTf3forD97h5nVmEJHAI/kgAdmSnS/g91VQEAiv+nI/S86US6
MjLBBDqGuTNOMf3KxxztJ2Oi85UlSw8=
=83wP
-----END PGP SIGNATURE-----

--mNM1TIv0ctRwSSPF--
