Received: from mail-pj2-f19.google.com (mail-pj2-f19.google.com [74.125.227.147])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1B0F48C41F
	for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 11:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.147
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789989482; cv=none; b=XmAf5tWHu8+wtDdVnT/g3KI9n0Sf6eE92/Ubpo1qrAg018Ehol0N0ZDbkzmLRQMgDhcZXNrGyqYx1nj0xMdPpthvrOvZuhpbNrhMTM2dotkTeodf9KN5nCmeheGc5E3e5HcxVdt0a3Iwj1z8QruJhmiROMuosQjHgO4vu7z4aqY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789989482; c=relaxed/simple;
	bh=l9cbhsR6oIcRYl+I2g1jCIa/WhsXA/dARjMt3kDigl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N5wHJJOrk7UvEFhHDyiWklWYOC6SpnnDmbf9T7gu5vCcpF+vS1WZdmcAn6WwOBtulqNix6AZJwLj7u3E4NS5STU/K/tpywYQizwxE6Iar48FfPMRCL7W88owyA+GtNxPvkno3CNs4BEzivT38XlWj3V+JMvhprpjOj0wXuN96ao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=jenZNvHq; arc=none smtp.client-ip=74.125.227.147
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="jenZNvHq"
Received: by mail-pj2-f19.google.com with SMTP id d9443c01a7336-2db18fe433fso24493185ad.2
        for <linux-doc@vger.kernel.org>; Mon, 21 Sep 2026 04:18:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789989480; x=1790594280; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=;
        b=jenZNvHqVOq7BaieRqOS48emO4JyrhHQYVA7mvNKIVsRb9xdgaFAuGWgOJ0jtPM/fz
         CDWx2AzGibPiBkf061LwHxisZe3a5er5mhYD5O/SkFdRSrTQqb+AlSC1MeXgsrudt8tZ
         l6WDHrPlKNKPQs2rOrrbq26ULBR5NrniVkaLoyCqASd3DcQlJnmQzTJUtK1irRf9uykt
         yFJhseZWPbkOgJEc9Wk+LIi18irvlwcoDUgo+bYys+cXGDemJseATnaJzPjN5slYCA4b
         zG6l/cBs/OoyR3mN0q3LhlPWvP8uN29mfufGnxdQQYjEM3qnt1eaKONzCK26SMzNZ6IR
         xHkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789989480; x=1790594280;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jS32Dx5IynGZ/Y/2aGGAGztAdcoBdPlUNApcd4RXZUY=;
        b=ArVY0JMut5Bshf2zQazfTx55VEj1agpmfuoqI5L7tdjVCn1i+64aan95/0pZB/pn19
         lLQese9wjvmsaYyTu0qfQIWrafBDsFyddR+8p8vNLZKbI/1u5IswE9hkaZPhoXhBpIMJ
         59iZ9bmPgyH9boL1L2Xxdeq+VA5WaT3eU22n/3+Zz18K6RnVhW6mYavFifxnU6Y4TAOo
         tvFvRKTBjcRVkbr7WhNITWs5/BjJOmnUQDU1PYAS98f0hoqtEqzx29eBx1a7ItfrQfx4
         tq9/XpbWBNsOapS0qr3l4ysZWh2hx0ja4W3cNlVYyOuU8MJt6zmwi14NG4sWGyze2TPt
         tenA==
X-Forwarded-Encrypted: i=1; AKwUvByIEkMkjUs793xBVjBmpA+NYCCgF4ZVoHc8VseaPdlbZDBnGGbjfmWuM6Q6Ree22hdNs6eiEZ8qTmM=@vger.kernel.org
X-Gm-Message-State: AFuF++k737EtamWgKUWglo2OQsS32/t28FVm0TGWNB2o1iw8iCKOL5yx
	VGQwQk7R8lPbo/cIiSQGwTH47CyZtPuL1smB4gKlvAAgemnXezsFzNdp+ygps+oGMo4=
X-Gm-Gg: AYBFou00jqR5m+CAjrgoSW4rdpV8yfO3USOZGHBJ1ZzGEys0ll9FY2uebBmdsJ1zjTw
	6cqxVJkmXTjZ8Bta0zQQMI9wFbtl4jOkUZU7QNk5bsCWXYTsstm6yF5DCugUnnE2reCeiEd0GEw
	AIJmP3WjPXYfXhzqQV7K4on28mHElCtUfDJI0JGy6BVJG2hLSTf6uuQlWnu47C0QavD+LMeCH9z
	xyBs7h0ftHERMxW8BW2npzJGM+JgLHt21S7M4Qg33IcQ29RaqjyxZej3MlWZ0hJoBSM9JKTog8a
	7BmyWrabNzY30/dSDS3xNkzZ8zen+F7bFTUAMCcRsRIlJSf2W4VqOwUbVgrRWpBf17HP9rDBf2N
	ey5VDhO0BhkyC3/kEm2zO6LyuYFaSh1HhQ4UptXTtJygLFPYJmEm3XcD3ekXnAO8d+OJvzYe9Vn
	rKgjyWGrYYLH3I3FRyuhKWsW/40XXinXDVcsAJCTOSbjTwND/RHfQ5JQSS/A1SC32vi9BmKVY1v
	7TUmyJ00ip3sPfmTx8wcML0afz+1BcjqIw=
