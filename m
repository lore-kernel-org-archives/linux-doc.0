Received: from mail-yb1-f172.google.com (mail-yb1-f172.google.com [209.85.219.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F05D135407
	for <linux-doc@vger.kernel.org>; Sun, 14 Apr 2024 17:08:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713114537; cv=none; b=g0vfW+/+NvGz9b7C7pnqt+YC+oRQ8MsZIMm3e0AWKAtpMSDP6e5zIKj+UOP/GQcmXA/soSQAtaB0vmUZ9m94c7dNC2PMYH8PwOC6zysk0jPyHbxo7JlJoxGQjP+M3JgYuv37fw2kv4s5nGx9rLnXJsWW9znSiA8BCWfIzfNPPpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713114537; c=relaxed/simple;
	bh=el5cvTP8eDCmU/KMm+xr8NR8Gig6zBPOKSGU46PfnIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=P12/cf1vGutjTUDIXeRE4VYoVAOZ6puBRZVZg4SRPUdOnJKaRPIm4EfR2NH+UeDfH3YqP9f4eucl4FtXaHDULsvXQgTS4XL2PoVRV6Xcw5m7FWbVcVp2yCmMopeIB5z1dsiZn9OPgQgMJah511iGQjDuvXfHJm0aVSTRO0+sGNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BV8RjClt; arc=none smtp.client-ip=209.85.219.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BV8RjClt"
Received: by mail-yb1-f172.google.com with SMTP id 3f1490d57ef6-dcbcea9c261so2379468276.3
        for <linux-doc@vger.kernel.org>; Sun, 14 Apr 2024 10:08:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713114534; x=1713719334; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=op1/xW185UQlJ9aw6uunOwZwi5meHNWhptbMPX8ZwRs=;
        b=BV8RjCltq8FnSRH6hXjg0lXfAIKtvJ+rGlg61ZE64RwLJwyd8r3DYlgXJ67nBpl2Wj
         SE4mrhFWRVVBn7Bb8d2emJFZ+h5bkjrFqwzKDp3vL3QYLbG7Xv/1+XbfQMWfVfQwRUXx
         WAtUl9zLiu3suwfM47Mqe+DffuNByA0USZu1bmubfveI2BXcEDGks8v/hRk3JC/Eul/u
         T3gm1pUnJ1BnqR7Mk0V2G9dKUEYm7x5JRqLbTqpjZI8/SzkPRyE2Riu4OTPvPOZ2gsxT
         Vxae3QPsN/DWTAtg9jtaU4N6SmCA+ftJyCg0qoGE+mFq9UVWKf3Pq1I+W/iaxCSB7Dvd
         92Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713114534; x=1713719334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=op1/xW185UQlJ9aw6uunOwZwi5meHNWhptbMPX8ZwRs=;
        b=qiZuvPpUVtQ1am97K+lYeja3W5Hix6UJP2D9IiUSuF9KwaCbHdGzYrjxzfBfBODNUl
         FVYjOD/Npxa9QXzRIEKgYN+tp1MkfTp39zTjjqL+LgUd2M8ShXp4CshUSpcXpvScwR4M
         BIWRMXaGa9EdcTXLhehkB3atUpJDtLjfjXa117kbIwlkRySls1SP+HiOxzb5q3VWIZWn
         1u/9/HBFh9RRK7EX71tWT8SwTki8XWbweEJR9RTADhPfdzLfJx3rgt2Kz2+/YqfSksLw
         +0/DNqh9dpiu9BnHf2Gog00VXwGId81GXYegM/A3JA/Gnkzq9WF+VR4oa5umPojNyuaY
         8Qyw==
X-Forwarded-Encrypted: i=1; AJvYcCWfKbWMOe/sG2HWJiBsVHCoBPHkafiYjzNiTgpMAEtnUwDoqV135Os4rMWkt5KhUBXs+6Oaqy99bJfEtLmOkTXZG15VJJafWu+K
X-Gm-Message-State: AOJu0YyGUfWOxLKC4lhLafUFQ3i88mIDuWkiH4Bvrtog45uDJyfeuW4W
	iAizLzqNcRZoMG37DGwlAvj8XHk/NOaEHi4/Gpj8f/OWsHrXqFr9ilMUt909OSg=
X-Google-Smtp-Source: AGHT+IFFibw+0fLDTJVn2BkjdNGXJXEytO3+A3kO2zqeNjhVPCraFAF8U1V/HuyUEYXs1kJ+lRdbIQ==
X-Received: by 2002:a5b:385:0:b0:dcc:933f:ea83 with SMTP id k5-20020a5b0385000000b00dcc933fea83mr6751948ybp.30.1713114534595;
        Sun, 14 Apr 2024 10:08:54 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 4-20020a251104000000b00dc9c5991ecdsm1679082ybr.50.2024.04.14.10.08.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Apr 2024 10:08:53 -0700 (PDT)
From: Alex Elder <elder@linaro.org>
To: corbet@lwn.net
Cc: gregkh@linuxfoundation.org,
	workflows@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] Documentation: coding-style: don't encourage WARN*()
Date: Sun, 14 Apr 2024 12:08:50 -0500
Message-Id: <20240414170850.148122-1-elder@linaro.org>
X-Mailer: git-send-email 2.40.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Several times recently Greg KH has admonished that variants of WARN()
should not be used, because when the panic_on_warn kernel option is set,
their use can lead to a panic. His reasoning was that the majority of
Linux instances (including Android and cloud systems) run with this option
enabled. And therefore a condition leading to a warning will frequently
cause an undesirable panic.

The "coding-style.rst" document says not to worry about this kernel
option.  Update it to provide a more nuanced explanation.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 Documentation/process/coding-style.rst | 21 +++++++++++----------
 1 file changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/process/coding-style.rst b/Documentation/process/coding-style.rst
index 9c7cf73473943..bce43b01721cb 100644
--- a/Documentation/process/coding-style.rst
+++ b/Documentation/process/coding-style.rst
@@ -1235,17 +1235,18 @@ example. Again: WARN*() must not be used for a condition that is expected
 to trigger easily, for example, by user space actions. pr_warn_once() is a
 possible alternative, if you need to notify the user of a problem.
 
-Do not worry about panic_on_warn users
-**************************************
+The panic_on_warn kernel option
+********************************
 
-A few more words about panic_on_warn: Remember that ``panic_on_warn`` is an
-available kernel option, and that many users set this option. This is why
-there is a "Do not WARN lightly" writeup, above. However, the existence of
-panic_on_warn users is not a valid reason to avoid the judicious use
-WARN*(). That is because, whoever enables panic_on_warn has explicitly
-asked the kernel to crash if a WARN*() fires, and such users must be
-prepared to deal with the consequences of a system that is somewhat more
-likely to crash.
+Note that ``panic_on_warn`` is an available kernel option. If it is enabled,
+a WARN*() call whose condition holds leads to a kernel panic.  Many users
+(including Android and many cloud providers) set this option, and this is
+why there is a "Do not WARN lightly" writeup, above.
+
+The existence of this option is not a valid reason to avoid the judicious
+use of warnings. There are other options: ``dev_warn*()`` and ``pr_warn*()``
+issue warnings but do **not** cause the kernel to crash. Use these if you
+want to prevent such panics.
 
 Use BUILD_BUG_ON() for compile-time assertions
 **********************************************
-- 
2.40.1

