Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78AE03B5314
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 19:29:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636601; cv=none; b=dRWchq8QAp3ayKGYypyGLKLl9OFVb0QUQw2qYdcnWEfIeO/Y2r6Qjr5n+B9tNV69pEqdygiKIFyCruf2W724qIm22A4vo/ZS5mCvIjp3aKyvWVVbRM0UBX/uiVEuSspm/Cqr2VEoxd0A0maezHpS06YXP47GZwIgoEqRySzcwzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636601; c=relaxed/simple;
	bh=viFijJiUhOJEOjb4FCpGEYRsqqRivUhUbJK/aUiKGrY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=RcCyOhKMQ50vE47B3DGO8B/LodVGRz7SZ0kKh+bKvGZMLpU9w6GqgG3eeqg9AlmN83x7iqtnQamMcagsX1DstBve4rlX0PbvQZoYXy3f+xnRrgwgD2fs1Lj9Vk7siD6kFY1bPqthhSah/j1vXlyafEUQZmk1S9UHYZ68NGdPdos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jscuox0h; arc=none smtp.client-ip=209.85.128.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jscuox0h"
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-836c4474028so22487087b3.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 12:29:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636597; x=1789241397; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ygh7AiGeWs6lyLt2xt2E6KSyS8AtAFMza59CShkrWvo=;
        b=jscuox0hqvZEanx0bJ4s99jvCOFqTTnnHyZ78NABjer5/oxM8oiN/+oyiz5azZhHOr
         E/hKU/UqES5M1all8l38o8K0VctueGrU6kTMYhFgamoLW7SX2hn/+hMsBSM+5ZROL3FA
         W9H331AWuMnfp1yFob8EvYSG0IWSwfbQ+jnbd+dhJKLQqK0CtQ5oi7fGEpO7Ny0CeAYq
         LuzL7CPsRmGQ2Gq5SiHo+FzdHJhu6Opqli59PIpsKxmpcjjoEm+NEHEAU5aOzAZ/NJY9
         cTq/RYbl65Zrkyb193TQSvNimKZena049U4UU20729gjdX6k9AirQ5a3JbRxZuX4+Nsp
         8yVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636597; x=1789241397;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ygh7AiGeWs6lyLt2xt2E6KSyS8AtAFMza59CShkrWvo=;
        b=R3bg1FQI5/Oxb7jpWI5SFk9z91WHLGryVTBqmx9uKj9nKuvgUTuN/TqaQEvW3xWqUv
         b6yAOy7iEjj8qVAi/UYirDIZUcplRMgRclPD/glybbcuFe90lWnoNEVJA5Xw4ekRnq6p
         VLMpxze1t3v7E1vajBEnPfVqSwWR4zJbdVXOEyjCaat0aH4oOTrTBzwtBreEixGSHq8m
         h9q4k1FuttSyPnrvP5t6f8M2JrpH5ZPFcy2SyosTOvienqsCqJbPoOGWkXBBYV6vFuPF
         QT6+0DHgyQofEgZCorftSjvybXOpdDx3L/jX08f1ARIg6p7tQvRWA6HmFf79mSt8DWU9
         Yo5g==
X-Forwarded-Encrypted: i=1; AKwUvByquLsBZvCIe1BDrrgH1B8OC3hBASaoy93vgtb7SQNHrL9kIJ9+s/szI9Bcx/za0rMO+QhfTf0xR00=@vger.kernel.org
X-Gm-Message-State: AFuF++lx+lTyfataEf09PIk701l1lipSS3rzwVlysMB6IqWRo2O0W0kL
	Ob9HIu5IOddgLEWIZplaSN7k7pIlpAVarPQ+/5UeEa1kSuZL/NKrnQ2F
