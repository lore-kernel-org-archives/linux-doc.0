Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FE7134B1
	for <linux-doc@vger.kernel.org>; Fri,  3 May 2024 21:04:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714770248; cv=none; b=KOy8v2gApUTGKRGInSXUl+A5bH5gjRp6npGIOb6hk+bj5uphSOIOIqa5FYPpDwQSVAermYWNDkqurXpR6pSArsXJEh0YCqX4ZuC2f25ERzuje/3zAtkMGOZh8yfZ/0re/wLP4Gawri0QN/XZx6Lz56ZD6ftk4HV05ifeOFJygwk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714770248; c=relaxed/simple;
	bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=paPbfVHmfpsQ5vkkWvkC4ydBDWErZycScX5QnwbdUEFFIg/OQux8fydWE9AHhqraq1vow/MDVOKzfxoERC9H2W7XvtD9HkAg/gT1BhBBzhbHpQ7HAiH2x5sTbhQMvOC2Al5d7vIWSbyRJbPQvwBzjVidLJHSgMK9LqwYqcNPSvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=2haSRi/V; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="2haSRi/V"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-2db2f6cb312so1781771fa.2
        for <linux-doc@vger.kernel.org>; Fri, 03 May 2024 14:04:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1714770245; x=1715375045; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
        b=2haSRi/Vc0mO0U+b+R2quBqnu0V9gEADZeoMz8Oc3ITSqlsfb+jAnKWHabUQVSpg6K
         Sw2974nPzroLc2EAVx5emml2OYTX5Xsi+IhoFpbNkqUwISfbylL3iSCHWqIbTFnCSycX
         LGeKLGpOuv95H0UnJAjun0bnWgtVAlqzvJ30LCZMC2JD2DbrUmlPVTa/A4UPUWJUHrML
         iLD71xu5krDhqOperqZsjobSktkWIjjzLMipzTe4BzklEKz/rTOHjeFcj1mHTDl4yxB0
         XyA+Ru9eJOVNyFhkgaZUli1S3QbiWP0enFnnPqgLxZlsK2OOFJU52zwy2Xd2VfGjCHKn
         B4Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714770245; x=1715375045;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr8q0vJdMraPMNcp9YTW0aQV6wa6XsOli4AJVOGN+FU=;
        b=FwQ93prRh+TiuS8rQQAO1Zmsd5XtQ8V5tLCt0Y1ZXUYxs1aRE5myZBhW1qh+uS8qo3
         0F96SbKrSA2+3beQgMyxGosnQDZBHXpztH+KMi37XK/HmD0k7fj2k00xV9HXRcRQBtVA
         ZKeWWFgBw00TySKfAcWSeBdD0b3l0QhmxW4FewaVJ4wVxRNXxlut/EG6nLYCTX8Cupie
         EU+SwMvx2/2HYnsWsDUmp0vZrNbcwMMA6c0+U7BbOwGiaFMa7TABJwO/khl29Vc+PlcN
         6NfDoBNjjP5hJLJJvPTiRSOXdLoBGCxIYII7C+W3Fse5iPVtRepAUvu2m3FynglDUrkv
         5TZw==
X-Forwarded-Encrypted: i=1; AJvYcCWV3J5UfyL1J0xiL/Yqn/oEniRklTOnbRb6sHp1tY0T/D+PUy2fti17SUbunszLMWRd59q4V4jxINSWis+2OaWTOAT+YcWUGJjj
X-Gm-Message-State: AOJu0Yz3U6Z9vH4TgOkae52IohkKynsXdCWaLUDs+ojJpT4Nc+xg0QnI
	D3OpslNgvxjwcQNt0+Pq6MlYYhwuGAWJ5DRFEQ/CQVLVrmh0J1/u/N6wOZ/g07IeMjRgu1OR6Hf
	4lOZuTTI+dYa6g9WCNXNqA0vT8gXVQ1GAAZ/vfg==
X-Google-Smtp-Source: AGHT+IFVGeh8LKuvAXn0wbATQFthajoGa9wA2FpRSy48ryw0IkU/MmVyuccePKcDYu88/CEm2wRejt72X+QG3nu2ZVk=
X-Received: by 2002:a2e:a71f:0:b0:2e1:f255:6673 with SMTP id
 s31-20020a2ea71f000000b002e1f2556673mr3009473lje.13.1714770245520; Fri, 03
 May 2024 14:04:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240503-dev-charlie-support_thead_vector_6_9-v6-0-cb7624e65d82@rivosinc.com>
 <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
In-Reply-To: <20240503-dev-charlie-support_thead_vector_6_9-v6-6-cb7624e65d82@rivosinc.com>
From: Evan Green <evan@rivosinc.com>
Date: Fri, 3 May 2024 14:03:29 -0700
Message-ID: <CALs-HsuH5KM4OEH3Uo58cq=3Zgr-gd43hhtOuP2tQFDyDUjq2w@mail.gmail.com>
Subject: Re: [PATCH v6 06/17] riscv: Add vendor extensions to /proc/cpuinfo
To: Charlie Jenkins <charlie@rivosinc.com>
Cc: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Guo Ren <guoren@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Conor Dooley <conor.dooley@microchip.com>, =?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Palmer Dabbelt <palmer@rivosinc.com>, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 3, 2024 at 11:18=E2=80=AFAM Charlie Jenkins <charlie@rivosinc.c=
om> wrote:
>
> All of the supported vendor extensions that have been listed in
> riscv_isa_vendor_ext_list can be exported through /proc/cpuinfo.
>
> Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>

Reviewed-by: Evan Green <evan@rivosinc.com>
