Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586138;
	b=c0H6z8GcPRkWR+yR0a4vySTfHoxyZ4zxfDmKFiD3KzeFUiPp3j+h0od0d5gXavx6jvtI
	 8oWH0/EXPR9j/Rkm+5g8q2bD13xWDiysx7XA5cpK8RrlvtSG1KZKOdciwbXMge26ZjFNF
	 Y3spXtqDC/3pX9+jJoUO966YRsLoQgEiBUHloqUuU/xutdFae2uVTP58PhnGaI4z9PQaL
	 DDHy6KdffLH0Efz4bpZAWAWb8m7MbRRpjgSKYvrzP0DqmnC9oJLgQqKb+z/HNFAVH9tvb
	 qOU9L3QOCVX87OC55ATRAXuES/3fimtAEkryiwvG59WpaFomMRbpYLkC3pmzg2rvzAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586138;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=CR01M3l2+XdlJgIMFqnjdm+KWucPPsA6W4AAPFE8TbU=;
	b=vQWEb4hIb5an1j4k/IKToonaBUCmju+yHc2mY1a1qgzckUxE93mEFuIFBmwSP/cL7Gvi
	 XT0fT9vs55Tl/HARAlNRzGaKyyKG9DTV9r7Qbgu/nXNd2Zivn5L/3R/jNKy5jwW/BuEql
	 8cdLxKPYejdB5pYifOkUiaJmvsCQhczUvucfIDogb3HXJC7RaTWkE8Zx9PThEOs3sRCfQ
	 /ZUs4UIT0FW+X7bCgrTd9u9T28KGTL7/PMx2xxBRjaKWMm8dFk9qF695nmyvLDIjw+3ge
	 4uwuBPVvZj1xiCtz0sPXzNM54TKdOlBqPb2Qu+OkdJyaHttpr6iWPoJKvV2Jm+tpw6g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=UGQHklYD;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64643606EBA6
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 16:08:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 64643606EBA6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=UGQHklYD
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15878045e9.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794586137; x=1795190937; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CR01M3l2+XdlJgIMFqnjdm+KWucPPsA6W4AAPFE8TbU=;
        b=UGQHklYDSzvPSNGEWzPMjIY8U1mfIOUygXuI2b4PdJIbBHPcsdmFcUGBe7cVxizxEy
         E/dUBqQ21jfJvF6pAWstuH5inKuRBJqiIT5U1Se/LpvBeckx6CYvzlsqqGah65TL/UHA
         DfGKmTwX2gdPzmEuaG4olwTmTlmeSNJ7eT71VayXJ6U0LX1/KXjFdwqeiDLQfTKcyRBd
         PHmPdtM4bIs5I9bXMJDVwIs7jQZwNYeB018n0kLfjehpKceES2y7CFYG9qGorDpLcI1z
         ci4/sx2z5etxpu4NIcUGz1rfkHwOo2ZUiVLq7NXFt3rbFGf7cCw/Pqb9XnMTdD8oUrBJ
         KqRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586137; x=1795190937;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CR01M3l2+XdlJgIMFqnjdm+KWucPPsA6W4AAPFE8TbU=;
        b=YXfO7Tc7AWHi0Zvirw2+SXkwAHWqas9Yy4mSYZUwqxy9D3HThA5uvMrMImgx9e5Uze
         VkOcK5X66iTxMOVDsDZz2O+yKXWQ4wRuJtyS+K6AocfK9aQBFunqWgO7/qy1R4jCDp6T
         1Xh2WurZYLJ+ImLF/EUJkx5DD29JYwGf7S7r8/8Ob0k9IqYneBQa5PenzmhHVGi1tBBc
         zJ6S3ofHCzWzGbk5d39fz+AFDJdrIQCCK3uQX2ZKR9sTLBaltRTNlTjQKCnv4yD2F47d
         ujGw03UUCseeJ9N9NRk+h03QyXMNNq13WMIYSuWorqGu9MBcGU6aF4u/h7FNPL36ZLfD
         5fxw==
X-Forwarded-Encrypted: i=1; AL+hErHmTkHXrC+qr/44D8P09OrvxuYtmm7Lb7X7ZfX5IsI1TNu8GVc7kXRizjMzmeNum6iVskP2faJ5xTk=@vger.kernel.org
X-Gm-Message-State: APuU4Z8C7DJEkq+u/HN2k+HmePKM2MUJyvLyk52nLZetWUQz/IFYsjhB
	BCFBXCvV4lurcjVTMUaMRRumq7zSLoLlbcL9rmSvlywWn30hRHkYVFTxZwEmRaBtulw=
