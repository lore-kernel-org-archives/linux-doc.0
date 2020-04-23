Return-Path: <SRS0=PsPG=6H=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_2
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29CECC54FCB
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 18:41:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 03B6F205C9
	for <linux-doc@archiver.kernel.org>; Thu, 23 Apr 2020 18:41:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730102AbgDWSlg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Apr 2020 14:41:36 -0400
Received: from 9.mo69.mail-out.ovh.net ([46.105.56.78]:35937 "EHLO
        9.mo69.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730056AbgDWSlg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Apr 2020 14:41:36 -0400
Received: from player746.ha.ovh.net (unknown [10.110.115.36])
        by mo69.mail-out.ovh.net (Postfix) with ESMTP id 7D5668AEF7
        for <linux-doc@vger.kernel.org>; Thu, 23 Apr 2020 20:32:37 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player746.ha.ovh.net (Postfix) with ESMTPSA id 0C0B911C624B8;
        Thu, 23 Apr 2020 18:32:32 +0000 (UTC)
Date:   Thu, 23 Apr 2020 20:32:31 +0200
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4] docs: sysctl/kernel: document BPF entries
Message-ID: <20200423203231.5f682a52@heffalump.sk2.org>
In-Reply-To: <20200420165949.14dc0752@lwn.net>
References: <20200315122648.20558-1-steve@sk2.org>
        <20200420165949.14dc0752@lwn.net>
X-Mailer: Claws Mail 3.17.3 (GTK+ 2.24.32; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/o1onwjijsn/X1nkA2sVL9pS"; protocol="application/pgp-signature"
X-Ovh-Tracer-Id: 16088265247455071621
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedrgeelgdelhecutefuodetggdotefrodftvfcurfhrohhfihhlvgemucfqggfjpdevjffgvefmvefgnecuuegrihhlohhuthemucehtddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpeffhffvuffkjghfofggtgesghdtreerredtjeenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphdqohhuthdphhgvlhhopehplhgrhigvrhejgeeirdhhrgdrohhvhhdrnhgvthdpihhnvghtpedtrddtrddtrddtpdhmrghilhhfrhhomhepshhtvghvvgesshhkvddrohhrghdprhgtphhtthhopehlihhnuhigqdguohgtsehvghgvrhdrkhgvrhhnvghlrdhorhhg
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

--Sig_/o1onwjijsn/X1nkA2sVL9pS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Apr 2020 16:59:49 -0600, Jonathan Corbet <corbet@lwn.net> wrote:
> On Sun, 15 Mar 2020 13:26:48 +0100
> Stephen Kitt <steve@sk2.org> wrote:
>=20
> > Based on the implementation in kernel/bpf/syscall.c,
> > kernel/bpf/trampoline.c, include/linux/filter.h, and the documentation
> > in bpftool-prog.rst.
> >=20
> > Signed-off-by: Stephen Kitt <steve@sk2.org>
> > ---
> >=20
> > Notes:
> >     This patch is intended for docs-next, but I'd appreciate reviews fr=
om
> >     BPF developers. =20
>=20
> Haven't seen a whole lot of those...it's been a month, so I'll ahead and
> apply this; it can be fixed up later if need be.

Thanks, I=E2=80=99ll start pushing my remaining sysctl doc patches.

Regards,

Stephen

--Sig_/o1onwjijsn/X1nkA2sVL9pS
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEnPVX/hPLkMoq7x0ggNMC9Yhtg5wFAl6h3z8ACgkQgNMC9Yht
g5yBYxAAnAhijFdCY555e/sspMaOXstZhLe2ieWHr+OE1sZwokukp99cPd8xavzr
4VvCL/MLTCmxEdiF1u2OWcar5qb1jmNsz3kuvP4lImpranerkN+j4nC0SiNrO9oW
P76NRx6Zi/vZIRDNPEsoJjp2pl/i00YppayfGEYkT5UxeCOsNfTn3j1zQctWN/6v
eLGtfkghS+6emGqCcEBoTrhkxxCqiv6VrDpGWNe+tEoseEm1I6NUm/gRqr8i6iM3
EQzM7w+R8oiSy8JsIJR0ay03IGzUii5b3hkKZLQW/rAm1+MJVRaQaaHYsJn2JdD7
/418UZwMZAJxZILek6bDNMQF3EHZgO6QbTDLjBPTm6ZeTJqqQEwfJ0DAVDG7sN/6
MYjXUDrqYhj3XLziu0tf8DkS9ujvzcaLhyYRealessJy6WxFXDfYNt8t7IlbIRY1
L0U2Euzl8akF5L6p4wfRy0C5ZYWQxgqNvPWhbuX+5DBATA76XIGtFHn5aRDZEMzD
tSs0pkIre0oIPzD0Q93qVTcmHoIqUIyq3cLG+5mImhveBC4GDKMc6ULXJW2G+CY0
1saNKu93Xvs6p9iioEE2lC/i0/NRvCfxT4DEfTJWl5nnyz3ZfzZ3gOJJ4CDVqLJZ
ODgpRYY9+IkLj//4HyR34DE8M2hvQ+L0UYHo/K0qrfHw0Xm2ZhY=
=6H/Z
-----END PGP SIGNATURE-----

--Sig_/o1onwjijsn/X1nkA2sVL9pS--
