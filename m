Received: from out162-62-57-87.mail.qq.com (out162-62-57-87.mail.qq.com [162.62.57.87])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFAF4336896
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 06:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.87
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772693125; cv=none; b=s10bMpcV5l1C7162gvlCl2OESgrhPR2etGSKqtLgkQ17Be6UkIlU2uaRrHkeSzO23rn7+9nUScEeulDO7julSBMIMInpn7lG+jw9/ZuE/bX/TCbxivzO4IZiZiCjzhEcUkG91yhvj6yxC/lqM7VDFG/KQzESw1hhhLuvNOyjQLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772693125; c=relaxed/simple;
	bh=e3rvKJhqgU4v4vTlGVkYlWMiImT+lKsUX/t0JBIaGz0=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=tsyptH8GhFaMKwWnUtyMvnXigRG2ZZ1WwJ2MdOeTHfLzyza7aSaOkJUz8LJYel21B6HK5OYTTLd4ABmAvbxAmwk1rZ2ckzOli0Ep2XI1wIYYDZcC51b0nqkWcwhuV/vki/bdgYeaHJ2j/hpiq+ybJ2RO+IwzFKvk/sJEaaZe2XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=a5SWfDjR; arc=none smtp.client-ip=162.62.57.87
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="a5SWfDjR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772693112; bh=p5gYO06tETbxxzm5AlgGXCG+lX5qbKRYLKDTXW/fKOw=;
	h=From:To:Cc:Subject:Date;
	b=a5SWfDjRU/59iOepr9C+m8IaiXIidyy6PF9Yr1ExMN+Hd4yQvAlG7++w9pl53lkDk
	 bqAPbLqI09gUJSyKNlvBBj7LQBcrYUydCIOVQ5JbHpVw1SweEJzjgpG04eHUTz3DJl
	 ajY4/TlI41cTLYpu4+MbFHhrn4+cBQELzTLU4fjM=
Received: from localhost.localdomain ([124.70.231.53])
	by newxmesmtplogicsvrszc43-0.qq.com (NewEsmtp) with SMTP
	id A77894DD; Thu, 05 Mar 2026 14:41:55 +0800
X-QQ-mid: xmsmtpt1772692915t4vy7ysco
Message-ID: <tencent_6D5FBEBE0E2FDACC93E50D0893497F676407@qq.com>
X-QQ-XMAILINFO: M+6QKz8nsrJQi/KvNYyCXKgA+6OpX2Gn0n5asWo9P//gfkHcrvwRDdIuIPFJtj
	 eJAuuAkZRpWgB7SKqPL+GvGB7IYR/I7fRNT87R6+frGeT3dT+o5GzuAtZGCjBCcq3Y7RmG+H4u5A
	 F3JqssaVJmdj/9JMbpgy2YXbfT5ivVusu4kSKb5+QFYKtpyFeuXca9YguctJcWaPiVci8XDo37J2
	 6FoqTqxZPZ5fXechgFUpaLbC4kJPQPuwdgOOnsZHyTZRiWbEI5MRO8f4XViyzIqg7spV2U8OgHwI
	 r37WOfR/KtlAuS/dviwQAXN90jnDiJqMSm8BCjpfGUtk+v4yWDbJ1BjLJEARtgBa9mSym5LunJyc
	 ItjnkgP6Jh4PVizBpObbmSXWefMKzobGqZC9BTK8b10O2To59nPRFwklcmu8nkWqrY4ovPrF21FQ
	 yyvNP6zLooJfwpLcfcLod/Yo+6cvqV+eELKGbWHCtm6k0VcW8tqza864tU6IM3oqHeym8wJCA6bi
	 OaejOgnBq/q1/zhAm0jePtkS6iiBTD/JT1aGDraGJu51k1gMY7zjkvw7SNujO6SDaTcqQTDeoHoR
	 3UnWB7LpA4MCTF9VfZr9LTpmAUv4HXracgwm95ChfzfOReK1DH+O5qrI50/wk2WGf9Tt5+qqrwS3
	 J1fP0vWxgn4wTQ8fT2yiRPi6zaMfIRPW37dlW3JOfn8WJEl1HK9gEVMnnFKIgD6I35gi77FlgOsV
	 s8B82c2IgGLVkh60i1350Cf6KwXUWpX0Y1Pwhl+8wtLpkRjfIn0RxajvqFSoHAN/kjghp1YMXe6V
	 v/a4+33YAxqdhoMk1KmsOL0s8hkzmruNAYfZxxoWaU3QLZMxMYSu/7EU0EqewdCtCVNCuBpySA/+
	 qea5ubzGY0B/MMcTLV9oTg4ku5B6tiwNQrL4w6nDDYF0lcW5Uc8ogzGl0vL7hIvHL5t6Hfgp66p0
	 M+f5pJddIjC0Amqbx23PatCtMCOdl6gNXdLXfyIQ0kkSGqBzQW6g5HFZ+YeuwtLMtxXdCKnNA=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
