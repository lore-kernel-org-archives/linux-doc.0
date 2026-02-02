Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091BC393DE3
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 22:31:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071463; cv=none; b=dOsnN7bnD6eVSpX7PlSHyZOKsCKsnwSxWNpaBj9wFOZAWCpLyk7PqGc2mfBOdYJRdBwTRf5w4p8+QGtnkNaM0DhgM4sVZr8wIV8NxjWaT8AVlC/DiqGTaW9fEOQofjB3VMIzr+tGQu8eqKbdZtKUpe5Qw/pMPNQLrY65vS4iscA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071463; c=relaxed/simple;
	bh=5KmV4dgrkEB2RUbnt70mUMQ2h5TuygpqKJ3ihuxidvI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=r6Il1Ss8P2lA4qJJ85MA96AnKWHmivgLPg1O+5ii63R6R5tUVGvIl9q1Ms9wGX9mob2XxmmYh3tbC9b850p4WOab4JDa035hm5A+nyhSl7pxE5DPqXVVU3gwcivx+B6Geuk3KymVEfVCowsTsR/UBJRtRVL6D5Md4xnJ1mepuFs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KdDu64Mu; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KdDu64Mu"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-c61dee98720so2935015a12.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 14:31:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071461; x=1770676261; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KBnZ3VzpLOL4qeo77W08DpNE8o4qzNbw4Fy/F+yFoKE=;
        b=KdDu64MuxKy9apRJjfOGC8WCxb9VBkatwOPPM2Uri0OJRx89+eW8KXjlFtEesyoAe2
         cIroa3QwTQ3bo7f3CzVqYh9gHM97ZvMrty8R9b5MMemABHla6LocbItgLWhTqQ+fUOc0
         SvrO2SvlX3teH0QjMWup2U9hGI49sOyHIV0vK7YaG4YiSSyd6STutSic8LoJjZ0PFQv8
         ffsIjE2FWDyNFIUr/2sCNfe6paNw6kapZokJQf9V/BYUCQvK8XITeORuOv6Q+vx+gBNB
         SMiNUeKdH+0OC0yAroVlfhWivTSLq98egCNIMTLJ/6rd/1K0DuLGxgN/pGnIKm0Mjvw0
         wBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071461; x=1770676261;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KBnZ3VzpLOL4qeo77W08DpNE8o4qzNbw4Fy/F+yFoKE=;
        b=RxFaJdYTxqGG9FQImBWRxDe3yvmhLlJbwBEhg37HQOJpAx35py8ogk1OfDY0+mlFl8
         mqExD9+Mf0FzUHLsgVcKFGGOIDZUXHcz7Er+C1eTeHGlRWsgDCLc1NymPqSC5aK+15Pn
         2dtP+QAuBBQ2pk5fMFq0qYZjHnGXk247DyqU9pIuXqULsSTEtEV9eKktEErDMxNmGKGl
         SrGDdPMG8uzIsmgWnXwTlbEizDIYW0chxnMJoJim0CVmEOIhzW9vYcY54cJNcCptnzuc
         bom2oeFXYmJO5j7vuGuLgJDlqvHOsmXBmiiJGg85d87/e9M6t0sq4ONR0fQRyCfPjWIJ
         McUw==
X-Forwarded-Encrypted: i=1; AJvYcCWCFRxgTj9XK1LgKMU4cTVUxp7DEZIwLqw3PGaiHMSsbQ3fCOoTlE2bQ/Y4vX43exAPuC65q60RbPA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoepH/V4LneEy1MuNw/b1aOly1J7qgDhOXIpvcdAsEfnOX1fa8
	0FUCAATsCkAH2nNF59bhVTaWPFeut82o7iZqowGocL8iRGOjUTYY0bsd0Z6/pDufYu5ulWfssQi
	urQwNc1CHh0aWMeqD5d9/RBH8tQ==
X-Received: from pgda6.prod.google.com ([2002:a63:7f06:0:b0:c65:e57d:fb55])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:2451:b0:334:7bce:8394 with SMTP id adf61e73a8af0-392e0116e7emr12645870637.51.1770071461307;
 Mon, 02 Feb 2026 14:31:01 -0800 (PST)
Date: Mon,  2 Feb 2026 14:30:02 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <80c165b185cf36cfe2b12386cd7de3bc12bd9886.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 24/37] KVM: selftests: Convert with allocated folios in
 different layouts
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, x86@kernel.org
Cc: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	bp@alien8.de, brauner@kernel.org, chao.p.peng@intel.com, 
	chao.p.peng@linux.intel.com, chenhuacai@kernel.org, corbet@lwn.net, 
	dave.hansen@linux.intel.com, david@kernel.org, hpa@zytor.com, 
	ira.weiny@intel.com, jgg@nvidia.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, maobibo@loongson.cn, mathieu.desnoyers@efficios.com, 
	maz@kernel.org, mhiramat@kernel.org, michael.roth@amd.com, mingo@redhat.com, 
	mlevitsk@redhat.com, oupton@kernel.org, pankaj.gupta@amd.com, 
	pbonzini@redhat.com, prsampat@amd.com, qperret@google.com, 
	ricarkol@google.com, rick.p.edgecombe@intel.com, rientjes@google.com, 
	rostedt@goodmis.org, seanjc@google.com, shivankg@amd.com, shuah@kernel.org, 
	steven.price@arm.com, tabba@google.com, tglx@linutronix.de, 
	vannapurve@google.com, vbabka@suse.cz, willy@infradead.org, wyihan@google.com, 
	yan.y.zhao@intel.com, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"

Add a guest_memfd selftest to verify that memory conversions work
correctly with allocated folios in different layouts.

By iterating through which pages are initially faulted, the test covers
various layouts of contiguous allocated and unallocated regions, exercising
conversion with different range layouts.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../kvm/guest_memfd_conversions_test.c        | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index b48aa5d9f8cd..9dc47316112f 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -269,6 +269,36 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
 	test_convert_to_shared(t, 0, 0, 'A', 'B');
 }
 
+/*
+ * Test that when some of the folios in the conversion range are allocated,
+ * conversion requests are handled correctly in guest_memfd.  Vary the ranges
+ * allocated before conversion, using test_page, to cover various layouts of
+ * contiguous allocated and unallocated regions.
+ */
+GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(unallocated_folios, 8)
+{
+	const int second_page_to_fault = 4;
+	int i;
+
+	/*
+	 * Fault 2 of the pages to test filemap range operations except when
+	 * test_page == second_page_to_fault.
+	 */
+	host_do_rmw(t->mem, test_page, 0, 'A');
+	if (test_page != second_page_to_fault)
+		host_do_rmw(t->mem, second_page_to_fault, 0, 'A');
+
+	gmem_set_private(t->gmem_fd, 0, nr_pages * page_size);
+	for (i = 0; i < nr_pages; ++i) {
+		char expected = (i == test_page || i == second_page_to_fault) ? 'A' : 0;
+
+		test_private(t, i, expected, 'B');
+	}
+
+	for (i = 0; i < nr_pages; ++i)
+		test_convert_to_shared(t, i, 'B', 'C', 'D');
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
-- 
2.53.0.rc1.225.gd81095ad13-goog

