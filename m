Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E33288527
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 09:05:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759827948; cv=none; b=Da1hhUA7YS1Gqa9Sd7QQymNKnoVnkcKtW9vYcv+xsCf8ZPsi33Pm7xChZynbAHkaJKZ4GV2TBsaa0H7qFMMVWfBgkXozCjH5007f5k0hXivn9Qir7EQTpNc+5R7ujxtIucEATxxfbJ79/A+QDCQ9W8l8XnWYHF0Y0my5ASV7vGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759827948; c=relaxed/simple;
	bh=9levaWjJHA7TcNU8jT56uzj+7qYLXaVXyFf+WgEeBT4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Bbxwd1qyS+iR+dYOABH49meohbRBQmUvIxu3w3E96bY/gppv2UMHscro2F/0Xty5a9gsrETpwNDpksN6rssaKbvLkKIHJcYeGIUs8uUOyVTDLKZ/DI9bp0Y5dSV7aKgyoWbRjPrq0GYreC+NsqQ4havUGDlwv4DC6seKedWyjOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SgmTK8vM; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SgmTK8vM"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-796fe71deecso57999756d6.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 02:05:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759827945; x=1760432745; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yxkYIe5lCPbXvt5LEAWJhmf35lUqskMAv390SOAEtUw=;
        b=SgmTK8vMKYX7QMxUZFnxBPsBbjGyf/Opx3B9nD/U7vCHW696STNWUVqvJi75fANRi2
         lS8RPHU4TVCeqWojLlxugAC213SVLQZknqV2nVU8dyKeTviS/8AE76u5LWXPMQ2ZYaVq
         FJZTDIEpTTxSM75mLqE3WW19/oOYhYP2hkNKspjhys6rvkROIh54D9Vnqc7JUCuBpQPT
         JYz5GL06B41Zx82dm7wEgboWHMOaxpEQ5vooCeUUEd6HtDqOfTkuNNIbIS5aAW7jK5fy
         5z98JF/X41FF5qNtDrMjXfdNX+DPLideG0YsO51c10WinV4Ro4pjNMdJWQILxb/rYEjp
         kQeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759827945; x=1760432745;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxkYIe5lCPbXvt5LEAWJhmf35lUqskMAv390SOAEtUw=;
        b=JviuW3Eh0i4ksEEdPzzKsJGoppS6q5fs2PAUPKFze+MxQWIxBjhtIys+QtlksXLhLO
         1wpiVbk9k4w2gWx+amUtj5O4NLbkT262UElZL1skckzyZ412W7HF8u1jJnkBJvAmLE43
         49W4ZEKQ+XWQZVlzGAMxp4SXKAJgME0GacZpJERwy4OwfnsFtGw4jMTPoUbequEu304u
         OxKMG7p4nbaMP/GEruSYg9iOYn3OlcU1nMRY/0QHfSA7NhvquDhB5vSyQ2JE7nGg8s1v
         dLlnVy/HKaiNBjx4gWOp/yRJBaZ95iw/HgyOnVJoBWaYpD0qBI1lIw/JNPytmdLOQYBm
         9PKw==
X-Forwarded-Encrypted: i=1; AJvYcCXW9k/zfA+3i50pei3WAyD06H3Qt8zAJoFMOvt15D/ijbS+fXo3+jI5sIbzv34ufjmAUlLzfahOH0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsSdZ23jvhyvgYe3a7JF/I4jBrpnZZgnS/+8/i8qON7q6AV57
	bQVc+uSvxnCro5q61jcUQTKn1aEqB95FcFwRiaVvRy0x8K5EmC9Zs4o9C4iLETndF38lyaPIgZa
	GLAZHhGyI/DMbV1PdmaKupTzG8ZXtWKs=
X-Gm-Gg: ASbGncuH+q1l+lkuVC2JiVZZWumKDvriNU480RDsUbSAJ/mZq/1++0KHauPiCK8OwGR
	8lbDfdpf/sisg4+a7od3A//ThTJIO4wrmzEQjOEsFq2jVJbeEzKWlNI+dRw3OlgbsFIevqHdvUI
	AKt1svlt6c2isJtWbhpEr42P9QYRrti7MWTsd+EZ+YI9jXP34DaiLwpC99bYOyyxnfP6Gu8OWO/
	0p46pBTWPiCdNO/1Zz4TWjegFb84t0UnvJySCGtuJSQ4ZsjWbYyRXE8ABKdSw==
X-Google-Smtp-Source: AGHT+IGTSensva01uwyL1nNEvPr5059D7N0uaBb6xfNhSuXkh0+a6Mjpi5hSZUB/CGpt8XTeEb3Ofa98l86qjtZh1Ag=
X-Received: by 2002:a05:6214:ccd:b0:856:d1d4:d127 with SMTP id
 6a1803df08f44-879dc77bd7emr193257366d6.4.1759827945115; Tue, 07 Oct 2025
 02:05:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250930055826.9810-1-laoar.shao@gmail.com> <20250930055826.9810-8-laoar.shao@gmail.com>
 <CAEf4BzaGRDiW3fRt3i+7vvRB+oQszKjaLWVMSU6JrfmXHsJ45w@mail.gmail.com>
