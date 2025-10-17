Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DCD6233155
	for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 20:37:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760733465; cv=none; b=IQB7omFTbgPH84e6Z/8VFh47JQ6lWBK6We75FedHaTV6PYDGA2+pMZfMhKzTxowYHS54lm8ajTCVNwyVpwmKRx3Hw6p+3DYRbuAsoW/usK3iSjBbdnafDp3FeW3ackwdoOUhw5TKKzyN/SgvgGBLYiJrbAfUeaTlYd7IoeGXpvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760733465; c=relaxed/simple;
	bh=MctnxTuATai4l54nWLFKFelAF8yZCCN6uTLE/mlmEHc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DmWkSD+PlZTpzE/BL3wOCapHpv83FP79kscUVlcxB6lI7QQwpHWKFYm1M6/TRi8klxYC3ZppRO9ZPdkVJ7pdhpWTl1lwAd3yV8XuJqq/ODzvmyZXaX29GrLRvo/qufJv64J0cga82c1c1R9LUBRtG8wQo8U3xC6B9dSE3Wf7PUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gqI4ABPY; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gqI4ABPY"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-789fb76b466so2173053b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Oct 2025 13:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1760733462; x=1761338262; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6ZeBq3Lk7BVfi39KwhzSp3L/wgMnqHyapiXXWG829qc=;
        b=gqI4ABPYZ4QxRCc4QY3quTX9wWdAeBGRG4f2PXIHFN3czNr438NrTWUk8dW6xUs91Z
         IqDmV28cJc8njMpB0h5e6xXleESDsYjrODmGS6FduS67qsKnILcQCObgOz6J5Q0PJ0SZ
         U1p4pUfI6fQq4zt1eEvwMffrKUtyF1tfAfGDs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760733462; x=1761338262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6ZeBq3Lk7BVfi39KwhzSp3L/wgMnqHyapiXXWG829qc=;
        b=o5bIlwLWVn6kcGhGf9ggZpQHAmjyRP5vY/NYY9UYQvq9cqETYGsAWLAGLHg8KyE/26
         0bEzNriwOFMcfdT3VjkpJftghdyR/OoQr42YTTj8QZ/WHm//eciMJ9yD/k6fW8x3t0Ed
         +rXXtEiIwtpPfHXPefEaDSOa4kgEFZWxmys2kjB9e0I4bVaSjmmcgsy6GZriMGw8ka6E
         sEUdcVGf99pZBFyvwiN3oTBzpCqtzRPXtEupKu69j95q/pr1//L6gsboctFJxYuK2pxh
         zDVnDqlcIXdYGa6DmASMRKElP/9MEbPOv2mZSWQtcu3bLJFcAkNpnsN08ft9Q0b+1BcW
         Yzng==
X-Gm-Message-State: AOJu0YyPmqX6rYC2iqTAvpB2TwidmF+F0u9l4XDTPo6qHXIqI9RYs5y7
	L+5sNkSrJhvn5ZSWho+R/vqOgJR4fgyr2Mba/vyREu3wuE1f5lR5RrWVrzyU0Krt1A==
X-Gm-Gg: ASbGnctptsQVIpViRA0zzX6NObMnF/kcjMFSkT1IKFvxbuynVQxNb76WS3BJ+L6w3Ki
	7fIAxeGmSutdlxv1HdIE9Pl9gVhkDE4HfDv0sWG+sNcWpz/OcJxKePv2Q2LSgkW6Q+FwlrNf2ss
	1fYi4jDdBeItpQHwkOz3yZ65s5we6hLQTgRhAebYFruhO8yJ0KeUBg6Zpwamkebdsn0P//71/FT
	Onz3MRIH8AkV+9jgkyVtyOFSM9b96jLGKeLPOSHQ92kiBcyBIbdhbLfmhvvRtP3Rk/lyAR3dJo0
	be5YD71eUqGGW6rb32n1HNZqC99dY4LRecDuOnlc3rAKV3B9RescvD9qoJEL5mz9ohi7D5eKVz3
	UQxps38SY4sYY1lW9DrtC+loMxt0sxUbTPmO+A1WHnw0TZsccVEb9kmEhVhtpzvGHLRqtLrMLyI
	+f2xUpshb4aw8t75ejh0FRetF928al1KvN7I3g6A==
X-Google-Smtp-Source: AGHT+IE/YYS3o1+JuvtET9j/q+byOk9MK+q6kmDUXS3KntYy67SnJd6kX1S96rUUu+Rtdegc54AW9Q==
X-Received: by 2002:a05:6a20:2590:b0:334:9fbb:35c3 with SMTP id adf61e73a8af0-334a862167fmr6473965637.46.1760733462564;
        Fri, 17 Oct 2025 13:37:42 -0700 (PDT)
Received: from localhost ([2a00:79e0:2e7c:8:5ca9:a8d0:7547:32c6])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-33bb65268b1sm2837858a91.2.2025.10.17.13.37.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 17 Oct 2025 13:37:41 -0700 (PDT)
From: Brian Norris <briannorris@chromium.org>
To: Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Joe Perches <joe@perches.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	workflows@vger.kernel.org,
	Brian Norris <briannorris@chromium.org>
Subject: [PATCH v2 2/2] docs: checkpatch: Drop networking comment style
Date: Fri, 17 Oct 2025 13:37:12 -0700
Message-ID: <20251017203719.1554224-2-briannorris@chromium.org>
X-Mailer: git-send-email 2.51.0.858.gf9c4a03a3a-goog
In-Reply-To: <20251017203719.1554224-1-briannorris@chromium.org>
References: <20251017203719.1554224-1-briannorris@chromium.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Networking no longer has their own comment style, and checkpatch no
longer checks for this.

Signed-off-by: Brian Norris <briannorris@chromium.org>
Suggested-by: Randy Dunlap <rdunlap@infradead.org>
---

Changes in v2:
 * new in v2

 Documentation/dev-tools/checkpatch.rst | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index d7fe023b3080..dfaad0a279ff 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -465,13 +465,6 @@ Comments
        * for multi line comments.
        */
 
-    The networking comment style is a bit different, with the first line
-    not empty like the former::
-
-      /* This is the preferred comment style
-       * for files in net/ and drivers/net/
-       */
-
     See: https://www.kernel.org/doc/html/latest/process/coding-style.html#commenting
 
   **C99_COMMENTS**
-- 
2.51.0.858.gf9c4a03a3a-goog

