Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E7FA8834
	for <linux-doc@vger.kernel.org>; Sat, 18 Apr 2026 00:06:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776470806; cv=none; b=TRaK/tBKuUzw8lY8eOGkxVVco4jWv4pho3HxkM9KFXP/38V76gEcJtyWbXZLP5WFxRUg+1v04cMg4P2TJkvKjOU9tuOx1/uFJWM/yTEFmcAvoSmfUu3uqVelWPgpNVX+AUd2UykkEue7WX/KirRLLM9cjNR9fZrQNnBsy23xnLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776470806; c=relaxed/simple;
	bh=PaUbviliQKYsn82vdSrXkLwCmA1WIliY8eE8FyWwR38=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LEZLX3kI+act6KbQ4PcKonR8SJpSolK7gO5QnbVWBI/TTWujO3+jgfdIWmCAmUEvcQVN+bl2DJmoM0CeEjkGrFHO05rHJ7REn7G+WPWcy0EjPUUxGbNN+t4LWw48lFOmBWg0SoAsBKS4iW0EjSMfRk/9camxSi/F4F/+KXC52jQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OBOSuUW0; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OBOSuUW0"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-82f431c0ab6so599492b3a.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Apr 2026 17:06:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776470805; x=1777075605; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XnzlPBGDUvWxUUnLdKcHZKjWamjXrlcano0vZQ/8+jc=;
        b=OBOSuUW0wgk82yEwF8Bt6NKi5xB41z4M7kOWXz1iUBbWS8pcXwDOI0Xo6bCzEe/Qcc
         wHphOw3DREMxRoQ2C5nP9s6MrmT5mv2n2i7Dtmkh5QX5ICcPgwbzdQW7WhKHw7lRK1JS
         MdLg7I0vXFF/nO3xp78hYS7893UDUZs80SUcNyydLX4ru6wwiMIXoK3r/QAbMpfvVBRr
         /hwxhXHTHh7xsTAP6/AtwIdJWVQC/sjD0IpTVhVzd1LrNtfYJpaZlnkcfmNHkA/wtavD
         D2GnXvknKz7d2Ay8FZ44wpn/+276Uqa4nIDKRD7ALorBkx2oyJPVR4bzvYPqJmr91u2I
         PwvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776470805; x=1777075605;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XnzlPBGDUvWxUUnLdKcHZKjWamjXrlcano0vZQ/8+jc=;
        b=slzc+yDbklKsKjvzrdlPb0xZU7QBTFrpFbjZc/DmpvlRkbQ1vyqJ9P+t3j6oIvuJHD
         qASfbIB9VW2AMQwQxp7B3wrKe0sJdm5T31GStIvTYScoX371leYIHkhIAm7n8W5TH6Xj
         EhY0jAaaPCulAj/H3yYeDVDUyj6JmgNLMwdqb+xwMOCizXKrbBFVJCg6Q2glggAt799O
         ZlwxrtXxcDOrpbvti56TCCw0rJRWdVr4dbrR1tPzpIpfcpykZNYckZ+IvBiS/VWXmhj6
         9XY9EadhYpqE5szVqzsWhysx6vlgg2dVmeK5nYNSSroZdil8LHx73fTydnFuAVpI/hrI
         96aQ==
X-Forwarded-Encrypted: i=1; AFNElJ+TsJjooAlAobqNF2wdgOwNeoUi3Fh2E1Z5pc2bUQoh2zYlDLJYgQ3Ef8aUzkXrpoqll8Z0a6jowNc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYLab23obC6UyKd7czSeoQEz52raVkICbHZVnW46ekPO1tNfLV
	f8Dk1+daDzsGVk0kIHIOIiVRt/4y8vzVR7JWkRR7HmEExqyqaAPleTBq
