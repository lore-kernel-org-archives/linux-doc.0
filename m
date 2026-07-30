Received: from pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com [35.83.148.184])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 387E83C1D55;
	Thu, 30 Jul 2026 12:53:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.83.148.184
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785416034; cv=none; b=JE0yZiaAABKGpLbOm/UAHAo2Av7Y56U0XWC2+mdWu6PQQF+PZh8SsskjyKIWvEo+7MIjsCRM4p2e9sEty5ESo5sMlvChtWRuVDz4RU6mZBkkQWiAR+ChD4+l4DTZvr2D9T7T0XNvekkfrzEZIV+0fvHOeKw8Ar2V9hN3uJQn5qs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785416034; c=relaxed/simple;
	bh=PWmCS27JPxOLC2VltHkRiB5e86dKe7ULjlhCxuMdg98=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=q02xEMQqL2NrqWS0KJPm/0mgNr85emro0/Ebwz0/lZb5Z6zR87u2uM5cLXeawL99YykvflkRXYFSnsotD9ytFe6UBPKA/rKU07WDNOmDR3FeD9WP/QsIjp3MM37ewtabPGcR1Cdc5uHv4orQjIKM7+CcBhYVR3DljhSK+jLatTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=PR5m/Dab; arc=none smtp.client-ip=35.83.148.184
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="PR5m/Dab"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1785416032; x=1816952032;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=mSXkLYXhaTxjNeTbZYUc/lq+bN0VD6x4ZaJlPKQfzT0=;
  b=PR5m/Dabv5KXMR37ldYJRn+JJzOxiAaVKTJ75GVOGcLQZpxaRWCUH17i
   5XGvA5TAgABi+VQlQYkfGlHc/mgwWjGzuI3Qkpaai3oMQKQqSHVAuZqNI
   PJF1PnOxVsHa7PsgcPhQQvJa85llsQwYIyYAWneK0HmgXih1uK7CVHugU
   myg7w+Q9dmE+ZkiEbirKYoza+HKBBk7N8UqI9Cq3UHAcbsxfjBUq6q3lc
   8pN6t+lk/Vi3q5NAsFIA0MbbDRD4Qmo58oUpj1iDoAW9Yg/0x5ATjoW82
   gEjunoL1W5RWY31npvVKSHLGCt9LajRbtCUx7KIsED3e2EqvZqc2aAPcA
   g==;
X-CSE-ConnectionGUID: EwtaTNOWRKiwt1PMKype1Q==
X-CSE-MsgGUID: bF5HXxF8QvuL67zXZkDmDw==
X-IronPort-AV: E=Sophos;i="6.25,194,1779148800"; 
   d="scan'208";a="24457268"
Received: from ip-10-5-6-203.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.6.203])
  by internal-pdx-out-014.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2026 12:53:51 +0000
Received: from EX19MTAUWB002.ant.amazon.com [205.251.233.48:15876]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.31.31:2525] with esmtp (Farcaster)
 id ba51db1a-2836-4337-a881-da2d3af746d8; Thu, 30 Jul 2026 12:53:51 +0000 (UTC)
X-Farcaster-Flow-ID: ba51db1a-2836-4337-a881-da2d3af746d8
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB002.ant.amazon.com (10.250.64.231) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:51 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D001UWA001.ant.amazon.com (10.13.138.214) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Thu, 30 Jul 2026 12:53:49 +0000
From: Alexander Graf <graf@amazon.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jonathan Corbet
	<corbet@lwn.net>
CC: The AWS Nitro Enclaves Team <aws-nitro-enclaves-devel@amazon.com>, "Arnd
 Bergmann" <arnd@arndb.de>, Shuah Khan <skhan@linuxfoundation.org>,
	<linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
	<mancio@amazon.com>, <diapop@amazon.com>, <mknaust@amazon.com>
Subject: [PATCH 2/8] nitro_enclaves: Initialise the CPU pool mutex statically
Date: Thu, 30 Jul 2026 12:53:06 +0000
Message-ID: <20260730125312.71415-3-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260730125312.71415-1-graf@amazon.com>
References: <20260730125312.71415-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D032UWB002.ant.amazon.com (10.13.139.190) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

ne_cpus is registered with module_param_cb(), so its setter runs while
the parameter section is parsed: from the kernel command line as
nitro_enclaves.ne_cpus= for a built-in driver, or from modprobe
nitro_enclaves ne_cpus=<cpu-list>. parse_args() precedes do_initcalls()
in start_kernel() and do_init_module() in load_module(), so the setter
runs before the driver's own code. It reaches ne_teardown_cpu_pool() and
then ne_setup_cpu_pool(), both of which lock ne_cpu_pool.mutex, while
the mutex_init() for that lock sits in ne_init(). An admin who
configures the pool at boot or at module load therefore takes a mutex
that nothing has initialised. Commit ff8a4d3e3a99 ("nitro_enclaves: Add
logic for setting an enclave vCPU") added those two locks; the parameter
and its runtime mutex_init() were already in place.

Under CONFIG_DEBUG_MUTEXES the first acquire trips a
DEBUG_LOCKS_WARN_ON() in kernel/locking/mutex.c, because ->magic is
still NULL rather than the lock's own address, and the splat carries
parse_args() and ne_set_kernel_param() in its backtrace. It is not a
crash: with lock debugging off nothing is reported and the pool comes
up, which is how this survived. A write to
/sys/module/nitro_enclaves/parameters/ne_cpus is not affected: the
initcall has run before user space exists.

So initialise the mutex where the pool is defined and drop the
mutex_init() call, leaving it valid from the moment the parameter
section is parsed.

Fixes: ff8a4d3e3a99 ("nitro_enclaves: Add logic for setting an enclave vCPU")
Assisted-by: Kiro:claude-opus-5
Signed-off-by: Alexander Graf <graf@amazon.com>
---
 drivers/virt/nitro_enclaves/ne_misc_dev.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/virt/nitro_enclaves/ne_misc_dev.c b/drivers/virt/nitro_enclaves/ne_misc_dev.c
index 8222fbe75800..59e1794587e6 100644
--- a/drivers/virt/nitro_enclaves/ne_misc_dev.c
+++ b/drivers/virt/nitro_enclaves/ne_misc_dev.c
@@ -125,7 +125,9 @@ struct ne_cpu_pool {
 	int		numa_node;
 };
 
-static struct ne_cpu_pool ne_cpu_pool;
+static struct ne_cpu_pool ne_cpu_pool = {
+	.mutex = __MUTEX_INITIALIZER(ne_cpu_pool.mutex),
+};
 
 /**
  * struct ne_phys_contig_mem_regions - Contiguous physical memory regions.
@@ -1761,8 +1763,6 @@ static long ne_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 
 static int __init ne_init(void)
 {
-	mutex_init(&ne_cpu_pool.mutex);
-
 	return pci_register_driver(&ne_pci_driver);
 }
 
-- 
2.47.1

