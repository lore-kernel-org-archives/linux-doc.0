Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768C29E10F
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 03:17:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760930250; cv=none; b=dmoLaFXMJT2dn2RmqrO9JbF4z+FjHaT0dGeZ38XpsyOP8DrcE/poGRuX+hQZbA1xEMHQ5FOIba+Po47FHR4C1912Dy0o6VxjX4WGQ/1aYQ67SOm8ccQrPqE4+7feWznxOqNNcp8KG1R2TWWHrhK5J610nyQH5HQT/yYIZZUDVD8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760930250; c=relaxed/simple;
	bh=67tstnZQtFomumySgDLtAWENQiAj9CP/JvCGAp8ZJA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WViC3Dw47peE+WI7w+siTvYMCau13a9nK4tl/QNZQK4NlDhQJdwxrkau+6K1POXFXDCmTwQRRplLyY0omvS0v/zO4dQ1hGG8lGUgewMAh+ecizY0dlFIIbDbs5KlroSZ3mZvcCv3IEYXNKYu/hPu3JpLDXmmjeDl9mMsp0VaSsY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVyaMwOq; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVyaMwOq"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-27d4d6b7ab5so52640685ad.2
        for <linux-doc@vger.kernel.org>; Sun, 19 Oct 2025 20:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760930248; x=1761535048; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kgY8zZ+/XYQ7X1ie6Z77HlsEOZA2/cqevW2Opv26tkA=;
        b=bVyaMwOq9BD6dVXg4Mr2zkvjYMcAx17kvvDnDBfHEG/GvBIK831pSBiY06aU10RM04
         Z0JNUT56R4v8jAj10InpXxTK18M61+mi/8XfDq11W8QZdjRwHgO52AQnU4Fwyx2TEF+/
         i5rgY3lnBelmllCkRL3hkCStVUeDfaN7XVRPm+wg1GUbszKm3VJiRgYpmM+Dbg+gpgdN
         mZznupTHYtyD6NW50FKeUUKKGAAOiTL+HVEWFNtJ6lx+nH+5fJDVCiRbvdTqMYsAU9Bc
         RfaF3Nhn0M/HF+zbiaMVU38XpkLvqSLZ3pUefzBj3YDpW3Wl0dUL8bJztWHQQ+yT9DBI
         DfHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760930248; x=1761535048;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kgY8zZ+/XYQ7X1ie6Z77HlsEOZA2/cqevW2Opv26tkA=;
        b=q0Q+5zSnXl3/fQztllpyVFUIMjrOgVqc09jHUI63FdJQy4lD/TMkOqh2kidW31+Nd3
         GZyexGAcVSt6loe1u9bmTCffjrZE0nJjxzGTa08iNO3mJQaABiraS4Fhf6ALbYe09UdO
         xCdsgIPSLpKhi+4C4MXp1dmXCklGlozUpYXMbiRbUDHOhGQ2n1wx2XEY1rQ111JYSnEN
         6MECAkSprFIIX087E6ECJe0lEZ3/+vxRdhfzpk+KW74ZlURf4zsAB9lboFTCxJk8ow8S
         FsLyYL8ePEYfsyUsPX2ihHACRHjSWccrBca5GjqaD/q31Kl/lwlPHCGLM0sjm8vEeu51
         adZQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTVHRjYhSpU+evys1QkzIbd2PwdTtzZbl0RwO8tECQ9lJxre9xBnjd5HGIgodrmC7Vcact89CCbqA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuzp1v1Kbs3lpSUD6diebgK+D6qABVKctKT7AVuGObRIR8buj4
	9jbYDXzlOS9jBRRDMaJ5Vnx3eDkLtEXYMgixSjY6otS/7zooicAFFhGH
X-Gm-Gg: ASbGncvuBAGQeft40UXC2T1uBvQViarP951auA3tjykPeetA/D0Qck429fPt8HTxTXv
	5YiDuKiFhM+mmLrfrwg++MSvC+nTNtOA0PabDfn+kcHPjspLpo8Y5mUtqsWjmTaJvt9iDxKScJ3
	jbFNZKuc1o26MpzwGB8uFSQ+T0W3V5+Repc0A9ctWJ7eQHSF/eTwVbWIJ+R1AwWfXDTSPkkCYxJ
	cbzjDFoNM5v+zl6kbGgY+8E6EJJi01tkVrz8qEwX9JtR1GML48sh1+Z26sLmYN0xqryHHZk8wcd
	Tuyj+LGrDl4HpHub6rvX4Pd+cN56hjnsiElgwXBBn+X21XYAGo9vyMgYFdDi5XJPafQuIZ5MKg8
	jZxK9AqhYUqXkj500N7Ismqcmlvc0GgDCc+dfHGJBPvknL2DVMk0YvPLWRY0C+RWi6UrmBlPKpE
	TrbZZeUHRtif6d8zrhJn1wLBc98FXoPW7DZYPhQKhBcgDPkg==
