Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA89C2D0C62
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599361; cv=none; b=ZA2pYaO0xC9uNjFYRewgO4DLYQVaYHNzI2NMx1q/BEgU07yvs/UQA0XaanncvC1Y+KXQmg8Xve99rZFCowpg3jgpjBAdkcyuQlAS3epLDpRwIcYCIVjqzfrPOpD8XMryWrQpXToiFvQT8zt8VS7jBr2hJHtOwVXN6/CB/A6uXDc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599361; c=relaxed/simple;
	bh=Ewt1M7+spoIg1ijQPCVTjWY+YS8lJvToT/ZNIgAjn/s=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=uC6pllGZCPMW0ODgR4ZtlXDxRsv6MeRY1fMJwEnnrJa7bGvMZdwUWYUT5ZCapHxBKYxhyh1spfs4cg5q029uNpO27AQtV9IswvxkCP+PzXCKNo1xeVcaqhlDcZzTNDWMkXXhdEX2KY4Ed98wd5dX5GXU1J8wKmJp8aXksBG4JAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fJFVq48V; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fJFVq48V"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso15478995e9.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599358; x=1789204158; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=W4LuSu+7CiDy4mVJm5AlYN6tP/b0HvnqAwIEQlMsVOU=;
        b=fJFVq48Vs9mF4x48qlxw8Ab4r+h20Mz+tbzFUoacGPBBgjOhkJd4N+CwinaszaktFT
         KO1CnP1zcRjqBwHEwhasaEq8h1eCKZPY7yO1faAElaWEHE4ZyeWaNGddMhhTsUAeGD22
         WUL1CXH6Xl/53+g4QT/R8jXpRTCWCt8g8+ZV4BPXePfJOsFQ3qPWn2yRGNiqZboMxiA+
         aPTK6zPnwdt5BINgThJyBCm7ylrCPZPpzn1+AyTDXIZsexYj34PqOxur4LGye8uGBHn7
         FUixleyffUbe8NUn1PntDBgRj0dXhuFPcKhHMwPoLFNKojw786h8ytuq1u2syxtIIP7F
         3VWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599358; x=1789204158;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=W4LuSu+7CiDy4mVJm5AlYN6tP/b0HvnqAwIEQlMsVOU=;
        b=bnUkXwLMmGgsALWWN4mg7OgrwXqcWsKaGpfwqwB5V0seco7GLJzQr+Nu7HU9ITElFi
         5v1FU29dAqdFBtoQ5KCIpKskEN5ISVVW2Pzp7H1FQJhu+jQVm6fEDQl78EV5P2GqPth1
         N6t4lYv4Cjf5legASa2RlnizevjysRPND3ldHBrfU/YOOwpbPaADHX7nQ0mTapH6O1nn
         WrCi3Mwed+Kghq9s+TwF+XXK/CPwxI6vtRGcMfYvtvLPf/T2mOr9oUsi0+QJQV9h0/+S
         5wbe782dNFDBsK7JQDE7HKeb8/lElhdCV1YxlgGgDfr6m1uzSLumSBIXNU9Lcd3H68l0
         NC4w==
X-Forwarded-Encrypted: i=1; AKwUvBzdAs+eaw6NB4aliFWJcGOt4DMY2scOYhig9dd+6VVF+xqsdNbCcKq6SQIjZpljkPQNMBUrjPtJqIU=@vger.kernel.org
X-Gm-Message-State: AFuF++nW5oku7Rb9yxyfT6O2hcCmoAIw5+gIe5yXE05s9gC6/yJAT624
	Fcikpy8fqNZQd1hozpLk4ZXQmxyoXKAZ+Tbmx3E/yuSWGQ6DC5CQ7SuA
