Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C6E3DFC6F
	for <linux-doc@vger.kernel.org>; Wed,  1 Apr 2026 14:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052758; cv=none; b=TgvnRjzTrSdQ9RogWoYyhNFceDT4ANkmijHnfr/YNwTJGfHMjuEZYUl1lVOmMtU0XRXrmMVyfFq2+onxxZmvNaBdbwztMo9+zZK7b/58DVKSxuxpK2KxdyaowzHNiqC16T3lTQZnl3mTiYT4F/xshbQcWhm2/XgNQPIr1EY45B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052758; c=relaxed/simple;
	bh=ZbMncU2dWxaG0ss0YloVeIGXQYJSUZ83yukYKS3tm98=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=X4s4OqVw4cUqD6vR8WAD3Dh02ZuCER4d74Xjkx52k8U6UlJHbrIjlHrbOA18g/aBhzuQr0bSsb7H04rvvM2RI6hB2+3edXR6jdHTQpfqHxBv0zquPlBj+JS2h2mvv4BCZVv5wR7gl22n4gSayj4dQiG2kuRr/RtjrHeVcgW8Mb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QiDFQQm/; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QiDFQQm/"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-66a851e62c6so7150609a12.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 07:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775052756; x=1775657556; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zl4d4Wy8TJAnqXT8dFGZzN5/bbhLJGzQNzfkXW+MbAA=;
        b=QiDFQQm/SMahazWD2yIQbCVYQzItdfEAOdiB/HngcXK1nbL3SxsDnCpvTIShgZgksj
         8nFHDXIXLRvTsRy/loyswtM0hUk9pY5IrugJGExxf6e5pJBBQcveRRuhCmejQszOIwR2
         b5I99lmfoB9wMjPKc1y46SYadTj02loLkBcHGPLS27UX66Z8o9AB4rburKNQUPc5u/RA
         Yz040/8MGiEEZS9WjSggMPXiXJH38vz7OCDplFLUiRU1QNQsxYupOzITu06m5euuITk5
         otpOyP+cRvpRXndOEhxZEN4r50Gm/fwFhIPaZR5QKCobJI4weLbtMPexgCZU/u4YEp2k
         gxJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775052756; x=1775657556;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zl4d4Wy8TJAnqXT8dFGZzN5/bbhLJGzQNzfkXW+MbAA=;
        b=PbGnpIoZkSlyosW0DNqSMbmu3RgqgKNDQyG6HKOkL4R0Hl1LMGAMtQ/0ivQKeA6Tt6
         o/7I+aznkmzFrPEXyPkqshlFKrTQIhn4SXtcYRfgTTLO26PPKWoO5b5+tmo6y6hiaykQ
         sWGDgnhCf8Z5K2ysV9r6P9nt6P/lz4gibz7U/DvBvfkpJ/sa/mcQq1SFDQ+Kc+xZ1o3a
         FggJ3QKTJH3tvHlaQAXZyLAv7gvLyfCpYYsvl9giH9DW3j1KNu1YY/ZjXGHWRWljaG8G
         0Rt+dmVOFxxUMpx6cs7dLXZ7CWVKOEgLSqyyEI2CBRvRc5/jc3WS1hRjBa2Fqi0oCcAJ
         ltAA==
X-Gm-Message-State: AOJu0YymhSdboELDEkK3bWOhE/LEN4W3vkDyZxY18SSG3AMeM2SXEzyv
	x2m9W3/xjo5QXHMHa7TA7ZbfmKfOOjwC94jgLBl7ztfBHDDq+1mjjuxfiEzOVI12hWHa/P0f
X-Gm-Gg: ATEYQzwqJP/6PWKCOR2niAA8fW0/WlvG68jI4rrGo070EpHJdIAj5FSircT5wipCImW
	2PlPTcj7i1FVjaEhGniXVkvV1Vj71JBK1W4r+lGPY7gEWfoS9mfbXMemkT8gPTsOQR8fSVDkZnJ
	YZbQAfLNvfijkwdnQTmMqURnzjOUqdp78uo0bMm1BnUf3FP8Hfos0j+JTSS6AndCxVxMUds2YAa
	O0NlX8Yuihv7BXn47xlmdcmzPfUKhPT/x0UIeOpWBleFCsdRz5xy77G6lglWELxQdfZYRAP/CcL
	ieDiiVpiBUhr5OSymFh3Kxmi+Je6sQVZApFoWpUtPb27KT+QA3U7qCoDmz2sAqSYvkE4JQ6IAN7
	H/pBZ2PHXPjwSteu+8fbyKAbO0MDMMDeYkti//SHRJ5VwaB0e0OPvi5e26T+eG9sUNHSESkXw5i
	zZbiob
X-Received: by 2002:a17:906:9b4e:b0:b97:f2b3:49b8 with SMTP id a640c23a62f3a-b9c13c95949mr206583266b.47.1775052755276;
        Wed, 01 Apr 2026 07:12:35 -0700 (PDT)
Received: from computer3.. ([2a00:7c80:0:3b3::14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9b7ae51ef5sm518060766b.18.2026.04.01.07.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 07:12:34 -0700 (PDT)
From: George Jones <gjones.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: George Jones <gjones.dev@gmail.com>
Subject: [PATCH] doc: clarify wording for FlashPoint system ordering
Date: Wed,  1 Apr 2026 15:12:08 +0100
Message-ID: <20260401141212.23955-2-gjones.dev@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260401141212.23955-1-gjones.dev@gmail.com>
References: <20260401141212.23955-1-gjones.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: George Jones <gjones.dev@gmail.com>
---
 Documentation/scsi/FlashPoint.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/scsi/FlashPoint.rst b/Documentation/scsi/FlashPoint.rst
index ef3c07e94ad6..292143a45e58 100644
--- a/Documentation/scsi/FlashPoint.rst
+++ b/Documentation/scsi/FlashPoint.rst
@@ -97,7 +97,7 @@ Contact:
 
   After this problem was identified, BusLogic contacted its major OEM
   customers to make sure the BT-946C/956C MultiMaster cards would still be
-  made available, and that Linux users who mistakenly ordered systems with
+  made available, and that Linux users who accidently ordered systems with
   the FlashPoint would be able to upgrade to the BT-946C.  While this helped
   many purchasers of new systems, it was only a partial solution to the
   overall problem of FlashPoint support for Linux users.  It did nothing to
-- 
2.43.0

