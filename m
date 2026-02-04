Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62F122C21EB
	for <linux-doc@vger.kernel.org>; Wed,  4 Feb 2026 03:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770177319; cv=pass; b=JoQyRwuIkznhLUzWHwyRLd1rO859gw3iY0QLCy0Ri/5+Qmg1/OM1HgZe+mAXqf+5i13GBV0k9mPHo0HE75YLKrUs5wwlhkpZ8VDCeri5aMFHFqi01DM4jDcS5SYwDeIlkFnZoHP63eacCQxgr2VkicHFJBr1yBxd8iVqvS5uKOQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770177319; c=relaxed/simple;
	bh=H4pGZZbvseyzZif1fPnr/a6oisfe207lURmhI/AzW40=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=duCrJcZOb8mMQDxEoiUFhKjap/Ihux8Rs26facDtgiPS6XyqiXL8lkPvn4+dhAhXhHCIJZcdV8MEmZP6PJaTYuWwtTz8ne+X9/ecie5YQ6l9T+1y/92apEbRM7AFM0hSjq8K3LUqL1rGEUwhSy5K79dAPt503MzzP01Hv7B9Pn0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2BCyLWj; arc=pass smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2BCyLWj"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-894676e6863so74658126d6.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Feb 2026 19:55:18 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770177317; cv=none;
        d=google.com; s=arc-20240605;
        b=bTpUPFEbOYBF+jt144vI9gicQBKjbmgHnskuKtPIRSYVrvBUii2gmFrvOnSKNW45Th
         L/ZcVINr2eKnkMORSuRM1+ejjmc1AVow+kApq6hYs0zjnSVYviYySMZOzhGzDcLn9rrp
         hJ8LCVdwGHTqUNAY9U1J1LQKfYR8Watvm3NiFWZVa3fjvba4RucAlxkEFDFBS31BTzIL
         D9PTH6wkAS5aulPEbtxlUH05FGblD72jlSH0E8nKVYaZFEUXdxzVFldwv9s/8gWyQk+g
         co1g+aMi7a6DJWEvjWbypk7pEv02D5roPuVf2HWO8HmBnGFFS0n5pFW8h8IRfLOE+eRC
         iv9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
        fh=snafjNXqZq7cBjCKvxlVfgi1us/mF718CYE4wQOaF1A=;
        b=Z1vbDqTKTeHXqyGYWd/n74Gt8da4h4XTlFJB2fsJAS9T39xrsQZL8FE0NI2NMEmdAg
         HU274FXieFRaTOmSSv76R8OIQCziGMRIoHZ+jEACQseQ7PcojLCLWyDbV+VNi59zUkTx
         rbh6fSP3mlKtzjXVX3fOcPtijG58jnNckuWu6oDecR2QH/x3vlNpfQiOOj88161h0s1y
         ypi/QujIdOTsuMHthKXJVKazcarMw0Umg3rGS+8ih2lov4mRlDS7ttQsr4dpfZivEVld
         xZ8ywHia63bJwoueOFSk2JVTDCTTsnNcAoedIpDSxExeIOJuVd/+LlYtheVWJJ2kR1T/
         Jn5Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770177317; x=1770782117; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
        b=H2BCyLWjTFVnk6YAsRp5cqfv4BzlHA5oHJ38C6XoYnZs+p7zMYyFyNTe6C5QXvWGvS
         TxlQsm79iTSaJ0aE2VIq0ItN8oO5D9VsDb9NUr9gLs/2bgo+HkElkmxg6V0Gcg7ZbEih
         hgTumfLllYEh3//RO6nsCgS+O8p9b6aex1zkLBGd4TS1irQOKkNatK2b6SgVOCPJxNRJ
         t54PmJwr5nQ5wlbC95g9rIrYDHKr277TOu2g7n9pxtOx0ecganKGojPfW64ce1FznHBy
         RK6pUtIHEQyKWk9PIoXqLYMlFFACXFy3O8U4PNSmzpWHWxN1E5hL8Tj45WFZxzb9Of5N
         ctgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770177317; x=1770782117;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tf5RbUuZBD7vAitiDxd/SxMvRKm2h5sg9P3f0WhMpEo=;
        b=L+KkHWSWGptqyYy+3mZbLcHZt8kP/SPhZY7NPqGywkvMUwu0QSQjk5KhD29/e0G3uP
         lNhMxy+ozimd0YqjxU1HUf/rCXjjirAFjXyRyCwj/D2fJeMuCgjKzaCSf5AeXts7MWC2
         CA2uai+zhuzCXtwCgwVUy1blnmGPVtnHoHFQTrEZ/k5IklDbyYR4TYsWVOzFZvd6Tlma
         J8+EuoQmXzgtR+b4N+DsjzDts/8yXrU10VOs6L3tR6P9Fed3/mC6koqxIMhGSoyDhExB
         eOc0fnUi+8hQqpPNWjEzkJ2yRXQ5QtuFjWPYzvLO+PXcQXC+fOJkVKQDIpdLGPE9VykA
         4zVw==
