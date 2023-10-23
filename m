Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 467B21E536
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 18:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAIA3DZb"
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951B3B6
	for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 11:57:57 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-41e1974783cso10510291cf.3
        for <linux-doc@vger.kernel.org>; Mon, 23 Oct 2023 11:57:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698087476; x=1698692276; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Xhe5qTo3EMZl1JJrMjZFF/Y0SSIyPRFn/W1i6+aK9pg=;
        b=nAIA3DZbiT93OvV4LCgrg/ETTLae4F9mfUTe5VcxZ0bzd+EN56gibF081jSsvl1vse
         PAbePVWdkCRaPuPOxZtiCrjZDHJGzRg72K3A1CgD3MZPUpnw5iOtoynfsAqKqT2YsT72
         esw7+Sjs6jAty4RKj8YZA7mtLuFBvLN+JroSILg/GKfbtTbIX+F2KkxIoX4ULWPKPYwI
         TWKxxdSdypOwu7bGaO9Y4AX1wNDU8/ekOBzz0SO5vRkypGUfAqwL2ELDILJIUbuPPjKe
         90o+hJlqEXiJDkJ/iOwwO59elVqD6yYS846XdB34dEmbnPLmJroHFFAqlIr0qHyYSwZv
         jKzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698087476; x=1698692276;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xhe5qTo3EMZl1JJrMjZFF/Y0SSIyPRFn/W1i6+aK9pg=;
        b=wDAharo32EIRhcDbS4CdpgqhUlGeMfb56EpXWm+fhXn1n9+nMuUivG3DqWnZWCGMDR
         hPiRWOrLgIBBmmFUs8XqXmxvJ99qkyZbptFTy7rbVRO22XXYL/J2rD12+goMTUM6D2j3
         kXlIuWrEvEESMShhUq2yGRhflOQXx7X2b/UbY1iEmosy+bbhjPZc6wAPGul5tD2/tZ4Z
         esCVDF9iXhVWL8KtOMOTlhsAxmtYNQ4Uvjes9lqiLgPsYDkXESHynjMhDPoZJqrVA8rY
         PxavGaeGpiV1ULyCqoiCChfJfobYGkQTWA1TxyEUfbi0oCsPerSgJhbhDNrQmmjfIQAd
         hGTQ==
X-Gm-Message-State: AOJu0YzFwQ28uY51GW5N4XbifSEw9ZvX5ZMcCPUJqBHWpzHB8fTGjjjP
	UHOJS+8yp/gyzchDNn7AYd0=
X-Google-Smtp-Source: AGHT+IGiXTPWDfCYtfnc37gvE17VnfFkXVQLNjGi6ZygqZHD9QESaI6C2Lm1VZYc2imCbKHOiDvvMQ==
X-Received: by 2002:a05:622a:293:b0:41c:d0b5:c60d with SMTP id z19-20020a05622a029300b0041cd0b5c60dmr11059207qtw.19.1698087476387;
        Mon, 23 Oct 2023 11:57:56 -0700 (PDT)
Received: from nandaa-lx.mshome.net ([20.39.63.11])
        by smtp.gmail.com with ESMTPSA id b25-20020ac85419000000b00418be3e365fsm2956899qtq.1.2023.10.23.11.57.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Oct 2023 11:57:55 -0700 (PDT)
From: Anthony Nandaa <profnandaa@gmail.com>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	Anthony Nandaa <profnandaa@gmail.com>
Subject: [PATCH RFC] docs/mm: enhance the admin-guide/hugetlbpage doc
Date: Mon, 23 Oct 2023 21:53:06 +0300
Message-Id: <20231023185304.614678-1-profnandaa@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add an explicit example boot parameter for platforms that
support multiple page sizes:

For platforms that support multiple huge page sizes, the example below
will result in 512 2M and 4 1G huge pages being allocated::

	hugepagesz=2M hugepages=512 hugepagesz=1G hugepages=4

Additionally:

	1. Format/escape the literals consistently across the
	   whole page, eg. mmap -> ``mmap``. Also improves readability
	   when quickly skimming through the page.
	2. Fix some inconsitent indenting in one of the code snippets.

