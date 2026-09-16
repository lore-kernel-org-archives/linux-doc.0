Received: from mail-lf2-f12.google.com (mail-lf2-f12.google.com [74.125.229.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C443C5DD4
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 12:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789562171; cv=pass; b=bXN1KzPc/r+o7MgdVbKUh7Vry/WabpCgP2ARQYO0snbRCY8qM/VMoEhzoGzH4GkqE6I7Njnp0D7aymoJkTusK/ZXxLftS+MUtg8bNSYQvnhSooq6BJc8Pl8VeDDne8gjvDMZ+pCYpmE0tmqnk/FVEOjJofArpseMqVy04JkEReU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789562171; c=relaxed/simple;
	bh=EkPSDn9jd/yWEOkHprjnC6pP9cAsRcLITUJq3MRdC+U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iJYMjEEu1X05wDuM/QyLkomWAMWD7i2PzSMsjhfOE9+IES8VLGNv5RM2Dy02/3dV/oovN31Q4WRAYX5zig8hy2/1KjJlbMJ/x3jI/zKEcSemcSTH1HdW05TEZAsUJO1B9wIHsSRUjQJIAtGqSPg2FQeYPNL0QZVnPqWSBu368J8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hNonF1L6; arc=pass smtp.client-ip=74.125.229.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hNonF1L6"
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b5e4f17450so778772e87.0
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 05:36:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789562167; cv=none;
        d=google.com; s=arc-20260327;
        b=Mu1uWFKrdrMVOgrOyFwhq08hBk1zlNJz1ROfEB1CfWnG5AaWsRL6eJEyNrGlmJdHS4
         OFA49xGMRV57QS/klc5QpodZmWTkHbzTJLii3/aoyhUB/9bqVIwgohfidvOsfPbKr1/q
         ZvRMldeCt040JOHmfpbgKiLVKgwzyIImIRmum3rPOCyvAKn1iWA0dr1oZKRXQ5nAriR4
         KrEQejkkh6y/NJ9y707DdoYzVHv6BugvzhUtmjVPiV27xAy/MXvNYboFSmrKYC+DJzKV
         iUcV68847/SV1f7WGC5zJyxz8L33rmtad6lhSTEiqLCOgNc8VYZ2cBig/jsaGjAsAyQQ
         SFug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=e6oT51yMAATq5cQH/uMjMK+VEIygNMf4a8wT3p167n4=;
        fh=znxc4CohIVWFWyZVXSt1roFrgkhHbyhbph3VWDz9Hbo=;
        b=kKJ2qgxDV4aXsfeSfd+cSlDYY/xa+1LxNZ2IpqEqLQoI0W6vBgKAY0X9VJTkLOtl8B
         TFCNtXZkKB6QfE0vyLtoqu8zLl1Np8KfQU5Wl+ch44CILp6HTAFSuWlDD7B/4cESqQBx
         u1tgCymbzabiWM1fJJAEYmAkGbydmuYRlhcLUNJAUpevYFM++P9cXFMK0QboVS3UttO/
         CdIJj+4f1Gi9WUjjgAvvLRmG1VLr9zffPUZ9Af1tACWJfiOYgfUoEZvMjCEdYKcjrXHy
         8IJd60+FN7EHmlBkOeIkono7M2Cp9Escy8xkrBZaEUHc3DndElUrMZmqX3y692N1Cso5
         EqGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789562167; x=1790166967; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=e6oT51yMAATq5cQH/uMjMK+VEIygNMf4a8wT3p167n4=;
        b=hNonF1L6bmNbIKw0cJAopzonK4uEDdAGLjgPs+grZo8ceYZI4lGaXtZ8hF6IZIo7Za
         xaVCnwu2tkDJ5SAUxmrJqK1Qj7uKYM5fuiTwnQYthEz4xrvci7+RHqb8ONI8HmvwGZ0+
         YJQW5YbGKnU+g+s1j0weWeu95ADw5ub1sv6FXl21wGO2ek8AyxToJARvQjEeoeaAd1PI
         IJCInkLVnOIe/oaRv5g/2OrLiFF7epynah5y9GFb1jKDChqoVpo4L41RUFIjzPXK5OyY
         cnEqfxyfL9AMkkpyDHZJIinpQJTygDukVbovJZpO1vFBpeuHp2EmbsO3BNRg5IXjDUOu
         Hg8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789562167; x=1790166967;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e6oT51yMAATq5cQH/uMjMK+VEIygNMf4a8wT3p167n4=;
        b=NRySMoV2CNTLTIpWX7R13fhXjZExqEmUeqUVUlTK5DaPDyZsaEm3++ZCAAcDdPbc+f
         Z2pfV9fPca0hlY7dkEpybQJbEx5bltSIBgDKF4+oNj6eRULF6Welcz2PX3bkAIFhzJEd
         ZnSEYgqUSTKmELgpahWuIRvMrhu16h1uyRJFGroVGbfx7/2QZUc+3l+hQmoow/gX9Qr6
         ebOA8toN0De07Yd4gTCxSKO/ptbrNmR4xkHyuD8UqYw1BPz/aw9Yrip4sT/5wOQ/6gVx
         8dVZ+3rP5bbNJ7Mz5emK0krUVhvCGfEJ14RICmyi2DWUJL6OMau8k1KA6z1XcSca+MjP
         9UYg==
X-Forwarded-Encrypted: i=1; AKwUvBy1IRNnI1M1UyJB6XJflf1O1aCv8nUV85QJPvsfLws46RZ8z710LkEG8El6hfdSm5MeYqZbsHUKXdg=@vger.kernel.org
X-Gm-Message-State: AFuF++li/E0UitjuClY8cgu7QRXkL288ibNiVecLLo5hx2yJaFOUMldQ
	oFkXooDAP2khVIhlNpmCL2bSmH8sclomhq7FW2mww51d5kiTSkHJXse9yMrem+MJMKCwmvWkOz8
	NVvnu/X+YzB2O44dG0uHWlBkHzVsPXWlhh0DAM+g=
X-Gm-Gg: AYBFou22gh5Vg52313ZVcqBG/1kRXiCawVgt5GTk+M0xMyfndEDn+OejHw302aYEln5
	DZgiJ+M8SDHhLPTxaswS0l8MpY9QrLpxBaGeNTxiOSBjdIl7CvjOLMsY7d18J6lUNbRkWfzrdit
	fD7m5N1TEc8h0ZU6ePCuNUAK9yy25WqbZVFNgkHcPzjFYFWJBNWWldZFv86eWmcVYmrzHgQRUuc
	iR4VkDHMZqeRs4rumsDG6+7pdPnjIuGOLcMmqZlsLpvPvvd0F3N8g2i/+TyNTBdKG3Xz8mVjemQ
	w1s6fI0ZvY9lW4ggMhiIKYXTc/lRu1AgMr0Ya+BQx25gNqaphgIpiXOyq1nCDfrFbou75TzCFg8
	uXIeQCD1xyOJ/ybVK4lYhGcS/OG90WG9MEFvkgmNmTSnOXYVNAfx5DCoIzshOIsDWo8dgClcnla
	0Rej8=
X-Received: by 2002:a05:6512:10d2:b0:5ae:bd4d:852 with SMTP id
 2adb3069b0e04-5b8b660a965mr733355e87.5.1789562166791; Wed, 16 Sep 2026
 05:36:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260916022619.53555-1-vinicius.m1821@gmail.com>
In-Reply-To: <20260916022619.53555-1-vinicius.m1821@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Wed, 16 Sep 2026 09:35:53 -0300
X-Gm-Features: AcwNN1Urdvdi6XjXIpOZKn0mk_6FVmTJ6U3R6snClOkjNzm_611x_XnsQyKKFBk
Message-ID: <CAMAsx6fBR=RwaB+w7pp2qhm9iWmS==4n4b9XmjFumip3DRsCNg@mail.gmail.com>
Subject: Re: [PATCH] docs: translations: pt_BR: threat_model.rst
To: vinihsr <vinicius.m1821@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em ter., 15 de set. de 2026 =C3=A0s 23:26, vinihsr
<vinicius.m1821@gmail.com> escreveu:
>
> Translate genetated-content.rst into Brazilian Portuguese,
> maintaining consistency with original formatting rules.
> And add it to the pt_BR process documentation index.

 Sorry, I'm a bit confused here: the patch itself adds
  Documentation/translations/pt_BR/process/threat-model.rst, but the
  commit message describes generated-content.rst, which is a different
  document. Did the wrong description end up in this commit?

> Assisted-by: Gemini:Gemini 3.1 Pro

Documentation/process/coding-assistants.rst (line 48) asks for the
literal word "LLM" here rather than the model name, in the form
"Assisted-by: LLM [TOOL1] [TOOL2]", where the optional fields are
analysis tools like coccinelle or sparse, so in your case it would
simply be "Assisted-by: LLM".

> +(:doc:`relacionados =C3=A0 seguran=C3=A7a <security-bugs>` vs :doc:`n=C3=
=A3o relacionados =C3=A0
> +seguran=C3=A7a <../admin-guide/reporting-issues>`), e podem complicar a =
aplica=C3=A7=C3=A3o

The second :doc: path does not resolve: it is relative to the document's
directory, so it points at pt_BR/admin-guide/reporting-issues, which
does not exist =E2=80=94 the pt_BR tree only has process/. As that document=
 is
not translated, it has to reach the documentation root, the way
pt_BR/process/security-bugs.rst does on line 362:

  :doc:`n=C3=A3o relacionados =C3=A0 seguran=C3=A7a <../../../admin-guide/r=
eporting-issues>`

The first reference is fine as it is, and it resolves to the pt_BR
translation of security-bugs.

> +  * atividade do processo (o ptrace n=C3=A3o =C3=A9 permitido a outros u=
su=C3=A1rios)
> +  * comunica=C3=A7=C3=A3o entre processos (outros usu=C3=A1rios n=C3=A3o=
 podem observar os dados
> +    trocados por meio de soquetes de dom=C3=ADnio UNIX ou outros mecanis=
mos de IPC).

I would suggest keeping "unix domain sockets" in English here, as
botching-up-ioctls.rst (line 206) already does. This is the only
occurrence of "soquete" in the pt_BR tree.


> +O que n=C3=A3o constitui um bug de seguran=C3=A7a
> +---------------------------------------

The original says "vulnerabilities" here, and the document builds on
that distinction: it contrasts a vulnerability with a regular bug, which
you render as "bug comum". "Bug de seguran=C3=A7a" also shows up on lines
112, 122 and 252, while lines 106 and 207 already use
"vulnerabilidade", and the English never says "security bug" anywhere.

I would suggest using "vulnerabilidade" in all of them:

  Quais classes de problemas n=C3=A3o s=C3=A3o consideradas vulnerabilidade=
s
  ----------------------------------------------------------------

> +  * problemas que afetam drivers expostos sob CONFIG_STAGING, bem como r=
ecursos

[...]

> +  * carregamento de m=C3=B3dulos explicitamente inseguros/quebrados/em f=
ase de teste

Both bullets refer to drivers/staging, and the original uses "staging"
in both, but here it is kept in the first one and translated as "em fase
de teste" in the second, so the link between them is lost. 2.Process.rst
keeps "staging" in Portuguese too (lines 337 and 344), so I would
suggest:

  * carregamento de m=C3=B3dulos explicitamente inseguros/quebrados/staging

> +  * qualquer a=C3=A7=C3=A3o realizada pelo usu=C3=A1rio root no namespac=
e inicial (por exemplo,
> +    erro fatal do kernel - oops - ao gravar em um dispositivo privilegia=
do).

The original just says "kernel oops", and "erro fatal" is not accurate:
an oops is not fatal by default. panic_on_oops defaults to 0, "Try to
continue operation", and this file already renders "panic" as "p=C3=A2nico"
on line 74. I would suggest keeping the term untranslated, the way
changes.rst does:

    um oops do kernel ao gravar em um dispositivo privilegiado).

> +* **Imagens de sistema de arquivos criadas propositalmente**:
> +
> +  * bugs desencadeados pela montagem de uma imagem de sistema de arquivo=
s

This section was restructured rather than translated:

- the heading is "Non-conforming devices and media" in the original,
  which also covers devices and storage media, not only images;
- the introductory paragraph is missing. It carries the rationale for
  the whole section ("Drivers are implemented against a specification...
  the resulting misbehaviour is a regular bug to be fixed, not a
  vulnerability");
- the second bullet ("bugs whose reproduction requires hardware
  modification or emulation...") was moved into the previous section,
  "Fora do uso em produ=C3=A7=C3=A3o", on line 193, and lost "or devices re=
porting
  values outside their documented ranges";
- "mounting a block device is a privileged operation (see above), and
  the administrator is responsible for the media they mount" is gone
  too.

Documentation/translations/index.rst (line 42) says a translation is not
a fork, and that any content addition, removal or update must be applied
to the English documents first. Could you keep this section with the
same structure and content as the original?
