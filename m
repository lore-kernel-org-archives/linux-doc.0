Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB8853590BB
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 17:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763488744; cv=none; b=tIlhXnHFOpeufT5yAFtxaV+6Bl3m3qdB32j//nMCBiHkcBwjqqeziiVc1J1RaGgYPF6+6LVxHr3YezWROpfrCchkVF+Nz+wiUuE0QUepJIF+N8SuZvqBMK2z3lZdDfbwDQutoAjFMKxXPig9X1uR90pfLhipSAIQDTpEMST9OKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763488744; c=relaxed/simple;
	bh=WoCqjadCn7E60Uv19TSWcPYC1liefLwhctkXkeCoKEQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+ch/Bi+zj/A7qUWwZcLlYBJrJ9ecHvkmmnNKh6ZVu52Lr+I/3+QCZU/LwKnnEZ8/VKdpsIVPHT/L9yx0uRbGhKuvIOCEAKuD+imaGsaho+EndKNee3MF1DveAPWbtcXvINqnLR/1KPMJzjcn2LKk10xmNODgob8Ov5YZ5Dl8do=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=hBE8Scyy; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="hBE8Scyy"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-640860f97b5so9282955a12.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 09:59:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763488737; x=1764093537; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+caJNDkTSm4p2uWmUOI1wRaGCCJeFpF1smMqUtSo0I4=;
        b=hBE8ScyyQgzhLvo1smZoJ89RdTUtroqz12PxUGxCEd9bnqUAgYlKMPTi4uW40OfCS3
         y3cZKVNLk1caBrD+dKUP1SJpe0auqNx2Hxp4N/7h4JLhGToZsOMbOWahPxFVkURMmfm8
         tNz0CAg0cFw6SPbW4F7kwlO4w4cofgBFa+FZU94jVz5SpZr+BJK5Vm+3OJX2ELOHI8T3
         nvwD+U2y0EvErot6fxbz9paFPLLukbp+ly/+l7UaPIrTmPAIWl7v6ITa7KFZn0HsdEtA
         vfMGd+0y0KVYY2PctMKqTZekJ59H0OFBU9VuJ5kLI3hfyOwEHb8Eu/ShGrfZ88t2iwjH
         v8uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763488737; x=1764093537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+caJNDkTSm4p2uWmUOI1wRaGCCJeFpF1smMqUtSo0I4=;
        b=aIP0LR7CNb+E+A+SsBLahW8joOHwFNP6TVhhF7UfgfqyICOoncxyyh1SKiA6c6xNPz
         t7xRZILTfi7bPkcf9VSbyqlwXrAvrsjZa1G4X9g1T9c4Ex1OGuFSwv96zw1F+tMfVpPK
         ag2dlXz/JmXqnASPYsIa54mW75COmnR0cli5ist0/4L3Tm/niQkGqA3j0NghOqE0C5l7
         ZjXyZJrFGH05ddiGsYvmNcEVDe5RWpqrblq1LiaqXjJWsUujMvWHgQdCr01nSs6E0idB
         TwYVUeHE0TNFzySh5CI9H7kQZM6zpJtVQureECrA62VVjBjfVjK1Ft1USQDyhz6LAIpA
         wpkA==
X-Forwarded-Encrypted: i=1; AJvYcCX48l3Xyjih+mvLhi5VV6aAQd1Mh0F52wOudYfImuujnZP8K8uQdjKAoaLHqbBKeP3HZKu7etsVd3M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Lob3omaS9DoCt6OH5gjcaC5tVZxz1lMyUhGC0WeJRFG+GZvy
	U7Q/mGO2GOUoyXHGHhv9Uf/c2092vkAKZfbeCidxnZLbtKOKPrI9+zd/8wq5cZRZiahxuUYj1dv
	hk5ppjY9QWqETvSsXeDQ/CXiCdnXADkuVRZZdSdw3CQ==
X-Gm-Gg: ASbGncuCsVV8e+kDSJsBUh3QouSf8FQ2sSNYRQMJjWuey2jrYdoElME1bRMOQJG5l7e
	wszKEk98ZE31ulPOE3GEBUIEYqqJgwWn3p8+CjJBLxw2WLC+ZiwfZjP7BGM49UFbRNqY5xZQ0PH
	td9MSSO1BzrEwqCdhuXDLuwU5WPVfgay3mLpd+mZPEJVivPAmq0mOLZxMWzPSobIwJVj+IFJW61
	GnvciBbCFc57atIjV72eCmnHkhYBNGWY7GfiSvjXdTa2aah6CmvAPG4TUVcB/M3NYwb8HX6hT69
	Fyk=
