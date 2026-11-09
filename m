Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794230798;
	b=V2NuaCkOHan918MKvi//39u4vt50koNqktQS325M0PtvG6OXbDKI8RPa1MY3g9Kimicj
	 KoMbFbfKD9gpB16/0eRq/p5YRzDsV19LpwWSKCx3mBGZgeI/xv/WMDmGnhHJczZ6CemGm
	 VDFAbAtoEzgj+JIFGEUriaA9IJoH1FMYAIS76FanOUZIviooEftz4S9Ik0yJvnEN8EfFW
	 CE5QLZCW49JO9G4zGpcZHtFTDdGOJb1c5fdYTZqEn5zLuYfZ5F2zxuX03y6m09zZhN3t/
	 FX0vajAspPELrfWgboQdVjpqc1rR2cmUEu8oeEmNKBifAXtrbfx1l58Ige4jfbp4I+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794230798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
	b=ZhRy7jAvlKo6prd3W8OXalpeuJuqh3499PjCo0cv18iu6vIcZcBiZOv6P/oiulIvyUe0
	 6FUd07bD0BYKdEpEgbnSugx1xe/B79uqyk6gi2zR4e6jh3uTX073qdUMctmFdtH4yZfkA
	 wAN6bmMyuIBqg/90OHaiuJrLVmU+qDEzNIWg/wfG7M6Yba7+GVX834jTPS7NtulMplLgz
	 eF0X0r0pElJL7+NABSrcDbBz7CpeWwmQ/b53+7v07TC59V6LA2K0/Izlca6TR2qTpqtAw
	 juYy7bFFM24tTglZREuxWgPuQBYW02G6AmIu1NHI/mwjLYcMqKxrayll6P4Rnf945kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWAnA9Lq;
	arc=none smtp.remote-ip=209.85.214.182
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A035606A31C
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1A035606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XWAnA9Lq
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2eb0f1b592bso2957125ad.1
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794230797; x=1794835597; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
        b=XWAnA9LqdM0p1McSygOHFQi1k4/3YKYdEv0qzWF/05pBFysKR/RI+uf1GN99jAvJLr
         gZbyJIRx4Qn1eiW/GWZZdQtBk4cEpyROHQuSJglfa1n0AMCSwTgQ22vR8lAUGr/m1hxo
         udUIW2jqu434G6xbb7BVjXSL17FymUnxFbr4rcBpi2LKYztw5Uo5qGMT+4dBVqSzw2qO
         7XdRSCBE8GvEldkRmjif9rlOARg051T8bmHEOacq7gUCNjNempC5JzHF8efFW247E4l9
         UayMykSMdMMOt1LGM+igMZIvOYrR3EOZvjksVGdXACrxbT3mTPXnZiufyNsd6fEASWxD
         C20w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794230797; x=1794835597;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r5X9nZN7OKy8JBdYtqD0PaiACZ3x6osyA60EJf0K3SQ=;
        b=chYBPcRyr7Lkh5acJ/BH60vI7Kg9jGVMLbCHAG/UbiQV6+Cqlm94PA0DUwhnW9HKB2
         6OrpPYf72+6CDfojN6zosGYYNFsE47yrQCl5x3/wlLBSEQ7T5oz5zdYK/YZk8e1mUW3n
         iw3h4rjOkAHJULbNgNLMtrBuTTFnrFYRoZUmrd+0CnHPSCs+bYkrn1i6xjnV7UD0pqKK
         OWh0D+Qqmqx9hRoAaNbRa0Mib0yRTugtX0UIENuDglK/3biqGGCQfe7+dg4xhU9MHcHF
         YvSP3nYYobr7Mt6MK8vEO9FXOWA/WkgJj/xl0Agp7aPazOLbQK6h4AboiapJ5eexxwDr
         DemA==
X-Forwarded-Encrypted: i=1; AL+hErEUhUAR1W+yw1CIo+5X2yyvLJaPrvd+5OK3yErOY+vnpTjESCbhIAsn0Ow94l07tlHNWxrS277tiog=@vger.kernel.org
X-Gm-Message-State: APuU4Z+EUzwXLLg8qxJl7z1YrszNl1cr5eMF99tx/SRM25aVz5E9Znja
	gcB1wNoTSaE61sdEBV/FbfPHABcE9kuOJfC7PETnwLLjQxMcD/ePXTv9
X-Gm-Gg: AYBFou0OxBRWwRSPhhIwFssu1GRwYi/6bGdalsKjXH0zJm7XKGYxdQEHYZd4axAyand
	TYGHS+/A3VkUzY1Bqu9zFExCWG5kioPeYBVd9vfltbiBOLd1ZXaAIUwdvgWjH/4osvXpSX9FckL
	SpoOX5K1m0mWdORMK9SuJ6tO6CCSv+QIliEt1OIRrcuguZWw3nMgWsZCWKZM7XAP8nR7s4hCgGm
	KG78+4exjL+wXWRR/FQSr9SYhi17PVQL7wcLCHqsHrQiQLFufl83WnpCAPcDk49/wyqxY97lz0t
	HFXI60pZW4VNjgy7iHsoqGb3I8b04Xif0YiPW/Tm1JssxofQgdkI9J5LYN9zss7lzBdeOsy4Egk
	ziC4V13UFTumafNstHLMF9WqkrD9TdFSVl7BhddmNwNcvSOpbr2BcRz97t3HXQaMy0KWoZACtfP
	0t6Jgr+BJeXoEvAMdNvOMIlTZmDEoCGEhdSkZUjK2EPnUCHXftdV3tFdDwdKCx08Dxt1OMqQIS0
	59Ryza2bqWcmo0SarXenuPM3s5Gj52vhbpFYhYf9t2+sy9nHq0nLg66b4QjXuzNJ+za/Tt22jb+
	8GF1zSDe9tDvXySLP9NpGrn7xZfloBwcnKJustzI0c69qVH6+Yub/DGnRO8lnd5WA9m/sHj6QgK
	kdgt10YcX
