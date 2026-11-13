Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586143;
	b=S1HyjZ2DDdLq+Xla5vOQYeIJqm/V/La/+Y39Kuk55n8JBHFWd+7sUs1mt99acCJsfiw7
	 cuoosQywwqY5q5wyNTQHqIN3yL5cV1nwmdoHpdrk+1PIMfvzVtqMEkgWfYT5BEUQwIi7d
	 nEfW31XZen82/ZOLnai6kDhw/7j102OeSGEAfW8tVSaD23jdgxDBuHwyFilVNZUDiNPdu
	 tvJLVbhiUmXaVLvlDKmuLBP/sU8pzORvEk9QugbIZbqFW7ODpJo9v4kIlVGxJWNmOtQGF
	 rGVj2riecmXnH3ljUNmh0H/r5IdlH0fAGodqzyozvsMWdUMvm0Uq8MKIEONx9Es5owg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586143;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=QGbEWihG1HhgjTnh5olCbuz0JGvXPYpZsqbep3qZjaY=;
	b=mUwrm2DRe4lleOSzhQ0PM8JJUjQHc7ZReGjlx1LMWRU1mkbYNh7P4IPHXjqR5p4CLADo
	 WsC1fgcZoh2Nr06gqz03lGssjqVRMpLuQ6NQHgbpOo/e4CUARcDKE0YG04QXDsFgl0Akx
	 dNcbHf9B8pWwbUDGGK+OaV81/1j9t/UFUtNz+yY5ULCSZ55uXKJZMbrm6hdSFkaJjiKzt
	 4K/OMJX3Z03B6scS8MeEHTuPUprketvXH7NrCBXakAEWD4pq/m1sWa6vFnomQPs9fRgdq
	 u+9jfJWmSO7VLftvbKmsK3mLIFLbPnqK81cqOT1az+hKgFNyO7H1G4ephx58iFofqLQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=WM0GeNMh;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63260606AE3D
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 16:09:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 63260606AE3D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=WM0GeNMh
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-491846221ffso1230940f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794586141; x=1795190941; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QGbEWihG1HhgjTnh5olCbuz0JGvXPYpZsqbep3qZjaY=;
        b=WM0GeNMhALGi3Py6BhQ8iBanNWHpfyMJ9e8dJcKvscavTRYd6pN5Jjx1R1XoG3XOVf
         4XNn/CbQz5khI7H4K2ypPRsSeZwmUwdBdCl/V4fnU6TaAiw+QzgQmQgfW7bCamigVq05
         iP+rreApttU/RliCxV04vLILFsjlXcm0PfFIDBSXQAZ2hzT6v1igRlPczEYkutGr50PM
         ivPnD1wVrwZusQKR5W4l4laOn0TVKZgIXA1WRMjhcn/1VHBQKQ1e7l1HTVeIcgLEAL6+
         1LuLod5P/xmX5pJrQotDa4+v+S0TvFQ+hKWJXLh/k3ytW9XpM2ZWDcQx7wWdhx5br9m5
         jC1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586141; x=1795190941;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=QGbEWihG1HhgjTnh5olCbuz0JGvXPYpZsqbep3qZjaY=;
        b=1E2OE7uyIrfhgOyml0TcfS25fg3eAvlcwt4moP1PXbwN9n3LogXdX0LUnUJkxoS983
         1vCeodA1lMqm3WI05S2ooRPUhb/aeelF7R9yrho9/j2gCpswhvK4KgkdO2/qphiZq4fp
         Pma4TaT6yRtb4hts/bCw/l/3OQaVTnpf/2gHQnqgpYVgrkoOmSe+OMSRaodzMQ0srUcj
         T0mJ7Jp+CiS54QVcgZfSyJLsJVyVYzKfHn2/xceH9V4hqflgYExH4a4jJ1aeiAMcyP9K
         fuWFoOd87q7D/HtREb2crMAiNNIp7pw2XO2VSOGncQ0l9eQ0VXF9ktYlqyTi27cLbvrS
         LloQ==
