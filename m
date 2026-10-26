Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793013732;
	b=KehDSXfX60HqyUdmviYYEMMgYPnybAqUZPqszNwIIhEE5ik4cEAcQFYia26z/23STZ+x
	 3oRtUIcMNyyMrSvnkwYviCzxT0odPZ6gMUGI/lDNvmKLOd4QQ6p9uqAV07Gd1Kx3u1EXr
	 JsnI1DDTEugSxTundZjwVwzJLbJWzTdPOsqbeW1fGSFnvQxLz49AFNL1jkED5PkuOoIra
	 cV5ik3iqFExaHVOOSlRa5Tj7TidmJAqveTGE8n1RDHN1X5DTTQhKCfQ98TPTlrALgxllS
	 vtWn8Bz8g3nw6VK4DiKKpoVsph0YM2cg/RSuz7hQB66JWtXLjfUSqV5LxeQZunaGmJQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793013732;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Date:Message-ID:In-Reply-To:References;
	bh=olwttAprMPggmCLpbuH0tIcMpbgFFVWXH2pLW4YPALQ=;
	b=Gh+MAnCIFBVkWvxbD/uhXK0O3ltc9E+HcoXoV59hXXYlQzINptl/OOP7JzBS3MeoWqdd
	 C7I7BeEyNGk6QTzyP/Iu8WTgh7gI2aFIA8XAmD5m40MC2BTZoftG7mGAGyvD9ro+IXIvH
	 SSBrTWAhd0aJWmNhOEd82SrEPfpeOkWRTauZ1+mhxn1msZ+VE39QeMiCLxZaHEbOsTdrY
	 DwB9GYES58ag12XTAmgJVVa1k4f8vIX3YA28algyVuvECbCdXyzf9qu20n5oh9jS8wPgz
	 Ug3lc7E56p/C5qOE2RrgxxAMYS89hqCtvIqrJxLRzm21j0S1E7qL0Ko6VvsoxXnE7eQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HPLUdvx7;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E767606A320
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 11:22:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E767606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=HPLUdvx7
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3ac6fe4aff0so1978405a91.0
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 04:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793013731; x=1793618531; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=olwttAprMPggmCLpbuH0tIcMpbgFFVWXH2pLW4YPALQ=;
        b=HPLUdvx7pXGRzbbmwImhVZFVBkTgUQbQWR8t5ExiX/0o9Iuh2UFRDSgsxvCCwMvM9j
         8LMJxS7SicBj4munHBT5v8J7r33u7XAfflOD/VWXo86d8NCqSdWltWr4O8HzytUNqEZb
         fCpw7K5yhWQoh25aj7ctgOAC51pPAPo/stGNkp1mHTLUpny/7oJd/1oVjeDY5jdAAqxA
         EU5/+Rc+yS6QJNngNdRFLQuy6/6t0J0NOJXae01pfXB7YNC5vmKyoMzXHr2+2+yMb/Ei
         gmm/T2+AUcdlDcniRxi/TFbCsILY8uetbiK62iMCVMPx64uu1cFIIHnvw+/38NEg+kT3
         9YIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793013731; x=1793618531;
        h=references:in-reply-to:message-id:date:content-transfer-encoding
         :content-type:mime-version:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=olwttAprMPggmCLpbuH0tIcMpbgFFVWXH2pLW4YPALQ=;
        b=Y5lHrBoteWxyEPxrmZd5sB3z1pLMMGtKQX5dipat0wIdWk2S8ywF3JqnN5tW6bz5iK
         ayoHZpB1rQa7EqKJv8QWcaSl9R7f4rsss7W+a62uNMgi8D41W9/sIwXYTRV3594J2Fl3
         qcQMF4qXqBdaW0mnKRCgvuY0d1mTqGn2ehNLOdBY7c2yWoOFF+aJMT8fQxBttSR3NGGN
         rfASKEvWzOvSRiQi0MMXgBuZua91OpRjcf6Kj2QVepKKxkUZ6dV+FSUAr/t+8r18eyAB
         cqYzo0Hx0anvQwsyOeGhR+aj2j9/rHIPwT7IZEoohCOs7y0mUbL3VP03pmfJnD6OHYQF
         4NMw==
