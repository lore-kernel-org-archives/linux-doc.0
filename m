Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.246
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793869523;
	b=1QrgvB+KLMd6qwlmXixd1jzL49H1FRLY0/9+DDbAoNoYv9wGDkeU/1o33TIEkfaWZzey
	 JlJrKq2ypT94WYi+JcTIJz7oEW38LLxj2ma0DcPL2DeGemw3rCC3Kc3LMaVZoKYIC2Sbh
	 o7jaGdxYVQCiyCEH0DBxwD/xYDagN8mGuH67Yx0pOsGe9XvXaYCL8oE5LAr4AG26LSmDd
	 gMl6Ndae7GlsAzP1zb6uWXWqWamQlm1nUGHpTdwOlQDfDKCiWZ9KfqBd0PWD+fUBe+BaB
	 fLDOX6UCNFICtz+Ao4p9tbKS+ok+a4Uo4bjbwwtsBUz/UEpivWxDI91EbE0Nf6XojIw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793869523;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=tyXT3V1giPULzTli43gvYizMlTh6ps7zNGmY3FWZQOM=;
	b=q0iOQus2NO3CwD7bToDrdr853qSDngH4ukvynaXJKlyPrXSU40zeyRvL6Xu/82rjLmmj
	 u+oGK8XQiXQJ/x3YKvL7DJgOI/hdVCwyk2sc8nBqCZ6mn2WzzrjJUR7o3vUSnJcJKjMUA
	 kzV5Ttv5KUKG1sd937Zu+mfZr6Q7iBw1f1iCoEOXoDifNE2K5IGnJEzMttKSZXHKYGpXF
	 E99CrM8HH50uMyGI2Uo43OAyXUyiEu58BAUlm+zrdgDpWO4SKmjhw52wLTnu36gXreyau
	 ePrsTfdd1WYPQC0kCV/WKBoH3Ds+MGhI8ldSHz7UtgnpTbPcDOUoJEHI9r/0mDEkykQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RzjBhvaz;
	arc=none smtp.remote-ip=91.218.175.246
Received: from mta0.migadu.com (out-246.mta0.migadu.com [91.218.175.246])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8041606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 09:05:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8041606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=RzjBhvaz
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=UGrLw7tJ8SzIUnajBIKmwWZs/FFny8I1ZQMJWZrsm+Q=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1793869521; v=1; x=1794474321;
 b=RzjBhvazzFCPfHMBqevNsz5QvRylEPRwFm09vjeAAQVIKtcKwUMAMkkZDdR3zHLdeDf122KC
 DviCH0q1X0zIwTQAeAipZ/8Rpll201Rw9hI96e+HDK1mVm0BZfvhg7vHm5OVYuUx30kptnlWJIj
 apw9ZRKcxU05v7D7pR9otVig=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by mta11.migadu.com with ESMTPS id 8f2b4df41c8b103c;
	Thu, 05 Nov 2026 09:05:17 +0000
X-Mizu-Trace-ID: 8f2b4df41c8b103c
X-Migadu-Flow: FLOW_OUT
From: Fushuai Wang <fushuai.wang@linux.dev>
To: ynorov@nvidia.com
Cc: agordeev@linux.ibm.com,
	arighi@nvidia.com,
	borntraeger@linux.ibm.com,
	bsegall@google.com,
	corbet@lwn.net,
	dakr@kernel.org,
	dietmar.eggemann@arm.com,
	driver-core@lists.linux.dev,
	gor@linux.ibm.com,
	gregkh@linuxfoundation.org,
	hca@linux.ibm.com,
	johan@kernel.org,
	juri.lelli@redhat.com,
	kprateek.nayak@amd.com,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-s390@vger.kernel.org,
	linux@rasmusvillemoes.dk,
	meted@linux.ibm.com,
	mgorman@suse.de,
	mingo@redhat.com,
	peterz@infradead.org,
	rafael@kernel.org,
	rdunlap@infradead.org,
	rostedt@goodmis.org,
	skhan@linuxfoundation.org,
	sshegde@linux.ibm.com,
	svens@linux.ibm.com,
	tglx@kernel.org,
	vincent.guittot@linaro.org,
	vschneid@redhat.com,
	yury.norov@gmail.com
Subject: Re: [PATCH 3/6] sched: Restore preferred CPUs when hotplug removes the last one
Date: Thu,  5 Nov 2026 17:05:05 +0800
Message-Id: <20261105090505.93940-1-fushuai.wang@linux.dev>
X-Mailer: git-send-email 2.39.2 (Apple Git-143)
In-Reply-To: <20261101192203.6979-4-ynorov@nvidia.com>
References: <20261101192203.6979-4-ynorov@nvidia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 04b62c16fa8c..98f4f9434965 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8712,6 +8712,14 @@ int sched_cpu_deactivate(unsigned int cpu)
>  
>  	set_cpu_active(cpu, false);
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +	if (cpumask_empty(cpu_preferred_mask)) {
> +		pr_notice("sched: last preferred CPU%u offlined; make all active CPUs preferred\n",
> +			  cpu);
> +		reset_preferred_cpumask();

Hi, Yury

If the CPU being offlined is the only preferred CPU, after
reset_preferred_cpumask(), the steal governor may still need
some time to tighten the mask again, and eventually only one
preferred CPU may remain. Would this introduce additional
task migration overhead?

Regards,
Fushuai.
> +	}
> +#endif
> +
>  	/*
>  	 * From this point forward, this CPU will refuse to run any task that
>  	 * is not: migrate_disable() or KTHREAD_IS_PER_CPU, and will actively
