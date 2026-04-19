Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4379372680
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 04:11:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776571918; cv=none; b=DW2X7+Zd2bsewSbpxSW7IewTp4LeEaCZEvQc67aJ+fh2kdlNihFFNE2vaXdryeSMz/MTOfByXRBVyXrHYpwxSi683U71XVPMgUGla4VoZ4h8DWNVK2dT9hvJXSFIMxP2JMEWWhvzeJOSVfCNG5sXR2/SizjOpC7XKpL2GSVlbvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776571918; c=relaxed/simple;
	bh=vOgkCAJEOBJpW+DNT3lDCOCb/13wAHR1oE/eova4bHk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MHms1L5eYO8RZGL2mg0axKkwMsg2jw+HyCptF7tifHvP1eiIANV7TuUWvQ8ts9g1e99MAtNaMMcKxzupRMvu7fXJrN4iWyu0doETpWSbLCeE48e86ubTSdLJ6/hiibk1rkUFsjk/RQZ+f13uTy4i+Znixo1PXjfwA4TzUhNPMXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D3aWPneB; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D3aWPneB"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8d560ede296so222304085a.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 21:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776571916; x=1777176716; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/hH3x1N0+NvSvzMccwee+vm7y2aHZ5XliR6CKhRwp+o=;
        b=D3aWPneBtbnuA8cX4c+oj928uQCxHpMXRo8QltW1GOBDQX1sIlaRnMTLRXZnJSVbj7
         qb+AYTJG52FOyDxbOt874Ax0/GowwFk4w5RqXZr0iwqG1WIZhlq0gnemNbtft7gNvpWq
         O4p4sB9nOgLsfadneGUgww6pzLDH4J6MYspTTdhwJH24Mi1KLRO2/S1CSIC6gVGCGgGY
         CtuHBOD2X2oxDjqi6FfBkB7B1Py0BhjQ1H+ImDO3Y/DCaHEAgK/STv8ECVdijWNYzo8e
         UIJe44bBCRBLbDkPt8twVoOqSwVPWNeRo96Juhjd2Jpcj1L0uEAQlLPcB3j5TQH/9Cy7
         HH0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776571916; x=1777176716;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=/hH3x1N0+NvSvzMccwee+vm7y2aHZ5XliR6CKhRwp+o=;
        b=lWHNMO/HRVf+f/3m/g7wsSv726L9qpElySR4hhp2kheo2OYwtRWbJ04FQRPvFToHLZ
         mvt/a60UiXHXZ9D7GnZCW0bKXtXgrBPjpE7Z1phl5PWMXftJ8K9rzyyMQZ+sPRS0vmXl
         kGdhKRFxfBlUuQEpMAwd78YeuZDC2MsOrUicXZ2j5e7lv2LZ+r+0G4hJWTFxI0oq+nDI
         AkCNYGIDMaYwYZJ1ZAGNqjyjTUwpe8IKeA1weC7yah+30zcXPdpctKBtXFopfOIKi2sa
         Cc1fYf9kDIuUWFemUymeGEReWH5y+IDcpeE7tVfLmU2RGrlDKQxT6hj7BqxbIOL5Jngx
         bEbw==
X-Gm-Message-State: AOJu0Yx4x4HUrYRcH8MDLesLRPT1izp3sOgTQEpGmK7w5SvC4ZpQIXup
	VYY9JW1WIqvVElkhpUFCTUdZM6l217aTY24tLccN/vy8OgdJYjNo9LOx
X-Gm-Gg: AeBDieusMZUzYeBbiZd0hiBWX9pYzKDtBbXIJ2/emJA51q6NnWVf4xbPa2xqLAVfvoh
	KSFBUuDQXve8TcteRjzaGs/Ff+bx2YKzu1TUTb4F9S4l/qV0D8gVZu57VYkkCGPZg3Tx+/Qfg6d
	8wISKwEBEfeVBqz6PpubEDXI234vvyKuftHDrvp8OBeZxqu6d/dUxu0ugjF6DkLDuME5qxvhnte
	8PlI1pB5Oh4XXhIJJbu4dB9g2Z4xcpuVC1omkcZFJcFPGU3LILKhGCQXhRK20Y2gyvlnOOhinPw
	R/rErptlVJgQ535bDrkab9MMXuGRTV8E3ptNXuxzdLL7psdhXsYGY85WROoxkM3zksQymomRKF6
	s7qis1/bBWF9q6C8jXNYcpm9dj8W7ukKUT1xijRBxJMfa5nOP3m3um/brnVIWgiPB7RhDWEkZ6h
	z7RCe4A9n6uJtyqPsTEH8jabxL0UjRHejqZbvRpGa2asflE4KRZhd2
