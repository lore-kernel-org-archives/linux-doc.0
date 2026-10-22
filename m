Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792646247;
	b=cfQkjJMZFIfbwW1/KVR+4WDv5m351UlTfCm2HIBAPUi1QtLXxf3ujjEaKhPqMP9OmNRP
	 WHWByoaWiNc1V3xLxg3f1t5zU0ksNGVBkCbxg7NTJ4kLNBcd1e56TPLWRhd2W9EjcnId+
	 uYfT2iTXtXXFeNLCuM5qiNWZf1mKp56i87i06rPCxOZYVwzIaVvwtOv6It6BJs/D2ElNU
	 /Z4COSJQX2s3w4fFe6lOSOgNh/x4d5/izUHFfopGeeZDqw8S5gXRIgrJw/hqBicx1wGAD
	 hfff7oCTkQ4Mr5x277MZn1v5T7QBCrsjbzwWfGYuiL2nV30WxYuvziwzE6pSPd8H/gQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792646247;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
	b=YMsUAU1nAZnWWEwQFqhY9X5fkbSILzb6/avEtP0RHWTAk0Vq3hTcMnETgrXBjuXbn5N4
	 SI74uaIDBhFW6hDjLJz5koWVF5ZOuQ1rltGvqeQ9MxxbOdWFWBRVqu6zEnq9FWoKBFQl6
	 kyxF4TjiTZAt4I722zH/E7Ht5KKOwQJ+ShFXJstOlCpSkTMqU3GwLPpX/FZ2dYiAvsrAZ
	 B5XUyUmuczt+9Zg0oTzjJWypfiqNnxMRxAyMlvu1K6n7WOyeILJnUQbgjwDkerIQ5aWL/
	 ncdaNgotciuDmVSRYo1gHitRfbyaDJ44w4nVPdf5NpkVMLipX4EHXmCXk2HwyegZkBw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LqkWBcSc;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C0860A2609
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:17:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E5C0860A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=LqkWBcSc
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a207b02a2cso1088115e9.1
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:17:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792646245; x=1793251045; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=LqkWBcScPpks/4WfMW3Pd7NIY0qc2VVqJZxuI23Sxdqcvct8QTowqDeNQwpvDAMz0h
         eQGDp45mamYyDt+QdYyimZG0l+6wjwZWocX64RLTbkrALUJIkvv4bLa21W/k5rJW4qTo
         2lDbVMzpLf+gRcvw7Iw6NkhDUaquxhX6dcjJrUdX6e3XYWdqqjF+PAW77EUj3qzZBowx
         +U7vr3uSOjkNS2k2URv6C64Zy2UzfOqLLwDah8oseX5M/rKrTZRV4rsaIBV65/8gol64
         D44ejnTi7pe7aYQkkfL+P3W+dP1ECSUum0vK8dbQHOSHPku7HP9/RGGWpbMTq4ETL2EE
         LKYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792646245; x=1793251045;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OcKo2jdE/+qreu4/thhFC1vb4R1orDdFtElaGu2Tq3o=;
        b=2e+epL+SDnp4Whdic0n3Z+rWEgdfVNYluMDTn2Mp31AVJm6mtQWC5tk+67d0/W28QM
         Zyi79bOfcD0vb6RzABYGsVNh4FPwKhM/Wo1WKohrQ2FM4HOB3i6pPJnwytNAVZJt7x+2
         Ppmy/8Iga2wZpdL/UVYxbLhU/LB0zkIGbGrqSJ5efzBc9mT/2puuilCyj8OrtSuCxkol
         qByahdYd4xfCm5JPOUZ1HGNfPOaPfoVjHe2dT1an/EmHx8pJh+sQyfjDH+luRgejpw9s
         l7Aw2DCShEcOXa1vrarQBtZVTOB0MFS1ka0/HEXI7tC21ZG3/yuKr6a8GZ/iUSGOa1j4
         HOGw==
