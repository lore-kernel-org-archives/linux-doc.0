Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE19328625
	for <linux-doc@vger.kernel.org>; Tue, 18 Nov 2025 02:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763434752; cv=none; b=rq+sigLxhzgX7Il0XWC8FrcJhPVqevYcuc1xcKfAcw1xLcVhFNWiC4QmOdehXzaW1FD7fdhp9/loQGOgMQOptUXm93paxwF5WrgNbg3cHzbRL5t4po8DhGK1sxOJ6OtGPNFP0MO0GQI8Ai3amMsP+EbVdtUSMtk6LJGleZGnmL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763434752; c=relaxed/simple;
	bh=BUBQVqhYuDQpDKj8kaZMnE/33PjZCxGNIoQaBsNI2GI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H++g3KHJZQj+30+bgKLWWipneZvf8XR9JDQnprem4QvS8mqQ9371gsPb4jOIspZkPg/OAiR5o1ti7UsiH2WhOEUdWNumijbr58oY2CQulEwpQZQQjD8tuhYZCdwVb164fDWr8HOdD7rvFvo5Knw1ogQwarHkqbdRcwA7GLjftp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=S09RxRum; arc=none smtp.client-ip=209.85.218.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="S09RxRum"
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-b734fcbf1e3so755278066b.3
        for <linux-doc@vger.kernel.org>; Mon, 17 Nov 2025 18:59:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1763434747; x=1764039547; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=uyA/z3+NX1r8lmPy90ZzbFhLB6Y/TGoAYT7nzfduTWI=;
        b=S09RxRum2xa9YUFARKFQLyZAIUb8pzrLmc5No4pxbFN+0VZWRe2eAA3w9TdG+UWb0I
         djrbsFgJmBy3SIxTG2f1dkRjT4C7HYeWKwBeSFma16HkIEuXNSzQ2hsS3kB17R2/GOqv
         p4m1geAB8IsA+7AMUClVb3R3Qg0pGN7Ba4V36qUTpdK0yJpkNitMFoyW5fINQUMXbMW9
         w3pN+WvtgyQkYLc8yarZpknb4hbDt466t4ChGD6/o7tk1pltNHmYjQoBL04Zxl9+Z/EX
         U4S56eyXw6C3jcvIfeZ8BBnmWW+2tzKj6u+vjIfXh+KP8c5FDQbyU5yyTuhJIwFcl4g5
         3MyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763434747; x=1764039547;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uyA/z3+NX1r8lmPy90ZzbFhLB6Y/TGoAYT7nzfduTWI=;
        b=HE5COP+PGHVwjbxWNMh+wqO0Xr0ClfoojjLon8i3+rlQj+fE9tMpmlFuhgckdQxJ1a
         Qk9huOL/zUvRZTGYqtprOcxhbg2RFZJ6t4nuXfb1sT5ycY7uCjGDJCUtGbcfHjhROaFD
         V+5VIMsbn2EmTtIke39K+eqxBUtJGCdt+/BnRwlsME3o80KqrJ8K4jhB58VkXzMO3iXz
         tV7R3m8E8IO/ox9kuxx6hU7sEgd4AkzJlpegSsfiROguy4UOye+7QEdLJKBygKKO2h9d
         9xAPKjvjXaCBo/nhYi6ZuDFwkTmFMeHwtmpTkhyL8IsMZrAnGX9dY+deNKLbD7IDNsNq
         Kuhg==
X-Forwarded-Encrypted: i=1; AJvYcCWzD5EX12Vd0NqMxOwsRg+GowN3FV47Cwn1Iy6WidVcJgYHshxyTl6f05WETkfXFMo7izn1iF8P0zA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEuSfgKIY6PF8OGMtQGfuMaBlS85l8bwqVczA19uaUh25jdTeR
	waZV3KFur9UGlYyF85xppE6csi7Nl7HGKz0x0Xjq4ACYrDUZcRKY7OGvhb9+9Ty12KwQVXFGc02
	cOHzvR2RBQULGTYK1mI6xcSsZnfsNoWISjXOzphu6XA==
