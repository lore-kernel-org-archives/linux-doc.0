Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF6243D34B7;
	Thu, 19 Mar 2026 13:20:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773926433; cv=none; b=epPLXapfphtzHVeesCbd5og+nGIvDP0/lyAwjMJj7u5ZZbZ2pSIPc37cjOjGZovnRhO61HpOOGZHY9Hq+l0LDBGlFgtw+5ra6+3cg4y8H3KhhbDFcW5KiC84k4Nb6Ix6a7XdJmR162+i1+3hpY1qwUBzc2TWZwFwBsC5MtLt7kg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773926433; c=relaxed/simple;
	bh=dFNCoB+OTvypkD2hCF907kjKiuMgY6mxgJCx8Z225YA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vf19NaNzBFJ+K07RjzHZvq1gnyG5VNs36TythpQV8g8DejPEIOsHW5aOBq0hFJ/beYdrlkZP25qcwRsj0Ts2MJ30s4F+7O7/fVU+o9TrPdUd5N8UR2gxORHDRcoeICBXJ7vNC6ylws48AXDbQ7HoeBeqtyt9BXXSb1l4h4h0lQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BI0UppmV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BI0UppmV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31898C19424;
	Thu, 19 Mar 2026 13:20:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773926433;
	bh=dFNCoB+OTvypkD2hCF907kjKiuMgY6mxgJCx8Z225YA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BI0UppmVh84xRnAWlYINgjL7AZ7lNQoaH2vDgf0QBYu8//8cFiCyQ4bboJ1iOoM1t
	 g46xh446UX82uh5A62oLhHKD1M8sKTxg6Iqg+2IR6qOxcz43p3txdzxvG3e9vz2xOt
	 +h+P26qnUtlMtLNRET348B+eO2vK4rCDO8TXj7S8peeYRXFHn81FYyKGbKg8eGTBny
	 IXbG4A53ecwF9x4ZSkCAu45fpZi7BOZ3nf0vBgI99zha4HeSIIV1T/uLVEL1FsRx38
	 K2t5U4UeebwSUYHs0ym1n5aGyyKWLPsl9m2nzvkC8y1leBqPT9tnx8OXRRYYw+72+k
	 MNJirhQemJLYQ==
Date: Thu, 19 Mar 2026 14:20:30 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
	Jyri Sarha <jyri.sarha@iki.fi>, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>
Subject: Re: [PATCH 01/14] drm/atomic: Document atomic state lifetime
Message-ID: <20260319-analytic-purring-kittiwake-ca04fa@houat>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
 <20260310-drm-mode-config-init-v1-1-de7397c8e1cf@kernel.org>
 <b0d9aee3-46c1-486d-9516-43ee23658f40@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ekgjblyw25gmfu6n"
Content-Disposition: inline
In-Reply-To: <b0d9aee3-46c1-486d-9516-43ee23658f40@ideasonboard.com>


--ekgjblyw25gmfu6n
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 01/14] drm/atomic: Document atomic state lifetime
MIME-Version: 1.0

Hi Tomi,

Thanks for your review

On Wed, Mar 11, 2026 at 08:44:24AM +0200, Tomi Valkeinen wrote:
> > + *
> > + *     At that point, &struct drm_atomic_state stores three state
> > + *     pointers for that particular entity: the old, new, and existing
> > + *     (called "state") states. The old state is the state currently
> > + *     active in the hardware, which is either the one initialized by
> > + *     reset() or a newer one if a commit has been made. The new state
> > + *     is the state we just allocated and we might eventually commit to
> > + *     the hardware. The existing state points to the state we'll
> > + *     eventually have to free when the drm_atomic_state will be
> > + *     destroyed, but points to the new state for now.
>=20
> From this, I don't understand the difference between the old state and
> the existing state. And if the existing state is the one we'll free,
> isn't that the old state, not new state? Oh, is the existing state a
> state we have to free when the drm_atomic_state would is freed? And at
> this point the new state is the one, as it's not committed?

Thanks for pointing it out, I need to update this part. state is never
the active one, because drm_atomic_state disappears(ish) when the new
state is committed and thus, by the time an object state is active,
there's no drm_atomic_state to hold it anymore.

When a new drm_atomic_state is allocated, and we call
drm_atomic_get_$OBJECT_state, old state is filled with the current
active state, new state is filled with a copy of it we can modify.

The third pointer (that used to be called state) points to the state we
need to destroy if we destroy drm_atomic_state. Before atomic_commit,
it's the new state we didn't commit (probably to do an atomic_check).
After atomic_commit, the new state has become the active state, and we
need to destroy the old state (the state that got replaced). That
pointer is now called state_to_destroy which should be more obvious.

> > + *     state pointer (&drm_crtc.state or similar) to point to the new
> > + *     state, and the existing states will now point to the old states,
> > + *     that used to be active but isn't anymore.
>=20
> "aren't"
>=20
> I think I understand this, but... It kind of brings in a new state
> concept, "active state".

The active state is never really held by drm_atomic_state but by
drm_$OBJECT->state. drm_atomic_state is really more of an update
description (so something that might eventually become active) rather
than the actual active state.

Maxime

--ekgjblyw25gmfu6n
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCabv4FgAKCRAnX84Zoj2+
dlQsAYDR7vzmTwt1JEEv/HF8KAR9NNmfn3X6jRBwoBEB/S50xkW90weJ8uOC4KkW
Bf35htABgLyQ4IYaMs06JFIkUjAQGwanCw9lq/ykEJohuZQeKiHG0wJ3tzCNJ1zE
CE9cOqGIyQ==
=7bK3
-----END PGP SIGNATURE-----

--ekgjblyw25gmfu6n--
