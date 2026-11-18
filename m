Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.100
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794981731;
	b=r3yJ4BGOI0ABQY8Dsm94TM5D44mVMWTIvn2QM9b7yUynxih07L0KNm3OA7zv6VkqdyQ0
	 vNCvyRkxgEr5apEaqx7ISBt6yx5UPMsI3HPGjWVfliVEYeamVOF4T4GMxvnQorBSqtQiE
	 pbXb7unG+pnMqRJGl4IeICt0dJCvBN1kYShnh59dE2Kswa4kUSIIQzB691rv69LZXVJxM
	 e9hyz7d9slbO4sYIVjZnq+wUWJvySd8YTn6didzYGs8tAeoF8J2ro5ZExONMfabv3doBi
	 fJyXp1PHzgwFwXQiUiw6iwg8Ly2KnabHJRhLPvULPXIbT3tajJJIwT6UFZrbjx4ONIA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794981731;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:X-Relaying-Domain:
	 X-CFilter-Loop:Received:DKIM-Signature:X-Forwarded-Encrypted:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-DetectorID-Processed;
	bh=R4uwpzc2SXxT7GyHeLuy79qw30desez58Shax9ewH5U=;
	b=G5lEu6k/japCtBhHGmkyU6rKp4TOj75TKI/n5hgrNfYFOij4e05aadAZuLO5ERzuKv1R
	 Ln/o9ZT37lcLlPCTREXeJ/0NYSouBeIrkk9zihOPpHQNLW6/zstSXD0c9Q51ImhCJynsE
	 SVmkaULCzhM77BUpV957FieoSbfdKcRfj7J/I1paVKvgC/W2spkSvKR6a4hl1qJzb/T3g
	 D7n1InM2dsflfD4ySlmIAxbw3ZdHw5JtvLCr3x/jUkralSYUk9hITbOuIBjozhNMVAW+w
	 PsDIpYKH2Oxvikb10nu8QaKVw+Yzih/AJrpUw1p/Lplqy6/JhHgQ5DoMgALuoq1uVFQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=broadcom.com;
	spf=fail smtp.mailfrom=broadcom.com;
	dkim=pass header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DdaWVURK;
	arc=none smtp.remote-ip=209.85.216.100
Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD897606A31C
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 06:02:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DD897606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=DdaWVURK
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3b0bbdeae06so251288a91.1
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:02:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794981730; x=1795586530;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=R4uwpzc2SXxT7GyHeLuy79qw30desez58Shax9ewH5U=;
        b=Kdmn9bqfWW9o8UnKFJ29gkQ3DyId7dWm9sOSZyka7znR+QKah58Jcra+Vs+cpPjKgI
         zd3sa5wxHMTdJg3deUVWAHpHKzOKxPUPXQgbkdvSz30aCttIfPtfAYhqhBuQ40IXtu/d
         tuwWv8WNPkv4ycaDhFizZOX6uVQFt/oyAqbAhzHW9T6MvfLtPV32sJySb3w2oxxEg0pK
         /LxNf44pV4RDH9GukGL2YEoIJRNQFFp1rynf3cM5VIcikolDVLhn6BA+WBDFfEzhkRF4
         nFsWMshKVXF0wz/6a/+FoC7xAC+3bVdEAws+dzmT2ASvLOsPTxTq1sky5kTRLEyZqCh+
         EORw==
X-Forwarded-Encrypted: i=1; AL+hErEpQFuxdz680oXGM+O33aA/rmb+a1wLZFHeB6myDCkSAk1+dHE0JkQ885u9/0dyuLSIv2yCbZ24JQo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8hUqiVX8/ojmN4/CSCZvJUiAlQRzNkzrTPm/sziK4Q1/BHOhfG
	fbvfRVh5QaO4EDFk5FQVmj157aZUcY6qcMeAmqTlHCBq5qUe0aHRzXcsF5cuDLLnc46Tyu8eduw
	abCFgxc1E4WBwURIlAov5hY0Sj+JZEbzHfnCK8iiAql7KF0+87aCrk1H2Z1Xh2XtZFEUftZ2J6i
	g6KoXWz5tXp+ka7GIHi26i3c+DwIJ6sPxrTJI1j/TPNhTAU26SdGO/OoXYjn/nEcIm3irZfOG7G
	GoF/0/xMIvP
