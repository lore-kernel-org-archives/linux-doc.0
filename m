Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795074514;
	b=gMn7TOxmsScseSvqoq0y2HyayKHjEO40u80+35dqAztx5dVJsWL9SIZpS+UTT6CvsXcq
	 V4nLHHO8dlTPR8m1W5gjjmtvcl3GL1v9K7PwwrtX7BMPj2ivQy2vgkl0M95EGgEqK2mZq
	 mtEy68GI2VckLffMM2zw9nszU9ADGiAvZr3yI0vv53MY7I7YZmw71qS9ym827Dj3elk9L
	 v1LQWtVJRPrtq0PZ7g/ISyNoHpyMvhqEUH/U0s7ZvMPSGXgv2/cM9KyHXEOK0fPJJvL95
	 JiRXOI9OM55EVqUMqKEX9Z2jZuqu47eK9+tRoL5iTlCVtw8hh4LDW4PrsJvQv1zCEbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795074514;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=vmZk9/Vpa3CGsFpach0w6FgXWKmQOWGxhsMKrxJ18rY=;
	b=sBVrK+RHbo08u0JZbRP7K1qUyghZ+UsHlB6eOvSqXudkL6XWeLVG/wT2P9js5oNccGRc
	 sKWspc5MybtrWywzS0TcgxhwwNJMwGdXDHQ5iZ6J3zYmUgGzKCFwYP8PkFJiiMMoiJ2vC
	 P6uuR3H40eqGtN9cQGtQ25mKA9NFvUy7EsslxcCVB8FmIfKhCqVVZqiP6FwiYcmrflwpg
	 mJTQKI7n5HUZdvYzQEUMIl91MNmHagCwfSgpCT21a7AAUvOhnzTUz09fyTeoHvH0WoIcF
	 fKin2mGdZVjwpEQUuJSqI6ScinvBqHT/NdU4fNp//8Y/D5q6xZiaTCgZ4i7o0IbWy1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tgIX+mhW;
	arc=none smtp.remote-ip=91.218.175.72
Received: from mta0.migadu.com (out-72.mta0.migadu.com [91.218.175.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C11B4606A331
	for <linux-doc@vger.kernel.org>; Thu, 19 Nov 2026 07:48:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C11B4606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=tgIX+mhW
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=qEU0Tk5tuRynFX1J3Q19vVq3w7Tb+EgsrJVKUkkp2HY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795074510; v=1; x=1795679310;
 b=tgIX+mhWqzdh7C8R5xqdoUXUMmq0Qio9AUmRSb4IL9un0VXClm12+sDcI2ae8GDY/JCSC8WT
 WZ4nqgivxCQVZHk+J+0cpns+p3LrVk7RcyYNnBCm3CNryMgOoPGKpwPd8OHHVz33Lr6bR0id4gM
 9g9crN8V62KpUpfsb10BJs18=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id 7095458d099e9dc5;
	Thu, 19 Nov 2026 07:48:30 +0000
X-Mizu-Trace-ID: 7095458d099e9dc5
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
	Randy Dunlap <rdunlap@infradead.org>,
	Zenghui Yu <yuzenghui@huawei.com>,
	Will Deacon <will@kernel.org>,
	Fuad Tabba <tabba@google.com>
Subject: [PATCH v2 6/7] KVM: Fix the range of reserved arch-independent request bits
Date: Thu, 19 Nov 2026 07:47:51 +0000
Message-ID: <20261119074752.1027729-7-fuad.tabba@linux.dev>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261119074752.1027729-1-fuad.tabba@linux.dev>
References: <20261119074752.1027729-1-fuad.tabba@linux.dev>
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

KVM_REQ_DIRTY_RING_SOFT_FULL is bit 3, so the bits reserved for more
architecture-independent requests are 4-7. Fix the comment.

Reviewed-by: Zenghui Yu <yuzenghui@huawei.com>
Signed-off-by: Fuad Tabba <fuad.tabba@linux.dev>
---
 include/linux/kvm_host.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/kvm_host.h b/include/linux/kvm_host.h
index 4b91ef9667703..21207d234618a 100644
--- a/include/linux/kvm_host.h
+++ b/include/linux/kvm_host.h
@@ -165,7 +165,7 @@ static inline bool kvm_is_error_gpa(gpa_t gpa)
 #define KVM_REQUEST_NO_ACTION      BIT(10)
 /*
  * Architecture-independent vcpu->requests bit members
- * Bits 3-7 are reserved for more arch-independent bits.
+ * Bits 4-7 are reserved for more arch-independent bits.
  */
 #define KVM_REQ_TLB_FLUSH		(0 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
 #define KVM_REQ_VM_DEAD			(1 | KVM_REQUEST_WAIT | KVM_REQUEST_NO_WAKEUP)
-- 
2.47.3

