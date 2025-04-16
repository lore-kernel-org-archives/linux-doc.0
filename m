Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 822FA245025
	for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 22:51:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843914; cv=none; b=uP/MAkS/nECj4AWE9JkV8nrqvm0eUF7J9W91iamGgo4Ijcrjlt+honJN8ZceR/lNFiA1pDKnr4X9VQlM/UoAQ3ZvjjlN2/qlrMWa8DEyQWfpkxyKoSaPmwcTf5mUWhMpkqp3XEhWqxNpfvG2fWLerW+pMYwAq75FSmvkEeQk3+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843914; c=relaxed/simple;
	bh=IoJJSCOlCHUpZacswypeEIdZhmajgDkZrYjCwe4+91k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmDRq10w1qM0BzRLyfhKtTYhg7H2cZr5Oo+XG58SRp1S0Z7HyVyJ1iE+TQ9fpc0iRaXkP4Pjuttm4cGF9O+mlXD3zrqW/j/VDd7QAzzfn291+h4+16bjt0DmrnYv8MqDusqBzkgM72zG8sj+6D1/vWbyVv5ZdrkKkB/ml8I7XbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=b5/XzFrA; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="b5/XzFrA"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43cf3192d8bso12325e9.1
        for <linux-doc@vger.kernel.org>; Wed, 16 Apr 2025 15:51:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744843911; x=1745448711; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xgiFznxyXwNZAjYFXBtqbEchRNoGqLP4Udb3wMlePFc=;
        b=b5/XzFrAbTLxITj8fEBhq+9TXE7M2zoaCl27FWagkLvqpsGuFKZYBr15J8SQArMn2X
         PPpOgftSvgtG52poAdg86cS6H1cWhaioEbDgmCFtUH+VpMM0jtAnWrye9ZWXLodMfrDt
         wEJmXouc254BJfa7SMDIwU0fX7vg3dP2tRJpGteI+93EUDDTb/9Acy6KFUtYPRXv+MNr
         b0UCqUB9Via5KtkhSjK+63mulH9PocDSlsx2pV7hDJsl/vsiSerrSxBBIC+Lnizuyn9Z
         3MWviFf41F7XxykpbM6AzcywbT7pYwmQwkH9AGEiHG7Rh6aqxeqkAbScYAmQBqsmUs++
         pKPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843911; x=1745448711;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xgiFznxyXwNZAjYFXBtqbEchRNoGqLP4Udb3wMlePFc=;
        b=tiCE1BU+m/jVWC5v1irHtZte6unIn89g4BLCBnd56s7m7cdLF1kauobPx8XeoMhYAq
         eer/rtuAKsca9uMiQ9P9AOD0NdNt9clpde2V0sFNKYM5TfFb/1hfIGtnGZx6sZ+BkEif
         DGfp+NJf7/dD+BPvbub6TygDcB319B4EXEJ0QIq0qw+i6WOehBUmQfSr+fn6HOTs82ws
         V6odrENY3I8W3s84j9yVL7UTMLOWqIyuQPaBDm7P1U/2Q+A3Vdxf8bU7vnsyQJvnpmm5
         VnWrzUh8A4+6BdTR3iI1Yc7afxcSiRpSsueNOg90KNzFk1EQfbMfhBKhkBmMwDrveHj5
         OAWg==
X-Forwarded-Encrypted: i=1; AJvYcCW7dRgSXyge2dgzgoSosUXbgEMc9sM21lGhz+afTYe5RMlXmCDkp0e/shWkEe/S9eViyeTqT/7XflI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4e3JxrICGZTEWLJhIjrluFEtdGPjOBm3u6jugns6QcW9qtipP
	mJn86BflU12ldqvtnz+8dpvErEzH6tom8WXRwdaL6W2E15o5Pa26WYueKM9Zij6QueM50oz38Vy
	jZdv0V4P7ooCq57ZNROX3oogVk+16/YasaKpr
X-Gm-Gg: ASbGncvxg5E97hsvEosrDkmf7tEq62ISvL6d2Egv32WFnCQr2AR/2WQRPYjrA7G/srV
	sakebM1RkzucLpfY7eUeHgPnyNnMeXGaEGyyPg8tBLBGZ908L7owHfDTR8+hyB+kGTZ06XoMrP1
	CQ0EQRcS5oserrNOIspyQBggqLWoCxSPVgh0V610WGVKVXy9qOFFLznGV6c4m3rw==
