Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2B383ED117
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 18:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860249; cv=pass; b=PBkUFG5Ma7EjZk8xJD2pN7c9tSwXMfhmQIJ4RiadGQzSeG98xcEvMhuKQnA6aTriuUmxIaSJpCm/6gAEj3PqufAwbQqOREu7CNcEXNDp+cGfOmV1y4KQruOuJCE16DJU2/vQtjWlu2GA74Za2OVhzczUyMrKiHSqHvBXnqnrg+s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860249; c=relaxed/simple;
	bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R13n2OUASuMFaVHMKPCtmM38JZkVwZ50Ex65l1cZsjlZv1pkPdh0UoEaaUfvM/bI7odyBBXtJZddGEZTxvAgTi+NT3aIzRSvzqyDQGFt48lClrciP87kSsqZIurMXJkakIB3XVyJXumg5cmGnwc+qu5XxFqDiaobfaCEVkQBVgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bYiFswS+; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bYiFswS+"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2c0c482dfc8so4377eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 11:57:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860247; cv=none;
        d=google.com; s=arc-20240605;
        b=NIcEwNRtasYTXNx0WBHmKC3BeZvohSlex1/ZnQz53sN2adZSZXexKWDplp2koOFqFJ
         sfQBMfN5GdurEHfmezSfInbZ8leDPrhFnj5NaLRgz9vXHS83CyZrhXynvDWJ1n2sbR14
         OTGPygzfaprHjMaDnc/bYKN3QUtWhFOGelwlmNoNe9xCYey0ILzT9G0RxeyZ81eUZN/E
         4xoS9k8QHX7UGeMefpHoqk8UO/5H0RbnQrzL4vpG2SCdepXjHmGrkx/FHaQOEw6Ws54L
         TK0OyL2D71i3tFqfdxqaDVzr09sfd4RyFCsqWIA1GLH/3xrCDBMcoCnR8vbR4IpHndFZ
         6P8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
        fh=hbs1GetsNNSPkT3ZpbKyHYyzTFaPFlizmx3Mn0hw0nY=;
        b=ZoRYFbW19s3qjwid6J15g4NaxFYzZMhuQVZ/PFpo9fV7OKJTyHOwi642vFeGN2ivQG
         I9pI0guvooG8e3vRiVh/loSFjUm5bfYrgLEnKNzjPUfNnAtFUrdpjaVWSYqW35QIrHy0
         ZsvZ8MYxOtJasFvit79ukaN3TmMJaKK2cVKrSsSrTNoaoBlui3ZW05YN/CpFi74S6BCc
         epDqAsgrXlirCKKXISEy14Pl1CLTFPcxZlDWk2cAq2SNZXmBudBkYP7r+qm6QHms9vXr
         IJu4YrQLaHWH3dXEXsTIOfVG2vdHc+VTpfES7o+HOlLDeR6eB2EYqjf8EATOuvwtod8i
         esVA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860247; x=1774465047; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
        b=bYiFswS+IF473HnaBsgMKvJRSNlZN/lfwu86MtxxErFc7DcLsZHIxIQ8VwiGoz2igY
         LMN9LeIGAw02c01Ds9nr9kZrbrmMr7sm7FwmZctAlzxG19G1L2XNm76WU4GIro/1DiUc
         DCZlr+tolR9/hW3MpT3u9TluRJMPMgLgKtlXcsMNi73+V5gKzLC4ZkDjkvz6BQehoGxc
         T1K8Ja9T7lg8kQCI3VbTQb8TXxPEX0xZH/6zkapxMaNAFtrwNHsFP4OMNrDpqavYa8JA
         tAJsWnbmAEril4JoMORwlcPrj7GkzZmqGiUka9ymMiJr8EV+npcabUuUCUMYKN4donni
         JACA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860247; x=1774465047;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d3bcHjPGT0Fov9B4KoCksRHw66Y8wxvQ5LjIruDyWqI=;
        b=gAMZ7gEs2txjsP9UApxmrnFWpEkE8G/L0CNzfOuQcx8TKa4o9jqnwwJ8zTKBHu06fC
         aVVS5LUS27GKteBFCCBA0IdZfeyy+4GmToheGypKuqd2+oG+m3ENzo4l8uQDoWccQlve
         iB8SbbU2Clj0eEAVC7eY0R8UNPGdL5++yJnQZRl8fyWdhZTfpKbH6MWwjJzdzGrdELHB
         YYu7+WYTy8B/+O5CW2RXwKa1V3km4Owj0SFvJW8SZOmvVqAZtftm4Fcm1GhuR1JYdrh+
         KBd72Xv9M1NxVt22Hc59ox3kwAABjdMtRrU1zs7+MZc4ZjLtvW2zUhy9ockBA7HYwDqR
         AN9A==
