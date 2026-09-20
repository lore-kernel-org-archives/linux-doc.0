Received: from mail-oo2-f43.google.com (mail-oo2-f43.google.com [74.125.231.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F8143CB56F
	for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 07:31:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.231.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789889512; cv=none; b=rdY5Nm/hMkn1nytsXA833j3RHPfKhqGUIdw7Uco5gIjJWptVn2t4So4P9M+N5QpJ4Z+Me65sRsIBiP3/wnvCeGROdsf7156PUCaVwYeukP6Fnd2aFlghU3XvhB/+zMzpwYxVskQbT4LaHhlP843zjWiye5+afd2clQE3ApNgHXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789889512; c=relaxed/simple;
	bh=jfISFHccu2UqRsiLdsx03nCmH78bx7oi1EBN6gkgJ0E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=BgevCyypa1oN55UZ+0d5AIqQTwbL3VT1XHHvUbnKzZp7peOrX8aeZFkcnBxIB5NZc6vbXRRYDlD7POA9M/EHEqZJL1VTT4xlHFh4U0MRqwZzyv1JgGvlJB6+cKgHzFZD97eFquMaQ5iB9+XtWyEzGkvnxpYowpnHvEytdEcgp7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com; spf=pass smtp.mailfrom=evalinux.com; dkim=pass (2048-bit key) header.d=evalinux.com header.i=@evalinux.com header.b=JUNS+4zw; arc=none smtp.client-ip=74.125.231.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=evalinux.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=evalinux.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=evalinux.com header.i=@evalinux.com header.b="JUNS+4zw"
Received: by mail-oo2-f43.google.com with SMTP id 006d021491bc7-6b1ae6f5fc7so949421eaf.3
        for <linux-doc@vger.kernel.org>; Sun, 20 Sep 2026 00:31:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=evalinux.com; s=google; t=1789889510; x=1790494310; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bEa97+NVpDACV0kWi4lR/v50EIFrpNArQgZwPyPPEf0=;
        b=JUNS+4zw99jHMC2A6QD+OpsyIkCfq68OBh3Z7Xr9VevQ2h75+9kiQwDroR0CXLoPro
         BL8QwY868jsxGUlxtaJ7hJmQnP2viqMeIxPeiwmvBxfP60+0+F0UovkqHZxa/TLz/u9n
         tpf6VXTZ6ABCm6dC+dAuKmrY00dCqbRCvjbjYdkTSHyicLo+DTG0j7Q5dmRklmgk3qq0
         Hd8T7C5nGAnwp88bFY1lqLFN7FU9VLkJ4DxRhiK4cBFqRzJNzxfZkIz984N8Yhc0krun
         ZYDCL2MO0r/r42zKfL7dY93Yy5i63uYJZP7LFet5WSJ2tlLHidxcEoP59nDuEr9BcXgm
         ef7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789889510; x=1790494310;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bEa97+NVpDACV0kWi4lR/v50EIFrpNArQgZwPyPPEf0=;
        b=okGP67X8GU2bhFuR7Eq3dD8xdp69veNiwzZdOqU0ThsjA8PWruHxTVljCgogCe96uT
         itakHhr7vwvn94h6AXavzmCY7CbQNzqFIBKgEwN/fbhaPnMbwPxntYC0cLzH6RgwEDoE
         eXUF0ZAQXyq3UpTmOlecOu4LMs+MHcVsPA6iWCNXRjQKMitGe00szDEXpxAUBwWAjbkh
         wxIBUL9ESo8YWbsdfSnJqSfAPJy7eC8Wgv6YnjFpKmAPOI8An2Fa4OHWTAyAdljL+6qQ
         N2JJERsqA7IVRJ4uPtKtEO6+fzCxrwpB3Ov1aH+ptPjuSafC8Rk982NuO/qglAUDmeJN
         Hp2g==
X-Forwarded-Encrypted: i=1; AKwUvByReaZwwkGjKAsGL6c67guvc9eg1Y3WFiwc7paB2+2ETngL9sSC9cw0kK0elBQQzyVC1pAhvP8h+bA=@vger.kernel.org
X-Gm-Message-State: AFuF++lvZ3d42HmMoK4+aNFUVV2mKXSpUsiMx9U6+9ekU6GPjkb97Eei
	EqGLULLba5UzLdySUXDac922X4wGDqVEUCnnK2X6KGVg9f0ZCfL5LlmaghtDcpqCKDY=
X-Gm-Gg: AYBFou3pblWtUmdR0TeOFsYnqE8grIiwldB0HUPnHSrULtfLUoYZl7ILAL/BXHLnBxz
	BS7pCVL8pONPum5+ZfX/n+DbuDaHANwFKZw/UCCm0IBQxLN2XJpd12lPYWaqs96xkbajqKCMZIR
	OiUdWGpDHqPDnHIqWN5+p8NF6BpoBCHTRWHQ3Rzcofd/4IkdppU3DCUN6lTBabvD5oAKrp+bzLg
	XnoWZt/hRzHhCwW+akhLBDDrY5X225xP1nmHvPIY2e/7QSmXq6tKhdcwNaqPhhLNN8UQTLN73ZX
	aN0tLhNek7Mbxcbe/gzHaalMmxmz2BXcwcMRP2rr4Sv7nLD5dQX4zGIIxudPA8hNa6zUY4UhKAQ
	LCcZJClvZCKc6QPbRf6JFI+gjp9/ViLiKaGCrktq5Rlo3FWZp5/6vHYbjP9HppG2OGpeaee3im+
	3kiOcvkf1GqMfywYQCvqLDcgmMP/Lhwe1i5KNP75wCrwpmMzRNj+4dY0839cXF/8g8WVpVhp4an
	sapQgDY0QhMFIv5caWIYUDnGvnccA==
X-Received: by 2002:a05:6820:4c08:b0:6bd:e592:2c64 with SMTP id 006d021491bc7-6ca9a847c43mr6021838eaf.23.1789889509901;
        Sun, 20 Sep 2026 00:31:49 -0700 (PDT)
Received: from desktop.lan ([2001:470:1f0f:2e4:14ce:9fa2:a97a:cd20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-6cd35f15a1asm5083680eaf.14.2026.09.20.00.31.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Sep 2026 00:31:48 -0700 (PDT)
From: =?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
To: Alex Shi <alexs@kernel.org>,
	Yanteng Si <si.yanteng@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Dongliang Mu <dzm91@hust.edu.cn>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?R=C3=A9nich=20Bon=20=C4=86iri=C4=87?= <renich@evalinux.com>
Subject: [PATCH] docs/zh_CN: fix stale :Original: reference in xfrm_proc.rst
Date: Sun, 20 Sep 2026 01:31:44 -0600
Message-ID: <20260920073144.546566-1-renich@evalinux.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Commit 03e23b18c720 ("net: Move XFRM documentation into its own
subdirectory") relocated Documentation/networking/xfrm_proc.rst to
Documentation/networking/xfrm/xfrm_proc.rst.

The Simplified Chinese translation was not updated accordingly,
leaving its :Original: tag pointing to a nonexistent file and causing
tools/docs/documentation-file-ref-check to report an invalid reference.

Update the :Original: path to point to the new location.

Fixes: 03e23b18c720 ("net: Move XFRM documentation into its own subdirectory")
Signed-off-by: Rénich Bon Ćirić <renich@evalinux.com>
---
 Documentation/translations/zh_CN/networking/xfrm_proc.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/translations/zh_CN/networking/xfrm_proc.rst b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
index a2ae86c44707..6990f8e2fdb4 100644
--- a/Documentation/translations/zh_CN/networking/xfrm_proc.rst
+++ b/Documentation/translations/zh_CN/networking/xfrm_proc.rst
@@ -2,7 +2,7 @@
 
 .. include:: ../disclaimer-zh_CN.rst
 
-:Original: Documentation/networking/xfrm_proc.rst
+:Original: Documentation/networking/xfrm/xfrm_proc.rst
 
 :翻译:
 
-- 
2.55.0