Signed-off-by: Anthony Nandaa <profnandaa@gmail.com>
---
 Documentation/admin-guide/mm/hugetlbpage.rst | 152 ++++++++++---------
 1 file changed, 81 insertions(+), 71 deletions(-)

diff --git a/Documentation/admin-guide/mm/hugetlbpage.rst b/Documentation/admin-guide/mm/hugetlbpage.rst
index e4d4b4a8dc97..468aca952762 100644
--- a/Documentation/admin-guide/mm/hugetlbpage.rst
+++ b/Documentation/admin-guide/mm/hugetlbpage.rst
@@ -16,12 +16,12 @@ Operating systems try to make best use of limited number of TLB resources.
 This optimization is more critical now as bigger and bigger physical memories
 (several GBs) are more readily available.
 
-Users can use the huge page support in Linux kernel by either using the mmap
-system call or standard SYSV shared memory system calls (shmget, shmat).
+Users can use the huge page support in Linux kernel by either using the ``mmap``
+system call or standard SYSV shared memory system calls (``shmget``, ``shmat``).
 
-First the Linux kernel needs to be built with the CONFIG_HUGETLBFS
-(present under "File systems") and CONFIG_HUGETLB_PAGE (selected
-automatically when CONFIG_HUGETLBFS is selected) configuration
+First the Linux kernel needs to be built with the ``CONFIG_HUGETLBFS``
+(present under "File systems") and ``CONFIG_HUGETLB_PAGE`` (selected
+automatically when ``CONFIG_HUGETLBFS`` is selected) configuration
 options.
 
 The ``/proc/meminfo`` file provides information about the total number of
@@ -42,18 +42,18 @@ The output of ``cat /proc/meminfo`` will include lines like::
 
 where:
 
-HugePages_Total
+``HugePages_Total``
 	is the size of the pool of huge pages.
-HugePages_Free
+``HugePages_Free``
 	is the number of huge pages in the pool that are not yet
         allocated.
-HugePages_Rsvd
-	is short for "reserved," and is the number of huge pages for
+``HugePages_Rsvd``
+	is short for "reserved", and is the number of huge pages for
         which a commitment to allocate from the pool has been made,
         but no allocation has yet been made.  Reserved huge pages
         guarantee that an application will be able to allocate a
         huge page from the pool of huge pages at fault time.
-HugePages_Surp
+``HugePages_Surp``
 	is short for "surplus," and is the number of huge pages in
         the pool above the value in ``/proc/sys/vm/nr_hugepages``. The
         maximum number of surplus huge pages is controlled by
@@ -62,13 +62,13 @@ HugePages_Surp
 	with each hugetlb page is enabled, the number of surplus huge pages
 	may be temporarily larger than the maximum number of surplus huge
 	pages when the system is under memory pressure.
-Hugepagesize
+``Hugepagesize``
 	is the default hugepage size (in kB).
-Hugetlb
+``Hugetlb``
         is the total amount of memory (in kB), consumed by huge
         pages of all sizes.
         If huge pages of different sizes are in use, this number
-        will exceed HugePages_Total \* Hugepagesize. To get more
+        will exceed ``HugePages_Total * Hugepagesize``. To get more
         detailed information, please, refer to
         ``/sys/kernel/mm/hugepages`` (described below).
 
@@ -91,64 +91,72 @@ be used for other purposes.  Huge pages cannot be swapped out under
 memory pressure.
 
 Once a number of huge pages have been pre-allocated to the kernel huge page
-pool, a user with appropriate privilege can use either the mmap system call
+pool, a user with appropriate privilege can use either the ``mmap`` system call
 or shared memory system calls to use the huge pages.  See the discussion of
 :ref:`Using Huge Pages <using_huge_pages>`, below.
 
 The administrator can allocate persistent huge pages on the kernel boot
-command line by specifying the "hugepages=N" parameter, where 'N' = the
+command line by specifying the ``"hugepages=N"`` parameter, where 'N' = the
 number of huge pages requested.  This is the most reliable method of
 allocating huge pages as memory has not yet become fragmented.
 
 Some platforms support multiple huge page sizes.  To allocate huge pages
 of a specific size, one must precede the huge pages boot command parameters
