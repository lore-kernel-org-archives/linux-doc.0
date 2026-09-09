Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0FD489FDE
	for <linux-doc@vger.kernel.org>; Wed,  9 Sep 2026 22:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788991767; cv=pass; b=uiiwqiXbEg0itT3VcRlIdU1Dct6lEg1c8j3CzSmWNeWEeN0Dyt8Gr7UHC6ghQM0vUG49aDy4JcD76Ma+E4ePqtugobHaskBE02xug/oH2vWbRz2+O+gBdb4CxylZtni6pEOGRZeKfDqD06zboJxx0sklTzHzHCXuXMGALx2OuLM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788991767; c=relaxed/simple;
	bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Suvi9zy8/GujzdpGLLe+5SKPg6s8Do17pJNqUpENOd7e1M9AHjTupmk8Otuk8ouGjV7LkooWL9021cDZOciigLKI1FD2wwlAxkJ/s7Y31GdFcJSpVzsCjapSDHnYbx80PDyYvx1dLrjYORx48xA6j8S3Cpo4CAOEK2Zc3KO3IHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hJnHmHhe; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hJnHmHhe"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso52327895e9.0
        for <linux-doc@vger.kernel.org>; Wed, 09 Sep 2026 15:09:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788991763; cv=none;
        d=google.com; s=arc-20260327;
        b=nWOlXsSMZbwMVizeDKlBlCi8Ks/A+1BrKOiFQaOJ4dgFAFeZd9esswmFK5MJUB/DaE
         /7tARwoqzrBoEc+BBrcdjchRrYFnIC0wUsRKCYIjxQU5sHirvLSaCAA+rKcplDsR7aFY
         K1fxpH3FAym1WiONcSa/e5S0PVN5++f0SYvhlzaYxevjHq/anTUwhd57c7PXcweGdYIa
         Pg68BpgyqRq7tz8BHBPXf/SwoUo+q8qw4/4uk2HxxkdvqicntbBJHDgdaJDxaq+i07bI
         qXA5yJrGG6fsTnDNfAPUrUcQbk+mq6BCecv+8+9W5QNEoDKcjbJ8Qf+z5cTgxDFltO8I
         7/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        fh=BxPkoqfHDXRUa+bMdd/N1vFK2M19CdvnXR/1XDesN3o=;
        b=g8ElBZ7EO3UDT42tmG+efFfJgDrDy8y9Xx0BVlmK10pCfcXL917kgNbRvWDaA8kSyn
         MRflQGxQ4RjrJUh3OB0bG5KHSfCmd+y/93/8RECzq8m7C7Ar+IUzmpWcEvERgKSl8oYG
         iLha5POzKWyIHYFLmQSh+UQNY5YE5WEd+fMXZJmYavSUM2Wwt3FryWtktERiDOvJnj1p
         veXfFNHl9FAQctKJ2wonrd2amn7/k1zpnP8pypUMR6kJYoBwPlfvHKiWJGCDN0Z9eWrO
         JlJJD11WrYrAlsKRELkyvIhoWKkDqnsP83gamXZ4wbA6hJxV7clQjRCeMpUbz6OH9yR/
         anKA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788991763; x=1789596563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=hJnHmHhe+3Z3B/o1b9i3gNkm/aDnbsezDcQyviqY7dy1zsxKPyI3bYCDtR1pjVAytV
         yhiu4H+vtxVlBhhNE1bQlb6f7a48UllOzIPrYLGGCIAN4VhfSbAXPRCETqRmpiSPDTOv
         rWJDZaqFYHjuluIDtrEYzUPixzXiqxS/D9IuWtdGQYfHep7KfZZ14736P7EXNQpqVW08
         pKn1RBFdnG2451tR/nrEy7dEFMergprk0ekp8fLZLbsiP5bXRvyDoJRneG3y2J37tiN7
         kc+HMdzfao1r9BRM3SH3gaRbanbA8Sf7jUGn/rPWRtaAzSNYEBIxyhaqePlgxLqEmC+C
         bNxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788991763; x=1789596563;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bvzxaEfHxbnbItUGjnix/CzOoHNfP6Agb5FNfRpjWL4=;
        b=a5YvnC2njoUyZHlHuYLo8oqlW5vqFeu3nr70c4IFT41VCf1E2mamSPfs/66wM3jb8M
         5M75eBp7RL5AS5B1dwuhLovD0vpGNmg1SlBeZOZ4ykRxUL6qWHd+jybeA5fzv8jq/elw
         rWgz4/8I2dF+HIxvgZcfn7fFg0Lv2hkBB9UeQYEgq3pi1ln5u8Sp+c7xhhKTFXUf+e3E
         HtTIbNFVomCnLElx6y5mK8W/HDRGpw7xnlFNktbUjrlRoeFTzZ9iv6N98H2BHUbYN9fN
         atgmJe9ovCRdOecW8Er2WUnMY9fAg2bdmCh5IOH6cQzxZ5FKtHZlGI5r+VvkBpbhfqgf
         dxKg==
