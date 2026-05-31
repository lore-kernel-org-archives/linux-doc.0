Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67E2C3148D8
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 14:06:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780236363; cv=none; b=FLiW6407wCis3gzdEJ/wns9azycBPVQeBtMdBppG1CaC2gnIAAKxtH5zLcHF8JaZz1k/OOT54brH1OcG4LwsF/eSmg78/xrYrej1AQ0lohzgRQG4+XBWGLgJbH4dUrOAacQbIgyhv32B2EQ21lnAt+itC6jtBg1zTpZQ7EIya1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780236363; c=relaxed/simple;
	bh=IUspxaQuWdE8Z/c7luYIY5bxyxtrZ0krXHqdBevnRWI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JNKa/y2tHRXs9PpHmWY82cisRcviu+oiHZ2y6Z84+vuxRmRFt8k6FZHkib0enqMFuSZlr0KvM5LoL3f/JVJ878DbyEF2HqnfIcUwtC2JSOkhlLeV++GSm29bcU4tc7IC2t3LWUFHm2T+Igxn59jIJmx3Y4hC1JO3Ig6wb7X0enk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=G25VxvDl; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=bXjHwObe; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="G25VxvDl";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="bXjHwObe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780236361;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=1SOLKMEMgV0vwLhKuZFm/mKyDDFppk7ZEt1Oo+9fNG4=;
	b=G25VxvDlFhSsXZc+a5HkoPLVmEibbPchZhmBAXSCI8plqYX4sPKjDA3LNg09t/A1kKzBH1
	HhnH6VYU9np4PIu5bNiHB5v8S2Kurfk1bV/r1kirC91MsONIjquByeViVhVuMHFSmIrAU8
	hGc9ZePGZkqrfhIST0SeBXot6frPDJQ=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-548-LJ0-Ty1qPICP0huofesRmA-1; Sun, 31 May 2026 10:05:59 -0400
X-MC-Unique: LJ0-Ty1qPICP0huofesRmA-1
X-Mimecast-MFC-AGG-ID: LJ0-Ty1qPICP0huofesRmA_1780236359
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8cea98a0effso8579416d6.2
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 07:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780236359; x=1780841159; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=1SOLKMEMgV0vwLhKuZFm/mKyDDFppk7ZEt1Oo+9fNG4=;
        b=bXjHwObeM1fd8pRq4CMJaPNa3BIQvD5H9De0FliilRoujeqoZL3pzXjuuQfhJP1JxS
         hyDZeFaUpPbZAVLrD3J5wyMlzv43JJPd+4cqp/DqEO6YHn0KCZjhHnCOGRIHrzsZ+5wD
         pp36fqLoIKEXc1ZR+iwykRf6UgbLQT3GcyHohg8iTtlonrpboDRDoI9Lh0I8EhuzCNSq
         aWyHO6ZP9agywLnwdzYLi7/LyfhEn9b4stF1ryLXthIy4gYVs97ihTlaa8AyGffMXDnp
         FEzwrbFRvkbPUjTv1NLaC2iPbiHbWM3Z1ptFojASjD1Ue03Z4gfanPGFqXGwuFgDUCwz
         6gTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780236359; x=1780841159;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1SOLKMEMgV0vwLhKuZFm/mKyDDFppk7ZEt1Oo+9fNG4=;
        b=MCbLaH8xGxfHIvyCGl3gsNVxawzDvW+MxEcrqSAEBhRI+WW1Z7JwmHDxGK9F8MGmf9
         YJ5lKwvPadsUoQ7ms46dEJb3V/ZdmbC6MMsoBnLmh14YRfo//Lg8ACMIORN4IiHxDapH
         oE1W67czzGKyxTMmH60p5zkxSeIvlXXSYUh9f3HcdN7TGvYa2QAt5UWG/WM/yueuVQ7x
         QMf31WXFwqyvK4f1dZX8M/cPZzrMANElTJl7AWvu18KEW8YqLIQCkUCTY0IIVf+3sUvK
         eYciDoG5CrSs6mFBfpXtPs8knT+DinrEXLj/qHy9tdzCrgQipSz3gKgx9HsDFk6eSrB/
         5p4A==
X-Forwarded-Encrypted: i=1; AFNElJ+ZgEop87bmtQnnPSI0yezOrAKKx2sgid4HxjAIMcFE1Pu7NbCdKWf7kBnxMcjDBtCBBZZREntevoE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxSx8jZhSj5Fv1hEPTa3L6e5bI3uwh45cUXK8q6q4FdMAT5CMNx
	usBvpYv2VO5noYZZr/srq9No58SEA7nVu99nB8rwHzDj45R5Ah1w3p2IvnnX4vN0gMcQFpSrLH3
	PTtneiDxie8cWUcdOHD8pAMQIPZj54CqrUYKKtO/rvEEykn5/jm8Q0a51a1D7KA==
X-Gm-Gg: Acq92OF7EwhiNfR4nFZYknzKz8ctDCK9ZXq83/52fRFEuaPPY0nZagSJc1rjzYhIUc4
	J8tdnj7R+mNj4sELnc6GmEBXnyhHcvlXWGT9mo+odi+1Xhrw/vrIn+w0AYna7sJt9xzG/I0T6e6
	XNBrOU/yPqu4/ysZuV41eyM3zGEwsnpzCW4lsFPOB5FGJUNFPjNie8BgEe+DueDKyb4RMjyzyGX
	2DfkZ2f00x2FPSh2Z/rBqXrTu82i398aaFVIRRLyQ6nLJuVXjtXfFKc7t3m8++dOeE6NIwtM7ow
	U23dH3WMRiJFH5rTaa8PcVvInghtuHVS+kgMkuZ0D0VrSdU9yvFxK23naQRlHfdACRCCBDH2FHF
	jrduJ5tgasmAA3UX0+w5M3jL13PzLqOP2nwoJpB4/Rx5s4A==
X-Received: by 2002:a05:6214:2c04:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8ccefd3e23dmr123141046d6.15.1780236359243;
        Sun, 31 May 2026 07:05:59 -0700 (PDT)
X-Received: by 2002:a05:6214:2c04:b0:8ac:a6bd:503b with SMTP id 6a1803df08f44-8ccefd3e23dmr123140686d6.15.1780236358901;
        Sun, 31 May 2026 07:05:58 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ccea1c30ecsm68564446d6.25.2026.05.31.07.05.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 07:05:58 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: kernel-parameters: Fix stale sticore file paths
Date: Sun, 31 May 2026 17:05:37 +0300
Message-ID: <20260531140541.4115641-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Update file paths for sticore references that
became stale when drivers were reorganized:
- drivers/video/console/sticore.c -> drivers/video/

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 459ed0d72aeb..f94ec9f3a75c 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7381,10 +7381,10 @@ Kernel parameters
 			Set the STI (builtin display/keyboard on the HP-PARISC
 			machines) console (graphic card) which should be used
 			as the initial boot-console.
-			See also comment in drivers/video/console/sticore.c.
+			See also comment in drivers/video/sticore.c.
 
 	sti_font=	[HW]
-			See comment in drivers/video/console/sticore.c.
+			See comment in drivers/video/sticore.c.
 
 	stifb=		[HW]
 			Format: bpp:<bpp1>[:<bpp2>[:<bpp3>...]]
-- 
2.53.0

