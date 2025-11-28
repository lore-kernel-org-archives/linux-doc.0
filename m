Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2BF27B336
	for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 14:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764341174; cv=none; b=qZWwA1npGF3xN5W75absCIj+HRfcwwD5+z+/7F289W8PBvbDLPfvbZLbeGaN5ereFawxGuP6+30efe6/XBhym7K40p26E7zrkdzSA7nnwl3mmvlsiWpkUF3POifrA/jOkJmEFd+VMuWTd4TNw8QjBU8BVmSsFcT4+vqfajccJ/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764341174; c=relaxed/simple;
	bh=EPueHezCD9DdBNocz3YP8NNHo9ryLvL5t2N4kq1D6HU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZQI/6CYIHLV6S5fqaEfIcoPRe6yH+C5Xqk0myQ+iVYqOopBTMh8i90L2cyeDpj8+QH04sg10W/CC6MX3cMqKkOb8MmJsND0Lrzv8ky3uz2lHo00DEFTfYlq0uIsR6u05UA+8gIHtfOL1z/CaV2SaYOMu5bvXkIOuAPdOpAb7mFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=RoyGLKq6; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="RoyGLKq6"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-645a13e2b17so3077031a12.2
        for <linux-doc@vger.kernel.org>; Fri, 28 Nov 2025 06:46:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764341168; x=1764945968; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rzpJXWg/7EZ7kz/r44Ue19OxFWvebPpT8DgUeifr4sE=;
        b=RoyGLKq6AieGBTpfvnv7J6SXfA1x925b+UI4UsrTr9l5yG7GcoMxGu4Fq9pLE/AZeC
         ClgXnw5qffDLgyzOEDZvKqr0CPOWXPOFHeWqqoL0JrlS7AqewQD7fQEg0kFTtm3X9c4p
         79OnpPpSLD5tqH31Gpq9UswgrHM2V4tzUlrilVMe6ngJmO7SVdyYpfcKvy07ajvnbLzx
         NNOxnwmPjIFdLETuAPQTMcUFC82/dJEO0v6oZl8GETr+3bKDgYZyWav0g7NxPX16N8tf
         REdkjP6Jcqc04wvN/gy6i8n1GRYC7TT1KqyAoBm+QeMzVv4rYjzSVD2yX4CpfiXp3LQ2
         Lr7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764341168; x=1764945968;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rzpJXWg/7EZ7kz/r44Ue19OxFWvebPpT8DgUeifr4sE=;
        b=KOQYdGz9sbcrRwPCnDWuLVdCeSgU/ainu3Tlc6xNXx3epUlHralKBZ1b8PgsotwbtD
         xyk17bQuZdpf+XQxxsMFVFNsMm7Ikm0geyMvo40DVbRkK7DLmVFYpzrFrDM6V+qfUt9r
         SV3BKOKWAL3gjvv9ytyMXVnO7eUn3vqrHgHVJbicIZeIy18sBrGseHcWuHWE1ofsUaPd
         cujpterXcLkrgTRHO8Ymrd0zr/adJvRQcG2X5G9A1xlHhFfgW4zNg7TTc2Cn1R3VZ7jr
         KJHWcRYBWm1/SAeLj5RP9hsj3qfLrF/YD1CI4YK8oEYj//qqpC+VfmEOr18Zbwx7WqHp
         cZqw==
X-Forwarded-Encrypted: i=1; AJvYcCVeAV7THJq7B7yQl1yYffmWwfArL+TMydM+Yk8idoENAHHhNdjHiCgWjejTQM96Lxzwn2g+WVmp6zU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzmsw73O3fWNlXyjUVw72TyUI9zCdbUZsLUUKyqOa8Z1h0Vyq9J
	F5RNET4TFxeds06tNOOpnjA07FMSEyAM6nXjcktVSLhBdvtLMwvmnXjBdBOUK37yrHEqbcRPddq
	q1S1/ytQxIdagf2k3CVqPrdrUhd1/nDtfNfRmTnWUEA==
