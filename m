Received: from out203-205-221-149.mail.qq.com (out203-205-221-149.mail.qq.com [203.205.221.149])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EFDC3A5E67
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 14:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.205.221.149
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635489; cv=none; b=uE/E3/JeyZemYmSGEHN4zsq0fJtWwa68MOj/MdrJ54aQn6j5ze+zCFxsTIb1e9cp/UuKKC2sp4r2WXfY855Uv/o/fx0U9ue4kc0Xpsoe50QtDQPFzCYe6weD6aIqMEdsuM8qT+wwvrEyMb3t0dafFA+TJCMnFcMnbdPEyHfWq44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635489; c=relaxed/simple;
	bh=Up2NnwGOlAofwkYGKzAQWJkpkqO3VxlDPt/GNHAcb7Y=;
	h=Message-ID:From:To:Cc:Subject:Date:MIME-Version; b=Nkwsd4lRmCUHf+95H/CZ3wvLlGcQAJ3WhyHEmYAvUmQhGeG0r8KIQT2I4z1GGg/hZdzEMtZ4Gs3CCs+GGfueEk4ApEjJXoshB6Kxabv7rs2V9CIeG/vTIp8gJfASWIWV1gLE88NuN9esXZEsxQ3SkSmTgyqjNDemitvqJWPaT9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com; spf=pass smtp.mailfrom=qq.com; dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b=EdCXBIV2; arc=none smtp.client-ip=203.205.221.149
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.b="EdCXBIV2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1772635478; bh=T2Dp7UZ6ezzDkjHjcd4fBsB5i6QzX8+VQqyhOhKSXnQ=;
	h=From:To:Cc:Subject:Date;
	b=EdCXBIV240ptcC2fIDOLcav8qj9O5cJhZFnS+QKFnxjVqIzzkP1NLtiiYlvN6kHDZ
	 Fij46ezrvCCwkS3SYWQ5yoHpJnUd37hyXQC+5aP0AaWTmTs2w9gWCmGu2K53KIoI1P
	 auqqy6Ab2j8Hqs283DldKRY+07eHUNIopkCNrOtk=
Received: from LAPTOP-993ER9L6 ([117.135.13.88])
	by newxmesmtplogicsvrsza63-0.qq.com (NewEsmtp) with SMTP
	id A4891674; Wed, 04 Mar 2026 22:41:08 +0800
