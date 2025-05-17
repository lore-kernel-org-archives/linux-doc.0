Received: from mail-il1-f172.google.com (mail-il1-f172.google.com [209.85.166.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E511F462C
	for <linux-doc@vger.kernel.org>; Sat, 17 May 2025 21:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747516251; cv=none; b=bpat1I/8LfP1pbO3tioKpmjG2slGKySK1SSqcRyetOVzAv3JZ6vWTd62+e7d1n/NT+EGHzdxUykIkZ02GiE22HAUW4ZnUAM7K5DvkLmVOnhnJ+TzMEc6e9h9nae+LXX7Sh7e0WTM2bhkpoPvbv8/Vjmxr77ddtMeMCTyZPte3C0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747516251; c=relaxed/simple;
	bh=o/Nya/tGk006xRA5N500QpaY5OOYSf0gkMPQt5ZX/IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=aJOlGI7Dsj5VKUebzsYKAX8wV37nXkl9gF7lnkR1GZqO2RD1vLXP5I1Tt9Swm0SYNuylHWhEqB5Y6dFzEpLNl02+ed207sw8yuBxao5POhhOuwwVWbYzzFTMCgEKeim7UgAja4EmfHvxXHPiV0MDL5WIiUjqqUZn1gXDOdylBBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com; spf=pass smtp.mailfrom=brighamcampbell.com; dkim=fail (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b=GHL2o8lq reason="key not found in DNS"; arc=none smtp.client-ip=209.85.166.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brighamcampbell.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=brighamcampbell.com header.i=@brighamcampbell.com header.b="GHL2o8lq"
Received: by mail-il1-f172.google.com with SMTP id e9e14a558f8ab-3db7b3de375so23263545ab.1
        for <linux-doc@vger.kernel.org>; Sat, 17 May 2025 14:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brighamcampbell.com; s=google; t=1747516249; x=1748121049; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=GHL2o8lqkSudd1Uk7QW6I/krnKcP1hv0oaz7UrRhzq5v+hosno1Ww8QLyFHHusTMmV
         WmWLXiHS9azgnOeUrfyq+1ZSXeG8z3fpEW/aWntFtMzMG2+APGCh4wYRQQ2IJmZ7zTTv
         CDsW+24S/ZNUIsYvulzEG1h2BRFtq2123S6ahbbvFWSWrmNzL3zKdKIpDbDIUG+Oe6Lg
         uycSWRKorKXGC/MWIAMI0Jswy/iZKj7wy0brCN44tvm9AdiIJ/uDPEsZ6CpuahdbdYTc
         oR1cCw+mxSz7wZ1llfnAXtHpiQGCCRxvheq1BzLAJ1sh4a8t6tJyxpndje989X6tf4kN
         vvMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747516249; x=1748121049;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qsAWXt+W0ngarXnftcnhixQhh8eXvZ1EEvRj0zEMsI4=;
        b=wGdMGpELH3glcHSuNWmAlQv61D48LbqvaOumldOYTLJeK0VpG0TlUgy9hP2BEhXolf
         3+iMtb/6PtXzMb0kLNSO+S+3IhmVKSumnGdxd+v9KQhKIRnDfq+MZDwZEtyA6BkShhjd
         O6ILeuzx89W3zJ8RhSTSQf0B5aXZ73QqyUg1tk1EjaGum+MKwUCW4LSiwpY2GT5E5GuV
         F33gHOyvSV4d6jgXtswaAutzVSNoNUNF/vTF/cZ9263ygMzQJbqf0Uejz8hvrlKlsccA
         x+eukVuo4ouj8TtVpPDhO4oqEYZJ7AcmYVC2bPrtR8YSi4d+kjgZXSEdFyhPJAjDh0RZ
         sg4w==
X-Forwarded-Encrypted: i=1; AJvYcCVT+p3vxR8myCmXtEnr9p8GPFR8EuSSspI4l9Q9IofcIaDJ6xKKARW4JNr4i6AWU6NdK9+6aOWpDpQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeEFOv6O8rUYXlsYcj+aiKAm/Y9JHzNo1QA+N3IGMmkq0uMHAL
	TQPVHHHzQzdLdvuiXBdHzvk91TMGmYVUgs0mOBiRkFIHk1sSIcMa5jBxauBRzNFVIws=
X-Gm-Gg: ASbGnctVO5BzHBrtk9SJ6WhaTVXcBJENOaxou3V7bo4UrezUmAdyqZ/p+hj9w3Fsnxr
	DPKTKIyDzbwizu1bbQQL1T1ZTdfENxe8xFVbOSOUx10XnTgzrQtu/7hVL/0RI87MUSJgBM9QE8e
	NY8sW0QMtJHLxzWttd+KmG6BPINvhG+Q6B5gThlnh3DZJdv8kK9GcHTHjxPEBojr6//EOejRken
	4BIP8UpdrEolhiM+gnZuffYl16nc4o9sGTOZ0A+7iJDczzFsrcvEzdgR6ZPz5tr9eO0uAqgP92a
	XHRqEBshj3xh4fmJGudZbtuT49UFqRXyN3sDsou0T1AroQ3zlC9YFV9mUFekFzjq8Ykaw+j8vPy
	aQHgMKzk=
X-Google-Smtp-Source: AGHT+IHO8vmPZ9wtEiIB3JiDHbb2n/QkwioIBKsC0rUUGe/Wln0nL1EQukSNTPuRfRNcvEViMy2SvA==
X-Received: by 2002:a05:6e02:1c02:b0:3d9:66ba:1ad2 with SMTP id e9e14a558f8ab-3db8569e88bmr68385155ab.0.1747516248818;
        Sat, 17 May 2025 14:10:48 -0700 (PDT)
Received: from mystery-machine.brighamcampbell.com ([64.71.154.6])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3db843e07b8sm11777445ab.20.2025.05.17.14.10.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 17 May 2025 14:10:47 -0700 (PDT)
From: Brigham Campbell <me@brighamcampbell.com>
To: shuah@kernel.org,
	linux-kernel-mentees@lists.linux.dev,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	Naveen N Rao <naveen@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linuxppc-dev@lists.ozlabs.org (open list:LINUX FOR POWERPC (32-BIT AND 64-BIT)),
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list)
Cc: Brigham Campbell <me@brighamcampbell.com>
Subject: [PATCH] docs: powerpc: Add htm.rst to table of contents
Date: Sat, 17 May 2025 15:07:59 -0600
Message-ID: <20250517210757.1076554-3-me@brighamcampbell.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

These changes fix the following error, which was introduced by commit
ab1456c5 when Documentation/arch/powerpc/htm.rst was added to the
repository without any reference to the document.

Documentation/arch/powerpc/htm.rst: WARNING: document isn't included in any toctree [toc.not_included]

Signed-off-by: Brigham Campbell <me@brighamcampbell.com>
---
 Documentation/arch/powerpc/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/arch/powerpc/index.rst b/Documentation/arch/powerpc/index.rst
index 0560cbae5fa1..53fc9f89f3e4 100644
--- a/Documentation/arch/powerpc/index.rst
+++ b/Documentation/arch/powerpc/index.rst
@@ -19,6 +19,7 @@ powerpc
     elf_hwcaps
     elfnote
     firmware-assisted-dump
+    htm
     hvcs
     imc
     isa-versions
-- 
2.49.0

