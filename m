Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E84637B41C
	for <linux-doc@vger.kernel.org>; Fri, 13 Mar 2026 06:13:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773382409; cv=none; b=MmPQ0iufDdkBXdWxVhzrXTPCgdZMNFjRYXlpl2z3EwqJR54x4J9jS0MgqLcL9RQBkHFLptgBZ4CnYZx/NYAKwnu4cN6cz2Lv4Fh5uNBMk6Hi9fRnbGk5vOcJrKjr2X1XRl15117fCV3G5VjWPXWZn4XAi3OJSGmUlQV1HrC9o2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773382409; c=relaxed/simple;
	bh=efC+TzVwwA+lCFeRajm2dnq2MqPAbO6F5f4+fKbrYw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UW0Xxns1D4rUswBIA0HyTPSvmxRmO+4AuYZmKH4iNvRo0JIZ1YHtJ16XtnzHlo1euhyezFpXBzLRlJrvrUrKBJIt/2YT/UMZGRbLux5sgSr4VHa6BYsT8zZHlKi71xp1OjqtrJREz2LHcDmx1tVhZPfWkBzNXDDCOwR+vqMfM58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HN0YAtv9; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HN0YAtv9"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b6ce1b57b9cso1405062a12.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Mar 2026 23:13:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773382407; x=1773987207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SKsDiBkOMuSiXMAD20hKx6nWgAocdhX8X7LRy61gCzM=;
        b=HN0YAtv9b/GcBALegpZP+cvZMrB9a8Ql4i9AZ7cPdzRvHSC/8Uh5Zi0iUIA2OBWggb
         j1cG+89Mc3Ccrhf1GOxAWK3nF46U/5XcIcgnaooCLRkOJ030XDOPMb8Pwmv6i9/ZrBNL
         ndEXC8uFasURBp90S1vd6F7PEPla0EkxjcaU9L0xtYHyLHaOC60Lcy3Ba+/EhpjO2QsJ
         CBo4BMOX+VM4EvwdxzYOw2H+/y66PeLT/deCVbr1plyE4Pn+2/iqs6uhAa7Orz59KChs
         kf42r/VSx0LBHjJi+5ItkuHqMyk4jpdp8z+/vpHlOLMkdrtvuD7Z28k9jGl2aTeWjxyo
         ZBdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773382407; x=1773987207;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SKsDiBkOMuSiXMAD20hKx6nWgAocdhX8X7LRy61gCzM=;
        b=IT4pxRuMlZxXbSY+Z8+0B9kM31YwDiclIjL65uX6Yy6XI4wmANXh9R8Ta4DHI7KzH2
         0cbsiblvKSE7OUev12fAFFCQUbbFczMvKF+5nYKG9ooQaoIqiUsdmfpKhOyucPz6e//X
         t6exJ7djvZLXciHikPvCjnPsYhO183PiXa05EvgTmFY2tAr9T3iSqOkbPCvj0kylO+gO
         nfIFiEC8wdgrBprHf01w3ae/mgFHFfg+lrW8o++fVxLNXbaWvAXGF2OcXPOBAhuMIYSM
         Ss5MLEv2g88rdGzc7g35vlSSGa4JdJnuY6y8WH4k087p0Rua1bidsDx6tYcaefFVBplz
         misQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8RDZ0FFGR7/qdowpiE9q6BWJIKi8aA/II3RgWSryDlggG/0zTCxH0Y0v5RqZkxJI3i0E7espxfrU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6db/CNhMpdIn4tVOVGnP8JUXND9Bo7fJrLtMD1f+QUjy0iY6d
	r79zv5r72EMO89rvieH4v3DwZgZJSzul/oPHE8KxfO06WTWFnK+lPzqM63p2cNvMy9zJpAg6MMP
	3vO5TU6FQoch78rIGGPCqTQUwhw==
X-Received: from pgbcr10.prod.google.com ([2002:a05:6a02:410a:b0:c73:959f:8cb0])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:144d:b0:398:9ef1:f8f with SMTP id adf61e73a8af0-398ecb1744amr1704318637.27.1773382406593;
 Thu, 12 Mar 2026 23:13:26 -0700 (PDT)
Date: Fri, 13 Mar 2026 06:13:02 +0000
In-Reply-To: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260313-gmem-inplace-conversion-v3-0-5fc12a70ec89@google.com>
X-Developer-Key: i=ackerleytng@google.com; a=ed25519; pk=sAZDYXdm6Iz8FHitpHeFlCMXwabodTm7p8/3/8xUxuU=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773382364; l=1693;
 i=ackerleytng@google.com; s=20260225; h=from:subject:message-id;
 bh=efC+TzVwwA+lCFeRajm2dnq2MqPAbO6F5f4+fKbrYw4=; b=dXLbU8TDG6aMEm1oHbIyweTeDvQxQuyJ0+hdf+31mE9HrelOO4tSatiFFzIn09YxmWZrCjBur
 ALwKc2H67ijDc6hNbI8tzXF4Vo/omiqpUdsqXy6yiqfUIbMskk/03MF
X-Mailer: b4 0.14.3
Message-ID: <20260313-gmem-inplace-conversion-v3-23-5fc12a70ec89@google.com>
Subject: [PATCH RFC v3 23/43] KVM: selftests: Test conversion before allocation
From: Ackerley Tng <ackerleytng@google.com>
To: aik@amd.com, andrew.jones@linux.dev, binbin.wu@linux.intel.com, 
	brauner@kernel.org, chao.p.peng@linux.intel.com, david@kernel.org, 
	ira.weiny@intel.com, jmattson@google.com, jroedel@suse.de, 
	jthoughton@google.com, michael.roth@amd.com, oupton@kernel.org, 
	pankaj.gupta@amd.com, qperret@google.com, rick.p.edgecombe@intel.com, 
	rientjes@google.com, shivankg@amd.com, steven.price@arm.com, tabba@google.com, 
	willy@infradead.org, wyihan@google.com, yan.y.zhao@intel.com, 
	forkloop@google.com, pratyush@kernel.org, suzuki.poulose@arm.com, 
	aneesh.kumar@kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>, Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Shuah Khan <shuah@kernel.org>, Vishal Annapurve <vannapurve@google.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Vlastimil Babka <vbabka@kernel.org>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="utf-8"

Add two test cases to the guest_memfd conversions selftest to cover
the scenario where a conversion is requested before any memory has been
allocated in the guest_memfd region.

The KVM_MEMORY_CONVERT_GUEST ioctl can be called on a memory region at any
time. If the guest has not yet faulted in any pages for that region, the
kernel must record the conversion request and apply the requested state
when the pages are eventually allocated.

The new tests cover both conversion directions.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/guest_memfd_conversions_test.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index 8044581d5e5e6..b48aa5d9f8cd4 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -255,6 +255,20 @@ GMEM_CONVERSION_MULTIPAGE_TEST_INIT_SHARED(indexing, 4)
 	}
 }
 
+/*
+ * Test that even if there are no folios yet, conversion requests are recorded
+ * in guest_memfd.
+ */
+GMEM_CONVERSION_TEST_INIT_SHARED(before_allocation_shared)
+{
+	test_convert_to_private(t, 0, 0, 'A');
+}
+
+GMEM_CONVERSION_TEST_INIT_PRIVATE(before_allocation_private)
+{
+	test_convert_to_shared(t, 0, 0, 'A', 'B');
+}
+
 int main(int argc, char *argv[])
 {
 	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));

-- 
2.53.0.851.ga537e3e6e9-goog

