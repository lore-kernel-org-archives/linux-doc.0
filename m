Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.1
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387295;
	b=u8Jnr0PJ00IArmMHfVKsAOs+SO5piXPM6rFVggF/vrMYVSZ1gY4CW3YAv1icBttM1TuF
	 4X0TCL8vDCIjhOLFwGEI4Yxv36rK2jQAqf5X2S+D8npdkO2abYh37opBvZuGlvKcbHMQ+
	 72J2Be6dEEAv/HASS3ucGbY+ErsbdlFap6aI8jb86NdQY+RPPsHVSl9rpHllegfS/l5IM
	 W7twz21oAKFP8gb2m/GcHgR10utUXYUeB2O9l/0vRBR5295SJsShuIT2Em8bClYVrlWjE
	 HjjYi6Lj3PmOf0/4J6M7Sq4NYoBYaiNR4K4eF4Ox5LB/rf0Xd+g9nbymPlA78BpqE5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387295;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=CrFXQqZImTyTdzq1JyhUooge2du6VO16INEiE6z0KsU=;
	b=p7IvIXnq70mstBBTFfVdgSM/CUuGiFPoHjW2l/4WVyiVymbGeq+GoYc9W0g/AqaZYnKM
	 +2ERWJvvJwMpRDdyKr7Yx2HLHTN6OZjk0YPdHP0UOe+EMeJseisjD/U6/PLD80n8Jhr9H
	 Drq6Fx81fSc+h7vtJH7OhSeX3gUd6McPAgwF9XY6F8GwTPys2vVC9kdx5X9SzDZZL89Wa
	 lFVdSxHIMkjeYutWQO4LgDB0eO4QPgjLgq8Lab44qEwDrxrCMW16qGPj9nxTYEp5FThht
	 mZDCyAJFvIXs9DR6GhmwVqt/tfaXIROmXlkApq40miYyNhxYFZ/lA5Nr3hkuvjMPGig==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qNIPEw56;
	arc=none smtp.remote-ip=95.215.58.1
Received: from mta1.migadu.com (out-1.mta1.migadu.com [95.215.58.1])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C225C60A380D
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:54:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C225C60A380D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=qNIPEw56
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=tM7HGf7cYZfxl1BGl3iBn5UcJ++Tp8B1iBd0ZTTM0rA=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387292; v=1; x=1794992092;
 b=qNIPEw56+d6OKOBKXwSZQuG7WVFvUGvPCxS2MZ6Q6ts7SSAkSYn8hQv0PPackJcEUvyev9Eu
 4XPcRQJsrp1Arcqw6RU5M5AT5KCQZjsd/0FBEmoWDzpDCYQ+zbpEBBbwifl0W3fmCj+4KhumHBL
 dn6N1Atd6CSreucZtC1iOtaA=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c236bbaf59a3afe3;
	Wed, 11 Nov 2026 08:54:52 +0000
X-Mizu-Trace-ID: c236bbaf59a3afe3
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
Subject: [PATCH 4/7] Documentation: KVM: Drop the stale number of vCPU request flags
Date: Wed, 11 Nov 2026 08:54:45 +0000
Message-ID: <20261111085448.1130701-5-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261111085448.1130701-1-fuad.tabba@linux.dev>
References: <20261111085448.1130701-1-fuad.tabba@linux.dev>
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

vcpu-requests.rst states that only two request flags are defined, but
KVM_REQUEST_NO_ACTION is a third. Drop the number.

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/vcpu-requests.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/virt/kvm/vcpu-requests.rst b/Documentation/virt/kvm/vcpu-requests.rst
index 06718b9bc9597..eedf338d47d6a 100644
--- a/Documentation/virt/kvm/vcpu-requests.rst
+++ b/Documentation/virt/kvm/vcpu-requests.rst
@@ -141,8 +141,7 @@ KVM_REQUEST_MASK
 
 VCPU requests should be masked by KVM_REQUEST_MASK before using them with
 bitops.  This is because only the lower 8 bits are used to represent the
-request's number.  The upper bits are used as flags.  Currently only two
-flags are defined.
+request's number.  The upper bits are used as flags.
 
 VCPU Request Flags
 ------------------
-- 
2.47.3

