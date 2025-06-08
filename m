Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37333201266
	for <linux-doc@vger.kernel.org>; Sun,  8 Jun 2025 15:08:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749395328; cv=none; b=a8ogyL93dCM7Alh7lxfz3YpB3nw4ww3NS7SImPnGKihtcPY8NoSYh8C0Bd4KEeD72my/odKCpxyFsRmW1LLn621iN2dlx0aRaLOsAxkG/czL4Xxbg8aXM5roJANg2Y3Way9gFwcJIMePR75llWICxsfMOChbPR866T70YNwLxaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749395328; c=relaxed/simple;
	bh=RiBPPqH3cfvIyD2u2C3gJbSOjM0gUID+3lZejJ4EnUw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KiLoZfsD1auV6VkREVCrKSostkkBDFBWxEEyEDINbDguK448ZToDXKZz+afm42VNcpEHT6G+dubsfGEOhpoOu7zYZjA5JP7fG9S8dLl/JBYvPcXJAFvIGviUS8id3JXVnv0Gr0MsrrflKSj7R5tg9RXaRFhwBt7BYNwCNktMzX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=aLX6eM5q; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="aLX6eM5q"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-4a4323fe8caso23594731cf.2
        for <linux-doc@vger.kernel.org>; Sun, 08 Jun 2025 08:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1749395325; x=1750000125; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lzuRPFYIZRvhRVOmWKy01BEcZ/VAU38+zCshzHdk5c8=;
        b=aLX6eM5qvBiY9fPMLXXaBJC8UcSpmUTerKaf6eKfCfKRbk42mCI65Uc+9aJLuFXnqG
         G1uMLg5GfI/KOG4SD2Wyi3yNzkZnWM42AWekznmvZTM7ClruRaC3mszSLVUvNbIklqc9
         kjs+aUxk7ccTHf7tgLJSnNjQFmuPuzQvDkBS4hxjHnNuq1UjOPa2p2J42TWNZCKU9FW8
         0SDZAwyfwYzwsh7sUUOtdFP9TKUOUQOugqSX+czOgB1Usq5CmnYY/+ViRCJzRuvsGerB
         VuS672lex+Jic7VuGnuvCCD6IytVoDJbd1x1Smn524s7p451/SGRSgjnlvLq17fMFUri
         Jabg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749395325; x=1750000125;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzuRPFYIZRvhRVOmWKy01BEcZ/VAU38+zCshzHdk5c8=;
        b=kcJAE4iYJKfADpdvdS5h+DI6fNOljlly5CGLrEDnmdJEEtNObL8yGXA3HumdIwFjbH
         5kSf1pBMOtVuM8w5NyKkpMHi+NEFigcwUAYQ/VsAijWuJzrfCdgEFQEgdIXD5diMRg4i
         qh1ZShZ7UxsN7NUe1iPYFhcJ/s8DhWq7dMxlAu9falNRETTRs6VUhETnXfILYR4B5bw/
         +GauCpQeemhpmqOKeWRTo/4ug8MS738iA6UIV9HZRigWL0Vawx7EirHFw6+J1zq/22uB
         S1OXPKN6LuXkie2wdLdBIAkE4xINBevkX7qH4h98AK+LuMNhxtsNt/katMPh0qYq/PVh
         IQ/g==
X-Forwarded-Encrypted: i=1; AJvYcCUPZmBkXe/eemgqrScsf+CfIhecYNjL/o///sbYe8jfOm6cZYkjahQV1S2QvVWE1+7yxUkSIOYvmL4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyFxrFOUPEJJB50bPlloNLKqUaG0SOO0N1hyyIKwIF4nn3XrR2E
	UkEMy2SpT6n6Ld/VP1cAAr0Irbj2mVqeGA4oQD55iiT8DKYfsxbgahry3UMzc0XKRASAZ1rE3dF
	7m7b8SCZhtuqdgu982rQY7Z78bZ0/IL55eLahdbo71w==
