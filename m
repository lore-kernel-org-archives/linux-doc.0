Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78B7922F01
	for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 08:26:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755505599; cv=none; b=Mn4/GYGwSUsCKA8DddzbBdMgEcMpEswyvsDJBMATaqhL70bh+E5x1ETY6gPJlTA4YfLt5VMuDeeEohsm28m4IKonm5rxXQ7t+YViguqvvXU4DCh0K7YVBxQDmcnsv0VZzB67HFLBco21h5GtvfEbcv1gXcTCrpACbCx08GSSh9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755505599; c=relaxed/simple;
	bh=q9XmPtxYoNCiv3K0EgnE3nHKnKasSXwGEQhC1RJGYec=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=aSkYsqvOxWDYcEhKAsypcIMti0RwdVOh/R/3sWmheXFEDx+1eAp5ouDD3rWzZvD+iZOSqwSYKUnlcfvwPL68OFkNqXAcb6ChvCaSSGjOA1fHs2/W7C98NeLBuQkF2hdUaDg8qdT8RavhJa5icdDyJKV9wFMByrNI0dAJtBBPkyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GeYQTqdG; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GeYQTqdG"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-afcb7322da8so661308066b.0
        for <linux-doc@vger.kernel.org>; Mon, 18 Aug 2025 01:26:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755505595; x=1756110395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R63hEpdlyxLtZoIyRwRrYtyjfFsvSRKLt6/waz/xGi4=;
        b=GeYQTqdGt8mjM2qQLtjcAObLeqyD1Q2pJaEFcIikH5W7bBGPUycTqvQcXrWkbwJl75
         RESPwv0F8MR1uE+9kA18vExqeXH+R/C8iql9yyIIAHHAXRZVa/LFFGwEyIkNqwF7ZqUI
         7bI0LZANp2BajZ8TFCprmshfPpQKqoXfAPkoyQgCTOO7PzwwMcAva7MvMnfQUfSAR/dv
         sndXohqsR6IY2NfX1FQTGN/sS6gkxBdaFDvjyOQsx1EXUxpJIQ/klN0wiJG/hQMGyHmz
         CXufj03pn6YbuVkEH6tWs7OBexpclhxpaVXAw3aDTZIEY+cRwp5U11wOb+Ibk4GIYlkC
         E1pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755505595; x=1756110395;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R63hEpdlyxLtZoIyRwRrYtyjfFsvSRKLt6/waz/xGi4=;
        b=Qtxv0AwbdtWLqUCIR+uXsw517XtFrUMofCdf6ie6cZbLFN2cUjhteTk4xnng+u4VVr
         Kipa9wNxKmhx/Ewj3QyClKrFPY6NdtfwJfgmH64796jP1S88pJb4bt0X3cqiIv/yb6fG
         nBci0ju+a9qM8N/oUsYBpaHLAMsYMy5jRf6phRyxX8ceBWm32QOyydqlA6FneyfYlyIO
         dM5L/kAlXWGGeqsZRKLINkfRaQvC9lzOqbuewXxa9SidfICFxONVdV2qBEmfbjlphh+p
         exnR7KeqPKLjdlE/kPsyqIj6mFH+4AKrepRu7py76wPYSL6BAed2Orl8ppDXVVx0XSwd
         c1vw==
X-Forwarded-Encrypted: i=1; AJvYcCV5r9tIhTNN2unhq1+Tob5m8tjATFyO17Uw40l/mnmeOTHlZY/yWSsu4sKowpxN4mdzuHVqsse2k/g=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQgQNHNMNPqUat/irgg8ckHQL14GPAKr6i/9V99wMzVI7PDBX3
	uaO/aUm55q3XQJ2gG56IMlhSb0WXbqVWI8CocnC3FubW4yOU8b6iYbwsjwdegyoSJfQ=
X-Gm-Gg: ASbGncs3ifSEg6EXpHDJqrx4adQhvM3YlLhARaiM6eRyLpscEfnIk2fymmSnAneAtmZ
	HdQAxDdBNHVy4kMzvNWCver7+pWJawu1plPD8ejy+jJiqzW2s5EfUo+l85pMQCWTACGe3x3Odbp
	WLt9R/0kRB3PX7fE1Jm51cmtROESTvs1a1paSNK06tGXLpmaQI1XshuQx2wlumAtbMwNvY8jsvu
	TF66MtbTS0FEJK+82D8fZvUDwDJhp4m7pdLlnZ/4AH8mcE6wFNdlltm3pUwtlgCqj4ep8sEp8jT
	C5i2H2o1+oMsnZGO/k3Fi9sGoXWd/M1fZtO4LEzs8Berd75rKn9aeIUxTP1JdZ8ROYXO4Q6IN2X
	/DrTl9Y1sZCLHgoDib2HOvQlFH2kIud0rqtABYDeiz3cg
X-Google-Smtp-Source: AGHT+IGStfQvfwvOB/b0pz73T+eWq282Wn28ouUOdCrNbFJNktNYTA0i2GXaeD25QK4tcfNsq2+/5w==
X-Received: by 2002:a17:907:1b05:b0:af9:71c2:9f7 with SMTP id a640c23a62f3a-afcdc251330mr983455866b.2.1755505594520;
        Mon, 18 Aug 2025 01:26:34 -0700 (PDT)
Received: from linuxlab.zamel.local ([178.216.139.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-afcdce53d6csm746010466b.6.2025.08.18.01.26.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 01:26:34 -0700 (PDT)
From: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
To: corbet@lwn.net
Cc: skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	rdunlap@infradead.org,
	Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
Subject: [PATCH] kernel-parameters.rst: fix document warnings v2
Date: Mon, 18 Aug 2025 10:26:30 +0200
Message-Id: <20250818082630.40097-1-kubik.bartlomiej@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


Fixed missing definite article "states that the parameter" as suggested.


Signed-off-by: Bartlomiej Kubik <kubik.bartlomiej@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index 445248787e77..7bf8cc7df6b5 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -215,7 +215,7 @@ need or coordination with <Documentation/arch/x86/boot.rst>.
 There are also arch-specific kernel-parameters not documented here.
 
 Note that ALL kernel parameters listed below are CASE SENSITIVE, and that
-a trailing = on the name of any parameter states that parameter will
+a trailing = on the name of any parameter states that the parameter will
 be entered as an environment variable, whereas its absence indicates that
 it will appear as a kernel argument readable via /proc/cmdline by programs
 running once the system is up.
-- 
2.39.5

