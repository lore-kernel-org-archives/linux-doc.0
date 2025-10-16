Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 142027494
	for <linux-doc@vger.kernel.org>; Thu, 16 Oct 2025 06:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760597003; cv=none; b=Kb4evgfD4+JOJyysmhVd/4GYUz4Im6nWkO+ehoRZs8j3SoAdGmoGw96zJSndSd3H/6IZpBdAN76KMCc8f/mYxqJsaXaaFE9cXReVyNa1zXtXugQD+FappuzIba68wc7l7SS7c/QrUDWN4vqs2HUvhRyCZZExZ/5zjgimOGkmM0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760597003; c=relaxed/simple;
	bh=KXGiPPPiCRsCRTJJMBKXVC7wo1U395s3TxLne1Z/qUY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XSrRIDJKk4ju6Ft+Vf5DFr9bvPX3nuY5RQcIMbXBf+bgYUJnVcF/rrykeMZowGdJtFriD29FPFqr5sCtMNldiDbX1BsSeVGvdxwMC3ItkIKPAeLx++K5OFLlNun9ttsP+DxrqJFL9bymSdTWfWFuEmTwSCIaZvV6Gr+00MRKPE4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G/U7ysCL; arc=none smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G/U7ysCL"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-635401a8f5aso282670d50.1
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 23:43:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760597001; x=1761201801; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uMB4WotgJMB2B9lnpkEFb08bYlsI5GtgT/xlgxrxy7I=;
        b=G/U7ysCLNRQXU4oow07s5nqF2TFn42erL8SMFGnQPBsnTZTIBQTMirqitV2kezS6Uy
         n72KSccQInAb3OPyt9hig2HJWHnAi4hNgwJtsR2pig6/NK65DjBVPVg1N61drkCdu5SN
         3AMYqILVxorhbafYf503NHwaLR3l6NNzNC6QUOzS/A/hSCf1q4AeJHZcXSciiQRdztdz
         WGMm/rKTzCH+ZaKbU+wZPutsGJ5nFtsG4oXLz118DbfU4FMYfK/Q9Ax2ReHHm/9AHy6p
         zP7cSNbBKZwYv+ubyYdIMXeLaDUnlRkVciGpLlEGQPkAMmM8gazsLBjuOJ+5mQpnVOdk
         I+xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760597001; x=1761201801;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uMB4WotgJMB2B9lnpkEFb08bYlsI5GtgT/xlgxrxy7I=;
        b=WiyzxpSkoS816k5YeHd+yW+r4JeuJMp0Z+UHB9WuEpF9ScILFmsiLzNsdq5QcoNPGf
         uwA4eUWgF+9NWG3KnCzGGMYwsrYovffgdGNAaH2VJcsoQ7z7LPq8ZXHuTg4FlaH/uQ+B
         WCUMLXHJCDR9ao/LjWi65gkFnmCFTy+4UMxPZaPyU77+wd2mDL8JqXYlTOsJshV/UJqk
         je9405RjMyNslr+SBtIPjf0eQIR5hAxtpBX4XKX9CwICaeliGpursxH5Arl+hcsW9ka3
         tzeLHb2hTYmltmVAkaK5ZMvu8hHsAPtcrap2GSBEf66ExnM6OOEhVqTaf5dC0Qalt10u
         GPGw==
X-Forwarded-Encrypted: i=1; AJvYcCVDgOwGM7rWJDCbDAtEpMgaQm+lvd2ykOxkxV0UGVA5hFSqDQ0J6sdtHcU4kCpsBpWYzpN4lhTPOac=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzsr1qc4SpK5s/axv0UDq0z1Mjc+ZnRvnBsiY3Qj2iInMgnE5kU
	8kIWzBgd25tjbSTeHVKyhIFwbHMK/J40MnW1KFNVnrdl0rREkEzJMf5UjavJ/lX2aHTezbk4Olm
	GcJeS62dQvGQeFFjFbj1muuLoGVtTUXU=
X-Gm-Gg: ASbGncuQskji/Ui8Lnml2bUHbh1oJKxBcNsDnUdAtRQVevC83Ba3lNHY+T7yAT4qj+x
	QyupSoj/rAhOmRoy5wfYvzHmesn2QAQk3X79DQveJgU2LWVvh0+fQMVyqRl7v02CRxKmM6mxY0L
	KPVFSVB2DK4L3582z5WWO1HnxbR73uPPwviFe9B16pYV5wgO2u1l3XD1YunxMhT7XDAKKsK0IsB
	PAj3qK078rtcEXLIMUhZwdxHCKw8wznlr3tyMF83jhkuel0qixhtU5q4wMKOtZwQRhJ2YPR
X-Google-Smtp-Source: AGHT+IHt55ghDR10vYNQX2CPbLTIfDAHnS68w7Y8BthdNCorUSQCnA/OvTwgVVZCE/MUA6kZegO483oB/tunMLgJW3w=
X-Received: by 2002:a05:690e:130e:b0:63e:1138:e0a8 with SMTP id
 956f58d0204a3-63e1138e2a7mr167963d50.14.1760597000939; Wed, 15 Oct 2025
 23:43:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251015141716.887-1-laoar.shao@gmail.com> <20251015141716.887-7-laoar.shao@gmail.com>
 <CAEf4BzZYk+LyR0WTQ+TinEqC0Av8MuO-tKxqhEFbOw=Gu+D_gQ@mail.gmail.com>
In-Reply-To: <CAEf4BzZYk+LyR0WTQ+TinEqC0Av8MuO-tKxqhEFbOw=Gu+D_gQ@mail.gmail.com>
From: Yafang Shao <laoar.shao@gmail.com>
Date: Thu, 16 Oct 2025 14:42:43 +0800
X-Gm-Features: AS18NWCmAzqewH7c8lKNSOM6N3YN2rFyfdEP9RCIkzoVhyDUX8WzpaYI1pA7pxE
Message-ID: <CALOAHbBFcn9fDr_OuT=_JU6ojMz-Rac0CPMYpPfUpF87EWy0kg@mail.gmail.com>
Subject: Re: [RFC PATCH v10 mm-new 6/9] bpf: mark mm->owner as __safe_rcu_or_null
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
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 12:36=E2=80=AFAM Andrii Nakryiko
<andrii.nakryiko@gmail.com> wrote:
>
> On Wed, Oct 15, 2025 at 7:18=E2=80=AFAM Yafang Shao <laoar.shao@gmail.com=
> wrote:
> >
> > When CONFIG_MEMCG is enabled, we can access mm->owner under RCU. The
> > owner can be NULL. With this change, BPF helpers can safely access
> > mm->owner to retrieve the associated task from the mm. We can then make
> > policy decision based on the task attribute.
> >
> > The typical use case is as follows,
> >
> >   bpf_rcu_read_lock(); // rcu lock must be held for rcu trusted field
> >   @owner =3D @mm->owner; // mm_struct::owner is rcu trusted or null
> >   if (!@owner)
> >       goto out;
> >
> >   /* Do something based on the task attribute */
> >
> > out:
> >   bpf_rcu_read_unlock();
> >
> > Suggested-by: Andrii Nakryiko <andrii@kernel.org>
> > Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
> > Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
> > ---
> >  kernel/bpf/verifier.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
>
> I thought you were going to send this and next patches outside of your
> thp patch set to land them sooner, as they don't have dependency on
> the rest of the patches and are useful on their own?

Thanks for your reminder.
They have been sent separately:

  https://lore.kernel.org/bpf/20251016063929.13830-1-laoar.shao@gmail.com/

--=20
Regards
Yafang
