Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795434263;
	b=jKvxpLGl6xSfRXUPZoCWKHxe/EwTaBAmafHnX7hfnglBAioX1bjQKMJZHL9ucI4BJG6T
	 ZnzkX1XekGoflEvrDqJc92mRjbKaSynHZmd00T6t5OHZU34yhSw46lPvwr+nK5KMDdiiu
	 KAVJ4wkIPcKkMjnMuOzPJ7SrIe7VTlUnkZNbzc/ZSMVX4Maa92CsyTMImWDQ3kXx/5QEF
	 S8OrvQxv3thaxfjaWrek8kCjmBRESx6aolZzbk7ctwuh7ewJege/GrcvfNv9qs3UWdxnQ
	 DPib3Z4qyArym5ysL5F0R61Rc25jKsRSxM9ATL9CQbSND94J1OmCGAUhcP1wwvonHlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434263;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=hnvDig0dM1QComfuK2OvYInYk5xj0Tm4ODFeUP2YM9Y=;
	b=1wDQhE+NovG0MWRfanDdDKTg5IebN5+8Jdu0RF0Cyy0jECF/e+f4zuzjG2f77heEEBFO
	 9OQGhxYM3jvtyd9vYbbeKyfluKvmFvkUEaLcoNye2i+LBzJlFnSR91fmldjZd3rHT7SqN
	 RCLlRVevwNgYN510M1TI/mC+0zorphQEVZztG+cyjQNQqaQzbBPwHQZ8y3sFz2gA14PCE
	 ibqH2DWNTd7mXHSZh8ZAl8HbJ2DV2Whad1XUGRGbFCY2CLMFU/I8+91LcrQAxRqLIdphR
	 4q6UmupozW/EqiqwwRs+DvYE+mTxVVxxJLPQLt+TGxtgTGjh9mXeyWSDU1+PLRhjYRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b="IZWKP/8w";
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92B46606A31F
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 11:44:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92B46606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=IZWKP/8w
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-386ab9ab619so2009445eec.1
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 03:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1795434262; x=1796039062; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hnvDig0dM1QComfuK2OvYInYk5xj0Tm4ODFeUP2YM9Y=;
        b=IZWKP/8wsfKGc9Ngyr4Xcvcz9AvMxdKJBZV9n5ZJSoCW9YkJzjT/uoXfA6Bj2zXcvL
         zSKiPQ0YPN/1lQN1JVUzZwHCte2hXOeF+M/tWpXfuAQsO0op7+CHmHBsJlzzAdMM/pR5
         1OpQTcmOZdIg8bUb859jLH1wGeDXFqz3jESVLR/AZ7BHRVjpekuxcplMgt3/NxLzgtqg
         VgxQivYiCbo6ZfijoO5t9ZEvXqT45TE7yHRN3D2AK4CAqFgKZpMA/vYa8Upx0kOAPkS4
         3gmr+Dpf+VIAEqqON9JEL5OjMP3T8jPlrr8/Pol8opHSyP/7Uv8JBDi1o86pUQLjrblH
         GD/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434262; x=1796039062;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hnvDig0dM1QComfuK2OvYInYk5xj0Tm4ODFeUP2YM9Y=;
        b=OTMyAPWR9OMbpS4JnnK8RAmavu/tmODfMVo5NLhHERW928pcagHir0ZL6WveOsGDUh
         /URY60YF3Q/oldzjWns6xyyZKZ+LU3b63QEX4wDhtHlmhniNYvhae6CIIalkdMDUmHx2
         +qQAj0BBNbsYNYlfsKVg4brAYeCT+TxDGkUZvS4YkFYALCCE0IJQFqTztIA9fRrzw34O
         uDk6ALebWRiDq0WLF9soA9hfBJgr5k3ZfHw/X2mnU1X85CHQQVvHLZhGpN2PPXBhMadM
         WCd8aA9DG5PQA3zrC6TYXMSTvKFGEtZ1TyyUKOBYInHffhEwI2xJq8S2qqO5N506mHYs
         FfNQ==