X-Gm-Gg: AeBDiesufcs1IPfD2HUFzGHNNog6JRYsGYfCzYqc8UxfJhGfBvJ0/SC3ZRfXYgLGehj
	qwHnZaJ1jJ3mq/vo3L9QuOLF0dQ+XzHnPNItdh3rcT1ayha9iZnBBhMinxrUkVeyADEKmnyNNM3
	1AkOv6VgqYgoR0rZLBoOA6qwziINRAYCqCmd8PM95/l8tzrmf2h9m6fuYNbfpHkl+BNXEJnfSaL
	flYmwecbBr/3nYbxqTCSsZDf8URKrdW+3RvHwwG2OHXcm9Atb12AtTIF2CupY/q3AlUVAUy/EUg
	A/zU/cw0G3Z0IiQ8rjO1zb2EPQJ3RmX5xQfVVaLfSd734+UdA6Krgtr+s/3VWTyPVS8C91Z111Q
	XMMfujnJcaGWngffdGN3SHGk8mtTAzOF3YrhXyoDjCyKzjPXo+xkvcXbqM5MWgiAbIRq6vgJGhc
	EIOkBuwvnA1IH+FsloUjf190vmYHTjcahmGy6Q98zf94hdKppVTmKtNxGis7y9seTsXkgGu6bli
	2ZEKJnZamluCmo1i6fl6F17doH4Vb9n
X-Received: by 2002:a05:6a00:1c9e:b0:82f:6b6f:13ec with SMTP id d2e1a72fcca58-82f8c9427b4mr4686092b3a.34.1776470804566;
        Fri, 17 Apr 2026 17:06:44 -0700 (PDT)
Received: from nickhuang.. (2001-b400-e28d-2380-bd61-3c44-585e-51bb.emome-ip6.hinet.net. [2001:b400:e28d:2380:bd61:3c44:585e:51bb])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8e982fd3sm3840200b3a.10.2026.04.17.17.06.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 17:06:43 -0700 (PDT)
From: Nick Huang <sef1548@gmail.com>
To: Vlastimil Babka <vbabka@kernel.org>,
	Harry Yoo <harry@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Hao Li <hao.li@linux.dev>,
	Christoph Lameter <cl@gentwo.org>,
	David Rientjes <rientjes@google.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Nick Huang <sef1548@gmail.com>
Subject: [PATCH] docs: Add overview and SLUB allocator sections to slab documentation
Date: Sat, 18 Apr 2026 00:06:19 +0000
Message-ID: <20260418000635.17499-1-sef1548@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

- Add "Overview" section explaining the slab allocator's role and purpose
- Document the three main slab allocator implementations (SLAB, SLUB, SLOB)
- Highlight SLUB as the default allocator on modern systems
- Add "SLUB Allocator" subsection with detailed information:
- Explain SLUB's design goals and advantages over legacy SLAB
- Document its focus on simplification and performance
- Note support for both uniprocessor and SMP systems

Signed-off-by: Nick Huang <sef1548@gmail.com>
---
 Documentation/mm/slab.rst | 26 ++++++++++++++++++++++++++
 1 file changed, 26 insertions(+)

diff --git a/Documentation/mm/slab.rst b/Documentation/mm/slab.rst
index 2bcc58ada302..2d1d093afb7b 100644
--- a/Documentation/mm/slab.rst
+++ b/Documentation/mm/slab.rst
@@ -4,6 +4,32 @@
 Slab Allocation
 ===============
 
+Overview
+========
+
+The slab allocator is responsible for efficient allocation and reuse of
+small kernel objects. It reduces internal fragmentation and improves
+performance by caching frequently used objects.
+
+The Linux kernel provides multiple slab allocator implementations,
+including SLAB, SLUB, and SLOB. Among these, SLUB is the default
+allocator on most modern systems.
+
+SLUB Allocator
+==============
+
+Overview
+--------
+
+SLUB is a slab allocator designed to replace the legacy SLAB allocator
+(mm/slab.c). It addresses the complexity, scalability limitations, and
+memory overhead of the SLAB implementation.
+
+The primary goal of SLUB is to simplify slab allocation while improving
+performance on both uniprocessor (UP) and symmetric multiprocessing (SMP)
+systems.
+
+
 Functions and structures
 ========================
 
-- 
2.43.0

