Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3ED41E500C
	for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 15:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742484909; cv=none; b=Ym/F23gPGrPsHDv7OSgFMlxWv1aL3nvb0XBOp6BRYwNiyqyd03+gtNMbEHo/wtkDiFkf3eK+hFf5sTU1iDD29iNZocn83/hr5tZRHqTlKoqxd0oof54GZGd9D/sCnsxMCDQl7T7x6cT3d4Fvm5t+jOg/8t/G5rCmVKeaKTDZiqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742484909; c=relaxed/simple;
	bh=JE7TRJHgKZugbOb+fvx+jb6lPiNMeVF9wnCO2Egr894=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FBOTR+t9pZ57z3rSsvulFHmEwSjaXBb2+9oq51DXlWbCAimFeU64UX9qPFgjTe8+20PHvHCBx6wjtceuZq2ELMVwF8bod7FzTTJJ9g5brZ1ee3tmurSHTBvx779L+4LN+aUVTkkNAX0J/sxcJEQGgt/FDKEK/Ub4mTjNO8R6Nbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=aOnq5Wpw; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="aOnq5Wpw"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-476ae781d21so9034171cf.3
        for <linux-doc@vger.kernel.org>; Thu, 20 Mar 2025 08:35:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742484906; x=1743089706; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IKafdfY9ZWhVKC7KjhxqxesIH7gCbQGedUOZZuhyaVY=;
        b=aOnq5WpwW7qCVcdFKpKi3AHKDBExgpjRUKLQTQ0BzEdMbdYY1ugBjXpSj/qazi8yIs
         GwfHWbxzLSMMumISwDeg2tbpt4dwU2yotiw0UV83TAMOpbiVC4j2yyLfwy7XvpdkjgV/
         bH1ZkjYPIL1xRFXT2EiAsmGc3+EoTxecoYDmKdHvAgH9MBqem+G8U3FxqGdAUDmIaKNq
         WVYYFxYMLb6WdJG3Tu+h1cO/e/w+Wf57hlc8AHlIs6jgckGb2FNyxg1GDPCwGCL3B6Au
         m351kZCP0gUxmveYjdaWkr7jV5gz40Q9cI9MH0DslFDuiGICDWmQ7EWXij5uG4mecCUf
         CuMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742484906; x=1743089706;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IKafdfY9ZWhVKC7KjhxqxesIH7gCbQGedUOZZuhyaVY=;
        b=YMxtDUvN959qN0H4JCghA5ltUU9Acrd0kz/L6nBtyz5jBbyKxZPKJBrsfhctZmjqZ/
         T6DxK/MWiSlxXT5SaUun2GOgub8Fm6FlxmNj9Cfu8kboHyG8zogF4rlFvBumPXZWSkuT
         Tk4zK8qG2GF9z3VvprzDV72mnYCpapNM7e86SVJp3v4K/YCP0mTi20j5Mj82MI0YsOa+
         1y0pte/wvu5OE9X8+Nkv72n1QCAZE4Q8nZKHdxSvjOatcJn82V5Qej9UoaRDFdgFWckm
         kE2Ozv/y0mwm2hIpd++IKRHekBRG5BQmpO+Y3d7YG3/pfANWYW0Ljt3dxnGrRK3GxQ/D
         S8BA==
X-Forwarded-Encrypted: i=1; AJvYcCVtbx2WP9fANpFcRBkaKa7n3Pw6xTAmWM+avADb6uPXQ4XVLELkHVJOAUxVSGkNpOo1X777TqhMsKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxvxe7/Rq3iVHsCYLE72DHehsjhe4VeVzEtbZURc7fHAqPiODL
	JWJwg3qD4WP2soPlY6KJAxT9QuPc5ONsw9C0+uPYYXy6rLszl/ttE+7pMB0HgcSqkAk/vBBF3YJ
	RkxAHJ2nKaIRsqnoTx22YVknbjh1zKPFE438zgQ==
X-Gm-Gg: ASbGncvc2YAhXoMXV0PdlWvdmqGdGKOwhQCLvo8ZYAXeqM3QDB+rT5/fLa0eLCerm1Y
	SOXfjVxgBsG1IKMPFrlk6FOb3OfommM7bnmep5TcMixR2gs3CjK30ZJ0ECdaae3nNs3zRF26RL6
	r0UqzQoSeXNvm9Agp6kydchtk=
X-Google-Smtp-Source: AGHT+IG23zWMPcn01aREq7x/0tvXcHrTZ0TQmBtFI8pmoBe8ztNU5sWQOWjuGUrVzDIlMW9fQ4VgnR1HuRZz41Vr2us=
X-Received: by 2002:a05:622a:5a95:b0:476:6189:4f40 with SMTP id
 d75a77b69052e-477083fa813mr116439551cf.45.1742484906584; Thu, 20 Mar 2025
 08:35:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320024011.2995837-1-pasha.tatashin@soleen.com> <2025032015-urgency-partake-9dc1@gregkh>
In-Reply-To: <2025032015-urgency-partake-9dc1@gregkh>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 20 Mar 2025 11:34:29 -0400
X-Gm-Features: AQ5f1JpJmSgK_4q12OaIr3YC3SPbsDRr7KPaQPliJnG6M1-RyT2N3BASX8hSa6o
Message-ID: <CA+CK2bD2tfMXT7BDHs7p0NzPYJQLkATEXh6wUeP9P7HtY+e2iw@mail.gmail.com>
Subject: Re: [RFC v1 0/3] Live Update Orchestrator
To: Greg KH <gregkh@linuxfoundation.org>
Cc: changyuanl@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, jgowans@amazon.com, jgg@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> > From: Pasha Tatashin <tatashin@google.com>
>
> Note, this does not match the author and signed-off-by on the actual
> patches themselves.  Please use your google.com email address to
> send/review/work on this.

This  was accidental, I meant to use pasha.tatashin@soleen.com here, I
use this e-mail for upstream work.
