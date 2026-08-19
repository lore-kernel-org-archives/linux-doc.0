Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D22B44065D;
	Wed, 19 Aug 2026 18:34:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164480; cv=none; b=b4QA2pF121bsZ5xYl4zIoN5nu6LacqUAD+460YIQ4L0u8PGRpQvS7qU3/3IRjAjdt9IBjINCmRSTARG4XTMuh3Nzn8qkpZrdZGnQR51gtRFyVvfE889vLToC8Ph246KOKIS/GWW7OJiwNtyvsUTcYT/JdQLkETivPSghX4wz8ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164480; c=relaxed/simple;
	bh=2SY3E8pdAPnkuxSHtjovqcPR1folSovKQmVLAhx6qWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HDV+wJHrsS6tohX2yDYc2U5QaEKjOIGm4aGlwM1IX32aRQfaua6JcGtpc8aK9BaxstW1fC6nG8vN4C0sHwkudaw2ULpdmKKt16zbegEMGZq2F2jxZ1Hfbzyox7SEiKSoEdq7MBRCHcPZXwA4IEWKyUQdfFptqNuaZnnWadq/oxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=e/T2UMs3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="e/T2UMs3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=MWHQVF80Tmh94tpi83RZKfBm00YisJ4kFpXR0jw1MKE=; b=
	e/T2UMs3PTdKrqIAP2unqOLaqo93hJhTd6FZwYnxorvWua7y4UAHIlmnH+gpf/ZV0RU0nhvNuWvxt
	pE4OA3OfriBe8Nq83URiuCoqppQeO/r1kajf8rgsdpqI3XODJjY0cH6hEB8DfNMRk5CVfYbXoFcSL
	YL7oC7RG/v35i8BnJJ5eRReS2skUpQzGTlYW6+1D0GyLZ0yU665UjaLGlrjhT4tgR3PZJQJlrHf8s
	NSHH3M2zCR503Zq8sWx0miUL2Ofc0rKijgJUIB8I/k90PN4M6a6HjR/6a0xgrvzZ8CsyV9yRrehft
	4CpBFuvTgpwGQlPK+k1LCYkR+Okt8gkKkQ==;
Received: from [179.135.28.2] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wwl7P-006Ete-5B; Wed, 19 Aug 2026 20:34:31 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: linux-doc@vger.kernel.org,
	feng.tang@linux.alibaba.com,
	pmladek@suse.com,
	include@grrlz.net
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	andriy.shevchenko@linux.intel.com,
	kees@kernel.org,
	tony.luck@intel.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	gpiccoli@igalia.com
Subject: [PATCH V2] docs: panic: Disclaimer about console verbosity when using panic_print with pstore
Date: Wed, 19 Aug 2026 15:31:30 -0300
Message-ID: <20260819183419.2203903-1-gpiccoli@igalia.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Users of panic_print / panic_sys_info are usually aware of the potentially
huge amount of information displayed with such options - their goal by
using them is indeed to dump more information during panic!

What might come unnoticed at first is the impact that the console_verbose()
call on panic path has, specially in cases that users rely on pstore as
a means to collect the panic logs. Recent experience shows that dumping
all tasks in an ARM64 system (with qcom_geni tty driver) gets a 2 minute
delay on panic time due to writing such information to console. But in
that case, pstore was used, so there was no need for console printing,
and suppressing that reduced the full time to less than 0.5 second.

The option "printk.console_no_auto_verbose" aims exactly at this use
case: avoid automatically increasing the loglevel during panic path.
So, let's officially document this to avoid users wasting their time
either on long panic printing or debugging the panic delays.

While at it, improve the readability of the panic_print text, by
adding some line breaks.

Suggested-by: Petr Mladek <pmladek@suse.com>
Reviewed-by: Bradley Morgan <include@grrlz.net>
Reviewed-by: Feng Tang <feng.tang@linux.alibaba.com>
Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---


V2:
- Added line breaks as per Petr's suggestion (with some text improvements
  as well) - thanks Petr!

- Added review tags - thanks Feng Tang and Bradley, feel free to check
  again given we added the line breaks, etc.

V1 link: https://lore.kernel.org/r/20260805205026.1699568-1-gpiccoli@igalia.com/


 .../admin-guide/kernel-parameters.txt         | 19 ++++++++++++++-----
 1 file changed, 14 insertions(+), 5 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index deae852f71e4..51cdf4e41c21 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4874,6 +4874,7 @@ Kernel parameters
 
 	panic_print=	Bitmask for printing system info when panic happens.
 			User can chose combination of the following bits:
+
 			bit 0: print all tasks info
 			bit 1: print system memory info
 			bit 2: print timer info
@@ -4882,10 +4883,16 @@ Kernel parameters
 			bit 5: replay all kernel messages on consoles at the end of panic
 			bit 6: print all CPUs backtrace (if available in the arch)
 			bit 7: print only tasks in uninterruptible (blocked) state
-			*Be aware* that this option may print a _lot_ of lines,
-			so there are risks of losing older messages in the log.
-			Use this option carefully, maybe worth to setup a
-			bigger log buffer with "log_buf_len" along with this.
+
+			*Be aware* that this option may print a _lot_ of lines.
+
+			There is an increased risk of losing older messages in
+			the log. Maybe worth to setup a	bigger log buffer with
+			"log_buf_len" along with this.
+
+			Also consider using "printk.console_no_auto_verbose=Y"
+			if using this along with pstore, to avoid extra delays
+			due to increased console verbosity during panic.
 
 	panic_sys_info= A comma separated list of extra information to be dumped
                         on panic.
@@ -4900,7 +4907,9 @@ Kernel parameters
                         all_bt:         print all CPUs backtrace (if available in the arch)
                         blocked_tasks:  print only tasks in uninterruptible (blocked) state
 
-                        This is a human readable alternative to the 'panic_print' option.
+			This is a human readable alternative to the 'panic_print'
+			option above. Please be aware of the caveats using this,
+			check the 'panic_print' parameter for more details.
 
 	panic_console_replay
 			When panic happens, replay all kernel messages on
-- 
2.50.1