X-Google-Smtp-Source: AGHT+IHXWGWfGEo9AOua5ZBzOd3bdHf6i/F7EC52V5Mq1yV8M20CMUTcOJBN7M+4okB7URR+SAXHkZhutXlJ3SZFaXo=
X-Received: by 2002:a05:600c:3509:b0:43b:b106:bb1c with SMTP id
 5b1f17b1804b1-44062a3ef31mr505705e9.0.1744843910585; Wed, 16 Apr 2025
 15:51:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250414225227.3642618-1-tjmercier@google.com>
 <20250414225227.3642618-3-tjmercier@google.com> <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
In-Reply-To: <CAPhsuW6sgGvjeAcciskmGO7r6+eeDo_KVS3y7C8fCDPptzCebw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 16 Apr 2025 15:51:38 -0700
X-Gm-Features: ATxdqUF2F5Lgo5RIa4ABADC_SqcPejYG0M9lcwCAu9guCcJWCuAb8fIDqfWHFPg
Message-ID: <CABdmKX0bgxZFYuvQvQPK0AnAHEE3FebY_eA1+Vo=ScH1MbfzMg@mail.gmail.com>
Subject: Re: [PATCH 2/4] bpf: Add dmabuf iterator
To: Song Liu <song@kernel.org>
Cc: sumit.semwal@linaro.org, christian.koenig@amd.com, ast@kernel.org, 
	daniel@iogearbox.net, andrii@kernel.org, martin.lau@linux.dev, 
	skhan@linuxfoundation.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, android-mm@google.com, 
	simona@ffwll.ch, corbet@lwn.net, eddyz87@gmail.com, yonghong.song@linux.dev, 
	john.fastabend@gmail.com, kpsingh@kernel.org, sdf@fomichev.me, 
	jolsa@kernel.org, mykolal@fb.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 16, 2025 at 3:02=E2=80=AFPM Song Liu <song@kernel.org> wrote:
>
> On Mon, Apr 14, 2025 at 3:53=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> [...]
> > +
> > +BTF_ID_LIST_GLOBAL_SINGLE(bpf_dmabuf_btf_id, struct, dma_buf)
> > +DEFINE_BPF_ITER_FUNC(dmabuf, struct bpf_iter_meta *meta, struct dma_bu=
f *dmabuf)
> > +
> > +static void *dmabuf_iter_seq_start(struct seq_file *seq, loff_t *pos)
> > +{
> > +       struct dma_buf *dmabuf, *ret =3D NULL;
> > +
> > +       if (*pos) {
> > +               *pos =3D 0;
> > +               return NULL;
> > +       }
> > +       /* Look for the first buffer we can obtain a reference to.
> > +        * The list mutex does not protect a dmabuf's refcount, so it c=
an be
> > +        * zeroed while we are iterating. Therefore we cannot call get_=
dma_buf()
> > +        * since the caller of this program may not already own a refer=
ence to
> > +        * the buffer.
> > +        */
> > +       mutex_lock(&dmabuf_debugfs_list_mutex);
> > +       list_for_each_entry(dmabuf, &dmabuf_debugfs_list, list_node) {
> > +               if (file_ref_get(&dmabuf->file->f_ref)) {
> > +                       ret =3D dmabuf;
> > +                       break;
> > +               }
> > +       }
> > +       mutex_unlock(&dmabuf_debugfs_list_mutex);
>
> IIUC, the iterator simply traverses elements in a linked list. I feel it =
is
> an overkill to implement a new BPF iterator for it.

Like other BPF iterators such as kmem_cache_iter or task_iter.
Cgroup_iter iterates trees instead of lists. This is iterating over
kernel objects just like the docs say, "A BPF iterator is a type of
BPF program that allows users to iterate over specific types of kernel
objects". More complicated iteration should not be a requirement here.

> Maybe we simply
> use debugging tools like crash or drgn for this? The access with
> these tools will not be protected by the mutex. But from my personal
> experience, this is not a big issue for user space debugging tools.

drgn is *way* too slow, and even if it weren't the dependencies for
running it aren't available. crash needs debug symbols which also
aren't available on user builds. This is not just for manual
debugging, it's for reporting memory use in production. Or anything
else someone might care to extract like attachment info or refcounts.

> Thanks,
> Song
>
>
> > +
> > +       return ret;
> > +}
