Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D642823EA9D
	for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 11:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763378583; cv=none; b=S5BoTdTsriLIAP6qHjjKtUFkx3+KtXbh7nJ08QSUc5ysOJdEejGkcAFw57/P3gJ8I8/wmQPwrhYwHyGWM3r7qSZHK5+Y6uEsjDiOglJQfh6SrT6yrZxU8512SLzHiiasCHi4/hxsuyoAZARCGhGEmppHqGqi0Pl46z2T5es5cDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763378583; c=relaxed/simple;
	bh=Bh2Ifga+AdDZUMyP0EbB5NBn7C7TkJVK77CbBRzldfc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=u3hheaPryd9Y2VCSmOl5XF1Ni2dX/onEmOoR2hdIULoPjZ+LLwRKwGMir8/BJ/7Ne1AlYCDGMVflWsezT5B1LvZCHpNEGBA+Ea//cDQKGrqj/gzR0z9cdagIJD57KQmH6LOJI2Kr5Y+0uzU7nh42LxBDQY+agTOh/0Gs33XaTJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dNLoPj/c; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dNLoPj/c"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-29806bd4776so5598865ad.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 03:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763378581; x=1763983381; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bh2Ifga+AdDZUMyP0EbB5NBn7C7TkJVK77CbBRzldfc=;
        b=dNLoPj/chsEt7oRFcFsemdhE2dvGLDFzmiKKwGw0oiw1/Mi0Oyykodhb2wHENkyRbi
         wKnV/kywjjAINf1fIHMZwp1wDzctLHCzA6riYWoH6goeh/kxmCfrU31yjSki9cj9cAgd
         lIqvNeZPEtZtrPB/co4s2yW7Zz1ev+HAw2RVp8GNUBRMGlfV+wA/P3/KBm3/4wDtTJIb
         cfX1bXx2NM+cChgXgZF1CuNqvj6+pc5OeZSaGcySNvJ6UrPWEHiGMapBGJ/xnpEBIxN3
         hkWjOD+g4mPfVP7Q950p+pmdkFAQQ88xG2TIZ2orB/5NicWzyuTUmvnV19iAPgKZ6o5q
         KmLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763378581; x=1763983381;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bh2Ifga+AdDZUMyP0EbB5NBn7C7TkJVK77CbBRzldfc=;
        b=wfuHaD744FK8c6vzn+gPSreGZL0qrJgj6tYJqpdHdijcO3nMo0zKcPuCV0Kz4xOd5V
         WsqgL3quMrMZgDEC2k35r+0ja7d806P3GR68ObGgnFFJomQ25cWxfHZmmhrpdRqAiS0V
         iG8fTYmLKqJpqnqZqKSgmAfTq2vxXBD6Zk1RlauTXs8gQTk2ZM83uDTFVQnWVQsTDoC5
         TpusxB5zl7grcGEvV/w3Ua7z1WJBq1E93XGK6FShXGID2OuGXrK713pQawdEz0oEpVep
         EgKt3YzMc/FNc5zH2yisigM3V40mbV+ExRCYHPajgxlLN928ln3tpnRTUQNOkjZkrwTJ
         gcVQ==
X-Gm-Message-State: AOJu0Yxw+QpU/atJKnkFZYGCFi2jIDgGSU/Hp3OwwSqmaPJezPa3YALk
	Js+k87CHP35LZrL7IAVYSZBpI4ckQC2dMKr/fkNd1D4T3DOe3E346K7yuNTDUh+qsgYn+akDZ4S
	0/GEFMBwEBu8DwQTtVrvZIMXQeZf68wg=
X-Gm-Gg: ASbGncvJtJM9Hflb6vgHX5sbba8NcjiHexrnZ2+2undMJN4GYt5LQ6usN5Ka6mTTsA2
	ABQvvuI6JTdYsJxa2NCTWFjaEt25Cs/dZF1R4TL6XmzuXk4A9TeX23rRjanTsQNv+hr0/hJm82t
	0zEZMtVJC3rinmTqpw/T4ov2HjeKapUNhxevqx5oGbSKwiC7PNp8v0QQPUEtHrbrEH8Slf+W4fr
	EADztrtTrOiZpOQlSkZNZ4OOx/LcjLNYYJ1c2S3eWbGOpiCbA25LxPHmhKUhBDWHWZltyZxa6PJ
	UUW4dPvVhq416ehvg5HaT2dsbS3nC/YRiqXYm7l2+rH8z7qOBrAmjhNwAlyVRfjs2VQk98Og3m4
	+tvV8Ivuns4g=
X-Google-Smtp-Source: AGHT+IEon8qi3nIiW41AtjOXAHWa5s1kDvSgobRhLk7geCIBmPbZKiZHF7sUmdEFSSozK6VyhfxiCekRLtGsgMgwiXw=
X-Received: by 2002:a05:7022:ff4b:b0:11b:65e:f33 with SMTP id
 a92af1059eb24-11b49152d40mr4376344c88.1.1763378581015; Mon, 17 Nov 2025
 03:23:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1763370163.git.mchehab+huawei@kernel.org>
 <CANiq72=79rhJ5Sh+yp2vRSuSLD=nyR2DuQ26hFeBmyszRC3ALA@mail.gmail.com> <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
In-Reply-To: <6sczezthaixabzw5lddhemrx2yivfdf65zfvpew7tpzl3gqire@vjx4rpju5wxc>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 17 Nov 2025 12:22:48 +0100
X-Gm-Features: AWmQ_bleD_hySJlDD44vxewbmcxDrcM6R5j_Dc8d2Va-QFjLD3jo96glDB4SKS0
Message-ID: <CANiq72m3deG_QsH8-AskTR9LcNL=G6E9o2fu+oi9RVXn1PK_+Q@mail.gmail.com>
Subject: Re: [PATCH 0/1] fix rustdoc build detection
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: Linux Doc Mailing List <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 17, 2025 at 11:48=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> Sure, Sphinx (including kernel-doc) build and rust doca build are
> independent. Yet, Makefile "htmldocs" target currently does both.
>
> It could make sense to have a separate target if one want to build
> them both, e.g. something like:

My understanding (Cc'ing Carlos) is that the idea was that `htmldocs`
built the Rust docs if possible.

I don't mind if that is changed etc., but I think it is important to
keep the `rustdoc` target simple and focused: it is a "basic"
operation (which is also used to lint docs too), and way faster than
building the HTML docs, and it doesn't depend on them.

Apologies if I put it perhaps a bit too tersely in my previous message
-- everyone contributing to Rust code is supposed to rely on that
target to test their commits, and needing the whole Sphinx setup would
make the target way worse in practice.

Now, in the future, if we start relying on generating references for
the Rust docs from the C side and things like that (which is my plan,
but it is long term: first item in
https://github.com/Rust-for-Linux/linux/issues/350), we may need to
rethink things a bit (i.e. we may need to run a subset of the kernel
normal docs to build the Rust docs), but even then ideally we should
only introduce the minimal dependency needed.

I hope that clarifies -- thanks!

Cheers,
Miguel
