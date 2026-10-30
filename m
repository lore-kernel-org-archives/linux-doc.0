Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793355209;
	b=CeW8zblv3g25VxtiyPyi6LsW9St1qHFPasiHZwFdwnn5hnpbkAjz8iZ8WA4QUaCfphhk
	 2FsVc5Iv/fpn81JAY+dHVyqaNewSV8gWYw9VwAjcEaBQo2ijtLbCHgp4XwW7rLOUa2ZEr
	 pMaJ4hkSx1777fYc8lPET1oA/IGl1w+BMWZr3eUdjfIzdAuL4W20KmKY+hC1TNkZmrdnZ
	 mhyOsb1ZYLeKnkDe8Y0Dgmsfk4COzWSo/1cKZyj5ryZ8TeX19hNNhzquhtxWsIg0nE4Dz
	 ZOFY+d5Q8neEIRFMWnH/jZvY89YuKw69Gyg0KvtA3VIjo5gN88EGNmpWRmZh7DCA4zw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793355209;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=O0rp/2ctYtAz5V4l4tmKFoGrP6ExbbPlGpEkX5p3g2U=;
	b=uY91GG3WHsKQCOJuJhw45lNud1JEbNsJ+TwksxVWkSjC85xbykr39btKWRRJMuTQsfYJ
	 GhKbTGNjbb4CjJ4NWH+GNdpCEdJnz8lWcYYXFEhOI9X7TJ4qV9TWeVQIYcZYgPmYT9FGR
	 HnjE7azTr1mGWHrDOTNpd+Pj3DKkvTYdMjVwB7L/o74w+W+XE+HiOmIPEMNZgv+Q0NjHY
	 oxVmu0zvBL48AVWL67VcuAqW5SzpwK8zbA4LxaQYE7ppsXkCSENmD2qgBG/GZa0OGFqoW
	 ls5+Hp2FU+x/kPsu5us8/5F+vG5NRQFtwNHVwEy5Zx2ygOUEanzEPDx6oVVpc96GwhQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3h9DkOI;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69514606A31E
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 10:13:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 69514606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=I3h9DkOI
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a210470b49so3445465e9.2
        for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 03:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793355208; x=1793960008; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=O0rp/2ctYtAz5V4l4tmKFoGrP6ExbbPlGpEkX5p3g2U=;
        b=I3h9DkOIpQJfiLOJkWzU+F+nPPRWSkcb4dbv9kO6K07IIVFYsKxGLBPLOqWTMuykEn
         VKDTCbqKgutj4HKN5yEW46u6stV2GNB6iiHZEHO7E+flswLc9KJKu8DXDL+rfs/DapUf
         2XcMWn40rVgoIOd/hjL5MmxSr9pUSIS1AmE1i1IRDRtnnGiFhiRwiTQQt2BioISqbPOJ
         Hf4LRtKKXm0QHr1WLLFC+Ipj+mLyjBv4YXUEHPHSHKiSVolTgTLyM440W2IYv3VeTo1K
         SfHz7uZ3RLIGapJidF3e4/0IodvjQjvRAvHhTbJa+WNZ03WefM9L5amBDUVsUWXoMCJa
         FgVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793355208; x=1793960008;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=O0rp/2ctYtAz5V4l4tmKFoGrP6ExbbPlGpEkX5p3g2U=;
        b=ycP0ooAJdFKJz/SPIjjRhR4v9sRzXqizRVTqYZaoZKK98eIBk6gVDqxQUmDZfikGL+
         VqkSqEaQ6nhJwY5J2VFvjo9coUwEynN+WMBj/oAp9z54kWSUUPftWbSEnsVjylfspums
         5I4Zy6IK6znJNiRz31BBGzuq3467jIrZac4NjLWXbPZlK2MFgM4MDNsLZNfpibdz/uxj
         qyIFYRjHt8zqXBrXclA3Psyz0Ju7aNZridcvlWDKyNa/rGXqrVTSQGWozFwtg1WKULkr
         huR1iGQ8ydB3xj89E3qO40pdiojg3luqfeDWHB3UwwjK6cC579WU6JxqZPYjxbUxpMaJ
         wlqg==
X-Forwarded-Encrypted: i=1; AKwUvBwLR0YZc8/JhEGQoaq4+R/NLSJc1KZ1ddRWmLX9bHW/luhuZkVAlEjEKd3yhGLQaSaiM9m46/9Y+Eg=@vger.kernel.org
X-Gm-Message-State: AFq9FYLN9gQ1xZmLwfsIhgLNgENNm5cNp2E6ghidqo1QWViuN9Uxa9VO
	h6yOOg8npDlsTgDPDjuM1CT6IMMOMbUNnqZh03JjhrB3MvqVz11Ph9Lo
