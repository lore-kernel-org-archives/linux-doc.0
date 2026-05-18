Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 343283321A7
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 23:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779147558; cv=pass; b=SVkoBhDG67+2NwpkID0nrl6E3L5Mf1bHk7MiH5m8jsEjEPvgOV3NbML+JdciJrcWt9yjp4YWLng0lmG4goFykchOEeFqscVP+slzSDpKuOKocgvunFyAFXj332zQay1H31spIhME1Y3IlG5wyAgUqFzyX6AWRWpCH9UeCHWOHD4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779147558; c=relaxed/simple;
	bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BXxUcPm61GXOOUkWA++TCKaQ7JlNVO++tdUBMRGrdAzT39HiEOZnzXEpnqF7TeaLO/evgxPryTvNPGFnBOMeVcPldawHPZxtmTlr7JznxKPWOn5rU8UNvXc1URrFeJIF6cWo/ERTMktlv2mReOQC+j5+VNrgZhjMadTd0kOmD/I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CiDPL5Sm; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CiDPL5Sm"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-488940ccfa6so555e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 16:39:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779147554; cv=none;
        d=google.com; s=arc-20240605;
        b=ZhKJz9vgh4xznHuA0vbDD65VAYg4rWAnr3w6wYvju42rv6rRB28rZ78sxH0hiZE3UA
         5duq4g0ShJMlejix3vogf8WLQ2io3Ia9F6IL+/KsvFLLc1F5soyE71aUJtosQt+2ndmC
         Lf3+hmx8NDreOkvjm7+/E0qh5w9Z+8A0fgztu+hPy0sPDZO96WASAkzKr1OHhcie1Wp9
         xpdRjGheekrV1b5kUXlTtsPUmCvFnD95eyHx2Gb+hihvEkgUXT4z6K3+49Txen8F4OMy
         KFEjwxRYwqt3jsbZ0sHIo2tLqECbXAzXHkhJpEw8dJPK3RYprXl1UUwSLtUBfM3O22m/
         mv7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
        fh=QoccEo2F98Gx0gT4rBjmiqtdfqYGM5PDVliYYAdF+io=;
        b=QGbQlEBKYUA10jhajL4pXXhC4SRJcaQbzV4lTCbUIbDxvKdvDjdpufJN2EffhWxjU3
         7+WH1ot+tlpnVZIB0aDmtORlGtQvZkvTk6yczBtfeg4WiPc4yUN9MAuljljR3YkZt4I3
         jj9/90Xw8e0mc+WWXSFIi5LGB8jn0lh1kER5s8N2nXf2ntyAwN1fwqacHq6+lpKLN+Rz
         o90quDp47v8FgrzZiG2jntoP+TaybPB/7R2cWN6w3aE9+r8/n44CX926wE3VDbzsqMxb
         8wKesXVP7LYaTcT0H1CPhCBLBkCgaikSWeLSCIAfiZoyvjk6ERzd3ZRtQS26vSqiYcIh
         f49w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779147554; x=1779752354; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
        b=CiDPL5SmLs8Uj1xMnC+3rSpDgI7bJBLrSvAsM8GnEvfRWf3qxittHUYaoPOdyetJpu
         JB1hiA3FAcsQr8Xvk0ZlvumqY8XNYng0JvUpCtVG1DJHpQ0WgF+CV/NXJVDKN7ha/D5V
         uF/JQ+iboJrsMYyPRJHfPvYpLFTN70CXOfN3gkYX/seyTVNeKgps2MHzHBHUMvKup4rv
         X2KiGwO6w1ICOGOJE1bw+P3EkOGZv4lOWAD5wTrDI6E5VU08b2Pip32Il+WWFSQTsAA/
         WVeQitXHDSigAL84gB9DW8ksILFSJgC4Tab8Ztvqn9itRVBNN8b5JkxRQA519u9z2DRL
         BNoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779147554; x=1779752354;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mcq8G65erSH6P+qgAE9z4eUjbK8B0zwTDtFgfrR4hAQ=;
        b=QLP898L3xpMGTc3NnBakF7YR6eHCc9Ssh4QnobvOAZ2vusw8ICym1yMsrhUdul1e2v
         Mn5ODU9ZhPpdSL92RM+GCe8VBIQ1j2WhpNCUlv4P8ELSG2e4Vuy0CrrrlxxsQcZPGcwL
         0dbZLXK7PCOWB7yrz0sEXOwjPGpcrtLNcxknVp/KUvS+N0TItTRewxKL+UxypabDzBZC
         57bJ/vcMH/74d/MvRsNLYXDpFHkOEqAKF1m3QZdb+vvw9fLBMx/chdpdBYdAMe8Hhxwe
         kcIEXuuEmzLXp0VfLUQLMYRp7tfbc9lypKmx+7KWXeCILqTm8tsquQQwWOjTTDeX0aiG
         xCSg==
