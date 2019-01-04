Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 389BB7D089
	for <lwn-linux-doc@archive.lwn.net>; Fri,  4 Jan 2019 09:26:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726178AbfADJ0u (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 4 Jan 2019 04:26:50 -0500
Received: from wes1-so2-b.wedos.net ([46.28.106.45]:50352 "EHLO
        wes1-so2.wedos.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1726097AbfADJ0t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Jan 2019 04:26:49 -0500
Received: from localhost (ip4-46-39-182-135.cust.nbox.cz [46.39.182.135])
        by wes1-so2.wedos.net (Postfix) with ESMTPSA id 43WKDR2jbfz2dQ;
        Fri,  4 Jan 2019 10:26:47 +0100 (CET)
Date:   Fri, 4 Jan 2019 10:26:40 +0100
From:   Otto Sabart <ottosabart@seberm.com>
To:     Rob Herring <robh+dt@kernel.org>
Cc:     Mark Rutland <mark.rutland@arm.com>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jason Cooper <jason@lakedaemon.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Jiri Kosina <trivial@kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH 3/8] doc: bindings: fix bad reference to ARM CPU bindings
Message-ID: <20190104092640.GA21106@personal>
References: <cover.1546457946.git.ottosabart@seberm.com>
 <e37cabca16342ce3889957b606274e6588254682.1546457947.git.ottosabart@seberm.com>
 <CAL_JsqJW=zxvsptwEh94KP7rEMMgj_HKZ7zTVtC2y_wno_jPHw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="+HP7ph2BbKc20aGI"
Content-Disposition: inline
In-Reply-To: <CAL_JsqJW=zxvsptwEh94KP7rEMMgj_HKZ7zTVtC2y_wno_jPHw@mail.gmail.com>
X-PGP-Key: http://seberm.com/pubkey.asc
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--+HP7ph2BbKc20aGI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 03. Jan (Thursday) v 14:53:38 -0600 2019, Rob Herring wrote:
> On Thu, Jan 3, 2019 at 1:04 PM Otto Sabart <ottosabart@seberm.com> wrote:
> >
> > The primecell.txt and cpus.txt files were converted into YAML. This
> > patch updates old references with new ones.
> >
> > Fixes: d3c207eeb905 ("dt-bindings: arm: Convert primecell binding to js=
on-schema")
> > Fixes: 672951cbd1b7 ("dt-bindings: arm: Convert cpu binding to json-sch=
ema")
> > Signed-off-by: Otto Sabart <ottosabart@seberm.com>
> > ---
> >
> > As suggested by Jon Corbet, I am *resending* this patch once again to
> > correct maintainers. There are no changes in the code since my previous
> > e-mail.
>=20
> Please use scripts/get_maintainers.pl so you get the right lists too.
>=20
> >
> > Please review.
>=20
> Am I supposed to apply? I don't have a clue because I've only gotten patc=
h 3.
>=20

Hello Rob,
the thing is I messed up and I sent this series of patches to Jon and
linux-doc list only.

Unfortunately these patches touch multiple subsystems so I now have to
get them to correct maintainers.

What is the best thing I should do now? Should I resend (with "RESEND
PATCH" prefix in subject) *whole* series of patches to right maintainers
and lists returned by get_maintainer.pl?

In my case this scripts returns ~60 names and lists. I suppose it is not
the right thing to spam all of them... or is it?

Thank you for your time.

Ota

--+HP7ph2BbKc20aGI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEb6VOpv2s03VHGoilgjuumfi+HjwFAlwvJssACgkQgjuumfi+
HjyRWxAAhB/UmHdQt+rKkRgVS5GcMfYoLAsDLluE3Gl7DpKDX0K+qXXv/m0W18l7
2EshXiCHKlWSDfLILsFAhhuo3ys4Yqh499acOgvwJdTtwRzauMen1bL64o9GkT/w
pX1kAcv5/wYQ7MCNe0z2wL7XT4U/0VBOfvXMhBiYZ5UrRE38vGRmrHdp1PdW7iaD
1onR4ALWbmyFZsTNOGxPVRbCHrL5gj+6O0/6kTLW9cMoTte4b6R3CPWfyHPRW+He
hL0Hucv0nu0xJQIM5+FMl1vsdQyOoSi+HKhf4srdBYdOY684is/QelzcYRdF6In/
S5h7wFxTiTYDPTM/jdTqkHvC22AifNyNQgOZm/GORxFNKZ5dokQnDkpW0A/p1z+O
izBpY3U3SnTV26v2r5ySUtOIn4OOiRUfCPbyvtrK/o765/xK/byBMIwRM+n0AQMC
fdScE3TwhVzKec3Wcl9WsdNEV/F7zu40FY4HhjWgcaGN459cjUzzgcF/J3MUVheI
ZPpsv+dYcdKc3Vyu+WyiFvoNaHvTDZrZY4F6c5sgHevko5fUuGqvkzTnBGafpbbW
HFC+/QrF0spp95FRZsPx0zDik6CsrJEtCsEu5zXnajUGBb9LSIQZK0n9q1uRjNn5
4EzmVjG8jcxYpukYYXvifwiv795oODA1RXuV4Pf3juTCiAfth5c=
=4fOP
-----END PGP SIGNATURE-----

--+HP7ph2BbKc20aGI--
