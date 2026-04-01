Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97AE72E62C4
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 14:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052755; cv=none; b=IPa9DWW83PaJn0WlQouAtGu7ZSKxVh4/XpTuxX9CGMsQNQqDlLRtSumV91eEFvRKyQA2j9XiylTPXSonn1zfbpGsTU4Pt6mhtYLdghMNiFM8vTLctuKCg3/Y3WrUoLu4A87z1MDCU6xWeGmXy/YFMWYElqg1tsXXFTIhqA9PGOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052755; c=relaxed/simple;
	bh=rLM6R/tQkpEkVojCh34JDT1sOfc/HiMeDniz5koqcMU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CMJsa2O1uqStLRaLVN4pYi00uq3UJORh1Z8y6uakzkm4DearP6VZE6BpjmyGuaTPiD14nDy29TH8n6s7l/GXnW0aTwRUwmaMaV0w8U6RsKBbgc6FfN1tg+pxd7+fIoxQ3eMp89SH+zTTl/hpleRhkiyRQCWWfPmMisypg1XTSCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qBKDCQg8; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qBKDCQg8"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1290393066b.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 07:12:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775052753; x=1775657553; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XBtz66vxU5WfKR20C+txNJ+xxb7UOvgYkha+Jub57+8=;
        b=qBKDCQg8E5L6qR4rQhr6xROvvgS4PWG8h1x75jU2xgMbsODJUNfwHiVs3AskzRyg5C
         PmUyhouiTUGb8WeArVCZgxDxBAJAKBiVhmaIfjc0H0hCoP9L5XFrLrXa/CtE1xzoiL5Y
         0L8PuG/WDXpZR8O8i0LEjrj9Lt8o39OOAYtvE/yQ7PM29mZHQc3GW2s57oV7j2nK1Do2
         6U6qtdH499sDXkp6GX3LqI2RMAPaxqg4XXJg3FrbSvA5TYhfenSuQG1uCJPE+emuuWBa
         zLhmYcKVrk/eJyV2S4PfoldD5vGdFgQ3hAJz1J+Irs8DylBF2EsgZQHhDDCujT8zes3J
         41TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052753; x=1775657553;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XBtz66vxU5WfKR20C+txNJ+xxb7UOvgYkha+Jub57+8=;
        b=ZHD+IUbbiPUPp+JTILJig0bWBk/VwqXs8zlLUGiRbkzSRyP5qR1r2aobHfz23H0ejW
         7QRUllu1jLii0wysDhNbs9hDK0ZrfUMkZXAotl/eOY7+xLOqZFlowfz9KVE9uV/0gGtT
         Xh9sUGGzY57cDlAeYnLVCXWiSGkINGRe605t2BTt9AdBwdpebg738K85zUBpOOtyYuaD
         HUjyymftZfcKc+CmwnzbTayhpPtA5CRz5QNdv1oxOKKPU9ZpM/qZMLMXXfdPL+J/KIIe
         Q9HvOQVYTVcv5Zw8b0eqYoDVXrKSKRLIA+mWupKhr5kYzKwd4T65xQwZxnHKtAIfynfZ
         grgA==
X-Gm-Message-State: AOJu0YyZZkQPTqlLzyUy9hg25RRA3PqrlOVPejp4S8VDZalvzSaCtXmf
	/w6KFv0XQeLIL2951ydSb/ye8/9KmsaQAMnLye8dGPB3eGjYegzuR6H0ucHMGD+4W8kndyq0
X-Gm-Gg: ATEYQzyzvUUQgT3wICGpGh8DhmNG0EXCfTr/MmgCqSc4nSs3RYA5J/TkTf3adVNlnk5
	QwjGYrv3THSiaDpN+H2R0oeC5iiUH6vVUTD3bZ8zrsp47pSoiriY+gcwzCjfn+hL0ayvhRLryL+
	BHMNqoiQysPU1QyG3CRpyQRed+GIX3XC3LNOmu5mavRSD3hB1EugzP8V5SG6oThv1DAKGz58GWM
	HEMtHyvV791D9Q5q7utnuVIRRUlmPhpF9uyzzfvkOkRUhR47PCEYITvp3H9EtY0yGQSOSyXI71R
	axhStpiwmFyN5vYFmfVyAGeLMP3aMSNDpuxVyFJK1natTBLBdmZN5SXbVfb4HRx9iQ6uMEmQRwP
	vVCDVhwwsEUVuM4SZDY4hDMyIuEmzuqD8j05sFtUCQ3OfFi3lctpNkMQ7XNezB3ltgDbwG+1AP5
	dqRB7x
X-Received: by 2002:a17:906:4551:b0:b96:e11e:97c4 with SMTP id a640c23a62f3a-b9c1390a25cmr197067766b.20.1775052752613;
        Wed, 01 Apr 2026 07:12:32 -0700 (PDT)
Received: from computer3.. ([2a00:7c80:0:3b3::14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm518060766b.18.2026.04.01.07.12.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:12:32 -0700 (PDT)
From: George Jones <gjones.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: George Jones <gjones.dev@gmail.com>
Subject: [PATCH] doc: clarify sisfb notes and fix minor wording issues
Date: Wed,  1 Apr 2026 15:12:07 +0100
Message-ID: <20260401141212.23955-1-gjones.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Jones <gjones.dev@gmail.com>
---
 Documentation/fb/sisfb.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/fb/sisfb.rst b/Documentation/fb/sisfb.rst
index 9982f5ee0560..273dfba6f4dc 100644
--- a/Documentation/fb/sisfb.rst
+++ b/Documentation/fb/sisfb.rst
@@ -49,7 +49,7 @@ Example for sisfb as a module: Start sisfb by typing::
 
      modprobe sisfb mode=1024x768x16 rate=75 mem=12288
 
-A common mistake is that folks use a wrong parameter format when using the
+A common mistake is that people use a wrong parameter format when using the
 driver compiled into the kernel. Please note: If compiled into the kernel,
 the parameter format is video=sisfb:mode:none or video=sisfb:mode:1024x768x16
 (or whatever mode you want to use, alternatively using any other format
-- 
2.43.0

