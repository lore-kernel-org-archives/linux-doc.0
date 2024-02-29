Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A5A95D90C
	for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 09:34:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709199284; cv=none; b=iQlt6qxwacgFuduYqNAKiFn+YBPK4UxHUXCXEsaBAuCH+IZiPvlkq8net8mN6cukUjmNF+RYI1+7b/M7E+IzZeNqCM/5z0ZzHIhAG2TVGzFRnmSsIn1PstKuk6pI6y7CxCdTMrTDxSyRvvIeL8pXklwYQmFvko16nmQaH7Xjzrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709199284; c=relaxed/simple;
	bh=2o3I/8Z/fCxH03jhXNbXbl79FASICQdOxt3di9g6Iu0=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=Kkq3kZkOpi8i5j+7xrjo+2/4GgQbjUWDJasKWgt+ucQCiC7w3sX11rQKF0XZWKhy7YhOzDG3URi9EMKcvvpTPrAPJ8W7MPcQPNX4Gz8zGw7zh9rdAIzbwwLYBggRDJnogj2OhODJCQlOPe7Yb4BNUV4EhLhvyAlBEoNLP96RBy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=h0CfkIVN; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="h0CfkIVN"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1dcb3e6ff3fso5788385ad.2
        for <linux-doc@vger.kernel.org>; Thu, 29 Feb 2024 01:34:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1709199282; x=1709804082; darn=vger.kernel.org;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ba0u2jTmO3RCrkbC3jlDWPxQ4C4shiMEP6Syst/UoiM=;
        b=h0CfkIVNssJ2/rJ5DAvKM8bFke3yibg+53Wka80U0Tx3HWL59TozsPZzaTBSfSokac
         zuuROh5S/1hcOpcTNnrPAzDQ2q9YkYXCLzNDEp4cXKxmg/pOciRCByjjHW2Hlum11B4n
         C4gIImThlsR0x66fIqGchZqUqiKZ0u7QRT35l77pACA+/Y4bDqXPM1bEiNK6tMkr8Ziv
         MXx2qaG1MMMycLTME/0kWebop9JrgqX1/b7kCgROyqn6k/DMJFpt/LiiI0k1X0k4syqS
         ffEUGv1e3VLkKHEo2JooS/uXnMwQHCVQrix1ac/r3PFyQ8lmaxUlAVV8/zowyq9V4c9M
         fgrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709199282; x=1709804082;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Ba0u2jTmO3RCrkbC3jlDWPxQ4C4shiMEP6Syst/UoiM=;
        b=t4eAl9qEiAYuuQtyWIvObN028h/f76uCEKZtSmdFGzB90eYYvHrNGxnPOHDr7D7mfC
         YRbZEC9JiqgN3tYxueHtfRLxqQhtsWCJ+2gycZQ0md1V3cZ96oWYeszLRAUcxDGWWFVt
         x1wR3Er2NHR6KFJJsxXn61HCAtuYhOA1GVLK1MXE1DU2q7fU74vRqB4Ybc6EtVh74OJE
         FNUrJZVZCfTgX3pZURdhbD8xHhBusRPjBDjD4F4qFR5M7UbO9D/pMyJXnYRm4xjVocKv
         SFZD4EY5mzlZvf+kcNaOGVw6J3UFgTTgo9YpvOTJQS2o9Leg1bEXb0uuSxWmtKaOUVGG
         Ghjg==
X-Gm-Message-State: AOJu0YypwUG0nT9YatCKcV3hhr5AnYovwgcJ8HjpNJDDSQCe1D57XGQW
	KCfl4HzvcQ3Jz9kLtHxzFHM4Vx7X8dboFFwTx5aMhpJazUQDp8BI
X-Google-Smtp-Source: AGHT+IHKkRRRCY9NcyLyrWLcOMxLPK4QsFYtLby2Il/HyKpT0Xe3Br523bydW+yNc/Y03LV9P3+U8A==
X-Received: by 2002:a17:903:2409:b0:1dc:a282:365f with SMTP id e9-20020a170903240900b001dca282365fmr1837353plo.40.1709199282528;
        Thu, 29 Feb 2024 01:34:42 -0800 (PST)
Received: from [10.0.2.15] (KD106167171201.ppp-bb.dion.ne.jp. [106.167.171.201])
        by smtp.gmail.com with ESMTPSA id d3-20020a170903230300b001db7d3276fbsm986401plh.27.2024.02.29.01.34.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Feb 2024 01:34:42 -0800 (PST)
Message-ID: <b175c52f-34ee-4753-b172-e57fee6fcc30@gmail.com>
Date: Thu, 29 Feb 2024 18:34:42 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Jonathan Corbet <corbet@lwn.net>,
 Tsugikazu Shibata <shibata@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Subject: [PATCH] docs: Move ja_JP/howto.rst to ja_JP/process/howto.rst
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Subject: [PATCH] docs: Move ja_JP/howto.rst to ja_JP/process/howto.rst

Let Japanese translation of howto.rst in the language drop-down list
by moving it to the expected place.

Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
Cc: Tsugikazu Shibata <shibata@linuxfoundation.org>
---
 Documentation/translations/ja_JP/index.rst               | 2 +-
 Documentation/translations/ja_JP/{ => process}/howto.rst | 0
 2 files changed, 1 insertion(+), 1 deletion(-)
 rename Documentation/translations/ja_JP/{ => process}/howto.rst (100%)

diff --git a/Documentation/translations/ja_JP/index.rst b/Documentation/translations/ja_JP/index.rst
index 43b9fb7246d3..0b476b429e3b 100644
--- a/Documentation/translations/ja_JP/index.rst
+++ b/Documentation/translations/ja_JP/index.rst
@@ -11,7 +11,7 @@
 .. toctree::
    :maxdepth: 1
 
-   howto
+   process/howto
 
 .. raw:: latex
 
diff --git a/Documentation/translations/ja_JP/howto.rst b/Documentation/translations/ja_JP/process/howto.rst
similarity index 100%
rename from Documentation/translations/ja_JP/howto.rst
rename to Documentation/translations/ja_JP/process/howto.rst

base-commit: fe2562582bffe675721e77e00b3bf5bfa1d7aeab
-- 
2.34.1

