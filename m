Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEF6711CBA
	for <linux-doc@vger.kernel.org>; Thu, 19 Dec 2024 00:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734569241; cv=none; b=Iamzkz4gix6gp9RrFrLDMyPHkAIVz1ke9Tc8nWeL8he8vSvzS2dDhe3vS+P14LFuzUgx/iTYEcwjB+GDuCIBoDE1U3S6r2ORmvByh5BcvjiAWXiWLwzwSyfg+HKPeeDEP+4pT0mXKClRSVInntsj4ueACg513eT3N5oUg7kxMhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734569241; c=relaxed/simple;
	bh=eAlWm1S3vSvYanCVhb0uL6gfM6y+MHRbAZ5Qfqt6+XE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VowfBpH7QaHeEFdlwJMm+Xij6D2dyh0eAiJUHU/cLNqjrk7pPTlyR6ZK9V7fBimQCkjcAvYjDqPlizg5j8RBwwSPPTpedZHaEvfPZ3BC698sIVLA5GZOYyGoLTvE141/IAJlV9NsD4B0/+Mj+BY9foy3PMqzr/nMi8Y7TMWcSzg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=LMIeEmkK; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="LMIeEmkK"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4679b5c66d0so52851cf.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 16:47:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734569239; x=1735174039; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eAlWm1S3vSvYanCVhb0uL6gfM6y+MHRbAZ5Qfqt6+XE=;
        b=LMIeEmkKZnL1lK3i96WVGKVMO9UFDTajLgGftZSTZ8XZ/GIr6DCD9cPVcTv/hvyt80
         J12wYNa8+h4sojfK9flkQvtTnqjBCy1cDslloc9TyM0eOlxoiNbhhiZk1RHiFgW1kIRy
         ZuzqjX69XyCL+gbRJg08aYiPDx7A+8GZtrQCjHKQNsd9iC6oT2FtEODtvwKtQUeIZh0V
         Jshmt+JyX7i6ZE7jJ/fYUsN5jzt1hitkW/VZdd6kSti3y2aH+Skd8cmtknIA1qFPoCvT
         pM4T+8t+Dft5s3UBEnSq9gy27qJlK+mDv9kpM8eRHJbF46VpbBKFttxttQGae8M6DjBm
         8Xtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734569239; x=1735174039;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eAlWm1S3vSvYanCVhb0uL6gfM6y+MHRbAZ5Qfqt6+XE=;
        b=RCexYXdMS0sBVz14g8xYPHcNljeZEMxW0U2mB/cFVtVbFKCDgyViPp7pNObWybLhWK
         X70SYoWHpKvlmD9dqFNqAdTYsmkQJLvAL3x0btOT/qcnUWFkpqqd678R3QAutnzxTF7I
         RHr9NQ7GngmKsoMvjqxuFEQxXME3YoTU44vtma3XgH7gfLbVQNgWpZ+gDXXvcPNBbJd3
         e8o9Q4lLgg4gyUaae0slVUB6Z5qiEobN+yo9jNnOd18TGE3bJPdsQ1/+m3S4NgNGGAeP
         uBt8/qyA/HcMiyQbgmaCwwfMkSdY5xOeK2/CazM+2QroMmrwqOnRGUk23g08h+OQeeOK
         VN1w==
X-Forwarded-Encrypted: i=1; AJvYcCVQ7iJVC4+6LBv1Eay4mNp6rkzXheKM97tzaYJJhr3gqYbBeLUJjZ6ETQOp12X5Jr4szhJl7AtcxLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgwQ1G3K8RS4yq2eXmMkmjKAfJnsmKSl8bf0KkJBseXQqjQkl7
	I3ohua/qNBmMwNCouvdsIN/UNBs7ygDW2xKNg2QOHD1jd0gOs1+FTiBHjD+hIwF0uQCKITzqAAK
	XaY/LTVeaJePfvzmxKkJnzKbwrWgGYsToL3cy
