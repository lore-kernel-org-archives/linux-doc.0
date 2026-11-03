Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.229.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793749920;
	b=YGGblAb7P7PcwDaxDcnxG0r4GmdgxIMY1fE+5Zg8SQiD7desdiKWuomJmxXQ4fYwPLHr
	 TCs8Fkv0BVPre8rR22dhUI3o3xD/1/GgS4kxuTxIaRTSKEsMDAK0Uk+T6M/gW1emygEcs
	 ZsW8elFxrhvI28DivIgY+2McUmd0rTflZL5ez4gqO9Ivz5bzB06jZDFztD4urBN+8EuP6
	 e8FMddmUrNXD2LpYT7HRKT7rl4lJhheEc/mr5EtA/jS8s8v4B+pinAhigl+yc7eyec2fn
	 z+PVPKLcGyXNA7jXI1c/ar9Zn3R6Aar1TogiLt3juXCISdgaenZrUW/NKJV+ZlfNrLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793749920;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
	b=gsnyyDXTBEgVqGCwLhYdJYEXarmPZplyd1wwKCw6no68mnbVbz4ldypCKpgmeXCikEjr
	 QHkpd4DxKS3+UdM5Nd3AWMbF2b0QCwx0Y616Yfr263yxKhOa2r7cdFeeM4PoDFNcVo+b7
	 9vf+hAw6fohOtew0pyODtX2tzbY8/52Qy3LvD4VDFhomeIArOLMujNTEwa3/GlZXMIeX0
	 QnQUILBSglVdi7aC0co0bDC4zFyaxMQzgwD6gNI6AGbiJQRLxz8u4ZIls6AjYmkKC3hP8
	 /27yNibfvMSBk7mcyvgeNRDheySfvbPhymogC4RSOSMZUHF9ypyffc9ZwyF+cdOS//g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPGN4NCT;
	arc=none smtp.remote-ip=74.125.229.9
Received: from mail-dy2-f9.google.com (mail-dy2-f9.google.com [74.125.229.9])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57B5F606D82C
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 23:51:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57B5F606D82C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=UPGN4NCT
Received: by mail-dy2-f9.google.com with SMTP id 5a478bee46e88-35eaf84cc66so76434eec.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 15:51:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793749918; x=1794354718; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
        b=UPGN4NCT1NhBPIdKHOKGSo0GUnrckC9TyZik21lyvgHH0js5GC9k5TJvR4sCkcW/zf
         1lqBRPSCRMRSY8+khu79223f0n2Ep0gmSa94vrnY8TxyBaizryjW9AhJNcZtA2mf3rpP
         c+7JpL8AACxqCsQvF+N7Q0U9wahzNZPeATpsssFqEZKAqYmSoi13mFrBPWqmLOiY7rAs
         7bc7HjUey4W9j/QrJb+6rhxinIql8PWDfb0Y3Wzu2YMrYCxKlqq1hT1Un32U7SuPjVFM
         RqQ13NeFN5J8S2CANiaczj8DJJSAn87CmCAoq//kL8v1lI8OLCvoVpchWHTM8BtStETw
         HPCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793749918; x=1794354718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u2FL5iZJ3JHIjTjapoLLiX3E/WLeHQAJjW9k9AzRwQk=;
        b=T4ok+X9TUCj1+TC9qy8l7105JrcyWY/lQTqiW4NcAaa3kTdxLMLuwGfyW309bWmpCT
         dRA7pCcc6OEy+qfHX2Hv0OnY82j/FoGJTkqlZEDKAIeL0kD3JXDfl0x1CB9W12gKdT4M
         1E9jX8LQxx9YLSPo0SDwm0Wbd3TUGNvhoJNg3ZJgEZf5vs95c9CQ4wLzhRXcuOp90byG
         18iXEMDiwee+9MwvqdSXe0yqiMKLOl9aCkPIpH09i6Rinnzb0js5A2EsxRZrfKyBelcN
         5AL0R822iuuxU9hrLwwb6Uq05I0VJX+UR+nYFKrNio+YqpchKl+OZMIWSsWMk7qpXxha
         Cqcg==
X-Forwarded-Encrypted: i=1; AKwUvBxEPDPxfz45BNk4foOmsGbKnPYZE7NjaoY0HNfzv3gq2cljz0JFhmlOELcntX0sY2ZfvUrjryPx9h8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9M/HaBxP4YDgxCJamXaCwwFSnL5/bUqyaipowuoIN11De6IQQ7
	jePH37DyxPqSVgs/O1L5PZdLdeotojYQ5IXxVYSflp0dU/i/F+8VFHN7
