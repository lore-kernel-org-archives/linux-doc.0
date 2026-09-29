Received: from mail-pl1-f228.google.com (mail-pl1-f228.google.com [209.85.214.228])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820983DDDAC
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 04:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.228
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654597; cv=none; b=NmSyCA3TP96ylU15VUqFYPlJVXUDLCvTzic3o05Zp38EyKsUp6aAeUpyPQjV3mJNxD7UikW8dLhgrUw2lW4ff75sDV5MMwkG+8e+w22XiZlP/QnC21dnO2x20hpJNJyal+hp3jtmHjoK9TFIlszZ+fCJ5Cj0R/DWJEcg1onac2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654597; c=relaxed/simple;
	bh=wfxZIiWhDP3+oFPqhctMkZvaOYbsAemH2FvdQjYIm9k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVy1XaQK51GH+YfYIWCVssihhNf5EGNGK1EkAKmMJtfmdLnM3NIJFwn3Fkrm206VaKCU5MNvlKR2tu5u9HYcb5vpVTyDv2T8/t3rVEP4Qf3pXNvQPE94plzQ7qLrr8A0Rfjo7I063ydB41Fc2FwlX0Pjgk48AEdavQdIPzID5Mk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=fhItftJA; arc=none smtp.client-ip=209.85.214.228
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="fhItftJA"
Received: by mail-pl1-f228.google.com with SMTP id d9443c01a7336-2e2ae46a9fdso5055045ad.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 21:03:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654595; x=1791259395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=H1QC7xolz0zAjMGBpXSuPAgwwtLmlzIMyVrA3dvqh9k=;
        b=rx+mfYhHZDmimjELLXe6P6V3VsW2qOqa2mrAwFyPgjDJUybU4xldNDNs0TAqAEUMmy
         0gCqaen+rqJwxZMe8QrDEIQsm5pcjFnFFCci+TtPP099PPGW7TEHpN3Li5/8mI09fuBZ
         7Zin2WAhHKgZzVRym1Ma7r8UQAfNi3J5Vibec+VDQeA0iuwu2qT2nrKcJNt9zthM4sM7
         nMR5XVWiNM37M/fEindJA2zhGYt28V+FNB+Xb43wzIs57/U64SBsTUNE+PCzbtyIsqBs
         k0kmqJ08C3Ul6svTDxIJ7rhry53v6Phq9a2bo+kIczEfi6eC2OqQMD2QMeF8TVMxOBSM
         V3FA==
X-Forwarded-Encrypted: i=1; AKwUvByshc6TXkExmn+82I9j5emOyPk6J7uLTDVSR8AR3pbZw+Wm/qTRjhillJJZfAI8lKPfQiEuSdez+P8=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ3zhNyzclmpS84GWz7ABfjDx+3C8CzHKxrcyRQhrwCk5ueLmOG
	pXqnlDzxb6bX6sUlh92StkTQZzLf1vquuTZWnxg6RniLgQcC8m8MZn5XYM0cRwr89xhjX6Ca4O5
	RwevpWTIzWzQuHD4P1wGKmb5EX2vzvpDjUZYbZ60TgvDlYI+aBfI8B0TKw33yl0eXaGzj1MM0dG
	sG2usr/HEGq/C2IrmylXvjRLmC0+32k/Bb6kCXWfUm7j2TbjL0wTwtb9S2rimsenXsDV6zh8P8l
	D/k9lDDoBmB