X-Forwarded-Encrypted: i=1; AKwUvBwS7bO42qIQVC+B0nwUn+KXqyqnLLT3Rcq586Oc10Indacjb+Wo3PIkZ192uQHDXfF/26kRVPBCi+Q=@vger.kernel.org
X-Gm-Message-State: AFq9FYL7yG6rMxy92hD/enSFg7Xuq+/wb2xZB3XGqpcdFq10XyXzgCzH
	g3wFvk9IQTmde0OQj7O1dIF87+iWImJwu7jkLyHQ4B2qwRMpihcdiCpM
X-Gm-Gg: AYBFou3ApY3lfAX7xUjSYwYLSVg7dWEEMPgMbnpGkxejkOFtYR5Ltb2hG5JqgWLFhtE
	+ebJ8YJ7wfOEJR9Ro6JbeFazhyB8acEGKiR4obb9xWePDqpnjm/rnYsZMq85r1k5VGt7X44YFFN
	AvxD2KjXba3owOkViNSlHMp8x2jRIdlMR9YUcFVliv9DQ0oXzx4DLFjLSXWyAyiyak5w9JlriM8
	GRefkZTU1YI9lbVwnjXM0CQdp2c7vEuBggND1ZqxZh/xF2WJMdKNEe3HV8Nz/A5lWkSIT8O7jXc
	3dNMvgOE1MTM58W78hj5/jJxWor9Sxm2Ka8SVcuMkspwW4YWcYHyIOUYrtqW7tjWSbtVI3cBEaf
	cCktulP0eGMZzxLVVmxb2q4Mr5ulzhMlPj5aJLcO+E2dEQJ0Fxix7GRGE2zY7BwB+2NqdtbslNh
	doykB6Aw3KdNf5Tw/S87lxVr6U/d9tN4Qv9ry1HUD8kf4inq7wyWo1yyALgEA9njudOt130OJHs
	/h4pUnrtp0Jn7dwC5wM8G2PZueBvI0ezke3EwN8gUoFLpb6oF5yDGiZWOd0g6QkcGIoWJLgq3OH
	HCQdogr7AyJ3UMk4Teo0/ds2o7G803s7QxmAdNHtJfsOCfV0IMr2Rs18Vz7N7bEYj3McUpENsDc
	=
X-Received: by 2002:a17:90a:d603:b0:3ad:adfe:5854 with SMTP id 98e67ed59e1d1-3adeae76ff5mr5747644a91.40.1793013730625;
        Mon, 26 Oct 2026 04:22:10 -0700 (PDT)
Received: from localhost (n106-71-19-159.sun21.vic.optusnet.com.au. [106.71.19.159])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebae0094sm7960728a91.10.2026.10.26.04.22.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 04:22:10 -0700 (PDT)
From: Aveline Noir <jm5905938@gmail.com>
To: SJ Park <sj@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Manuel Ebner <manuelebnerli@mailbox.org>,
 damon@lists.linux.dev,
 linux-mm@kvack.org,
 linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: [PATCH 5/8] Docs/mm/damon/design: fix grammar and typos
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Date: Mon, 26 Oct 2026 22:14:37 +1100
Message-ID: <179301327249.2.12612582132957329203.damon-docs-grammar-5@gmail.com>
In-Reply-To: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>
References: <179301327249.2.4690198998605536207.damon-docs-grammar-0@gmail.com>

The design doc has quite a few relative clauses that seem to have lost
their verb, like "pages that assumed to have" or "filters that handled
by the core layer".  Fix those, along with some agreement issues and a
couple of typos: "Parreto", and "Use space", which I think should be
"User space".  Rewrap where the lines got too long.

