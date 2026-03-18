Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97CD23E8678
	for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 18:57:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773860244; cv=pass; b=DBNlPQQliB7S0Pp46MvKqHa5DTtTXhQHJAiZvLiX6OPlKuxGGvNhxwZodp38WdcpxhhHFfsrhgv/D1NTf8K6zcEq3e9oFQjjkciGIlokLPBv6KrGOjChwjDvIqXxcegVthHKzhlDkrkJEFUE9B3/l/W2y8QENnDIjTaXGzGriUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773860244; c=relaxed/simple;
	bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CpIItQwo+NBU501GAgyVIpzAx2Ix2z60DJBvDCvE2YIWLv0A6pcLRJPxtVXKZsIOXnEso5RjMGJpGqb2qiC14Ay1eltxC/PAv/aMX+o7hlYGoasNhB6ywYeWyXN/6PAP8SbQyZCtoyH0xtNTFA+ntWFjcJKWAmhIYg7oC/MHjl8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2A17xX8; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2A17xX8"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-128d428ba0cso29511c88.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Mar 2026 11:57:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773860243; cv=none;
        d=google.com; s=arc-20240605;
        b=ZildrihcAMWHQOmB9mcVqJ0RgV4h0BjB4MercdLLSFJDxzDFyv8EKIxyGZBPsxbaGW
         hKTuOMnDL8oOzGrdngd0cFPCmS1nTSGsGtt3lxJlKpnXTbiu8kR3l10Nbdqneqnw+0B6
         WEcy7H5yz7MaPJpRjfX+oOPpn0AZuVmRaW5YbRpQKhrufdMrN6pJfl/mL7H4gR+mixhv
         hBiMblQwXRS4VcBPg3rt2C8PESCEmpgu5xnQeQyFmI+2Ooms9g5k9RrWqArxuzQnBJ+m
         JJ0Vucddy+kL8CzRzg5ccJ5Rn7849wTdtRTCA0lH1VlAFgtBGi11unMfmBP3LAtMi+Ms
         X+3g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
        fh=9iAv3+8+d1hfoa/IPSqiorg97WR84/IHt3p+07JKW8g=;
        b=KD7f/guiiVJOmQa5W9X3eWPhipxF6quIor9X4mPBWJu84vyWX+VjOwOm4Y3T/DsSlT
         3twNPUPYzJkYwSunqxWOPWMKm8rxtVz+B+0h1c64EUCsJPx3b9nqx8QSHAOdFuiPg5my
         mfVO0u/MJUsehhcChD8eUJNUgjEVRcv9nTHWWNKR8XC13Ih94AOvOC2pN+TIdQct+kFy
         fkUuONbZsItZIprS6tXssYFQkegDapw5X1X6ubnRRr31aBq7jGAYmTrV04RfiJLup81r
         qYOc3v90HOOHcuTVGWh8GHZdzROXkPC5O0r3pWUiJM+QVPspDMvLgwoecwnTbUqDVJIc
         0g+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773860243; x=1774465043; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
        b=G2A17xX87xyMH1dzp54YJNtLJNegkpLBUxOAo72HevAParB3VTcSAk17TM7ahF/sQQ
         RlASRGT5/tLdBDwlHuKdv0RDc0YEbMaHnY+iCyjIAt1bxctLJkwznYUD06ySntITHGej
         MXTGYpVqcbz0OTnhiJtE7JycWw277IP/39FR8t33hlDa6DPWvONh2l2vPM2QwLE20bvW
         V4R01ZRc2O3VL5rBJ6jKLo+BsUOz8zrOacH969U7mZGu9vafScCwEwm+E/AODHvzD9ZL
         goCnsb8gWjW/jWA1uguNdvs+j0/11pGX1rjdOlamsxZo1D0fGnP5r9vWYEHn3qCew8KE
         UhJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773860243; x=1774465043;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VupaCI1OwER3l7ohvi40E+Y56v6gbAu+x5/VVVtmeFc=;
        b=JtQjopZqH3D8zXzF21rLrsO+wRUArHyzTw1KBgt/76T0jnLPgcHzdJnoETOLtQQ0OF
         fIMJsky4d8Oertf/ty+Nc31n+kMRWHZ4DzVVm/Iv+rku2Wpcp1S1fJsFr/e4cZZE73YN
         lLFmUt0OXHAp4haRqtp0awH2Uw38XrJE1XTVBe0kZQsTlZ6FEwAeuULqwHS4IuRGX1YS
         xma16Nn49bbOoavza4euBn8s1ptvxbBya/cxaBwqVLIkMnednVAwSxXqg/b+FBmvvYsZ
         X9gMCo2DDNGVQ2NLTeF+8063QxHRX+BApbNkSh6K529Q8eB/Y4stSqSxi5bKDI1hhYzg
         vpYw==
