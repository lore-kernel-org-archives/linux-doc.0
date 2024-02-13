Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C43F56313D
	for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 23:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707868489; cv=none; b=Gp/aLBOQe4zC4wQ9brpBhQ25DR6bI9mM7Ta4varUdLME9S3LQgzo1fLGEfcKx7rqhLG6a6Iy8LbKPQrYZQsHvPIveWvGdLR5mp11jbsIK5NdvV3ss5l1WBfwUcdIA/vtuQ2P/9OToX7NLgDH8uZ7S1PuUfutVta/k/93HAJE+UU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707868489; c=relaxed/simple;
	bh=azZvqzbTFipUnuC8HX9TaKZdjTIk9iGcAhgBe6cJRrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mR1BCKAlksLJHdc4JemkJ7Xoz5lu7hNC1G2BmXpK0rsGDCuXb5rmPGZKIiPffUshuikM8W20b+f+PPyypUUbkI5DOwCexSVQLlQG4TYAa6APPoaAd2TnVk1gc/PcbM7Ep+9EZEnlnQgY9PHux6wMwwybi2OB9LfRqxpfQxr6HYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=iZIWTFME; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="iZIWTFME"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-42c6b6ec76eso31603211cf.1
        for <linux-doc@vger.kernel.org>; Tue, 13 Feb 2024 15:54:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1707868486; x=1708473286; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=azZvqzbTFipUnuC8HX9TaKZdjTIk9iGcAhgBe6cJRrA=;
        b=iZIWTFME+t+1SHOM4yinordj9CYruFblhTVUvUm/W2nVLfGoAk0wGwx47CyflginyL
         eJ0RfbdAzZCfikmzvtiggCm3X0xJxdc6vf9baCea+zdo48Ua4RoG90WIMjqjxySsISZW
         Jlw7/YPzvUoMOXACZx/Ohyb+YgL9kD4+Ikcg4OMr49xmcF46nGxwG8VQMluOOeAZG7IR
         tgZCffzEPQbegLqUTg7lQzJHp0W/4ij9QTKCspJcUqyCjwYKvN6UgUaLHG3V+Gby6bxd
         zKJ9KT/8VMAc3EdhCSFH696NoT8yEs8oEgKCYxE/72LrScYPwq98k25LYKxT0fN7HZqP
         J+kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707868487; x=1708473287;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=azZvqzbTFipUnuC8HX9TaKZdjTIk9iGcAhgBe6cJRrA=;
        b=nVR0VWCX5v9DaSaG1DHnjg5/I0YMgMEAbzw/uYvFwjpW+CAMF8hp99ifEAjOIIUnQE
         BjoXbj0Asr/ELWS/p7fZiz7vKMh6dcGjSiiOBYc5wpS9zCJK0nvUM7fMeJr1QKb6OTwx
         XVNPsB+KTApDn/0kSdcmgIzdhsYuE3GgP9jbeAPPOsENyQpyIk1lYHgy5/4a+fS8GBxH
         Q3HYqgsIsZRTVrL5AaRBiy/618mpaTT1+ebKXkFehIb/aEFyLb+inQsin86tk06vpLDU
         uHkw8rsEjjNNrVbCNa4FwGXiYrLiuwRZn1WgnTLjeq+AjZuYrLOyR82cCgTXNeTY6XnU
         y7Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXi00oEoq3+bdDfIw+30//ALGtFyYXPC1vXU3HdIIDBMKewEZLtIIq+TDmKYEw0qEOMABwJ9sAPpw/ZnhYtTqLM3hJ+W3rYMjIW
X-Gm-Message-State: AOJu0YzAxuu3BrwMTLKX4xoGdl0s/H8YbV3kddQLUhZ19znXMcZgmxNX
	cBZw7vidtaPSQr5wI3L0LLXB4BVhsbjkB1r6s1qJoC2szLV/+G7e7+ErwdaBHZu328y7lMkpTC6
	DpoUT3l36iJF4DpHlzdurXQc3AaITU+Z3d4rI/g==
