Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0664A3148D9
	for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 19:16:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773342976; cv=pass; b=M5/eziRhKAn7TttnTc1K/y0Z7V8Dx/kQG3SS0FjHnT2mzpldsYmhw0Uk8rGgUebINq0PTSxvIYx93TbPzvNFdfwl8zit28N4HVKqFou707I79l+uhUhZj9JMRzRs0RRdmPITl2+sfPG+iMrtP5EaSHxgcKFSPF20/3uOEqQYQFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773342976; c=relaxed/simple;
	bh=vJ49uuB8mdFiJb29JSb7GIkPU0l6yrugoKSfMVQPGJE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LnpJVgn30JHEE7i8vVlp+eIfrRLJAr4m44D0CRFd8ZFjGG5CBuMMD5Wt8A2yLteJcxobPcq8ZPc7i5lryvPSJwdfXDk8GrpiH9H3Tt3WyjzEKcGDOUBh2x0CFzgrqO7COYH4uD4m6LAhhqcsqv5H0pUXqAgR+IQvO4qWMZlB5AM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FU7iwzPG; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FU7iwzPG"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-12734af2cdcso83834c88.0
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 12:16:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773342973; cv=none;
        d=google.com; s=arc-20240605;
        b=i8QumtG+cYippHcwzeMrLiEnfnrufOD39GQDU4vjjH3pzK0B2Q3XSHiwtOi0d9VCZR
         7Hrn+2r30yQ+qTr5+LqJ2MKljS96+Gw2rkUpN9TTO4FE5XTD2NNYisZC0K8HjmT38L9r
         mSmBJumkvkmzpcejh79G0VLeXt58FnJ7HDUQ1caV5h0ADlRgeIYtRmtnMLILsZinrJMH
         Bys0edUT1yjsBgUXQJzld3GAyvdLOIuQg+9Hg+msSQoIADTVV9PvtnwSsQjgSD44sFE3
         oGYwirTJQhKCQeaTCNUidh4rPPQaCeo/qkvfrJDTklYj+7P0qSOElw3G5w8QIfNn5eCq
         y78A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        fh=H7DcuxiyU3laHwMNxTK+T0z47NmIa96MZNy1wiF9SyU=;
        b=E2TWS6sOGilNYm9PFiWOquPr2xm7uhRHJJaf4YNd5slqrpfjF9SbCMPbQUPROboZLq
         iz94a/cvigWVtPNhwtrrDnnn0PokIwLv6mqFCBsPyKMyo4Hx62N5gSNF0QcbwWBN06P5
         257alYmrA5SIc/K5/FJ6TVD0n9PE/9c5tC/Kwuh2vTLnwH4RstAQFPqfs6o1kT0/s5c+
         RByHJcREk+9ODeCtxcnBXlJqvVnive0Ax+4v1ayR3UDzJDTVYlyaDw6SVGrFZFtPtu1J
         arbFbuLSpBzVbaRRt39N+Faag94HpOzYW2D4Mr3GNMmI04iULEgN6+I049QVBEUeiajx
         nYXQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773342973; x=1773947773; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        b=FU7iwzPGYPyu9TatfgBruyqZEiZA017XxvOIi6d/Ic9lbcdIrWNMsivMRYl62Bk03M
         CqUvkZaS2Zp9net2lvIhL7d53139F5L4AduvPYr+LpGvXNaZOCTawLGFXBhy511Gktij
         o7Ptt0oQs2AV6oMTmUdCLylZkO4xDO5x3zCCbTktgY6882k+CCukgV+KyFiDvvePKIwR
         5yh+tVDvMYWQqahp1wCAwYIzdbyaic3U6N2du/uBBkfBGvwaF9mva/+zIgnHHeUz31op
         Snd1sPjT39dbkrf+6ucXc8JY/WuO3Ix3bH7ebjq9Kww17IVAuu3LWoxAbGg0a9r1VQsD
         Lr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773342973; x=1773947773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=2hzSysAOGotLHY/Gk0vtKsQ07bdjUjpPdIHGXWzs09g=;
        b=OhsOD2WLtAhbFRC/R+IoBjsisEP/dxs2eJpJ4H1XlfHx0Lwe9oDB4Gc42Mlp1vj71F
         2RMX3NhWtMQrq31AkzBZllytPTLyQwk9hKWGLzxhL42kWw+y6xWfK/ZuU17vgH053HVe
         T2rRIfpPwT52CAke9rultG2iyVnA0dttdgpKhx8q3Q2b4+jymT5ylUpz8/PZ4DAFkqWu
         t8VNwePB+WFGF1FZduLlbo/XHqydkLmiRIoPt786eb4eAzi/g1HNTd3Iq0+mSazkM4gm
         taC8xy5+ve574mJj/6P/oZigTG8IAyGP6UYc4uopNz4p0HspedLLCp+AWVxOtDrPGT2R
         Cj/g==
