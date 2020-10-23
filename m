Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7B8EEC4363A
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 18:27:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 180412225E
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 18:27:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603477633;
	bh=SHsWHdBUCccwANbOdMKh6BI+Xq8sH14n3v81RpJpzcs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=rjVL9EU91ZQjrS9ORJJG1+n/frZioq1L97W0ebiX3mBcv4zkISTS8dX1DTSdCwnVS
	 nLSz4RMKDhK+MbzrXcJVph0ZrM5Sy/gldkmPgY0XD+uenXbpVkEPX5VBgoBZHBeXZ5
	 Yk+8YqJ1lArSfSLP9LKRcDm+1slhks5ZxIoB/FWI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754635AbgJWS1M (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 14:27:12 -0400
Received: from mail.kernel.org ([198.145.29.99]:53464 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754617AbgJWS1M (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 14:27:12 -0400
Received: from localhost (cpc102338-sgyl38-2-0-cust404.18-2.cable.virginm.net [77.102.33.149])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 69E61208FE;
        Fri, 23 Oct 2020 18:27:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603477631;
        bh=SHsWHdBUCccwANbOdMKh6BI+Xq8sH14n3v81RpJpzcs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=hHBq93VIB0psvOkcGOAESIUQKob826qkWXtHD3mIpwBtV6DVsicZvDLxw7ubUUoNF
         LOlqCJtBWn5D00dAF2sliKQy678OT3kb5pod4RTx6x9iRHj1q09qMh8XZ+VAZwZmAZ
         IbBaksxQFgvwb6VjbSEzrTA0ECjYkfBWPZ4lQCkU=
Date:   Fri, 23 Oct 2020 19:26:58 +0100
From:   Mark Brown <broonie@kernel.org>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        =?utf-8?B?TWljaGHFgiBNaXJvc8WCYXc=?= <mirq-linux@rere.qmqm.pl>,
        Arnd Bergmann <arnd@arndb.de>,
        Baolin Wang <baolin.wang@linaro.org>,
        Dan Carpenter <dan.carpenter@oracle.com>,
        Jaroslav Kysela <perex@perex.cz>,
        Lars-Peter Clausen <lars@metafoo.de>,
        Liam Girdwood <lgirdwood@gmail.com>,
        Takashi Iwai <tiwai@suse.com>,
        Takashi Sakamoto <o-takashi@sakamocchi.jp>,
        Vinod Koul <vkoul@kernel.org>, alsa-devel@alsa-project.org,
        linux-kernel@vger.kernel.org, paulhsia <paulhsia@chromium.org>
Subject: Re: [PATCH v3 48/56] sound: fix kernel-doc markups
Message-ID: <20201023182658.GB5582@sirena.org.uk>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
 <535182d6f55d7a7de293dda9676df68f5f60afc6.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="LpQ9ahxlCli8rRTG"
Content-Disposition: inline
In-Reply-To: <535182d6f55d7a7de293dda9676df68f5f60afc6.1603469755.git.mchehab+huawei@kernel.org>
X-Cookie: Kleeneness is next to Godelness.
User-Agent: Mutt/1.10.1 (2018-07-13)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--LpQ9ahxlCli8rRTG
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 23, 2020 at 06:33:35PM +0200, Mauro Carvalho Chehab wrote:
> Kernel-doc markups should use this format:
>         identifier - description

Acked-by: Mark Brown <broonie@kernel.org>

--LpQ9ahxlCli8rRTG
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAl+TIHIACgkQJNaLcl1U
h9DZzwf/Zs3YIMTz+2DCrNUXLtzpAbvLLDsdBDOev3DuZWyEftdLOcoIHNmL7nDL
ejx5PybpTjacNq8eH+dEUotHDdfpNd0Ul/1A2BCXwm4AT5H2WZJS8tuMkCIwDq9v
zEM2HhZvUCH/OhOrDTMqSr6P8PcIC6A4++4+8p6T67OaPPzU1p6Rb/08F3O5RnU/
0HSRVflv8ECJxMq9Zkg7GTi1UdTLARnabYNzGWJ8dYYCG0COFRbDGk51q4uA7P2h
HtdItUw/+qKgD21DxLmrdTzibgI8WhbdQ/pwzgfkT8XLKflR5tWb5vGKEKBR34w0
jVbNXPVnxqob45rcezJIEIR7pDNYew==
=uqAN
-----END PGP SIGNATURE-----

--LpQ9ahxlCli8rRTG--
