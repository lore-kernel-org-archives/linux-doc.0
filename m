Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B2B18306F
	for <linux-doc@vger.kernel.org>; Sun, 23 Jun 2024 16:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719161193; cv=none; b=Jn2LEZ1FFpx0t7LCuuvJTrlIH100SCJi+LBEJniX1WT8yN7GYuZplOLXa43kgPsoOehIICUojz0PdeaUbElg9+A+7PxCHQ/GDgZy6ZqPaMF5BTt9b/idKVArLNRkNOkvvSkUobmupzYNzhmQnKAyuRJ8nPmWDpq++jCsojyfdPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719161193; c=relaxed/simple;
	bh=TpYgag2AWfY+r8n0EVy95+D1bg1611Qel1rooGm/U+U=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KMy3k+LI+1ImEAT4zefjvqkao46kvu/DpiYqZW8OcB9d22/7ZSTfVX+M26anEL8mZWWRe1503DQ5o2ozC94ulc2S9bZPrsrXuK/OZEw2BcY80k5cGiKGSfUPoXzkOtarC3RQ8PncR40i3sEZE1pca+cL+IfyqM85ABtmWjoPQSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P/ISI/IL; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P/ISI/IL"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1f9c6df671eso39307905ad.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Jun 2024 09:46:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719161192; x=1719765992; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=2v8/X8JxGRN8NdNpnyhVNdtUd4APq1zc20IQH5DoRuQ=;
        b=P/ISI/ILXUXc2Ba2NKZaM2muxUQYwwuhpDJ0Axpt7g8uqOv8vYiNKylvmrqt1rJJN2
         7GNyj/TfnpIiRBiRHklv+sXbeAcW3Z0f5L04Z5GMETcNARSw1oiipiFWFCf+YJOlj6Z1
         gIX2FrFxZjKacH+YtGufC1Sj1DqdRijr7PWtf8bp7GBbQlc+eSgbDWYuet0MfoAW2Go7
         eokWErzDeRU2jxm1uFgEZ9WiLbiuWSoTB0FjeP77XkACEitO4+8R7j7vXHohxiUwTmuq
         p8AFfw28oshC0VzxF40glem/zHzYOV6d6y3slf21JRZKleWIAVCycddj/Zcx4VNkDSwJ
         IqQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719161192; x=1719765992;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2v8/X8JxGRN8NdNpnyhVNdtUd4APq1zc20IQH5DoRuQ=;
        b=Giw9CKo8qu1qiVLmfkA9Yz/bFdLkB0EYA6SMepnFfGVJCvXF00agn0jZyrKlUYnGEd
         xb7jrzaTuCwEPNDHnFyWtQ7TfDlrcawy8DPisAfrgPcevy2xjij1f8wZELN14euQ4Yjw
         C0EQzDIRMcU2HzMdJwiFD39t2e4QjnXQ9i+EhJCZrKuU4XwA2sAToOaSEVGz0kHF/Cev
         4cGp+cc1G134DNR+eeB54cyd7KwBVLo7V9Bq8gCnRFZTqNlBZZBB25UEn4FpkURhDVgt
         B1/SvqTG8hHt5HIIQ2IZz4XUsBrtXkewAhIvD3dLcnNuMzFdkZAQO3yBoxCUshH0s4Up
         evXg==
X-Forwarded-Encrypted: i=1; AJvYcCXyUrvRLjCR31AU1d/GgzUoRoIj1H91WFfkb1i2b6xtkYq9OP3cGXFAqxGo5GRxPTTpKGge9PDOIe4e9xta+Tvp/3+03v+DwwZS
X-Gm-Message-State: AOJu0Yx6V9CHgR9lo6tN4Zn3cIyggy0uReD8w2VWtafNkOu4fIzK5oHD
	D3HaglpTytMcQX+FP8clB/oH7sciO+RxfdO+8pdBCxY/mdCQBRYisxb+IEblsfdCEEVS5Ejg/qc
	qhmEmC51UnXfBKG/pXA==
X-Google-Smtp-Source: AGHT+IHwJfMeb6Uv/DNFCAk3a9X1skCCHl4ZuNGhDYw35DtC/v/kvgSjh4eYTWru9eh+bqoYw7yDcBUJW7HUkF0r
X-Received: from changyuanl-desktop.svl.corp.google.com ([2620:15c:2a3:200:c9fa:2a0a:34fc:4e66])
 (user=changyuanl job=sendgmr) by 2002:a17:902:e752:b0:1f9:aafc:1ebb with SMTP
 id d9443c01a7336-1fa1d6b39f4mr5288725ad.13.1719161191876; Sun, 23 Jun 2024
 09:46:31 -0700 (PDT)
Date: Sun, 23 Jun 2024 09:45:41 -0700
In-Reply-To: <20240623164542.2999626-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240623164542.2999626-1-changyuanl@google.com>
X-Mailer: git-send-email 2.45.2.741.gdbec12cfda-goog
Message-ID: <20240623164542.2999626-3-changyuanl@google.com>
Subject: [PATCH 3/3] Documentation: Correct the VGIC V2 CPU interface addr
 space size
From: Changyuan Lyu <changyuanl@google.com>
To: Oliver Upton <oliver.upton@linux.dev>, Jonathan Corbet <corbet@lwn.net>
Cc: kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

In arch/arm64/include/uapi/asm/kvm.h, we have

  #define KVM_VGIC_V2_CPU_SIZE		0x2000

So the CPU interface address space should cover 8 KByte not 4 KByte.

Signed-off-by: Changyuan Lyu <changyuanl@google.com>
---
 Documentation/virt/kvm/devices/arm-vgic.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/kvm/devices/arm-vgic.rst b/Documentation/virt/kvm/devices/arm-vgic.rst
index 40bdeea1d86e7..19f0c6756891f 100644
--- a/Documentation/virt/kvm/devices/arm-vgic.rst
+++ b/Documentation/virt/kvm/devices/arm-vgic.rst
@@ -31,7 +31,7 @@ Groups:
     KVM_VGIC_V2_ADDR_TYPE_CPU (rw, 64-bit)
       Base address in the guest physical address space of the GIC virtual cpu
       interface register mappings. Only valid for KVM_DEV_TYPE_ARM_VGIC_V2.
-      This address needs to be 4K aligned and the region covers 4 KByte.
+      This address needs to be 4K aligned and the region covers 8 KByte.
 
   Errors:
 
-- 
2.45.2.741.gdbec12cfda-goog

