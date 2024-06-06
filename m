Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3463113AA4C
	for <linux-doc@vger.kernel.org>; Thu,  6 Jun 2024 06:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717656211; cv=none; b=Hgw4qde8BrnT987+JprDYAoaqJhKsCtNhw3YrBZmahh0IOB3jTwk78kegYRdr5NleOjAszTh/M4dcvsKD3Vu48tbC6sTQeefo2HNNh4eshzdKFZ0KPCmMSWk3s2xN7tT9FEylLdxgGvxV9Buxi5MHxmE07Ddaat0eBDpJbf+s/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717656211; c=relaxed/simple;
	bh=lUTwQmTkXSAak3oROEANOq70038+HQrsZbNaSYQ2QYc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=umF+K/g2KauddTkztp51VU9/qoxT3LN1R/JnBTueSXdAHNXmk0LAndId/LAGjIrVEZOLw9UoT128kQXoUtFe+xmBSMKvGE3obJxeSTAp1LhFt1HF3EL4X7OQ4InkS3iVEKzS/qS0Lx6bJLuR+H/clz8vC9X/c0fGa/6KOutZNX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JbJg1HQC; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JbJg1HQC"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-2eaccc097e2so6054801fa.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Jun 2024 23:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1717656207; x=1718261007; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=omfvRqkaBys+keRVcCwWZsFLAUvdCTBnb4DeOzbHfX4=;
        b=JbJg1HQCh2aIquqEsg6HggZcyaY22fGmRrHencI4b9o9Ft6B6I/LpPumOX7WJWaShV
         90raB0HlZnb3aQIZWTtHLxrP16Yt3w4UgrHlEFdvvO4xbLRBI1q487B67h1xsnp0QeGX
         WX6Pd8szP/g3kaUjl9PcxbTNkVEI3HaFz6u/hcUDJ099VLAD75aSuhaxIemkmYxN+FyS
         PIiDKhjP6Mw0exWrhoBvOtv9bQWgONMJgqKxUnFEbDgh6uhAip4GqRmRB3nEG46JvfLM
         9eyvOeC9d6lZCp381zSQquyUkgzKJ4tnaowfzf8euWMTCAW6OhTgCHkNuF4iCCt5XX5c
         ZxAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717656207; x=1718261007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=omfvRqkaBys+keRVcCwWZsFLAUvdCTBnb4DeOzbHfX4=;
        b=MlsvhXaxOnQhKgbpZPVNHdp9tKKaLG1Yc3X9QYco/nb8ltOYB8jkYYzOUZBsTKHlvI
         UjHIzIihNsK1qjMCdiNyNcgyj0K6zaieqbuR2uVmarcH+iFRZdt/7/EsF7s5PsuboN/x
         mV4hF/ps9txGq7IKO/BU+cdq7cyTaZvM/AIuGTv/jfaxxiEmxMPhcmSpqADihgavsf8T
         eeS/c+8wWiTpMPHRhDz+fWfEQ2/E8hvQk8HyRWl8POV8A8V3v93TEXhhf0zI+EkPABas
         bGbBxxP5JmX/LsVZhaBEiN78WoVKWJFhuf4Tv4kdpIIf5RFtT5bdqp2L5+5SYcyrl/22
         xM7w==
X-Gm-Message-State: AOJu0YzYEtRJNShZLilELwRKwNrpmcZ9Jky1qp9WJ7no5pSSeK3vy8P0
	XRh/zmPcaR+ZrRH+qM4TT17fQAl4/Srw10PDvCtx3W0NJOE6CLE1VeuCYAupW9I9hIBwwD3ni40
	F
X-Google-Smtp-Source: AGHT+IEGA59Ld7fxgXUJDzsTcNIscMWvDgsppmsiO4nhCip7lnZ+ctEKacwPIC1ddr/EL9VC/D6TNw==
X-Received: by 2002:a2e:9888:0:b0:2ea:cd94:60f9 with SMTP id 38308e7fff4ca-2eacd9461edmr14568641fa.51.1717656207292;
        Wed, 05 Jun 2024 23:43:27 -0700 (PDT)
Received: from localhost ([2401:e180:8882:8af3:26fa:edbd:5679:640c])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6de28957153sm499471a12.91.2024.06.05.23.43.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jun 2024 23:43:26 -0700 (PDT)
From: Shung-Hsi Yu <shung-hsi.yu@suse.com>
To: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sasha Levin <sashal@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	stable@vger.kernel.org,
	workflows@vger.kernel.org,
	Shung-Hsi Yu <shung-hsi.yu@suse.com>
Subject: [PATCH 2/2] docs: stable-kernel-rules: remind reader about DCO
Date: Thu,  6 Jun 2024 14:43:09 +0800
Message-ID: <20240606064311.18678-2-shung-hsi.yu@suse.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240606064311.18678-1-shung-hsi.yu@suse.com>
References: <20240606064311.18678-1-shung-hsi.yu@suse.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When sending patch authored by someone else to stable, it is quite easy for
the sender to forget adding the Developer's Certification of Origin (DCO,
i.e. Signed-off-by). Mention DCO explicilty so senders are less likely to
forget to do so and cause another round-trip.

Add a label in submitting-patches.rst so we can directly link to the DCO
section.

Link: https://lore.kernel.org/stable/2024051500-underage-unfixed-5d28@gregkh/
Signed-off-by: Shung-Hsi Yu <shung-hsi.yu@suse.com>
---
 Documentation/process/stable-kernel-rules.rst | 4 ++++
 Documentation/process/submitting-patches.rst  | 1 +
 2 files changed, 5 insertions(+)

diff --git a/Documentation/process/stable-kernel-rules.rst b/Documentation/process/stable-kernel-rules.rst
index daa542988095..a8fecc5f681c 100644
--- a/Documentation/process/stable-kernel-rules.rst
+++ b/Documentation/process/stable-kernel-rules.rst
@@ -168,6 +168,10 @@ If the submitted patch deviates from the original upstream patch (for example
 because it had to be adjusted for the older API), this must be very clearly
 documented and justified in the patch description.
 
+Be sure to also include a :ref:`Developer's Certificate of Origin
+<sign_your_work>` (i.e. ``Signed-off-by``) when sending patches that you did
+not author yourself.
+
 
 Following the submission
 ------------------------
diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 66029999b587..98f1c8d8b429 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -394,6 +394,7 @@ e-mail discussions.
 
 ``git send-email`` will do this for you automatically.
 
+.. _sign_your_work:
 
 Sign your work - the Developer's Certificate of Origin
 ------------------------------------------------------
-- 
2.45.1

