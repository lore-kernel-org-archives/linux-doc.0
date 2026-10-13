Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1630722579E
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 02:41:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791859289; cv=pass; b=tIePRcHswN+lgSbv06EKvuyYCr4B72XaXIYZhNF95u68U6bLBs9DZcii/J4jw+ld2vpfTAdb9cj1SOT9EkqTtvUMUA/RkPQM0EngTgde8utOqjAHIUk2cE4Hh5umF+yBpav4ijH3pwvw4/9jvo/Fcn2xQ1fSYu2XmOPgLIYKyh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791859289; c=relaxed/simple;
	bh=mcqwoHb8oDGvr+LfjmCNZColAsqn1zx4J9h+GC0v39U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ElU0q0OTe59XfmQKwhZReJV8vHDFq45+2vHeJ9Rp740fO0Z5lOibPfcv9bJ4SxRLsiuChnqyM/4YMLgkLrVOhd2LI5iS1dx9jO3W+u26nLV9F16tTTu7RbjE2rWC+VcEgeaV0jdzidTwn4MDDpRSmsrKiI1ShFTpKnCup0JToFE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RXV97IQO; arc=pass smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RXV97IQO"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-91b52ba422cso29799526d6.2
        for <linux-doc@vger.kernel.org>; Mon, 12 Oct 2026 19:41:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791859287; cv=none;
        d=google.com; s=arc-20260327;
        b=heBH1yVg4zPpgvOkLoJfC1MrgmYCZGBW4Hc6a/ZamI66T5b4Ws3k4/yaguD7laPSHl
         FARKMLhLbiniSkn3AHt8eLq4C+UHumer1ldrpzOiljpsk417O1chCBaGsY6FeB0hE1vB
         TOXfpM+vU9fMOJVAKy/zqxHVTJKIeftCVEhQdGAPucRt96x574EdtpTVkzHtDMlNmP0d
         mqU7GS7gJntWK+8VPGlt8sc498J4Vno4emE6y1cB/JPkyEgXpi8F82kxURnQN8hgVfMq
         Kbzhvp5ie63ZugMZpoSV7+8UPusqmnmi3VNBn3VQi91T5TpzQTaPju+g6lXkRfD5VHCx
         7U1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OP0XUHO0XhETE3jKD4VmecmYBjn8kgxyTISOGdAJJ00=;
        fh=dyVJKUgSGWWcYZIJLuFzIf4fnjyXnTqZCuechvunmmA=;
        b=b1tUokft43h+jkgJbHp7NcMFiEmtl+cQHElvxGdDHiWAVUOESMzwsfRGS6QlpfXlp8
         oOGE5pE/sNwU6A/cK8IR+kram5xLxOXfsWwRXVwv/vEbuaXLNC1Ej1gSHpzhuodcIkK6
         z9URCUHxSCXOPC9n7KXlL1uGDvI0N24yA/WASVNYE/ra4pkW8OGoNQxE2RVcRLc9DuVv
         bQqDjkNUndIU1C72idUKdiWOlKnHeQ1m5lxDFCM0LsekXzcpdkX6DZZQQO4eYttvuh4T
         oQZCAFzk7cGm9aEGvKXu8NB6G/xIqlLNEhtB9F/LwF7l9dABojce1YXIucWCmyl/tXrY
         lVHg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791859287; x=1792464087; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OP0XUHO0XhETE3jKD4VmecmYBjn8kgxyTISOGdAJJ00=;
        b=RXV97IQO1RVCn7mpe2MZlxLPDzoSIRG8+M/lWhPpbpwiWPfTbWPBzz0jhCgVRyGX1F
         JjYw/FQqzs0Fm8ZI4/XNSnrz4iHp/9PjigzQgbLvxzsHYRnwNM3zw5lTk/10Z1a8jSe6
         VBn7F0xZQAZigO4ZkQ1JMXV1plLH+YZJ4IHZM9ADGeLuk+iiB43lt4XziOyRDvn3TAq/
         rVZvj9JgrrS+s61maqCKuPdvGLbwibVnJ/EJKb5t17+Sf45RxXeiXU0iXpltHAElUZkO
         hH0uc4R3mDrhEoF1rlGpBSeUYQ0Q/5nFeOHw1oMfXEvtvwIgDdey6hPfT1h2yoRe/XO/
         Cpvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791859287; x=1792464087;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OP0XUHO0XhETE3jKD4VmecmYBjn8kgxyTISOGdAJJ00=;
        b=Y0MNF3duS43EwQI/h4x9Ig5VuGBsck4sHoeqGHevdUk0YLSty/HdgP7OZcf4BeqXnc
         UlMASHFZd6AteAMa8NzH1KsG2z6oAf4OS9cIh//tE5USsWheX3hMtQksNM0EmKALmOrD
         OyBJNFZgdRC+ccoFhWt10MLiEsvNkz2/gsBrBHUyJ69vWBHPH8szujdfvuz6Wtc0Tt2y
         hQlKzLC2aIE0h3Pm2CC02fCMqgDPvKnenNCCMo2lOVQA+MDOA2a+yRZnBbqj6jtAphev
         GfFNkXe9AI1HNlmIdLIqU+uTt4nJ5pdXgD5JqBalw2cTzgNfEjKrTT8xkgNzUi/nlBVg
         aaQQ==
