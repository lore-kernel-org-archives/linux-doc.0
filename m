Received: from mail-yw1-f202.google.com (mail-yw1-f202.google.com [209.85.128.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B2BA5F87C
	for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 12:49:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711630198; cv=none; b=GJ2VVIb/tar/1pPivAUatq07Q7axVRn7EIys2FfKwQR0worq98AVcWJlDSDQbtYR+xKwYq4j6jQxM698rxFc7I74RIs6aQ+/rDrSYv+jphl6J0gVUbz+s2/Z3SRKUJugJJwRPK4CPEZCXLw9npe39L6YoJdjsZs1OryIyrzUNtM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711630198; c=relaxed/simple;
	bh=AUx/FZ/RU76mHzg4qaAQoDkIORYPJrAzMVU1E7OcnBU=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XIM9y6OlF/CTUoHN8/YGojU16gYieMuS+AFtnm+NeAdPO5mC5j79UAMmMD+cAjhpQyIkbf6qGgDdvjePxoEak7dl3Lp1T96i4JkdgCD6HkLRjxfTMl6QJmMvb04gshzAD5ZzhiBeSwTKLaUtfgGHStUb+o5sv9NSIKdTP16cFDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=IHs8Oi6B; arc=none smtp.client-ip=209.85.128.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="IHs8Oi6B"
Received: by mail-yw1-f202.google.com with SMTP id 00721157ae682-60a20c33f06so11983917b3.2
        for <linux-doc@vger.kernel.org>; Thu, 28 Mar 2024 05:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1711630196; x=1712234996; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=V2hEdvFPOs3Q7MZ/48YeLwC2rbA6kByg8D1e17fzf9U=;
        b=IHs8Oi6B5QCHM6FNUqya6j7pwke6Ag5l+vVzVNNCrhxekP6JUqlMsiYzZrlA0ZTyK+
         iRaEZwWQuhoLyC124o0qVcf1agOsMmnSYSXDNTtyBKRFDU9QG10MxqI/MSmFBIYeicxL
         ffiDFtghmyeyRD+p/Iu7YvmZMQJf2CORds7nSmnVk+pRXOmRXERrqIDMaQKFNRibMUn/
         0VoZasTSkSCEDyTyEhM4Zvcbj0a/8cFwH5LArGUQsAbXLHBI0Tk5qdApcVYtxIJ6AA/8
         aNoFEA5FHmGV3DmqKvlctugDKQlYtckEX0nZqyn2WPv/D69PBXiM6KJC5WOAFQo1Xi8m
         7kpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711630196; x=1712234996;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=V2hEdvFPOs3Q7MZ/48YeLwC2rbA6kByg8D1e17fzf9U=;
        b=JKWjwUe5bTcIF0knmpEKlaUvwRcIeIhsusnQMpAOn7Ote4BE2+6eyi7SzJzzIr9bc1
         QKExIBXjh6k7+QYuoXBhWMQhjIjmWPSpK72z8PfpDfaLIOEyLKjmdChKfTzSILaGoozE
         5OLkDhiauktn9Iwj6zUPGs+t0GWdMMUkDtPzN3U2Xh8D3vh7/I+f33TnvqgZuxOoAtye
         f9mS23Zo3Tpg2xBvurkWovo9LeQHPU1ZGDchXkwvSy2lRLTqUUpwkz2bwL5cgc83gCYF
         +NPR8otjWvPAF+1HmDNetCSzVWQoKSiscnE+3V55/hfbZmV5wJii6VOsn5YEeL+nvFhw
         QQPw==
X-Gm-Message-State: AOJu0YyHSTrXyp96GkegsWOUT98L094rqN1fTm4iKebIyvqxgsE6YGs2
	gNy8NG56h4lRyQLPK5w6Sk4sbZPHyqcLbOY9y+p/Gqv3ZBKtimFc0jcNzB8BfsTz2EdvQJ5iNr6
	90qMMoH1r5tXLYxbLXxZnBRcJQXUHce4UkCGKPF0V/f7v7u4tZGtehmHV68sZybJ5GRUM7QLiNq
	Dy22UI27HQnd+55CuGEbkiUXhfF8wXLVByZWNrT5cCS3NNEnU=
X-Google-Smtp-Source: AGHT+IGt2ygy/VPmzIkHQmiuHIvV0t44t+pVY/Hqx3xUuS/Nkorst0byXe/yT544CQP9wTy7G5WPltAJjbM2lA==
X-Received: from beeg.c.googlers.com ([fda3:e722:ac3:cc00:28:9cb1:c0a8:11db])
 (user=jackmanb job=sendgmr) by 2002:a05:6902:727:b0:dc7:4af0:8c6c with SMTP
 id l7-20020a056902072700b00dc74af08c6cmr195564ybt.6.1711630196104; Thu, 28
 Mar 2024 05:49:56 -0700 (PDT)
Date: Thu, 28 Mar 2024 12:49:47 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
Message-ID: <20240328124947.2107524-1-jackmanb@google.com>
Subject: [PATCH] Documentation: dev-tools: Add link to RV docs
From: Brendan Jackman <jackmanb@google.com>
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: corbet@lwn.net, jackmanb@google.com, bristot@kernel.org, 
	rostedt@goodmis.org
Content-Type: text/plain; charset="UTF-8"

I could not remember the name of this system and it's pretty hard to
find without the right keywords. I had to ask an LLM!

Drop a breadcrumb to help people find it in the future.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/dev-tools/testing-overview.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/dev-tools/testing-overview.rst b/Documentation/dev-tools/testing-overview.rst
index 0aaf6ea53608f..1619e5e5cc9c4 100644
--- a/Documentation/dev-tools/testing-overview.rst
+++ b/Documentation/dev-tools/testing-overview.rst
@@ -104,6 +104,8 @@ Some of these tools are listed below:
   KASAN and can be used in production. See Documentation/dev-tools/kfence.rst
 * lockdep is a locking correctness validator. See
   Documentation/locking/lockdep-design.rst
+* Runtime Verification (RV) supports checking specific behaviours for a given
+  subsystem. See Documentation/trace/rv/runtime-verification.rst
 * There are several other pieces of debug instrumentation in the kernel, many
   of which can be found in lib/Kconfig.debug
 
-- 
2.44.0.396.g6e790dbe36-goog