X-Gm-Gg: AYBFou2BH/1mp/r0eeqaKNkTjuJJT7T7OcvAafbHH5yXePeFnCyuePQg3AO/HNEJzDG
	/Ri9lP8syU95DfhelInhGl+SRujR5+YWfh1wDl/gW1hUhVT6nOYEefVC948Z5GOBJIjt4hPePAB
	5N3IqyEGhhuth8ICdl0g796Y0lc/vrUmSuIObMoDpt03IrBK6owfe4Km6/AmU+g911kkSs55UkV
	s1hOpi23ZlR8OEO9stgK2ZOcpniXTDAyAG/qPs+XldXLgq2Zf4t7FUuOSMEPtWpB1R64ze4XVzg
	XyIyWwC/9iSlom815YNFYhdpC2YduNwa41z3vtPgdd0LRI1pvOX9BGhMxgpfFufrnTVBizkcehk
	muCJ/MwJv80xEEPGbomhEW+HsHc0VHvH2mDjVvNTC5iXFiJhyTmAyxbrPsArojq3A6GKjVSN0J1
	g9SkncKNA2H/t+iZrJp73VhbJwQUHXeLdpDEgGrCbARCdjppkYIM4ZuREwHze5SwmtPaUMDUclr
	x4qfBhdQLGvT/tsvwabRZ60W97+pl2yE4DrrqH/tt5JWz0JR9sx3USChD8u0KbFOW7aoxsu12xj
	OVMH9Bc+N37LOiXU8enfBhAV9RXh+lJ8le/7JjgT
X-Received: by 2002:a05:600c:4313:b0:4a1:f377:5c68 with SMTP id 5b1f17b1804b1-4bb55a83305mr42502405e9.34.1794586136644;
        Fri, 13 Nov 2026 08:08:56 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb55af2901sm68962095e9.13.2026.11.13.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:08:56 -0800 (PST)
From: Jiri Pirko <jiri@resnulli.us>
To: linux-coco@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org,
	x86@kernel.org,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	jgg@ziepe.ca,
	david.quigley@intel.com,
	lukas@wunner.de,
	ksinyuk@kernel.org,
	rodrigo.vivi@intel.com,
	cedric.xing@intel.com,
	sameo@meta.com,
	drdeeglaze@gmail.com,
	James.Bottomley@HansenPartnership.com,
	aik@amd.com,
	jpiotrowski@nvidia.com,
	qinkun@google.com,
	pgonda@google.com,
	jic23@kernel.org,
	alistair.francis@wdc.com,
	ankita@nvidia.com,
	suzuki.poulose@arm.com,
	kas@kernel.org,
	rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com,
	peter.fang@intel.com,
	jarkko@kernel.org,
	zohar@linux.ibm.com,
	yeoreum.yun@arm.com,
	aneesh.kumar@kernel.org,
	dave.jiang@intel.com,
	nik.borisov@suse.com,
	sergii.dmytruk@3mdeb.com
Subject: [PATCH RFC v2 4/9] attestation: Prepare measurement registers
Date: Fri, 13 Nov 2026 17:08:33 +0100
Message-ID: <20261113160838.2512652-5-jiri@resnulli.us>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261113160838.2512652-1-jiri@resnulli.us>
References: <20261113160838.2512652-1-jiri@resnulli.us>
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

From: Jiri Pirko <jiri@nvidia.com>

Add the fixed MRs from the provider descriptor, their lookup and MR
extension, which advances an instance-wide MR generation.

The MR objects can be compile-checked here. CONFIG_ATTESTATION remains
unwired until the CTLV operation handlers complete the module.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- kept the MR state in struct attestation_dev, which providers embed
- dropped the MR journal and its notifications
- counted MR changes in a plain MR generation
- retitled from "Prepare measurement register journal"
- used the helpers generated for the rewritten spec
- let an extend carry values for some of an MR's banks
- always provided mr-read with MRs
---
 drivers/attestation/Makefile        |  2 +-
 drivers/attestation/core/core.c     | 71 +++++++++++++++++++++++++++++
 drivers/attestation/core/internal.h | 13 ++++++
 drivers/attestation/core/mr.c       | 64 ++++++++++++++++++++++++++
 include/linux/attestation.h         |  5 +-
 5 files changed, 153 insertions(+), 2 deletions(-)
 create mode 100644 drivers/attestation/core/mr.c

diff --git a/drivers/attestation/Makefile b/drivers/attestation/Makefile
index 8a75558a7013..28036586f5d8 100644
--- a/drivers/attestation/Makefile
+++ b/drivers/attestation/Makefile
@@ -1,4 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ATTESTATION) += attestation.o
 
