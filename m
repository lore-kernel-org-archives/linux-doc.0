Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795010139;
	b=IHO2Lq3GhY7zuwS+Tm/CnGViBbt8Pk0tWTKrcWLHU8c5a4n62t3T3GxgjRa818T/KK8R
	 Vka7Z2xOXuyH1X+7kAGJ+Zexa/wwuIFBwQUoyVyT2cUeN+QOrvxV5Oj4TZC+4o1CwaQsh
	 aoYFUY3Px8MbHTfmSf+7TeF/MlQrsik2qKgUa7iVOg71iclS1SxjhCt6dionr2dKof2Ec
	 mGvjVru8BZM7CJMF9VaZ9N9CAfV6kE7y9YsjJKedtoMBmR3ombPLsufKhI9O1O0cYvOw8
	 Nj07quvSa5l0HddxpvkWj6VOXhKQ/0wHm/HcRXN2V8uKTwtCzs8n5gNemH6QfrmkFbg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010139;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding;
	bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
	b=Nx3uGX0OHuLyZbfEzyP1S4S8Ab4uStrvKBYLt8Q8IbMUxKE5OAPdSZxLPuWiHHldxPHk
	 s1NZ2v7+zd+HQXXD1mbFt/0VDTHrgVYPFuCZ1LA6RN/TbtxtPrapoiro5DsuFQ8pSFXE0
	 thFrG+haPukypTo+ilkcdi+bWfgf2zj0V7JLC8vGQ9o7XPnRRvFG6yTAQkod1r8dB2PxX
	 FvE7Y2L2kwfiW65KjSIAUAvmeQMkeDvhe6d5lxTGFit4aTvlkroxdEmcbLyXwDxuK97sJ
	 n0o3d8RV57AVsY0riYJ+eun1OUZ00Lnv2mROryGT2v1ia4z5+QBkBRAfdUVqxRyWDUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QXfsJqiv;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b="YdeGXNs/";
	arc=pass header.oldest-pass=0 smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4E40606A32C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:55:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C4E40606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=QXfsJqiv;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YdeGXNs/
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795010137;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
	b=QXfsJqivqBNqfL8AggaLxuMEBU7EfXUwQ79yX9mkY0DsyoJKv14Jj/OiqP17IwmtwHUvtm
	hDttkoYGz0xiCc9jOMzkOF5g6m+QAdI/wa8hDJ5BtVIpXff4tFeOjBu8nPrel8lbwUuT3W
	PR8WTtsSxNEPBpbDUz0KfAdFrL/sUoM=
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com
 [209.85.128.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-136-s8t2q-TtPAmBBtW4x7oKMQ-1; Wed, 18 Nov 2026 08:55:36 -0500
X-MC-Unique: s8t2q-TtPAmBBtW4x7oKMQ-1
X-Mimecast-MFC-AGG-ID: s8t2q-TtPAmBBtW4x7oKMQ_1795010136
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-86c3a053d9bso13316997b3.0
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 05:55:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795010136; cv=none;
        d=google.com; s=arc-20260327;
        b=CSfpgwPD4xstv1pUJJiHQBIyrtdnm/oFNByolpSWysFk5hTC2kO72Ea4HJuyx/gr4h
         P1DNqFMppXOVOJ5Toquabf+Q/UqnnTu7DjE71APnJlSx4fn/OK11CcrM5amjat2hcZDE
         LHenGrdgR8rrUKbyG3eJEpmNAErWBaVy4OmRcln5jcutLET0e56Qc/yyIyYy8BH1gHvY
         Ew1K7uNVdHr/EARNr/hl9otP0gsOOMJ8I0UG5RPMbb0Ei/wPOaNOO7HlBbZJyVpB4PCA
         Y2CNuHuQIXWp+mEd5JKwnIJ6r+h6MGlHZ9yI9LTYUf/VuW61ktj5DO1Jm6lmeWY08cvd
         kcRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        fh=o41jPcQ0kSC5eOzwLdrShb8BbRYNaBdn8U3Hw5fZwaw=;
        b=B0qTjA6yfAQgiqzp1rgOepkX9MVVntbo1c4sY0HIb/dV16TChY3bULGsgEoYVR3hNA
         DAzh8inwbjKjjMrA+zl8GZ8VPMrV4lvdz4WU8MMRca0Jxq/1JAS+Tb5HiGrScreMm5wq
         6QX6+asyMe8QY6Y0ZBavrubRZUxUEGe0HAvRhXUY0a/1CF5B9tOKSbubNh9If8qBx2cz
         8olQoFwwlJ1KQ5Bs1LdtuxgEuJwZRJk6gHuRfs/OM0BWwS5IhrqTRTYUPvdO6xJqma/S
         y4yxz5ZFx/DxlbywLdfKUDLbeqN5lA0Hx+wRUFN6+2nPo8gGm7hyrfSunKDddU+Nz9gq
         XGdA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795010136; x=1795614936; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        b=YdeGXNs/g+hxp03HRbQSUUfYwpG+Q463Psgnm5pI6nowFTE0GT/AT+9Eba8UqJXu2F
         Rjm7s6KZtfcTE+jLnJqY9Yha9DiDRbhjBVk9n/zG7Tl/p4QVD4cOVryiVPrvuioWjJ2V
         kC4s94SucOy//FSYm1394CoCF5UK5zXU1gxH2PfPcfRIkd2mTJdDSJhVy7FSL4lT5EZc
         m+HBczANYjijzYP43BM9ZWyF2lkON43QQgIwWQhgllRW+41fvFVuY2rQaXLV1H9y0Dqo
         Sq+5Nt2E0oRySNF5RHc6s28Fs0dEBL+ug6DeSjIEnvBqVwZGg+FdASv6oArpfSCSBBSS
         kWvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795010136; x=1795614936;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q93IOK+81L655tUS3XT9KzQ8Uws4KOL15ej2huBrpiw=;
        b=gFB30f73OhZKNLHH9Md/OGVgyjebBIgiNS0X756G5+hEOmMObzA2A0ViEK1MfQS7sL
         yYm75fbtfUF1a+0+M/3d0Z+zZ0C9XPMoz+tbqs/SDch+1UzlNB823jESx3UbvYY2Slix
         awHYJq8igF4PWVlihFzSgXGlJIiqqvLK8qornyetvrX9rOjGkvmyUXGGsnANUcSumbL4
         nO21aezLatM/5YuXFTm3HIdF2E1UBxe+LrlE4UK6B+l/bOD8QAQ7UqE1JNp666ueLRIS
         k3iH60MFjJU5ODLqKxy+jOJ/ySwYVPcmTzFGR3J0FadWkhip3U0BhubZMxriBx9zgX89
         4Ogg==
X-Forwarded-Encrypted: i=1; AL+hErGPIsjcv+HMUoF0D0PpxTgPIR58qL4uCp07PL8Z7HEvHjUUz6zGrNI3GSDdlMyLy3YgVWkarD+IIyo=@vger.kernel.org
X-Gm-Message-State: APuU4Z9IjrWiPCXziG5rrVZAf+aeiuJtzbkiTIDUH9/TPwesmn/TDJgf
	wmi1Cyk8zAVWio3b4IOG+oFnZjER9XSWkCqBnk+bhhLICeCwOFXEW1zFZx02nzDfgv6112gz0XM
	efuNHruQlk0WOrBpPIJDupbaXc1oJYBVT76EyRPQG9zrcQuQZthFByAenwkGKHMsp0cKFk9sp2R
	lEHwoX2YhSitun9hTESTuOjbFB7OpVsTMnt/+N
X-Gm-Gg: AZFdTZe6gfddvAQLINLztJkBUzq4jK3sKXBxB/SQfx/eUZHvyI4iGB3vZXfEP4D/MM6
	jICaj+Jq1mv5g4hjHFGc3Ob3Jt5pf9FfT3lW54OhRyo267eF+ENDGFghxdJr8c8FLVK89uZEzyo
	pUYgn/x/kHMHOPa1Qm6uNasjjmNxHvtraeVI+Q0A7C9H9dTVDKgQE/pC9h
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id 956f58d0204a3-67dd3fdee8amr1338638d50.55.1795010135941;
        Wed, 18 Nov 2026 05:55:35 -0800 (PST)
X-Received: by 2002:a05:690e:1387:b0:67b:f249:5b16 with SMTP id
 956f58d0204a3-67dd3fdee8amr1338592d50.55.1795010135440; Wed, 18 Nov 2026
 05:55:35 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261117-v2_20230123_tjmercier_google_com-v5-4-1ce975f2a9ad@redhat.com>
 <44c0c45c0e2f47ed77bc45be47ebb3fb@paul-moore.com>
In-Reply-To: <44c0c45c0e2f47ed77bc45be47ebb3fb@paul-moore.com>
From: Albert Esteve <aesteve@redhat.com>
Date: Wed, 18 Nov 2026 14:55:24 +0100
X-Gm-Features: Aa3M54okPSWfJ_g3ixS3iw1yy5owTDFGTKhnOXZ64bND8Gaqu8R-9XYtSNGyOOw
Message-ID: <CADSE00LVsFVOmezzLgPrPWDd+L+SSGzGvqKTiX25waxRnVPh9Q@mail.gmail.com>
Subject: Re: [PATCH v5 4/8] lsm: Add memcg_charge_task LSM hook
To: Paul Moore <paul@paul-moore.com>
Cc: Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>, 
	=?UTF-8?Q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Sumit Semwal <sumit.semwal@linaro.org>, =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Michal Hocko <mhocko@kernel.org>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Shakeel Butt <shakeel.butt@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, 
	Benjamin Gaignard <benjamin.gaignard@collabora.com>, Brian Starkey <Brian.Starkey@arm.com>, 
	John Stultz <jstultz@google.com>, "T.J. Mercier" <tjmercier@google.com>, 
	Christian Brauner <brauner@kernel.org>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Stephen Smalley <stephen.smalley.work@gmail.com>, 
	Shuah Khan <shuah@kernel.org>, Randy Dunlap <rdunlap@infradead.org>, 
	=?UTF-8?B?T25kcmVqIE1vc27DocSNZWs=?= <omosnacek@gmail.com>, 
	Jens Wiklander <jenswi@kernel.org>, Sumit Garg <sumit.garg@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, airlied@gmail.com, cgroups@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-mm@kvack.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, op-tee@lists.trustedfirmware.org, 
	echanude@redhat.com, mripard@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 17, 2026 at 11:54=E2=80=AFPM Paul Moore <paul@paul-moore.com> w=
rote:
>
> On Nov 17, 2026 Albert Esteve <aesteve@redhat.com> wrote:
> >
> > Both DMA_HEAP_IOCTL_ALLOC and the new DMA_BUF_IOCTL_XFER_CHARGE ioctl
> > accept a charge_fd field that, when set, causes the allocation to be
> > charged to an arbitrary process's cgroup rather than the caller's.
> >
> > Charging is currently limited to the caller's own memcg subtree unless
> > the caller holds CAP_SYS_RESOURCE. But the capability is all-or-nothing=
.
> > A process holding it, along with a dma-heap device node or a dma-buf
> > fd can charge unlimited memory to any other process's cgroup, potential=
ly
> > exhausting that cgroup's limit and triggering OOM kills independent of
> > the victim's own activity or privileges.
> >
> > Add security_memcg_charge_task(), called in get_obj_cgroup_from_fd()
> > when charge_fd refers to another process. The hook receives
> > the credentials of the allocating process (from) and the credentials
> > of the process whose cgroup will be charged (to), giving security
> > modules a controlled enforcement point for cross-cgroup objcg
> > attribution policy.
> >
> > When CONFIG_SECURITY is not set the hook compiles to an inline
> > returning 0, adding no overhead to the fast path.
> >
> > Signed-off-by: Albert Esteve <aesteve@redhat.com>
> > ---
> >  include/linux/lsm_hook_defs.h |  1 +
> >  include/linux/security.h      |  7 +++++++
> >  mm/memcontrol.c               | 11 +++++++++++
> >  security/security.c           | 15 +++++++++++++++
> >  4 files changed, 34 insertions(+)
>
> ...
>
> > diff --git a/mm/memcontrol.c b/mm/memcontrol.c
> > index 03cd90d5e623..2e6fcbe14d43 100644
> > --- a/mm/memcontrol.c
> > +++ b/mm/memcontrol.c
> > @@ -60,6 +60,7 @@
> >  #include <linux/lockdep.h>
> >  #include <linux/resume_user_mode.h>
> >  #include <linux/psi.h>
> > +#include <linux/security.h>
> >  #include <linux/seq_buf.h>
> >  #include <linux/sched/isolation.h>
> >  #include <linux/kmemleak.h>
> > @@ -3198,10 +3199,12 @@ static bool mem_cgroup_may_charge(struct mem_cg=
roup *memcg)
> >  struct obj_cgroup *get_obj_cgroup_from_fd(int fd)
> >  {
> >       struct cgroup_subsys_state *css;
> > +     const struct cred *tcred;
> >       struct obj_cgroup *objcg;
> >       struct mem_cgroup *memcg;
> >       struct task_struct *task;
> >       unsigned int pidfd_flags;
> > +     int ret;
> >
> >       if (mem_cgroup_disabled())
> >               return ERR_PTR(-EOPNOTSUPP);
> > @@ -3226,6 +3229,14 @@ struct obj_cgroup *get_obj_cgroup_from_fd(int fd=
)
> >               if (IS_ERR(task))
> >                       return ERR_CAST(task);
> >
> > +             tcred =3D get_task_cred(task);
> > +             ret =3D security_memcg_charge_task(current_cred(), tcred)=
;
>
> Do you ever envision this "from" cred being something other than
> current_cred()?

Good point. No, I do not.

> If the answer is "no", we might want to consider changing
> the LSM hook slightly to help prevent misuse in the future:
>
>   int security_current_memcg_charge_task(const struct cred *tcred);

Agreed. I'll apply the same to the cgroupfd variant for symmetry (its
"from" is also always current_cred()).

BR,
Albert.


>
> > +             put_cred(tcred);
> > +             if (ret) {
> > +                     put_task_struct(task);
> > +                     return ERR_PTR(ret);
> > +             }
> > +
> >               rcu_read_lock();
> >               css =3D task_css(task, memory_cgrp_id);
> >               put_task_struct(task);
>
> --
> paul-moore.com
>

