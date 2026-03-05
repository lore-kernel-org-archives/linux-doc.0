Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97FA43E3D9C
	for <linux-doc@vger.kernel.org>; Thu,  5 Mar 2026 18:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772734090; cv=none; b=MRg4aNpR+uY2JMeWNGdaoI51pMQRi8PcwF5wRoKLuy4kt6xKahUeZu9Tj4TwvOO46vvvAVU4c6Ex1ZA1qJKMvrryOoJhw7j1OA1mdH3daEYiln8vMAUr5SfsmRrAi/fzIZF2GhLntQvnZCXhZfgsNv3O2thm57Ov7WTla0Ac2I4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772734090; c=relaxed/simple;
	bh=2ctX1mZz+0YJrGol754hzx2Gmt4W2jykkiI3ik0bJWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=B3wTfF2JWXoKMLRQbr5F9qnOHMAtfQaEByfGh4usoMxxvhu9d7jOxlCXATtRvEumzQOqI2u7z5tK3TowtoEIaN3U4A9nflIgmmr2ooy+Y1vMD1lnPODPdxle27aFfr/5DABpJh8AQZQNpixeG4EMZ1T1DQIZW+3f2VQ183sBI6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BkNw8Yqs; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BkNw8Yqs"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-35995cb33a8so2477454a91.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Mar 2026 10:08:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772734088; x=1773338888; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UQsGapjWvt7DkE/WwtDK7xc0/QU5KL1TvsMkrixcHyA=;
        b=BkNw8YqsHxFLxkl8W8//VPR5ycoQEtMxba5W97UEHblfXsU/ct49SJ4uSE/1DOra7o
         KvW+yafNVkSq6zs4h9oExchTczqjWfka1MBFs46wW4GgKj/IqajhQQYMi6yFpwDj0Hgq
         RZekSCKx29GjNcUcq/pBBk2SuTJOBoQSJjV1+jQ+KCU0lJ3wtyP3cgq1JsKehuZaOXDk
         /n9zrDYb4VoYDGPZJX9KI+4Lo+TOtVkRbnpJbZeIDf82Kca2Y6YS+kHUHUbAoZOfOb4Y
         83gKufrlfKeavFSjHt3Vf/St0MeyUymYjPDP3Ds89jqCww26ziswGZkjKnyWvNlH1A5m
         eLQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772734088; x=1773338888;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQsGapjWvt7DkE/WwtDK7xc0/QU5KL1TvsMkrixcHyA=;
        b=Wpu9uQ6eoJfdeLJAelXbg9Yi6dpI2qo5oaAMizAJCpieVebLvOXg0tovbMoXvPIcI0
         ilPODS5EzQXOoXT7GdQH1O2izSy6rbIqDWTl1iuEHkIb1UsCekc1B47nQTuSPD3DgBy6
         yD+3Bg0nD7bcrn8Fn7IUp6AfgDDhn2bGN5aC9c/n6xUfqRXyujLZQyoc481xS+l+C0jn
         QqR++s9NMTAdFLLWEJ0NhS9MqZkuXdgvtB+k6ARUQB/dgpW6bvUxQPMmV/l7/jnMNLOe
         /NEiZO1xXKgfvSjk50S1D6VRB8FJknLSrX4Pxvr4wVwtuIpGHcGJzqy9vXAuDDP4okTu
         7mvw==
X-Gm-Message-State: AOJu0YyBPcpr2WUp6lvAZpoJ+ufG1MPMGL+Z7XPcoTq7HeMEGMuEWwLk
	iFOCUX+6CiYphwtuXXPD8FYg4+waAPSzmRjTOcKNRijQMhiRKmECVbqnK822o31B
X-Gm-Gg: ATEYQzyisre3bxJRN5oJCtEJPrKM+0oVA5E+NnAulIAmTX5vBLBXfsWicZMWBIfTmdS
	/0KvtGsclUJDP92teeaHr91PssvufAnF976VLHPwj3meV9mtIfkWU1bZjX+NYkIt6oR39XbmwX9
	lUiRqMQ1BeklCJpn9uIT2fIjmFNwfPdTgmLrjAg7QatPuf1Ro4yZl1dLNzjZEK02wmKrzua/6cS
	Hn/gbO3lAIP6fyDtQuNlCQV56akeN4za4ruKjVsAlwIX1snQdsNhuH/88Xxs6n4Tn23/h/ZRoHY
	TW0CfC4r6BQC4q71P8ed9udd1k5j1t5Er+SFTHJO9h/nqho4LeJ5qRT3rMR1pbarf/MYTad2VpN
	hynY7w4Jg2oLPtAceMcQXTRqxaOAk/bfA7DxnMr+NHu0pAMIWip6dkuTm4n8oLG3IZncUkrPguV
	0+kAYW9HD0gYVfmeST8JEBs7XPCmkaIbR4HFG3XDERdvEStCLypjzNAMyASWv/RTu/vDY=
X-Received: by 2002:a17:90b:55c8:b0:356:24c8:2291 with SMTP id 98e67ed59e1d1-359b1ac4e05mr2725431a91.0.1772734088524;
        Thu, 05 Mar 2026 10:08:08 -0800 (PST)
Received: from fedora.mrout-thinkpadp16vgen1.punetw6.csb ([223.181.53.201])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-359b2d40427sm2638396a91.5.2026.03.05.10.08.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 10:08:07 -0800 (PST)
From: Malaya Kumar Rout <malayarout91@gmail.com>
To: linux-doc@vger.kernel.org
Cc: mrout@redhat.com,
	skhan@linuxfoundation.org,
	me@brighamcampbell.com,
	Malaya Kumar Rout <malayarout91@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Marneni PoornaChandu <poornachandumarneni@gmail.com>,
	Kevin Paul Reddy Janagari <kevinpaul468@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: driver-api: usb: Document USBDEVFS_BULK return value and short reads
Date: Thu,  5 Mar 2026 23:37:50 +0530
Message-ID: <20260305180753.114732-1-malayarout91@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Remove a longstanding FIXME comment in the USBDEVFS_BULK documentation
by properly documenting the return value behavior. The ioctl returns the
actual number of bytes transferred on success, which naturally handles
short reads (where fewer bytes are read than requested) by returning a
value less than the requested length.

This information was verified by examining the implementation in
drivers/usb/core/devio.c:do_proc_bulk(), which returns the actual
transfer length on success.

Signed-off-by: Malaya Kumar Rout <malayarout91@gmail.com>
---
 Documentation/driver-api/usb/usb.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/driver-api/usb/usb.rst b/Documentation/driver-api/usb/usb.rst
index 7f2f41e80c1c..a01d72af479b 100644
--- a/Documentation/driver-api/usb/usb.rst
+++ b/Documentation/driver-api/usb/usb.rst
@@ -539,6 +539,12 @@ USBDEVFS_BULK
     kernels support requests up to about 128KBytes. *FIXME say how read
     length is returned, and how short reads are handled.*.
 
+    kernels support requests up to about 128KBytes. On success, the
+    ioctl returns the number of bytes actually transferred. Short reads
+    are supported; if fewer bytes are received than requested, only the
+    actual number of bytes received are copied to the buffer and that
+    count is returned. On error, a negative error code is returned.
+
 USBDEVFS_CLEAR_HALT
     Clears endpoint halt (stall) and resets the endpoint toggle. This is
     only meaningful for bulk or interrupt endpoints. The ioctl parameter
-- 
2.53.0

