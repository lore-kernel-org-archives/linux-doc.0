Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com [209.85.222.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF960EDC
	for <linux-doc@vger.kernel.org>; Thu, 22 Feb 2024 00:10:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708560638; cv=none; b=HRnAEHUhpTUK1bkews/e8ENCt9cJkame9GWEiIbQPaY0N3nNfypmrqqDDnu8jtSicSMmhLt3KIjuyFACqjuc0iYEVYZR30oUfI+m1FbB1Kj+Pa09Uk4jgSC67EC1femoEwS5+hdIR4H8zHrVIAftqgkffu7KzoKFwevzEn6auYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708560638; c=relaxed/simple;
	bh=1D0pVaWMlr8hskhdGaW7hZtXBWle1reW17x7OUuU9Uk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IC84L/v9BSJQgRdyMGOToOKqoZNf2eNk0hMuyAWgGM6RG/Uk6cAuuKYZm/BGuYVG4VPbxiDrsV8Q+v1ZBpjSspkCAWEQ7CL1k19u2/Fkai4xEKz1MoOamnQn4bX4XrKE3owRVVDxfhH0UzSNN3yG2Arthl7EHoSThrM9QSEA++E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=WMqOTNgo; arc=none smtp.client-ip=209.85.222.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="WMqOTNgo"
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-7ce603b9051so3238208241.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Feb 2024 16:10:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1708560635; x=1709165435; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1D0pVaWMlr8hskhdGaW7hZtXBWle1reW17x7OUuU9Uk=;
        b=WMqOTNgoyIMy5Skhg570/S9RfKRo+GGYJCSxO9Wx46wIXQMWTS2sf3E2BFDb9cb/Mi
         SqSc2RwztXYNSaB38gztWThpj5wG20etefD5/vzwCIiRM3djvQYDKyWZLyyB9HFAM9wd
         GMQZLr7NXKp6GOaIasT2JvwkONeaUgvXWnQcOrKHk1+ub3kdjAL8tbRRBT8znhaL2iy2
         quvghVEXB/K/qztLQ/o/HGZdmDIRYb4aRqmqlbUHD9a4EgJ8wr5jPA/6XG4Eo8myvR/W
         T/TCrdyLnp6jiwDXmMDE+CSg3Midm+48pxiNe04wJ4IpdOsHW8Q9uLnJqcwi+xwQqlmf
         Orvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708560635; x=1709165435;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1D0pVaWMlr8hskhdGaW7hZtXBWle1reW17x7OUuU9Uk=;
        b=FCLkP0KpiDUKcRny+wdNxEASDIaOVfQylnMCheTxuCybfPColC+jVIFygTgjOzPpys
         5ZI/CKjxXFL99b0YMWWnJd6bZMkDMdCc2MnO9n7srluTng5SvYajwN4zchb6FhnSWWBg
         ZzmaWftTgNJVXtYdkmYYcUxVNQ8z+xwdq+1fVVzJdVzUiCpnG51oWbl7tVetZC/MOIMq
         MQEgtFplBcKYmwZ2dnwmxt0wCJZV8LdU53FH/mL9+rRUNdYy2HZZe4PzLmclFgGarj6X
         0+CMuw7yBm2VaoGbMbIOmoTGq/mEAXPbS99OQrgLIRg2NmjWBlOzPy1NmnnazzNWjddN
         mkow==
X-Forwarded-Encrypted: i=1; AJvYcCV39W9y9H903l5XCp73o9DRVSBv3F16eAmQbzgslJWcC968niBzacfwwokl3KEXF2XAtX9bY4fSd6J607DOolLR/KQnTIQGT/NE
X-Gm-Message-State: AOJu0YzUUCfq30WEhQ5Hhos+2mEP7EmiL44vX5BYys6H3uEO6m6nw0N7
	ZI4HgY6hcntYJOWuRltHaBgmaVYQANo54n9hNiXBIpcCEaB5369Rji/+KqtnmOCA/2qgmDDebl5
	lia4Fh1RkgPjsntFtTxL6JOIcI0HypDD4ApmkUw==
X-Google-Smtp-Source: AGHT+IGvkzT3uz6qELPJtraK+YKtQ9uJucd+Pri79etJZSzYbQUZmm3eTGpEAZMzRr8Ip545g98kCtUJT9vyheZUmog=
X-Received: by 2002:a67:f54a:0:b0:470:3ade:af52 with SMTP id
 z10-20020a67f54a000000b004703adeaf52mr11439980vsn.6.1708560634875; Wed, 21
 Feb 2024 16:10:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240221194052.927623-1-surenb@google.com> <20240221194052.927623-10-surenb@google.com>
In-Reply-To: <20240221194052.927623-10-surenb@google.com>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Wed, 21 Feb 2024 19:09:58 -0500
Message-ID: <CA+CK2bDWkrNapWD7pv47XQo8PD4qJ3O=U99pL3o72KCnrzpsXQ@mail.gmail.com>
Subject: Re: [PATCH v4 09/36] mm/slab: introduce SLAB_NO_OBJ_EXT to avoid
 obj_ext creation
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev, mgorman@suse.de, 
	dave@stgolabs.net, willy@infradead.org, liam.howlett@oracle.com, 
	penguin-kernel@i-love.sakura.ne.jp, corbet@lwn.net, void@manifault.com, 
	peterz@infradead.org, juri.lelli@redhat.com, catalin.marinas@arm.com, 
	will@kernel.org, arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com, 
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com, 
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org, masahiroy@kernel.org, 
	nathan@kernel.org, dennis@kernel.org, tj@kernel.org, muchun.song@linux.dev, 
	rppt@kernel.org, paulmck@kernel.org, yosryahmed@google.com, yuzhao@google.com, 
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
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 21, 2024 at 2:41=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> Slab extension objects can't be allocated before slab infrastructure is
> initialized. Some caches, like kmem_cache and kmem_cache_node, are create=
d
> before slab infrastructure is initialized. Objects from these caches can'=
t
> have extension objects. Introduce SLAB_NO_OBJ_EXT slab flag to mark these
> caches and avoid creating extensions for objects allocated from these
> slabs.
>
> Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> Reviewed-by: Kees Cook <keescook@chromium.org>

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com>