X-Gm-Gg: AYBFou2A0m7wvcM4R7APZV4Wfk8pSGYFrOcmeRmN9HBE7qndRJBlrLJ6SzLOUBm5C/F
	NL0z4cnNX8zJDYmHvine7xDAGopJnUbs88OaoaZGgilRKbir4caiLAkv8CSCEZjlY4Q4tRFfqdn
	fPp/Jkg5fei+u/vw7tk9p6l2EnJjAaANT4SlIJx2yyh1mXQD7+dI0rGWeqffEpIRe49OiLhhaGf
	7FfnbvXW99v8i/Uk7i5Mt+qiBn0tcX0Oa4RRI2/nqa38CkH6gStRo0t3ONc1pop2Uy/C0axwoqk
	Jb0ZQ8lm+UCZrSF62tT6GzXYLDmVpj6/fItDP/wuG9nsTXW+N6PmP7Bl4fAJMDyTv2hL7zKsyEq
	/poyWLOkXrJdSwY1foLrhWQp6qfYnAuotcOdAkvAagl5efvpwZtR9HAlGODrxkO+JIt54Sp6Nog
	Nm1Y62g3iDaRaK7zKeTNvPfUN+jSwX/9DsdNqb5oFI1OqBknH6NTa1VZRCN5c8DG5Eczo/ViOjl
	hlLcHVtFaZG9xEE1kJxEyKGpKkckxLlkfR94ajMVnbQc6hGY3sZfTZyu4h9qAsQHXqeMsZ2PAeg
	mAsinm4hC513/JySCoUHmec=
X-Received: by 2002:a05:701b:230b:b0:1b2:4378:3545 with SMTP id a92af1059eb24-1b2437835a8mr3011803c88.21.1793749918147;
        Tue, 03 Nov 2026 15:51:58 -0800 (PST)
Received: from localhost ([2a03:2880:9ff:70::])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245c748eesm2167834c88.23.2026.11.03.15.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 15:51:57 -0800 (PST)
From: Stanislav Fomichev <sdf.kernel@gmail.com>
X-Google-Original-From: Stanislav Fomichev <sdf@fomichev.me>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	andrew+netdev@lunn.ch,
	edumazet@kernel.org,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	michael.chan@broadcom.com,
	pavan.chebbi@broadcom.com,
	sdf@fomichev.me,
	almasrymina@google.com,
	bobbyeshleman@meta.com,
	asml.silence@gmail.com,
	razor@blackwall.org,
	daniel@iogearbox.net,
	leitao@debian.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: [PATCH net-next v2 3/7] net: devmem: use niov_shift in net_devmem_get_niov_at()
Date: Tue,  3 Nov 2026 15:51:48 -0800
Message-ID: <20261103235152.1904727-4-sdf@fomichev.me>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261103235152.1904727-1-sdf@fomichev.me>
References: <20261103235152.1904727-1-sdf@fomichev.me>
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

TX bindings use PAGE_SIZE net_iovs, and the TX lookup hard-codes it.
Derive the index and offset from binding->niov_shift instead, so TX
bindings can use larger net_iovs. No functional change, TX bindings are
still created with PAGE_SHIFT.

Signed-off-by: Stanislav Fomichev <sdf@fomichev.me>
Reviewed-by: Mina Almasry <almasrymina@google.com>
---
 net/core/devmem.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/net/core/devmem.c b/net/core/devmem.c
index 32fafbfa1359..6339f221bc82 100644
--- a/net/core/devmem.c
+++ b/net/core/devmem.c
@@ -455,13 +455,15 @@ struct net_iov *
 net_devmem_get_niov_at(struct net_devmem_dmabuf_binding *binding,
 		       size_t virt_addr, size_t *off, size_t *size)
 {
+	size_t niov_size = 1UL << binding->niov_shift;
+
 	if (virt_addr >= binding->dmabuf->size)
 		return NULL;
 
-	*off = virt_addr % PAGE_SIZE;
-	*size = PAGE_SIZE - *off;
+	*off = virt_addr & (niov_size - 1);
+	*size = niov_size - *off;
 
-	return binding->tx_vec[virt_addr / PAGE_SIZE];
+	return binding->tx_vec[virt_addr >> binding->niov_shift];
 }
 
 /*** "Dmabuf devmem memory provider" ***/
-- 
2.53.0-Meta

