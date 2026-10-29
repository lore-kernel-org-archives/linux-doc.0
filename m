Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793275351;
	b=mqueut2rsvQtLXpPOQPXHHwV94sDUZacC3CnTtSNmAVO+TkSwQuwaBpLBenPFJFOqq2v
	 tpundDylAb4mNtcvCKiB1JHKenTY7W8iRrlvX91sJw1i6h2JjI+DSMsq8qIcvGHzMnUYF
	 7HxAk+pJzzD3049eWM2jRZdfi/fA586zOQqn5s3eYk9SxpPSrJ/MgA8ib70WDWIZWJlDl
	 tTaqKewkGW9ZkDbJPZFqFUzh/M5vxUuWoa8bVbcDh8DBOrRERKj9ED6PFgwOeCLAHuOyG
	 m5gvIhwipWfKzcYiRJD02e1WPCtYYYMMA+TNyejfxWnFAa0ziuGTOOa2kZJlh1lJV1g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793275351;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
	b=NomK+9/HF4IemaeRsAMB7d/T1+vYvOiijENw5h1oBfRYFTNEbwcxw6I8vuia3Mkzi3yT
	 kF/qBkAkeuEdXOKuVABjdpb6I2Q9LtTRO9tg5YtgpwO3gTL+67u+ijonEdyd3WNh81MhR
	 wfIeM6u7tPY0xFEzjsGiDyDKWdTCOgtnRlbY13yE+VfRUKLyfQ86G/46Ekd02ONj7qiAc
	 LAINWWMxWQ5UkAKc2f54kFl7J9qfJ2C+vNQ8fHh+12PFF5CnGpGx1wxBzYTZwLwmQX9HH
	 KnUYTvy0LoN3yvHVcNIjTYFr6O12Ry+6qecC8h/ZzuhNS0+S1KXYPOdh6Sis3GSfbSg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3+KFVf6;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.219.49
Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36F8E606A31A
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 12:02:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36F8E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=u3+KFVf6
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-91c19fc50abso18741476d6.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 05:02:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793275350; cv=none;
        d=google.com; s=arc-20260327;
        b=gtALF9CVAMO+130XlA5anYFyCbzqxvCDBgN1ZHHz3kfCOl2H0IJO2kUfoaJwoydJBI
         Qz/qF4QDqXFHijA4k1U7SoIBEIaNm9UAfEVe1kPDjZi6/SGL1ReNmEQnmN6RYsjJcd11
         rfso9BLMZEjxamixUaHcQsvUT6w9EkRQQpBVSh7LEvgOYfw7cnNXIf9VH6A156ZnolT1
         dIleSrNiK3PvtXi649RThW4xQcqoBialHO2MbmucXz+xlvCK6vOedIaJ0qW2U4itC5qm
         wZyskT9dACw5R68Ph1Sp0jEkGQjrxIF6DhlmPheeH8XCoBMM2aUliHSXVxq9NfnjT5KY
         18sA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
        fh=WAnsO6AGX9bD+Q65C2mAZ1crlfaaOFHTGKHAU1qlbhQ=;
        b=F1A+sAcxgYXJw7evfYPi+M3clxpf/fVkWKsH2uCCbIqedbE5ImgWhlvR9UI+ROeZVB
         cizIXELF8PH30OkgiQo0KcDMg2xhkO//uq2si/2CDTE4OiuIJWdeYHVhz6W31b6mAMJU
         c3uWTgw6f/FVibo0KbN+WLUhhVrW2151RGUPdrFcbbdO28UDeNzhRVNCWDUGaYDHznWi
         B2y1556eAHJ9v2q7IgGTc1N+CHVHVBuJ//B2DCjgA8H4Ontox6eZdlyU6cZModqk6qhe
         BVx3JcvFKfLBKFljafTP7svLbNSFB2ZeCpmGVMHrXZrnYWL/KVDNa65XGabkb6FRomv9
         VTag==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793275350; x=1793880150; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
        b=u3+KFVf6fB8k3HAkW7lRJO3f03Gk1Jwe/jLeb9fbPKPfhVgQGc8ihU0vP9Ypl8FvNL
         Y7nc9TCnhVoYLrN8+QF9dWMnHzREhMmZSTfRRBwlvFET49VVyBdQBAYU2R4I9+VQwypi
         +AiYzC/0+APmeoAr7Gta6LH94gLhq7D+Oq6pN6Y3umTuRZNrG2X3HM9U/VsuS9UhnHxm
         qvWNfc53JuUwHptJkc0cEADA94MoGO//C/nCngLT+w5z8KDHuKgz3cEwQbaJ2L0GYJJQ
         amNG1NME5mcoimCaZpAeVez4lWNEi/SAOvoucD2vHq4Y7ypqgFS8JrBDCsGzj51epp2M
         zhig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793275350; x=1793880150;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xl/31tneXRsFAECpWpQO0ou46Tacltc0WW2DLZb+HnU=;
        b=Zozo4klHSoBhBoWb13vWIcgXEVMoUqi4DAtcZQ7W/moRQhNgkDuoCI+eOgy4NLCuAw
         5SxGItxxyDgF0WC9rjSLeLWI1kcD4hS0qYlmXKZLJhyMJrcxwwJLnnaOTKnEpe66NNOe
         x0nbU+ubO4S4ds1U4nqHR7b4IscIBDjvpg1TEGIU64D92n2DnMAT2us6DcGU5j6ny3WD
         E8q1zojPAN4lZIxQJuPqsL2vfJkvxnk6Ews1CM4OjOOLQqo1p9Y08uc5CoD4NjG5jh/n
         r1XUp0WIcRMpD4Bc4t6X3HlOJcMRFj9RJjkoq8Il1dvrNnFBHtXxi/j/ejYd76qtVVME
         Eg0g==
