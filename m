Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B6625BEE8
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531149; cv=none; b=tijym9j9NEKVin++bhUVhDMqx4wqqPVgDC7dBEO31h7z04l0q7/2zAFVkbXauJACG5z2kWxeBSx2lsfFBp3lbpChvLLCV0H1h1dxsENGGsK2K3cGSXsEhqr73Mn9UGbhd4pnI34FlIPAjvKb33MZtsB0FV0T5JJIIcOahWYfRaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531149; c=relaxed/simple;
	bh=icHVjjRqRhE4oRabHZs6Zl5XfsDtmtpgy2tt3jycgLc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ENOwpkfy5B36Ur9tAkxPIjOE/X/NweO3La+HRtyDMIVBgdkFszjYrzXRAW7o+9U33cEtKyJ7hE8JxOqgMrfEQ0jFid6ziZhi4XqZBLdXehA/tPjxTOAqzVJrNpGYxlnHz7daJ2G5+/s4VOpy67vaSUrV5z/ys7Ny7cbV7avot64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cVj9yUO3; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cVj9yUO3"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-333f82a3a9eso37519431fa.1
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531146; x=1756135946; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=icHVjjRqRhE4oRabHZs6Zl5XfsDtmtpgy2tt3jycgLc=;
        b=cVj9yUO3/YBoYVQlOI/0T9GXa74iZCsKgxi5pjY6xptA17iKOYJuA1F4fAMZsCln4j
         DyEhag0TlpExgZOh+hTcNlNPuUQVwC+fFGu/UsYy/SIZjLM4uu5EFqMJ9HrEHAlk7Z+I
         KDJ6ofGtsPCpFWYxuX0EofVIv7samzfy9Nnamlw9AtCilekIyBbXh9SHZsTTyOoE5nuT
         0fi7QFIw+Y5BmESCSkpqVmrx4rTEi1g0bcLdbTLdgSIhnJFV1yS+yRE7mbTV/mc+xjxp
         0bTg9bDP+fUGMzfeInRUKhHeY58lWnOlkkBLTpRaF1ZtwvmjRJBI3M7wDQzJkxeuir6b
         dKjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531146; x=1756135946;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=icHVjjRqRhE4oRabHZs6Zl5XfsDtmtpgy2tt3jycgLc=;
        b=Y+4ZI62vfW1IAHJElJeIxmuD2udnz2dRpe74z3W4LsZmYcUmLE9kR8dXKkBdogKIQy
         ccyIrs44i9b8lSJ7rY66fpDp8Qfwc6ruGT2KJBfqCeYNbQwvlPeU8vx+g0U4ykojPb+z
         4dOCFW8vef/OAbUMCl9zYMza+Fcy6t44IT5rgTlB31GpX692AIjQHjQhSWjrLG7ijXnj
         m864gN/+GOV7e5w5qYpxfEtCiuB4inon5RmTKWLvmieu+suUXJJEapuqSH2eq2ZimrU9
         T6PAkJAheIhWekW0C4+mztFFALpYdSlakCzFqpXdBsRZ92HJoSl90iCMGgJMrQTkiMPA
         83wQ==
X-Forwarded-Encrypted: i=1; AJvYcCU6cSZjXj15lkrbn5Ef50HCyZdZaF5fIFUq//qTWuHq8PRhzcYHpadoAyUW+VoEQsZ4szYpmNRioU8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWXIAt9uZ7ulHnqVJ+8fM4nPM4f17NYROIpQWaIW1h6ucgjOsm
	dy4IXhxLm3jNnptigMvVOpz8wWp7urSNVWwtYqdjJAHhaRfDpkVbzmu08+Kv0t+CSiDWEPgJpjp
	ynMWyRA4hMMnHbd29uQ3g1zA3IV1GC6UKpb60X5csPw==
X-Gm-Gg: ASbGncuHImEiqfooxHJGswPYWBLHq6wBvZvLJ14QvYt0CtNlHTRq9Q0gkAFxMUqqOLe
	t5jj8pPydA2QlfDI9B/HtjI7y+TWTlRueNPz0lR8/MzgcFdDOjP6P/2hECpJXm8DIuAStXvNlus
	Vl63L1Hft7cMV22pCfYw5cDwtrfXdSNIxgOAMfrv3mWyPChqdWwslXCDTEF9cGOD17TccmNmCLE
	1PFLqJaDUAJ
X-Google-Smtp-Source: AGHT+IF2orySIXmfTMPdBSc4u2RQ20PPwC0pgvdtHB2BTHUvv++2TxJJ8Foeb7eufqZD9BSVyHFIxOKmcreERDkEtzg=
X-Received: by 2002:a05:651c:2c6:b0:335:2d26:1408 with SMTP id
 38308e7fff4ca-3352d261634mr832931fa.21.1755531145800; Mon, 18 Aug 2025
 08:32:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813081139.93201-1-christian.bruel@foss.st.com>
In-Reply-To: <20250813081139.93201-1-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:32:14 +0200
X-Gm-Features: Ac12FXx0vB3mITr0yHkMZRFX2ygTlke86KCizQFy_D1MbML6oINtiohhGdzjiEU
Message-ID: <CACRpkdZGaMf1m9UK7ai3KLJBSJtWJagzMMa6icMxEL04w7fkMA@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] Add pinctrl_pm_select_init_state helper function
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: corbet@lwn.net, bhelgaas@google.com, mani@kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:13=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> Some platforms need to set the pinctrl to an initial state during
> pm_resume, just like during probe. To achieve this, the missing function
> pinctrl_pm_select_init_state() is added to the list of already existing
> pinctrl PM helper functions.
>
> This allows a driver to use the pinctrl init and default states in the
> pm_runtime platform resume handlers, just as in probe.
>
> Additionally the missing documentation describing these pinctrl standard
> states used during probe has been added.
>
> This fixes a build issue for the STM32MP25 PCIe staged in the pcie tree,
> id 5a972a01e24b

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Bj=C3=B6rn: Just apply this to the PCI tree.

Yours,
Linus Walleij
