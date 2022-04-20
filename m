Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91022C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 20 Apr 2022 17:27:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1381056AbiDTRae (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 20 Apr 2022 13:30:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1381084AbiDTRad (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 20 Apr 2022 13:30:33 -0400
Received: from m228-62.mailgun.net (m228-62.mailgun.net [159.135.228.62])
        by lindbergh.monkeyblade.net (Postfix) with UTF8SMTPS id 61B584667B
        for <linux-doc@vger.kernel.org>; Wed, 20 Apr 2022 10:27:45 -0700 (PDT)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=codeagain.dev; q=dns/txt;
 s=smtp; t=1650475666; h=In-Reply-To: Content-Type: MIME-Version:
 References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date:
 Sender: Sender; bh=WXXXW89y+QcFXfQJ6sbWfqbkXidxsm82Hd4VQkHn9TM=; b=Fy8hPBY9W8blBZBkO1Wo+zijSvgJ7IdR04yUFcWtOXtyCl/ZRrcViq1bzJZuPU6TQaoO3dUv
 1OKuGflZSLeX8OQGVSb3jePra6fpmPJM06bnskZer8zhVe9L6mFh8fABE/kdcyaLWSiwamw2
 kpUzIgH6MZ+B6zRkPXqFXlzGoMd4ZdJ9fxEUtJtoO2Wwj+V2aORMohk2aSpcF/nYUMRkJf3Z
 CGo/FtU0oo/0BemjUI1LTZvyUX8b+KWFFXWGebJnu8ULl2/47ApqVG/sStaQFzGDzJl9lyii
 jj9RCprB51eI8LxtW+J1HDLLGLeMsxIP995jFKvuORpP8kS0/H3B7Q==
X-Mailgun-Sending-Ip: 159.135.228.62
X-Mailgun-Sid: WyJkNWI4MiIsICJsaW51eC1kb2NAdmdlci5rZXJuZWwub3JnIiwgImJlOWM2ZCJd
Received: from AN5Bruno (dynamic-user.170.84.57.33.mhnet.com.br
 [170.84.57.33]) by smtp-out-n06.prod.us-east-1.postgun.com with SMTP id
 6260428d514839a8197fb28f (version=TLS1.3, cipher=TLS_AES_128_GCM_SHA256);
 Wed, 20 Apr 2022 17:27:41 GMT
Sender: codeagain@codeagain.dev
Date:   Wed, 20 Apr 2022 14:27:31 -0300
From:   Bruno Moreira-Guedes <codeagain@codeagain.dev>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        outreachy@lists.linux.dev,
        Bruno's Patch Watchbox <patch-reply@codeagain.dev>
Subject: Re: [PATCH v2 0/2] Docs: Update information at changes.rst
Message-ID: <20220420172731.ru7kfrdkmprybtu7@AN5Bruno>
References: <cover.1650376049.git.codeagain@codeagain.dev>
 <8735i83xo1.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="7gc4pk3xhyxkzqh5"
Content-Disposition: inline
In-Reply-To: <8735i83xo1.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--7gc4pk3xhyxkzqh5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 20, 2022 at 03:35:10AM -0600, Jonathan Corbet wrote:
> Bruno Moreira-Guedes <codeagain@codeagain.dev> writes:
> >
> > The PATCH 1/2 fixes the missing cpio requirement, while PATCH 2/2 fixes
> > the kernel version reference.
> >
> > Signed-off-by: Bruno Moreira-Guedes <codeagain@codeagain.dev>
>=20
> Patches applied, thanks.
Thanks, Jon! I have also been thinking whether this filename
('changes.rst') is a good description of the file contents. Do you think
renaming it to something like 'requirements.rst' and updating its
references would be a good patch?


--7gc4pk3xhyxkzqh5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQQTUrsHCxGmQ5vyKRAZtd3tyEY2kgUCYmBCgwAKCRAZtd3tyEY2
kuLWAP0dXCyqGEKvy9lN8fHENyzVin2V+xVzNahalr1kWHsangEAhBgOwZx6wbuj
85Xnz6TZqI6h6E9MUUAtaezbbS+j3QY=
=bzsu
-----END PGP SIGNATURE-----

--7gc4pk3xhyxkzqh5--
