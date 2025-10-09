Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C962DD5EB
	for <linux-doc@vger.kernel.org>; Thu,  9 Oct 2025 12:07:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760011671; cv=none; b=mJD29tachdckWhQs0vls/LXCCtzM2IyRgEBmwXnyikkXj3JtEwDuvXZad0b/frgCJ1/5zDQTmBUT6tyVv6ZtNBcvigfL92WdPo8y9QlpudspQtUmT4wjarz3Amhf7xfPU7UlSKTqpIHjHi6mnUPlQXfLU5HsGjmoT/HnfFtRm4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760011671; c=relaxed/simple;
	bh=+p3lQzk+If+FfstGkjdjKHCQavXIY1wiQDGCM90CDQo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQNfQH69YqkO/o5hD14+9TXOLtfMwjglMTrGBEJNeCVHFEnyzTWgqik+A/X8CEiulz948Le0tgrDQ+Y9ElCl9pz6UQWvlPhx/NbbLTjr2jnHKwmg8Luw2ERGW+/+Wd1ZMpb9Xwff+W8hio51z6R8HHfD0k3v4/hqfOVFgqjoMYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ASnf2qxi; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ASnf2qxi"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-26d0fbe238bso5853925ad.3
        for <linux-doc@vger.kernel.org>; Thu, 09 Oct 2025 05:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760011668; x=1760616468; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+p3lQzk+If+FfstGkjdjKHCQavXIY1wiQDGCM90CDQo=;
        b=ASnf2qxiZprtOG/sg3kmX5P98qy3e8qUf6RIjvbEPiHly8MQx1YktSRmlaPlFQHTIx
         tkkpZ7hbEsyhTQv4vFT6oHXV4qyxdTTbG2NDmpZbVKa5uv9mqZYCJejduRI3QG3TseMX
         Qm07zbwOHUT14hrDko9mzUmSkLJEtu9a+8Rj09/YKAerhFNMby0vOmFlLVU2HuutJXP8
         ExVgEn6NURLMPamEiRNcl7A8F1OPu1yeputBi20UmDRrkVPG7JxBnNY9h6b0riPi2E65
         RgAnTSqbpjLxuT3DnmhDBRbdpoM7ktBGv/VudT50zYMNtGvT+hQj8fDAxqfjYuCjRKXt
         Q0Bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760011668; x=1760616468;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+p3lQzk+If+FfstGkjdjKHCQavXIY1wiQDGCM90CDQo=;
        b=RqDZnxva79zIJHWukRX7lTS2GRskfxj+bvZKio4ocpzxNm9s8N1XAgb0U+8TB/aQER
         ruBxtf884j1lRgmscLMM6ySk9V9BUE0SB4+JKC9+7sfw/o37cYz2VKWiGZnmZDeE69rL
         PMUClzX5UK64uOl01Y7tv6eh2417zuqdkdQ+xXmOt9FLV8pPJyQC/xi8gxFyHTAZIrbw
         bdmHuJCGaznU2jkYlgJ5m2g5wHiOhvV0i0uKQ+2kysr+tJtJPB1ErhtCwCQhySh99MlG
         3MxfZ7JtllBT47Sflp5ZP6b6B50NlRjrF8Ej3xjNwzgA0NyoJhoN5SxPX0f2Ag+It+S5
         0goA==
X-Forwarded-Encrypted: i=1; AJvYcCVlaAVdgyOY1x0M5dmTXuJli8gvg0DTYEVUqgYmyUifxKps4EWEtwJFYL7UWSq66q1HpGWXXE0/2eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyIS0Eklv5I++rvq6EGm7BqHFq2N5VDMYa+zQfGx3ZGTVYfz7LD
	lYvwvInUN+ZO/NGoG/c3o+zCsfzLvsbzcZ89izdDZZcF685LKZleVyaSxRXd+ocq4DlfhLWVEzI
	NxVTB4Oj9pXsm+57nQ5Cz2Ewz8qq+zhZt6Qi7JNkJ