-with a huge page size selection parameter "hugepagesz=<size>".  <size> must
-be specified in bytes with optional scale suffix [kKmMgG].  The default huge
-page size may be selected with the "default_hugepagesz=<size>" boot parameter.
+with a huge page size selection parameter ``"hugepagesz=<size>"``.  <size> must
+be specified in bytes with optional scale suffix ``[kKmMgG]``.  The default huge
+page size may be selected with the ``"default_hugepagesz=<size>"`` boot
+parameter.
 
 Hugetlb boot command line parameter semantics
 
-hugepagesz
-	Specify a huge page size.  Used in conjunction with hugepages
+``hugepagesz``
+	Specify a huge page size.  Used in conjunction with ``hugepages``
 	parameter to preallocate a number of huge pages of the specified
-	size.  Hence, hugepagesz and hugepages are typically specified in
-	pairs such as::
+	size.  Hence, ``hugepagesz`` and ``hugepages`` are typically specified
+        in pairs such as::
 
-		hugepagesz=2M hugepages=512
+                hugepagesz=2M hugepages=512
 
-	hugepagesz can only be specified once on the command line for a
+        For platforms that support multiple huge page sizes, the example below
+        will result in 512 2M and 4 1G huge pages being allocated::
+
+                hugepagesz=2M hugepages=512 hugepagesz=1G hugepages=4
+
+	``hugepagesz`` can only be specified once on the command line for a
 	specific huge page size.  Valid huge page sizes are architecture
 	dependent.
-hugepages
+
+``hugepages``
 	Specify the number of huge pages to preallocate.  This typically
-	follows a valid hugepagesz or default_hugepagesz parameter.  However,
+	follows a valid ``hugepagesz`` or ``default_hugepagesz`` parameter.  However,
 	if hugepages is the first or only hugetlb command line parameter it
 	implicitly specifies the number of huge pages of default size to
 	allocate.  If the number of huge pages of default size is implicitly
-	specified, it can not be overwritten by a hugepagesz,hugepages
-	parameter pair for the default size.  This parameter also has a
-	node format.  The node format specifies the number of huge pages
-	to allocate on specific nodes.
+	specified, it can not be overwritten by a ``hugepagesz``, ``hugepages``
+	parameter pair for the default size.
 
 	For example, on an architecture with 2M default huge page size::
 
 		hugepages=256 hugepagesz=2M hugepages=512
 
 	will result in 256 2M huge pages being allocated and a warning message
-	indicating that the hugepages=512 parameter is ignored.  If a hugepages
+	indicating that the ``hugepages=512`` parameter is ignored.  If a hugepages
 	parameter is preceded by an invalid hugepagesz parameter, it will
 	be ignored.
 
+        This parameter also has a node format. The node format specifies
+        the number of huge pages to allocate on specific nodes.
+
 	Node format example::
 
 		hugepagesz=2M hugepages=0:1,1:2
 
-	It will allocate 1 2M hugepage on node0 and 2 2M hugepages on node1.
+	It will allocate 1 2M hugepage on ``node0`` and 2 2M hugepages on ``node1``.
 	If the node number is invalid,  the parameter will be ignored.
 
-default_hugepagesz
+``default_hugepagesz``
 	Specify the default huge page size.  This parameter can
-	only be specified once on the command line.  default_hugepagesz can
+	only be specified once on the command line.  ``default_hugepagesz`` can
 	optionally be followed by the hugepages parameter to preallocate a
 	specific number of huge pages of default size.  The number of default
 	sized huge pages to preallocate can also be implicitly specified as
@@ -161,8 +169,8 @@ default_hugepagesz
 
 	will all result in 256 2M huge pages being allocated.  Valid default
 	huge page size is architecture dependent.
-hugetlb_free_vmemmap
-	When CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is set, this enables HugeTLB
+``hugetlb_free_vmemmap``
+	When ``CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP`` is set, this enables HugeTLB
 	Vmemmap Optimization (HVO).
 
 When multiple huge page sizes are supported, ``/proc/sys/vm/nr_hugepages``
@@ -232,6 +240,7 @@ no more surplus huge pages will be allowed to be allocated.
 With support for multiple huge page pools at run-time available, much of
 the huge page userspace interface in ``/proc/sys/vm`` has been duplicated in
 sysfs.