X-Forwarded-Encrypted: i=1; AFNElJ97jE1letLHLF9rwncKmdD4eoDppBPoXvYEftm69G7QrSwXQE2oIL4KIrSSoaTnjPqPabFmsrpDQ6k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDepAOedvTiPEkMfr7jUHwzVWrmKuztPi9IVl0NWoAxamBxVVy
	qHypJa5pwVSgi+iMNLcOhujcIx+cXg5vy/hP3Wsq3PyGeE8az5XLLicEWyM5ET6tUI1GBiTJtK6
	F1XH7fII/ux82QunVa6mBgiHQt+/fvMYOzInq+h05
X-Gm-Gg: Acq92OG0nEp8frrifewMMAA0P5AU61uhwqKCJpor0SAqbh/l2NGgI+6J9qw9f7juqmk
	3+GNBCHpMQTj3XSAFuBCy9TsE4SO7Dr3C9aJxvqWODuC8Xj1qyUZhV+8re0V5DmiR2z6sGgPpAW
	GFoJNmNv64RRsf2nf3Dph78uLjI+HmlWOXKHun/pe/+I+HPGe0PcIklG1iISqTKQlcHy7RvUbqg
	akSCmfh6twzHfDJTqAa0na9iIW/F+6MGh8Ip0EjkUrl7eBvz9YkEo4f04rhEIYGl/hnwPtvWjlt
	UtMoyNi4mOQM24RRsvFT+6G2u5t7lX09HSNG0z7F0I8bizU9
X-Received: by 2002:a05:600c:83c4:b0:48a:56fa:36dd with SMTP id
 5b1f17b1804b1-48ffd85790amr3271995e9.11.1779147554173; Mon, 18 May 2026
 16:39:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-v2_20230123_tjmercier_google_com-v1-0-6326701c3691@redhat.com>
 <20260512-v2_20230123_tjmercier_google_com-v1-2-6326701c3691@redhat.com>
 <20260515-hinschauen-effizient-9e3a05a94f2e@brauner> <CABdmKX0d6Zsg+_TxXjB80UZR23ZvXzxYoWzORgwmx=ZiuE+Nzw@mail.gmail.com>
 <208fb820-d8eb-4832-a343-ef8b360e8120@amd.com> <CADSE00Lh95ygoXGKJGsYvQGEsFV8sVmwEC3uvh8M6r3ERzaJwg@mail.gmail.com>
 <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com>
In-Reply-To: <88efe10a-8b93-4a81-8279-4a5559d0f17c@amd.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Mon, 18 May 2026 16:39:02 -0700
X-Gm-Features: AVHnY4K5WzHxjnmBKK1J4Ij9G3s1JmujGOC18rtfp3AXYH6mFeA4fkV1W-efX6I
Message-ID: <CABdmKX3yZubjDKbVqwrjHAiKyj_ioHzOoxd0wzFbJK=PAGOqcQ@mail.gmail.com>
Subject: Re: [PATCH RFC 2/5] dma-heap: charge dma-buf memory via explicit memcg
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Albert Esteve <aesteve@redhat.com>, Christian Brauner <brauner@kernel.org>, Tejun Heo <tj@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, =?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Michal Hocko <mhocko@kernel.org>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Shakeel Butt <shakeel.butt@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Stephen Smalley <stephen.smalley.work@gmail.com>, Ondrej Mosnacek <omosnace@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org, 
	linux-mm@kvack.org, linux-security-module@vger.kernel.org, 
	selinux@vger.kernel.org, linux-kselftest@vger.kernel.org, mripard@kernel.org, 
	echanude@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 18, 2026 at 7:07=E2=80=AFAM Christian K=C3=B6nig
