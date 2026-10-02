Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68B71175A62
	for <linux-doc@vger.kernel.org>; Fri,  2 Oct 2026 04:15:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790914531; cv=none; b=Ws45Xrp1Gty7wRj2kAhbo07YbVi892CZ+jpeBkn69Peeb5/kBTdPNvrGY348FlMwWa3PGtMAKKQUJ34g9AXQ1pXOhfTGtrjsFaWABNk4kzhtAT9KRoULwqqxwMqlIKcV1VUJWEeZX4TlcKz962Cb0SgAn+ZAinV7V5Jy5pqBWZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790914531; c=relaxed/simple;
	bh=qEpCCNFio2iaESKTqfGgNYuFlMgPhAmm2vmNFrdbijM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=FqzyGuNPCqCpVeCRfyfHI5XmG8Fh8XCHGlv5zdieZi29U0dpzfLN4neel8T+2e9qyfrytDWZA9ciuosy0sqCIyQg6mnIReNYj17+0tovxETAZFMDpIZQ+x8Ki8hpU/l6suoohfNQASvZrOzkFcYwHwCUZtHDuw5MCAQrEF/MrzU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d3xg2BKO; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d3xg2BKO"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ff96ce221so1677665e9.3
        for <linux-doc@vger.kernel.org>; Thu, 01 Oct 2026 21:15:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790914529; x=1791519329; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AIDrugdzd2VRvxrjP7DNmuK/HUl0lALqvQgqwdaAuLE=;
        b=d3xg2BKOmA90d5rZ0VBaZabiLPOtldOdDrFXThx0C9O2DCQz+QVwr7Ia8L/pd/R4z9
         JWMGur/W/2m8NwIPZCHd5l1Kak3zqrGuuUNufD4mr3OrED1/7a4bl7CvZYNsjzWaETdY
         SAAKfYyoEnaxPAK3KgCbcfJkhEWhHHQKwxuXLhK9F2hwsSjqzVXds2b6GuLmpd2qgAkr
         zvE1gp3bUAtxcns6pEux8DhUlxLxJZ+Chhuisvvp3inS8PQJmnV/19nyMnWXcYgc4Sw2
         9/qVBIlqMBNp4OC5WCQ0zFzsAWhzaxsa3m9u0VPGG7HaJB8xnQlHw3rOjCqI++Oq4Ffj
         +p8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790914529; x=1791519329;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AIDrugdzd2VRvxrjP7DNmuK/HUl0lALqvQgqwdaAuLE=;
        b=BeEa7GqwZq/aYE2jewl0bPKCykvYbdh8Sad7iFuBAmgZvwm6tMTeW0zs68sakK5uuL
         dXWRpZmQZ/ox7y7dJKasjtf66ptkwRcN032zcrTT9WLgJCaiF9QwU0Mo+CwQq18JDsQT
         X0U4aoqtEQBZIqAbkp9kWY1nLvV+ZCmU+N69jIVvN1aSmpVeZX4LNiBdg/q0p2PVDtXx
         zz+xaQa0jZHDtUe8qKABcitfcNE4ZoVXlLKYBDCpBEY7WY/0q6EzadU+rF+pyW3a7iii
         4MA1VCFcx5aODnx6N1FVOTsgY0555q+kmLxW9dCSknFDs6hSgt1wYyLZ8dflgNpxvcRP
         cINA==
X-Gm-Message-State: AFuF++m2L558Z5j8Ar6Fe+3plFT7VdfydHxXcVE66lxEo79Q8xy/+PXU
	S6jsHzY+F7e7s9xxVMWXkZe6FHT1zDxqJ430LamjiVkhw3nDeQbPl6YTJr90UAqHKDWpT8Kc
X-Gm-Gg: AYBFou2xQ13jdFvhH3eK3t71VhmIV+yVV4Nek6RJ8y/eHXrIKVLU9kPHldglzF1N7Ok
	M6wKEXLm07wl4wpuuqxHzfM3sslFdElmexGv0JGScjkoYaQLJ4USke0OU4DS5BSbnGpMuTV/fay
	yTosCwS9RcOfnow7Yg9VuWLyueAm68G71i0WtBQ/qSGpFQCLSICVjqb2rCYeZqJhzYv3l9bwzXP
	ctA3riWpnkND38p3QEsRzTl1s1PFM9ZfrpfF628ZKqIjT6SkDJFVLQhL54H4pQ48di16Ku0ttEG
	7YzD4t5+tUz13iBtHzYNgI/qiY4wFGZgycK3dwosQqiCOWG/BkKl9PSdKB+rpgHQjFXlMlRqNwr
	U6/nvmq1Ix5d05mhIxOQlA5YsqUxU6OGF+A9is5i6ewdO+UR7rfnkZvID0rYwbogITDM4ogweIh
	JrxNHjC1t7f28xlRfpvii6y0+yvwAW10+VDjye3GNgkz0geqJlikEnXA+SQk8icNiGZ8IadtLoF
	EsvS9F/Pkr9OTYoQatd7LRpqduN3AI=
