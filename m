Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D8EC3BFE58
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 10:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773831581; cv=pass; b=RrrWUELxkSuNqQ/swoQg+2gDE2rZpRXwdAkCfTMnZTIszf+8/GS5dhugPoY8s1+4rNC8Fwzl1dxICoJyTUdPpeeNc+Z/XWMPDFcLFMt/9De4XYBYFwTX9HJ9SlYJnHiPbq5uz4dqoSy4HuUfsxW+rMH1oHCNKkVQo/zFdKC4+04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773831581; c=relaxed/simple;
	bh=Pgoh1PKkU8EkNum5z9YJaIpEiyCNGWxAB1mlPafIbAY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jzyytJ48X0Kk7GHJnZeDpueFZWqXKSnXKUx08BkZtoAt/9iVd6OGaFxEL6hBDlnvzYQtw2KpS130FDDy4xgbRKG/D/BUTNnDlcgmDpA0gWxj7qZGhOxrPB0lkhf7rYhf0DUN1fCYKHtRTO7T3lnkodWdMGQMJNPJugB68YDw5yk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JEdT/JNG; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JEdT/JNG"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-43a03cb1df9so6702624f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 03:59:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773831573; cv=none;
        d=google.com; s=arc-20240605;
        b=CAr+3tfjvTK0lEaxbb0jkro5WcX1qs23RnPGu3DRXyfkd4tA18I0oZ69oTDyY9ZPSt
         J1IvpjmpG4SZtEMA5iJ+BMawEv+HcxbUQsQUd+zwhy7ipf9nUYyugSzdnSwomKYcefdz
         TpTmPXff9r5agZwbTGA6ix3k2wwqUHE7vXSucaiJFLXBxXVPM2qF5QDS7PpbIpQ3LPNK
         y1uxLIBB+c2aK6//nUz/QGj0PHEtTkiV2++8IDbggKjk2IX8O8ebnFnmLZjqDGvKUhtE
         5eBM51Tde7MPEdLcIV5F5KiaIKjKqlkjDZfokvFRGguGorTMzyv90HX3ac6xBNl01/9Z
         lXlg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=S/1Satukh6eOX2Q2yp9irpav0rskLC7MIDb5UTQcoh4=;
        fh=/OVc3C67EgTaIjjH07H/NLprPJZBKvNHA2pj+Y0oEXo=;
        b=M4B+a/zCQiFbSsuHwJO3jN5DSDHt2gUjkhWe2i6HNROA4F761Vse+U7RiFXz6Aabv9
         gddGB1F0XTqEyLi1rGLb9tI3CaDZTtxSSrYne55xj3lphiwnB1kTH8N1LqxisTLnrB+u
         d3fh4YN0ddkqiF4veHJvhidETkf/d4Mm3Hje9B9nkEUtembrXwVU5yc9MpkDLYXxX8Tq
         /XA7P0CkRSiPWfxXVAZyi0igiPtWLQjRoEOlSQQ+7mNKmu60NeHmNcbxSfiMS7b9EICK
         CHPJ0w0svTht/KAsQwydlnDzV0kfcAYjkiCBpBqKOTuCx61wX5UDDzco9GJGFcfXLpsb
         6c/w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773831573; x=1774436373; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S/1Satukh6eOX2Q2yp9irpav0rskLC7MIDb5UTQcoh4=;
        b=JEdT/JNGEUJVFgKNl4stdFsMaonzwem7OZEJcq7ozT6Dxzvoir14qgUs05Jmk/jHFS
         jJcLf9UaOdLOcQZLiEFSZ0zCtXvHlNAXWIJLhnorMqOcrl/Vg6wOcW1BQrjHtMKLBcQz
         68cql43rzoPp1kYLuEqYQrKUNeC7x7O3WqFrXy2bb1yJBI3X6S2JQFV5qeGfvxWtHmDa
         u4v86Skvq8EwgVgzEBD80nIELKRW1LJqhkl8yhftyzK/cO1KHii53b4l7giD1zh7Ua5Q
         aP3drDjTrt5Nh9UvJF6v3m2InTz+ZbkP5rHr7/eIK69gNMGbwqiD7LjSCi+lJ82AlgEv
         3BQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773831573; x=1774436373;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=S/1Satukh6eOX2Q2yp9irpav0rskLC7MIDb5UTQcoh4=;
        b=Iz2oyy4dglNhMDZb6jWxABCJf2msCHjmx9CqbfCvsVGQFpJzburG6G6TR6GFYly1dW
         KrjrctJsLwqFg6kIHvOpo0Nz05rk4K3A2aHWuXD6z53ZvXSotNiDwSs4gKpRE4/8ZIAQ
         BpYU9mNqb72hEEL/DDCN4Q0qL7+om3EupvS66JkE9sPQiReWoOXk6luhU81eT7XhrzKQ
         ZflkWeHRbpC7RE4IgwOCiWkydMruEpHNepsxyta+1vGefiPbPMK843bxPcL2v4OA03mJ
         Y70v4NHqjZqP2l7ncr9MLcUAIMhhyztrvs7qSr2oWf/xhf0eqdXSWCYfOwj02h6/ulip
         7UAA==
