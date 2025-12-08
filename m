Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCDAA2BEC4E;
	Mon,  8 Dec 2025 11:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765193391; cv=none; b=bhlxXSq4w0G/zRHuqNhvL5g63KfpYyItAUJd55xqCNZVRoKVlJ4AmIRklbqKZTkqo2EQdT48VMhyuP9PmJxewYpZVAsWwaPh8s82iaxPlyAOAqvKEB8cKllRScm+BSQ8P3IjP+vk2l+4M5ruxBIpGYfoNzYU32YbSn/FMLI9tsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765193391; c=relaxed/simple;
	bh=yocxDYajSo8I7hKgvmgacDeK5+luRXC0USgZVW1ZBow=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kMgPxqg7tuYYFq7RmE0mnTStCFktP98ap6dPWhDPR7MY4csNOiRipHnEIq1Y+dEz428IowgXibZtJwJSWoUoa/HcWcST3jGwt7039FoCiZEFAi0orMnMDjT5T+GjGX/3enPMqGXpfjb+oAmayub0ZEeyvVYkxIogijuWmueHr4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=SpQNKfWg; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="SpQNKfWg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765193386;
	bh=yocxDYajSo8I7hKgvmgacDeK5+luRXC0USgZVW1ZBow=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=SpQNKfWgcupNyr+v24kkzZORyvuJLtbVY8hTATmtaWYR2XPHVaBf2SI+6MsI3DJ1+
	 CQPhf4EdD4BGGWYdmsMqhjv+c+QoyPb6HcE+po9RcTuVPtzMLcoWDLO0f9ebRtOxAC
	 fFSQch0NKiecEOLiQAjoYvEI1UI+g9yh8ZD2od8Chb37byQjp1HoWjzA3pWQIfnVhE
	 mtj3XSPHPT6+kLJ1EnbRtER2OLxHQCYHdYkDFG6m4Ho7Rgq7lNBgvbo+DkKCXzg76x
	 hNuBM7acxfw1QtCaOYyPJxAso8MZiciizeGFX6FTgSuHAEJHRWa9LBqmcOuDJ0ZPtJ
	 tsBxtqQHZOtvA==
