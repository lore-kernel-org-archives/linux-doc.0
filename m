Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BA3D2F6925
	for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 21:35:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764020133; cv=none; b=OXMV3txZolEOZsmtXVWE39CTOX7NRrFyZuo8nUXIIENiRT7zKxxHsexlYyWdvig4SeOTqxDvzue1Rjs4+aa27ENAEZ1GJUCQHQTMBUNRQxj+k7z/thqKW7KjLl41KUQ3oqSm8F9NDDX5oqFOrsFv4inTvr9cDbyjU0n5d28TKJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764020133; c=relaxed/simple;
	bh=21B8UNo59KNJ8qFUDnUl8PBh72Y8QaDRJNTNf4wTI1c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Hk/Sszk9+ViUdeOyKz73BVlQjh7N1Y4v1D5y5PWLfKFrojEZtnjrXuQloXTkczNVYLcCu39Dzr7m+sh65IsCE5y56ZBalxniN5NbsMhrba/Hlwv8NgazAUG+JTxO6w+3UsQTQ61pHE2EAT5ZaXDPzmqZ44qZ7+buynQxvhlfE1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Unh4O+73; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Unh4O+73"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b737cd03d46so659138166b.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:35:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1764020129; x=1764624929; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=NoAYUzaUy2oENd7JkoqDPVCvDLLlV10MU8wdc2FsfGw=;
        b=Unh4O+73usYCQ9n17+gMSDfcDNaxPx5XPD0t0B0MFrNXDl7MKfc9CDo8DKNUq0Hrd0
         9/R0wysrPwg/84LOjTC+hICrNQtA4O9lqSA3dzfs/m+fqyPKo1KYh1l4k68SmIUsifoD
         zR2q37nhWfveAFpVe+k/gyooWTVVvpaffNAz0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764020129; x=1764624929;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NoAYUzaUy2oENd7JkoqDPVCvDLLlV10MU8wdc2FsfGw=;
        b=WMfTBpy2ed3BudAY5Ka1O4jID+zwACEE2aaTT6+R8rPldrqvEOKf6ZHEBxGtbGgazt
         qpJ+cKMCgL5Zzs37CmOLICP0kPQhN7qiDZ/H6bB+npKgrjYFiCqVc1lIjadwuaNyRvM9
         ghdldgZ0YaO2bNAOEl3nKOBIaaZHc1tBeUx69Ld2iojGoeAuDcRIbNzGRvvPGsiFcR2V
         T0z0kNl0vix37shizLeS0MYDTMGGbGhWqI9PzmJIIuTS5/kKoAj+YxnitHL3g5H4ZsDF
         KIO9XdoFh/iKpu4mx9Cwbca0KmP29HuzpkNPGghnSbhFzomn63RkU/CqGnd7mM+fnwQA
         cZAA==
X-Forwarded-Encrypted: i=1; AJvYcCWXI410TJp9QFdVmOoV+cWdAjrE2JFY/ilEg+PrHq7d+Cnk9j95rGwV1XX8i1wpnsPJGh5K1h8j7WU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwF9xGUYVFlGwoIKRthX+Hov98UcbWfMFrYg60WwyjRuq7kQZyp
	ITFvskgxHjwtlPpn+H6p2NgTgAuDszFNnoTmmkPCtQp9RFVyxNLs0FHHodJ05iJGFW7gV++X//8
	4n9/yrTQ=
X-Gm-Gg: ASbGnctbhKVV+GyByi5pw+bRSst/Q5dE6KOs0z6K9Sf3SqN+f5MulS9etUUovrYfYOA
	5/ko3t4O2gzDqRnU5EPt+q4iFMtaSe6rgBQzvt2Fj/ZUodAmtAgK8D/qe1JuVeBGC0oo8ojAg0T
	kSE75u6w3+Poe/ybVT5H8UBvmYol8hfsENOexDULDfseKIZ3VrFMKpgGVZvEVyYunDIduTX8W8W
	JuOU44eqqZbaOSU4DDNKOK5SVdVrzdSucWGUMWEF+VHf6Fv+bfQWFJqWfB2LvIjlcCo/mcwzq1U
	kUPsXlcoGb2Y9F7wdYFA4PqJTmmbTk2nPp64iZSxjgSeVxg4cfAXb5bw1OWl2Pzg2DaZVYWo3XH
	t6DydCxgn4sqU1v1rdehUtZicYGJUfWyAiZAT0mejs2qRtPbvIkb37FPdVfGzz5tXDM2JYa2RPl
	Z3OPOJlxP/GtImkRXJKDoavckrakROhARsXeAU5A19jDhGj2ULiUobFEZuMJ+mviloQm5DjSM=
