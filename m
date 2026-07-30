Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCB0B44C4E3
	for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 18:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785435879; cv=none; b=A0DO0SuWlgJUaY+enE4V3n8RQjQN/DENPNSrBx2Bj1Yie3ijL/OasoTSfpeApsGuaUvT7GiU+MQHdUC1oy3MNtv3/PHsHqQTw+qJJwh1fCLGaDiQIHmORQQFCKUw9b7LK6ltUcCwVhoKr09HW7zE3TURZ3unMyRwCUuUdDKYnwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785435879; c=relaxed/simple;
	bh=UXU/5sPrRMMjD67ui/3POHpRT2doFWGnNkcKzGUyi4c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E4upHEVhWEVoMlPelD5j+yO79LB+BZ6QqH034+hf6soMiIDhMnku75sSe9hnNHvmzYkCuXZdF0XBhA+neOvS/AXQn77Js9j2JVjX7J0Hm/9Vp4XUB+daBUTEk9N4jhEqn2R9to67BaQOJTwvUoBPp4GITLBqD+p07thTKhFjym4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wt+bgFyf; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wt+bgFyf"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49553515a8bso1054855e9.1
        for <linux-doc@vger.kernel.org>; Thu, 30 Jul 2026 11:24:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785435874; x=1786040674; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oYrW4b/0joKOvqhU75nrHLcpc5zn0NBzDI0mlsk/bj8=;
        b=Wt+bgFyfZnlmGyWwTxxexHXs2RKcHaR/eEghRAN6XEPizAiLboz040unGBwS9Bt5dN
         jLTrhb5BNLb0/MuI+lNknsQf0Bj5XAD5H7ekGgYTdM1dz3uUI01cIhL+Cm91F3jl3EVx
         kXCmsXJUdiHmALcInMhTEwHK/2aliT7Q6ui/8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785435874; x=1786040674;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oYrW4b/0joKOvqhU75nrHLcpc5zn0NBzDI0mlsk/bj8=;
        b=aazweybF6H2g5cogE5UvpnaS1jmb7NTXT8razKjRu930kxlgQTfu2/6epLO1lpOl6Q
         2QuBkc/YteorJFq/sLFQlmqlrXVpw+asHLWHLepVwOsnivAwLt9Btt79opBZe5Ui8VRu
         Sz+6OJLHjewi4YGxE6f4bvCwl3fTRO9Cd54GsR6WEHtzZMmlBEyiVtIw+fATp6DKeI45
         aG9aIEBp2vE5Le6wbKORAyGoELuVyrvv2ADarvioHTYdSdbyrXSLT78uugYq0o62Is86
         XsHn6j53Pz10Yx+p6YO0fDzmffw38grMiYbHP/F7EL+/IZ8ekTcUgKxQbjuOe2ZsNLF0
         cSnA==
X-Forwarded-Encrypted: i=1; AHgh+RqTqFZ4umgTjx/obmEih8STmVoHozybZGhDC6RxcyED9vztaVSwGxC7UI6thPmQFWjAsCY0XYTp6Vo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxr8HVWOfFjcMH9re+0xqc8cazaGV93TzQ3NS/RFj5WutspGeiX
	FBdO4qVrDI158nknmzUI7rJx+8yz3Rva17kTpCtADRu/6E5ip9M6pAJGR1tU9ZSayQ==
X-Gm-Gg: AR+sD12xfrsKQ75YinhrNGtDRd5/zK9/52Ala/lNn4ke5QYE1y23zEVUvLKBBZVPiX0
	62tMOOB+6u4LiXu7UgQXY8nxT+oM6yT8Nhe1c+u0dxQ+Qu/Uyrj9UbtkwQgR5xVzDhhnoXyEq9h
	DP7vlxYSqv6f4ahqZrUQ/nFyo8cfffJRzCCjI+gAUnejOZkhJQBR2ewPMbj/TVeDXXikUfxLLhM
	76+xEfBIHNHwZOfCX5ENncneC8SZVoKX+YnemvSHuHEf4x5pG3vVcfDtApN9Brmwuu56sK9jq/e
	NDMHhjN5BGn/Wgsl52m/xDNz+37YmyULH8UqkuryTJKfAnHVR6gCmpPUe9W16212rfzT6QfMdiz
	vnrGPm3VkOc0FmB583gk/M695uVRi1jxNFv2xkTvPt6GbF8b8xA1SNPULFNcDEoybPEUobIjB0P
	d8tPvED13RYCofUFr2A80P+PB9VdEHDrorn8+zEIiEDBrMCeqOJyUnWr+ZJ11omAsMiheMb3KYC
	LMej3Lxm4SxomWrhr5BMIDrH1O+4FDLGQOrDl2ejCLrhekVEAuRkok=
X-Received: by 2002:a05:600c:4693:b0:496:ca1f:a428 with SMTP id 5b1f17b1804b1-49800ea1ab2mr53695485e9.19.1785435873918;
        Thu, 30 Jul 2026 11:24:33 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010aade3sm84008685e9.14.2026.07.30.11.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 11:24:33 -0700 (PDT)
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
Subject: [PATCH 2/3] KVM: x86: Fix off-by-one in max_vcpu_ids bounds checks
Date: Thu, 30 Jul 2026 18:24:24 +0000
Message-ID: <20260730182425.1223530-3-dmaluka@chromium.org>
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

max_vcpu_ids and KVM_CAP_MAX_VCPU_ID are exclusive, i.e. the maximum
allowed vcpu_id value is max_vcpu_ids minus one, not max_vcpu_ids.

Fix sanity checks for KVM_SET_BOOT_CPU_ID and KVM_CAP_MAX_VCPU_ID to
fail when bsp_vcpu_id is incorrectly set to max_vcpu_ids, not to a value
below max_vcpu_ids.

Fixes: 7c305d5118e6 ("KVM: x86: Limit check IDs for KVM_SET_BOOT_CPU_ID")
Fixes: d29bf2ca1404 ("KVM: x86: Prevent excluding the BSP on setting max_vcpu_ids")
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 arch/x86/kvm/x86.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 47cb9eba113b..b576b46869d2 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6908,7 +6908,7 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
 			break;
 
 		mutex_lock(&kvm->lock);
-		if (kvm->arch.bsp_vcpu_id > cap->args[0]) {
+		if (kvm->arch.bsp_vcpu_id >= cap->args[0]) {
 			;
 		} else if (kvm->arch.max_vcpu_ids == cap->args[0]) {
 			r = 0;
@@ -7478,8 +7478,8 @@ int kvm_arch_vm_ioctl(struct file *filp, unsigned int ioctl, unsigned long arg)
 		mutex_lock(&kvm->lock);
 		if (kvm->created_vcpus)
 			r = -EBUSY;
-		else if (arg > KVM_MAX_VCPU_IDS ||
-			 (kvm->arch.max_vcpu_ids && arg > kvm->arch.max_vcpu_ids))
+		else if (arg >= KVM_MAX_VCPU_IDS ||
+			 (kvm->arch.max_vcpu_ids && arg >= kvm->arch.max_vcpu_ids))
 			r = -EINVAL;
 		else
 			kvm->arch.bsp_vcpu_id = arg;
-- 
2.55.0.508.g3f0d502094-goog

