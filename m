Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A60937881E
	for <linux-doc@vger.kernel.org>; Tue,  7 Apr 2026 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775588635; cv=none; b=dG0CTTHtg7eMHJoIF2hXVbZXULXh/tMK8HGJC4cG3QS3thj1M9dVqa6Xrj13vcupvTE1/FtknPqT84lLYv2nSNc18rp73LmWKFnJAWP19n+RO2yWArTmWlgOPPfyuD1Ms1JIUXH/TsawBrQRy1EwUWVD+juZ/IlNp+saIIhm7aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775588635; c=relaxed/simple;
	bh=Z+0FNt2t6cabFGHIY/gw/2mwfS/kmPSGkp9gptfPwz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LqC9y7o8j7/kdDJi2LgqbmVS11XxMqJsV32QdBAXhQJEk/x/II/Z/0ocowual6BLPlfNkRTtYCbVKsDcLFduDsKOVWDwZkOD3gFFlGyu9ly8bwtM5jmT4CF3BOMyt/RryRy45oOIqToImoJz7sxf/sFEYf/kUpvIDNX/kqT9uY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lsiy1Fcc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lsiy1Fcc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-358e95e81aeso12183277a91.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Apr 2026 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775588634; x=1776193434; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=y25hlgoToNt8AYL+P/QmBD1FMIrrA2QlxlZvDyCqXQQ=;
        b=Lsiy1FccqG7Q7jkhTRnHQNd1kOBb0cZHfq3RtB8GI75xYUQ+H+U8GfU3tR2UH9dj4c
         neLtntT5G2zITM4yIgEUTJD9Wa51hQy+xr9Gs5ABMpdvurKBwA8oR7RMpmBZ2HtXeWWq
         gw4buLrkrpRUINWS7e4Q8QKRpauwM97CZ3fe0/hYr11W8nFLUOMNnWBqvQTzgYOxY0/3
         IP1Y0XrPPi3yKi39lUBIxjMPu3iWERdd34Ga7gtxijrPnH7BxnG7IOFcqYjvo2ow2hXI
         bH/o17nAo3FiDgKbg5twZYv9CECrVKkcoUvWntJljkk+IfdW0+24/DjICZRP6Ax7C4ML
         Wbmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775588634; x=1776193434;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=y25hlgoToNt8AYL+P/QmBD1FMIrrA2QlxlZvDyCqXQQ=;
        b=SVfquVuOqSZTA+SIPFJt4T15hpm2OGe1F/y2pPX9yE/2LD5TFSE4FAyeLAMpMWF1sB
         S5rmRLfXYGtj6UDBwHoXYV5XlowxgEZ2OZpu7Ru5QugOK9bUmtEl0y7QzCe8bocCGk8n
         3XRFEO1P1qtFNmyOHVSWh9BIZNu+ESEzgK3AY66o87UBndFkf6zpSFFU8FhGrR367t1a
         oz+kbTTF8niKGhKtgs1cydEtuF76deW7d1DaTEzBiOCKPP50G6+Z0eLbhmx7T+hwxM/h
         1ZuDskMNT1hlpS6geFgjpmk36Lkx00H/FQ7BNCjz1stkhlUkQPyBa9VnURqnXCI51MpT
         xZJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU+Z9lxiLwbghRIUlDalkx73jv/neEI9qSwDIe1WYXeX3qsomUvcDzkys0hOtixgTuIaY0rqrVnZDc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbyS/ml7dDGE7uKkJmx5SwGTRnX72y3xF8KkwRJHxfo6OnG5k
	NpzlgOvTPByc+8JE2k3Osltv6R71hV4h7L75nqoFvxQJ1EZvQjYiFxnfqC3KbMiD6HVX8LXqdEq
	VezRs2ttf4npkiA==
X-Received: from pjbmu16.prod.google.com ([2002:a17:90b:3890:b0:35c:e48:dc14])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:3811:b0:359:1130:1047 with SMTP id 98e67ed59e1d1-35de68ebf53mr18447362a91.17.1775588633727;
 Tue, 07 Apr 2026 12:03:53 -0700 (PDT)
Date: Tue,  7 Apr 2026 12:03:27 -0700
In-Reply-To: <20260407190343.325299-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260407190343.325299-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1213.gd9a14994de-goog
Message-ID: <20260407190343.325299-5-jmattson@google.com>
Subject: [PATCH v8 4/8] KVM: x86: nSVM: Set vmcb02.g_pat correctly for nested NPT
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and nested NPT is
enabled in vmcb12, copy the (cached and validated) vmcb12 g_pat field to
vmcb02's g_pat, giving L2 its own independent guest PAT register.

When the quirk is enabled (default), or when NPT is enabled but nested NPT
is disabled, copy L1's IA32_PAT MSR to the vmcb02 g_pat field, since L2
shares the IA32_PAT MSR with L1.

When NPT is disabled, the g_pat field is ignored by hardware.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 515a8545e8e0..58574e803812 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -727,9 +727,6 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 	struct vmcb *vmcb02 = svm->nested.vmcb02.ptr;
 	struct kvm_vcpu *vcpu = &svm->vcpu;
 
-	nested_vmcb02_compute_g_pat(svm);
-	vmcb_mark_dirty(vmcb02, VMCB_NPT);
-
 	/* Load the nested guest state */
 	if (svm->nested.vmcb12_gpa != svm->nested.last_vmcb12_gpa) {
 		new_vmcb12 = true;
@@ -760,6 +757,13 @@ static void nested_vmcb02_prepare_save(struct vcpu_svm *svm)
 		vmcb_mark_dirty(vmcb02, VMCB_CET);
 	}
 
+	if (l2_has_separate_pat(vcpu)) {
+		if (unlikely(new_vmcb12 || vmcb12_is_dirty(control, VMCB_NPT)))
+			vmcb_set_gpat(vmcb02, svm->nested.save.g_pat);
+	} else if (npt_enabled) {
+		vmcb_set_gpat(vmcb02, vcpu->arch.pat);
+	}
+
 	kvm_set_rflags(vcpu, save->rflags | X86_EFLAGS_FIXED);
 
 	svm_set_efer(vcpu, svm->nested.save.efer);
-- 
2.53.0.1213.gd9a14994de-goog

