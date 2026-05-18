Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D298C38F253
	for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 19:12:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779131545; cv=none; b=j05BGGzwUwfS+ZG2tcfFpeBX/+HIKXIWoEpNaALFKBGiFRLw/s7GBtJl3djJ6NY/J006NTQyb0eKvgXgEfbrQxtywiyPX/jhIDX9Sp4JWoveuo6XO4RK/OrPtMbbZJzf4kuY5mCGiOuqSedgnTwj/xaiD8lVfNyuN2enwq+NlpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779131545; c=relaxed/simple;
	bh=+bngKoav4oRmKQXZqqtZhaGF91NFZUI89frNRe71ujg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=uaYFL007w6nzmhP7hB0X9S1gr0PT2eccUhr3Vch3Q/SwziwQ2+49pU+A355tKl7y0dt2y4Zi0XC+/4WfmNB3LXqtj9ZYGciBYqlBLlaUNtEOOaFC9qlhLkIc2rxiSFeTAe8qFiTgR3Y9QWiVXP7oVUgElS6OVw90ZsbDZ3JifVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s7lEfUVp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s7lEfUVp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48896199cbaso20895635e9.1
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2026 12:12:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779131542; x=1779736342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SInUWKhqXZ7NxtmtUcTjuIifSi8+lTWwUFzMJGjUoRA=;
        b=s7lEfUVpgBE/ZQr1ApZ6RB4nyIc+wOey9MBW3TFzYWqcQyH1kAlQgEaPh8FryE2YRm
         gYGWtob/ALWGbBX4kWZRzsoGrkZklKATHkxh5M39xFRvmVZN38ag/JDeHaOimk4pG/Ye
         8FRcIITMRu6jBGA11OliRpcFGSsj07yudXHBJ8cJDZldAsaVRlWlk5ucTLpCh1Ppp1tE
         LA9EMPQC+X2iLMKPtAmbLXwEFpA7xOCvyop13+C3EDILGX7sevawX/c/aOfCinUf8/Fa
         e7QP8ggXcldO6/7vfeaDK2AGwhCXHGmZfwpbdQNkXjHSo5D7/jXIPkt1X76rhJLlcLgq
         wwng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779131542; x=1779736342;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SInUWKhqXZ7NxtmtUcTjuIifSi8+lTWwUFzMJGjUoRA=;
        b=KiW5Wf7eJLJOAYlMvxlBcGd+gTopdCxFCwoRe09eWPT88Q2Yia2u8RrlcVww9jLzOb
         YByXAGnDeqWfaq3+xAo3Tv2KmD3d+Uwov6HD0l1q5j/nOsp4ZZnqLUFncxCz+C5JOwpa
         is58lrGtQEy1AZCV+A2vmSDK98JFD913s3XV0aWpDds5toJQIG14shCL/rptSWbMSmue
         n/Wi0/dhXQRP/bx4VsfTtGI1rEtmoLRSysQ/f+m+TvH3zH+hHh0u8D12IK7hSEfl4tro
         0iod1U/e7cgE2TPUAGXLA2l/01sVmQwj185J4uZAy+HH0cOcmUbkTSCfUHrODwY4o2B1
         yyBg==
X-Forwarded-Encrypted: i=1; AFNElJ/JPp8b5+sCNPTrL41UZytBpc7dMEZCxSHRKHqaAscWzf2LYZwcV1qMAzxplmePPiH0pqmtEAuNXOs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1di4nLTkMtUANRYM2Z+bG8dSS7lmZEkXO8ZtPyU0dCrep9NR8
	tHcv0lDp+OwxQe8NY9JtnQ5UjYyzpe/f+zD4BLoHJl8Z44f2xHX38vDM
X-Gm-Gg: Acq92OF+qKCSrBYsCoJbBGx5vjmB6xaUkhz2TXbSIQazwx6EQ3dMop2qE4uRfEzQdqh
	sz1ht2iTa9bmTDHf2EWNju6TDxLSvjhorsrqCwPCMUVPXwWyMGddpcez2DA/F+ltCg9TUYo0+hf
	0dYxIRME347X8scCojkp0TpKh4wM6aF8DpHkEsL9e4SOByf3TzTb5piPkyGH0/NtR5Cm5TZpBe7
	Fs5VLqEHWQmibSt+XhTau3Ofv8sPAyEGD3J/Bif0SdXLmlzCsr2gqSLUjVYyr/icn1rDpZS63J5
	4TJnF6OHPhTqPUz1IavMjsfLXcLoPY4L4ocIXKbhAXrcTxvuUPY3WIYPbU1O1ah+S7PV8gC3VyP
	1BL00INrUV+lDclnDMuW+oQUE5bejCvbRFhmnW7Gaq0Mt98zg2CZxRkRKSGe9I5OVesFnw5ghGZ
	yHTXdBOG8FwHKHlw1IKxg72l0hr/ND4nKhAGrlg/1lk8ev5S5I9H8=
X-Received: by 2002:a05:600c:4e47:b0:48e:707f:cdfd with SMTP id 5b1f17b1804b1-48fe60e54f4mr274314295e9.2.1779131542277;
        Mon, 18 May 2026 12:12:22 -0700 (PDT)
Received: from mshcherba-RedmiBook-16.. ([188.163.115.207])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a6454sm40043167f8f.34.2026.05.18.12.12.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 May 2026 12:12:22 -0700 (PDT)
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
Subject: [PATCH 4/6] Docs/admin-guide/mm/damon/usage: document update_schemes_quota_goals sysfs command
Date: Mon, 18 May 2026 22:09:30 +0300
Message-Id: <20260518190932.42270-4-maksym.shcherba@lnu.edu.ua>
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

Update the DAMON sysfs usage document to describe the newly
added update_schemes_quota_goals command, which allows users to read the
current values of the quota goals after explicitly triggering an update.

Assisted-by: Antigravity:Gemini-3.1-Pro
Signed-off-by: Maksym Shcherba <maksym.shcherba@lnu.edu.ua>
---
 Documentation/admin-guide/mm/damon/usage.rst | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 11c75a598393..097d8ebe960b 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -167,6 +167,9 @@ Users can write below commands for the kdamond to the ``state`` file.
 - ``update_schemes_effective_quotas``: Update the contents of
   ``effective_bytes`` files for each DAMON-based operation scheme of the
   kdamond.  For more details, refer to :ref:`quotas directory <sysfs_quotas>`.
+- ``update_schemes_quota_goals``: Update the contents of ``current_value`` files
+  for each DAMON-based operation scheme quota goal of the kdamond.  For more
+  details, refer to :ref:`goals directory <sysfs_schemes_quota_goals>`.
 
 If the state is ``on``, reading ``pid`` shows the pid of the kdamond thread.
 
@@ -448,7 +451,11 @@ get the five parameters for the quota auto-tuning goals that specified on the
 :ref:`design doc <damon_design_damos_quotas_auto_tuning>` by writing to and
 reading from each of the files.  Note that users should further write
 ``commit_schemes_quota_goals`` to the ``state`` file of the :ref:`kdamond
-directory <sysfs_kdamond>` to pass the feedback to DAMON.
+directory <sysfs_kdamond>` to pass the feedback to DAMON.  The
+``current_value`` file is not updated in real time, so users should ask DAMON
+sysfs interface to periodically update it using ``refresh_ms``, or do a one time
+update by writing a special keyword, ``update_schemes_quota_goals`` to the
+relevant ``kdamonds/<N>/state`` file.
 
 .. _sysfs_watermarks:
 
-- 
2.43.0

