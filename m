Received: from mout-p-102.mailbox.org (mout-p-102.mailbox.org [80.241.56.152])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8570A1A0712;
	Thu, 27 Nov 2025 12:50:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.152
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764247810; cv=none; b=AQvkF/twzQErKLPoiAwnPvOQa0DNzpDjUhaY12H28yCemhL0OILJVf+kIO16BjHiPW2NWgOYzga3ApUDTL13JYgLxRCA6C3iyDKDj1nBK9/cHJF2cCBu7zi5vG9j3OMZieECCQkPtQn/4Z2xJpMHHjk60aLPisp/Z2CVXrin/Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764247810; c=relaxed/simple;
	bh=VKqVoDFnQJXMwq/ZGtZvgxrR4iEc5s3a2rE4Kl1qBdo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=naPYocNzpRrx7ExI42KrHD2bUI+GTo6pwOp/U/eiMozV3DVb96Hi9V+P28EIpcyEutldmTq7LuxMDj3MO/miD5aByO+AKiFMdY3BN5V2s84xWcLBP1FV7ewONJOxeiRkxSmrM/dS2AQQ0FXOxPEzHEonVk1076NmSrPZImzOcds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=e4tlfV11; arc=none smtp.client-ip=80.241.56.152
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="e4tlfV11"
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-102.mailbox.org (Postfix) with ESMTPS id 4dHGVG4vJWz9sq6;
	Thu, 27 Nov 2025 13:49:58 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764247798; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VKqVoDFnQJXMwq/ZGtZvgxrR4iEc5s3a2rE4Kl1qBdo=;
	b=e4tlfV11JuSEoMY/H+3ZP17l4N6KzzpwiEcams+d1W2dYXpht5yzezMV0sFxME6wGjRf16
	qIDE0y4DPGVfE4RuBDWQZRvKWNzLKO+2wsbhvaZ5SYfk092wmJmXkg6X0VkTJ9Hby/zwox
	ZW9ogmZPOKKX5LLLPEZllCpo0mQxX4mN809xqCuXml1zKD7FZXpG445nh0joOLhhDgRHJy
	EAJHjPjaeYoErLhrhQYYjmzL2lKDS0gL8P87pMz69i9Z0LB4EO013tkuIkipfeIzT9MGFp
	i7yllI4U1k6lIDw/w6X80RnxJzFR2iIDAPxPslp8H8xeYnXzXBtaKYh+ajN+Ww==
Message-ID: <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
Subject: Re: [PATCH v2 0/2] drm/todo: Add section for GPU Scheduler
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Philipp Stanner <phasta@kernel.org>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
 Christian =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,  Tvrtko
 Ursulin <tvrtko.ursulin@igalia.com>, Matthew Brost <matthew.brost@intel.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 27 Nov 2025 13:49:53 +0100
In-Reply-To: <20251107135701.244659-2-phasta@kernel.org>
References: <20251107135701.244659-2-phasta@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: a3cd0126dafb4a24107
X-MBO-RS-META: a6r1ffo9oceai1r4yqi5oaifc83skfct

+Cc Matthew, Tvrtko, Christian

On Fri, 2025-11-07 at 14:56 +0100, Philipp Stanner wrote:
> Changes in v2:
> =C2=A0 - Fix wrong list item index in patch 1.
>=20
> The GPU Scheduler has enough problems to be covered by the drm todo
> list. Let's add an entry.
>=20
> This series is the succesor of [1].
>=20
> [1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@kern=
el.org/
>=20
> Philipp Stanner (2):
> =C2=A0 drm/todo: Add section with task for GPU scheduler
> =C2=A0 drm/todo: Add entry for unlocked drm/sched rq readers

Can someone give this series a review please?

Thx,
P.
