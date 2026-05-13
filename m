Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D489E3B52FF
	for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 19:31:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778700706; cv=pass; b=reo/KQF+G1ad10/FwlA/J86L/llpvuYKO/yfygBqOKWojF9X0EpdKUOw1fILuB8vbjaF+mIIouIP86H4KsEgseputldjUbYTYA2MDPg5IK7N608tAcJ1I7AwBqMHMsrzFztAyjNgptgo+22i/i8Nvon2Xqff4/dIVksucrB5C5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778700706; c=relaxed/simple;
	bh=Fk0M2dahXXkA0FzmVrTU+eVu8F5ePwC5MGTDU99/VtQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CkCdDTUOe4AwbAUOxOOYLzx1nSyXOJr9TYHvzUzWG8MWBhgHNPpOKNWY7CMhnEtLBOJgDf3chuN5rBXVyxw+qfWNFRfr5X4owXSGMKalbEJcPIrIm6cIlYLQ2nmPAz/ykFep4km65/fBlp8cjOYe5Cnb6gtBPMhRsPJuRbbnamo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbAGDnbc; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbAGDnbc"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-6579254f996so4690036d50.1
        for <linux-doc@vger.kernel.org>; Wed, 13 May 2026 12:31:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778700704; cv=none;
        d=google.com; s=arc-20240605;
        b=M5SLcdLwOnhtfNh5qIp4lSX/qMAF802d2JYUWF2UnM0TWrM5GBaBPp6pvm3FNt+l5/
         P2uAu3ed1juRlJ7yxZHRCJUNdRT0slALEf7uvjA7cNY0N5siwkqxw11LOxTODAbGaHX7
         6KB0aMxttzcZtcu3y2JlZMcmzZzTdTdoQm/5ZnVvP1fVW41Y2l0l+TdQYUz3kjrW5o5k
         a5tbuyDELuu/Sqh41Hbp6PB8iMBP6m7i9X1PysHnH+6DZIEFOi6H6Gnc+Uee9RWJ+sP2
         ML+t/LnpwtewmomlOT+34xg/uox8JTY3JKm2lT1ojb9PqIbsbh/nbW/jpVZefD+pUate
         UK+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        fh=hcq2iPbLHv4J71lNYCW4pCZ8PKZWptMC8mz0KYXvMro=;
        b=EgzBXVOuXjw1CrfZphOftbi6z9TltJMEqM7/rZaQ5hMe1jR1bJHAMH6Un5eS3Dtgnn
         k2exCSJVosxe5wpoeLTLr7IT6GTEf18BnXIed/c2a7puH0W0KWDm8ifKy4VFxcf6l90s
         QYRNbey9O4G9F64m5GmDmz1CiWMjqsfAR9xp47izJI3cq5YHBIvKOES9leX77sHi5K5I
         2ZtUuwKpdna6B3RG0zHdhVRv56igQph6qTX2ECoLXEh/iAVqBNsB7GA2hgidxBYlmOoZ
         STwUFOQ7NSDtTRZk93TAiJptt/GPefs0v1hBnfLm4iliM0qZgiYhXyJ1BqRk1U1J/OTI
         a3aQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778700704; x=1779305504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=cbAGDnbc9zpvmC2GS6AwSjpegkTu7dCD1Kaql9tb5ryHVu9YliSoFrd8aC1nXCxeQz
         P+Y37Dyv6wAO9evtjgWBCofjkwxOhzTGbMfCD0q9zsCea3MCZhayzAzreECavBu0Sto0
         PXaJJhgSvX10X5//H0gNMaDApwvcIEr4GzFHBzjC4t5KrtX7TFZ4Z4zu7La2Bbf3jNRP
         n8bpwFGQFMY6r/ZjTpP58SQYx3zXQ2rVeXVRbi0JQkl5F18MSXXxNychInBtg1C4i2qD
         O+DrwttVupz8Usp2FmZPl6sKpRdZCusInItRuUcTsIWtQlCVf5/3I7AkK9QhdPBUukYl
         CCPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778700704; x=1779305504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g4Y3i2VzEUpUrHnVXfd2puXKp9894xeLrJot7HkksF4=;
        b=QWlb9cQUViKKrrAy9VRB1ECTK+QKPV4pbznHKUzkYvxR4+VoBwqPuIFtSnXWV1WY6r
         Ail56mu2sc2PhTvkiOW/hW2+KnuvVhrocPfih3tvSkbAQGlHpzPFPpSYEZJirFyBzFGp
         sJVU7xWAJ7AOPoqnclwq1Rk7Kuw9lLT8inqNAtWbPYttTOHuFA0ezB9LFqUj/nTE9kX7
         49As+GeCVphwlYZX8vZKoKoNuiep0rJrN5lJ23Pl0pHlzxlRYY3U3nWRZMYQn+DtI8PF
         B38Cvm55Yuo+BL9nTtUBZHDTOqCBI4mClnJ0gusdu6SqZ01pmTLsfajDZ4oOoj5Yqyc/
         VDLQ==
