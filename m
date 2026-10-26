Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.200
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792997073;
	b=p4aqh7yDnUROyhhSnA+z2uw+rDW6Ll3eRzfgouAPOTBSswXwFveNbRJEV9V4Q/6LTq+r
	 1snPGxCfbHQJMEoEHINTqKF1HW0bUKOEBYnM2KxLU7++5LGWS9CIF49gXtQzwsJTO8ool
	 rJWvFS4Is84bTi98jjto4GF2OSb/eYv2ocE56feV2YwFFpHSVIMHXlN7BU8ZQPh9ZZMOs
	 B8fp43kFyjWn6jwaZzzibgeAkk+4C3uTK/zov+HRB0E9YLc9PiJqGQ5xckvhaFRaWVq/R
	 f0cn4vv9xHSceC4tLlS9/kJlqNE6PrpRhTlLi2HZTCH73fkDte38TuFmKAtsX1CWV7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792997073;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=58apWv8SnWxURioEmc2rCRpcmZoJ2LiMw8AwcvEDIus=;
	b=nohSApl5i0j9zZeTxREERw6gqLwdncwqe3aoALGRirIBhcTDHq0QOkdwkUOm9f6IzpYO
	 9AHrx7p1cUFJx2latInlB6ms2k7V2uyfUAgseCyGa+h1cEJURwIneFoYpQuCttsstTQ6I
	 8k0ZcfWNhDsTciaIYEl9SWKEONlJjR12gh9PSFxOAd2KvHQQCsLHN5yiVpjoT4Hu6+ubA
	 Qxe1T50WxaAh9UE9Xavj5FREpa2PL9RYILCdJvpo9VZZMrF1N+x6ADZR0w4N+UFv7QGqU
	 gZ6ORNEO7K5Czd38k8pncA+7FiDnKu2/YPgXqtHDikgHI8mLypNSCN5q5b+5VX10abw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QxkHCvhy;
	arc=none smtp.remote-ip=209.85.215.200
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8144360A380D
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 06:44:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8144360A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--gongtao.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QxkHCvhy
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cd6969473a4so1583080a12.0
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 23:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792997073; x=1793601873; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=58apWv8SnWxURioEmc2rCRpcmZoJ2LiMw8AwcvEDIus=;
        b=QxkHCvhyRPZ1v2Nn37FOh7pQH8Q0M+yCM4T/Hpe0eMJINkEwtSw72tlqAX9t7P/TLY
         A9iXBHu/MCsqe7qnl/xAPEWmAqr04wpInQ4qI2RoeHyBVtYwifXd2JDr2HCFt3Qj2AZJ
         Uq4qps40UQkiRFQGZkDqsNVw4nUpPDJgbx+JHWcyIjiWHL5VYSWeImn2OE9W0HlekZLZ
         QKfObwBL2P73zCGjwqzj8jZmqKj1/dtSH78d4GsLnrDwewnCcxV3nBbTLiMpbVbwowgq
         uLH/1+TV909gtWrFHWKJ1yk4C7vktfYYf4tPovY30B61pbvCvnpGfMEjtNY7g3oFXVI2
         IL7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792997073; x=1793601873;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=58apWv8SnWxURioEmc2rCRpcmZoJ2LiMw8AwcvEDIus=;
        b=Ql5K11yaIXoMJvYlaGgEkyj8xDrX8Q67rhQi1bNPNCZ34LDHxpBqWRYSuk0iceL6BE
         R93Y4MIzHx84WTddIxiH9Po5jLAZ66ClnSbaFr7g0RPWCSKAlWc4nUxc1OgG2ljqAfcm
         q1aH67R3MU857QrmZhfYMoUJhVDVNdVdutgu5G419ZUxoMnIJactf6QZ5z6ZcVlrkL8X
         VqGkOBloft8lURAKw0rHsMzbXFfyKe3W8tDp5ZSd/kp8kHc1dEC4E/DcLPChMmjzlbOE
         Dlmj8XcCaPUJYQ1QuB2BTJs0LP7JRjp8ZKEY1AjssxxayQloBSlkGUzSlwWO30MkOiVX
         DpWg==
X-Forwarded-Encrypted: i=1; AKwUvByTbfstBO8Cf6oOvfSPD3mu4gIOGGpSkIcSbgZ96x09h1AYh71zxQJkXCZ5PbQdpmHN4kXHD7PWlkk=@vger.kernel.org
X-Gm-Message-State: AFq9FYK+1cT7a/TenWi73HN2PeQwUG9Hai4V1u+WhEieDxfeYlJrTMbt
	RPjgJFyVzPZ9z0G0SSXi4EM9VjRKl0tVyVktNU6o2RRCX+j0YIXrUc649ZVcmyxu3HSAi7t8J5+
	0V88VZHwpLA==
