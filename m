Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF931284684
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 19:15:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342948; cv=pass; b=tXdJIIC3UakJvLcAF20HrWFbXsn72e9uuSPwMmpGdOl9JE0fZJ+QVkS4qryj5xd8kIDshwtwdGapUzJD0OaV+IhdThcffio+8vFcpHcGOnzcgqJbyV4dwUKk0/MXc4ac/UkRBS6mXuvS+NqMpSZSumTqukwb0LsYmfPszlVNpqU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342948; c=relaxed/simple;
	bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u1p3XKiilxE2m/oh0hAA0vsLAOZ60yv/oYWJwfO4g+r7hJ4ckETci7Bbe8TdO0fEZAbhWqdDX9348E0DqC3qS0Z8+IT5EMifpZ4T688NscbaxI/6Cf6tuwldBXC6iyd3ImlCSXu+JrjuXP6ymKGZVRaBDMJrnPg1jvbO6wJgpss=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mds+JwZA; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mds+JwZA"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-124b07e5fe4so81942c88.3
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:15:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342946; cv=none;
        d=google.com; s=arc-20240605;
        b=lgNdu669+9XyANaAQb/lQLIaOouAA5m/vgAiJQKm++gNA79yXxYAANevzJDLYSRBHb
         Nrjs9PXt55AjMRLE4VBZyi34QzkuJ7KUEOPXVvZ9Sz7vqbTDznrt0okV0HjPDaNUvk7B
         QswWdPIEsY3Na5SQTsqEcqLVYUqz7u6EJAV06zxFwWfPalc9TIpqyKog/E37ZCVQPQPf
         JrcRH2Vj5BDA+szb7iXOxmo5OJ/hPRgJb4vEH6BMT7hiq5aCylLRzLckdoas8n+1NP0L
         lJT4M3okfeHEWmQIYbW4+5uFdaKeE5hywyCj5IQoWA68j6eMmNwpluoPAJZGZhRBOhhv
         9jgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        fh=FXo8VsuLPIeja/p4VMdxOExiB9w3ZRraJ+IXdK9Dws0=;
        b=VIKyFA/BwRTbvmPm+t6j1Imn5saXpAMODIH1k+uPzSsfm3593vvqwJR3yjxhTgM+/n
         VEvPCHgS3ndhPJlQ5nsJo9H8toRkeSP+r72rrskspeeUXiJgLL0XxxhsKVENFEOnLN4U
         nPkrAJfAPWnFkYjxR4LZgAm4SkjeOV5NlRlpV6X687fDmVMalDuPrqamz3GR8xTxYG/Y
         XzzoNiGdFsL1gCd0xXLhs34WnTOuxN6u6D9W6vbLh82LAFPUvR03QXEO38Dwe5QafusZ
         0MSnsM/dRiO7BphtYSUHH9yMBL15uYZ7aWm2PrqPCjxWhxkRYgDDkF9DrxysbWeRTk7T
         Y23w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342946; x=1773947746; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        b=Mds+JwZA8Oc7NjhpeV4FSN1/iP+X+fhRT2pASsS+li3LA7tJEBaJbx9omaoF04jfJm
         0KaEhyKFhvvR6bA5Ul1RkUZjawanfmKwgnLrlG9wPkrMLlSZlV4P3wl667VdlnyYnDyj
         +ePEpIlxvj99eJCBS48+J+ArRMvkjaPX+PGwYfUcGObXIwHwaTy0ldJv0aS29SaYMC6P
         811f+SRV34+/ZJ1Sk0Qd62dCTVbEKWbwGWxpyKs7emTPYFuRVrr1og7nwpfO+gSm7lPU
         /eevbC5don8pk4HE8D8ZAkHH4F7OLq/IOaIMjPzrV6/ybLDLIuHcImYx02KR2AqUNGXB
         5nrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342946; x=1773947746;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=4VzEC4HlHoK4vh0lvr6EYPz1Eqp/YdbOqaCW1vewwOg=;
        b=SUVaMm/A+mLfjMPHSlEsQaDIR+iVVDb8BR4/KvJn5/f7jSgxMHrPZKSzb35dZ/amEC
         fVEh1TonhKrzuvtqzi4NHVOt5pVY4Hh6QQbDTTAi3bdNe2rgcUw0pH9F/HkiuIqPO33G
         HE8RDqPUs9SVG+ibNdTbroWrVfssf1lY9CtEYyNdGe/SLvvE/yHOpoRSAwuREsYzv+Cf
         4LW6/Np7TCNfFfgy/FtkcCM+p9B0NX8Bvss3dxPxvH008IcyKwUvt4x9skP4Eg9lKtdU
         B1gUhlcQENiVML1DrX9vEh7yG/0cE1da+tcZ9kAw1wEm/nxuFhB84G5NftWdIsL/NeP7
         67yA==