X-Received: by 2002:a05:620a:460c:b0:8cf:d5ca:ade0 with SMTP id af79cd13be357-8e78c4c2997mr1287310885a.0.1776571915848;
        Sat, 18 Apr 2026 21:11:55 -0700 (PDT)
Received: from inky.localdomain ([2607:fb91:4c8b:380b:91a:9dec:26e7:3d7e])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d5fe98dcsm508388385a.7.2026.04.18.21.11.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 21:11:54 -0700 (PDT)
From: Charlie Jenkins <thecharlesjenkins@gmail.com>
Date: Sun, 19 Apr 2026 00:11:02 -0400
Subject: [PATCH 1/2] Documentation/binfmt-misc.rst: Include AT_FLAGS info
 in "P" flag description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260419-binfmt_misc_doc_update_p-v1-1-757c12f33cc2@gmail.com>
References: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
In-Reply-To: <20260419-binfmt_misc_doc_update_p-v1-0-757c12f33cc2@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, Charlie Jenkins <thecharlesjenkins@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776571911; l=1743;
 i=thecharlesjenkins@gmail.com; s=2026030; h=from:subject:message-id;
 bh=vOgkCAJEOBJpW+DNT3lDCOCb/13wAHR1oE/eova4bHk=;
 b=GdILJXyDkjiPFT06nt9j3mMJGZ8zJPsIeTbirlG4obzfAKTqWK8KcylOBCw3+aIEDbtyJ7ffN
 4W6attiNsIsBEdwSllepGqZDhmthEzFSz+stS7BB7ND+q4wmE5nXwcy
X-Developer-Key: i=thecharlesjenkins@gmail.com; a=ed25519;
 pk=vpF2USrG+aB6CTbSt34rzJKsAVe/l+GAXo1IomCMETk=

Commit 2347961b11d4 ("binfmt_misc: pass binfmt_misc flags to the
interpreter") added a bit to AT_FLAGS in the aux vector to notify an
interpreter that the 'P' flag was set in binfmt-misc. Clarify that the
interpreter is able to be aware of the 'P' flag by using this bit.

Signed-off-by: Charlie Jenkins <thecharlesjenkins@gmail.com>
---
 Documentation/admin-guide/binfmt-misc.rst | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/binfmt-misc.rst b/Documentation/admin-guide/binfmt-misc.rst
index 59cd902e3549..2e2be2922ba6 100644
--- a/Documentation/admin-guide/binfmt-misc.rst
+++ b/Documentation/admin-guide/binfmt-misc.rst
@@ -61,9 +61,11 @@ Here is what the fields mean:
             vector for this purpose, thus preserving the original ``argv[0]``.
             e.g. If your interp is set to ``/bin/foo`` and you run ``blah``
             (which is in ``/usr/local/bin``), then the kernel will execute
-            ``/bin/foo`` with ``argv[]`` set to ``["/bin/foo", "/usr/local/bin/blah", "blah"]``.  The interp has to be aware of this so it can
-            execute ``/usr/local/bin/blah``
-            with ``argv[]`` set to ``["blah"]``.
+            ``/bin/foo`` with ``argv[]`` set to ``["/bin/foo",
+            "/usr/local/bin/blah", "blah"]``.  The interp can be aware of this
+            by checking if bit 0 in AT_FLAGS in the auxilary vector is set to 1
+            so it can execute ``/usr/local/bin/blah`` with ``argv[]`` set to
+            ``["blah"]``.
       ``O`` - open-binary
 	    Legacy behavior of binfmt_misc is to pass the full path
             of the binary to the interpreter as an argument. When this flag is

-- 
2.53.0

