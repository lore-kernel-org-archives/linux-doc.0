Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 412C91CAA65
	for <linux-doc@vger.kernel.org>; Sat, 16 Aug 2025 08:25:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755332702; cv=none; b=nuXZ/10uIrXzivXYtgT43gHmqLzppkPSrKlRqEZgcMIzmajXiF53OOkhBWF0EDc0zvr6sU5HzPNZY1h5EMl7uiR/8Ukp4gDr53c/qHMECpsznmuKdzNQl3zldJ4aUc6BW1+DWa9R86C4c7xnPW6jejsbfJ67sDdVc11x0mTI+yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755332702; c=relaxed/simple;
	bh=HcspPniQ+/a9UgjFb44d/Qy83pFsOwoD+mG4yuju6Fo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ojPE7Nohqm0XzcYGTWDkyHCXrPEkmdOP6XZfpiP7ALE0kRl6hqMd9pPpH14zAMbI327WWQOlEuDJTFqwQnVUKLElBwz8BWKnu6KepgPeEbJ9RAoJQfrDTs33437q1R1SjxsTNIt/CXB79eClL5e1yeDo5h9PlcFwbcjbJvVNDh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gs+EA4UN; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gs+EA4UN"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-24458194d83so18406705ad.2
        for <linux-doc@vger.kernel.org>; Sat, 16 Aug 2025 01:25:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755332699; x=1755937499; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+vKmcBx4tFOUtnevR3o1xCot+6PtJYfeGLB/iWk5Rc=;
        b=Gs+EA4UNBwwIGbDcRFgE1FQITNuJliVEFg7GwcjefUSLF95jFtk1AF81Jp+axmtkXF
         iB0mW1cv6J7gjL9HdMmpU7sqPU07WkgqzR8OHbhcPOLynryVJyPMdXnJp/ayuN9sCThs
         S8zO1iwopri5AsB+ER5h96pqCDpvL7NKVqH0wZhZI0wM1QtqBnja7zNf+jwYE/d8VZ/F
         uI7r0diWsIW8NlKGww+Os/bs7+i8AywsvVAy3sYPL6gtdoZfiwPqOSZMvF61STgP45HZ
         F7NLXKyjNw1cRP7hCZBEPCGT5NRovW42YNcR/PBtVOcvVVrDarB+XlVrmPju4dQwJL8R
         948g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755332699; x=1755937499;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s+vKmcBx4tFOUtnevR3o1xCot+6PtJYfeGLB/iWk5Rc=;
        b=mvb12XxiHIQvyzQbbODaTql2r8EnhWLgjuI/zSLVB0y5kKZBICyIb7izPzf0szSYD+
         qEpZLYKpIChhfzM3smBQk/xWbCOi7o1M8vrdz4VOTCq7YwsXlOhAL5taTZXeBshs52Qv
         qA7FoeLdBsv2446An3E57dPeDd+yiYH7r1gFnYBvSYWD29nAjcAtJWfbPvA9dCo7hYMM
         1HogIWK0awGgeV4RSd+J93r130hTZl1PSZm/qCIm9qWt81u+SUwJhfR0cHY1nWzTK6Gp
         Z8hV0MS/ChvS9Dafrr0F6oqEAyg86nWVvNduM4soR2S5zSBmw28PU5N/eofl6PsRtclI
         wnVA==
X-Forwarded-Encrypted: i=1; AJvYcCX0XAljB3/Oz3uCvgpfXkP2Oa5pNibwzP3D+gKsYPpTjmVDuCqxDHjB8c7BGehTc9hGt95cPYfW1Sg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+JezsgriS+KIJQRPJOFy8PuUdhSzY8dOX1slMkPP+9JYSa1RW
	qf9lO9Y9Zj8ZlvhVpytsvQWk0KRQw2NpTyQv6QjnLrnhQTy7LqW5Aa9n
X-Gm-Gg: ASbGncs1kEP7SkhJO7TdW7L8iXDvJMh4+M4lDBDCFiL3RH9krV7o0FdMQOvag8AKsP4
	eXNkrtzl406v8VP/8DXz0m/jcmRzQdkXOb1A7rGE+2vkyUzeGIn1RY9w1Aq0DN/SzYp4K3qQvKY
	yl5jNdTvAQqUMlU/hEucsyz+STfGHnSmUWIfJfvrBuKk4WeCt4S/ZitsmrprR5lRbkGNLQzoIsL
	YOsUnIKur5jZ/UtrlNPEz3gkts34hPGNdWB8+YVv7Yq6O+DJg1llnGDaD0xh+Y7FRLIbOM6ceB8
	S+mda9u5L89ws+tmSfkwuhQi1YA+R1WntlzaLweMt8AC1pMIXXsO6FlwIclGgIfiVZQBk92JGoM
	i2Uyaua0UU+CcdngocKUg0MClIFHFkFeTkeK3C/7lGmBpjSyWBYc=
X-Google-Smtp-Source: AGHT+IHSsawcaEevMuafLD78BTfCUbWtLwXteWH92g1FBSOzZMWiz7OQWkZkplda+BqNoCgweUMSvw==
X-Received: by 2002:a17:902:cf03:b0:23f:fde7:efef with SMTP id d9443c01a7336-2446d8c5ae8mr75631885ad.30.1755332699445;
        Sat, 16 Aug 2025 01:24:59 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:d003:7033:7bc9:450f:9942:9f5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-32330f8309asm6228514a91.4.2025.08.16.01.24.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Aug 2025 01:24:58 -0700 (PDT)
From: vivekyadav1207731111@gmail.com
To: corbet@lwn.net
Cc: rdunlap@infradead.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linuxfoundation.org,
	linux-doc@vger.kernel.org,
	Vivek Yadav <vivekyadav1207731111@gmail.com>
Subject: [PATCH v3] kernel-parameters: fix kernel-doc warning
Date: Sat, 16 Aug 2025 01:24:52 -0700
Message-Id: <20250816082452.219009-1-vivekyadav1207731111@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Vivek Yadav <vivekyadav1207731111@gmail.com>

Fix kernel-doc warning in kernel-parameters.txt

WARNING: Possible repeated word: 'is'

```
[command]
./scripts/checkpatch.pl --strict -f Documentation/admin-guide/kernel-parameters.txt

[output]
WARNING: Possible repeated word: 'is'
+            The format is is "trace_trigger=<event>.<trigger>[ if <filter>],..."

total: 0 errors, 1 warnings, 0 checks, 8339 lines checked
```

Signed-off-by: Vivek Yadav <vivekyadav1207731111@gmail.com>
---
 Documentation/admin-guide/kernel-parameters.txt | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 747a55abf..302145870 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -7506,7 +7506,7 @@
 			Set a trigger on top of a specific event, with an optional
 			filter.
 
-			The format is is "trace_trigger=<event>.<trigger>[ if <filter>],..."
+			The format is "trace_trigger=<event>.<trigger>[ if <filter>],..."
 			Where more than one trigger may be specified that are comma deliminated.
 
 			For example:
-- 
2.25.1