X-Gm-Message-State: AFq9FYKf+93kHBUdzc+OJfZHMYa94BaheQrswcFVPhFWomq+ahMp93md
	JCHQsSyRu76SEXCJ26IRl1XNU6oFWwmmRJl7yHF0SXBsHDMtehZ3HrL14u77SR/Jb+YklX50Mo3
	I88WM6weBPnDG5aJ5sj2zDEI2grZ9Bl0=
X-Gm-Gg: AYBFou1PNybW4IYJ4LfBMafraZ1GneXnPprfcQS6Op5F1HhO+j66NDO8yW2wd9NZj8p
	XJvR3EsDQ5QMUiKpmd4dq/EmVdvdk7rV/f8Oi5L8S1J/8Ca2QIiBHGlueZ5OAcNhx+rtghp+jSM
	cKrYn2O1lqUWrAJJDxkjOy5KCNtVRTzKP8wIcCCymVy3oOHoGRyJFpUR9XMJQu0+MHN7TQIzSYw
	caCB/OEJTx0A5XHJBOgFe0Jh/GaZ5akjIplUQJERvdzLlL/rTX/qn+sFnik5B9PShRCNqxbBFY2
	fvowib7zq6mS/rWF4fgpWSDQCgps3WZms9OUrIryAG8KF+KA5cAq80/crXTIvSf8wXPscCN0t75
	RV5l+xBAxPLncczaoWt/k8G8GAO1UB6amCI/FM0v9LIh3Vi8UqrzPZcEmbhLNLXVWisWneBlRqL
	lK2mVjiPUANyvRqP54bNwOJ3KLhuuz9dEgBiuR2AUF/rIXrGa4Fwun8H7qwkJA1G7Qn2WvQHgV
X-Received: by 2002:ad4:5f89:0:b0:91c:711c:27fb with SMTP id
 6a1803df08f44-91c7ce3b024mr85020316d6.8.1793275350048; Thu, 29 Oct 2026
 05:02:30 -0700 (PDT)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028212731.418001-1-ic.gabrielribeiro@gmail.com>
In-Reply-To: <20261028212731.418001-1-ic.gabrielribeiro@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Thu, 29 Oct 2026 09:02:19 -0300
X-Gm-Features: AclHuK_MfRHWq4DWz6O_VU6YvJc9e8OWfcm0Att5J0Rnvclat84KH8bE5loBGQ4
Message-ID: <CAMAsx6cDw-tsyrz-0vY=qVjE0sdukxnRND=KGoF5hG0Tk=V5MQ@mail.gmail.com>
Subject: Re: [PATCH v2] docs: translations: pt_BR: add maintainer PGP guide
To: Gabriel Ribeiro <ic.gabrielribeiro@gmail.com>
Cc: linux-doc@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org, 
	rdunlap@infradead.org, sashal@kernel.org, kees@kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em qua., 28 de out. de 2026 =C3=A0s 18:28, Gabriel Ribeiro
<ic.gabrielribeiro@gmail.com> escreveu:

> +    tiver uma conta em kernel.org, poder=C3=A1 se qualificar para recebe=
r um
> +    `Nitrokey Start gratuito`_ oferecido pela Linux Foundation.

The original says "you qualify for a free Nitrokey Start ... courtesy of
The Linux Foundation", which is a statement, while "poder=C3=A1 se qualific=
ar"
sounds uncertain. Maybe "voc=C3=AA tem direito a um `Nitrokey Start gratuit=
o`_,
cortesia da Linux Foundation"?

> +de suas considera=C3=A7=C3=B5es sobre hardware e software abertos ou pro=
priet=C3=A1rios.

The original says "open/proprietary hardware considerations". Was "e
software" added on purpose?

> +- Os tarballs v=C3=AAm acompanhados de assinaturas PGP separadas.

"with all downloads" seems to be missing: "... separadas em todos os
downloads".

> +verificar automaticamente a assinatura do commit apontado pela tag e

The original says "the signature at the tip you're pulling". Since Git
verifies the tag signature, "a assinatura da tag que voc=C3=AA est=C3=A1 ob=
tendo"
may be more accurate, but your wording is a possible reading too.

> +e pode revelar informa=C3=A7=C3=B5es sobre o cart=C3=A3o caso voc=C3=AA =
o perca.
> +sido conclu=C3=ADda::
> +   commits tamb=C3=A9m ser=C3=A3o =C3=BAteis.

Small differences in strength from the original: "will additionally
leak" (revelar=C3=A1), "was successful" (bem-sucedida) and "even externally
maintained trees ... will be valuable" (at=C3=A9 mesmo ... valiosas).

> +sess=C3=A3o do shell. Confira seus arquivos rc e remova configura=C3=A7=
=C3=B5es que

"You may want to check" became an imperative. "Talvez seja bom conferir
..." would keep the tone.