X-Forwarded-Encrypted: i=1; AKwUvBzlVQ28zsqE3Gu+kv53dkVFIFFsXahqxa3WuYCidu7Psh4yvbbKzF32wFV37XHJuMBIOgjypZ27r6E=@vger.kernel.org
X-Gm-Message-State: AFq9FYIziBl+Bf3rZIiv3ER7rMpNzTueK5ahXoqxWO26dIVTyf3t00+D
	lJCT1EHrtuRydi9NQs3g51bqWVIgAWjp8u2U0s92YPhpMRqktDnPxlmH
X-Gm-Gg: AYBFou0aI17eZTh2eKhO2bmWN8IPc0qiIyONOaA2ou5rSBHOytK4ev9u9sJlRVZRBg2
	48ppBZY5C02t31jPj4DZum64n3kU4VtebnIxi2hJnetYEkpcwDSzMEbwbueYuGDvG44VgntCOqL
	Fz3/pgyY6IfOXYN6d4u3l4YSz06TPu75xKH6SArat3XhVAczbA3yJg+Gz4U9NE/I644tATu+nDA
	1Qm8HNbqN6a79ZYOL2j4A4KFkHtwME/WPe4m9Ixv6xf/apWog1fqEczuUnUJxLXf6R/Akbo1wJ0
	+bqzdjkuyfzmTZ6eRwkMMYxe4M05Plaq30DwXRg+uMoUztpnYzNI1mirs3kwyuXw11Atk69v4iG
	Ww71ndXSHZxpOM7ZrNduMEO02JdXdVcv1m8Ua7YK20LJbUCFguMdX5JrFj5B5h6SdeBujlA0g2T
	hu15CrEMQS/FQLMzLtvx7RlFfRJ48r9r8/IVH2GhHLQm/wKlNyns5JSHbLqzpY0eMEPMaNSwIHW
	Aedz1Ke7aksJOQnjmjqySwxr1RMAR/bWX3jjZBrHxBmlq7A4ZaNLRRUlJQgnI2uvEIx/XhM6x2k
	wWkR2ez+5sGuMFglB+sC9a69obagmZOJFgJZlDe36URc9ziPJSUPGHmp0EZEaKYy8Mwv4EO9+Ju
	uohamTQ2OxiPyDpfSkz55PwRafE1DBEIF8mlGSSu0fRZDcEfC5A6gtDRXVxM=
X-Received: by 2002:a05:600c:4f50:b0:4a1:e6c5:e44c with SMTP id 5b1f17b1804b1-4a1fdb079ebmr98097255e9.10.1792646245241;
        Wed, 21 Oct 2026 22:17:25 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1fd0f4427sm90362275e9.3.2026.10.21.22.17.22
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:17:24 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 04/12] entry: Skip inactive IRQ-return reschedule calls
Date: Thu, 22 Oct 2026 07:16:46 +0200
Message-Id: <20261022051654.79224-5-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022051654.79224-1-kmehltretter@gmail.com>
References: <20261022051654.79224-1-kmehltretter@gmail.com>
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

irqentry_exit_to_kernel_mode_preempt() calls the dynamic reschedule helper
when preemption is enabled even if the preempt count is nonzero. The helper
returns immediately, but its call and return remain traceable after hardirq
context has been removed.

Check the preempt count in the inline caller and avoid the inactive call.
Keep the existing check in the helper for its other callers. This does not
change whether IRQ return schedules.

Assisted-by: LLM
---
 include/linux/irq-entry-common.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 3ee80e926a17a..24c2b9fdff4f4 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -487,7 +487,7 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
 	if (regs_irqs_disabled(regs) || state.exit_rcu)
 		return;
 
-	if (IS_ENABLED(CONFIG_PREEMPTION))
+	if (IS_ENABLED(CONFIG_PREEMPTION) && !preempt_count())
 		irqentry_exit_cond_resched();
 }
 
-- 
2.39.5 (Apple Git-154)