X-Gm-Gg: AYBFou13txXeRN1VCJStk3zHk5895LF4gVLpBzfYpt3UyQlM8EPULNUcPG4REAiZa3u
	C0a5x721PPzK1gGGwOSYYl//NuDZlXjptrSue8WtV61hMOYMq4Y8kpfD6oUlLJO1f3jUDegOdCQ
	3Iv6UH8jbpWls1Trzir8zy5aKKrG5a3M59joiE5zONS3JS5l+Dw0lyfOSKmrdP4wSSCWaZ1OqHK
	2XTGpoVQaDXzt7NQkpt5cOUZkZ9PGC/XBm0NlrIOJnv9iwjPj+1Q1lr7TpqJZd2SPLqg9WKcGyg
	2LW/FaolssQhTM5Ye6JBm+DeiS08xSsmGhAdestCBacdbjnbDpaYNUJ3DyLkVBK/Dlr3TOMVtGw
	y4J2gq4iJ+gXHSZ8bBchl8avXW+23erLh97Vmlj3Klcu8NkPGWNoonyQSFh6viMwW3qgAFIelbF
	MCzXSKkn1AwWEdxafNyWAn6ymK4F89J6ZXH1Xj3KysHg0gfs0cGC73iR05VK55PqRMptgJoUaIA
	yPq4frNyKG2jbJa2CDCE3vowvzpfut5BRX2Qimo6v+aMLSvcjL6FNl9TidMhHp1Fspme4pp7D9u
	aijEvRyENfkYd9oaEKCQS+ulL9NkTLgNVnX+OGyMnoVF8OlIVcMMnkkmxpXqWWjWZXE6pGAbIDV
	gPjApoWQKewY=
X-Received: by 2002:a05:600c:8b06:b0:4a2:d:5ccc with SMTP id 5b1f17b1804b1-4ac17b2bc63mr39008955e9.10.1793355207707;
        Fri, 30 Oct 2026 03:13:27 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa81a896ecsm133317305e9.9.2026.10.30.03.13.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 03:13:27 -0700 (PDT)
Date: Fri, 30 Oct 2026 10:13:25 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Andrii Nakryiko <andrii.nakryiko@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap
 <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii
 Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, Ihor
 Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi
 <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu
 <song@kernel.org>, Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa
 <jolsa@kernel.org>, Emil Tsalapatis <emil@etsalapatis.com>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v2 1/6] kallsyms: Add KALLSYMS_QUERY ioctl to
 /proc/kallsyms
Message-ID: <20261030101325.6406e8ce@pumpkin>
In-Reply-To: <CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
References: <20261023001603.560210-8-wusamuel@google.com>
	<20261023001603.560210-9-wusamuel@google.com>
	<20261028134012.01d52e94@pumpkin>
	<CAG2KctpGPHo-S3AEvBhK5HPUnDHfoJu6Z-r+cS1hQ4Ps=B3DmQ@mail.gmail.com>
	<CAEf4BzYT4rvKwbOJ6UQ3zcp4wdsSBqRsMz-2=U1DA2RyUA3XSg@mail.gmail.com>
	<CAG2KctrwzWGFRs6CZcSRaFOWx49WbH9LQVQJunWsPD3MOXn_iw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 29 Oct 2026 17:28:01 -0700
Samuel Wu <wusamuel@google.com> wrote:

> On Thu, Oct 29, 2026 at 3:16=E2=80=AFPM Andrii Nakryiko
> <andrii.nakryiko@gmail.com> wrote:
> >
> > On Thu, Oct 29, 2026 at 3:06=E2=80=AFPM Samuel Wu <wusamuel@google.com>=
 wrote: =20
> > >
> > > BY_NAME matches names exactly, like kallsyms_lookup_name(), so they
> > > would be different symbols at different addresses. Please correct me
> > > if I'm missing something here!
> > > =20
> >
> > foo and foo.constprop0 are different functions with different
> > arguments, so I think we should distinguish them. The only special
> > case is .llvm.<hash> because that suffix is added by compiler for LTO
> > and I don't think the function itself is any different from the
> > original =20
>=20
> [...]
>=20
> > I do think it would be good to spend a bit of thought on how to
> > support at least one-by-one pagination from the get go. The same
> > mechanism can then be used by batch version. I.e., think what can we
> > use to provide data back to user which they can use to continue search
> > after the symbol we just returned (at least for fixed set of symbols
> > in vmlinux and modules; we also have dynamic symbols added for [bpf]
> > "module", etc, we should support those as much as possible with the
> > least possible deviation, IMO) =20
>=20
> Let me sit on this a bit and figure out how to distill all of this
> into a clean interface. I'll keep the .llvm.<hash>, pagination, and
> batching in mind for the design.
>=20
> [...]
>=20
> > user code can be easily written by always setting buffer size, even if
> > kallsyms_query is reused. This is the pattern with PROCMAP_QUERY,
> > let's keep it consistent. =20
>=20
> Ack, will have size in the struct for v3.

It just adds code.
If you use the size from the ioctl (which will match the structure
the application passes) then you don't need to do the extra get_user()
just to get the length.
It isn't really hard to have:
	case KALLSYMS_QUERY_v1:
	case KALLSYMS_QUERY:
		return do_kallsys_query(m->private, cmd, (void __user *)arg)
It also saves all the problems of the two values mismatching.

That is why there is a length (and the r/w flags) embedded in the ioctl
cmd value.

David

>=20
> > also, returning actual size even if buffer is too short is a good way
> > for user space to "probe" and increase buffer if necessary. unless it
> > adds tons of complexity, this is a good and flexible UAPI =20
>=20
> Ack.

