Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3AB9263F5D
	for <linux-doc@vger.kernel.org>; Thu, 13 Aug 2026 06:20:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786602052; cv=none; b=miMbAGdErNmqqeX56nnZdclfPWEqPfAdqx/grrhxyOpMvyf2WXCNJtyz+eXodoCFWdgb0hG5TY+J9s4yHh8ps9MG/T1wS9nsUUZe1d9yPdqIapOmnvR4LPgKhWLdn22SRLVKiPYSOaE5itOGG+jqGbONI++rbhBozN4ekxKDbyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786602052; c=relaxed/simple;
	bh=+E4sr3ApYAx67ojdfuoIfGZdLzMgR7BzhkRi3joo42E=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tpn6w+66QpMVhB/Dt3c6v2BoWoay1vtvujg4g6SA++JEEGkCyh66RGMpRZSvkqVDN6g6WYsUvVV/NWdtVLtkRBEUuQXyUwY3s+u1eWh1JC+5w9IugrRuWphDCuaWy6mQvF5sc6CyIXx48ndaGyXeASwLxRRjlPs7uPTIyvUZocs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXUnv+/d; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXUnv+/d"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-496b7622a83so1887915e9.2
        for <linux-doc@vger.kernel.org>; Wed, 12 Aug 2026 23:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786602049; x=1787206849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bIkogX0nsWcChibFiyEXOsML18t7FCRxTFSNVsFKCxc=;
        b=iXUnv+/dJcleU3ffidMuB2hUWAtz2dp74VXFyTGyHhcSGYGQHuqAs8kXlQBIddpzBa
         C0R3G/Cu0ukmWl05F+Xv1cws4ty2iHlE1X5rWCL/ZdpkRXEuAliXdEA8CV41wR4ekloP
         JOzBocarRKClPrxV5+DsaEBzWBmt1Lz8sOwtEk45T/8LDU2c1wzR9kx9Cmv90NrDU4v9
         +3gi+j50Uxo/Yi0SkKQwLcjk+AWkiisZW04sard9+BONx4tILwVR+WZX/Zn/JtdqqDdG
         Cwc8H98pEWvzKUUlgojqHahpdp6ZdNHgX4ESGwcRzA7Tdk+odK4aVzmOCRudJUiH4GHK
         mgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786602049; x=1787206849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bIkogX0nsWcChibFiyEXOsML18t7FCRxTFSNVsFKCxc=;
        b=W4RPKPrH73WeHZpR1qq40lUpBV6xs/p37bD0yo6eJ2OuuUkBvcRCIgFRfcVd0l4Zva
         hJhL3f86j90X/+jMI1IyCyYv9NixH6twuZzZCcU/JHzuDYiON62S+1GL28NugHJybjgT
         TWVNGZ0Tbywv6sYZOHJRpwWjlqBL96iVWE8oQqoZ0+itM6d1wae15vm1XiEzbkyNPEJF
         euNQs3+L1koqdoGiFox1BXXFx2enXDEYhuhh7++q+gfRqbtnYqiWYcFrwac0J5izG6yx
         6QuggHVcIBxG6gPowvvOsDup53HE38q4DIyzoMRGas6rtXhs7VJufCKgnVZ7cnjiNvaB
         iH7Q==
X-Forwarded-Encrypted: i=1; AHgh+Rosb/9jNgMe+++S3IW5KKDCuBNOjbxdL3LtzNRdyLOiJmVaj3pbgfwwhMxzdtFtecQtEb2w9zj10Ig=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWkqCHD/lhhVW/d5z98eDdD4dwY0TtgB4uie3klx7JoHiNY1df
	QnxKDSzUqODEhaCihn9W/q9iBVM+AenfgG5CCw0NYpd6Xkh+VhPxBKd3