X-Gm-Gg: ASbGncukIsS5u4HrOEZepbsTNCxmbdVG5V/Pwsle8gv+HGupazVtb9+K1nnNUgkRipk
	UZ8VVm1cDZjFFknSsNNd40tKbPIpJ3MDvxLxq/wyeCdN4G4XbCqtiuDYPp9sfQvCvhf75Wo43D5
	uRfGrD7tlHhpB2PZTav/bx+LP+kGak/GiUTWmHz9tLH2YpI/wAEdIAWqsil4/Doal+0C6mUeqCW
	+l+SfV8yzFuSwLj3sl/5bk0tEn2b28upImladzIlYab75wu8v+P+9jq8+KQOWB+92Jm
X-Google-Smtp-Source: AGHT+IGK2999Kxnf1WRLkrVBgJlG2sfTe8NQQmLvAYHDshQ3OJDYVTnqzxr7Hq0u+SA2CL8Dip3ynt4DcSFfDVGoOE8=
X-Received: by 2002:a17:903:2350:b0:27e:ef96:c153 with SMTP id
 d9443c01a7336-29027379a5cmr98765325ad.19.1760011667351; Thu, 09 Oct 2025
 05:07:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250315025852.it.568-kees@kernel.org> <20250315031550.473587-2-kees@kernel.org>
 <aOR15Xb6DfolYM0z@casper.infradead.org> <202510071001.11497F6708@keescook>
 <e019c59a-ba8b-ec04-dc5b-923cf9dd9d9c@gentwo.org> <CANpmjNMsSGY+QEn=GV8S2sXuuQsioikPR+OhGa3+6EoTqYPkHQ@mail.gmail.com>
 <202510072114.52B93ED736@keescook> <b17ab23a-b0fb-4fab-afa9-41dfce65675a@oracle.com>
In-Reply-To: <b17ab23a-b0fb-4fab-afa9-41dfce65675a@oracle.com>
From: Marco Elver <elver@google.com>
Date: Thu, 9 Oct 2025 14:07:09 +0200
X-Gm-Features: AS18NWBVVE-SSQe4ScCSB1Ze0NxTS0A8p2TAsqA4RTj9KK9B9ZbDa15oefynRbc
Message-ID: <CANpmjNN3UH9vL6x4P29MjSg5L7p3aBScGv5tY9ex7N-xYmqrPw@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] slab: Introduce kmalloc_obj() and family
To: Vegard Nossum <vegard.nossum@oracle.com>
Cc: Kees Cook <kees@kernel.org>, "Christoph Lameter (Ampere)" <cl@gentwo.org>, Matthew Wilcox <willy@infradead.org>, 
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

On Wed, 8 Oct 2025 at 09:49, Vegard Nossum <vegard.nossum@oracle.com> wrote:
>
>
> On 08/10/2025 06:20, Kees Cook wrote:
> > On Tue, Oct 07, 2025 at 08:18:28PM +0200, Marco Elver wrote:
> >> On Tue, 7 Oct 2025 at 19:47, Christoph Lameter (Ampere) <cl@gentwo.org> wrote:
> >>> On Tue, 7 Oct 2025, Kees Cook wrote:
> >>> iOS did go the path of creating basically one slab cache for each
> >>> "type" of kmalloc for security reasons.
> >>>
> >>> See https://security.apple.com/blog/towards-the-next-generation-of-xnu-memory-safety/
> >
> >> We can get something similar to that with:
> >> https://lore.kernel.org/all/20250825154505.1558444-1-elver@google.com/
> >> Pending compiler support which is going to become available in a few
> >> months (probably).
> >> That version used the existing RANDOM_KMALLOC_CACHES choice of 16 slab
> >> caches, but there's no fundamental limitation to go higher.
> >
> > Right -- having compiler support for dealing with types at compile time
> > means we can create the slab caches statically (instead of any particular
> > fixed number, even the 16 from RANDOM_KMALLOC_CACHES).
>
> Maybe I'm missing the point here, but I think we can already do per-
> callsite static caches without specific new compiler support:

What we want is not per-callsite but per-type caches, possibly with
some smarter cache organization based on the properties of that type
(does type contain/is pointer), where the latter is required if we
cannot have as many caches as there are types. Per-callsite caches
could be stronger than per-type caches (with the exception where a
single callsite can allocate multiple types), but neither per-callsite
and full per-type caches are likely feasible due to performance
reasons. So we need some scheme that allows bounding the number of
caches, and letting the compiler help us out with type introspection
is probably the most reasonable approach.
