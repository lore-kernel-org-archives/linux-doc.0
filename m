Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8643C3ACA70
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366140; cv=none; b=POtRfrhnjafEwzdJ1Chi3t1vdDMNKxhvCqTUJluRKC/dvl4PdX00NzTyvkYp9TgfZ+gB8vjyv+57guV675JTkHlitht223+X+Os0Kx9U3ExGWWtJ/jDgq3akBT6AmBUvRfOcu7L6fMfQmY1JwB3cdhCoVWWJuatpefG6QNXoh1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366140; c=relaxed/simple;
	bh=IDvYMz3nG8st0a0aM+DKLAcAyTaasmqSXHhj6f2axZ0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fdcOGRvOtN0/ck/oTYQeIWXF3sSs5yJF+hQOq4xpAPD/jxWUHWN/NLl/9Ts4m4N2wkHy9ZulRA81nOH8RqQlwoTJSFR1Vp3+NCKe4zkzd0wfKhjBzOlDmykNaN/BxNJLDEiT8vfOf0NppmcWcoKu0c5BdtCdN4pDWi6BF6E++v4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a4p73KlE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a4p73KlE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FCB81F00A3A
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 19:28:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783366139;
	bh=IQcrKM144IteF7RLbk69gWQNPIW8WjgMMggN5ygWDkE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=a4p73KlEHDRzOjXQJ3AFLPiKcraSRL6Z7FvrO0fRkw2zsAyQjd1biBl6QFeLvrfga
	 bk4rjDE1kfCeKgsFVS5AMThbo/mTMUQ+dmlzamV/Mb6KBK83tvi+y9gxIZOEOgU3jV
	 6VGeLaUjEEdoGDvk8XyDZet5mx2U9lSgRFYcTld6GupjmlrLpO6i7GfehhmchpwMLM
	 CKZx41bPOIBqJbMgkQAoUoPysFq7nl7XmV8pjXDp168TyS5MSi1yT3Wiw85ffgUrT0
	 pRSGhDZcDwk3kjL99ZZ8QAX7oTB9D54UzTevy7k7ar6fZRz4Erl1l1au+z2bSm+wgq
	 Nh5qmr178ZkoQ==
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c12788a75abso467427666b.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 12:28:59 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoDaxlssbBuO5/3H2fsuSdvBMrGM3n90uGPDD8IIU4w0rH2JbLCfoBfKA/teKt8oQA19CG3dSIfYH8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzk07/dQQrbEYKoCC9FOt+kO+8rdZg8FCD80nbBw+4Hhu9lzyIk
	7v1AV34ELADdLhO4zXs7B4ISjrQrdc1IGSTSwz+qmtpdPNCPjy9B65DH46xZPV8vgcaSnQ/6kUT
	maTKNplQnSrawySdNeF7XiXMK+9Vls3k=
X-Received: by 2002:a17:907:e107:b0:c12:61c5:c141 with SMTP id
 a640c23a62f3a-c15a690a339mr80814966b.53.1783366138212; Mon, 06 Jul 2026
 12:28:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629112032.20423-1-jiahao.kernel@gmail.com>
 <20260629112032.20423-5-jiahao.kernel@gmail.com> <akMJ8UfeZXrVe5LN@google.com>
 <cbbdf506-b67d-193c-2c94-bacf828d559f@gmail.com> <CAO9r8zNCEis2QHROEsM5QZsb_H4ofNjA_sE-pM7SVxtgHg_rqg@mail.gmail.com>
 <a1c139d9-08b8-9631-7a85-697df4c23d52@gmail.com>
In-Reply-To: <a1c139d9-08b8-9631-7a85-697df4c23d52@gmail.com>
From: Yosry Ahmed <yosry@kernel.org>
Date: Mon, 6 Jul 2026 12:28:46 -0700
X-Gmail-Original-Message-ID: <CAO9r8zNOEfRadPaMv33nexQztgDxWEWi5=w=fKd+n7A+1L592g@mail.gmail.com>
X-Gm-Features: AVVi8CejFCreebY10J5qVyRaGPCWsbYJB7Ywv5bR5xAz3vYSS39OxmpII_xEK0M
Message-ID: <CAO9r8zNOEfRadPaMv33nexQztgDxWEWi5=w=fKd+n7A+1L592g@mail.gmail.com>
Subject: Re: [PATCH v5 4/6] mm/zswap: Implement proactive writeback
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: akpm@linux-foundation.org, tj@kernel.org, hannes@cmpxchg.org, 
	shakeel.butt@linux.dev, mhocko@kernel.org, mkoutny@suse.com, 
	nphamcs@gmail.com, chengming.zhou@linux.dev, muchun.song@linux.dev, 
	roman.gushchin@linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Hao Jia <jiahao1@lixiang.com>
Content-Type: text/plain; charset="UTF-8"

> > If you're looking for another cleanup to do, shrink_worker() should
> > probably also use mem_cgroup_online() and avoid taking/dropping an
> > extra ref :)
>
> IIRC, this might not work because zswap_next_shrink is a global variable
> and is accessed outside the lock during reclamation.
>
> Consider the following race condition between shrink_worker on CPU0 and
> zswap_memcg_offline_cleanup on CPU1:
>
>
>            CPU0                            CPU1
> spin_lock(zswap_shrink_lock)
> memcg1 = mem_cgroup_iter()
>    memcg1.ref = 1
>    zswap_next_shrink = memcg1
> spin_unlock(zswap_shrink_lock)
>                                zswap_memcg_offline_cleanup()
>                                spin_lock(zswap_shrink_lock)
>                                css_put(zswap_next_shrink)
>                                memcg1.ref = 0  <--
>
> shrink_memcg(memcg1) *maybe UAF*

You're right, thanks for double-checking. I lost track of why the
extra ref was needed.
