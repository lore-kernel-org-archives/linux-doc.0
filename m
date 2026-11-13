Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794586146;
	b=XTVkp++WJ5ucGotYhPHvpgEQkM3QlwOSbMmqMs4UeOdNjfWtRLV/QCCdw7cgtt0hDl3O
	 M0yiEMWUgc7bx38aXR9HhuA4kj+c1cISEmRCElw6Y4SNPhLovQ9iS7zULHYbMcBxkvNh1
	 lnCW3k/OrVU5S1FQcBL8HI2KuIt1Ok7K+5HxC5tFeXt6iNAbqlK9o6/JrUCIHSsyr0DoH
	 QK0qdglhwJnPBYkSEu/hI1mi2ri6MDucvkkVh5FB66nPkvKNRS+iKirkhDxQyyXjlZwHD
	 nJMEFjXR+WsLJ7p9r7Jcxaa95TpoYADbKFDG9TAHO8Qr3iLgXsLypXdt9lH6CzFbD9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794586146;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=4K5GlaUAwj7rlWDE+PadxXcNrAnxe+HtCl8GDdjerQY=;
	b=dOfhZCZtaHL8t4NAPWFMzq/Qor7oRIeqazWe8km145SHZEMwCPt26IHxEcEI1nZwR5VQ
	 mqVYZ9EV3KrIBpn+MtouZkQwDncQbalm7HcQCly9VfB8M4NfGCfQjLq9D0haPUnnDfo3k
	 Sp8upj/tyns3x6zTmQPcuEQ5SHgDHFoC2mSqn3F+axLK8XekUKB78u9Hj8+DTyuptDDWV
	 lWDtn2y84h2p4JWgW1c2M1VYe7hVmIODE+u6ETB9ZIY8hkavXwY5QQpswrggzMwcL4+Yc
	 9zD7tyKm27fL5T6dL5rZsxm+1pvCtAjrcETdtWT2mrTFdLjujfvngCeZgvOmcnZDzUw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=L5aslh9k;
	arc=none smtp.remote-ip=209.85.221.54
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9050D6079075
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 16:09:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9050D6079075
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=L5aslh9k
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-492fcbfaa88so573552f8f.3
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:09:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1794586145; x=1795190945; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4K5GlaUAwj7rlWDE+PadxXcNrAnxe+HtCl8GDdjerQY=;
        b=L5aslh9k03tHIBpBWCF7LXJtSlzgiBwZaQi6ETohTvC/Xpm9VReBQUFcwWdubgvfKW
         gA50G/nbPuO+4A9BAz6iT3DxrCFemceLT8tbgtvonEC3tghMbtAFmCO00V+mz2qnjc0t
         Yjcx8gjzIenwXY0C1P+pLN06pW4qhOILA6+cA8p7s0DsCu4VRtAbIMzVpj1KTZb87BoY
         t1WXv/s7uc2Es+gPW+eIj6GHEUrmhjanxjM1RL6cqLupH4M7y4rp/toUPVbnSikae0xp
         7AFMWwwr+2dLfxXnU8eNtLJt+cMoO/Zn+pxn5C47LcxV8xb1yEK0/IKm/g9E+WYJ6FV0
         Sirw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794586145; x=1795190945;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=4K5GlaUAwj7rlWDE+PadxXcNrAnxe+HtCl8GDdjerQY=;
        b=D0j32xeR/qRC9FENlD0a9ieDSrZ/QzjPOIXx0g16QNx/mwgRPQTskQgAXTfTZNeDTe
         oIfvrRlMBkE+2nWGt43xA0ld8RQStUuKZm9MgH8JUllJx2sxZNBs/yUBfkIbX3vX0Vgo
         nJYPpGRqEZbjcsKcG7zvYbrnCjQ3FEQHeKfhUJ8S5l3u1FarKSbhc68nLdUF/x/gPS4T
         puhh+fQtkaWUabolhvjjBW8g/eJkTLktnUV2166wtxZgW8KZ8FC12iAVRYJ9X5hs78O6
         g5nASP/Wb9jrq5g5j9UOMY8CSfPNsVT1Br4mlPLBxgh/xGlShG1KAIB48kgIh5tE74gs
         6Q3A==
X-Forwarded-Encrypted: i=1; AL+hErE18G1gNit0Jphngl44HIlVY/dnoND0A9tsgwL6QXiJWCRqxUAc4cQwH2Uf/qe31EZIfDuJ11hHbmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z82fTtieLtSOPq+yYoqfw8gmzTU4FP+bABEANvF25Kerwe4WvLb
	jqTO5WHzoi9DOBQ/iu64OGQ1Q5pdPZq5YXtXLESitrFZVkwl1tZ7l+LvO4c36zXmxwM=
