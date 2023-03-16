Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71CA9C61DA4
	for <linux-doc@archiver.kernel.org>; Thu, 16 Mar 2023 00:32:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233333AbjCPAcF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 15 Mar 2023 20:32:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34528 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233146AbjCPAbq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 15 Mar 2023 20:31:46 -0400
Received: from mail-yw1-x114a.google.com (mail-yw1-x114a.google.com [IPv6:2607:f8b0:4864:20::114a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9100A17E6
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 17:31:23 -0700 (PDT)
Received: by mail-yw1-x114a.google.com with SMTP id 00721157ae682-544539a729cso303337b3.5
        for <linux-doc@vger.kernel.org>; Wed, 15 Mar 2023 17:31:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1678926682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhAZz5TZYbz5eACM2xmX0O35zR+4WA+K6fPnqmTdp0=;
        b=DFkZM4WxAkVVNIJBuBzB0nwyIoWMqXfdjlRk3WXV6Jxw5x54jqdNlx617tRGFPhNbf
         FSFEhLgx9YrnXMD2N9F3ND0dGS2wEQLQ6W2DinnGY36gb1WqdxpuV00Tng2C80Dv85bd
         GGCXZZnPgvalLdYHdJ5gJafblCxeiqDbyy5BB57SEGPtzpj8zUdhi4l6LoIgVVGg05nZ
         6Mo31eLAizgeZ7625k2PZoVDucHfhEkPNcn7OmHS1vFJrTg1pI8T6QFyePo8eh9L2ANf
         ioVmITbi3yeESUanrzgTRmSVNxGVFuNzX/w7x5gA4sylAMhIN1UM2xnxuIntZGawA78b
         lh/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678926682;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/WhAZz5TZYbz5eACM2xmX0O35zR+4WA+K6fPnqmTdp0=;
        b=QM4UrZDzngoOE7VPVi1eoOmfseZ+z2yrSdCbcZ5Yzv9RMRlad7nGj+zKtF+oqp19OP
         aXSijAllDYF2Alr1ZR4OtxGsHGODHkQij5+Bd6LEEIIznpG4KNlpddH/6YXGeYm0gE0p
         sAdj+6k4lZl5aWk/MS22TJwicRTDRyC9mw9fUCUwupT2U4afgpwIQ00KgpOadwQV3jQd
         lCfw0JIhMhTW2wpNGxCPYAGX5/Yti3DJ2Xfy990O/YLBnBC2Ng63hibSdLqmNR66nrSy
         zfWeF1IOj7rFu8FrtfSQupqS2UgdUecHgWu/ngveD+e4sFHGxcTvQl51q62EW16hBoLy
         F4bw==
X-Gm-Message-State: AO0yUKV+gaH4ZVYL/DsGXtbMsOs5mn8WlLpjL5YkzW2lNMRoXKtY2tIQ
        2OQEc9vmCw2MG3tGhi7aCQWqx3QKgt+/KWmxjQ==
X-Google-Smtp-Source: AK7set9tsl6JIRx5mbMVZPA/DONTxMkHWtMyPLSYdDprwtuWdlOsvzYeVaLj2tQwnFWT9YsS5B+6yQbk5CSUogkZdg==
X-Received: from ackerleytng-cloudtop.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:1f5f])
 (user=ackerleytng job=sendgmr) by 2002:a25:8b08:0:b0:b14:91e:4d19 with SMTP
 id i8-20020a258b08000000b00b14091e4d19mr20688255ybl.7.1678926681818; Wed, 15
 Mar 2023 17:31:21 -0700 (PDT)
Date:   Thu, 16 Mar 2023 00:30:57 +0000
In-Reply-To: <cover.1678926164.git.ackerleytng@google.com>
Mime-Version: 1.0
References: <cover.1678926164.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.40.0.rc2.332.ga46443480c-goog
Message-ID: <a80f3bcce5b5612af9ddd42badbac57eb464f6b4.1678926164.git.ackerleytng@google.com>
Subject: [RFC PATCH 04/10] KVM: selftests: Exercise restrictedmem allocation
 and truncation code after KVM invalidation code has been unbound
