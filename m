Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06A2227F74C
	for <linux-doc@vger.kernel.org>; Fri,  8 Aug 2025 19:51:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754682702; cv=none; b=FtlePksiLuwkfmXrPIh4J4fG0iK2s2TJIAttIEX9xb9o7yPWnWewSGVQkb9KFsvmZhhB4tUGFElUhoTiNT6+32O8hP08ZQlIYvfQEk7Qq2vjwHbiKuHKh6Ldel+kcyCNrVUtQGHYthqW7QsbmbjYLyulcaX0v/RDRpZgVDkOjL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754682702; c=relaxed/simple;
	bh=BHL0fkXpKKjHtLjXIr2YakBJO2tAgTy6UPx3ySoZ6f0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nqbZKXGbI7pdkisPzUsXGMUucIN3anNyUmS++3Q38yWK/AHOG8GrlThKobNXIqwLL8wD/JfZZT5XLhH54tDYN9tad9iudLgFwRDlJgLAf/GjqKUVbbtNuhyY5ssB8k6VwRa7N5CTtYgXdSGodWUGl7+eE7mP6HwoeOAU2QJOFHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=eCJDu3rB; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="eCJDu3rB"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b0a2dd3a75so25367681cf.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Aug 2025 12:51:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1754682699; x=1755287499; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZI3NF4nmF87wkVHXd95sZzslTewp5Rg+7HCCf5M8kbU=;
        b=eCJDu3rB9W6i7ZSxgnM3kWTQIfXiFfn5dNp3bdZ1Ws91iRaiO+Gm0BaH2KvTX/vR2n
         2lDowxIqVHUlKBiCwfboBUHzaWvRZ1yFADbz7hvbASCYag4cvkoX+x6FqvAGratVsRx9
         YERtobn1eHy3IXvG2xoGNlNllu2GImAu2tqKjU4oIV8AKgIhUamt8x/O0xBi2PjyRCd9
         iBlZoAdDd3Vl2EWSHjM+u2/WOzm4ZtVIqQQpgn0TRqUBV6wh46pwXyaAd/cJmCIZY1Au
         9qEL7qQy2l0ROyUer/lJQEEJRC9m3eoY9B/QE0QjtRJFeyW1dB2NMTAHP2kX1OZxnKom
         xntA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754682699; x=1755287499;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZI3NF4nmF87wkVHXd95sZzslTewp5Rg+7HCCf5M8kbU=;
        b=BlsMFB7R/UGD1nPTqbnDf4NtxsLvO5DCP5XzPD0uEJm93WbZLimeYVhOOsxSbTLRms
         NoSDbubItqnyC4DbJosN849r/m40W59DLBHLVnlJWFPJCJ1I3yEzAiJfqOBpe+GDz0WO
         YBy57Ly6FV7l4VZ9txPKwEA+f79AlHp1/jTbf7h5rTQSItRVU9rwg8Trr8U2S7scDTru
         sLq5A53mQfMbWXUSF6dFsfdNa7z5ykDPRu6JiMHStmG6mSVWyNAJkcMWGZGIufoTZBwT
         bznkVy09cWyKIlxxQtbVB7A8ZnTLOr8vwUp2S+ZIGJ4bTWcxWd9z0dWUOCaOmJkOjXrz
         c2KQ==
X-Forwarded-Encrypted: i=1; AJvYcCXDBf5vFK8XmmEEgZd+9sdX+w+nvcs+UYSoBg5yf81LgAh4FD7/eWlB1sQaPBGEgsBLS8H1XaGqp3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyx0XH9pEBznbPOAZ8592Y6igeejbQDiY9GIf50pQ3EYMIRHFa5
	z3t82JO/DO+LBhhS5RLCw8PGh/dgeRklEH0EaLhMqwrRSVwCrIb99ZEs9UhzsZE3j3HvIvuA4Nk
	0ld/WHEegNNDl5Xr6CFdg6owOywQwi8rPxzDNrx2/6g==
X-Gm-Gg: ASbGncs5PIrn6P99YKH1W41eaLuwedOR1xr1bLerRv/PbdAizS1UsT0twy9trVqG9xs
	WoAgCtCcm1SoYwOo/po37r+DO5UrA5vmLQHk0f4CAe58uCc4I1XRLO3/hzhE2bo+nZBndUxede3
	YubR00PvM7DvQitphtFt6r7s/47s4T+UdrYbyVPSk21iDCC3V9gj44r7QIx5389y9wd78Ar2tGW
	vSL
X-Google-Smtp-Source: AGHT+IHCcrYg7/jG4VG+Cw86KyymKHrjmDEsAzQfWB1gMcCPUUW3z00Eo/TfCPxNGcOawpm+qrN8GOrYgzTiH++NeZ4=
X-Received: by 2002:ac8:58d1:0:b0:4b0:82ee:f732 with SMTP id
 d75a77b69052e-4b0aee3b087mr66564781cf.53.1754682699519; Fri, 08 Aug 2025
 12:51:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250807014442.3829950-1-pasha.tatashin@soleen.com>
 <20250807014442.3829950-2-pasha.tatashin@soleen.com> <mafs0o6sqavkx.fsf@kernel.org>
 <mafs0bjoqav4j.fsf@kernel.org> <CA+CK2bBoMNEfyFKgvKR0JvECpZrGKP1mEbC_fo8SqystEBAQUA@mail.gmail.com>
 <20250808120616.40842e9a9fdc056c9eb74123@linux-foundation.org>
In-Reply-To: <20250808120616.40842e9a9fdc056c9eb74123@linux-foundation.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 8 Aug 2025 19:51:01 +0000
X-Gm-Features: Ac12FXzwr7BB3_YD7FWm0iRwopXjM6LILZ73ll6nomRu2PpALziQgUA6db3Oe8A
Message-ID: <CA+CK2bCVziiUZzdGaEabmPSB4Dq41QZe7gVxtgwy4pWmpo=D_w@mail.gmail.com>
Subject: Re: [PATCH v3 01/30] kho: init new_physxa->phys_bits to fix lockdep
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, rppt@kernel.org, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, tj@kernel.org, 
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev, 
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com, 
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org, 
	dan.j.williams@intel.com, david@redhat.com, joel.granados@kernel.org, 
	rostedt@goodmis.org, anna.schumaker@oracle.com, song@kernel.org, 
	zhangguopeng@kylinos.cn, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com
Content-Type: text/plain; charset="UTF-8"

> > Thanks Pratyush, I will make this simplification change if Andrew does
> > not take this patch in before the next revision.
> >
>
> Yes please on the simplification - the original has an irritating
> amount of kinda duplication of things from other places.  Perhaps a bit
> of a redo of these functions would clean things up.  But later.
>
> Can we please have this as a standalone hotfix patch with a cc:stable?
> As Pratyush helpfully suggested in
> https://lkml.kernel.org/r/mafs0sei2aw80.fsf@kernel.org.

I think we should take the first three patches as hotfixes.

Let me send them as a separate series in the next 15 minutes.

Pasha