X-Forwarded-Encrypted: i=1; AFNElJ8xccxEWfr3iq0NjN7csA4WrVEJPJdWs1GURapc3p5rx4F1KZLi3ZJ+DZGq8cWpKjLNq1xlqRFABsk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxttyBkvUT0lNBNxTeBHx8XYC10/5BJXW7DWNEteubLzSUhb1E5
	Qm44/K9mse7LJ87RvMlzbX6Von6iryc5bZYOTnmOrfZ0H+6I0uFtYN3+Oo7pEr7mK28eqWB8Uzm
	bOBZaHKExmniSTCzv+CLa2xHlbRXadvI=
X-Gm-Gg: Acq92OEfg//f5xjGtgmaT52FAz0Y7Mtlfv9Y8CiH/LqryT1VZ4Ak+p+qJb67yTeBKqH
	M9EOpoSeAusJF2HvdA3CWlqNqQGBHxvmORn7kU7hfRuMsOP/CAcfLqlfA0gzm/iRoNBa8rqo3ZF
	r2zzG3F/sDk5WKu5ihXpH/MEE8T77uZNsPeHGg2y/VIwfiu1/swmCp3TdozAGQe3ctuCRxB9rtB
	I9YC8nVOIEuqstSIKy8x7bGQYlgr+3CMNnrxUPWCA/UiFh9Zky1H6dqCN2mYNG04w/4y2Qp5AkE
	NNM+kv3vS4t1133d5Dl1FYAffu999XA5ZMlPR+yRTJG39u129ROZ+xUNaOVN1VcYlHI1p03IFQ=
	=
X-Received: by 2002:a05:690c:38b:b0:7bd:a50c:454c with SMTP id
 00721157ae682-7c6da2152a8mr42579647b3.19.1778700703738; Wed, 13 May 2026
 12:31:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-5-ketil.johnsen@arm.com> <20260505181523.49a3d85c@fedora>
 <afxVIuVVPisBQ9p_@e129842.arm.com> <20260507135356.5428d50d@fedora>
 <agMvb_jeRsO7tSS-@e142607> <20260512161111.0cb7000e@fedora> <agNJasayW8VCHTiU@e142607>
In-Reply-To: <agNJasayW8VCHTiU@e142607>
From: Chia-I Wu <olvaffe@gmail.com>
Date: Wed, 13 May 2026 12:31:32 -0700
X-Gm-Features: AVHnY4JH8Ip_tVhSu6utyw5cZH7Mreif1YmCt2t2xjBKPcGuoTWdGxm_i0T-RLg
Message-ID: <CAPaKu7QC7FdjL6m_OSb+E5aYKs6bmT-9DAHc5PC=XctCmRph2Q@mail.gmail.com>
Subject: Re: [PATCH 4/8] drm/panthor: Add support for protected memory
 allocation in panthor
