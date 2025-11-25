Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CBD42E0406
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 22:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764110501; cv=none; b=MtF8E3jZMRt06slxnRRPh/fCEKMDvRXJKYHcoIKauvR2ebf+BdR8jTqJmRre/EX2upPmyoFdKqxX2IevTt//0k0phRRO1JdQ0G/p+pH/Wzv8I4lpkUnSXV5xYlCc9ANf19/ggTzhQ3FpbbyVR4iLVbEB6WFCKF3pqXKHgRxCurY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764110501; c=relaxed/simple;
	bh=jsL4T2UPDPxhD8xl6D8pYITWdOgOn16n1Vvm+6LuL64=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BFUzps8sEiIn2a8dHLOhaZBraFitoa5XtcR0257DhEaLVVGQ35juEhQQi+R05dKpWcNfrIzaBfLi2pDleQt4guKrgoSvg3sOq+iBqQXs/FzN9kTh2fjmORnhehdMiUSNFC+R6Qnu7d/cVsXhCP8DFnvXNVFk73Jh0Cicp9d4RdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=WvXrHvpC; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="WvXrHvpC"
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b73b24f1784so58102466b.0
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 14:41:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764110498; x=1764715298; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=PICSSTOVtSfieJ36Y7geN1Ip3ZesP7jblQQJyY8Iec8=;
        b=WvXrHvpCIs7Ko94iqgmvlGJrR+8WJs1HPO3smeuromCQQfPqW3cNop5njF8dIQmYBR
         Ag1PU+IjtMq2casWecj04g4R+chcSHMKwFQXefId52vZa2LUTRvD2sPyr8meiJCiV33k
         LK3LPvJKPO/o60OFPWAuUrlvzdhgSOtUluLxg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764110498; x=1764715298;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PICSSTOVtSfieJ36Y7geN1Ip3ZesP7jblQQJyY8Iec8=;
        b=VR4X7POT5QOsT/g+z+z82nqWUi8hK6pILtSeAvNGJwvhFEo+DJ0Ysowhs05AYbJDFH
         6M+JstT2aZTaREEUBS7YCCIia5M+82j8vMQ9PHxkLYpSa6ZBS+/YdajqODvUWdWBjDrO
         RZvEam1AD2xn72HZ1IiWfuIJVpegsJHamuR5+maCbki6eEZuf6bl4xhYvrf2/iXcCdkJ
         uAOJQx0LHE8/PjLA6/LBjU+gucISK1/75ybwr1EEqz2j5VwPYoeg3c+k0JkMIhNqUWaS
         mtcRtto+sHNqf+Bn5HVddxjNmtNWI4jvgpm2skXdeWVZZ5ah1rRzxYMUxwtvNgjgDr6+
         DjCg==
X-Forwarded-Encrypted: i=1; AJvYcCXiY0zitajNtgz4YYAcObY/Y8CSzyX2VlJUGdc4r/E7F0YXI+RDeB1d4vAvg9h1gju1fU+OnNje+2w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTRaxGyigwFAKCqLIrQBA0ZleINkRJMk5pUzVSv/sNrn8OoCa1
	CW4KE+1/6TjdJpW7DS0mHCuQPbxm2hnM69qFlsiRXzu+F3dBNKJ9TEX04gWt+KS0qoF/Guu7SLa
	JbqB9Dpg=
X-Gm-Gg: ASbGncuLzmSCP24Ax+HfRiJ09/+h7iaBSB7cSEzi2V1kgWFosf8LI0PrH2rlZ5CMuTj
	qCXqU7XF8CtYlqOsGHNhMCcJjgKxfbgc1qDAABKJeudPFKt9zOYIChxCum+E6LXHurogZ/35jY/
	M5HJlSQ54LLtxfshv9scZFKkH+mV6FBZgjpgDQ+IRnqjG4u03FgbjYdCFdgVUI9FIrAMAzCAyHO
	+1FXiROlhhpc9WLOvm8UBiiCi+hltb+LtdZfyJ1KmwBD3CAjQDllSWEoHC7G2K6qjSkiVlPoRTu
	Zo/CQTm4zXWRbYLvFwCjVRxp5o9ic2YzajbAklHmrP2+LqNAG/hFX1nsYHdGppzKKwlgDTH8PN0
	ai2zxViQzPth37s4zIgBg6RTglhCxlN3RfgrO5DL5HWicRXZUun7GbtFcbK1WJ0N3O4/1Wu/kkO
	Lbl3QGHgJvrbIlx+NnE/UPyAa8dTBJ5xV3kXsAIlLvDBqI8Rz4h1Rl0nfbUIJv
