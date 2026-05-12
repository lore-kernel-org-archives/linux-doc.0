Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B24012727E2
	for <linux-doc@vger.kernel.org>; Tue, 12 May 2026 01:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778550729; cv=none; b=ZX4YLYDuBHjaiQCzRs01HwXL7Qz4stNka35FQkqzpergslL8z5icw7eNn4EIhWSlROBbFTE9qhYnGYi9rvwGRYqIavXQ5SRlmBlj5KRUvRTiEv02gRWtA9nCAkO3ROyjvhdKxRjbzN/o2O+McfS3+iqk/mhUr0E8/fnadjF0NQ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778550729; c=relaxed/simple;
	bh=pbr4of15MJ9gDlAWYPxoQodijVKSbN+J6ewttAT75do=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YBUacJqS3z2hts4UDGgWCGbZExhLH5p44u/RepuJVUVnzgmY8hqWY1oHhYUJxr/ytLfuRYjPOekGysj/KUwyZRdBCUHlkq/nBEYFq7PQ2GN+QjPw393dx98/94SZdV+IoEqKAhKF7Bq/cMkLXzReiGsLQTwmV/Wj6+XwiJwj8oE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ci6cY33K; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ci6cY33K"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c801b30188dso2091986a12.3
        for <linux-doc@vger.kernel.org>; Mon, 11 May 2026 18:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778550728; x=1779155528; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Pbx1p6wtRP+B7cmJcrjgOMPZJz23P5jOucxknJOqQU8=;
        b=ci6cY33KJZpVLlwy1CTk166unrSdpgul5y+x7n9LtnWHm5Yd/14Nojjx/bCBl3wWY4
         64+2x7YLji7JF8YWbJfK9H6bWov3d6C+wIuhGt9bt3JTknhE6nb6RrDguaN6+cJTFe9j
         KXyfGPjWaDGkc9pO2m6XR3pk4N+uo93DGnWAvyFxgKZzQysQwx2egKM0XtUDTE28ih67
         UiWvD8hhB8rQN5nPGh6dYkkB7uTwxzjsTJKLIMl8nPQ10ULtBG+rEEXPcn0T8aAX+9Zm
         9QLZmXpqGQZ8StDksnBBP55B6E2UYwHe/RQQgAkHQvI0Bp+9kqeb5XPjL8IfFfTDK0DY
         Cojw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778550728; x=1779155528;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Pbx1p6wtRP+B7cmJcrjgOMPZJz23P5jOucxknJOqQU8=;
        b=gvO3iLUDRj634AHL1z+U9OJsiytBbzvF4ipSDkz7Rky6BlYa+CHrvxWkW9nDSBGlfa
         g8/K5MzbC3XV7AqpdTfms/mcKkOEvFGu+12JnfxHVLS0Cjnzh2mGDc8yl6/HHvO975PT
         XtpZJ+htmY8R52AdK/Hbb0CPQY+wBFAH4vHTXEXa+0cAS7+qDWp4D4zycD3NCD5UM3qu
         kO8pz/PReCjq2rYttEBD+ywGQzqxk9RF0Wj45NLXQPxszSNTc6iqry4w46peji0C51yN
         PgMVw8s7N4KWW+RTtvdReLAxh9JLBIleZ05H5QyxMPwvG1r5ikAA4R9hEaVEjOTIXzBf
         +9DQ==
X-Forwarded-Encrypted: i=1; AFNElJ+j0X8GtHSfL7Ei3MFx3GpPkwzrA4dRasamZVJMNoqPew3t4MR2DFxkB2MKLN6ljeMYEG0Ym1KGkew=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvFL3MS8fuoZzdo42WQSk6NvEGTK5OMBr2s+WOd9swPLRzJuCm
	zm4QdFbdjnYar2KY0c7vRwMMyvi4dOQYhtPJ5DPTPxXLU1nwyMJDPOb3+f5dIoNK
