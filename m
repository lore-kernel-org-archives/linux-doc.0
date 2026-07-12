Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82D89379996
	for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 21:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783891063; cv=none; b=gaT6kZr4FqOeAtyy6ajJjwGGxsiIAHsoQcey2YU9cdJTkn7g/BCPouumJt6hqz0Wjf+2jS80dS/Zn9FxuQYwEVOv26ZusML5hnvdnePtW93NPIdspnCFAwkHcihHpZsGAB7ykI6RyKdD/dZtaQ8tr30zj4UpAcau9DtfWwzok2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783891063; c=relaxed/simple;
	bh=2LJzXj9ppebEulv72Db9DKrXEuSmBOMhC8AFnbyQWp8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Disposition; b=TeYDviaC3x4nT39Sr9wVTC/lyPEQw8U7t+CJDwHyikiDbYK907hc8UXK4bj6l1G3PXKlL3/BX5ZN8dXxbD1O9NjLPHfLtqpVlrOEXayIg0uzkAJcPRxj1ZvP7osE904q4t5HppwWKYCyxM7jUpjzd2k9+wEKzY2tlpU+wZIJvuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sjAR59VT; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sjAR59VT"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47df440fcd5so1268928f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 12 Jul 2026 14:17:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783891057; x=1784495857; darn=vger.kernel.org;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=mO9PnufslFYNDwqPjTJ3f3FlkpnmJVQM4/pFUcrdNco=;
        b=sjAR59VTEDa/cb52L8PLRcMT3yrFi0f2X7lcST8XihoNdmz2YoJFA7LbbUmJsklkxU
         KPitG7MQ2SkQlcNe8GofB9FLj8XekMyHLOjXVxHYOogSc/8dplmUwk+cRCMnA2a8rmhq
         4WAapzhQnv+5E6dLKDZn38CtFTMPXU3xaAZYLNXC2QoDr3pNUs2Rblv9IT4uyZnEs31D
         7p1scGr5RkodE3V6ghr9v7Fv6K7DantC2WEN3reR6MMtudWUN+fpkEp8M6WrGGrZPMfx
         8V7SET6itAM54WYW1pY47WTJ+lUBrmOta9HtImfQPku+BCZ+KOlR9qg74iq1ih61Jpaa
         ThUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783891057; x=1784495857;
        h=content-transfer-encoding:content-disposition:content-type
         :mime-version:references:in-reply-to:message-id:date:subject:cc:to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=mO9PnufslFYNDwqPjTJ3f3FlkpnmJVQM4/pFUcrdNco=;
        b=JeRkfU7pWpZqEw1rlszQVWs0yQ+HsOtH5SaBVuyUn/mSSLDomWSqrEpHHDgyEEVIyv
         nd1V78xvZr0kkl6uQ9KDLeq+v3xaPq74ROx82zVJdWvZwtNkOdaGLVWWw8S8sllMoIUh
         1JD8P1A6/pdNSzdxmT8SmS2RWi816t6aRppU3G0ffLMjMJOne/RyehL7mZlZIpAyCfTz
         EXTIXr4OhD57HFWEtSrEOj5BztEvsIsr5HeM8f40jolDFxjkWDH+EphQnxVndm4Qq0Tf
         cd63aumGDXu1G5G3y2LLJ47FSEZZ8qRezJ8yN6/xdT2HIsbqaO6ICSLsuU2+7UWocvsY
         kXjg==
X-Forwarded-Encrypted: i=1; AHgh+RpQEES2JHhbXWQrIllLmmpVqCDt1jKq7wL5DK7HVFkt6Ih1Md8IUCxWl0z9V+DKQbStfdKbj6gNKIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBcpHF+EAFBS+7ydS6vfo1MTi5bUR+8YMY9ohSw6LijRlyRCfb
	2eOvDFhU0lkoz+gilFDEb34Tl0/XycPPl+lildD8iJHYV4TnZ5faYnDo