X-Forwarded-Encrypted: i=1; AL+hErF/TBdA01LuhPQrXf3OdGdKudqdjMOS1ofPZAa48GVNo7ZwMln3KyYBluxurW9o+rbfDMjYX7y+Lk4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/E4iG1HEf9hS06uFtjcdxQq7TyHzQPYFas70MbsHOX9GmEt0Zr
	vV+ul3Ysxb1mw4V9jdu2yLbvXjtUSkR44+8lcYrEDPByuUx9e0H6NGgrK0hSc4UED1E=
X-Gm-Gg: AYBFou0ehUJiVIsfGsvI1PxNDgzMtlFD1sWvnNef2v43UoE2lGtPIy0D990Cg5Zhl68
	h3B4IS+5BB5YmALlflLNeaaCNnbi/n/wTjjUFJE/R39xYvD7hZPpTfmehzJt15smD3J2ILuZcyU
	pkPM2LKWifotWt/aU8uspv7fvnqLjAiDA9IU3UbBsiRJzV6jNQAuUVsF+055aJijJYr5BIIzaTn
	7pirQPsRzDvPAgTsZZTlP7E2uXNjqusBBc1xDlL8B86JoWoQpqrR1xbeqp31ygNh9T79sU1VhFU
	yZ3E+NEWCk9YxenVzYgzZwqsGBSzoDW4FJZZ2YzFNdHLgqIJOiOFaApwMz9frVTEluFpL+CP7Ff
	EAF+XtoG8q9gq6neWipCwuL9mKoGf+Qh++CcNmuS7LOFb+E9C5cXulAQYAWsV70RCnqFO6mcKYL
	wdntGb2DTsVO5hQP5F7P38whXxwCR9O4BgR6K1SUnfMujww/SM7RoNBqHQAuIUWX2BbmLlMQ7mt
	wdV0767x3DMoysehiotC5tVOjsJOplSd7LxOfRABe8H7KnHKg29xmq9z4fqjVBhhkbPQpiqhzWL
	9tBeC6LiGFQlHr2HxdISRlrDvUe3ZmfWv0dfGLAS
X-Received: by 2002:a05:6000:4a07:b0:48e:f47:273c with SMTP id ffacd0b85a97d-49c6d7340famr6405408f8f.8.1794586140557;
        Fri, 13 Nov 2026 08:09:00 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f78214dsm6327546f8f.25.2026.11.13.08.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:09:00 -0800 (PST)
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
Subject: [PATCH RFC v2 5/9] attestation: Add CTLV operation handling
Date: Fri, 13 Nov 2026 17:08:34 +0100
Message-ID: <20261113160838.2512652-6-jiri@resnulli.us>
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

Translate CTLV evidence and MR operations to the provider core and wire
the attestation family into the kernel build.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- handed the op handlers the CTLV instance
- put resolved blobs on evidence decode errors
- continued an MR dump past an MR that does not fit
- dropped the MR log query
- dropped the total output length check and its E2BIG
- reported each evidence object's class and formats
- reported each signed object's challenge lengths as a list, and took
  a challenge of a length every signed object named lists
- left the MR ID and hash algorithm bounds to CTLV
- used the helpers generated for the rewritten spec
- let evidence-get omit the challenge
- took output blobs of any length
- separated the steps of the longer functions
- let mr-extend extend some of an MR's banks, in any order
- replied to mr-read in the provider's bank order
- dropped the MR read caps, as every MR can be read
- said record instead of nest, the root being one
- took evidence-get's objects by ID, and replied with each one's
  format and length
---
 drivers/Kconfig                 |   2 +
 drivers/Makefile                |   1 +
 drivers/attestation/Makefile    |   3 +-
 drivers/attestation/core/ctlv.c | 499 ++++++++++++++++++++++++++++++++
 4 files changed, 504 insertions(+), 1 deletion(-)
 create mode 100644 drivers/attestation/core/ctlv.c

diff --git a/drivers/Kconfig b/drivers/Kconfig
index f2bed2ddeb66..5458886b0110 100644
--- a/drivers/Kconfig
+++ b/drivers/Kconfig
@@ -25,6 +25,8 @@ source "drivers/cache/Kconfig"
 
 source "drivers/connector/Kconfig"
 
