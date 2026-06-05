Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A71632C8B
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 05:38:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780637912; cv=none; b=POmfxyrH/WW6BwYjj9TpqTvMvr1X6kf/057KQ2x9oS2QnXqDWrEzuxmdZytPExIWH3J5XHTfrV2MBaIGF5aSmh/5q+hEByzNq7x4sdW0wHSgn8MxZm8ZLHB/7lY65Jo2XNy/3gf3OEb0klphG1xpd8k2OrhBLie9SFKaSPa+X5Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780637912; c=relaxed/simple;
	bh=omxXcRhLTarwY5ijEqsNqiRJ3FXV9MDMzREAlyDpmcY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KetJMupaUSDsAW2B4XTliJRevPKZ35tbS7KStjRvgZqkABqCS85WKWZ4arMCwJxAvS3lEfPljI0hfNjKpqABIroKAwT1xkTo8YtOPLEX8S7jzopXUmjo0JQLkWc7oyFDyhlmo6N4jwg4nZGCMvlegLVduRan8tuTk3PhePU4+8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=QS/Q+/GT; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="QS/Q+/GT"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-137dd5161feso2383666c88.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Jun 2026 22:38:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1780637910; x=1781242710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=AkyrCHDR8ZxBywe0MseZNltUvihCFDRnjuof8TTEJ+s=;
        b=QS/Q+/GT7DgLJDyzIL1nDdtu+LLFuiIa62IXCWaA9FzW9hSzWi1VghP1I7HQCtHA5S
         tnm9M8zowGouNuu8ZqV/zCQ5rFOKrPwaha8AnrIziRgss1xLVB1kRijv2naP6Hk4yXDs
         OIaruiHBS6GYcMm5LafR58rkt7XSubHD09wyWUi24XSdQDPF50IRkzW6CdAR1C0+te0F
         wokpBB/6JLMjj6i2NxabufEvjqqWspxUj9LEfFso1eTeVjwcgt6f4edrOVViFYqTaYMo
         /0FKFhxjP3IVdeiPVbZ5MOiKC6esSQmbTsDPNiqm/sMX1ErvG6nTRn3jRSDLfi4uHGFp
         vJ8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780637910; x=1781242710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkyrCHDR8ZxBywe0MseZNltUvihCFDRnjuof8TTEJ+s=;
        b=YWMyYt/Cvs3zA/nRCxLyN1Jr+K3K6HN3Xhm+as8oMIH4k8Pd05OxquoFauvkqa2f3j
         7r1Eu9f+nlcoU7U3phCEGEQy5xhj8kTaz1cwIoR0NJaI1Ytv8VMlovVcrKlOKj9alNkW
         8Ax+d5V980aa5dLx21zpMsB5RiEwqUrGHArEGj2KPGQS1X5nhj4WCPnf5c1EgIhFNUnY
         Ssf9Nr3ztHJdtB6tnFWh5KMiXDTIomkAfb1QX/l0bWjWmbBSzDUivT8MUqy+t2a4adCA
         rZcXXmGKHVchd7RvK5mUlKFB4UCHWARq9BInU/WxYs5zvKRNCrJG+s0Y9a7G+QsPDbNF
         Cmig==
X-Forwarded-Encrypted: i=1; AFNElJ/CTZ+uKhtkdtnvM4moUCreRvz+WWCmsab+No7W3cnjNjznGSou1+Ma1qwwcNSep2OkFGasLl0suF0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzL/c1b7XDyUOjyjeVfnAEX5DPMut2Ke/9LbUuP1xo8xJYXosG5
	cIAFEj7a7QVQ3L6X41Gcbp9zjrygZicnHUmI0P8JS3xOTsxx6QntKrEAD+DgPtEW0TQ=
X-Gm-Gg: Acq92OE5E5T655xEpDFR99/mfkovCRU7Cw9RA3y8t9nWMWyJ4D/N2CZWGRCJBPE5gQq
	RnbyH+7ikIDJHs2SUtIjHZaTZRL2jnDQ8g1ZeFiunq1S8c3k9KA+fCT9k2pXGMC6bA8Al3lGfP6
	oqWkS9A3HSZF6MCKnzbBVv6zGY84B49GkNSYWq8+fFKSfPun/dWR3v2qxR1dEz1aesL9LgoHDbP
	1Ey1JSubdxyP/rDzxJCvcDD2dlOnMKe8U9I5+sS8oJkSkx+o1WDi6FIWqoDYB5gEZSipixjEGcS
	bYzgodmiEp13VTZDQ+LJ23++c7GckSMqCJvjctXmSL2npWSEHuaq42BU47HdxaxGU+jVUFA4dIe
	80iSYUT5HoIExhk/Ni7GC5T/AiSePblTzghc4dHikWa4TI2+g8u3pHJNCC4Jp/TihNRErEuua1R
	zoARdPFBmy40teZcxvCk/i+0Z7jCahhK/3c9Tmw5Xuv/7iw7r//s2KCUgwXgkwZikAeJYquY+4f
	uBkwtw=
X-Received: by 2002:a05:7300:cc0c:b0:304:5a9c:6452 with SMTP id 5a478bee46e88-3077b1d710bmr1050747eec.17.1780637910120;
        Thu, 04 Jun 2026 22:38:30 -0700 (PDT)
Received: from brighamcampbell.com ([2605:fb40:0:c09:9ca9:e0fd:b7cd:be76])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df9bbd4sm6178785eec.30.2026.06.04.22.38.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jun 2026 22:38:29 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: Thorsten Leemhuis <linux@leemhuis.info>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION REPORTING ISSUES),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH 1/1] docs: Fix minor grammatical error
Date: Thu,  4 Jun 2026 23:38:26 -0600
Message-ID: <20260605053826.7836-1-me@brighamcampbell.com>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor grammatical error in the admin guide docs.

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---

I happened across this minor mistake while investigating techniques to
use a partial kernel config to generate a complete config. If
maintainers that I don't send out minor fixes like this, please let me
know and I'll remember that for the future.

 Documentation/admin-guide/quickly-build-trimmed-linux.rst | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/Documentation/admin-guide/quickly-build-trimmed-linux.rst b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
index cb178e0a6208..194d22f56449 100644
--- a/Documentation/admin-guide/quickly-build-trimmed-linux.rst
+++ b/Documentation/admin-guide/quickly-build-trimmed-linux.rst
@@ -217,10 +217,10 @@ again.
 
    There is a catch: 'localmodconfig' is likely to disable kernel features you
    did not use since you booted your Linux -- like drivers for currently
-   disconnected peripherals or a virtualization software not haven't used yet.
-   You can reduce or nearly eliminate that risk with tricks the reference
-   section outlines; but when building a kernel just for quick testing purposes
-   it is often negligible if such features are missing. But you should keep that
+   disconnected peripherals or virtualization software not currently in use. You
+   can reduce or nearly eliminate that risk with tricks the reference section
+   outlines; but when building a kernel just for quick testing purposes it is
+   often negligible if such features are missing. But you should keep that
    aspect in mind when using a kernel built with this make target, as it might
    be the reason why something you only use occasionally stopped working.
 
-- 
2.54.0