X-Google-Smtp-Source: AGHT+IG45An3MdgvFC6X6bzdOMKym3pHigHKnRuBgjreOa2xS6s1qpEjfFyvF7B4q76VTTyu9HjrTw==
X-Received: by 2002:a17:906:7308:b0:b72:d577:11cc with SMTP id a640c23a62f3a-b766ede764fmr2017813666b.12.1764110498375;
        Tue, 25 Nov 2025 14:41:38 -0800 (PST)
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com. [209.85.218.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654ce15e7sm1729722066b.8.2025.11.25.14.41.38
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 25 Nov 2025 14:41:38 -0800 (PST)
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-b727f452fffso46457166b.1
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 14:41:38 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW0XVzj2B1CRBxUY5vT/p5OICOSj7S9tUVoCMVBnysB/9cdCREhAG8JU5ip+40nQ75OfBD5eNepbok=@vger.kernel.org
X-Received: by 2002:a17:906:d553:b0:b04:48b5:6ea5 with SMTP id
 a640c23a62f3a-b766ef1d27emr2056801766b.17.1764110497696; Tue, 25 Nov 2025
 14:41:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com>
 <CAHk-=wjxj---dy5haOvNXjg_Xz-mDQciGL7OnJnpJpjYD9Moog@mail.gmail.com> <b7804333-6030-4bfd-8e0b-4479f87060ce@suse.cz>
In-Reply-To: <b7804333-6030-4bfd-8e0b-4479f87060ce@suse.cz>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Tue, 25 Nov 2025 14:41:21 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi6nqPAveRPjrH_=ombtpz00G--RH9_MyC38PzsDHcb0A@mail.gmail.com>
X-Gm-Features: AWmQ_bnHmATmDGg6MkJpXYuB1__YO7XbeBdtXEi7jxM1H4BelwLZXehOF1vhEBg
Message-ID: <CAHk-=wi6nqPAveRPjrH_=ombtpz00G--RH9_MyC38PzsDHcb0A@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Vlastimil Babka <vbabka@suse.cz>
Cc: Kees Cook <kees@kernel.org>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
	David Rientjes <rientjes@google.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Hyeonggon Yoo <42.hyeyoo@gmail.com>, "Gustavo A . R . Silva" <gustavoars@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, Jann Horn <jannh@google.com>, 
	Przemek Kitszel <przemyslaw.kitszel@intel.com>, Marco Elver <elver@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Sasha Levin <sashal@kernel.org>, linux-mm@kvack.org, 
	Randy Dunlap <rdunlap@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Vegard Nossum <vegard.nossum@oracle.com>, 
	Harry Yoo <harry.yoo@oracle.com>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Jakub Kicinski <kuba@kernel.org>, Yafang Shao <laoar.shao@gmail.com>, 
	Tony Ambardar <tony.ambardar@gmail.com>, Alexander Lobakin <aleksander.lobakin@intel.com>, 
	Jan Hendrik Farr <kernel@jfarr.cc>, Alexander Potapenko <glider@google.com>, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, linux-doc@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 10:56, Vlastimil Babka <vbabka@suse.cz> wrote:
>
> >     #define kmalloc_verify(type) \
> >         BUILD_BUG_ON_ZERO(__alignof__(type) > ARCH_KMALLOC_MINALIGN)
>
> So AFAIU this would be too pessimistic. I'm not sure if the alignment rules
> can be sensibly encoded in build time checks. Perhaps yes, in a similar way
> that we have compile-time size bucket selection via __kmalloc_index().

So I wouldn't worry about it over-much: it's actually pretty unusual
that we have any odd alignment rules for anything that we would
allocate with kmalloc.

And I don't think a 'kmalloc_obj()' case needs to necessarily *handle*
such unusual cases, I just want this to be *detected*.

IOW, what I worry about would be people who use the simple object
allocator mistakenly on auto-pilot.

So if it errors out about "you're trying to use the simple model for
an object that requires non-simple alignment", that is perfectly fine.
Those cases can - and do - use more specialized allocators.

Yes, yes, in a perfect world we'd just handle that case automatically,
but it really is fairly rare, so forcing people to then use some more
involved interface for those cases is maybe not optimal, but it's
perfectly ok.

              Linus
