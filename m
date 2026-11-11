Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.248
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387292;
	b=j91cTYHc2unXyxOwEk0KxoIiGTc5tZEqTc32N5QXoXMKuEfHPLd0twA+w2ZCimxKzlZu
	 qSAazY+mrNs5kRMLvoVN1KoDZkwWRJq8s2KpFx1WPeg1pCYlBpkxcrrhrlEIu/fYUE7+Y
	 xNqRg1Uts6WS2MZAoQRCb5Uuv4bC/C/Sn7q1pVig9gqfd+i1voKm91gXrQAW3ap0FMhUx
	 1G65m50ubvDS188IsYaqn6jv815/MJH+dEkFP0m+Ty7zzOahrRIHe0mt1qjifHVjwHtM5
	 8tdmJYYAl8wDrwLqlYN5K3vFyYLs86NMm9GCSXO5NEuit1c4SRdEzCoGqL/NbGdsYOw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387292;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=h89S9x+6FNbsx1kk0qOjiYteMD3ffDL4FelhcMuCPmM=;
	b=yxYrIqTyJvc56+YJDXgYQTj+UlFiyMHLDX6AzMSgTI1TivdR999Q2iGMWiZ2PBKLUyEb
	 Oa6O9rJq/CFbzHMA1hxIzex9juh3uL0tQnNybxD8X4qnyStcURIyZRcueI0aaDxB0c9Yw
	 lNoCgKOQbjwBGCTgP+bmTFEYcGB5974eeJUy3QnrIXuZF3mCTsCclJmtLUTO/p/rg0Nut
	 4LziOpMyxp43caf0ceNuRjFRf/p247roO84UmFvFV1KXwuGot3VJmMS/uPqF1eGXOPHAX
	 4xk3agoPrM+TQUIp5qDU3j+QaQxjIZaGaB+3rviDRJVfwSkvQ2kz8fQhKuEI7jmbReg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TnwNEjHG;
	arc=none smtp.remote-ip=95.215.58.248
Received: from mta1.migadu.com (out-248.mta1.migadu.com [95.215.58.248])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45D9160A2606
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:54:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45D9160A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=TnwNEjHG
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=WIWob8CPC1BsEJZy81fYICtAeoeG+8SX6viRZjO9vQE=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794387290; v=1; x=1794992090;
 b=TnwNEjHGDHf/4d9hy33NMTCRg+LPASjHssOb1iOXg0B7ACIvPbt4VAT/eqxM3Cr8Mbk2169E
 PE7QTn8aMebYU7RYBYfbR/DHIyKbe5NdaTq4gT/7k+OhGC6wBOB9//VcJ3HANVbd6BVxWHVY741
 dA6eB5l+1SfuLREPTS5v+ztI=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 170e20bcb6536ab6;
	Wed, 11 Nov 2026 08:54:50 +0000
X-Mizu-Trace-ID: 170e20bcb6536ab6
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
Subject: [PATCH 3/7] Documentation: KVM: Fix the function that implements halt polling
Date: Wed, 11 Nov 2026 08:54:44 +0000
Message-ID: <20261111085448.1130701-4-fuad.tabba@linux.dev>
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

The generic halt polling code is in kvm_vcpu_halt() since
commit 91b99ea706578 ("KVM: Rename kvm_vcpu_block() =>
kvm_vcpu_halt()"), but halt-polling.rst still names kvm_vcpu_block().

Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 Documentation/virt/kvm/halt-polling.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/halt-polling.rst b/Documentation/virt/kvm/halt-polling.rst
index a6790a67e2058..c311aac1ff9e9 100644
--- a/Documentation/virt/kvm/halt-polling.rst
+++ b/Documentation/virt/kvm/halt-polling.rst
@@ -22,7 +22,7 @@ savings of not invoking the scheduler are distinguishable.
 
 The generic halt polling code is implemented in:
 
-	virt/kvm/kvm_main.c: kvm_vcpu_block()
+	virt/kvm/kvm_main.c: kvm_vcpu_halt()
 
 The powerpc kvm-hv specific case is implemented in:
 
-- 
2.47.3

