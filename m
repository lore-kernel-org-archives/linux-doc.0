Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=emersion.fr header.i=@emersion.fr header.b="bcHl5BOW"
Received: from mail-4022.proton.ch (mail-4022.proton.ch [185.70.40.22])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9062CDC
	for <linux-doc@vger.kernel.org>; Fri,  1 Dec 2023 02:25:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=emersion.fr;
	s=protonmail2; t=1701426309; x=1701685509;
	bh=bgyglF9ayxa/RKpdlocwZSsZ3zpKoAyjXW1dDPrXAGw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=bcHl5BOWYJk0TNt+h0a9dSc7hrj5VR3v/kDHbFw4D6qQ43nZkZsUCZJZcDlef95K8
	 GrGLErUWOXrEp8Vne614IgeuIvN+x+S2s5Y5ItC1PQ9WgGl+oaCYuauaxRNckBO0Wq
	 130Q+aUQIMLyDdDnTQMgd/2YIlOKfZ7rFkaAOJyL/lrFKEuko+hGFW0sdSBsnQ2xWI
	 GLQLeWNgrT9RLZeZxmJ/2RETDuDnXOg/D3UV9Sf9QCki5U48+LC9C7aOXh1AcAvDgl
	 qQDWfQixyh9cvr8ALnbfagtkRR3Zy6xePdY76/MGM1z7XYbxYjaYP2wlrm8eSeYJbV
	 qaPa7yxtL95Rg==
Date: Fri, 01 Dec 2023 10:25:03 +0000
To: Pekka Paalanen <pekka.paalanen@collabora.com>
From: Simon Ser <contact@emersion.fr>
Cc: =?utf-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, kernel-dev@igalia.com, alexander.deucher@amd.com, christian.koenig@amd.com, Rob Clark <robdclark@gmail.com>, daniel@ffwll.ch, Daniel Stone <daniel@fooishbar.org>, =?utf-8?Q?=27Marek_Ol=C5=A1=C3=A1k=27?= <maraeo@gmail.com>, Dave Airlie <airlied@gmail.com>, =?utf-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>, Randy Dunlap <rdunlap@infradead.org>, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>, Maxime Ripard <mripard@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Subject: Re: [PATCH] drm/doc: Define KMS atomic state set
Message-ID: <SdYVz-02vwuB23Xyjr6J15D4E50DBpqfdXP9QTROngMmiV2RBmXIjp2fizBEIA_iQssaVpiqwvhDhSZbc9hdQm5Hp1-I8EK3_lGnwELZkT0=@emersion.fr>
In-Reply-To: <20231201115709.61c0817e.pekka.paalanen@collabora.com>
References: <20231130200740.53454-1-andrealmeid@igalia.com> <40gonZRoP7FjDn_ugL_LpXsqwoSCZtypIe7jiWg0t8lkTx94-gESc60Cuu5eWxivJoZCNg3i-cUG9kNpKQZeYdCJPawDpTSIXivJ_t_a87E=@emersion.fr> <20231201115709.61c0817e.pekka.paalanen@collabora.com>
Feedback-ID: 1358184:user:proton
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On Friday, December 1st, 2023 at 10:57, Pekka Paalanen <pekka.paalanen@coll=
abora.com> wrote:

> > > +An atomic commit can be flagged with DRM_MODE_ATOMIC_TEST_ONLY, whic=
h means the =20
> >=20
> > It would be nice to link DRM_MODE_ATOMIC_TEST_ONLY to the actual docs h=
ere.
> > This can be done with markup such as:
> >=20
> >     :c:macro:`DRM_MODE_ATOMIC_TEST_ONLY`
> >=20
> > Same applies to other #defines.
> >=20
> > > +complete state change is validated but not applied.  Userspace shoul=
d use this =20
> >=20
> > I'd s/should/can/ here, because there are valid cases where user-space =
doesn't
> > really need to test before applying. Applying a state first validates i=
t in the
> > kernel anwyays.
>=20
> Those cases a very much an exception. If you want to explain in what
> cases testing is not necessary, that's fine to add, but without it I do
> want to always recommend testing first. There is no harm in testing too
> much, but there is harm in not testing which implies that there is
> likely no fallback either. Without fallbacks, the kernel developers
> have less room to change things, and the userspace itself is probably
> too fragile to be generally useful.
>=20
> Or, if you think this concern is moot, then why would userspace ever
> use testing?
>=20
> However, I have understood from past kernel discussions that userspace
> really does need to test and fall back on test failure in almost all
> cases. Otherwise userspace becomes too driver/hardware dependent.
>=20
> In general, I think recommending best practices with "should" is a good
> idea.