Signed-off-by: Aveline Noir <jm5905938@gmail.com>
---
 Documentation/mm/damon/design.rst | 108 +++++++++++++++---------------
 1 file changed, 54 insertions(+), 54 deletions(-)

diff --git a/Documentation/mm/damon/design.rst b/Documentation/mm/damon/design.rst
index 1e699e3f8a49..4e3c27382b5e 100644
--- a/Documentation/mm/damon/design.rst
+++ b/Documentation/mm/damon/design.rst
@@ -35,13 +35,13 @@ Overall Architecture
 DAMON subsystem is configured with three layers including
 
 - :ref:`Operations Set <damon_operations_set>`: Implements fundamental
-  operations for DAMON that depends on the given monitoring target
+  operations for DAMON that depend on the given monitoring target
   address-space and available set of software/hardware primitives,
 - :ref:`Core <damon_core_logic>`: Implements core logics including monitoring
   overhead/accuracy control and access-aware system operations on top of the
   operations set layer, and
 - :ref:`Modules <damon_modules>`: Implements kernel modules for various
-  purposes that provides interfaces for the user space, on top of the core
+  purposes that provide interfaces for the user space, on top of the core
   layer.
 
 
@@ -137,8 +137,8 @@ finding the relevant PTE Accessed bit(s) from the address.  While the
 implementation for the virtual address walks the page table for the target task
 of the address, the implementation for the physical address walks every page
 table having a mapping to the address.  In this way, the implementations find
-and clear the bit(s) for next sampling target address and checks whether the
-bit(s) set again after one sampling period.  This could disturb other kernel
+and clear the bit(s) for next sampling target address and check whether the
+bit(s) are set again after one sampling period.  This could disturb other kernel
 subsystems using the Accessed bits, namely Idle page tracking and the reclaim
 logic.  DAMON does nothing to avoid disturbing Idle page tracking, so handling
 the interference is the responsibility of sysadmins.  However, it solves the
@@ -177,7 +177,7 @@ ranges.  In some cases, the address space for a given operations set could be
 too large to be handled with the type.  ARM (32-bit) with large physical
 address extension is an example.  For such cases, a per-operations set
 parameter called ``address unit`` is provided.  It represents the scale factor
-that need to be multiplied to the core layer's address for calculating real
+that needs to be multiplied to the core layer's address for calculating real
 address on the given address space.  Support of ``address unit`` parameter is
 up to each operations set implementation.  ``paddr`` is the only operations set
 implementation that supports the parameter.
@@ -219,9 +219,9 @@ duration.  The resolution of the access frequency is controlled by setting
 ``sampling interval`` and ``aggregation interval``.  In detail, DAMON checks
 access to each page per ``sampling interval`` and aggregates the results.  In
 other words, counts the number of the accesses to each page.  After each
-``aggregation interval`` passes, DAMON calls callback functions that previously
-registered by users so that users can read the aggregated results and then
-clears the results.  This can be described in below simple pseudo-code::
+``aggregation interval`` passes, DAMON calls callback functions that were
+previously registered by users so that users can read the aggregated results and
+then clears the results.  This can be described in below simple pseudo-code::
 
     while monitoring_on:
         for page in monitoring_target:
@@ -244,11 +244,11 @@ Region Based Sampling
 ~~~~~~~~~~~~~~~~~~~~~
 
 To avoid the unbounded increase of the overhead, DAMON groups adjacent pages
