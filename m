Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E162D25A630
	for <linux-doc@vger.kernel.org>; Thu,  7 Aug 2025 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754573140; cv=none; b=BGhlSn8GSuGSWwviwye4dw+mJKUFJRW5G7542sCapQg8OYGWOKQTqaF38P2fXrkwvF561LhKiNHPLEr36FHs7qGAzl2mme7VZhGnuocLOH81D5ABp68aL4Lw9iun3oGcqy8PU1IBmmBXNjv3G/wvOTD3OnWodS+cF2MAq1GsBV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754573140; c=relaxed/simple;
	bh=BE5Henonj83S/x58TbOMswxN6uWYEKzKyZZTSsbruCg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DSsvlBpw3F10dKcESbckJ1FE2Wnqaw9nDZgTv1eL5BUUzMZ4be16bYITE1TxtIEbCt80by+u2jNyZ/p6ZsnhXhSaN8dCAubOZMisWIHaWOlOLdF/sUvKwm5RpGtjaiICcyYc+fP2nc7QSmBf09perZpl9UxnUkgbG+zGGp1QBFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jv7ue3Iy; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jv7ue3Iy"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a6cd1a6fecso697477f8f.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Aug 2025 06:25:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1754573136; x=1755177936; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QkK/h5wyW78slTbM7rfscexueduuSs96e2Qc2RW5gY8=;
        b=Jv7ue3IyrgE0O2s0Yiy5Wlc7bXv+38eG78W35vf3ll6mzbE4+sAQVdUbMgHgBruA98
         1gpFQ4yFH5CAlloE7zCQAszHuDQT9wJUVFwYA8vBJoFfzcQlk0a/fmMNqkpo+1C/zLTc
         fEb8+ViAF2ZhC5onX2ZU12RYblvSPCYGn710dMtWj2uVGclSZGe2VIwYVrPbnnG2tQ0D
         Zebmh5vcV+ncUu6qaIuhdVYfQG8BwSnLL17O6iI46jT/NF91GFzEevoLNBGahMXy8p+1
         1xKH44R0c0j/3WLd+qWiXPP+PS4KyJ3eGUkNn8JFN41gTHXJ6QlOZuz0xSJl0qB6f+td
         SCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754573136; x=1755177936;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=QkK/h5wyW78slTbM7rfscexueduuSs96e2Qc2RW5gY8=;
        b=W9cNUj4JDwwt+xSXMzjig1PcNDNSsxRrN2q2PB4qD9o8iVA48/hCpwNCmN4xlVFLH0
         h22fiWFLxSGlqfIxtvIXTersKQTXgkp5v0VMLmAZ6ryHAei+Zht4GEwakOtJfbpsCVzU
         srP9z8mPsTxtjx7Xlj/pH9SD0fwOFTH8HgvYcUN2pfeejka474rPN4rHYFOdv1hJ4kV4
         iO5gLac2Y4nkKxdKu/V0prgpfiDuhZINuRUo9+g7GbbQzlPLNolPKaC7vJplAxTABWvP
         mRTn3znGh2WU9fdNltD2vJDdhturB/np6xEkFBonT6nBXGFlCUjR5SETqNrkuenCZn/T
         QTOA==
X-Forwarded-Encrypted: i=1; AJvYcCUoDqKGb6QbvZGa+ArizYfj15mBclPjBUSMIG4y5hKVWVxStHivXMiQEVT7FgfjzCMPDZL1u79FJQE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxXwNPUY7Zgi3ftGN/rPhsI3QbNy9KvesGeqAmykyLo8l/QAhFZ
	oJ4JCiLAUZz4h4ZAut9X50ydht5llWwr1KpkVrobr+yA3iIxRwC5CajXYacnjGXEvgM=
X-Gm-Gg: ASbGnctb9J6u1tRYgUmFlytpcqGz3LkTU0S2zO3tjhF2vg3PT8YhnlSTlZ6IM6Hqeco
	Xpwak8MQfeu+swoqSZ7Fqe0oyNQDzzpTH7O9EQWRn2cyaZyfpVLryFam6TmXASXvw88zAz0anLI
	P69kZxRZmLkqGWgtH3rYzCe4kcz3IW9gm9D/C6Z+3QZrzHbhTBdhLy1lPoyDPYb26tJ8vLsGJm8
	WhVh+ZBdbu1Df9EPH4caPxN8ZBBPKJW7FRImFAPrC2lg6DYLaR/sz/3meCtXXM+o/cxuSDKW5/3
	9qeLFxAVuE1viCKqkVa+URAZ/cTmLrgB32fI+yIAGSLhfrZ9G4gkr25dXW4U70Z+i/b/lasFaqC
	jhHgkYnyb1hvmvy+H7e1h2+zbIysUi5mxIp7ebKkMiz40kQ==
