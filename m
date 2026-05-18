Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B379390229
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:12:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131549; cv=none; b=c6C3ilZdSTpxL+Orxe39BvwfgFeBOJ5C2uEvYmrwuxWpaO5/XDmnvj7q36RDOgwhQVAnb6XaS7PX+mKYq7I60oxGkKBrw9Dsj0uuy+gOlIuZYdeZ1P0PGjdXsCOQLki5LqWUxMs50ogoHh69xEqOGDUHEaie8D+eK1SYAKbBUO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131549; c=relaxed/simple;
	bh=rrpVVM/TXd2iBehI82iGkh/E/IqrUjKfYzsy7IZjmKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=diJGHx+E5XlC4ZY3gfByNUnELLtffsOLxZ1DcrI6kjFRNSHmQ/emX/1XJ1SVyHXIG5ki5kGtAsH5yyy+kdSPtIL4YEZ8vI80B2Wg5mztJfUZLgmmwOpe+dxzEU0nJxohlwRgpDNwuXJT89ykf800SdHZUzagSiM+HunSzXArBdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfH2OEOv; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfH2OEOv"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-45e6a4d0be0so1047682f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:12:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131547; x=1779736347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yBC6NBfwX3+M9N5z8/EgZVcnEG4Grml2tle9vPR+gqU=;
        b=PfH2OEOvzDx5nGgrmRx9lVOttYsEwUscougv4FJzo213WBqMC08hhop1Oa3k2GIbJg
         xJll2aMkGIA5MV/L5JVEptnUQgnUPEbdBYPSvwW1hsOTUwl/ML6xwf18yQXBPqHrlJP6
         QOhug6emN1hN7mHl/HAVOoLA8frV/G5d4V+1V0CNdcV/D6/n/Ui+V/hBHv+86DyEAk58
         nij2DyvtIFcunPmjAh0wZuCOMYdHrH2Y4/4Tas7gMGH9HOqwkPBZoSCMgiefNcC6i6Xy
         b2VdUWSwiFl/kzmt00RU7AyDVVtDvSTGI6WujgYE0VJnHT6wGRuKyPmXgkcdF/qVoulO
         8+Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131547; x=1779736347;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yBC6NBfwX3+M9N5z8/EgZVcnEG4Grml2tle9vPR+gqU=;
        b=eyfNqx61rrb6PV/bNXWHZH8NcFl6/Mj6XAp1EMpwLF3g+72m98JFh60iQQTww4gGJg
         3XFu+X3lh4vOk/AFYYtfaBm1VhBAs2grbydiNqdpJZr8TsuCQ5ewMfbGzc+JgGfK/ob2
         o1T74JDBQKu1zYaHoJdKsG7KB8TrpQDFMTQbwEdHNOPtvxRwmovbdoYxH6BN752FV9EO
         +aA+nt/da9LsxKMhinTPQbVmx2MomTJdeEtVPND8qpxvud1+mXb42NEQ9SNd7xUiccIT
         4YQGgRoanYSnLUfNIQGWhCcKRHtpsul5glf0zAUm2jKNfKT7B3gHnkhsO8ZoICUk/hrI
         /AZw==
X-Forwarded-Encrypted: i=1; AFNElJ9ryMFLA8dBqHUzVYkn5kEvncuxgyXQsYLfQfS1CSZgeN2LOJSzTb8d/OcfmincNAdHHvFEEmrhIXs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfShiaLnO+ZeQhdhs1O24m3w9XCxY86u2cPVZfCvdKxr+oXjqx
	KxLCNPs4+AEad9og6Ga5vVYcYUvaNNIfumaeYWObjKH4hy1x6rZolJ3I
X-Gm-Gg: Acq92OHEhzIr0wbK+pzgRvH5GBqv4Qx+MY7ncKl4ucFCv36wtOLJLt8sAwRsLKFBAE7
	6juPiiLR8/t7eIHH2u3IxYAZzwA18eMaT++/65PqMsl6D/PsEpb+VTX9iJ2lVDAgj3juvWGttzP
	g4JjC2PfYR5UETQG7GPLoaUPeO2Ibwj/eymsvbKcbW4plXzEVDvr5VE2etsmShbuWjc37h9DvLB
	ZM0kPVHipmRN0PfLxS4lWsAPbEqsvnobm0ajK/9ib2EJBH6/YhOOB8TX1JfoiAt5FOuZ+rSDN7m
	fhR29LYklDXRtUO7RFCdT3lajf8HV7JM4y3rnvWfFnCUfFrhwPsWBYNZU+dnFAe0zs885gHm7J/
	lkZg4kCmM8niQ4boD24wKd9UaowNdnSHuRByPGvCeBK7/7QX/+gBZnPMbxXyBKDlFpohkREHFPN
	/I5kRTJrxAYfY31g6URNHxHnFUHlPEujdt+9gXIFrmuynRfs/FGjw=
X-Received: by 2002:a5d:5885:0:b0:43c:f7e5:817b with SMTP id ffacd0b85a97d-45e5c5cc2b5mr26469781f8f.19.1779131546344;
        Mon, 18 May 2026 12:12:26 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:26 -0700 (PDT)
From: Maksym Shcherba <mshcherba2000@gmail.com>
X-Google-Original-From: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
To: sj@kernel.org,
	akpm@linux-foundation.org
Cc: david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
Subject: [PATCH 5/6] selftests/damon/_damon_sysfs: support update_schemes_quota_goals
Date: Mon, 18 May 2026 22:09:31 +0300
Message-Id: <20260518190932.42270-5-maksym.shcherba@lnu.edu.ua>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
References: <20260518190932.42270-1-maksym.shcherba@lnu.edu.ua>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add update_schemes_quota_goals() method to the Kdamond class in
_damon_sysfs.py, which writes 'update_schemes_quota_goals' to the state
file and reads back the current_value of each quota goal.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 tools/testing/selftests/damon/_damon_sysfs.py | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/tools/testing/selftests/damon/_damon_sysfs.py b/tools/testing/selftests/damon/_damon_sysfs.py
index 8b12cc048440..27cd94683f6d 100644
--- a/tools/testing/selftests/damon/_damon_sysfs.py
+++ b/tools/testing/selftests/damon/_damon_sysfs.py
@@ -806,6 +806,21 @@ class Kdamond:
                     goal.effective_bytes = int(content)
         return None
 
+    def update_schemes_quota_goals(self):
+        err = write_file(os.path.join(self.sysfs_dir(), 'state'),
+                         'update_schemes_quota_goals')
+        if err is not None:
+            return err
+        for context in self.contexts:
+            for scheme in context.schemes:
+                for goal in scheme.quota.goals:
+                    content, err = read_file(
+                            os.path.join(goal.sysfs_dir(), 'current_value'))
+                    if err is not None:
+                        return err
+                    goal.current_value = int(content)
+        return None
+
     def commit(self):
         nr_contexts_file = os.path.join(self.sysfs_dir(),
                 'contexts', 'nr_contexts')
-- 
2.43.0

