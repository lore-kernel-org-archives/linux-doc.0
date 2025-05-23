Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E0514120B
	for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 18:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748023704; cv=none; b=lP4TTf6+A2UE19CqDYKY0QfCGtDyrqAWq4QVZgJ9DQyVBuN3gHZ0AboOg1HWK04K3C2JAHa4Et5YjDaKstBaq2RuxtesmN6DLMTpjnIjjUpdq/cJ7APcgPngZ6cTUpLbJ8bbp+RiHioYf/Sn0DAwSaFbP+zTbU2aab6nPgv8Z8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748023704; c=relaxed/simple;
	bh=evhV5bvbvbINEG98PnCDvgsHUB6u2zpOouaj4WsoLw4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h0sBoftff2Pstr/VLJnfVwE3AqVYKonvl60104RbljGvWzBXdZXmSUzU6rkwQW1nqOpwygR8NBSf7s4ZvYxz/5VD2PCWQrvGvAc3R+908cBll589Xmr/E4EDdIDLlXdNb6xmLZgcM+R7NzAESEx9bukZ/GCj5PlLozjMCMcLcLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=FlYCaat8; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="FlYCaat8"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4766cb762b6so2462441cf.0
        for <linux-doc@vger.kernel.org>; Fri, 23 May 2025 11:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1748023702; x=1748628502; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=evhV5bvbvbINEG98PnCDvgsHUB6u2zpOouaj4WsoLw4=;
        b=FlYCaat8cxcOdG07Od3+IQMPEaeZ/cj7C7G+CCkgQ4bv/GI6umHl4xLSNTWDiIXFqU
         JA4Vye30P609ZCXIIwiJYJ0xOYKOLZMfAMVt/SxXymnTcv6eWtJoG61i6fXcI/I9EW96
         gikAJyZaStaB2z2ePRkQOBoOvBXM8Dg7/CoBuYlnMkjFSKX1y3zn5vlNtrxGA3bBlsdd
         oK0dFBFTQqgHEDYBrs3ldZ4CEFPBJ+pgFG+OxkPbjH5JscjjxpSr5yX7IXT4fB+tw8y3
         YN1dZQP3NeJuD7Ca56AoyzucMq5xkXdMr6ncL2r+dX7Lb+U/hfWnCWUkpMSpEdVi5UcH
         X/lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748023702; x=1748628502;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=evhV5bvbvbINEG98PnCDvgsHUB6u2zpOouaj4WsoLw4=;
        b=bSBFXzx46XpV/tK3jEWbQwIbPL684clovCdaKUMVgSFrh/Rk34/hhRDocnklsDUete
         vg1+9NQ8hyTMjgNGC6ZOuQ0juD+0i1WTEalddn2lV04qDVawuXjkdVce++uRfTY2DOZP
         wChXxrxrWHUSjB8LW9KyBb2YKOxeNbAyTKCTpzjWp1hN0q7mDjT7uE8Qea3dUTPQoetG
         N2RgLYU6ouEf0of9WIOwWdBYmcX9AKMbHQG0EO9wUxudPGrUyc9YwSk9xmWSOd8cMGRR
         ii8Dc7b5v42tn0esdn6MFfP0SksW3BnI52v86aRJZXETA/QRpjynbDC4W5EWAtUlTydE
         5DdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVg3gtOYJr5iA0gBEvk6dKdRUxHlJ+zt1jpCLb6t61mDhvaFVRVogDNWaW5UsaZVh/zEa2mB+d5Pho=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbdQo2bJ1E+RfufYhaep6iyzzdPQ622avsqo/F/6TCm/yayk9U
	0oeP5/4jFj2XFCiOWLAKOZLKoxZW1DnJ3FGHKzcQvYk21HiD9pj0Y7FNgeF53Nx2QWed3Jju4qQ
	DAbJ1FiXkjEN/Uic5249Y+soTRvoNkY4KZYGILdaO4A==
X-Gm-Gg: ASbGncvKIZBpnO6iTVI3udQQh6rGGbnuh/J61OFuGOxxw7E2pbkf7dM8V+KPV5HDBc3
	p5w4msL8C0LEE30+4S4X7IXJIseuVEy5YDlLkk+9PRFSJjx2ZaokpTUqNDrzr966itu6HeV12mO
	YsTit94oTSqxplA6NgjtFOEtY/ZVYd7m8HA3vtu4cN
X-Google-Smtp-Source: AGHT+IH9AiO07plJSRhLB6tkJdXaDFzPn2pHd+a7L3X+gKjm+z/Fz4czzaEUCOxKugIFDOgFxL19MklfYzAdFZ2DkVY=
X-Received: by 2002:a05:622a:5811:b0:494:9d34:fca5 with SMTP id
 d75a77b69052e-49f3394f70emr7714631cf.13.1748023701929; Fri, 23 May 2025
 11:08:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com> <aCwuZI7ek7XGaLN7@kernel.org>
In-Reply-To: <aCwuZI7ek7XGaLN7@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Fri, 23 May 2025 14:07:45 -0400
X-Gm-Features: AX0GCFt9InSi-jbnPqjcDUibRJENQKP67YavT0G51MPVz1pVL-VvRvyfzD-NRvg
Message-ID: <CA+CK2bBhe4zcxxgqE2X1OeWrWHr1qP_BQGzE7dRhtr1Rs+0S+w@mail.gmail.com>
Subject: Re: [RFC v2 00/16] Live Update Orchestrator
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
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 3:25=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> Hi Pasha,
>
> On Thu, May 15, 2025 at 06:23:04PM +0000, Pasha Tatashin wrote:
> > This v2 series introduces the LUO, a kernel subsystem designed to
> > facilitate live kernel updates with minimal downtime,
> > particularly in cloud delplyoments aiming to update without fully
> > disrupting running virtual machines.
> >
> > This series builds upon KHO framework [1] by adding programmatic
> > control over KHO's lifecycle and leveraging KHO for persisting LUO's
> > own metadata across the kexec boundary. The git branch for this series
> > can be found at:
> > https://github.com/googleprodkernel/linux-liveupdate/tree/luo/rfc-v2
> >
> > What is Live Update?
> > Live Update is a specialized reboot process where selected kernel
> > resources (memory, file descriptors, and eventually devices) are kept
> > operational or their state preserved across a kernel transition (e.g.,
> > via kexec). For certain resources, DMA and interrupt activity might
> > continue with minimal interruption during the kernel reboot.
> >
> > LUO v2 Overview:
> > LUO v2 provides a framework for coordinating live updates. It features:
> > State Machine: Manages the live update process through states:
> > NORMAL, PREPARED, FROZEN, UPDATED.
> >
> > KHO Integration:
> >
> > LUO programmatically drives KHO's finalization and abort sequences.
> > KHO's debugfs interface is now optional configured via
> > CONFIG_KEXEC_HANDOVER_DEBUG.
> >
> > LUO preserves its own metadata via KHO's kho_add_subtree and
> > kho_preserve_phys() mechanisms.
>
> I've only had time to skip through the patches, one thing that came to mi=
nd
> was that since LUO is quite tightly coupled with KHO maybe we'll put them
> together in, say, kernel/liveupdate?

Thank you Mike, yes, a good idea, I also thought that it would make
sense for them to be in the same place, but initially I thought
perhaps KHO should be moved to misc/liveupdate/, but since it is
already landing in kernel/kexec_*, and it works with a bunch of core
kernel subsystems it makes sense to move LUO and KHO together under
kernel/liveupdate/

Pasha
