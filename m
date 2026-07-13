Received: from out-177.mta1.migadu.com (out-177.mta1.migadu.com [95.215.58.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A875A3B83E8;
	Mon, 13 Jul 2026 23:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783985741; cv=none; b=RIbAEDZdwg6ajnNWt4jMubJlZrYO5Yj28AjPeVENaPMxXXV7K1/U7/Gs6SCkReKUfaX1uufIiJfc3QYQlxBb8sxw0EU7lIgWliziYIJzAakrZJg7OzFITDuLMIcAUgvguHmDKnAk9dlDu9QqRxJtZC93UE9z3XKZn+L7Qlv3pfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783985741; c=relaxed/simple;
	bh=InC2Ob/G4nuEO2jCESpqrqfJ6O7kWO0SzBJV9ZyCYVs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PedNsKm+2siq2MmahqOjlbbj6LXV/+wXZwIENqs4sxvkj8OjSlElUhNMRS2l/ioxA7/CYfNO0tmQeLZzIlCNTxRl7h1x94QSiINVBF2Gr/LqGVwisVWpPa+1nOGWp3iqf70xSTA0Pyo7EGGfZ26PxmDUCOX8rGo++Srhv4eQN6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=edGOrYYn; arc=none smtp.client-ip=95.215.58.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="edGOrYYn"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783985730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cIwLEttMqxETjzLJiAGOPU3xmr3RXS2AuNjyPF/Tv1U=;
	b=edGOrYYnMWbgwgHbECxFlLMU6FTFPWsUtTY7Ze78K33GY+0rKfAWpPXN697ApaA7SbhpOk
	3ArG+Hl1HH4yZMDEbYJUKrrXElttftSM8/2qJpqaZrqWMQwrnHQt0lWcWA72HGoD7E/Ebz
	S2LHg14NYgXMLiQx1cKg8e3hBrfEJvc=
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
Subject: [PATCH RESEND 3/3] Documentation/arch/x86: Remove obsolete vdso32=2 compatibility note
Date: Tue, 14 Jul 2026 01:34:26 +0200
Message-ID: <20260713233422.127348-8-thorsten.blum@linux.dev>
In-Reply-To: <20260713233422.127348-5-thorsten.blum@linux.dev>
References: <20260713233422.127348-5-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1471; i=thorsten.blum@linux.dev; h=from:subject; bh=InC2Ob/G4nuEO2jCESpqrqfJ6O7kWO0SzBJV9ZyCYVs=; b=owGbwMvMwCUWt7pQ4caZUj3G02pJDFmhZVxO33WF1pWyfPGRLg6L+Jgla277cWbJNT49gzybh PWGk007SlkYxLgYZMUUWR7M+jHDt7SmcpNJxE6YOaxMIEMYuDgFYCIJbxj+mR5W/KQtL6sftlrh eKbzon227aLfn5ncbjaf/MVWUHT3A0aGj8fNbRincnII8t6xPrpt78WYdYKONmvCl07k4c3prz/ GCQA=
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Commit b0b49f2673f0 ("x86, vdso: Remove compat vdso support") removed
compat vDSO support and documented vdso32=2 as an alias for vdso32=0.

However, since commit c06989da39cd ("x86/vdso: Ensure vdso32_enabled
gets set to valid values only"), vdso32_setup() accepts only 0 and 1.

Remove the obsolete vdso32=2 compatibility note and document only the
supported values.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 Documentation/admin-guide/kernel-parameters.txt | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b5493a7f8f22..8a55ec37d066 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -8260,15 +8260,12 @@ Kernel parameters
 
 	vdso32=		[X86] Control the 32-bit vDSO
 			vdso32=1: enable 32-bit VDSO
-			vdso32=0 or vdso32=2: disable 32-bit VDSO
+			vdso32=0: disable 32-bit VDSO
 
 			See the help text for CONFIG_COMPAT_VDSO for more
 			details.  If CONFIG_COMPAT_VDSO is set, the default is
 			vdso32=0; otherwise, the default is vdso32=1.
 
-			For compatibility with older kernels, vdso32=2 is an
-			alias for vdso32=0.
-
 			Try vdso32=0 if you encounter an error that says:
 			dl_main: Assertion `(void *) ph->p_vaddr == _rtld_local._dl_sysinfo_dso' failed!
 
