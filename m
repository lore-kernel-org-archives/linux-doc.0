Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE62375ADE
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 11:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775043786; cv=none; b=ik2hVC3FbmUWObcdvzCWn74qHL3O2N79y0L2sszoplTAIJm1inPfToSMklTEeScU1fXNtw6e7JMEe0T3VBJ7M1RLqCQlMh2lXnZ+xuJ2OfwqEUyd4rzyaDoYW7jcNrw/oy3nJYTnmiRZJf5paxveDwi2huliDe7Mmft5CXKjbTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775043786; c=relaxed/simple;
	bh=/dGOsN+Ha1KnNF3V0hpjrjlsWOPxWmORU++/RLEZRAI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=hVoWYcvZWahotaF2Kdf579yWA6H/xjk+YTsxA48AOe3leCINlfbJRLavnNn8Mz58R/BYhN8N8cTdmDXlRqW++FJBlJlFS3wPJj39n17OxdMOdCSqef2wKDBlN3UakxHaJaEjNzV8FziBwjBnY7x6NLuLoUdDT6+OmOT+diwFWFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rN0EYP7l; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rN0EYP7l"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D71A11A3147;
	Wed,  1 Apr 2026 11:43:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 860DA602BF;
	Wed,  1 Apr 2026 11:43:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 6DA561045013D;
	Wed,  1 Apr 2026 13:42:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1775043781; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/dGOsN+Ha1KnNF3V0hpjrjlsWOPxWmORU++/RLEZRAI=;
	b=rN0EYP7lzgcxmAhA6isrn+hA4waEanFywvN/k2glNG1U3/MCf4ezX5/bJLCs4C3PJLDKzU
	XG3BdfLdV7mdWI4kbOEfPLGgMEUxApu9Y5GXYHYeW32yjtTqZatvWFM1aEAu5e4/xf4x3A
	+ZKFbM70Lg5zWDfisPrVffdbmFMGuEz7jKW+Ea8L7R8GjzjT1SjJp3r6WBwfwzxau1WFod
	NhyvLu+D1j3YqjSjyrIX5+Qnt3MVPndcwgrGc/6PQMVIwNJ+tsDmaBNjEXewON6mua7vOW
	G4MrBOB0+vMeOigiA/yXWaRuXRP+bcFHfHqBDgt5bbJ8Ne2QB3klyjSFrxO1Fg==
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 01 Apr 2026 13:42:56 +0200
Message-Id: <DHHSI5QRUDJQ.2IE96HSJ2SD7P@bootlin.com>
To: "Maxime Ripard" <mripard@kernel.org>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Thomas Zimmermann"
 <tzimmermann@suse.de>, "Jonathan Corbet" <corbet@lwn.net>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v2 2/2] Documentation: drm: Remove drm_atomic_state
 rename entry
Cc: "Jani Nikula" <jani.nikula@linux.intel.com>, "Joonas Lahtinen"
 <joonas.lahtinen@linux.intel.com>, "Rodrigo Vivi" <rodrigo.vivi@intel.com>,
 "Tvrtko Ursulin" <tursulin@ursulin.net>, "Alex Deucher"
 <alexander.deucher@amd.com>, =?utf-8?q?Christian_K=C3=B6nig?=
 <christian.koenig@amd.com>, "Rob Clark" <robin.clark@oss.qualcomm.com>,
 "Dmitry Baryshkov" <lumag@kernel.org>, "Andrzej Hajda"
 <andrzej.hajda@intel.com>, "Neil Armstrong" <neil.armstrong@linaro.org>,
 "Robert Foss" <rfoss@kernel.org>, "Dave Stevenson"
 <dave.stevenson@raspberrypi.com>, "Laurent Pinchart"
 <laurent.pinchart@ideasonboard.com>, <dri-devel@lists.freedesktop.org>,
 <linux-doc@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260331-drm-drm-atomic-update-v2-0-7e8fe6ddcd32@kernel.org>
 <20260331-drm-drm-atomic-update-v2-2-7e8fe6ddcd32@kernel.org>
In-Reply-To: <20260331-drm-drm-atomic-update-v2-2-7e8fe6ddcd32@kernel.org>
X-Last-TLS-Session-Version: TLSv1.3

On Tue Mar 31, 2026 at 4:41 PM CEST, Maxime Ripard wrote:
> We just did that item so we can remove it.
>
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
