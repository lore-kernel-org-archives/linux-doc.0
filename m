Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3438F636
	for <linux-doc@vger.kernel.org>; Sat, 17 Oct 2026 01:56:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792202177; cv=none; b=OzL3WaGKOICx8eXgQBz8l1c1hh5DYXe6WPOlqfaWl6X1pv5QRybBx20wfN9JOkGMcXlrczBgJ5NIx4uOU1iqp0ULOg37CM3OeR6Bi67O3l2KH1wGewS4eZYGuhk30cZkQHlQjJ+y88qtWx2PdFAGoqzx88ij2B7Ly3YXUPXNwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792202177; c=relaxed/simple;
	bh=Wz3AynSRouhjdOCDf3ZwA/+MVGmp61qIW0ierhI97O4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ImiyfSe5mV6R3tlnanaWGr0Gs6P/aPP0gV3k0JZ69eQPNtWlT23ohdT/yBnZSO30lEYTWJojPNLTIsnJIQf13IO/0VJss/f1NCfBBqORW5zZm25aWa7PbP2Uc/MdOfDnOfBOwC7rAxc65fm4Ny3urpXpiXs4gElIVjDyzGqZxtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=il3L/+7I; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="il3L/+7I"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-8ab432273c5so4301927b3.3
        for <linux-doc@vger.kernel.org>; Fri, 16 Oct 2026 18:56:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792202174; x=1792806974; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UaqrgWMwy8tCpgosdqPhUPyluySo43hO1tIzzayAGmQ=;
        b=il3L/+7I7mxcfA2VvtNp+Jf+OvDkvjfA2HjoQm2XTSdD2tkB6Rh+bRZ1cozRDmuDja
         KJpsrehU8XvBPvfyAJJDB81GbXLb18c/k7uRc8Wb87RI2BSWKhcu/GQZf0bEnbbMrrCu
         6iXLBB5cq6oWufex4z5NC0C08oxlxmJ7U1zWuAOWSnb/fzMUv7zgh9qFPMHxDYlPvgOh
         jzIGBAU+03/PLFmcNatsACOf0fcBjKzNPk0XkHhxfRp9sOzHHnG5UBKNE7ITK7dmRl+K
         wR8qsoRP8sRuiqWHZW5qXvlrndWG2jy5NkVHzCqLOPTTj00OSGOFZ4D94wQf2m2C0LYl
         FCPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792202174; x=1792806974;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UaqrgWMwy8tCpgosdqPhUPyluySo43hO1tIzzayAGmQ=;
        b=BHrkm5TLVz3CwjPGVKYw4TMM0vhncv8Y8YCAfdXTn/Qco0YVXEHQTP6BUijf7QllRR
         OkFG3hsLWhbx45yfu3mThdE0DpLffSlfw8tIlwArGSanxWWkfv5edi/F7FLRUATX2XXl
         Lqmphj0mbEFINnxenRyIqgYNOUFNVfLYUPiqxG8Qe6Sz5g2UEqKwxFUxdFUUXCrLB+aH
         U56iZdg8bNOnDM8J+Qq4Bbt1r1we9WEmhm4IHv27grGI/Z3BgvUdp9OucJtdGRyHrLCK
         Lh0o8fe4Iiv38jxJchaTNTo0a0dGrYGLNTOiNNvLeh9BlDV/nJ931RHLZxJiw+5eM36h
         fp6g==
X-Forwarded-Encrypted: i=1; AKwUvBw6nDSoCAGkIaochViIhN78UKK4DEAg5qjKfQh+xUDpTN7nwobsV0STg7/jamCYvLD1SLr9JFz478c=@vger.kernel.org
X-Gm-Message-State: AFq9FYLFvbpTDOI/58VAkpKINRg96yXorRPrYnXf2Exd8qGc56cWd/r5
	irb86GQv+8FcOLQwRHHIMzZJykS8DFBmSZFe/FEUd8ZfKhOm1o/DwY5AunDc1g==
X-Gm-Gg: AYBFou2v1VmHzwPMA99Rfcc25EU10sSAYy6H7KW4l2o809PioJnqCG6a5O/TuzyuiLR
	CVqY1Fq6eoN+Lgt92R+3N1HZZQJI3daJbDPe0+G7oSeTRKz5A4tCSqLx1LNMQ2FjXRw2pp0NO5e
	PX7PBinY57WPrIZHoO3tUMMdgb2X5Ft9dyXrAQo0XNQlSLqX1mJAkGwKu1WP6maD0HNGJ0x4VFM
	9tB6D/7/HzYcJk1PmFSiJ5ZA2O641pXPxkHafotbAb6BTutAJ8hlosgocvFXzc3A7EtPg0Eeirh
	8MZgRb1sXL8dt6Kl2+bc6FT7q4s/zMY6ZNAjh5tWvNvHKloZuc4blIqueYzfHI5uYPrEp1rj5D/
	dDdhSzifFbgUOXuq26OiLDhkxdIp5YvzCG0LkD9Nzbp3LVp50cD9ly6mrAtJQd+MRvStO2L9b7L
	Hpon8HBtw8M2JWfJlH9jMcnHM5hc8RXa9TRaQ7coshMtlWk3MtwkxkbYi2TSiZjnczT6NJMFLua
	gvlA0aUKnmTjGDWpHwfd8KHYvy1dVf2GymUsvqZ5l8bCJBR/f1ylQT2OW5mAluyDB45Bl8YX24d
	sc4givisqz335FlyBz1F9ksFUooY
