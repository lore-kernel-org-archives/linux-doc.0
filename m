Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 281192C187
	for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2026 00:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774224501; cv=pass; b=E3uecXGPoxHbhLO5xivsyfQSw5zbEmerAewjESrNjkedSEQVzrey97OUp56WE1yj4HTvlXSO6Nz1riVbZTWd0IGc61/CUXtqJO+UFISkhclcLAmlmSBaUmNzMkAHuW4t9X070yb6+3OdkqBiETJGqJSYS+AawZcsDn2TslZvf/A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774224501; c=relaxed/simple;
	bh=+To22M9XrloAsp8zyktj8aS2Z2Pum4SQehyzZWues4c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kytRTRKMvnk/V+ae6C1sPpdZLWP+oWpvdikcIYc7YpMeAspK3a6uZOyumtbTuAdSlFn56fT9gnZcG8tBGt9UXsSP83p564x7mIm6ttLDNxqGP+bbCVwoE+Ixs36UjZ7RwF9rVu3d+rXN6iArE2d5N+kbJBFp6SX/i6t71eoS/8o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QHMkk+0D; arc=pass smtp.client-ip=209.85.128.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QHMkk+0D"
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-79628fb5c05so26853577b3.2
        for <linux-doc@vger.kernel.org>; Sun, 22 Mar 2026 17:08:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774224499; cv=none;
        d=google.com; s=arc-20240605;
        b=WYkOvzeSEw2kJTXP2PgHDmlRymw8m+P1wqx/W0jm1t7mB61EQ7L5TQ068NruBegqo7
         cvRUh1R/D6Q3UUFu4/df/MFbGOkn+aluXLfbieQW0LuainOLHRqfW65kljx4xYElfELE
         wHo3yDpEazo0r5xzVa18xvaIuBkv12fJAQC+o5966Aq1c3XTci0bZ4iBC/vsWAs2j9nG
         LzhXikAokfyCKYJ8gAXuqn21/FI5TFUEgpaoUDBMaczl/wVnCCRVK3XViYGai9a6/4O9
         G8gYKffKPFNszb/zlvOduB9uhN9rHjGY+F6Wn2rBRoOQnzAw/2LYAbOyqGBgp3OsaLRY
         mTGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+To22M9XrloAsp8zyktj8aS2Z2Pum4SQehyzZWues4c=;
        fh=wXeYO90yZ7hDCcWJjoZkynmpHYfd5O9y18n18pBIcBM=;
        b=XXrDUBN0ohd9G046gBRgM7RnfhPfaVUv9qNopjwT91D0GY1JGhLN+kgiPD1/5fhXrw
         tQclUdcC51fDiBiHh944QkCkQWrbP6Q2ep8Jxfa9upbK0OUjNkJZmcAry5F3q1oaS1g5
         1glhs9vP064euI0s0kWdmmirITT3rUukOOdy/aT3SXdy6zvklp+Nxy83AbyvCLKXjqDj
         svpPbHY6xcknERWLAhgpGY094H9TPicla9HAJsDVWdPVgvE2wO3KNt7ocorGsQGE3e6K
         083CTedG0aRApvw72sKLlsNs+MErGFXFLp6BdLTj9bsoNLeOuCb3w0I0Y9LfcJ8aw7OY
         AXEg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774224499; x=1774829299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+To22M9XrloAsp8zyktj8aS2Z2Pum4SQehyzZWues4c=;
        b=QHMkk+0DtvEFkBJdEo8/vhY7E+upRvKFtFZjNpYcESVymU+JS4fnyuLXhTUibIaG2f
         Yy8eHiWBKV8KEhhDsBBfXpZsSjjpOmFTP6wLfmrMfSGgLXGQtzWOd9ksbEKGExFj7TAw
         yHVUrA+aJ7/TsuG3KMfZ4kDdGmhqhyrR0FDF6L+7CD2ySJgKmcckK7OaT4+hFDuZFKL4
         VlSLRA94IC7becUdDRn944mW5fA7DucyWuqxrgilxlZg7M9YpBAbJ+moJuiizJnZgu91
         S8y+Ly9yMuTPlK5VBKsaQzY0efYcDJ+44UVwIFIwU2vV4UqtFfZ33+kpzg0maAkPaauG
         rDrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774224499; x=1774829299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+To22M9XrloAsp8zyktj8aS2Z2Pum4SQehyzZWues4c=;
        b=BeAtrl4oru1UkfJ6doSa09NjacnSvespII8BHRDaXBZQZZW4YKw8/dJf7sZoBYG4B8
         DpcpJHgtJ+PCOKKVea3zqw/l4j5S930YLHhTd3ZbJBXOost1jTbugcrF2ckZQ/ilbkh1
         EvD5ME14CkvgKlBRCNqJvV1bc5Em7Gsnd3TeW3TO/Py6q4WuXr5C9P5tWk7EjYlubR9V
         tVpAgfPeGYsTU7wlRsafWYE8xED8KhlR4Fz6FZl65NkOu3OD7sGSZgXlaLNBSHHICVa7
         nVg6Z6iWMVhS0GzCFcgbuE00bkeC0zBjCFrkTaK4Dz7sOGYc4xptmtlgIWk9qCUB1U2/
         pmbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfSRedu0/lLctJPv/bZEEIaRXAQ5Y1wU90Cis23BhmCtT8G+N9S9kkWOFZlorHHWuaA/XQ/N21EIc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTRc9IJTYJQ6Md9Ta/id0HB8/oZcbDx/P8/H4zqnSC0c4NxLnd
	f0K0wR1moUQP6FOiHhFRyzhOy3pLUuZsvuZWf3AmdWaueM7yr6dji9co37P/7saOkPN0m8pexfI
	0LIV5nDS5yEkhGPjWaUeIGOHSwwqT4dQ=
