Received: from mail-ot1-f97.google.com (mail-ot1-f97.google.com [209.85.210.97])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA493E3176
	for <linux-doc@vger.kernel.org>; Tue, 29 Sep 2026 04:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.97
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790654601; cv=none; b=SY+vw6gpfnDMn7Frn11X5dFY2dX25zm8tkSo56opUYeMv98HZBGqJG2NnEhyoWwa6av0pWFc1hSiWehS5dwje3PGshbkyEoxfK8R2q/4uiFEWspmQImaK69MFG8as9g+wN7KALiPT57PUSyGxAEf9yG1BS0/FfChi0hZ/nNp2Pc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790654601; c=relaxed/simple;
	bh=hwzN7aNlJ2wxS9ZWnQFgLPxc8hv3AZhs4ribMUFVqWY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jw0PBt7MCjHTqVRxp3VXxDYBLQS3o0ZrY6prLPt9oaeW0jpmCQW8XuQlLKpSSjjXDkW/Kv8N1vrW6iwRrGcKUEmeWTSCVEkdBNxD8nU3dBUi/bgFH1WogL+zRPUNanw3K8HboH128PPw9jpRMsg4NwFMwFFjHFlKWmPAngs1P5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=J2pFgVBZ; arc=none smtp.client-ip=209.85.210.97
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="J2pFgVBZ"
Received: by mail-ot1-f97.google.com with SMTP id 46e09a7af769-7f432ac553fso2715726a34.3
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 21:03:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790654598; x=1791259398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wf4+8fPuDTBmj6DTA0OwZVxSovvEfEo3g6LDTXOjhgc=;
        b=brSuTiW7S1Yc2QUB/z8zXyU1yBjrgW+UEH7ZwASuPtuLgiUtR8tNFpGLDhmYvmElJl
         EOYfSorTLWwQC9uqQmKBtBUV1bsciKwWfTH6kdz4EQSStkStdSEoWd5dDHToNFiDZEmi
         93LWgGsNLWr8VitPZIlzonvyf4lQt3jlJgDNPnarYplO5ZDy6KrkuAewiASRouSdKU46
         f7jprZkp4tY846aznO9S58gxRysyk4BOillL7YnHteitMMLKr+aPSte0yh0ie0Io5Bsp
         BC6o/h7JX5FdSDjrg/9XJy2NpjmTLyZFJJnsVroE5EYM1rGgSPRZrYafGyvjfvNg2TGO
         ouLg==
X-Forwarded-Encrypted: i=1; AKwUvBznoe5tklBVulnsiBISrUu7z1+9JZEHFW2nkeFmWNCoKa1ti6eb4/Cx4cAtAmvJvhjTOAVl9zfUKVw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKiSB2cdvqCzxxblmtAfWIGe0xWCYzaSG/Vlgeu98CED6OjCtae
	3YAh2IXX5miCKDs7AaPnbHPJIyFM7ltgqPpwDT/l0GE7b4INgTAeJUV5Gcyliu/uZoI6RuSQ6JB
	+76s39ytlDiH2bRK+tHWBQJ+B0fbtOtgnF0TGJOxykig5TLFOL9M40tQem72No4TU4AEIat9DZB
	puGg8UyKCUGgSuOhUetUSP21uLNiEJtJFFHpOIHbe6y4SfJExB2IXm4qIQD+ILtm0LQwOAsq3t0
	Odz+HdA79df
X-Gm-Gg: AYBFou29NvbDESTAa78jwUPlET/bWs8JiKtAC6y1IvOXEKvTj3KEO+ri2dh6LOsnMKY
	5hTOQoRib+1q60B9q2lgmZyCq7ME+ib04KIaqvCAQ9E9aL5FYsS/Sl+ETRVWE2lNjL6f2jKzeJy
	Pbk5ed9TRQkJkOlsbRFo267/SOA+V0+fp9IyCRC0KNkRkBL6v7JklvpME4hhaVISBkZn8fjer5l
	fv509mTgBs9uM69STLvl14y8E1lHmYnl5UR2C07OApHr+Zjky/f1YjcfFOHY/j1TAJXneKScPFP
	7t/++u6+wUGm/9UZ5E8hG58wkpXZ64i7Sp5mlXyljcdgRAov32tlbvcMjGmS2n/i+ZFgiTesIgy
	U+4bB6dSZqc2HvxFploCB/6PADA95wdt3OkJKPYDEJPC0zId04JQK1VqIJl5ToJgGTh8l3slHGY
	bDJSiYWE07RGGz9AlpNnR4OBN6gEK3EyW6aQ8=