-that assumed to have the same access frequencies into a region.  As long as the
-assumption (pages in a region have the same access frequencies) is kept, only
-one page in the region is required to be checked.  Thus, for each ``sampling
-interval``, DAMON randomly picks one page in each region, waits for one
-``sampling interval``, checks whether the page is accessed meanwhile, and
+that are assumed to have the same access frequencies into a region.  As long as
+the assumption (pages in a region have the same access frequencies) is kept,
+only one page in the region is required to be checked.  Thus, for each
+``sampling interval``, DAMON randomly picks one page in each region, waits for
+one ``sampling interval``, checks whether the page is accessed meanwhile, and
 increases the access frequency counter of the region if so.  The counter is
 called ``nr_accesses`` of the region.  Therefore, the monitoring overhead is
 controllable by setting the number of regions.  DAMON allows users to set the
@@ -367,7 +367,7 @@ attributes monitoring feature is provided.
 
 Using the feature, users can register data attributes of their interest to the
 DAMON :ref:`context <damon_design_execution_model_and_data_structures>`.  The
-registration is made by specifying a probe per attribute.  Each of the probe
+registration is made by specifying a probe per attribute.  Each of the probes
 specifies a rule to determine if a given memory region has the related
 attribute.  The rule is constructed with multiple filters.  The filters work
 same to :ref:`DAMOS filters <damon_design_damos_filters>` except the supported
@@ -383,12 +383,12 @@ filter types.  Currently below filter types are supported.
 
 If such probes are registered, DAMON executes the probes for each region's
 sampling memory when it does the access :ref:`sampling
-<damon_design_region_based_sampling>`.  The number of samples that identified
-as having the data attribute (hitting the probe) per :ref:`aggregation interval
-<damon_design_monitoring>` is accounted in a per-region per-probe counter.
-Users can therefore know how much of a given DAMON region has a specific data
-attribute by reading the per-region per-probe probe hits counter after each
-aggregation interval.
+<damon_design_region_based_sampling>`.  The number of samples that are
+identified as having the data attribute (hitting the probe) per
+:ref:`aggregation interval <damon_design_monitoring>` is accounted in a
+per-region per-probe counter.  Users can therefore know how much of a given
+DAMON region has a specific data attribute by reading the per-region per-probe
+probe hits counter after each aggregation interval.
 
 Users can optionally register probing preparation actions per probe.  If such
 actions are registered, DAMON applies the actions to each region's sampling
@@ -480,7 +480,7 @@ given memory region.
 Dynamic Target Space Updates Handling
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
-The monitoring target address range could dynamically changed.  For example,
+The monitoring target address range could be dynamically changed.  For example,
 virtual memory could be dynamically mapped and unmapped.  Physical memory could
 be hot-plugged.
 
@@ -518,8 +518,8 @@ to converge regions with the :ref:`regions adjustment mechanism
 time scale of the given purpose.  This could happen if the workload is actually
 making only rare accesses but the user thinks the amount of accesses for the
 monitoring purpose too high.  For such cases, the target amount of access to
-capture per ``aggregation interval`` should carefully reconsidered.  Also, note
-that the captured amount of accesses is represented with not only
+capture per ``aggregation interval`` should be carefully reconsidered.  Also,
+note that the captured amount of accesses is represented with not only
 ``nr_accesses``, but also ``age``.  For example, even if every region on the
 monitoring results show zero ``nr_accesses``, regions could still be
 distinguished using ``age`` values as the recency information.
