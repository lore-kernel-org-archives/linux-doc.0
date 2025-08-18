Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29DC25A2C2
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 15:31:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755531110; cv=none; b=Bj0pviAxizCE0t3nQGPx2XGunE0mqcdOcpTjixfsztwO2FXwY2yLwKo0dtryisA45NcIYed5S3bd6PeDZ6jBGyUe3HpFg18EAz4u6DDIo595iKypKqm/nDW0Q9AY74i/3S7XQyU7aeRkcXYYLSppkjvyS/F52zl2BZr4Zq4FD50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755531110; c=relaxed/simple;
	bh=rZ0dwCAQY3J2oIRCeDvzc2CwT76Cq6Vb0Lwbbf7BnKU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PEMblWtbM2J3QSlheQ/5t2qK/TcfTRDx+e9jOfuEkn0lx5kJEIl/f6pnJFgDJQ1/GqnpiDcwlcV+JZp+a8MPEQmo8TielEQuS08VnKy6daHVr9WE6Ui2Gd7GB67GpaG3PPIo4EBvFGrQW2/led2VVXjwbktRJpktiT5KHiumWDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dKGlARi3; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dKGlARi3"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-333f8d39e94so32074871fa.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:31:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1755531107; x=1756135907; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rZ0dwCAQY3J2oIRCeDvzc2CwT76Cq6Vb0Lwbbf7BnKU=;
        b=dKGlARi3a7MknAkUpQxCZ00y0dMS3gUPn3qhsB9gs+ltYthPlTNLhVIfm8dSqqEcTc
         0c5blBM6B2ay7Tn79tfy23H+KUfWPsD5hKZ7rkMsw7VQeaswl3On2rkykzoUe0HzoUpB
         2jsHwL0BocnXgBQGNBCuLn/HBgecbbKMAiHMfpb3dImF+epLr3/ohpyMZcT2kQbz0ZUT
         e0Y0k3VNCawJvLsX/sal+uwML9XdrbsfD7Xm2LAXnFE8TvlhqN197INaW8L5VMtf7iB+
         rCF9tx5kgpwCY3BJZT1q9A7U1HdWBIH2LN3WBDcP2w6Bxo18OWbvW/HVAbxrcJkdnZjl
         Mq1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755531107; x=1756135907;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rZ0dwCAQY3J2oIRCeDvzc2CwT76Cq6Vb0Lwbbf7BnKU=;
        b=sCsT1/QOtWgMZ+amI91YkE1+5ldNUg25GhSx+VpTt1LMjOg8YgcKIhbnGu+bpu9c4Q
         yNOB3kzyZzGtJlRaAMNbVCg0zkrNHES00yQzY1wAt6iHjbPta1xWbWJ4cRO/hB4dZacF
         Uae0DnnSvUZfNt7C5dSN8NfRm0L/TWOEMQKxM4CatfufiAfz9fQ9O8gqh0Xx98w5xgM3
         AG6isyxtEzKeYdoWYX57tF++sw9jYaR6QWea77o6ghfEB9YRbXFd5g7LxMgReMV5clBP
         5E5xPHr9pmS3d96csnWZQTFtdjmfhpR3LdApTzSzR0Qik2S+y2r1IyiV5uNgKrVduWZV
         f5OA==
X-Forwarded-Encrypted: i=1; AJvYcCUBiQVh4womOLcdzz0P7QHzEJHezQmFZ2Ag762m6CtxRUceT5TnB9FY9UIP7UQLTNlkT1p8V7mMl+M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/1DjB20J+s+8x8cOXHgeV+J7whq1J+zgApuXsZjXZeMounYS7
	JNQvoWbb2kcD5F7Jsunk4CrY+AepBYpB5EnlsV7Qn29tlrJrSYmY0cBOO1+JxH/cP774nwfw4fe
	bZyGGf9oJy3u8Gp8cm4wqn2UbGOTcBVN/I14tJTUf3b6f+6ZX0YGSnH4=
X-Gm-Gg: ASbGncvs7rJj4Y81VLB5r8IJEktX+BLhAunOEwBo4C3NG3GTcNGVzcK+QEbap4ukhFM
	TsRi63M1VgqIBMOd02NiLjQlhQPR0F7ieMu/2om6WehwyWEnOOLyVzBrH31ZXwtdUWkLnP8Yk8O
	24vwv+oP19GNZ/6G7f89agQH9xSRRmbVxuacyN+wug+ex59HV5/ofNU6YoLgy3US1gYgnEx/wgX
	GZAlA80HRgLgt2bNg==
X-Google-Smtp-Source: AGHT+IFs+u+QQ3aTG4A/OJjJanOujDjAB+Wl71F0SifIFYHpU0A6WvX6Ba+2IJZ3wThNNKqqP6l7dqXLCYXQFACA4ts=
X-Received: by 2002:a2e:b888:0:b0:333:fb34:9b52 with SMTP id
 38308e7fff4ca-3340995c145mr34976401fa.35.1755531106744; Mon, 18 Aug 2025
 08:31:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250813081139.93201-1-christian.bruel@foss.st.com> <20250813081139.93201-2-christian.bruel@foss.st.com>
In-Reply-To: <20250813081139.93201-2-christian.bruel@foss.st.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 18 Aug 2025 17:31:35 +0200
X-Gm-Features: Ac12FXzzIQxz6KyrnD-BuJV_RkrIckO1ITh9kqtOp8xqM7oYrs8HIMacwPvpGKU
Message-ID: <CACRpkdbA0OcAv5kKJTzm-piRt5eTP_pzHVAZFuR_LCgOA0q9YA@mail.gmail.com>
Subject: Re: [PATCH v1 1/2] Documentation: pinctrl: Describe PM helper
 functions for standard states.
To: Christian Bruel <christian.bruel@foss.st.com>
Cc: corbet@lwn.net, bhelgaas@google.com, mani@kernel.org, 
	linux-gpio@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 13, 2025 at 10:13=E2=80=AFAM Christian Bruel
<christian.bruel@foss.st.com> wrote:

> Clarify documentation for predefined standard state names 'default',
> 'init', 'sleep', 'idle' and their associated PM API.
>
> Signed-off-by: Christian Bruel <christian.bruel@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