X-Received: by 2002:a17:903:1112:b0:2dd:c053:c20a with SMTP id d9443c01a7336-2ddc053c2a1mr103690755ad.38.1789989479599;
        Mon, 21 Sep 2026 04:17:59 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([240e:694:e20:401::8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc17ba651sm31831125ad.53.2026.09.21.04.17.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 21 Sep 2026 04:17:59 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup@brainfault.org>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Yuanzhu <yuanzhu@bytedance.com>,
	Yicong Yang <yang.yicong@picoheart.com>,
	Susheng Yang <yang.susheng@zte.com.cn>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v10 RESEND 6/9] perf: RISC-V: support callchains with SSE delivery
Date: Mon, 21 Sep 2026 19:15:03 +0800
Message-ID: <270f3bcd3a9933c8be59492ae4d7c6ff2414d7d7.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
References: <cover.1789974241.git.zhangzhanpeng.jasper@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

PMU overflow delivery through SSE enters Linux with a synthetic supervisor
context on a dedicated event stack. The perf unwinder must use the context
interrupted by the overflow rather than treating the SSE handler frame as
the sampled frame.

Use the interrupted pt_regs published by the RISC-V SSE entry path. Walk a
kernel callchain only when the interrupted PC, SP, and frame pointer are
consistent with the current task stack. For sensitive entry windows and
IRQ stacks whose bounds cannot be proven, retain the interrupted PC without
following an unsafe frame chain.

User callchains continue through the existing nofault RISC-V user unwinder.
If hstatus.SPV says the interrupted context was a guest, do not interpret
the guest stack through the host address space.

DWARF callchains additionally copy a raw user stack. The generic
arch_perf_out_copy_user() implementation can take an exception-table
handled fault when a source page is not resident. Repeated nested faults
from the SSE handler can corrupt the interrupted kernel context under load.

Provide an SSE-specific RISC-V copy path. Verify that the active page table
belongs to current, use fast-only GUP to acquire each resident source page
without falling back to a faulting slow path, and copy through the kernel
mapping while holding the page reference. Stop at the first unavailable
page and preserve perf's existing truncated-user-stack semantics. Keep the
generic in-atomic user copy unchanged outside an SSE handler.

Susheng Yang reported this failure with perf callchain workloads.

Reported-by: Susheng Yang <yang.susheng@zte.com.cn>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/include/asm/perf_event.h |  10 ++
 arch/riscv/kernel/perf_callchain.c  | 142 ++++++++++++++++++++++++++++
 2 files changed, 152 insertions(+)

diff --git a/arch/riscv/include/asm/perf_event.h b/arch/riscv/include/asm/perf_event.h
index bcc928fd3785..ddc404794751 100644
--- a/arch/riscv/include/asm/perf_event.h
+++ b/arch/riscv/include/asm/perf_event.h
@@ -18,6 +18,16 @@
 	(regs)->sp = current_stack_pointer; \
 	(regs)->status = SR_PP; \
 }
+
+#ifdef CONFIG_RISCV_SBI_SSE
+/*
+ * Raw user-stack sampling can run in the NMI-like SSE context. Route it
+ * through an implementation that does not fault on a non-resident page.
+ */
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n);
+#define arch_perf_out_copy_user riscv_perf_out_copy_user
+#endif
 #endif
 
 #endif /* _ASM_RISCV_PERF_EVENT_H */
diff --git a/arch/riscv/kernel/perf_callchain.c b/arch/riscv/kernel/perf_callchain.c
index b465bc9eb870..ec75689c7aec 100644
--- a/arch/riscv/kernel/perf_callchain.c
+++ b/arch/riscv/kernel/perf_callchain.c
@@ -1,9 +1,15 @@
 // SPDX-License-Identifier: GPL-2.0
 /* Copyright (C) 2019 Hangzhou C-SKY Microsystems co.,ltd. */
 
+#include <linux/kallsyms.h>
+#include <linux/mm.h>
 #include <linux/perf_event.h>
+#include <linux/sched/task_stack.h>
+#include <linux/thread_info.h>
 #include <linux/uaccess.h>
 
+#include <asm/csr.h>
+#include <asm/sse.h>
 #include <asm/stacktrace.h>
 
 static bool fill_callchain(void *entry, unsigned long pc)
@@ -11,6 +17,128 @@ static bool fill_callchain(void *entry, unsigned long pc)
 	return perf_callchain_store(entry, pc) == 0;
 }
 
