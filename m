Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B8032BF3DB
	for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 16:13:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750868000; cv=none; b=XoN6KCt9/o043ZRtVtVXx9MRM0nJpaZievOeeQERc7AkocE053ptETLs91PGMlg6BwhGk/KfHTHqe1l0ExUhPlPHUyYuGZk1z5UffoK/Lc95ugTC0Kbzepe+TQoI8nGqy2yrWS1qbzKB38d33UcblyFl/IZbiw4hdQsp88Ntm7g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750868000; c=relaxed/simple;
	bh=NWTU9KjLztibLwJOI0I2c5PwZ/pOAGxqqconYH3Cu6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SR/8dWu3hjsNSA7lSQQMv5K4IOoB/wNR2sFUrT9dj8tn62Na4XgxujhXYYnNaVnhfKzMAmK5jJNFJ2z77Jl8InFO6s+/9wYIvvD5P7dpgkakFSbkcC6hx/OVxgkjzbknu/ZmnuD48s8LeDJJj+K2aDSzcj0tiXq+/wM+dT1qI6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=d18ef1gJ; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="d18ef1gJ"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-553b51f5218so47840e87.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Jun 2025 09:13:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750867997; x=1751472797; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NWTU9KjLztibLwJOI0I2c5PwZ/pOAGxqqconYH3Cu6w=;
        b=d18ef1gJJayIhzCC0CNsLd/2Qze/q+j7hLkQfhBdhiTcZxM4uT4NNZdj0Girdi1acT
         VJZcaWyHkcpcF/kntSP2kOG6J4Tp/0sXDN1fNfFYjqZJnC72A8HRShyPval3ElEYtkuP
         5vlTmAI7zxhkcXNG8YYfB23poAKIYZEmTK91f75wv0pLI6i6v6UNjpMUof6HjQTBvuOO
         SEceLBeWkkxksXbuMxm33yC2raH+GsGPpWqAoPvnIAdysjh/3aZ/X4ad+qO/JKvoaxDW
         31Et4fd25h+fzq23RJ1WKxGWlxxiRTgQVfSu3WN3rFqkCUSkYS0WVvWGd4+G1qUeXe91
         hFuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750867997; x=1751472797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NWTU9KjLztibLwJOI0I2c5PwZ/pOAGxqqconYH3Cu6w=;
        b=vaN17OXX6elytJqtxXRSVAsjr0NlNR3SLPnDxidfsvOU/LL7+n1/7Cv7kafpAGYLZ5
         Twzpj3WThMLI1BGoYC73EnWrOYDJC2KH9yYQqq185vTkkJ4TtwwVfpxR3098mMe3U62j
         qzjgZOdOcMMAB8Lgb37VCfomBH/J9RgcdiFikkmrE5f4ohCcTAk3Aig+7EWakHS2HT1h
         DbNEMRpBtny7G65LgRUxm2TTJcfl5qKu3Z8NLa+kubGjQRHzD21InSMRmvWCmj+rMDIH
         0dEy03e1kA8yp3ImApAEnrMlOOWKqICBzYUJFaBtXaUPy2i4xF7h4R8Hh3l7Dpjc4WWS
         bHvA==
X-Forwarded-Encrypted: i=1; AJvYcCUl0mItxdk0wRsa3yf2wxDxxcYCHHEKkvZmJ7c8sZI39OnJP+U9zRGTPKm62bi+Y7zVbssd8yRHEWo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxtkx/CD4Yo7/5tbMk7B0i/9VgD7FivSh2ngHnmvFvDH0M0hYVY
	b69lJBqbHDyinILGWUI6abYvO+G2lNwIfAacUpqGve2hl2nKnexIcPdqHLdRpIV2SI3liMbVq04
	eXoRlD7XoTtPc/22+IK7/3Hpttt495+vIc8/NAf7j
X-Gm-Gg: ASbGncswaRZ9CD0lL/OLdMH51mYCFVu39sOsOe60+7xaNseIpjP5oDbEh9VZaHfCpGa
	P29OSJ6b/HPFkXcNY+F7W+SPGOWv93+IEMOUkSfPhfQ2RTsngsr5k1lSQLS+n0iHquamNdTQlgj
	DQLjo/EOiodq17NunmWHoCUonjDLWu4G3dm7lsEpoW8AA=
X-Google-Smtp-Source: AGHT+IEmyNKuINV9suiw750iH+/qWaKx6g6apKTMylHrEHA2ab9ubUUotR8hKdCWlG9C6/ymBT3mjUvzDbJ2PDC7/J0=
X-Received: by 2002:a05:6512:132a:b0:553:ac33:ff24 with SMTP id
 2adb3069b0e04-554fdfbcef6mr1162599e87.55.1750867996478; Wed, 25 Jun 2025
 09:13:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com> <20250625-akrobatisch-libellen-352997eb08ef@brauner>
In-Reply-To: <20250625-akrobatisch-libellen-352997eb08ef@brauner>
From: David Matlack <dmatlack@google.com>
Date: Wed, 25 Jun 2025 09:12:48 -0700
X-Gm-Features: Ac12FXzsaTglwRDvyxmqrDF18P44C8borysbshJSxnL6KDEw4fT_csftD9wd1t8
Message-ID: <CALzav=d+XgS1bUs-v7+ws5nYU9y=4uc1c8oVLHrJ16qLpnUi9Q@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Christian Brauner <brauner@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>, pratyush@kernel.org, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, rppt@kernel.org, rientjes@google.com, 
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

On Wed, Jun 25, 2025 at 2:36=E2=80=AFAM Christian Brauner <brauner@kernel.o=
rg> wrote:
> >
> > While I agree that a filesystem offers superior introspection and
> > integration with standard tools, building this complex, stateful
> > orchestration logic on top of VFS seemed to be forcing a square peg
> > into a round hole. The ioctl interface, while more opaque, provides a
> > direct and explicit way to command the state machine and manage these
> > complex lifecycle and dependency rules.
>
> I'm not going to argue that you have to switch to this kexecfs idea
> but...
>
> You're using a character device that's tied to devmptfs. In other words,
> you're already using a filesystem interface. Literally the whole code
> here is built on top of filesystem APIs. So this argument is just very
> wrong imho. If you can built it on top of a character device using VFS
> interfaces you can do it as a minimal filesystem.
>
> You're free to define the filesystem interface any way you like it. We
> have a ton of examples there. All your ioctls would just be tied to the
> fileystem instance instead of the /dev/somethingsomething character
> device. The state machine could just be implemented the same way.
>
> One of my points is that with an fs interface you can have easy state
> seralization on a per-service level. IOW, you have a bunch of virtual
> machines running as services or some networking services or whatever.
> You could just bind-mount an instance of kexecfs into the service and
> the service can persist state into the instance and easily recover it
> after kexec.

This approach sounds worth exploring more. It would avoid the need for
a centralized daemon to mediate the preservation and restoration of
all file descriptors.

I'm not sure that we can get rid of the machine-wide state machine
though, as there is some kernel state that will necessarily cross
these kexecfs domains (e.g. IOMMU driver state). So we still might
need /dev/liveupdate for that.