X-Gm-Gg: Acq92OGmLrmSLQcASU7CFW6TnC3Ua5gC97p56j5wK9mBBGo+M2flwqQS1ErgLKvSpQi
	mZKsVd9BPfUSMfwlY/oA4XWIlxFYxHfBgrTErZY7/1g2nYg2uVQHTiqZl7jwu6KF6tRy6xuZq+K
	kid3/a60HEshnf480V2HTpMyEJ7V+00+0NTbFmeg9uWCWsFeG7LlgbK8wSdWbQgJQjND3n6zBFC
	nrlW36gqm19SiAjDUGYMVThYWoSqqigplxqPHeUEujh/KR8DLu8AjtcnkSfmkpZPzXPVeTvdpvA
	vUNzBk2jTjIm56kYwTWJI7n+hchZombSgB6DiztdlpAtSIjKn0bvSVy3T5TX+OGkuINkbe7JW71
	iXS+ilLWGEztPmoqHrGBWRNOzMkxIrXJupOQMD+M7HF4WHKflRATRYbTjpouVmC8GKXXdMh6qWi
	lZVz5SsYek6u8v0o620F02VZW0kZP646SZlsI7m4mF8pEismRvvBkciXfiRLWLWzNivMQgL48rf
	mjQyri9spcGpdUwrTkFu6/EVanFe5R3Ms2rBU7i8SR59ubgADLW2C7wt+Q75WGtLw==
X-Received: by 2002:a05:6300:210b:b0:3aa:ec27:e5f7 with SMTP id adf61e73a8af0-3ad9a556696mr1001547637.42.1778550727087;
        Mon, 11 May 2026 18:52:07 -0700 (PDT)
Received: from ERIC039ERIC.localdomain (1-170-163-225.dynamic-ip.hinet.net. [1.170.163.225])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c8267711b21sm10627767a12.15.2026.05.11.18.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 18:52:06 -0700 (PDT)
From: Chen-Shi-Hong <eric039eric@gmail.com>
To: linux@leemhuis.info
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Chen-Shi-Hong <eric039eric@gmail.com>
Subject: [PATCH] docs: reporting-issues: fix advice wording
Date: Tue, 12 May 2026 09:51:29 +0800
Message-ID: <20260512015146.4081-1-eric039eric@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace "these advices" with "this advice" in
Documentation/admin-guide/reporting-issues.rst.

Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>
---
 Documentation/admin-guide/reporting-issues.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/reporting-issues.rst b/Documentation/admin-guide/reporting-issues.rst
index 16a66a1f1975..731865b5e8ff 100644
--- a/Documentation/admin-guide/reporting-issues.rst
+++ b/Documentation/admin-guide/reporting-issues.rst
@@ -129,7 +129,7 @@ After these preparations you'll now enter the main part:
    situations; during the merge window that actually might be even the best
    approach, but in that development phase it can be an even better idea to
    suspend your efforts for a few days anyway. Whatever version you choose,
-   ideally use a 'vanilla' build. Ignoring these advices will dramatically
+   ideally use a 'vanilla' build. Ignoring this advice will dramatically
    increase the risk your report will be rejected or ignored.
 
  * Ensure the kernel you just installed does not 'taint' itself when
@@ -795,7 +795,7 @@ Install a fresh kernel for testing
     situations; during the merge window that actually might be even the best
     approach, but in that development phase it can be an even better idea to
     suspend your efforts for a few days anyway. Whatever version you choose,
-    ideally use a 'vanilla' built. Ignoring these advices will dramatically
+    ideally use a 'vanilla' built. Ignoring this advice will dramatically
     increase the risk your report will be rejected or ignored.*
 
 As mentioned in the detailed explanation for the first step already: Like most

base-commit: 5d6919055dec134de3c40167a490f33c74c12581
prerequisite-patch-id: 1089bde9e188a84c873ff722a776bc107a6e8103
-- 
2.53.0