+
 The ``/proc`` interfaces discussed above have been retained for backwards
 compatibility. The root huge page control directory in sysfs is::
 
@@ -248,12 +257,12 @@ pages may exist::
 
         demote
         demote_size
-	nr_hugepages
-	nr_hugepages_mempolicy
-	nr_overcommit_hugepages
-	free_hugepages
-	resv_hugepages
-	surplus_hugepages
+        nr_hugepages
+        nr_hugepages_mempolicy
+        nr_overcommit_hugepages
+        free_hugepages
+        resv_hugepages
+        surplus_hugepages
 
 The demote interfaces provide the ability to split a huge page into
 smaller huge pages.  For example, the x86 architecture supports both
@@ -261,23 +270,23 @@ smaller huge pages.  For example, the x86 architecture supports both
 2MB huge pages.  Demote interfaces are not available for the smallest
 huge page size.  The demote interfaces are:
 
-demote_size
+``demote_size``
         is the size of demoted pages.  When a page is demoted a corresponding
-        number of huge pages of demote_size will be created.  By default,
-        demote_size is set to the next smaller huge page size.  If there are
-        multiple smaller huge page sizes, demote_size can be set to any of
+        number of huge pages of ``demote_size`` will be created.  By default,
+        ``demote_size`` is set to the next smaller huge page size.  If there are
+        multiple smaller huge page sizes, ``demote_size`` can be set to any of
         these smaller sizes.  Only huge page sizes less than the current huge
         pages size are allowed.
 
-demote
+``demote``
         is used to demote a number of huge pages.  A user with root privileges
         can write to this file.  It may not be possible to demote the
         requested number of huge pages.  To determine how many pages were
-        actually demoted, compare the value of nr_hugepages before and after
+        actually demoted, compare the value of ``nr_hugepages`` before and after
         writing to the demote interface.  demote is a write only interface.
 
-The interfaces which are the same as in ``/proc`` (all except demote and
-demote_size) function as described above for the default huge page-sized case.
+The interfaces which are the same as in ``/proc`` (all except ``demote`` and
+``demote_size``) function as described above for the default huge page-sized case.
 
 .. _mem_policy_and_hp_alloc:
 
@@ -324,7 +333,7 @@ resulting effect on persistent huge page allocation is as follows:
 #. One or more nodes may be specified with the bind or interleave policy.
    If more than one node is specified with the preferred policy, only the
    lowest numeric id will be used.  Local policy will select the node where
-   the task is running at the time the nodes_allowed mask is constructed.
+   the task is running at the time the ``nodes_allowed`` mask is constructed.
    For local policy to be deterministic, the task must be bound to a cpu or
    cpus in a single node.  Otherwise, the task could be migrated to some
    other node at any time after launch and the resulting node will be
@@ -335,8 +344,8 @@ resulting effect on persistent huge page allocation is as follows:
    whether this policy was set explicitly by the task itself or one of its
    ancestors, such as numactl.  This means that if the task is invoked from a
    shell with non-default policy, that policy will be used.  One can specify a
-   node list of "all" with numactl --interleave or --membind [-m] to achieve
-   interleaving over all nodes in the system or cpuset.
+   node list of "all" with ``numactl --interleave`` or ``--membind [-m]`` to
+   achieve interleaving over all nodes in the system or cpuset.
 
 #. Any task mempolicy specified--e.g., using numactl--will be constrained by
    the resource limits of any cpuset in which the task runs.  Thus, there will
@@ -381,7 +390,7 @@ applied, from which node the huge page allocation will be attempted.
 Using Huge Pages
 ================
 
-If the user applications are going to request huge pages using mmap system
+If the user applications are going to request huge pages using ``mmap`` system
 call, then it is required that system administrator mount a file system of
 type hugetlbfs::
 
@@ -396,8 +405,8 @@ The ``uid`` and ``gid`` options sets the owner and group of the root of the
 file system.  By default the ``uid`` and ``gid`` of the current process
 are taken.
 
