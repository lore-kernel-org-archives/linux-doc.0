Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E2C14387B
	for <linux-doc@vger.kernel.org>; Tue,  4 Jun 2024 13:31:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717507909; cv=none; b=rliMqifLAeXLFoeieAIL9YAgBiBf0DZhW1eiXOAoKumZs7fXQl1fxFcXXYONpbhoXBl7wZIAtv77eujTbIHddVNWIEXqhycGx9lI5KTy1Lyrt0lAFOSgMHLX8ih+O/E1/Aau5Pt/Jr6tAmwg6rhAVCWBpnFZju/ob82hzIV9/Mk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717507909; c=relaxed/simple;
	bh=GOyu6VoV1+EqQHivq4531ORRicJi6ri8IsacL/5ud00=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T4jmU/jysnqR5qYSzXhw3n5q7kX+akLgVUphpTZLMjgj3euK+/eV7e+2SSS/fS3tJ9bfzGQR3klPKzW3II8tV5vIkEQvrLy+QW1RzOVn9UzkkPHc6fBi3ciqLpKjOygZ7VjJcAZiKqRM3kzUcoPmCZgRIkrmH2cGDbSOBAIHrao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/oTgQw6; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/oTgQw6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1717507907;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=8NTg4cLU414MePoyscLxCqohMFZ4JgKreHROINBa29k=;
	b=K/oTgQw6XCsdAdrk2TbhL7AaEir+40HolDsBBfy+kZjhYMCJ5dvU7nTccP9nr1vnVpGT2B
	jM9H0OVHBT7VCAXCGyFDpe9+nFLed9x1yhnz+bv7IlJlLdJdVImGeBhFCRnx5k2B+OETjB
	1EVk/PPQgSuL8L1NqdNzw5N8Kz1ihCc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-669-KiXMdSnwNbaFznJMFJlDbA-1; Tue, 04 Jun 2024 09:31:46 -0400
X-MC-Unique: KiXMdSnwNbaFznJMFJlDbA-1
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4212f105f0bso7905435e9.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Jun 2024 06:31:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717507905; x=1718112705;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8NTg4cLU414MePoyscLxCqohMFZ4JgKreHROINBa29k=;
        b=MkI876x+0yXz08KadznYa7p/ZaoCejjra4YUGJApcUcWmO/w+7fq4QNWS1kGbR5BR7
         jcfm+axwNsEudMh6Q0O2wRr+Zo3HbvD/XyR8ff/E/eDY6vM31Rrd18aUZukL2/M8LoKX
         taZtjQM9jGe8Dxu9Z9rySz558nzY+EsHrA5Gqi073A9ErpClRUttrefxeIdBvgkHnEnK
         3B91hlbXUISj0Np1hQZawGtzwk4YA52yAlFrrwgAVFxQ0sHKovmDE1AZ/aqJgZeXTRJU
         xe8/x5cGwqgcioxQhu6wAjMRpIBWLGIarVzR7i57QHctgniBuBLHHupWI37B/kTyiBrb
         DB0Q==
X-Forwarded-Encrypted: i=1; AJvYcCWyRTDrgK6mC1ZZ2710djAQNhYFZgyRoDOhTLTbPcQTX8dfRnpJ7D2xSnvTNwO45mkJ8GEl/su4xDpYQ0/jE1GiON91nhUVJ9Py
X-Gm-Message-State: AOJu0YwDwDjCVST1yiex3Ekq5aelgL/bKO+Sn5VvP9kOb3i+vRdVuPb3
	HfPeqGjYtV8FxdJ0lDZXSqwlOExaEZDqCVoxcryRYXTBg2CmTHlpoeuEDIfMQeHbQXi17UBzHeM
	6/JK7V29XsR8KtJdDX03rigYQr8TAwrNH0XR+1Uh8eWbXKhH4HSiV0DJKKQ==
X-Received: by 2002:a05:600c:3d96:b0:41a:3868:d222 with SMTP id 5b1f17b1804b1-4212dff7d3cmr100598495e9.0.1717507904905;
        Tue, 04 Jun 2024 06:31:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7eaFWdN5jDf+LCOq1NkYpFGX7x9QehvuKgllc5QQK1pfiasQ6ZxSQSpSUhiSAG/QCorMIGA==
X-Received: by 2002:a05:600c:3d96:b0:41a:3868:d222 with SMTP id 5b1f17b1804b1-4212dff7d3cmr100598165e9.0.1717507904444;
        Tue, 04 Jun 2024 06:31:44 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([176.206.3.168])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4215425d599sm14468455e9.6.2024.06.04.06.31.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jun 2024 06:31:43 -0700 (PDT)
Date: Tue, 4 Jun 2024 15:31:41 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: Petr Mladek <pmladek@suse.com>, 
	Sergey Senozhatsky <senozhatsky@chromium.org>, Steven Rostedt <rostedt@goodmis.org>, 
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Sreenath Vijayan <sreenath.vijayan@sony.com>, Shimoyashiki Taichi <taichi.shimoyashiki@sony.com>, 
	Tomas Mudrunka <tomas.mudrunka@gmail.com>, linux-doc@vger.kernel.org, linux-serial@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, "Borislav Petkov (AMD)" <bp@alien8.de>, 
	Xiongwei Song <xiongwei.song@windriver.com>
