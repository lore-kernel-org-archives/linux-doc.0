Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FB7513D299
	for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 20:35:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711485327; cv=none; b=PJwMlj5SKI04NUOP/aq79zW79xPdi7qysg4xRK7bn+2Ktr+orRhqcgj+1WUxO6vyzIzYInWn5XSgOIj5y44qL6GLp3B3CK/Wh35U07BSYz8RA0OQHUxP2s1u89PoHoIMlf4tCZz2uwSIx2SUbF4iV+JIRs4MxZfiUJGjfaROJDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711485327; c=relaxed/simple;
	bh=L4Yjxktg5ee7e7Jw2ym1cjdFiJihoUjwRndE5qe54Xk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D8ix2k2kmghxz3NjEAR0z3A7dNXCAOzMO0MyNw+vq81TE0kxctskJG3xsn/mguwqySzbofwh4a0Bv2nc9SwvuDqt1MLChJocCDyB2TpkKhQCsA/P115Cta2m38XFKjgOj/eytZoj85E8AbKAVxkTJbhcnUbOsNd9FG8G948eGaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LQRpqzci; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LQRpqzci"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-607c5679842so56742247b3.2
        for <linux-doc@vger.kernel.org>; Tue, 26 Mar 2024 13:35:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711485325; x=1712090125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kTo1MVAwsbyzZK5RKI7ZU0XWLvCPhNeDoFCQQGolD7Q=;
        b=LQRpqzciBhoRLM4RwBcdDo/qdjo4B8KWfZHOVcAuMOp90uw7r8sNMZwsUMF6Tc+1BC
         UFpsd8U1sdCE4mbJ5p3qUrGs4dHn8Gj0ECU1gOQvXFASnCgilKW3VW3r1mQI8Z7a0vaJ
         AMMDvWHsVVqe9K1XfypZvbezr9WEXZnjsY6L7/bQr+4R3e0agiZkDh0B6ZIXfR0WXNgK
         s4MGEHGcP9Ra0bvtsIvU3S9agk7mZhVACGMvQaNWIB/bY8hY6hE9qkG6f2/Zfd+JTBBr
         C7A91vdqZKKG6MEbCMbQRJvaN8JQb1bfCr3tbQQWrq7mMU5k916V88WXF21RCSbSZLoA
         JRZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711485325; x=1712090125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kTo1MVAwsbyzZK5RKI7ZU0XWLvCPhNeDoFCQQGolD7Q=;
        b=GsHSJ/W/3UxyY2ZMLp5CYiSVugcZwuKCJuPD3Wgzxh1Gzv/JNIXQNREOrUnavbeznf
         7f2h2Yx8+nL6r2/4NFSCPRfOIHDksYmKW7Pbi6z4Nf+mBbEgybK8XCcDpb/aNKIWLXEm
         z2PmlXXkdgpFUIfuTJY942Cnu65snUhT4rQxmlRiHNibbBEK/7KxANuOt8DAkh6xEh7t
         N+co2PWNrHw1GUV7uEpFiZS98FGEhoyL+TgCChBkIjDpiIvUbk9kVHy3pp2EauUbEyl1
         nXvVlh7+uJU+Ee/eVvMJEzIaTKncOxsQAowvXP3va2Df81TAIlvx+B6pydmQsQYG39NJ
         +8Fg==
X-Forwarded-Encrypted: i=1; AJvYcCVN0TKmD7wAFqBc4fAmeITcjYE7u3f9fHjDGIaeTjB0HldkzCmaE3R0ft6xm0ZwWyDCpHg8XNf02ofK8lfMlujM+IXfdFJqlGS2
X-Gm-Message-State: AOJu0Ywtjm7ZhofTuPSm/9+zPgRVfr6TCvwYWw0Gucnzz92ZanilQ1hI
	WQtgTxmeug+r/WQYy1X2lGVIpQqQsLm/SnyxFJLjtJi609KMT6blAw7ypWUT1i1NUaMPpE1DBWB
	11VYPWlg3J0VdU0LEaDvKgr68Vhsae8VG8vNY/kY90IrFipX2ZE7U
