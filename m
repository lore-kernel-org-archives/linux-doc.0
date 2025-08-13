Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0200927AC3D
	for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 17:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755107026; cv=none; b=Kl2x2hXYb0wS1nyv1AMsu+eSHN0WqDK0ObDlOCEIOABKr7OI8Z1nSzru38mNcRRoTZZeIm51EAqu9jjOsMKILM7tmhipORvWHN2mk4s8dC25i4zis19AhmR9R157IzycT4amYI2odfWsz//dDF+vswAWUG5r1mKI7OvTPV7rlGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755107026; c=relaxed/simple;
	bh=4ae36tRi3PU/3UT1mJdE5cZkGTgBkmzJ2cMeSPXOMwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=pHirRiQ4kN5ANQWgZP0JQbtVnvAjFPQO92RIMcgaOw2/dgO0qGHSVLqAiFAjGB3D7NLYQ3BJkJCok6xgwDT2YNp4hAB9uW5M+8s3MdSWhTKqGhx+t3WXGH9U0xMTXZsXbsKBhlL+nooIFGa2yRkGeh6v+iinVhoUu0PPx11h8dE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R5gqJk6G; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R5gqJk6G"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24458194d83so94145ad.2
        for <linux-doc@vger.kernel.org>; Wed, 13 Aug 2025 10:43:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755107023; x=1755711823; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Zs6kqLC/rixHHn8q7Q4NKmo+nedL3ADh0S7vLhAQbSM=;
        b=R5gqJk6GFuwK7Poasp/UPSeAWyoG9K5z3u//J6R72uZQ3kn1i/XGWaHBtwkVhak2Pv
         9fRNAeJPkhly7XCMaS/kjGkmsYWxG9Hd8cFO6qHfqNDoDeqwliZiW6hHK3m8zOUHe2Fy
         qQQ7oyM7hLht+1Qhvo63p6NnNMBh8peayqmxiKg4ERg2CIn2hBxNZ/Vjb7v+aiROrZcf
         7D90zle97MILf89shs0uUe5QoMZGkxT/7vDNKPsW6vDYsHg/MwsJkENSW6xbEBKPHXju
         Ba/PfbQ81QQwxKY7cA0DRYkqaDOUvq2dmpizWwv5JrE5FtdiHRqLFuvvTJd0qjio40w8
         zeAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755107023; x=1755711823;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Zs6kqLC/rixHHn8q7Q4NKmo+nedL3ADh0S7vLhAQbSM=;
        b=LRC3fD6K2PJhYWLXMpnjaB88OCfUaLyPi4Q/S452mMzpVR+0Jw85SwOaA9ggVrrYW2
         IMPKAW3/ne6ZY2yhXhhtW5fzvParPG5n4xCj9aUSeY32SM3xjvvNGA/237HTL1YYCry7
         mWm40SLQ0l09DQEwS9/81lSZkwCxMCcXBYA7i7ZVgqoVgso46YC+7cqKPg6Fx/ygwAGc
         gJBT3a2hsb/k1ONZZny9FwjJ48Nj1We107klIPaLBNq0/zkhlhKGjllIqKl4irlkFUIp
         p0pzyAOcWiZrzxVD42/UJl5C0Yk2IdVMmVs/tWTzH61vpGxvYLvpMkevN5QBBBu/KNEC
         MRVA==
X-Gm-Message-State: AOJu0YwH8mcZrsbLO1Tuq9LtBy1TqknFRFEnXrsJa2TH3ddlJJYi51kJ
	1ZxZwCeIEjrxm1bBuNzoJOI82HIiiFyxP46A0HQcwDSQru6sK08DTn49caAo8Acuzp8=
X-Gm-Gg: ASbGncvE9lOOY5th4SBRUNcg9Kl43kdD32ffAt+E22wHJuHVvCfj/a3jG6LxTyK7pFu
	jJYFSbxQr3TPQPZrIDX8oKNFgQnUcNyVbvCRv6Cxck2YvqN+9eEeYlEvt0THTiuDWsXIC0d931F
	RoJFm1W3XP4hlEShTwgUEko0AOz1v7IDJWTxvtrhbCvdvD5LoDBZKWNnAJMhpRwWu1dCEtJpbpR
	SIeslbSzt5lGLnu34EKPMfWE+6UZcQiWRMUsn2y1mXHAspfK2jmggE3XBOSV0X2Yub4H8w/UtZT
	70wiW+6w4poAteHhlCtxI60zANpIpUkgkhU6VCfmdnhVmgxcHzFIc2+TStH4zYwfENTskbjqGkp
	vhSUhNCTg2iXe8gKmMOlm/QS5QVEUPBkFEBOPxA==
X-Google-Smtp-Source: AGHT+IHeWZrMY0SpduSv94DixCO8Uh5PWkTUzR+Ce7RdPyuWbHSYiqgEmcINE7pm5wSpKwfxczrYtg==
X-Received: by 2002:a17:902:cf0b:b0:23f:ed09:f7b with SMTP id d9443c01a7336-2430d2379b8mr65133455ad.48.1755107022653;
        Wed, 13 Aug 2025 10:43:42 -0700 (PDT)
Received: from lkmp.. ([49.43.242.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e89a6ec2sm330108525ad.145.2025.08.13.10.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 Aug 2025 10:43:42 -0700 (PDT)
From: rakuram <rakuram.e96@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-kernel-mentees@lists.linuxfoundation.org,
	skhan@linuxfoundation.org,
	corbet@lwn.net,
	ukleinek@kernel.org,
	rakuram.e96@gmail.com
Subject: [PATCH] [PATCH] Documentation/kernel_hacking: Fix minor typo in hacking.rst
Date: Wed, 13 Aug 2025 23:13:25 +0530
Message-ID: <20250813174326.6544-1-rakuram.e96@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fixed the following typo in 'Documentation/kernel-hacking/hacking.rst'
compatability --> compatibility

Signed-off-by: rakuram <rakuram.e96@gmail.com>
---
 Documentation/kernel-hacking/hacking.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/kernel-hacking/hacking.rst b/Documentation/kernel-hacking/hacking.rst
index 0042776a9e17..22b880add846 100644
--- a/Documentation/kernel-hacking/hacking.rst
+++ b/Documentation/kernel-hacking/hacking.rst
@@ -794,7 +794,7 @@ Some favorites from browsing the source. Feel free to add to this list.
 ``arch/sparc/kernel/head.S:``::
 
     /*
-     * Sun people can't spell worth damn. "compatability" indeed.
+     * Sun people can't spell worth damn. "compatibility" indeed.
      * At least we *know* we can't spell, and use a spell-checker.
      */
 
-- 
2.43.0