X-Gm-Gg: AYBFou06ygOABRSXs3xdtfZxyDLF61DyhIYqehuQ+HiYImDodMB8tY13Cc7sa7NLYfT
	JoIMhthzk3qXHGWxpdNKOkecgfFU5pUgIDGj0yp79lAb3THXHCnwNTXG8dDmGnnAWkDZQY6BXxS
	tdPbidU3NXxCf32lSEB1VbQ+kP+cqitd4EtOdRK4bnXactSe+isPBTETFIBCZ1XFdV+JBuZ/dMB
	OwSEGvNA1G7S1/UEq7qUtYnD0Z+5qLpSFaIUHfjTHvfIEJMxss4qST0F3y4ZnPYuycqCIN9O1A+
	8tzuq78t4e1urn3oou0looNr0PNnolCzEFrlZBEXwLzBvjzgyXq4Bk7lv2noqCvecYV9LhKMt51
	vgr+rstp/hkLKh2LpTXJ4frb6ZyLg252RhJ3IttPutvoEajArtyAedrYp6MNrVgggPsiCQ90pCw
	y8UzDKo3YpXtgEFODt401V2TuovsQsnoIfZso=
X-Received: by 2002:a17:90b:3a46:b0:3a2:b04e:8086 with SMTP id 98e67ed59e1d1-3a2b04e8389mr3155058a91.44.1790654594584;
        Mon, 28 Sep 2026 21:03:14 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3a497e9ab17sm1001838a91.3.2026.09.28.21.03.11
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:14 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-342217d8d53so12162282eec.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 21:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654590; x=1791259390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H1QC7xolz0zAjMGBpXSuPAgwwtLmlzIMyVrA3dvqh9k=;
        b=fhItftJAmbd5w4nLldXjYdujimhcBno2xM358LQIK+THcQYYx0bt6TiEyG7gjmcGLR
         tDCMg3L/hdbu05TXXFgxfWQdgxGwCtTmbKr/CGmO/TOVU0FLsjPHPaN7N110tbrJWY8/
         ADsyxvJ6pEHue+JcxGxeRU2wukWIvSLNR2IHg=
X-Forwarded-Encrypted: i=1; AKwUvBwcgO0Ny90HuOBsLO+L79zDhg7f3kZLESXOu1jwoh7QYZiLQK/92SrJnpyaADokk2iHPitAEUHq9As=@vger.kernel.org
X-Received: by 2002:a05:693c:88d7:20b0:344:c0fe:19ee with SMTP id 5a478bee46e88-344c0fe1acdmr7715271eec.14.1790654589514;
        Mon, 28 Sep 2026 21:03:09 -0700 (PDT)
X-Received: by 2002:a05:693c:88d7:20b0:344:c0fe:19ee with SMTP id 5a478bee46e88-344c0fe1acdmr7715216eec.14.1790654588762;
        Mon, 28 Sep 2026 21:03:08 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:06 -0700 (PDT)
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
Subject: [PATCH v2 1/6] percpu: Page-align decrypted data in UP kernels
Date: Tue, 29 Sep 2026 00:02:50 -0400
Message-ID: <20260929040256.543767-2-zack.rusin@broadcom.com>
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

Without SMP, DEFINE_PER_CPU_DECRYPTED() places variables in
.data..decrypted. Align both ends of that section so that changing a
variable's encryption attribute cannot expose unrelated kernel data.
Keep the section in permanent data, where UP variables are instantiated.

Fixes: 000f8870a47b ("vmlinux.lds.h: Fix placement of '.data..decrypted' section")
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index b2988aa12f66..64bc2bfdd2ec 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -368,10 +368,19 @@
 /*
  * .data section
  */
+#if defined(CONFIG_AMD_MEM_ENCRYPT) && !defined(CONFIG_SMP)
+#define DATA_DECRYPTED							\
+	. = ALIGN(PAGE_SIZE);						\
+	*(.data..decrypted)						\
+	. = ALIGN(PAGE_SIZE);
+#else
+#define DATA_DECRYPTED	*(.data..decrypted)
+#endif
+
 #define DATA_DATA							\
 	*(.xiptext)							\
 	*(DATA_MAIN)							\
-	*(.data..decrypted)						\
+	DATA_DECRYPTED							\
 	*(.ref.data)							\
 	*(.data..shared_aligned) /* percpu related */			\
 	*(.data..unlikely)						\
-- 
2.53.0

