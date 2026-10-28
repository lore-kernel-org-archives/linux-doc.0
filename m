Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793194430;
	b=zdVxB6r5Yh1Z9TbHA+7kpDLLIdtWE0tnohGe92UeziI/sKRGAbkh6mtmyxpVcxHJ+3rG
	 JiU0ugUx15jlea1Ydwo667wcuOQdhQhOHS9UwLoOhkW7O0g2J+aJq3brlouqGGF2DuUL8
	 gkl4+4d+hSgzEV+Zwbbqe7hPH+FMd+jc/yKzoE6crwzpFUbsXpg2KpQbyogY1RmY0qWlP
	 08P73eisKHZdFBUOklq51v4Gm0Y0b0Od0Dw1lQwkBuhIBX8XXsb27Df3+CGnPmBDlD1Zs
	 YqyFPKxI5ch/knJkZ1+aZgcxFRaBFEoqMybrdk1FaenMiH11ClDDGwWl1bSdYIKOaug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793194430;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=5Gktc4fxUiUbyi4OC6QEacgpGkR7EGDsMwiLK6P1Grs=;
	b=UP1M3F2TZlPkF17uMhhXXAUzOpszM76AgdB8FHp/kCIpcdLA22ul7Ube308LC0JESz0E
	 sIYrRvuizr9p10eDtEFZB/AOFeQDj5z/2+OTg+SM8Ju3xAvN90RSRjzs1IDbzgkad+9mv
	 Mh9UZNRh9UYCKe5H7KfV1zE2pY2tATUr9uza/v9N1usT2fAHtZxagBq8kWeQHHoSd8WJE
	 301DlCx9hdsFjgDpl0VJgWNdYBAjzFy+93JIIxi+jQjRodyz2XHokosUqg9v+s9ve0i2G
	 GYsWU4utSEg7V0xG1Wv0ehVGAw5y2WRvayhDW7H71e8I3uGwhfpWaUvnf2L5E8fyYvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=armoriq.io;
	spf=pass smtp.mailfrom=armoriq.io;
	dkim=pass header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B91Aa6u7;
	arc=none smtp.remote-ip=209.85.128.172
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0A0260A2609
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 13:33:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D0A0260A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=armoriq.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=armoriq.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=armoriq-io.20260707.gappssmtp.com header.i=@armoriq-io.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=B91Aa6u7
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-8b09e07e149so8103417b3.1
        for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 06:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=armoriq-io.20260707.gappssmtp.com; s=20260707; t=1793194429; x=1793799229; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5Gktc4fxUiUbyi4OC6QEacgpGkR7EGDsMwiLK6P1Grs=;
        b=B91Aa6u79uDzBTZQoJ4nI5PWEdog/sk7iPSmqLj0Ds0uOhiy1nZHi4jArsHgdLZ+we
         ML9JIYIXWsC1Yc8PaywyqFJfkjzxt9Rs/PCvH5sN8jYvnDm1uFNpo/H1Fz81yeaKg/iy
         lAONHkIUrZZZDINr68gcvgPSRIsPXOsnOmpaofi10nLSW7CjY9rr6rn8MyZFYf8iCf63
         /GgaGuUmCkE6+g0ivR5kmjIl4MgEtsnkwOyqG7WzO8QWHkAjuJRcbjJERJgFydEF2qCZ
         1kaJ4Pyk3fzy7ZDy45PsDEPoFAkuJtPuAuisDM60jP2EmZaV3dvEWlnxGolvEyzoCHFC
         ng8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793194429; x=1793799229;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5Gktc4fxUiUbyi4OC6QEacgpGkR7EGDsMwiLK6P1Grs=;
        b=CAyTg0Vt9x4fjCCrManRhWylsHw7wqjg6d+mo2D8GQQz08GFmN/c+QNtguefeGZqpz
         9y+1EMJvcfHx5G1raRIb6Id2wiDZCYACkfgwlpjDA6kYesEv0OHLQkar0BDdXakhRAcI
         0QRoDFV4prNeRiVymAWs9SOuB3LtTLl33EaMac+eZSrApt8dLyNj2DZnjVRoZvIyiOLJ
         CqPS4RJbeXaW0/bBB57a4SSJe8hTc3iuWbs0v8maIvbDTVh9H8E4v/V6BtIKDHCL7GFl
         3Qwr4zXs3Si2kUWGDCSQnFBioVT4+W+G++FIEnt91Xj/DLA5kJBUKmCp62z4eCi0LuFa
         SZOw==
