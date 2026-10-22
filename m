Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792709180;
	b=J9UD4mesxvJZ4QGsVs3KwDmLWOhUo6SvSpcyFzqIocA0YkYBdcsVzSBGN7DmPv644+gz
	 CEaW+zygsPGyY5pP15bF3kcmUAZBi2yqHSSgTlL+iffG9O+B7l/OhDJkJn4fH+u/vlZzF
	 xWFJPA8HrhZothM2qwbXaP3jWnvu5CQeWI9MaXUQvKuOVMllECA2cMD8v4WvVCL6OMYN7
	 lHX7jBPwf52/iX3FwJKA+x/nb9Gag1TmsfzR7pwd5P9oHMbsFHGpO8fmgyZnrgOxxqQTV
	 g+VTh0ml+nwzRiwGvTBSraoLgRFQWHNx5uCfoQZ+PX4Y/voBFKzlGDEx9BtzFadsRug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792709180;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:User-Agent:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=/cC5AQLjLOUYQ/9NvP6+8QudcZ61euNdmrltEH58TGI=;
	b=lFB9/pESJmtutP2Y3XZTQDd4ANBKOO8CdWbMCbJGsnYe84shhiwVgGIoP5w0xvVjIoIn
	 e+hrDAMoeYzh2CetTdxh1oxAajiPZsEAxz2mi+EYwnxsbY7wOKa5nh4QYj4aHsiSDrSZX
	 Jtj2xasNUovigE13Z9HHZpBRUnnvlIAcRScagZoqqsSZ1/BGdd42+rELe4KNb5I/L8x/U
	 wgxQq0yFsR4w2LLxHm3VSLA770Fxp68ho2Kv7HY+THW0EpRa1T8vheEGIMjAw2hzu5Ltz
	 DgaitVsh4Noo1tNa7Q+34PI5iXFkRvTuwuJspQHRK0DTqsWaW2ID4GlQ8DdZ8m2xOUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=V9dimx24;
	arc=none smtp.remote-ip=209.85.214.200
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694C7606A326
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 22:46:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 694C7606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wfelipe.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=V9dimx24
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2ea63087d79so2030475ad.3
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 15:46:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792709180; x=1793313980; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=/cC5AQLjLOUYQ/9NvP6+8QudcZ61euNdmrltEH58TGI=;
        b=V9dimx24kbBHXJ1P8vGSuF2WRcO3WtupmscAFAK7qit1JBN7+rsaM4uQ0QvOmi3B1e
         OlPJWZjH+841XvikNKbTweptQtwW3JkFjd/+cGweNrqzY4QnLyQWb2s3zuR8SLvbmlC6
         lrAmFBMaZxtIWv0wLtertobAQ7V6rLTmYDqBr4WWPm8KQSjJxxmV47sKaKi0yTdUMOl0
         wIioL1Us5cnqm4kvrZbnr395yEyIcU7hI9JAzGmXFBfOdlLsFFuiuhFDd/sfNAIN3tE2
         FYzb3iI+/Vpj1UwveLgeo6Vx/begviZEwvJoW6PntMNwAP6xvIwxxNwGNAyvkKefV0Ns
         CtgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792709180; x=1793313980;
        h=content-type:cc:to:from:subject:message-id:user-agent:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/cC5AQLjLOUYQ/9NvP6+8QudcZ61euNdmrltEH58TGI=;
        b=RWRwasAWf9hhquiY41ftFhfKEjTeroVk3bhrV+yp8ykyJfkCIeDop339Z6Mbmoejta
         tFr5UVSM6wlGQxVdZzii9+0W0TiHum6zjBc2CtjcgIdyNRjGVmldhDw+cNwsbPdu3GlD
         Eyixl5ARlDt8YnR6iR8Tzea35k5xieOv9XhrFMuntVUc79JUJclv1fmbagpJzpB9Aqqd
         4nF0sDj4adv3NpJSoBZq9VGoZmHd3i/tb9+CuAnNeKSecQCwUXQeoVElFxpjI8Buhptn
         eCEgkhaps4QbM1e7zx3T6Qi2bwOftxd8c4Fn/J37MxOfP7t2Fmc0gnAG07pXfVZwQ998
         2oHw==
X-Forwarded-Encrypted: i=1; AKwUvBzQu0rMDpDzOFnP5klk0m/JAJi5hkw5nvwIHZxEUZTjm/HZVXW4d0XV69Ax4tD04KIUq7GirqwXQXU=@vger.kernel.org
X-Gm-Message-State: AFq9FYIund/7R0Cll1OaWIXwCkJjIJmVQlNkkvyqmveh26Rw0tSIdOOR
	Ug005W7aGv9vI2ZQt+YFu8umZqDJkdn9DQ8xG+Qmwcpi3SUzGhqWM19UQ3Y9dbWV7azxHRhGhMu
	nkOYk7uV+Rw==
X-Received: from plbjk4.prod.google.com ([2002:a17:903:3304:b0:2e2:f517:75b])
 (user=wfelipe job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:f687:b0:2df:8382:918b
 with SMTP id d9443c01a7336-2ea7bc6f70emr7274925ad.0.1792709179486; Thu, 22
 Oct 2026 15:46:19 -0700 (PDT)
Date: Thu, 22 Oct 2026 22:46:19 +0000
In-Reply-To: <atpzgIOeEecUN9Qu@slm.duckdns.org> (Tejun Heo's message of "Thu,
 22 Oct 2026 10:35:12 -1000")
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261022155352.1293020-1-wfelipe@google.com> <20261022155352.1293020-3-wfelipe@google.com>
 <atpzgIOeEecUN9Qu@slm.duckdns.org>
User-Agent: mu4e 1.12.15; emacs 30.2
Message-ID: <p973mrs5tkuc.fsf@wfelipe-west1.c.googlers.com>
Subject: Re: [PATCH 2/3] workqueue: expose per-workqueue stats in debugfs
From: Wilson Felipe Pereira <wfelipe@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Shuhao Tan <tanshuhao@google.com>
Content-Type: text/plain; charset="UTF-8"

Tejun Heo <tj@kernel.org> writes:

> On Thu, Oct 22, 2026 at 03:53:35PM +0000, Wilson Felipe Pereira wrote:
>> struct pool_workqueue tracks runtime counters in pwq->stats[],
>> pwq->total_in_flight, and pwq->nr_active, but reading them currently
>> requires tools/workqueue/wq_monitor.py with drgn and kernel DWARF
>> debuginfo. This makes it impractical to inspect workqueue stats on
>> systems without drgn or debug symbols.
>>
>> Add /sys/kernel/debug/workqueue/stats to expose per-workqueue stats
>> directly from the kernel. Iterate over the workqueues list under RCU and
>> sum wq->retired_stats[] with each pwq's stats[], total_in_flight, and
>> nr_active to report queued, active, and running work items alongside the
>> cumulative pwq->stats[] counters.
>
> This isn't really a justification. What do you use these numbers for? If
> this is for live monitoring, why debugfs? If for debugging, what's wrong
> with drgn?

This will mainly be used for continuous monitoring and exporting the
stats from the machine (CPU time, queued backlog, etc.). Also to quickly
check if any item is queued or stuck.

Why not drgn? For continuous monitoring, running drgn on every machine,
with vmlinux debuginfo, and memory footprint from Python/drgn, while
having CONFIG_PROC_KCORE available, it adds up. Having a simple file
interface, it can be read from an existing monitoring collector.

Why debugfs? If sysfs is picked, not all queues are in
/sys/bus/workqueue/devices/. Using debugfs, a single file can include
all queues. If you have a suggestion, I'm open to change this series.

Thanks!