X-Google-Smtp-Source: AGHT+IHfgeo2mlcNcl3dwutjkE4ibytMklit08h5sFhtGRIHXjrBnmxCtt3BeN19WqyuhHDJ3FPIjg==
X-Received: by 2002:a17:907:1c25:b0:b72:5d08:486c with SMTP id a640c23a62f3a-b76715b02cbmr1425762466b.27.1764020129350;
        Mon, 24 Nov 2025 13:35:29 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7654cdd5e0sm1488807166b.1.2025.11.24.13.35.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Nov 2025 13:35:29 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-b737cd03d46so659136666b.0
        for <linux-doc@vger.kernel.org>; Mon, 24 Nov 2025 13:35:29 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVf0/aAGeQrGlFOtGAgG4Rmq0dgsCA25VvBY2NAgl0gxH/XXCKoM5+oom4XFnM7nF7f8gtChRGmvi4=@vger.kernel.org
X-Received: by 2002:a17:907:dab:b0:b73:4fbb:37a2 with SMTP id
 a640c23a62f3a-b7671514106mr1495344566b.5.1764020128744; Mon, 24 Nov 2025
 13:35:28 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122014258.do.018-kees@kernel.org> <20251122014304.3417954-2-kees@kernel.org>
 <CAHk-=wiNnECns4B3qxRsCykkHwzovT+3wG738fUhq5E+3Lxxbg@mail.gmail.com> <202511241119.C547DEF80@keescook>
In-Reply-To: <202511241119.C547DEF80@keescook>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 24 Nov 2025 13:35:12 -0800
X-Gmail-Original-Message-ID: <CAHk-=wikqnc16e7yUTJuqnc5f4rL+y_-JpRzCLRu9WPnt3nmiQ@mail.gmail.com>
X-Gm-Features: AWmQ_blKFpIgLGtxfT-s5R89X15xCb9TiduKsCJf35qbsynIOkmHF3dcQigtmSE
Message-ID: <CAHk-=wikqnc16e7yUTJuqnc5f4rL+y_-JpRzCLRu9WPnt3nmiQ@mail.gmail.com>
Subject: Re: [PATCH v5 2/4] slab: Introduce kmalloc_obj() and family
To: Kees Cook <kees@kernel.org>
Cc: Vlastimil Babka <vbabka@suse.cz>, Christoph Lameter <cl@linux.com>, Pekka Enberg <penberg@kernel.org>, 
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

On Mon, 24 Nov 2025 at 12:39, Kees Cook <kees@kernel.org> wrote:
>
> I'm not sure what you mean by "limit to pre-defined size". There's no
> such design in those helpers, except from the perspective of "detect
> and refuse to truncate overflows into too-small storage". Is that what
> you meant?

I meant that odd combination of checking both for minimal size and
then assigning to it, but upon re-reading it, I realize that the
"check for minimal size" was actually checking the size of the result
variable.

Those macros are illegible. And 99% of all users DO NOT WANT ANY OF
THAT COMPLEXITY.

Yes, the wrapper macros then pass in NULL, which then - using yet more
complexity - turns into a dummy thing.

Basically, if *I* find those macros unreadable - and I'm actually
fairly good at parsing those things - then they are way too
complicated.

And they aren't even complicated for a good reason. My alternate ones
did *more*, and did it with less code and less confusion.

And you added the complication to make the users less legible.

So no. We're not doing *any* of that. You make it simple and targeted
to the *common* case, of you don't do this at all. Because that
over-designed mess that actually turned some users *less* readable,
but one line shorter, was bad.

                    Linus