X-Gm-Gg: AYBFou1BZdGbVn/kUDmfPoJXMI48h9XDPIrMQzT+cRkk6xKtVN5HaV/sQ/mfBGrBiLT
	WDw2GxRFRAyOq/R7yP9XT1xH65WA7eoThE8iSb9Ac4bFtf6amPHMqOsLKT2Yy9020KCfnJus8XU
	vrRC5rYBkZNzQRBSZ+uEmY56v/HL2SKGuPxjm6/gTwylPe9xK5JGmsp8Wmp5z7hoSq1wu/VDXjD
	U5Lcgzt39uzPUei5edm2G0smgNTygjlmCdtYlZpVm4xV7eF524vWEMIJZC2msV4ESUopyOWo/HT
	uQ58m80xf30a6AxL6nJZUCMyzDD24kjEYQdmE9kutdMXe5vZ/3H6oSCoDw77NZJUxYbg+XnHYXK
	gXKCQREl/GeW7sHuPLIA9oGStMfLTnbTSFl41BlMVVLeSwuL8FgaxfxkonA9k4LVgsi01vPax9K
	1frIdc8lkBh2GBgLxzyJIITmfEa8FrIr9kIOQ3VmaCKKHK49UonpN/uJZejhigcvWHBdAjaB92h
	rwGCJd5GnwzF8OmdMPb/519+6yXsKMynZSnQmyHV9HsrgaxyeAluWnoEWW2C2j0b4FMoUPEG0v4
	07gKt8k9wc6bLFJqomoztebOg4ZUg3m5N9xyjx6mODXIBTm15gjTLw8zjB+v/5CQiSGgER/slU2
	tDg==
X-Received: by 2002:a05:600c:190b:b0:49c:fc6c:be12 with SMTP id 5b1f17b1804b1-49cfc6cc0acmr75745675e9.24.1788599357697;
        Sat, 05 Sep 2026 02:09:17 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49ce55259ecsm195482965e9.2.2026.09.05.02.09.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:09:17 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Sean Christopherson <seanjc@google.com>,
	Paolo Bonzini <pbonzini@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brijesh Singh <brijesh.singh@amd.com>
Subject: [PATCH] Documentation: KVM: SEV: Use the uapi structure names
Date: Sat,  5 Sep 2026 11:09:12 +0200
Message-Id: <20260905090912.40740-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The document names struct kvm_sev_launch_update,
struct kvm_sev_attestation, struct kvm_sev_launch_send_update_data and
struct kvm_sev_launch_receive_update_data. None of them exists in
arch/x86/include/uapi/asm/kvm.h; the structures are
kvm_sev_launch_update_data, kvm_sev_attestation_report,
kvm_sev_send_update_data and kvm_sev_receive_update_data.

Use the uapi names.

Fixes: dc48bae01e5a ("KVM: Define SEV key management command id")
Fixes: 2c07ded06427 ("KVM/SVM: add support for SEV attestation command")
Fixes: d3d1af85e2c7 ("KVM: SVM: Add KVM_SEND_UPDATE_DATA command")
Fixes: 15fb7de1a7f5 ("KVM: SVM: Add KVM_SEV_RECEIVE_UPDATE_DATA command")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/kvm/x86/amd-memory-encryption.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/virt/kvm/x86/amd-memory-encryption.rst b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
index bd04a908a8db..9ebd99aa1d0b 100644
--- a/Documentation/virt/kvm/x86/amd-memory-encryption.rst
+++ b/Documentation/virt/kvm/x86/amd-memory-encryption.rst
@@ -170,7 +170,7 @@ Returns: 0 on success, -negative on error
 
 ::
 
-        struct kvm_sev_launch_update {
+        struct kvm_sev_launch_update_data {
                 __u64 uaddr;    /* userspace address to be encrypted (must be 16-byte aligned) */
                 __u32 len;      /* length of the data to be encrypted (must be 16-byte aligned) */
         };
@@ -316,7 +316,7 @@ used by the guest owner with the KVM_SEV_LAUNCH_MEASURE.
 If len is zero on entry, the measurement blob length is written to len and
 uaddr is unused.
 
-Parameters (in): struct kvm_sev_attestation
+Parameters (in): struct kvm_sev_attestation_report
 
 Returns: 0 on success, -negative on error
 
@@ -377,7 +377,7 @@ Returns: 0 on success, -negative on error
 
 ::
 
-        struct kvm_sev_launch_send_update_data {
+        struct kvm_sev_send_update_data {
                 __u64 hdr_uaddr;        /* userspace address containing the packet header */
                 __u32 hdr_len;
 
@@ -447,7 +447,7 @@ Returns: 0 on success, -negative on error
 
 ::
 
-        struct kvm_sev_launch_receive_update_data {
+        struct kvm_sev_receive_update_data {
                 __u64 hdr_uaddr;        /* userspace address containing the packet header */
                 __u32 hdr_len;
 
-- 
2.53.0

