Received: from mail-vs1-f97.google.com (mail-vs1-f97.google.com [209.85.217.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708132F8EAC
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 04:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654619; cv=none; b=enEKI24JUNR+GeZ6q0jo016h8zs3wgNwj3M4YF668dBrk8zz6LiPVj4y6RJm6ckSIiAthCzJqyUkEx4UqQyAUjKeAA1gn+u78sVr54V+sW24PFoy59/CpDFnOVU3sRf8TQhRFVOH5hcpRIifcXdn3X7nQRQBvIQ24mxCqhwgZyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654619; c=relaxed/simple;
	bh=rUzQo5KHgL8B6Zt2JDNYEUTyvIMbiqzpi4ZnuUlZBBY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h3z0+hxvyGSgjbubzRCvat6jAItzu7HjBJdiDLOTuII5vCWlXIOWiII9id5P+jJEbEihE4C4/GQIAbvcVAIb+k3kpcyx/avbEhCD9AS3Dfs6fktCSCvVh9PfPjyCsSL4a75xSBoleOhF4gn0rfNLmPZP5bSmhSKbTLEr8wA5wT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=bjNTJ6w2; arc=none smtp.client-ip=209.85.217.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="bjNTJ6w2"
Received: by mail-vs1-f97.google.com with SMTP id ada2fe7eead31-7a5e4d366a5so114920137.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 21:03:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654615; x=1791259415;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CV8TEMBP6IF+2lIlzYCpg42JpAwpPVBphnZX2jCaOFA=;
        b=NKTqzqMO7XfhlHhbAgYxR/+9VfqnR0l+eADKoU0jxu5AvkrbwMsE+J7vmrdWKrXY2A
         QXJq39QgGgq3rlFipIqoYPZq1frEv2s0QrO4aofCKO28+bSBWKIhQ6DPyTXMOLNyBfhB
         U5GZUgg92yVlxSreJkrRFletLaON7SzGWluV/6mjGdPTOFQN0xlMOG57I8IEbsfmzjoJ
         APp0hPq3VSCHABVylZvODV2iPR5TmS7pG8m9Y9I7UhjMDq7+gi8Hlgp01TMXOtaihYbx
         B3XMCKEQFk7HjkRDTYBAbP846naWaZ0ZBNytDZ66u4/o0huMLdMnDlQCK5HP61dvpprM
         W27w==
X-Forwarded-Encrypted: i=1; AKwUvBzqRPpuyeJj5tq0nq5sx9IFfUrMvACP++HEi9onT+XB7cOnp52ng/jFgLaZe7q+xR0Csji7EMSJfY8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL/Dn+6IhpkTWsvWX0X+sHHZ2T9ABuuPrrdrmhnyCB5dFVQeC3b
	ylRIiooeqegoe7ZtCfZy9z7Y8grUfJFy77mBQri3FZ/aG+BooBOGIl9puu9R0ENz0gaqgFiixqu
	fwISvGJL4Fv9opyaMsUhbi+Ln2AFHufSw5Het/FLQkKW/YgkJnLD23Z4+d1z0cc86OqJx14Wj6h
	3ajlI0LAe4T4L4q8Ip3U/Toegd1P8SpLoYFDOEahWTC35savTIX7Vla/7mkkNapb8K++RYC1zFB
	tcP0VubPcVo
X-Gm-Gg: AYBFou0KEN9A2CIL94zdkJ46gLn3Vy96jcjTQCGchz6xpkhLUB0QsPYG0s5uyktk+0K
	HOjwwlZ10LcfS8uGEDzATCZoLuHaVoiTo7pahBUs9icCxMqXpoBk2S3MJN0D33aWk+OUdzrKBSE
	yq4dpB843CQnP17tD6CTeUWn9UgzRZzaJOXMiyOoRqBp6Qzogli0o5yqfFepx9mrPjppONixbNn
	EWoaDMyo1zFgfMCs5giri/97LxxQcl2aCDRoA3LwTwLcE5zbGis4ko/xzwrmQJHOhGWIOCbhqbM
	fgXQUI2DLTrM37ZTm1qDlYONDTAJNtH5Eeu5GrACIZPT5DCtLIu9Z71ZWDnpcDWe05R4crghcmR
	DeWwb7grjIh0RLila+gS8i1pjqg+Hi3kRn/jE/D7+xCFQmK7viwAfC49jbXEwzev2RxHNeIoJyj
	z8aqgFN8ShAgBr87m+V15yXgrZC7uCkIWI
X-Received: by 2002:a05:6102:160f:b0:7a2:7ccd:280d with SMTP id ada2fe7eead31-7af1b55f9b9mr5140529137.8.1790654614631;
        Mon, 28 Sep 2026 21:03:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-18.dlp.protect.broadcom.com. [144.49.247.18])
        by smtp-relay.gmail.com with ESMTPS id a1e0cc1a2514c-986ec6f3686sm746686241.7.2026.09.28.21.03.33
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-33baaba6371so14197679eec.1
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 21:03:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654613; x=1791259413; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CV8TEMBP6IF+2lIlzYCpg42JpAwpPVBphnZX2jCaOFA=;
        b=bjNTJ6w2pB+RY4tIwDLWRoyh1TKrkkXYnJifKxI+xNDRyGSYEEyzU0N9RA+k3C96ay
         vaJH3Uc2C7BTr+aeuOpbnzDtG1rLZuoXoQ9TZEm3yZzzX+cYXeIlE51x0XqJMlI+lXq0
         upWhIuZH+I939ODjwf+SW6xGOiFUHEmKFwSeY=
X-Forwarded-Encrypted: i=1; AKwUvBzNuQ2RGRbdZuBUqEdaYb3IyQhTACEASQbmB8CdCKmTcGqVhVcNAg5Aa4SoiGK4qmYgn+iVDre7yv0=@vger.kernel.org
X-Received: by 2002:a05:7301:4d0b:b0:341:d191:b838 with SMTP id 5a478bee46e88-34272562bc0mr12611760eec.31.1790654612899;
        Mon, 28 Sep 2026 21:03:32 -0700 (PDT)
X-Received: by 2002:a05:7301:4d0b:b0:341:d191:b838 with SMTP id 5a478bee46e88-34272562bc0mr12611727eec.31.1790654612252;
        Mon, 28 Sep 2026 21:03:32 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:29 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Kiryl Shutsemau <kas@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	x86@kernel.org,
	Dennis Zhou <dennis@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Rick Edgecombe <rick.p.edgecombe@intel.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Wei Liu <wei.liu@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	Christoph Lameter <cl@gentwo.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Bo Gan <bo.gan@broadcom.com>,
	linux-mm@kvack.org,
	linux-arch@vger.kernel.org,
	linux-coco@lists.linux.dev,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	"K. Y. Srinivasan" <kys@microsoft.com>,
	Haiyang Zhang <haiyangz@microsoft.com>,
	Long Li <longli@microsoft.com>,
	Andy Lutomirski <luto@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Ashish Kalra <ashish.kalra@amd.com>
Subject: [PATCH v2 5/6] x86/tdx: Support early sharing of kernel data
Date: Tue, 29 Sep 2026 00:02:54 -0400
Message-ID: <20260929040256.543767-6-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260929040256.543767-1-zack.rusin@broadcom.com>
References: <20260929040256.543767-1-zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Share pages before the page allocator is available, after both their
direct-map and kernel-image mappings have been made shared. Preserve
initial contents in a private scratch page, matching the AMD early helper,
and use the existing MapGPA path and shared-page accounting.

UP per-CPU data has an image alias. Drop shared image mappings before
kexec converts their backing pages to private through the direct map.

Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/r/aqqGUAX65s4LdJkr@thinkstation
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/coco/tdx/tdx.c | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/arch/x86/coco/tdx/tdx.c b/arch/x86/coco/tdx/tdx.c
index f904a636d449..4a683e9eafc3 100644
--- a/arch/x86/coco/tdx/tdx.c
+++ b/arch/x86/coco/tdx/tdx.c
@@ -4,6 +4,7 @@
 #undef pr_fmt
 #define pr_fmt(fmt)     "tdx: " fmt
 
+#include <linux/cacheflush.h>
 #include <linux/cpufeature.h>
 #include <linux/export.h>
 #include <linux/io.h>
@@ -18,6 +19,7 @@
 #include <asm/paravirt_types.h>
 #include <asm/pgtable.h>
+#include <asm/sections.h>
 #include <asm/set_memory.h>
 #include <asm/traps.h>
 
 /* MMIO direction */
@@ -1006,6 +1008,23 @@ static int tdx_enc_status_change_finish(unsigned long vaddr, int numpages,
 	return 0;
 }
 
+static char tdx_early_buffer[PAGE_SIZE] __initdata __aligned(PAGE_SIZE);
+
+static int __init tdx_early_decrypt_page(unsigned long addr, unsigned long alias)
+{
+	void *buffer = __va(__pa_symbol(tdx_early_buffer));
+	int ret;
+
+	memcpy(buffer, (void *)addr, PAGE_SIZE);
+	clflush_cache_range((void *)addr, PAGE_SIZE);
+	early_set_page_decrypted(addr, alias);
+	ret = tdx_enc_status_change_finish(addr, 1, false);
+	if (ret)
+		return ret;
+	memcpy((void *)addr, buffer, PAGE_SIZE);
+	return 0;
+}
+
 /* Stop new private<->shared conversions */
 static void tdx_kexec_begin(void)
 {
@@ -1033,6 +1052,18 @@ static void tdx_kexec_finish(void)
 
 	lockdep_assert_irqs_disabled();
 
+	/* Drop image aliases before the direct-map walk makes pages private. */
+	addr = (unsigned long)_text;
+	while (addr < _brk_end) {
+		unsigned int level;
+		pte_t *pte = lookup_address(addr, &level);
+
+		if (pte && pte_decrypted(*pte))
+			set_pte(pte, __pte(0));
+		addr = (addr & page_level_mask(level)) + page_level_size(level);
+	}
+	__flush_tlb_all();
+
 	addr = PAGE_OFFSET;
 	end  = PAGE_OFFSET + get_max_mapped();
 
@@ -1160,6 +1191,7 @@ void __init tdx_early_init(void)
 	 */
 	x86_platform.guest.enc_status_change_prepare = tdx_enc_status_change_prepare;
 	x86_platform.guest.enc_status_change_finish  = tdx_enc_status_change_finish;
+	x86_init.paging.early_decrypt_page = tdx_early_decrypt_page;
 
 	x86_platform.guest.enc_cache_flush_required  = tdx_cache_flush_required;
 	x86_platform.guest.enc_tlb_flush_required    = tdx_tlb_flush_required;
-- 
2.53.0

