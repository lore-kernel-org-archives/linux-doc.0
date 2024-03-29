Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com [209.85.219.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75AB813DDDD
	for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 23:02:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711753332; cv=none; b=fL2NjSET0IIldZxB1tfeyCvLrlGZbSuD/TVf+Ra1OEVnb4LblorJVlIiSoDN6atk4leA+pWK6tKq/AJ9TNzITS+uZ9iMuFdC+z5zQ8Bfxx7/Br24moHG2IoEeqKTJYL0LfSmb15Lkpylw4OQbsHyVBmT2b4uy6nUMxeqGjOzEFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711753332; c=relaxed/simple;
	bh=LOlGtRD+I7SxnGyG4Qt3HDXxX82VHSKBErkCCIDULUM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I79VwkvHiWCqRsyuy+cBb0GCBUz9b1hMfg2aU/WHElcq4rXrkn7pRr18WaYecWgHNcr7Qf8Uc7zySWPZk5uPPzrQdSyTaT/cLX6wtDLF6x7+tQdmGhQmdOCqDclDN9AR33TDcu1+UIY4iPd1rTGjm60Naqq6jp/4dI+PjIoWG9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xH2DVphr; arc=none smtp.client-ip=209.85.219.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xH2DVphr"
Received: by mail-yb1-f181.google.com with SMTP id 3f1490d57ef6-dcbc6a6808fso2258637276.2
        for <linux-doc@vger.kernel.org>; Fri, 29 Mar 2024 16:02:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711753329; x=1712358129; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Igo4IUryPSmylrRgjB3Hg+wV547xWuDnOMCE0dxBkog=;
        b=xH2DVphr1RMNlDIJ9mBeQGwyWsjq38aan7YKMGLjdGZmWLib+NUcXRhdWCuWcI5HNT
         ZGSu6qeN3z19TBtIG88HLzizhGEGS4PxQ51+JLM/YwwJXGouZnJyJuq4lvq7Z2MG5skq
         8PNjSfd64nLcFrrkoBdfFtXVMbGfTOwTKfe1LnHOlqZAbzh6Nr8FvBS7hA6sAQi+D9l6
         X7ypNHm6mByX1xw7L5Yp99s8BA02l8eXliPXtVq11Z9TReDOWJonEJ6yAlUJlnTj1aGq
         blbeUtROK2MV+hjJcQG6j7j5wjUqaC8iT8Fhdelvjs+2+cDwIzJaol8pS+VCnvtRqU8C
         ifcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711753329; x=1712358129;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Igo4IUryPSmylrRgjB3Hg+wV547xWuDnOMCE0dxBkog=;
        b=mbllUM97CdP9IZqtgxsJJxAnc2EuGD8KtT0j/ZDmjHNvxeR4ia51YL5zj6M/V1PKa1
         Twa9AVcCaDzf8WIz7M/rTEdPzgHqkqkXBSAvUAPt5/EgL+MmoF0GA+2RLTbDUFR4AVq6
         LivUrV6LUbDey4/efkrbzaFKBJzWTa6sm+sJiPOt0V5f7t5MDF1DMWWc8vSUoIylx++6
         SCzYBGQnC9NSGOsNXwdjtFvc9pIXn4JdVxcRhppXzSgt9SAW5yUSxISj7S9u3gSlAWJh
         6MQUQV/NwWcFP33GazjWly4SUTOXGVigaZ9b55qGAG/r7TX14+ugKBPbvlXTwgUwreV4
         K8Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXSTtffKldjsTdfdV9CpPqPtv4J6D+JZqtIaZeSZ0e4UL7/b0C1dYY20e5afRGar+JOuXZaYbDapSmy2oJ8Vr+Y7a1ta641r4D2
X-Gm-Message-State: AOJu0YwaSebCV/GLLGbC/wX0U2kORuXl7frNqI3+VrMklqH1BtLMNQrw
	vK0JF1utpkZkDAK1U+Gw8H+ambGBCIsPf00eWPtKbgLmOwef5j+IDG70ITDg8BUT/9SwUDXUJ1g
	dtnsmdQGrnM6Ky0hovIB1DH1RarwgqUTy10+g
X-Google-Smtp-Source: AGHT+IEMWCPE7scOrb6eChbQBr0BQCWxKMukJUVs0Rndtpuxp6EowEceQGuHZdmJhEbFeclclOJgjloq4Q7FYUj0s8k=
X-Received: by 2002:a25:8b88:0:b0:dc7:140:8c0c with SMTP id
 j8-20020a258b88000000b00dc701408c0cmr3746406ybl.23.1711753329011; Fri, 29 Mar
 2024 16:02:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240325123603.1bdd6588@canb.auug.org.au> <CAJuCfpH4Ee00hM9+B7=mi5Dwjrhov8vUK-KwPuoO3wsD7iJSAQ@mail.gmail.com>
 <5e1321ca-0d46-4e9d-a6e5-0560d99f65ff@infradead.org> <CAJuCfpFTOz8cNiJFiCU5tMM1u5L=wXRsXqxUhN9g-R0u77CyZw@mail.gmail.com>
 <20240328153947.3871cfdf@canb.auug.org.au> <20240328154427.3e926d21@canb.auug.org.au>
 <CAJuCfpHZGkL9urkZaVmO_o0ujpr-moDGYiBES1iRy2dh8g-t8w@mail.gmail.com> <20240330094919.61e7c7b8@canb.auug.org.au>
In-Reply-To: <20240330094919.61e7c7b8@canb.auug.org.au>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 29 Mar 2024 16:01:56 -0700
Message-ID: <CAJuCfpHVSn-wAogkYxuLTewFXKNpVwfDGAqshe1Ff5b7BNteqg@mail.gmail.com>
Subject: Re: linux-next: build warnings after merge of the mm tree
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Randy Dunlap <rdunlap@infradead.org>, 
	Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 29, 2024 at 3:49=E2=80=AFPM Stephen Rothwell <sfr@canb.auug.org=
.au> wrote:
>
> Hi Suren,
>
> On Wed, 27 Mar 2024 22:35:56 -0700 Suren Baghdasaryan <surenb@google.com>=
 wrote:
> >
> > https://lore.kernel.org/all/20240327044649.9199-1-rdunlap@infradead.org=
/
> > which seems to not yet been pulled into mm-unstable should fix the
> > following warnings:
> >
> > include/linux/slab.h:730: warning: Function parameter or struct member
> > '_n' not described in 'kcalloc'
> > include/linux/slab.h:730: warning: Function parameter or struct member
> > '_size' not described in 'kcalloc'
> > include/linux/slab.h:730: warning: Function parameter or struct member
> > '_flags' not described in 'kcalloc'
> > include/linux/slab.h:730: warning: Excess function parameter 'n'
> > description in 'kcalloc'
> > include/linux/slab.h:730: warning: Excess function parameter 'size'
> > description in 'kcalloc'
> > include/linux/slab.h:730: warning: Excess function parameter 'flags'
> > description in 'kcalloc'
> >
> > And https://lore.kernel.org/all/20240326054149.2121-1-rdunlap@infradead=
.org/
> > should handle the _noprof warnings. I can see this patch in
> > mm-unstable and running "make htmldocs" in mm-unstable does not show
> > the _noprof warnings anymore. Please let me know if I should try some
> > other command to reproduce these.
>
> Those patches entered the mm tree after I had merge it on Thursday.  It
> should all be good on Tuesday.

Perfect. I'll ignore similar reports with _noprof prototype warnings until =
then.
Thank you!

>
> --
> Cheers,
> Stephen Rothwell
