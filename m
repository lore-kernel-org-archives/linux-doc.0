Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA4D43DB337;
	Wed,  5 Aug 2026 20:50:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785963054; cv=none; b=hln+vbKU0EteWrpahliEh0ppJbKKAS8mr3AaYHGlWatX42J+ZkCvi4Iu3d3ZLrTjwzzGoNQZTqblVIPIRi/2lASH3tU0aj3TV+cNd9aiS1slGWg3fBegLH/qVM/BBZCDfkuDlpOklMaYB4EH42n4FdxZWttiGgleXBDoG8bVMlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785963054; c=relaxed/simple;
	bh=jBe5ah8o9BFimtdWRfixOgYgVUvf5xybporM2aY6A+8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZQwkAH6oqzBP/zI1jRJkigaKiZ0Hbzyl2TuAlRZCt/PAa7C2RfnYGPGLLmfy1CV8HnpHPw1kEmn/qrq29DNBeWzyQ5mIoLhlqutibEJhXZ9ZUVt7wfQVd5erFBZ4F/6PC3RiVHrJlGsW8l0VXVVxIDlGIUP04qOhn+0RfGUCFQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=ijPCqiAp; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="ijPCqiAp"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:
	Cc:To:From:From:Reply-To; bh=hsDhM5GkTmS9ssjk/k/BNMufe9BdUo/SILJeWpEOq3w=; b=
	ijPCqiAp+AA/vvI2g11HaDLx+90m9q+2z9MsZHPs9m5s/UrHC5d5f50Y5TUeRT2Hy3ivlVCRB/Hri
	ky0wAUvCIfwryCJSHzv8DnoP9smff8n/bocaFGYBRXWeoyHEp42deNfCFlbegysErmPX9fUiEzxDW
	cRa+9w+UBHyIfb6FZU+b1vx/86mKMqtr+xk/hgtV9LXeQjC76yScYj+v1qmxyKcRUY3eLZPjK/MpA
	WvRAdEjfGzqbYWQXmO+INZgXc6JxcUhS4inwM/QUkmerYS3EUhZcH0PP8UnIW74/17lK31hNH5aBi
	49ONwASMwToTnvUw96LFipSSQ9soQy+seQ==;
Received: from [191.19.52.61] (helo=localhost)
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256) (Exim)
	id 1wriZT-00EcMc-Sd; Wed, 05 Aug 2026 22:50:40 +0200
From: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	feng.tang@linux.alibaba.com,
	andriy.shevchenko@linux.intel.com,
	kees@kernel.org,
	tony.luck@intel.com,
	pmladek@suse.com,
	linux-kernel@vger.kernel.org,
	kernel-dev@igalia.com,
	kernel@gpiccoli.net,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>
Subject: [PATCH] docs: panic: Disclaimer about console verbosity when using panic_print with pstore
Date: Wed,  5 Aug 2026 17:49:04 -0300
Message-ID: <20260805205026.1699568-1-gpiccoli@igalia.com>
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
and suppressing that reduced the full time to less than 1 second.

The option "printk.console_no_auto_verbose" aims exactly at this use
case: avoid automatically increasing the loglevel during panic path.
So, let's officially document this to avoid users wasting their time
either on long panic printing or debugging the panic delays.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..04c0ef2cf910 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4862,6 +4862,9 @@ Kernel parameters
 			so there are risks of losing older messages in the log.
 			Use this option carefully, maybe worth to setup a
 			bigger log buffer with "log_buf_len" along with this.
+			Also consider using "printk.console_no_auto_verbose=Y"
+			if using this along with pstore, to avoid extra delays
+			due to increased console verbosity during panic.
 
 	panic_sys_info= A comma separated list of extra information to be dumped
                         on panic.
@@ -4877,6 +4880,8 @@ Kernel parameters
                         blocked_tasks:  print only tasks in uninterruptible (blocked) state
 
                         This is a human readable alternative to the 'panic_print' option.
+                        Please be aware of the caveats using this option, check
+                        the panic_print information above regarding delays.
 
 	panic_console_replay
 			When panic happens, replay all kernel messages on
-- 
2.50.1

