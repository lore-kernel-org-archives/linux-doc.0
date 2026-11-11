Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.226
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387291;
	b=M0tG2Lua9/sqRajREtb4AMth5GYvafIluG/w/67srUWvkpCloOYfWG/hEMF3ZAmQATNk
	 uBPt48o4tHkpdpxTptD8wNu6hASpxxk9B9D8V2oM63N9bcPwbhkpGnWGElO9T0tANROWi
	 BR4s8c8xrVELV84cIkcFLiuAPAz17L4L+OM0L5QyXZlbO6abZCqHbnvyu1yvQE1xW35Oo
	 2sNCdxBhIhJ3IqSaoylIWsWj3i/eDFobMNp1jReytDPNfYL5Q5touqLIZLd74DBSqY/b2
	 GXea5R9I57aZXAvTNM4CLZtq2/Ta2GVQrs5IDuTNergnbLcOR5p3Kkcw0hYfhE6R8Dg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387291;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=p4/RbmPX9KICmkQ11iRcvdKgkMSU7xKEKoTjGh+2Kwc=;
	b=og2uFbUsVB+J8SIZ6yCZD2k1PxglTIj3fulcRyAminJibycFAx14XptLX031dhLypFPi
	 kOqa1IZtZNiZUl6BRXlMBNkh9E55nED5JRCeA+3rHnTQt8jmL41uVbDR+ncsxDTLOMzEz
	 xIVXzOuIp/+Ct68uGtE2EW9FEpUQfSMEXxGDd/XTDAI6tXoZtIzAdZwUWqOJSaD9xTDCY
	 5cyftFEODBB6rlcQuttaONbFc+AsKtKbYNFzcItVK0TqiuC6AaSJvO0EGgpcFldQDFK23
	 dHiNV5K9rYMMrl1izfKU887/7Z49Q0DSG0Liq4qh6xBguVDTXNnV+d/+62IK7QS3h8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EP962D2x;
	arc=none smtp.remote-ip=95.215.58.226
Received: from mta1.migadu.com (out-226.mta1.migadu.com [95.215.58.226])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926D4606A324
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:54:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 926D4606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=EP962D2x
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=jwk3hmfICgJ3X0igFOTViDcbZ5rjch+hhQUeonx02Cg=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387288; v=1; x=1794992088;
 b=EP962D2xhTQnfAw8QPg64sph3xNt8Y8xXe/PzXk8ermHDGE+sFLcXlDmXy8Y8cUYCxmkk2GG
 uCeMMFGqEvnYTFEO2qiL/lRkPKHOVJJPoCCbcmZemu4jrHkwQyjFZ5s6H26hy7qcaS5Pp0DEO6b
 3TMZdeu6VxuY+OvOfxKx+qbE=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 1900b9c390600ab3;
	Wed, 11 Nov 2026 08:54:48 +0000
X-Mizu-Trace-ID: 1900b9c390600ab3
X-Migadu-Flow: FLOW_OUT
From: Fuad Tabba <fuad.tabba@linux.dev>
To: Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	Huacai Chen <chenhuacai@kernel.org>,
	linux-mips@vger.kernel.org,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH 0/7] KVM: Documentation and comment fixes
Date: Wed, 11 Nov 2026 08:54:41 +0000
Message-ID: <20261111085448.1130701-1-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi folks,

This series fixes the generic KVM documentation and comments, mostly
references to non-existent functions, structures and constants, plus a
few other one-line fixes and typos.

Patches 1-4 are for Documentation/virt/kvm, and 5-7 for comments in
the code.

Based on Linux 7.4-rc2 (7475ea8b58616).

Cheers,
/fuad

Fuad Tabba (7):
  Documentation: KVM: Fix references to non-existent identifiers
  Documentation: KVM: Fix lock names and a lock type in locking.rst
  Documentation: KVM: Fix the function that implements halt polling
  Documentation: KVM: Drop the stale number of vCPU request flags
  KVM: Fix comments that refer to non-existent identifiers
  KVM: Fix the range of reserved arch-independent request bits
  KVM: Fix typos in comments

 Documentation/virt/kvm/api.rst              | 40 ++++++++++-----------
 Documentation/virt/kvm/halt-polling.rst     |  2 +-
 Documentation/virt/kvm/locking.rst          | 10 +++---
 Documentation/virt/kvm/review-checklist.rst |  2 +-
 Documentation/virt/kvm/vcpu-requests.rst    |  3 +-
 include/linux/kvm_dirty_ring.h              |  2 +-
 include/linux/kvm_host.h                    | 16 ++++-----
 include/linux/kvm_irqfd.h                   |  4 +--
 include/uapi/linux/kvm.h                    |  8 ++---
 virt/kvm/binary_stats.c                     |  4 +--
 virt/kvm/eventfd.c                          |  4 +--
 virt/kvm/guest_memfd.c                      |  2 +-
 virt/kvm/kvm_main.c                         |  8 ++---
 13 files changed, 52 insertions(+), 53 deletions(-)


base-commit: 7475ea8b58616b33c04afb976cf0fbaad9dd63fb
-- 
2.47.3

