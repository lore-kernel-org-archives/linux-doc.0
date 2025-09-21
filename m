Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23F6913AA2F
	for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 07:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758439566; cv=none; b=aVHjguEadVhrn/cR7stfuN1R/+bu4gYob+Pz6EkZeP9yfnSD4PV3Khjshl2cYR0clVLN92DYqQkzAwajPI/5a7IAPIqIgKR4j40FQtJhrSCVsqaN7XOhA0qZJQNfRnHMPKSj0sNYMe3/2grbfCxprzHvU8/97nopi2ax5n33lcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758439566; c=relaxed/simple;
	bh=1Xr3JrWFHoKtG/qOsyJchC0HBoSRsVqX4jRi/R6ITAc=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=c35LtMBILvGPcHLRjO24s9nrbtvEruma8qXj47NE74AeAjZLEZzY8Hp1/UZHLJOTy68P0mTbvWuFSPyIbytcD0ADt/MFGOqb8vSjx7RRTcVyQ2hBAMicLASTMZQGzAn0yGmLDvA9Ahx+jVAlPMsZu0qckdpBtzm8tIFJmmGv1T4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lx68B+KZ; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lx68B+KZ"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32eb76b9039so3856981a91.1
        for <linux-doc@vger.kernel.org>; Sun, 21 Sep 2025 00:26:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758439564; x=1759044364; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DzPJJ4C+1gdSVSV5lr2OGKZl84sAhTLo5fDPxBHfyQ4=;
        b=Lx68B+KZt34OgwcxcwDgK+K4QLHQx88AET0ydzyZ3XWdpcKDWbYbpXTdLZJ9dvnYxK
         hvEoimLcoZdfBfxc7MzWhEE7BmyIVaP+ZohYM4R3wf7qashB3i+HgyzDh2nq4pCmSb7w
         Mupgqgb1vZDkY1y2F+FOsgZI8h/2PH98H14/KHWEcV02C0wDNc8bc9uQ2ofC8ZKL22K4
         MaB2Mk6t9VWYA2fEQEMKx08ekuiDlNPduXGYKGpOMVZ1dfcpFWTx2Nroklwz7+L5w/u4
         OzDLycvy2OEaRHYwf1k2hrt6iIfH0b8/agOXwP/OnekuE7CjVtQLNQejmwxUP5wCU+nm
         3mBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758439564; x=1759044364;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=DzPJJ4C+1gdSVSV5lr2OGKZl84sAhTLo5fDPxBHfyQ4=;
        b=XBq2jH80+42H3pEqiDN3uBxgeqEjNP5FO7Sxg7ddayhTOgHBQR2G/wwzYKoOKekNyX
         hhhNcRqY4De0/QWcldvhqy9+HY7svvoYuxSnRVJ27ukgPwFJ3aYsUPZa9fVfQ0+9jLfw
         3CKVC03m7+a4iAG212hA13k6GE4BvhGgwMes5hWYISryAqlGiW7wUImxXgZb6S+oM1qh
         s9fqkcJLuNtom4SkD8VbCV9Uc+mfYsL4jTRRQTPLcEAgSqyU/TgEuXXIUxwzCSCfhTaU
         HSm5mnezzo5s5ZzVMK1C8w9gqxK0YtsKCvFvaNhEhA8+y1xPPOgNZ9RYxyPFT7Jpww05
         OEHg==
X-Forwarded-Encrypted: i=1; AJvYcCVePzaYfHakfzMlz1ssB7rirXVITBZUWvaoWxDG9YaAyNFCA7pSdG6lfZiQDtS8ImZ93pcP1xG4uBY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMGfrg43YArii8I0clVHsG1m5pSReLKVMnG+1x393vqwGOi69a
	KQYawH1Zujhd+99AZxvQn/16HYVoGKUvUqZSLOlpmv3P8fh3nh+N2xSd
X-Gm-Gg: ASbGnctImiE2sFhfc0SXvUj41q63+8DPofoJKTbO/lGWSVJ4PygJpyvS1G5BlrfX6XJ
	KLdLUpUK/wUmJcXPX+iJnUH94ZADLSf9O9Sc0HUARvmKihGNgyYUztyPY/OZVNVpD2Z+ElQzeSm
	J4YNY0YbZRQs7gLKC+z2LCJ/ERCSNHiwL3V5JssdmemJkOF4ogFCiUYa9YMZz5Apk8xPPJN5G4a
	C0MZ/+BEuHGVpo7k6vg9/YFgXoNitrMghHgbXR2rBtgYhIRoAAmrSaLZpfYTdwwTc0xAxNV/pcU
	9ozXtDQFEiHL3MSKOTH51VSQkWUjoJaRF145IcLv6RYgofKgy955iNiLhhR1tTXwwUyigLI0TZD
	lGb9cNClXU3f2fvgD7GNYuGEXCNmA9SNUENnzuodTanN3Lmxw81n+QsN93IK6n0oVaVdI+oAFh/
	FmXxo=
X-Google-Smtp-Source: AGHT+IGVxT7YUVc9MtD/F23iM2RAG0MM5u+85RCOVRYncSMGma9y2NUwgDaSJpqNO0S3iAg/Af0DOQ==
X-Received: by 2002:a17:90a:d605:b0:32b:6eed:d203 with SMTP id 98e67ed59e1d1-33098245aa1mr12015185a91.24.1758439564368;
        Sun, 21 Sep 2025 00:26:04 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330607b22bbsm9677242a91.15.2025.09.21.00.26.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 21 Sep 2025 00:26:03 -0700 (PDT)
Message-ID: <c3b9de17-7cd8-4968-9872-cbe2607a7143@gmail.com>
Date: Sun, 21 Sep 2025 16:26:04 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc: "Paul E. McKenney" <paulmck@kernel.org>, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: dev-tools/lkmm: Fix typo of missing file extension
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Commit 1e9ddbb2cd34 ("docs: Pull LKMM documentation into dev-tools book")
failed to add a file extension in lkmm/docs/herd-representation.rst for
referencing its plane-text counterpart.

Fix it.

Fixes: 1e9ddbb2cd34 ("docs: Pull LKMM documentation into dev-tools book")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202509192138.fx3H6NzG-lkp@intel.com/
Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/dev-tools/lkmm/docs/herd-representation.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/lkmm/docs/herd-representation.rst b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
index ebf4a2181cd7..f7b41f286eb9 100644
--- a/Documentation/dev-tools/lkmm/docs/herd-representation.rst
+++ b/Documentation/dev-tools/lkmm/docs/herd-representation.rst
@@ -3,7 +3,7 @@
 herd-representation
 -------------------
 
-Literal include of ``tools/memory-model/Documentation/herd-representation``.
+Literal include of ``tools/memory-model/Documentation/herd-representation.txt``.
 
 ------------------------------------------------------------------
 

base-commit: b8874ea3d0fdb2c48b2261bb3b46c84908fa67bb
-- 
2.43.0

