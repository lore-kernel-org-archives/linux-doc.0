Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618CF146D5A
	for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 13:59:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780235988; cv=none; b=g7f+0Z8m4wISkrliF6vacttwFvSIg6nBlpW9Grdmk1SAygXOhB/SdF73gZG8H4KeUxp8MJV9AhG/980Snk6GP2cNtyLGh8aoaseS+OH3Djt+c56vSqNOcIITwg5tMe6LRgPoHWwrx0OZtCKfLhLx2gjfeBeaDYxy7AIdSNBN7ao=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780235988; c=relaxed/simple;
	bh=6lQEpTCUzSDPmCgKLnIpahZ2D8JOYfJkb1FJ0yxFbPI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Juc0x+FE6EImg6rTZhdxQWLovbsO8TmJ86QWdKz497rPILuHAnm5Ep432Qe9Xanax6yODiWLmzouKkMo1Dz7cmzJUdFiFZEROKaEtwQLNAbejfRAAPZmRmgeK1Q+OvXwEFsa1ZIzaJd1vdpVuvx6zuq0zC/X6GkdL/NUs9AjBQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NEHDPOdf; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=g3lZ98F1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NEHDPOdf";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="g3lZ98F1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1780235986;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=03A2MUCmTXoLXQMCfVU/rqivXHeApJrPSQIBUmQXCwU=;
	b=NEHDPOdfsUz8g3ROZBlQGs5D2eK/qOGubYLVpTffH2bLcUZBK4tmShlsvaLTS05BJp/yAO
	i0cqmIsg6Z71BPZo8yOHVUmdX86a+l/FBtit1QGvF42PZddT5FMXxqVx40jCzpXdoijWtq
	qHAJgovzOFuRIZEDuysKidPVjEOEpPs=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-G54f_rQ8O_-0QvlxMYMsSQ-1; Sun, 31 May 2026 09:59:44 -0400
X-MC-Unique: G54f_rQ8O_-0QvlxMYMsSQ-1
X-Mimecast-MFC-AGG-ID: G54f_rQ8O_-0QvlxMYMsSQ_1780235984
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-516d38bfe83so196417791cf.3
        for <linux-doc@vger.kernel.org>; Sun, 31 May 2026 06:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1780235984; x=1780840784; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=03A2MUCmTXoLXQMCfVU/rqivXHeApJrPSQIBUmQXCwU=;
        b=g3lZ98F1VtzXlaWdrtdRRAudyjK4EhKYXTS1xpNu9zmHTHjzbPiqc6u5imtZT7I5/E
         nLx1ibTyRNxrcExc2rp9tWU13lwLcpNr/BL60WJEQhzfPJd+N4qONPjYHsDYDfjuO4YG
         cfST2wbO/mxEsKl+lLHMDgapG0+K6PECrHfpvITZrxSEtVvP0589Z6efiwp/a9XYSmvq
         cPdVls3j1PdWVNIhmjyQ3JSWrsMI2zPmzesY0dkU06jvI3saLPPbA+UU0cCAAegw0exP
         4q4izjuAWsOS1Kgb1128+hq4dVoQYaKXS70OzCdqUo43QTOVrvg56msJyjo8h/xmsVe2
         gDJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780235984; x=1780840784;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=03A2MUCmTXoLXQMCfVU/rqivXHeApJrPSQIBUmQXCwU=;
        b=CF770Iqle0PSirotTvEFCkpiv6TEhjXWyv37HcFBRShHS5E/4Cu831GFLZ3m0v2ips
         r+4U47T/ITgNsJZSVegoqLgfE/WxCcPmvJEy7GufVqG57OJIRVNnTiw4HLNPMobNo3R/
         c2fRZ5L6oKDHiaIGFxwo/kbrqEDlQGawbCSGlxF48cGjSI61iwG3ntsU+1tiJqmtHIVt
         /z+OUk+AgR4cr85fjzggF270S/PWZuRKNHa32G2T03AHKe8LcYsOmk8b3GPHY5CwMei7
         OJlAFaE7RKUNNL7i9zza80sDcaXZ3Mlx6K3ao6NEixRVRynRazpRM8xulzmjrPMGfYlf
         J8Mw==
