Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F23257AD1
	for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 14:05:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742911502; cv=none; b=aDHHMgZrZ065RR77CrfeAgX/WgXOc4BNyYXI1eVcSXRjd67yV9hEB2vsdiP3saSJRJWqvlZ35Kb70fSYgyRa2azo+zST9BcK6z3pnJGiaWBEF7w2Gp6R8W86YPYlsfGNe7FkDyzUiy9b95sLxV0mKvJEYGOut9HyPTvQX30xLPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742911502; c=relaxed/simple;
	bh=HIjTuiJtFJRThNQQcmoXQWPTsKs5+eolgRd911Gghok=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dMV7VZN7l2KfLIhP4p0J8c1t0nKLzKRUs4p4RMwTaXB8aKcxHzwhb3CwkSsL65M9TOyoBfoTCod9bBRu2qxrMSqZSHHM5b6t6jqsdGO+rOY+7DnAs/xWzlu/Q8aTwQ7qeYy6c6xDGjs9O99mHJcX20LA/W5vaWdw2oW9zYvym90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=RWsHP/xZ; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="RWsHP/xZ"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-476a304a8edso49670411cf.3
        for <linux-doc@vger.kernel.org>; Tue, 25 Mar 2025 07:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1742911500; x=1743516300; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKMJVcSSYFhFkaF9OI9BOHOle5JxWrFZ54yuemRi3B0=;
        b=RWsHP/xZPYgfNRNs03jXEhoGs6zwv4pwLS4MIqKu9kjEghj9hjEvZFoCGXJ83O3ETY
         5gD2f7OT/QfB8y9sVeiBchXYGwJ/hYkDHRobWuhx2oMsQ/Dneg3uOgJuYVWkRLQO4ZUx
         hoJfcz5cGEMPJI1BqRnrGWeDnJ959q7XscKYUobEYFzTn8IZIwZpThTWSTRVIlstVVpr
         GpbNcEUC/ueBBISs5M8WTWFe5NVcz8DzWF3HQKYmd46Avwf+WnwxBD6gskF0UqB742Ld
         Enq7Al+iM0G0dLrdrfn7ucUgVza6DSIdBMrAMkPnw9XHQ/lI5hka7yGN8x1/yGp6RXjn
         ea5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742911500; x=1743516300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KKMJVcSSYFhFkaF9OI9BOHOle5JxWrFZ54yuemRi3B0=;
        b=m5Zhvcq5/TTq31H6Q3zLS54NPFtZxd7jv+oyFMMHenGcyl6YFcMnulTa3B7NwqN/Gz
         piacdfqS8/aJ2ZtdcP4+//pn4y69GXih/GQhy2uk2EWJQ/a1Fc6z6cZfuN+rlYi6bRHb
         nqwj/RsEz6NVeDcBeiAH0cGbS0dFXEM3ghE1VAzebIMO9hd6lIPb7yrIO1pOmMpLf4LW
         haJVzLFikRdcDxvP1jGhRnaxUf3dmBHLGkMOtl9yjQ6HvpuYqAngOb4Gizk1pbskXEi3
         YDC3PE+3szQHYn3U3UD8anVDREPUZ1Hg3H0sYSb6Qr4oTWpaaBYDBPFNvhSIm3g2TG3f
         I5TQ==
X-Forwarded-Encrypted: i=1; AJvYcCU4JKZ9E0sGWb+t8vYhWOQCyPHCnSqS65wVcm0jUfT1Q+E4HFlMvqZV8Mwk6ExGqdMal20R6zH7AOY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEkqZX6V9f+7ouoqNm5GZMm1QMvrYaTTfqvDAtW1aWXmCVtBuX
	hUgpRQG1gDwk3JxlYSOI+1FHdI0A4bpyCb3gC8ODtKXPfyVbi/DqVScr3b0chkkvc/CanKL7Z2c
	cnZV/IRSez878bRHEG4X6dCCNZggSQ2EmSKUeMg==
X-Gm-Gg: ASbGnctAb/ocrtiplMWolAP4YHR3fD6cEffzEGZSGXvpGOeSAebat+4hsq636vz5x6D
	vCxO4pmR0SJ+9NBpyi4I3uN+tyOWIL9uwSAgZvNJSxwTvo68T8FL2Tweds73tLCxocAHMJwlXTy
	3MeAFrSPzA1woQ0y+pesWqt3i+
X-Google-Smtp-Source: AGHT+IGMYVQtiX/h+EVJlPHZz5Rq/az3V8wIPVjd4SZUiiPGocRCmY6VSmvm0irS2U8qQcxFKzIzc2oRCd6fuO2LGmc=
X-Received: by 2002:a05:622a:248e:b0:476:b56d:eb46 with SMTP id
 d75a77b69052e-4771dd77d25mr264001271cf.15.1742911499617; Tue, 25 Mar 2025
 07:04:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-12-changyuanl@google.com> <CALu+AoS01QJ-H5Vpr378rbx==iRQLG0HajtMCUzDXRO75biCag@mail.gmail.com>
 <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
