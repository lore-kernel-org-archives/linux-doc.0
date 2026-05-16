Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A6F93E2AA5
	for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 16:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778949330; cv=none; b=i7hOxGgEvruOt943kP+onUWbLPQSHQM8Uw9FyeFipa9P6Eu8lvuR8SnWR9ZtbEqorWQwowWcOMVVyrUKAvek+RHPLYn0gLrYcBLmGONH+1r68EFoQOxMDp3G/DAEEOsV2l9FhXXXXiN9vhPr8cnYDFs0yQ7AZvn1KsXVGKemk/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778949330; c=relaxed/simple;
	bh=ObeT11Yua0BV4EJOKCJX/brzVfO/DD/aReuB3TectNA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=k6heVIk8uSpGatoYW1gdj0no0woMJJ40E8CssT4KG/wYwbZQc06gfQvqeDmCOTBco6F7LbeNaaSOT1lS+uVEgIGWkAMg8ALvp2SN2wDGHVZg3OS1Q6LyC8qCplWXpyy8XIHv0vIKoW4U+D4OAhRNL9LS5sCzNZEdJFTtx/bgM1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AavyMMsL; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AavyMMsL"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48a3e9862f0so4237835e9.1
        for <linux-doc@vger.kernel.org>; Sat, 16 May 2026 09:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778949327; x=1779554127; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IZeZfDIT56zPfGGUkR4CImZ1hE92727R56H7iAHBklM=;
        b=AavyMMsLjPzrM/9co6HPLUCovA1mkQz+IQ9CLAnbMKZe7Q2OfhEgzIvlefLWV072u5
         caW9LLwa9+dnudCva5YbXi5SwesQeWGefJW0prZC0cDtABDhVubtzwZH/wMFXxilRvzX
         4fZHzmeGvR7v0g/pmsceY5mIVh9mhlx9xbXnJHWzYrOkOplJBwydY0lNzRKhgIY6mmaV
         JeUa+j/3SAqauhuEQnR6n2VoKncRDKlgJqISmO/JWTVVYHy56nKF26XfAVWcjRrtb8aV
         bqmuUgATVXXkm+Gi/EmFL1lMZyzdkpxg6Oo7hHh2urUc+WSg4MBQoGQsV+2PGxa8l4Wh
         Cd8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778949327; x=1779554127;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IZeZfDIT56zPfGGUkR4CImZ1hE92727R56H7iAHBklM=;
        b=UOKM04ZfauUL7eNEKx534db1gTMlcBsXBemi8FCnw5BSxJ4uyU6oCng1GsGwKmnTu6
         YSJV8i603pZjpKt69Ed+avhSPzaRfPpydnXndtgpP1lzQfV4VEzEp1PEcF9/5/+bOfIY
         r6T4DbSjT8AU9qKXxfKUoVGCYA+RVauHS39H0YWPJ1HH02sHWrup7BWRYFCOYy8TI4Ak
         bNYPy5zp9dcgcaDI0jFIQkBrgtu6+Ey+JzlcwdZmexuTQ4wF0oo7oiNxoMuXRMujvCtB
         ERwqW/JAQO6K1uIam0WsEORZk5p7w2owat2pPs+TX3ILMCGXig+Y04XwRdgHcCIhNr/u
         dxrA==
X-Forwarded-Encrypted: i=1; AFNElJ/DU6LOzK6amfdyN9F9I+53yV/hoqYcPp9fv1TzS+ZTLW1UCuS+Qqq7ju9U5SqHkLHVPJ8HeWGHNEw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAnLTzhLVI2EPyfLWZwYLovXDjm29+uNtgwx2UyN1g2kPvUAMo
	Y2Q+yWE/WaGWqS3lgiZ/VNgDv2SRzQu7Jkrh3owAqOULR4/prKNdltCP
X-Gm-Gg: Acq92OENqtprqIsDYLxvxA/1g3VPpXDOULo0gb9TspCGLg/jlvK2I1OSpbS/jYgp9Lg
	nbRo/4D/rGCg+a0HSi3zTU4VQL915KmJ9615N4xKjecm21PFPY9GwGsdHGE7X2ubyZWL+d1iC6s
	B8dLQo7Li0nJu/r4QbBBzN4mENwjXiMAy/G2CyDivdhNYH60eT06EO/zxime6E1qXkOM8EF2eEB
	C4FZwGAspyvGeJ25h2SEFDeQdhLD0oc3kG3lUBbi54FFHR5nb1HYsutqOyyoVE/4oSZtFKH2C61
	PKu3s3asgZoAkD+/NWePJ4/1WP7W8q4sDS1eg31LqQFVHoE01TsGcujMLGyX0/d87DEZ4sYgGfc
	98sxsc5/kk3zftpY7jgsHlNst04u8IPq9M9Ka5q6vUdULv2J2JcjLFXsE5M9XXcfGjOJVdSgJCM
	aG81JyMWQBBW8OWsOwalhPL4u/vLV3H9inpL+IGMMS7rA7TuWIsiWN5sX6FVoFAm+s6SjG5ZY=