X-Gm-Gg: ASbGncu/dLv6Bf830AJSbijkpLXyuwXn5rkABVmTk4fIoIogPoS40JKxQMg6fVsE2Md
	mZpQRfMrvuJiOVNhfdUfsxYDYAXL9hoGJXYVN2sfyWBPq1y/yoOVqKAwS/A3+XMDaCWuB36x7qU
	Mw55EDm0MS4ggmOZTBa8kJuqaXoVspKg==
X-Google-Smtp-Source: AGHT+IE6Wavjh9lcZ08UG2JWQl0zBb+su/qycW7Wdsq/33CsGFoBpF8qSQTR9wAEzhKeUToBRdcuafqk0yX/KDtvId8=
X-Received: by 2002:a05:622a:411b:b0:4a6:f99c:395f with SMTP id
 d75a77b69052e-4a6f99c3abdmr46534851cf.44.1749395325030; Sun, 08 Jun 2025
 08:08:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-11-pasha.tatashin@soleen.com> <aDQpfiykuRrk_xnr@kernel.org>
In-Reply-To: <aDQpfiykuRrk_xnr@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Sun, 8 Jun 2025 11:08:07 -0400
X-Gm-Features: AX0GCFv10U-Kg40y4yXNpa11mJu1sY2K43SsH2vGJvqSKTOZOwQxZ_Kd2f14iWc
Message-ID: <CA+CK2bBrH6ExCzWMpzHpX6vUFvSW6ca_edR_hzEj84xLw20UXQ@mail.gmail.com>
Subject: Re: [RFC v2 10/16] luo: luo_ioctl: add ioctl interface
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

On Mon, May 26, 2025 at 4:43=E2=80=AFAM Mike Rapoport <rppt@kernel.org> wro=
te:
>
> On Thu, May 15, 2025 at 06:23:14PM +0000, Pasha Tatashin wrote:
> > Introduce the user-space interface for the Live Update Orchestrator
> > via ioctl commands, enabling external control over the live update
> > process and management of preserved resources.
> >
> > Create a misc character device at /dev/liveupdate. Access
> > to this device requires the CAP_SYS_ADMIN capability.
> >
> > A new UAPI header, <uapi/linux/liveupdate.h>, defines the necessary
> > structures. The magic number is registered in
> > Documentation/userspace-api/ioctl/ioctl-number.rst.
> >
> > Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
>
> ...
>
> > -/**
> > - * enum liveupdate_state - Defines the possible states of the live upd=
ate
> > - * orchestrator.
> > - * @LIVEUPDATE_STATE_NORMAL:         Default state, no live update in =
progress.
> > - * @LIVEUPDATE_STATE_PREPARED:       Live update is prepared for reboo=
t; the
> > - *                                   LIVEUPDATE_PREPARE callbacks have=
 completed
> > - *                                   successfully.
> > - *                                   Devices might operate in a limite=
d state
> > - *                                   for example the participating dev=
ices might
> > - *                                   not be allowed to unbind, and als=
o the
> > - *                                   setting up of new DMA mappings mi=
ght be
> > - *                                   disabled in this state.
> > - * @LIVEUPDATE_STATE_FROZEN:         The final reboot event
> > - *                                   (%LIVEUPDATE_FREEZE) has been sen=
t, and the
> > - *                                   system is performing its final st=
ate saving
> > - *                                   within the "blackout window". Use=
r
> > - *                                   workloads must be suspended. The =
actual
> > - *                                   reboot (kexec) into the next kern=
el is
> > - *                                   imminent.
> > - * @LIVEUPDATE_STATE_UPDATED:        The system has rebooted into the =
next
> > - *                                   kernel via live update the system=
 is now
> > - *                                   running the next kernel, awaiting=
 the
> > - *                                   finish event.
> > - *
> > - * These states track the progress and outcome of a live update operat=
ion.
> > - */
> > -enum liveupdate_state  {
> > -     LIVEUPDATE_STATE_NORMAL =3D 0,
> > -     LIVEUPDATE_STATE_PREPARED =3D 1,
> > -     LIVEUPDATE_STATE_FROZEN =3D 2,
> > -     LIVEUPDATE_STATE_UPDATED =3D 3,
> > -};
> > -
>
> Nit: this seems an unnecessary churn, these definitions can go to
> include/uapi from the start.