X-Gm-Gg: ATEYQzwzVP0OMF1EEq+mxe6IsqdiD/k+JXzDvCrIbFEwsuRRZvpcWMmHquwkvcZ0rl6
	xibn4Q+Nb7g56//HoCY86vPRsgTsaOGF6M/DX+kmuLOfdpPGzH+FwBBywPjlABrWkDcsSqRY+p2
	wr/Krns93WtYir5gFpQE7hoUAJCjS3bgaRLH5AeQ4LY3N8MNoVaQkxEpzHKnI/0LIUi4HuZvew3
	q+NGe7ckPdfETNbYeERVtHnTx7INJLBs5QfchC0i86Wl6Ds5JH5rbsjJI9os/TTKNdGswW+4BAr
	p3xu+zNLE7btkIwfhk3iEn95qNx9vLGaMaTqpbMPOLfOLjLc
X-Received: by 2002:a05:690c:4424:b0:798:6f13:2419 with SMTP id
 00721157ae682-79a90bce798mr96296727b3.37.1774224499042; Sun, 22 Mar 2026
 17:08:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <abqdUBqchnVFo7Qk@google.com>
 <71b6a115-98f1-4b09-9c04-a99349f51e49@nvidia.com> <CANiq72nZKx7pw_rZK2mHHvR=TaeGvMRvg5GTHOd58X17oyxieg@mail.gmail.com>
In-Reply-To: <CANiq72nZKx7pw_rZK2mHHvR=TaeGvMRvg5GTHOd58X17oyxieg@mail.gmail.com>
From: =?UTF-8?Q?Alejandra_Gonz=C3=A1lez?= <blyxyas@gmail.com>
Date: Mon, 23 Mar 2026 01:07:43 +0100
X-Gm-Features: AQROBzBsI6copsViR8GCb5s4kn_1rinKOMbl-9Inr9UPp4mS88b9cJGUv5vqwNA
Message-ID: <CAGeanHfNwP6Zs3LSfc9eEO7_LG0kK-jO24oUd7BjxrQbndEmNw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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

On Wed, Mar 18, 2026 at 7:57=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Mar 18, 2026 at 7:31=E2=80=AFPM Joel Fernandes <joelagnelf@nvidia=
.com> wrote:
> >
> > Anyway, the fix is simple, just need to do // SAFETY*: as Miguel sugges=
ts
> > here, instead of // SAFETY:
> > https://lore.kernel.org/all/CANiq72kEnDyUpnWMZmheJytjioeiJUK_C-yQJk77dP=
id89LExw@mail.gmail.com/
>
> So, to clarify, I suggested it as a temporary thing we could do if we
> want to use that "fake `unsafe` block in macro matcher" pattern more
> and more.
>
> i.e. if we plan to use the pattern more, then I am happy to ask
> upstream if it would make sense for Clippy to recognize it (or perhaps
> it is just a false negative instead of a false positive, given
> `impl_device_context_deref`), so that we don't need a hacked safety
> tag (Cc'ing Alejandra).

The team is a bit hesitant on adding comment-specific syntax apart
from the widely used (and already on clippy) `// SAFETY` comments.

I'm pushing for some more comments specific to the Rust4Linux project,
because we already tailor some lints for specific projects (such as the
Safety Critical Rust Consortium), but adding more than new types of
comments is a bit much.

On this specific lint emission, I'll see if I can get it fixed,
because it's a false
positive.

Cheers,
Alejandra.
