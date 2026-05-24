Received: from mail-oo1-f47.google.com (mail-oo1-f47.google.com [209.85.161.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B861BE555
	for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 17:21:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.161.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779643296; cv=pass; b=MAO0rdjxvCuB0ev26rwQbVarMX1ubAimMgDt4qlqw+cFaXNSKcEoGhXU8PKwsImy9IE1iGLgZl6v+WnW9Icci8Spm1V2p+MORX8Rr5PIIHKxCb4mfOyov+3DmxViZFcA+IyKbo0VZEo2obWh9kFAD71h8tkiWSXG7gp583/LK6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779643296; c=relaxed/simple;
	bh=qIMJkFQlsZxC6omMq9Ez5ahpvwqKYJJwfbcyARW9Ql4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=K1/ckj70Twca4PsDK1Fqgyi6T7czYEFFB2A+vsVO795irjMTolvc2H4ZRDyc98LVG4CaSSYdiOUUgqffROuEWhGsQRw6ETAT+2KhN1WRwgSFF/jnm2sRxINYKd9eRsM60ZzoEA8bdbHNs8bNLEPSrlKbMi4JsLxHto+9NN2ObNU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RCjMI4Uy; arc=pass smtp.client-ip=209.85.161.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RCjMI4Uy"
Received: by mail-oo1-f47.google.com with SMTP id 006d021491bc7-69d6b1ed5e3so1238081eaf.2
        for <linux-doc@vger.kernel.org>; Sun, 24 May 2026 10:21:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779643294; cv=none;
        d=google.com; s=arc-20240605;
        b=ORAIcOAVwcgg8W+p96/MkMqlrr4QPimq20H2PNzeDQAyIx9qmtVlf0gZx/eR8horPZ
         Y08Dg3UHuLVzCow/3V47UcfJGqEn7EgROcfV7aSJ/qaZ969gCxcjG04jnulxKUiPtVFy
         l+/ACN1EA3waCOVAbZQ2uabI6yg0Agh6HkkeSXkp56Jd0XSCmj4trPI6BgDHk5t6PTAW
         KZnDs4q1DQu4rOek0yUPar7a+AJlPzzVSksEpLp8e2WSHC0VC3pgRQf9xdHHayEHOrBI
         Q1PhZKJ+In/2V76uFQNgEwrDmBP99wWjQZU3+CXemQpj5emrLbIZLZHB+MVOfZ9PgMcm
         W0qg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oF9B52t0BIL9XuR8QvUzQV9vgTXM2/aU//KL8coW208=;
        fh=i3Ed/WEN+rpE8+/CbfixAqeyHpxnSml53xtgLwzoMGs=;
        b=RTLAB8kAv9jU8Z2KXofyFWwyMOw4trpHXBtrSee+6MKqtsGIlc5Ifs1uywf94jdsRF
         NZeA68LdJHESoZIgk6JvxB/Hoj0B4opcWlXZ42Hk7qEhoD0MwyKUOGoDZqMbXsgKWdNz
         r/r9PTPsptq6FGImog5wwnoCyO1CuBcO9vLj9WA1VuPseSuMjJXhXX0n20eFo4Lm1lyc
         5dEmxQkcDog/soWzSxQN+GSsMHx4Sqr46p5PLnyu72rgTiovl1YVz3XhxQcqbODoKkWC
         bO9NC4Sf+3m1t4r97DWtXL9HdSeuWHqpu//jCMmKe2MoLGxt/Fj7fnM8kxQvFHwocr0v
         7geg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779643294; x=1780248094; darn=vger.kernel.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oF9B52t0BIL9XuR8QvUzQV9vgTXM2/aU//KL8coW208=;
        b=RCjMI4UyojxMuGRRioX3uT5lIPJCKk4f4ck46uP4AKE4oZ7I7o0L/vPdnD0/1CUfS7
         LlzU46CMLhrYjcvV0cSkYtjgrd7wkekgpyTwXh+3Zlsfk2AaXAVwDNnX8bAS5UB22j2b
         JBhP2qa3dLtGM8JaoL8o/69zvvY2FBpNGmikZ3b+5BHlmO0Ih7amsiKtGymLtRNpnoxB
         9wTgAMpVe8zbLOKnUfF8FP1wewwhDtqnMA7HAAPYwaSj8n8bVuTultbVC61ojjR5ikn8
         HTVQ4UZjxTS9Cs2oZWQNksTHVYTmtnUTvLZl25/s8cvAgZQVv11EnCy6JTqgYdPsc/KC
         1LfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779643294; x=1780248094;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oF9B52t0BIL9XuR8QvUzQV9vgTXM2/aU//KL8coW208=;
        b=ZH6yCNbRKfLyT03KSk6BhiM/JNNDxsQPOpxW6aof+dCoIqQaf2XfIEDpRAvRjfz6h0
         0w2IKF/y0n8gfm6ayg6gOwcUBFtlhI0K5xqckEzajWAPrmnecwXgYT8K4ZQpg4yInCKi
         n2wXHxgpxz/ynNaWz7qyvwCDnvuG7YV/TauBbHT+gXcEw9TIA7moGt39r47ofqwxvA78
         zaXp6kDYWIrVYQEZ6LerZd0SzneIDkWigtMBv72gQjvhULw1WKJsxG8qZJu2F7pgjfm3
         THo84DwLi224WII+gJEvz+qCv44O4VWlc87nz53JfzabaO7ucqRq0hSD+C5y4tQFmwfL
         J2sw==
X-Forwarded-Encrypted: i=1; AFNElJ/JgODvB4+18BY70QL6hiy2TOSQDr2wa/iEz0aWbQ2Kw30w5rzAt+ttgd/urZeCE70TTB5TINvB5X0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+qdEw01VndK2xywdoLbR6PWDUT0sMncbXxaf7fBAAQg12GbMb
	uVft90Q/uKzJ+6Qxtpn90MH2ZR7g9CLr7assYFV1RY6gP2Kxd688+7AXbrnEYIWn0CvLRaEvR55
	cNeKXoREkdQ8xg5y9j+GdK0HxZaq4BE1LcISN
X-Gm-Gg: Acq92OG2+UNz1pquAQgm3j8LSsmP9diV/slusu7lRMQaa7/GJGTvFxpiX9ZQjH8Ts6k
	CwJWQC4u1THprgR7H1OeGOl9eMrpy7M50AsDP+JkSl36M959Zqrf1o0Onl+qeq8lP10WmWqXwn7
	XwmZCQ9rbc3I+XW6UurM1UW4zQfIxxI0uVkVAuZPH+G4WSVknWm562Ljxs/ZUqSvuV2C2bgcky+
	yX2xARkqA0xvEskG8WEbKhq5K/LeIaCrVCaSwxUl9vadmmkyRjrbT+7uSHO70Y3IN3O2r0mueOb
	uqJRmmE/HiOnbdOBJr0giArPydm3XNePlgeB35moW7JbD/Bv3dQ2UEEaBajn/ZZhAf4DhbWLkcU
	6RJ7maZw4
X-Received: by 2002:a05:6820:1519:b0:69d:b4f1:95b6 with SMTP id
 006d021491bc7-69db4f195f5mr572350eaf.10.1779643293512; Sun, 24 May 2026
 10:21:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260519163434.1045462-1-danielmaraboo@gmail.com>
In-Reply-To: <20260519163434.1045462-1-danielmaraboo@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Sun, 24 May 2026 14:21:22 -0300
X-Gm-Features: AVHnY4JjZ0lISFPauJu0P0thb6--D7exXmem-QFRFPldRPJxaddfvqk9xq9TwIo
Message-ID: <CAMAsx6fBZTSvtNcWKKQvWTXZAvh9W3GuA5ZES0RdY6gLwH8n0A@mail.gmail.com>
Subject: Re: [PATCH] docs: pt_BR: Translate process/kernel-docs.rst into Portuguese
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 1:34=E2=80=AFPM Daniel Pereira <danielmaraboo@gmail=
.com> wrote:
>
> Translate Documentation/process/kernel-docs.rst into Portuguese (pt_BR)
> and update the main index.
>
> The content was adapted following the RST formatting rules and the
> appropriate technical terminology for Brazilian Portuguese.
>
> Signed-off-by: Daniel Pereira <danielmaraboo@gmail.com>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/kernel-docs.rst             | 373 ++++++++++++++++++
>  2 files changed, 374 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/kernel-docs.=
rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 77c1a1cdc..76936710b 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst

Hi Jon,

I=E2=80=99m just checking in to see if you had a chance to look at my patch=
,
"docs: pt_BR: Translate process/kernel-docs.rst into Portuguese",
which I sent on May 19.
1

Please let me know if any changes are needed, or if it is already in the qu=
eue.

Thanks,

Daniel Pereira
