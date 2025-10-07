Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 321E4214812
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759861147; cv=none; b=Z9C3KdoknJVkcXugXTbsvRKbme2tCgDuEKdTCdU/+qXe9tDULAJVluO7p3ockiNpcrY6QskYHWZZySDqNMMVLxNSto2t9v/JfV/EdvE0joJ0npcljbkj+jPldIjZC/L1V4IaKl04fUBxfk/WWT9/PP9cQbqTW667FeIisrG17OA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759861147; c=relaxed/simple;
	bh=1NYA5NXCfUNHGAMPIDINqsi5FPnYmleHEw4ndZr/cwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ba5d/2xyHLPpFu3Bgn3aWfpsa7uHVGiOzotpE43rwa5/MZroKNHMnS5GLLyWMSTC8u/EQ/xSWrskDW+TzGmzoFUXVRJgX8iayrvMOKRmDQ4/S5DrGFk8zWl75F7F7jE+NZxbn0DcELFChAT7gCUptQ+u3QlViCtVFPVJ83xb8cM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YplMvuy5; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YplMvuy5"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-27edcbcd158so86234215ad.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1759861145; x=1760465945; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1NYA5NXCfUNHGAMPIDINqsi5FPnYmleHEw4ndZr/cwc=;
        b=YplMvuy5kbPgDl3ljou9lJkcN9nLAcTVdVoIZT0CYuHmj57MIlNgwQJUJFqZOG8vl3
         n8/da0iAS8m9YtuI4yt92wU9/BhDVytxfU2plfmVnJI5dgxYLpwRP/7hFKyPywzqNK6M
         o4JdWuOHHslGYr1vdfGoWVMhNr+hGZ9lj0uyEcKgiOFDhdObG80DaSv6bDDvQxjVRwao
         OIp7jG5LbYKkLN3ORVa69KSYxSiJ/EzmGcjWaKjZhJkyGbOyhukjASvH/tuMhjig0gI2
         xJFsjU0ZeXzrA5tdDzi+b7TK0B9YhoroEIHAV11kuHok7087WUdpmkknz2GqwxSUB48d
         /YKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759861145; x=1760465945;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1NYA5NXCfUNHGAMPIDINqsi5FPnYmleHEw4ndZr/cwc=;
        b=kw0Ke6TJYaxg4sugH90/wwV9MXZzIIza+PDYjyqLiPuSsnOVYG7073OFcwv1Besy7+
         Xg3FlrzUjN3nyMWEbMf1UUXwM1l/hHseyqKIl+grs+VXUrVeZ+zRNW0et4Gw2DxgAqk8
         ngx5oz2gCAMqr+9tU1PPHtryqR5pGWsp1ULaCOQmLxtmfTyYAa/g6hewYc7i0E25/4MW
         ZR2WSgfUhpX6RcJRtDmli/90QflGGVW8bX0GQQtLdUOUXzTMjXm9qocfRae4blzqoIHD
         xPQpgBc5IoagYLSpX5bv1iA/vKKwcej63SgwUSRUyqsaJuAPOvuIKpYSrtpRL6r46s0P
         ACHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUnPfY9Y/HEXHrHOwYSEOoLh27axBH0BLKSjr0lFQut3Q83J8Acr1IsPJdPUbaktRJ5Ov7HzWL2zpg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+IFyWwGsoW0QSybKt3jhujaZHFXTT1IhAed6nqlmDhEJXujy+
	2Xs5yRfAwPHoEtWDqFNM1RWBsDhuF4deoBn9Mu+wjX04f2GGGlTEC7GdFdO7l8WMa2hUdTsVrIX
	Q4VMya60NQvuOOfcNwLbaeldUb69s+FfzvF0jl30Y
X-Gm-Gg: ASbGncvOH654h44Tdp+KpBkdinOjI0QF3N2klU9iQ5y6MAUawiJNtYHqdfHJFBSa/kd
	gZh72YNDghojH/KpRHoZG752faF36EfqEwW0pmn4Uhaxfe2i1jrm/U+3rGZEPY6cZ+oadLJvvOU
	R72MuQwSFhJAxip5jz3iHRoG6y5HHSPABPiWRqUlKwvaJSxKDzMpYTPfa7Mg4LKX7V28gWISESk
	bzACVN8kMS2zn8fwzuWV8h4d+sr0d6B40NIiaCAKGe+YJ2mQBocGySKPgkkAwnjKmFb4YqGfJwg
	FkA=
X-Google-Smtp-Source: AGHT+IHw6dFIKAHzPTv9mVtUGHjBlx7WlkdXf8MR1ZgGcxSTfN3zEfUpxsIIe3xlxd6CYLBEcLBlT5+Vp1Gkw1TXYKQ=
X-Received: by 2002:a17:903:2343:b0:28e:7f50:5d80 with SMTP id
 d9443c01a7336-2902721336cmr7056975ad.7.1759861145158; Tue, 07 Oct 2025
 11:19:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-2-kees@kernel.org>
 <aOR15Xb6DfolYM0z@casper.infradead.org> <202510071001.11497F6708@keescook> <e019c59a-ba8b-ec04-dc5b-923cf9dd9d9c@gentwo.org>
In-Reply-To: <e019c59a-ba8b-ec04-dc5b-923cf9dd9d9c@gentwo.org>
From: Marco Elver <elver@google.com>
Date: Tue, 7 Oct 2025 20:18:28 +0200
X-Gm-Features: AS18NWCHLWcuBl7emRjgyAd7xCJevIo8qneqm5GOzEKlmO2F3nZsj3gxx6OmYQU
Message-ID: <CANpmjNMsSGY+QEn=GV8S2sXuuQsioikPR+OhGa3+6EoTqYPkHQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: "Christoph Lameter (Ampere)" <cl@gentwo.org>
Cc: Kees Cook <kees@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev, Matteo Rizzo <matteorizzo@google.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 7 Oct 2025 at 19:47, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
>
> On Tue, 7 Oct 2025, Kees Cook wrote:
>
> > But all of that is orthogonal to just _having_ the type info available.
>
> iOS did go the path of creating basically one slab cache for each
> "type" of kmalloc for security reasons.
>
> See https://security.apple.com/blog/towards-the-next-generation-of-xnu-memory-safety/

We can get something similar to that with:
https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/
Pending compiler support which is going to become available in a few
months (probably).
That version used the existing RANDOM_KMALLOC_CACHES choice of 16 slab
caches, but there's no fundamental limitation to go higher.
Note, this mitigation is likely not as strong as we'd like to without
SLAB_VIRTUAL (or so I'm told): https://lwn.net/Articles/944647/