X-Forwarded-Encrypted: i=1; AL+hErEakmL/mq7QT1Iu0ycCDgZl5hxVlRU//5OfWeEshCIwj5lb/TSTIzdhXQwTlttIccPKi55Gq7XYmP4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8BCYK9dwIXhs25fDTNHr7VIYoya7QJuqKfhRmuTAcKhH+2tESr
	GJO40FxZLz6GM+LiGQB1+WrW2emQeyvhyCpRGdBrbeow//JP4ZJziPj4EQmWOJnXOJvq
X-Gm-Gg: AZFdTZdYbTZy2daAjoVydstlxBjdMl24Tpg5QrAKzzOGJphWcei4zU8DABClgq4alBL
	amquZt3ngEFE13pkR0rrURVSBAyKkvaJa/FcXCzv1ZEoETE1vXDlwpOwZ0KYIeXKiSICR7beaWU
	j8+OzKzt1alIKHl6YUfA+FNOeZMz2xq3L+c/NB1LjH9ywdK0RnhkcYDe2rvXcWv0j6SRd5zDVL8
	1xNEoYPaibS9spVqDDkRSPOlAYeibWN8UNGuFcrSApZSKVAaAeymwkIzJr4U39dQ2s+oLw4favO
	2UyHhUBwzFe6LCq5dDJFHjb7J9dAAseCjmrptnq4Sh4+PImGfIb/KLYWBQLQC6Mx1P9C3BdHDv+
	/6A3ipbe3DcIh52Rg5xra87b0pHoaRTfIIqnsUOwwlqNP/4iJeFBvrDQSgxJnFz92M6JbZYErYN
	mIiJRtgF8sE7jty78sF3fUBc7sFSIiywCtCJosEs2nMmy+5vvVLqRkEu2wbx/aodvXtuwwJnHAA
	U7ZFtEnDj/x/v+0CC1TFWCRUqGJJIjQ1P11Aw/iEmPitW0tGQwra/EgsSg8YHJpSP73GKYSaIEC
	/afQ7MbPSR0OQXWVKttjO/2da5WtrFkmz7aR5Gc6DzlSozAC9xTqljujjiZOrve3wfbPSTDtUoz
	ytEUt18/KO+kk9NM8y4Cf2hEsviG6T0dW5Iz2QVFZ3pwNj+4pa+xcqg==
X-Received: by 2002:a05:7300:50fa:b0:384:6487:b155 with SMTP id 5a478bee46e88-38570c359d3mr13394840eec.29.1795434261498;
        Mon, 23 Nov 2026 03:44:21 -0800 (PST)
Received: from localhost.localdomain ([2409:40f4:14e:94e0:654e:d7ff:13d2:447d])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38566cd40c5sm41943583eec.10.2026.11.23.03.44.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 23 Nov 2026 03:44:21 -0800 (PST)
From: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>
To: bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-security-module@vger.kernel.org
Cc: "HARIHARA SUDHAN. R" <harisudhan@armoriq.io>,
	"Liam R. Howlett" <liam@infradead.org>,
	"Serge E. Hallyn" <serge@hallyn.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ben Segall <bsegall@google.com>,
	David Hildenbrand <david@kernel.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Morris <jmorris@namei.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Juri Lelli <juri.lelli@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Kees Cook <kees@kernel.org>,
	Ketan Bhardwaj <ketan@armoriq.io>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mel Gorman <mgorman@suse.de>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Moore <paul@paul-moore.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Valentin Schneider <vschneid@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Vlastimil Babka <vbabka@kernel.org>
Subject: [RFC PATCH v4 2/6] security: kap: add the LSM ID and internal headers
Date: Mon, 23 Nov 2026 17:13:04 +0530
Message-ID: <20261123114308.8103-3-harisudhan@armoriq.io>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261123114308.8103-1-harisudhan@armoriq.io>
References: <20261123114308.8103-1-harisudhan@armoriq.io>
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

Reserve an LSM ID for KAP and add the declarations its files share.

The ID is the next free value in the target tree. It is provisional
and is for the LSM maintainers to confirm.

