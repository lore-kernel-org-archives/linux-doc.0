Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA91644B67F
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 18:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435882; cv=none; b=ZsS77yhYOcph3uoQ/8Sv6w6EITH9YnCriE3udxijiErMfvtLRRADFZXQW9V/CIGk2gN2BIdFOzt4vgGWFm/c2IxcZWyml8l26Gl0BY31RcMterjfxo/6qzOpx5WhDNjd84R3auqxFcOnMxRGX1y+ixsXlEppwvk72ZQ/Zm5lPq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435882; c=relaxed/simple;
	bh=O14zjjovGhUS1oisSmIPImyZNtw8PEWRZRj6BhjFqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I5T9if0DsZo3I3HDThEDhV0czL38p8zBUsYTwV6glN3K2OPYs7JRulQ/OA79mKsXlqlgBRVmLUyWbQExOhysOzwgEVHvV5o9S+V/L05vEVznWnxfBzoZEO7jfiHxe+ovT0/NtBJfutxgP1aMSwIabgBWcMAZ8YipnfCaGQ4xJsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mokaldYi; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mokaldYi"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49800c6a846so9705695e9.3
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785435875; x=1786040675; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=mokaldYi7J7Pf10stqOrObcnJXzIGGGMd6j8NPwU6LrLjpFybAPW7BxrhTlDAKxtbo
         GyfLb9bUjmhr0dSsYqWV+ddiISgko7ojqKYRAi/Stm7Yir6Fv3LTcmk9yqJFev4c1dIt
         YW2LAaPXQqnoW4md+2+kdg4lVLvvYvzhgG62Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435875; x=1786040675;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=VxwvMpHNYnoMyf0qZhL8vWxx0uJxuw6XsHfsztDVMy9Bd+aBxNH1JmHjVCA4nGQecO
         qw7GzXIaLwGqaREZiySSgvAENgHpUN4gQgzp/P0I49XFdU1l2yGV0B1jXt0oj6iFY8Nj
         eQHMipBT9XEqAeNwXxalOSdjqf3vd6ijaETTCl+o+s9t1Yh87Ma/bczvpT4jpNLoKj17
         9bYE15fkFgYFpFblB/xXdNTj+zLT3nCPu9dAMKg1ETVSsM3OMWsxv4AW2O8ybLNzGDYK
         abcwxfjr4vEsw0+UX3W8OYhuRWrxFn9agjy5AOaaTqRrJP5uAUVLkSbh9DWmsRc9t6X8
         kWxg==
X-Forwarded-Encrypted: i=1; AHgh+RrOuyJHWnHUztblI9GysEsDcKR1eFpMyqC2DPsz0m+yMm6r5R/Nc/AEwsky1EY++woMox1yo4Vsma0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJqcX9dmGRksI3rQ3eiUBlqUzdtW3ZAqPjhMn9zuhuxWtDdJn2
	Qf75PHvsslna8rSR4mOycb/fEJn6b5qvk924+F8TVrj6qGVsE3onXXKq6BITe0DG5A==
X-Gm-Gg: AR+sD13uXjn5tdFbrfuJuWMJrCXJbvleMsi5xIQvmCJoSTher8RQOFf7hrjYWw3MMIN
	gxc4U4Jt2WqIeCq036foLwBgamicKPEK+LtT0bqb8CJM1LvFMVHZ/O2haJ/Pn/gZQkLGiUr3T5P
	JUvvKyypmy0lg8zeDyND9RtE+jZLAzEPFf0quKVhDLAugv8dSPp4JfeprFGBQVIan2F94vp5PJa
	0LP0+yCPNXNZLod08gqEwlB2ZNyO89vo8wUIqcUQSVMZqbv9g9+PYT0y5WAJtpJQoXVMZdweVRZ
	LlcoAihys4HgSOru3tC2f+DLJg8vO+PP3VRMNYkqDuPpxTSo6ljFIq6cj9TsKx7qa0x8mU8DHNM
	85Roz/qMrwCmBMMUCcmI3gSDPApZfVAOxL+PXm63qC4N9iXDDaNwZDtVWW1Q8t1UGme2RYBhhNQ
	O1RreLR3g+30wFWnBjrPJv2Tzhb+nKonY3rJGdLKBUIOvTexGAmq0qUQvf1iS1elR59ImVhzANG
	kvaK3laFYP4gCZEdvIbZ9DvYnQeIeymraiNMI9z7bQk66oPQKNC3Tw=
X-Received: by 2002:a05:600c:4e89:b0:498:28b:1025 with SMTP id 5b1f17b1804b1-498028b10f7mr47675555e9.5.1785435874942;
        Thu, 30 Jul 2026 11:24:34 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm84008685e9.14.2026.07.30.11.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:24:34 -0700 (PDT)
From: Dmytro Maluka <dmaluka@chromium.org>
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Mathias Krause <minipli@grsecurity.net>,
	kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Vineeth Pillai <vineeth@bitbyteword.org>,
	Chuanxiao Dong <chuanxiao.dong@intel.com>,
	Aashish Sharma <aashish@aashishsharma.net>,
	Grzegorz Jaszczyk <jaszczyk@chromium.org>,
	Dmytro Maluka <dmaluka@chromium.org>
Subject: [PATCH 3/3] Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive
Date: Thu, 30 Jul 2026 18:24:25 +0000
Message-ID: <20260730182425.1223530-4-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260730182425.1223530-1-dmaluka@chromium.org>
References: <20260730182425.1223530-1-dmaluka@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The KVM_CAP_MAX_VCPU_ID capability value is exclusive, i.e. valid APIC
ID values are only values below this value, not including it. Its
documentation doesn't make that clear, and even suggests otherwise.
Fix it and explicitly state that it is exclusive.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 Documentation/virt/kvm/api.rst | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e3003a241d5b..dab9a28c0fb5 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -8593,21 +8593,24 @@ KVM_X86_QUIRK_NESTED_SVM_SHARED_PAT        By default, KVM for nested SVM guests
 
 :Architectures: x86
 :Target: VM
-:Parameters: args[0] - maximum APIC ID value set for current VM
+:Parameters: args[0] - maximum APIC ID value (plus one) set for current VM
 :Returns: 0 on success, -EINVAL if args[0] is beyond KVM_MAX_VCPU_IDS
           supported in KVM or if it has been set.
 
-This capability allows userspace to specify maximum possible APIC ID
+This capability allows userspace to specify a limit on APIC ID values
 assigned for current VM session prior to the creation of vCPUs, saving
 memory for data structures indexed by the APIC ID.  Userspace is able
 to calculate the limit to APIC ID values from designated
 CPU topology.
 
-The value can be changed only until KVM_ENABLE_CAP is set to a nonzero
+The limit is not inclusive, i.e. the maximum possible APIC ID value is
+args[0] - 1.
+
+The capability value can only be changed until it is set to a nonzero
 value or until a vCPU is created.  Upon creation of the first vCPU,
 if the value was set to zero or KVM_ENABLE_CAP was not invoked, KVM
-uses the return value of KVM_CHECK_EXTENSION(KVM_CAP_MAX_VCPU_ID) as
-the maximum APIC ID.
+uses the return value of KVM_CHECK_EXTENSION(KVM_CAP_MAX_VCPU_ID) - 1
+as the maximum APIC ID.
 
 7.33 KVM_CAP_X86_NOTIFY_VMEXIT
 ------------------------------
-- 
2.55.0.508.g3f0d502094-goog

