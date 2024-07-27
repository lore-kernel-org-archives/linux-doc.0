Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C39B117997
	for <linux-doc@vger.kernel.org>; Sat, 27 Jul 2024 04:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722054854; cv=none; b=LBdOmGVQhf41BrJkQfCn2t/gPdIhq52cb1NZC1+lQbBHPsX2++lLom4tQuHhbW5H/5czULzvaYdoZFtzlka+zFnTGAb4U/K5KRUif/8S7nr/nENvlUIn4EBsRGkk19tu8DzitAFPo6mlqDvi2aj6AzqfL+zx2+IUqYt9xcKZkdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722054854; c=relaxed/simple;
	bh=SATEbQ7zbN+owssdLCL84MbZRt/64rdIvkxlhHBqI/Y=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=D0bJbXe/JzO/+2GfQkwz/DwJ4zAsmDqMtnpT3olhf+NlXs+XzI5bDhDZh0oU2ylgOHb8cgAqc3ePsY+mMYPH4gtQUee4FZ6NVQ4L+ro9IqvhrMyjDKcEgE3vnI97TxM41CzYahhWfSCkGGq04IPWD0s2z/Pg5MArfLo7gTOo4uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R+kgtnP0; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R+kgtnP0"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-1fc4fccdd78so10136205ad.2
        for <linux-doc@vger.kernel.org>; Fri, 26 Jul 2024 21:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722054852; x=1722659652; darn=vger.kernel.org;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8C36rWzZ5CEFyfLmLBvUIfIdLBTOkwvSaRR1h8GCuTw=;
        b=R+kgtnP04e9Qn/qKclEua3/rPpQXAC4zH1r7CudaGwW7tVlf5UNF/YWoYsS4JkoVjf
         8SVXJlj0m7g4dPsO1q6CTf7elo7IL5WUz/R48ylBIbS4n+1ojrM/ojqphp00Rc4eAwJN
         Klq1kQA6eEZsnBaR65ONHuidQNAjhiQEI5iFnVsv6C9Bmh57UY7xqF8Hhz+QxAbdcDCy
         NrKPavXcgAkQ5eEbuyu7jkr5EWuuY9YPqR/ZwPDyT/BEacLNUev3KxOwZ5C5ZqwiU4Q1
         DCr3ALHMCgYTdgbCcaw22BISkRkDusY820+42Ed+Stu/3ttupT58kfKT09h+iEsYaiDG
         aI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722054852; x=1722659652;
        h=content-transfer-encoding:commitdate:commit:authordate:author
         :mime-version:message-id:date:subject:cc:to:from:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8C36rWzZ5CEFyfLmLBvUIfIdLBTOkwvSaRR1h8GCuTw=;
        b=ryXm8A1xQ5f26J5Q9k5xr3vS5VmhpQ4tB3MGT+ingGsiR/Vyne0ShyT6GkAuzht6a6
         rIMNxXBK8MhkQfiEmZd2TF7tuqhn8EaEnTJAZpmo7mRUoQyITLPpbRl6oMseaZE3f7m7
         Els8eVHvDvtOGCCDLm57G3OHhTMH356Ic9GHZ4I+q0GbA7yGDcdqmF4p09p5qsWyfDgb
         bYdGlP/x42J9Yi7fApBTaLEmek0u4ic0bsoFqeX1LnZvlQU3BVoVK4Q5B/W9+kEvV2ih
         V8BHeODuINqx7SQC3V6UngAbN0sR7pJar/j2Eu0LsqA40V2n5wgB1JOEfRYU0dBj9t1X
         5IWw==
X-Gm-Message-State: AOJu0Yzu1LS1jc0a/Hti7EvmRli4Jak8GsluLwHdx5kxU3jfjnXHGeR6
	Bl3of0Y2I9LT2u7wY+XQsJ6T/x7Nju5yZXj823LdeLKmqZtiRyGw/YOUTAl3PIA=
X-Google-Smtp-Source: AGHT+IHZliN66Mjdy/pPmJDl6iBYogsAzKgh2eDWlcCzfyvTOmaGlkru1RZ2BhX6odh/AcNrPcjoJg==
X-Received: by 2002:a17:902:fc4c:b0:1ff:5b5:d546 with SMTP id d9443c01a7336-1ff05b5d9d5mr12968085ad.65.1722054851702;
        Fri, 26 Jul 2024 21:34:11 -0700 (PDT)
Received: from BiscuitBobby.am.students.amrita.edu ([175.184.253.10])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f78491sm41544485ad.244.2024.07.26.21.34.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jul 2024 21:34:11 -0700 (PDT)
From: Siddharth Menon <simeddon@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	Siddharth Menon <simeddon@gmail.com>
Subject: [PATCH] Docs: Update LSM/apparmor.rst
Date: Sat, 27 Jul 2024 10:03:17 +0530
Message-Id: <20240727043315.36554-1-simeddon@gmail.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Author:     Siddharth Menon <simeddon@gmail.com>
AuthorDate: Fri Jul 26 23:43:49 2024 +0530
Commit:     Siddharth Menon <simeddon@gmail.com>
CommitDate: Sat Jul 27 09:48:30 2024 +0530
Content-Transfer-Encoding: 8bit

    Docs: Update LSM/apparmor.rst
    
    Update AppArmor documentation after deprication of CONFIG_DEFAULT_SECURITY to enable and configuring AppArmor.
    
    Signed-off-by: Siddharth Menon <simeddon@gmail.com>

Signed-off-by: Siddharth Menon <simeddon@gmail.com>
---
 Documentation/admin-guide/LSM/apparmor.rst | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/LSM/apparmor.rst b/Documentation/admin-guide/LSM/apparmor.rst
index 6cf81bbd7ce8..f324d750468a 100644
--- a/Documentation/admin-guide/LSM/apparmor.rst
+++ b/Documentation/admin-guide/LSM/apparmor.rst
@@ -18,8 +18,10 @@ set ``CONFIG_SECURITY_APPARMOR=y``
 
 If AppArmor should be selected as the default security module then set::
 
-   CONFIG_DEFAULT_SECURITY="apparmor"
-   CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE=1
+   CONFIG_DEFAULT_SECURITY_APPARMOR=y
+
+Since kernel 5.0, `CONFIG_SECURITY_APPARMOR_BOOTPARAM_VALUE` is no longer used. 
+Instead, the `CONFIG_LSM` parameter manages the order and selection of LSMs.
 
 Build the kernel
 
-- 
2.39.2

