Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3704219FC
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 17:50:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547416; cv=none; b=Jk/2MFWsCBjde5oGQYD27ahsPNf/NknydmqVV7ausn7p4HleOKpMwpJLw0nCfgtzR7lQ3odcTmF5lkdL3UU+MH1GAcw+DNvQgemGdIKJnlwaSQY5Ju7FRH6o9gs4cdP7ww3SflFhWdIIqUL3EquLCZZ/pXBEwhHr4GvueDNb5H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547416; c=relaxed/simple;
	bh=Y9rMXPhwhSPq2CcDwI9mgpPoQnii2Yurx3TfkOypRiU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ZGSfbrDi/gH2GNb6mIhLnjdjQTDT/EQ/8N+X+WyTTdsRkWpLpIuedCnhlHwKYAylvi7DgYxHOZL0xh1lTJAPI8FAVK61VpIrZqNxI5HNSl6T8c15s5u1uGJECt9XbkGlCZPmFAtmxO9Ch+uHrD1WObD/If1fvovqzudLiycAnmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pkwfwd50; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pkwfwd50"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-35c12a3bbb9so1553011a91.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 10:50:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547411; x=1775152211; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfn2M6k7bFpE7gypyjWrhFKs9Q/vfTaHTPk+frkTN9U=;
        b=Pkwfwd50S7d58+AQ4f3JKRAZCtl3E0VEqrqDH+eHc5x+6Av6VPxYRATHZ/gB7jNiUC
         SQpCPP7WernkPLo6fj4BSXJcpXhtKPrARPfX7/AJz4u8jR7C8NG31Lmolq+irL3aouBP
         Tx33Q+m0vnTSLocBonGLVBGRfiOe1H/2s4s8zxqtamw6zRd66M1sktLfowbXGnb6+K+y
         srn3w4DIdCdQpK9GhSXaC75IKXBGUuMCkcyHZ+Y09nWofZsAUfWeG1oWKUctMPH56cQL
         h/hvvLXEg+We3LLx1iEvSme7PIZrbtVsA7/L9HYO8PJH+OZBsMZzFhhtLe0BA5m02s9a
         VY/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547411; x=1775152211;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Jfn2M6k7bFpE7gypyjWrhFKs9Q/vfTaHTPk+frkTN9U=;
        b=Uvbt8pnesh7XOHO4LLR8fUwZzj8RBs0H8IpViutGXnSbx0XP5sNm8weZcjebTcxuvC
         YwmCOOdhnXcqVp2QtVLohBodLBze227S5svb6VFuZaeipadgoUyH85ucBc/lP459PlBL
         +Lv6eqBu5oIEnty9M/JTg8Wt2pw2YNfvMxoQJ4ntZNsvAQsrLzjfaY8Wi4cAeo99zinE
         h9o3wMNV4GUQZ5M3nPMPC4s6gc4GY0v73MWJKRhFiHzvtZq1lQxsC7GicC1lTa03FAw8
         WmonYq7B1/y+Mnp8olmMCddvXXmCb6My4NeQR982sz1YTx3p58NK4PbwkGOZ/f0AKIVU
         JfYQ==
X-Forwarded-Encrypted: i=1; AJvYcCVaBrZM5lvLzR3yMJcrL+phbRWgzSkryBkxfCY9pAUgbKIjaTb8Ovjh1wHGrrL/BXIvu+bOl8lxutg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdCcNR5zqdaQVE0Asyic5q90bN0NSOB/kcGMWqnLPvDtMlf3yM
	9jwwGgc2V3y7euGQqj6zNnT5dTk/LHMHafBqHSCS+kOzW4TQMbWdNj4G51w8VFdpFtoxt8DLX2S
	94fUdLm2l1f0FUA==
X-Received: from pjbco11.prod.google.com ([2002:a17:90a:fe8b:b0:35b:9314:520d])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:2809:b0:356:22ef:57ba with SMTP id 98e67ed59e1d1-35c0dce8c1bmr8443122a91.7.1774547411019;
 Thu, 26 Mar 2026 10:50:11 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:25 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-8-jmattson@google.com>
Subject: [PATCH v6 07/10] KVM: x86: nSVM: Save gPAT to vmcb12.g_pat on VMEXIT
From: Jim Mattson <jmattson@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Sean Christopherson <seanjc@google.com>, 
	Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Yosry Ahmed <yosry@kernel.org>
Cc: Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

According to the APM volume 3 pseudo-code for "VMRUN," when nested paging
is enabled in the vmcb, the guest PAT register (gPAT) is saved to the vmcb
on emulated VMEXIT.

When KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT is disabled and the vCPU is in
guest mode with nested NPT enabled, save the vmcb02 g_pat field to the
vmcb12 g_pat field on emulated VMEXIT.

Fixes: 15038e147247 ("KVM: SVM: obey guest PAT")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/svm/nested.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/x86/kvm/svm/nested.c b/arch/x86/kvm/svm/nested.c
index 14063bef36f1..26bc33322a87 100644
--- a/arch/x86/kvm/svm/nested.c
+++ b/arch/x86/kvm/svm/nested.c
@@ -1242,6 +1242,9 @@ static int nested_svm_vmexit_update_vmcb12(struct kvm_vcpu *vcpu)
 	vmcb12->save.dr6    = svm->vcpu.arch.dr6;
 	vmcb12->save.cpl    = vmcb02->save.cpl;
 
+	if (l2_has_separate_pat(svm))
+		vmcb12->save.g_pat = vmcb02->save.g_pat;
+
 	if (guest_cpu_cap_has(vcpu, X86_FEATURE_SHSTK)) {
 		vmcb12->save.s_cet	= vmcb02->save.s_cet;
 		vmcb12->save.isst_addr	= vmcb02->save.isst_addr;
-- 
2.53.0.1018.g2bb0e51243-goog