X-Forwarded-Encrypted: i=1; AJvYcCX6uIWvtPNYFiJQ7jydXdQ4moU10WSnEVvWBG8jntOOMtR4/dCkBDgBfbMNWNScffyIGfKFuNFp1wg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw9tkjN1Okny12avuVufX0UmHOG3Ko6QQ1Js8UOgtJZNoSEzC7+
	A7JVDtBodaZoo5Mu/QBHTO55WyALexcnkDDgt07LHycML7ND6HKGCv4jQ+IfhAEiewmJV0Fi1pF
	w/FlH7d2Vd2HRfgnlgY3JZmZDNRz0M80=
X-Gm-Gg: AZuq6aKOhZQh3A3fWl42DAgWndFbTc7KVAw34DqquZtuIo+k02hvT/V4hDDtMAM82zi
	p0uoFUy1bTGC58u2luGlZHa4qW2Z3ctjiRpdDL2ci69AXXBpXrFGOivE5qoLzRCXfgOd5tkiyTp
	wKHHDYQXRTXLt3Gz4HWeHLvv1o8a6cu8oVGyOPklS5oXv3sIRce3EcifBfHcbmAj+88ckprTrsX
	TA8aiuS4qsaI1BLlwPY47eb6fiPtE/YF2wwQAdcvmh1WOA+STquZqQfYEpvFxp3IhR+H9ZZEsKd
	EhDLRqf0P4jYRxrz5wmbAtY4k4OfMeUjE9rIR/UpyCZ6dTrJT6M4KcE=
X-Received: by 2002:a05:6214:1d29:b0:894:7eb9:ead2 with SMTP id
 6a1803df08f44-895221a66d7mr25922916d6.32.1770177317310; Tue, 03 Feb 2026
 19:55:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120204303.3229303-1-joelagnelf@nvidia.com> <20260120204303.3229303-4-joelagnelf@nvidia.com>
In-Reply-To: <20260120204303.3229303-4-joelagnelf@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Wed, 4 Feb 2026 13:55:06 +1000
X-Gm-Features: AZwV_QgqNJTzw-ZqXx5fJP-IeYh6sbx0Oiz2PE2A1U4oPqZRrSE9m3Umv0I5kN4
Message-ID: <CAPM=9tyL_Cq3+qWc4A41p7eqnNDLS1APUEeUbaQyJ46YDkipVw@mail.gmail.com>
Subject: Re: [PATCH RFC v6 03/26] rust: gpu: Add GPU buddy allocator bindings
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andrea Righi <arighi@nvidia.com>, 
	Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, Alexey Ivanov <alexeyi@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Daniel Almeida <daniel.almeida@collabora.com>, 
	joel@joelfernandes.org, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> +///
