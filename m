Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BFB92E9EA7
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 18:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759863354; cv=none; b=er7ZCXKJlfK3L8cbTFbsknjhQbUi0F0tbxmNfPOGLElaG+ZdhRD0Xk0COnvlNAiwGvfjGr5BkeySf5rbHYaRETmHghCW8e6fmlVvVBwiLlRVaGSDIP7HRW0c5ZBUkwbHuu5ImBCU6/iJu2SqGEU8bbojzl20NK/+NXWbhgLUtSU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759863354; c=relaxed/simple;
	bh=Rho7sTxAMEoPP252qGZTMQFycx1DLensjGuRyl7y578=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NZFzm/FinP7hv07ssqVB5N9vYhrMmVnwqhKYkXVuKbeBnK7vREkPXFoN8XT7cUqIyM04ZBUW9S2SBsiddsr5kIW+VBJ3oYRDN2kOeMkWtsrD8q7ya7jYeUHke0ZL+2+IBIeKtNaZ1giodxq9pM64NkUaaYeGXd2jtNGDxdqZXX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K8ZvPoTl; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K8ZvPoTl"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2698e4795ebso64766185ad.0
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 11:55:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759863353; x=1760468153; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gegn0k8zkFLs9RL1dCuvg0v6JbgbJ0VquvE3LZNQOk4=;
        b=K8ZvPoTlD2nNJbcMBseFZSSyHDaLsb/mT5TLmKmPJLPXmOWqLmbbiQF1WhUqokUcH0
         doZmZkVYjJ4QGtbqx1eUxVvQCU+IHH8zPA0mgp0rrbw3DbB8GFvRyp7r+g526RpQjpFx
         7a1hzV7X5/uu74WUQ4jLMeS192OJFaiWIxI3VwiqBXkgULwHn5Abd90DKXijTuST6oEZ
         FDZJf2yuKcOlxoQ/1f14J/m55bub/Y5Dt0Yk+PqJUaF2PMKgeoWL2TFd/5tcKOF5lD4+
         xQUZZ8wwpCDsjdIWE8/Ve7l/6qhpBLnYwwQQbOoJ04z0pHIKoJnBkByjgZBQ0l39/w18
         OcNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759863353; x=1760468153;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gegn0k8zkFLs9RL1dCuvg0v6JbgbJ0VquvE3LZNQOk4=;
        b=YY00IXODH/khJlzQw9/g4Fd0PzgMrbK4ysAvikSxStpglG1hq2yCdPpCfnlrBAx/x8
         s1GNyTZupuYfi7ptCNLdXdD3Q39ubCX8Y3hY+4Wq76fJiC17aCs2PuKy8V92QQ/hfiz1
         IPnD2wOjoyU4EejLYHU/e1cEjiWairNCmkrwD1TzJY4pJin5mJSp7qYDFkPju9XJm7Tt
         0V69jaWcRGSRr9LHyeP/3G7AnFMgFbuGnwLc6ssaAOIJEK/1HhqAJOQDKtfmnQobIFid
         jiMjPWERWjdyEHklSwFqNse93oYMRxKnOPOwvTlFkCh3YRjQ008ID+rwmKMv3RC8wi3b
         Rqjw==
X-Forwarded-Encrypted: i=1; AJvYcCXmH3btoLk38WhpfngOgiZlWOKi5I2DH5QWY3A30Nb8HuXdCgIAR1JLmcOVrqSZvcx9Lok+1nX01co=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3khnIrXjaTBBw8nXZJ0WXfVsr1v2e+/8J0nXZz9RrFvmy2Soo
	itTNQ1Ab2e1A556aPsBBJIPcrHVswRsLi+vZgZHXIADXnklh4v9yPk7g
