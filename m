Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62BDF333730
	for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 19:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764097337; cv=none; b=Zf7jbU91i6OomVKPHR1s9zwBRSyKR+WMGt79DvV9gE6e/ZEdNTkDvWWbZLKd+z97ib/olfyA8NKUd8kMzjTWMWjbbaq5yofdK/hbUiI0C9eeGvOqtOYMvNTxoV5DNXHKgO3Ecx71vEVvrAPT6RvgyX/6TZM9K6E3ybxco+IZZXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764097337; c=relaxed/simple;
	bh=970Jb+cB9ffJi62n0bHygDXaRpTlD4aGe7LWlTUIJZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ug9zQtf8l0WStEEm1QfejHqF2QPnTDJI9widE9RI2ODPjJYzsVn3r0jxXDRETeCJioMzAbs3VPLuxsvDn+z+7ASw40Dp2+fQ7RS8g3WLfz9KQU3SIPyNoJwkcR9cKThInzmB0M0HHEMqOmpmvQNe1rw4uK07c2SzYFxYNB0ZqZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=gjMrjYY5; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="gjMrjYY5"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-6431b0a1948so9650105a12.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Nov 2025 11:02:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1764097331; x=1764702131; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pZbg8SojFwo+/6fxa8iIzTLQdoY14/XcMqsoNhFxHBw=;
        b=gjMrjYY5GBjOZSduxmGCi0mye3OS//v0ahFGiXsrBehZSlZYRcq4eRg/5r2b+hN3wD
         gZHAikeiLOO2kR2OqwBTg9l4Or/abgqYYcRkMdBhCJNwYzA+9+FZncL+kJpDsR3Ct72+
         1GkH70UuUEZXYAojQIFuCih1qQPBCXL2+wdwHfwWpk51F6UgHzBkU5U86D67bpRvAvWk
         FcQ/yn2ItuAyHfuIQQdKKXrNH5Q1Hc4b10wI5j7sLM/ydMTJu5VfOfvD4b6eauv+9ySK
         ORFCN5I1UCP8ML2unix4Seh8s4XWJMq13X2R7nmnFOoJ9wJIJSckRQ52QLQXfl5M6uFT
         N2yA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764097332; x=1764702132;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pZbg8SojFwo+/6fxa8iIzTLQdoY14/XcMqsoNhFxHBw=;
        b=Z9n6XD3W3NS1GFEj+FD938lpgFrZALvTx06Ws7IWXOOXsP6n4MSnrsq2t44Lkvlj3O
         KuskG1/sIj+x4TLyJ+XXt0/+gChBv2XDXU3FoeD1qPLHjqjMFfd/+ro465NgSrhaISUA
         PpsG828hSIn3ZFJBKJnygCZwDW7hD37spE5jidbnx3f3vGG1VWCSq8kh67oX0bQbyZAK
         zZuo+T4JD3m13l3LOtXi1UvQa6wIYma5hQr3R5quVvjQID33UYKKWkjSZro8pLPSLlTG
         st8ExlAcplZe5ul5UNIfS87sVfEJhaP76Irh7Ua+z7/FAeqwVJiIzPs2bOsmY8uSq7Vb
         vfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOMlvFFepTGTRSpWCVfA/Zk8YK0O4y4O8mIQMuDy1/4K5atmezgGLfc5kMmRcrmi/g2c7cQe2pSos=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9XyFXvwLnQgfrV+96UZOhEJ4sOxqxb8d+nKROndirPWVqsSPq
	vPtPcp+OEzvAmlnse1z9TE89070sZHeFd/vghXWU1TkFWPTl6mBk0ba6KcG/DJ9UsN7UWWwpqza
	J0zk3lfXsJj6WjW6x81vnNpOR28q2AHuuET+sVED00g==
X-Gm-Gg: ASbGnct9kBE+6Yf6waNp/rdpfeUwv9PyOw9paVT2pA5liUvzrgVhhctJDo3O+nkWwTW
	XhdBGm3nhHMMer2hqzq0VopIj9APO1sD5LZvkZ5+9usYPZr9m7C8MF+KQZ39uazBOK0YC2blcc1
	ZhS9cudSV3DXqqEp2tDXpi4jn/JHikt7od+iT8QMJo7R0TZw0UWZuSMvA6pl1DYSy90/mtJ6lfB
	fXDPaDxrXOxt7DxJaxefQp9HicEfp4qGKUa2Fx4hqfBn/rG4XmV1H5fbEyXVCeXpR6p
X-Google-Smtp-Source: AGHT+IHaJ/LbREE5Jpzko9OcKbnJBE1+OgV3WfTKWJciDLFdWD0t5cmLQ1AQFk0Y1AJ05l0WSop6DSkyv43G2Zwocz4=
X-Received: by 2002:a17:907:9720:b0:b6d:5262:a615 with SMTP id
 a640c23a62f3a-b76c5630b03mr446231166b.41.1764097331448; Tue, 25 Nov 2025
 11:02:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125165850.3389713-1-pasha.tatashin@soleen.com> <aSX19cWypvh1mKWM@google.com>
In-Reply-To: <aSX19cWypvh1mKWM@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Nov 2025 14:01:34 -0500
X-Gm-Features: AWmQ_bmdDcUwBBud3cZl0TGUz3iSEuxf2L3NoBzXOoPUOHJetvLBDiXl30iG0_Y
Message-ID: <CA+CK2bCq3K3dd1a+OGtsqGHpraFZcbxc_LCGt2CPz6euFD=_CQ@mail.gmail.com>
Subject: Re: [PATCH v8 00/18] Live Update Orchestrator
To: David Matlack <dmatlack@google.com>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, rppt@kernel.org, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 1:31=E2=80=AFPM David Matlack <dmatlack@google.com>=
 wrote:
>
> On 2025-11-25 11:58 AM, Pasha Tatashin wrote:
> >
> > Pasha Tatashin (12):
> >   liveupdate: luo_core: Live Update Orchestrato,
> >   liveupdate: luo_core: integrate with KHO
> >   kexec: call liveupdate_reboot() before kexec
> >   liveupdate: luo_session: add sessions support
> >   liveupdate: luo_core: add user interface
> >   liveupdate: luo_file: implement file systems callbacks
> >   liveupdate: luo_session: Add ioctls for file preservation
> >   docs: add luo documentation
> >   MAINTAINERS: add liveupdate entry
> >   selftests/liveupdate: Add userspace API selftests
> >   selftests/liveupdate: Add simple kexec-based selftest for LUO
> >   selftests/liveupdate: Add kexec test for multiple and empty sessions
> >
> > Pratyush Yadav (6):
> >   mm: shmem: use SHMEM_F_* flags instead of VM_* flags
> >   mm: shmem: allow freezing inode mapping
> >   mm: shmem: export some functions to internal.h
> >   liveupdate: luo_file: add private argument to store runtime state
> >   mm: memfd_luo: allow preserving memfd
> >   docs: add documentation for memfd preservation via LUO
>
> I ran all the new selftests, including those that require kexec on an
> Intel EMR server, and all tests passed.
>
> Tested-by: David Matlack <dmatlack@google.com>

Great, thank you David!

Pasha
