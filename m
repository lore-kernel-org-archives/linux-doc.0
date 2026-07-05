Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3BD526CE39
	for <linux-doc@vger.kernel.org>; Sun,  5 Jul 2026 07:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783236387; cv=none; b=Dp5GVXx76DWW9bJ4dzuzAHSHCQXS+KwFEkcv75wBCibkYUV1XqhW8f1MbbGgME0hB6hZzqxJQFcLab7j6H5NmkAJBhjKpUdxwxaWCj+7n+uBm4sDsXWohmuQvaw7llb57wam3HZs4rB2GYEDzf9tDM8grPWLcSPE9mazPgrNJ4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783236387; c=relaxed/simple;
	bh=cgPO41zzNjU6O93UEwyAVluafD2uWIUQA0Cpobu+O/0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=J06WStzug/xmK17CMT1Ly/e+CdUNp56wooQG4M14yd1a0a0omXABeMRGFk95lIiUL71zjWntf3Do4RrIyUpVm+NHo/DnJqIUPjiUH/Ddt4lgVFx3L94qcCo9RIpuVx9l5Ic3dC/WL641Mg+ff1o+WaoiWM6BA1EEHwkRSdxfBug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mN0ofP31; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mN0ofP31"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc7ef7ec27so5438565ad.1
        for <linux-doc@vger.kernel.org>; Sun, 05 Jul 2026 00:26:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783236385; x=1783841185; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=FBdctp38/9wGuY0f0rzSmIXPq8MzNuRFKf2gmiFzvrY=;
        b=mN0ofP31v7zgdXd+raxmbds9SWjevxNkHn8pZIe0Wc/YMfF11kb8NZI4hIvKOlacnn
         uglQeW+9+WaSkKMlzya7XPgm6LtsXTyXzCj1wsVjz2f42DWjlTpea2SrJATBaA9PcQZV
         VkVaS84lTtDkcgowXPj2OZmF0bnm6dCNUeefvf25nSPSdBsSoWhY2zbq1tERqQ1CniB7
         RIyG4eoPHq9xIoYkNrrNX4bnusMdnPBfHRcHI+4YvBX1LHk91BTPgYoqOk/ngAZuLAXw
         PtfF0PuDa2tFDU/rsrSRDoJcU62bcT0qiMFj80emNSQzWIYUsaUzsSytd5AjPH83nNJe
         Ek7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783236385; x=1783841185;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FBdctp38/9wGuY0f0rzSmIXPq8MzNuRFKf2gmiFzvrY=;
        b=KY58Fx3aL9WykcLaQRXwxFw/RobXRy2IA1zwsOnC3amm6fqRLYEMx6dtHInrvks4/Q
         TVdG6HIJvXFzwV/SVZ4oGTAOm5FSp2nOpUPAsqoYkGhXGXO2a+TJQqFmCu4Eb8FWQ8Rw
         FN0PocmqKtnRJC2xZowFFf2CBO/F+TDDXtwVQZTM9QYvSa5hm2kgjEXbc0pwopTDm4A2
         T0AfKPNfT/2I7/92b+cyXoDDFlraaULnANYnb3YNCEEBnt/h4du7St6UqnbZb7LHr1bG
         Sn/6KDQMpJ6yD5Bj8FrQ3LOk8hCdmhwrq+h28pTrapxbxRSB6jbyaCdMnfzTE4OlFh1I
         +mXw==
X-Forwarded-Encrypted: i=1; AHgh+Ro8DBrhN7MfooEAZTlWQiDIsl8Ycfdzc426yP5X7gf/PFfMpcP31rsJSgT9Tn8v9eX79b7Gw3Cho6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu+//8BmVNQerahxOoQKw5MrpaRLn5BJ5O6QwhItOjunxJZejs
	rDk8OxWAN/L99UxEVBwQC5O3d5vxHgnDIRIuGgaWafTZX62HuzQUohKf
X-Gm-Gg: AfdE7cmFt0mS12Y3Nra2g0RrFq1wX7BFJbVTvwIaj5P73+LbCkFIUR+AOAKpxSCQC1s
	Hoa3Us6pyVmE0lwWRr6K6qPU2GmI1iRqSR/ZxvMak+lp2C6zf4mqQ3gYoHl0nWDDP/gMBK600hC
	ffBb1mKbaOolgrG6IPz4lRA5rjzjIEkN904t3gtrijKB58LxUPoMPL5mo/J2qMcjsF6WmP0YdW8
	5mbuXeL5THNvohYWYTzjDFKbTrat/CwsYmq1oqgTSmUhrixq7VIWEvSdBk9IG8nbBvqgC3rxwu2
	z7D0vhJWywvH4rj4M1Q8cQLHtNSLk6hq9bZpmKGxHw/5A2EMYthAqXyiaz43hx+A1gHrHZGxmAK
	CbjmDXa7LXbrHaVP6GYt11ibEetbPZTYG2KmXvEKC386hCAkPRCOwOliC6cleFfRocdJFlGpSOj
	nW1+H7qPl8cb/37zzWFTLS
X-Received: by 2002:a17:902:f68a:b0:2cb:2b50:d9e5 with SMTP id d9443c01a7336-2cbb9f06719mr61270415ad.45.1783236385283;
        Sun, 05 Jul 2026 00:26:25 -0700 (PDT)
Received: from localhost.localdomain ([138.199.21.246])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad7765810sm31224625ad.53.2026.07.05.00.26.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jul 2026 00:26:25 -0700 (PDT)
From: Yuhong Cheng <ceohunk@gmail.com>
To: corbet@lwn.net
Cc: linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Yuhong Cheng <ceohunk@gmail.com>
Subject: [PATCH] docs: filesystems: porting: fix spelling of returned and instead
Date: Sun,  5 Jul 2026 15:26:09 +0800
Message-ID: <20260705072609.1692-1-ceohunk@gmail.com>
X-Mailer: git-send-email 2.46.0.windows.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix the spelling of 'rreturned' and 'instread' in the LOOKUP_EXCL section.

Signed-off-by: Yuhong Cheng <ceohunk@gmail.com>
---
 Documentation/filesystems/porting.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/porting.rst b/Documentation/filesystems/porting.rst
index d13f0a23c..e040b0ff4 100644
--- a/Documentation/filesystems/porting.rst
+++ b/Documentation/filesystems/porting.rst
@@ -1173,7 +1173,7 @@ these conditions don't require explicit checks:
  - if LOOKUP_CREATE is NOT given, then the dentry won't be negative,
    ERR_PTR(-ENOENT) is returned instead
  - if LOOKUP_EXCL IS given, then the dentry won't be positive,
-   ERR_PTR(-EEXIST) is rreturned instread
+   ERR_PTR(-EEXIST) is returned instead
 
 LOOKUP_EXCL now means "target must not exist".  It can be combined with
 LOOK_CREATE or LOOKUP_RENAME_TARGET.
-- 
2.46.0.windows.1