X-Gm-Gg: ASbGnctXPMCchtH1Qw+XfkE5cr14X0b5PslgFp/SvwYmUKQXQBXKfBgjbY96rV/KcJ2
	+mRS5u29yMLLo44awaMztnfBdntcQ6sFcCTzqdeVmLc5HKTjd7I2Ie26I+NGOQXKVdNZ8paRGd0
	+bysJ41Vdxr+VR0vGxdRENLcaj2OjPRdf1pJv/TVy7YoImuPKp1tHC/wvyO71jkEs+D+LRROPQI
	Y9QEDw6rHBOG1M31ZfcknttKp37F1Beil8k9ZG3l/rfoi0FxBTgI/gTRthu8YaD2KzsikR0Gzz6
	ZbXeBcZSgmck+zHy6X3J30+B8lLSZuKb3kGIm15Z5ynvEJql4iQFmQvb2Y5HxBE8mnVDHWGzfIE
	bWtFENsBwCcFEUUVSTHKa8Q4NFaUxBCmA6julr7HDa+9Hj5nq+/a5li5Ar3uGM+1HiQ==
X-Google-Smtp-Source: AGHT+IGZN1Y9M2N/Vee1Ssvvb0MHNlIZBYsHqgiNh9gBqOHOlpsRP+9huQ4wVymhKKzzErwqk8uQ8A==
X-Received: by 2002:a17:903:1a8f:b0:252:5220:46b4 with SMTP id d9443c01a7336-290273ef076mr7414175ad.37.1759863352634;
        Tue, 07 Oct 2025 11:55:52 -0700 (PDT)
Received: from kforge.gk.pfsense.com ([103.70.166.143])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110cdfsm173529655ad.13.2025.10.07.11.55.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 11:55:52 -0700 (PDT)
From: Gopi Krishna Menon <krishnagopi487@gmail.com>
To: rostedt@goodmis.org,
	corbet@lwn.net
Cc: Gopi Krishna Menon <krishnagopi487@gmail.com>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com,
	khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	crwood@redhat.com,
	tglozar@redhat.com,
	costa.shul@redhat.com,
	jkacur@redhat.com,
	Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH 4/8] Documentation/rtla: rename common_timerlat_aa.rst
Date: Wed,  8 Oct 2025 00:24:53 +0530
Message-ID: <20251007185508.40908-5-krishnagopi487@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251007185508.40908-1-krishnagopi487@gmail.com>
References: <aOUMyGvkibvOV0IS@archie.me>
 <20251007185508.40908-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

common_timerlat_aa.rst is intended to be included by other rtla documents
and is not meant to be built as a standalone document.

Rename common_timerlat_aa.rst to common_timerlat_aa.txt to maintain
consistency with other common_*.txt files and prevent Sphinx from
building it as a standalone document. Update all include references
accordingly.

Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>
---
 .../rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt}     | 0
 Documentation/tools/rtla/rtla-timerlat-hist.rst                 | 2 +-
 Documentation/tools/rtla/rtla-timerlat-top.rst                  | 2 +-
 3 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/tools/rtla/{common_timerlat_aa.rst => common_timerlat_aa.txt} (100%)

diff --git a/Documentation/tools/rtla/common_timerlat_aa.rst b/Documentation/tools/rtla/common_timerlat_aa.txt
similarity index 100%
rename from Documentation/tools/rtla/common_timerlat_aa.rst
rename to Documentation/tools/rtla/common_timerlat_aa.txt
diff --git a/Documentation/tools/rtla/rtla-timerlat-hist.rst b/Documentation/tools/rtla/rtla-timerlat-hist.rst
index 43f99bf0f1d7..ae1638bb9a99 100644
--- a/Documentation/tools/rtla/rtla-timerlat-hist.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-hist.rst
@@ -31,7 +31,7 @@ OPTIONS
 
 .. include:: common_options.txt
 
-.. include:: common_timerlat_aa.rst
+.. include:: common_timerlat_aa.txt
 
 EXAMPLE
 =======
diff --git a/Documentation/tools/rtla/rtla-timerlat-top.rst b/Documentation/tools/rtla/rtla-timerlat-top.rst
index c620ab16f849..19cb5d203845 100644
--- a/Documentation/tools/rtla/rtla-timerlat-top.rst
+++ b/Documentation/tools/rtla/rtla-timerlat-top.rst
@@ -32,7 +32,7 @@ OPTIONS
 
 .. include:: common_options.txt
 
-.. include:: common_timerlat_aa.rst
+.. include:: common_timerlat_aa.txt
 
 **--aa-only** *us*
 
-- 
2.43.0

