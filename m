Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9939A21CA03
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788599229; cv=none; b=sNenN2DmzZs/dYwE4dpdeTJjWPINCTlDq/7RZSHLI7Ki28Z5IqBjxgHLw/f7AG+8LNc16GH7YIEQ8cdh+Suj7bdOhhuopZUT+Ek5NETpyL5b7FQtpd9ljvkHn19AQpyZavlM9g7DsyEbOiOsBC+bFTQeFvw6VAP5bCoQg/3jZDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788599229; c=relaxed/simple;
	bh=rc5XxMzqZHN/h8i9gnu5Hvcap9+yLXVxJXL+WFRkUqk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hv/eH1Tv6inbW6OLtzPwAgTQMTCa78A9dT8pNSSbnV37ESmxn70vIh5BxtUKFHz8C/mmzNkgN8qpbdhclWyEWZSz0mOKBXVIdBQWYsF379HKGu3HsEKULEzNDH+RvsHlNFgww+muMcnT+zlpfsEXMy448iyTEdt+J/TVAYUeuR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SbQLBtI4; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SbQLBtI4"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-49b965570d7so21333175e9.0
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788599226; x=1789204026; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e3AIKTqtccN8F5dbw/sA+nWDkX82cUAi4NxD23crSBI=;
        b=SbQLBtI4blGEQSATmwNYqS8O1pPpXKegjPWq5lbCNSuR2SFtu3Tuq5MG1jPbQOQmhT
         QHK9A8dnq8HjNLiK1dWHFrFf6t7voIGguQ5bFDU39zHZunkmiPOJskswaHMYvl/vGOTd
         9JeTbCFBzBMwxOijOp9nQH9SJjXxFE19nK5Wckbnj31DsqLdhMPE3e3oschiKpCQacUn
         S6ikMl0qJnJH92CnQfV2VrVZLtVBjpmgFJ0M70RFLn4vF6VwrkMoiFqRSiNGFms/HTCF
         8kNq637lcjLU41jZGKbMKGahaFTwaMagwYUhvsoznpRvpG5K71q+P6umQBK3sXyTr5w2
         WD3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788599226; x=1789204026;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e3AIKTqtccN8F5dbw/sA+nWDkX82cUAi4NxD23crSBI=;
        b=o9Pb9z2O4Dzx0Z50zK/NB6yQNl6o2Zz8R2gD+UikYE+CiTOOg9cSfgb7m5H+nITykv
         IXc0qDji3E23WNBIjR8YJPjEI81+QYMUTQ7dTVq86cNq6IcTZxwBm3NoB4rXY3hJZ2kJ
         nendqA8ODy8Qyh4JJ9/YTr70yFPZusbE+Tjefv2uS9P1Pr1MLLvNLxfgl7x7MLggQVwd
         PwXDU9Mm3va/1K3hVqrUuSLJ2EHHIcfh6OZ/W//6HD5nNS+nXhE/3G9s7lde/lL+MmPB
         MIlq5VwZQ4OefZP4k2yqXYJZuT3U2JrFe/uRAFc9iEflmtCumQJ5frRZk3Xv8G7Qfo6G
         wo+g==
X-Forwarded-Encrypted: i=1; AKwUvBzwH9tGyqjYn1ewr4uzD28g6j2No3jjf0YfxPNu9fRqL2w5Me6WvihM2fY5hMoYhEWrs3M5YAA9Jes=@vger.kernel.org
X-Gm-Message-State: AFuF++mq/IWYPdV890ztz3NehQM4D5xtDGF7XtXT1cvMq0/XRtq3PypI
	ly0DfR81q2kMkNwInNSfpTNGiHiQ4nBtwBXwoYIVtQFX9Pus/Aw3Ou7b
X-Gm-Gg: AYBFou0TfM3AVMcUt4Ltv1Fg2Uy6Hu2w5o6e3vp+jLlxEODCq1FkWygseK1uWFOwLMS
	IwctF5QuNBiXIOBPOW76Eq0qXMR5w3ibl2G+iGWRIpSU2qY3nXTa3XaXERgMFBphsKa44yEYkpV
	07zWf5F+c5IS8CPbwqCZkxSmtORsnC9KnRpR1HbjVERCXAu1dF8/+E8vj7jSUoqwyC24TrkENqe
	aSndAovOSEhAN0voyP96wzN/WQmPtRrYEq246+Pfbm4xKZ94nIw0BYjo4wWzc7C/nPDVeribXA/
	ReAXCw45B2jkZgakf4d0SzniXx1uvOd892gPsANX7Hev35hw3D/ArVRiYY3De6bEqhz11VP2QHA
	cfH+uHYRJZx3Wzs975+RCkSTCq40Sszn6qB+3u90WaQBumm2zMxQ8qRO5yUYJTK3QfuaWA+wBnv
	0wNOCvryOEgqYm5x5h8LOW+4a2VPQFs4UDcb9E82yn71aCCDCpFqsvsaTQ/wMmWnL9aAdkWUd8S
	u7NGTNFxg4H2r3dLmdYRikuIwJX2WY+LVeaLL12K9dKalVEfRMncMU1fwNFmhJKkm/4/yDZw8qw
	uTaLsL1oA46lpOxGrXRY0UlOpg6draUD4rSiX42a7Mez9c+pi/sAA2OwRtSDKhnQagTw
X-Received: by 2002:a05:600c:6383:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49cf820507cmr104027405e9.5.1788599225704;
        Sat, 05 Sep 2026 02:07:05 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d00a5b19dsm52248545e9.2.2026.09.05.02.07.03
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:07:05 -0700 (PDT)
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
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH] Documentation: KVM: Fix the struct kvm_arm_device_addr name
Date: Sat,  5 Sep 2026 11:06:55 +0200
Message-Id: <20260905090655.40683-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KVM_ARM_SET_DEVICE_ADDR takes struct kvm_arm_device_addr; the document
names it struct kvm_arm_device_address, which does not exist.

Use the real name.

Fixes: 3401d54696f9 ("KVM: ARM: Introduce KVM_ARM_SET_DEVICE_ADDR ioctl")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/kvm/api.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index e0430cc750c9..7a2de8640226 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -3676,7 +3676,7 @@ type KVM_X86_REG_TYPE_MSR, but are NOT enumerated via KVM_GET_REG_LIST.
 :Capability: KVM_CAP_ARM_SET_DEVICE_ADDR
 :Architectures: arm64
 :Type: vm ioctl
-:Parameters: struct kvm_arm_device_address (in)
+:Parameters: struct kvm_arm_device_addr (in)
 :Returns: 0 on success, -1 on error
 
 Errors:
-- 
2.53.0

