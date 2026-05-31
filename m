Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86E40311C27
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 13:55:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235713; cv=none; b=LVEr3VDMFrd9s5gY6sVAxsfnN/K1WZyYF7q8ITw26R1Ztkspzo8Serank8pFICIFuNzglyPruYhV4b5xD0uyGTLiwS670DQG3lbDocjw/9eRd6O68mcPKcL+L/YMud4+8cAjnoyfrDvQe76yseInLEve3dSG9HuXAUJ6HxPT09o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235713; c=relaxed/simple;
	bh=qCqpj1q7Wf2sQkVHcQVLbGGTmVKyL09F7STGaXtsWbI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=npFv7tlSDfbgsX7ESIR9Yg0CG8NJywWm8Izn/1sp1p0Ald/u0uEOjmi6txmOiBI2uzEKprINaWOP78WINaxFmD1Cyh6GAzw9TLpSm2MwbNRxG19X9e4zLRlF0V5UoGE1axo++5VycJ11fBRmOGq3u0jWOYuLzxOJJ4L5HugOrQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=UwNedyST; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=iB74ZXfd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="UwNedyST";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="iB74ZXfd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780235710;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=p7N+ilkdZqAo8LNMlsKa0BtFzJ9yelehDUdSS2+l14I=;
	b=UwNedySTbfUhXyzLNeYIuLeiVyFw0oNkslUGZ5FV+FqA9owCuklHgoLWA3YrwyQ23Nw7Pd
	S2twumDXl2Ur6vs9vaLot32lW1zjhTQkU2jK7ONZ1ZAeVqSi84ZU5whbm2CWOhdPNQUpPL
	BKojuOEYXMrYCnmszZqUTaVRug8SgMc=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-Klka7z_JNB2cHijeQn-PSA-1; Sun, 31 May 2026 09:55:09 -0400
X-MC-Unique: Klka7z_JNB2cHijeQn-PSA-1
X-Mimecast-MFC-AGG-ID: Klka7z_JNB2cHijeQn-PSA_1780235708
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4908af8d7f9so31104405e9.1
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 06:55:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780235708; x=1780840508; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=p7N+ilkdZqAo8LNMlsKa0BtFzJ9yelehDUdSS2+l14I=;
        b=iB74ZXfd8uwzJEz8DvKYkRxlJwno7o9OEhRrpqxSsTWzR37NBjH2g4qQOtLO0l6MAE
         B92eyi5uw9zHWP1akKntDwWHb19FTa/aklCwTM+pZa5rCGVvSxx9mv1+Na+DtYMZreIn
         ZuWOHoeGBnCK3stSbxVbQ8/z3FAVDOSY525i/L7ucdc0M/GGdny6g7r0LtUCgx74TU+e
         GXi++qui7I0qpFf6gnBEtBAYQtUZSwS3MnR8VC/mOuOD1gcFvD9DX9TuD/e3sJmxdo83
         NGxM4J3hyVcQm8woOOt3AuMz1LOOybhul1z+oBMuAgStTyvBEMHnXVr8X89QoSIPZFPe
         vLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780235708; x=1780840508;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p7N+ilkdZqAo8LNMlsKa0BtFzJ9yelehDUdSS2+l14I=;
        b=WRZsXmLz951cU1q1/UCmFm9UKljHRQvubiAIdcHmlnGLjiydhh50bzYsXsHloP71kb
         UkdBnFSD+NgxEKyyB8iblVOeNGZRGRgfTpeUUW7Hkc6TBXgjWrbjppkJVNckqiMqTVvs
         hzkNUF4UH32JC1s4gm+mI4KI0QaJ4q6aLVK1rEa2cbD9DF9kRf9pRmiR5qJSt6dyu/96
         xo24NcuYmF13lf+PVv3Y/YWwhqhf8j1gREOWdx9VQfz5v/jRxCx4G6UULjG+IIwd0+4A
         lXvPCXCCeSciYBvp+IOnrpQJlZR0IhCEdzIO2bgzXBw/SOeHktnOGv8aQatgyp4zF1fI
         1GUA==
X-Forwarded-Encrypted: i=1; AFNElJ/E/1K5Mwwat/SLgoSiE0g6DPTJznV5dTbcsFKyZ4ArtHAu0hM1gjDCaKAw/wLZSX40a8AxNK+k3nk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzyyzePayFVGaW/vddONz52OojQIZ+nMGYsrpR8oJtqwFaQnIXa
	Fh6eHzhxQ0pGCiodcOk6lModIzZuxb+BLQBW4AVAtpl5widCQM3veRLNZoJZ+4i8Ojv7QkfnoGF
	iYwtGR7Ptw2SDPEx0MtRwJDTCrzLh/fAG09t0V84fNyGU3pwhTJT8R4UK2MUoVw==
X-Gm-Gg: Acq92OGN+hx4VO/n8bzFyybLC7oIP3DHdWzrfZ3B7/VyIjqZHiUJLmclrMm+pJAmZnH
	RpENkOUFVgoLV22n/QJBaXd558T2tjWld/otFFGLPVCKh2fMwUi+RK2M0SvMKWXgeR1EZa95MD1
	t6dyhLXCKJzo8guUpay+a2j3uxAD9UJdpq+FV8r+/3BYYIMlB5LPjeLZQWJhzyJrpbLwVss/5CL
	hKq1RHBwDXQXeZRPNKn+vLVhOKSCYo7fhvKB65sGtz1A7WyMvPO06jhQWqsFV1Zif3DpI8lbula
	DTb4jiqfvU4K7hzbD4/RHuYih1tO2foeOuJwwOucuYTWibXa7CKUjB3bWKcODHnNvQv6nsOGzjn
	7BkFCVleRnrMEBSc3zbGqsEaJZtIUNgRgKRNOE3E8QQvLdw==
X-Received: by 2002:a05:600c:6091:b0:490:6237:521b with SMTP id 5b1f17b1804b1-490a2b6b21cmr131427555e9.27.1780235707643;
        Sun, 31 May 2026 06:55:07 -0700 (PDT)
X-Received: by 2002:a05:600c:6091:b0:490:6237:521b with SMTP id 5b1f17b1804b1-490a2b6b21cmr131427185e9.27.1780235707223;
        Sun, 31 May 2026 06:55:07 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6975e2sm292270015e9.6.2026.05.31.06.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:55:06 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: kernel-parameters: Remove sa1100ir IrDA parameter
Date: Sun, 31 May 2026 16:54:50 +0300
Message-ID: <20260531135455.4113157-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sa1100ir parameter referenced drivers/net/irda/sa1100_ir.c,
which was removed along with the entire IrDA stack in commit d64c2a76123f
("staging: irda: remove the irda network stack and drivers").

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4420eb72b378..459ed0d72aeb 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -6735,8 +6735,6 @@ Kernel parameters
 			restrictions other than those given by hardware at the
 			cost of significant additional memory use for tables.
 
-	sa1100ir	[NET]
-			See drivers/net/irda/sa1100_ir.c.
 
 	sched_proxy_exec= [KNL]
 			Enables or disables "proxy execution" style
-- 
2.53.0