Subject: Re: [PATCH printk v2 00/18] add threaded printing + the rest
Message-ID: <aqkcpca4vgadxc3yzcu74xwq3grslj5m43f3eb5fcs23yo2gy4@gcsnqcts5tos>
References: <20240603232453.33992-1-john.ogness@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240603232453.33992-1-john.ogness@linutronix.de>

Hi John,

On 04/06/24 01:30, John Ogness wrote:
> Hi,
> 
> This is v2 of a series to implement threaded console printing as well
> as some other minor pieces (such as proc and sysfs support). This
> series is only a subset of the original v1 [0]. In particular, this
> series represents patches 11, 12, 15 of the v1 series. For information
> about the motivation of the nbcon consoles, please read the cover
> letter of v1.
> 
> This series provides the remaining pieces of the printk rework. All
> other components are either already mainline or are currently in
> linux-next. In particular this series does:

Our QE reported something like the following while testing the latest
rt-devel branch (I then could reproduce with this set applied on top of
linux-next).

---
... kernel: INFO: task khugepaged:351 blocked for more than 1 seconds.
... kernel:       Not tainted 6.9.0-thrdprintk+ #3
... kernel: "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
... kernel: task:khugepaged      state:D stack:0     pid:351   tgid:351   ppid:2      flags:0x00004000
... kernel: Call Trace:
... kernel:  <TASK>
... kernel:  __schedule+0x2bd/0x7f0
... kernel:  ? __lock_release.isra.0+0x5e/0x170
... kernel:  schedule+0x3d/0x100
... kernel:  schedule_timeout+0x1ca/0x1f0
... kernel:  ? mark_held_locks+0x49/0x80
... kernel:  ? _raw_spin_unlock_irq+0x24/0x50
... kernel:  ? lockdep_hardirqs_on+0x77/0x100
... kernel:  __wait_for_common+0xb7/0x220
... kernel:  ? __pfx_schedule_timeout+0x10/0x10
... kernel:  __flush_work+0x70/0x90
... kernel:  ? __pfx_wq_barrier_func+0x10/0x10
... kernel:  __lru_add_drain_all+0x179/0x210
... kernel:  khugepaged+0x73/0x200
... kernel:  ? lockdep_hardirqs_on+0x77/0x100
... kernel:  ? _raw_spin_unlock_irqrestore+0x38/0x60
... kernel:  ? __pfx_khugepaged+0x10/0x10
... kernel:  kthread+0xec/0x120
... kernel:  ? __pfx_kthread+0x10/0x10
... kernel:  ret_from_fork+0x2d/0x50
... kernel:  ? __pfx_kthread+0x10/0x10
... kernel:  ret_from_fork_asm+0x1a/0x30
... kernel:  </TASK>
... kernel:
...         Showing all locks held in the system:
... kernel: 1 lock held by khungtaskd/345:
... kernel:  #0: ffffffff8cbff1c0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x32/0x1d0
... kernel: BUG: using smp_processor_id() in preemptible [00000000] code: khungtaskd/345
... kernel: caller is nbcon_get_cpu_emergency_nesting+0x25/0x40
... kernel: CPU: 30 PID: 345 Comm: khungtaskd Kdump: loaded Not tainted 6.9.0-thrdprintk+ #3
... kernel: Hardware name: Dell Inc. PowerEdge R740/04FC42, BIOS 2.10.2 02/24/2021
... kernel: Call Trace:
... kernel:  <TASK>
... kernel:  dump_stack_lvl+0x7f/0xa0
... kernel:  check_preemption_disabled+0xbf/0xe0
... kernel:  nbcon_get_cpu_emergency_nesting+0x25/0x40
... kernel:  nbcon_cpu_emergency_flush+0xa/0x60
... kernel:  debug_show_all_locks+0x9d/0x1d0
... kernel:  check_hung_uninterruptible_tasks+0x4f0/0x540
... kernel:  ? check_hung_uninterruptible_tasks+0x185/0x540
... kernel:  ? __pfx_watchdog+0x10/0x10
... kernel:  watchdog+0x99/0xa0
... kernel:  kthread+0xec/0x120
... kernel:  ? __pfx_kthread+0x10/0x10
... kernel:  ret_from_fork+0x2d/0x50
... kernel:  ? __pfx_kthread+0x10/0x10
... kernel:  ret_from_fork_asm+0x1a/0x30
... kernel:  </TASK>
---

It requires DEBUG_PREEMPT and LOCKDEP enabled, sched_rt_runtime_us = -1
and a while(1) loop running at FIFO for some time (I also set sysctl
kernel.hung_task_timeout_secs=1 to speed up reproduction).

Looks like check_hung_uninterruptible_tasks() requires some care as you
did already in linux-next for panic, rcu and lockdep ("Make emergency
sections ...")?

Thanks,
Juri