X-Gm-Gg: AZFdTZd7fiiWoFTchnU3C6OX3FYOCfAuVRjMFSD1wXT1rBzQy+Xwzxb4XxXK9dTEl87
	aKYY8tTokUqTEh4bxVyDPvEW72I2lkiT9DrWKf5F8o+8Pq/eEaambWVJNkNb1pb7ivScOn4sIU1
	Og9Xm2eD8/yscqKOZ+yLZl7czGjgLZTtZdjKwOLVJoM+Ms9W5T2XDiiOYX+6cLnn2CFaU0CchBl
	YY/IWYOPWlYaBEwbKfFK79hwdzPixQROEiUOuE9LSypi7+Tx7nyhV3FaiB+3sVht3lL7sQ8wT6Z
	IO8AYzSEb1p931DFYFDBCITzCNMQUaK0mLlPu9BnrprsUauWpvgnNqrDJciXVhaJH+OUg+zP/gI
	YsTxeAcFok/kSoBMKvGGRlnJdPlYb7brtUu9rMTVkAD2vXg7DHF0Si1xj2PoVY0qL0/ZZLsixbv
	3ytRntSagchLCYCe3DvBa3ccnqtPZLa7gl
X-Received: by 2002:a17:90b:55c7:b0:3b0:ad59:7199 with SMTP id 98e67ed59e1d1-3b3d07c653amr1367510a91.32.1794981729987;
        Tue, 17 Nov 2026 22:02:09 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3b3ac020c2fsm3566243a91.6.2026.11.17.22.02.05
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 17 Nov 2026 22:02:09 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9210bbc04abso10472516d6.2
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 22:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1794981725; x=1795586525; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=R4uwpzc2SXxT7GyHeLuy79qw30desez58Shax9ewH5U=;
        b=DdaWVURKtHtAqqNHUpZZx1eyIcwguBJal7zYmFoYR9apr68N/zDc05wXsUZAj/pVBo
         NkDDZpP2Orc57dWvc+2tnj2ubLf/hDTow+oArRqxdUlV7bgfB4SWAEB5rZXsyKZOrZR7
         zpsGswm0l1bux+mNRLV5iqye649xErIYPsQME=
X-Forwarded-Encrypted: i=1; AL+hErEdm5ry5HcHGY8pjAoVa6rkDk0aAhLk8IbMNZ/V1enxa2dW07qtexFHFOsWr6N7v7twNkWOl5RfD7o=@vger.kernel.org
X-Received: by 2002:a05:622a:4ccd:b0:536:6ff4:6528 with SMTP id d75a77b69052e-55d5a543d65mr25648291cf.23.1794981724871;
        Tue, 17 Nov 2026 22:02:04 -0800 (PST)
X-Received: by 2002:a05:622a:4ccd:b0:536:6ff4:6528 with SMTP id d75a77b69052e-55d5a543d65mr25647841cf.23.1794981724238;
        Tue, 17 Nov 2026 22:02:04 -0800 (PST)
Received: from vertex.localdomain (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d58ff0065sm14886841cf.5.2026.11.17.22.01.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 22:01:59 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>,
	Bradley Morgan <brads@mainlining.org>
Subject: [PATCH v4 2/4] x86/vmware: Add a bounded panic log sender
Date: Wed, 18 Nov 2026 01:01:49 -0500
Message-ID: <7e985e2aea6507a0444addd816d4251f78d048f6.1794980455.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794980455.git.zack.rusin@broadcom.com>
References: <cover.1794980455.git.zack.rusin@broadcom.com>
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
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

A VMware guest may be unable to save its own logs after a crash. Copy
the newest kernel log records to the host's vmware.log before kdump,
so they remain available if the capture kernel fails.

Register the sender on the platform panic notifier list and send the
log through the low-bandwidth register interface. Allocate a fixed
8 KiB buffer during early init; 4 KiB can lose useful stack-trace
context. The callback allocates no memory and emits no printk
messages. Limit the transfer to the buffer size and make at most three
attempts, retrying only if a VM checkpoint interrupts the transfer.

Enable logging by default only in guests without memory encryption;
encrypted guests should send their log to the host only when an
administrator opts in. The copy is best-effort diagnostics; kdump does
not depend on it succeeding.

Suggested-by: Michael Kelley <mhklinux@outlook.com>
Link: https://lore.kernel.org/r/SN6PR02MB41574A11D309A0530C63E0FED4842@SN6PR02MB4157.namprd02.prod.outlook.com
Link: https://lore.kernel.org/r/20260309235250.2611115-3-alexey.makhalov@broadcom.com
Co-developed-by: Bo Gan <bo.gan@broadcom.com>
Signed-off-by: Bo Gan <bo.gan@broadcom.com>
Co-developed-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Alexey Makhalov <alexey.makhalov@broadcom.com>
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
v4: No change.

v3: Register on the platform list instead of the pre-kdump list. The
VMware code is otherwise unchanged from v2.

 arch/x86/include/asm/vmware.h |   1 +
 arch/x86/kernel/cpu/vmware.c  | 173 ++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)

