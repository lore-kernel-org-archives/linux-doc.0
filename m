Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9992DEA9B
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 15:01:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761750098; cv=none; b=cjCRnNsbPWopaDPR37/rFJESz5wwFcsYuMuRMKbxzmF/bw0MjQRy7TmLrise4lfazwOXM/34G1vmSkmO4SFJ/mtMZpeDv8ljtPXKYkRl499RqmSTN4vVvG1y/yrtcxDr/GAnflDgBwfeEIvxwtFYCDCBhQDtIDGRhnx2umVnqww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761750098; c=relaxed/simple;
	bh=HlJQCAG1W3ydE7Kzs+HfToAk9V8Vt8C3Tchsphjr6mI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RStkbCA10g49QcohQcRsOMh0hauR2rbK25HetYzm5BOMUOecyhfkfbsZ69SVxNSOzW+Nby493oYNgsegDn+XiAfHP2Nd8SsHk38P6ztEqJumIPqm3ZpyCvJcC+COVHBDS2fICFxF9ylv1f7DcDhEt9KpLhq5mFtmXGg6kmlTzbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Gpw6xQVu; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Gpw6xQVu"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4ecfafb92bcso353861cf.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 08:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761750095; x=1762354895; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TVozCklyMGutTzUIfKa2FFHEvZ6hI3sBOk40Zf+Xv1Y=;
        b=Gpw6xQVuD6nJKyDg/S6rSbds9Rza7+k8r3feQSC9Gkf5jtQ2Fra0R2oC/Hrhg63ovJ
         sII2hmwHQgCw04+yqjkOkLfr6Sde/CxyTU3dhVmiOwkuoCiEYHe5K8yzA3xppMKZMaBn
         Gro6a8R8ulcAtihUebZ1dy3cAtgxVlWMoDHVbhFUaiRCLtlQiWldWBc4JlpXLDLm4KaI
         yN5hWQxcRrL5HgzKmlJvKoY2d/SUQtNl2G0S6VV/js53vRPCZpDy4a9Uc1DxWlFX8ZGr
         CMg22VFrZRUqj7HjAzmfT/w76032bEMgcotKiKZObhfyxzMZwkIYUH/4QMvHkhxg08UK
         ITHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761750095; x=1762354895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TVozCklyMGutTzUIfKa2FFHEvZ6hI3sBOk40Zf+Xv1Y=;
        b=EHUXwr1sX8LdL8SZTyYlDz5b9exm4kBiEI/ytAGyXV114nUWoSITzwkfmjmnoehZkJ
         aE6TwJTU3DAjtt1Z2j2P0I/2vKhuO9ZC/hUs0n9MejLD3NTMAFycB/I4x6V07v5aKWI7
         FvpJEJ+FgFkwmodqTXDd67LbIinxZ0TzAUVZOIDHwIZS3RiBrP4nEs2srjKJ5owt4abA
         MdVgDr9yd3AAbxzc95eRq9u8Tl5k9UqPZNZxb+7oTdpN+hsXF/FnAvR5teyfB729cbGS
         SMTPOGAhckDZOog4AWHOM71JVJwNVj82AvEV64eoHqX4OjuXBVsq2St6+IrQdZcrDwyo
         kqxQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+xOhT6E70y0j910SnPo8duroieRu/wnGJ7wsUS8yHT4BPUHl3TGomXO63rxegUIG1xJNyMXoGw3g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4dbIKh3qQh64+I38arsPb8BAb1Kgr0EchkUgWWvtlvKh9Tc5f
	jWmUZnRDNcBx/QcRublv6nWsT6jdRG56p2CcNSxkO/XWQMejAMXgvc21YSL9cIt9whausEps26u
	duOT6I3MGsJBhaoAyxAgqEpWy5fEFXBrxocy75vDt
X-Gm-Gg: ASbGncu0gycT/Tc82ek4gBccynoVPk7OcPL4+GPL0eJDp0vBaBggTJfZQAWjhtrWLJT
	OdjzD66j7DOazhsnIqg7QLBCpK/McveHuuj4jU3CY6JZydqKjvFioWaMwQkEwdMwmmqGcx2KILM
	s5AEpEjRXSsJXWTNvyMYhg6r+rd3oKrpRt5LHGDzFZ4vCnT+XCzVHdTO18lIsDhhdWu4/z+EFva
	STi77DB+4e5qIe3YU/W4uW4e7XQVD3h93VMlmtXe5LBoRgujhlgMBc6u0XcgX9EzgX9E+ina1zX
	/CawSHOXT9bOHmmJW7iA7rjpAg==