<christian.koenig@amd.com> wrote:
>
> On 5/18/26 14:50, Albert Esteve wrote:
> > On Mon, May 18, 2026 at 9:20=E2=80=AFAM Christian K=C3=B6nig
> > <christian.koenig@amd.com> wrote:
> >>
> >> On 5/15/26 19:06, T.J. Mercier wrote:
> >>> On Fri, May 15, 2026 at 6:53=E2=80=AFAM Christian Brauner <brauner@ke=
rnel.org> wrote:
> >>>>
> >>>> On Tue, May 12, 2026 at 11:10:44AM +0200, Albert Esteve wrote:
> >>>>> On embedded platforms a central process often allocates dma-buf
> >>>>> memory on behalf of client applications. Without a way to
> >>>>> attribute the charge to the requesting client's cgroup, the
> >>>>> cost lands on the allocator, making per-cgroup memory limits
> >>>>> ineffective for the actual consumers.
> >>>>>
> >>>>> Add charge_pid_fd to struct dma_heap_allocation_data. When set to
> >>>>
> >>>> Please be aware that pidfds come in two flavors:
> >>>>
> >>>> thread-group pidfds and thread-specific pidfds. Make sure that your =
API
> >>>> doesn't implicitly depend on this distinction not existing.
> >>>
> >>> Hi Christian,
> >>>
> >>> Memcg is not a controller that supports "thread mode" so all threads
> >>> in a group should belong to the same memcg.
> >>
> >> BTW: Exactly that is the requirement automotive has with their native =
context use case.
> >>
> >> The use case is that you have a deamon which has multiple threads were=
 each one is acting on behalve of some other process.
> >>
> >> At the moment we basically say they are simply not using cgroups for t=
hat use case, but it would be really nice if we could handle that as well.
> >>
> >> Summarizing the requirement of that use case: You need a different cgr=
oup for each thread of a process.
> >
> > Hi Christian,
> >
> > Thanks for sharing this atuomotive usecase. If I understand correctly,
> > the actual requirement is attributing dma-buf charges to the right
> > client, not putting each daemon thread in a different cgroup?
>
> Nope, exactly that's the difference.
>
> The thread acts as a filtering agent for both memory allocation and comma=
nd submission for somebody else, the process on which behalve the daemon do=
es things can even be in a client VM, completely remote over some network o=
r even something like a microcontroller.
>
> Everything the thread does regarding CPU time, GPU driver memory allocati=
on as well as resources like GPU processing and I/O time etc.. needs to be =
accounted to one client which can be different for each thread of the proce=
ss.
>
> The only thing which is shared with the main process thread is CPU memory=
 resources, e.g. malloc() because that is basically just needed for houseke=
eping and pretty much irrelevant for this kind of use case.
>
> The problem is now you can't do that with cgroups at the moment but unfor=
tunately only the kernel has the information you need to know to do this.
>
> So what you end up with is to define tons of interfaces just to get the n=
ecessary information from the kernel into userspace and then essentially du=
plicate the same infrastructure cgroup provides in the kernel in userspace =
again.
>
> > If so,
> > the `charge_pid_fd` approach achieves this directly by passing the
> > client's `pid_fd`, without needing to add per-thread cgroup
> > infrastructure.
>
> Well it's already a massive improvemt, we could basically stop doing the =
whole duplication part for the GPU driver stack and just use cgroups for th=
is part.
>
> Doing that automatically for CPU and I/O time would just be nice to have =
additionally.
>
> Regards,
> Christian.

Hopefully I'm following correctly here.... So you are duplicating the
GPU driver stack to achieve remote accounting on a per-thread basis?
Does this mean for GPU allocations you currently have some GFP_ACCOUNT
magic in your driver to attribute GPU memory to the correct remote
client? So this series would close the gap for dma-buf allocations,
but what about private GPU driver memory allocated on behalf of a
client?
