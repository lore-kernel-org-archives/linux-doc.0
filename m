Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4A6E425CCD
	for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 17:50:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774547417; cv=none; b=EVE3F6BPUxjZkfFwDMdLyN2/ULwzm3gjrTGb5f4nobMzPcjylFOHVPESC2poInnWqxMkjZ5Nb2CLy+FcZHxPk3XgjxCruBdhrn2ZndjsfJiVVhTBnLt1eUvDrFjUvIMI5D2Y5p+fj6yJMkXkBrVkKz8bJCZVX5s+zhkHcmRMuZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774547417; c=relaxed/simple;
	bh=XLgtzGzP42ljoyiyAMkJfrzmvotKaPs/WCkAxsvyobc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LD3L5rtIx6YfyaF2J1gc01wD6Dipj1XHWMquZ73pMbplLMq1Dd29qyzlM20YrwQudtWPqT0+Kb0+ulwnEuDbNq0zaKS5cTFfJxuBN4RgGozGAbKTRi8/TvoAhIPABbVY8cGhJskNj3+7NvL2+7qGjJb889adO0KOfvfMIQunwYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JRkXjFX2; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jmattson.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JRkXjFX2"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-c74217894d9so831788a12.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Mar 2026 10:50:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774547413; x=1775152213; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=fcHCPa7TDJvI9dVBUyhh6A4BV1v5Np3TWFrOmkOsocE=;
        b=JRkXjFX2hoeTOEyJK5roSUd3wwK6/vRXt0JMEHr1VR4bkXglnc9pWPQqJlFkSQnJzF
         ZIdU0iywN0cA1uKaYKJXBlD2SvqSwD/5vYzkEZPegalisv3gwCzYMp2WRCoOrRNBLTxm
         hlKnDB8uf/QQQjVDzzmwnJ5qUQdUcONRoqa/bFBYrMlaF80f3s9gFyoQKfQ+htVlwD3I
         bqXRbdJTEymqtppI6uReQ4baWBEaFp9J7WWs0FTUJk2pFfJ8pEeNUEMpGoikQtVcIZAp
         7ij41KJr67sOGLIYQXSa4MJPBPtSGSUqPQeMLAzwfM2LWEgl67W1ZegMGbK0xiSIJ2yC
         4zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774547413; x=1775152213;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fcHCPa7TDJvI9dVBUyhh6A4BV1v5Np3TWFrOmkOsocE=;
        b=V/V7ngwMUK1ULVE7QoYzlfAQ/sJSK+IXnesQw+ETcGjzKrpmIaTetEKaObSUSb9m6j
         E2t05A2OefqkyDndl6QDWDkjt92XIFGeYjyTY/2SNsMuReDRYj353JwKJcCwZf1mv1aJ
         ebsfMwfMcfErJ3kuUmyF4CsMfB0vh82kefOZLHh3kCxjZ4bx/ZGL5GGeW6kAl5Caft0l
         ZJOiW3WohVHgmJtciegyHt2NWlQk9YuLZeoqbEQ4dusSsRBAHQWE594wiU0Oc7xPv+m6
         FbZhRU358VXYvSkrxwKE4RZ4MXfdecmID14TuRf0sU0t2JOyOnLnqmDeNRpJUkecpFOe
         QwKQ==
X-Forwarded-Encrypted: i=1; AJvYcCVK6HCOIu5eDeB1vU/h8IMOHcuer0xS5pQRUudtic8yt3JJJmmsgtEbPgVCJsLSBglxFwiHwsyYn+s=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWPhtIbr8EqVhqUq6Vb2sp89NnUqzVp/gry2yCeATXOHHNEZjU
	GNASJkBuBIgBZ3OWfmZhedY3ErGf1m0oTAcjWdVFlkidX3FtEK2ZUUybBH2FmZkcH5bp/hhC6RJ
	bpPfHB9Ox9Lxmvg==
X-Received: from pghg20.prod.google.com ([2002:a63:e614:0:b0:c76:3f60:53ff])
 (user=jmattson job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7f9a:b0:39c:235:c5d7 with SMTP id adf61e73a8af0-39c4ad57b34mr8886863637.39.1774547412536;
 Thu, 26 Mar 2026 10:50:12 -0700 (PDT)
Date: Thu, 26 Mar 2026 10:49:26 -0700
In-Reply-To: <20260326174944.3820245-1-jmattson@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260326174944.3820245-1-jmattson@google.com>
X-Mailer: git-send-email 2.53.0.1018.g2bb0e51243-goog
Message-ID: <20260326174944.3820245-9-jmattson@google.com>
Subject: [PATCH v6 08/10] KVM: Documentation: document KVM_{GET,SET}_NESTED_STATE
 for SVM
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

Document the nested state constants and structures for SVM that were
added by commit cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE
and KVM_SET_NESTED_STATE").

Fixes: cc440cdad5b7 ("KVM: nSVM: implement KVM_GET_NESTED_STATE and KVM_SET_NESTED_STATE")
Signed-off-by: Jim Mattson <jmattson@google.com>
---
 Documentation/virt/kvm/api.rst | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 2d56f17e3760..0a2d873ca5a3 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -4942,10 +4942,13 @@ Errors:
   #define KVM_STATE_NESTED_FORMAT_SVM		1
 
   #define KVM_STATE_NESTED_VMX_VMCS_SIZE	0x1000
+  #define KVM_STATE_NESTED_SVM_VMCB_SIZE	0x1000
 
   #define KVM_STATE_NESTED_VMX_SMM_GUEST_MODE	0x00000001
   #define KVM_STATE_NESTED_VMX_SMM_VMXON	0x00000002
 
+  #define KVM_STATE_NESTED_GIF_SET		0x00000100
+
   #define KVM_STATE_VMX_PREEMPTION_TIMER_DEADLINE 0x00000001
 
   struct kvm_vmx_nested_state_hdr {
@@ -4960,11 +4963,19 @@ Errors:
 	__u64 preemption_timer_deadline;
   };
 
+  struct kvm_svm_nested_state_hdr {
+	__u64 vmcb_pa;
+  };
+
   struct kvm_vmx_nested_state_data {
 	__u8 vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
 	__u8 shadow_vmcs12[KVM_STATE_NESTED_VMX_VMCS_SIZE];
   };
 
+  struct kvm_svm_nested_state_data {
+	__u8 vmcb12[KVM_STATE_NESTED_SVM_VMCB_SIZE];
+  };
+
 This ioctl copies the vcpu's nested virtualization state from the kernel to
 userspace.
 
-- 
2.53.0.1018.g2bb0e51243-goog