X-Google-Smtp-Source: AGHT+IHxSXs4Ljx2jn0yoPxmLLrrHglpLBSsCQ3XrhB6BeOLssdbWHiOnV0A9SgFcrBcHzFGMl0brc5X+v5n+od5/q0=
X-Received: by 2002:a05:622a:5a97:b0:4b7:8de4:52d6 with SMTP id
 d75a77b69052e-4ed157cfd4cmr7271761cf.2.1761750092250; Wed, 29 Oct 2025
 08:01:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251026203611.1608903-1-surenb@google.com> <aP8XMZ_DfJEvrNxL@infradead.org>
 <CAJuCfpH1Nmnvmg--T2nYQ4r25pgJhDEo=2-GAXMjWaFU5vH7LQ@mail.gmail.com>
 <aQHdG_4yk0-o0iEY@infradead.org> <CAJuCfpFPDPaQdHW3fy46fsNczyqje0W8BemHSfroeawB1-SRpQ@mail.gmail.com>
In-Reply-To: <CAJuCfpFPDPaQdHW3fy46fsNczyqje0W8BemHSfroeawB1-SRpQ@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 29 Oct 2025 08:01:20 -0700
X-Gm-Features: AWmQ_bkezv9FLJcwU5V7m6uud2WYPkxlH3WAp5Tp7iJo098Fnr3molvTshJ4AJU
Message-ID: <CAJuCfpFg3UKs_eY8eCuqS9oMrEA9N1em4wj8da7cotd3MgBweg@mail.gmail.com>
Subject: Re: [PATCH v2 0/8] Guaranteed CMA
To: Christoph Hellwig <hch@infradead.org>
Cc: akpm@linux-foundation.org, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	jack@suse.cz, willy@infradead.org, m.szyprowski@samsung.com, 
	robin.murphy@arm.com, hannes@cmpxchg.org, zhengqi.arch@bytedance.com, 
	shakeel.butt@linux.dev, axelrasmussen@google.com, yuanchu@google.com, 
	weixugc@google.com, minchan@kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 7:57=E2=80=AFAM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, Oct 29, 2025 at 2:23=E2=80=AFAM Christoph Hellwig <hch@infradead.=
org> wrote:
> >
> > On Mon, Oct 27, 2025 at 12:51:17PM -0700, Suren Baghdasaryan wrote:
> > > I'm guessing you missed my reply to your comment in the previous
> > > submission: https://lore.kernel.org/all/CAJuCfpFs5aKv8E96YC_pasNjH6=
=3DeukTuS2X8f=3DnBGiiuE0Nwhg@mail.gmail.com/
> > > Please check it out and follow up here or on the original thread.
> >
> > I didn't feel to comment on it.  Please don't just build abstractions
> > on top of abstractions for no reason.  If you later have to introduce
> > them add them when they are actually needed.
>
> Ok, if it makes it easier to review the code, I'll do it. So, I can:
> 1. merge cleancache code (patch 1) with the GCMA code (patch 7). This
> way all the logic will be together.
> 2. . LRU additiona (patch 2) and readahead support (patch 3) can stay
> as incremental additions to GCMA, sysfs interface (patch 4) and
> cleancache documentation (

Sorry, clicked send before finishing the reply...

Ok, if it makes it easier to review the code, I'll do it. So, I can:
1. merge cleancache code (patch 1) with the GCMA code (patch 7). This
way all the logic will be together.
2. LRU addition (patch 2) and readahead support (patch 3) can stay as
incremental additions to GCMA.
3. sysfs interface (patch 4) and cleancache documentation (patch 6)
will be excluded for now from the patchset. Moving sysfs later would
introduce UAPI changes and unnecessary headache. Documenting
cleancache separately would also not make sense;
4. Unit tests (patch 5) and GCMA integration will also be left as
separate patches.

Would that be easier to review?

>
>
> >