Received: from fedora (unknown [IPv6:2a01:e0a:2c:6930:d919:a6e:5ea1:8a9f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DA92217E0CF5;
	Mon,  8 Dec 2025 12:29:44 +0100 (CET)
Date: Mon, 8 Dec 2025 12:29:41 +0100
From: Boris Brezillon <boris.brezillon@collabora.com>
To: =?UTF-8?B?TG/Dr2M=?= Molinari <loic.molinari@collabora.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard
 <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, David Airlie
 <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Jani Nikula
 <jani.nikula@linux.intel.com>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Rob Herring <robh@kernel.org>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Melissa Wen <mwen@igalia.com>, =?UTF-8?B?TWHDrXJh?= Canal
 <mcanal@igalia.com>, Hugh Dickins <hughd@google.com>, Baolin Wang
 <baolin.wang@linux.alibaba.com>, Andrew Morton <akpm@linux-foundation.org>,
 Al Viro <viro@zeniv.linux.org.uk>, =?UTF-8?B?TWlrb8WCYWo=?= Wasiak
 <mikolaj.wasiak@intel.com>, Christian Brauner <brauner@kernel.org>, Nitin
 Gote <nitin.r.gote@intel.com>, Andi Shyti <andi.shyti@linux.intel.com>,
 Jonathan Corbet <corbet@lwn.net>, Christopher Healy <healych@amazon.com>,
 Matthew Wilcox <willy@infradead.org>, Bagas Sanjaya <bagasdotme@gmail.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 intel-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, kernel@collabora.com
Subject: Re: [PATCH v13 00/10] drm: Reduce page tables overhead with THP
Message-ID: <20251208122941.61bea21d@fedora>
In-Reply-To: <20251205182231.194072-1-loic.molinari@collabora.com>
References: <20251205182231.194072-1-loic.molinari@collabora.com>
Organization: Collabora
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.51; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri,  5 Dec 2025 19:22:21 +0100
Lo=C3=AFc Molinari <loic.molinari@collabora.com> wrote:

> This series aims to reduce the page tables overhead of DRM drivers for
> builds with CONFIG_TRANSPARENT_HUGEPAGE enabled and either the sysfs
> knob '/sys/kernel/mm/transparent_hugepage/shmem_enabled' appropriately
> set or drivers using a dedicated huge tmpfs mount point.
>=20
> It starts by checking whether a faulty address in the page fault
> handler is part of a huge page in order to attempt a PMD sized PFN
> insertion into the VMA. It then introduces a dedicated
> get_unmapped_area file operation on the DRM file descriptor for GEM
> objects to get the best virtual address alignment for the underlying
> shmem buffers.
>=20
> The remaining commits propose shmem helpers to create and release huge
> tmpfs mount points and adapt the i915 and V3D drivers. The helpers are
> then used to optionally enable Transparent Hugepage for Panfrost and
> Panthor.
>=20
> For Panthor on a Rock 5B, this series makes the first memcpy() to an
> entire BO object mapped in userspace about twice as fast with
> Transparent Hugepage enabled.
>=20
> Implementing a fault-around handler using the arm64 contiguous page
> hint (contptes) could also greatly help reduce page tables overhead
> for small pages by mapping several contiguous pages around a faulty
> address at once. This will be proposed in another patch series.
>=20
> Lo=C3=AFc Molinari (10):
>   drm/shmem-helper: Simplify page offset calculation in fault handler
>   drm/shmem-helper: Map huge pages in fault handler
>   drm/gem: Introduce drm_gem_get_unmapped_area() fop
>   drm/gem: Add huge tmpfs mountpoint helpers
>   drm/i915: Use huge tmpfs mountpoint helpers
>   drm/v3d: Use huge tmpfs mountpoint helpers
>   drm/gem: Get rid of *_with_mnt helpers
>   drm/panthor: Introduce huge tmpfs mountpoint option
>   drm/panfrost: Introduce huge tmpfs mountpoint option
>   Documentation/gpu/drm-mm: Add THP paragraph to GEM mapping section

Queued to drm-misc-next.

>=20
>  Documentation/gpu/drm-mm.rst                  |  29 ++-
>  drivers/gpu/drm/drm_gem.c                     | 202 +++++++++++++-----
>  drivers/gpu/drm/drm_gem_shmem_helper.c        |  77 +++----
>  drivers/gpu/drm/i915/Makefile                 |   3 +-
>  .../gpu/drm/i915/gem/i915_gem_object_types.h  |   9 +-
>  drivers/gpu/drm/i915/gem/i915_gem_shmem.c     |  58 +++--
>  drivers/gpu/drm/i915/gem/i915_gemfs.c         |  71 ------
>  drivers/gpu/drm/i915/gem/i915_gemfs.h         |  14 --
>  .../gpu/drm/i915/gem/selftests/huge_pages.c   |  15 +-
>  drivers/gpu/drm/i915/i915_drv.h               |   5 -
>  drivers/gpu/drm/panfrost/panfrost_device.c    |   3 +
>  drivers/gpu/drm/panfrost/panfrost_drv.c       |   6 +
>  drivers/gpu/drm/panfrost/panfrost_drv.h       |   9 +
>  drivers/gpu/drm/panfrost/panfrost_gem.c       |  18 ++
>  drivers/gpu/drm/panfrost/panfrost_gem.h       |   2 +
>  drivers/gpu/drm/panthor/panthor_device.c      |   3 +
>  drivers/gpu/drm/panthor/panthor_drv.c         |   7 +
>  drivers/gpu/drm/panthor/panthor_drv.h         |   9 +
>  drivers/gpu/drm/panthor/panthor_gem.c         |  18 ++
>  drivers/gpu/drm/panthor/panthor_gem.h         |   2 +
>  drivers/gpu/drm/v3d/Makefile                  |   3 +-
>  drivers/gpu/drm/v3d/v3d_bo.c                  |   6 +-
>  drivers/gpu/drm/v3d/v3d_drv.c                 |   2 +-
>  drivers/gpu/drm/v3d/v3d_drv.h                 |  11 +-
>  drivers/gpu/drm/v3d/v3d_gem.c                 |  21 +-
>  drivers/gpu/drm/v3d/v3d_gemfs.c               |  62 ------
>  include/drm/drm_device.h                      |  15 ++
>  include/drm/drm_gem.h                         |  40 +++-
>  include/drm/drm_gem_shmem_helper.h            |   3 -
>  29 files changed, 420 insertions(+), 303 deletions(-)
>  delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.c
>  delete mode 100644 drivers/gpu/drm/i915/gem/i915_gemfs.h
>  create mode 100644 drivers/gpu/drm/panfrost/panfrost_drv.h
>  create mode 100644 drivers/gpu/drm/panthor/panthor_drv.h
>  delete mode 100644 drivers/gpu/drm/v3d/v3d_gemfs.c
>=20

