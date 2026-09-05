Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15E0F3DDAE2
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 08:58:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788598742; cv=none; b=V4BXSLCPEGsBeUpNs8eWoEYn6lu7bOLBL8+eli1xLiqz/Ukhfle8BdwCHPh17N88r0p5ri9Y2IbPe0ecslBTMfM1eRGitgR7QU1KqLUnT+NuRPoUmwlLhzfNtHRhUTcrpi+LOgZpHOA6wQFOreWkPdLxHalX+WgFWPtFvXvEB/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788598742; c=relaxed/simple;
	bh=V/NeoGBnmEdvp3k4w8PCcy5SvGN/W72/Vg9D5399iLM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UaCTtPnv9kGztP4+0fi73xl62Lyw1XaJ1Xm7uLR3P/LtMygbUMOJT0ZPdcoQszDmh5yoO0LO/apeAiT6ofQDa95+Jg4TP2OLt3i0TcVJahfX0dYDHMQM9uF7K9+2lo8damc1NySadwhZSvAOfJ5z2EGCdXLFGUlNug+/CQq9QeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TJfdRVUQ; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TJfdRVUQ"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-499b2981a7bso18853135e9.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 01:58:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788598736; x=1789203536; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=k5DmudKMyqruC0Fs8Lcf8OMZE9n3CdnS0WF8To3bTtU=;
        b=TJfdRVUQDPDvYZ3oK86Lt/jk6JAQBCA+fN8pYVVabfWN3WNrLN5MN2nzt9iFFWgSTc
         VUrIXLucmhZcEE/5kVC/JPIOCLL6fu1HCUmdBl/80RgbjE4+5OYfhtbPDaIPWjUwkeVU
         vprLZTPvKWEbr065NXWoq14zYriaSzMBaAmyZC1X0OcGndmXHFW+SuDi7E7e+zLZnR+L
         tBhdimAnoYlowEhIdcKd7rR8kyDd1KFyRe3frnwXL0chCS7ny8nr8tbL13HpbAEgfb63
         wRsimO4McQFvsW8fET9zxhO70sTLmYI2V8zsSt7/6QWt/BU1lkluIicPeneoupOzNJfB
         ACCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788598736; x=1789203536;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k5DmudKMyqruC0Fs8Lcf8OMZE9n3CdnS0WF8To3bTtU=;
        b=Zimn9/r8e4zzVMPDiu9WRI83up5EMEZ6yERvvyA/RU692VC+F2nSVmTqc54+3tXpgJ
         DjavLsnWtWDtv2YMmLPfLTg+72JlLeSK9RukK+TXFThv4xRNtPRCpqVWI7CBwkN5UZvv
         mRIrE7ZGdPegmfZM6KsKkfffeGh7KHQhDB4uJgQmVExVicumXXIem4IYkFPv3EiMp2/E
         lBk5njXReGcIuxMVWJFH6CuD0NQiL8XwQNhBLEb1QQ2QcYsFXhU2EXPd2v0ujhnMzTd+
         /A5ziS3DTop6TKPuf1bgECxq3FQtaVZZ4sWGXA6I+lccGHcfA7JVcHhQ0UtMXNM+XPwh
         qrsw==
X-Forwarded-Encrypted: i=1; AKwUvBwRuHwSq0AilA5f39mrEzV+RS6/OhbckRoeWV/4bHpGP3882X4yrDj4PMwkSwo+oVgH3eALsl+f8rc=@vger.kernel.org
X-Gm-Message-State: AFuF++kQlTqjp9zW3ryK9+ERKP9L7PJCmZIryuLZvcMJHUJyIfowgaX9
	T7h/BfhqJ05XxbqosNrG5jyYCWY2qH0kYmnmwIS4zK2UHp5uapy5kJ69NFCyB8e5
X-Gm-Gg: AYBFou24RBNNh06IK4wAdyFhriTuZCerhoCEEQW2etE/BfiHb2xFAUI694zpQWkR674
	z31a5xZvTVZj9DLYckx3L1x0GJ8aiqkhxEEHYhDwIeBll1Cm0qdmirxAspP0/s5zYP7bWZ6uig7
	UAqyLJzRQwi+AkdVA3jNMzXftsz0C5Y+ZLNaL2WviD+uA6sWiRXXEPPUVWutxzllL+3AnD7FhuD
	TdI1KfejGergVWPVFMI9wO/aFfrmazGM3cr3dHeTQungBKU3dUd0p41dF2/9bPwd6I3bmgReKz7
	UNJrFyPKgt1TiMA7rB1t1G+OJNgDtR5E7n5wUalKYghUl7dvi954LadTEYp6876DQG+fEYLi4Ks
	kTYFohTZIv6pdkgcYqCvAF5AcfYG2bQcMLknQQjFHgen+GxAAGpkKHXnKJKpLxctnJTTm45DoPr
	xNdaL9Wd15xMppEbLUNZmt+n4vgYFa7IkwLssp4lbC6WPSfmH33N8G7+LhKtnk4eRp7db2jGnUp
	9hH5OBiC6Sn0bTvFiO2tDcmXLQq4Z3HrT+c7LAsDZvWmaed+I/qzdQK4w2JtN3Fe8RGAaKCW+PP
	E1xn36DsHdI37Ir3ZsdqxZhcKE3WqCOyopn4sU5XF8NsEv+D3PRQPoH7FvZE2ZcwkgU=
X-Received: by 2002:a05:600c:3f12:b0:49c:c8de:96a9 with SMTP id 5b1f17b1804b1-49cf7fdd2dfmr200970085e9.2.1788598735989;
        Sat, 05 Sep 2026 01:58:55 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49cee7febb4sm233053035e9.14.2026.09.05.01.58.54
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 01:58:55 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oupton@kernel.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	kvmarm@lists.linux.dev,
	Paolo Bonzini <pbonzini@redhat.com>,
	kvm@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Alexandru Elisei <alexandru.elisei@arm.com>
Subject: [PATCH] Documentation: KVM: Fix the event_source sysfs path in the PMU attribute description
Date: Sat,  5 Sep 2026 10:58:49 +0200
Message-Id: <20260905085849.40479-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The PMU device directories live under /sys/bus/event_source/devices,
the document spells the bus even_source.

Fix the spelling.

Fixes: 6ee7fca2a4a0 ("KVM: arm64: Add KVM_ARM_VCPU_PMU_V3_SET_PMU attribute")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/kvm/devices/vcpu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/devices/vcpu.rst b/Documentation/virt/kvm/devices/vcpu.rst
index deb5c51bc00c..a3f20a4ee4b1 100644
--- a/Documentation/virt/kvm/devices/vcpu.rst
+++ b/Documentation/virt/kvm/devices/vcpu.rst
@@ -135,7 +135,7 @@ after selecting a hardware PMU.
 Request that the VCPU uses the specified hardware PMU when creating guest events
 for the purpose of PMU emulation. The PMU identifier can be read from the "type"
 file for the desired PMU instance under /sys/devices (or, equivalent,
-/sys/bus/even_source). This attribute is particularly useful on heterogeneous
+/sys/bus/event_source). This attribute is particularly useful on heterogeneous
 systems where there are at least two CPU PMUs on the system. The PMU that is set
 for one VCPU will be used by all the other VCPUs. It isn't possible to set a PMU
 if a PMU event filter is already present.
-- 
2.53.0