+source "drivers/attestation/Kconfig"
+
 source "drivers/firmware/Kconfig"
 
 source "drivers/fwctl/Kconfig"
diff --git a/drivers/Makefile b/drivers/Makefile
index 0841ea851847..597db8c49da9 100644
--- a/drivers/Makefile
+++ b/drivers/Makefile
@@ -135,6 +135,7 @@ obj-$(CONFIG_MEMSTICK)		+= memstick/
 obj-$(CONFIG_INFINIBAND)	+= infiniband/
 obj-y				+= firmware/
 obj-$(CONFIG_FWCTL)		+= fwctl/
+obj-$(CONFIG_ATTESTATION)	+= attestation/
 obj-$(CONFIG_CRYPTO)		+= crypto/
 obj-$(CONFIG_SUPERH)		+= sh/
 obj-y				+= clocksource/
diff --git a/drivers/attestation/Makefile b/drivers/attestation/Makefile
index 28036586f5d8..e4bff7633d18 100644
--- a/drivers/attestation/Makefile
+++ b/drivers/attestation/Makefile
@@ -1,4 +1,5 @@
 # SPDX-License-Identifier: GPL-2.0
 obj-$(CONFIG_ATTESTATION) += attestation.o
 
-attestation-y := core/core.o core/mr.o
+attestation-y := core/core.o core/ctlv.o core/mr.o \
+		 generated/ctlv_attestation_gen.o
diff --git a/drivers/attestation/core/ctlv.c b/drivers/attestation/core/ctlv.c
new file mode 100644
index 000000000000..5299649a6066
--- /dev/null
+++ b/drivers/attestation/core/ctlv.c
@@ -0,0 +1,499 @@
+// SPDX-License-Identifier: GPL-2.0-only
+#include <crypto/hash_info.h>
+#include <linux/bitmap.h>
+#include <linux/cleanup.h>
+#include <linux/err.h>
+#include <linux/limits.h>
+#include <linux/slab.h>
+#include <linux/string.h>
+
+#include "internal.h"
+
+static bool attestation_challenge_length_put(struct ctlv_cursor *object, size_t min, size_t max)
+{
+	struct ctlv_cursor entry;
+	bool ok;
+
+	if (!ctlv_attestation_device_get_objects_challenge_lengths_start(object, &entry))
+		return false;
+	if (min == max) {
+		ok = ctlv_attestation_device_get_challenge_lengths_length_put(&entry, min);
+	} else {
+		ok = ctlv_attestation_device_get_challenge_lengths_min_length_put(&entry, min);
+		ok &= ctlv_attestation_device_get_challenge_lengths_max_length_put(&entry, max);
+	}
+	ctlv_record_end(&entry);
+	return ok;
+}
+
+static bool attestation_evidence_object_put(struct ctlv_cursor *object, size_t id,
+					    const struct attestation_evidence_supported_object *cap)
+{
+	size_t index;
+	bool ok;
+
+	ok = ctlv_attestation_device_get_objects_id_put(object, id);
+	ok &= ctlv_attestation_device_get_objects_class_put(object, cap->evidence_class);
+	for (index = 0; index < cap->formats_count; index++) {
+		u32 value = cap->formats[index].value;
+
+		if (cap->formats[index].vendor)
+			ok &= ctlv_attestation_device_get_objects_vendor_formats_put(object, value);
+		else
+			ok &= ctlv_attestation_device_get_objects_formats_put(object, value);
+	}
+	ok &= ctlv_attestation_device_get_objects_max_length_put(object, cap->max_length);
+	for (index = 0; index < cap->challenge_lengths_count; index++)
+		ok &= attestation_challenge_length_put(object, cap->challenge_lengths[index].min,
+						       cap->challenge_lengths[index].max);
+	return ok;
+}
+
+static int attestation_device_caps_put(struct attestation_dev *att, struct ctlv_cursor *reply)
+{
+	const struct attestation_provider *provider = att->provider;
+	struct ctlv_cursor caps_record, group, object;
+	bool ok = true;
+	size_t index;
+	u64 flags;
+
+	if (!ctlv_attestation_device_get_caps_start(reply, &caps_record))
+		return -EMSGSIZE;
+
+	if (provider->evidence_caps) {
+		const struct attestation_evidence_caps *caps = provider->evidence_caps;
+
+		if (!ctlv_attestation_device_get_caps_evidence_start(&caps_record, &group))
+			return -EMSGSIZE;
+
+		for (index = 0; index < caps->objects_count; index++) {
+			if (!ctlv_attestation_device_get_evidence_objects_start(&group, &object)) {
+				ok = false;
+				break;
+			}
+			ok &= attestation_evidence_object_put(&object, index,
+							      &caps->objects[index]);
+			ctlv_record_end(&object);
+		}
+		ctlv_record_end(&group);
+	}
+
+	if (provider->mrs_count) {
+		if (!ctlv_attestation_device_get_caps_mr_start(&caps_record, &group))
+			return -EMSGSIZE;
+
+		flags = 0;
+		if (provider->mr_extend)
+			flags |= CTLV_ATTESTATION_MR_DEVICE_CAPS_EXTEND;
+		ok &= ctlv_attestation_device_get_mr_flags_put(&group, flags);
+		ctlv_record_end(&group);
+	}
+	ctlv_record_end(&caps_record);
+	return ok ? 0 : -EMSGSIZE;
+}
+
+int ctlv_attestation_device_get_action(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+				       const struct ctlv_cursor *request, struct ctlv_cursor *reply)
+{
+	struct attestation_dev *att = attestation_from_ctlv(ctlv);
+	struct ctlv_cursor info;
+	int ret;
+
+	ret = attestation_device_caps_put(att, reply);
+	if (ret)
+		return ret;
+	if (!ctlv_attestation_device_get_info_start(reply, &info))
+		return -EMSGSIZE;
+	ret = ctlv_ext_fill(ctx, request, &info);
+	ctlv_record_end(&info);
+	return ret;
+}
+
+static void attestation_evidence_request_free(struct attestation_evidence_object_request *objects,
+					      size_t count)
+{
+	while (count) {
+		count--;
+		if (objects[count].output)
+			ctlv_blob_put(objects[count].output);
+	}
+	kfree(objects);
+}
+
+static int
+attestation_evidence_decode_objects(struct attestation_dev *att, struct ctlv_op_ctx *ctx,
+				    const struct ctlv_cursor *request,
+				    struct attestation_evidence_request *decoded,
+				    struct attestation_evidence_object_request **objects_out)
+{
+	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
+	struct attestation_evidence_object_request *objects;
+	struct ctlv_cursor object;
+	size_t count = 0, index = 0, previous;
+	int ret;
+
+	ctlv_attestation_evidence_get_objects_for_each(&object, request) count++;
+	objects = kcalloc(count, sizeof(*objects), GFP_KERNEL);
+	if (!objects)
+		return -ENOMEM;
+
+	ctlv_attestation_evidence_get_objects_for_each(&object, request)
+	{
+		const struct attestation_evidence_supported_object *supported;
+		u64 id;
+
+		id = ctlv_attestation_evidence_get_objects_id_get(&object);
+		if (id >= caps->objects_count) {
+			ret = -ENOENT;
+			goto err_free;
+		}
+		supported = &caps->objects[id];
+		for (previous = 0; previous < index; previous++)
+			if (objects[previous].supported_object == supported) {
+				ret = -EINVAL;
+				goto err_free;
+			}
+
+		objects[index].supported_object = supported;
+		objects[index].output =
+			ctlv_attestation_evidence_get_objects_data_resolve(ctx, &object);
+		if (IS_ERR(objects[index].output)) {
+			ret = PTR_ERR(objects[index].output);
+			objects[index].output = NULL;
+			goto err_free;
+		}
+		index++;
+	}
+
+	decoded->objects = objects;
+	decoded->objects_count = count;
+	*objects_out = objects;
+	return 0;
+
+err_free:
+	attestation_evidence_request_free(objects, count);
+	return ret;
+}
+
+static bool
+attestation_challenge_length_supported(const struct attestation_evidence_supported_object *object,
+				       size_t length)
+{
+	size_t index;
+
+	for (index = 0; index < object->challenge_lengths_count; index++) {
+		if (length >= object->challenge_lengths[index].min &&
+		    length <= object->challenge_lengths[index].max)
+			return true;
+	}
+	return false;
+}
+
+/* A challenge goes with signed objects only, and has to suit each. */
+static int attestation_evidence_challenge_check(const struct attestation_evidence_request *decoded)
+{
+	bool signed_named = false;
+	size_t index;
+
+	for (index = 0; index < decoded->objects_count; index++) {
+		const struct attestation_evidence_supported_object *object =
+			decoded->objects[index].supported_object;
+
+		if (object->evidence_class != ATTESTATION_EVIDENCE_SIGNED)
+			continue;
+		signed_named = true;
+		if (!decoded->challenge ||
+		    !attestation_challenge_length_supported(object, decoded->challenge_length))
+			return -EINVAL;
+	}
+	return !signed_named && decoded->challenge ? -EINVAL : 0;
+}
+
+static int attestation_evidence_request_decode(struct attestation_dev *att, struct ctlv_op_ctx *ctx,
+					       const struct ctlv_cursor *request,
+					       struct attestation_evidence_request *decoded,
+					       struct attestation_evidence_object_request **objects)
+{
+	u32 challenge_length;
+	int ret;
+
+	if (ctlv_attestation_evidence_get_challenge_present(request)) {
+		decoded->challenge =
+			ctlv_attestation_evidence_get_challenge_get(request, &challenge_length);
+		decoded->challenge_length = challenge_length;
+	}
+
+	ret = attestation_evidence_decode_objects(att, ctx, request, decoded, objects);
+	if (ret)
+		return ret;
+	return attestation_evidence_challenge_check(decoded);
+}
+
+static bool attestation_format_in(const struct attestation_evidence_supported_object *object,
+				  const struct attestation_evidence_format *format)
+{
+	size_t index;
+
+	for (index = 0; index < object->formats_count; index++)
+		if (object->formats[index].vendor == format->vendor &&
+		    object->formats[index].value == format->value)
+			return true;
+	return false;
+}
+
+static bool
+attestation_evidence_result_put(struct ctlv_cursor *reply,
+				const struct attestation_evidence_supported_object *object,
+				const struct attestation_evidence_object_result *produced)
+{
+	u32 value = produced->format.value;
+	struct ctlv_cursor entry;
+	bool ok;
+
+	if (!ctlv_attestation_evidence_get_results_start(reply, &entry))
+		return false;
+	if (produced->format.vendor)
+		ok = ctlv_attestation_evidence_get_results_vendor_format_put(&entry, value);
+	else
+		ok = ctlv_attestation_evidence_get_results_format_put(&entry, value);
+	ok &= ctlv_attestation_evidence_get_results_length_put(&entry, produced->length);
+	ctlv_record_end(&entry);
+	return ok;
+}
+
+int ctlv_attestation_evidence_get_action(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+					 const struct ctlv_cursor *request,
+					 struct ctlv_cursor *reply)
+{
+	struct attestation_evidence_object_request *objects = NULL;
+	struct attestation_evidence_request decoded = {};
+	struct attestation_evidence_result result = {};
+	struct attestation_dev *att = attestation_from_ctlv(ctlv);
+	bool mr_dependent = false;
+	size_t index;
+	int put_ret;
+	int ret;
+
+	ret = attestation_evidence_request_decode(att, ctx, request, &decoded, &objects);
+	if (ret)
+		goto out;
+
+	result.objects = kcalloc(decoded.objects_count, sizeof(*result.objects), GFP_KERNEL);
+	if (!result.objects) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+	for (index = 0; index < decoded.objects_count; index++)
+		mr_dependent |= decoded.objects[index].supported_object->binds_mrs;
+	ret = att->provider->evidence_get(att, &decoded, &result);
+	if (ret)
+		goto out;
+
+	for (index = 0; index < decoded.objects_count; index++) {
+		const struct attestation_evidence_object_result *produced = &result.objects[index];
+
+		if (produced->length > decoded.objects[index].supported_object->max_length ||
+		    produced->length > ctlv_blob_len(decoded.objects[index].output)) {
+			ret = -E2BIG;
+			goto out;
+		}
+		if (!attestation_format_in(decoded.objects[index].supported_object,
+					   &produced->format)) {
+			ret = -EPROTO;
+			goto out;
+		}
+	}
+
+	for (index = 0; index < decoded.objects_count; index++) {
+		put_ret = ctlv_blob_put(decoded.objects[index].output);
+		objects[index].output = NULL;
+		if (!ret)
+			ret = put_ret;
+	}
+	if (ret)
+		goto out;
+	if (mr_dependent && !ctlv_attestation_mr_generation_put(reply, att->mr_generation)) {
+		ret = -EMSGSIZE;
+		goto out;
+	}
+	for (index = 0; index < decoded.objects_count; index++)
+		if (!attestation_evidence_result_put(reply, decoded.objects[index].supported_object,
+						     &result.objects[index])) {
+			ret = -EMSGSIZE;
+			goto out;
+		}
+out:
+	kfree(result.objects);
+	attestation_evidence_request_free(objects, decoded.objects_count);
+	return ret;
+}
+
+int ctlv_attestation_mr_get_query(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+				  const struct ctlv_cursor *request, struct ctlv_cursor *reply)
+{
+	struct attestation_dev *att = attestation_from_ctlv(ctlv);
+	struct attestation_mr *mr;
+	struct ctlv_cursor inner;
+	unsigned long id, first = 0, last = UINT_MAX;
+	u64 cursor = ctlv_op_query_cursor(ctx);
+	unsigned int generation = att->mr_generation;
+	bool progress = false;
+	int ret;
+
+	if (cursor && ctlv_op_query_generation(ctx) != generation)
+		return -ESTALE;
+	if (ctlv_attestation_mr_get_id_present(request)) {
+		first = ctlv_attestation_mr_get_id_get(request);
+		mr = attestation_mr_lookup_live(att, first);
+		if (IS_ERR(mr))
+			return PTR_ERR(mr);
+		last = first;
+	} else if (cursor) {
+		first = cursor - 1;
+	}
+
+	xa_for_each_range(&att->mrs, id, mr, first, last) {
+		if (!ctlv_attestation_mr_get_items_start(reply, &inner))
+			break;
+		ret = attestation_mr_props_encode(&inner, mr);
+		if (ret == -EMSGSIZE) {
+			ctlv_record_cancel(&inner);
+			break;
+		}
+		ctlv_record_end(&inner);
+		if (ret)
+			return ret;
+		progress = true;
+	}
+
+	if (!mr)
+		return ctlv_op_query_done(ctx, generation);
+	if (!progress)
+		return -EMSGSIZE;
+	return ctlv_op_query_more(ctx, generation, id + 1);
+}
+
+static int attestation_mr_values_put(struct ctlv_cursor *reply,
+				     const struct attestation_digest_set *values)
+{
+	struct ctlv_cursor inner;
+	size_t index;
+	bool ok;
+
+	for (index = 0; index < values->values_count; index++) {
+		const struct attestation_digest *value = &values->values[index];
+		enum hash_algo algorithm = value->algorithm;
+		size_t length = hash_digest_size[algorithm];
+
+		if (!ctlv_attestation_mr_values_start(reply, &inner))
+			return -EMSGSIZE;
+		ok = ctlv_attestation_mr_value_hash_algo_put(&inner, algorithm);
+		ok &= ctlv_attestation_mr_value_data_put(&inner, value->data, length);
+		ctlv_record_end(&inner);
+		if (!ok)
+			return -EMSGSIZE;
+	}
+	return 0;
+}
+
+int ctlv_attestation_mr_read_query(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+				   const struct ctlv_cursor *request, struct ctlv_cursor *reply)
+{
+	struct attestation_digest_set values = {};
+	struct attestation_dev *att = attestation_from_ctlv(ctlv);
+	struct attestation_mr *mr;
+	u64 id;
+	int ret;
+
+	if (ctlv_op_query_cursor(ctx) &&
+	    ctlv_op_query_generation(ctx) != att->mr_generation)
+		return -ESTALE;
+	id = ctlv_attestation_mr_read_id_get(request);
+	mr = attestation_mr_lookup_live(att, id);
+	if (IS_ERR(mr))
+		return PTR_ERR(mr);
+
+	values.values_count = mr->props->algorithms_count;
+	values.values = kcalloc(values.values_count, sizeof(*values.values), GFP_KERNEL);
+	if (!values.values)
+		return -ENOMEM;
+	for (id = 0; id < values.values_count; id++)
+		values.values[id].algorithm = mr->props->algorithms[id];
+	ret = att->provider->mr_read(att, mr->props->id, &values);
+	if (!ret)
+		ret = attestation_mr_values_validate(mr->props, &values, true);
+	if (!ret && !ctlv_attestation_mr_generation_put(reply, att->mr_generation))
+		ret = -EMSGSIZE;
+	if (!ret)
+		ret = attestation_mr_values_put(reply, &values);
+	kfree(values.values);
+	if (ret)
+		return ret;
+	return ctlv_op_query_done(ctx, att->mr_generation);
+}
+
+static int attestation_mr_extend_decode(const struct ctlv_cursor *request,
+					const struct attestation_mr *mr,
+					struct attestation_digest_set *values)
+{
+	size_t banks = mr->props->algorithms_count, bank;
+	DECLARE_BITMAP(seen, HASH_ALGO__LAST) = {};
+	struct ctlv_cursor item;
+
+	values->values = kcalloc(banks, sizeof(*values->values), GFP_KERNEL);
+	if (!values->values)
+		return -ENOMEM;
+	ctlv_attestation_mr_values_for_each(&item, request)
+	{
+		u64 algorithm = ctlv_attestation_mr_value_hash_algo_get(&item);
+		struct attestation_digest *value;
+		const void *data;
+		u32 length;
+
+		for (bank = 0; bank < banks; bank++)
+			if (mr->props->algorithms[bank] == algorithm)
+				break;
+		data = ctlv_attestation_mr_value_data_get(&item, &length);
+		if (bank == banks || __test_and_set_bit(bank, seen) ||
+		    length != hash_digest_size[algorithm])
+			return -EINVAL;
+		value = &values->values[bank];
+		value->algorithm = algorithm;
+		memcpy(value->data, data, length);
+	}
+	/* Close up the banks left out. */
+	for_each_set_bit(bank, seen, banks)
+		values->values[values->values_count++] = values->values[bank];
+	return 0;
+}
+
+int ctlv_attestation_mr_extend_action(struct ctlv *ctlv, struct ctlv_op_ctx *ctx,
+				      const struct ctlv_cursor *request, struct ctlv_cursor *reply)
+{
+	struct attestation_digest_set values = {};
+	struct attestation_dev *att = attestation_from_ctlv(ctlv);
+	struct attestation_mr *mr;
+	u64 id;
+	int ret;
+
+	id = ctlv_attestation_mr_extend_id_get(request);
+	mr = attestation_mr_lookup_live(att, id);
+	if (IS_ERR(mr))
+		return PTR_ERR(mr);
+
+	if (!mr->props->extendable)
+		return -EOPNOTSUPP;
+	ret = attestation_mr_extend_decode(request, mr, &values);
+	if (ret)
+		goto out_values;
+	ret = attestation_mr_values_validate(mr->props, &values, false);
+	if (ret)
+		goto out_values;
+	ret = attestation_mr_extend_locked(att, mr, &values);
+	if (!ret && !ctlv_attestation_mr_generation_put(reply, att->mr_generation))
+		ret = -EMSGSIZE;
+out_values:
+	kfree(values.values);
+	return ret;
+}
-- 
2.56.0

