Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C5CA1E1DE5
	for <linux-doc@vger.kernel.org>; Fri, 19 Dec 2025 06:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766127248; cv=none; b=FdXt7VqtgWcKP6jI92db4Oo4PkocyQRD5i0PgGRwFmKBRhX6p9Y5MzgpDxqufNBTKPjubUHVmgHmnXO5JHLtb0qbgyuAjA0V7Hr5HR9g/7V+me5+hdx2defxcqHjt4TBR62e7LibDcV56Xbk8eH/WB9BgDlCN/Co2AXCaez2H+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766127248; c=relaxed/simple;
	bh=OhXDT/gdHwYNhVmM3aPEZp+jo4HhjFTIZFLPnMw3sLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRIcwsBmORtc9+3u/9fFw+4u0Ui3Um4HsAyScYNbz2wyJkN7J6BLSfHMY6ahRKY8LTDccveoci67FdhYCi0rRgloOyX9k8sinPmXQySbBu9TnKQ8x4xiNUJ98eTUOVXecPVFSBAV2D4v7w4lOwzWWBt4ao8CgQ7J6OOm2yaCRWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=KJ/rjuzS; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="KJ/rjuzS"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-64b4f730a02so2093965a12.0
        for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 22:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1766127245; x=1766732045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9xPgikAmC9i7Nsw/6vUb2OZB8xX6nsoxbg7H2rqfFGg=;
        b=KJ/rjuzSPAL1LbeVazvBc7QuSPfF1ExC8inscYTYJNe43oaLeVZxj9CN5ZYY45xZ43
         bbXlQtpIaXL7zJWUDuKCSmcg8ARJ12ZA4ijNgp5sNDCHqRr4mj6Dl0VuEvfl/C6IO1Yy
         SNC7uEiulGeidSUiVQ8GiXwj4st2e3+NTz7zP9YfN39Ilw9BSWMHkGaHxt+VPQmOyn9v
         yaMOcNEVZKiR8l0nvnvxjv4zCu1fqghz0KtYnc5/5cohDWZwRmDI/KDs0+L73NGu3fG/
         17BEfspj9FOkEY8aOfETVIDvM9FcgZU3gUlv1/SpkpP2PAqBkB+Ud8URmQNIBvW99V1S
         tfHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766127245; x=1766732045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9xPgikAmC9i7Nsw/6vUb2OZB8xX6nsoxbg7H2rqfFGg=;
        b=bgRIFMJzutB7mn1q42pk0q3gVfMVzHPmiuBZE7tegC/6sfrQZsKyhW5NAEN4NLIEi4
         2Yyle9eMchHkxPJ0/lnTeNP8sNBcdfkO0Lz4YJjaKEvanSrOIIT0icY920XAi/239nhr
         WxAg9FqJY2Sty/G1YaCcb7a00xcdati6OHHQw8qSIwRwIwNwEodfc6JV43r16X/356Un
         lmNSE83RbXWzwesjChp0yOIzs3sdG43NTyJEUAhaiO0yUqBuu2QGJblGgi8t3R35n0dk
         sntxR1sxGY92AP85OfB8EVrZR+Rc+U8LMCpddzQ/POmkgIb7WYRuJyoC2Zkz7VlCn9Xj
         iyuA==
X-Forwarded-Encrypted: i=1; AJvYcCXaAkjyVIlJI7ok4E91jJOwOgxJsB40AwOIIr9t5Fi4g4Z/jXz/OCDWpJFbiSBi6Ddj15hTeWNCQwQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFiGG3+FzKKc++S5dCokwsOy6VS58b51odoEYXt0ierP9SVSRR
	j+fQ3HimT8X7z1KskB/MDeyqqcGM0hlXfZ+5cOZxOht8880rkYFghA+fEBQ+XLycJ+uLWXWYk6f
	xhbHZNqfScNyGCJSQ+lZMV9jMc9+3WrbG4fQj8xhQaw==
