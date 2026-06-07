Received: from out-177.mta0.migadu.com (out-177.mta0.migadu.com [91.218.175.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6882773D3
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780845525; cv=none; b=YsWGYVchmU605Ngs4pOKhtX+P64mN1yyrFIZRq6o4DTdxmLCqIA9AtgvIozXMCeioX3hPCgw7olxvQdqDjIbG2YpQI4GbTv7mzVgOb0KTuQbKFP3KReSDrAHr+8qYW+js4L7iO2HavVoX6vuFij6MiN+Uy+bBdAhlNwl2rg3y5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780845525; c=relaxed/simple;
	bh=bfMHrToJcqjgW+DnKHgtGJx3PrOXXiuYQXaob0KiPpQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aOigNCKI6rNMBj9ZRpG6WEDJuAsscO7SvXD1Z92XZu15qqID318IPt2ZsvH+vxUIW2n/yiK+gdQhj1TojHrOHnapOaA6nNp+eHAS51cJqBY64zLpJuSpdW+yEaznOHiCO+x9SC43iRafo3Akhl1stsl01uHBKQEWW+ezUtO93hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OCljjPMR; arc=none smtp.client-ip=91.218.175.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OCljjPMR"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1780845521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=AVnDiESh+x1DRYqYZbCBHy4sUn9oEX58Cf8ALyZWHeA=;
	b=OCljjPMR00HcmFwycoRDVGRUOFTDFHigrwxTY16SBe6EuHAAoZs15ITum/JZeIKsfsP3zB
	mx1yXJ33zCaN3FIzVLvteZp3lpUeYhshgychnVh1sgnTaiRoFQxosQXM1NUNTe4PqF6jQ1
	z7mr6sL12MBLNM5IPoHByLmT4K9tjJg=
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
Subject: [PATCH 1/3] x86/vdso: use kstrtouint() to validate vdso= boot parameter
Date: Sun,  7 Jun 2026 17:16:16 +0200
Message-ID: <20260607151614.79567-6-thorsten.blum@linux.dev>
In-Reply-To: <20260607151614.79567-5-thorsten.blum@linux.dev>
References: <20260607151614.79567-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1214; i=thorsten.blum@linux.dev; h=from:subject; bh=bfMHrToJcqjgW+DnKHgtGJx3PrOXXiuYQXaob0KiPpQ=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmq3R59P1+t4znM4pHxR/3O/P0nZvxZ/Wvh6/jPIT/7L R4eXjj9VkcpC4MYF4OsmCLLg1k/ZviW1lRuMonYCTOHlQlkCAMXpwBMRMKO4Z/ewnsevw0Uim1b 3PjTpc1k5p0Ilc9VUjuVOyV3DX966G2Gf5rrvt+/Yn/32cLWsPTP+oujEt62xzQ+X/iwbf21T6u luVkA
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
index d903bce24f15..b45549cd7acf 100644
--- a/arch/x86/entry/vdso/vma.c
+++ b/arch/x86/entry/vdso/vma.c
@@ -270,7 +270,11 @@ bool arch_syscall_is_vdso_sigreturn(struct pt_regs *regs)
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
