Received: from out162-62-57-49.mail.qq.com (out162-62-57-49.mail.qq.com [162.62.57.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0403B37C0F9
	for <linux-doc@vger.kernel.org>; Tue, 17 Mar 2026 10:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773745107; cv=none; b=QXcVXZtQARnnHSu7BxvOaHxWSiN3PuGdihUC0Wtc4SHso6UM0c2OoPX5FwUt+VgPj50yvespKn4xkgLnsZZuCa2sv0E9tmd5gVGlhk8BhBHNProAMqP0dGVOD6sCQHplvHbV6R+ZlS1IPBaOpwwcMAyyZp71hNJnAVctQY5g0G4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773745107; c=relaxed/simple;
	bh=wxu9NXycGeqsWRgnugSKxkqAYx0rJ7Gws/1l22Be5RA=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=VNwBnD5IMU2aLrCoCXe9PxJhuBUDjz0oGXxRBHuKb1Iy7GtshLWoMtXiIoONoXXI/Tja2+NqKEwkIMCTkS8o8mRfvTviBvj6XN2hjNejrLaQw6YaytsqiMu/6tFeXwCxJpEkbvwFEJE+QRYkcafKACdiX8q17/K/qb8DfKj8Qqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=u1W1gMj2; arc=none smtp.client-ip=162.62.57.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="u1W1gMj2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1773745094; bh=RkF9UY20o04C9kFbg6GK29csodDBBDFZU3tduWk9JPk=;
	h=From:To:Cc:Subject:Date;
	b=u1W1gMj2E+5k0rXOFllEaC3vYAaenJolEscMp8PwjObc1iAy24rdmPTtgHGh/7qtO
	 dr23pNb36Nf+ZtgjTbcxlk9NUgGWpHzWVEcBd96EYbmDiLuXecNy4Bc9X13PRUT6o9
	 MeowjQ7Xl6gO0Viz+Dxd7B3OVjrsQJXSiHBJqUDQ=
Received: from AA2410024078AAC.china.huawei.com ([124.70.231.39])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id E8AAC643; Tue, 17 Mar 2026 18:58:10 +0800
X-QQ-mid: xmsmtpt1773745090tdjwjplu4
Message-ID: <tencent_FB5B7DCFFB10BCDE325397D1202226779D09@qq.com>
X-QQ-XMAILINFO: MRMtjO3A6C9X46cnDKL79vmPRk0yfNMGbkHMFWctGM2j22amP+3PjC9TbJA3Ze
	 tvLZAF/nW5m28yux+3gxu+pgaKu3u3KOygrTBsFwTz3Qb+oOOcDJZVFXaQGQG0IcLZve6ZOYUOKx
	 Ksv7+DqNvAhRC1AFnXHisDw3wrDo2X9fQDTZOMqX/RUJq6hSa8AB1E+8pJoxnmgMCOV0iaW6Iep0
	 wtINi2aSjc/7/uL8Ol4P2WM8ZvpzvI9vJcRpvdljyzWXccoKOmjmQhbLVoBb51nqiw9xd3NfF9Ej
	 4L9k8Q78R88M+dCmnGBhDLdXglTMr1kjdNRign4XPyXZv/SpgWadzvBjlYFwSpTLS33NSVn9w+8P
	 TBOTf4O2UUwAiG2t7XbEzB/q7hjVjJXmm5SIOGgBQOy75hk8YSKGlvmd//M8bR9AF6RAAHKDKS5t
	 7u4S6AJv4Y1+u6GU+2Thi9dkSyPfuR8BZjEBUPHaJOB/BtAd+HqiIjYm3TusxTEHm7IvCtiplUGA
	 dtmA6FcqkN/ZZDFNzFxlXd1hkFILwMHON44NKDLjbObxCAyw913IWsXHOIsEePMfVB5gykvK/5JX
	 LZyb3/oxTlresCpsvKLmaPl+5Bd6QicoI10d6pntJ6g3j6PXaH4bxDkkWu3FzcfU4qRrqY78mtyI
	 TH+vyjA0Fylg55XyZocFuATsSvi0jdtUXezCrmRKv5Uv9UOdKwJOIbkOnQXsqcQpcF+PmLMdhozB
	 nt9kEjYma9g71saSsSQnDIxO4+Mn+UwsZDhCdYPoCgPZ1/pa7TIsEI6Y/JV+1acIDOb/HX26DhMV
	 FviWrMxCX7vMYMwHsTohUbpcC1OsfL5YMFNUkgotz3SyEgSA615xrL1VFQ2JkoAgnZxbJ6aH0GBz
	 GWP/Bm+kug2O+jotAbNvTTl9pwqSdsvY2izltHGp6aJt9jptzV+tLS0KuccQaCPbeW90X0A2rcVz
	 K6ZnpO63eFdbwnjbBWmYv1zrFukGx94FFCk0AbgqFFtuDphXKV5wstz2TH+6JJTfLPvbAeqff1TN
	 FwbpE/mg==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
From: h3288824963 <3288824963@qq.com>
To: linux-doc@vger.kernel.org
Cc: pmladek@suse.com,
	john.ogness@linutronix.de,
	senozhatsky@chromium.org,
	rostedt@goodmis.org,
	qujingling@huawei.com,
	zhangjiaji1@huawei.com,
	xushuangxing@huawei.com,
	hujinfei3@huawei.com,
	h3288824963 <3288824963@qq.com>
Subject: [PATCH v2] Documentation: printk: Add section about avoiding lockups
Date: Tue, 17 Mar 2026 18:57:11 +0800
X-OQ-MSGID: <20260317105712.879-1-3288824963@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a section 'Avoiding lockups from excessive printk() use' to
printk-basics.rst, explaining the risk of calling printk() in hot paths
with legacy consoles and suggesting alternatives.

The section covers:
- Rate-limited and one-time printing variants
- Log level filtering
- printk_deferred() for legacy consoles
- Porting to nbcon API (preferred solution)
- Using tracepoints for permanent debugging

This documentation is relevant only for legacy console drivers and
!PREEMPT_RT kernels.

Suggested-by: Petr Mladek <pmladek@suse.com>
Suggested-by: John Ogness <john.ogness@linutronix.de>
Signed-off-by: h3288824963 <3288824963@qq.com>
---
 Documentation/core-api/printk-basics.rst | 36 ++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-api/printk-basics.rst
index 2dde24ca7..48eaff0ce 100644
--- a/Documentation/core-api/printk-basics.rst
+++ b/Documentation/core-api/printk-basics.rst
@@ -103,6 +103,42 @@ For debugging purposes there are also two conditionally-compiled macros:
 pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or
 also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.
 
+Avoiding lockups from excessive printk() use
+============================================
+
+.. note::
+
+   This section is relevant only for legacy console drivers (those not
+   using the nbcon API) and !PREEMPT_RT kernels. Once all console drivers
+   are updated to nbcon, this documentation can be removed.
+
+Using ``printk()`` in hot paths (such as interrupt handlers, timer
+callbacks, or high-frequency network receive routines) with legacy
+consoles (e.g., ``console=ttyS0``) may cause lockups. Legacy consoles
+synchronously acquire ``console_sem`` and block while flushing messages,
+potentially disabling interrupts long enough to trigger hard or soft
+lockup detectors.
+
+To avoid this:
+
+- Use rate-limited variants (e.g., ``pr_*_ratelimited()``) or one-time
+  macros (e.g., ``pr_*_once()``) to reduce message frequency.
+- Assign lower log levels (e.g., ``KERN_DEBUG``) to non-essential messages
+  and filter console output via ``console_loglevel``.
+- Use ``printk_deferred()`` to log messages immediately to the ringbuffer
+  and defer console printing. This is a workaround for legacy consoles.
+- Port legacy console drivers to the non-blocking ``nbcon`` API (indicated
+  by ``CON_NBCON``). This is the preferred solution, as nbcon consoles
+  offload message printing to a dedicated kernel thread.
+
+For temporary debugging, ``trace_printk()`` can be used, but it must not
+appear in mainline code. See ``Documentation/trace/debugging.rst`` for
+more information.
+
+If more permanent output is needed in a hot path, trace events can be used.
+See ``Documentation/trace/events.rst`` and
+``samples/trace_events/trace-events-sample.[ch]``.
+
 
 Function reference
 ==================
-- 
2.53.0.windows.1