@@ -566,7 +566,7 @@ interval`` based on the :ref:`the tuning guide idea
 users to set the aimed amount of access events to observe via DAMON within
 given time interval.  The target can be specified by the user as a ratio of
 DAMON-observed access events to the theoretical maximum amount of the events
-(``access_bp``) that measured within a given number of aggregations
+(``access_bp``) that is measured within a given number of aggregations
 (``aggrs``).  The ratio is in basis point (bp or 1/10,000).
 
 The DAMON-observed access events are calculated in byte granularity based on
@@ -578,7 +578,7 @@ with theoretical maximum ``nr_accesses``, which can be calculated as
 ``aggregation interval / sampling interval``.
 
 The mechanism calculates the ratio of access events for ``aggrs`` aggregations,
-and increases or decrease the ``sampling interval`` and ``aggregation
+and increases or decreases the ``sampling interval`` and ``aggregation
 interval`` in same ratio, if the observed access ratio is lower or higher than
 the target, respectively.  The ratio of the intervals change is decided in
 proportion to the distance between current samples ratio and the target ratio.
@@ -587,12 +587,12 @@ The user can further set the minimum and maximum ``sampling interval`` that can
 be set by the tuning mechanism using two parameters (``min_sample_us`` and
 ``max_sample_us``).  Because the tuning mechanism changes ``sampling interval``
 and ``aggregation interval`` in same ratio always, the minimum and maximum
-``aggregation interval`` after each of the tuning changes can automatically set
-together.
+``aggregation interval`` after each of the tuning changes can be automatically
+set together.
 
-The tuning is turned off by default, and need to be set explicitly by the user.
-As a rule of thumbs and the Parreto principle, 4% access samples ratio target
-is recommended.  Note that Parreto principle (80/20 rule) has applied twice.
+The tuning is turned off by default, and needs to be set explicitly by the user.
+As a rule of thumb and the Pareto principle, 4% access samples ratio target
+is recommended.  Note that Pareto principle (80/20 rule) has been applied twice.
 That is, assumes 4% (20% of 20%) DAMON-observed access events ratio (source)
 to capture 64% (80% multiplied by 80%) real access events (outcomes).
 
@@ -831,14 +831,14 @@ auto-tuning mechanism tries to make ``current_value`` of ``complement``-ed
 ``target_metric`` be same to ``target_value``.
 
 - ``user_input``: User-provided value.  Users could use any metric that they
-  has interest in for the value.  Use space main workload's latency or
+  have interest in for the value.  User space main workload's latency or
   throughput, system metrics like free memory ratio or memory pressure stall
   time (PSI) could be examples.  Note that users should explicitly set
   ``current_value`` on their own in this case.  In other words, users should
   repeatedly provide the feedback.
 - ``some_mem_psi_us``: System-wide ``some`` memory pressure stall information
-  in microseconds that measured from last quota reset to next quota reset.
-  DAMOS does the measurement on its own, so only ``target_value`` need to be
+  in microseconds that is measured from last quota reset to next quota reset.
+  DAMOS does the measurement on its own, so only ``target_value`` needs to be
   set by users at the initial time.  In other words, DAMOS does self-feedback.
 - ``node_mem_used_bp``: Specific NUMA node's used memory ratio in basis point
   (bp or 1/10,000).
@@ -927,16 +927,16 @@ number of filters for each scheme.  Each filter specifies
 For efficient handling of filters, some types of filters are handled by the
 core layer, while others are handled by operations set.  In the latter case,
 hence, support of the filter types depends on the DAMON operations set.  In
-case of the core layer-handled filters, the memory regions that excluded by the
-filter are not counted as the scheme has tried to the region.  In contrast, if
-a memory regions is filtered by an operations set layer-handled filter, it is
+case of the core layer-handled filters, the memory regions that are excluded by
+the filter are not counted as the scheme has tried to the region.  In contrast,
+if a memory region is filtered by an operations set layer-handled filter, it is
 counted as the scheme has tried.  This difference affects the statistics.
 
-When multiple filters are installed, the group of filters that handled by the
-core layer are evaluated first.  After that, the group of filters that handled
-by the operations layer are evaluated.  Filters in each of the groups are
+When multiple filters are installed, the group of filters that are handled by
+the core layer is evaluated first.  After that, the group of filters that are
+handled by the operations layer is evaluated.  Filters in each of the groups are
 evaluated in the installed order.  If a part of memory is matched to one of the
-filter, next filters are ignored.  If the part passes through the filters
+filters, next filters are ignored.  If the part passes through the filters
 evaluation stage because it is not matched to any of the filters, applying the
 scheme's action to it depends on the last filter's allowance type.  If the last
 filter was for allowing, the part of memory will be rejected, and vice versa.
@@ -955,26 +955,26 @@ Below ``type`` of filters are currently supported.
 
 - Core layer handled
     - addr
-        - Applied to pages that belonging to a given address range.
+        - Applied to pages that belong to a given address range.
     - target
-        - Applied to pages that belonging to a given DAMON monitoring target.
+        - Applied to pages that belong to a given DAMON monitoring target.
     - probe_hits_wsum
         - Matches to monitoring regions having a given range of :ref:`probe
           hits weighted sum <damon_design_attrs_only_monitoring>` value.
 - Operations layer handled, supported by only ``paddr`` operations set.
     - anon
-        - Applied to pages that containing data that not stored in files.
+        - Applied to pages that contain data that are not stored in files.
     - active
         - Applied to active pages.
     - memcg
-        - Applied to pages that belonging to a given cgroup.
+        - Applied to pages that belong to a given cgroup.
     - young
         - Applied to pages that are accessed after the last access check from the
           scheme.
     - hugepage_size
-        - Applied to pages that managed in a given size range.
+        - Applied to pages that are managed in a given size range.
     - unmapped
-        - Applied to pages that unmapped.
+        - Applied to pages that are unmapped.
 
 To know how user-space can set the filters via :ref:`DAMON sysfs interface
 <sysfs_interface>`, refer to :ref:`filters <sysfs_filters>` part of the
@@ -1008,14 +1008,14 @@ the region is eligible to apply the scheme's :ref:`action
 <damon_design_damos_access_pattern>`, :ref:`quotas
 <damon_design_damos_quotas>`, :ref:`watermarks
 <damon_design_damos_watermarks>`, and :ref:`filters