X-Forwarded-Encrypted: i=1; AKwUvBy7MTBPDKZ5OA+dnhqQgSE6OMb11TZoxgpSgb29El3RNWR4OCVHhKrlyYpwuoVBQXx8FWLPnsvLuTQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIskj9G3aeSiuhpdhQNxG+1QeEvK/M21qjGWB5kxp85fvHZXa6+
	09CnSddQo6zdbY3cTFFVNZjOGSXNnYRW+AZd7T9MTauZB2VwUo/abQ5bgWwIJHScNIvsA8PZlrb
	+mivQPOLT1nMadkSyBaBYAcsLbaXozsw=
X-Gm-Gg: AYBFou0ZSLAikYSl+yO6xosLABoU7pzh1P3EDSUZDUyOmf+VM9jVCVHdW0vc7dXKimW
	K58awsb2iePspDs4fNSso71l/grCI2WXzsrtjyZdVleOsHcuvsPdyGuPJUgmNE7hVROnJ8zT41B
	GCAapgUMNsgCbcXKvFV66Yd/eGhBLljAI4c+dGcJU4BUp+F3F2MvVN3aSa/0z1BCdU6HSquGlrN
	LK0T+dRMdlgL1eGcxSD/e05eXo+hNbu6uo1FmcZYWDdAu99nC+pPLTwm9F+ARoK/Yb6sfd7oLJA
	Ku2hKpK8TJ7U0ab9s+GnoWU4vJv7tHTUNrRurdGwfbbFm+45seRfOBGn4dpJd5ZtO70kh6/OVra
	XSiC5hg4VXbFyHyooUpaa2/cUoxHNbUs3I63g4zT9zFQi0m1Gib3FPZ+dukO9/24R+19a4g==
X-Received: by 2002:a05:6214:1c45:b0:917:ac4f:f940 with SMTP id
 6a1803df08f44-91b554c2b35mr213008806d6.10.1791859286912; Mon, 12 Oct 2026
 19:41:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013011245.4779-1-ygorotavio.sjc@gmail.com>
