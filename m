Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A57A73DA5A3
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773842640; cv=pass; b=rCVFSasNOINs/+k60C+9MrB3K4yNfydUw1CmwGJJ5mKwLmH2qR0wKvG/jBGrMN/VQH2XPFHXLlvjH/N4p96JvxVOSRVi28uf9RdLye6maw0RaDvoOtwyZtES/5hiT/Q3V7VA84CwDmnU2NSEU9bQPw8GRIav5bMCGbbs8AhneoE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773842640; c=relaxed/simple;
	bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y8u/JzdFHbefivWeO9cx35oVpxmlfLBUIz7TK4qZSoEkb4h4Ss9DJFJZ5w/DYkw7ebm1K9Sl2yPNToBejG24oevODeuWg/ejHpeLHbCPLL7BMv8NqCI1qX+gT19lzfPmZ7KNPKgQ3aw4FC5hbsAVLgNpNLMLHkMCrAXOOBLdnj8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mqQg1d1y; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mqQg1d1y"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2bda3b4318dso480757eec.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 07:03:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773842639; cv=none;
        d=google.com; s=arc-20240605;
        b=WfGKq2dsqpWF3371gi/zU0r/kn6xiCRnkVC593fEiHon93p8ICY7F0u/0KaAOJh3gU
         MQGhXLFi0sodp8ohPGl4MI4wTJOEEVuRbaeeHJrg5njKwmxEjB1c4SlaQlFK/M/2yTL6
         SpKcW0o7XlIH+YbWO3lF0kofkFojiAOzUU5/WL+N93R5stJZ03vJ7YhrytaGBeofuBto
         UYQbMu+xRXytLnVuLxY9OzD7s1gm9vBQ+SmHmEPgYzqth1IWpjEU8DGrdI13qXF3eelg
         glRklJuwBk6/aZVBqEtmzqrclWC7yCEmNNFZ9QDRy/4pcw4FPrFgMcLHmToXjqriDBXN
         0xmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
        fh=fUqA3GZruq2M3KnDrMZpjZwXw0/HHfafFE+MOeFfr4U=;
        b=X7YyrGQqTs/Ak4gp1QNf3SIHvxBL/WEk8J/3d+l4YDphTCGFYB90qmMZS5sxNGc3Q5
         DdjdBhcwaQURivpw763MVfEYN28sPBCwMk1NhTWUDQSRwLvkc/1lsdAe67R3yekDZsi7
         cLZY4w0FIASBbzn5boxEDowRig0pRFEIctECeHNrALHzl3U7QqfiWaeBLBNREVi/SYcy
         EYyR31+01dkbbat2brp68VKqZ3oS4IjFrigsfB+GIvPD51Pj/iQaIuqBIm9UUu0Wy0dy
         SSNKY0KmkanHgF3WfKKqZDEJqAQYcLLMSddOR1uNrYqRjQ0YOczWoAsL+d1RVh3yPkn5
         f3Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773842639; x=1774447439; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
        b=mqQg1d1yHfCOS9q/wWHZZSnCggj6Lxz4m8Gu59eZHOtuH2zHauxuNYB+d2IG5/V4th
         TvYFpwJeU3+FS6w4JH6IIyxOPGwusKvRyCrKViUtzMFdcM70JnPxbXbOLkXQAync8Ix0
         jkEuOL/v5ohTVWOcVs4FbKQHMSkqnVqWxsRKNMnQu1U0ggTboAgBTBYFXG4kEtrCUQRp
         FgI2+07l+Ft25pknsMAPyO3AJHWOa5n9fRI4rBRaP5Iw6cUUZWpLLMxm5UB+Y3Yj+s7S
         THruLwCH/DYEIUmb1sWXz6u8uS8YUfXHH46caXqHvnRs3uji1XI9n8+aa38fZsWvi3pQ
         gzmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773842639; x=1774447439;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k/U8OvDUcJJhqeuFuNoQEHJ2yWsVYBLtuE+GiuKyXfU=;
        b=T0H1crqH+snlqa2WetHv3vLOTwUwWIbmnyn0ThoISthE2xFo+Zj8kLzh1eiEKE6+XZ
         nIjVgTDCbtUioat4Mv8E64hb0i1aH1T5UUQepXfLhkozTuBkuFrSk5i29zQDm5MhBe9P
         rF9PiFvE9n0CaCkurifIGQMrgG0e/5jnmkKVlSbBFV9Ehv4kzLgBBgIuq9nmMEelb9h6
         D4ZIcIk8S8mwMrdyWZ6EWXnSHZKQQulWzp4LifBQ0pyBsYuPjszi4WycI5zjrpHIOJtb
         K1PDGfjoQZLJiFROuCQuSlhltdw9sbAaSnRNQJbB6BIJwHTj29yaQtcfGgRFvj1NHju0
         9FdQ==
X-Forwarded-Encrypted: i=1; AJvYcCW5L/2ESwx1IqHaplP4xWXd5+9s45D2FmcqN/6wArrxj4RSckciHMT4diVtAUuoJS41r4aWBw3Ifoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxf/DdJhTkmvgrs82xyJ9ivlBVdAHPzlk9HBPpcW42tRgF12fL
	IgGbcfqGNa3izTANmtwTjzFlYt9+MHAdSiKnZYTKyye2/ps2IdE2UVXH4Tyjjpd6rFg0LhDJILr
	ed02oB4KC+sl3j2AIwzmDPXggbHF0G/I=
X-Gm-Gg: ATEYQzyR8mr9DX73j9FCB/Ib0PoPqIa1o2KZDggcMVxBcvJ/FC2oZBQguYovip9+rsC
	7Jx+TwC19FmQeICIBU9oVEYwqDHZIuo4MX20v3nNrw2iS4jElGAagLol0Y9ysc0hPreVbnVqDR1
	IaiQv8H65NauQiIXvW15MvF5vGVmCu5kazV8mrGY9l5AkY2UAczd4hJHgdf706HtaWUDgjCJhx9
	WJvu6FGqGBDVKSfiyUzQG5b9WwrkhoZp8jjf7EYhVE4+/Kdb6RQnn5sGkB0z3Eh78ofwJMMcxEK
	XbjaGswpNrMgEY0m7hzRZp4ZZ+1kdq6wgeDuU6xT8SnQHT56Rte9pt6n27jBQLdS0qWPS33CX/Q
	sKhgrSnV4AXjOZXYEQOtD/bU=
X-Received: by 2002:a05:7301:1e92:b0:2bd:d8e6:90a0 with SMTP id
 5a478bee46e88-2c0e5071063mr859030eec.3.1773842638629; Wed, 18 Mar 2026
 07:03:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <abqdUBqchnVFo7Qk@google.com>
In-Reply-To: <abqdUBqchnVFo7Qk@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 15:03:46 +0100
X-Gm-Features: AaiRm52jPRFXXf03k9diVYR0ZGnNxGkoAlPwk0mwDAEpyLjxWwYifunzB4OTgFU
Message-ID: <CANiq72koBNCeXFh7uX5GHRJoAu7fyhttDHHN0WZzx9Q74F=mWg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alice Ryhl <aliceryhl@google.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
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

On Wed, Mar 18, 2026 at 1:40=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> My build triggers this warning:

I reported that in the previous version -- Joel, you said you used the
workaround I mentioned, but I don't see it here.

Did you decide otherwise and retested and you couldn't reproduce it?

It is fine either way -- I am asking because if we decide to keep and
use that "fake `unsafe` block" pattern, then I should create the issue
to ask Clippy to support it.

Thanks!

Cheers,
Miguel