X-Google-Smtp-Source: AGHT+IHuXSjZJq/vBEoTRcBaU3DyX/+DVjAJbwZFzLC+xyjqFe7flX1N7xc1WIf7tM1psn8eSjN1jeDPmdM1BiXxNEE=
X-Received: by 2002:a25:830b:0:b0:dcf:6122:ccec with SMTP id
 s11-20020a25830b000000b00dcf6122ccecmr852249ybk.36.1711485324846; Tue, 26 Mar
 2024 13:35:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240326054149.2121-1-rdunlap@infradead.org>
In-Reply-To: <20240326054149.2121-1-rdunlap@infradead.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Tue, 26 Mar 2024 13:35:11 -0700
Message-ID: <CAJuCfpH+sXfyx3U4dBR0644vLD3hGas2=Vzb5nAsi7nBzrPTvQ@mail.gmail.com>
Subject: Re: [PATCH] scripts/kernel-doc: drop "_noprof" on function prototypes
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-kernel@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>, 
	Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Kent Overstreet <kent.overstreet@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 25, 2024 at 10:41=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
> Memory profiling introduces macros as hooks for function-level
> allocation profiling[1]. Memory allocation functions that are profiled
> are named like xyz_alloc() for API access to the function. xyz_alloc()
> then calls xyz_alloc_noprof() to do the allocation work.
>
> The kernel-doc comments for the memory allocation functions are
> introduced with the xyz_alloc() function names but the function
> implementations are the xyz_alloc_noprof() names.
> This causes kernel-doc warnings for mismatched documentation and
> function prototype names.
> By dropping the "_noprof" part of the function name, the kernel-doc
> function name matches the function prototype name, so the warnings
> are resolved.
>
> [1] https://lore.kernel.org/all/20240321163705.3067592-1-surenb@google.co=
m/
>
> Fixes: c64e38ed88d1 ("mm/slab: enable slab allocation tagging for kmalloc=
 and friends")
> Fixes: ea7b8933f21b ("mempool: hook up to memory allocation profiling")
> Fixes: 576477564ede ("mm: vmalloc: enable memory allocation profiling")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
> Closes: https://lore.kernel.org/all/20240325123603.1bdd6588@canb.auug.org=
.au/
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: linux-doc@vger.kernel.org
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Kent Overstreet <kent.overstreet@linux.dev>
> Cc: Suren Baghdasaryan <surenb@google.com>

Tried it out and didn't see the warnings anymore. Thanks Randy!

Tested-by: Suren Baghdasaryan <surenb@google.com>

> ---
> a. Suren, Kent, feel free to correct my comments on memory profiling.
> I haven't read the documentation in a few weeks.
>
> b. There are some instances of the kernel-doc function name including
> "_noprof". Suren is correcting those cases so that all _noprof warnings
> will be resolved.
>
>  scripts/kernel-doc |    1 +
>  1 file changed, 1 insertion(+)
>
> diff -- a/scripts/kernel-doc b/scripts/kernel-doc
> --- a/scripts/kernel-doc
> +++ b/scripts/kernel-doc
> @@ -1723,6 +1723,7 @@ sub dump_function($$) {
>      $prototype =3D~ s/__must_check +//;
>      $prototype =3D~ s/__weak +//;
>      $prototype =3D~ s/__sched +//;
> +    $prototype =3D~ s/_noprof//;
>      $prototype =3D~ s/__printf\s*\(\s*\d*\s*,\s*\d*\s*\) +//;
>      $prototype =3D~ s/__(?:re)?alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\)=
 +//;
>      $prototype =3D~ s/__diagnose_as\s*\(\s*\S+\s*(?:,\s*\d+\s*)*\) +//;
