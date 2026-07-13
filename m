Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5E723B813E
	for <linux-doc@vger.kernel.org>; Mon, 13 Jul 2026 23:35:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985732; cv=none; b=Ct5i03mFcG8QmP/a50Dqv410Cw0QygTubfbkVOXqLb4KufshGCahQHNvOkihHw0apPABiC0O5FL+16PVzHetgvYN2kN14AG6lVrPAyWwAub/P+U/UeFJqb/tJJh4hcIsAlf6qVmCkrHrupUZA+eOS7ydsIgCIpUg0DHTbZK3ygE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985732; c=relaxed/simple;
	bh=Jhyde+qVXhwYKT+jfqAojkE5MDc+zEv4Q/4BXY9Wek4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=B0CiGCyf5jJ+YrWrUMV75pDoYzjhu740OvoHM0U4u4H8A5qJnrsrVQflWTnKix4pzAaQMOSAe7BZ7aw69u0WkL97DVCSSU/bIsTPXDx2HOmzWemviBeocVAcuQqX3naKgaPdc2cYipjnYwCaT7XBvwzXFKu9TGrJ0ZhhetU18h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=us1bp+RP; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="us1bp+RP"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783985727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PH+ap9Z9jRyHTeU0JE3+i1OoIv68/HHTxd5g9JcEcPs=;
	b=us1bp+RPkonMUZZxUUEVxKxPBLUCgn2Q4dko7zeD5Is3wP17wEYbGzutlnb+UdysOScUJd
	IvpYVdVlqDP8f0sK4aVrd5YA07PmdOEq7NSZ0fe7u+jMVKSuKFkPiwqt1FxuxxEsOMKlEx
	65Q3idmHPoUevsf0zPEDanbJ7BGNAlU=
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
Subject: [PATCH RESEND 2/3] x86/vdso: Use kstrtouint() to validate vdso32= boot parameter
Date: Tue, 14 Jul 2026 01:34:25 +0200
Message-ID: <20260713233422.127348-7-thorsten.blum@linux.dev>
In-Reply-To: <20260713233422.127348-5-thorsten.blum@linux.dev>
References: <20260713233422.127348-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1839; i=thorsten.blum@linux.dev; h=from:subject; bh=Jhyde+qVXhwYKT+jfqAojkE5MDc+zEv4Q/4BXY9Wek4=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmhZVzVHf2rE48VdrbOElj9hm9S1ErOSZdqP/31TJfWV zCZyhTWUcrCIMbFICumyPJg1o8ZvqU1lZtMInbCzGFlAhnCwMUpABOJtmT4H5WouPJrSt7yJXpi iUpigZtzRBoYbzr/kphtq3HjaPvJNEaGY9EP71oZy8WHv1jzb1WgYtSrvLy11r4eJtuyvT5ObZD nAgA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Replace the deprecated simple_strtoul() with kstrtouint() when parsing
the vdso32= boot parameter and its X86_32 vdso= alias.

simple_strtoul() accepts partial input and silently converts invalid
input to 0. Use kstrtouint() for strict input validation instead and
reject malformed input. Accept only 0 and 1; warn and disable vDSO
support otherwise.

kstrtouint() converts the input string directly to an unsigned int,
avoiding an implicit conversion when assigning to vdso32_enabled.

Update the vdso32= handler comment to reflect the supported values.

Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/x86/entry/vdso/vdso32-setup.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/arch/x86/entry/vdso/vdso32-setup.c b/arch/x86/entry/vdso/vdso32-setup.c
index 8894013eea1d..5f3e548ebf19 100644
--- a/arch/x86/entry/vdso/vdso32-setup.c
+++ b/arch/x86/entry/vdso/vdso32-setup.c
@@ -30,10 +30,8 @@ unsigned int __read_mostly vdso32_enabled = VDSO_DEFAULT;
 
 static int __init vdso32_setup(char *s)
 {
-	vdso32_enabled = simple_strtoul(s, NULL, 0);
-
-	if (vdso32_enabled > 1) {
-		pr_warn("vdso32 values other than 0 and 1 are no longer allowed; vdso disabled\n");
+	if (kstrtouint(s, 0, &vdso32_enabled) || vdso32_enabled > 1) {
+		pr_warn("vdso32= values other than 0 and 1 are invalid; vdso disabled\n");
 		vdso32_enabled = 0;
 	}
 
@@ -41,9 +39,9 @@ static int __init vdso32_setup(char *s)
 }
 
 /*
- * For consistency, the argument vdso32=[012] affects the 32-bit vDSO
+ * For consistency, the argument vdso32=[01] affects the 32-bit vDSO
  * behavior on both 64-bit and 32-bit kernels.
- * On 32-bit kernels, vdso=[012] means the same thing.
+ * On 32-bit kernels, vdso=[01] means the same thing.
  */
 __setup("vdso32=", vdso32_setup);
 