X-Forwarded-Encrypted: i=1; AJvYcCU3CDE51VF8WAfwhyWCwTs4oq0Ze2DHvoxFhYTietbV1jzM2nQC8l7PCeRUIEnoNv+XSTkwyNU9ia4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqXih7ZwkV1XVagqZL6oZDDxpEciIu/DwsrkCy15LG4NgZdO9G
	bDsU8ThTQWHJ1NmqhGZRh39hh0nBtRVCl9f5/icuQxb4TvsmfnEdUO8IwOpthgDOUVqtzr3zLiw
	WY4QFgnO8t42JXOdvII7N1VBUqNQDrg0=
X-Gm-Gg: ATEYQzx56Bv070WYKS8NFO+RcU4VBK4riiMb7aIzvKYSesK6hKHfZQGhI485iLKp1oc
	VB5PVDuv3dN3Vj6kZHpWC3nVQ/XcXQ2mfNt5xJTzGU5KVws5Tm3xAkcS0zQJ2GIyqD/hQnoHuEZ
	A1fcFmENMI5mYN4ad+ivS9kMyaVt/WXYHroC09DujF44jGGK3wSE8vJa082txHCFvfdVW7LrINV
	nabIypLM4X05JGoYBPSBj0ytCaVNM5wOiMPD+2boMVJKCS/roMIrvUYp3EX6Gn5lrWAwFG0EgA6
	Ela3qGxdxDZC1csJubvizKVD7F8J89331mWfR5mvMfnE6Akf8kinN6IIYUa8/72WKhrLsHP7s8G
	rGkOfBm22tO0Sou5jGeFzYgU=
X-Received: by 2002:a05:7301:1924:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2bea555c8d0mr231898eec.3.1773342945899; Thu, 12 Mar 2026
 12:15:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com>
 <20260306203648.1136554-2-joelagnelf@nvidia.com> <DH0ZMJKN6OE6.243UPT928HIIX@kernel.org>
In-Reply-To: <DH0ZMJKN6OE6.243UPT928HIIX@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:15:33 +0100
X-Gm-Features: AaiRm53560zXAmoL0EVQHDBxYh33LaVByeeBz-QChPDevjdBJ65drv5v7FGkL1c
Message-ID: <CANiq72n6ccEz71V3nkJxtY_BNbTw3F_eekt+Dyhvfb1FNP-srw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list interface
To: Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	linux-kernel@vger.kernel.org, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Dave Airlie <airlied@redhat.com>, 
	David Airlie <airlied@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Simona Vetter <simona@ffwll.ch>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Koen Koning <koen.koning@linux.intel.com>, Nikola Djukic <ndjukic@nvidia.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
	Elle Rhumsaa <elle@weathered-steel.dev>, Jonathan Corbet <corbet@lwn.net>, 
	Alex Deucher <alexander.deucher@amd.com>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
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
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 12, 2026 at 6:42=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Was this given off-list? I can't find a corresponding reply from Miguel.

Thanks for double-checking that -- it is fine.

I am sending some nits and Clippy issues independently though.

Cheers,
Miguel
