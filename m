Received: from mail-dy1-f193.google.com (mail-dy1-f193.google.com [74.125.82.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A79883A5E64
	for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 22:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781388912; cv=none; b=pHnMwHBKnZenUiHxH3Qk4A1YvxUzjF0ZTAseEmqDG9X/Y5yfohh4sXiymXScAjxrVvai4lqMRf6rT7RdGZRhYNXBeA9QZUTBasp/X0qwg9eF0YaCkuWrk5wiSCqCSMIgmxPX/z6oso19aYJNE0xQ6kIhrYQl3n941D3L/MX4hLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781388912; c=relaxed/simple;
	bh=FMcRIzILFL2N7yudtvE0oR3f8RSxLX2sS1z2oIyxZGk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EBHEMyK3wCOqNjZhKPgHI29aJD4rPNCdtvU905wXeCgMlnfRm7UbQ73IleoXF0ulY2vkmw+vZp8QwzFCYzMlTAOqI3ciB5HSnUwPuUBdLF3GD2BMVzANZWFvSHQLvHiI0wGfFaFm547xj7/NZWKma8BTNithk0wXGqhkqTz231s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d1psPX54; arc=none smtp.client-ip=74.125.82.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d1psPX54"
Received: by mail-dy1-f193.google.com with SMTP id 5a478bee46e88-30b6dad2382so226907eec.0
        for <linux-doc@vger.kernel.org>; Sat, 13 Jun 2026 15:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781388910; x=1781993710; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lF35aRux9Iz0wuMqz2nIPnJQBNpp+Q2EiADmco2quR4=;
        b=d1psPX54EgM701/gjAkmzRGoebaLiH6UfRItvQ8YXAPLPC7hlAsJQOu1GaWKpSou2P
         dmnI81Hff9PTXfa3MgKTR5qNzRmlsZBbD2WYe6dgcJPO1CHaAkP5jduTe8K2gbbNFRRb
         sTeklGwc0LVWzoFaV/FDD6Rgx0pbxkFdIanR802CiIW85TJWQ1BIhU9BpSX0Z4xt3RRh
         HmjTXGFvqflwoVraOjZ0Qs/UOvWOSWljlmDVm/an3reDqFwR5k0MMzfH+VvPYhJm6Hw7
         6xBOdktL8y95XtXf4D6dJU1TXjpDqPwSd+8zcylUkaXjSA0EWqckxcXwlPDGtBv+zAIa
         gJ6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781388910; x=1781993710;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lF35aRux9Iz0wuMqz2nIPnJQBNpp+Q2EiADmco2quR4=;
        b=lRtUPoFd2WqmP8en7ywelwUm4TkMVKhAh5+jlfYUsKSG4aw2ic6Hd5VkzRafqL0GyD
         3hyNBOnm8QFxnfcDw4GPMAksBBBRTGKeAtP9uSfSdub0EWTsjEhHpG1AQ2i9s5YWRU5Z
         VPk7hHB2J+Shocu1TX481hPq0EsEQcdvAeDtq3ljiehPfZVftAL2YSR9eKlkQROH2hRN
         RMEsiAUmxpbl4SMddRuUnqfBBu4Nu1dAC0B1W6qyG0U7zc6hKXpSVvNTNtcaFud/tDKQ
         hn3/ZXyWG3PId5JGqIJb9L8V9W7rDEJqPL2NlzhNVoXVsSb7QQAu3RGMwOt12eJQtAB2
         Drhg==
X-Forwarded-Encrypted: i=1; AFNElJ/CqunmlKEf4gqtOfviXee4mAUwK2F3om4zPb5G2uzq/kL7XPKcI/mxwf9g7OyBrmgLmEQIya5zIQk=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjWmDG4MyKtWwQnQ2msbDdEMpWkDoQ79l3URVTMkkQzSGSpziN
	Sux5cMmfEak9zuGhBgBc2PzyUYhxHQqotqNkQjh6zQ4f+VB8HvV2pLAs
X-Gm-Gg: Acq92OEXIbBhEPyooXFDIA210RJZfVw93UAK2Bw2NDJ0qQ7PrKrqTl2XUY7TSvUlTri
	2FCwvwtDJEgb+WJon+kqs7LYbyOHu5PpOnBXFkbcjod0NTweGT9MvOoIxEBJFHJJPRom/2qSQ6h
	UPgvQNpL+xDgqVa0q6Mjm60S0F4KD9+Lxty3MhImK3+H9b2LrwxEXzvlw+5yRRCi7euxRZNLngt
	5yV8zjgViF6FWc5jfxtE2s8NW51g0Jw2ru3u7mywz821bJPgbJj2ucpxE3/eXyXqE8UdA7hzUHD
	CSxq2K1Ja++njpVoeYrr5OAeK4fbJn+bjY6wJB/lTq4XZexVtX/nbliax5JSyhX/NZIeBaUw7W5
	nFyzYzuESMLN1NQvZxvdD70FJ60RzA3YTju5aoDQPsEzSMi4kkwmL7LeYxxrEzts7nmvcnizELP
	01mm21DyEtjyZUviKxTvE4OY5UmwuV+z8VBpJEWYujBf+sipqQfz3HlBVKd1DwAFwT3oo+rf2P5
	qqKZaRcUXxqNb9vLsYUePwFm2REv3pP+5s2+NvDdfwhogO1OrjdvIeo5tojSUQokFpiiMHqS/c6
	MeyMsZKnAmPtVJvA8jBuk7ijMwIQ
X-Received: by 2002:a05:7300:8b84:b0:304:e587:5063 with SMTP id 5a478bee46e88-3081ff7ca07mr4483226eec.12.1781388908835;
        Sat, 13 Jun 2026 15:15:08 -0700 (PDT)
Received: from ethan-latitude5420.. (host-127-24.cafrjco.fresno.ca.us.clients.pavlovmedia.net. [68.180.127.24])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081eb95342sm9077739eec.29.2026.06.13.15.15.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 13 Jun 2026 15:15:08 -0700 (PDT)
From: Ethan Nelson-Moore <enelsonmoore@gmail.com>
To: Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org
Cc: Ethan Nelson-Moore <enelsonmoore@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] docs/mm: describe current criteria for enabling split page table lock for PTE tables
Date: Sat, 13 Jun 2026 15:14:47 -0700
Message-ID: <20260613221448.98657-1-enelsonmoore@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The mm documentation regarding split page table lock for PTE tables
refers to the CONFIG_SPLIT_PTLOCK_CPUS config option, which was
superseded by CONFIG_SPLIT_PTE_PTLOCKS in commit 394290cba966 ("mm:
turn USE_SPLIT_PTE_PTLOCKS / USE_SPLIT_PTE_PTLOCKS into Kconfig
options"). Update the documentation to refer to the current option and
document the situations in which this feature is not supported.

Discovered while searching for CONFIG_* symbols referenced in the
kernel but not defined in any Kconfig file.

Signed-off-by: Ethan Nelson-Moore <enelsonmoore@gmail.com>
---
 Documentation/mm/split_page_table_lock.rst | 9 ++++++---
 1 file changed, 6 insertions(+), 3 deletions(-)

diff --git a/Documentation/mm/split_page_table_lock.rst b/Documentation/mm/split_page_table_lock.rst
index cc3cd46abd1b..c9d16024543b 100644
--- a/Documentation/mm/split_page_table_lock.rst
+++ b/Documentation/mm/split_page_table_lock.rst
@@ -37,9 +37,12 @@ There are helpers to lock/unlock a table and other accessor functions:
  - pmd_lockptr()
 	returns pointer to PMD table lock;
 
-Split page table lock for PTE tables is enabled compile-time if
-CONFIG_SPLIT_PTLOCK_CPUS (usually 4) is less or equal to NR_CPUS.
-If split lock is disabled, all tables are guarded by mm->page_table_lock.
+Split page table lock for PTE tables is enabled compile-time (via
+CONFIG_SPLIT_PTE_PTLOCKS) if NR_CPUS is greater than or equal to 4 and an
+MMU is being used. However, it is not supported on ARM processors with
+virtually indexed, physically tagged caches, PA-RISC processors older than
+the PA-8000, or 32-bit SPARC processors. If split lock is disabled, all
+tables are guarded by mm->page_table_lock.
 
 Split page table lock for PMD tables is enabled, if it's enabled for PTE
 tables and the architecture supports it (see below).
-- 
2.43.0