X-Google-Smtp-Source: AGHT+IHLtEGa6tvFkUsvSNc6SGJ8gqqqGO2E3eFWqdurGTWqPWn/X+W1lUYZN0I7kpLDC0TLDDfvSxnHQDVTVoLPRis=
X-Received: by 2002:a05:6402:26d1:b0:634:ce70:7c5 with SMTP id
 4fb4d7f45d1cf-64350e89998mr16647067a12.17.1763488737365; Tue, 18 Nov 2025
 09:58:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-7-pasha.tatashin@soleen.com> <aRyvG308oNRVzuN7@google.com>
 <mafs05xb744pb.fsf@kernel.org>
In-Reply-To: <mafs05xb744pb.fsf@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Tue, 18 Nov 2025 12:58:20 -0500
X-Gm-Features: AWmQ_bkVrSTIot3zGMN2pIgE0TFCb1-KBBBDf9maAEVJdIwW1B5_ckvdlEwn_pk
Message-ID: <CA+CK2bAqisSdZ7gSBd7=hGd1VbLHX5WXfBazR=rO8BOVCRx3pg@mail.gmail.com>
Subject: Re: [PATCH v6 06/20] liveupdate: luo_file: implement file systems callbacks
To: Pratyush Yadav <pratyush@kernel.org>
Cc: David Matlack <dmatlack@google.com>, jasonmiu@google.com, graf@amazon.com, 
	rppt@kernel.org, rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, linux@weissschuh.net, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-mm@kvack.org, gregkh@linuxfoundation.org, 
	tglx@linutronix.de, mingo@redhat.com, bp@alien8.de, 
	dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, rafael@kernel.org, 
	dakr@kernel.org, bartosz.golaszewski@linaro.org, cw00.choi@samsung.com, 
	myungjoo.ham@samsung.com, yesanishhere@gmail.com, Jonathan.Cameron@huawei.com, 
	quic_zijuhu@quicinc.com, aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, lennart@poettering.net, brauner@kernel.org, 
	linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, saeedm@nvidia.com, 
	ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, leonro@nvidia.com, 
	witu@nvidia.com, hughd@google.com, skhawaja@google.com, chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 18, 2025 at 12:43=E2=80=AFPM Pratyush Yadav <pratyush@kernel.or=
g> wrote:
>
> On Tue, Nov 18 2025, David Matlack wrote:
>
> > On 2025-11-15 06:33 PM, Pasha Tatashin wrote:
> >> This patch implements the core mechanism for managing preserved
> >> files throughout the live update lifecycle. It provides the logic to
> >> invoke the file handler callbacks (preserve, unpreserve, freeze,
> >> unfreeze, retrieve, and finish) at the appropriate stages.
> >>
> >> During the reboot phase, luo_file_freeze() serializes the final
> >> metadata for each file (handler compatible string, token, and data
> >> handle) into a memory region preserved by KHO. In the new kernel,
> >> luo_file_deserialize() reconstructs the in-memory file list from this
> >> data, preparing the session for retrieval.
> >>
> >> Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
> >
> >> +int liveupdate_register_file_handler(struct liveupdate_file_handler *=
h);
> >
> > Should there be a way to unregister a file handler?
> >
> > If VFIO is built as module then I think it  would need to be able to
> > unregister its file handler when the module is unloaded to avoid leakin=
g
> > pointers to its text in LUO.

I actually had full unregister functionality in v4 and earlier, but I
dropped it from this series to minimize the footprint and get the core
infrastructure landed first.

For now, safety is guaranteed because
liveupdate_register_file_handler() and liveupdate_register_flb() take
a module reference. This effectively pins any module that registers
with LUO, meaning those driver modules cannot be unloaded or upgraded
dynamically, they can only be updated via Live Update or full reboot.

I plan to introduce unregister support in a future improvements to
relax this constraint. The design I have in mind is:
1. Unregistration will acquire the singleton lock on /dev/liveupdate
to ensure no new sessions can be created during teardown.
2. Verify that there are no incoming/outgoing sessions.
2.  File-Handler can only be unregistered if there are no FLBs
currently registered against it.

Pasha

> Good point. We also need when using FLB. You would first do
> liveupdate_register_file_handler(), and then do
> liveupdate_register_flb(). If the latter fails, you would want to
> unregister the file handler too.
>
> --
> Regards,
> Pratyush Yadav