+#ifdef CONFIG_RISCV_SBI_SSE
+static bool sse_addr_on_task_stack(unsigned long addr, unsigned long size)
+{
+	unsigned long end = addr + size;
+	unsigned long stack;
+
+	if (end < addr)
+		return false;
+
+	stack = (unsigned long)task_stack_page(current);
+	if (addr >= stack && end <= stack + THREAD_SIZE)
+		return true;
+
+	return false;
+}
+
+static bool sse_kernel_regs_safe(struct pt_regs *regs)
+{
+	unsigned long fp = frame_pointer(regs);
+	unsigned long pc = instruction_pointer(regs);
+	unsigned long sp = user_stack_pointer(regs);
+
+	if (!__kernel_text_address(pc))
+		return false;
+	if (!sse_addr_on_task_stack(sp, sizeof(unsigned long)))
+		return false;
+	if (fp < sizeof(struct stackframe))
+		return false;
+
+	return sse_addr_on_task_stack(fp - sizeof(struct stackframe),
+				      sizeof(struct stackframe));
+}
+
+static bool sse_callchain_is_guest(const struct riscv_sse_interrupted_context *context)
+{
+	return context && (context->hstatus & HSTATUS_SPV);
+}
+
+static bool sse_callchain_kernel(struct perf_callchain_entry_ctx *entry,
+				 struct pt_regs *regs)
+{
+	const struct riscv_sse_interrupted_context *context;
+	unsigned long pc;
+
+	context = riscv_sse_get_interrupted_context();
+	if (!context || context->regs != regs)
+		return false;
+
+	/* A guest stack cannot be walked using the host kernel address space. */
+	if (sse_callchain_is_guest(context))
+		return true;
+
+	if (user_mode(regs))
+		return true;
+
+	if (sse_kernel_regs_safe(regs)) {
+		walk_stackframe(NULL, regs, fill_callchain, entry);
+		return true;
+	}
+
+	/*
+	 * Keep the sample useful for sensitive entry paths and IRQ stacks. The
+	 * generic walker does not take explicit IRQ stack bounds, and its
+	 * THREAD_SIZE alignment assumption fails for non-vmapped IRQ stacks.
+	 * Conservatively avoid walking IRQ stacks in every configuration.
+	 */
+	pc = instruction_pointer(regs);
+	if (__kernel_text_address(pc))
+		perf_callchain_store(entry, pc);
+
+	return true;
+}
+
+unsigned long riscv_perf_out_copy_user(void *dst, const void *src,
+				       unsigned long n)
+{
+	unsigned long addr = (unsigned long)src;
+	unsigned long copied = 0;
+
+	/* Keep the generic fast path unchanged outside an SSE handler. */
+	if (!riscv_sse_get_interrupted_context()) {
+		unsigned long ret;
+
+		pagefault_disable();
+		ret = __copy_from_user_inatomic(dst, src, n);
+		pagefault_enable();
+		return ret;
+	}
+
+	if (!access_ok(src, n))
+		return n;
+
+	/* Do not sample user memory through an unrelated active page table. */
+	if (!current->mm ||
+	    (csr_read(CSR_SATP) & SATP_PPN) != virt_to_pfn(current->mm->pgd))
+		return n;
+
+	while (copied < n) {
+		unsigned long offset = offset_in_page(addr);
+		unsigned long chunk = min(n - copied, PAGE_SIZE - offset);
+		struct page *page;
+
+		/*
+		 * Fast-only GUP cannot fault. This follows perf_virt_to_phys():
+		 * local interrupts remain disabled throughout SSE processing, so a
+		 * concurrent unmap cannot complete its TLB teardown before this
+		 * temporary reference is put.
+		 */
+		if (!get_user_page_fast_only(addr, 0, &page))
+			break;
+
+		memcpy((char *)dst + copied,
+		       (char *)page_address(page) + offset, chunk);
+		put_page(page);
+		addr += chunk;
+		copied += chunk;
+	}
+
+	return n - copied;
+}
+#endif
+
 /*
  * This will be called when the target is in user mode
  * This function will only be called when we use
@@ -28,6 +156,15 @@ static bool fill_callchain(void *entry, unsigned long pc)
 void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 			 struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	const struct riscv_sse_interrupted_context *context;
+
+	context = riscv_sse_get_interrupted_context();
+	/* A guest stack cannot be walked using the host address space. */
+	if (sse_callchain_is_guest(context))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
@@ -39,6 +176,11 @@ void perf_callchain_user(struct perf_callchain_entry_ctx *entry,
 void perf_callchain_kernel(struct perf_callchain_entry_ctx *entry,
 			   struct pt_regs *regs)
 {
+#ifdef CONFIG_RISCV_SBI_SSE
+	if (sse_callchain_kernel(entry, regs))
+		return;
+#endif
+
 	if (perf_guest_state()) {
 		/* TODO: We don't support guest os callchain now */
 		return;
-- 
2.50.1 (Apple Git-155)

