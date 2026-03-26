Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D05B42315F
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 17:50:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547414; cv=none; b=txZR6bP7parljbjkNgdj6QM8VxRWMJhGo1ifPV4ZGhVHzlSNwBoRZWsOI5dZEt5WhVS6p28mWJUOJnSm17FZmvrNRX1B+uFeyw0CUgJ/uU/PJPylsBv9s3fpe5hwJr3pLgmfbUZ0hiJKrEAHXLUgK99NnXRKtW0/TWdt4+fKgw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547414; c=relaxed/simple;
	bh=BujWcctDq6eMuBK2P/8WUsaw3dQtOodTquIl5Xa9hFY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=MKF4SkeHyqMYCDT5i78DbDcOkaFh6I51jxLTEW0gaBPW9TS8LGsQvILkf/2hwbQxtwnqyyu8ksOQwlDJMrbY28SD7ncvxPfcfwtopqt82jb/LSf7Fl9/tobzNoApGjaUoXrp3X2vCPJoSgtkfJ/BvCtni4ZfWVfAWgFMkQspN/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kenaLQ/U; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kenaLQ/U"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2b069bfa817so15129745ad.3
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 10:50:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547409; x=1775152209; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tLQEnswVcn2VF9Qdewg1FETHaeEFo8aaED/NYmj5Qz0=;
        b=kenaLQ/UIGY8iguqyNs5tNy+AcnSO/Cym/YJy2S//tVjmP7yPlOtfcmBmTm82Vq6pU
         GP5NHyVjB1W2KTzn+TBE/6a2wpHqlI4aCdaOh8WA01Ylnnjn/gQ27yKH9eo58aGzrSbM
         48KRP44gjO16xdrFFhnrhv86/47cMynrlN3TtMQBEBWzDsdFN3UBpgdQTZD1miZiTeyT
         J+zNaum7by4FLaUcpjdzJWbA1yYx1cK4jGYnCMCorPvrw3Xs7Ru9IZs67qefiOiX7OXB
         AZXrtlw6Mm0110KQIwFlRVEno8bEeSzelo0v3bnyLl6ysEJiHCpPx9WFv0/4tOhWdOhA
         IvoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547409; x=1775152209;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tLQEnswVcn2VF9Qdewg1FETHaeEFo8aaED/NYmj5Qz0=;
        b=EKkpJNFb9Jw8eh727FDuo+fhZp88cnjHgKZUGZod3Y+HKjxPZXuiCPh5POpbaBZtDC
         kjVC0RQRRxqi0yf5jDQIS6qBi0WhQ5YPwivCrZIdHEIbJbxGNbN0h3WfRhBvdP16Uz5a
         v4qTct5AWsg+06aZiGinZ2DRiJrZnLSnJbLzEZRwbsRle3n0hfXZQkNy9WHnw935umJ/
         3YJaVnLHf/r9QS0rCSOculwXtsq6qvkmXmSKFiDV/ubk6SODgrfcd1iUqDPWiHCRYtBl
         t9lWSXfuwegtch+T5Ph+Wl5YLbCI1JyZSVcgnGbM2W4MFoBQwwT6/iKai4WuDhFceQOT
         g5iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKqSpxDeRPy0SOnSHi9gQCaxssBrM/zWtf3HdqOA9YKwYxyTBOMPR832Tqyt278RKd073fD3LgFOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzELKI9nxb2ywmSeaRS9fkAdanRw75+q0SQZbRBavhaJYpHajs5
	81ldxk3ux1wOfHNLZ+25AXEwhgZwxXkabv8So6yFbuobehA6ZJS3IKyIMASAKSwbzGVOhq7G/Z7
	5jUe21c1VhGpvoA==
X-Received: from pli5.prod.google.com ([2002:a17:902:c105:b0:2b0:495c:f3ec])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:902:d501:b0:2b0:b1e2:583 with SMTP id d9443c01a7336-2b0b1e22151mr92551175ad.2.1774547409214;
 Thu, 26 Mar 2026 10:50:09 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:24 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-7-jmattson@google.com>
Subject: [PATCH v6 06/10] KVM: x86: Remove common handling of MSR_IA32_CR_PAT
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

SVM now has completely independent handling of MSR_IA32_CR_PAT in
svm_get_msr() and svm_set_msr().

To avoid any confusion, move the logic for MSR_IA32_CR_PAT from
kvm_get_msr_common() and kvm_set_msr_common() into vmx_get_msr() and
vmx_set_msr().

Signed-off-by: Jim Mattson <jmattson@google.com>
---
 arch/x86/kvm/vmx/vmx.c | 9 ++++++---
 arch/x86/kvm/x86.c     | 9 ---------
 2 files changed, 6 insertions(+), 12 deletions(-)

diff --git a/arch/x86/kvm/vmx/vmx.c b/arch/x86/kvm/vmx/vmx.c
index b15b4662b653..d87585a42736 100644
--- a/arch/x86/kvm/vmx/vmx.c
+++ b/arch/x86/kvm/vmx/vmx.c
@@ -2110,6 +2110,9 @@ int vmx_get_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		    !(vcpu->arch.arch_capabilities & ARCH_CAP_TSX_CTRL_MSR))
 			return 1;
 		goto find_uret_msr;
+	case MSR_IA32_CR_PAT:
+		msr_info->data = vcpu->arch.pat;
+		break;
 	case MSR_IA32_UMWAIT_CONTROL:
 		if (!msr_info->host_initiated && !vmx_has_waitpkg(vmx))
 			return 1;
@@ -2432,10 +2435,10 @@ int vmx_set_msr(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			return 1;
 		goto find_uret_msr;
 	case MSR_IA32_CR_PAT:
-		ret = kvm_set_msr_common(vcpu, msr_info);
-		if (ret)
-			break;
+		if (!kvm_pat_valid(data))
+			return 1;
 
+		vcpu->arch.pat = data;
 		if (is_guest_mode(vcpu) &&
 		    get_vmcs12(vcpu)->vm_exit_controls & VM_EXIT_SAVE_IA32_PAT)
 			get_vmcs12(vcpu)->guest_ia32_pat = data;
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 0b5d48e75b65..56857da9bda6 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -4024,12 +4024,6 @@ int kvm_set_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 			return 1;
 		}
 		break;
-	case MSR_IA32_CR_PAT:
-		if (!kvm_pat_valid(data))
-			return 1;
-
-		vcpu->arch.pat = data;
-		break;
 	case MTRRphysBase_MSR(0) ... MSR_MTRRfix4K_F8000:
 	case MSR_MTRRdefType:
 		return kvm_mtrr_set_msr(vcpu, msr, data);
@@ -4435,9 +4429,6 @@ int kvm_get_msr_common(struct kvm_vcpu *vcpu, struct msr_data *msr_info)
 		msr_info->data = kvm_scale_tsc(rdtsc(), ratio) + offset;
 		break;
 	}
-	case MSR_IA32_CR_PAT:
-		msr_info->data = vcpu->arch.pat;
-		break;
 	case MSR_MTRRcap:
 	case MTRRphysBase_MSR(0) ... MSR_MTRRfix4K_F8000:
 	case MSR_MTRRdefType:
-- 
2.53.0.1018.g2bb0e51243-goog

