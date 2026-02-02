Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F9E938B99E
	for <linux-doc@vger.kernel.org>; Mon,  2 Feb 2026 22:30:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770071458; cv=none; b=ss6OEDRctIMOtAFEP/xmxp+Ggu+TELOFeZSforK5Y1nptjPmJlef+HfSd7+qMQ0tqrC5tubIPxjcSJng5N/oIxo72j6CtL2e3O2G6OS+juwff6NbJVT2uurZwDVtusukB+Zd5A2T2xpYkJARc7SyCRh6JOdqIwjiWMYLLEm99/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770071458; c=relaxed/simple;
	bh=2Pig+BE6mlwz3Atq97H7ZcTJ4jMwJiYk8WbNx5KJYm4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Di59shzWici05tRVE7rkYEByGB9CCKPaoecRJ33L9h+NU1rOKNkpmEmf95UISuW/VpdTzKWIoDlRCB89nb1ot3yDiLFMfCoO8sZGBpJmWeXq6mG+4XJm1h/dT++YMTzBefCwziwp4DGspth20IFxz0IOvJhSdNdTGBMK4hpu4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tpAXDRy+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tpAXDRy+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3545dbb7f14so1865950a91.0
        for <linux-doc@vger.kernel.org>; Mon, 02 Feb 2026 14:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770071457; x=1770676257; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KnXsdQ94XcuKuzn9mP+GBRZHRqSPvjoz+jTMa8UBwEA=;
        b=tpAXDRy+MH62c8PBeVdoW7/3MYKlkUP8Uw89rf6CBHBshRelxSJOKPkqDchrwpFiTf
         12HM/4cVagjt6NT+00MaVlvW6rZy9/0Ao+D1YrBYIcM7ReGTkLrJVf2AYeDrg52iQTXm
         7LaW9Dq+M2LTx8rZp6HB8qkguOiLJ5jLHrPMH9Y6K9U4bXDcDuxFrY7lBfYFXUul1tP1
         rXLIKY5vLdxRv3QupVFHtBgY+h4ULWd5tV8CYVy3yUwxsMu9lFwnlGbqFLrPRHGr7Yzv
         pNR16ngbwrShrsBSpKZui+/cYFSNm5AdWyfcKA4dvvfOPWxukzFk+v9AT/n7VVrksr1K
         Gynw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770071457; x=1770676257;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KnXsdQ94XcuKuzn9mP+GBRZHRqSPvjoz+jTMa8UBwEA=;
        b=F+kVdy7UkcDw79/VL2lYNQ9ocg6wA4vcggjHIlYHLvEhUNe+Ha2GGatLvSlqiYj1lz
         1oxbJcgNpwF2HqYoG1pk3SnJ6helpa2Y/kHSprOLxtLgdUL92ay+VSx3CfCu7zUCcHPR
         CI+MKxhgavBRgNo/tBL9W6Qm7pEKLAgWvBO6Mo186TWBX6PAa85WraYNzkq28eVlY9hf
         UXasdtcpJrLGVBPW65nBP15S6N9BJXPfZJymNd0SVa6LgPuoccrBYKN5aO0tzUpItAu8
         jyScaRql3ixrbDfoe9FFJdMO8muI8lKOLTVNYuunx4+bHC0QLBJdIiiN+qpJwP/f2Qbc
         inSg==
X-Forwarded-Encrypted: i=1; AJvYcCW+y6S9tui8TbBlI5qCF3aH5gHhTRsoonoBFEljK2ZlecJDFO3D9yoCLTzDC5iJQ4JhkPdRjCN87g8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGRQ3d/3xxZ7KOx8KI2xcZd5aLHeJxCJLB4kP9s2u3rYc+sDAN
	a/S52jiNeK0/+Yu9wbohUePrpt2FqQ26THUXMHtzmeZw+o9dmPj3Kq2ffEAR2xmhcGo8Rum4Q9l
	fvm13S/KSvns7AwS9rBhpW3WSLg==
X-Received: from pjkh1.prod.google.com ([2002:a17:90a:7101:b0:350:fd27:2bc8])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90a:fc4f:b0:352:b674:2592 with SMTP id 98e67ed59e1d1-3543b30564bmr14178775a91.7.1770071456574;
 Mon, 02 Feb 2026 14:30:56 -0800 (PST)
Date: Mon,  2 Feb 2026 14:29:59 -0800
In-Reply-To: <cover.1770071243.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1770071243.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.53.0.rc1.225.gd81095ad13-goog
Message-ID: <84cd59d887139f01a0624c214c0a43f4c0c730f8.1770071243.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 21/37] KVM: selftests: Test conversion flow when INIT_SHARED
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

Add a test case to verify that conversions between private and shared
memory work correctly when the memory is initially created as shared.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Sean Christopherson <seanjc@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 .../selftests/kvm/guest_memfd_conversions_test.c     | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index 48265215f218..438937980f04 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -95,6 +95,12 @@ static void __gmem_conversions_##test(test_data_t *t, int nr_pages)		\
 #define GMEM_CONVERSION_TEST_INIT_PRIVATE(test)					\
 	__GMEM_CONVERSION_TEST_INIT_PRIVATE(test, 1)
 
+#define __GMEM_CONVERSION_TEST_INIT_SHARED(test, __nr_pages)			\
+	GMEM_CONVERSION_TEST(test, __nr_pages, GUEST_MEMFD_FLAG_INIT_SHARED)
+
+#define GMEM_CONVERSION_TEST_INIT_SHARED(test)					\
+	__GMEM_CONVERSION_TEST_INIT_SHARED(test, 1)
+
 struct guest_check_data {
 	void *mem;
 	char expected_val;
@@ -186,6 +192,12 @@ GMEM_CONVERSION_TEST_INIT_PRIVATE(init_private)
 	test_convert_to_private(t, 0, 'C', 'E');
 }
 
+GMEM_CONVERSION_TEST_INIT_SHARED(init_shared)
+{
+	test_shared(t, 0, 0, 'A', 'B');
+	test_convert_to_private(t, 0, 'B', 'C');
+	test_convert_to_shared(t, 0, 'C', 'D', 'E');
+}
 
 int main(int argc, char *argv[])
 {
-- 
2.53.0.rc1.225.gd81095ad13-goog