X-Google-Smtp-Source: AGHT+IHQ9dMmpvwSG0LG+OsU60Voye7P7DJOnU5DCYn4cofMlrbc+GKVT9M1/0FDZpZM67dPsg7qAw==
X-Received: by 2002:a05:6000:1a85:b0:3b7:78c8:9392 with SMTP id ffacd0b85a97d-3b8f4166f4emr5537116f8f.19.1754573135392;
        Thu, 07 Aug 2025 06:25:35 -0700 (PDT)
Received: from localhost (109-81-80-221.rct.o2.cz. [109.81.80.221])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3b79c453ab0sm27171452f8f.44.2025.08.07.06.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Aug 2025 06:25:35 -0700 (PDT)
Date: Thu, 7 Aug 2025 15:25:34 +0200
From: Michal Hocko <mhocko@suse.com>
To: Zihuan Zhang <zhangzihuan@kylinos.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Oleg Nesterov <oleg@redhat.com>,
	David Hildenbrand <david@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	len brown <len.brown@intel.com>, pavel machek <pavel@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Nico Pache <npache@redhat.com>, xu xin <xu.xin16@zte.com.cn>,
	wangfushuai <wangfushuai@baidu.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Jeff Layton <jlayton@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>,
	Adrian Ratiu <adrian.ratiu@collabora.com>, linux-pm@vger.kernel.org,
	linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v1 0/9] freezer: Introduce freeze priority model to
 address process dependency issues
Message-ID: <aJSpTpB9_jijiO6m@tiehlicka>
References: <20250807121418.139765-1-zhangzihuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250807121418.139765-1-zhangzihuan@kylinos.cn>

On Thu 07-08-25 20:14:09, Zihuan Zhang wrote:
> The Linux task freezer was designed in a much earlier era, when userspace was relatively simple and flat.
> Over the years, as modern desktop and mobile systems have become increasingly complex—with intricate IPC,
> asynchronous I/O, and deep event loops—the original freezer model has shown its age.

A modern userspace might be more complex or convoluted but I do not
think the above statement is accurate or even correct.

> ## Background
> 
> Currently, the freezer traverses the task list linearly and attempts to freeze all tasks equally.
> It sends a signal and waits for `freezing()` to become true. While this model works well in many cases, it has several inherent limitations:
> 
> - Signal-based logic cannot freeze uninterruptible (D-state) tasks
> - Dependencies between processes can cause freeze retries 
> - Retry-based recovery introduces unpredictable suspend latency
> 
> ## Real-world problem illustration
> 
> Consider the following scenario during suspend:
> 
> Freeze Window Begins
> 
>     [process A] - epoll_wait()
>         │
>         ▼
>     [process B] - event source (already frozen)
> 
> → A enters D-state because of waiting for B

I thought opoll_wait was waiting in interruptible sleep.

> → Cannot respond to freezing signal
> → Freezer retries in a loop
> → Suspend latency spikes
> 
> In such cases, we observed that a normal 1–2ms freezer cycle could balloon to **tens of milliseconds**. 
> Worse, the kernel has no insight into the root cause and simply retries blindly.
> 
> ## Proposed solution: Freeze priority model
> 
> To address this, we propose a **layered freeze model** based on per-task freeze priorities.
> 
> ### Design
> 
> We introduce 4 levels of freeze priority:
> 
> 
> | Priority | Level             | Description                       |
> |----------|-------------------|-----------------------------------|
> | 0        | HIGH              | D-state TASKs                     |
> | 1        | NORMAL            | regular  use space TASKS          |
> | 2        | LOW               | not yet used                      |
> | 4        | NEVER_FREEZE      | zombie TASKs , PF_SUSPNED_TASK    |
> 
> 
> The kernel will freeze processes **in priority order**, ensuring that higher-priority tasks are frozen first.
> This avoids dependency inversion scenarios and provides a deterministic path forward for tricky cases.
> By freezing control or event-source threads first, we prevent dependent tasks from entering D-state prematurely — effectively avoiding dependency inversion.

I really fail to see how that is supposed to work to be honest. If a
process is running in the userspace then the priority shouldn't really
matter much. Tasks will get a signal, freeze themselves and you are
done. If they are running in the userspace and e.g. sleeping while not
TASK_FREEZABLE then priority simply makes no difference. And if they are
TASK_FREEZABLE then the priority doens't matter either.

What am I missing?
-- 
Michal Hocko
SUSE Labs
