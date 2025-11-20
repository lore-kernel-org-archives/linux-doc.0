Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42FC72D8372
	for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 19:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763667800; cv=none; b=NcXaeqiV8STZpSe5yyDJLv3iQ5If+HE02FoKr3LIeO3fmHmeBQzBYFrDIf4GwflhWdPiuuAjF1YaGu+A2clfQowmzMfjz+VCBPhsPpmAB5OgCJWAVl8iFTsrXcQtgHfBDryuSLPzzuaiq/g61nGrpy1vSfA7SaK5vNUa3+v3Cd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763667800; c=relaxed/simple;
	bh=J0ISvo7oGGx2XMTRMYzlrvz8O6mEdN7rqUcNJBXwRJg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lWXkIbm6MXGr7cmu5/h2WDjWLtkpITQL5OaMuhUKyPWC0TI+/kgKDWGSFmsAVtP/gu2XedpKRwQ5QfikAgrEAZ2d1Qan4ydMbUOqUCdQvqcLp2m0mqxwvD+sr0f1uyFZszZuBB8ZftcuKCz6g64Nd198A3O+mp1Lokj5S1Zd8gU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BXua4HGm; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BXua4HGm"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-37a49389deeso8527821fa.0
        for <linux-doc@vger.kernel.org>; Thu, 20 Nov 2025 11:43:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763667796; x=1764272596; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jOb5k3bbgLdxLAU2xBUhkNf6M8DrTXlh4mqXRt4KFAI=;
        b=BXua4HGmpbDOq48gQaoCoH6BAhPu8UVSID1z9gub+SfUGmpRKN9vBERIgzn6b//Lng
         vD+yWQ72igMHrHNZSBxlzB3NKFHaYYbSyhnAw2xn6Pk577SXHeWyICDazSa3UEbcW+u6
         FORDQaQznjENEJXxm0GCz5R/p5Ium/d9d21KtSpymRIQ+NTRjcpR/dR/7vNVncEZjKRf
         F+ovLA4abK9RNa44yihms8d3O4jTMJskGSZg7Q/HHLAZKTvofJV1ZM2GR53uqrDt/1lk
         EeysRfzdLM/53BB89x5OG/HXbi3vryVKL7oLv68DDCDv6Um7NJI9ORi6f7SczqB5IfNd
         Le9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763667796; x=1764272596;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jOb5k3bbgLdxLAU2xBUhkNf6M8DrTXlh4mqXRt4KFAI=;
        b=RE+WNqi1elAAvkrleh39x2tVKCsAbO9mP/5TkDYsrESoyrjQNkEQdzsrg5M2Yq6m0K
         GUshFHrMSJK3XlRZL7SWsku144Q/Yf/xemkyCzJdnzItFy5gyl/sHKeA0UGN7eN5fxTK
         ChR7D59NiZqdrxtH0GNmc9O241F6i1yWy58UYgujcy+pAXmKYStGk61xQeGkA/4wMfRw
         mgwsGwVxNIl2Op1M9M3qN614W4saFzSVIWuAggA92Tf3lLq6aALloig8BJNpx/D/4Vw7
         eL3LLY0A3UrK/JM6lYvAJXwh2Fei7U4yi39t4LKZmCFqOSRzNg/JPu1X1p1ayiQGRglx
         0XoA==
X-Forwarded-Encrypted: i=1; AJvYcCVTPDN75/bn79XhYBWVEb3MQPed78JSNp3t3fyHBHMuszIdjcM0t4a+3OOH6Q8K24JXZuAW2dnHB8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKSy3CBBxEfKWp6Zf4vZhEl/4+FHZlgjtfzzqLeMV/L/c2z0Kn
	+GiOVfJc0O4BnQRkJBbcm5HRzWJlPobs6LermmSBztzDXNPtDHqIBdbd/fd4LdNbwc6xOgsQKqW
	1Z8Pqln1CIOHeWNHWd82lPHjaPwpB5U4nF+wQJV5N