-<damon_design_damos_filters>` that handled on core logic could affect this.
+<damon_design_damos_filters>` that are handled on core logic could affect this.
 The core logic will only ask the underlying :ref:`operation set
-<damon_operations_set>` to do apply the action to the region, so whether the
+<damon_operations_set>` to apply the action to the region, so whether the
 action is really applied or not is unclear.  That's why it is called "tried".
 
 "A scheme is applied to a region" means the :ref:`operation set
 <damon_operations_set>` has applied the action to at least a part of the
-region.  The :ref:`filters <damon_design_damos_filters>` that handled by the
+region.  The :ref:`filters <damon_design_damos_filters>` that are handled by the
 operation set, and the types of the :ref:`action <damon_design_damos_action>`
 and the pages of the region can affect this.  For example, if a filter is set
 to exclude anonymous pages and the region has only anonymous pages, or if the
@@ -1034,12 +1034,12 @@ documentation.
 Regions Walking
 ~~~~~~~~~~~~~~~
 
-DAMOS feature allowing users access each region that a DAMOS action has just
+DAMOS feature allowing users to access each region that a DAMOS action has just
 applied.  Using this feature, DAMON :ref:`API <damon_design_api>` allows users
-access full properties of the regions including the access monitoring results
+to access full properties of the regions including the access monitoring results
 and amount of the region's internal memory that passed the DAMOS filters.
-:ref:`DAMON sysfs interface <sysfs_interface>` also allows users read the data
-via special :ref:`files <sysfs_schemes_tried_regions>`.
+:ref:`DAMON sysfs interface <sysfs_interface>` also allows users to read the
+data via special :ref:`files <sysfs_schemes_tried_regions>`.
 
 .. _damon_design_api:
 
@@ -1124,7 +1124,7 @@ is already running, others will return ``-EBUSY`` upon start requests.
 Sample DAMON Modules
 --------------------
 
-DAMON modules that provides example DAMON kernel API usages.
+DAMON modules that provide example DAMON kernel API usages.
 
 kernel programmers can build their own special or general purpose DAMON modules
 using DAMON kernel API.  To help them easily understand how DAMON kernel API