X-Gm-Gg: AYBFou3pOy5qAJeHW1FUg4AEfw1p2/zSkG8bkans1o1AJp/MQEdB/FPnASgLriHIjZ2
	KXRNrzAYY/BMhRRx1fh3Q3RZep7E7NdcXbw72ha0Txgc6CNAm5jkYYgPlIjyhZ0sOgFDPJu/BUQ
	W1nGzooONexBf88a/2Rqk9z99xrVYvJnrxAMwq6vzabAk8sEtAvnqg9v5TP5hMR/26u+e4a3pg6
	OT7JeVgDF823ukHJ3Vpfhb5UxXt6Clz8d3+4EEYtTRWFJvnpDlgKlZofCjc52SkUTiOQFXpmPJ9
	FFZ92SIUYMEUdeo36iZxLLG3FRNpwPsulkCBoFsLa0e9aBSPEhTH3eGbiCINftgJpYXm/d4ue30
	+wdTN3dltU0lkYsH9gsYsYgov4AKEal4+H/VnUxu6adO7TEs2JnRn6ywAlpJfcVOnV32vRH+vFC
	GTaGqDJG3wF+3t/axt3Mid5EBk14vyQM2vSNONcrWYDVdg4rwLo/5ETmf8y4rl
X-Received: by 2002:a05:690c:dc3:b0:873:5bb2:6c03 with SMTP id 00721157ae682-8735bb26d04mr24162197b3.45.1788636597114;
        Sat, 05 Sep 2026 12:29:57 -0700 (PDT)
Received: from localhost ([2600:1702:7a90:6f9f:8bc4:8aec:108d:7a04])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8714befac64sm43433107b3.47.2026.09.05.12.29.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Sep 2026 12:29:56 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Sat, 05 Sep 2026 15:29:35 -0400
Subject: [PATCH v2 14/22] alpha: select ARCH_HAS_DEBUG_VM_PGTABLE
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260905-arch-kconfig-options-v2-v2-14-83e8245761a2@gmail.com>
References: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
In-Reply-To: <20260905-arch-kconfig-options-v2-v2-0-83e8245761a2@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>, Kees Cook <kees@kernel.org>, 
 Marco Elver <elver@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
 Andrey Ryabinin <ryabinin.a.a@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 kasan-dev@googlegroups.com, linux-hardening@vger.kernel.org, 
 linux-doc@vger.kernel.org, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1827; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=viFijJiUhOJEOjb4FCpGEYRsqqRivUhUbJK/aUiKGrY=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLLm5E7hNFtoYzplxRY+63dfFkRlxigY5Z+pYXovri+cV
 7xw42+xjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLnGYwfD/5JPs6xFXF
 VL1/x651rI9jRr64e26RN3ctcvuGvq9mTZxwCG/0kznryZkpTO8CgiQUjr9v/wqXP//M96ZbR+Q
 xUz2//onTwA
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

CONFIG_DEBUG_VM_PGTABLE runs a boot-time self test over the page table
helpers: the protection bit accessors, pte_modify(), the swap entry
encoding including the exclusive marker, and, where the architecture
supports them, the huge page helpers.  Alpha implements everything the
test needs for a three-level page table without huge page support.

Assisted-by: Claude:claude-opus-5
Signed-off-by: Matt Turner <mattst88@gmail.com>

Also mark Alpha as "ok" in the debug-vm-pgtable feature matrix.
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
---
 Documentation/features/debug/debug-vm-pgtable/arch-support.txt | 2 +-
 arch/alpha/Kconfig                                             | 1 +
 2 files changed, 2 insertions(+), 1 deletion(-)

diff --git a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
index 156687a7436d..b4e2374fe201 100644
--- a/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
+++ b/Documentation/features/debug/debug-vm-pgtable/arch-support.txt
@@ -6,7 +6,7 @@
     -----------------------
     |         arch |status|
     -----------------------
-    |       alpha: | TODO |
+    |       alpha: |  ok  |
     |         arc: |  ok  |
     |         arm: | TODO |
     |       arm64: |  ok  |
diff --git a/arch/alpha/Kconfig b/arch/alpha/Kconfig
index da4ec8399517..4bd5e913baaf 100644
--- a/arch/alpha/Kconfig
+++ b/arch/alpha/Kconfig
@@ -6,6 +6,7 @@ config ALPHA
 	select HAVE_SYSCALL_TRACEPOINTS
 	select ARCH_32BIT_USTAT_F_TINODE
 	select ARCH_HAS_CURRENT_STACK_POINTER
+	select ARCH_HAS_DEBUG_VM_PGTABLE
 	select ARCH_HAS_DMA_OPS if PCI
 	select ARCH_HAS_FAST_MULTIPLIER
 	select ARCH_HAS_GCOV_PROFILE_ALL

-- 
2.54.0

