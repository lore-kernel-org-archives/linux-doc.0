Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA10265CA6
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 19:46:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765223208; cv=none; b=spCnfRwcj6MOwRgkAilpMA3umjncAMlTOmJOTQxcIgz2lKja5zwiDztNr0bLNmvkstozMeJbBnHnp8pi5YCCRBQyFNsxJRbCJLjKl+sVZ3+OD1rQdXDJ5zgus0+pRUV23ZUDUomNQKUBe3kWnnKpVYsIzv2MsN/qhWRyPswpSr4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765223208; c=relaxed/simple;
	bh=RPoGr+9A2+rIHx20KA2TejeY0k3/2wXD4q7kC+Bh9gw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Liwg7U34f8l5/kQuxKUbaSNbJRijK7SV1Fm56USKrjSgcqS+utdObqkxuGEvBu6cYQ7UqqMeTVNBxg9xD6z9sNAsMyfm3kUrtEu/ro7tPjz2R106GsX3lTdiQ9/mzVBv6pOwTPbNg0sWg/FiGkZ9gZ5IPArcrRMBVGeVc1dOwr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AwcUZZXw; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AwcUZZXw"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-297fbfb4e53so84311375ad.1
        for <linux-doc@vger.kernel.org>; Mon, 08 Dec 2025 11:46:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765223207; x=1765828007; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=piKmnceqcwJ5cuCuZyIK6mal5oPKlxWLME64d5q7Y24=;
        b=AwcUZZXwvCfVZY5C2zTMPclFy64rft17Yd/66c8Zm64bPqphIBku0pKkx9QAKN0m4M
         eiMowoNEls9n6kgUR3QldXGN81zkIOlDNDEnyMVUONHBWIhUJ0+UPLWtqbGlUXOZKuU7
         iniPZ9+7SSm2oPvUugdOoQ+CxQhQVyOQuydpdmXo4be3FYKLrpR9dPbXmhiDLb19v2VT
         r8F/tpJy3mUxk+puTgwlIMXruSLy8VNXZSpwmpK55CrjN7XAkzkDvSQl8wk7VXQsEIdX
         Ux9sw0ZFjnxZBLAgEltjeaz5IHZ+Gl51W4JF09bHru2Iat0QvKi1Lg2dP/yrGP9QQjcl
         RPFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765223207; x=1765828007;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=piKmnceqcwJ5cuCuZyIK6mal5oPKlxWLME64d5q7Y24=;
        b=DFVG4hfMCRfho/2Expyy9MnGnGI/RbN2Lpzejld819E74JRNMjLMCrHcAMfU9NfBDE
         zLxEK5onMVsAsGAOPDV2VTDCsaCFWjZfZLNg+4WMci+4dtzC5mIDIfCLd6FjmtsoqeHi
         YFAqOLrbUcTP4tyIh3FFoaP4Pm39TPcBf4uPmHOQvNIvxOf/VrOu/VqQH+P1BjEgS7Rf
         ME66HXPjoShbwPIA0fJF399myQSe6r0upgKZj/6PnJ2LJOkk5jS7l9Bt1KlxQuyn4zWD
         LOPoJbMaJefTjbfwd++N1eY9E0a436YiM8zKRNAIXu8Vtg/0WS/iravIedNDuDRSwYHz
         72iQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrjvtgNE0e3CCk8cFFq0sl/YCv8XuQKQ3bNrgZJ1cArhv5/OZ1YyBcyilxtx65Tdc/OP/Y9ubgJ6c=@vger.kernel.org
X-Gm-Message-State: AOJu0YzluyBPLIk9UCNeWfvggnxcs7WxrLCzzFtSRyOPfDffMfbJS3+P
	o+dJYHppqviMsJoXFuqXC2RhxGtN1orHQAYlyZjQm9ImVJJ2vPzP8DuKXs09Y86IhVpjcuhRwBU
	ySPqplCpPCaQCRQ==
X-Google-Smtp-Source: AGHT+IEIQ30RmzfMkpZyM0NW19xbotm6YoUdQOw/EYfL4U9SGRYQYw7BI+NT9KkRbTFuZId3wWWSXqnJ5z82HQ==
X-Received: from dlj33.prod.google.com ([2002:a05:7022:521:b0:11a:1004:5049])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7022:2225:b0:119:e56b:98b8 with SMTP id a92af1059eb24-11e032a9d66mr7280652c88.31.1765223206618;
 Mon, 08 Dec 2025 11:46:46 -0800 (PST)
Date: Mon,  8 Dec 2025 11:46:19 -0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.52.0.223.gf5cc29aaa4-goog
Message-ID: <20251208194619.1745453-1-wusamuel@google.com>
Subject: [PATCH v1] Documentation/perf: Fix typo in dsu_pmu sysfs path
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Correct a typo in the documented sysfs path for the ARM DynamIQ Shared
Unit (DSU) PMU. The `event_sources` directory name was singularized to
`event_source` to match the name defined in `kernel/events/core.c`.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/admin-guide/perf/arm_dsu_pmu.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/perf/arm_dsu_pmu.rst b/Documentation/admin-guide/perf/arm_dsu_pmu.rst
index 7fd34db75d13..ac43343d4882 100644
--- a/Documentation/admin-guide/perf/arm_dsu_pmu.rst
+++ b/Documentation/admin-guide/perf/arm_dsu_pmu.rst
@@ -16,7 +16,7 @@ registers. There is no way for the driver to determine if the other events
 are available or not. Hence the driver exposes only those events advertised
 by the DSU, in "events" directory under::
 
-  /sys/bus/event_sources/devices/arm_dsu_<N>/
+  /sys/bus/event_source/devices/arm_dsu_<N>/
 
 The user should refer to the TRM of the product to figure out the supported events
 and use the raw event code for the unlisted events.
-- 
2.52.0.223.gf5cc29aaa4-goog

