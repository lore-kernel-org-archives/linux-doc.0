Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4E4717A300
	for <linux-doc@vger.kernel.org>; Sun, 13 Apr 2025 23:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744585246; cv=none; b=uHiCk5BZCsdDhkkGiYv9Vp2mFSY0quCrEVN8iiCc0TEyw2AN1+qYQbQ7nVzKJa8i/b6O63OTKGsRvwLY8K1KSOxyS1HqprPWzCpMEC+bVY3c7tchiWfv0Rz5lp/e5BXLmeRq/dVoCFEqyRAA3a7TM1TArF588NvsLTg7B+cOlhk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744585246; c=relaxed/simple;
	bh=ylMZa6Aq29j5mVRt3GE02Yo6uF53GO98O716dshVloI=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=KpJBs509+xvyBoWP8jM+JX/SkpUI5kLsy/Oq+spPjCdPrCGmzPMUMhvex9zkGlLqK0/4MnqP5zp9iA8sdllUfd1xHlol5XguV39r9XU4AAp/WtkAfVO+tWVO4ZIkj2+OEtulfuvKz1ZVQ2w3Yzzzwlp1bwEgYsZ8O6AfpjREA/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pO5gEtQa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pO5gEtQa"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2240aad70f2so307505ad.0
        for <linux-doc@vger.kernel.org>; Sun, 13 Apr 2025 16:00:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744585244; x=1745190044; darn=vger.kernel.org;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcijKGeNWU44eIj2ygDRvcCute3ez4NOIbDwZ6K3fSM=;
        b=pO5gEtQavVPk64ErECqKH8XYfFSCfOQQDokhIVyhzylBomJ4/IyL8d0kZe7BQNiitq
         jXCSOOHte6wDO16a+cxu/ePEHgeAy3nucg7w8ATZFAUcPz/WuLJGSZYjiC44e5ZQflQV
         EIRY+vRqnwwZJxuGwP75idU8vsvbM7HENLAMM4WSm5OQuFgipg5sfPFVMwT25EPx//Y9
         UvndXzx45pVLuFrA9FoZKxoRuEkHs0YlmKvP4u4Uk1KROgLnb8HvqibG+mdZzVtNa2x4
         Xiwo60jkiXUQKSZKKZXYRjitCOcZCd9soKdvCbv/gyDGiER4tF9ZAWes0y8S4+w6upOa
         pPkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744585244; x=1745190044;
        h=mime-version:references:message-id:in-reply-to:subject:cc:to:from
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZcijKGeNWU44eIj2ygDRvcCute3ez4NOIbDwZ6K3fSM=;
        b=eMV7ZTyUsDBesB/VAFWTPhlHeRQM3uqeA7yx9IVyIqWZZpS2eDM+AC1IujmftychrV
         ICo5L4RYmoO12M6/6GEI4U7lcB9mbu0grbpWWAd78QR4eWZUM1JjYDLalo4gh7VEvGUJ
         cwvQ8DR2/XNQPIzKqteXF4ZZTZ2PADa8G2MHoSI/s8I8ZnKD0DVTry5wuNAzerKT1Boh
         zySM0I3mXi1OH72Ipf3WveRhDSKAJUrtRiYy1vKbz/4t8Iur3l+kr9yKC/Gw+wQH6DL0
         uXUu9kymH5kYy4a7FhILMI5EOfkvooeDRqHueheUjOHnhOzX00K/j/wfCLLMVWLHTGLW
         fhSg==
X-Forwarded-Encrypted: i=1; AJvYcCUDY6bdJBOhNg1JufSX3hNkHl2cpKX9W4LLbn4ilmX1swnsQSdJLsXGjlMNiLtL4VAhdTwRvNYF7LI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyiZ3IAQu2QTBmQOayEjXsoHs69wIl8bsnEaTjP1noI5r8ctWSV
	RtbItA30oOt9XpqkNcCQzPiNqZ/lrhZYZQzxf6So83E+6sse6+m8VD9C60a+gA==
