Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAEB2E7BD3
	for <linux-doc@vger.kernel.org>; Wed, 10 Jun 2026 05:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781070009; cv=none; b=SLpMoaFqc88kDikTfhL/45LePfnDS3Y2/BHCQ1iscDMC78Eb8jaoyVabeaJYcHeaTrDLCzjEm2cwPibYdkubMa0ujQd0XvysB7h9q9/szlvQtgcOGGUEFfmAqiJOYz/gaI6PNKLt0R8BkptaWoKkAaHgaeQrRZpHGu9RPbf1Qks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781070009; c=relaxed/simple;
	bh=Qux6qw0K8leQGi/4WMI+uwr8oZG72FXB/rZyakTsEdE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mQr4PdxXlCHMlctQQ5Jl57sjAJ8cIp20YBiYTbI9JrOhZrUjtrWkTT53slDmF2jYpISglUQlvlpdZkOIIheYLIa1WpSy74h8FhQ4iCL0KI+SrO/qly90DdV++ZWWc91G102VxmdzRm2lf3m7IIfHfNshb3WtKlWkk18ZV2FIwIo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=N0exQaLS; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N0exQaLS"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-45ee45db96dso396112f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 22:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781070006; x=1781674806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ZXdRRa/zk7c1is5MErVAcERRsYOulHfSrsDOswfrhUg=;
        b=N0exQaLSEHfqDcVb1wZwXb66ZyKD0Sbkdn3DU425L6s1sv6Ps7b3xmH508NcF69GIW
         +Udy434mvylp9+Rh3dCpramWrh1w4vRp9UAfJK9UMQIFbPraA8n4HNgNBLqs79K7mYIY
         fijEe9KgIxUz0zkvjA7Jse6lF2ipfK7KG2RUX4i/W4QSPDggwia0eLRtqVUnZ5LA6uOL
         4xJ5/cAmnJ10yzAgSWVvEVwMDCqJxNy8hyWneaMTtNyN4ykopL8pmACLslVP/66nxo5o
         T1UNCj0wzhv6D3HK+wynliQzTaRVmLzW3esKNQ3q2vgMKcnE6WfMZ14QnDDyFt832X/2
         Ojag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781070006; x=1781674806;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZXdRRa/zk7c1is5MErVAcERRsYOulHfSrsDOswfrhUg=;
        b=Objy04ljFtBeX6dgmBDGwRoy6VukV55J7huYYgsZF5mpwyo/2NwrL25xBmEyDQ2+ib
         KSHiGe2cmo9HFKz8LRIFCUMkHiCfYBjzIvwQNDh//OmDFRxVvTUV9zTnABKakj8niZ9e
         1dw0ukExBYb0bVFVSKtP6kuC49Nejq4lX7hQoJelll0EuNFAJqOfmFse89Gwu1gnwSRh
         20s7sZEsMr9ufzoVxDShFuVZ8Z21lqwcC+wiVq+0gQH2cLtsUeyehi944hzO4M1BJYH1
         8qBkCoDPCbK047yoEPgzp9YVHQLHq5xJVWlK9aQNBu1ZYBANUXuLjIQuGPBlIO5DbjM7
         vUBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Yji1aA2xV+Meisa+BU3hMDhPB6NiR/HBZcl0K78PR6NjtscbyGi6ubYMnSSSLv3AcOxq4WcMWe58=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy23IArjEpHh+OR+HCHZ1X6DQlvLWyGenZactSY/Kh7QfucD8Bo
	OuJq/l7+YDzGroGDJAz4rwcJbWJVYdOk4PU04Be0UmQ1HdBlQxZGZ8P6
X-Gm-Gg: Acq92OFJrBzmZKvirwOwLDbyoEVJsUWWq62IQDWJXJYQaYTrHNT9RnwqK6iEHiXGE9m
	3jgxKMEFcF4UamB3zfjYZBH+BAfASXpNwOfuXLLzKj7R0pDGLeeKBPkuzgY/Y0QZc/cp7/tHLfQ
	QYW/jy2Jhn6eGBX2GV1HhkYRyOlGCJ7W6OPsxHaFT45Dy5+2o2RhgwisPu4J20zhvnFrkTniuM2
	0J+V5GuT+OxJDPFb5xh9sWbLunkhlkeCaLLKPHCd6BLLh3Vkc21eBgBHsJmKnqul5E3OR0ngVSa
	zCHvhMDUyT797gn55iL22zK968EG27EyZstTENhBjewGe3xiLPmQUc87fVzvxzX7Us8BCoD9ojf
	CTF81c7SAtkCGmps/4sg3V7PEXRNAczvh9jSkIvPp+dTEAaaLz8bpVLmih5yEwBNagnLLUgsN+E
	7Fcybkna0X0TE2hQCjJx6Y40GrH/Mrp4D6Dc/pVRRwQXCp6Wm1gL7btOy1X+Qps94daiUlL5BRv
	G/M/F77MQ6KgAk4J6bfUI/1IcJSxscFgLfyu00zds9WU0Rm
X-Received: by 2002:a05:6000:70f:b0:45e:8a08:93fa with SMTP id ffacd0b85a97d-460566c1c21mr3027030f8f.4.1781070005579;
        Tue, 09 Jun 2026 22:40:05 -0700 (PDT)
