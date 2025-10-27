Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8132B145B16
	for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 08:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761554073; cv=none; b=btOjR3cSB0JJm8fvPIfN3nnR3eSZCCJLpiTEzml8zOVbLMnO/VgWoiI3PH/5uLBgDHTB4gZGxy/AKUSk+D2Mx7hDm7QuXckW8dfZr0vv04uDRDQVJMiSP5bqYKIbs+4iGhBI/N9wv+BBIES+CWvN+m27j8v1vdEJy1LvrBUqBdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761554073; c=relaxed/simple;
	bh=hZTN/tQMYZInh7JvxfdJgJoSNB55wm3j6jMjFgi+HkU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BnhGzAawR0odYiK35e6KMzcGtji2gSG/seS9QMerdD0w6XEDxS+uKApqnBca8puK5NAhmCgKbNgI4B9RnWtnz3hAYY2lGBaYJgP1UL2fwadqMjIhwwImpiTw4Ba4eBMA3Uqr/FfOHB8h2AeTNlIO4O//t8DHDrz/x6w+7mAEOWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kyLYAXnn; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kyLYAXnn"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-b6d6c11f39aso587870766b.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Oct 2025 01:34:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761554070; x=1762158870; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QXqA2AyYDwMAn5NeiBjETLweOL3QhYSqRjqxrljQDYI=;
        b=kyLYAXnni860iyXZipirj1ouWIpiOII1jtdMfjXMlErQ6dOum3GjUR1FmWlO51eCaf
         ooziWpmNBHa6xn87D336Taz6sYkrjM+ClNFD3FNo7aM/VUs1r7c6avi4YIhAVhgYCPEk
         uL+Mk4M1ARpwbIbbYlc1B/sof3Bf3eJ1buTuFf/xsM8AyBXsA3ZiIKmL46OkJpHARTml
         2HAt85RckGpaqPqYaU/Di8gBH8JtTf23CEqF4ZnQeJbtUdIbYsff5Psolv0MCInD2/cG
         NRdFLB9gqa+D9XoHOURy2+xLIVVp5QbP6845dopJzXbFaihzSDEeKmQo6nkMh3SSv4oa
         FRKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761554070; x=1762158870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QXqA2AyYDwMAn5NeiBjETLweOL3QhYSqRjqxrljQDYI=;
        b=r2k+fj8VTa47ACw6gBcdm3JpHT4UwTGMTljaYCFQ3QVzk4cGjNxP4hWCLydI/OHY1w
         GoE7sf+oR36+hCIKGYN2dHdQkrDrWkn80ZzCYdvXq3/0UfHEzNxigDPMtW1If+goo6nl
         jJlgfGb/JR4uFE6wnY8LyB/m9QTo5m3OvP6XA26tPfoB6U6E6+ZooRrlbfOGidGPU643
         Zq/44WSJWP5lfB5BMurBqefnwz7PySUzhjkI18YthsTnSyL71cLfrD/IZjOABQV7k43f
         7ez0vEJMie6ljexjrXpqlb1/0+kieWClGzZCg59ZSZc8bd5vaoP7w5gk4/Ekz5B/wGSJ
         HSlA==
X-Forwarded-Encrypted: i=1; AJvYcCXXRzM5cUgkAZ3QzW5gb0djaIeZMK//rE9cMM/XhajiHZa+G77Qo3+fTx134dlltge1z158qgEEL6s=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDhi1hyD3Aatt7CaaxY9YZBtMtG0/QbrJnWuCrlTePuaHr+lhf
	pqQq20IY9LE/pvy4jaKUkbDhNIpFwx2j2m/I7xZsWw8xzoqUizu951y21hWfu4GCHZyJ3XiMSdd
	w4cLmcrEGMhC4i3u7fHI1O36suVyTcFs=
X-Gm-Gg: ASbGnctHhNuZU7NyIplZUU/9IEWvWy7BO3t5pwYlFYs31SSDq/p6HTPKwiHHbwszI/0
	vIxvpGcjUq3FpOSlq5tOA8COYB3568CpkMU+zzVsSE/QJmO25drK3qTIFBDqEoNLbz103waltxi
	BEigEmyacfLCASy89F7P3ekUrilP9+awXgHzh1JgtPf+2y7aPzCCi7fl6QoAYdXY+D6GATJKDqB
	yy4cuh4bCPjzFAmwtFyYqzZm+b9rzszG7ibR3F5MBgOvK1xURSi3HB3lWHCP8icgQJt3qj9Ma4k
	BCjZaQbI5v7rI4aExtOWqbAUO5YkJA==
X-Google-Smtp-Source: AGHT+IF4Ku7VBi6Rz5YATQmMp4K6m21OtDlsrRJ8R6TX/Zwi0y9zuA5CLxTmowv0xMLnRyevU+7TIZF7WyaAwQdIbqQ=
X-Received: by 2002:a17:906:6a12:b0:b40:b6a9:f70f with SMTP id
 a640c23a62f3a-b6d51aefb9amr1645192766b.4.1761554069622; Mon, 27 Oct 2025
 01:34:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251024-aheev-checkpatch-uninitialized-free-v2-0-16c0900e8130@gmail.com>
 <20251024-aheev-checkpatch-uninitialized-free-v2-2-16c0900e8130@gmail.com>
 <aPvAm1E7CvQfOIuS@stanley.mountain> <81e6af8eea5b0399d1685797d0ea6a6ebc273270.camel@gmail.com>
 <aP8CxkXYAitKB3vx@stanley.mountain>
In-Reply-To: <aP8CxkXYAitKB3vx@stanley.mountain>
From: ally heev <allyheev@gmail.com>
Date: Mon, 27 Oct 2025 14:04:18 +0530
X-Gm-Features: AWmQ_blvkJ9ZtBmHKBSTV_q6E3sXqzi4cxX3zWvk57-nTx4mfsifVuvdEYK6e1U
Message-ID: <CAMB6jUGEJeOVKUEpeFosBFA3QsQk3kgdt_e1EAQJi_yqJp7H-A@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] add check for pointers with __free attribute
 initialized to NULL
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Joe Perches <joe@perches.com>, Jonathan Corbet <corbet@lwn.net>, Andy Whitcroft <apw@canonical.com>, 
	workflows@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, David Hunter <david.hunter.linux@gmail.com>, 
	Shuah Khan <skhan@linuxfoundation.org>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, linux-pm <linux-pm@vger.kernel.org>, 
	dan.j.williams@intel.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 27, 2025 at 10:57=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
> > General question about the process for my understanding:
> > Is checkpatch run on full tree by CI or someone and results reported
> > regularly ?
>
> Newbies run it regularly.  Otherwise it gets run on subsystem CIs and
> the zero-day bot runs it on new patches but it will report the old
> warnings as well under the "Old warnings" section.
>
> > My understanding was that we would run it only on patches
> > before submitting them Or we just run it on full tree before adding
> > new checks to understand if they are catching real issues
>
> Eventually someone will look at all the warnings.  And probably it's
> going to be a newbie and so we need to be careful with warning where
> newbies might introduce bugs with their changes.
>
> regards,
> dan carpenter
>
Makes sense. Thanks!!
---
aheev
