Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB9501EFF9A
	for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 16:25:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750955106; cv=none; b=dtGu2+nQ/SwI4Sz4P41klgRlQIsAwiWrSTPsu5NuLG8nGMWPNg3cYd4K67U3nF9b7jnztWhWOAnNI6vg4W0aQcB3Fisf67ro4GxbjcKrSjv/SEu0pNVcfRNOYedC0vdjEneioiL8HXx8wYp8Fqi1gYkXqOn6l0pA1SVeA8dkNbw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750955106; c=relaxed/simple;
	bh=2WtSi6mWLqtNRuZy/c/vTw2eX1kliE8GA7N1s1VWEHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Cf31jz/fptbbpMPcX/Xy0cjrZf1hFyrHYYUuM0FETHMk0QBjNjx4i4gQJqWF8OWwtCIdLeTclToH+WPPWfx7FnJ/eNtX7yyHLolc/ky8k5aePq30RmjU++5CY1KGBOlxQ6LGaBBXl4vMW7LUgKqJD37bEB0eKA8vpk5qv5jQZHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=K3w05Gv0; arc=none smtp.client-ip=209.85.167.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="K3w05Gv0"
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-555024588b1so1475284e87.1
        for <linux-doc@vger.kernel.org>; Thu, 26 Jun 2025 09:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750955103; x=1751559903; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2WtSi6mWLqtNRuZy/c/vTw2eX1kliE8GA7N1s1VWEHE=;
        b=K3w05Gv0L9c1X1VA+5WBxzPbh299GX3vOuX8phDQfbjHv5RIJt4CWiWGPvOSsZJN5K
         k2flx9WHQgv7QYzaFlSZ2is09nnLDGtuvmxsQt9NzPh6TJIlaNb9ST684PbP+Dz+E90m
         qXlrpv19texZaZxrabWIufTnE7i5IlkGE05KTMdyk7KhpHiOK64d7DZb/qvPlzm3gbjp
         ym+x08PMXCHDfioxv338mDES4fVTctMwz2TXaQYnsx+ClXP8OgIduHMxRjaXHXSQt9O2
         D6FJpOZBrLlUyUNgNRy63lvnleLJ+rSto5up6F1EuoiDZml2xkWWWjrhBk5uooNqjVhs
         p2Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750955103; x=1751559903;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2WtSi6mWLqtNRuZy/c/vTw2eX1kliE8GA7N1s1VWEHE=;
        b=me3zbWwhtCRU4emXc5MYyc4Z9tKR/eA02dBE99sRmfuO1mw5+NclWjNqchuaLumyL2
         kC7EniBKnlCb2vAIf8gcCW32iQEN4+S0VBg/17gUgGheu14RqsLaRTqxdZwN1w1luPRd
         N6WW0vrnuUt9qcaqQZSFmHv0nYx3PFvyFurWRIqLobBi533hoWsjwhGIQlMogZAP8qH3
         e6Kjg8kvfR+4U1X9niS17ABLDJZ+bnvXKShFH+cwDTHD5CVraUHlPX5A5UyUCF0mMhDr
         Av2VEHVw2RA0WGCfc9cvXTrjyyKabiqRTRVac9TmyvD6b6cgsXFs+Hr0O41RznoJtKb6
         jlhw==
X-Forwarded-Encrypted: i=1; AJvYcCXZnSEdzcbfPn2fvAhM7yCfw6ao4OJUaf06SU0MYKgb2i7iHR9fzjst/bfbEMdEYxhjcwP9D4IOoaQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz050eHCDtNUU2pkGmDjD8N2CkdcDzQBgCDFzMJ+8Novc7Mm/vk
	hALaYpGm0xqtU4JxT2C+3aAs3vKQ7d3FCAZz8WToVSBVLZtjFeL+owzLIbKgE3fEGbpUQwdS2Yn
	j7jc7qTap9iVgkewsUBnnEOX7ZPsQ1TM4nOKHiI/h
X-Gm-Gg: ASbGncur/50oG1KTi52LtnyUB6XRxyBlJD+MH47OUP8yAMNfc7DcoD+dTjKUp4vXzs/
	fg6p2m4J1LqSpQ0EEQMyTiwrWWyqekJaCK4Mmgmwoi1lBB26sfuALR3BaJi+f6qZAqxnohwFoma
	UuiZl3SBIMjta44dJaqTG72EHo2v2v489y9XveXRMnihs=
X-Google-Smtp-Source: AGHT+IGyhDEU8cUvSqOo67s+WNUbKjEMkKdKLPAvSvNXA9Mo1SyCdKcZHxuaEfWS6UPDD7wJ32zJpLgtv+MCjRZ8GBY=
X-Received: by 2002:a05:6512:3d8b:b0:553:24b7:2f6f with SMTP id
 2adb3069b0e04-5550b9fe64fmr76705e87.51.1750955102642; Thu, 26 Jun 2025
 09:25:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <20250624-akzeptabel-angreifbar-9095f4717ca4@brauner>
 <CA+CK2bBu4ex9O5kPcR7++DVg3RM8ZWg3BCpcc6CboJ=aG8mVmQ@mail.gmail.com>
 <20250625-akrobatisch-libellen-352997eb08ef@brauner> <CALzav=d+XgS1bUs-v7+ws5nYU9y=4uc1c8oVLHrJ16qLpnUi9Q@mail.gmail.com>
 <mafs0sejmse57.fsf@kernel.org>
