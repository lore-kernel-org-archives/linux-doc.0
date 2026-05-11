Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A66E2426ECF
	for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 16:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778517316; cv=pass; b=mT1hq1boPyzRKmPXeyS4sYssQBO71E5PB52IYUvS7IFmDYpRn5AbKGy+gXNwGPIKaBSuHnxpeedbnhHZFDBN84KrE6KY8AOnYjgz9SAAnHjZU1K6TpEYxtJf56wTbj7cPeHkpTCcfUW0KYXn8/OHo8Jd/vlaomkS0gsjtKL6R/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778517316; c=relaxed/simple;
	bh=4S7C02MIUqtzmropOUva8L19yYp6EZ1lPURTmBTWjnA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YuXdItVe9XT7RXFC+wr+bXl0SzScmGTvV5x2RDwFSdt1h1zCZ/6k5N2aZoCZe+vEFWGrJmIp2jpQOPasvmU14JWXvn9eOVCLbd5ghhnAHuhJTf3II1fACWMje/adaTIiW/kFqLgAworYGa/AdmOa+HFEWxWDdC6/VoIQWNdfebs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=qZL6FK5y; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qZL6FK5y"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c8f9846c8so6388899c88.0
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 09:35:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778517314; cv=none;
        d=google.com; s=arc-20240605;
        b=MKRA+w6t8H9o+0hVVX5u3ZDeBL5LzoBnZExnlhUhfUVFYcwjp69Xr2qsPHfHE+macs
         sjusGA07uj9PbG9kuJnA9YmCPuBZUX7E1Mo9QSaMTAHbu8T8SZnHjqbx/o5Wkdf0PrDq
         GjWm2lnLpTJNIhDcS/Y2MKJXRMcI3LM8ZXSqRB3Rf2kpfF1i+7l9K/J+3tSaOXWZhnzP
         v6MA/6HS2Ssc5wr/92i8ciKhbu82x9aAk8UomsCf6VY5NVjfbEiaE3Bn4UG+Nv4fjElv
         TZ14mB9892e31zMuIwQYqGOK/fY0fvNlWd2MHsO5/4z8spKzB6uibbWxc/K7SoxYnfU0
         DRrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        fh=dEn0y6m8GbNvhdazLZF7Vk9PBezzkiY6C4yHAwOYyRw=;
        b=RiYw6P6Rc/dRSGorB+QRWA+02dgO2HTAhIZraF/iOx2+L+pHq3uNsPMqP2sHkR999u
         4zofYJsksnqInhLr3E/++EAC5ROio04Mr3oXBpZmoDcs39mbJeK8Y4RCHig7P1SNySyn
         n3RwIqHSPDYtI/z7ES7kF71kHteN3zRtjpzXHCSrQdUZEDGKzAqHpmSwlFEXQDmbjEwD
         9Yy8d631tsANqt6bwaDCy0yWTRub1zQ7StIV77fcPaKSX3TAV5Gv+9IFFIRIlw3YMRIc
         H4xPXpo/V43L6wggX4rjn+ppwH1SjXr0EVnK5Zea/3OwQMX6MJq7PRxr+/MBRgUZGTI/
         hdGA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778517314; x=1779122114; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        b=qZL6FK5yiHGU1UYpFox73RIlI3Bp+cacpR16tSKhsLmdbEUwqTWF7PkSPDxv9OwoXw
         /UEi0zPK06a1LzR9ZZ23m9YOZ16GidMugm7oobi2d1+EHh85B+fY1RjRKsM45paKtC5A
         A0T5usgqM4rS59r5k+ecCruSenojaTYEB+TqcS+tuMGFQ6F045Lb93YOeJLRFcUaZHa1
         wFEL0ijZ2/+3oP8sE7HixjnJnUXr4tojrllQXnb121sfLEIGfbocVhKNpYULSqPJweJS
         HHQYNl+HkiAVO2dmBQHsLzJ7zPP4hRHptHYGuke86yPe5KMVcK4n+QlBsEmDzuSBLcW0
         ZBkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778517314; x=1779122114;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1buMrZnL5eF5p/xBeXqRPyloQLFILIM6omdsc97ttuw=;
        b=V1f5K45cTNfY/o2RYqq5KtXim7JuX8htDPOA225HmDMB8qp2a0nE0v0gKwUfHrDZVZ
         1f0bwfUxIwgDuHPf8ipHqs93wmvsafR/mVbMeVsd9qaPuDsIJif8Drysr/V+PVvdzNR2
         bl3FUW8M4vvMFjSGxoi4B2cTaZF2Yf7Ey+xtUQyfouONwaSY8K8aJx05vZYc3Ga00Tmu
         cH+lrveKBFLerFAae17RP4+UZUUP3Ehi6y+jO+GZETL9J8/Nt/IOpl3VpBNJwcnnzk2P
         LmETYcgZHkeu0wpnP4eU2oJ6YM/5TM/DDdbt/im3v7lZnFlZVstym1Ufw5A/27bXZEiO
         OMtQ==