-attestation-y := core/core.o
+attestation-y := core/core.o core/mr.o
diff --git a/drivers/attestation/core/core.c b/drivers/attestation/core/core.c
index 587a0a9616b6..24abe0923306 100644
--- a/drivers/attestation/core/core.c
+++ b/drivers/attestation/core/core.c
@@ -213,6 +213,12 @@ bool attestation_registered(struct attestation_dev *att)
 	return registered;
 }
 
+void attestation_mr_changed(struct attestation_dev *att)
+{
+	lockdep_assert_held(&att->lock);
+	att->mr_generation++;
+}
+
 void attestation_stop(struct attestation_dev *att)
 {
 	lockdep_assert_held(&att->lock);
@@ -221,6 +227,38 @@ void attestation_stop(struct attestation_dev *att)
 	xa_unlock(&attestation_instances);
 }
 
+static struct attestation_mr *attestation_mr_alloc(struct attestation_dev *att,
+						   const struct attestation_mr_props *props)
+{
+	struct attestation_mr *mr;
+	int ret;
+
+	ret = attestation_mr_props_validate(att->provider, props);
+	if (ret)
+		return ERR_PTR(ret);
+	if (xa_load(&att->mrs, props->id))
+		return ERR_PTR(-EEXIST);
+	mr = kzalloc_obj(*mr, GFP_KERNEL);
+	if (!mr)
+		return ERR_PTR(-ENOMEM);
+	mr->props = props;
+	ret = xa_insert(&att->mrs, props->id, mr, GFP_KERNEL);
+	if (ret) {
+		kfree(mr);
+		return ERR_PTR(ret);
+	}
+	return mr;
+}
+
+struct attestation_mr *attestation_mr_lookup_live(struct attestation_dev *att, unsigned int mr_id)
+{
+	struct attestation_mr *mr;
+
+	lockdep_assert_held(&att->lock);
+	mr = xa_load(&att->mrs, mr_id);
+	return mr ? mr : ERR_PTR(-ENOENT);
+}
+
 /**
  * attestation_evidence_write - Write an evidence object to its blob.
  * @object: the requested object
@@ -252,11 +290,41 @@ void attestation_provide_ops(struct attestation_dev *att)
 		ctlv_attestation_evidence_get_provide(ctlv);
 		ctlv_attestation_evidence_get_enable(ctlv);
 	}
+
+	if (provider->mrs_count) {
+		ctlv_attestation_mr_get_provide(ctlv);
+		ctlv_attestation_mr_read_provide(ctlv);
+		if (provider->mr_extend)
+			ctlv_attestation_mr_extend_provide(ctlv);
+	}
+}
+
+static int attestation_mrs_create(struct attestation_dev *att)
+{
+	const struct attestation_provider *provider = att->provider;
+	size_t index;
+
+	for (index = 0; index < provider->mrs_count; index++) {
+		struct attestation_mr *mr;
+
+		mr = attestation_mr_alloc(att, &provider->mrs[index]);
+		if (IS_ERR(mr))
+			return PTR_ERR(mr);
+	}
+	return 0;
 }
 
 /* Runs from the release, so it must not reach the provider's module. */
 static void attestation_state_free(struct attestation_dev *att)
 {
+	struct attestation_mr *mr;
+	unsigned long index;
+
+	xa_for_each(&att->mrs, index, mr) {
+		xa_erase(&att->mrs, index);
+		kfree(mr);
+	}
+	xa_destroy(&att->mrs);
 	mutex_destroy(&att->lock);
 }
 
