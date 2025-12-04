Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E3529E0E6
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 03:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764818750; cv=none; b=qzAybpwxsStzUj6tdI4d2Kv20lC4rmFOl+AVKvIgZgRcams+/d4zVajMPHJcjv53F1lCTMT0+EXrvuTHifXGj7P1Mq43Psk3/lPjfDwxdF9H3eHz+5ALR3GdxJ+fdS3XWV2oLUss5fmDIffMYtmehb/Lti1vPnhC4Xu8zAXdA/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764818750; c=relaxed/simple;
	bh=I/7cxZP7PHzdLxWaX/VoNXA1nB8DuuZ3s1oSZkRF2JY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=owFQGKQilJL+qyNFV+4zFlPHQj6MkEOUtfd56UgqdN7/9kfjmLjZzr3GWgBCTM+7QbBBOYQABlZISI+yeXpkIgna4jnR2lovPzofSc+zay2roM+5z9xXkUK4xIUGfhHZqoTAhoCy1mLghmnFIHZ7S4XsEoWSAof1r256JWDPLJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8/M317R; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8/M317R"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2981f9ce15cso6263035ad.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Dec 2025 19:25:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764818746; x=1765423546; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=spK07RH9SB/e09bcGxV6H18ne9sRU+EARhuUPw4HRqA=;
        b=R8/M317Rax09ifb0kFyItit42fJyw66WKA/ouxy5FWUnkqISEuJ2dANFtAj8dT9uon
         8LgmYQWnIx1pBH6jjkjaBpYgMsDICiPQ/EINAQc9sjnUlp+1p55ftYrcUuhiGt+ntb0N
         EGTUvgu09tOvF5YT8JVHxsyUZjf+tzpBXMenm6/wNg5IUi9mSvfSwnhQaGKboDmLPCU5
         ekBQKuGkcd57FVB5zeJz2pJ7H+nuygOIqueRM6ksa/DMCRuY4ry9C9hmmRLwq5pbkWCJ
         zRx5VBkjlR3bVZ6u/m7XybYz47wodvWihQ1iMwQX74KgFfseCeH+1LST+4xTzJqzEPXX
         6eeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764818746; x=1765423546;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=spK07RH9SB/e09bcGxV6H18ne9sRU+EARhuUPw4HRqA=;
        b=AvnK0eN44tkBWP8w0sjR5R9Jedf+YemswJP8J1//fFjCGwQyb457MqFNBxaOYOGGSS
         wwcBCSZ+ObZSNhwPseWEkNBcAMRb5MVNFRjNFtLG9cLV3UPoUeUpTSIbkNZITtEEGWpV
         NauF34IuuilbhL2kOGT1e5WdH0y4ZOTEaiB3V1YsK6z2NsxBgs1BadvMQpLpzE3qm6vy
         EZ/pbPqtZ5IHYpM6H6pOxE0n3OQRM6E2rtamS1yZqbamen5zPsFkSUudmYFCxZoLo9v4
         EBGyDnFa38uRopaBcopPrVqmgr6yvg/VrRWb2LdGYlEdNyw0BSwAvkRFptbjvGYLV+Ij
         jlLg==
X-Forwarded-Encrypted: i=1; AJvYcCUL5UbU5G4IQtlnMmO7O8oyau2DbfYIXpGjjfZ3HhO6336SxvF3pbJS5UyxTchOG6g9YZHvEYh7+Fw=@vger.kernel.org
X-Gm-Message-State: AOJu0YziL+OtYMe9HMgC06Kx1vGfl2/xQ77oTk4vFNwhmYrnmcoEwKOZ
	7nogeyYA8XZxIdd3RU9y2KznX9Z3mEyReaavZJavhKdhU9MTeXBrtHRr
X-Gm-Gg: ASbGnctzb7PjH8ivPQvM06nk0F2udrpODSNPUEOWpdLLAqRkeXHHZ7rae1xsYN6ttS9
	FYZRxlI/RLVbDdg6+UwBcQYxWywsweNCLwZS8hOHxMi2O9ZbRPsmviFba/+IfxigZaciAXUEk4o
	A7wPdR73NUb0+wWv9oFNLpJgu7rRT8sfuDnvYWDnDztLFEQOMD9BB3LMfzELMugPDFUWaYNorL4
	D3uhgvLaa/T8LorPyFtYgGkI++vd/3/V6Qfgcmq2afCigwB8C9UfXIetHmVAvFdFr6Qu/dlB3QA
	Hn+gAQfj3xzaJRwBIpA0SS/plgFeKwFLFp7LUtTpIdDHGdc2vqiEh05TIQRELzh2q1gfEmYXN6o
	h0mjHtWJfNvQznlBnZmAK4LB1KVX3ta+F0zv7jVZW9lZWv/Ll3sE4IGpoHxqI0fxrX86WQs42zq
	ffPnaQTeUu8QLFOZsINNE=
X-Google-Smtp-Source: AGHT+IExoyiKStk6FlBW0on3Vp6H6eKbj5VCku2/JVbKZj2lvzdBE784/x0jxPXK1wTtwNEmlSM77Q==
X-Received: by 2002:a17:903:13c7:b0:298:4ee2:19f3 with SMTP id d9443c01a7336-29d68482cdamr60414585ad.49.1764818746475;
        Wed, 03 Dec 2025 19:25:46 -0800 (PST)
Received: from soham-laptop.. ([103.182.158.109])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29dae99f01csm3112725ad.48.2025.12.03.19.25.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 19:25:45 -0800 (PST)
From: Soham Metha <sohammetha01@gmail.com>
To: linux-kernel-mentees@lists.linuxfoundation.org
Cc: shuah@kernel.org,
	skhan@linuxfoundation.org,
	rostedt@goodmis.org,
	namcao@linutronix.de,
	gmonaco@redhat.com,
	mathieu.desnoyers@efficios.com,
	mhiramat@kernel.org,
	bagasdotme@gmail.com,
	linux-kernel@vger.kernel.org,
	Soham Metha <sohammetha01@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-trace-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v3] Documentation/rv: Fix dead link to monitor_synthesis.rst
Date: Thu,  4 Dec 2025 08:54:52 +0530
Message-Id: <20251204032452.9523-1-sohammetha01@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The file 'da_monitor_synthesis.rst' was renamed to 'monitor_synthesis.rst' in
commit f40a7c06020709
("Documentation/rv: Prepare monitor synthesis document for LTL inclusion").

Signed-off-by: Soham Metha <sohammetha01@gmail.com>
---
Changelog:
v3:
- use a 14 character commit hash
- unwrap Code Blocks so that the references can be linked
v2:
- Use proper commit SHA reference syntax

 Documentation/trace/rv/da_monitor_instrumentation.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/trace/rv/da_monitor_instrumentation.rst b/Documentation/trace/rv/da_monitor_instrumentation.rst
index 6c67c7b57811..9eff38a4ad1f 100644
--- a/Documentation/trace/rv/da_monitor_instrumentation.rst
+++ b/Documentation/trace/rv/da_monitor_instrumentation.rst
@@ -162,10 +162,10 @@ For example, from the wip sample model::
 
 The probes then need to be detached at the disable phase.
 
-[1] The wip model is presented in::
+[1] The wip model is presented in:
 
   Documentation/trace/rv/deterministic_automata.rst
 
-The wip monitor is presented in::
+The wip monitor is presented in:
 
-  Documentation/trace/rv/da_monitor_synthesis.rst
+  Documentation/trace/rv/monitor_synthesis.rst
-- 
2.34.1
