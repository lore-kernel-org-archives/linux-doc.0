Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0677438023
	for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 15:09:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785510553; cv=none; b=MtiEONFSc0zzNkWNnglSB03qBcx+EMvKRBJDcSEAWvGkiL68WgBom/GGLolHa+ihocNWI9smNNWgz2cbK87vGnFl9vw+BR0rmKecJeGhTqV3t3jt20ij2y3JsnNCCHTifEtc+u+ApVEWiK+Va/AGUbEiwgGO66/125dczplXKxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785510553; c=relaxed/simple;
	bh=tvuGJlpxe994ywBTZBk8oLyVZiPfdQoTV1v2claAJ/Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uPVtg9ijC3FpL7C/rPoKL6XZv5ssXv2qAEluLyNWbvYvmsNpRbTdmB4/joABOWpsckVzqBzMBCR8Q5OhaDinT2Tr/MgLr0lKNOVR+RZyxo6zyVhnq/Y8dbhM167l7YUxOmfrj0SBzFt4gwQi4QUUCbLpvJLfUMvqOOYMi+AZhcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=oMqG93NA; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="oMqG93NA"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f93b2fe4cso725180f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 31 Jul 2026 08:09:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1785510536; x=1786115336; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qNQVoJLOAt300tBIc7RjPTSBrNrM6NOapAN0DpYPO7A=;
        b=oMqG93NAd1Pa+dw1ySgixP4sB/5dgOY2hXyEFi8MoAtT5Z0OPtV7uPC5tb3UCYoASu
         zkNly5iN3R0EpA+RpjftQRQI96/fSzjrELNFliuBDYfHS4WaWujnjrEJRZDwX2LDw6Ya
         911CbRDCuYsbMpK6v6kWP/+LrdoCsi87FZJug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785510536; x=1786115336;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qNQVoJLOAt300tBIc7RjPTSBrNrM6NOapAN0DpYPO7A=;
        b=diuO6iW0LvNi0buug6le30fqtkG0b9eVdFuRorsZ65s6IR41ChsDs7+LDjEwkJ4Ten
         IZJ2CAuFrlLQJnfsUXuVYPnZuYlqrxG+ngNG5E9mq4nq6wNUcwEUNUliaRtX/q/BHGB0
         W24HO+ExKufcogO6/FWmT6i7ifzUQko+odlRfbxspd/CgrEoRoBqj2L9ANSS3HOjOMRp
         OsmUP0UuQN3t9EobSspjgNyAh/tLWhiMpAlTF2rgU3mrv8O/IKVyYXF+OesfNMBMTWh1
         wUaTR7HrNLRfA2HeSS9Do2D6IsTt2wp1KNp6DbYEx+dyaW02SDs0X2rM4olOuR2Ffh8q
         KAZg==
X-Forwarded-Encrypted: i=1; AHgh+RrNzODN+21JYbRSZthmpe9hvobd31aRtjLF1lQh9cjgd3MKLmZP4VtZoIsy+65lFo9RhregMaN0HPM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yym1h5CkFGidEsIG3KIhUjV1llhV2MUSawGM+J8Vqeegz5X8YUG
	SUU/FGweOkzOQVYKB7SICVZ7ENdwm+/zn0QP00o5a+PXvw/85DpzmpIpBcnu/iTOXA==
X-Gm-Gg: AR+sD11GIh9X1yUJpmialVPa6xTTKKFKEEoOgJGvH8FlG78d1+MW/naE15vkvIjRzgk
	cv08jIFymZ0O1O2xyM/uRrqSsx/oNjwDPODKyReAfCSN3+JRgpi6FHxU5W8Z+yIILZ1MDJmj2Cf
	Luk0DnVcvgPuIw19zjIFCHmzu/COww+j+U6T2MGXna8CdI5b6J8zbms+4mcvCRVyFhI1KZe9Ydc
	UiRcWDSopf7C9y98lszM8W6lMAqgzBMXq9o1HSYA0OKj6FcOQ4hudyrH9AW6VYRXGowmt7E8Mp0
	oV43M7MMTEgSaT3MtKuAzw6WjtO/jhtF8gqBjXK9tQyOqEEePa32NQcZBy8SxQ8KYySJMw7dOpn
	4CWcuaiiyqb33NcdIKi6osh4gYOhlv7OzDiPBUOBjgRtZIjOAbBmfNGtzuoIvREu6KycwUTzeHv
	VFapjqozK8ajg+OmSG5OyXMhiBTMKLPogTABMH/HoTIblHCoSDfo855lExTcyGnt88KSxu7qhue
	qUgY9Ai1dhAhwthRbVZsCDq/GIBkoq5Cq/cBmLZiXzSkQqs58yETJw=
X-Received: by 2002:a05:6000:60f:b0:47f:8112:f793 with SMTP id ffacd0b85a97d-47fd72b5cd7mr50971f8f.13.1785510535599;
        Fri, 31 Jul 2026 08:08:55 -0700 (PDT)
Received: from dmaluka.c.googlers.com.com (110.121.148.146.bc.googleusercontent.com. [146.148.121.110])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd45a0c8bsm5647974f8f.34.2026.07.31.08.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 08:08:55 -0700 (PDT)
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
Subject: [PATCH v2 3/4] KVM: selftests: Improve bsp_vcpu_id and max_vcpu_ids out-of-bound tests
Date: Fri, 31 Jul 2026 15:08:44 +0000
Message-ID: <20260731150846.1728164-4-dmaluka@chromium.org>
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

Now that KVM correctly fails with -EINVAL when attempting to set
bsp_vcpu_id to the value of max_vcpu_ids (not just to a greater value)
and vice versa, improve corresponding tests to cover this corner case
as well.

Signed-off-by: Dmytro Maluka <dmaluka@chromium.org>
---
 tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c | 6 +++---
 tools/testing/selftests/kvm/x86/set_boot_cpu_id.c     | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
index 47ee14967873..43f16c052de4 100644
--- a/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
+++ b/tools/testing/selftests/kvm/x86/max_vcpuid_cap_test.c
@@ -30,10 +30,10 @@ int main(int argc, char *argv[])
 	if (kvm_has_cap(KVM_CAP_SET_BOOT_CPU_ID)) {
 		vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)MAX_VCPU_ID);
 
-		/* Try setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID */
-		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID - 1);
+		/* Try setting KVM_CAP_MAX_VCPU_ID below or equal to BOOT_CPU_ID */
+		ret = __vm_enable_cap(vm, KVM_CAP_MAX_VCPU_ID, MAX_VCPU_ID);
 		TEST_ASSERT(ret < 0,
-			    "Setting KVM_CAP_MAX_VCPU_ID below BOOT_CPU_ID should fail");
+			    "Setting KVM_CAP_MAX_VCPU_ID <= BOOT_CPU_ID should fail");
 	}
 
 	/*
diff --git a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
index 8e3898646c69..1c4ebdf8e82c 100644
--- a/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
+++ b/tools/testing/selftests/kvm/x86/set_boot_cpu_id.c
@@ -39,8 +39,8 @@ static void test_set_invalid_bsp(struct kvm_vm *vm)
 	int r;
 
 	if (max_vcpu_id) {
-		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(max_vcpu_id + 1));
-		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID > MAX should fail");
+		r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)max_vcpu_id);
+		TEST_ASSERT(r == -1 && errno == EINVAL, "BSP with ID >= MAX should fail");
 	}
 
 	r = __vm_ioctl(vm, KVM_SET_BOOT_CPU_ID, (void *)(1L << 32));
-- 
2.55.0.508.g3f0d502094-goog