X-Gm-Gg: ASbGncvZ/sYsZL0WyAcTYqm6FRP7msgllVpVe7JGgB4Wd5wZEbDNGluS412HawzSkLa
	kCxMa90qTUrzgTo0xiFvmQ1k8K9P8tXvKA+l5Uc2ReGtA7WyRy663E2CV6MCkSomAPzkvmKpo/V
	ErSblFsIOqh5oET2K34bSsLhhmeJWDfFLZ3sa+IE+dRfjWP1VvpKeZMl/eqYfIdXnVSoJtEUbUs
	RDgsrxxTh7h5B/ENVhjqwJfy2Y51r77G3cPn64xVmfoD0PjWPxfu6XrdPCaJyze/e2D/PCr/IyL
	m7xpe72x+Wq8kQ7Np5XivP/5/qHxXO7tedXRWLvGJ9VnCEA40mO0XoWDLDsl1QXK0Hn2QzkxT25
	WxnDIivop8lfdjilodPxibPjymKjJzIQgpQ8=
X-Google-Smtp-Source: AGHT+IFx60v074gs4AMnQgafHZpx5rGmP/N6w9NBkIiYBjItVWW/1kCo6dcv+AZwAtWyGk9dPOEPQw==
X-Received: by 2002:a17:903:32c9:b0:223:f479:3860 with SMTP id d9443c01a7336-22bf453906cmr2947865ad.18.1744585243089;
        Sun, 13 Apr 2025 16:00:43 -0700 (PDT)
Received: from [2a00:79e0:2eb0:8:f229:adb7:460c:4b5e] ([2a00:79e0:2eb0:8:f229:adb7:460c:4b5e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b02a12c8ac4sm8257942a12.46.2025.04.13.16.00.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Apr 2025 16:00:42 -0700 (PDT)
Date: Sun, 13 Apr 2025 16:00:41 -0700 (PDT)
From: David Rientjes <rientjes@google.com>
To: Kees Cook <kees@kernel.org>
cc: Vlastimil Babka <vbabka@suse.cz>, 
    Sergio Perez Gonzalez <sperezglz@gmail.com>, 
    Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>, 
    Steven Rostedt <rostedt@goodmis.org>, 
    Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
    Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
    Sergey Senozhatsky <senozhatsky@chromium.org>, 
    Andrew Morton <akpm@linux-foundation.org>, 
    Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
    Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
    Roman Gushchin <roman.gushchin@linux.dev>, 
    Harry Yoo <harry.yoo@oracle.com>, "Paul E. McKenney" <paulmck@kernel.org>, 
    Randy Dunlap <rdunlap@infradead.org>, Tamir Duberstein <tamird@gmail.com>, 
    Miguel Ojeda <ojeda@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
    linux-doc@vger.kernel.org, linux-mm@kvack.org, 
    Thomas Huth <thuth@redhat.com>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
    Ard Biesheuvel <ardb@kernel.org>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Andreas Hindborg <a.hindborg@kernel.org>, 
    Stephen Boyd <swboyd@chromium.org>, linux-kernel@vger.kernel.org, 
    linux-hardening@vger.kernel.org
Subject: Re: [PATCH] slab: Decouple slab_debug and no_hash_pointers
In-Reply-To: <20250410174428.work.488-kees@kernel.org>
Message-ID: <f381d2f4-f86c-e714-c67a-1d060b8669d5@google.com>
References: <20250410174428.work.488-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Thu, 10 Apr 2025, Kees Cook wrote:

> Some system owners use slab_debug=FPZ (or similar) as a hardening option,
> but do not want to be forced into having kernel addresses exposed due
> to the implicit "no_hash_pointers" boot param setting.[1]
> 
> Introduce the "hash_pointers" boot param, which defaults to "auto"
> (the current behavior), but also includes "always" (forcing on hashing
> even when "slab_debug=..." is defined), and "never". The existing
> "no_hash_pointers" boot param becomes an alias for "hash_pointers=never".
> 
> This makes it possible to boot with "slab_debug=FPZ hash_pointers=always".
> 
> Link: https://github.com/KSPP/linux/issues/368 [1]
> Fixes: 792702911f58 ("slub: force on no_hash_pointers when slub_debug is enabled")
> Co-developed-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
> Signed-off-by: Sergio Perez Gonzalez <sperezglz@gmail.com>
> Signed-off-by: Kees Cook <kees@kernel.org>

Acked-by: David Rientjes <rientjes@google.com>