X-Gm-Gg: AYBFou1XvQwxfkXe2DCQvqG6xtLRtOMTbQI/k17yxvE5XfPa61c1vWL0XYPA4gJQw5E
	cJBvIsk8btmACb1BOyX7myxo4P8NYRTqAzo3WNbal4+LsfDL94TpRsDmi2nS1JDD27hC2Z421K4
	9WLVYzqTQGOLmHog2/Wm5OzDfpr/qLwE5wSjPoI+4HfEBEsMpec0rGDtpgHLKbRYl/7jpSr8N63
	I07dc8bnPYuYHapdP8OkFVVOxvPLpL0Oq9vEJf63nLeUKjFy0xA6zblMUNuNzGVOu/IBgMaskaf
	bggk8K4cqz8iu38p0nxExYGiMHAwjZNysHBQd8ufQuV5L9UHcWpPpI0aPT2cg+9B1TxDu5KD8es
	CcCO7dWpgbDVagZvWdm5sSo7loiIZqksOORcY5iSUbF587Ts8ODm04JQwatCNjeQrm8j1mqyEYs
	gC/Za4OpjIcott4CyIXWrKoeoD7RNp6bL+x39xaVR0v6kK7UHk53RoBFWbI9Y6+IXhuuxQQMngh
	Z0UTDIKFhDFUbM9S76C/UI2J1tfq5KXFxNpG96SkommygJhgGHtsxSyyEo8HPTZRTxUKik2fY/m
	6EWGWfb9/dURx41Ina72wZ+SNmKHO0uUpjx/xmFlfgC/CBV4VC5NaxYsD3VPaA==
X-Received: by 2002:a05:6000:4289:b0:492:b221:ac38 with SMTP id ffacd0b85a97d-49c7381b4e2mr6215071f8f.26.1794586144718;
        Fri, 13 Nov 2026 08:09:04 -0800 (PST)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c5f7828a4sm6181115f8f.23.2026.11.13.08.09.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 08:09:04 -0800 (PST)
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
Subject: [PATCH RFC v2 6/9] Documentation: attestation: Describe how to write a provider
Date: Fri, 13 Nov 2026 17:08:35 +0100
Message-ID: <20261113160838.2512652-7-jiri@resnulli.us>
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

Describe how a provider registers with the attestation core, how other
writers share its MRs and how it is torn down, with the kernel-doc of
the provider API.

Assisted-by: Cursor: GPT-5.6 Sol
Assisted-by: Cursor: Claude Opus 5.5
Signed-off-by: Jiri Pirko <jiri@nvidia.com>
---
RFC->RFCv2:
- split out of the provider and instance core patch
- dropped the journal from the overview
- said how other writers extend the same MRs
- added the kernel-doc to the driver API page
---
 Documentation/driver-api/attestation.rst    | 99 +++++++++++++++++++++
 Documentation/driver-api/index.rst          |  1 +
 Documentation/userspace-api/attestation.rst |  3 +-
 MAINTAINERS                                 |  1 +
 4 files changed, 103 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/driver-api/attestation.rst

