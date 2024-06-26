Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449D418E764
	for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 15:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719417373; cv=none; b=tqPaUKe+atcR1yDbFgxnBYcafzBg+hyBgji66sVwJ9ueVdIUlvsL0nLJqH639zbu8jQieopNdY9K9CA061/1rkuZw803ruhL+khwhiQJ+d7UGmp2pKKEKE0HhF6KgajBTmULpg1Fz4IASbrskoajb6tPGreQvICEwy5Wj8Dqy3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719417373; c=relaxed/simple;
	bh=I26SRPk+9wOqxgjeFRFR30e/k47KvOWVRRZaU9iy2I8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fz88WCpmEKicIRrPlFci14XZ8m6Ubb7Pc/Alufl9JSqOouGJ3Silj997uZ5dDKnR5mDhE/NX1rsLJNInTpMPQDbGnOlsBVXRJB75fSW7mhAVbB0y277QCU61bE/6610XwDd1EMv6sws2RWrf0cKfaelna0mLTxaNVFpVfBbleGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=G8LGomrT; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="G8LGomrT"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-57d280e2d5dso619076a12.1
        for <linux-doc@vger.kernel.org>; Wed, 26 Jun 2024 08:56:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1719417369; x=1720022169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pJzGfxQQUmV1cJDBl9Qeuz6ppTrU+XJClw05Gu9e910=;
        b=G8LGomrTXtC/DhtcBeOnCQFtBjx5ZtrCfPtpgWEFFc31/ryKJVJX/czvzuiAZAAZp6
         G0IIzjYKnTc1mI5E6zwq1pbm9AZBvwIlb+njGqfiIN8EMFInEWwLc1mEmscwmQ0PSaGK
         8aAA3C+cxJfElDQYgfYzp3pmu26GJquY/clbRZTee0EvZMfCw/xpzCJdkP1+WMOuWiyG
         1pF2JtF9NzAY9pLrJrKmVVtJjFVSoxvjQCJvfKNssWdfxEvzdMebhh8OjQ/5jDLd2wbH
         bq1eG0rl9SQqjASf7xj7lQUjSD5TUN1hoRKA+UNaQ8IxGrY5s96vrtGBYsGr7l25cONS
         l4iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719417369; x=1720022169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pJzGfxQQUmV1cJDBl9Qeuz6ppTrU+XJClw05Gu9e910=;
        b=idEFzzz6g9t/vihHp1TWHEyG019dl4vPsEn9Z0IPis7rBZy8nm+pvOkZGxy2iHfAa9
         juLFvTYmHjS5aLjqDgopZAXJjX0bCOh8bREhbD2R1tO/3IoQIdJDxFkSwgVCB3Sh97XU
         U0BAy27nPBzR01d7husj+rNxStfSotlffXAG0phvwgAlgUQHk3awKyIpGjGrvCDBIkhA
         ZnSMo04Al/knv9wSB0BRpmAV9GLzd8k4Bl1UnXzP2fKMOFpW7zmX7gC5dNI10bXnJhh8
         CLjmV1Xiu1NeNRiFvhQbCnnVzRq5sdkYuHwc6jJf6N+0sWkPwLrfMVSIEFU3Lb4TZiXy
         QWkQ==
X-Forwarded-Encrypted: i=1; AJvYcCVKY9RBhfuOhm41Ba/ZyS7za65AZOF96elu1oUxMQTmMFI9iLyXCaZIj0gw+tKfC9jFypw5BCy4yz5osldeCxj/FPpCEtI1qTi+
X-Gm-Message-State: AOJu0Yys5+87kT0cYq8kXsQ37YU1cc4RMAkMoNbV+yKeEA/3Nq0f06TK
	X7hOdZwbk7dIIl8tcKbMtLsgs4IW6/FyKJsssKgblys26BIMkhhUusct2i/QWfloTzbHCnTHMvy
	by/Cr0zeM+VYTlhDksd8eLFKmSc7H5Py3u0Ia5Q==