X-Gm-Gg: AY/fxX46wAMzPSSKvuOVeoe3z8XY1o7V/a0bK133UbRjf5PuL4wmZe0QJqK0NYBIC4s
	YIRNapRFeZoKF8uVIqfqJZ7166UO64hlECxeKwbHuBm+jwgecWnrf3vcHwyatehbJ/76PFdKjkZ
	BSD3qYdyqk2sFgwRPH0qtIMqKXMA8litt5cXvhjrovjIPf+5gsEC9wEzFJZTzvxeh/Cd3+cW02h
	gQ7ibrUjguYtCUL0SP3IGwvcvVlbL8klpDqOquwSfeDtd2LSCYovh1bhOHrXpCGPyJZV0S8u+VF
	xl1Bt0jDFzW+kCaqLMiBAmAJ
X-Google-Smtp-Source: AGHT+IHrr7hQ3L9AzJHAIVCcMTLwAuIUALeFI8OkI6T6XMYbQqiUt4uWpGU71bncz0pI6DpLPHJmKO73H1onEQqgyIs=
X-Received: by 2002:a05:6402:1474:b0:64b:588b:4375 with SMTP id
 4fb4d7f45d1cf-64b8eb62574mr1699136a12.2.1766127244662; Thu, 18 Dec 2025
 22:54:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251218155752.3045808-1-pasha.tatashin@soleen.com>
 <20251218130725.1b93a521c039ce121de62472@linux-foundation.org> <aUT0sJsDWZHGT-Q9@kernel.org>
In-Reply-To: <aUT0sJsDWZHGT-Q9@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 19 Dec 2025 15:53:28 +0900
X-Gm-Features: AQt7F2qsC_Dg8UikLympbtL4IhWS-dbiSuY-RHAMjIQpkrLWg8l_6viyY9c8OTc
Message-ID: <CA+CK2bDGzUrh6-hJMtZZ3rWLmvQYKa=WnXrwHK_tZEWgP1=n3w@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] list private v2 & luo flb v9
To: Mike Rapoport <rppt@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, pratyush@kernel.org, dmatlack@google.com, 
	skhawaja@google.com, rientjes@google.com, corbet@lwn.net, kees@kernel.org, 
	davidgow@google.com, pmladek@suse.com, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, tamird@gmail.com, raemoar63@gmail.com, 
	graf@amazon.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 19, 2025 at 3:46=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, Dec 18, 2025 at 01:07:25PM -0800, Andrew Morton wrote:
> > On Thu, 18 Dec 2025 10:57:47 -0500 Pasha Tatashin <pasha.tatashin@solee=
n.com> wrote:
> >
> > > This series includes two separate workstreams. This is because FLB
> > > should be applied on top of list_private, as it uses some of its
> > > interfaces.
> > >
> > > 1. List private v2 (first 3 patches) Previous version:
> > > https://lore.kernel.org/all/20251126185725.4164769-1-pasha.tatashin@s=
oleen.com
> > > For details, please read the cover letter from the previous submissio=
n.
> > >
> > > v2 Changelog:
> > > - Added a Reviewed-by from David Gow.
> > >
> > > 2. LUO FLB v9 (last 2 patches) Previous version:
> > > https://lore.kernel.org/all/20251125225006.3722394-2-pasha.tatashin@s=
oleen.com
> >
> > Please, no.
> >
> > This patch series is intended for the Linux kernel.  Your grandchildren
> > will read the above wondering "what did granddad do".  It's just lazy
> > for us to expect readers to have to chase down links to earlier
> > versions and then to figure out what changed and why we changed it,
> > etc, etc.
> >
> > Let's give our audience a nice, self-contained and complete description
> > of the proposed changes which doesn't refer them to the minute details
> > of the ongoing development process.  A process which is utterly
> > uninteresting three years from now.
> >
> > IOW, can we please have a complete and standalone description of *this
> > patchset* which doesn't refer to earlier obsolete stuff?
>
> And I would even say this should be two patchsets, one with private list
> and the other one with FLB.

They are not bundled, I sent them together only because FLB was
already in Andrew's tree, but it should be placed after private list
(since private list patch series deletes the LUO private list iterator
macro), now they are properly placed, and the private list can be
merged before FLB.

Pasha

>
> > Thanks.
>
> --
> Sincerely yours,
> Mike.