X-Received: by 2002:a05:6871:c949:b0:494:b4f2:3d8e with SMTP id 586e51a60fabf-494b4f23ee4mr3948347fac.27.1790654597981;
        Mon, 28 Sep 2026 21:03:17 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 586e51a60fabf-49aa46653cbsm25204fac.9.2026.09.28.21.03.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 21:03:17 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-342217d8d53so12162510eec.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 21:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790654595; x=1791259395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wf4+8fPuDTBmj6DTA0OwZVxSovvEfEo3g6LDTXOjhgc=;
        b=J2pFgVBZHM/fAYXBIqK0/AZxOq/6YSGIL/qKx8D5ACk4THDMXEn+y7CpCzCt8uAWke
         pNQfQ3sU+6Kte5+o+X5ITV615SfqaNQ48T1lR1rglF81HJ+VpKIsc+yJM51g9tVqknPx
         w3kg3JpDvpGwrexpl/4noHhn+sLyrJTgrO3HA=
X-Forwarded-Encrypted: i=1; AKwUvBwnqjYO56d4qDvGP3PEpX+uCi6qHVHpTPnv3arBsITNeuRSQjLe2qsmFva007jEatmKJdyr0QmoLgM=@vger.kernel.org
X-Received: by 2002:a05:7300:c8cc:b0:33b:a4dc:d5e1 with SMTP id 5a478bee46e88-3426fbbe36fmr11863802eec.8.1790654595148;
        Mon, 28 Sep 2026 21:03:15 -0700 (PDT)
X-Received: by 2002:a05:7300:c8cc:b0:33b:a4dc:d5e1 with SMTP id 5a478bee46e88-3426fbbe36fmr11863746eec.8.1790654594365;
        Mon, 28 Sep 2026 21:03:14 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-347323f5a7esm10952571eec.15.2026.09.28.21.03.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 21:03:12 -0700 (PDT)
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
Subject: [PATCH v2 2/6] percpu: Bound decrypted storage for all x86 encrypted guests
Date: Tue, 29 Sep 2026 00:02:51 -0400
Message-ID: <20260929040256.543767-3-zack.rusin@broadcom.com>
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

TDX also needs shared per-CPU buffers. Use X86_MEM_ENCRYPT for their
definition and placement, and provide page-aligned boundaries so the
architecture can convert each CPU's whole section before registration.

Define the boundaries in the SMP template or UP data as appropriate.
Drop the unused DECLARE_PER_CPU_DECRYPTED() macro.

Suggested-by: Kiryl Shutsemau <kas@kernel.org>
Link: https://lore.kernel.org/r/aqqGUAX65s4LdJkr@thinkstation
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 include/asm-generic/vmlinux.lds.h | 12 ++++++++----
 include/linux/percpu-defs.h       |  7 ++-----
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
index 64bc2bfdd2ec..145fcdbbe9db 100644
--- a/include/asm-generic/vmlinux.lds.h
+++ b/include/asm-generic/vmlinux.lds.h
@@ -368,11 +368,13 @@
 /*
  * .data section
  */
-#if defined(CONFIG_AMD_MEM_ENCRYPT) && !defined(CONFIG_SMP)
+#if defined(CONFIG_X86_MEM_ENCRYPT) && !defined(CONFIG_SMP)
 #define DATA_DECRYPTED							\
 	. = ALIGN(PAGE_SIZE);						\
+	__start_percpu_decrypted = .;					\
 	*(.data..decrypted)						\
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(PAGE_SIZE);						\
+	__end_percpu_decrypted = .;
 #else
 #define DATA_DECRYPTED	*(.data..decrypted)
 #endif
@@ -1022,11 +1024,13 @@
  * Note: We use a separate section so that only this section gets
  * decrypted to avoid exposing more than we wish.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
+#if defined(CONFIG_X86_MEM_ENCRYPT) && defined(CONFIG_SMP)
 #define PERCPU_DECRYPTED_SECTION					\
 	. = ALIGN(PAGE_SIZE);						\
+	__start_percpu_decrypted = .;					\
 	*(.data..percpu..decrypted)					\
-	. = ALIGN(PAGE_SIZE);
+	. = ALIGN(PAGE_SIZE);						\
+	__end_percpu_decrypted = .;
 #else
 #define PERCPU_DECRYPTED_SECTION
 #endif
diff --git a/include/linux/percpu-defs.h b/include/linux/percpu-defs.h
index dbe3267a0a13..fdb666a1b4de 100644
--- a/include/linux/percpu-defs.h
+++ b/include/linux/percpu-defs.h
@@ -169,13 +169,10 @@
 	DEFINE_PER_CPU_SECTION(type, name, "..read_mostly")
 
 /*
- * Declaration/definition used for per-CPU variables that should be accessed
+ * Definition used for built-in per-CPU variables that should be accessed
  * as decrypted when memory encryption is enabled in the guest.
  */
-#ifdef CONFIG_AMD_MEM_ENCRYPT
-#define DECLARE_PER_CPU_DECRYPTED(type, name)				\
-	DECLARE_PER_CPU_SECTION(type, name, "..decrypted")
-
+#ifdef CONFIG_X86_MEM_ENCRYPT
 #define DEFINE_PER_CPU_DECRYPTED(type, name)				\
 	DEFINE_PER_CPU_SECTION(type, name, "..decrypted")
 #else
-- 
2.53.0

