Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AB93DEFE3
	for <linux-doc@vger.kernel.org>; Sat,  5 Sep 2026 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788600590; cv=none; b=uS49WZxO21UXBXM17JKCcDwq+qEscy6FtRC1j2dFN1FGurVrBovXOYisK1Z/Q1aw1pVk6vj7ZdXT6A5VrEpy3StboXtHkzAmKN9QrFm4SKEzGs/ZnnUo9bIGLYzQPi/hgUEEgJ311GDkMC8xe/k+SVhI+FikwNWmuhH9Lybpgy4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788600590; c=relaxed/simple;
	bh=88pQhMM6i98/F6e6rKnGntWh1ykdqLFjTXT+4nkQNyM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qmN+dLy3sCMVItbS3zrhvY2g4zET+YiDhIgHOkvpTg9WK/Nxz3EZKxzEpmlTRiVyYJUqIYXO68LaXRNl12Fsq4E54KiTRxvh8rsg+xsJG9Fm+2R1NEaL7Ky3OGMdbQXOKVNmf1OCrr3tCPxkM8F+vA2CfQXsKwEfxQbg8w9yPlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N9Bn5cYv; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N9Bn5cYv"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-48441fa5c37so1298313f8f.3
        for <linux-doc@vger.kernel.org>; Sat, 05 Sep 2026 02:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788600586; x=1789205386; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=pIISoak4xvpvOrDQr99dp5Bs6ZVGQZh7PBWMviZBV80=;
        b=N9Bn5cYvcSvV9UVW6T2tMog863PSnD0EbLcL8C35iV0JyKpXVvdoDnDNAOaldMzwOn
         11tfzUaVWAAa5yeT5Fl1R+NrwI/+QtUtj75Gduxd7YzY0EW/3APn13JrLPBqbGFGg/Hl
         GlR5lse0Hhs98vxSpRneubhVW4/Iu8iLOJL5CO481Jk/X6gVWVL6hA+Q8Pn7AsyVaLPV
         RzKxaXTAS6VM+Puh2sX/MM6vbJkiWJmkcgyOKEJ7fykbCC87zR6UxN9Kho8rYQNAx7P3
         u2KGPeYlZITpidGtgiuCBaxntehZoGcsAfsEyQ0iHehUpyTznN3VB0Umga176a3jRg0Z
         eLKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788600586; x=1789205386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pIISoak4xvpvOrDQr99dp5Bs6ZVGQZh7PBWMviZBV80=;
        b=IWpOhht5/0pdwgv+tGCe52dOwIO3z/H61ytVsjUYveYPzEqHLxcGioIl8S704GUlOW
         7rs275rvdlswEvIye2YcjPHrOCQlkGHVm1gSb++zellLorvL8/5ErhapIBIAyQAYvaj/
         A7MwgSovQd5Z8lgtYP9LH4x1dBA6zvAbcmh1aKDHnZl3xq10N+X/F1RZYXHoyFinTAnZ
         0cke2eag3YMeTqsJHMsPts+1fS+LSHktrgu+5ERcqYpP04ND7JwE8yMdrkzL9nSRx8Os
         VgBAEWgqVhE8LgBCfqSR2ALZpbW+XO+7Ng6PMHohP7q43GILrESuP4xbkQN95ytVcEUU
         teaw==
X-Forwarded-Encrypted: i=1; AKwUvBw2WvbIR4mzsl4/QztnNfxhkDmdxt+ocCfD4YZLEwrf7+xdtehYi5QRcheEuKN62tpVd+XY6UnR+70=@vger.kernel.org
X-Gm-Message-State: AFuF++lMiMq2AE4POFKRwgjSFkY+aR/FoWmNYNUC2tNxAl7CcrIxarRj
	MqR+BsS/u50DMV+z2N8VPgCowzAcapcOVqjCW61vj4hYp4UzrfZL7wnJ
X-Gm-Gg: AYBFou3q1ufJo+t5+ErSYaPd7DzjC2Cc75cRZ7F74bKl4i5g2FtA3hTSFM3OQAd01qI
	pQJTRn6ZtVb8QAuBmFs/2LoM5IPYjNGip0cnJSYXObcVE7TeXvf+Ij8JkJsEgakgDiCgMcxbpbv
	xd9tjHWnMrJzRmCoRY2zIPiocUuu47QpugrCsXNW1Wb6Nl1vcMOjmttnguJJlzs9xaXpWO7qhdR
	f2ZHJZxts4ZqBc04q1trfU0mZZCsr52f5QyNpZwtxugkZqPCgijVR5/nXTF+byX1vbNS7PyXztx
	qyHfdOddXkTWuTs+34y9iGKBZoT+grhBlmwKXy85o0N/UNSHOgxsei+5XZD1KaLXpxNqbhWCLLq
	V9Soo79gdqvAMjJfcbAydrIR3ZanCKvCoBL6UbPKvEiMgdAAUvR2AKGgiKIqJO+qhy3ppnh/CKG
	dqx+sCpTCL+89mtBX0w/n6CWOjJGFtOKKpW7KBnIPzLySYAsnUDCuelcSfv1Hhsr+LartqzyHiu
	lI08i+N/pdqdtTs205qeCwKUGlizzb+yM0TqfKKQOiByMSzbnlv4UIK93QZs3o5T1DQeTTXzkp5
	d+B7145MrFQfQ4DmWZ769jndHx0Jp6/QdHHiN4/AC5XUiINHDZzmB/VaaEU1F6YsvaI=
X-Received: by 2002:a05:6000:2512:b0:484:4153:11df with SMTP id ffacd0b85a97d-48587287d5bmr13746106f8f.11.1788600586098;
        Sat, 05 Sep 2026 02:29:46 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a4eb-3001-c06d-af27-9fa2-ea53.310.pool.telefonica.de. [2a02:3100:a4eb:3001:c06d:af27:9fa2:ea53])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-485885bfe14sm13091255f8f.35.2026.09.05.02.29.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 05 Sep 2026 02:29:45 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Tom Lendacky <thomas.lendacky@amd.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Ashish Kalra <ashish.kalra@amd.com>,
	linux-coco@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Brijesh Singh <brijesh.singh@amd.com>
Subject: [PATCH] Documentation: virt: Fix the struct snp_guest_request_ioctl name in sev-guest.rst
Date: Sat,  5 Sep 2026 11:29:42 +0200
Message-Id: <20260905092942.41558-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

struct snp_user_guest_request does not exist; the name is struct
snp_guest_request_ioctl.

Use the real name.

Fixes: fce96cf04430 ("virt: Add SEV-SNP guest driver")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/virt/coco/sev-guest.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/virt/coco/sev-guest.rst b/Documentation/virt/coco/sev-guest.rst
index 93debceb6eb0..3371ebc29e8b 100644
--- a/Documentation/virt/coco/sev-guest.rst
+++ b/Documentation/virt/coco/sev-guest.rst
@@ -38,7 +38,7 @@ along with a description:
       are not detailed, but errors with specific meanings are.
 
 The guest ioctl should be issued on a file descriptor of the /dev/sev-guest
-device.  The ioctl accepts struct snp_user_guest_request. The input and
+device.  The ioctl accepts struct snp_guest_request_ioctl. The input and
 output structure is specified through the req_data and resp_data field
 respectively. If the ioctl fails to execute due to a firmware error, then
 the fw_error code will be set, otherwise fw_error will be set to -1.
-- 
2.53.0

