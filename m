Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F86F435EC0
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 15:09:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510547; cv=none; b=eFLGtNCq4EgkfKItwVGcfv6SWHyg6OCRelxEbwZQdogOte4OoZU7JvvmLSo48pxqFl+IcveR1JpQlITc6QgzAI5kYD0q8epbqRe4HtNrpkXhq6MgNNk65rhm8XmG8CwKtWmVrCfUyTYros1Gjtira/tBQEwYImmj0ZS//56a9vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510547; c=relaxed/simple;
	bh=O14zjjovGhUS1oisSmIPImyZNtw8PEWRZRj6BhjFqXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=g7PrNPmY5ifTIgaKo8ssZUsQ6f6ZKXpvVYVQEqvfDu8lm5l68T8VizYKqnPL4P+qDQZMZwtVWhQM2D5gNwyEgfLDAL+61qKX7/3Sv0km+ome6PyrSrVU05STG3/+fs/xi/Gl4FT2offkqqIgMsgnncVmUsRjSkh1w9xUQOKcePs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z4Lm5Ch6; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z4Lm5Ch6"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-47fd4ee0b01so415665f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 08:09:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510537; x=1786115337; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=Z4Lm5Ch69LK7n5bZYSmYZFGQD/6rLOOhEYUWoND+Mva8bO5aq7Q7iO6B7sRJAJEIS4
         SF024u0dr3Oz3xLQe16c3y+TpNb72aQlMT7lsSBCRnPq+FNQNoEalEefnww+hmGG0WnY
         ZkbtRZgpmjiOmHZrjkZDm/wQSKQdyQRDDH1LU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510537; x=1786115337;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=flDxck68r8K2V0lreAAuQvFuepl9jlGM1LdPTHPMSDc=;
        b=PmEnsq39BeOhvPF7O/0HEDjRVqGYsl+XCgVOBJNN1BOui75H9xUYTVeG0jpdsyiTkA
         VDgykTUbgLCjtb+19hJ0hKlXLzDfAtYTvocDLl0zyaeRvvoxqOqFyC6HqctsZ8OaBccB
         MlJf8lOojzy/ofTHsf1ltV00B3x/nl0iN2jmrxK4kz4QQzSRLC+vKuuw/LOYDA7Zj1vW
         xTbhWXHm1/ShumzAXJi69g7Ct8WdvXD0sAW8BH/kaVFt5vncjdZFi/itMNFyU/mTk+zj
         dFGyaeg3DwLOR/n2QuuF3rAXeP4YDge0OGGqF9ADMyZUgW1v22Pa3HUJDCHVxDQe4NTw
         EqXQ==
X-Forwarded-Encrypted: i=1; AHgh+RqSvEiUxiiQztJb7lY2JDbXIJQLXg9QnSSl3wLolkqeQQ/hD3Y01kK1/9uXmO5Y26ln+9/7Rq44H/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyECdneyZ0HmaFCsJdECNommZ302LjwiMsRb0137rv2dkArn4jN
	ccCt6Vd9JL+83sW4KvLbKQWuWI8n5gPLcZGSepx1wIfqYkBAlbeMzE8iI3VKBhCCFA==
X-Gm-Gg: AR+sD12Euqtl9Gunmzgsit2rEzxN6wDPW7pZXpd4x/LcV6oiUcIASjBNTuxOJDVkhp7
	GCOTs3519kGidQI0ZLPde/X40NTvF6y/ufLzEyc413vQDRTEA9zow3dH3lKsmm9N1OpyHEPzYU+
	0BkhJuLZZSso4Zq1ZA1z7J+daXjiQcsajewpqwaGy3ismsL98fGKo5C8BjNvbg5PSPQ/zsXYyyu
	DeGaKesRFGJEh6rk5qyvJa/k/R8zG5QoR2kjz7CZDHuRyFLSwmbosg0Zmxt9dp5K9FDyJc3ooXI
	43P5cpZbuLsThQBDnK82+wpVpr3CwtRsN2TwtcUy5uUzYgTWr8xd5FpCC6w0K5ivmbI1RMf0s+l
	CbWcBg/ivOwfXjUFg+N3IR47f3JPdPdCzuB6wmrb7wWaOCycceKpV3XOAPergFfvbd52hc5jV27
	MNfbxHXQQ2j0PoaW3e1xnDV/ClqFhJvauzUzgy5nvdLggJ47OvzDws79Y9UkopYD5JQdM/Kkvy+
	HyPkn6P4aUJ02nUSFgZ/iv7a27fG55yx5dp1pYtcK5NXDDWpqhODnc=
X-Received: by 2002:a05:6000:46d8:b0:47f:4dfc:ca1e with SMTP id ffacd0b85a97d-47fd72ab3dbmr35826f8f.5.1785510537114;
        Fri, 31 Jul 2026 08:08:57 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:56 -0700 (PDT)
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
Subject: [PATCH v2 4/4] Documentation: KVM: Clarify that KVM_CAP_MAX_VCPU_ID is exclusive
Date: Fri, 31 Jul 2026 15:08:45 +0000
Message-ID: <20260731150846.1728164-5-dmaluka@chromium.org>
X-Mailer: git-send-email 2.55.0.508.g3f0d502094-goog
In-Reply-To: <20260731150846.1728164-1-dmaluka@chromium.org>
References: <20260731150846.1728164-1-dmaluka@chromium.org>
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

