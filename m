Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793082974;
	b=sVlWT0kMItWv2dgnUsmE5WvP/kgQ0aMrE4Bhxca8OsJjDhEgZHgnLa0RgHAKs0YbzRci
	 aNo2kZUUFZCxomZri3lMuut0qwCy5C5x6raE1ORryeQ0TXrKpjQlmeMbhXkoQzl43sVN8
	 7ZDY81KviY66cQ4wuZ9pb9PAodayfmYMnY+gE31/x4ceeIg+ICYseyA5sHWXK01aR2EE0
	 Ex3W+nWYCG1FZ9kjTEfJZ+bCS3nQwDshwaNaaFHABcf4paM9r1/GxM8qhbSGVfEygEpKb
	 8GmAVfiGYcnm7bh7hlnkBmsFWA8tC2u/yFOZ0VSOSr1trnHZYtZJ0rf0+YdoF5XDL5g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793082974;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
	b=Q1+uLSLbRaWPMyPHL73Y/VNL2ZijX3rcOfQi1J7ya5liG2E2JSqdb0Z+YSOGU1W6q6X8
	 7fbbe7vYEZ+ZlDfjgndOMagRjaf5kDDIMgYr3V3sliirMT5+rZP6178OQIuC8m5yA8PTf
	 R7LcvUcyvnZgR8FdbFxxp/H9yNX51DiuXNX7zUs2BSj/zerOC1peX3UDalBZaX+RDvOXz
	 OJu9QsENBpbGehxsPQouWExqC4GNQZCnOYAQXEu8KEz1gqpYKZU9ONIR67+tWE+2M5KfO
	 aJ92pN/g2D1wFk3IydGjY4AoIN8QfEb/xiMe1LP3ApgkxpMp+/Z4s5aY+oKQX/moiRA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="oXO5/xix";
	arc=none smtp.remote-ip=209.85.215.177
Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2DF9606A32C
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:36:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2DF9606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=oXO5/xix
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-cc4dbcf2b85so1362497a12.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 23:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793082973; x=1793687773; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=oXO5/xixxcmqSABWV2HOCg/JLJ443Sgr5Ze5DRJdvGXvl3NNCkF8nt7WWQrEvx8zHL
         PatDlkNCLCw+31QgEdZMIwd7Yi4vS6qW6eWUBdf6vOxlkePJ+2iD6ScKEMZH09IFCQGU
         tIE9IL41JWC5LojEARxDT8+Qj5WWMLfz/NxgA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793082973; x=1793687773;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4xZBRPqWoqmG3ZLUyWqQC80cb8SEBhLFlhSnr0xrG4=;
        b=seQccGll1Rf30zrhWLKkYmtyTKW4EZiHlf9eCVimMujm/I7SIS7Bq5Czs2lE2rLHRc
         +mDDcs8zhvmUah+EmRtpHt86+2tSkNpBaIUviQTGezZm8ceIVq3mCpRdBTydz+Sn7jak
         WtMYR00RTQrUCdkA0thyjHakauAABFoCZqJEM9Zf4P2purNOLTYuRWTq1pDI6Rr60mJE
         /cxUCpsfsYxTqCTNX0ujY5DyMzTUMZVX8M9pUeECk2rBtjuKT4KhCjbGr9RgVoBhzBsw
         g+YvfmYedTWhP9GgFJ0B1LO4JehiFnnBTIPiTHS2ePiENEFB5i1dO7yE2PWny0uaL//z
         q6+Q==
X-Forwarded-Encrypted: i=1; AKwUvByFvWfHW7/eD/sxdgtrGsdOkOJGixGjiwnJai4brAgfqYOKujDrOIMoVRv3mHnW4+opPwle46O/rj4=@vger.kernel.org
X-Gm-Message-State: AFq9FYI3df7K5GPDErZta8hfi7s/20KFV1M0icl7G4V5VA7m6n7H5Z2V
	/RwyizYNaYI0hdBxgFkKsXUPcAZ0P3NJIGtFpfT3SXnKYegKoupl2b9FU2hBne32NUk=
