Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A079A3403FD
	for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 16:07:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779293276; cv=pass; b=SUakT04amr80Mv5nOddQTjby1CMEVMF6sNnMkunhRuwDez1e0fTdnnCRXw1iTzujhrZdAJF3R12YmbccQPtRJpRzRqwYZWz27/pNYBcMVSmkow5+Ne5tRKJDFBdw/D52GuSw9gDHCO2/gsXaPKCGeUoKP4CfOfTE+QPzuf6jhjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779293276; c=relaxed/simple;
	bh=CvXC4Kyo+V9VxvlqU7vlE27Z0xiXsRLyPCMwJRtE6jo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JkuGQ5sjD07vIws4KCyViPpUe5IRQse5UT6gE2dyvuwR9nfggTE7xMvExrW/OMtimi0UDy7dZm2kqY/wExoN3jRBC4mkMY2BUuJM5zq2bziayLHU6aORxJAiUyGsksf82TQtPay/HNRPoNKoLO/Ygo8gYL+OJQtfFycOhgY05Cc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iO7mdu/h; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iO7mdu/h"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43d7645adbdso3463091f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 20 May 2026 09:07:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779293273; cv=none;
        d=google.com; s=arc-20240605;
        b=V3YY26ap6Le+36EprXlIuh+PKLk4seyF3l2oQ2xMK5k4JzpRwEvds9W2jLQB9Lhp3B
         EIJyY/2xE/tke2rcpRY3mKbiGJ4Gn4LOTJUI7ovWku/JveblLNQgZv97VMOJBNiKKdmC
         lD8LNEYPbXDNXb02nkfB1e7FELFNCLiZB6Yz35aSS8iuHUDx+JatX+evSAJ55zQbHIJ0
         b0yitjIlOCjysQZuwP99SnpPOSU+hrmamUM8K3LNqzpSOy22vx79DOzN+q/rZKMpmu9w
         YQgezeRFRsTAiudT8lT3S6f8RJ2u3SCmvxWMn8o233GkZj3bQUwn/OFdCqpykoI7Dl2X
         XkxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1AueEqgTUy6nsRVxmiTY07dthKJdLYGxsiOoVyUMH18=;
        fh=A7ZGlzw5ylQzEGUSW58dFkHhoeJshkMXU67Uml6wOMo=;
        b=Dmq5/HVAcpNkCaGI5ZmxjItd3jm/HQvqWcTaesvT6t1V7dplGgs6MKu3EFE6Igh1KR
         xEjD70/aUHED1sJGU5hXd2gahVtqESQ4KIM6kRkaq3PknSYBBZrqO4UXCZi1sowvmYN2
         dErkM03fA7HgU+0+xERkaLhvHRHWxWUJQSFEbZybX2IRaKMzzFmigPcjo6dyS62yebKM
         Vs4p1kWwQYiEXE/MiwkVK6I/WVggOpafoA+SXg6NJOCs3lCx010WBskeyOJ0QfQldobC
         Ve9Aoed7SCrovO4Rd1GXCRaiPvh9J4c+bKT175dnd7idcyPcSjs6d84XNLcbw5AAJfwB
         JfzQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779293273; x=1779898073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1AueEqgTUy6nsRVxmiTY07dthKJdLYGxsiOoVyUMH18=;
        b=iO7mdu/hblANZVvZjTA2rHE9y2iDGcx89vCnPd/aPpSatcneEAfahvEBxn6Rh/F/z4
         x6PrpCb4dmqs42at6xHVV4KmJzsTOpr3G14GZHCeujyVdZ8lZuOt53bpGwFq8HbD7AT9
         syGhXc9xa9pvinnvmaQ35bHThZnBm+Zr3hJ0nKSa1FOuBbbI2fbLSbsmFLyCZR0vsUbo
         EOs10f4QpIPR5103uufD09bcx2IS3Q93sDuDpGo4huTz4ytl4zozeX3vwk0S5nYD/CiP
         8/SQWCpILDQR+c8e6GsCn09paXnwgxTkKvkBLOue66WdGgj+q9kD3/PHNpxLNwH9KpJ4
         QWLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779293273; x=1779898073;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1AueEqgTUy6nsRVxmiTY07dthKJdLYGxsiOoVyUMH18=;
        b=nwAKSjIJmglsK5LkXI0gNn7kyy268gg3whz8Tu9++tNXgccF7t3wbmNVmN5+Er/oX2
         /0VnlQY3mpaxbVnaanMPM+JYH6wfVSa8+BABiNV1OquhIGWJgEKBFLcw1wjJA2zWu5vi
         fDGpc949ABirFHPQUaJ1T6OUq1jdbQccxIv4M8BAHFHsFpkg4IbEFbauGRysDksERvxM
         oGarYhBUK2hD2jjThM3y2TM2wPO0mDZfp1Gsy7Hz1zN7GQOHSFzcgFBXXq8bWZEfnULs
         U6II1fh3C41t7JaqdQmtIeg9OPc2L3Men8gryMBLf2j5LEXYXVbdJ97IlKuFTF/HYtrs
         QLXQ==
