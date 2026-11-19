Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795053002;
	b=SN9bMX5uchcb5l1cbUCPI+iOsUV8/9NcFnGPktL5+NgSY/3iT0Rzt4hab0p0oQNWmQsa
	 OD6EUYqsHACzY3bsX82m7TJ5uNkyklg5668aLdzQGV/Nvpz/3lLI/4x6nKM1/SKfdEZyv
	 RPgWXCe4tNnH/3bnYMlOH4ZFVaGGo1yWVY/QqVSmqF6ugvb85mBfZCEmiT50gJhvHiee5
	 uiLtUwVURsCZC/EPDIZVwySKl/MX0z1iSftuVMG3gcYwCneSfkQUbwl/cpraWXsOzbeVZ
	 VAbcNsGtsOWcsDLacENtGjw6ddzDSLLiHAjHUHioC+qg0iagqvO8k+ls63wBwDI038g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795053002;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zMbXDwiwhPzho9zRreMRs+AlQUufycAfiHIq9zZ6xHk=;
	b=VTiUk43d0DOSKMmLYcOiX7p4+pjWuzp7p4U7610uD6IYgqZibMDzRv9HFiI5FRCfjCfm
	 j64umANm/Evc0dHtbvQggO7N5PuIUa2djdi8dx8X9CM/77wS55zxjNFheoOD+2Lv5eM8V
	 0SrqIyJjxB2dddEhxHcmQBQFFjYyvwU88mCe1ClPOClDiDM3qoJbbFmGpBIa/XNiFWG4D
	 lopEPAitMyeurQUhfU4ppl//+vX9aSgZV9uP3QVk+AQW6lFJmxyKS4hRZjLxsN7bt0N3r
	 ox5MFdjpp4KBOXoB0gS34hlZQl3Dv/8FP9SLLUClqOpe40ss0QkcgeV3riJhqpwoFYQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4e1mIsb;
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BA13606A325;
	Thu, 19 Nov 2026 01:50:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2BA13606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=b4e1mIsb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=zMbXDwiwhPzho9zRreMRs+AlQUufycAfiHIq9zZ6xHk=; b=b4e1mIsbpOlMv01At+Wp4iM+m4
	7ug4tTWIl67Uod42CUrTQ+eNtWySwkn2aafL0L0ndamWEM5WzCAUvRj0gxxzm42xVMT0wLJWUu6K/
	qcfkMY+NpoN12zTZZkMRZPMcmk0hhL3qa/CnwfKLW3SkXstSHEQKT2a8NX1SX9VIO4Ve/hnIME4D7
	Krn5vaj4swtGFHPj9w9qynVzICfvXWruvXq2VCF8B2JzZMs7Xg8OYOM0Ym+km+VfUBGqwfMyDSjta
	DQHL+JhfQ5CKkui029SdBP5FzZqULOXPpwuXuCJ/+YtYIJLY7gPXrNI17SsMVPL53s+AkTgF3hz7E
	FbpdMb/A==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xTrHj-0000000AebB-3FLL;
	Thu, 19 Nov 2026 01:49:59 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] docs: kernel-parameters: correct a typo
Date: Wed, 18 Nov 2026 17:49:57 -0800
Message-ID: <20261119014957.213349-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.1
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Mark a kernel parameter as EARLY instead of ENABLE.

I saw this "ENABLE" and didn't make any sense of it, unless
it's just a typo for "EARLY".

Fixes: 600716592a3a ("doc: Add EARLY flag to early-parsed kernel boot parameters")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>
Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org

 Documentation/admin-guide/kernel-parameters.txt |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

--- linux-next-20261118.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20261118/Documentation/admin-guide/kernel-parameters.txt
@@ -5556,7 +5556,7 @@ Kernel parameters
 			execution priority.
 
 	ppc_strict_facility_enable
-			[PPC,ENABLE] This option catches any kernel floating point,
+			[PPC,EARLY] This option catches any kernel floating point,
 			Altivec, VSX and SPE outside of regions specifically
 			allowed (eg kernel_enable_fpu()/kernel_disable_fpu()).
 			There is some performance impact when enabling this.