From: hujinfei <3288824963@qq.com>
To: linux-doc@vger.kernel.org
Cc: pmladek@suse.com,
	senozhatsky@chromium.org,
	qujingling@huawei.com,
	zhangjiaji1@huawei.com,
	xushuangxing@huawei.com,
	rostedt@goodmis.org,
	john.ogness@linutronix.de,
	hujinfei3@huawei.com
Subject: [PATCH] Documentation: printk: warn about lockups from excessive use
Date: Thu,  5 Mar 2026 14:41:40 +0800
X-OQ-MSGID: <20260305064140.1828-1-3288824963@qq.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

From: hujinfei <hujinfei3@huawei.com>=0D

Add a section 'Avoiding lockups from excessive printk() use' to=0D
printk-basics.rst, explaining the risk of calling printk() in hot paths=0D
with slow consoles and suggesting alternatives like ratelimited printing,=0D
tracepoints, nbcon, and log level filtering.=0D
=0D
Signed-off-by: hujinfei <hujinfei3@huawei.com>=0D
---=0D
 Documentation/core-api/printk-basics.rst | 29 ++++++++++++++++++++++++=0D
 1 file changed, 29 insertions(+)=0D
=0D
diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-=
api/printk-basics.rst=0D
index 2dde24ca7..f6ca1bc55 100644=0D
--- a/Documentation/core-api/printk-basics.rst=0D
+++ b/Documentation/core-api/printk-basics.rst=0D
@@ -103,6 +103,35 @@ For debugging purposes there are also two conditionall=
y-compiled macros:=0D
 pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or=0D
 also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.=0D
 =0D
+Avoiding lockups from excessive printk() use=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+=0D
+Do not use ``printk()`` in hot paths such as interrupt handlers, timer=0D
+callbacks, or high-frequency network receive routines. When a slow console=
=0D
+(e.g., ``console=3DttyS0``) is active, ``printk()`` may synchronously acqu=
ire=0D
+``console_sem`` and block while flushing messages, potentially disabling=0D
+interrupts long enough to trigger hard or soft lockup detectors.=0D
+=0D
+To avoid this:=0D
+=0D
+- Avoid ``printk()`` in hot paths and interrupt contexts.=0D
+- Use rate-limited variants (e.g., ``pr_xxx_ratelimited()``) or one-time m=
acros=0D
+  (e.g., ``pr_xxx_once()``).=0D
+- Assign lower log levels (e.g., ``KERN_DEBUG``) to non-essential messages=
 and=0D
+  filter console output via ``console_loglevel``.=0D
+- Use consoles that implement the non-blocking ``nbcon`` API (indicated by=
=0D
+  ``CON_NBCON``), which offload message printing to a dedicated kernel thr=
ead=0D
+  outside emergency contexts. Note that asynchronous printing increases th=
e risk=0D
+  of message loss during crashes; increasing the kernel log buffer size ma=
y help=0D
+  retain more messages.=0D
+=0D
+Temporary debugging may use ``trace_printk()``, but it must not appear in=
=0D
+mainline code. See the section about ``trace_printk()`` in=0D
+``Documentation/trace/debugging.rst``.=0D
+=0D
+If more permanent output is needed in a hot path, trace events can be used=
. See=0D
+``Documentation/trace/events.rst`` and=0D
+``samples/trace_events/trace-events-sample.[ch]``.=0D
 =0D
 Function reference=0D
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
-- =0D
2.33.0=