X-Gm-Gg: AYBFou1mdYqCfKCYDEiXYD6XGwfFj3z4NShKeAMbLYAbpEEulMEM9WixvRvOZNGF3W8
	cfCF/fVp6/SX7sgU+zgGSzglUa6ZpctDl2Xwvgn8l32aUs3o+gQi2uBlAJwxOSaNFvgRwS5+FWm
	nS+WaR7DgHw7aIYJBQ3tu1Xa3web38x7/6oeH71PVpZPahBopHNKc7nx5cYNvMV+AW/Cnbi3bPR
	9c8WsIzdBaUUiJou8/e5DNGIZJvPs4mExbg6PnobnhDT/rWrlgrCHh3LjUtd7eQaJU7QpMxMHFp
	Zz0dTt8cWZ7Z2+w92pbHBoN8MSMP1wEvu0fdbx//G1EjehYDxMyFCy1C7P0565BfvPdAFR/CRRx
	6MA9DVCM+QSZ9RO0mwXzR4sGA+zOC4RdfsRYeKkGn3x3maKxYbefHH38fS+Plo16UB7WSdUcskq
	MKbWQNLOX9Ty3LkE0hiEcFS5ALGsq+FmvdiKNXiR+HvqH/20K19S04RVNWL4U/VkmS9U/kllhvg
	pVcCu9+t50JM9FCzid76jUU7pUDCC7eiMgNNyKC0cqXugRkOgThPAHgm9sRtjjH+aQUttiB3ft7
	VsAuxS+VxwGx/GoZFuDZ8EMFRv9u1fkDJkhx9+qxhYT6/VhGGryMueKwqLNI1Nap5yXOP2CaB6y
	sVU/AGh1KQy/EGHWsO48pOGE=
X-Received: by 2002:a17:90b:1c0b:b0:3ac:9e5e:d19c with SMTP id 98e67ed59e1d1-3adea8990f5mr7512458a91.17.1793082972994;
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40614daasm2254704a91.4.2026.10.26.23.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 23:36:12 -0700 (PDT)
Date: Tue, 27 Oct 2026 14:36:09 +0800
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
Subject: [PATCH 1/3] sched/core: Skip the shadow stack end check when SCS is
 disabled
Message-ID: <0e607d3aa7c2c4cc1b5b8ba7b0e25ebdb55726af.1793082868.git.chris@chrisdown.name>
References: <cover.1793082868.git.chris@chrisdown.name>
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
In-Reply-To: <cover.1793082868.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

With CONFIG_DYNAMIC_SCS, shadow call stacks are only used when the boot
CPU lacks pointer authentication. scs_release() already checks
scs_is_enabled() before it looks at the shadow stack since commit
9beccca09840 ("scs: add support for dynamic shadow call stacks"), but
schedule_debug() does not.

With CONFIG_SCHED_STACK_END_CHECK=y it therefore checks init_task's
unused shadow stack on every context switch. That is harmless right now,
but the check is redundant and costs a load from an unrelated cache line
in __schedule().

So, let's guard on scs_is_enabled(). It is a static branch, and it folds
to true when CONFIG_DYNAMIC_SCS is not set.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 kernel/sched/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/core.c b/kernel/sched/core.c
index d7c3b43158de..fc269fd10192 100644
--- a/kernel/sched/core.c
+++ b/kernel/sched/core.c
@@ -6152,7 +6152,7 @@ static inline void schedule_debug(struct task_struct *prev, bool preempt)
 	if (task_stack_end_corrupted(prev))
 		panic("corrupted stack end detected inside scheduler\n");
 
-	if (task_scs_end_corrupted(prev))
+	if (scs_is_enabled() && task_scs_end_corrupted(prev))
 		panic("corrupted shadow stack detected inside scheduler\n");
 #endif
 
-- 
2.54.0