X-Forwarded-Encrypted: i=1; AJvYcCWHrWgIJnkrTDh2k5K2RioG538gzTF3H2JRLzNwrxbLbjUa0vmA4BMZ0PsEwuEVYBUZOvZtVkvOD4M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ/8/EkLPdK7rw/EGCANIxQMpBO4/uDu4d3yu037rlXKl+ymUQ
	CK1kUiBex11G6QkDo4psltClljpSolufumdjExw1x3w2th1BuqrgdEmwNcvAdVw4n9CtR+JxR3B
	u+rQyJUD6UfaAszMCP+LuETjra9Zh9qg=
X-Gm-Gg: ATEYQzy1QIYS4jnUdQ9tChQciR11btLe6ULkxVnsxutBo0awNMOrP/b3SfpoR6LVjaH
	NZw3rFj1f5FJDCzcsNfIp/mgXPvL+G+E5/zvxtB6k053Ajj4RzedfMYIKuYFaN6oBn3/4cZY3St
	zno+z0z28tsbg/+U8l/txD+uxaM0wiQEMjcLpVmPAKRUUE7Ji/2ncq9z1Cg2n1+6kN20J29jLK8
	q1+Ag+WQyAm/LAOUkwHXkbagz/EXwMJjD2Bnjc+dwYuf8ZF8XWIt6epj5XnhrmlYKlkCcDLHQTM
	Dqkjdr3qm/XHIzO1gjRySzf/sfZ2nQwRblgdJginu++WrkSl1MQUo5aqut4Xl5bWHJVNNBjYT9Z
	yJWW1/cKKL4js72ej7kGEEzziGiJcCKQEew==
X-Received: by 2002:a05:7301:658a:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c0e51afa4fmr1076751eec.5.1773860242532; Wed, 18 Mar 2026
 11:57:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260317201710.934932-1-joelagnelf@nvidia.com>
 <20260317201710.934932-2-joelagnelf@nvidia.com> <46986da6-8c89-475c-8561-964adaa7d034@nvidia.com>
 <abppV3e91iVzplcv@google.com> <DH5UOS96171T.Z8XSRX583Q60@nvidia.com>
 <CANiq72=bmJ_GWKowAgv+DWQ8FcWK_HePwjaVgeDmRH+gVD-z5g@mail.gmail.com>
 <CAH5fLgg-kgeBw3Py-EZmAEJhm357u5NJP6na4qJe8v3aeFW5Cg@mail.gmail.com>
 <CANiq72nad-60tOJeAfkvHTFrWXQS_wbG4JUGQNnkjm_NvhhaYw@mail.gmail.com> <DH5ZP3IUEWMD.TOOZSEUTLV85@kernel.org>
In-Reply-To: <DH5ZP3IUEWMD.TOOZSEUTLV85@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Mar 2026 19:57:08 +0100
X-Gm-Features: AaiRm53Z-cAG5mIpOPhPdv8BAXPHEZ1FbMlHxMtUEupEIZpM9NVL3ZvZ5w4-nno
Message-ID: <CANiq72ndoX123PKYr4DbJpvQaM=1YjYoYhoTq7wMoY51X7PuNw@mail.gmail.com>
Subject: Re: [PATCH v13 1/1] rust: interop: Add list module for C linked list interface
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Dave Airlie <airlied@redhat.com>, David Airlie <airlied@gmail.com>, 
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

On Wed, Mar 18, 2026 at 3:49=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> What do you mean with extra file?

Right, sorry -- I was probably overfocused on the `mod.rs` symlink for
some reason. We may have talked about generating them on the fly in
the past too, I don't recall anymore.

Let's assume "s/an extra file/extra lines" on my message... If folks
are OK writing manually them, or that we generate them on the fly,
then I am happy I can get the option I always liked! :P

We can chat about it in one of the calls.

Cheers,
Miguel
