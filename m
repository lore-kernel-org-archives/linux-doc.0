Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50B725DB06
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 14:18:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760537934; cv=none; b=MSDQwK2XNGZWsiBMZ7ONtJVMCkiekjigiqPp9JbZsVsY7z7jKascHuSRt+fIGNamEWunH8YZ6qvDYlZK6qPKMEFLxfHCRZHkz+7IeKT16w8bri0eeeKMJmrSrLY2WeuG32supnybeX5WBG+rO6eU7gbtHxzMJDD9fvScQjwDPs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760537934; c=relaxed/simple;
	bh=M3JDOPbFjkClAC4UX2vhrNDOfN9b6bNYa0hiNAn1emM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NNxIyOvfMPuH2ZVxEQKhY1vrR2V3yxnYQPjqgCd/GqiH71CgQ4KBIdBH8QNkGQXnX/zoXxZK1F+JAIZckl4wQWTVQMPOcsyYoifQZVb/dtzyp0SRskXzCP74VyZ+ubtTEsWJXxC+LPfT+4of0WcfkRLQAoHnGrDdZ4YMsArihxs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E2wH7hDz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E2wH7hDz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-27eed7bdfeeso12718945ad.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 07:18:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760537932; x=1761142732; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHmEXjchUo7p5MNeEkw3mVcK0Ae4ArUpPhVglZardsE=;
        b=E2wH7hDzkRL8PDMBeI58qq8pdyGWoikElGN309zi0u6ZTb1JapYfMPznTFuqZRZ2UB
         3mZ/Qs/+Io1RctJyUUxKvqV+D7EQCmcWS/6E3fFjkEw+jQl7Rmtvs7BrmPy5evCmmiGJ
         jxeNVba1Oa3GYxFYXVaT96nevEw5qc9H64tU0Rc4VsyExhps/G4PhgMZACV90vBxWSP4
         VYRSw5kqiQwpy6A96SoU597khVuy13j0taQh4ZM3OoYMYYon8qfPhm27AyncFFUHZAza
         EIheK9S9Wypf2cyAlr88lDViKiap4eAtW8mRWX0GK+1PcKH9/5yi41ZSYagXDhMBXacG
         dt2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760537932; x=1761142732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHmEXjchUo7p5MNeEkw3mVcK0Ae4ArUpPhVglZardsE=;
        b=PBUhSjH/BVcTY7ZG3rv0nfhMgS7MRSnhpxTSLyl9y0Sl0cawJcn1kMb9gNzW6M9MON
         15dUBI6xD6+Zhz0WtIDCY4EoRNGMuWGfsq3iWPF9hHC4+YjX8IBbeV0EAwLT260rJQ5t
         garV6LoUPRO/1QWXcuTrXZVdCpINmPS0SMaA7sSvI4Un89o9pI4ds0pS+dbH+Qg9NGjU
         VeIISVM1QGXycSQISA5RTsVAU4GJdShRggxThWviRADs+bhbhJTTEvOYLF0geaZtujh1
         bcIGJKFZTvD5m2Z95q/ULJK7GpnN87h4aHvjQj7Vf9TGAi+eu9nXC0cdUOTtYnnWz4Xk
         bKrg==
X-Forwarded-Encrypted: i=1; AJvYcCVBrIlAXu6rn1aTrazGvYYaoQkpXgkIry2S6Wbdp9NhomZJLJVRCGqTa2O6I6TFSijSoH2ZDKwVueo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRM2B7XtyB+zuy1RtlGlbDgrAsWpxBeV8h027WjL7hP4AisF5v
	clabXtCx9B+EIkvVUTDANrDKbg3i1L7vKwzIV7j7KnynNYwXfVKqHVVc