diff --git a/arch/x86/include/asm/vmware.h b/arch/x86/include/asm/vmware.h
index fb011cef01e7..dc3cf8123914 100644
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
index f7ab9e7902cf..0c6f7248a665 100644
--- a/arch/x86/kernel/cpu/vmware.c
+++ b/arch/x86/kernel/cpu/vmware.c
@@ -24,11 +24,16 @@
 #include <linux/dmi.h>
 #include <linux/init.h>
 #include <linux/export.h>
+#include <linux/kmsg_dump.h>
+#include <linux/mm.h>
+#include <linux/panic_notifier.h>
 #include <linux/clocksource.h>
 #include <linux/cpu.h>
 #include <linux/efi.h>
 #include <linux/reboot.h>
+#include <linux/sizes.h>
 #include <linux/static_call.h>
+#include <linux/wordpart.h>
 #include <linux/sched/cputime.h>
 #include <asm/div64.h>
 #include <asm/x86_init.h>
@@ -52,6 +57,23 @@
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
+#define VMWARE_LOG_BUF_SIZE		SZ_8K
+#define VMWARE_LOG_ATTEMPTS		3
+#define VMWARE_LOG_PREFIX		"log "
+#define VMWARE_LOG_PREFIX_LEN		(sizeof(VMWARE_LOG_PREFIX) - 1)
+
 struct vmware_steal_time {
 	union {
 		u64 clock;	/* stolen time counter in units of vtsc */
@@ -64,6 +86,12 @@ struct vmware_steal_time {
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
 
@@ -142,6 +170,151 @@ static unsigned long vmware_get_tsc_khz(void)
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
+static bool vmware_record_panic_msg;
+
+static int vmware_panic_log_notify(struct notifier_block *nb,
+				   unsigned long action, void *data)
+{
+	struct kmsg_dump_iter iter;
+	char *buffer = page_address(vmware_panic_page);
+	size_t length = 0;
+
+	if (!READ_ONCE(vmware_record_panic_msg))
+		return NOTIFY_DONE;
+
+	memcpy(buffer, VMWARE_LOG_PREFIX, VMWARE_LOG_PREFIX_LEN);
+	kmsg_dump_rewind(&iter);
+	(void)kmsg_dump_get_buffer(&iter, true,
+				   buffer + VMWARE_LOG_PREFIX_LEN,
+				   VMWARE_LOG_BUF_SIZE - VMWARE_LOG_PREFIX_LEN,
+				   &length);
+	(void)vmware_log_rpc(buffer, length + VMWARE_LOG_PREFIX_LEN);
+
+	return NOTIFY_DONE;
+}
+
+static struct notifier_block vmware_panic_log_nb = {
+	.notifier_call = vmware_panic_log_notify,
+};
+
+static int __init vmware_panic_log_init(void)
+{
+	int ret;
+
+	if (!IS_ENABLED(CONFIG_PRINTK) ||
+	    !hypervisor_is_type(X86_HYPER_VMWARE))
+		return 0;
+
+	vmware_record_panic_msg =
+		!cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT);
+
+	vmware_panic_page = alloc_pages(GFP_KERNEL,
+					get_order(VMWARE_LOG_BUF_SIZE));
+	if (!vmware_panic_page) {
+		pr_err("failed to allocate panic log buffer\n");
+		return 0;
+	}
+
+	ret = atomic_notifier_chain_register(&panic_notifiers_platform_list,
+					     &vmware_panic_log_nb);
+	if (ret) {
+		pr_err("failed to register panic log notifier: %d\n", ret);
+		__free_pages(vmware_panic_page, get_order(VMWARE_LOG_BUF_SIZE));
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