To: Liviu Dudau <liviu.dudau@arm.com>
Cc: Boris Brezillon <boris.brezillon@collabora.com>, 
	=?UTF-8?Q?Marcin_=C5=9Alusarz?= <marcin.slusarz@arm.com>, 
	Ketil Johnsen <ketil.johnsen@arm.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Steven Price <steven.price@arm.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Alice Ryhl <aliceryhl@google.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, linaro-mm-sig@lists.linaro.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Florent Tomasin <florent.tomasin@arm.com>, nd@arm.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 8:39=E2=80=AFAM Liviu Dudau <liviu.dudau@arm.com> w=
rote:
>
> On Tue, May 12, 2026 at 04:11:11PM +0200, Boris Brezillon wrote:
> > On Tue, 12 May 2026 14:47:27 +0100
> > Liviu Dudau <liviu.dudau@arm.com> wrote:
> >
> > > On Thu, May 07, 2026 at 01:53:56PM +0200, Boris Brezillon wrote:
> > > > On Thu, 7 May 2026 11:02:26 +0200
> > > > Marcin =C5=9Alusarz <marcin.slusarz@arm.com> wrote:
> > > >
> > > > > On Tue, May 05, 2026 at 06:15:23PM +0200, Boris Brezillon wrote:
> > > > > > > @@ -277,9 +286,21 @@ int panthor_device_init(struct panthor_d=
evice *ptdev)
> > > > > > >                     return ret;
> > > > > > >     }
> > > > > > >
> > > > > > > +   /* If a protected heap name is specified but not found, d=
efer the probe until created */
> > > > > > > +   if (protected_heap_name && strlen(protected_heap_name)) {
> > > > > >
> > > > > > Do we really need this strlen() > 0? Won't dma_heap_find() fail=
 is the
> > > > > > name is "" already?
> > > > >
> > > > > If dma_heap_find() will fail, then the whole probe with fail too.
> > > > > This check prevents that.
> > > >
> > > > Yeah, that's also a questionable design choice. I mean, we can
> > > > currently probe and boot the FW even though we never setup the
> > > > protected FW sections, so why should we defer the probe here? Can't=
 we
> > > > just retry the next time a group with the protected bit is created =
and
> > > > fail if we can find a protected heap?
> > >
> > > The problem we have with the current firmware is that it does a numbe=
r of setup steps at "boot"
> > > time only. One of the steps is preparing its internal structures for =
when it enters protected
> > > mode and it stores them in the buffer passed in at firmware loading. =
We cannot later run the
> > > process when we have a group with protected mode set.
> >
> > No, but we can force a full/slow reset and have that thing
> > re-initialized, can't we? I mean, that's basically what we do when a
> > fast reset fails: we re-initialize all the sections and reset again, at
> > which point the FW should start from a fresh state, and be able to
> > properly initialize the protected-related stuff if protected sections
> > are populated. Am I missing something?
>
> Right, we can do that. For some reason I keep associating the reset with =
the
> error handling and not with "normal" operations.
I kind of hope we end up with either

 - panthor knows the exact heap to use and fails with EPROBE_DEFER if
the heap is missing, or
 - panthor gets a dma-buf from userspace and does the full reset
   - userspace also needs to provide a dma-buf for each protected
group for the suspend buffer

than something in-between. The latter is more ad-hoc and basically
kicks the issue to the userspace.

For the former, expressing the relation in DT seems to be the best,
but only if possible :-). Otherwise, a kconfig option (instead of
module param) should be easier to work with.

Looking at the userspace implementation, can we also have an panthor
ioctl to return the heap to userspace? A dma-heap ioctl to query the
heap size is also lacking.


>
> Best regards,
> Liviu
>
>
> --
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> | I would like to |
> | fix the world,  |
> | but they're not |
> | giving me the   |
>  \ source code!  /
>   ---------------
>     =C2=AF\_(=E3=83=84)_/=C2=AF
>