X-Received: by 2002:a05:600c:4851:b0:48a:79d8:a8d6 with SMTP id 5b1f17b1804b1-48feea99dc7mr50647655e9.7.1778949326439;
        Sat, 16 May 2026 09:35:26 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48febe79ce3sm41831365e9.31.2026.05.16.09.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 09:35:26 -0700 (PDT)
Date: Sat, 16 May 2026 17:35:24 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Kees Cook <kees@kernel.org>, Manuel Ebner <manuelebner@mailbox.org>,
 Andy Shevchenko <andy.shevchenko@gmail.com>, Jonathan Corbet
 <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Andy Whitcroft
 <apw@canonical.com>, Joe Perches <joe@perches.com>, Dwaipayan Ray
 <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, Geert
 Uytterhoeven <geert@linux-m68k.org>, Randy Dunlap <rdunlap@infradead.org>,
 Jani Nikula <jani.nikula@intel.com>, "open list:DOCUMENTATION PROCESS"
 <workflows@vger.kernel.org>, "open list:DOCUMENTATION"
 <linux-doc@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 1/3] Doc: deprecated.rst: add strlcat()
Message-ID: <20260516173524.498984d0@pumpkin>
In-Reply-To: <20260516152819.14597A76-hca@linux.ibm.com>
References: <20260514160719.105084-3-manuelebner@mailbox.org>
	<20260514162652.107714-2-manuelebner@mailbox.org>
	<202605140931.913048A68B@keescook>
	<20260516152819.14597A76-hca@linux.ibm.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 16 May 2026 17:28:19 +0200
Heiko Carstens <hca@linux.ibm.com> wrote:

> On Thu, May 14, 2026 at 09:31:46AM -0700, Kees Cook wrote:
> > On Thu, May 14, 2026 at 06:26:53PM +0200, Manuel Ebner wrote:  
> > > add strlcat and alternatives
> > > 
> > > Signed-off-by: Manuel Ebner <manuelebner@mailbox.org>
> > > ---
> > >  Documentation/process/deprecated.rst | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > > 
> > > diff --git a/Documentation/process/deprecated.rst b/Documentation/process/deprecated.rst
> > > index fed56864d036..06e802f4bbfd 100644
> > > --- a/Documentation/process/deprecated.rst
> > > +++ b/Documentation/process/deprecated.rst
> > > @@ -153,6 +153,13 @@ used, and the destinations should be marked with the `__nonstring
> > >  attribute to avoid future compiler warnings. For cases still needing
> > >  NUL-padding, strtomem_pad() can be used.
> > >  
> > > +strlcat()
> > > +---------
> > > +strlcat() must re-scan the destination string from the beginning on each
> > > +call (O(n^2) behavior). Alternatives are seq_buf_puts() and seq_buf_printf().
> > > +snprintf(), scnprintf() and sysfs_emit() are possible aswell, but the adoption
> > > +of the arguments needs to be taken care off.
> > > +  
> > 
> > How about just:
> > 
> > strlcat() must re-scan the destination string from the beginning on each
> > call (O(n^2) behavior). Use the seq_buf API or similar instead.  
> 
> seq_buf API for appending something to e.g. boot_command_line seems to be odd,
> since boot_command_line is usually "just there" (depending on architecture and
> boot loader).

Indeed, but ISTR that code uses strcat() a lot of the time.
The lengths are all known, so memcpy() can be used.

I don't really see why strlcat() should be deprecated.
Clearly there are many cases where there are better ways to do things.
The only problem with strlcat() is that it returns the 'required length'.
So there are some broken uses.
- fs/nfs/flexfilelayout/flexfilelayout.c
- lib/kunit/string-stream.c (although the preceding vsnprintf() looks like the actual bug).
There is also some very strange code in security/selinus/ima.c - but it may be ok.

In reality the return value of strlcat() isn't really much worse that that
of snprintf().

-- David

> 
> So if I would remove strlcat() from appending something to boot_command_line I
> would end up open-coding strlcat(), including the chance for the usual
> off-by-one bugs. Looks like this would be true for nearly all architectures.
> 
> Is performance really the only reason to deprecate strlcat()? This seems to be
> a bit questionable to me.