X-Forwarded-Encrypted: i=1; AKwUvBysuvhCaw3WVcuLE8r6nePXZSL8zbhfUDCujZkqBNH0Mev9DW9LXAk+09XOJKyJrbtdBunGpD192OM=@vger.kernel.org
X-Gm-Message-State: AFuF++lJ2qh3FCRKlHih75rPWspDOz8yaZ55sYRWNYT11KdH+hSKW8LG
	CdMmfLzh+ipWCBPtvucMsQ1IGiOBfiMW3PJR7DBkWhYmAjIyEswx14/GokXsAyrihwV7e1b9tE4
	B/9tKgRWs4FcZ1+tyQpAHZ/nSDnBeCmrkFcsVtAnA
X-Gm-Gg: AYBFou3wakHqRGss6rOC16qBUDrL7CYHJmjgd2YfHCGKF8xSmtpLUJOG6//ie5k5Nxz
	/yBkxeT4ViEzR7uWHXi/DccYEWfo8TeV3V+p4cY2j1GUmKs/QozM7EIlSRjwfj5a4d4bEW+GZ5e
	AIH8ZMKvtf/aWo09WDF+JRuweH2ZHUvfkLeKuZQhD9TjSjJEuGIJmsMoHo9odYCg1Bfb94SGg9S
	TEhya12foWRuF5WTYS6g6aIGm2BRivr0nXIoUm6+esve8nEXV/mezi6nVO/F0gWaPVPgdQQbic6
	Z0UC1wIaYkhhx9q2KTZg8NXptYq/99IvxMiVBIhaD85JjZsrwDKo+qoXz4KT7ORVNA47n+vDuWv
	uUVdYej65zIqIvjXpjOTlbI+W7bPQkWvY8flCurseh9YXh7KFSOKcTD9rMrLNPIjhGCq7V58=
X-Received: by 2002:a05:600c:81c8:b0:49d:1f10:8b9f with SMTP id
 5b1f17b1804b1-49d1f109802mr74781425e9.7.1788991761946; Wed, 09 Sep 2026
 15:09:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-build-speedup-v1-0-5dc1ac01672d@kernel.org>
 <CAKwvOdmdFdW8=y+s5NLoNeKz4LVbmW8tr+JqJ26wqYFJDdARFQ@mail.gmail.com> <aqFptJRjLZIL-NX7@gremlin>
In-Reply-To: <aqFptJRjLZIL-NX7@gremlin>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 9 Sep 2026 15:09:10 -0700
X-Gm-Features: AcwNN1VBBOSItlzf2aBfQ1Tsn20Bkz1vl5nUIWxayca3KAiKBTvQ_pPLoFqBSq8
Message-ID: <CAKwvOdnMuwKxPB_SXDcwmrAiwZFXWUAgcS1TdAkW+bqhYEZ=ZQ@mail.gmail.com>
Subject: Re: [PATCH 00/23] kbuild: significantly speed up kernel builds
To: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, 
	Nicolas Schier <nsc@kernel.org>, Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Alexey Gladkov <legion@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Arnd Bergmann <arnd@arndb.de>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>, 
	Ilias Apalodimas <ilias.apalodimas@linaro.org>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, 
	linux-riscv@lists.infradead.org, linux-arch@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-efi@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	Jens Axboe <axboe@kernel.dk>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 9, 2026 at 7:17=E2=80=AFAM Lorenzo Stoakes (ARM) <ljs@kernel.or=
g> wrote:
>
> On Tue, Sep 08, 2026 at 02:06:18PM -0700, Nick Desaulniers wrote:
> > It would be cool if your LLM could generate any visualizations of
> > what's going on during a build? Seeing what's serial vs parallelized
> > in perhaps useful. Particularly when you can compare the before vs
> > after.
>
> Great idea!
>
> I asked it to do exactly that, attached. Came out quite nice and sums it =
up
> nicely :)
>
> It also provided an ASCII version:

unreadable, but the pictures you attached are worth a thousand words.
Particularly exciting are the speed ups to the usual edit+compile+run
loop.

For the blue graph (the top one, first), any idea what that dip in the
middle is? That's always what annoyed me.
--=20
Thanks,
~Nick Desaulniers
