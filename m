Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B511942B737;
	Tue, 20 Jan 2026 16:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768925339; cv=none; b=BkaDWPVdoRkfMPyrk3D9QPDH1GCnDkyzhEoav7rOt/0uk6GDpnvpATyp+TXYJIOomqiaFsRJF45lPej4GzvJTYKuax4CJDs9JejMd3Rg/MtqcdlbTVBa1cGxZz0RswcJ/L+wEK+vhQ1Eu979bo4iXq8iM+VvGx/y6ypZawzviQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768925339; c=relaxed/simple;
	bh=os1EwFT5nvnw99r6n/Mg19gaCUrjgTrNjKTqCnEbqzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=l2ior0WqhsKgup4k4ldvSF+4c9rRrb+85BcQq6oeHqZFJtblcAPhks4OQbui4lWovA2lWyQyTPKVVBMCISCDt1QRQ0/jEO0Kyg4DacOwVz4proMKtJvnlIUIIxcLI/vcFOaAjriPLFPZVk5ZJFF2THSFrG4PUuvg8wmoZtPniIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g9Tg7woK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g9Tg7woK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81BFBC16AAE;
	Tue, 20 Jan 2026 16:08:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768925339;
	bh=os1EwFT5nvnw99r6n/Mg19gaCUrjgTrNjKTqCnEbqzs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=g9Tg7woKpvI/KsMGSfnoNo0YwIS4G+sKz+BWpN2P7V68wE1XLyYkmeEbL6WPngR5d
	 WkiLXBu2+bGWI55uOYf7LogQY9MXJl2Q91vZ9qcSfQkn0PVRmsQ7BfQzTlmLho6Ng1
	 GDrlV4HyJL2I2MFnEE9rlwIV6tQkKxrSWljL3OWyynWhc6XZa6EjvKauM+iD1qzfjW
	 eJb+IPurbeVcPvU0DGnYpcmYkd8JJHXXLCq1igkdDqD7zeW+OLcwAt9gAXf6li+nWi
	 9HqJe2cEhrvP/9TKUOs1F5w8QzNZ0rAnyWvZk5H74XHpR1m63VP9FGvXP+9GqjxMih
	 1L8/mL8J3iHcQ==
From: Pratyush Yadav <pratyush@kernel.org>
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,  Alexander Graf
 <graf@amazon.com>,  Jason Miu <jasonmiu@google.com>,  Jonathan Corbet
 <corbet@lwn.net>,  Pasha Tatashin <pasha.tatashin@soleen.com>,  Pratyush
 Yadav <pratyush@kernel.org>,  kexec@lists.infradead.org,
  linux-doc@vger.kernel.org,  linux-kernel@vger.kernel.org,
  linux-mm@kvack.org
Subject: Re: [PATCH 3/6] kho: docs: combine concepts and FDT documentation
In-Reply-To: <20260105165839.285270-4-rppt@kernel.org> (Mike Rapoport's
	message of "Mon, 5 Jan 2026 18:58:36 +0200")
References: <20260105165839.285270-1-rppt@kernel.org>
	<20260105165839.285270-4-rppt@kernel.org>
Date: Tue, 20 Jan 2026 16:08:56 +0000
Message-ID: <2vxz7btce06f.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 05 2026, Mike Rapoport wrote:

> From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
>
> Currently index.rst in KHO documentation looks empty and sad as it only
> contains links to "Kexec Handover Concepts" and "KHO FDT" chapters.
>
> Inline contents of these chapters into index.rst to provide a single
> coherent chapter describing KHO.
>
> While on it, drop parts of the KHO FDT description that will be superseded
> by addition of KHO ABI documentation.
>
> Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
[...]
> diff --git a/Documentation/core-api/kho/index.rst b/Documentation/core-api/kho/index.rst
> index 0c63b0c5c143..03cd9afbdb2e 100644
> --- a/Documentation/core-api/kho/index.rst
> +++ b/Documentation/core-api/kho/index.rst
> @@ -4,10 +4,73 @@
>  Kexec Handover Subsystem
>  ========================
>  
> -.. toctree::
> -   :maxdepth: 1
> +Overview
> +========

I ran a test build and Sphinx complains about:

    Documentation/admin-guide/mm/kho.rst:10: WARNING: undefined label: 'kho-concepts' [ref.ref]
    Documentation/admin-guide/mm/kho.rst:31: WARNING: undefined label: 'kho-finalization-phase' [ref.ref]