X-Forwarded-Encrypted: i=1; AFNElJ8TEhw9nnK/HZSV3t3Y5vmwIuXUzOMwAMh2lPkniOtd/1ZPRtGq10vg+VzDR4egg3/UP8p0+RMaZc4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy/7gtyr8Dd5I73SaD8Nb3kfxO9B1imoSW5uo1pfBg/mgsVP9Y5
	LApB6BHx24WcDCQmU5tyVZS0vNcbm35kn9lp0r0+OUuOSjyDGjTXY8uiTAEyfjUTSOvk9aNGr2K
	5L2MdohhW1E326cEAF8oI981Duh4/pyCSPNsM1U4L
X-Gm-Gg: Acq92OHTd/m4UdXTFLk0eDVxcVkFeSVHfLaLIpReHDDNu+EZ/V9DeAx2QnFGo8Nfy+E
	d3Nsqmb4awXNKhYSDZ6ARQC9jG6yo5y/QGeSG2S0HjQgRULDSEZIA/lyTOQ9LjvZmbTaiUrYJ9f
	E/ykfcDdBmwEMYX3gSbn0tu7xA6cJLolABRDjw6efR/V+l44tjsjVkUbfSTKg9Wad/+pjjyypWi
	YSYuIi4gNEclvmE/15wYRXSt97gjG0piKMr34zu5RcJZBNbFs5PXtUodk8WGUsCXDPusMa+X1Po
	G00uNESiSYgbmAS1M6CLDHItfpXcYuFXamzzV864d2/ZpULF4QDWghU7mKDI
X-Received: by 2002:a05:7022:699d:b0:133:39a6:2b8b with SMTP id
 a92af1059eb24-13339a62ddamr337498c88.44.1778517313279; Mon, 11 May 2026
 09:35:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260424132427.2703076-1-elver@google.com> <20260424132427.2703076-2-elver@google.com>
 <9c321184-9080-4d5c-bd1a-a16cd0bbaed3@kernel.org> <CANpmjNN_=g31Eoa+w1NrFALfp1dDBi5oHEZdr_bA_48-tS2M=Q@mail.gmail.com>
 <afi0nQ84k1oz5RyH@elver.google.com> <871pfiw343.fsf@trenco.lwn.net>
In-Reply-To: <871pfiw343.fsf@trenco.lwn.net>
From: Marco Elver <elver@google.com>
Date: Mon, 11 May 2026 18:34:36 +0200
X-Gm-Features: AVHnY4JXza1HWD1Ghv5ACGmGvnp1cOeRA6XD-S98uX5BfJA-pjXWKAfvxk-IzaE
Message-ID: <CANpmjNML=pbnv7QLf8Qi4wY2nDCk6oOw2T_Vs-MfMwWh=0m5Ag@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] slab: fix kernel-docs for mm-api
To: Jonathan Corbet <corbet@lwn.net>
Cc: "Vlastimil Babka (SUSE)" <vbabka@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Dennis Zhou <dennis@kernel.org>, 
	Tejun Heo <tj@kernel.org>, Christoph Lameter <cl@gentwo.org>, Harry Yoo <harry@kernel.org>, 
	Hao Li <hao.li@linux.dev>, David Rientjes <rientjes@google.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 May 2026 at 14:19, Jonathan Corbet <corbet@lwn.net> wrote:
>
> Marco Elver <elver@google.com> writes:
>
> > How about the below, i.e. adding type decls that only the kernel-doc
> > parser sees? One complication is also DECL_KMALLOC_PARAMS, and adding
> > kernel-doc parser hacks for that looks pretty awful, so this is a lot
> > cleaner.
>
> I'm going to be a while catching up with things, so this is just a first
> take.  I strongly suspect that the people who object so strongly to
> documentation markup in general would be less than fully thrilled by the
> addition of this kind of workaround.  I'd like to ponder a bit and see
> if I can some up with something better...but again, it won't happen
> right away.

Thanks, Jon.

The technical debt (hacks) that would accumulate in the kernel-doc
parser just for accommodating slab.h might be quite high; slab.h is
rather special, so the "#if 0" solution might be justified. Then
again, if there's a reasonable kernel-doc parser solution, that also
helps in other places, I won't object.

I tested the "#if 0" version and it works as expected. So to move
forward, we could consider it in the short term, and in the longer
term, see what new powers the kernel-doc parser can provide.
