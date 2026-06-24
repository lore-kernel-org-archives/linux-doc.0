Received: from smtp-8fa9.mail.infomaniak.ch (smtp-8fa9.mail.infomaniak.ch [83.166.143.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2814324169D
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 12:43:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=83.166.143.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782305030; cv=none; b=ubCx8xk074lEkZJqB/6ZvRRB4QXqGKw8QoMSkDkCE2Jp51n4B10m8v1OG5KKtWLx+nLYKxnfmWgxT4epdJXacQtxMNpx5Lho3aAk0GkUSP+yrRGlKL0GSwU0HeeUFbkxnHfJINeubkgb9G2OwbF5DtowFC556CyWpM6x6J5mLFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782305030; c=relaxed/simple;
	bh=wHEP3T0JCOGOfR8/mhG8DF0emMo+OpOS1XpQXj0JKsg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PEC9zOwE2d/Uyn7cdGuv6kfOGEOkH8ZfJ5curyQPg45IJQ6QJGKy/ZEgOBkD0Ujhb3/cOkCGeLmSKvxEuJpM0N5TBOFwUWlgMZ7xme4sPe2dwy0MUThUbk9ola0fKOxNybsvswiQaMdIuitAytOiojF+DpVhqJdb1R9RNKbvz1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh; spf=pass smtp.mailfrom=gibson.sh; dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b=ed3G/qnp; arc=none smtp.client-ip=83.166.143.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gibson.sh
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gibson.sh
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gibson.sh header.i=@gibson.sh header.b="ed3G/qnp"
Received: from smtp-3-0001.mail.infomaniak.ch (smtp-3-0001.mail.infomaniak.ch [10.4.36.108])
	by smtp-4-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4glhSX4HVJzXgX
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:43:40 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gibson.sh;
	s=20260228; t=1782305020;
	bh=N2jcZfkZx8sHU1eydr66vjE0TAGI3mXPIcJNMYu/yg8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ed3G/qnpMIeyx4IpfwAhVad2MyHVErmNXsv3StEyz/hIPotDlobDuEL+5s2sXXoii
	 vHGBbfFRw2pEUgYQcq+49nvG0i0tNk2xHXfll2bDSbYBsHOGtgdaO7T+m6EvwdsbTz
	 uP3PbTrkTI7w4QeM4C3xNCAtM/qJ9k7zkqWCbroc2iBXK4R0Z/giOHfuhfMJN3rlxv
	 4dHviK+JF3athfFZp6WW/xYBC1jDMqymqeGm5W+/jEJBIZL64KgUE98hnym6XGzepu
	 ClEohIjCw9QI3LDhiKZMSAyB0YzbT2lFBSPIJ7jbmmE4vEdppVjj8FAFEJy4kCSg09
	 WW0XZsGEoEINQ==
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4glhSX1TkQzH8N
	for <linux-doc@vger.kernel.org>; Wed, 24 Jun 2026 14:43:40 +0200 (CEST)
Received: from unknown by spiderdemon.horst.lan (DragonFly Mail Agent v0.13);
	Wed, 24 Jun 2026 14:43:39 +0200
From: Daniel Gibson <daniel@gibson.sh>
To: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Cc: Daniel Gibson <daniel@gibson.sh>,
	"Mario Limonciello (AMD)" <superm1@kernel.org>
Subject: [PATCH 1/2] Documentation/arch/x86/amd-debugging: Add example for reset register
Date: Wed, 24 Jun 2026 14:43:25 +0200
Message-ID: <20260624124326.746525-2-daniel@gibson.sh>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20260624124326.746525-1-daniel@gibson.sh>
References: <20260624124326.746525-1-daniel@gibson.sh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

The amd debugging documentation didn't state how to identify kernel log
lines with information from the reset register about the cause of a
previous random reboot.

The added example rectifies this.

Suggested-by: Mario Limonciello (AMD) <superm1@kernel.org>
Signed-off-by: Daniel Gibson <daniel@gibson.sh>
---
 Documentation/arch/x86/amd-debugging.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/arch/x86/amd-debugging.rst b/Documentation/arch/x86/amd-debugging.rst
index d92bf59d62c7..3176a1240fee 100644
--- a/Documentation/arch/x86/amd-debugging.rst
+++ b/Documentation/arch/x86/amd-debugging.rst
@@ -366,3 +366,8 @@ There are 6 classes of reasons for the reboot:
 This information is read by the kernel at bootup and printed into
 the syslog. When a random reboot occurs this message can be helpful
 to determine the next component to debug.
+
+For example, if bit 19 was set, you will get a message like this in the log on
+next bootup::
+
+  x86/amd: Previous system reset reason [0x00080000]: software wrote 0x6 to reset control register 0xCF9
-- 
2.48.1

