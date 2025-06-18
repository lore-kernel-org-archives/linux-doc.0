Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22F251A257D
	for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 17:01:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750266094; cv=none; b=dLYqWUsOx9u9DfA6Q3nKDNhxYAY3DmJ8Ym+iVM94na9d1zOjIZl6ZgzmQvxTo8E+zIsL8UGp45tr02fRIecrAENUH2Aw4tl/I8L3MNZ/LRJJVFsEW/LVrLGgQBFh/itXb8O0sTEl5Fy65SLWJTX/5+V0v0fNF+T27QspVQpNTdc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750266094; c=relaxed/simple;
	bh=kAcTPLb17pWc/GIqykKgV+09GkJftRZtqlLVid6QCCk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qwPBHt2Dj3o3c0OKyQH8MRwO3JGKXPLgmJS14hW07P/a9y/GCG54n/OAZ804JHhbMW/kKwNvcyDJhgXJ2VEjRFmbcAswBEqxKtVBrbwl/Bbf1nEFBRyRdeCkNM3rNewbVbrdBqudCogSaAYVTCZwQeU4Gv4fG3KoUYtK8/3m6lA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=Gio/MLn0; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="Gio/MLn0"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-7d0a47f6692so791796385a.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Jun 2025 10:01:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750266091; x=1750870891; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TA0+RKC/kBCuCd8gwsReWHIGYtk514yw93ZXeGqDAdY=;
        b=Gio/MLn09Bib/j3uLMtJd2iWHe5XSFsz1UtdNeqTtXTZokaQqm+mZGDFrfiq3taqVi
         ZE8amCEH3Mqs/JdkVnlvjWuueGCFXqcA2FHFRJZ31m2U4T9vxeEOp0meLHZRCwHQUMnX
         JoS2yNiMm1ghEEJ0eBFSrLKrOekQtbwOoPRnSRoxuKZNBzqDNSc1OJ8ZyvaqGM5bjf7b
         wYM21fIZETF8TCDvTdAsHoNDBU2oSf9bHBjIVGsP/qtk2hugxf+XzK6R+LVx0SPcmzBi
         OhcpHu5aJNxEgzBzyUrFtVS1ZHtX+NZkdVcaF6babaSemf7ZnRdBHeKtn9wnz3m2NB49
         sJaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750266091; x=1750870891;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TA0+RKC/kBCuCd8gwsReWHIGYtk514yw93ZXeGqDAdY=;
        b=vEKSuYAHKrCYLbnIOp6dG3ZKWRRJ1Ne3ecjUpTqSDVrM8qOYEiFMGp+hxWQy4yZCV9
         j1KdWR+7/Sx0rWK0r+bBaPSpvw8g5PyzVL8VyT2ezILPLAH4BeYN1bds5gPF35x8l3NP
         Glbwg5B8zYQzSdLVY+wzQTyZmHqkMFrO7hsSnxzNG7O8mwL+X43yBsXDIdCUGbzGe9ns
         KGVYSPsdjHzBj6fXZKicxxtOWaqSU+sfgapgpxgxdBHBimaz19YJ1lyUQIZLkhOPJIAq
         gGbIh3IXRbnfQpjNVGMGjc6E1mRB3rEVjf4J4+8O4qXW3Nr7G0chiU+AX/sNw8pcXQYX
         nm0g==
X-Forwarded-Encrypted: i=1; AJvYcCXu1iz08X49U2/4ulfOBJ6r5zKM9jYkRzfvQDegsBhmxXalH5IMdMx4iEm9xGZfJW5FAoad9sCgEHM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDaadlAxBcHgErblTeC2QeceTcNBfZOq1PSO53P6/2EIoXlRgi
	RWsuLWJ9Nn1yctlYifuhw0yosAkIu01b9jHa+95YrXoipHMnQY3t5ya0p8aPdGjKLDdZYpX7V9m
	qP/p/RLain0ACv24jCAB+zYBxzc3nznPyOLXtk22zfg==
X-Gm-Gg: ASbGncuyod27eWv3RlR3jdP48ZK5nMinx4Jx/ltEXxPUBMvS8OtOoHaQ2inXPo4TGlp
	Na+Ayfym0qIITC3cskIhzf8igOiRCskBTKOOFu1Ccbaz9zPIh0Ar8FUkHTBL67vDi7CyaImFzDW
	QhUavsyP7ph1K5w+1aw0410echrsRkrFWWwJF8GFSh
X-Google-Smtp-Source: AGHT+IEl9+a5umJIH2rn3eRvV+cj4/+EVnk+rRUutzocygxatHb141CsA1O9nuYeCr3Vjm2y753eIgh3RePJyZR2zuM=
X-Received: by 2002:a05:622a:109:b0:48c:5c4d:68e7 with SMTP id
 d75a77b69052e-4a73c51f8f9mr255163841cf.6.1750266090667; Wed, 18 Jun 2025
 10:01:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com> <mafs0sekfts2i.fsf@kernel.org>
 <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org> <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org>
