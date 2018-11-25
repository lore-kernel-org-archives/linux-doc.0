Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id B94017D08A
	for <lwn-linux-doc@archive.lwn.net>; Sun, 25 Nov 2018 22:55:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726079AbeKZJrs (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Nov 2018 04:47:48 -0500
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:51412 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbeKZJrs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Nov 2018 04:47:48 -0500
Received: by atrey.karlin.mff.cuni.cz (Postfix, from userid 512)
        id C13998081B; Sun, 25 Nov 2018 23:55:30 +0100 (CET)
Date:   Sun, 25 Nov 2018 23:55:33 +0100
From:   Pavel Machek <pavel@ucw.cz>
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Daniel Colascione <dancol@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux API <linux-api@vger.kernel.org>,
        Tim Murray <timmurray@google.com>,
        Primiano Tucci <primiano@google.com>,
        Joel Fernandes <joelaf@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        Roman Gushchin <guro@fb.com>, Vlastimil Babka <vbabka@suse.cz>,
        "Dennis Zhou (Facebook)" <dennisszhou@gmail.com>,
        Prashant Dhamdhere <pdhamdhe@redhat.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>, rostedt@goodmis.org,
        tglx@linutronix.de, mingo@kernel.org, linux@dominikbrodowski.net,
        pasha.tatashin@oracle.com, jpoimboe@redhat.com,
        ard.biesheuvel@linaro.org, Michal Hocko <mhocko@suse.com>,
        David Howells <dhowells@redhat.com>, ktsanaktsidis@zendesk.com,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
Subject: Re: [PATCH] Add /proc/pid_generation
Message-ID: <20181125225533.GB30242@amd>
References: <20181121201452.77173-1-dancol@google.com>
 <20181121203150.GK3065@bombadil.infradead.org>
 <CAKOZueuCYOsaHZzoz5nNPr8Jb-fEiHTR4MektaJx8vuUXcrKCQ@mail.gmail.com>
 <20181122020633.GN3065@bombadil.infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="TRYliJ5NKNqkz5bu"
Content-Disposition: inline
In-Reply-To: <20181122020633.GN3065@bombadil.infradead.org>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--TRYliJ5NKNqkz5bu
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed 2018-11-21 18:06:33, Matthew Wilcox wrote:
> On Wed, Nov 21, 2018 at 12:38:20PM -0800, Daniel Colascione wrote:
> > On Wed, Nov 21, 2018 at 12:31 PM Matthew Wilcox <willy@infradead.org> w=
rote:
> > >
> > > On Wed, Nov 21, 2018 at 12:14:44PM -0800, Daniel Colascione wrote:
> > > > This change adds a per-pid-namespace 64-bit generation number,
> > > > incremented on PID rollover, and exposes it via a new proc file
> > > > /proc/pid_generation. By examining this file before and after /proc
> > > > enumeration, user code can detect the potential reuse of a PID and
> > > > restart the task enumeration process, repeating until it gets a
> > > > coherent snapshot.
> > > >
> > > > PID rollover ought to be rare, so in practice, scan repetitions will
> > > > be rare.
> > >
> > > Then why does it need to be 64-bit?
> >=20
> > [Resending because of accidental HTML. I really need to switch to a
> > better email client.]
> >=20
> > Because 64 bits is enough for anyone. :-) A u64 is big enough that
> > we'll never observe an overflow on a running system, and PID
> > namespaces are rare enough that we won't miss the four extra bytes we
> > use by upgrading from a u32.  And after reading about some security
> > problems caused by too-clever handling of 32-bit rollover, I'd rather
> > the code be obviously correct than save a trivial amount of space.
>=20
> I don't think you understand how big 4 billion is.  If it happens once a
> second, it will take 136 years for a 2^32 count to roll over.  How often
> does a PID roll over happen?

Well, the cost of 64-bit vs. 32-bit is really small here... I'd go
with 64bits. If you have 1000 CPUs, rollovers may be faster..

Best regards,
									Pavel
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--TRYliJ5NKNqkz5bu
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAlv7KGUACgkQMOfwapXb+vKUpACguxRTw5+EBG5s9D4iEpat3sen
udYAnRn+k2NI+lNteoHed7ikYIohN7P4
=pK2+
-----END PGP SIGNATURE-----

--TRYliJ5NKNqkz5bu--