I suppose you should add these labels here.

Otherwise LGTM.

>  
> -   concepts
> -   fdt
> +Kexec HandOver (KHO) is a mechanism that allows Linux to preserve memory
> +regions, which could contain serialized system states, across kexec.
>  
> -.. only::  subproject and html
> +KHO uses :ref:`flattened device tree (FDT) <kho_fdt>` to pass information about
> +the preserved state from pre-exec kernel to post-kexec kernel and :ref:`scratch
> +memory regions <kho_scratch>` to ensure integrity of the preserved memory.
> +
> +.. _kho_fdt:
> +
> +KHO FDT
> +=======
> +Every KHO kexec carries a KHO specific flattened device tree (FDT) blob that
> +describes the preserved state. The FDT includes properties describing preserved
> +memory regions and nodes that hold subsystem specific state.
> +
> +The preserved memory regions contain either serialized subsystem states, or
> +in-memory data that shall not be touched across kexec. After KHO, subsystems
> +can retrieve and restore the preserved state from KHO FDT.
> +
> +Subsystems participating in KHO can define their own format for state
> +serialization and preservation.
> +
> +.. _kho_scratch:
> +
> +Scratch Regions
> +===============
> +
> +To boot into kexec, we need to have a physically contiguous memory range that
> +contains no handed over memory. Kexec then places the target kernel and initrd
> +into that region. The new kernel exclusively uses this region for memory
> +allocations before during boot up to the initialization of the page allocator.
> +
> +We guarantee that we always have such regions through the scratch regions: On
> +first boot KHO allocates several physically contiguous memory regions. Since
> +after kexec these regions will be used by early memory allocations, there is a
> +scratch region per NUMA node plus a scratch region to satisfy allocations
> +requests that do not require particular NUMA node assignment.
> +By default, size of the scratch region is calculated based on amount of memory
> +allocated during boot. The ``kho_scratch`` kernel command line option may be
> +used to explicitly define size of the scratch regions.
> +The scratch regions are declared as CMA when page allocator is initialized so
> +that their memory can be used during system lifetime. CMA gives us the
> +guarantee that no handover pages land in that region, because handover pages
> +must be at a static physical memory location and CMA enforces that only
> +movable pages can be located inside.
> +
> +After KHO kexec, we ignore the ``kho_scratch`` kernel command line option and
> +instead reuse the exact same region that was originally allocated. This allows
> +us to recursively execute any amount of KHO kexecs. Because we used this region
> +for boot memory allocations and as target memory for kexec blobs, some parts
> +of that memory region may be reserved. These reservations are irrelevant for
> +the next KHO, because kexec can overwrite even the original kernel.
> +
> +KHO finalization phase
> +======================
> +
> +To enable user space based kexec file loader, the kernel needs to be able to
> +provide the FDT that describes the current kernel's state before
> +performing the actual kexec. The process of generating that FDT is
> +called serialization. When the FDT is generated, some properties
> +of the system may become immutable because they are already written down
> +in the FDT. That state is called the KHO finalization phase.
> +
> +See Also
> +========
> +
> +- :doc:`/admin-guide/mm/kho`
> diff --git a/Documentation/core-api/liveupdate.rst b/Documentation/core-api/liveupdate.rst
> index 7960eb15a81f..e2aba13494cf 100644
> --- a/Documentation/core-api/liveupdate.rst
> +++ b/Documentation/core-api/liveupdate.rst
> @@ -58,4 +58,4 @@ See Also
>  ========
>  
>  - :doc:`Live Update uAPI </userspace-api/liveupdate>`
> -- :doc:`/core-api/kho/concepts`
>
> +- :doc:`/core-api/kho/index`
>
> diff --git a/Documentation/mm/memfd_preservation.rst b/Documentation/mm/memfd_preservation.rst
> index 66e0fb6d5ef0..a8a5b476afd3 100644
> --- a/Documentation/mm/memfd_preservation.rst
> +++ b/Documentation/mm/memfd_preservation.rst
> @@ -20,4 +20,4 @@ See Also
>  ========
>  
>  - :doc:`/core-api/liveupdate`
> -- :doc:`/core-api/kho/concepts`
>
> +- :doc:`/core-api/kho/index`

-- 
Regards,
Pratyush Yadav
