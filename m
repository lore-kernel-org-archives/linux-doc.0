Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com [209.85.219.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F3079B73
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 18:05:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709143523; cv=none; b=D3FzmZL1hvRdl2WEYH6tSDrES5eJT4pYjTQ8NFZee/s9b+q7kQQLT2zTES5KDrXDLBc9J9lKCURk1FqOm+cakClr474GfTSoV0f7qbj/7AcynlRcJx+3eWc6Ji84PXV846D9EQfRR8FTe/Rbxf9SaJyNseY+1uS+7kyF0tJNA0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709143523; c=relaxed/simple;
	bh=M5RWLefMMZcrjC6ohvg7ZMSlCbzmM6eu4zL9kM45cas=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RSqyJoyqsoNWvVpcrtPwbKSMOS5yb1W4zx2Ab0zmUnBJVvWB+bc77qKJNipNDUxMYF5Cmymbr2IQaJckR3g8fuipE2qXoDFt8lQPuAITW5OBJuNdBdU64wYml1r5IsV9cUbTOEgDKQnpHPiE/qAAAvZSvJuisQsA3rfIArKAx94=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=07Nj3u52; arc=none smtp.client-ip=209.85.219.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="07Nj3u52"
Received: by mail-yb1-f179.google.com with SMTP id 3f1490d57ef6-dc6dcd9124bso68576276.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 10:05:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709143520; x=1709748320; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5RWLefMMZcrjC6ohvg7ZMSlCbzmM6eu4zL9kM45cas=;
        b=07Nj3u52kU5HkNbHmQi6GSJlFvm+hwSmH23kU9J3YIdBUAZcfVKU5HQ3RCYnYic0v6
         QLRHfuCjI9k+jiAG3w+DoaSoumtOezIBDz1r8Kz8fHtyP7r7SZx31n43NzTdmop/PO2A
         8mM/4NeVzeoWdN0ez7/q13ruSZDGpAfWv4C6Jt0Y0ZDccQI15hWg5epL5i0sGXGwRR2Z
         QyHgs217g8YnqC7+n46M+BhjmuNXp3pKxFMqFRf5dLwy6cELVZXPEu+Ogd7PlX5F4r/Y
         GY/qYMx/nxnzCGNBgbHCEaaY4EPWcJbvRoW29RCrocuMaX6hzZjZnlqLuzHzfEmrYQi9
         uEOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709143520; x=1709748320;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5RWLefMMZcrjC6ohvg7ZMSlCbzmM6eu4zL9kM45cas=;
        b=J7nZcxCVlvd+a6j9fSv0RK99SMVyC8NOMxgf+ygdadajbJQcoFThREmwtvmCjlRCMR
         8vUgeWFU29eaOzcYXYsnPZ8jaA1yGipyk9MFaVH0TrZenn2/TSzeJqKFdRsouX6zwIJW
         x+FypKoSrFBaFe0W3FfB6VQuRpP1Vm1z2GufODsqLa8yGFHSRTBKd3ZPozhZ1SwUQsfC
         0EKLxnNq02wHVOlSUAsvSPIlyIIjds0dL5DY6dNVljKzSDaEg4RRih+OkUSO8rNlL+c0
         SB/kWMbaVEkBK+Kk2Xgaq/mohP9s2bq3KSclAM1hIcSpA5GXz9dmc3HD8YrgIrvYAeOG
         rz5A==
X-Forwarded-Encrypted: i=1; AJvYcCVadpid3OrNn2yD5DHNglDrU8jc3kNS4qr0DldJTY0jGKPHPZev6Uzn4KDdd2YQwDFeZkAYECO1kAgBdidRXnnXbbJjPLJXP52G
X-Gm-Message-State: AOJu0YwZBd+iKB9u26EmiL9GAWLvk6jiYwJVMvoZZ59rzIeLZ2wnsujf
	oiEBCnOcd8L8NXUel/FXzKxj4yqm+ogOuF7NfjqxupuWW0ZeJSmGPHsS6qAWOL+/wT1aX8eHNjJ
	CZOMS3/aa7coRX84IkzEXYOIoW8E9H5AclVFn
X-Google-Smtp-Source: AGHT+IGXC8lezvXLfyLFgurkGO2/8+xbMmbLbWU2Dhx0X772e49nOZcLM0/mejcqQER1kvdSNB2vVup4Slt3VEZ2U4I=
X-Received: by 2002:a25:4687:0:b0:dc2:398b:fa08 with SMTP id
 t129-20020a254687000000b00dc2398bfa08mr21101yba.31.1709143520037; Wed, 28 Feb
 2024 10:05:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-15-surenb@google.com>
 <1287d17e-9f9e-49a4-8db7-cf3bbbb15d02@suse.cz>
In-Reply-To: <1287d17e-9f9e-49a4-8db7-cf3bbbb15d02@suse.cz>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 28 Feb 2024 18:05:08 +0000
Message-ID: <CAJuCfpGSNut2st7vKYJE7NXb6BPjd=DFW_VEUKfw=hGyzUpqJw@mail.gmail.com>
Subject: Re: [PATCH v4 14/36] lib: add allocation tagging support for memory
 allocation profiling
To: Vlastimil Babka <vbabka@suse.cz>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com, 
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com, 
	hughd@google.com, andreyknvl@gmail.com, keescook@chromium.org, 
	ndesaulniers@google.com, vvvvvv@google.com, gregkh@linuxfoundation.org, 
	ebiggers@google.com, ytcoode@gmail.com, vincent.guittot@linaro.org, 
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com, 
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com, penberg@kernel.org, 
	iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com, glider@google.com, 
	elver@google.com, dvyukov@google.com, shakeelb@google.com, 
	songmuchun@bytedance.com, jbaron@akamai.com, rientjes@google.com, 
	minchan@google.com, kaleshsingh@google.com, kernel-team@android.com, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev, linux-arch@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, 
	linux-modules@vger.kernel.org, kasan-dev@googlegroups.com, 
	cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 8:29=E2=80=AFAM Vlastimil Babka <vbabka@suse.cz> wr=
ote:
>
> On 2/21/24 20:40, Suren Baghdasaryan wrote:
> >
> > +static inline void alloc_tag_sub(union codetag_ref *ref, size_t bytes)
> > +{
> > + __alloc_tag_sub(ref, bytes);
> > +}
> > +
> > +static inline void alloc_tag_sub_noalloc(union codetag_ref *ref, size_=
t bytes)
> > +{
> > + __alloc_tag_sub(ref, bytes);
> > +}
> > +
>
> Nit: just notice these are now the same and maybe you could just drop bot=
h
> wrappers and rename __alloc_tag_sub to alloc_tag_sub?

Ack.

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to kernel-team+unsubscribe@android.com.
>