X-Google-Smtp-Source: AGHT+IHV5OR/jF6Sb4EqdHVZVXS9SBH/7cVzyA+lDTuRIhiKeb383eE7FGjwbumV9J607Cyivknt59ndYLxj0bf/em4=
X-Received: by 2002:a17:907:8e93:b0:a6e:f62d:bd02 with SMTP id
 a640c23a62f3a-a7245c84f2emr828709066b.7.1719417369598; Wed, 26 Jun 2024
 08:56:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240625165121.2160354-1-evan@rivosinc.com> <20240625165121.2160354-2-evan@rivosinc.com>
 <20240626-aide-nickname-1ef5fef000fb@spud>
In-Reply-To: <20240626-aide-nickname-1ef5fef000fb@spud>
From: Evan Green <evan@rivosinc.com>
Date: Wed, 26 Jun 2024 08:55:33 -0700
Message-ID: <CALs-HsuKHpKanjXm3HQ3JVd6e5Qm4V1+QjBJ38ttxBT1iCw-KQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] RISC-V: hwprobe: Add MISALIGNED_PERF key
To: Conor Dooley <conor@kernel.org>
Cc: Palmer Dabbelt <palmer@dabbelt.com>, Yangyu Chen <cyy@cyyself.name>, 
	Charlie Jenkins <charlie@rivosinc.com>, Andrew Jones <ajones@ventanamicro.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Andy Chiu <andy.chiu@sifive.com>, 
	=?UTF-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <cleger@rivosinc.com>, 
	Conor Dooley <conor.dooley@microchip.com>, Costa Shulyupin <costa.shul@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 26, 2024 at 7:36=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Tue, Jun 25, 2024 at 09:51:20AM -0700, Evan Green wrote:
> > RISCV_HWPROBE_KEY_CPUPERF_0 was mistakenly flagged as a bitmask in
> > hwprobe_key_is_bitmask(), when in reality it was an enum value. This
> > causes problems when used in conjunction with RISCV_HWPROBE_WHICH_CPUS,
> > since SLOW, FAST, and EMULATED have values whose bits overlap with
> > each other. If the caller asked for the set of CPUs that was SLOW or
> > EMULATED, the returned set would also include CPUs that were FAST.
> >
> > Introduce a new hwprobe key, RISCV_HWPROBE_KEY_MISALIGNED_PERF, which
> > returns the same values in response to a direct query (with no flags),
> > but is properly handled as an enumerated value. As a result, SLOW,
> > FAST, and EMULATED are all correctly treated as distinct values under
> > the new key when queried with the WHICH_CPUS flag.
> >
> > Leave the old key in place to avoid disturbing applications which may
> > have already come to rely on the key, with or without its broken
> > behavior with respect to the WHICH_CPUS flag.
> >
> > Fixes: e178bf146e4b ("RISC-V: hwprobe: Introduce which-cpus flag")
> > Signed-off-by: Evan Green <evan@rivosinc.com>
> > Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
> > Reviewed-by: Andrew Jones <ajones@ventanamicro.com>
> >
> > ---
> >
> > Changes in v2:
> >  - Clarified the distinction of slow and fast refers to misaligned word
> >    accesses. Previously it just said misaligned accesses, leaving it
> >    ambiguous as to which type of access was measured.
>
> I think if we are gonna be specific, we should be exactly specific as to
> what we have tested and say 32-bit if that's what we're probing/testing
> with. That'd be consistent with jesse's proposed wording for vector.

Sure. In this case it's really native word sized accesses. So something lik=
e:

* :c:macro:`RISCV_HWPROBE_KEY_MISALIGNED_SCALAR_PERF`: An enum value descri=
bing
the performance of misaligned scalar native word accesses on the selected s=
et
of processors.

...

* :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_SLOW`: Misaligned native word
sized accesses are slower than the equivalent quantity of byte accesses.
Misaligned accesses may be supported directly in hardware, or trapped and
emulated by software.

* :c:macro:`RISCV_HWPROBE_MISALIGNED_SCALAR_FAST`: Misaligned native word
sized accesses are faster than the equivalent quantity of byte accesses.

I'm planning to leave the qualifiers off of UNKNOWN, EMULATED, and
UNSUPPORTED, as those likely apply to misaligned accesses of any size.
Let me know if you think we should tweak it further.
-Evan
