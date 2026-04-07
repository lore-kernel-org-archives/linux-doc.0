Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31EAF3783AC
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 19:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588634; cv=none; b=XMTy41nCnR/wE4HL9xsmnweuz2PAZEmrwMvlhdAaPrF5zhCD08xTaIuia5se8WMkEsjRnYWcOgor55u8hsT5w6fEc4btJmCFvxcCXhfpOamP7SForOsgjmjqDpIi7Q/7hzqEJCn0XAqstJpBUMAETRlj8zxcMM/9z+yTIP+VL6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588634; c=relaxed/simple;
	bh=DBA8O2rFNkWVwBR8H3zY6c+cd0lX+9zW5VykEg5QWOE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CNMT8wB9gaN/cLWqeUGHLpAJxX1pHFtZq3rqCP4Smy5Z6takYSK0DI7MHP+zVxmryVhsnZfoKIggPD+cvFmj9RlF9o2U+cJH0URh8cAE7f6k0krAJd/9R3fRyI9z1t8hwGuLbNBMBkbgX0huBILhpnhFIyd8tIN4sUXs2aFydyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ObT070f7; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ObT070f7"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-82cf0130d17so3180228b3a.3
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 12:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775588632; x=1776193432; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Upo9109oYE89axEDLV/VvVF4OvjQ4LehRchea39aIw=;
        b=ObT070f75qnmqPUJLQAzy0A2Mi7Z3wHZYRh7YeYr8qNdgGfw8AcchZ6DpKIcfpajLL
         0oP672pFjpPt2tp5mkDodQ9iL5qPikR2qPSG+WrEW4obwXD3go1aUXZWUj6qAPAwJoKM
         JyFDRXBYQa1R2F59CJDTW+xVeeCbX823HhPxOCmML+00ObPVulaYoBh8TIVUQDPD4Pxk
         fk5+6o41pA8Cct54KOqIrXpAbab5zvr/nZUtCvYjTXJVZSLHbY/dCrZbw0RDpnQC5YVI
         RnAgcZrs4f2nEmJ7XXIOInvvUxmibeu3eKrt1bKjmcCSQzfwyEWOJ/xMcozaDZcIUjLo
         YOOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588632; x=1776193432;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Upo9109oYE89axEDLV/VvVF4OvjQ4LehRchea39aIw=;
        b=DHZgxTaI3YCXQOoDpy13aoOvFbBEAKatbduzZ/rf3Sp1TUfY1XiEUVDua312+cI3xw
         qpFDNyz+onRrWOJrJvck0EGvlZf/Tzt5F5o1BGHx2l1ESpE3aJ7OO3xrx9xV1C0Um0+l
         KCZ4I8+9Fd/WzLprT6SbDjZ06e0u4ubxG3VaD5+oYOobsAF8ETq/ICTA4p3IZOfTnWZg
         BgGTcNfrqjlGRLp+NJgoXCR7pvSt0GnCqjbfJ1PPLzjV1UEdZWcgif0/CF+tCJkRMnu2
         yokl3AxYu/O4iFotVCdUSsRIk+gnS2wridzOVWoYBgF2ikP0WHSgpzlFi1+/icC8ZQhZ
         vR8Q==
X-Forwarded-Encrypted: i=1; AJvYcCWP7xSHQBt2bpB5ESi53nUfga/HDJkpRTXqlgiCRclSYBkPSLNxcXSFHdjoY6qBe0NtMo8aomTtvPE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1xUw4COcxsA/F0zP/kxOKnDQsWfjJygadcZDJkGDibvrG07dr
	yXYlZXETElOqHLykl66qh5Rbk6bzCQ7Sh/ypXH3ubS7Hdv9+5A4iNznl6q0ekzCqGGuHIa8V1Gn
	iKbKNQ3lDreZzqw==
X-Received: from pfqf9.prod.google.com ([2002:aa7:9d89:0:b0:82c:ed07:26b])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3391:b0:82a:17b8:1474 with SMTP id d2e1a72fcca58-82d0da3db08mr17759426b3a.1.1775588632262;
 Tue, 07 Apr 2026 12:03:52 -0700 (PDT)
