Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 010A51EB5B
	for <linux-doc@vger.kernel.org>; Mon,  9 Jun 2025 02:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749435310; cv=none; b=tjNb2GmIHdsTr7ilFvOusWB7fdTMLubgl2yPi8EgJeI3mI+kxRui5zOyRqFzIoSiSf0e5A8NCuJBQDvuf0v4tCvt6tqKXxjYK60cMG7cm9yj9aT9YT6SjJW548bT85rX6YwxxtAUtD9IWD9HmvHdv4CewAunuciOITXtIxpIAFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749435310; c=relaxed/simple;
	bh=lIAxzEla61vln/vMh9GEf4B0CGzyoZXMjaClLFzcg+4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZCemoPYCPQYQUNfn7WrEx77e8pMumEikf3kwAQcqhiUUziQQ0Dg9H0DPwCjWUu0ZPaDLrW67kBDoUAoMiyxCj01jHfOMiiSqfK0wtuz/TUPZg9sqeoR5dSCJUxpEDpg+eTEnlb3yhx1yJImh5N98FuvuizG4Md9Uu1718OMLbhw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=lPeRMdml; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="lPeRMdml"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-4a58d95ea53so43527081cf.0
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 19:15:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749435308; x=1750040108; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=AydmufO++E0g/MFtFHuOsivIZ3Gs0PlbJ7oKpifNFmA=;
        b=lPeRMdml6de+rk0HIDpidzLTQd+E78TFJvFs4o/OunYFQhn4dVtTPbd+k2ox6Ollvp
         hGUWRqqo3gm0iPVVI3yWDttE7PfN8t6eYCpcaw4WYh0fTuLWqNQkoxmAxVbt2VbWLAo0
         HCGtPOj2RxidfG3kWkr7IyI5VvFzk1fw/u6c/72Pt7u6Mkg1H6MeZpZkw0vhZiBFtscx
         UPcOvZB5KG6ezrxXtCt+lZRNqLLcT9oML6tOYFQjulN1wDIw8faUtBA0i2GiwhIXDLOJ
         Q7ESvj0eMz36OUeGTX3cPoEh0hXuDEoV95I6d1VNQd65CisBh+KxBJ4j4JvKwboGo7zc
         F1Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749435308; x=1750040108;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=AydmufO++E0g/MFtFHuOsivIZ3Gs0PlbJ7oKpifNFmA=;
        b=JlNJooCFvcZcuSqqmom7dIVa2+Fe865BDGmtrDRfP0EwV4LatWkL9ertXQVg6CQaLc
         RuVoxbFqW3Rpa5zTL/RExwIQwuMP46E7CsceEsG1+YsP4NHtnyu1H8dak9s/VhaE/uq7
         +1ypz7ubSpUV/YUvyXyJqD9xx0ikOrzAXS9wrbi7b7mh10hUgZL/kNuVAjGxs7UP7uSX
         /HaerBO+6rLaYdltlW3k7jiupJoLTE9IHUkJmhlY1ihAHRsisCG6XtzwJcmEzRjf8iXO
         1J/6WDYf0B/TQjLUpvI9MGKYfTj+lpKRLwT+4nmkKbvgdog9XIIk0auuvA9zZjVpVKmY
         b7Sw==
X-Forwarded-Encrypted: i=1; AJvYcCWYjxXJD3ySneDtKgdurfMQCgOpStffzgRQ66LxrONFt+D0zuyCpLijaQ6i3lJxbApHVIOrtT3WQ5M=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyvq8JqnJj0dm9zNdWyeUDoxCqBuYNKQkqey134IJNLP9E2gvj
	JvmBM8poTORXqGIih9vQJwXMpppOXQPvyDJCyILrPx5YCCi+RHP60Zykpuzic8TrYmO6ytiPU3q
	B7nt/t1EsplXLXqowUhfadYEU8uk27N/XHEkOcEPtng==
X-Gm-Gg: ASbGncv6BXk3t4BdIQUvBMZl/Mg6k5uuwg4AEi4KIefNKi+jh2UPa03oFpSvbAM3+K3
	QlUSPNbT6Drp27Nd1hs90BfBlj9g6uQEtJeqkZm5QHXy9LDTw0ml9ohavz32dTmKc1KfgGIQsKk
	GnEVgSvLr/iTxeMeMwm8NdYYG2wAAxX0cvfB3CPAtm
X-Google-Smtp-Source: AGHT+IHyNDAVSlPRlXSF3+PVFRlz7xzc9k6c4v3jOeaBWfnlwTxhrz5c+YAyhG+PuQduhw/yffksNG8ZON2q0C0fghA=
X-Received: by 2002:a05:622a:a1b:b0:494:9072:e5bf with SMTP id
 d75a77b69052e-4a5bdd35addmr184955911cf.18.1749435307847; Sun, 08 Jun 2025
 19:15:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com> <aDQV1bAt0i8d95MQ@kernel.org>
 <CA+CK2bAn5Y71FgZvfY0oJ+-65TT19O4=h5DXguRbEQdRvhurFg@mail.gmail.com>
In-Reply-To: <CA+CK2bAn5Y71FgZvfY0oJ+-65TT19O4=h5DXguRbEQdRvhurFg@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 22:14:30 -0400
X-Gm-Features: AX0GCFt8-dnNIlLs_4aoCF99g3jU94XH2Qg_GDQmLfM_0NNxRQANvzU8cQlDTQA
Message-ID: <CA+CK2bANvAnkviNg1bk9L79kGRNmh10m3qwhaseZSk-3yUFVHw@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	changyuanl@google.com, dmatlack@google.com, rientjes@google.com, 
	corbet@lwn.net, rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, 
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com, 
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org, 
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
	stuart.w.hayes@gmail.com, ptyadav@amazon.de
Content-Type: text/plain; charset="UTF-8"

> > > +static void *luo_fdt_out;
> > > +static void *luo_fdt_in;
> > > +#define LUO_FDT_SIZE         SZ_1M
> >
> > Does LUO really need that much?
>
> Not, really, but I am keeping it simple in this patch. I added the
> following comment:

Actually, given that we are moving files to be another subsystem, this
can be reduced to only one page (i.e. unlikely more than one page of
subsystems ever register), and for files we can dynamically calculate
the required size. So, I am going to fix this.
