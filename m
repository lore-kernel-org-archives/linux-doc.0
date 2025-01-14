Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.4])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 12B9B22DC29;
	Tue, 14 Jan 2025 09:49:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736848191; cv=none; b=YgCiueTI8MGrGvHFFwzBmEeowAaXpnYHK44tt+MuucQ6Hb7RAR10BJLjuS5tSkpNLRGH/dVCiraU9FeVQgrdTZ+100mBKy3osUNVN0DInpOZc3GJ7FHzFavxVvbeydmFsV5mPXhg/8wMjn5Wd67oP4FdSlSCQR40NUDkWwmIg2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736848191; c=relaxed/simple;
	bh=50XchvIEfaxXJJIYUQEaqDSuolnB+UCp0liqvA4Ud+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NC19ss/FJWk5toALjKVvdTmVoki3dUAmQRB7cqEg9Aw7uBnkRYQDMj2UipEGzcTGque881FCR7Sr6pqj3f8iTunJMeWWvFZxuoENuqH5OmVTXt0+t1N6QvGfiO+4gD0PZ239wRrxcVAGrOrHfXRJuYzQPPvv/aushXIl2mRBB4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=qQdM58BA; arc=none smtp.client-ip=117.135.210.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="qQdM58BA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:Subject:Date:Message-ID:MIME-Version; bh=VjZW7
	58BiIs0kHW1cKT8IWxuMKMWBJZ4GxyCO1F8GdA=; b=qQdM58BAtrusSGLPfrGQy
	rtv0hgyeIz7Y2fr5EHBMEf1YSrXS+XDyISsEUCXJBwYkSmQSZRSsfU3b5V7qljWY
	StNRptKi76gimOEWY5V/xioyxwmbM/CBL/ch5vHfh9QNdx+FkMCY+X60jcX9IECa
	4CpTJUrjGhZxtdnTDxb+80=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id PSgvCgA3gvf5MoZnXAYfEQ--.40986S2;
	Tue, 14 Jan 2025 17:48:46 +0800 (CST)
From: Jiayuan Chen <mrpre@163.com>
To: linux-doc@vger.kernel.org
Cc: tglx@linutronix.de,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	corbet@lwn.net,
	linux-kernel@vger.kernel.org,
	Jiayuan Chen <mrpre@163.com>
Subject: [PATCH v1] docs/arch: remove deprecated function name
Date: Tue, 14 Jan 2025 17:48:32 +0800
Message-ID: <20250114094832.350073-1-mrpre@163.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PSgvCgA3gvf5MoZnXAYfEQ--.40986S2
X-Coremail-Antispam: 1Uf129KBjvJXoWrKr43Cr1UXFWkWr1kKFW5Awb_yoW8JrWkp3
	9rJrn2gan8Z3WYkF1DAw1S9Fy3ZaykCw4UGFnrKry8ZF98tF4vv3y5tF17Xa4UZ34rJayF
	qFZIvF9Yyw40yaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piX4S7UUUUU=
X-CM-SenderInfo: xpus2vi6rwjhhfrp/xtbBDxvUp2eGMUgnLwAAs3

The dumpstack.c file has undergone many modifications, and the
print_context_stack() function was removed or rewritten a long time ago,
so it's better to remove the incorrect guidance. Additionally, no new
functions will be added to the documentation, as it may be modified again
in the future. Using 'question mark' and 'dumpstack' is sufficient to
index this document.

Signed-off-by: Jiayuan Chen <mrpre@163.com>
---
 Documentation/arch/x86/kernel-stacks.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/arch/x86/kernel-stacks.rst b/Documentation/arch/x86/kernel-stacks.rst
index 738671a4070b..2d355e78008e 100644
--- a/Documentation/arch/x86/kernel-stacks.rst
+++ b/Documentation/arch/x86/kernel-stacks.rst
@@ -113,7 +113,7 @@ Printing backtraces on x86
 
 The question about the '?' preceding function names in an x86 stacktrace
 keeps popping up, here's an indepth explanation. It helps if the reader
-stares at print_context_stack() and the whole machinery in and around
+stares at 'question mark' and the whole machinery in and around
 arch/x86/kernel/dumpstack.c.
 
 Adapted from Ingo's mail, Message-ID: <20150521101614.GA10889@gmail.com>:
-- 
2.43.5

