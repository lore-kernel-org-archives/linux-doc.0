Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF31EAC7
	for <linux-doc@vger.kernel.org>; Mon, 22 Apr 2024 04:29:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713760166; cv=none; b=uOGhjzsbVdDsKRwnXrErQfUVwR/beuXiCfCpB2r5fNxBRHqGQkbDYiEOI1lNuO9qXerCwsk2r5P3dmnVhKujxiQy1+E4pqrTb8bPFBSPEQ41Hf5mqPETKVXdjILsHbwK986gSvvrI6RmMBj/v/zozjQIU07clwlLccPS00i1csk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713760166; c=relaxed/simple;
	bh=4+/2HS4VKURVjvO87h3V2grQP/zeYtE446bsQYu31XA=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=NTG5jUWr/DGIwzZJzVDx4iCp1pCZLu1Hcm3Q8Am9tBLG1Ayzy9mjEmhwQi5egNAf1DEPBuOBT4lNZPYsL4tn9+q9TGAStNnX7B406KeE3r8akqy8c2/z4/z0wgOkLknvsuLrWUgi6d6eVY+GVyCf8CiqWSf3ox/lfPCWBPoCt0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--nsekhar.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tatbdM6C; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--nsekhar.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tatbdM6C"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dc647f65573so8694594276.2
        for <linux-doc@vger.kernel.org>; Sun, 21 Apr 2024 21:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713760164; x=1714364964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mgVxAGNMSrt9uYv5g5ZyAhdPBATWU+/rfu7QaLtr/yo=;
        b=tatbdM6C2cGTLRbb49uVCFi7M8SenEvdiVvrLlQ8z5ifVQ7sf2WI/2MXNynMJOJNjJ
         r4KJATSuEhArjYVP9Oi/4gyc1r+3gVK9l5rbRAiuhdS2OASLlfNa9JGB2k00ljj73stR
         dp232gYzHAa+2UWDY2pCnxpNpI6/9WQvBFRRFfsIcKf8bOIHx5aF4b+mlXHruEy0A9Y1
         8OXZFFNr+ecgSqTSDZl1lp2XAi5BHduRVk8VNMqUOq/j8yw/n45XMLeIYCjFKiqAXO+a
         YsIJjY7cuZqJ6jGJyCkhVLNoPfN1jK4dG9LILikqSLTXBjjFgDXtj/iGNLvyliaGAyzw
         /W8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713760164; x=1714364964;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mgVxAGNMSrt9uYv5g5ZyAhdPBATWU+/rfu7QaLtr/yo=;
        b=Hs6DpaH0MGl5B1bgYriMYgmTs+Ay+zKxx/1SYw9XP7DMqLjF4hsbIFQ8/4dUMsNTxS
         PqxlBE8Abqg+5XeobnZtgB1fcpX9K/UJty6EVaU0ahx7QPvF/bW+N5xaFWdqlqEzmXRn
         N0p64OouArPY8Wd/dt0w4cEFOsgKF4XbhL/yNn/6xYSlvXVzRZ1yT2cqna2PUZdBSJ4A
         buIYtDW30kgvZ8QfpTrbqEdxFJHsO8OVnrRJzxROozIluBzcPWOo4bGGPzcGA26Rw591
         CgwiLCNtwCbu/uumUkfHkZ57h7k8p9fpTWEpWM6iFjx/6csaAc9ZEIK4A6qvmOHMyelZ
         G+mA==
X-Forwarded-Encrypted: i=1; AJvYcCXiqcMT8L60TJpNkYJWFdVfUzi/CKanAtrUxO3/2PmQe2XFFCFlcDqexk3hf2FK+DNhECJuDUlWM+xdMCwK7RcxZ5ZDtpT9f/x1
X-Gm-Message-State: AOJu0YzklnQXFcKf3n/MxMUms39/tFKbZuViOznzDZKTLOcuRcsNEjow
	yXxAVSjU7m6KNq++64IbO1Gs+HFtIbBgySVtmEKUMGW9ECXHaQ2eefxRtU9d5wnrOMo8HVli2vn
	K2f/ULg==
X-Google-Smtp-Source: AGHT+IHAldkAyvCWIImPYDllXbDnEjYLXhUW/l/he8Y1Hqbao0lNGK962N7VmeHzve4AYaJgz8ix1jY6yGa/
X-Received: from nsekhar.c.googlers.com ([fda3:e722:ac3:cc00:4f:4b78:c0a8:6144])
 (user=nsekhar job=sendgmr) by 2002:a05:6902:1022:b0:dc7:7ce9:fb4d with SMTP
 id x2-20020a056902102200b00dc77ce9fb4dmr2721213ybt.12.1713760163982; Sun, 21
 Apr 2024 21:29:23 -0700 (PDT)
Date: Mon, 22 Apr 2024 04:29:10 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.769.g3c40516874-goog
Message-ID: <20240422042910.2248234-1-nsekhar@google.com>
Subject: [PATCH] docs: driver-api: interconnect: fix typo
From: Sekhar Nori <nsekhar@google.com>
To: Mike Tipton <quic_mdtipton@quicinc.com>, Georgi Djakov <djakov@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-pm@vger.kernel.org, linux-doc@vger.kernel.org, 
	Sekhar Nori <nsekhar@google.com>
Content-Type: text/plain; charset="UTF-8"

Fix typo in debugfs path name that prevents copy-paste of
commands given.

Signed-off-by: Sekhar Nori <nsekhar@google.com>
---
 Documentation/driver-api/interconnect.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/interconnect.rst b/Documentation/driver-api/interconnect.rst
index a92d0f277a1f..6d0a205b42b7 100644
--- a/Documentation/driver-api/interconnect.rst
+++ b/Documentation/driver-api/interconnect.rst
@@ -119,7 +119,7 @@ any arbitrary path. Note that for safety reasons, this feature is disabled by
 default without a Kconfig to enable it. Enabling it requires code changes to
 ``#define INTERCONNECT_ALLOW_WRITE_DEBUGFS``. Example usage::
 
-        cd /sys/kernel/debug/interconnect/test-client/
+        cd /sys/kernel/debug/interconnect/test_client/
 
         # Configure node endpoints for the path from CPU to DDR on
         # qcom/sm8550.
-- 
2.44.0.769.g3c40516874-goog