X-Received: by 2002:a05:690c:6087:b0:8af:511e:3b11 with SMTP id 00721157ae682-8b0f21eadb4mr6904497b3.48.1792202174247;
        Fri, 16 Oct 2026 18:56:14 -0700 (PDT)
Received: from localhost (108-93-236-139.lightspeed.chtnsc.sbcglobal.net. [108.93.236.139])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b0e590f2b0sm16451427b3.32.2026.10.16.18.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Oct 2026 18:56:12 -0700 (PDT)
From: Matt Turner <mattst88@gmail.com>
Date: Fri, 16 Oct 2026 21:55:49 -0400
Subject: [PATCH v2 3/5] alpha: use user_stack_pointer() in KSTK_ESP() and
 dump_elf_thread()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261016-alpha-perf-regs-v3-v2-3-17654742226a@gmail.com>
References: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
In-Reply-To: <20261016-alpha-perf-regs-v3-v2-0-17654742226a@gmail.com>
To: Richard Henderson <richard.henderson@linaro.org>, 
 Magnus Lindholm <linmag7@gmail.com>
Cc: linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-perf-users@vger.kernel.org, 
 Ian Rogers <irogers@google.com>, Matt Turner <mattst88@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1497; i=mattst88@gmail.com;
 h=from:subject:message-id; bh=Wz3AynSRouhjdOCDf3ZwA/+MVGmp61qIW0ierhI97O4=;
 b=owGbwMvMwCW25rVmCc8sv+mMp9WSGLIuXV18oaedwXBtcNY/PU7ZgKh3l60cBdk2iay4Iudgv
 OkJ332Wjo8sDGJcDDPFFFni1iuyzGrbsdTntPQvmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 EMjQMYqHyOkxaGQWF5emFummFRQ55OWXJJZk5ucV6+UXpOYVpBfopWWmlWRk5BcVpwKN0MtLLTF
 1dXQzMjQwsXS0MHOycDQ1cXZ2MnRyc3R0dnUysjQ3MXC2dDRxtTRn4OIUgLkmnYeR4e+2bUnzM4
 v8Feeqlt+s8DNP0IyQ03RvC3j369Ff4yc3mBkZdtYfW9l3r164yKCWw/lqS/eTvUU7frZzbxKyf
 2CyIr6KEQA=
X-Developer-Key: i=mattst88@gmail.com; a=openpgp;
 fpr=3BB639E56F861FA2E86505690FDD682D974CA72A

Both open-code the same PCB lookup.

Assisted-by: Claude:claude-opus-5-5
Tested-by: Magnus Lindholm <linmag7@gmail.com>
Reviewed-by: Magnus Lindholm <linmag7@gmail.com>
Acked-by: Ian Rogers <irogers@google.com>
Signed-off-by: Matt Turner <mattst88@gmail.com>
---
 arch/alpha/include/asm/processor.h | 3 +--
 arch/alpha/kernel/process.c        | 2 +-
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/alpha/include/asm/processor.h b/arch/alpha/include/asm/processor.h
index c461a26d47b3..73251cd671e0 100644
--- a/arch/alpha/include/asm/processor.h
+++ b/arch/alpha/include/asm/processor.h
@@ -43,8 +43,7 @@ unsigned long __get_wchan(struct task_struct *p);
 
 #define KSTK_EIP(tsk) (task_pt_regs(tsk)->pc)
 
-#define KSTK_ESP(tsk) \
-  ((tsk) == current ? rdusp() : task_thread_info(tsk)->pcb.usp)
+#define KSTK_ESP(tsk) user_stack_pointer(task_pt_regs(tsk))
 
 #define cpu_relax()	barrier()
 
diff --git a/arch/alpha/kernel/process.c b/arch/alpha/kernel/process.c
index 06522451f018..7861c9e767b7 100644
--- a/arch/alpha/kernel/process.c
+++ b/arch/alpha/kernel/process.c
@@ -318,7 +318,7 @@ dump_elf_thread(elf_greg_t *dest, struct pt_regs *pt, struct thread_info *ti)
 	dest[27] = pt->r27;
 	dest[28] = pt->r28;
 	dest[29] = pt->gp;
-	dest[30] = ti == current_thread_info() ? rdusp() : ti->pcb.usp;
+	dest[30] = user_stack_pointer(pt);
 	dest[31] = pt->pc;
 
 	/* Once upon a time this was the PS value.  Which is stupid

-- 
2.55.0