X-Gm-Gg: ASbGncs1r8dJMP06muXbKSpk8ngZAVdT5k3imPEwxMjfQMpD7TLcqYQHtmYcKGky76t
	vG2zJRzR676SUiIkg4BGIiuPf7zjjij8GJaGbe349cO7xNE9OH2SuWtADFYUTUoyORnGoYoOddU
	XZ5xYDlrV8GuyubDGi317phgXfXbDPK+lwmzimi28M8ho9HOQt0YZSMP9vk9vMZWUIGqS0sKtsM
	brmwP4URwRTraPN8CO4BDTEi/8ItR3NriqRHbAGMhCjjnT2QbfXIy22N7jiuWK1Hc0y+2XxIQnW
	IUAVaHm53zSdbTbFF9yKUBUtE+hRXxzIj4L4lgopcsrIJ6SRXqoY1TjDAKIj0ACc4zUG8Kkpk2f
	w5u17fPNsD3+/1ct3w9byn3c8j973/J69xJm4Uu/bWOzAieabD628PAEhAJFZXdAdfD4jUc7n8j
	UcFV4GIQ==
X-Google-Smtp-Source: AGHT+IGPkoQEyym4vrrdjP+BNzpJr8ZiqPYTLWrM9emXz1prPZyu27GMgJiwVA1OnHpVqgCC5eI05A==
X-Received: by 2002:a17:902:cece:b0:27d:6cb6:f7c2 with SMTP id d9443c01a7336-29091b162f4mr3433615ad.17.1760537931868;
        Wed, 15 Oct 2025 07:18:51 -0700 (PDT)
Received: from localhost.localdomain ([2409:891f:1b80:80c6:cd21:3ff9:2bca:36d1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f32d6fsm199561445ad.96.2025.10.15.07.18.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 15 Oct 2025 07:18:50 -0700 (PDT)
From: Yafang Shao <laoar.shao@gmail.com>
To: akpm@linux-foundation.org,
	david@redhat.com,
	ziy@nvidia.com,
	baolin.wang@linux.alibaba.com,
	lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	hannes@cmpxchg.org,
	usamaarif642@gmail.com,
	gutierrez.asier@huawei-partners.com,
	willy@infradead.org,
	ast@kernel.org,
	daniel@iogearbox.net,
	andrii@kernel.org,
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
Subject: [RFC PATCH v10 mm-new 9/9] Documentation: add BPF-based THP policy management
Date: Wed, 15 Oct 2025 22:17:16 +0800
Message-Id: <20251015141716.887-10-laoar.shao@gmail.com>
X-Mailer: git-send-email 2.37.1 (Apple Git-137.1)
In-Reply-To: <20251015141716.887-1-laoar.shao@gmail.com>
References: <20251015141716.887-1-laoar.shao@gmail.com>
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
 Documentation/admin-guide/mm/transhuge.rst | 39 ++++++++++++++++++++++
 1 file changed, 39 insertions(+)

diff --git a/Documentation/admin-guide/mm/transhuge.rst b/Documentation/admin-guide/mm/transhuge.rst
index 1654211cc6cf..f6991c674329 100644
--- a/Documentation/admin-guide/mm/transhuge.rst
+++ b/Documentation/admin-guide/mm/transhuge.rst
@@ -738,3 +738,42 @@ support enabled just fine as always. No difference can be noted in
 hugetlbfs other than there will be less overall fragmentation. All
 usual features belonging to hugetlbfs are preserved and
 unaffected. libhugetlbfs will also work fine as usual.
+
+BPF THP
+=======
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
+  int thp_get_order(struct vm_area_struct *vma,
+                    enum tva_type type,
+                    unsigned long orders);
+
+Parameters::
+
+  @vma: vm_area_struct associated with the THP allocation
+  @type: TVA type for current @vma
+  @orders: Bitmask of available THP orders for this allocation
+
+Return value::
+
+  The suggested THP order for allocation from the BPF program. Must be
+  a valid, available order.
+
+Implementation Notes
+--------------------
+
+This is currently an experimental feature. CONFIG_BPF_THP (EXPERIMENTAL) must be
+enabled to use it. Only one BPF program can be attached at a time, but the
+program can be updated dynamically to adjust policies without requiring affected
+tasks to be restarted.
-- 
2.47.3

