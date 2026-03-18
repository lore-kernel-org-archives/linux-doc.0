Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9083D75CB
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 14:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844287; cv=pass; b=VLaO21npgsGTWZRdoHC/tEGKJ3H4crk8uFUgCppzDzvOImuANCHd6RWUFA4TorcvVoVOi50xhpzSEO9nYPBJ+ZCEv5G0z/Ijccwu4Gr/nXDh9hZ1gaww/AjWWw3oJuxYSSDyHqzleKTMGHYExToZ1rKTXi0zhQ2zNCfdew9oPj0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844287; c=relaxed/simple;
	bh=yo/HzWSmo18kRP45/efRc37F39eN0N4aihI2I0DZzEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gUWyEKjF4XMHmw9aoryhb5vueNCz/94K8L5kE4Tl0MeHyQvTWtWdXQJuv+9g4EniiQ+AGlD35nfh4nzdI/LWteeVv6l4ceI+kaZ+dKPrZssCH9Okiv7z2SlBpDagegOyjJiTNP2Kpb3j76X4ynG53RgYf78IbBnmpa7jmfuR27A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Uvg6ZO4y; arc=pass smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Uvg6ZO4y"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-439b7c2788dso4401003f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 07:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773844285; cv=none;
        d=google.com; s=arc-20240605;
        b=FAl4zB1U2bzGctGyv3Dg7PRKTbDekF7Ss2yauTUF35j2YkNrz81c1sulaYDeBMWCIk
         sHSiNxO7BC3c9TteLa3Pd0v9eXChYGVQgF50OlgaxQ6y3iGrs2i7v4+anqVSJlgwH/Dv
         FaZh+JaN2+ZdWpwIWGmGJk4HAVUxRVrCy3+wFr/BV/ANNtv6ztc8NlgMiuNDYHNFO7Na
         tiX3N0hXxP+8ZuEUNZmJQkXqLVUgRBOuJysEFIjd4LmkzKLYe/vrgH5z3Oa0TlXO/qAS
         cqLDO/PQW/kvaWjOHNJivWgXB/9qi75wq4C+IpEGlyKCQSG+ICnizn+yjyGggZgtk8Xu
         XlGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
        fh=ebJ2AO4PlSiDjWMMM/KHWkwLsCY357h6gFod2om5a9c=;
        b=gUrtJSP77mHi7ou1Bzn4K0SmfNuraOqLljMu3xjisIuELnPRpYT/VHlvSPKdM8l4pZ
         UYuB5HubDjdKlvt+0piSZPE5o9tafSmBWyvkxneuioima8Gn1ELoW8U//lFKqYHqLh7p
         EWpgHZbouDT2TB8XlXWFGZbkcGnI+W/DXdVjVgCYoK1RXyRgvSq3uv6Q1p0o12tcg+W4
         LoAyYxAhjxSSgVk9VnZ7L4P7dAhryT0ZCTmYcwQ54D7SBKJkfng0cZFMMD3MZIpjKr8E
         VnJWMZqPdEGTrdw755kRAEnPSxG5PvbLesnjMyASH7bk908RrzUqthisIJ9yzIR1xQzQ
         Lygw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773844285; x=1774449085; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
        b=Uvg6ZO4yuFbCNzqx5IgkFjE5jT0+fReRtVmbA59JONr6Xm2hBLufDuAl+HwRA3MumJ
         uN812HoVq01bIipHv2xtXa3ZZHJublyGr73DFSuYVnGafGadt8oAaJIEyXKmeZicpw6F
         4x74RW1WCz65dZX/ujm1LnMPGWHnjCrihwE3HSRHT6XrrXCfrAxRnpYT8EmQsH9cMYyh
         H1+e88ZdZwC2RuAJCbrUmoqjlwbzbmt/4ZLu5r/Ym52d7SUuYfAAjkMIZwyC+Vcmwbdv
         7dbRLq1muvFqVMPphVbH+YS57ehpRFi60j78tAgyWXBiRz8oKCVK0wgDNLzolcyzVVjF
         A1nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844285; x=1774449085;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9Oke8F3j0iNZ3cSK0OCeOVMy+GmzWDcEKfA0PeIuC3c=;
        b=UYQluWJeVZgL+sRxfMVGiJ5ZdQoXJ+uz9gok4IsSlqmSWtp871Ur8KGZm1AAamiZUP
         t5zZknPrRuCV4EielX/qeiqo8ZVYVbE+3xAQk0q/gqyAQ5sDJRiObUD2chPaZef4/ivv
         9My/CjtlAAZsAHa/MRmiKtG6phNRI/TmduAc73neWHmknhfWsfZHMgjmcJ0n7hU+x6Vd
         NN6j8HKJKjVrlCv9/EgfykewVsOYuFbakXHXYi3J2K2LFTDFExJec6AdbLwRG0SKo2AA
         4cKSFz/uAMquMwx8JLZP/j0vnzmxVSNbhwHZP0gMlmRLB9cn3TgRB3jDCh/LmBttDI7U
         dqzw==
X-Forwarded-Encrypted: i=1; AJvYcCUh55qVS26LxtqMyraxoty7uaS8WaFggbyw7gPppYM+EvrrH7L6eo3ZPm3HGegjlLIph7uBGKiKM+o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0fWwx0sLwW9Fmnk6SV6WaW+SAmKnBe44c51XdAHjQj9CnXBTj
	xhlYVoLcw2iKYAHJeOHT4oilLfh9oHJaB6HoRpiDjRUvaPl4n5oW4NbaCgqswZOA/6WiTObwDaG
	JhfnCwbUc6tU3DAD2dV5r1AIBqKjqkyyK7mY/qTjS
X-Gm-Gg: ATEYQzwYJhj/0LkfJz4iMuUOy8kitV/BjbibGhcDxFcAxQGQWuVQmfVwjPONsqo9Si7
	M6tzMX7Ot6vEDfMYhixse5FuB68wG/7RUF6sfd+Q+p9go23e7Y/0aN9KYg6SnhDW08uMjQuAdzG
	LfTehrPtselbUMgE/0qEIpLDJDEVVsHczW19DClAPYajI4RNaUVJq4Xc/IJ7NMVNn5KTijwqXSS
	PfgduHwbwrvVqFFklXVr1BteQ8Hb/gkMLs42pbnGc3+SDLEcz81VraiZiKbgMyBW8HVOpifgtVe
	GIscTW4TXmACb0TIm59s/4hrTP22aYvn2hz/Hpfz3PxgZkdLk3iP5ta0DO1azMsI55bWiw==
X-Received: by 2002:a5d:5f43:0:b0:439:ca85:8848 with SMTP id
 ffacd0b85a97d-43b527aa344mr6004289f8f.16.1773844284463; Wed, 18 Mar 2026
 07:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com> <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
In-Reply-To: <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 18 Mar 2026 15:31:12 +0100
X-Gm-Features: AaiRm51O3ZORqMPG2oSnP3bbIvsHXlypg7QXuPo86XIFyKOog2BgXzbGuVDuzJY
Message-ID: <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

On Wed, Mar 18, 2026 at 3:21=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> [*] I would have preferred a middle ground like  modules being inside
> but repeating the folder name, e.g. `.../pci/pci.rs`, but I doubt that
> will ever be supported upstream since one probably wants to support
> the other ways at the same time.

In principle this is possible using

#[path =3D "pci/pci.rs"]
pub mod pci;

Alice