In-Reply-To: <mafs0sejmse57.fsf@kernel.org>
From: David Matlack <dmatlack@google.com>
Date: Thu, 26 Jun 2025 09:24:35 -0700
X-Gm-Features: Ac12FXzkqemS34rQSDokhQ5hdwtdPGENZ3MZ1wEJgcl6xG2sOAPyUhBM04Y4Dv4
Message-ID: <CALzav=dhuoaS73ikufCf2D11Vq=jfMceYv0abdMxOdaHzmVR0g@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Christian Brauner <brauner@kernel.org>, Pasha Tatashin <pasha.tatashin@soleen.com>, jasonmiu@google.com, 
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
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 26, 2025 at 8:42=E2=80=AFAM Pratyush Yadav <pratyush@kernel.org=
> wrote:
>
> On Wed, Jun 25 2025, David Matlack wrote:
>
> > On Wed, Jun 25, 2025 at 2:36=E2=80=AFAM Christian Brauner <brauner@kern=
el.org> wrote:
> >> >
> >> > While I agree that a filesystem offers superior introspection and
> >> > integration with standard tools, building this complex, stateful
> >> > orchestration logic on top of VFS seemed to be forcing a square peg
> >> > into a round hole. The ioctl interface, while more opaque, provides =
a
> >> > direct and explicit way to command the state machine and manage thes=
e
> >> > complex lifecycle and dependency rules.
> >>
> >> I'm not going to argue that you have to switch to this kexecfs idea
> >> but...
> >>
> >> You're using a character device that's tied to devmptfs. In other word=
s,
> >> you're already using a filesystem interface. Literally the whole code
> >> here is built on top of filesystem APIs. So this argument is just very
> >> wrong imho. If you can built it on top of a character device using VFS
> >> interfaces you can do it as a minimal filesystem.
> >>
> >> You're free to define the filesystem interface any way you like it. We
> >> have a ton of examples there. All your ioctls would just be tied to th=
e
> >> fileystem instance instead of the /dev/somethingsomething character
> >> device. The state machine could just be implemented the same way.
> >>
> >> One of my points is that with an fs interface you can have easy state
> >> seralization on a per-service level. IOW, you have a bunch of virtual
> >> machines running as services or some networking services or whatever.
> >> You could just bind-mount an instance of kexecfs into the service and
> >> the service can persist state into the instance and easily recover it
> >> after kexec.
> >
> > This approach sounds worth exploring more. It would avoid the need for
> > a centralized daemon to mediate the preservation and restoration of
> > all file descriptors.
>
> One of the jobs of the centralized daemon is to decide the _policy_ of
> who gets to preserve things and more importantly, make sure the right
> party unpreserves the right FDs after a kexec. I don't see how this
> interface fixes this problem. You would still need a way to identify
> which kexecfs instance belongs to who and enforce that. The kernel
> probably shouldn't be the one doing this kind of policy so you still
> need some userspace component to make those decisions.

The main benefits I see of kexecfs is that it avoids needing to send
all FDs over UDS to/from liveupdated and therefore the need for
dynamic cross-process communication (e.g. RPCs).

Instead, something just needs to set up a kexecfs for each VM when it
is created, and give the same kexecfs back to each VM after kexec.
Then VMs are free to save/restore any FDs in that kexecfs without
cross-process communication or transferring file descriptors.

Policy can be enforced by controlling access to kexecfs mounts. This
naturally fits into the standard architecture of running untrusted VMs
(e.g. using chroots and containers to enforce security and isolation).

>
> >
> > I'm not sure that we can get rid of the machine-wide state machine
> > though, as there is some kernel state that will necessarily cross
> > these kexecfs domains (e.g. IOMMU driver state). So we still might
> > need /dev/liveupdate for that.
>
> Generally speaking, I think both VFS-based and IOCTL-based interfaces
> are more or less equally expressive/powerful. Most of the ioctl
> operations can be translated to a VFS operation and vice versa.
>
> For example, the fsopen() call is similar to open("/dev/liveupdate") --
> both would create a live update session which auto closes when the FD is
> closed or FS unmounted. Similarly, each ioctl can be replaced with a
> file in the FS. For example, LIVEUPDATE_IOCTL_FD_PRESERVE can be
> replaced with a fd_preserve file where you write() the FD number.
> LIVEUPDATE_IOCTL_GET_STATE or LIVEUPDATE_IOCTL_PREPARE, etc. can be
> replaced by a "state" file where you can read() or write() the state.
>
> I think the main benefit of the VFS-based interface is ease of use.
> There already exist a bunch of utilites and libraries that we can use to
> interact with files. When we have ioctls, we would need to write
> everything ourselves. For example, instead of
> LIVEUPDATE_IOCTL_GET_STATE, you can do "cat state", which is a bit
> easier to do.
>
> As for downsides, I think we might end up with a bit more boilerplate
> code, but beyond that I am not sure.

I agree we can more or less get to the same end state with either
approach. And also, I don't think we have to do one or the other. I
think kexecfs is something that we can build on top of this series.
For example, kexecfs would be a new kernel subsystem that registers
with LUO.
