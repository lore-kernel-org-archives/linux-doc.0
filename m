Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26A8542C516
	for <linux-doc@vger.kernel.org>; Mon,  3 Aug 2026 18:19:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785781176; cv=pass; b=HQRvLJeqszXQYyg9P+1ClRJm73u3RiLX2uEp6QkLvgx1VzWLGbEKL6XBoY7Dej96azI1/yWSoMPKZpD75oMOzdwxeszsQQmnivUgq5f+uHM7YuOgvuvQO01YJxLE8kmC9N4U5P8xw+ZcFtiZgK3MHHbt4BRM2SMMenLwTuZsIPg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785781176; c=relaxed/simple;
	bh=vvn0XSgk1YIZPsUUTWcGvlLxc/5NhBIV2G5uF9utSoA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QBuJasCgLAZrFuxHwVUaxrQCTmEq7PnKiSLyIMx2NeScfV/1j1q2TDptqPjYtnCJHyVVeSWCmfcM1alZW4KEq4XmVAz4ra5gbrAjs1A3Emd5uPk97qPWWkqTG6uI2jjA0TVGMn6kiGlIL3cTOCDGP4cXaNmC9Qrq0IJrIh/hdHI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oe0COd+E; arc=pass smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oe0COd+E"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-8f29ec73064so24557746d6.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Aug 2026 11:19:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785781174; cv=none;
        d=google.com; s=arc-20260327;
        b=ZEFacHmY1W2j9Dhetwd42+MYB9i8Qe36zgeBwvurZnzgdhweWtqT8+ZPWXDtt1C66k
         6zYuGf7d6WpaN0b/clwAA1pnVysCJX1D5o5EbrGESfltFrgP1rpLGDkdKAMFY0dVDH+2
         j1A6SDDL2aKQg71e/XbkIcnPh8mLzPyzKR434CTdV3BPU5Qq2OUiZQFwlwj7jqZ83p5K
         y/Qdog4dpfqGm63lNW4jdpSbKKrLBSM4DnUkHyh5Yzq7D5g6k2VCQh9Sq0q66yrdNCWf
         nI+L2Z1O3smDzowSdTxBnONm+Y1n/kOtvuVNDekIIPNgjNKWupFrfTv/JVYb0BUkcz/h
         AFEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vsHDWHJ1eMCmxF44V7Hvyaei7I99DuW3EFWeRD5k1jA=;
        fh=c+aYSuLYohOoAi8aF9Jw6aDZEnlMHZB6MUM+XdSubnM=;
        b=TKKybIK4SCpoy5M1emf6Iy9Xxx3LVbFar4S4R30hXRuz2zozr8+LH5ytBoRyh/aQjw
         OMfo7TJmC+HQCoaXxCegp8V9qBw0JOSz46GVsRzYSXD5wF8+06I8gU/5QxvSTnXLsfeF
         si3lNauQ7sGbNDYDX04/VKd/5NCTvH70Gc+9PCiSIuRb8qZAnUG/J3/MwvlOhGRTe7jU
         PiY2Dv9mMqhOG3FD9q+OWXhOeBMhnerH38rfW4R85p9JiFGd/Ft5hF/JUrOV3BSkt6Is
         a1S2F9vHJ9S9eUYtDP8bydkqetJ8uD/qjbfyCI62RPKqyvJBi9dzxdOVSfy2i6MkiSZV
         I6/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785781174; x=1786385974; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vsHDWHJ1eMCmxF44V7Hvyaei7I99DuW3EFWeRD5k1jA=;
        b=Oe0COd+EOvpG5UP+01fgEKEVc5QwI0B9IOgunK9VfucnKmYrRGL1/aoY04+GZVjFL2
         mbKZQVzP2ejg+yPZ9kkAtHkD0d5btjCcou0UDF/N5ZDQAvPXaUNVghcN3PzSMVSUDgaJ
         qixSTUDO0ZRGDrFFl0clLYOdkm7K7PUY55aGUJekCRJZqozEzzUlDOXAeghQjflIImLJ
         wNGtgcwHNYTByiuDUU5uP422w2J9byczYQ2gMdz7VQla9+WiX+EFoqp8ROV9Z3XgAbS8
         3Mx7KMVXUXJxL1p/9jTHM8cCbz9o+QWaDg9NyCqkNS/MA++D9dTiudNh4jvhHQVEjR9r
         urJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785781174; x=1786385974;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vsHDWHJ1eMCmxF44V7Hvyaei7I99DuW3EFWeRD5k1jA=;
        b=lOXceBfWasprWfjFJhL9q4auZjFbFdngGwEJOftDIDB0mGr+Or1gKsqDX8s+WcN2Vo
         0vf5uRSa5p/18UIXaim8CVa8DfxFAmz3OoX+m8ZZlnpbuHG/aIyo3KBNryrYvsTJ432e
         sgJ7AYlG3KT+jMB4yA1Km0CuGeI1QR+aBMmSKWwScMJG/88R/yilgAoga3hv1RIEhZji
         7v0fQdVJ9aYH/uYNf5zwH83JrzKuYypT5E7WcYfBhRP/nzrlF52H6t+iUP6zV3wZtxJu
         Qd+Vo4m8Bl8PRp9qrshJrJQckj3EN8rCOclGl5nvyb254+ZA4Yccg7ZerO6ml4JoUC/q
         ZQQQ==
