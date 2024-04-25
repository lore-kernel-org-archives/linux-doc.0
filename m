Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE0E21101
	for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 20:08:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714075693; cv=none; b=p9T/9zdc1xhChXktMgzeUeXNLGUhyiWcSlf03FfUWyns1RShhdIAKD83N5i4R7kvPy0N67no106MN9Mw/5edbdEVUCf3nIRMinuTNUTe/R5UZ2xmETxY0xREAMaKDYTrwGlzsySKmDBwFdh6e5UkMnePJtRbWgq+Oh/toLOUF58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714075693; c=relaxed/simple;
	bh=7ciCYviadDCESvkbbfYYDhcw4dNfYDHt5C6Yzrv1psw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T3hXUV9n1xxPAxE1hNY1/JupDFGPE29Mb0tvXeDrqyXIfarrjeyjEG9s7YIhikJvAdjtJza0NRKJHUpYsrk02+8GWv1V/SKJkZCW0erRtwDqxc8fW0Ft4VCP4WsfPlvUQ6hl4fAi/1hk+FC1ay35balyEb74kxXqJ0MD13bBZ4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hluguHNa; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hluguHNa"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-1e4bf0b3e06so13728535ad.1
        for <linux-doc@vger.kernel.org>; Thu, 25 Apr 2024 13:08:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1714075692; x=1714680492; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ekH2ncVU5TU90wC0+JU7SiT8D9UwcwiJNzKzOJmDUPE=;
        b=hluguHNa3+jkYTvirKPnwbb3PspgFmPQQGCw/CuEWwz+SVTO/L29pZdZUmQO+VxrUs
         LttNGPjwNt40efzj/jw6YvmYY4yhLWqHnZgQPSytBqfAuRuf5ee4Z4AOFcGQ0lUX1d9a
         uxlivsYYYN1hCwCwMvshFk6gOFPYelyrJ6FQY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714075692; x=1714680492;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ekH2ncVU5TU90wC0+JU7SiT8D9UwcwiJNzKzOJmDUPE=;
        b=sOVGKk1BXrz8NBmmtEwKSRJJiPCUt6y4BtMfbygbJl1KzEza1jBY6Xfog/oCGHNr/5
         YOJ9HOMO8ERp6pgaKD+kYmAKPee50rvVHvPuTgYtzyEgJiQ9lFlA/FHcgosV8opzzdo0
         V5LUZ6zT71FQ8KYMZpOo/6Sz6MxEAAHBVQKFN7dRfIybO6xloEx5i5yHvCq78gkLmldb
         SY+zulSWCCvkmk3hEICwjrGo1HvlSXIS7TdVdlOcCsXqKT7097dX32kTJ/EACWhAv0gf
         QWSnAzJ9G8ZRFtFfv7irowOUVSwNuEEqxcmNH///1fKH9NJ14J9QlrJcAjsAuQ8xzCZl
         moXg==
X-Forwarded-Encrypted: i=1; AJvYcCXFXuGhVx1lT4AtnA+faQxIJ48bqJ68OGwahIisIZq6oEHGE9IzD41TGDxu4Ay3a1M2PVJwIj0KBx9U45eo8i7N6AMwS4nfgBEi
X-Gm-Message-State: AOJu0YyV38iIAAsBRQKrCWUUuRfCLe3NFaNy81uYQVBZSIdXEjDKFg/n
	z5wb+0a6rkeBXKQCHSsVkmZJAD2vYZCe9n/17MVlEjTiYXMw68y5buKQfLueRg==
X-Google-Smtp-Source: AGHT+IENLaRsnHeJ8vPQA0HMTgbKv7kjkvunXKY2OsqKLXqA91N5TvqvgatgH/rNiBbiRYXFmTuk2w==
X-Received: by 2002:a17:902:6548:b0:1e9:519:d464 with SMTP id d8-20020a170902654800b001e90519d464mr560628pln.65.1714075691780;
        Thu, 25 Apr 2024 13:08:11 -0700 (PDT)
Received: from www.outflux.net ([198.0.35.241])
        by smtp.gmail.com with ESMTPSA id m6-20020a1709026bc600b001e99ffdbe56sm8266309plt.215.2024.04.25.13.08.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Apr 2024 13:08:11 -0700 (PDT)
Date: Thu, 25 Apr 2024 13:08:10 -0700
From: Kees Cook <keescook@chromium.org>
To: Suren Baghdasaryan <surenb@google.com>
Cc: akpm@linux-foundation.org, kent.overstreet@linux.dev, mhocko@suse.com,
	vbabka@suse.cz, hannes@cmpxchg.org, roman.gushchin@linux.dev,
	mgorman@suse.de, dave@stgolabs.net, willy@infradead.org,
	liam.howlett@oracle.com, penguin-kernel@i-love.sakura.ne.jp,
	corbet@lwn.net, void@manifault.com, peterz@infradead.org,
	juri.lelli@redhat.com, catalin.marinas@arm.com, will@kernel.org,
	arnd@arndb.de, tglx@linutronix.de, mingo@redhat.com,
	dave.hansen@linux.intel.com, x86@kernel.org, peterx@redhat.com,
	david@redhat.com, axboe@kernel.dk, mcgrof@kernel.org,
	masahiroy@kernel.org, nathan@kernel.org, dennis@kernel.org,
	jhubbard@nvidia.com, tj@kernel.org, muchun.song@linux.dev,
	rppt@kernel.org, paulmck@kernel.org, pasha.tatashin@soleen.com,
	yosryahmed@google.com, yuzhao@google.com, dhowells@redhat.com,
	hughd@google.com, andreyknvl@gmail.com, ndesaulniers@google.com,
	vvvvvv@google.com, gregkh@linuxfoundation.org, ebiggers@google.com,
	ytcoode@gmail.com, vincent.guittot@linaro.org,
	dietmar.eggemann@arm.com, rostedt@goodmis.org, bsegall@google.com,
	bristot@redhat.com, vschneid@redhat.com, cl@linux.com,
	penberg@kernel.org, iamjoonsoo.kim@lge.com, 42.hyeyoo@gmail.com,
	glider@google.com, elver@google.com, dvyukov@google.com,
	songmuchun@bytedance.com, jbaron@akamai.com, aliceryhl@google.com,
	rientjes@google.com, minchan@google.com, kaleshsingh@google.com,
	kernel-team@android.com, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
	linux-arch@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org, linux-modules@vger.kernel.org,
	kasan-dev@googlegroups.com, cgroups@vger.kernel.org
Subject: Re: [PATCH v6 00/37] Memory allocation profiling
Message-ID: <202404251307.FD73DE1@keescook>
References: <20240321163705.3067592-1-surenb@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240321163705.3067592-1-surenb@google.com>

On Thu, Mar 21, 2024 at 09:36:22AM -0700, Suren Baghdasaryan wrote:
> Overview:
> Low overhead [1] per-callsite memory allocation profiling. Not just for
> debug kernels, overhead low enough to be deployed in production.

A bit late to actually _running_ this code, but I remain a fan:

Tested-by: Kees Cook <keescook@chromium.org>

I have a little tweak patch I'll send out too...

-- 
Kees Cook
