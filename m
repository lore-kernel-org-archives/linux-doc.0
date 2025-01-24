Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FED3595A;
	Fri, 24 Jan 2025 09:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737709668; cv=none; b=q4OUQ+D1zX0/XrLHa0rTLr1GQxUPwvPHFo3pujXbQ9579YqfFHLRZ06Ieoq2qepSE4p0ENGbA4UkemvUQjSKIdYGphKo6E2MD3gBRqgTjubgQ5B9B7q9ReiFzddBjIHXo0o3GWmf/2hKGfW2PrfrDnrpNINdvXnDLmoZ2M1CUuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737709668; c=relaxed/simple;
	bh=yBoEKbLRlHlRiLtBl7kgWpjik2mkAb9rJOoWxYJ/6HM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=NDtAGP4SLl20mqpszmsY9OwN36rHTlU1L5wmkACK2x+eV7CFkRfzjq0NmS1uCQYh1JHvNBTIA1mIpZmyaMvmTsBZe9kjZo+h4eT3MoWvyM1LRcSpqhoFOyde2DlG1iPmXtGyMcTaItr6nuK8y7iCo0OhH06X/CpP148aUqUNzIM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=qaUaXQQN; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="qaUaXQQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737709665;
	bh=yBoEKbLRlHlRiLtBl7kgWpjik2mkAb9rJOoWxYJ/6HM=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=qaUaXQQNyhk3NLOcaMz5RTs/MsYAN2T6giFilw0zYOpbQZSBoYvrXMYpktYa6IYkg
	 DZY6R6rHrQPrpmdDVTsoIif7wozjuuofxVxnL9GxfGSYUqAWYywad68eVmvylGsK7u
	 8RDm435E8iO8Nw3rxWmL9y+rYVcXrZAgSNnLvLTTnrcLGckdevuQ8brQdGzL8j2R4C
	 daqdr9NgnCUSu2Sbqxw3B/uThzkVBCAxtDWuKt9W4CpUpigvc5yElvdONYdHyDeVwB
	 d6UkSasTB74Wpn4A9531dSdLwXPSYElY176yaRmfRtCQXUQN7ngC2eOZUierMtRNh2
	 25lwAJSxlg/yg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 98C9517E0E9D;
	Fri, 24 Jan 2025 10:07:44 +0100 (CET)
Date: Fri, 24 Jan 2025 10:07:37 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?QWRyacOhbg==?= Larumbe <adrian.larumbe@collabora.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, Jonathan
 Corbet <corbet@lwn.net>, Steven Price <steven.price@arm.com>, Liviu Dudau
 <liviu.dudau@arm.com>, kernel@collabora.com, Tvrtko Ursulin
 <tursulin@ursulin.net>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Mihail Atanassov <mihail.atanassov@arm.com>
Subject: Re: [PATCH v9 3/5] drm/panthor: Expose size of driver internal BO's
 over fdinfo
Message-ID: <20250124100737.23dbe0fe@collabora.com>
In-Reply-To: <20250124094830.12c17b93@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
	<20250123225325.3271764-4-adrian.larumbe@collabora.com>
	<20250124094830.12c17b93@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 24 Jan 2025 09:48:30 +0100
Boris Brezillon <boris.brezillon@collabora.com> wrote:

> On Thu, 23 Jan 2025 22:53:00 +0000
> Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:
>=20
> > +/**
> > + * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across=
 all
> > + * heaps over all the heap pools in a VM
> > + * @pfile: File.
> > + * @stats: Memory stats to be updated.
> > + *
> > + * Calculate all heap chunk sizes in all heap pools bound to a VM. If =
the VM
> > + * is active, record the size as active as well.
> > + */
> > +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_mem=
ory_stats *stats)
> > +{
> > +	struct panthor_vm *vm;
> > +	unsigned long i;
> > +
> > +	if (!pfile->vms)
> > +		return;
> > +
> > +	xa_lock(&pfile->vms->xa);
> > +	xa_for_each(&pfile->vms->xa, i, vm) {
> > +		size_t size;
> > +
> > +		mutex_lock(&vm->heaps.lock);
> > +		if (!vm->heaps.pool) {
> > +			mutex_unlock(&vm->heaps.lock);
> > +			continue;
> > +		}
> > +		size =3D panthor_heap_pool_size(vm->heaps.pool);
> > +		mutex_unlock(&vm->heaps.lock); =20
>=20
> Let's keep the locking scheme simple:
>=20
> 		size_t size =3D 0;
>=20
> 		mutex_lock(&vm->heaps.lock);
> 		if (vm->heaps.pool)
> 			size =3D panthor_heap_pool_size(vm->heaps.pool);
> 		mutex_unlock(&vm->heaps.lock);
>=20
> 		stats->resident +=3D size;
> 		if (vm->as.id >=3D 0)
> 			stats->active +=3D size;

With this addressed, you can add

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>

> 	=09
> > +
> > +		stats->resident +=3D size;
> > +		if (vm->as.id >=3D 0)
> > +			stats->active +=3D size;
> > +	}
> > +	xa_unlock(&pfile->vms->xa);
> > +}
> > + =20