-The ``mode`` option sets the mode of root of file system to value & 01777.
-This value is given in octal. By default the value 0755 is picked.
+The ``mode`` option sets the mode of root of file system to ``value & 01777``.
+This value is given in octal. By default the value ``0755`` is picked.
 
 If the platform supports multiple huge page sizes, the ``pagesize`` option can
 be used to specify the huge page size and associated pool. ``pagesize``
@@ -407,7 +416,7 @@ default huge page size and associated pool will be used.
 The ``size`` option sets the maximum value of memory (huge pages) allowed
 for that filesystem (``/mnt/huge``). The ``size`` option can be specified
 in bytes, or as a percentage of the specified huge page pool (``nr_hugepages``).
-The size is rounded down to HPAGE_SIZE boundary.
+The size is rounded down to ``HPAGE_SIZE`` boundary.
 
 The ``min_size`` option sets the minimum value of memory (huge pages) allowed
 for the filesystem. ``min_size`` can be specified in the same way as ``size``,
@@ -426,31 +435,32 @@ If the ``size``, ``min_size`` or ``nr_inodes`` option is not provided on
 command line then no limits are set.
 
 For ``pagesize``, ``size``, ``min_size`` and ``nr_inodes`` options, you can
-use [G|g]/[M|m]/[K|k] to represent giga/mega/kilo.
+use ``[G|g]/[M|m]/[K|k]`` to represent giga/mega/kilo.
 For example, size=2K has the same meaning as size=2048.
 
 While read system calls are supported on files that reside on hugetlb
 file systems, write system calls are not.
 
-Regular chown, chgrp, and chmod commands (with right permissions) could be
-used to change the file attributes on hugetlbfs.
+Regular ``chown``, ``chgrp``, and ``chmod`` commands (with right permissions)
+could be used to change the file attributes on hugetlbfs.
 
 Also, it is important to note that no such mount command is required if
-applications are going to use only shmat/shmget system calls or mmap with
-MAP_HUGETLB.  For an example of how to use mmap with MAP_HUGETLB see
-:ref:`map_hugetlb <map_hugetlb>` below.
+applications are going to use only ``shmat``/``shmget`` system calls or
+``mmap`` with ``MAP_HUGETLB``.  For an example of how to use ``mmap``
+with ``MAP_HUGETLB`` see :ref:`map_hugetlb <map_hugetlb>` below.
 
 Users who wish to use hugetlb memory via shared memory segment should be
 members of a supplementary group and system admin needs to configure that gid
 into ``/proc/sys/vm/hugetlb_shm_group``.  It is possible for same or different
-applications to use any combination of mmaps and shm* calls, though the mount of
-filesystem will be required for using mmap calls without MAP_HUGETLB.
+applications to use any combination of ``mmap`` and ``shm*`` calls, though the
+mount of filesystem will be required for using ``mmap`` calls without
+``MAP_HUGETLB``.
 
 Syscalls that operate on memory backed by hugetlb pages only have their lengths
 aligned to the native page size of the processor; they will normally fail with
-errno set to EINVAL or exclude hugetlb pages that extend beyond the length if
-not hugepage aligned.  For example, munmap(2) will fail if memory is backed by
-a hugetlb page and the length is smaller than the hugepage size.
+``errno`` set to ``EINVAL`` or exclude hugetlb pages that extend beyond the
+length if not hugepage aligned.  For example, ``munmap(2)`` will fail if memory
+is backed by a hugetlb page and the length is smaller than the hugepage size.
 
 
 Examples
@@ -459,13 +469,13 @@ Examples
 .. _map_hugetlb:
 
 ``map_hugetlb``
-	see tools/testing/selftests/mm/map_hugetlb.c
+	see ``tools/testing/selftests/mm/map_hugetlb.c``
 
 ``hugepage-shm``
-	see tools/testing/selftests/mm/hugepage-shm.c
+	see ``tools/testing/selftests/mm/hugepage-shm.c``
 
 ``hugepage-mmap``
-	see tools/testing/selftests/mm/hugepage-mmap.c
+	see ``tools/testing/selftests/mm/hugepage-mmap.c``
 
 The `libhugetlbfs`_  library provides a wide range of userspace tools
 to help with huge page usability, environment setup, and control.
-- 
2.34.1