X-Gm-Gg: ASbGnctFQqZH05BbSVrBru/lERocOpwHOWgqzrboi1D1ReBj/eGfUj9+l0Dw5yBSE6i
	K3FAzkrJo+Gpnm4OW07tAWs+jEKD0PkCCSRTx4Q==
X-Google-Smtp-Source: AGHT+IFRZkbOfPKSGTVEOFW7/1qJeQqRxVC9rrJeQuojL9YVU8aGybHyM3tnuhMm1F+JrDxeKK1aZ9nlBGV+TlJ6kQc=
X-Received: by 2002:a05:622a:1386:b0:463:95e2:71f8 with SMTP id
 d75a77b69052e-46a3d988318mr636711cf.15.1734569238560; Wed, 18 Dec 2024
 16:47:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAJuCfpFYZkc===SXF35s3C0xg3q5RjpCiOQhwK=9_3RnFUye1g@mail.gmail.com>
 <20241218161850.GG2354@noisy.programming.kicks-ass.net> <CAJuCfpHDRCoaBfE8y6AppKveSTgayyTNfDyQWH=gMzO-Pkuqpw@mail.gmail.com>
 <20241218174428.GQ2354@noisy.programming.kicks-ass.net> <CAJuCfpEKg_h5pw2AxdF1wmFMt4xdOxYqv7U1uVMYcuSCB4kHuA@mail.gmail.com>
 <r7polqnhdguxrz6npklag5kjy7ipbj5lrnqai2qm3jt7x56hci@cfrcom746iae>
 <CAJuCfpGeRi73E94VCDPDGAGG+5-Sj-_YGf3JNnf6Bh4GH_M6jA@mail.gmail.com>
 <CAJuCfpHJwVXanjG0WGjo0KHHEbg1-T0HWTZqDpssoq3FvfG++A@mail.gmail.com>
 <jes252u5qfhla2bdmg6pdkfpi4a2jfhf7d5b6ra6ol2bmt352x@gunhzaca56df>
 <CAJuCfpFSD98fw=844AJPy+LT5y=zREQGtSEVj3_FCXiZ5cFR_A@mail.gmail.com>
 <ulbspoec633hfm54f3jzvoqs6ilskxou3qykk2u727pbaltvfl@lb53vjcaxnuf>
 <CAJuCfpHXRX=LLa67eWYvrK=UDxKMaOequFXfqOqDHbRrmsT9SQ@mail.gmail.com> <20241218163557.1ce2d68cacd3d800c1fea1af@linux-foundation.org>
In-Reply-To: <20241218163557.1ce2d68cacd3d800c1fea1af@linux-foundation.org>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 18 Dec 2024 16:47:05 -0800
Message-ID: <CAJuCfpE4nCemqSQf51D4h_bZt=_tjMBd=eXgN4YYrV6E4AE0ew@mail.gmail.com>
Subject: Re: [PATCH v6 10/16] mm: replace vm_lock and detached flag with a
 reference count
To: Andrew Morton <akpm@linux-foundation.org>
Cc: "Liam R. Howlett" <Liam.Howlett@oracle.com>, Peter Zijlstra <peterz@infradead.org>, willy@infradead.org, 
	lorenzo.stoakes@oracle.com, mhocko@suse.com, vbabka@suse.cz, 
	hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 18, 2024 at 4:36=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Wed, 18 Dec 2024 13:53:17 -0800 Suren Baghdasaryan <surenb@google.com>=
 wrote:
>
> > > There is a loop for_each_vma_range() that does:
> > >
> > > vma_start_write(next);
> > > mas_set(mas_detach, vms->mas_count++);
> > > mas_store_gfp(mas_detach, next, GFP_KERNEL);
> >
> > Ah, ok I see now. I completely misunderstood what for_each_vma_range()
> > was doing.
>
> I'll drop the v6 series from mm-unstable.

Sounds good. v7 will be quite different.