X-Forwarded-Encrypted: i=1; AFNElJ9UQCyMqxbxbawJeOpFKfOVIIBxJWx+oa5v6YBex2UHApVi/+5XT90pIhcyypCExriL8sm+ArmeTcc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQYRm2xjU9bGwZNlR08e3r4lbrFpz+DewuM6J3Svw8RGQDi4Lj
	ESIawqrI01Jpqs8ZQ7zICbCyH5k0V3sB1Lu/s88QM8RbF6/adTGU1nE4NcHgu+Z9nPtJA95MyHm
	isZVVYVOxcl+aDwXgxJmeuytkravs8Xg=
X-Gm-Gg: Acq92OFIKlzGLkxCTtu1RhL2L6q0SCnEAPPphIzYLAFYpubLWR3f9x8wvE+V8Nx5oj/
	9dM4FG5MHuxFM9MhWDmaeDgBpPiMktMOYpcIROCVNtCQNSccybHYmsqQjGQnuoO0MYdpDzvtm2F
	ROrrwoOECv9qWdim25QiLmu+6LFD7n99JL24xm7LGpoNyYPTQurG2dO97yBEBg02Tk/kp7x0hZw
	4poxDKkEUwrghILsb4LOyU0qndlTBJkIJ6OwxmfV4xO7fgFgF10x7xyuTrKnGphc5g7ab20s/VF
	Ca/0SB6rKkf29aZrQG9Yc6J6rA9aPdwIPuMibBVhm37zNn+f1YlJz3H5QNUzKBgW8n5oUo3KajC
	xtKM=
X-Received: by 2002:adf:f284:0:b0:45e:65a3:badf with SMTP id
 ffacd0b85a97d-45e65a3bb1fmr25476267f8f.21.1779293272731; Wed, 20 May 2026
 09:07:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260520-bpf-insn-doc-v1-1-74d7dada9bfc@bootlin.com>
 <ffe4e22a8e5d0fceefa7f9ecb378e038b4686aa417addd57d2af243b67607c0a@mail.kernel.org>
 <DINMD7Y3ZG8Q.3GZGX7SX9CN57@bootlin.com>
In-Reply-To: <DINMD7Y3ZG8Q.3GZGX7SX9CN57@bootlin.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Wed, 20 May 2026 09:07:40 -0700
X-Gm-Features: AVHnY4LbSt-G1XJxIMtaJctIYbjx4r1-eMM68ioMxesYAe3uAgIIcikQLGh332g
Message-ID: <CAADnVQJx4xTU5L21bpjN8QeJTeSoeZRMknH_ZNPnY_DA1Yb8SQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next] bpf, docs: add LOAD_AQCUIRE and STORE_RELEASE instructions
To: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>
Cc: bot+bpf-ci@kernel.org, David Vernet <void@manifault.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, Eduard <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, ebpf@linuxfoundation.org, 
	"Bastien Curutchet (eBPF Foundation)" <bastien.curutchet@bootlin.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, bpf <bpf@vger.kernel.org>, bpf@ietf.org, 
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	Martin KaFai Lau <martin.lau@kernel.org>, Chris Mason <clm@meta.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 5:46=E2=80=AFPM Alexis Lothor=C3=A9
<alexis.lothore@bootlin.com> wrote:
>
> On Wed May 20, 2026 at 5:18 PM CEST, bot+bpf-ci wrote:
> >> diff --git a/Documentation/bpf/standardization/instruction-set.rst b/D=
ocumentation/bpf/standardization/instruction-set.rst
> >> --- a/Documentation/bpf/standardization/instruction-set.rst
> >> +++ b/Documentation/bpf/standardization/instruction-set.rst
> >> @@ -695,22 +695,24 @@
> >>    *(u64 *)(dst + offset) +=3D src
> >>
> >>  In addition to the simple atomic operations, there also is a modifier=
 and