X-Gm-Gg: ASbGnctezev15dQhNujyqMyARp6CIGyAk/SGLuPj/BVsKskFy6NzVF9VYLdKv3XLryd
	lNpMAVR8crbonNx6VP4q4hOl8oFFB3i056V171Y+cXGtuqmeVGnajTsXOsY66WFnBKh7eMsmA1A
	JEL8LQwvT9KJjwjO2LhYzPcUaa2JGZF8/FE+A9CzW+vRnkk+2ycz8QmjCw0DdLDeZ8JhS1+jf0Z
	il7fPYSjMtgArrFIFxKCUHxK2mBH4sdWbZ3qoMmld3S6mvOVlP97SrFFFgUDe3cQrtW
X-Google-Smtp-Source: AGHT+IHgUYFkA45X5iw3nKdBgJSn3wfVQGIrA6GgxbU1YgcUng2ArQEf29b2c73Iormmy6RPGidM1Y8tTNQjsER20PA=
X-Received: by 2002:a05:6402:1454:b0:63c:1d4a:afc4 with SMTP id
 4fb4d7f45d1cf-645eb223eb3mr14188918a12.4.1764341167982; Fri, 28 Nov 2025
 06:46:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251126185725.4164769-1-pasha.tatashin@soleen.com> <20251126111924.1533590ce355b92d5306a0ec@linux-foundation.org>
In-Reply-To: <20251126111924.1533590ce355b92d5306a0ec@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 28 Nov 2025 09:45:29 -0500
X-Gm-Features: AWmQ_bnkYfZv4d_-8_xaWUg2pYGGz2TjplK7whofl5-EIG_TDeyakrNta74ZTmQ
Message-ID: <CA+CK2bCUBMgnepMzO21+SH6rY7bb2OgRqxkLkUr33UsrPoe_2A@mail.gmail.com>
Subject: Re: [PATCH v1 0/3] list: add primitives for private list manipulations
To: Andrew Morton <akpm@linux-foundation.org>
Cc: corbet@lwn.net, nicolas.frattaroli@collabora.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kees@kernel.org, 
	davidgow@google.com, pmladek@suse.com, tamird@gmail.com, raemoar63@gmail.com, 
	ebiggers@kernel.org, diego.daniel.professional@gmail.com, rppt@kernel.org, 
	pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 26, 2025 at 2:19=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 26 Nov 2025 13:57:22 -0500 Pasha Tatashin <pasha.tatashin@soleen.=
com> wrote:
>
> > Recently
>
> Well, 2015, in ad315455d396, it seems.
>
> > linux introduced the ability to mark structure members as
> > __private and access them via ACCESS_PRIVATE(). This mechanism ensures
> > that internal implementation details are only accessible by the owning
> > subsystem, enforcing better encapsulation.
>
> Didn't know about this.  It's a thing which requires running sparse
> (which is fine, people run sparse).  It isn't used much at all.
>
> > However, struct list_head is frequently used as an internal linkage
> > mechanism within these private sections. The standard macros in
> > <linux/list.h> (such as list_entry and list_for_each_entry) do not
> > support ACCESS_PRIVATE() natively. Consequently, subsystems using
> > private lists are forced to implement ad-hoc workarounds, verbose
> > casting, or local iterator macros to avoid compiler warnings and access
> > violations.
> >
> > This series introduces <linux/list_private.h>, which provides a set of
> > primitives identical in function to those in <linux/list.h>, but
> > designed specifically for cases where the embedded struct list_head is =
a
> > private member.
> >
> > The series is structured as follows:
> > Core Implementation: Adds the list_private.h header with support for
> > entry retrieval and iteration (forward, reverse, safe, etc.).
> >
> > Testing: Adds a KUnit test suite to verify that the macros compile
> > correctly and handle pointer offsets/qualifiers as expected.
> >
> > Adoption: Updates the liveupdate subsystem to use the new generic API,
> > replacing its local luo_list_for_each_private implementation.
>
> Fair enough.  Let's push this into the next -rc cycle, OK?

Yes, this works.

Thank you,
Pasha
