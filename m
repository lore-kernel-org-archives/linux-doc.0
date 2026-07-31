Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA84C43801C
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 15:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510546; cv=none; b=F1Md8F1XRrbe6BQKRk5uKAQFtJQL1BLkquDHf5XZt4v7/Jo9wjyUq0tUN159AH8yoUs3QmPRJo6tjuvqFUHAgEd/dIEmZB7S/QIFTWm+RSJ8lg2Y1KgHdoS7aqs1TBZXXemf8kArL7A2g3cfmk0RCGXkYmXCcmYGas+2Hfu2Y9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510546; c=relaxed/simple;
	bh=PjftAuv2yr6Vjpq2LJcpoHcflcYedBC1wROWFSqGAD8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bEcjJKopTtgc68lBKPKrSrBEK2MpAqqNfeuzB/M/d6ySH62FSrBtnGU1OuFzFXHQaB4B9xYZUlRV958hCKjcIxRnWddg7hBLVc5eFgls9a1A2RVRWadfr6FxtaP7dHKXoPu6Qb9M0W3cMFXYK2Ti0bFhVjjdnvaai2ECetaWG6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=bec7yMKm; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="bec7yMKm"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-47f9ab7ee38so650730f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 08:08:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510533; x=1786115333; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=08UPjSfOMysoSxYNb3E4BPj3tXXgH1/oLdaZMyb7X1M=;
        b=bec7yMKmoOZQrXSDvg/6fQwaPMw6x841jOAKcdFlX2ykP2QgkhX0YkcztjwwF1PPs8
         /bVyomgLmTRM1kmlXGtqWrxMd98VLFPhqaunHuRH4DkfPZS6sX2ViFxZMSHA9Zdnx5fz
         IdVc0uYPjlL0vaJ8kz1pnr2Tiz98JYEfTBNrw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510533; x=1786115333;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=08UPjSfOMysoSxYNb3E4BPj3tXXgH1/oLdaZMyb7X1M=;
        b=JvlomC2hYlVzQPp+Lspi/EkpEckASRVU/VQIX85d2IRtsCb9R9rviBLGxU6NrQtKLi
         BbmzCw84O6z7oNh1mmTNwVslMRwTZaqT7HvdXqKwQGUXN1Xt4XGIQtxP/LklK+I+m1pP
         wHUo8Jj7BGU4luI2XBaNZaQisn9VYpCqTQ6zg2BxSo6mI0wUgMYNEG63bYl6KwdOullB
         tzuf3VtC/wMJkB3lNLYZPQn29ICijjxO7vDXPLUBvlKFkq+K4WmveWi7nASdQr3DY6pt
         CyrDMIVa3TzV9yjcaJch8UkjtVSKARKit3aQuUrMdesDBI2x6PaHypc+3MgzgQV0B9qv
         E00w==
X-Forwarded-Encrypted: i=1; AHgh+RoxoF3xif+XC95lrxSp76dc57AAoCMhmYc/fDxkK3e/17Dn5pt3StjxG8Tumh8Zx8EstS2PXNH5O0o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmYM87jYb3l10UcG6/YS06NopCABgvteFCUuOES/YjrnpqY/WM
	JJGMwE/dC8XSaNdIBqQYjNgwUA3WFdhD6odJvc73RxSml5ZUfQ+ivqDzULBf7FiiZw==
X-Gm-Gg: AR+sD13aawh+YkC/xROtidip4gKriwi3HbWng0YLO7hxqUIUtGfV2/6gvJ/CRTxLs+y
	7Mv1mPxkyNxNH0qsPDrSRZ0Eq709vs46QrmVQZFVSqJO5Obwxq/ljajGZjUmZtzEKXpR5zVpay9
	Ha3R+NSji3xKFIbLD69OYJ/FCNAi5DFgLBwnb1tkj3EWq8n8PG7PTWwgb79fSvH3Q2ejX7Fgrxr
	cGjDIUCtKldDDh1tPd1zOJO7yHP/ZgWiSU/j0lzRBeuSdLIki6lvLIcv3jKcmk1waMpdJoMCc/a
	zlat0/ZXDTJNfFPBJxHiw2xkyBGSMEmnVdciNgazR0Iyhz+A9yab/0IPCUBk60qu+74bzsWhwKN
	l2cY1Adpj0c8lvaKk6jP4zCP/q9ukR6MUNaHpm+COXl96I2NuvPW3FAlGew6b24pOYDXXH7FSvL
	M+4Gt3P16BztlwzB1bvYgcFkbYJ3NZ3SsglIkv+pTlHexbzxO59db4j6djHisBOTIllsz6VDton
	xwZS3Gd/QJ2mWPwM20A+jKUn6NeZqs415Gt7Midi0UIBKjTUxjHqf4=
X-Received: by 2002:a05:6000:29d7:b0:475:3a97:8e3c with SMTP id ffacd0b85a97d-47fd72b08demr21668f8f.18.1785510533265;
        Fri, 31 Jul 2026 08:08:53 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:52 -0700 (PDT)
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
Subject: [PATCH v2 1/4] KVM: selftests: Fix treating KVM_CAP_MAX_VCPU_ID as inclusive
Date: Fri, 31 Jul 2026 15:08:42 +0000
Message-ID: <20260731150846.1728164-2-dmaluka@chromium.org>
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

KVM_CAP_MAX_VCPU_ID is (confusingly) exclusive, i.e. the maximum allowed
vcpu_id value is KVM_CAP_MAX_VCPU_ID minus one. So in particular,
setting bsp_vcpu_id to the value _equal_ to KVM_CAP_MAX_VCPU_ID is
invalid, it must be strictly below KVM_CAP_MAX_VCPU_ID. Whereas the
corresponding test in x86/max_vcpuid_cap_test mistakenly assumes that
it is valid and expects the ioctl to return success.

Fix this, by changing the "semantics" of the selftest's internal
MAX_VCPU_ID constant: let it represent the actual maximum vcpu_id, i.e.
the KVM_CAP_MAX_VCPU_ID value minus one.

Fixes: 4b451a57809c ("KVM: selftests: Test max vCPU IDs corner cases")
Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
index 7e2bfb3c3f3b..47ee14967873 100644
--- a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
+++ b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
@@ -36,16 +36,19 @@ int main(int argc, char *argv[])
 			    "Setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID should fail");
 	}
 
-	/* Set KVM_CAP_MAX_VCPU_ID */
-	vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
+	/*
+	 * Set KVM_CAP_MAX_VCPU_ID. Note: KVM_CAP_MAX_VCPU_ID is a misnomer,
+	 * it actually represents maximum vcpu_id plus one.
+	 */
+	vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 1);
 
 	/* Try to set KVM_CAP_MAX_VCPU_ID again */
-	ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 1);
+	ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID + 2);
 	TEST_ASSERT(ret < 0,
 		    "Setting KVM_CAP_MAX_VCPU_ID multiple times should fail");
 
 	/* Create vCPU with id beyond KVM_CAP_MAX_VCPU_ID cap */
-	ret = __vm_ioctl(vm, KVM_CREATE_VCPU, (void *)MAX_VCPU_ID);
+	ret = __vm_ioctl(vm, KVM_CREATE_VCPU, (void *)(MAX_VCPU_ID + 1));
 	TEST_ASSERT(ret < 0, "Creating vCPU with ID > MAX_VCPU_ID should fail");
 
 	/* Create vCPU with bits 63:32 != 0, but an otherwise valid id */
-- 
2.55.0.508.g3f0d502094-goog