X-Forwarded-Encrypted: i=1; AJvYcCWzUO/9B1Jkf8cCija6DIKtuFThr9kTHjoRtAMH/720BDHptTwV7Lc3JGrEFpPS517ZYibyOsVRJM0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc7GG5baOiNT2q996pKWdboxJQMsC5iSb7GBANXKYmwCu7GGp3
	VGxXl+gxmvRKBMOWXFfOmt07ggDIzgI0wNziuu3K95m2vFSyR3K8jcgaHqHOFk9cBzOdGZ4PEQ+
	iPPS7SBGPo649rfH9dQiSAYRU4G7N9+68FSn3wioy
X-Gm-Gg: ATEYQzz3C2KiZ+GnoRP8cOlgErzymenFQYsQGMgBInZXirqESYEz5Gqg3slOQqdkS4g
	KIzkE0wkbEigXODwmZ8MoXz3oF9dK7Tws4JOgzuY/sDY2YMqJ5hQL2wBm4Yt6Q4YwW5HwIHTfnF
	UQBT74UCLlX53VfAM+B2+A5VsoNiEnBnsVbuVGOp+LC0iWUz0IYoO3EwNu7L0lYp0MVHOqZzecR
	lV0ahta0f1zwgKwYqxrHIbeJXa5PK3TmhISvbI5z/eZuo9p/gj0+JPTfVpoms625DlkymI3CM9M
	kr/zGtDNuK+zeTLby0j0I713MiE+Dc4iz9IPGIuO1AjCm/rHDBc98PRLD8fz7GY87C5EVw==
X-Received: by 2002:a05:6000:2dc6:b0:439:c62a:6dc2 with SMTP id
 ffacd0b85a97d-43b527c8385mr4835579f8f.41.1773831572498; Wed, 18 Mar 2026
 03:59:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
In-Reply-To: <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Mar 2026 11:59:20 +0100
X-Gm-Features: AaiRm53Ixe1xgNfLSphN46y2ra7z4xTRu79njkh2iKHrEPi4sPbqBJ9Zi7PRuxY
Message-ID: <CAH5fLgjUMaC5v3SERZLosdD1ajU-fvKSgNq6OgbBBcoTS21-Sg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Koen Koning <koen.koning@linux.intel.com>, 
	Nikola Djukic <ndjukic@nvidia.com>, Philipp Stanner <phasta@kernel.org>, 
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
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	amd-gfx@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, 
	intel-xe@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 11:53=E2=80=AFAM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>
> On Wed Mar 18, 2026 at 5:59 PM JST, Alice Ryhl wrote:
> > On Tue, Mar 17, 2026 at 04:18:46PM -0400, Joel Fernandes wrote:
> >>
> >>
> >> On 3/17/2026 4:17 PM, Joel Fernandes wrote:
> >> > Add a new module `kernel::interop::list` for working with C's doubly
> >> > circular linked lists. Provide low-level iteration over list nodes.
> >> >
> >> > Typed iteration over actual items is provided with a `clist_create`
> >> > macro to assist in creation of the `CList` type.
> >> >
> >> > Cc: Nikola Djukic <ndjukic@nvidia.com>
> >> > Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> >> > Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> >> > Acked-by: Alexandre Courbot <acourbot@nvidia.com>
> >> > Acked-by: Gary Guo <gary@garyguo.net>
> >> > Acked-by: Miguel Ojeda <ojeda@kernel.org>
> >> > Signed-off-by: Joel Fernandes <joelagnelf@nvidia.com>
> >> > ---
> >> >  MAINTAINERS                 |   8 +
> >> >  rust/helpers/helpers.c      |   1 +
> >> >  rust/helpers/list.c         |  17 ++
> >> >  rust/kernel/interop.rs      |   9 +
> >> >  rust/kernel/interop/list.rs | 342 +++++++++++++++++++++++++++++++++=
+++
> >> >  rust/kernel/lib.rs          |   2 +
> >> >  6 files changed, 379 insertions(+)
> >> >  create mode 100644 rust/helpers/list.c
> >> >  create mode 100644 rust/kernel/interop.rs
> >> >  create mode 100644 rust/kernel/interop/list.rs
> >> >
> >> > diff --git a/MAINTAINERS b/MAINTAINERS
> >> > index 4bd6b538a51f..e847099efcc2 100644
> >> > --- a/MAINTAINERS
> >> > +++ b/MAINTAINERS
> >> > @@ -23251,6 +23251,14 @@ T:        git https://github.com/Rust-for-L=
inux/linux.git alloc-next
> >> >  F:        rust/kernel/alloc.rs
> >> >  F:        rust/kernel/alloc/
> >> >
> >> > +RUST [INTEROP]
> >> > +M:        Joel Fernandes <joelagnelf@nvidia.com>
> >> > +M:        Alexandre Courbot <acourbot@nvidia.com>
> >> > +L:        rust-for-linux@vger.kernel.org
> >> > +S:        Maintained
> >> > +T:        git https://github.com/Rust-for-Linux/linux.git interop-n=
ext
> >> > +F:        rust/kernel/interop/
> >>
> >> Sorry, I forgot to add an additional F: for the rust/kernel/interop.rs=
 file.
> >> Danilo/Miguel, do you mind adding this when applying?
> >
> > I think you should consider a mod.rs file to avoid this. It's tiny, and
> > just re-exports submodules, so I don't think the "mod.rs name in file
> > view" concern is that big, and IMO having files related to interop/
> > inside the directory is much better than having them outside.
>
> Ah, so there is a rationale for using a `mod.rs` file after all. What
> are the project-wide guidelines re: `foo.rs` vs `foo/mod.rs`?

I'm not sure we have discussed it in detail yet. Both are used in-tree.

Alice