X-Forwarded-Encrypted: i=1; AHgh+RpaKeuoQa/6FZDXY63o/KoFxHnM0hQWKFW59j+8eTeRYCBK0Ybr1dkMTyggp/oU61iBC3oWFOE3pTk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8OTx6jN9Z7tdUo4qokFpn3hHEoYtB+XI/i0hsSY9+iAPZ18kB
	HTfnAokpm7+M316w98CNbflNm7IaTCW5Qija7A7abnowY2D6Eiv2eC7FA00BgmsHFZ8iTYAKV2Q
	2kglXPhWKsb6PvG6CROPpBcS/VzRVjxKAQMuE+8A=
X-Gm-Gg: AR+sD11GEguzPcswvz/C6iBhFFvkPH3KYiBeuPbVRwX6iJnvWl8nFN986rqDOdt09aM
	VWDShejuqahd5fzxwDmc8j/THAyHt509B8T7cZquwhWOk05OHeKgoitOH3oEzRhFXZajDNbxwPI
	ad0JrE4iVIsh1C/XhXWQSwSGxZ1P8el1hhTt1sXn3QwSxw/AtbHUYXJ/O9Zae9Tu7jYgjtiX6mc
	FEf2467M4ScetRrs91K+Rrizll+IAT19SQA3z3AOgX3nAKROJBlaNOlPr6ZSFxgWrKr5B4+38Te
	40Z3mzYA9jhs29+xKqnsa7MnI6mFr+ZqwpuKs4EXYJYApV8GBpvZ0EGYbxjp6nogLdglIUGsG2f
	4LTxHeY4+CaB5giF8FVol/RQM6M9qjgWX2H5ZFG8P/zFhaYkFYxCJEV1jzw==
X-Received: by 2002:a05:6214:411c:b0:8f0:c170:4591 with SMTP id
 6a1803df08f44-9084956484emr190681676d6.4.1785781173705; Mon, 03 Aug 2026
 11:19:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260727204803.35796-1-alyssongleyson.dev@gmail.com>
In-Reply-To: <20260727204803.35796-1-alyssongleyson.dev@gmail.com>
From: Daniel Pereira <danielmaraboo@gmail.com>
Date: Mon, 3 Aug 2026 15:19:21 -0300
X-Gm-Features: AUfX_mxiZPEnFR_g3E8LLXN99nmQZ_AblKAXPuFMku3Jl9oM7ov7JGPEp1cNfek
Message-ID: <CAMAsx6fMV1EsoW9yOLimvp5WqP=KmcZ7-KoTpcezUOsRs03-Tw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: pt_BR: process: Translate the security-bugs.rst
To: =?UTF-8?Q?=C3=81lysson_Gleyson_da_Silva?= <alyssongleyson.dev@gmail.com>
Cc: corbet@lwn.net, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Em seg., 27 de jul. de 2026 =C3=A0s 17:48, =C3=81lysson Gleyson da Silva
<alyssongleyson.dev@gmail.com> escreveu:
>
> Translate the documentation on security bugs into Brazilian Portuguese,
> maintaining consistency with the original formatting rules.
>
> Signed-off-by: =C3=81lysson Gleyson da Silva <alyssongleyson.dev@gmail.co=
m>
> ---
>  Documentation/translations/pt_BR/index.rst    |   1 +
>  .../pt_BR/process/security-bugs.rst           | 370 ++++++++++++++++++
>  2 files changed, 371 insertions(+)
>  create mode 100644 Documentation/translations/pt_BR/process/security-bug=
s.rst
>
> diff --git a/Documentation/translations/pt_BR/index.rst b/Documentation/t=
ranslations/pt_BR/index.rst
> index 7a488f662..796fe9bca 100644
> --- a/Documentation/translations/pt_BR/index.rst
> +++ b/Documentation/translations/pt_BR/index.rst
> @@ -78,3 +78,4 @@ kernel e sobre como ver seu trabalho integrado.
>     Processo do subsistema SoC <process/maintainer-soc>
>     Conformidade de DTS para SoC <process/maintainer-soc-clean-dts>
>     Processo do subsistema KVM x86 <process/maintainer-kvm-x86>
> +   Falhas de seguran=C3=A7a <process/security-bugs>
> diff --git a/Documentation/translations/pt_BR/process/security-bugs.rst b=
/Documentation/translations/pt_BR/process/security-bugs.rst
> new file mode 100644
> index 000000000..ef7b2d742

I've reviewed the grammar and I agree with the change.
Acked-by: Daniel Pereira danielmaraboo@gmail.com

Best regards,

Daniel Pereira
