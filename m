Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082967;
	b=EJe2YnuW1B6ScsOopUDyjjc3EtchQiWhDEwHQDs914k1O4aaFeT9i7Oi5MjVLOqFBPjR
	 RhmIgI6ZyQygfSUSXDBYBceAi1H2sfhMAWll7CnbCgXmTOMoEfMRpXm99hZa/2pEZvMOT
	 9JNjA80QGCrQETr81VwoQRsxapfPY0ud+eXx4TbEV3HwFZvuDnyHCDDUp5Ye97xMplNvX
	 YBHkPU5Fhu/4OqfnF6+TT9cbF0y0xzxsTvNbTEWHWAZEz5WVRMyfXZOD3XgJmlgH5IHFE
	 VQ8fNTv4VPWkPgO9ySUO1BX2hkoxlGaJu5z1oYqBHj7wncIT4QsgY7LVUwKuYVbhvww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
	b=qXTfUALyYD4/2/pWB5ZlZlm2EOEfFrKNpypwFdXoPy7asZQgiKnOdlurJ+PI35PFegPz
	 u4iADNCNgmzIIG75HQSpqMIlL1qG6jZzSWq+yXYLtMfoDJT4C/Q9O9zc5AOC8taF1X3zM
	 Dt0i+Zi4/OQE3eHOHDAX1XqYS5OQink0VdzIhtE3MNKfs2b9VYtXe2zpnXNZilqts3Mju
	 76KiSWCjyxtFWANfUs0QqttUBosJHlSfjH0ORUBi2JMhreR961W/OEzhvYj75ZXTbeznJ
	 hBtP0OgRaHyBDI3qQVrnQd4WfTQW9KqWv8TmaRsEMvJat+Mc31Uwf8UJMIKfQK/CAcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AJpFwj+U;
	arc=none smtp.remote-ip=209.85.210.171
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B567D606A324
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:36:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B567D606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AJpFwj+U
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-8a06cc097c7so2579648b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082966; x=1793687766; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=AJpFwj+UtsFPy+Kokat7pc9+njX0j70xHPnHt6IOlgPxwhcl/sIWyf05lcL1vxwEkj
         W5AFrM9CsNK7QCyTLFZgK+3GcW/2PFrK2XeJ0mlrHalWoBtHfJY8stH7Cx6nZlIGKVns
         6sknpFBwcs5Rxl1M5nppyMQ6+Rmyt39GI39hM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082966; x=1793687766;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aZp+29bWJnemlJ9gnuNYF6ybAmwjMMYwBmFx7KL7rmE=;
        b=lu6YdKKSCDeVtgru8RsNRD+QrK4/yFT7JuMzXib/ZZmedUFcBkrjkSLADnjk+WDr8E
         Hqa7Q6QhP5gZZjAkLxQ0GqveVyDcdiqVgRCecPm3N30UVzbaYlxhxhXqlLrN7ALME+9h
         EM5I59Tgc36fJbm330nBSxR2zetAz+0xYy6igqZjrLZ1G0CYHGCGOBQy6RhUwPrDS/Ec
         /Xi5duuAtIReoCQJtYrB47wFrxyYFALJ9G8jXpURPSirQHwkodZ+gMZvESyusPz0NzPy
         rmHMO8AH1/TTdsTQYgnPeOincjUQJU5W1tYQujGLggmhqjVaN0CYQwaEjwuZtnG6pcml
         WYtA==
X-Forwarded-Encrypted: i=1; AKwUvBxzYaM2m0qCabpcICfxS4rIPgK5nN67bgrE90Foc6alOiSakkgRGIqZu/UKcEfPZqIJBt18o1JvQxQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYKJecW2ARODrXVaEIZezmi4QBH4qMNKPQUBia/TIJC4ber6R8Zj
	JPpbWdpLIiarbhXvla31JWrnamIyyJAun5xWx1YF+L+uw9NYUF50Za9Dx3iPk2i9GH8=
X-Gm-Gg: AYBFou3kHI7OAIibOKA7tShhohmCmBUDK8A9wSPTTxHO6wAbWMXaZhWGPPqYVxw/wZC
	QJbjZ8zyXFgYDioGIK+thRNRIyeoJGmrc0Al/HoAexiUXWf4EU5m0fQqqq6nHKKpBlfrYtoX9IL
	RRBH/5tqMGwb1qbcHfzhxiTiTyKQUhzVbLVjzhCj+rlXjYuhN23ISrXsG9NQJ6TxNin4k2dqBf4
	sP/bzIetUWMtqzuXZPlMIiFDbgzBpWfwNaoqV8995dd5j47qUFa0soxgsnwI8sqbd5CGXYwwaSB
	qJGrJveTwEdqORSoq+MYjE2i50NaM1L83Wd9OjM4LqyXiaGkOgk+PjVfiDTaOlCsQB6ZD26SthN
	6/T4TrGwuxwZdImWYegPvDIVvsqsCau80hdKLJA8zV9jHdjdlxJY/7Ki9QgtTl2qscQEfZaLTVX
	gARLWdMeZJ6Ds14d+uKv9Gpg/6jzBhJDcHWGFjsISJxacfsqm/SWvw8pZomp1OZaCuxSmFW1Tus
	qmm4hG4jVokeTMSQh4vcB5YVBFP442QDBS1m3UCZQsnw5MrpuL3f1BaJ2liAK1ZJurSAs3YPEF3
	tcTizNY68d4SrMucSFj+zYc8nN5CeZxgKFAC1xWXs0EMecstXfmtOe4kU1ZPzZW0Ljr2fsbUjLh
	IkgZheLjJJE8xubNFWa9jdzM=
X-Received: by 2002:a05:6a00:21d5:b0:899:e80c:1ec1 with SMTP id d2e1a72fcca58-8a367a39106mr7234616b3a.18.1793082966170;
        Mon, 26 Oct 2026 23:36:06 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a368d87afasm2004475b3a.7.2026.10.26.23.36.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:05 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:01 +0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>,
	Kees Cook <kees@kernel.org>
Cc: Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>,
	Sami Tolvanen <samitolvanen@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 0/3] Make the scheduler stack end check selectable at boot
Message-ID: <cover.1793082868.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

At Meta, some of our host types enable CONFIG_SCHED_STACK_END_CHECK, but
we don't want it generally on because of the extra work on every context
switch.

Right now this is only configurable by setting the Kconfig option at
build time. Let's make it so we can also select it at boot with
sched_stack_end_check=, so that those hosts can share one kernel image.

(Patch 1 is a cleanup I happened upon while working on this, it can
also be taken independently.)

Chris Down (3):
  sched/core: Skip the shadow stack end check when SCS is disabled
  sched/core: Add sched_stack_end_check= boot parameter
  lkdtm/bugs: Add CORRUPT_STACK_END to test the scheduler stack end
    check

 .../admin-guide/kernel-parameters.txt         |  8 +++++
 drivers/misc/lkdtm/bugs.c                     | 21 ++++++++++++
 kernel/sched/core.c                           | 33 +++++++++++++++----
 tools/testing/selftests/lkdtm/tests.txt       |  1 +
 4 files changed, 57 insertions(+), 6 deletions(-)


base-commit: b99b7f60c5b473d374c68b53753153b4aa9e0702
-- 
2.54.0