From:   Ackerley Tng <ackerleytng@google.com>
To:     kvm@vger.kernel.org, linux-api@vger.kernel.org,
        linux-arch@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, qemu-devel@nongnu.org
Cc:     aarcange@redhat.com, ak@linux.intel.com, akpm@linux-foundation.org,
        arnd@arndb.de, bfields@fieldses.org, bp@alien8.de,
        chao.p.peng@linux.intel.com, corbet@lwn.net, dave.hansen@intel.com,
        david@redhat.com, ddutile@redhat.com, dhildenb@redhat.com,
        hpa@zytor.com, hughd@google.com, jlayton@kernel.org,
        jmattson@google.com, joro@8bytes.org, jun.nakajima@intel.com,
        kirill.shutemov@linux.intel.com, linmiaohe@huawei.com,
        luto@kernel.org, mail@maciej.szmigiero.name, mhocko@suse.com,
        michael.roth@amd.com, mingo@redhat.com, naoya.horiguchi@nec.com,
        pbonzini@redhat.com, qperret@google.com, rppt@kernel.org,
        seanjc@google.com, shuah@kernel.org, steven.price@arm.com,
        tabba@google.com, tglx@linutronix.de, vannapurve@google.com,
        vbabka@suse.cz, vkuznets@redhat.com, wanpengli@tencent.com,
        wei.w.wang@intel.com, x86@kernel.org, yu.c.zhang@linux.intel.com,
        Ackerley Tng <ackerleytng@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The kernel interfaces restrictedmem_bind and restrictedmem_unbind are
used by KVM to bind/unbind kvm functions to restrictedmem's
invalidate_start and invalidate_end callbacks.

After the KVM VM is freed, the KVM functions should have been unbound
from the restrictedmem_fd's callbacks.

In this test, we exercise fallocate to back and unback memory using
the restrictedmem fd, and we expect no problems (crashes) after the
KVM functions have been unbound.

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/x86_64/private_mem_conversions_test.c | 26 ++++++++++++++++++-
 1 file changed, 25 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
index f2c1e4450b0e..7741916818db 100644
--- a/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
+++ b/tools/testing/selftests/kvm/x86_64/private_mem_conversions_test.c
@@ -203,6 +203,30 @@ static void handle_exit_hypercall(struct kvm_vcpu *vcpu)
 	run->hypercall.ret = 0;
 }
 
+static void test_invalidation_code_unbound(struct kvm_vm *vm)
+{
+	uint32_t fd;
+	uint64_t offset;
+	struct userspace_mem_region *region;
+
+	region = memslot2region(vm, DATA_SLOT);
+	fd = region->region.restrictedmem_fd;
+	offset = region->region.restrictedmem_offset;
+
+	kvm_vm_free(vm);
+
+	/*
+	 * At this point the KVM invalidation code should have been unbound from
+	 * the vm. We do allocation and truncation to exercise the restrictedmem
+	 * code. There should be no issues after the unbinding happens.
+	 */
+	if (fallocate(fd, 0, offset, DATA_SIZE))
+		TEST_FAIL("Unexpected error in fallocate");
+	if (fallocate(fd, FALLOC_FL_PUNCH_HOLE | FALLOC_FL_KEEP_SIZE,
+		      offset, DATA_SIZE))
+		TEST_FAIL("Unexpected error in fallocate");
+}
+
 static void test_mem_conversions(enum vm_mem_backing_src_type src_type)
 {
 	struct kvm_vcpu *vcpu;
@@ -270,7 +294,7 @@ static void test_mem_conversions(enum vm_mem_backing_src_type src_type)
 	}
 
 done:
-	kvm_vm_free(vm);
+	test_invalidation_code_unbound(vm);
 }
 
 int main(int argc, char *argv[])
-- 
2.40.0.rc2.332.ga46443480c-goog

