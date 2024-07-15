Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E3C118A940
	for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 11:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721044152; cv=none; b=aU5inhom/ep8ReBZSo+W/1Rbf8tx16jHEcOg9AoipcRJvzm9Y1ho8iEIK1pC3U2XKqcFf4AVr5nywroHLPtq61n8yMvqiC3cyEZTzi3ZlxIgrw1nYtp2zknbZyVn8R41OUbBQjf+Du8CSHQ8MFE7Eqwp7mKeJfRc7F2BtVipl68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721044152; c=relaxed/simple;
	bh=Rx2Y9LemseZJuQEPmIapBsiBSl9jftAgmsKlya+dApE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=D6sVocYEUJ0l+XadHs5iwSAvRJpxoKd13LfDBmnhxWVP74Xs1ZLSVZaEvaR2RmcUmmxGlZMxAjlCtZxNstX8HDjoDuzYqJG+CADSqyMwg77JqPTqPmkOvRCDBE4t+p4YYlpLsmiefnXGDhS8hvOPo3eMIL5Lmrriq7Fk/c9BnUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=IzA8ESAn; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="IzA8ESAn"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a797c62565aso443531266b.2
        for <linux-doc@vger.kernel.org>; Mon, 15 Jul 2024 04:49:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721044148; x=1721648948; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IWUt7fUeOslaf3J86kT2EHlZPfYeTYeze0uqvoVnIhg=;
        b=IzA8ESAn19+FEDlzbOtrDYK2tftSWbRX9qQLYHU2gv9/MGJ6A0yuyVBpIs6QyE6kbO
         5qXwlyg1E+rUF5xC/MsDDoYFIzHOi4tHF5lCAQQ30uOwBGqwM56OpOaIz7bVrlzZVR38
         ofZntBVKKRxcLmpv/cTGRl53nlYF2RRFbd6pUhSa6m6nc/EhlkfkDphC6GLnpXkDNdKY
         lmsgBPovNt1jv2ygdn0roQX+PzF9d0az+lp21m6eNwcHWzMcSWbqEzF9evMV3Y5W2Rpr
         CHqr3C8gk+C1r4bjuZVc5qq+8qBv25fUSj5FSt6UPd7KylCeImaqoHDXCsNutmcCUMc6
         aDAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721044148; x=1721648948;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWUt7fUeOslaf3J86kT2EHlZPfYeTYeze0uqvoVnIhg=;
        b=X81ScMqgG7Z9CDFVJOVsfcMRj5k4Q9eiHFHCaQIvR/WjtI5FgEUZc4fcGfGSWzMBT8
         uv85cYxkrdXpDi/ittx9YgsPleyWvHEtwiyVEwr2VUmiFRyABD659tajDfcZy+CD+Ucm
         B4hiWcxh51Sy1f15ZmRgdaTTZpwtcxxRvwCMYL3ItRf37avQxHhrmIG1AG3zFfeUOElO
         JVcmjJFMC7y+1jaZuqR3IobFcNWVybX+8GJebH3I0uiMo6CDrxTOdTpLHW0PF93S4lHV
         2Iey23975968RCAl1owhhhu3vZNvLZOSDee8no3C0jxBH9nx0yrRIRtHZsiUXr5A2Gvj
         Ngjw==
X-Forwarded-Encrypted: i=1; AJvYcCWlZO9THyktYBVk2MTA3fb3zArfllh1Wi9dgbnQfSg05cSxS27cYd/3m4q9IB+MgHT/i+L9d3fvYekQjIe7gT8aQajB7VcR0R4Z
X-Gm-Message-State: AOJu0YzJpkNbK3TgBrv1NfzwQbswJyrj1oK8lg3wyINXvP/ED+c+OEbE
	NCT2PJVtxt7bZdMMIEWh50xR+GcaqRko7S72FH28YTxxCT/Tp9G4xJFrzh/e9ppEjf5fZD/cN5+
	STcb+1jn0+kbu5EvrRnaEkEmf2IV+7J6SBlRftA==
X-Google-Smtp-Source: AGHT+IGUcPUU2RIzFJtJOINEci/osf15ph1Bg+CJXHIaSjFd2XfYUaMENDIEhkpgMuT9oddToIRteMCL4WHc0Fj1gu0=
X-Received: by 2002:a17:906:1388:b0:a72:428f:cd66 with SMTP id
 a640c23a62f3a-a780b705222mr1125612266b.39.1721044148245; Mon, 15 Jul 2024
 04:49:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240626130347.520750-1-alexghiti@rivosinc.com>
 <20240626130347.520750-2-alexghiti@rivosinc.com> <Zn1Hwpcamaz1YaEM@andrea>
 <4008aeca-352f-489e-ba07-7a11f5ab7ccb@ghiti.fr> <Zo3MH8idihW4o+6Z@andrea>
In-Reply-To: <Zo3MH8idihW4o+6Z@andrea>
From: Alexandre Ghiti <alexghiti@rivosinc.com>
Date: Mon, 15 Jul 2024 13:48:57 +0200
Message-ID: <CAHVXubiLJWtAit9T6OYx00qHu2QOVNqYRZZiOZHtmDBrDoW5Ew@mail.gmail.com>
Subject: Re: [PATCH v2 01/10] riscv: Implement cmpxchg32/64() using Zacas
To: Andrea Parri <parri.andrea@gmail.com>
Cc: Alexandre Ghiti <alex@ghiti.fr>, Jonathan Corbet <corbet@lwn.net>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Nathan Chancellor <nathan@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>, Boqun Feng <boqun.feng@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Leonardo Bras <leobras@redhat.com>, Guo Ren <guoren@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-arch@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrea,

On Wed, Jul 10, 2024 at 1:47=E2=80=AFAM Andrea Parri <parri.andrea@gmail.co=
m> wrote:
>
> > > Is this second IS_ENABLED(CONFIG_RISCV_ISA_ZACAS) check actually need=
ed?
> > > (just wondering - no real objection)
> >
> > To me yes, otherwise a toolchain without zacas support would fail to
> > assemble the amocas instruction.
>
> To elaborate on my question:  Such a toolchain may be able to recognize
> that the block of code following the zacas: label (and comprising the
> amocas instruction) can't be reached/executed if the first IS_ENABLED()
> evaluates to false (due to the goto end; statement), and consequently it
> may compile out the entire block/instruction no matter the presence or
> not of the second IS_ENABLE() check.  IOW, such a toolchain/compiler may
> not actually have to assemble the amocas instruction under such config.
> In fact, this is how the current gcc trunk (which doesn't support zacas)
> seems to behave.  And this very same optimization/code removal seems to
> be performed by clang when CONFIG_RISCV_ISA_ZACAS=3Dn.  IAC, I'd agree it
> is good to be explicit in the sources and keep both of these checks.

Indeed, clang works fine without the second IS_ENABLED(). I'll remove
it then as the code is complex enough.

Thanks,

Alex

>
>
> > > Why the semicolon?
> >
> > That fixes a clang warning reported by Nathan here:
> > https://lore.kernel.org/linux-riscv/20240528193110.GA2196855@thelio-399=
0X/
>
> I see.  Thanks for the pointer.
>
>
> > > This is because the compiler doesn't realize __ret is actually
> > > initialized, right?  IAC, seems a bit unexpected to initialize
> > > with (old) (which indicates SUCCESS of the CMPXCHG operation);
> > > how about using (new) for the initialization of __ret instead?
> > > would (new) still work for you?
> >
> > But amocas rd register must contain the expected old value in order to
> > actually work right?
>
> Agreed.  Thanks for the clarification.
>
>   Andrea