Date: Tue,  7 Apr 2026 12:03:26 -0700
In-Reply-To: <20260407190343.325299-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260407190343.325299-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260407190343.325299-4-jmattson@google.com>
Subject: [PATCH v8 3/8] KVM: x86: nSVM: Cache and validate vmcb12 g_pat
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and nested paging is
enabled in vmcb12, validate g_pat at emulated VMRUN and cause an immediate
VMEXIT with exit code VMEXIT_INVALID if it is invalid, as specified in the
APM, volume 2: "Nested Paging and VMRUN/VMEXIT."

Fixes: 3d6368ef580a ("KVM: SVM: Add VMRUN handler")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 23 +++++++++++++++++++----
 arch/x86/kvm/svm/svm.h    |  1 +
 2 files changed, 20 insertions(+), 4 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 3575c9386e94..515a8545e8e0 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -410,7 +410,8 @@ static bool nested_vmcb_check_controls(struct kvm_vcpu *vcpu,
 
 /* Common checks that apply to both L1 and L2 state.  */
 static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
-				   struct vmcb_save_area_cached *save)
+				   struct vmcb_save_area_cached *save,
+				   bool check_gpat)
 {
 	if (CC(!(save->efer & EFER_SVME)))
 		return false;
@@ -445,6 +446,15 @@ static bool nested_vmcb_check_save(struct kvm_vcpu *vcpu,
 	if (CC(!kvm_valid_efer(vcpu, save->efer)))
 		return false;
 
+	/*
+	 * If userspace contrives to get an invalid g_pat into vmcb02 by
+	 * disabling KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT in a race with
+	 * this check, it should be prepared for the KVM_EXIT_FAIL_ENTRY
+	 * that will follow.
+	 */
+	if (check_gpat && CC(!kvm_pat_valid(save->g_pat)))
+		return false;
+
 	return true;
 }
 
@@ -452,7 +462,8 @@ int nested_svm_check_cached_vmcb12(struct kvm_vcpu *vcpu)
 {
 	struct vcpu_svm *svm = to_svm(vcpu);
 
-	if (!nested_vmcb_check_save(vcpu, &svm->nested.save) ||
+	if (!nested_vmcb_check_save(vcpu, &svm->nested.save,
+				    l2_has_separate_pat(vcpu)) ||
 	    !nested_vmcb_check_controls(vcpu, &svm->nested.ctl))
 		return -EINVAL;
 
@@ -562,6 +573,7 @@ static void __nested_copy_vmcb_save_to_cache(struct vmcb_save_area_cached *to,
 
 	to->rax = from->rax;
 	to->cr2 = from->cr2;
+	to->g_pat = from->g_pat;
 
 	svm_copy_lbrs(to, from);
 }
@@ -1974,13 +1986,16 @@ static int svm_set_nested_state(struct kvm_vcpu *vcpu,
 
 	/*
 	 * Validate host state saved from before VMRUN (see
-	 * nested_svm_check_permissions).
+	 * nested_svm_check_permissions). Note that the g_pat field is not
+	 * validated, because (a) it may have been clobbered by SMM before
+	 * KVM_GET_NESTED_STATE, and (b) it is not loaded at emulated
+	 * #VMEXIT.
 	 */
 	__nested_copy_vmcb_save_to_cache(&save_cached, save);
 	if (!(save->cr0 & X86_CR0_PG) ||
 	    !(save->cr0 & X86_CR0_PE) ||
 	    (save->rflags & X86_EFLAGS_VM) ||
-	    !nested_vmcb_check_save(vcpu, &save_cached))
+	    !nested_vmcb_check_save(vcpu, &save_cached, false))
 		goto out_free;
 
 
diff --git a/arch/x86/kvm/svm/svm.h b/arch/x86/kvm/svm/svm.h
index dfb0a73be606..fdd6286d965e 100644
--- a/arch/x86/kvm/svm/svm.h
+++ b/arch/x86/kvm/svm/svm.h
@@ -165,6 +165,7 @@ struct vmcb_save_area_cached {
 	u64 isst_addr;
 	u64 rax;
 	u64 cr2;
+	u64 g_pat;
 	u64 dbgctl;
 	u64 br_from;
 	u64 br_to;
-- 
2.53.0.1213.gd9a14994de-goog

