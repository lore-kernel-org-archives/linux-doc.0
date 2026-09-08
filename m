Received: from mail-pf1-f225.google.com (mail-pf1-f225.google.com [209.85.210.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D1959B67D
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 18:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890866; cv=none; b=iczE/fXwkAf93ow30MTECwGAW1s5v8ke0ii0RLwiMlT7dU5gGZKy/8rrOSousu9pwaPYDvXucwcJuNRSRoEybwVxL3j2uL9OypaJ0GVgzeOyXVbsyRlBNcUUAXSQ7pORnXi8fkju1EIUGK4GZZClIMENH/SGIEO5z6M5bljQW04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890866; c=relaxed/simple;
	bh=Mvcs9Lt0sPQOGP5yNJDCK3xofsCRtXPW55QU80iioj4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YkScNa7hqfSGWkIjT8cfvkfrU3805opjehqxxDa1vCd5Z67MoGmldW48kgorvI24YoeFyhl5jiNmpAu6NyBh3PLQIFxyNPoQTLx9Ka2N6IqbiZUOL5BcgvotaALLewkg+JTHMKYbh+M51BoiAQWnWP6Gl6bcwXzzCZ9B3qg3p9c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=doLYS7JJ; arc=none smtp.client-ip=209.85.210.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="doLYS7JJ"
Received: by mail-pf1-f225.google.com with SMTP id d2e1a72fcca58-853e2610bb4so3689544b3a.0
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890854; x=1789495654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aIZhE29+oVPTSBZvjxk3RWug8DvHvEXFsH8XGpUQx0Y=;
        b=s9yXLXzxsJVzTWh1gXXmqrhhsbIKcKdvy/64wJsEJctoHwR3X04NYIASSEq1B7IMQl
         TnI0GyuwbrAdhtmAjqf0Xenh3wUIE4BVWHM6LrYDBKc1Lgi01E4YkD/I9YNU5BPEUA0j
         tjY0CPjptRp/zghpUdPBCpOJVJu7Q7PguvDa5AGDuc7MDp01CSzqubHvYghAy/BsrYLo
         Qps+/d4JV6c7WR0KnUuPPQqJsPUDqFZDBAoulgpc+2RWExxh3Byr6G99pfXQR5vblaYN
         6/vfhpW1VocjBlQ+1DvYLKyzl57LXtIrxBnSHYZUH9F+21ZswoHWPpsmjLgBgy6+blbb
         ed7g==
X-Forwarded-Encrypted: i=1; AKwUvBwph/FImfiddQp6v+R9IzbZLDHZM2rsJnFaO0jVLxy5V3rm0lVyUQinpvH+pOrroyFFz4FmXEcyHyA=@vger.kernel.org
X-Gm-Message-State: AFuF++kUud5pzyZLfO0Mjb9BlqmKsyAblUW7NpwWZ1bPR8DqAZ1Qu94H
	T6EXjz9kxfJ+KqUF4FxjCHvPUpM5DqbIEgCIiNTJQsjKHvsZC9aCUA0NiJVtgE5OjjakE0KfIt1
	9JzAF5bVX4272QU5sKwYajxN0AgsoZ5DwNIekLgYHKhSoFAiPvuyNb5FxZYzEDUEt99lM8MFXN2
	emPL0Mt5Hcqw8/K/xXnA7SXOzOCPtfHULKGEWZ0y2a0LLjbbTAg/RVXYqo1KsB/jmvPcWWCLGhT
	wV10RayUAi2
X-Gm-Gg: AYBFou2YKt2N6nhcsSHpOcBSyI4MM7GyvMxAWN7SRs2gEP4qJWEVQ5U0nVmaI4dw75p
	EX3tZ0ovvtKR+gc/z0HUC/XNTjXAnVXTWbmYVDNkGu9Rp8T5CAp2V58DlFmCzmM+eLCd5A0z7eM
	xu0E5pNy6uPTyFnexGKuPLE8fSYPhsb6R08ZiCnLIRDcNlBRSX2fzs0W3D8Bu0ddy7KdUqag5QP
	hFuYRCn77xT0PZAUFLQEbW8CKOzMdTQErwzU6aS734SxSHA74nDuaEwFGpPNjO2yO/fLEkNCQom
	I1HAq6L124LCZj6RwESkjMcXVHt3F6ggzbEj78q81cUjmLplTeLsHMT6RjV/R1U9oYfp7KUt2d5
	UNgSi5emJQuJIJmLYtsvtJoijVEUpngHNApNmH0tMvwMyYRJz81tLuc/OGuPnxvH93buuyHn0o9
	gyjBQzd290NFK2Wcyo2kFQh3HsZ9hjZg==
X-Received: by 2002:a05:6a20:9183:b0:3d3:ad6e:9ce2 with SMTP id adf61e73a8af0-3da9da433c1mr7995436637.16.1788890854198;
        Tue, 08 Sep 2026 11:07:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc4553f38b0sm3075362a12.5.2026.09.08.11.07.30
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 08 Sep 2026 11:07:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9105be46009so32716486d6.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1788890849; x=1789495649; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aIZhE29+oVPTSBZvjxk3RWug8DvHvEXFsH8XGpUQx0Y=;
        b=doLYS7JJkG3wj71ZF2IaUv+uzoHEK3ynxJAU51OtSy9tWW8s4h+ewkzvQ0Noarlv6z
         qKofhc67i7p7JHin/HA0CPhV2Stg0pupvGoCqjBNiZbW8Bj3MOvk4FAf3QEtBqWx+8IN
         LCayoG/64PoQm5ZIZ2S6EWykSJuPsTqbPztDU=
X-Forwarded-Encrypted: i=1; AKwUvBwn4Ki1VBrLIX7B7BDxP0iKYyuQwdphQ01LF+y4CKE7JkS7j52hjLRfdPFG4FVS2OkkBFIOUVMN/yU=@vger.kernel.org
X-Received: by 2002:a0c:e003:0:b0:910:69e3:2983 with SMTP id 6a1803df08f44-91069e33187mr23819406d6.5.1788890849420;
        Tue, 08 Sep 2026 11:07:29 -0700 (PDT)
X-Received: by 2002:a0c:e003:0:b0:910:69e3:2983 with SMTP id 6a1803df08f44-91069e33187mr23818676d6.5.1788890848717;
        Tue, 08 Sep 2026 11:07:28 -0700 (PDT)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9106412e038sm27114866d6.20.2026.09.08.11.07.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 11:07:27 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Petr Mladek <pmladek@suse.com>,
	Joel Granados <joel.granados@kernel.org>,
	Baoquan He <baoquan.he@linux.dev>
Cc: Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	Zack Rusin <zack.rusin@broadcom.com>
Subject: [PATCH v1 1/4] x86/vmware: Add a bounded panic log sender
Date: Tue,  8 Sep 2026 14:07:13 -0400
Message-ID: <18115e519d85b753c147b45470120721eaf14505.1788414671.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1788414671.git.zack.rusin@broadcom.com>
References: <cover.1788414671.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A virtual machine may have no guest-local persistent storage or working
userspace after a panic. Preserve the newest kernel log tail in the host
vmware.log, which remains available after the VM terminates.

Allocate one page during early init and register a panic-only kmsg dumper.
Copy the newest records once, prefix them with "log ", and send one
explicit-length RPC message over the low-bandwidth register path. The page
limit bounds panic-time work and avoids sharing guest memory with the host.

Keep the source immutable for up to three attempts. Retry only checkpoint
responses, zero-fill a short final word, and close the single RPC channel
on every exit after open. The panic callback allocates nothing, does not
sleep, and emits no printk messages.

Free the page and leave panic logging disabled if dumper registration
fails, including when CONFIG_PRINTK=n.

Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
 arch/x86/include/asm/vmware.h |   1 +
 arch/x86/kernel/cpu/vmware.c  | 158 ++++++++++++++++++++++++++++++++++
 2 files changed, 159 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index 4220dae14a2d..598d4cd448ec 100644
--- a/arch/x86/include/asm/vmware.h
+++ b/arch/x86/include/asm/vmware.h
@@ -57,6 +57,7 @@
 #define VMWARE_HYPERVISOR_MAGIC		0x564d5868U
 
 #define VMWARE_CMD_GETVERSION		10
+#define VMWARE_CMD_MESSAGE		30
 #define VMWARE_CMD_GETHZ		45
 #define VMWARE_CMD_GETVCPU_INFO		68
 #define VMWARE_CMD_STEALCLOCK		91
diff --git a/arch/x86/kernel/cpu/vmware.c b/arch/x86/kernel/cpu/vmware.c
index 34b73573b108..bf59653d6e07 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -24,11 +24,14 @@
 #include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/export.h>
+#include <linux/kmsg_dump.h>
+#include <linux/mm.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/static_call.h>
+#include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
@@ -52,6 +55,22 @@
 #define STEALCLOCK_DISABLED        0
 #define STEALCLOCK_ENABLED         1
 
+#define VMWARE_MSG_STATUS_SUCCESS	BIT(16)
+#define VMWARE_MSG_STATUS_CPT		BIT(20)
+
+#define VMWARE_RPCI_PROTOCOL		0x49435052
+#define VMWARE_GUESTMSG_COOKIE		BIT(31)
+
+#define VMWARE_MSG_TYPE(n)		((n) << 16)
+#define VMWARE_MSG_OPEN			VMWARE_MSG_TYPE(0U)
+#define VMWARE_MSG_SENDSIZE		VMWARE_MSG_TYPE(1U)
+#define VMWARE_MSG_SENDPAYLOAD		VMWARE_MSG_TYPE(2U)
+#define VMWARE_MSG_CLOSE		VMWARE_MSG_TYPE(6U)
+
+#define VMWARE_LOG_ATTEMPTS		3
+#define VMWARE_LOG_PREFIX		"log "
+#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)
+
 struct vmware_steal_time {
 	union {
 		u64 clock;	/* stolen time counter in units of vtsc */
@@ -64,6 +83,12 @@ struct vmware_steal_time {
 	u64 reserved[7];
 };
 
+struct vmware_rpc_channel {
+	u16 id;
+	u32 cookie_high;
+	u32 cookie_low;
+};
+
 static unsigned long vmware_tsc_khz __ro_after_init;
 static u8 vmware_hypercall_mode     __ro_after_init;
 
@@ -142,6 +167,139 @@ static unsigned long vmware_get_tsc_khz(void)
 	return vmware_tsc_khz;
 }
 
+static int vmware_log_open(struct vmware_rpc_channel *channel)
+{
+	u32 info, id;
+
+	vmware_hypercall6(VMWARE_CMD_MESSAGE | VMWARE_MSG_OPEN,
+			  VMWARE_RPCI_PROTOCOL | VMWARE_GUESTMSG_COOKIE, 0,
+			  &info, &id, &channel->cookie_high,
+			  &channel->cookie_low);
+	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+		return -EIO;
+
+	channel->id = upper_16_bits(id);
+	return 0;
+}
+
+static int vmware_log_close(const struct vmware_rpc_channel *channel)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_CLOSE, 0,
+			  (u32)channel->id << 16, channel->cookie_high,
+			  channel->cookie_low, &info);
+
+	return info & VMWARE_MSG_STATUS_SUCCESS ? 0 : -EIO;
+}
+
+static int vmware_log_send_once(const struct vmware_rpc_channel *channel,
+				const char *buffer, size_t length)
+{
+	u32 info;
+
+	vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDSIZE, length,
+			  (u32)channel->id << 16, channel->cookie_high,
+			  channel->cookie_low, &info);
+	if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+		return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
+
+	while (length) {
+		size_t bytes = min_t(size_t, length, sizeof(u32));
+		u32 word = 0;
+
+		memcpy(&word, buffer, bytes);
+		vmware_hypercall5(VMWARE_CMD_MESSAGE | VMWARE_MSG_SENDPAYLOAD,
+				  word, (u32)channel->id << 16,
+				  channel->cookie_high, channel->cookie_low,
+				  &info);
+		if (!(info & VMWARE_MSG_STATUS_SUCCESS))
+			return info & VMWARE_MSG_STATUS_CPT ? -EAGAIN : -EIO;
+
+		buffer += bytes;
+		length -= bytes;
+	}
+
+	return 0;
+}
+
+static int vmware_log_send(const struct vmware_rpc_channel *channel,
+			   const char *buffer, size_t length)
+{
+	int attempt, ret;
+
+	for (attempt = 0; attempt < VMWARE_LOG_ATTEMPTS; attempt++) {
+		ret = vmware_log_send_once(channel, buffer, length);
+		if (ret != -EAGAIN)
+			return ret;
+	}
+
+	return -EAGAIN;
+}
+
+static int vmware_log_rpc(const char *buffer, size_t length)
+{
+	struct vmware_rpc_channel channel;
+	int close_ret, ret;
+
+	ret = vmware_log_open(&channel);
+	if (ret)
+		return ret;
+
+	ret = vmware_log_send(&channel, buffer, length);
+	close_ret = vmware_log_close(&channel);
+	if (!ret && close_ret)
+		ret = close_ret;
+
+	return ret;
+}
+
+static struct page *vmware_panic_page;
+
+static void vmware_panic_log_dump(struct kmsg_dumper *dumper,
+				  struct kmsg_dump_detail *detail)
+{
+	struct kmsg_dump_iter iter;
+	char *buffer = page_address(vmware_panic_page);
+	size_t length = 0;
+
+	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
+	kmsg_dump_rewind(&iter);
+	(void)kmsg_dump_get_buffer(&iter, true,
+				   buffer + VMWARE_LOG_PREFIX_LEN,
+				   PAGE_SIZE - VMWARE_LOG_PREFIX_LEN, &length);
+	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
+}
+
+static struct kmsg_dumper vmware_panic_log_dumper = {
+	.dump = vmware_panic_log_dump,
+	.max_reason = KMSG_DUMP_PANIC,
+};
+
+static int __init vmware_panic_log_init(void)
+{
+	int ret;
+
+	if (!hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	vmware_panic_page = alloc_page(GFP_KERNEL);
+	if (!vmware_panic_page) {
+		pr_err("failed to allocate panic log buffer\n");
+		return 0;
+	}
+
+	ret = kmsg_dump_register(&vmware_panic_log_dumper);
+	if (ret) {
+		pr_err("failed to register panic log dumper: %d\n", ret);
+		__free_page(vmware_panic_page);
+		vmware_panic_page = NULL;
+	}
+
+	return 0;
+}
+early_initcall(vmware_panic_log_init);
+
 #ifdef CONFIG_PARAVIRT
 static struct cyc2ns_data vmware_cyc2ns __ro_after_init;
 static bool vmw_sched_clock __initdata = true;
-- 
2.53.0

