Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 407AB189BB0
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 11:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759834924; cv=none; b=ElinJxV0c5iQ4OUALnMfq1L+67tjPDjjMouIIkpFBuuVX1AcuYHn7l0xYHKMYSiO2pdQxW6isDzXdDsH35fb4g3a8Q0EX9+wAZUVdRIpl2ei8i8k8+T2M+NbwzY5UeRaO5eywWpAtRKAUVKUyMQXE/u8BD51xnWYWaBwrcptDRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759834924; c=relaxed/simple;
	bh=PGrje0/KPcBzP7FBajz2RGg43sKePjZezJXaVWwAgdU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=PWzSZtkAvSf9AVghlaRcXU0XinnaeE6nWTkQRoX+Rfsk2fbbWSQ24jtbSnO2zlJoxS42EoRfYZHGj2k+kDqPNrhEq4d+SMfsb71P4PRlPAJwzbKluvdmGw63nn92reI51WHSm20kCjP/AbappeCpghZGyiGi2hXhnwiTXt5ppyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ffGqtqMt; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ffGqtqMt"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-46e38957979so22745725e9.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 04:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759834921; x=1760439721; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y9cBFNjFEfAJOD01Katg1TkGcbRmePh4iGouqwbxQ/M=;
        b=ffGqtqMtkkqTY/mjSBuOyWbJ0K15UdZy2qqdxp8i3pY4SPJlwZqJ//fyHsVbVClUPJ
         lHp/+fZN1ivPlyUYPQ1/r7/Kstudm8mPtkxeyfaeJJ0aSekqCGSwRp7qus4D+W7Qa3EX
         XK2/k8nQ5QBXkKYPWZDbbn4Fn6eoyXVAW2nucZq5kBXFMCZ1/aygEQle/OeU5RWn4CgN
         5dPSoTDxNT3XDfOSDW9pUCSMLX74hGU2klZUd+Spyt5qTqtQmDokgNcW/QceTgirme7K
         bOvjex9kKGujJgbikEGnuIERXEuSg6p6HyY5iXaVfzcE4nEhZ60S8W8vFoIaY/ZsUnre
         SRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759834921; x=1760439721;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Y9cBFNjFEfAJOD01Katg1TkGcbRmePh4iGouqwbxQ/M=;
        b=CAKy7qZZI+u9I4+Mp2+/WZfiJx/buFELF8o+R38nmghfTYVIYAjXZWf5llYOxtKHX9
         MeAI4qbODaGtJ98XWVfjDq85bs6fa21IQd1vlCgwcND2piKJktZG9eiU9p4PGndvdvr4
         LxhBzY/Di2j5KVhWAC4xGG6mA25WfQMYHXG6H7K0DNrvw//XMs8A/HrCK54Fo8eo+l58
         c2dWyMF5bYtNgjjCfC5RvCZQoHLqVUG7GWxJ3ZNtnJMi7sxp1fOVwAblzdN94B6P8Q8i
         NiIe1lmE30CEI6uRc0FAkcVq3ARHCj0jAuQCF9BnkOAKPPQF+9ulrI8ue0COn55yEFSE
         rGDA==
X-Forwarded-Encrypted: i=1; AJvYcCVYHvn8oE34guH2qHbyJFDnYuEebdYJy/oZTONSVm9TghfUQikOQxEtCt+1MPwEXPHJMZMakfihQtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0d/8ahvI6vru4qdr5GONLz8t7FLSpGErAP3Yq6uGhNruUuK1v
	pJnD9RxyKnmAgRUVCAo/s0lodFYaB48CMLFtvG+QCkVQ+EYrmEVKXy4XDIt28PE2NfqDDho4l6S
	tuUbiwhRh3gXR2xSO0w==
X-Google-Smtp-Source: AGHT+IGqz3ZqJgw9/rCFGmf6rNjZBgL7PkKdsRmGaumcB6YPyLXFLZRDLyxgYqnJue7uO1W7N4GVYLSQ3L7x1Ww=
X-Received: from wmna4.prod.google.com ([2002:a05:600c:684:b0:46d:6939:1b46])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:37c9:b0:46e:4341:7302 with SMTP id 5b1f17b1804b1-46e71155b8cmr95460085e9.34.1759834920610;
 Tue, 07 Oct 2025 04:02:00 -0700 (PDT)
Date: Tue, 7 Oct 2025 11:01:59 +0000
In-Reply-To: <20251006163024.18473-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251006163024.18473-1-work@onurozkan.dev>
Message-ID: <aOTzJyLA49xdckRr@google.com>
Subject: Re: [PATCH 0/3] rust: xarray: abstract `xa_alloc` and `xa_alloc_cyclic`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	linux-kernel@vger.kernel.org, acourbot@nvidia.com, airlied@gmail.com, 
	simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org, 
	tzimmermann@suse.de, corbet@lwn.net, lyude@redhat.com, 
	linux-doc@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 06, 2025 at 07:30:21PM +0300, Onur =C3=96zkan wrote:
> Initial version of xa_alloc and xa_alloc_cyclic abstraction
> patch series.
>=20
> Onur =C3=96zkan (3):
>   rust: xarray: abstract `xa_alloc`
>   rust: xarray: abstract `xa_alloc_cyclic`
>   remove completed task from nova-core task list
>=20
>  Documentation/gpu/nova/core/todo.rst |  8 ---
>  rust/kernel/xarray.rs                | 82 ++++++++++++++++++++++++++++
>  2 files changed, 82 insertions(+), 8 deletions(-)

We should send xarray patches to the linux-mm@kvack.org too.

Alice
