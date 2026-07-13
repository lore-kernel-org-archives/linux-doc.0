Received: from out-183.mta1.migadu.com (out-183.mta1.migadu.com [95.215.58.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9833A35C193
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 23:35:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985730; cv=none; b=gIhJJVnd/URjb5+iB2X0fiz0SLwLLeNuKVRrZAxbuE8EPZXJgT8i/TxsyHTSDlACxVT7u+Y/SYLtBhu14Vh/uDiPKYYxGR1tZ7HFx5AEm5ylbt2/8OxOGaU02m3N3zCVROvvulWqs7DEOGA3HgwhO+yf8tT49tllJQDUWjdIbeI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985730; c=relaxed/simple;
	bh=HEu+JS6e27UdjH9GE1tmfLwcK6GeSAghtWAw9k3aF4Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uQ5sn/0kN+Ltp1KJa91R0BxwMeRZgtfDcHMlR86/S9MfROXcEPaNlAfucnEpk8+RhfA+G3+6570ct76r5rBt5CFfSo2L2/g2KmtAjjSRvi7ZjJwJMT5Kr7OsltKE690s9TcwNLFUn2xiPtBg9ZNMYwU+kchQcmQYChls5qVHH9E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hMFS0A4s; arc=none smtp.client-ip=95.215.58.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hMFS0A4s"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783985726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=InV5x2tAQr64Dz1ODAuqp4ESdrQV5BGDt/M0iINGBP8=;
	b=hMFS0A4s+uSY8xvnRJyPutJ9wNOhFyepzoNmmsArDLNUi4Wu0OD7B7kQVNFANHcoDieK7w
	+sydJyvIGJkGo2jM2bQSPVFTCtwYt4X+LabN9p+gQsUq99egxagZqsy2MyfxSsiqst5ZrW
	mHA06ypWKCxxk7yzefdKmgQrV+lUcog=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Andy Lutomirski <luto@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thorsten Blum <thorsten.blum@linux.dev>
Subject: [PATCH RESEND 1/3] x86/vdso: Use kstrtouint() to validate vdso= boot parameter
Date: Tue, 14 Jul 2026 01:34:24 +0200
Message-ID: <20260713233422.127348-6-thorsten.blum@linux.dev>
In-Reply-To: <20260713233422.127348-5-thorsten.blum@linux.dev>
References: <20260713233422.127348-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=thorsten.blum@linux.dev; h=from:subject; bh=HEu+JS6e27UdjH9GE1tmfLwcK6GeSAghtWAw9k3aF4Y=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmhZVzc272KbzFURAU+1PBRj9m0fvMJ7lM1684pJTbvk JOazrGro5SFQYyLQVZMkeXBrB8zfEtrKjeZROyEmcPKBDKEgYtTACYiacvI0P1ZVca255b4/ABp s2cLZkc/uv6lbUPio/i9Ae7J73IOvWNkODGHwYpx/2+fGYvfHeq+xbJ/H79E1p9r1raCZ7MkvrI c5gIA
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the deprecated simple_strtoul() with kstrtouint() when parsing
the vdso= boot parameter.

simple_strtoul() accepts partial input and silently converts invalid
input to 0. Use kstrtouint() for strict input validation instead and
reject malformed input. Accept only 0 and 1; warn and disable vDSO
support otherwise.

kstrtouint() converts the input string directly to an unsigned int,
avoiding an implicit conversion when assigning to vdso64_enabled.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/x86/entry/vdso/vma.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/arch/x86/entry/vdso/vma.c b/arch/x86/entry/vdso/vma.c
index 18dfd80a81ef..c5c09c28388e 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -299,7 +299,11 @@ bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
 #ifdef CONFIG_X86_64
 static __init int vdso_setup(char *s)
 {
-	vdso64_enabled = simple_strtoul(s, NULL, 0);
+	if (kstrtouint(s, 0, &vdso64_enabled) || vdso64_enabled > 1) {
+		pr_warn("vdso= values other than 0 and 1 are invalid; vdso disabled\n");
+		vdso64_enabled = 0;
+	}
+
 	return 1;
 }
 __setup("vdso=", vdso_setup);