X-Forwarded-Encrypted: i=1; AJvYcCXDX1EV73jaOUP5vJ9WauccjkESEQr+RuzAKz8EfVFz0rX3uYXSElEmAKVcuHpHgla4BLDVogqHaxk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfJjDywNOFLzQ9LBZ4u5cBM44p+P+/tuW66GLlg5NeMZpxY+qp
	9pwrXCbS6xpYHozyqtZhRB8/Sv0x8wcza0Yv8TggokCdHo2FzgSR9/LkY/+/mQGnKLRCUehQ+Pf
	oNd3dmAj8qljuYVRlrsD9n4QAqK4GO9Q=
X-Gm-Gg: ATEYQzyiJWAwK0ByBwpYGbPSoBvfJYjILu03z3RyPDtfmZ8tHG52uxyTPbCZwvpm2Xs
	qQvDfvfE74FJEWG/g8iaFOqlUq0efU2m05PCysnMEfkGFtIFNMmE67GGV17/KKHUwM3W4d2u2F+
	Y1m+5nHTlij2w+2fZh6UPSOJs1K9Ce34078dgBNJF10gZKt/acy3sWlNuLrhEHymwWgA2qUBM+j
	P/Iet/qV/33urBY4U1UZZz1VFV/3H/TD44wfBSFTChGdQq56DcITtrs2CGDRiXWsQfpFmKag9VT
	R7Fh2C0Qzai23mAglHEt/Ss6L+lHsXU6dVIT6FscaAhaJNvpzanT0vQsj+zG/vjuVR3yI2cHH4Y
	n6iHmIS1anIEBD0qDcSz1EM0=
X-Received: by 2002:a05:7300:f191:b0:2be:9886:d4ff with SMTP id
 5a478bee46e88-2c0e50fefe8mr982481eec.2.1773860246896; Wed, 18 Mar 2026
 11:57:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <abqdUBqchnVFo7Qk@google.com> <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com>
In-Reply-To: <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 19:57:14 +0100
X-Gm-Features: AaiRm52hIUr0vzgoavDmbzyJmg3hgU_AUfgRxMfUiR8zNc5S5daML4wMbNTdaCA
Message-ID: <CANiq72nZKx7pw_rZK2mHHvR=TaeGvMRvg5GTHOd58X17oyxieg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Joel Fernandes <joelagnelf@nvidia.com>, =?UTF-8?Q?Alejandra_Gonz=C3=A1lez?= <blyxyas@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Philipp Stanner <phasta@kernel.org>, Elle Rhumsaa <elle@weathered-steel.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Alex Deucher <alexander.deucher@amd.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Jani Nikula <jani.nikula@linux.intel.com>, 
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	Tvrtko Ursulin <tursulin@ursulin.net>, Huang Rui <ray.huang@amd.com>, 
	Matthew Auld <matthew.auld@intel.com>, Matthew Brost <matthew.brost@intel.com>, 
	Lucas De Marchi <lucas.demarchi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Helge Deller <deller@gmx.de>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Andrea Righi <arighi@nvidia.com>, Andy Ritger <aritger@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Balbir Singh <balbirs@nvidia.com>, alexeyi@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 7:31=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.c=
om> wrote:
>
> Anyway, the fix is simple, just need to do // SAFETY*: as Miguel suggests
> here, instead of // SAFETY:
> https://lore.kernel.org/all/CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dPid=
89LExw@mail.gmail.com/

So, to clarify, I suggested it as a temporary thing we could do if we
want to use that "fake `unsafe` block in macro matcher" pattern more
and more.

i.e. if we plan to use the pattern more, then I am happy to ask
upstream if it would make sense for Clippy to recognize it (or perhaps
it is just a false negative instead of a false positive, given
`impl_device_context_deref`), so that we don't need a hacked safety
tag (Cc'ing Alejandra).

But if we could put it outside, then we wouldn't need any of that.
Unsafe macros support could help perhaps here, which I have had it in
our wishlist too (https://github.com/Rust-for-Linux/linux/issues/354),
but I guess the fake block could still be useful to make only certain
macro arms unsafe? (Perhaps Rust could allow `unsafe` just at the
start of each arm for that...).

Cheers,
Miguel
