Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922EB1CACC4
	for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 23:53:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732146793; cv=none; b=iO003/obT2ozhxhYFVY9u1gocV47jusAhljRtWnJf3FZM+ngm1SgWOzv7h7054GTYqS9GOqshJp16WHXd3DWYJJHOFt2Qi6bOAbiW6MfFEXg5w8+ZiuDJu8g6mIo7L694lJIFHd1NM7w49m0RLPMVBnh42tD7VWxxfOHOh5qGZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732146793; c=relaxed/simple;
	bh=tfSoJca5Mys7vmbDQ2ZgrFBGA9utin1j3Zw1PxzFbUo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=X7ZMAEgbfwdXqPhFfqVlSuievDMDmdeBVuk8E9o+h2vhSYEk7CNPS5SqwBMRUlhXAHNqWPWgEbdfLcNdLEN6l9sB8A8MgS36VQHUWDe+IYOGd+DRedM523opEszlLXpj021aV2Y1FJMkwpLNK27r3OUO7GTVqxUynZQ9ySdNUkw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ILbPTznm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ILbPTznm"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4608dddaa35so150781cf.0
        for <linux-doc@vger.kernel.org>; Wed, 20 Nov 2024 15:53:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732146790; x=1732751590; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tfSoJca5Mys7vmbDQ2ZgrFBGA9utin1j3Zw1PxzFbUo=;
        b=ILbPTznmoPrwisJoDE6rtUOqk4dYM/nbaWIKzBY392AtjECBhRLloYM5WGqH9JHZCv
         nMt/ezOlc7JpRSGzhJMYrNzhj/Ubyd5rr20I8uSA8jWUYktZnB12XeuZhRZPSDzAEIGl
         UC3Yn/DyhcZ/Prot7LemvewVu4E9TDxKuOnA4yrvAL0xEY+ygCiYXs3frDTkHVCGs6yL
         4g+FHmO0nfdCi6Se7dB72WhTSfrJiRhulDO1LZ+pGeo6C532UqnIEwQ8OPK32+eQ2Wwl
         n0/V2rf5VnMqvhtPXOQc/dbo/G0IEDJWZ8aWIlocczF3Ro8mdYa0ciJlfyN9ztAE5AYV
         x6oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732146790; x=1732751590;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tfSoJca5Mys7vmbDQ2ZgrFBGA9utin1j3Zw1PxzFbUo=;
        b=mTzAYGM3tLT5seULKM7vWsm5yhhCk6Y0Yea5ZgXCL/B6Fr0dgXnIZktEUXNbhG3HAw
         97t1OKysaDP/gflHvK1UoarXOFN/tuK+drK3BeUOrpkDuigIjyJa0YchJAe1bbYN9YWe
         PJZRexVXh+rRMIFcuqV6IjHIlGzpKv/pZ7d1B5xCLe0rOXHSqNgdcrOW6hvkGXFy9Fgp
         Akn4WzC+n5Ii7KAcVqYENmgy3s1zo0thoOERISrgbhUsWuwZxIFOKX6DkR/Nwcmw3sr5
         YcWjZZcdzvCOwAMvuQY07xWdEX+HMKHCJlFc10hNrZn5n+ScH+MAHPc7FlC0whEf0GT/
         ohqA==
X-Forwarded-Encrypted: i=1; AJvYcCXHeGAtT34QTgGAX6rsmPB3JBcj07PJc9TMer3WQ8jdfW0gCqSmlQJVF/62x9MQgiiZ7rIbAJ6A+Ms=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmA9RfC+rPq0rbU0hzya5YNeIFrrBw6ZF5zlB/85KVEuIjp0so
	WEaJKcVLkpdBBLXtV/UZAwzfaX8QnjOFuoJzFujlTmgQKF4AspP6JwHRVdV/hI20cdOKxhl4B18
	iwMns5EY5cVWWFtwdVtMmevBQF4+bL6SGUJ9g
X-Gm-Gg: ASbGncuCzTno5TL/EYDTAheZDT7BWcjTBdbFUpxmM43NXtT64Ij8hnrBUQQ68d94LMF
	QasM9ZXJEIZvJE7GBPy7c5NBq5o4B/1I=
X-Google-Smtp-Source: AGHT+IHOHqtu12HxKTzwQ9ea8Tgqmnl1gO3SOvsktFa3dqeLwFmRLXisS/65u0SwMQl44JLD7qB1bPGBItqFEiOgUCo=
X-Received: by 2002:a05:622a:191a:b0:45f:89c:e55 with SMTP id
 d75a77b69052e-4652ffd2a22mr1447381cf.8.1732146790188; Wed, 20 Nov 2024
 15:53:10 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241120000826.335387-1-surenb@google.com> <hdvig2tptf3hi6nmszafarzqb6j56abfbebppqmruvpihlf435@46b57hyw2pfc>
In-Reply-To: <hdvig2tptf3hi6nmszafarzqb6j56abfbebppqmruvpihlf435@46b57hyw2pfc>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 20 Nov 2024 15:52:59 -0800
Message-ID: <CAJuCfpGjm92OiWO_APpZRsRdgC_a=g5cTmwfHoovOPYd+-RGPQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/5] move per-vma lock into vm_area_struct
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: akpm@linux-foundation.org, willy@infradead.org, liam.howlett@oracle.com, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, minchan@google.com, 
	jannh@google.com, souravpanda@google.com, pasha.tatashin@soleen.com, 
	corbet@lwn.net, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 2:10=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> On Tue, Nov 19, 2024 at 04:08:21PM -0800, Suren Baghdasaryan wrote:
> > Back when per-vma locks were introduces, vm_lock was moved out of
> > vm_area_struct in [1] because of the performance regression caused by
> > false cacheline sharing. Recent investigation [2] revealed that the
> > regressions is limited to a rather old Broadwell microarchitecture and
> > even there it can be mitigated by disabling adjacent cacheline
> > prefetching, see [3].
>
> If 'struct vm_area_struct' is prone to performance issues due to
> cacheline misalignments then we should do something about the
> __randomize_layout tag for it. I imagine we can identify the fields
> which might be performance critical to be on same cacheline or different
> cacheline due to false sharing then we can divide the fields into
> different cacheline groups and fields can be __randomize_layout within
> the group. WDYT?

I think that's a good idea since shuffling these fields around does
affect performance. I can look into it once these changes get
finalized and the layout gets more stable.

>