> +/// These flags control the allocation behavior of the buddy allocator.
> +#[derive(Clone, Copy, Default, PartialEq, Eq)]
> +pub struct BuddyFlags(usize);
> +
> +impl BuddyFlags {
> +    /// Range-based allocation from start to end addresses.
> +    pub const RANGE_ALLOCATION: usize = bindings::GPU_BUDDY_RANGE_ALLOCATION;
> +
> +    /// Allocate from top of address space downward.
> +    pub const TOPDOWN_ALLOCATION: usize = bindings::GPU_BUDDY_TOPDOWN_ALLOCATION;
> +
> +    /// Allocate physically contiguous blocks.
> +    pub const CONTIGUOUS_ALLOCATION: usize = bindings::GPU_BUDDY_CONTIGUOUS_ALLOCATION;
> +
> +    /// Request allocation from the cleared (zeroed) memory. The zero'ing is not
> +    /// done by the allocator, but by the caller before freeing old blocks.
> +    pub const CLEAR_ALLOCATION: usize = bindings::GPU_BUDDY_CLEAR_ALLOCATION;
> +
> +    /// Disable trimming of partially used blocks.
> +    pub const TRIM_DISABLE: usize = bindings::GPU_BUDDY_TRIM_DISABLE;
> +
> +    /// Mark blocks as cleared (zeroed) when freeing. When set during free,
> +    /// indicates that the caller has already zeroed the memory.
> +    pub const CLEARED: usize = bindings::GPU_BUDDY_CLEARED;
> +
> +    /// Create [`BuddyFlags`] from a raw value with validation.
> +    ///
> +    /// Use `|` operator to combine flags if needed, before calling this method.
> +    pub fn try_new(flags: usize) -> Result<Self> {
> +        // Flags must not exceed u32::MAX to satisfy the GPU buddy allocator C API.
> +        if flags > u32::MAX as usize {
> +            return Err(EINVAL);
> +        }
> +
> +        // `TOPDOWN_ALLOCATION` only works without `RANGE_ALLOCATION`. When both are
> +        // set, `TOPDOWN_ALLOCATION` is silently ignored by the allocator. Reject this.
> +        if (flags & Self::RANGE_ALLOCATION) != 0 && (flags & Self::TOPDOWN_ALLOCATION) != 0 {
> +            return Err(EINVAL);
> +        }
> +
> +        Ok(Self(flags))
> +    }
> +
> +    /// Get raw value of the flags.
> +    pub(crate) fn as_raw(self) -> usize {
> +        self.0
> +    }
> +}
> +
> +/// Parameters for creating a GPU buddy allocator.
> +#[derive(Clone, Copy)]
> +pub struct GpuBuddyParams {
> +    /// Base offset in bytes where the managed memory region starts.
> +    /// Allocations will be offset by this value.
> +    pub base_offset_bytes: u64,
> +    /// Total physical memory size managed by the allocator in bytes.
> +    pub physical_memory_size_bytes: u64,
> +    /// Minimum allocation unit / chunk size in bytes, must be >= 4KB.
> +    pub chunk_size_bytes: u64,
> +}
> +
> +/// Parameters for allocating blocks from a GPU buddy allocator.
> +#[derive(Clone, Copy)]
> +pub struct GpuBuddyAllocParams {
> +    /// Start of allocation range in bytes. Use 0 for beginning.
> +    pub start_range_address: u64,
> +    /// End of allocation range in bytes. Use 0 for entire range.
> +    pub end_range_address: u64,
> +    /// Total size to allocate in bytes.
> +    pub size_bytes: u64,
> +    /// Minimum block size for fragmented allocations in bytes.
> +    pub min_block_size_bytes: u64,
> +    /// Buddy allocator behavior flags.
> +    pub buddy_flags: BuddyFlags,
> +}
> +

(not a full review)

Any reason these two need Clone, Copy? I'm not seeing a use case for
that, maybe we should pass them as non-mutable references, but I don't
think there is any point in passing them by value ever.

Dave.