X-Received: by 2002:a05:600c:6384:b0:4a0:13d8:cd0c with SMTP id 5b1f17b1804b1-4a02769886emr25697315e9.2.1790914528481;
        Thu, 01 Oct 2026 21:15:28 -0700 (PDT)
Received: from Nuel20.localdomain ([105.118.71.106])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a03ff3cab2sm13522835e9.2.2026.10.01.21.15.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 Oct 2026 21:15:28 -0700 (PDT)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	mchehab@kernel.org,
	aleksandr.loktionov@intel.com,
	bvanassche@acm.org,
	emmaonana18@gmail.com,
	tudor.ambarus@linaro.org
Subject: [PATCH] docs: kdoc: strip DOMAIN_NS() wrapper in function prototypes
Date: Fri,  2 Oct 2026 05:15:19 +0100
Message-ID: <20261002041520.42061-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

kernel-doc fails to parse functions whose names are wrapped in the
DOMAIN_NS() namespace macro, e.g. in
drivers/iommu/generic_pt/iommu_pt.h:217:

  ... expecting prototype for iova_to_phys(). Prototype was for
  DOMAIN_NS() instead

function_xforms is the designated place for unwrapping function-name
macros, but it has no entry for DOMAIN_NS(), so the macro name is kept
as the prototype and the real name leaks into the parameter list.

Add a transform expanding DOMAIN_NS(op) to op, following the existing
DEFINE_IDTENTRY_IRQ precedent.

Add a regression test for the wrapped iova_to_phys() declaration.

Signed-off-by: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
---
 tools/lib/python/kdoc/xforms_lists.py |  6 ++++++
 tools/unittests/test_kdoc_parser.py   | 22 ++++++++++++++++++++++
 2 files changed, 28 insertions(+)

diff --git a/tools/lib/python/kdoc/xforms_lists.py b/tools/lib/python/kdoc/xforms_lists.py
index e3dda2fe8a53..5e8bd9117895 100644
--- a/tools/lib/python/kdoc/xforms_lists.py
+++ b/tools/lib/python/kdoc/xforms_lists.py
@@ -91,6 +91,12 @@ class CTransforms:
         (CMatch("__diagnose_as"), ""),
         (CMatch("DECL_BUCKET_PARAMS"), r"\1, \2"),
         (CMatch("DEFINE_IDTENTRY_IRQ"), r"static void \1(struct pt_regs *regs, u32 vector)"),
+        #
+        # DOMAIN_NS() wraps a function name with a namespace prefix
+        # (see drivers/iommu/generic_pt/iommu_pt.h). Unwrap it so the
+        # real function name is parsed.
+        #
+        (CMatch("DOMAIN_NS"), r"\1"),
         (CMatch("__cond_acquires"), ""),
         (CMatch("__cond_releases"), ""),
         (CMatch("__acquires"), ""),
diff --git a/tools/unittests/test_kdoc_parser.py b/tools/unittests/test_kdoc_parser.py
index c4a76ed13dbc..4b47a858824a 100755
--- a/tools/unittests/test_kdoc_parser.py
+++ b/tools/unittests/test_kdoc_parser.py
@@ -418,6 +418,28 @@ class TestSelfValidate(GenerateKdocItem):
         """
         self.run_test(self.SOURCE, [self.DEFAULT.copy()], self.EXPORTS)
 
+class TestDomainNs(GenerateKdocItem):
+    def test_domain_ns_wrapped_function(self):
+        source = """
+            /**
+             * iova_to_phys() - Return the output address for the given IOVA
+             * @domain: Table to query
+             * @iova: IO virtual address to query
+             */
+            phys_addr_t DOMAIN_NS(iova_to_phys)(struct iommu_domain *domain,
+                                                dma_addr_t iova);
+        """
+
+        kernel_doc = KernelDoc(self.config, "test.c", self.xforms)
+        patcher = patch('builtins.open', new_callable=mock_open,
+                        read_data=dedent(source))
+        with patcher:
+            _, entries = kernel_doc.parse_kdoc()
+
+        self.assertEqual(len(entries), 1)
+        self.assertEqual(entries[0].name, "iova_to_phys")
+        self.assertEqual(entries[0].warnings, [])
+
 #
 # Class and logic to create dynamic tests from YAML
 #
-- 
2.43.0