X-Google-Smtp-Source: AGHT+IEvHYDq5ElFOxC+Jycs64+Hk1KrOdwVZPwmI5s/vqF7SbUqUg8DtswJfzCkhvxh12zppSmre5tJAe7RcmjwUGQ=
X-Received: by 2002:a05:622a:41:b0:42c:6fb6:8d2b with SMTP id
 y1-20020a05622a004100b0042c6fb68d2bmr1159462qtw.46.1707868486727; Tue, 13 Feb
 2024 15:54:46 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zctfa2DvmlTYSfe8@tiehlicka> <CAJuCfpEsWfZnpL1vUB2C=cxRi_WxhxyvgGhUg7WdAxLEqy6oSw@mail.gmail.com>
 <9e14adec-2842-458d-8a58-af6a2d18d823@redhat.com> <2hphuyx2dnqsj3hnzyifp5yqn2hpgfjuhfu635dzgofr5mst27@4a5dixtcuxyi>
 <6a0f5d8b-9c67-43f6-b25e-2240171265be@redhat.com> <CAJuCfpEtOhzL65eMDk2W5SchcquN9hMCcbfD50a-FgtPgxh4Fw@mail.gmail.com>
 <adbb77ee-1662-4d24-bcbf-d74c29bc5083@redhat.com> <r6cmbcmalryodbnlkmuj2fjnausbcysmolikjguqvdwkngeztq@45lbvxjavwb3>
 <CAJuCfpF4g1jeEwHVHjQWwi5kqS-3UqjMt7GnG0Kdz5VJGyhK3Q@mail.gmail.com>
 <a9b0440b-844e-4e45-a546-315d53322aad@redhat.com> <xbehqbtjp5wi4z2ppzrbmlj6vfazd2w5flz3tgjbo37tlisexa@caq633gciggt>
 <c842347d-5794-4925-9b95-e9966795b7e1@redhat.com> <CAJuCfpFB-WimQoC1s-ZoiAx+t31KRu1Hd9HgH3JTMssnskdvNw@mail.gmail.com>
In-Reply-To: <CAJuCfpFB-WimQoC1s-ZoiAx+t31KRu1Hd9HgH3JTMssnskdvNw@mail.gmail.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 13 Feb 2024 18:54:09 -0500
Message-ID: <CA+CK2bCvaoSRUjBZXFbyZi-1mPedNL3sZmUA9fHwcBB00eDygw@mail.gmail.com>
Subject: Re: [PATCH v3 00/35] Memory allocation profiling
To: Suren Baghdasaryan <surenb@google.com>
Cc: David Hildenbrand <david@redhat.com>, Kent Overstreet <kent.overstreet@linux.dev>, 
	Michal Hocko <mhocko@suse.com>, akpm@linux-foundation.org, vbabka@suse.cz, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	corbet@lwn.net, void@manifault.com, peterz@infradead.org, 
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org, 
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, nathan@kernel.org, 
	dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, rppt@kernel.org, 
	paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
	dhowells@redhat.com, hughd@google.com, andreyknvl@gmail.com, 
	keescook@chromium.org, ndesaulniers@google.com, vvvvvv@google.com, 
	gregkh@linuxfoundation.org, ebiggers@google.com, ytcoode@gmail.com, 
	vincent.guittot@linaro.org, dietmar.eggemann@arm.com, rostedt@goodmis.org, 
	bsegall@google.com, bristot@redhat.com, vschneid@redhat.com, cl@linux.com, 
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, 
	glider@google.com, elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> > I tried to be helpful, finding ways *not having to* bypass the MM
> > community to get MM stuff merged.
> >
> > The reply I got is mostly negative energy.
> >
> > So you don't need my help here, understood.
> >
> > But I will fight against any attempts to bypass the MM community.
>
> Well, I'm definitely not trying to bypass the MM community, that's why
> this patchset is posted. Not sure why people can't voice their opinion
> on the benefit/cost balance of the patchset over the email... But if a
> meeting would be more productive I'm happy to set it up.

Discussing these concerns during the next available MM Alignment
session makes sense. At a minimum, Suren and Kent can present their
reasons for believing the current approach is superior to the
previously proposed alternatives.

However, delaying the discussion and feature merge until after LSF/MM
seems unnecessary. As I mentioned earlier in this thread, we've
already leveraged the concepts within this feature to debug
unexplained memory overhead, saving us many terabytes of memory. This
was just the initial benefit; we haven't even explored its full
potential to track every allocation path.

Pasha