X-Gm-Gg: AR+sD13qNF9N2K8QhtK0YxsVSOOUSVo5XNn8VH8onmdU+BNjhgviiecDGm8RhYCZogt
	pC3PiEhb77b7ZFJbgdlR71Bfjnno37bh4HpCp6eG0r3vfDwgwQQPQm6MpXzpyqKXF5kIxWuougJ
	+nfKVbtBtl9bVrKYyzBnoRTlzZSnQYK+PhrtkqoWTDPIjMQPiGnJpo07vEfRT2653IhyPoVs3Ki
	+A3CPO1NeuYEeEncwFg3nbrgFsCu0+Hk2bVD3rwY2unr1zbLTHZ2u+nA6cTA0fcMDQKhlSFo1tj
	LkeXVlPWrncdImoKS2CyPINVo6UrIz0ki3/DmFbFohI6HmRxCS16SU4p8jiPlcBBKnkLLqAKqvx
	iACOj9us7S3ywyGCi1rzYD5lZsDCKcibLKLyckUyhAjdYZyA6RCE/vDqHPBDALh8sCu31/8WeeL
	63EA/2QxfOKg7rvKp1YUmV/1PKgd5KgJQlV1GUQyvZn5AAMZDEgJLEmhgx3BUg4qvWaBKnXVDrS
	3m+5NayoLeQWb0/7vlqWyj3em9xYgu23bXvc8ZGTxW5sxm+g6p0lY5EjVo88ZFYRei4POEEVnC6
	ctI6yq8WPoJ5g0bSqUK6FaGVIpBmrlywXKlufBg0ppQj6Fh0rQlE67WZ+n/UP7aV/wWRl3sUPg=
	=
X-Received: by 2002:a05:600c:a4b:b0:495:5858:8101 with SMTP id 5b1f17b1804b1-499821f2e1bmr32499355e9.15.1786602048980;
        Wed, 12 Aug 2026 23:20:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-9c79-1f01-1565-573d-10dc-99f9.310.pool.telefonica.de. [2a02:3100:9c79:1f01:1565:573d:10dc:99f9])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49981b0f4afsm47001025e9.5.2026.08.12.23.20.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 12 Aug 2026 23:20:48 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Gregory Price <gourry@gourry.net>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Joel Granados <joel.granados@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Mark Brown <broonie@kernel.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-next@vger.kernel.org
Subject: [PATCH] syscall_user_dispatch: Use CONFIG_SYSCTL for sysctl guard
Date: Thu, 13 Aug 2026 08:20:39 +0200
Message-Id: <20260813062039.14567-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

sysctl-next removes CONFIG_PROC_SYSCTL because it mirrors CONFIG_SYSCTL.
When combined with the syscall user dispatch sysctl in linux-next, the
stale guard prevents registration of kernel.syscall_user_dispatch.

syscall_user_dispatch_allowed defaults to true. SUD therefore remains
available, but administrators cannot disable new activations.

Use CONFIG_SYSCTL for the guard and documentation.

Fixes: 5b6e32ba7b59 ("syscall_user_dispatch: Add kernel.syscall_user_dispatch sysctl")
Assisted-by: Codex:gpt-5.6-sol
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
The conflicting sysctl-next commit is currently:

  8d75c338f0bc ("sysctl: remove CONFIG_PROC_SYSCTL, it just mirrors CONFIG_SYSCTL")

This is a cross-tree integration fix intended for the tip tree. It has
no functional effect in tip/master, but restores the sysctl when
combined with sysctl-next.

Verified in linux-next with an x86_64 object build using
CONFIG_SYSCALL_USER_DISPATCH=y and CONFIG_SYSCTL=y.

 Documentation/admin-guide/sysctl/kernel.rst | 2 +-
 kernel/entry/syscall_user_dispatch.c        | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index b6328cd0f43e9..ffea61d448ebb 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1416,7 +1416,7 @@ Controls whether userspace may arm Syscall User Dispatch via
   ==  ===================================================================
 
 Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATCH``
-and ``CONFIG_PROC_SYSCTL``.
+and ``CONFIG_SYSCTL``.
 
 
 sysctl_writes_strict
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index 2002c7aae4358..59c861866941d 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -178,7 +178,7 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
 					      (char __user *)(uintptr_t)cfg.selector);
 }
 
-#ifdef CONFIG_PROC_SYSCTL
+#ifdef CONFIG_SYSCTL
 static const struct ctl_table syscall_user_dispatch_sysctls[] = {
 	{
 		.procname	= "syscall_user_dispatch",
@@ -195,4 +195,4 @@ static int __init syscall_user_dispatch_sysctl_init(void)
 	return 0;
 }
 late_initcall(syscall_user_dispatch_sysctl_init);
-#endif /* CONFIG_PROC_SYSCTL */
+#endif /* CONFIG_SYSCTL */

base-commit: 98292902c7108717c4f4bea7226520b336f9a8bc
-- 
2.53.0