X-Forwarded-Encrypted: i=1; AJvYcCXrZoUrmVyoqig/g84aBjYsK0+xzfQbHOPYlBzzk0xSVvCbOqgW6IlQBhxJnJFQCp9sNsgqCG1q0XA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1+pACbAqynBarXVizslZBLjTuk/yaFOFSmg7S1BmmnZE0EdYi
	xIAALSmHiaWkofvS2+WcpkN8hmTtW/zVbhWJUhbjfpwsF6ZYzNghOpn0y7/VWeLt2ctk/MpHSh3
	bGGFi4g5buvs5MX2TggVqv5hmUt6uVbw=
X-Gm-Gg: ATEYQzyTgHX/hiHbYjcf54pskONcKzdOFJW/elqOuUyccMTp4fER275XGVFanCq4ZKm
	BLkqTGrvYFWdPug/TqI4F6daBOXnzU7ADS+oQurpG+8d6PRAsi0UJnm+zeTUgIZziKIZjCXT1J1
	F+tCEVx7WXdvZX3cdVdIJc3If3MFL/hfvQRxzY0PDYC/AN+d1yD34f7Gl4+50autls9xx5ZSGfe
	qe5AZhAGBraykpPgukdIONqD+mnM6dxw8jjmRFc7W1/oQLFhY3gUDti5jCVBmBx8cdcpQ8QY4vC
	Fwd7WcqLmeNXD7V/mDSNRoiFFrLvID9JEKWhi0kuFnEAHGcKTohSizdxwzLqG9pib4Vi/nVz4o2
	0glXGcNCa3U8TUp2qVXiEjKg=
X-Received: by 2002:a05:7300:fd03:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2bea5744a60mr186533eec.7.1773342973060; Thu, 12 Mar 2026
 12:16:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260306203648.1136554-1-joelagnelf@nvidia.com> <20260306203648.1136554-2-joelagnelf@nvidia.com>
In-Reply-To: <20260306203648.1136554-2-joelagnelf@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 12 Mar 2026 20:16:00 +0100
X-Gm-Features: AaiRm537cVQtFBzSwOEaMgXdjzYeE0uMIzdX3f2cfwXX8kFS15LK67mGvYzfQo0
Message-ID: <CANiq72m2Eo1UAuwMC0LhiD4+yqKixRm=+oHtEnpwY-VbNdR+fw@mail.gmail.com>
Subject: Re: [PATCH v12 1/1] rust: interop: Add list module for C linked list interface
To: Joel Fernandes <joelagnelf@nvidia.com>
Cc: linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
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
	nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, amd-gfx@lists.freedesktop.org, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 6, 2026 at 9:37=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia.co=
m> wrote:
>
> Acked-by: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>

Acked-by: Miguel Ojeda <ojeda@kernel.org>

> +//! # // SAFETY: head and all the items are test objects allocated in th=
is scope.

`head`

> +//! // Rust wrapper for the C struct.

Empty newline comment between these:

  //! //

Actually, should this be `//! ///`?

> +//! // The list item struct in this example is defined in C code as:
> +//! //   struct SampleItemC {
> +//! //       int value;
> +//! //       struct list_head link;
> +//! //   };
> +//! //

Let's try to use the usual style, i.e. no empty newline at the end of
docs for an item.

And the example should be in a proper code block with a C tag, so all
together something like:

    //! /// Rust wrapper for the C struct.
    //! ///
    //! /// The list item struct in this example is defined in C code as:
    //! ///
    //! /// ```c
    //! /// struct SampleItemC {
    //! ///     int value;
    //! ///     struct list_head link;
    //! /// };
    //! /// ```

> +//!         // SAFETY: [`Item`] has same layout as [`SampleItemC`].

No need for intra-doc links in comments (for now at least).

> +//! // Create typed [`CList`] from sentinel head.

Empty newline comment.

> +//! // SAFETY: head is valid and initialized, items are `SampleItemC` wi=
th

`head`

However, this is giving me a Clippy issue (please see the other email).

> +///   `next`/`prev` pointers are valid and non-NULL.

We started using `NULL` recently as a convention for the null pointer.

> +        // - [`CListHead`] has same layout as `list_head`.

Intra-doc link not needed.

> +        // - `ptr` is valid and unmodified for 'a per caller guarantees.

`'a`

> +        // SAFETY: self.as_raw() is valid per type invariants.

`self.as_raw()`

> +/// perform conversion of returned [`CListHead`] to an item (using `cont=
ainer_of` macro or similar).

Intra-doc link to `container_of`?

> +        // - [`CList`] has same layout as [`CListHead`] due to repr(tran=
sparent).

Intra-doc link not needed.

> +        // Convert to item using OFFSET.

`OFFSET`

Newline comment after this one.

> +/// Create a C doubly-circular linked list interface `CList` from a raw =
`list_head` pointer.

[`CList`]

> +///   pointing to a list that is not concurrently modified for the lifet=
ime of the `CList`.

[`CList`]

> +/// Refer to the examples in this module's documentation.

Perhaps we could have an intra-doc link here to the module.

> +        // Compile-time check that field path is a list_head.

`list_head`

Cheers,
Miguel