In-Reply-To: <20261013011245.4779-1-ygorotavio.sjc@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 12 Oct 2026 23:41:15 -0300
X-Gm-Features: AclHuK_O75gzqvvxMcXM-Q-cX8ChNQmPIYoHNiGA_ffWm4Ywhgb2IEgORttjw0c
Message-ID: <CAMAsx6eGD6JiO_xRrrKDCZATqE_sc4MdRVL_n_ZpRJXgnDFAiw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: translate generated-content.rst
To: Ygor Otavio <ygorotavio.sjc@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ygor,

    Thanks for the patch and for working on this translation!
    The translation captures the intent well, but please see a few
  comments inline:

    > Subject: [PATCH v2] docs: translations: pt_BR: translate
  generated-content.rst

    Please include the subdirectory: "docs: pt_BR: translate
  process/generated-content.rst"

    > And fixed the errors in the commit.

    Changelogs (v1 -> v2) should go below the '---' cutline, not in
  the commit message.
    Also, consider adding: "Update the translation through commit
  <hash> ("<subject>")"

    > Assisted-by:LLM
    >
    > Signed-off-by: Ygor Otavio <ygorotavio.sjc@gmail.com>

    Add a space ("Assisted-by: LLM") and remove the blank line between
  trailers.

    > ---
    > ---

    Note the duplicated '---' line here.

    > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
    > +Diretrizes do Kernel para Conte=C3=BAdo Gerado por Ferramentas
    > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    Please wrap text at 80 columns; 11 lines currently exceed the
  limit (11, 13, 16,
    17, 45, 46, 54, 68, 86, 105, 106).

    > +tempo, o tempo dispon=C3=ADvel de revisores e mantenedores =C3=A9 um
  recurso escasso.

    Avoid repeating "tempo": "Ao mesmo tempo, a disponibilidade de
  revisores..."

    > +grau de confian=C3=A7a entre submetedores e revisores.

    Avoid the calque "submetedor" throughout; use "autor",
  "contribuidor", or "quem submete".

    > +Fora do Escopo
    > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    Match underline length to title length (14 '=3D' instead of 15).
    Also applies to "No Escopo" (9 '=3D') and "Refer=C3=AAncias" (11 '=3D')=
.

    > + - Aux=C3=ADlios de digita=C3=A7=C3=A3o como completar identificador=
es,
  boilerplate

    Add comma ("Aux=C3=ADlios de digita=C3=A7=C3=A3o, como...") and transla=
te
  "common" ("boilerplate comum").

    > +Mesmo quando o uso da sua ferramenta estiver fora do escopo,
  voc=C3=AA
    > +ainda deve sempre considerar se informar ao revisor qual
  ferramenta
    > +voc=C3=AA usou ajudaria na revis=C3=A3o da sua contribui=C3=A7=C3=A3=
o.

    A bit clunky; suggest:
    "Mesmo quando o uso de ferramentas estiver fora do escopo,
  considere sempre
    se informar ao revisor a ferramenta utilizada ajudaria na revis=C3=A3o
  da sua contribui=C3=A7=C3=A3o."

    > +Como em todas as contribui=C3=A7=C3=B5es, cada mantenedor tem a
  discricionariedade de escolher

    Redundant; suggest: "tem a discricionariedade de decidir como
  lidar" or "tem autonomia".

    > + - Pedir ao submetedor que explique em mais detalhes sobre a
  contribui=C3=A7=C3=A3o, para
    > +   que o mantenedor possa se assegurar de que o submetedor
  entende completamente

    Avoid repeating "submetedor" twice, and fix verb regimen:
    "Pedir ao autor que explique a contribui=C3=A7=C3=A3o em mais detalhes.=
.."

    > +espere escrut=C3=ADnio adicional proporcional a quanto dela foi
  gerado.

    Missing article: "proporcional ao quanto dela foi gerado".

    > +Como com a sa=C3=ADda de qualquer ferramenta, o resultado pode estar
  incorreto ou

    Awkward cacophony; suggest: "Assim como ocorre com a sa=C3=ADda de
  qualquer ferramenta,".

    > +Para diretrizes espec=C3=ADficas sobre assistentes de codifica=C3=A7=
=C3=A3o de
    > IA, veja:
    > +
    > +
    > +* Documentation/process/coding-assistants.rst

    Remove the extra blank line before the bullet.

    > +   Diretrizes do Kernel para Conte=C3=BAdo Gerado por Ferramentas
  <generated-content>
    >     Conclave (Continuidade do projeto) <conclave>

    In pt_BR/process/index.rst, please place this right before
  'coding-assistants'
    to match the English index order.

    Looking forward to v3!

    Thanks,
    Daniel