In-Reply-To: <aFLr7RDKraQk8Gvt@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 18 Jun 2025 13:00:52 -0400
X-Gm-Features: AX0GCFsc07ypzImQ5QOUs6HD_8XNfOFWbKkbcbmfbfu3dfMzeXoTO_-aNByV3mg
Message-ID: <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com, 
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
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 12:40=E2=80=AFPM Mike Rapoport <rppt@kernel.org> wr=
ote:
>
> On Wed, Jun 18, 2025 at 10:48:09AM -0400, Pasha Tatashin wrote:
> > On Wed, Jun 18, 2025 at 9:12=E2=80=AFAM Pratyush Yadav <pratyush@kernel=
.org> wrote:
> > >
> > > On Tue, Jun 17 2025, Pasha Tatashin wrote:
> > >
> > > > On Tue, Jun 17, 2025 at 11:24=E2=80=AFAM Jason Gunthorpe <jgg@ziepe=
.ca> wrote:
> > > >>
> > > >> On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
> > > >> > On Sat, Jun 07 2025, Pasha Tatashin wrote:
> > > >> > [...]
> > > >> > >>
> > > >> > >> This weirdness happens because luo_prepare() and luo_cancel()=
 control
> > > >> > >> the KHO state machine, but then also get controlled by it via=
 the
> > > >> > >> notifier callbacks. So the relationship between then is not c=
lear.
> > > >> > >> __luo_prepare() at least needs access to struct kho_serializa=
tion, so it
> > > >> > >> needs to come from the callback. So I don't have a clear way =
to clean
> > > >> > >> this all up off the top of my head.
> > > >> > >
> > > >> > > On production machine, without KHO_DEBUGFS, only LUO can contr=
ol KHO
> > > >> > > state, but if debugfs is enabled, KHO can be finalized manuall=
y, and
> > > >> > > in this case LUO transitions to prepared state. In both cases,=
 the
> > > >> > > path is identical. The KHO debugfs path is only for
> > > >> > > developers/debugging purposes.
> > > >> >
> > > >> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO, b=
ut then
> > > >> > KHO calls into LUO from the notifier, which makes the control fl=
ow
> > > >> > somewhat convoluted. If LUO is supposed to be the only thing tha=
t
> > > >> > interacts directly with KHO, maybe we should get rid of the noti=
fier and
> > > >> > only let LUO drive things.
> > > >>
> > > >> Yes, we should. I think we should consider the KHO notifiers and s=
elf
> > > >> orchestration as obsoleted by LUO. That's why it was in debugfs
> > > >> because we were not ready to commit to it.
> > > >
> > > > We could do that, however, there is one example KHO user
> > > > `reserve_mem`, that is also not liveupdate related. So, it should
> > > > either be removed or modified to be handled by LUO.
> > >
> > > It still depends on kho_finalize() being called, so it still needs
> > > something to trigger its serialization. It is not automatic. And with
> > > your proposed patch to make debugfs interface optional, it can't even=
 be
> > > used with the config disabled.
> >
> > At least for now, it can still be used via LUO going into prepare
> > state, since LUO changes KHO into finalized state and reserve_mem is
> > registered to be called back from KHO.
> >
> > > So if it must be explicitly triggered to be preserved, why not let th=
e
> > > trigger point be LUO instead of KHO? You can make reservemem a LUO
> > > subsystem instead.
> >
> > Yes, LUO can do that, the only concern I raised is that  `reserve_mem`
> > is not really live update related.
>
> I only now realized what bothered me about "liveupdate". It's the name of
> the driving usecase rather then the name of the technology it implements.
> In the end what LUO does is a (more) sophisticated control for KHO.
>
> But essentially it's not that it actually implements live update, it
> provides kexec handover control plane that enables live update.
>
> And since the same machinery can be used regardless of live update, and I=
'm
> sure other usecases will appear as soon as the technology will become mor=
e
> mature, it makes me think that we probably should just
> s/liveupdate_/kho_control/g or something along those lines.

I disagree, LUO is for liveupdate flows, and is designed specifically
around the live update flows: brownout/blackout/post-liveupdate, it
should not be generalized to anticipate some other random states, and
it should only support participants that are related to live update:
iommufd/vfiofd/kvmfd/memfd/eventfd and controled via "liveupdated" the
userspace agent.

KHO is for preserving memory, LUO uses KHO as a backbone for Live Update.

> > > Although to be honest, things like reservemem (or IMA perhaps?) don't
> > > really fit well with the explicit trigger mechanism. They can be carr=
ied
> >
> > Agreed. Another example I was thinking about is "kexec telemetry":
> > precise time information about kexec, including shutdown, purgatory,
> > boot. We are planning to propose kexec telemetry, and it could be LUO
> > subsystem. On the other hand, it could be useful even without live
> > update, just to measure precise kexec reboot time.
> >
> > > across kexec without needing userspace explicitly driving it. Maybe w=
e
> > > allow LUO subsystems to mark themselves as auto-preservable and LUO w=
ill
> > > preserve them regardless of state being prepared? Something to think
> > > about later down the line I suppose.
> >
> > We can start with adding `reserve_mem` as regular subsystem, and make
> > this auto-preserve option a future expansion, when if needed.
> > Presumably, `luoctl prepare` would work for whoever plans to use just
> > `reserve_mem`.
>
> I think it would be nice to support auto-preserve sooner than later.

Makes sense.

> reserve_mem can already be useful for ftrace and pstore folks and if it
> would survive a kexec without any userspace intervention it would be grea=
t.

The pstore use case is only potential, correct? Or can it already use
reserve_mem?

Pasha