X-Forwarded-Encrypted: i=1; AFNElJ/fSJCZyaa4ZYlMiywp3S43X4Dldxs63MrmlJztZnf+CxzXfw0aBONHv2WAupQeiOkrVO/aUzjKMIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwOqM5E1wpvmJ6RyuAkyRJECuF6QOcJmpnwgZFfDpdWNxeIih3c
	sTUMEGRkY8VhWQlDpA0pgDS2aTRop+iMrkT7TshKgT77uB4p/lQ2XBRjGItrYkbNQJJGOxf3sKU
	0DVa4HUoYBqpf3JNluJEjUjKWZtxLYhGgSGMbMYchDtXHAf62/wTMgX9Ns3xmvg==
X-Gm-Gg: Acq92OEohpk+4bu6z5gUNp+AjMLmEEyJmxY+wCBhRRhHE5Nv9NfwZEE2+uAH+8cPqDs
	K+WaBSvCMQsfjEkKsMI6Sz/XhDOdvHaXwmpuuBSKahJjg5jWQR7jEnd3c4fn0xuxpRiRioCTb0h
	sodqwYKrJSk1XF4KfE4ql9f4sfoQjoGMDli4L5TeIPAUMTW3Vk4tdl6kDW1Ak2G8vs54KsSlaa0
	OElAJgSZ5h9t9OMXTQyEgTkXVTeqFWFkP0Bc+Qg0PTg0e2hOiP/WbEASrEwmG85mecOAjBd4f4i
	q9OLlwNjREjU3y/av0erQo3qMc5JRA6XdW6facYHW6ez5uD8iMKfChF74Crfgvh6POA8DE+Vmx1
	c/93KD+faOutHBfvbCfxOK+vXlAS/cUG7YnpBh1h9DD4Fsw==
X-Received: by 2002:ac8:690c:0:b0:516:cfb9:2845 with SMTP id d75a77b69052e-5173a9467aamr97065871cf.46.1780235984100;
        Sun, 31 May 2026 06:59:44 -0700 (PDT)
X-Received: by 2002:ac8:690c:0:b0:516:cfb9:2845 with SMTP id d75a77b69052e-5173a9467aamr97065651cf.46.1780235983626;
        Sun, 31 May 2026 06:59:43 -0700 (PDT)
Received: from costa-tp.bos2.lab ([2a00:a041:e223:1b00:fe51:8bb:7986:c897])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5174dcdf91fsm13657491cf.26.2026.05.31.06.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 31 May 2026 06:59:43 -0700 (PDT)
From: Costa Shulyupin <costa.shul@redhat.com>
To: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Costa Shulyupin <costa.shul@redhat.com>
Subject: [PATCH v1] docs: sonypi: Fix stale header file path
Date: Sun, 31 May 2026 16:58:48 +0300
Message-ID: <20260531135850.4113774-1-costa.shul@redhat.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sonypi.h header was moved from drivers/char/ to
include/linux/. Update the reference.

Assisted-by: Claude:claude-opus-4-6
Signed-off-by: Costa Shulyupin <costa.shul@redhat.com>
---
 Documentation/admin-guide/laptops/sonypi.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/laptops/sonypi.rst b/Documentation/admin-guide/laptops/sonypi.rst
index 7541f56e0007..fb8f4a30ddce 100644
--- a/Documentation/admin-guide/laptops/sonypi.rst
+++ b/Documentation/admin-guide/laptops/sonypi.rst
@@ -89,7 +89,7 @@ statically linked into the kernel). Those options are:
 			set to 0xffffffff, meaning that all possible events
 			will be tried. You can use the following bits to
 			construct your own event mask (from
-			drivers/char/sonypi.h)::
+			include/linux/sonypi.h)::
 
 				SONYPI_JOGGER_MASK		0x0001
 				SONYPI_CAPTURE_MASK		0x0002
-- 
2.53.0