True, but we do not have a user api at that moment yet :-)

>
> > diff --git a/include/uapi/linux/liveupdate.h b/include/uapi/linux/liveu=
pdate.h
> > +/**
> > + * struct liveupdate_fd - Holds parameters for preserving and restorin=
g file
> > + * descriptors across live update.
> > + * @fd:    Input for %LIVEUPDATE_IOCTL_FD_PRESERVE: The user-space fil=
e
> > + *         descriptor to be preserved.
> > + *         Output for %LIVEUPDATE_IOCTL_FD_RESTORE: The new file descr=
iptor
> > + *         representing the fully restored kernel resource.
> > + * @flags: Unused, reserved for future expansion, must be set to 0.
> > + * @token: Output for %LIVEUPDATE_IOCTL_FD_PRESERVE: An opaque, unique=
 token
> > + *         generated by the kernel representing the successfully prese=
rved
> > + *         resource state.
> > + *         Input for %LIVEUPDATE_IOCTL_FD_RESTORE: The token previousl=
y
> > + *         returned by the preserve ioctl for the resource to be resto=
red.
> > + *
> > + * This structure is used as the argument for the %LIVEUPDATE_IOCTL_FD=
_PRESERVE
> > + * and %LIVEUPDATE_IOCTL_FD_RESTORE ioctls. These ioctls allow specifi=
c types
> > + * of file descriptors (for example memfd, kvm, iommufd, and VFIO) to =
have their
> > + * underlying kernel state preserved across a live update cycle.
> > + *
> > + * To preserve an FD, user space passes this struct to
> > + * %LIVEUPDATE_IOCTL_FD_PRESERVE with the @fd field set. On success, t=
he
> > + * kernel populates the @token field.
> > + *
> > + * After the live update transition, user space passes the struct popu=
lated with
> > + * the *same* @token to %LIVEUPDATE_IOCTL_FD_RESTORE. The kernel uses =
the @token
> > + * to find the preserved state and, on success, populates the @fd fiel=
d with a
> > + * new file descriptor referring to the fully restored resource.
> > + */
> > +struct liveupdate_fd {
> > +     int             fd;
> > +     __u32           flags;
> > +     __u64           token;
> > +};
>
> Consider using __aligned_u64 here for size-based versioning.

Good suggestion, added.

>
> > +
> > +/* The ioctl type, documented in ioctl-number.rst */
> > +#define LIVEUPDATE_IOCTL_TYPE                0xBA
>
> ...
>
> > +/**
> > + * LIVEUPDATE_IOCTL_EVENT_PREPARE - Initiate preparation phase and tri=
gger state
> > + * saving.
>
> This (and others below) is more a command than an event IMHO. Maybe just
> LIVEUPDATE_IOCTL_PREPARE?

Renamed.

>
> > + * Argument: None.
> > + *
> > + * Initiates the live update preparation phase. This action correspond=
s to
> > + * the internal %LIVEUPDATE_PREPARE kernel event and can also be trigg=
ered
>
> This action is a reason for LIVEUPDATE_PREPARE event, isn't it?
> The same applies to other IOCTL_EVENTS

It is.

>
> > + * by writing '1' to ``/sys/kernel/liveupdate/prepare``. This typicall=
y

Oops, this is a leftover from LUO RFCv1, fixed.

> > + * triggers the main state saving process for items marked via the PRE=
SERVE
> > + * ioctls. This occurs *before* the main "blackout window", while user
> > + * applications (e.g., VMs) may still be running. Kernel subsystems
> > + * receiving the %LIVEUPDATE_PREPARE event should serialize necessary =
state.
> > + * This command does not transfer data.
>
> I'm not sure I follow what this sentence means.

Fixed

Thanks,
Pasha