X-Gm-Gg: ASbGnct0EsBdie/67rmuoh9/HxwaPYqXTpWkFb6sv5IgVuuG9TXMutGzUo6+o3SYngh
	pHmQYOzc9/ufXdsYNzokZu+1oeLaOzvVFNbT7UTwEkIzAldW7kVnToKIVSq+QNbKafx0a3WwWKY
	ol41OXat22bTiZ0GaYhY5SJQr/5THrvmiMx4cKVSlbDEZ6jIAjy0kszeV9ByC3YKFaCw31C+dKu
	MYG7VGKzDod0ZkDJz4zqTqQqQbixqBINV1vBICa66V1xp1vEzj963CSDlYJN+Dmwh6qSv7U0UQL
	ipw=
X-Google-Smtp-Source: AGHT+IE+Xmu/XKzqDItZxK55uKODQ4pXWe1jCDf3/zyE5l7HA0zpyHUAc1wH5fOIbLOq/qTekDcDuTCEd4KGgBq5NiA=
X-Received: by 2002:a17:907:d9e:b0:b73:9792:919b with SMTP id
 a640c23a62f3a-b739792959cmr714211466b.13.1763434747412; Mon, 17 Nov 2025
 18:59:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251115233409.768044-1-pasha.tatashin@soleen.com>
 <20251115233409.768044-8-pasha.tatashin@soleen.com> <aRoXGYC4GeAoNKPl@kernel.org>
In-Reply-To: <aRoXGYC4GeAoNKPl@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Mon, 17 Nov 2025 21:58:31 -0500
X-Gm-Features: AWmQ_bmEx3-y1qL666uuCkHAOhqd8xREWBuFy8c9Q6i-THXVQGPt4k4Gmg9IHVA
Message-ID: <CA+CK2bDyKzeZBZvNM7OdSm5dBt3ADjsyXc2X3_YedV_xnphMww@mail.gmail.com>
Subject: Re: [PATCH v6 07/20] liveupdate: luo_session: Add ioctls for file preservation
To: Mike Rapoport <rppt@kernel.org>
Cc: pratyush@kernel.org, jasonmiu@google.com, graf@amazon.com, 
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net, 
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, 
	ojeda@kernel.org, aliceryhl@google.com, masahiroy@kernel.org, 
	akpm@linux-foundation.org, tj@kernel.org, yoann.congal@smile.fr, 
	mmaurer@google.com, roman.gushchin@linux.dev, chenridong@huawei.com, 
	axboe@kernel.dk, mark.rutland@arm.com, jannh@google.com, 
	vincent.guittot@linaro.org, hannes@cmpxchg.org, dan.j.williams@intel.com, 
	david@redhat.com, joel.granados@kernel.org, rostedt@goodmis.org, 
	anna.schumaker@oracle.com, song@kernel.org, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com, ptyadav@amazon.de, lennart@poettering.net, 
	brauner@kernel.org, linux-api@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	saeedm@nvidia.com, ajayachandra@nvidia.com, jgg@nvidia.com, parav@nvidia.com, 
	leonro@nvidia.com, witu@nvidia.com, hughd@google.com, skhawaja@google.com, 
	chrisl@kernel.org
Content-Type: text/plain; charset="UTF-8"

> >  static int luo_session_release(struct inode *inodep, struct file *filep)
> >  {
> >       struct luo_session *session = filep->private_data;
> >       struct luo_session_header *sh;
> > +     int err = 0;
> >
> >       /* If retrieved is set, it means this session is from incoming list */
> > -     if (session->retrieved)
> > +     if (session->retrieved) {
> >               sh = &luo_session_global.incoming;
> > -     else
> > +
> > +             err = luo_session_finish_one(session);
> > +             if (err) {
> > +                     pr_warn("Unable to finish session [%s] on release\n",
> > +                             session->name);
>
>                         return err;
>
> and then else can go away here and luo_session_remove() and
> luo_session_free() can be moved outside if (session->retrieved).

Done.

Thanks,
Pasha