X-Gm-Gg: AfdE7clUJok1RG2cjEZ8f6XWJqetZ17AJiF2X65+4gm6Q/Cr/g79MNcWWL+4FBfHGl/
	BG7NXRykjG3UqLfS4zyBfjQOPZ+ivcSir5aek34mlL4Z69XNwVf/2lRMTMPqQBgY7RtyvJKMJtn
	BpglFZigOPLK1NrQMnIzTBbeSwYUpa2VScB+93o49YTUKWZoiC7rzrYghp2W7c6m6rzBJ8NZQsX
	cEJ/pyOauE158FhiXGsbRZOp66lYbGLEuVeOxl6ooNxWRxhJQ0O69nfmbU7jfAP7f+IdVHI1E2P
	IKMb8PjhDD9NYZ3bI6a7HrJuvgd50pcCDTDZ6DCJlz4cahLW6Tuu2A9/toe6CZgzec/bIdv80A4
	BSSZJpvFG+v0Dq74/wgYUz7U9J8V1Y3rvR905pYyO+tYsepNINOFMJr/Tl4MCU/YmwQ5e9ncwIa
	85fvEVU9V7RoC8L58eE8wNnw==
X-Received: by 2002:a05:600c:a42:b0:493:c77c:108a with SMTP id 5b1f17b1804b1-493f883c8ffmr70582755e9.36.1783891056739;
        Sun, 12 Jul 2026 14:17:36 -0700 (PDT)
Received: from WindFlash.powerhub ([2a0a:ef40:f61:3b01:d08a:833b:756:8fce])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493eb6f3c42sm307923765e9.1.2026.07.12.14.17.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 14:17:36 -0700 (PDT)
From: Leonardo Bras <leobras.c@gmail.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Leonardo Bras <leobras.c@gmail.com>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jann Horn <jannh@google.com>,
	Pedro Falcato <pfalcato@suse.de>,
	Brendan Jackman <jackmanb@google.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Zi Yan <ziy@nvidia.com>,
	Harry Yoo <harry@kernel.org>,
	Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Chris Li <chrisl@kernel.org>,
	Kairui Song <kasong@tencent.com>,
	Kemeng Shi <shikemeng@huaweicloud.com>,
	Nhat Pham <nphamcs@gmail.com>,
	Baoquan He <bhe@redhat.com>,
	Barry Song <baohua@kernel.org>,
	Youngjun Park <youngjun.park@lge.com>,
	Qi Zheng <qi.zheng@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Axel Rasmussen <axelrasmussen@google.com>,
	Yuanchu Xie <yuanchu@google.com>,
	Wei Xu <weixugc@google.com>,
	"Borislav Petkov (AMD)" <bp@alien8.de>,
	Randy Dunlap <rdunlap@infradead.org>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Dapeng Mi <dapeng1.mi@linux.intel.com>,
	Kees Cook <kees@kernel.org>,
	Marco Elver <elver@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Li RongQing <lirongqing@baidu.com>,
	Eric Biggers <ebiggers@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	Gary Guo <gary@garyguo.net>,
	Christian Brauner <brauner@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Coiby Xu <coxu@redhat.com>,
	Masahiro Yamada <masahiroy@kernel.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-rt-devel@lists.linux.dev,
	Marcelo Tosatti <mtosatti@redhat.com>
Subject: Re: [PATCH v4 1/4] Introducing pw_lock() and per-cpu queue & flush work
Date: Sun, 12 Jul 2026 18:17:34 -0300
Message-ID: <alQEbpfo7mHHkIcx@WindFlash>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <ag3Jh-8iUdgKvw5y@localhost.localdomain>
References: <20260519012754.240804-1-leobras.c@gmail.com> <20260519012754.240804-2-leobras.c@gmail.com> <20260520134832.WS7TrMnu@linutronix.de> <ag3Jh-8iUdgKvw5y@localhost.localdomain>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Wed, May 20, 2026 at 04:47:35PM +0200, Frederic Weisbecker wrote:
> Le Wed, May 20, 2026 at 03:48:32PM +0200, Sebastian Andrzej Siewior a écrit :
> > How likely is it, that you you had users before late_initcall()? Also
> > can it happen that one of them uses one function to lock and the other
> > unlock in this brief window? There is no check if this was used before
> > static_branch usage.
> 
> Or let alone initialization on the wrong member of the union.

Right!

> 
> -- 
> Frederic Weisbecker
> SUSE Labs