Assisted-by: Claude
Co-developed-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
---
 include/linux/kap.h      |  16 ++++
 include/uapi/linux/lsm.h |   1 +
 security/kap/kap.h       | 160 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 177 insertions(+)
 create mode 100644 include/linux/kap.h
 create mode 100644 security/kap/kap.h

diff --git a/include/linux/kap.h b/include/linux/kap.h
new file mode 100644
index 000000000..8d11d20d8
--- /dev/null
+++ b/include/linux/kap.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _LINUX_KAP_H
+#define _LINUX_KAP_H
+
+#include <linux/types.h>
+
+#ifdef CONFIG_SECURITY_KAP
+int kap_check_namespace_flags(unsigned long flags, const char *operation);
+#else
+static inline int kap_check_namespace_flags(unsigned long flags, const char *operation)
+{
+	return 0;
+}
+#endif
+
+#endif /* _LINUX_KAP_H */
diff --git a/include/uapi/linux/lsm.h b/include/uapi/linux/lsm.h
index 938593dfd..7cb3d64e5 100644
--- a/include/uapi/linux/lsm.h
+++ b/include/uapi/linux/lsm.h
@@ -65,6 +65,7 @@ struct lsm_ctx {
 #define LSM_ID_IMA		111
 #define LSM_ID_EVM		112
 #define LSM_ID_IPE		113
+#define LSM_ID_KAP		114
 
 /*
  * LSM_ATTR_XXX definitions identify different LSM attributes
diff --git a/security/kap/kap.h b/security/kap/kap.h
new file mode 100644
index 000000000..bb71b1061
--- /dev/null
+++ b/security/kap/kap.h
@@ -0,0 +1,160 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _SECURITY_KAP_H
+#define _SECURITY_KAP_H
+
+#include <linux/list.h>
+#include <linux/spinlock.h>
+#include <linux/types.h>
+
+#define KAP_TASK_IGROUP_NAME_LEN 64
+
+struct dentry;
+struct task_struct;
+
+enum kap_hook_kind {
+	KAP_HOOK_EXEC,
+	KAP_HOOK_FILE,
+	KAP_HOOK_SOCKET_CONNECT,
+	KAP_HOOK_CRED,
+	KAP_HOOK_IPC,
+	KAP_HOOK_NAMESPACE,
+	KAP_HOOK_DESCRIPTOR,
+	KAP_HOOK_BPF,
+	KAP_HOOK_PTRACE,
+	KAP_HOOK_PROCFS,
+	KAP_HOOK_EXECMEM,
+	KAP_HOOK_IO_URING,
+	KAP_HOOK_LAST = KAP_HOOK_IO_URING,
+};
+
+struct kap_task_state {
+	bool active;
+	u64 epoch;
+	char igroup_name[KAP_TASK_IGROUP_NAME_LEN];
+};
+
+struct kap_task_state *kap_task_state(struct task_struct *task);
+bool kap_fail_closed_kind(enum kap_hook_kind kind);
+int kap_check_current_target_why(enum kap_hook_kind kind, const char *target,
+				 const char **why);
+int kap_check_current_emit(enum kap_hook_kind kind, const void *object,
+			   const char *deny_reason, const char *allow_reason);
+int kap_check_current_target_emit(enum kap_hook_kind kind, const char *target,
+				  const char *deny_reason, const char *allow_reason);
+void kap_emit_current_event_target(enum kap_hook_kind kind, int decision,
+				   const char *reason, const char *target);
+
+/* Shared between the policy engine (igroup.c) and the control plane (kapfs.c). */
+#define KAP_MAX_NAME_LEN 63
+#define KAP_MAX_ROOT_LEN 64
+#define KAP_MAX_PREDICATE_BYTES 65536
+#define KAP_MAX_EVENTS_BYTES 65536
+/* The install document is the authority plus a few short header lines. */
+#define KAP_MAX_INSTALL_BYTES (KAP_MAX_PREDICATE_BYTES + 1024)
+
+enum kap_file_kind {
+	KAP_FILE_PROCS,
+	KAP_FILE_IGFD,
+	KAP_FILE_LINEAGE_ROOT,
+	KAP_FILE_AUTHORITY_EPOCH,
+	KAP_FILE_AUTHORITY,
+	KAP_FILE_TRANSITION,
+	KAP_FILE_MODE,
+	KAP_FILE_EVENTS,
+	KAP_FILE_EXPIRES_AT,
+	KAP_FILE_INSTALL,
+	KAP_FILE_COUNT,
+	/* Filesystem-wide, not created per igroup, so it sits past the count. */
+	KAP_FILE_DEFAULT = KAP_FILE_COUNT,
+};
+
+struct kap_igroup;
+
+struct kap_file_ctx {
+	enum kap_file_kind kind;
+	struct kap_igroup *igroup;
+};
+
+struct kap_bound_pid {
+	pid_t pid;
+	struct list_head node;
+};
+
+/*
+ * Predicates are compiled once at install, so a decision only walks an array.
+ * Patterns are interned into one pool and referenced by offset, so the whole
+ * thing is a flat allocation and a decision allocates nothing.
+ *
+ * The pool is sized to the authority document itself, so any document that is
+ * accepted can be compiled: a pattern costs strlen + 1 here and at least
+ * strlen + 2 in the document because of its surrounding quotes. Each set's
+ * patterns are laid out contiguously and walked by length, so there is no
+ * per-set entry limit either.
+ */
+struct kap_pattern_set {
+	u32 offset;
+	u32 count;
+};
+
+struct kap_compiled_authority {
+	char pool[KAP_MAX_PREDICATE_BYTES];
+	u32 pool_used;
+	struct kap_pattern_set allow[KAP_HOOK_LAST + 1];
+	struct kap_pattern_set deny[KAP_HOOK_LAST + 1];
+};
+
+struct kap_igroup {
+	char name[KAP_MAX_NAME_LEN + 1];
+	u64 epoch;
+	bool revoked;
+	bool has_sequence;
+	u64 last_sequence;
+	char lineage_root[KAP_MAX_ROOT_LEN + 1];
+	char authority[KAP_MAX_PREDICATE_BYTES];
+	size_t authority_len;
+	/* Expiry in Unix seconds, 0 for none. */
+	u64 expires_at;
+	/* Swapped wholesale on a successful install; NULL until the first one. */
+	struct kap_compiled_authority *compiled;
+	char events[KAP_MAX_EVENTS_BYTES];
+	size_t events_len;
+	struct kap_file_ctx files[KAP_FILE_COUNT];
+	struct list_head pids;
+	struct list_head node;
+	struct dentry *dentry;
+};
+
+struct kap_install_request {
+	char lineage_root[KAP_MAX_ROOT_LEN + 1];
+	u64 epoch;
+	u64 expires_at;
+	u64 sequence;
+	/* Points into the caller's buffer, which outlives this request. */
+	const char *authority;
+	bool have_root;
+	bool have_epoch;
+	bool have_expires_at;
+	bool have_transition;
+	bool have_authority;
+};
+
+extern struct list_head kap_igroups;
+extern spinlock_t kap_lock;
+extern bool kap_lsm_active;
+extern bool kap_ready;
+extern bool kap_default_closed;
+
+struct kap_igroup *kap_find_igroup_locked(const char *name);
+int kap_bind_pid_locked(struct kap_igroup *igroup, pid_t pid,
+			struct kap_bound_pid **entry);
+int kap_parse_transition_sequence(const char *payload, u64 *sequence);
+int kap_install_parse(char *payload, struct kap_install_request *req);
+int kap_authority_prepare(const char *doc, struct kap_compiled_authority **out);
+int kap_install_locked(struct kap_igroup *igroup,
+		       const struct kap_install_request *req,
+		       struct kap_compiled_authority **compiled);
+void kap_trim_newline(char *value);
+bool kap_valid_lineage_root(const char *value);
+int kap_securityfs_init(void);
+
+#endif /* _SECURITY_KAP_H */
-- 
2.43.0