I was mostly thinking about very simple KMS clients that only use the most
basic configuration (full-screen buffer with no scaling/cropping). That's
actually a quite common case.

But I see what you mean here, I don't mind keeping the current wording.

> > > +flag to validate any state change before asking to apply it. If vali=
dation fails
> > > +for any reason, userspace should attempt to fall back to another, pe=
rhaps
> > > +simpler, final state.  This allows userspace to probe for various co=
nfigurations
> > > +without causing visible glitches on screen and without the need to u=
ndo a
> > > +probing change.
> > > +
> > > +The changes recorded in an atomic commit apply on top the current KM=
S state in
> > > +the kernel. Hence, the complete new KMS state is the complete old KM=
S state with
> > > +the committed property settings done on top. The kernel will try to =
avoid
> > > +no-operation changes, so it is safe for userspace to send redundant =
property
> > > +settings.  However, not every situation allows for no-op changes, du=
e to the
> > > +need to acquire locks for some attributes. Userspace needs to be awa=
re that some
> > > +redundant information might result in oversynchronization issues.  N=
o-operation
> > > +changes do not count towards actually needed changes, e.g.  setting =
MODE_ID to a
> > > +different blob with identical contents as the current KMS state shal=
l not be a
> > > +modeset on its own. As a special exception for VRR needs, explicitly=
 setting
> > > +FB_ID to its current value is not a no-op. =20
> >=20
> > I'm not sure talking about FB_ID is the right thing to do here. There i=
s
> > nothing special about FB_ID in particular. For instance, setting CRTC_I=
D to the
> > same value as before has the same effect. Talking specifically about FB=
_ID here
> > can be surprising for user-space: reading these docs, I'd assume settin=
g
> > CRTC_ID to the same value as before is a no-op, but in reality it's not=
.
>=20
> Whoa, I never knew that! That's a big surprise!

Aha! Seems like KMS always has a trick up its sleeve to surprise user-space
devs :)

> People have always been talking only about FB_ID so far.
>=20
> > Instead, I'd suggest explaining how referencing a plane/CRTC/connector =
in an
> > atomic commit adds it to the new state, even if there are no effective =
property
> > value changes.
>=20
> So, if a CRTC object is pulled into drm_atomic_state(?) at all, on VRR
> it will trigger a new scanout cycle always, avoiding the front porch
> timeout?
>=20
> Yikes.

Yeah, I believe so. Any property (regardless of whether the value actually
changed or not) included in the atomic commit may directly (applied on a CR=
TC
object) or indirectly (applied on a plane/connector linked to a CRTC) pull =
in
a CRTC and have side-effects. (Also, as noted on IRC, a driver might pull i=
n a
CRTC on its own, e.g. when reconfiguring a DP-MST tree.)

> > > +A "modeset" is a change in KMS state that might enable, disable, or =
temporarily
> > > +disrupt the emitted video signal, possibly causing visible glitches =
on screen. A
> > > +modeset may also take considerably more time to complete than other =
kinds of
> > > +changes, and the video sink might also need time to adapt to the new=
 signal
> > > +properties. Therefore a modeset must be explicitly allowed with the =
flag
> > > +DRM_MODE_ATOMIC_ALLOW_MODESET.  This in combination with
> > > +DRM_MODE_ATOMIC_TEST_ONLY allows userspace to determine if a state c=
hange is
> > > +likely to cause visible disruption on screen and avoid such changes =
when end
> > > +users do not expect them.
> > > +
> > > +An atomic commit with the flag DRM_MODE_PAGE_FLIP_ASYNC is allowed t=
o
> > > +effectively change only the FB_ID property on any planes. No-operati=
on changes
> > > +are ignored as always. Changing any other property will cause the co=
mmit to be
> > > +rejected. Each driver may relax this restriction if they have guaran=
tees that
> > > +such property change doesn't cause modesets. Userspace can use TEST_=
ONLY commits
> > > +to query the driver about this. =20
> >=20
> > This doesn't 100% match reality at the moment, because core DRM now rej=
ects any
> > async commit which changes FB_ID on a non-primary plane. And there is n=
o way
> > for drivers to relax this currently.
> >=20
> > I'm not sure this is a good place to state such a rule. In the end, it'=
s the
> > same as always: the kernel will reject commits it can't perform.
> > DRM_MODE_PAGE_FLIP_ASYNC does not need to be a special case here. Even =
when
> > changing only FB_ID, the kernel might reject the commit (e.g. i915 does=
 in some
> > cases).
>=20
> I think the paragraph is good to drop here, if it's documented in a
> more appropriate place.

Yeah, maybe we should expand the DRM_MODE_PAGE_FLIP_ASYNC docs a bit.