X-Received: from pjbme8.prod.google.com ([2002:a17:90b:17c8:b0:3ab:8c4:a67d])
 (user=gongtao job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4985:b0:3ac:aa8d:19eb
 with SMTP id 98e67ed59e1d1-3adea0acafemr4460561a91.3.1792997072639; Sun, 25
 Oct 2026 23:44:32 -0700 (PDT)
Date: Sun, 25 Oct 2026 23:44:24 -0700
In-Reply-To: <20261026064424.3003536-1-gongtao@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261026064424.3003536-1-gongtao@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261026064424.3003536-6-gongtao@google.com>
Subject: [RFC PATCH v3 5/5] KVM: selftests: Test transferring private memory
 to another VM
From: Tao Gong <gongtao@google.com>
To: kvm@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Sean Christopherson <seanjc@google.com>
Cc: Ackerley Tng <ackerleytng@google.com>, David Hildenbrand <david@kernel.org>, 
	Ryan Afranji <afranji@google.com>, Vishal Annapurve <vannapurve@google.com>, 
	Sagi Shahar <sagis@google.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Tao Gong <gongtao@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Ackerley Tng <ackerleytng@google.com>

Add private_mem_migrate_tests to verify that private memory backed by
guest_memfd can be linked into another VM of the same type
(KVM_X86_SW_PROTECTED_VM) on the same host via KVM_LINK_GUEST_MEMFD,
and that data written by the source VM is visible to the destination VM.

Also verify that linking a guest_memfd into a VM of a different VM type
is rejected with EINVAL.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Co-developed-by: Ryan Afranji <afranji@google.com>
Signed-off-by: Ryan Afranji <afranji@google.com>
Co-developed-by: Tao Gong <gongtao@google.com>
Signed-off-by: Tao Gong <gongtao@google.com>
---
 tools/testing/selftests/kvm/Makefile.kvm      |   1 +
 .../kvm/x86/private_mem_migrate_tests.c       | 118 ++++++++++++++++++
 2 files changed, 119 insertions(+)
 create mode 100644 tools/testing/selftests/kvm/x86/private_mem_migrate_tests.c

diff --git a/tools/testing/selftests/kvm/Makefile.kvm b/tools/testing/selftests/kvm/Makefile.kvm
index 239bc61ea384f..cffa0d165a945 100644
--- a/tools/testing/selftests/kvm/Makefile.kvm
+++ b/tools/testing/selftests/kvm/Makefile.kvm
@@ -108,6 +108,7 @@ TEST_GEN_PROGS_x86 += x86/pmu_counters_test
 TEST_GEN_PROGS_x86 += x86/pmu_event_filter_test
 TEST_GEN_PROGS_x86 += x86/private_mem_conversions_test
 TEST_GEN_PROGS_x86 += x86/private_mem_kvm_exits_test
+TEST_GEN_PROGS_x86 += x86/private_mem_migrate_tests
 TEST_GEN_PROGS_x86 += x86/save_restore_pf_stress_test
 TEST_GEN_PROGS_x86 += x86/set_boot_cpu_id
 TEST_GEN_PROGS_x86 += x86/set_sregs_test
diff --git a/tools/testing/selftests/kvm/x86/private_mem_migrate_tests.c b/tools/testing/selftests/kvm/x86/private_mem_migrate_tests.c
new file mode 100644
index 0000000000000..17bebf850b4c4
--- /dev/null
+++ b/tools/testing/selftests/kvm/x86/private_mem_migrate_tests.c
@@ -0,0 +1,118 @@
+// SPDX-License-Identifier: GPL-2.0
+#include "kvm_util.h"
+#include "test_util.h"
+#include "ucall_common.h"
+#include <linux/kvm.h>
+#include <linux/sizes.h>
+
+#define TRANSFER_PRIVATE_MEM_TEST_SLOT 10
+#define TRANSFER_PRIVATE_MEM_GPA ((uint64_t)(1ull << 32))
+#define TRANSFER_PRIVATE_MEM_GVA TRANSFER_PRIVATE_MEM_GPA
+#define TRANSFER_PRIVATE_MEM_VALUE 0xdeadbeef
+
+static const struct vm_shape protected_shape = {
+	.mode = VM_MODE_DEFAULT,
+	.type = KVM_X86_SW_PROTECTED_VM,
+};
+
+static void transfer_private_mem_guest_code_src(void)
+{
+	uint64_t *ptr = (uint64_t *)TRANSFER_PRIVATE_MEM_GVA;
+
+	WRITE_ONCE(*ptr, TRANSFER_PRIVATE_MEM_VALUE);
+
+	GUEST_SYNC1(READ_ONCE(*ptr));
+}
+
+static void transfer_private_mem_guest_code_dst(void)
+{
+	uint64_t *ptr = (uint64_t *)TRANSFER_PRIVATE_MEM_GVA;
+
+	GUEST_SYNC1(READ_ONCE(*ptr));
+}
+
+static void add_private_mem(struct kvm_vm *vm, int memfd)
+{
+	vm_mem_add(vm, DEFAULT_VM_MEM_SRC, TRANSFER_PRIVATE_MEM_GPA,
+		   TRANSFER_PRIVATE_MEM_TEST_SLOT, 1, KVM_MEM_GUEST_MEMFD,
+		   memfd, 0, 0);
+
+	virt_map(vm, TRANSFER_PRIVATE_MEM_GVA, TRANSFER_PRIVATE_MEM_GPA, 1);
+
+	/*
+	 * guest_memfd memory is private by default if guest_memfd tracks
+	 * memory attributes, otherwise it must be converted via the VM.
+	 */
+	if (!kvm_has_gmem_attributes)
+		vm_mem_set_private(vm, TRANSFER_PRIVATE_MEM_GPA, SZ_4K);
+}
+
+static void test_transfer_private_mem(void)
+{
+	struct kvm_vm *src_vm, *dst_vm;
+	struct kvm_vcpu *src_vcpu, *dst_vcpu;
+	int src_memfd, dst_memfd;
+	struct ucall uc;
+
+	/* Build the source VM, use it to write to private memory */
+	src_vm = __vm_create_shape_with_one_vcpu(protected_shape, &src_vcpu, 0,
+						 transfer_private_mem_guest_code_src);
+	src_memfd = vm_create_guest_memfd(src_vm, SZ_4K, 0);
+
+	add_private_mem(src_vm, src_memfd);
+
+	vcpu_run(src_vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(src_vcpu, KVM_EXIT_IO);
+	get_ucall(src_vcpu, &uc);
+	TEST_ASSERT(uc.args[0] == TRANSFER_PRIVATE_MEM_VALUE,
+		    "Source VM should be able to write to private memory");
+
+	/* Build the destination VM with linked fd */
+	dst_vm = __vm_create_shape_with_one_vcpu(protected_shape, &dst_vcpu, 0,
+						 transfer_private_mem_guest_code_dst);
+	dst_memfd = vm_link_guest_memfd(dst_vm, src_memfd, 0);
+
+	add_private_mem(dst_vm, dst_memfd);
+
+	vcpu_run(dst_vcpu);
+	TEST_ASSERT_KVM_EXIT_REASON(dst_vcpu, KVM_EXIT_IO);
+	get_ucall(dst_vcpu, &uc);
+	TEST_ASSERT(uc.args[0] == TRANSFER_PRIVATE_MEM_VALUE,
+		    "Destination VM should be able to read value transferred");
+
+	close(dst_memfd);
+	close(src_memfd);
+	kvm_vm_free(dst_vm);
+	kvm_vm_free(src_vm);
+}
+
+static void test_link_different_vm_type(void)
+{
+	struct kvm_vm *src_vm, *dst_vm;
+	int src_memfd, ret;
+
+	src_vm = vm_create_barebones_type(KVM_X86_SW_PROTECTED_VM);
+	src_memfd = vm_create_guest_memfd(src_vm, SZ_4K, 0);
+
+	dst_vm = vm_create_barebones_type(KVM_X86_DEFAULT_VM);
+
+	ret = __vm_link_guest_memfd(dst_vm, src_memfd, 0);
+	TEST_ASSERT(ret == -1 && errno == EINVAL,
+		    "Linking into a VM of a different type should fail, ret: %d, errno: %d",
+		    ret, errno);
+
+	close(src_memfd);
+	kvm_vm_free(dst_vm);
+	kvm_vm_free(src_vm);
+}
+
+int main(int argc, char *argv[])
+{
+	TEST_REQUIRE(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM));
+	TEST_REQUIRE(kvm_has_cap(KVM_CAP_GUEST_MEMFD_LINK));
+
+	test_transfer_private_mem();
+	test_link_different_vm_type();
+
+	return 0;
+}
-- 
2.56.0.257.gf7497c7d27-goog