In-Reply-To: <Z+JT7kx+sfPqfWFA@MiWiFi-R3L-srv>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 25 Mar 2025 10:04:21 -0400
X-Gm-Features: AQ5f1Jrjo6HkojvC1uIVMuAy34VVl7CYnqSMt1jjfTIiYkTHpp9oYG_kKxOqyPA
Message-ID: <CA+CK2bB-qPV-QnqUwAv+OGujZwWLAAgBT0xH6fyKY8-cP1bNSQ@mail.gmail.com>
Subject: Re: [PATCH v5 11/16] kexec: add config option for KHO
To: Baoquan He <bhe@redhat.com>
Cc: Dave Young <dyoung@redhat.com>, Changyuan Lyu <changyuanl@google.com>, 
	linux-kernel@vger.kernel.org, graf@amazon.com, akpm@linux-foundation.org, 
	luto@kernel.org, anthony.yznaga@oracle.com, arnd@arndb.de, 
	ashish.kalra@amd.com, benh@kernel.crashing.org, bp@alien8.de, 
	catalin.marinas@arm.com, dave.hansen@linux.intel.com, dwmw2@infradead.org, 
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com, corbet@lwn.net, 
	krzk@kernel.org, rppt@kernel.org, mark.rutland@arm.com, pbonzini@redhat.com, 
	hpa@zytor.com, peterz@infradead.org, ptyadav@amazon.de, robh+dt@kernel.org, 
	robh@kernel.org, saravanak@google.com, skinsburskii@linux.microsoft.com, 
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com, 
	usama.arif@bytedance.com, will@kernel.org, devicetree@vger.kernel.org, 
	kexec@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 25, 2025 at 2:58=E2=80=AFAM Baoquan He <bhe@redhat.com> wrote:
>
> On 03/24/25 at 12:18pm, Dave Young wrote:
> > On Thu, 20 Mar 2025 at 23:05, Changyuan Lyu <changyuanl@google.com> wro=
te:
> > >
> > > From: Alexander Graf <graf@amazon.com>
> > >
> > > We have all generic code in place now to support Kexec with KHO. This
> > > patch adds a config option that depends on architecture support to
> > > enable KHO support.
> > >
> > > Signed-off-by: Alexander Graf <graf@amazon.com>
> > > Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
> > > Co-developed-by: Changyuan Lyu <changyuanl@google.com>
> > > Signed-off-by: Changyuan Lyu <changyuanl@google.com>
> > > ---
> > >  kernel/Kconfig.kexec | 15 +++++++++++++++
> > >  1 file changed, 15 insertions(+)
> > >
> > > diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
> > > index 4d111f871951..57db99e758a8 100644
> > > --- a/kernel/Kconfig.kexec
> > > +++ b/kernel/Kconfig.kexec
> > > @@ -95,6 +95,21 @@ config KEXEC_JUMP
> > >           Jump between original kernel and kexeced kernel and invoke
> > >           code in physical address mode via KEXEC
> > >
> > > +config KEXEC_HANDOVER
> > > +       bool "kexec handover"
> > > +       depends on ARCH_SUPPORTS_KEXEC_HANDOVER && ARCH_SUPPORTS_KEXE=
C_FILE
> > > +       select MEMBLOCK_KHO_SCRATCH
> > > +       select KEXEC_FILE
> > > +       select DEBUG_FS
> > > +       select LIBFDT
> > > +       select CMA
> > > +       select XXHASH
> > > +       help
> > > +         Allow kexec to hand over state across kernels by generating=
 and
> > > +         passing additional metadata to the target kernel. This is u=
seful
> > > +         to keep data or state alive across the kexec. For this to w=
ork,
> > > +         both source and target kernels need to have this option ena=
bled.
> > > +
> >
> > Have you tested kdump?  In my mind there are two issues,  one is with
> > CMA enabled, it could cause kdump crashkernel memory reservation
> > failures more often due to the fragmented low memory.  Secondly,  in
>
> kho scracth memorys are reserved much later than crashkernel, we may not
> need to worry about it.
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> start_kernel()
>   ......
>   -->setup_arch(&command_line);
>      -->arch_reserve_crashkernel();
>   ......
>   -->mm_core_init();
>      -->kho_memory_init();
>
> > kdump kernel dump the crazy scratch memory in vmcore is not very
> > meaningful.  Otherwise I suspect this is not tested under kdump.  If
> > so please disable this option for kdump.
>
> Yeah, it's not meaningful to dump out scratch memorys into vmcore. We
> may need to dig them out from eflcorehdr. While it's an optimization,
> kho scratch is not big relative to the entire system memory. It can be
> done in later stage. My personal opinion.

But, we don't; we only dump out the regular CMA memory that absolutely
should be part of vmcore. When scratch is used during boot, it is used
for regular early boot kernel allocations, such as to allocate memmap,
which is an essential part of the crash dump.

Pasha