X-QQ-mid: xmsmtpt1772635268trbu33l9x
Message-ID: <tencent_D970CEB1BE717D3D5E259943CB4510A99308@qq.com>
X-QQ-XMAILINFO: MZm6DsGys3GE2kSCYQ6ftC8TSbSUlcRxDRat9vj9AYQokqsMMzbfHIEYpAQgWp
	 ZocezZvnUVEYbyRZ5OUDzbRtCQENmB7iPvTzz6i11Cy2qrmkiZRROhi0uQuYqdlP9qHNZzHJvsHj
	 Y6JJH+P1PYb48A5uKMgbBw6avUtdIacUWvIpdU+lv6NP0uPTv1VhcSucWPVXJbUFWnHat2zqb3DG
	 vAfI0+0JfsN5BGxZ9Jo48PkiG99kAv2o2IXsddHCV5LC80IcdU9+NHxuDHoDqtnwk8hZgrHFZ8Yx
	 2X4y3z4hHXJvfAd4bpnhWpOLRlD0t8Uuv/5yQAuxz6KcBpDQl9PXpMJm2/OeDgtCIz+wgL6dWIOd
	 /SD6c23W40IdIR4gMNNDcaKThPXrsgepJlFRENevuFJpXSPxNK5MF4epV8xzke+xOpgGp+BYkrO3
	 mfT64KlGHTnEqSRy9wVlfu9AjqJVkNNZonylb0ztur99sIwO6AIH895ULURzgnT6bxTgAujuJNGQ
	 PLxnSPRWukx84iKIQCdUCLVt46MR4Q3X6KBIyiWRfJl0FKZjcmGQAjfO3wXztLdkqAfqGz/Gsx2O
	 dep/24rSuBMCO49s5AlW1FldorXKVzbq/3ljY7avq+sQzebpMfhjLkIH52OqGzYZ9bjO3S+nxT7f
	 tgZ73Guq93qoauPxdUiNNb48Dr5gEK6rCHaJrab/+KsW0qDKmLAxdCxyehiqBPbv6uJbI/E6KkXT
	 YijPgZ4hyhVxl4PSDGHoFV4sAyHKP2bPlcCqjpuH2VcDLpKUmJX743HU2mhMxxoVgm1RMlLLgM39
	 5o6diiH+kNIlQI9GA0V9sAV1M4A66kJIjYHHPchNwU01A/Cvx01bpevqRUCvB6AOpvXgr1WrUAlW
	 WJMGEvga5Xmd8dEtLng/GJr4q4RN6ru+ko53FalLUsyU9yGFZtAuaXXmclqM/UUSt4eSjnfpkrdT
	 DvfD6mZxhPdBJZN5uhupAmPFLdBWL0qLd7Kll805jnm2/LK7B1Muhse+4Kx7ghLoZrHpvGRQc=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
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
Date: Wed,  4 Mar 2026 22:40:32 +0800
X-OQ-MSGID: <20260304144032.1416-1-3288824963@qq.com>
X-Mailer: git-send-email 2.53.0.windows.1
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
 Documentation/core-api/printk-basics.rst | 22 ++++++++++++++++++++++=0D
 1 file changed, 22 insertions(+)=0D
=0D
diff --git a/Documentation/core-api/printk-basics.rst b/Documentation/core-=
api/printk-basics.rst=0D
index 2dde24ca7..a9da8c336 100644=0D
--- a/Documentation/core-api/printk-basics.rst=0D
+++ b/Documentation/core-api/printk-basics.rst=0D
@@ -103,6 +103,28 @@ For debugging purposes there are also two conditionall=
y-compiled macros:=0D
 pr_debug() and pr_devel(), which are compiled-out unless ``DEBUG`` (or=0D
 also ``CONFIG_DYNAMIC_DEBUG`` in the case of pr_debug()) is defined.=0D
 =0D
+Avoiding lockups from excessive printk() use=0D
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
+=0D
+Do not use ``printk()`` in hot paths such as interrupt handlers, timer cal=
lbacks,=0D
+or high-frequency network receive routines. When a slow console (e.g., ``c=
onsole=3DttyS0``)=0D
+is active, ``printk()`` may synchronously acquire ``console_sem`` and bloc=
k while=0D
+flushing messages, potentially disabling interrupts long enough to trigger=
 hard or=0D
+soft lockup detectors.=0D
+=0D
+To avoid this:=0D
+=0D
+- Avoid ``printk()`` in hot paths and interrupt contexts.=0D
+- Use rate-limited variants (e.g., pr_xxx_ratelimited()) or one-time macro=
s (e.g., pr_*_once()).=0D
+- Assign lower log levels (e.g., ``KERN_DEBUG``) to non-essential messages=
 and filter=0D
+  console output via ``console_loglevel``.=0D
+- Use consoles that implement the non-blocking ``nbcon`` API (indicated by=
 ``CON_NBCON``),=0D
+  which offload message printing to a dedicated kernel thread outside emer=
gency contexts.=0D
+  Note that asynchronous printing increases the risk of message loss durin=
g crashes;=0D
+  increasing the kernel log buffer size may help retain more messages.=0D
+=0D
+Temporary debugging may use ``trace_printk()``, but it must not appear in =
mainline=0D
+code. See the section about ``trace_printk()`` in Documentation/trace/debu=
gging.rst.=0D
 =0D
 Function reference=0D
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=0D
-- =0D
2.33.0=