diff --git a/Documentation/driver-api/attestation.rst b/Documentation/driver-api/attestation.rst
new file mode 100644
index 000000000000..4137a856aea9
--- /dev/null
+++ b/Documentation/driver-api/attestation.rst
@@ -0,0 +1,99 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+
+===========
+Attestation
+===========
+
+The attestation subsystem gives each provider device a node of the
+``attestation`` class, ``/dev/attestation/attestationN``, which answers as a
+descendant of the ``ctlv-attestation`` family, one family per provider.  A
+program tells providers apart by the last entry of ``family-get`` on the
+open device, and generic tools use the ``ctlv-attestation`` operations on any
+of them.  The subsystem owns common evidence retrieval and
+measurement-register topology.  Providers retain ownership of native hardware
+access and immutable capability descriptions.
+
+Registering a provider
+======================
+
+A provider embeds ``struct attestation_dev`` first in its own structure and
+allocates both with ``attestation_alloc()``, passing its
+``struct attestation_provider`` and its family descriptor, which inherits
+``ctlv-attestation``:
+
+.. code-block:: c
+
+    struct foo {
+            struct attestation_dev att;
+            struct foo_hw *hw;
+    };
+
+    foo = attestation_alloc(parent, &foo_provider,
+                            &ctlv_attestation_foo_family, struct foo, att);
+    if (IS_ERR(foo))
+            return PTR_ERR(foo);
+    foo->hw = hw;
+    ret = attestation_register(&foo->att);
+    if (ret) {
+            attestation_put(&foo->att);
+            return ret;
+    }
+
+A provider callback gets the ``struct attestation_dev`` and reaches the
+provider's structure with ``container_of()``.  A CTLV callback of the
+provider's own family gets the CTLV instance, which
+``attestation_from_ctlv()`` turns into the device.  No provider callback runs
+before ``attestation_register()``, so the provider finishes its own setup in
+between.  The descriptor, evidence capabilities, fixed MR properties, strings
+and arrays remain immutable until the last ``attestation_put()``.
+
+The subsystem embeds the CTLV instance, and its hooks run every operation,
+those of the device's family included, under one instance mutex.  That
+serializes an operation and its native callback.
+
+Every MR can be read, so a provider with MRs implements ``mr_read``.
+Fixed MRs are listed in the provider descriptor.  Their property storage
+remains valid until the last ``attestation_put()``.
+
+The evidence capabilities list the objects ``evidence-get`` produces, each
+object's ID being its index.  An object gives its class and the formats it
+may have, ``ctlv-attestation``'s ``evidence-format`` or its family's
+``evidence-vendor-format``, and a signed object its challenge lengths.
+``attestation_alloc()`` refuses a format the family does not give.
+
+``evidence_get`` writes each object with ``attestation_evidence_write()``,
+which fails the operation with ``-EMSGSIZE`` where the caller's blob is too
+short, and tells the caller how long it has to be.  It fills in each object's
+result: the format written and its length.  A format the object does not list
+fails the call with ``-EPROTO``.
+
+Other writers
+=============
+
+This interface is not the only way to extend a measurement register, and it
+does not arbitrate between the ways there are.  Every program holding a
+read-write descriptor of the device can extend a register through
+``mr-extend``, and a register with a native interface of its own can be
+extended through that too, as a TPM's PCRs are by programs using
+``/dev/tpm0`` or ``/dev/tpmrm0`` and by IMA.  Nothing reserves a register for
+one writer.  A register two writers extend holds the extensions of both, in
+the order they arrived, and ``mr-read`` and the evidence report it as it is.
+A program that replays a register from its own records has to be its only
+writer, by agreement with whatever else runs on the system.
+
+Teardown
+========
+
+``attestation_unregister()`` first removes the node, so nothing opens the
+device again.  It then withdraws the device from the kernel registry, refusing
+the operations of files still open.  Only then does it unpublish the CTLV
+instance, which drains the operations in flight.  No provider callback runs
+once it returns, so the provider may release its native state before
+``attestation_put()``.  Open files keep the structure until they close.
+
+Kernel API
+==========
+
+.. kernel-doc:: include/linux/attestation.h
+.. kernel-doc:: drivers/attestation/core/core.c
+   :export:
diff --git a/Documentation/driver-api/index.rst b/Documentation/driver-api/index.rst
index 0c5b9d2165d8..625355c504ef 100644
--- a/Documentation/driver-api/index.rst
+++ b/Documentation/driver-api/index.rst
@@ -38,6 +38,7 @@ of interest to most developers working on device drivers.
    early-userspace/index
    connector
    ctlv
+   attestation
    device-io
    devfreq
    dma-buf
diff --git a/Documentation/userspace-api/attestation.rst b/Documentation/userspace-api/attestation.rst
index 3c610acc3382..16646d8b60d7 100644
--- a/Documentation/userspace-api/attestation.rst
+++ b/Documentation/userspace-api/attestation.rst
@@ -16,7 +16,8 @@ The node speaks CTLV, described in :doc:`ctlv`, as a descendant of the
 belongs to ``ctlv-attestation``, so a tool written against it works with any
 provider. The specification is
 ``Documentation/ctlv/specs/ctlv-attestation.yaml`` and the constants are in
-``include/uapi/ctlv/ctlv_attestation_gen.h``.
+``include/uapi/ctlv/ctlv_attestation_gen.h``. Writing a provider is
+:doc:`/driver-api/attestation`.
 
 ======================  ======  ==========  ================================
 Operation               Type    Access      Purpose
diff --git a/MAINTAINERS b/MAINTAINERS
index e57fc8bb9c1d..172b20d5fdd1 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4439,6 +4439,7 @@ L:	linux-security-module@vger.kernel.org
 S:	Supported
 F:	Documentation/ctlv/abi/ctlv-attestation*
 F:	Documentation/ctlv/specs/ctlv-attestation*
+F:	Documentation/driver-api/attestation.rst
 F:	Documentation/userspace-api/attestation*.rst
 F:	drivers/attestation/
 F:	include/linux/attestation*
-- 
2.56.0