X-Forwarded-Encrypted: i=1; AKwUvBwbGSPHVNSyQvdcC8RFqLaEB/lvlcLyAmu/ADbcXVdzRypNpTIuojdm6hSIbbkwFxGyi9VDFF6xLfg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKfz24UpuMLrzEpCVNGTqG/bqlpWjfmLuzwcz+TjEEKEdDo8pza
	5lRhK/mhPCzANFN5U3iHRqB9M9uBe6/vCnWq3b7Mdz7li1wsSEDNx4arxCUDpviqD+p6
X-Gm-Gg: AYBFou2RLnOC6SRJrq5ml6aoRmwifGiO7VyV7yz21NAOZdnLgHIsNHdoXa/K3ZWXg9w
	zXfm0ZKpQmMm7JHXaecjHChhAuETlRCBGMOL7AC9/oviA/vVg4wV8i+0eG/vVSJbONADoq5gKhG
	lJaPvysxDdGqk82UlmhT68YXuuCs3WaDbvtU1S9J76a++ElhLYJgdocyW/L6GOtMy49+/KJH2Hk
	uzPpn69vS9Dq9U2JL4uj4o2kQaFNPIDBtjw0w5vS2QmH5MjG0eJw7xJ1nMMjYnDr0vDmOeJ1gHo
	YPSAkYD6sJCxHWBD87mz4eBUtBnI2uJKIGwN8bKf/Vqm5SvSV9jCJlu6bQ/8nEX1ubBADNS6inf
	Qppn26NYUu0Zyjv2WaMkuw7OwSjjepOffrBdurYksKXJHTDi7G1Vp7vRe9Y2NgXFkWV0DgqZCoe
	ZMyDyr9kxbRq7mlvWe3afpv0++K3LR4syfDKVYvy7mNyRbrKRwi5LqHWWaH1sFX6RehCWR5E455
	8xXK6dNT0EAsoJyphQCtb+CQQLhUTgm9SsQ+hmZ1oHXPu0jqfB7edzkJMjvJOPznDLNVvCV7fXP
	RPO/OVerGGwUZxXu7B3tjNYLdQ37gkbI/aPoD4peswPZuXVLSapPuXPulzrm3nDmza7+szE/AGx
	cryizHLL8zz00hgOb7JorCsVY9S+jemoOJbSeJ4AfNB9Jyaw=
X-Received: by 2002:a05:690c:832:b0:8b0:e238:271c with SMTP id 00721157ae682-8b1b5c885f2mr9630557b3.27.1793194428780;
        Wed, 28 Oct 2026 06:33:48 -0700 (PDT)
Received: from CC-KJQTV599DQ.attlocal.net ([2600:1702:7b5a:ab90:103d:30e1:1f09:a9ae])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm1694911d50.1.2026.10.28.06.33.48
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 28 Oct 2026 06:33:48 -0700 (PDT)
From: Ketan Bhardwaj <ketan@armoriq.io>
To: Paul Moore <paul@paul-moore.com>,
	James Morris <jmorris@namei.org>,
	"Serge E . Hallyn" <serge@hallyn.com>
Cc: linux-security-module@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-api@vger.kernel.org,
	=?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	=?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>,
	linux-kernel@vger.kernel.org,
	"HARIHARA SUDHAN . R" <harisudhan@armoriq.io>,
	Ketan Bhardwaj <ketan@armoriq.io>
Subject: [RFC PATCH v2 2/6] security: kap: add the LSM ID and internal headers
Date: Wed, 28 Oct 2026 09:33:31 -0400
Message-ID: <20261028133335.75899-3-ketan@armoriq.io>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20261028133335.75899-1-ketan@armoriq.io>
References: <20261028133335.75899-1-ketan@armoriq.io>
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
Co-developed-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Signed-off-by: HARIHARA SUDHAN. R <harisudhan@armoriq.io>
Assisted-by: Codex
Signed-off-by: Ketan Bhardwaj <ketan@armoriq.io>
---
 include/linux/kap.h      |  16 ++++
 include/uapi/linux/lsm.h |   1 +
 security/kap/kap.h       | 159 +++++++++++++++++++++++++++++++++++++++
 3 files changed, 176 insertions(+)
 create mode 100644 include/linux/kap.h
 create mode 100644 security/kap/kap.h

diff --git a/include/linux/kap.h b/include/linux/kap.h
new file mode 100644
index 0000000..8d11d20
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
index 938593d..7cb3d64 100644
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
index 0000000..14cfe4d
--- /dev/null
+++ b/security/kap/kap.h
@@ -0,0 +1,159 @@
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
+int kap_securityfs_init(void);
+
+#endif /* _SECURITY_KAP_H */
-- 
2.51.0

