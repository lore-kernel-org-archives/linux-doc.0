Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C07C632A3DA
	for <linux-doc@vger.kernel.org>; Thu,  3 Sep 2026 02:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788404046; cv=none; b=ITRiHVmL8GYW9plfPQF0VoMAGY6BCA0iiXxFRtCb2VllTGLMx3dlciFNxWNQ+R7Rbzra4X1/0Nk5ZIumMNv5+1OTlnJVQAMaPYOgZHf+e2sxCxPMgYb3r1WSC7vV9IEz/iT7P8DZVXNqTKEC50e4RzWhDqpvDn2FIf6hqdxfXdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788404046; c=relaxed/simple;
	bh=aiHnBTzn4LSsZgBjJK6hlwcyNiRzkQ8Jvxhrngb3+7E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=o4ERl/oot/DfmN8fmJR4FThKEfPbdV416ySUo6VIBlOXWgqkzjZgOQQibZBTmdM5/zGEsW/7/HN/FbC0RFgbQ1hTWsc43Kxs3kZ5uqV4JppfXPx+gxCB2Izb551lxxCIZAdaUhCOgknAZiSbGEAEr1Gt36YUAd11KW8lz/PVlhI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Kxjjsn1A; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Kxjjsn1A"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-499f6e0bbabso1184593b6e.0
        for <linux-doc@vger.kernel.org>; Wed, 02 Sep 2026 19:54:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788404043; x=1789008843; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OjDl1z3rUoDmRCi/Ls7KLepbD5M0zU+LwTLRi8pr4mk=;
        b=Kxjjsn1Ae5oX9dujUugcpi2IY9t9pAt1M/LDC5jOHhAZmRkoxVhNUTyCj6JS5Vgdt4
         zFfqkOK4BrH5vAS49ZOnHvaFMVNcTmQDcL2m9P2hEidU91+NdW6ktpz8ygQmvqXZ4dNl
         0KSMCV6Ug+lIxjxpRHrsHM9BxtlWE6tgCydvdR6zpCP6lPOnVpjqtmBZ/A/3JEfJw6aO
         SNGHs65OskFfLbUT7j41uyjweeocu8sO45B/qWpZJHA+EgBSp9XiH3O7jCaA6JdVYB89
         zLc3sDEhXXCFrsQH56MYxvfw1OIlZ+s1/p/GnQQJb46Trh71bZKLxvuHqClb1EhjxQ61
         Mqzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788404043; x=1789008843;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OjDl1z3rUoDmRCi/Ls7KLepbD5M0zU+LwTLRi8pr4mk=;
        b=Z4hsPnKLWk5zuqqsZiA6xEmCalgTMXvDKPL4fhVbCIN9kYmsKh6wv1mLKBcGVP52M6
         dUPMqRU5QHh5gEgUKaGSKINjs8BUVxA2rqF7uDQ7R5TJiy2orqUtNetjRznhILWfZDR3
         XCxqiVCH/fRs44nvwzZARE5rP6752XiQX+TjiXkT516B/gs81XxDHQDP2J1hpv/RhKb1
         4fkHx56JsVezx3mxykAJXjUc6ZlfjzAEZBXvu3BfpZlja/rcB5javziHNqglEZEzINFW
         KdBe78Ib4xif450WtdLhYn0bzE8kifWA0jdQxOMltmpxYA9A2pA29VwW721d0gZmfUQz
         je8w==
X-Gm-Message-State: AFuF++lXVVqnIWTY2Cg+62+JGW7lTB5PvlaVP3bjQZkIyeZLOpqhqxDl
	6NdvM8wca/LfPqP2lLHmSgYW/xxlInxU5ZPV/nXsxuc7djQnTYhw9AK5uy5fGw==
X-Gm-Gg: AYBFou26ZsRfV3Xc3OnranZwZdhe8jovZfr6/6Eoz0zVE+jJ1ybajrxQaUBeleig7XI
	eurXW6joR+mjSAjCDRkR2GP/RLQ4mKT/aC+C/jbBnlVDDxtwOwPHsMbigJCsV5RlCmm4vEGegiY
	9xV0YJD0Frw56tVcYYKPmjjTp0/NnGdoxdpreBoS4gSVP6qnMhA68TOo4WqKxrgcWNpsCx9V2Vl
	t+G8oclXXdz8l9Az6NTDhNJN12o79Ns32PxuWE35X4FVnNWGpo3JajItwCr+9oT5EyMstBiXjH9
	Zuky4dEHDAwo83n27GgObHY66btPCKlLJSiqynofcNYS1A0CgNAzV0amUvLKrGWtnpu0X0DLn04
	fR1EHoRk6HDUU9jv2N4xq7hm6V7ZcQrIHeXLp0OcRr43AEyw/Iqk5J0KiHm0ndD8bXyQNGRFRbj
	ATKTw+6RoNb7gq+ntZc9Mh2lc+kXGl8RUwWnLCDBcBkaAaIiHkgdjUkXZGn68GYUKxT5UIzW4uA
	Q==
X-Received: by 2002:a05:6808:4483:b0:4a4:933:b20f with SMTP id 5614622812f47-4b6bcd86805mr8728713b6e.7.1788404043512;
        Wed, 02 Sep 2026 19:54:03 -0700 (PDT)
Received: from cachyos-x8664 ([177.245.224.138])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4b69b820671sm3477672b6e.15.2026.09.02.19.54.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Sep 2026 19:54:02 -0700 (PDT)
From: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org
Subject: [PATCH] Documentation: arm: nwfpe: update stale document references
Date: Wed,  2 Sep 2026 20:53:34 -0600
Message-ID: <20260903025334.44666-1-diegomancera.dev@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The NetWinder FPE introduction still refers to README.FPE and TODO,
which were renamed to netwinder-fpe.rst and todo.rst when the
documentation was converted to reStructuredText.

Replace the stale filenames with links to the current documents and fix
the accompanying grammar.

Signed-off-by: Diego Fernando Mancera Gomez <diegomancera.dev@gmail.com>
---
 Documentation/arch/arm/nwfpe/nwfpe.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/arch/arm/nwfpe/nwfpe.rst b/Documentation/arch/arm/nwfpe/nwfpe.rst
index 35cd90dacbff..b6ef46ff0f4a 100644
--- a/Documentation/arch/arm/nwfpe/nwfpe.rst
+++ b/Documentation/arch/arm/nwfpe/nwfpe.rst
@@ -33,9 +33,9 @@ double precision and extended double precision formats.  The port of
 SoftFloat to the ARM was done by Phil Blundell, based on an earlier
 port of SoftFloat version 1 by Neil Carson for NetBSD/arm32.
 
-The file README.FPE contains a description of what has been implemented
-so far in the emulator.  The file TODO contains a information on what
-remains to be done, and other ideas for the emulator.
+The :doc:`netwinder-fpe` document contains a description of what has been
+implemented so far in the emulator.  The :doc:`todo` document contains
+information on what remains to be done, and other ideas for the emulator.
 
 Bug reports, comments, suggestions should be directed to me at
 <scottb@netwinder.org>.  General reports of "this program doesn't
-- 
2.55.0

