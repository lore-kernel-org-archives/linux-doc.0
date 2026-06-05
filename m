Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FD9B3CF057
	for <linux-doc@vger.kernel.org>; Fri,  5 Jun 2026 14:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780671093; cv=none; b=BfT+vjwVGkmQiWQWPRKz4An8hcS+iNXPB/+Be06l0JGjxDXEFPnwc/ORYVWT70Il6SxRPGhagaxAMvWq88Jg3+tkH0P3ffpQNP1BY4DFOomvpTI5suop0bajJXMezfIHcWZaJn5boxXOyxqPeweXKf/3L9+qVXwU9q0nGluIaIU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780671093; c=relaxed/simple;
	bh=YcBPKqvMP1ylAlMr64V6CROCGtolsILVdfaI5pdeyWg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uMJcYgxqxp+UBdrg9NEqJGUOCIXwX2DOXWkcFOGRuWgwfnnY8dkjwQZcMs8OAXYHdLTyGd/3edc879cLrbhSDIN5fbd3CT+GK3A6N46j8kDySbJVkJ98SRGBkTWRPrKygxcxZHbVG9fdIQemkS32UkZxK4cvyFSHWbHa6qMwvT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gxRutXdg; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gxRutXdg"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-490bc6a7958so19525195e9.1
        for <linux-doc@vger.kernel.org>; Fri, 05 Jun 2026 07:51:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780671089; x=1781275889; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=QhvFXw0fYOddMWATvPP+MM97z4VRYYmtixDnTSdQAQg=;
        b=gxRutXdg8NBPKirLRPngF75pReg5hnsGo+DLXsfro9ochJu5Deo+pvv2Q3g6iuJune
         bkVkgUwronQWWVJRusUBYwpHje7dIrKN9M5jTwf1IFbQPITBzSgl/CR8mN/5xUB9krS3
         Ux2Jkqe7v6+f5sPcw1x1LFAVodKF+E1auoX/37HwEcnvDtaFKvY0VCbSDfCPnt6fj7n0
         mgjefbDPfU6K0ih056vTPRGOqDZjJsy+egtMcYxf63V1ujEgcTmXjjo3EUb8kKweAoEv
         WayrCiQXyYloEG6Rgla4Xtko+OP2C0Wcc4oO3JxX1OiKaMxFJR/AOAtUHOazJMRFE5Wd
         UgRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780671089; x=1781275889;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=QhvFXw0fYOddMWATvPP+MM97z4VRYYmtixDnTSdQAQg=;
        b=Wx5D+pBmQ5N4IyqM0twFAevH+/QaHHzJ7y4mMQOeX+rSmOZ2pjkFL6CodDL+F3Hi4T
         6RbDgPkj+j3qgwxptffibIY21OOs/Olx5G+Ye+IOnv3U6xPwBeuXxOMXSK0OHqb6/hYp
         Z2l9/EXV6lllGAgDqW8dwMYSmsGd3a4jbz1GfckUOaijpTFtUCVayAbDTCPKBzw5hSVN
         pdeZn/AOMsZHlDaVodf4oEieYAmFBbVTAWUBymPwFRt5V8RFX7F+28+aTMT6PLgE/fpR
         LSKVWho3FmLQ2gVYw6jFJcyOs/ODVeZIsXp6RWr2nQ94vncESHJQnd7GqviuJQfmtoOT
         FFrQ==
X-Gm-Message-State: AOJu0YxONxHaPXbgOHDub9+XtR7lYw6dhuXMi6/veBkNQBePirKmnmqf
	jKkTAEDg66NHI2cbpnXfQWeJhhQvta0cG86UZNi/RTJWHpyyk0Do5r8laV9S++Pr51o=
X-Gm-Gg: Acq92OF+Lpq5WqB6jPsRXnm3Cx1hqQSbyEkHX/gffF5/74XQQuWNdt6JnajcppIQbi8
	2Gv0P7EWwnBoREseXkmTtHTQs/YETe7/AI8grqvnZOA2n94KI7grZMbhBz8r44+0w7rFtidLfHn
	VAnDT/f0Ez9fYpmw5krAypYX011voFNfltEoEjHWFxpnZRygXVbYcYMMQ0yke4mywb7Z1eJ9oMe
	sThDomK3taceASausot1FXTwCgliI9kv4JMlDah0mV8SOQ10Py8P0Tho6VnygxWw/HXt9lInsTw
	Qc1IlmuOvplOnyv+oapRwTmZTprFStbeia6NmNlUs1RFp9vriW8XJP/5/VkH0+5hzcXT+wFnfUn
	uyE8C3BIbGEb+VywuTOjWcutCXB5eW329IFmdfS9ywmVZ3+rXG6Esh5Zm1SRfZsaNc2nPA2zZUE
	gqXXgK6OrNBAl97gN94v12aRukv1gROKv6fiTJCXY7TtjF62m8hI3sqclIBtTm5iQ4y+vTrLMO
X-Received: by 2002:a7b:ca56:0:b0:47d:52ef:c572 with SMTP id 5b1f17b1804b1-490c2cc6b26mr36822455e9.1.1780671088850;
        Fri, 05 Jun 2026 07:51:28 -0700 (PDT)
Received: from mathieu-omenbyhpgaminglaptop16wd0xxx ([197.39.198.153])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f5612sm25170099f8f.15.2026.06.05.07.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Jun 2026 07:51:28 -0700 (PDT)
From: Mathieu Morcos <mathieubotros@gmail.com>
To: corbet@lwn.net
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Mathieu Morcos <mathieubotros@gmail.com>
Subject: [PATCH] docs: ext4: add missing COMPAT_ORPHAN_FILE feature flag name
Date: Fri,  5 Jun 2026 17:51:14 +0300
Message-ID: <20260605145114.34480-1-mathieubotros@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Mathieu Morcos <mathieubotros@gmail.com>
---
 Documentation/filesystems/ext4/super.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/ext4/super.rst b/Documentation/filesystems/ext4/super.rst
index 9a59cded9bd772..b0c5ab252c61e7 100644
--- a/Documentation/filesystems/ext4/super.rst
+++ b/Documentation/filesystems/ext4/super.rst
@@ -619,7 +619,7 @@ following:
      - Orphan file allocated. This is the special file for more efficient
        tracking of unlinked but still open inodes. When there may be any
        entries in the file, we additionally set proper rocompat feature
-       (RO_COMPAT_ORPHAN_PRESENT).
+       (RO_COMPAT_ORPHAN_PRESENT). (COMPAT_ORPHAN_FILE)
 
 .. _super_incompat:
 
