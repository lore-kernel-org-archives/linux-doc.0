Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D65C11DB120;
	Fri, 24 Jan 2025 08:49:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737708574; cv=none; b=oFBq3wP/374NhJXrYYU6I7C7as2NaQaFdRyKoTmf0GRDLWAj+GbfTFyLqzSBuUpDpnHHhjmnxLJDae7wYYmJkHoPxy3Q1S+4whgT/R0hvDdNuYhjK4O7yUCGTTDUs8DAIKLEupbmx8R25KqcA7df8jb/RUr9Exncu+0G1fRTxA4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737708574; c=relaxed/simple;
	bh=fxFDZsIVmHb3FecdTmipK6E011R+3S1pmQ1B4v6mNuk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tdicCGQvG7JNS+D4XUruOAFQH74ryrrI2NyITTBuDEDflQYK1/fI8XaToRAtHYSarLMriBpDbOlQC5VA/fGUPQOFl+ZkDVWYseNHdLUKtRxkwLkmOwy/wGw+kitoeigr7gma6wfaet8XZZP622SZk8XvQmcsjI+Z+UsZ3aKMOSw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Bnj4pJtZ; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Bnj4pJtZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737708569;
	bh=fxFDZsIVmHb3FecdTmipK6E011R+3S1pmQ1B4v6mNuk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Bnj4pJtZiJYg4OsuUKaGjka4QtE8iP1YhTQmMMLJ0FS6pQOOEyraQEuFgh5OekJ7O
	 6x+ltyxbQ6PIuFUdTwjeD7Kf1rkAVorgpOp45zndjO/MzZxGL88na1fRhDQKx6ETe7
	 zx55QAeYKT+7wGhaZpIg0W5zrB89MX6ScokNpXfhIoCZZmOV4aD2bpCbuoGADEdIvP
	 RvlFLqgFWkQhUnLwnqTaj9lFb7wm6cYgPDVUMzamt9zvBELdmS5Dab7Ygj66JNLtqb
	 RHBAZPEff2MGyusJghbKzgv6CO8NxA0GghnivAQfCvWimVP0CFhEPZNAxY37g8O3W8
	 qwhSCwT7Kjfrg==
Received: from localhost (unknown [IPv6:2a01:e0a:2c:6930:5cf4:84a1:2763:fe0d])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0B0EA17E0E57;
	Fri, 24 Jan 2025 09:49:29 +0100 (CET)
Date: Fri, 24 Jan 2025 09:48:30 +0100
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
Message-ID: <20250124094830.12c17b93@collabora.com>
In-Reply-To: <20250123225325.3271764-4-adrian.larumbe@collabora.com>
References: <20250123225325.3271764-1-adrian.larumbe@collabora.com>
	<20250123225325.3271764-4-adrian.larumbe@collabora.com>
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

On Thu, 23 Jan 2025 22:53:00 +0000
Adri=C3=A1n Larumbe <adrian.larumbe@collabora.com> wrote:

> +/**
> + * panthor_vm_heaps_sizes() - Calculate size of all heap chunks across a=
ll
> + * heaps over all the heap pools in a VM
> + * @pfile: File.
> + * @stats: Memory stats to be updated.
> + *
> + * Calculate all heap chunk sizes in all heap pools bound to a VM. If th=
e VM
> + * is active, record the size as active as well.
> + */
> +void panthor_vm_heaps_sizes(struct panthor_file *pfile, struct drm_memor=
y_stats *stats)
> +{
> +	struct panthor_vm *vm;
> +	unsigned long i;
> +
> +	if (!pfile->vms)
> +		return;
> +
> +	xa_lock(&pfile->vms->xa);
> +	xa_for_each(&pfile->vms->xa, i, vm) {
> +		size_t size;
> +
> +		mutex_lock(&vm->heaps.lock);
> +		if (!vm->heaps.pool) {
> +			mutex_unlock(&vm->heaps.lock);
> +			continue;
> +		}
> +		size =3D panthor_heap_pool_size(vm->heaps.pool);
> +		mutex_unlock(&vm->heaps.lock);

Let's keep the locking scheme simple:

		size_t size =3D 0;

		mutex_lock(&vm->heaps.lock);
		if (vm->heaps.pool)
			size =3D panthor_heap_pool_size(vm->heaps.pool);
		mutex_unlock(&vm->heaps.lock);

		stats->resident +=3D size;
		if (vm->as.id >=3D 0)
			stats->active +=3D size;
	=09
> +
> +		stats->resident +=3D size;
> +		if (vm->as.id >=3D 0)
> +			stats->active +=3D size;
> +	}
> +	xa_unlock(&pfile->vms->xa);
> +}
> +
