Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A1A520AF85
	for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 16:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736784286; cv=none; b=A8Ic6FKYIUPOseSHGBBryqlOIrHRafla9wxN/sL8y/tYw4yg0/SIwlitzMaTV0YrGLeI+4Xh2KKbuUlMpG+RAsEt6q/SY21iPsEJ4lIU34uU9RE9UwaqF1Vy9izyyg46Dy8KuNKqYfru8Dngc5UJ8Gs8RzEP9YgI7t3WsOgQkoE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736784286; c=relaxed/simple;
	bh=898AJi3XrEHjuykKfEu9B2Ef2aNDlj/0p6BNqdRz0q0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jNOZZkyLHutMzoh+rzUhoOcLHue1/LIbWqZ15ObrlIm0uc+dhDrPMMHiWdMV4OumV/mgv8Fp2r7CWsdPGXVEclaV4xsvhzEqmzT81U1RAUgOWXBPcajNFyXFrJvQ5oIEQRb6SnFcb1ssbUBfgAVbu3HFGcfXAul7qAYV/DM2ITY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jkOruu3K; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jkOruu3K"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-388d1f6f3b2so2098839f8f.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Jan 2025 08:04:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736784281; x=1737389081; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8iJsjt13iOc51/UXedpaSuh8SQXuFRCMoVOy4eFkEaY=;
        b=jkOruu3KqlqT7jpsuSztzLdO/RoHSiBtGCuCAZUR0Dbm3E/eQSGkH94PE9Sd6gFYS2
         0hkpMJnBpIh4CJ4qaNGue5YUaSimTohh25aTtXB4DOqKH3EwWZcsqOcTaoqZzqwcnGuI
         WzuQnq231j3tbpMfkhCvRxbnvrtEjglvWAVXoNGhI9qpgYSPi6kPHjERoP1v+AmGLTIM
         vF/P23+hdK7o1A+81PshO6o9kv9h+aH5pdVVjLjx1ztjvJrB/UqHNvh0IM9fOP2USXWm
         mtA5ECHqx+mFVSihLpnUFrCX5hOOSUenNWHyk6xKB5zppDkOy52MAj85GoHU4mOwGxEb
         B07A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736784281; x=1737389081;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8iJsjt13iOc51/UXedpaSuh8SQXuFRCMoVOy4eFkEaY=;
        b=L7Ou9aUJXOQWYXIKESy41h8Ve4R502cZSyjDlr86ZgALoNf0wbD9+bONwcMa1iCOoj
         +hb50700JYPkTVeklx+EGriS9BMAHXmdMdz2YsTXy6Rtc11gKTsbnOgXfBdPHf1fH9ST
         xAEvD7gi8tLjboQazp7YcL4HCQ9st8id5uzANvz7ormvD6egfrWamRCLmRxjtP53+Oyz
         smqlEdjG5ShEfP30qzY9iPdP2XMZ9NTR8AAOWnsiyUHZv4IyAn17DSSqXndrdEJsxFXB
         v5N1SGxVVR/utbDiDPNe5YAYkpo+4pGVRY1HlYt7S4usrBed+rtfK3/yG1uvVDpuGuJQ
         0wTQ==
X-Forwarded-Encrypted: i=1; AJvYcCXCpeCInrY8Hl1mLADNtJRUB46NkTZSmwkXrOZxPyfZ9aC+NrXlfltqJR04ki0QpkqFusm8oAq7a9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq4C//MWfq8X240eiJRcxXN8kqTQE425bEUOMx3ohd3AoIPlPm
	vLFbUEBvWtm+w0ghfnGGtDXD5pnz0Geb0WItWv+Nv9P/J3+Kd6/rUkcWCZBz8K8vLyNLRb02CSQ
	JWDVmO5TKXA==
X-Google-Smtp-Source: AGHT+IH8/v9AOfqbaB+ul74RwUnP2y2VXUgVGbH+j4c+1CzZN8TUArYCxCFU+cwMJLC/Yo+TCWKG3KPZcq5Y1A==
X-Received: from wrbee8.prod.google.com ([2002:a05:6000:2108:b0:38b:d7a4:7ee])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:6d03:0:b0:385:e3b8:f331 with SMTP id ffacd0b85a97d-38a873035c5mr19303672f8f.14.1736784281542;
 Mon, 13 Jan 2025 08:04:41 -0800 (PST)
Date: Mon, 13 Jan 2025 16:04:23 +0000
In-Reply-To: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250113-checkpatch-ignore-v1-0-63a7a740f568@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250113-checkpatch-ignore-v1-2-63a7a740f568@google.com>
Subject: [PATCH 2/2] docs: checkpatch: Document Checkpatch-ignore patch footer
From: Brendan Jackman <jackmanb@google.com>
To: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, 
	Dwaipayan Ray <dwaipayanray1@gmail.com>, Lukas Bulwahn <lukas.bulwahn@gmail.com>, 
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-kernel@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

If included in patch descriptions, this will function much like the
--ignore flag.

Checkpatch-ignore: EMAIL_SUBJECT

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 Documentation/dev-tools/checkpatch.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/dev-tools/checkpatch.rst b/Documentation/dev-tools/checkpatch.rst
index abb3ff6820766ee0c29112b256bcc44ce41fffba..b1d5616c72029d3d8c8c236cd8d05bb839018c0a 100644
--- a/Documentation/dev-tools/checkpatch.rst
+++ b/Documentation/dev-tools/checkpatch.rst
@@ -10,8 +10,12 @@ also be run on file contexts and without the kernel tree.
 
 Checkpatch is not always right. Your judgement takes precedence over checkpatch
 messages.  If your code looks better with the violations, then its probably
-best left alone.
+best left alone.  If you do that, consider adding the Checkpatch-ignore patch
+footer to record this decision.
 
+For example::
+
+  Checkpatch-ignore: EMAIL_SUBJECT,MACRO_ARG_REUSE
 
 Options
 =======
@@ -114,6 +118,9 @@ Available options:
 
    Checkpatch will not emit messages for the specified types.
 
+   Note that violations can also be permanently disabled using the
+   Checkpatch-ignore patch footer.
+
    Example::
 
      ./scripts/checkpatch.pl mypatch.patch --ignore EMAIL_SUBJECT,BRACES

-- 
2.47.1.613.gc27f4b7a9f-goog