X-Gm-Gg: ASbGnctV4plvPgEUD3YXxBFzTw4rB3vxWfZYBVHe5cRZTzLCwl/hTnNIh6AwSmCYOfD
	apcQ0nKM/54bEbjKOAQ9pMMxqu7iUhs05nmtZueWZNzVRO4NRAfoNjpFN7L5n3B5AlDsuf43yA/
	0hi0FNnQKyumptUUQeD3HsYkm+0P5OQX/3cMz9TSW7K56ZFUbK/nUu0TFDY7pL9a8XiRQtP0Uah
	WJgc7cyTaSqmLdse/TZXx8yAd8NvxV/M6wgtZy6+diulqFswM8xGSwzJ6lMD+8ISjU+w4Y=
X-Google-Smtp-Source: AGHT+IHcyfhgJOxNFwVB1wmP5vbwR6JERZRpaFBPUMh7cIOOgFdIrerxF5fqZb7M8NqokF29pYgwiXqXN0SorsacWb4=
X-Received: by 2002:a05:6512:3093:b0:594:346f:4850 with SMTP id
 2adb3069b0e04-5969e331044mr1508727e87.49.1763667795875; Thu, 20 Nov 2025
 11:43:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-6-pasha.tatashin@soleen.com> <CALzav=c-KJg8q8-4EaDC1M+GErTCiRKtn5qRbh1wa08zJ0N4ng@mail.gmail.com>
 <CA+CK2bD4Y3CMHcTGKradmv-hAbdtA7zsw2CYeh7-8LNianYMZw@mail.gmail.com>
In-Reply-To: <CA+CK2bD4Y3CMHcTGKradmv-hAbdtA7zsw2CYeh7-8LNianYMZw@mail.gmail.com>
From: David Matlack <dmatlack@google.com>
Date: Thu, 20 Nov 2025 11:42:47 -0800
X-Gm-Features: AWmQ_blhAAizSjkijMqBfleikcubXUn4oYnXzPUSaeKAUDCiwV_6zW22M0WcB8M
Message-ID: <CALzav=dmFQr+BrqzRDgio0q68MPRVnZPK4-wUXVj47o1FObgNg@mail.gmail.com>
Subject: Re: [PATCH v6 05/20] liveupdate: luo_ioctl: add user interface
To: Pasha Tatashin <pasha.tatashin@soleen.com>
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

On Thu, Nov 20, 2025 at 11:23=E2=80=AFAM Pasha Tatashin
<pasha.tatashin@soleen.com> wrote:
>
> On Thu, Nov 20, 2025 at 1:38=E2=80=AFPM David Matlack <dmatlack@google.co=
m> wrote:
> >
> > On Sat, Nov 15, 2025 at 3:34=E2=80=AFPM Pasha Tatashin
> > <pasha.tatashin@soleen.com> wrote:
> > > The idea is that there is going to be a single userspace agent drivin=
g
> > > the live update, therefore, only a single process can ever hold this
> > > device opened at a time.
> > ...
> > > +static int luo_open(struct inode *inodep, struct file *filep)
> > > +{
> > > +       struct luo_device_state *ldev =3D container_of(filep->private=
_data,
> > > +                                                    struct luo_devic=
e_state,
> > > +                                                    miscdev);
> > > +
> > > +       if (atomic_cmpxchg(&ldev->in_use, 0, 1))
> > > +               return -EBUSY;
> >
> > Can you remind me why the kernel needs to enforce this? What would be
> > wrong or unsafe from the kernel perspective if there were multiple
> > userspace agents holding open files for /dev/liveupdate, each with
> > their own sessions?
>
> By enforcing a singleton, we will ensure a consistent view for tooling
> like luoadm (which will track incoming/outgoing sessions, UUIDs, etc.)
> and prevent conflicting commands regarding the transition state.
>
> This is not a bottleneck because the vast majority of the work
> (preserving devicse/memory) is handled via the individual Session FDs.
> Also, since sessions persist even if /dev/liveupdate is closed, we
> allow the agent upgrade, or crashing without requiring concurrent
> access.

Yeah, I'm not concerned about bottlenecking. It just seems like an
artificial constraint to impose on userspace at this point. The only
ioctls on /dev/liveupdate are to create a session and retreive a
session. Neither of those will conflict with having multiple open
files for /dev/liveupdate.