> >> -two complex atomic operations:
> >> +four complex atomic operations:
> >>
> >>  .. table:: Complex atomic operations
> >>
> >>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>    imm          value             description
> >>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >> -  FETCH        0x01              modifier: return old value
> >> -  XCHG         0xe0 | FETCH      atomic exchange
> >> -  CMPXCHG      0xf0 | FETCH      atomic compare and exchange
> >> +  FETCH        0x0001            modifier: return old value
> >> +  XCHG         0x00e0 | FETCH    atomic exchange
> >> +  CMPXCHG      0x00f0 | FETCH    atomic compare and exchange
> >> +  LOAD_ACQ     0x0100            atomic load with barrier
> >> +  STORE_REL    0x0110            atomic store with barrier
> >>    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D
> >>
> >>  The ``FETCH`` modifier is optional for simple atomic operations, and
> >> -always set for the complex atomic operations.  If the ``FETCH`` flag
> >> -is set, then the operation also overwrites ``src`` with the value tha=
t
> >> -was in memory before it was modified.
> >> +always set for the ``XCHG`` and ``CMPXCHG`` complex atomic operations=
.  If
> >> +the ``FETCH`` flag is set, then the operation also overwrites ``src``=
 with
> >> +the value that was in memory before it was modified.
> >>
> >>  The ``XCHG`` operation atomically exchanges ``src`` with the value
> >>  addressed by ``dst + offset``.
> >
> > [ ... ]
> >
> >> @@ -721,6 +723,11 @@
> >>  value that was at ``dst + offset`` before the operation is zero-exten=
ded
> >>  and loaded back to ``R0``.
> >>
> >> +The ``LOAD_ACQ`` and ``STORE_REL`` operations implement lighter LOAD =
and
> >> +STORE memory barriers than full barriers. The corresponding accesses =
must
> >> +be aligned, but are allowed for any access size (8-bit up to 64-bit
> >> +operations).
> >
> > Does the LOAD_ACQ documentation need to clarify its non-standard regist=
er
> > semantics? BPF atomic operations are encoded as STX instructions, which
> > conventionally use dst as the memory base pointer and src as the value
> > register. However, LOAD_ACQ reverses this pattern by using src as the
> > memory base pointer and dst as the destination register for the fetched
> > value, acting like an LDX instruction.
>
> True, I can specify that both are anyway supported by a STX instruction.
>
> > Additionally, should the documentation clarify that the loaded value is
> > zero-extended into the 64-bit destination register for 8, 16, and 32-bi=
t
> > accesses? Omitting these details might lead to incorrect implementation=
s
> > based on standard STX rules.
>
> I guess I can add this detail, yes.
>
> > This contradiction creates specification ambiguity: the documentation
> > states that LOAD_ACQ and STORE_REL "are allowed for any access size
> > (8-bit up to 64-bit operations)", but earlier in the document (line 671=
)
> > explicitly states "8-bit and 16-bit wide atomic operations are not
> > supported."
> >
> > The instruction encoding section (lines 667-671) only defines two size
> > encodings for ATOMIC mode:
> > - {ATOMIC, W, STX} for 32-bit operations
> > - {ATOMIC, DW, STX} for 64-bit operations
> >
> > No encoding is shown for B (byte/8-bit) or H (half-word/16-bit) with
> > ATOMIC mode.
> >
> > If LOAD_ACQ/STORE_REL truly support 8-bit and 16-bit sizes, shouldn't t=
he
> > encoding section document how B and H size modifiers work with ATOMIC
> > mode, and line 671 clarify the exception?
>
> This point, and the corresponding mentions to the "atomic32 conformance
> group" and "atomic64 conformance group", made me realize that the kernel
> doc seems to be in sync with the eBPF ISA RFC
> (https://www.rfc-editor.org/rfc/rfc9669.html). It makes me wonder if
> it's really ok to add those LOAD_ACQUIRE/STORE_RELEASE mentions in the
> kernel doc only ?

It's ok. It already diverged a bit. Eventually we will do an RFC update.