X-Google-Smtp-Source: AGHT+IHVM+3Yo7hTmlmKN8A82OrKb4FDTGmFMRc6s6X9qctctr9R21jaCigysyc8KxazAaAwSj+mYg==
X-Received: by 2002:a17:902:ce07:b0:290:a3b9:d4c7 with SMTP id d9443c01a7336-290ca121944mr137614825ad.30.1760930247823;
        Sun, 19 Oct 2025 20:17:27 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1da1:a41d:3815:5989:6e28:9b6d])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-292471fddfesm66373435ad.88.2025.10.19.20.17.19
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 19 Oct 2025 20:17:27 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
	martin.lau@linux.dev,
	eddyz87@gmail.com,
	song@kernel.org,
	yonghong.song@linux.dev,
	john.fastabend@gmail.com,
	kpsingh@kernel.org,
	sdf@fomichev.me,
	haoluo@google.com,
	jolsa@kernel.org,
	david@redhat.com,
	ziy@nvidia.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ameryhung@gmail.com,
	rientjes@google.com,
	corbet@lwn.net,
	21cnbao@gmail.com,
	shakeel.butt@linux.dev,
	tj@kernel.org,
	lance.yang@linux.dev,
	rdunlap@infradead.org
Cc: bpf@vger.kernel.org,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yafang Shao <laoar.shao@gmail.com>
Subject: [PATCH v11 mm-new 07/10] Documentation: add BPF THP
Date: Mon, 20 Oct 2025 11:16:52 +0800
Message-Id: <20251020031655.1093-3-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251020031655.1093-1-laoar.shao@gmail.com>
References: <20251020031655.1093-1-laoar.shao@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the documentation.

Signed-off-by: Yafang Shao <laoar.shao@gmail.com>
---
 Documentation/admin-guide/mm/transhuge.rst | 113 +++++++++++++++++++++
 1 file changed, 113 insertions(+)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 1654211cc6cf..4d2941158f09 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -738,3 +738,116 @@ support enabled just fine as always. No difference can be noted in
 hugetlbfs other than there will be less overall fragmentation. All
 usual features belonging to hugetlbfs are preserved and
 unaffected. libhugetlbfs will also work fine as usual.
+
+BPF THP
+=======
+
+:Author: Yafang Shao <laoar.shao@gmail.com>
+:Date: October 2025
+
+Overview
+--------
+
+When the system is configured with "always" or "madvise" THP mode, a BPF program
+can be used to adjust THP allocation policies dynamically. This enables
+fine-grained control over THP decisions based on various factors including
+workload identity, allocation context, and system memory pressure.
+
+Program Interface
+-----------------
+
+This feature implements a struct_ops BPF program with the following interface::
+
+    struct bpf_thp_ops {
+        pid_t pid;
+        thp_order_fn_t *thp_get_order;
+    };
+
+Callback Functions
+------------------
+
+thp_get_order()
+~~~~~~~~~~~~~~~
+
+.. code-block:: c
+
+    int thp_get_order(struct vm_area_struct *vma,
+                      enum tva_type type,
+                      unsigned long orders);
+
+Parameters
+^^^^^^^^^^
+
+``vma``
+    ``vm_area_struct`` associated with the THP allocation.
+
+``type``
+    TVA type for the current ``vma``.
+
+``orders``
+    Bitmask of available THP orders for this allocation.
+
+Return value
+^^^^^^^^^^^^
+
+- The suggested THP order for allocation from the BPF program
+- Must be a valid, available order from the provided ``orders`` bitmask
+
+Operation Modes
+---------------
+
+Per Process Mode
+~~~~~~~~~~~~~~~~
+
+When registering a BPF-THP with a specific PID, the program is installed in the
+target task's ``mm_struct``::
+
+    struct mm_struct {
+        struct bpf_thp_ops __rcu *bpf_thp;
+    };
+
+Inheritance Behavior
+^^^^^^^^^^^^^^^^^^^^
+
+- Existing child processes are unaffected
+- Newly forked children inherit the BPF-THP from their parent
+- The BPF-THP persists across execve() calls
+
+Management Rules
+^^^^^^^^^^^^^^^^
+
+- When a BPF-THP instance is unregistered, all managed tasks' ``bpf_thp``
+  pointers are reset to ``NULL``
+- When a BPF-THP instance is updated, all managed tasks' ``bpf_thp`` pointers
+  are automatically updated to the new version
+- Each process can be managed by only one BPF-THP instance at a time
+
+Global Mode
+~~~~~~~~~~~
+
+If no PID is specified during registration, the BPF-THP operates in global mode.
+In this mode, all tasks in the system are managed by the global instance.
+
+Global Mode Precedence
+^^^^^^^^^^^^^^^^^^^^^^
+
+- The global instance takes precedence over all per-process instances
+- All existing per-process instances are disabled when a global instance is
+  registered
+- New per-process registrations are blocked while a global instance is active
+- Existing per-process instances remain registered (no forced unregistration)
+
+Instance Management
+^^^^^^^^^^^^^^^^^^^
+
+- Updates are type-isolated: global instances can only be updated by new global
+  instances, and per-process instances by new per-process instances
+- Only one global BPF-THP can be registered at a time
+- Global instances can be updated dynamically without requiring task restarts
+
+Implementation Notes
+--------------------
+
+- This is currently an experimental feature
+- ``CONFIG_BPF_THP`` must be enabled to use this functionality
+- The feature depends on proper THP configuration ("always" or "madvise" mode)
-- 
2.47.3

