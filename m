Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F46A3BD651
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 12:45:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773060351; cv=none; b=Sbbm2KAJyMtnFA5tKJaExgWtH1SVqw+Xz37uPuV1vqRvvNCfdj6gWtCed9/vugsbWdUMUburU4VfvYO2AxmXsDsrHbpKKXsbSg0chgZN8SEyQMPkuHZQ6BwZBONN3PmfquZeHBfROwQqcTfwdbHDiDZZnjaEwikFgCSsmuLMYRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773060351; c=relaxed/simple;
	bh=tC/vnqhpyr5u7JUYEaBg+0egv5ZlzByVSdGqiOYaWxY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bjD4T1Z+klplUvi1NGhEeTeQG1TjN9FtVW8MacClP8dOfMykcDYWNdHDyDcnnSTh/lAE/xKKHHMOEHgSctURlJ1MuFm5ob5Fbz+nVKb8m7N1sd7X1SiieC081F3AFo/l6XLBSkmWTXYq5braM1xnP+ZG17T4/uOe12ye7QxHbpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mxA47OZn; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mxA47OZn"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3598581ed7bso3308339a91.2
        for <linux-doc@vger.kernel.org>; Mon, 09 Mar 2026 05:45:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773060350; x=1773665150; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=a80maZyNKc4ouURWN2d+H67wXFOguPB/alLVdRyxTyY=;
        b=mxA47OZnovcrdhYuZHUc9eAqPCKWiZU94Vuruij/dANKbefVWCGrARq3hvQzZ/CLQf
         FfUElz41O6/SFvUAordAGqd/01Str+AmA1EfyFs2o7+3aRNpvxOkNAQ/kP/p2Ye5fsw7
         vNgPEHLwoouBxagSn2mbW4a3NSVpQQsNO9ChHqhWERk/4rvw0vwmuGiFobPqHhwNiOti
         dZ6rpwzOp6Uklis9I5WcEYfs/toDF5FVNLnQ+JNp9Rs1FWGg0sHWzyh/ybemcHqGeEDz
         XgEAE6CIFxDcl2/5IVVmZ9btLM7tjkZG48qxvbNhJOsBZ8kUGPoMs3cvJxVNe7dwPml8
         QGDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773060350; x=1773665150;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=a80maZyNKc4ouURWN2d+H67wXFOguPB/alLVdRyxTyY=;
        b=ZZfg1L2ir6yFLszHTbPZXmrCuad9EETAd+EN/NlozpiM1Knwl4/L4XjlGnVHSUl2Aw
         YiMQs4MySl6H6fWhi5UM3sO1hHMOQjYM8DwROFgKD68nL+CCSpcceWx2WqI7Zsf0gq7i
         w88Q5/3XqRYjOSDLzzFNQXLT5TG0IpbZKIiS1ubJAgEk3jtSbPLuz7FnstE9KPK1IPrD
         AyspwO7W0oB6if7BH9XwLK3h6bZSodZZX/aFVuLFhGQ8jxN/2Wl1EPLrO/0P2hlNktI/
         Km9LIPyegqMo2gqAvn8V4dEBkILjHXaYUSnb3uWUB/g5P5PmOzVPQgKC6mCR8FW5H7P0
         0LRg==
X-Forwarded-Encrypted: i=1; AJvYcCUCgRpGEe5+i0uolBhttIF9ibH6MGoR2BSui4264n0d1he9Jhk1qQNEM4BQLP7r4wnin6gmMIAun1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyRgdA7ggNXOlhHGBlhZ7WH5HmU+Z/B4+UulwpD77hN8wbIfP6O
	R4kW5Ye3a3K4P9dQNvzRNxsm5vk+hO9PM9OWbBxzyZ6viBTlmWL4ann+
X-Gm-Gg: ATEYQzyQVuW5wQnk816oz58rVSJvOWHhtJG/vhoPRVH8pAVTO4PrhNL+CMT5gMcZmct
	OV6ycUcVvXojHJYxmccDkfgedr5W1YfyWWY5tvwIP8ms8gxGUEVs/MYBk0R6inJzFh59B/DX0zR
	exG1snsMDIqCdxBEzCpdwOg+AjX5MKo+BkCOkuRuiyPCJtC7bYYEUusLdotgmLGWPjCvAnDMj1T
	NGxDo18AvSUK8OCi6PSmui5Zl75lbMc/yp6VKK7Dxs08dMC3zrCSvi15f3jWLI1RFFey5JBdts7
	ibjf9Gl4A9bl4mnrLDgybRtAsutF6YmwYZOv3gvyWikT++xDz2EpUz6jcHb0P2Za1ReCOBziWTj
	xdleWg9wq4aaT2TgzrYhegOSgIEQFBx2mj8zFAqExTSFneebrpyfuxS+HnQuJjD4rbU3/eL5eLC
	V+A4jCw9YGpIYIrppyECYrBnV0fUrnlsjuTJvUjQaXYV0XqgZEpodE7lHXLxL1rknBv+ZaNbk=
X-Received: by 2002:a17:90b:51:b0:359:7b9a:2cf4 with SMTP id 98e67ed59e1d1-359be12f79amr10744481a91.0.1773060349682;
        Mon, 09 Mar 2026 05:45:49 -0700 (PDT)
Received: from ubuntu24-04.. (120-51-71-230.tokyo.ap.gmo-isp.jp. [120.51.71.230])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c739e183596sm9178830a12.27.2026.03.09.05.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 05:45:49 -0700 (PDT)
From: sawara04.o@gmail.com
To: davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: Kyoji Ogasawara <sawara04.o@gmail.com>,
	netdev@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v2 net-next 1/2] net/smc: fix indentation in smcr_buf_type section
Date: Mon,  9 Mar 2026 21:45:39 +0900
Message-ID: <20260309124541.22723-2-sawara04.o@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260309124541.22723-1-sawara04.o@gmail.com>
References: <20260309124541.22723-1-sawara04.o@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Kyoji Ogasawara <sawara04.o@gmail.com>

smcr_buf_type section used inconsistent indentation compared
with the rest of this document.

Signed-off-by: Kyoji Ogasawara <sawara04.o@gmail.com>
---
 Documentation/networking/smc-sysctl.rst | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/Documentation/networking/smc-sysctl.rst b/Documentation/networking/smc-sysctl.rst
index 904a910f198e..17b8314c0e5e 100644
--- a/Documentation/networking/smc-sysctl.rst
+++ b/Documentation/networking/smc-sysctl.rst
@@ -23,17 +23,17 @@ autocorking_size - INTEGER
 	Default: 64K
 
 smcr_buf_type - INTEGER
-        Controls which type of sndbufs and RMBs to use in later newly created
-        SMC-R link group. Only for SMC-R.
+	Controls which type of sndbufs and RMBs to use in later newly created
+	SMC-R link group. Only for SMC-R.
 
-        Default: 0 (physically contiguous sndbufs and RMBs)
+	Default: 0 (physically contiguous sndbufs and RMBs)
 
-        Possible values:
+	Possible values:
 
-        - 0 - Use physically contiguous buffers
-        - 1 - Use virtually contiguous buffers
-        - 2 - Mixed use of the two types. Try physically contiguous buffers first.
-          If not available, use virtually contiguous buffers then.
+	- 0 - Use physically contiguous buffers
+	- 1 - Use virtually contiguous buffers
+	- 2 - Mixed use of the two types. Try physically contiguous buffers first.
+	  If not available, use virtually contiguous buffers then.
 
 smcr_testlink_time - INTEGER
 	How frequently SMC-R link sends out TEST_LINK LLC messages to confirm
-- 
2.43.0