Received: from doehyun-dev.pradel.rg.cispa.de (x06.xlate.fw.cispa.de. [195.37.157.6])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f2f2710sm53831009f8f.14.2026.06.09.22.40.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 22:40:05 -0700 (PDT)
From: Doehyun Baek <doehyunbaek@gmail.com>
To: SeongJae Park <sj@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Doehyun Baek <doehyunbaek@gmail.com>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	damon@lists.linux.dev,
	linux-mm@kvack.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5] Docs/{admin-guide,mm}/damon: fix DAMON documentation details
Date: Wed, 10 Jun 2026 05:39:50 +0000
Message-ID: <20260610053951.553739-1-doehyunbaek@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix minor DAMON documentation issues.  Correct the sysfs scheme file name
apply_interval_us, the DAMON_STAT module count, a malformed reference, a
misplaced label indentation, and a few typos.

Signed-off-by: Doehyun Baek <doehyunbaek@gmail.com>
---
Changes from v4:
- Rebased on mm-new.
- Sent the English documentation fixes as a standalone patch.
- Dropped the Chinese translation patch from this submission.

 Documentation/admin-guide/mm/damon/usage.rst |  8 ++++----
 Documentation/mm/damon/design.rst            | 12 ++++++------
 2 files changed, 10 insertions(+), 10 deletions(-)

diff --git a/Documentation/admin-guide/mm/damon/usage.rst b/Documentation/admin-guide/mm/damon/usage.rst
index 011296f1e7c2..b2649ea011f9 100644
--- a/Documentation/admin-guide/mm/damon/usage.rst
+++ b/Documentation/admin-guide/mm/damon/usage.rst
@@ -246,7 +246,7 @@ writing to and reading from the files.
 Under ``nr_regions`` directory, two files for the lower-bound and upper-bound
 of DAMON's monitoring regions (``min`` and ``max``, respectively), which
 controls the monitoring overhead, exist.  You can set and get the values by
-writing to and rading from the files.
+writing to and reading from the files.
 
 For more details about the intervals and monitoring regions range, please refer
 to the Design document (:doc:`/mm/damon/design`).
@@ -264,7 +264,7 @@ Please refer to  the :ref:`design document of the feature
 <damon_design_monitoring_intervals_autotuning>` for the internal of the tuning
 mechanism.  Reading and writing the four files under ``intervals_goal``
 directory shows and updates the tuning parameters that described in the
-:ref:design doc <damon_design_monitoring_intervals_autotuning>` with the same
+:ref:`design doc <damon_design_monitoring_intervals_autotuning>` with the same
 names.  The tuning starts with the user-set ``sample_us`` and ``aggr_us``.  The
 tuning-applied current values of the two intervals can be read from the
 ``sample_us`` and ``aggr_us`` files after writing ``update_tuned_intervals`` to
@@ -377,7 +377,7 @@ schemes/<N>/
 In each scheme directory, nine directories (``access_pattern``, ``quotas``,
 ``watermarks``, ``core_filters``, ``ops_filters``, ``filters``, ``dests``,
 ``stats``, and ``tried_regions``) and three files (``action``, ``target_nid``
-and ``apply_interval``) exist.
+and ``apply_interval_us``) exist.
 
 The ``action`` file is for setting and getting the scheme's :ref:`action
 <damon_design_damos_action>`.  The keywords that can be written to and read
@@ -743,7 +743,7 @@ counter).  Finally the tenth field (``X``) shows the ``age`` of the region
 (refer to :ref:`design <damon_design_age_tracking>` for more details of the
 counter).
 
-If the event was ``damon:damos_beofre_apply``, the ``perf script`` output would
+If the event was ``damon:damos_before_apply``, the ``perf script`` output would
 be somewhat like below::
 
     kdamond.0 47293 [000] 80801.060214: damon:damos_before_apply: ctx_idx=0 scheme_idx=0 target_idx=0 nr_regions=11 121932607488-135128711168: 0 136
diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 2da7ca0d3d17..c16a3bb288d0 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -86,7 +86,7 @@ To know how user-space can do the configuration via :ref:`DAMON sysfs interface
 documentation.
 
 
- .. _damon_design_vaddr_target_regions_construction:
+.. _damon_design_vaddr_target_regions_construction:
 
 VMA-based Target Address Range Construction
 -------------------------------------------
@@ -930,11 +930,11 @@ control parameters for the usage would also need to be optimized for the
 purpose.
 
 To support such cases, yet more DAMON API user kernel modules that provide more
-simple and optimized user space interfaces are available.  Currently, two
-modules for proactive reclamation and LRU lists manipulation are provided.  For
-more detail, please read the usage documents for those
-(:doc:`/admin-guide/mm/damon/stat`, :doc:`/admin-guide/mm/damon/reclaim` and
-:doc:`/admin-guide/mm/damon/lru_sort`).
+simple and optimized user space interfaces are available.  Currently, three
+modules for access monitoring statistics, proactive reclamation, and LRU lists
+manipulation are provided.  For more detail, please read the usage documents for
+those (:doc:`/admin-guide/mm/damon/stat`, :doc:`/admin-guide/mm/damon/reclaim`
+and :doc:`/admin-guide/mm/damon/lru_sort`).
 
 .. _damon_design_special_purpose_modules_exclusivity:
 

base-commit: ce70d5abbf4f9930a07eddb06f40a0ea3494e33a
-- 
2.43.0