X-Received: by 2002:a17:90b:57ee:b0:3ab:b39f:41c8 with SMTP id 98e67ed59e1d1-3b12d564a3emr3973293a91.46.1794230794140;
        Mon, 09 Nov 2026 05:26:34 -0800 (PST)
Received: from r00799764-ThinkCentre-M920t-N000.. ([139.159.170.67])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cdb969331f0sm1661701a12.18.2026.11.09.05.26.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:26:33 -0800 (PST)
From: Jinjie Ruan <ruanjinjie01@gmail.com>
To: babu.moger@amd.com,
	ben.horgan@arm.com,
	bp@alien8.de,
	corbet@lwn.net,
	Dave.Martin@arm.com,
	fenghuay@nvidia.com,
	james.morse@arm.com,
	rdunlap@infradead.org,
	reinette.chatre@intel.com,
	skhan@linuxfoundation.org,
	tony.luck@intel.com,
	x86@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: ruanjinjie@huawei.com
Subject: [RFC PATCH 00/6] resctrl: Support mba_MBps on MPAM
Date: Mon,  9 Nov 2026 21:26:15 +0800
Message-ID: <20261109132621.3862497-1-ruanjinjie01@gmail.com>
X-Mailer: git-send-email 2.43.0
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

From: Jinjie Ruan <ruanjinjie@huawei.com>

Resctrl offers two ways to describe an MBA policy:
- The percentage interface writes a fraction of the maximum bandwidth
  into the hardware control register
- The MBA software controller (mounted with -o mba_MBps) takes
  an absolute target in MiB/s and adjusts that percentage based on
  the MBM counters sampled once per second.

The problem is that a percentage alone isn't enough. How much bandwidth
a percentage actually corresponds to depends on the memory frequency,
the channel count, how many threads are generating traffic, the access
pattern, and the traffic of other groups. Neither MPAM nor x86 resctrl
reports the maximum bandwidth in MiB/s. So an administrator who wants
to enforce an absolute budget (a tenant SLA, a noisy-neighbour limit)
has to measure and re-tune the percentage on every machine. x86 resctrl
has had this software controller since 2018; MPAM has never been able
to use it. This series makes it work on MPAM.

What this series does
=====================

MPAM refuses mba_MBps in two places:
- Its MBM counters are assignable, and supports_mba_mbps() refuses
  the option when they are.
- Its maximum bandwidth control is a soft limit by default, which
  can't hold a single requester down to the target.
  MPAMF_MBW_IDR.MAX_LIM reports whether the hard limit exists.

MPAM also makes two generic defects reachable:
- Writing the control register sleeps (smp_call_on_cpu()), while
  the worker runs under the RCU read lock
- A 16-bit fraction lets the minimum control value reach zero, which
  divides by zero in the estimator

The patches:

- Patches 1 and 2 fix the two generic defects.
- Patches 3 and 4 make the loop runnable on MPAM: the worker takes the
  CPU hotplug lock around the sleeping control update, and assignable
  counters are accepted with a fixed assignment mode.
- Patches 5 and 6 handle the maximum: the driver sets HARDLIM and
  records the MAX_LIM behaviours, and mba_MBps is refused where only
  the soft limit exists.

x86 has no assignable counters in the mode where the controller is
allowed, and does not set the soft-limit flag, so its behaviour is
unchanged.

Testing
=======

With the MPAM MSC model in QEMU:

- From a 9606 MiB/s baseline, a 7000 MiB/s target converges to
  6888 MiB/s and a 9000 MiB/s target to 8766 MiB/s.
- The memory-side MSC register shows MBW_MAX.HARDLIM set.
- A modelled MSC that implements only the soft limit refuses the
  mba_MBps mount, while a plain mount succeeds.
- With mbm_assign_on_mkdir forced on while the controller is in use,
  a write of 0 is refused, and the user's value is restored after
  unmount.
- The KUnit tests for the MPAM driver pass.

Jinjie Ruan (6):
  fs/resctrl: Avoid division by zero in the MBA software controller
  fs/resctrl: Do not update bandwidth from a failed counter read
  fs/resctrl: Take the CPU hotplug lock for software controller updates
  fs/resctrl: Allow mba_MBps with assignable MBM counters
  fs/resctrl: Reject mba_MBps when the maximum is only a soft limit
  arm_mpam: Program the hard limit for the software controller

 Documentation/filesystems/resctrl.rst | 13 +++-
 drivers/resctrl/mpam_devices.c        | 55 +++++++++++++----
 drivers/resctrl/mpam_internal.h       |  4 ++
 drivers/resctrl/mpam_resctrl.c        |  9 +++
 fs/resctrl/monitor.c                  | 86 +++++++++++++++++++++------
 fs/resctrl/rdtgroup.c                 | 48 ++++++++++++---
 include/linux/resctrl.h               |  5 ++
 7 files changed, 179 insertions(+), 41 deletions(-)

-- 
2.43.0

