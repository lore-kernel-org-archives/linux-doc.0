Received: from out-185.mta0.migadu.com (out-185.mta0.migadu.com [91.218.175.185])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDB43442B2C
	for <linux-doc@vger.kernel.org>; Thu, 23 Jul 2026 12:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784810251; cv=none; b=TJYfhSLhaPkRAsaCcHGF0bVtX9Y+g7nz+xfNH8/gTEhE0ugavms/fhebTG07zDrpqL+ulaMdzmvwBz5Y9l8Sy6W1+97bZNSSqZeXmFMPWYRJEWEhB+RtJrGdXWS9Bmd2Z3TATNhzzvCMye6+vfejnustnZkYBFIfkccPtIK7BqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784810251; c=relaxed/simple;
	bh=nptuBtAwJ3lRjdQo46f7ZHx0eR/qLg0x3LpFCqcNXyE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sVkcRFt4bmN5HY9WYhwX+tCwq87ll0LgbtBP8H5QxGmZQXm7VKeQ8m/AHy706WTdcus1GEkX61aDucPMNKnIthpZ5InQWHTNRiumDDqJpeeuAtNXtt+mZOpKgC0ICcD2DJNQIX5hgIyz6uq87i7V952N1jxDTTuaFyvAAhqegeo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=N8Nh8Ewo; arc=none smtp.client-ip=91.218.175.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="N8Nh8Ewo"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1784810237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=u6J3BszoqoGQkVfRC18M6Yx1mYqZ8nl8MoqGOvVEAeg=;
	b=N8Nh8EwobFVzJXzOZbFrCEvJliiA8nnI6QXaeRphWDdnlzi1s05cioS/0mXdIns0sa3GZO
	4Zvitd3FpqMXegdqz34kbPVkfzmcjXgGjqYYCGe3btwqcRNCSe9fSVblTgoNl042UkR8hg
	uSpE/WB2xV6Si4lthCD1f0zhem/K+hA=
From: Tao Cui <cui.tao@linux.dev>
To: Johannes Weiner <hannes@cmpxchg.org>,
	Suren Baghdasaryan <surenb@google.com>
Cc: linux-doc@vger.kernel.org,
	Peter Zijlstra <peterz@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Tao Cui <cuitao@kylinos.cn>,
	linux-kernel@vger.kernel.org,
	cui.tao@linux.dev
Subject: [PATCH] docs: accounting/psi: document /proc/pressure/irq and irq.pressure
Date: Thu, 23 Jul 2026 20:36:54 +0800
Message-ID: <20260723123654.456504-1-cui.tao@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Tao Cui <cuitao@kylinos.cn>

psi.rst lists only cpu, memory and io, omitting the IRQ/SOFTIRQ pressure
exposed as /proc/pressure/irq (and irq.pressure per cgroup) under
CONFIG_IRQ_TIME_ACCOUNTING. admin-guide/cgroup-v2.rst already documents
irq.pressure; bring psi.rst in line.

IRQ pressure is tracked only for the "full" state: there is no "some"
line, and writing a "some" trigger returns EINVAL.

Signed-off-by: Tao Cui <cuitao@kylinos.cn>
---
 Documentation/accounting/psi.rst | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/accounting/psi.rst b/Documentation/accounting/psi.rst
index d455db3e5808..6d761625529d 100644
--- a/Documentation/accounting/psi.rst
+++ b/Documentation/accounting/psi.rst
@@ -35,7 +35,8 @@ Pressure interface
 ==================
 
 Pressure information for each resource is exported through the
-respective file in /proc/pressure/ -- cpu, memory, and io.
+respective file in /proc/pressure/ -- cpu, memory, io and, when the
+kernel is built with CONFIG_IRQ_TIME_ACCOUNTING, irq.
 
 The format is as such::
 
@@ -57,6 +58,12 @@ stall state is tracked separately and exported in the "full" averages.
 CPU full is undefined at the system level, but has been reported
 since 5.13, so it is set to zero for backward compatibility.
 
+Unlike the other resources, IRQ pressure is tracked only for the
+"full" state, which accounts for CPU time consumed by interrupt
+handling and therefore unavailable to tasks. The "some" state is not
+reported, and writing a "some" trigger to /proc/pressure/irq fails
+with EINVAL.
+
 The ratios (in %) are tracked as recent trends over ten, sixty, and
 three hundred second windows, which gives insight into short term events
 as well as medium and long term trends. The total absolute stall time
@@ -181,8 +188,9 @@ Cgroup2 interface
 In a system with a CONFIG_CGROUPS=y kernel and the cgroup2 filesystem
 mounted, pressure stall information is also tracked for tasks grouped
 into cgroups. Each subdirectory in the cgroupfs mountpoint contains
-cpu.pressure, memory.pressure, and io.pressure files; the format is
-the same as the /proc/pressure/ files.
+cpu.pressure, memory.pressure, io.pressure and, with
+CONFIG_IRQ_TIME_ACCOUNTING, irq.pressure files; the format is the same
+as the /proc/pressure/ files.
 
 Per-cgroup psi monitors can be specified and used the same way as
 system-wide ones.
-- 
2.43.0

