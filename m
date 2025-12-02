Received: from mout-p-202.mailbox.org (mout-p-202.mailbox.org [80.241.56.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CB3230EF74;
	Tue,  2 Dec 2025 09:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=80.241.56.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764668534; cv=none; b=N9MGUTcj/d5y5ytcgPehxmcdW2qjRL1YYHJPlBFG+IGgZ6OiU0lQOuOSkAzQmZoexVi8SLhF24WNNNTYSLWgx99mE3unXl2Yb7ExFZ1B2i3HIlc3R758wQmQYjRVMF9Qx0wsvfxtVFNlqqnnIuNjRJIY5n2DLunj/bqNCP8BlzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764668534; c=relaxed/simple;
	bh=nml6aidyLAUTKS+9IwH1T9+BnWn8mVKKNNSv+ivqmHI=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Kio3bmrkz11YzCu3aaLe8lF+x5J2PtnUWlm/YeQsnBaz5ZEFC0FNkgYyphrD5AyKBTT/B9NW/wAM0mkYi/tzpUKILL5WSmf/kFCpbr3FYasHUzO9ELD3YFOgTReOzIQsZj/+CzU8Jvl6Ed5Ngy/r0o1orHItJPxJsB/zW0hlihk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org; spf=pass smtp.mailfrom=mailbox.org; dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b=pgxalzxC; arc=none smtp.client-ip=80.241.56.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=mailbox.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mailbox.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mailbox.org header.i=@mailbox.org header.b="pgxalzxC"
Received: from smtp2.mailbox.org (smtp2.mailbox.org [IPv6:2001:67c:2050:b231:465::2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-202.mailbox.org (Postfix) with ESMTPS id 4dLG5D1PRBz9tYG;
	Tue,  2 Dec 2025 10:42:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1764668528; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nml6aidyLAUTKS+9IwH1T9+BnWn8mVKKNNSv+ivqmHI=;
	b=pgxalzxCwUTbiU3EiZagPm+kzV6Z7YR5ohIkZqei+ENi+hWO+4Ia9trV3jgPFpqALbCUZ3
	N2suGWGtwnBcT/QglZh7sT2ThDEs+KNxlrMQuVva7s+vjI62VKE9lFLjlkKtkBdC0DJfr5
	qNDV082Os163WYmLQwXsk0YqI8lqR6QHduzwTkXEMmXpbSxCwHsORpEcog6o8WcnfXZV3q
	E3sR4NrwHu3ATFnCCkvGI78ote9QmRppMLH+/EvRmYvXgvCshf5tF+U18n4T+HjeZTxf0T
	k0ZQozwVI3Kt6guzUEZYKjBIYFeNMcECQB+PTg8DfvR7E67MzKMK1+ASdo3Mdw==
Message-ID: <84fa6d8a05c0227c33f904c2b88e309963226b8d.camel@mailbox.org>
Subject: Re: [PATCH v2 0/2] drm/todo: Add section for GPU Scheduler
From: Philipp Stanner <phasta@mailbox.org>
Reply-To: phasta@kernel.org
To: Dave Airlie <airlied@gmail.com>, phasta@kernel.org
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Simona
 Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, Christian
 =?ISO-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>, Tvrtko Ursulin
 <tvrtko.ursulin@igalia.com>,  Matthew Brost <matthew.brost@intel.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org
Date: Tue, 02 Dec 2025 10:42:01 +0100
In-Reply-To: <CAPM=9twe+Q0pP3KiWy7ZTYxRs_yN1bHEto6Mptqb3ub7vimgtw@mail.gmail.com>
References: <20251107135701.244659-2-phasta@kernel.org>
	 <c35026065b1d109b7f4b9e1d8dee8ea45f9a1dba.camel@mailbox.org>
	 <CAPM=9twe+Q0pP3KiWy7ZTYxRs_yN1bHEto6Mptqb3ub7vimgtw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MBO-RS-ID: efa47a7497b131966f1
X-MBO-RS-META: yyqaxhgakntqqu66gzg19q83dn1une71

On Tue, 2025-12-02 at 17:37 +1000, Dave Airlie wrote:
> Acked-by: Dave Airlie <airlied@redhat.com>
>=20
> On Thu, 27 Nov 2025 at 22:50, Philipp Stanner <phasta@mailbox.org> wrote:
> >=20
> > +Cc Matthew, Tvrtko, Christian
> >=20
> > On Fri, 2025-11-07 at 14:56 +0100, Philipp Stanner wrote:
> > > Changes in v2:
> > > =C2=A0 - Fix wrong list item index in patch 1.
> > >=20
> > > The GPU Scheduler has enough problems to be covered by the drm todo
> > > list. Let's add an entry.
> > >=20
> > > This series is the succesor of [1].
> > >=20
> > > [1] https://lore.kernel.org/dri-devel/20251023143031.149496-2-phasta@=
kernel.org/
> > >=20
> > > Philipp Stanner (2):
> > > =C2=A0 drm/todo: Add section with task for GPU scheduler
> > > =C2=A0 drm/todo: Add entry for unlocked drm/sched rq readers

Pushed to drm-misc-next

P.