@@ -338,11 +406,14 @@ struct attestation_dev *_attestation_alloc(struct device *parent,
 		return ERR_PTR(-ENOMEM);
 	att->provider = provider;
 	mutex_init(&att->lock);
+	xa_init(&att->mrs);
 
 	/* From here on, the release frees whatever was set up. */
 	ret = ctlv_device_init(&att->node, &attestation_class, parent, &att->ctlv);
 	if (!ret)
 		ret = ctlv_init(&att->ctlv, &att->node.dev, family, &attestation_ctlv_hooks);
+	if (!ret)
+		ret = attestation_mrs_create(att);
 	if (ret) {
 		put_device(&att->node.dev);
 		return ERR_PTR(ret);
diff --git a/drivers/attestation/core/internal.h b/drivers/attestation/core/internal.h
index f42bc3cd9a35..19c2ade5e6db 100644
--- a/drivers/attestation/core/internal.h
+++ b/drivers/attestation/core/internal.h
@@ -11,11 +11,24 @@
 
 #define ATTESTATION_REGISTERED XA_MARK_1
 
+struct attestation_mr {
+	const struct attestation_mr_props *props;
+};
+
 bool attestation_registered(struct attestation_dev *att);
 void attestation_stop(struct attestation_dev *att);
+void attestation_mr_changed(struct attestation_dev *att);
 
 int attestation_provider_validate(const struct attestation_provider *provider,
 				  const struct ctlv_family *family);
 void attestation_provide_ops(struct attestation_dev *att);
 
+struct attestation_mr *attestation_mr_lookup_live(struct attestation_dev *att, unsigned int mr_id);
+int attestation_mr_values_validate(const struct attestation_mr_props *props,
+				   const struct attestation_digest_set *values, bool all_banks);
+int attestation_mr_extend_locked(struct attestation_dev *att, struct attestation_mr *mr,
+				 const struct attestation_digest_set *values);
+
+int attestation_mr_props_encode(struct ctlv_cursor *reply, const struct attestation_mr *mr);
+
 #endif /* _ATTESTATION_INTERNAL_H */
diff --git a/drivers/attestation/core/mr.c b/drivers/attestation/core/mr.c
new file mode 100644
index 000000000000..44a8c06df0c6
--- /dev/null
+++ b/drivers/attestation/core/mr.c
@@ -0,0 +1,64 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <linux/device.h>
+#include <linux/errno.h>
+#include <linux/limits.h>
+
+#include "internal.h"
+
+/* @values follow the banks' order, so each bank comes once at most. */
+int attestation_mr_values_validate(const struct attestation_mr_props *props,
+				   const struct attestation_digest_set *values, bool all_banks)
+{
+	size_t bank = 0, index;
+
+	if (!values || !values->values || !values->values_count ||
+	    (all_banks && values->values_count != props->algorithms_count))
+		return -EINVAL;
+	for (index = 0; index < values->values_count; index++, bank++) {
+		while (bank < props->algorithms_count &&
+		       props->algorithms[bank] != values->values[index].algorithm)
+			bank++;
+		if (bank == props->algorithms_count)
+			return -EINVAL;
+	}
+	return 0;
+}
+
+int attestation_mr_extend_locked(struct attestation_dev *att, struct attestation_mr *mr,
+				 const struct attestation_digest_set *values)
+{
+	int ret;
+
+	lockdep_assert_held(&att->lock);
+	if (att->mr_generation == UINT_MAX) {
+		dev_warn(att->node.dev.parent,
+			 "attestation instance %u stopped: mr generation exhausted\n",
+			 att->index);
+		attestation_stop(att);
+		return -EOVERFLOW;
+	}
+	ret = att->provider->mr_extend(att, mr->props->id, values);
+	if (ret)
+		return ret;
+	attestation_mr_changed(att);
+	return 0;
+}
+
+int attestation_mr_props_encode(struct ctlv_cursor *reply, const struct attestation_mr *mr)
+{
+	u64 caps = 0;
+	size_t index;
+	bool ok = true;
+
+	ok &= ctlv_attestation_mr_get_items_id_put(reply, mr->props->id);
+	ok &= ctlv_attestation_mr_desc_name_put(reply, mr->props->name);
+	for (index = 0; index < mr->props->algorithms_count; index++)
+		ok &= ctlv_attestation_mr_desc_supported_hash_algorithms_put(
+			reply, mr->props->algorithms[index]);
+	if (mr->props->has_register_index)
+		ok &= ctlv_attestation_mr_desc_register_index_put(reply, mr->props->register_index);
+	if (mr->props->extendable)
+		caps |= CTLV_ATTESTATION_MR_CAPS_EXTEND;
+	ok &= ctlv_attestation_mr_desc_caps_put(reply, caps);
+	return ok ? 0 : -EMSGSIZE;
+}
diff --git a/include/linux/attestation.h b/include/linux/attestation.h
index 29bb776bfb41..7745938092c7 100644
--- a/include/linux/attestation.h
+++ b/include/linux/attestation.h
@@ -9,6 +9,7 @@
 #include <linux/device.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
+#include <linux/xarray.h>
 
 #include <uapi/ctlv/ctlv_attestation_gen.h>
 #include <uapi/linux/hash_info.h>
@@ -200,9 +201,11 @@ struct attestation_dev {
 	const struct attestation_provider *provider;
 	unsigned int index;
 
-	/* Mutable instance state. */
+	/* Mutable instance and MR state. */
 	struct mutex lock;
+	unsigned int mr_generation;
 
+	struct xarray mrs;
 };
 
 /* What a CTLV callback of a family inheriting ctlv-attestation was handed. */
-- 
2.56.0