In-Reply-To: <CAEf4BzaGRDiW3fRt3i+7vvRB+oQszKjaLWVMSU6JrfmXHsJ45w@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Tue, 7 Oct 2025 17:05:07 +0800
X-Gm-Features: AS18NWAVWP6POrSHevBgT5yY56gEiBpWAjVVmPfMtRV7VvEgPMFL-SAZ0sgTI4U
Message-ID: <CALOAHbD5OM+_iUg3DXw+BqYU+PFae6DcQGnE1CrLoKmb9OV9Ug@mail.gmail.com>
Subject: Re: [PATCH v9 mm-new 07/11] bpf: mark vma->vm_mm as __safe_trusted_or_null
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: akpm@linux-foundation.org, david@redhat.com, ziy@nvidia.com, 
	baolin.wang@linux.alibaba.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, npache@redhat.com, ryan.roberts@arm.com, 
	dev.jain@arm.com, hannes@cmpxchg.org, usamaarif642@gmail.com, 
	gutierrez.asier@huawei-partners.com, willy@infradead.org, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, ameryhung@gmail.com, 
	rientjes@google.com, corbet@lwn.net, 21cnbao@gmail.com, 
	shakeel.butt@linux.dev, tj@kernel.org, lance.yang@linux.dev, 
	rdunlap@infradead.org, bpf@vger.kernel.org, linux-mm@kvack.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Mykyta Yatsenko <mykyta.yatsenko5@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 7, 2025 at 5:07=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Mon, Sep 29, 2025 at 11:00=E2=80=AFPM Yafang Shao <laoar.shao@gmail.co=
m> wrote:
> >
> > The vma->vm_mm might be NULL and it can be accessed outside of RCU. Thu=
s,
> > we can mark it as trusted_or_null. With this change, BPF helpers can sa=
fely
> > access vma->vm_mm to retrieve the associated mm_struct from the VMA.
> > Then we can make policy decision from the VMA.
> >
> > The "trusted" annotation enables direct access to vma->vm_mm within kfu=
ncs
> > marked with KF_TRUSTED_ARGS or KF_RCU, such as bpf_task_get_cgroup1() a=
nd
> > bpf_task_under_cgroup(). Conversely, "null" enforcement requires all
> > callsites using vma->vm_mm to perform NULL checks.
> >
> > The lsm selftest must be modified because it directly accesses vma->vm_=
mm
> > without a NULL pointer check; otherwise it will break due to this
> > change.
> >
> > For the VMA based THP policy, the use case is as follows,
> >
> >   @mm =3D @vma->vm_mm; // vm_area_struct::vm_mm is trusted or null
> >   if (!@mm)
> >       return;
> >   bpf_rcu_read_lock(); // rcu lock must be held to dereference the owne=
r
> >   @owner =3D @mm->owner; // mm_struct::owner is rcu trusted or null
> >   if (!@owner)
> >     goto out;
> >   @cgroup1 =3D bpf_task_get_cgroup1(@owner, MEMCG_HIERARCHY_ID);
> >
> >   /* make the decision based on the @cgroup1 attribute */
> >
> >   bpf_cgroup_release(@cgroup1); // release the associated cgroup
> > out:
> >   bpf_rcu_read_unlock();
> >
> > PSI memory information can be obtained from the associated cgroup to in=
form
> > policy decisions. Since upstream PSI support is currently limited to cg=
roup
> > v2, the following example demonstrates cgroup v2 implementation:
> >
> >   @owner =3D @mm->owner;
> >   if (@owner) {
> >       // @ancestor_cgid is user-configured
> >       @ancestor =3D bpf_cgroup_from_id(@ancestor_cgid);
> >       if (bpf_task_under_cgroup(@owner, @ancestor)) {
> >           @psi_group =3D @ancestor->psi;
> >
> >           /* Extract PSI metrics from @psi_group and
> >            * implement policy logic based on the values
> >            */
> >
> >       }
> >   }
> >
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>
> > ---
> >  kernel/bpf/verifier.c                   | 5 +++++
> >  tools/testing/selftests/bpf/progs/lsm.c | 8 +++++---
> >  2 files changed, 10 insertions(+), 3 deletions(-)
> >
>
> Hey Yafang,
>
> This looks like a generally useful change, so I think it would be best
> if you can send it as a stand-alone patch to bpf-next to land it
> sooner.

Sure. I will do it.

>
> Also, am I imagining this, or did you have similar change for the
> vm_file field as well? Any reasons to not mark vm_file as trusted as
> well?

Marking vm_file as trusted will directly support our follow-up work on
file-backed THP policies, where we need to apply different policies to
different files in production. I will include this change in the same
stand-alone patch. Thanks for the suggestion.

--=20
Regards
Yafang
