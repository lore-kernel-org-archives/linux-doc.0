Received: from mail-ot1-f50.google.com (mail-ot1-f50.google.com [209.85.210.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEA9D2222AC
	for <linux-doc@vger.kernel.org>; Mon,  9 Mar 2026 06:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773036197; cv=none; b=XMUqNqY7EKRp8QH/JAm6qTQa864sQ25kzRLW9l+Xol5aLM0pgJcOBpoXi6q+Gjyr60loTpAWCop66t4Tw0KVOLWXgP8fcBAc7Tmcm/fTE7P8Rgh9cceDEO/78FJOtihDHYmu/pqdaFgcsDcCo0Enhck3fnA5Ifb/vuYhcHD0OE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773036197; c=relaxed/simple;
	bh=0QxRMyVtfQ1zQvfC2pDBCtpoXpSxqdxwHXj1gk+6Bgk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YSD/whxM9CkD/UeCH6KUyLyn3v2F06CxGEHntEWef9wUkJh09loPN7JL5h9xIVaErzIwrzz+BdGRdIw5go3549oPJUCjK3rYI8dfCj2s1Cjse9mNUKn9FpNN959kmLhcKcc2QdD75TFyK1THHK9vBdBB8ASk4Hq4ljrpc/sq8ns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b7WK1h7M; arc=none smtp.client-ip=209.85.210.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b7WK1h7M"
Received: by mail-ot1-f50.google.com with SMTP id 46e09a7af769-7d556c1a79eso12713999a34.3
        for <linux-doc@vger.kernel.org>; Sun, 08 Mar 2026 23:03:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773036195; x=1773640995; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zQrF1uEHLqlzfQISJmEyaOyajZBYGvA2Z5D72mM2A4A=;
        b=b7WK1h7MLInB3VMICvb5b3LaGLKGJN6nYeClO1qFV3CH5q3nWcM2gQQExEM12m9myf
         Gi9VXN4HE/rF3+Ygc50wviSIimUaCC5fu75/uOtG4RFkB/s8Uaqhzo/8vs6SWvW+0zvK
         +gQ5z1GLpHMrE3KCZh2qh3cbhs161aKfvN8ipNYeZlBzba2tD6c8co6R94mpT0VrAsaX
         FIZYkv71Vf35YLhdspQ73NrmxBfTEZPqJGxEG0n2Y+wf8CMx8NZxqyxuF+zqkZM7qGfH
         HfupPqU8+sKiZvZL0rC1lfbOfImxCH7i5gXQ3LQ3IffQUNCt7LS7CzLVlFUkuKXj6kb3
         UfFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773036195; x=1773640995;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zQrF1uEHLqlzfQISJmEyaOyajZBYGvA2Z5D72mM2A4A=;
        b=nn9+xZ+lV+K5Qa7p52wCCjx5As/meK3DC8ecbEOLobCso5EFr30hHQpECZ6DeEnpyM
         6sBFAR7xBfXva0btnmbU9UWJrfABbKbp3agxNa0obHS9pB1b6xMSkgpOHSisivgq7ftP
         1yXpLB69wza5AFqKSojQshadQ8I4mb/uzCQRpbDwra4AJutuKFXv6yHAzgDen+hVUfd5
         AhLKQZI4zTpiYwUHJ4m7MrQe3Qa/nLxFr8nyGl4uKOpDwNBxeA4w2AP38uk/qlYaXAfi
         2yOBXgnhUKUQf5ujpOvyn2dfSfIX5rKBA2kWXNjdpl4Uh0MovL1mMto9skfZ5Ao7pQLq
         cixA==
X-Gm-Message-State: AOJu0YwvW1MZNH5Fu7T8giO2FZEK7kOkVQ1+eYNkW7uWhBYsMEBfDLek
	VJ4ket/76+i6hqWsFhUbuRlsUHhLaFULavceVaX3nqA1kA6hA+d2DiifV3cXYnCOqd4=
X-Gm-Gg: ATEYQzzjnlg8sr/kakQ8T78rfckuyPlQd6qTuKIi/eVIzvahsBrezHUesbxNAg1O5gm
	rGd0ewBygjfDw8CSngEh+2mCfVUqfjEAi1WfjkjUdf5Q9e+i6Smm4VyJQoV/e0P6RnKgN994Clo
	bDzael3SFbScULVZnoewWXF3zd/62sVl4pKbfzutqffW+hZxwq0h8ZAkOwFxLFSDHXwhDI9Kl7T
	WjV1hjjf55PPPVH48JdUfTCafN2mnR6/w0ZP91y7srQASLIV86t4gPHuIPEKchYPC4rq5q2ZwPF
	VB5jGkEYGBc2+0c8LbQkOhzgPumzSIoqXf70sS4TlFP88XWopsCMHcjI9DiBewLb7m0yyW5eRdY
	XXQVeBYTgmwnU4Su9TkJ6YWk7ykBbBItn9RDP/sYEkrZte03Lz5r39Bl3cDYSsYYl5wWUdYpkIN
	4y+theEE/sFbJBReeRBtntUCfaVQ==
X-Received: by 2002:a05:6830:658e:b0:7d7:4c91:5ec6 with SMTP id 46e09a7af769-7d74c916288mr1184555a34.36.1773036195565;
        Sun, 08 Mar 2026 23:03:15 -0700 (PDT)
Received: from PowerSpec ([2605:59c8:1065:f808:757b:73d3:6fa8:71fa])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d731e14d4asm4747949a34.14.2026.03.08.23.03.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Mar 2026 23:03:15 -0700 (PDT)
From: Ryan Cheevers <cheeversr0@gmail.com>
To: linux-doc@vger.kernel.org
Cc: corbet@lwn.net,
	skhan@linuxfoundation.org,
	longman@redhat.com,
	frederic@kernel.org,
	cheeversr0@gmail.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: fix typo in housekeeping
Date: Mon,  9 Mar 2026 01:00:15 -0500
Message-ID: <20260309060015.2349939-1-cheeversr0@gmail.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ryan Cheevers <cheeversr0@gmail.com>
---
 Documentation/core-api/housekeeping.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/core-api/housekeeping.rst b/Documentation/core-api/housekeeping.rst
index e5417302774c..92c6e53cea75 100644
--- a/Documentation/core-api/housekeeping.rst
+++ b/Documentation/core-api/housekeeping.rst
@@ -15,7 +15,7 @@ various deferrals etc...
 Sometimes housekeeping is just some unbound work (unbound workqueues,
 unbound timers, ...) that gets easily assigned to non-isolated CPUs.
 But sometimes housekeeping is tied to a specific CPU and requires
-elaborated tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
+elaborate tricks to be offloaded to non-isolated CPUs (RCU_NOCB, remote
 scheduler tick, etc...).
 
 Thus, a housekeeping CPU can be considered as the reverse of an isolated
-- 
2.53.0

