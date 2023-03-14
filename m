Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EBABC05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Mar 2023 20:46:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbjCNUqO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Mar 2023 16:46:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229946AbjCNUqN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Mar 2023 16:46:13 -0400
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7249820A1A
        for <linux-doc@vger.kernel.org>; Tue, 14 Mar 2023 13:46:12 -0700 (PDT)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 8D4DA91E420D; Tue, 14 Mar 2023 13:45:58 -0700 (PDT)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-doc@vger.kernel.org,
        akpm@linux-foundation.org, hannes@cmpxchg.org
Subject: [PATCH v1] docs/mm: extend ksm doc
Date:   Tue, 14 Mar 2023 13:45:57 -0700
Message-Id: <20230314204557.3863923-1-shr@devkernel.io>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds a description of the new prctl interface for KSM and also adds
a general section on security concerns.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
---
 Documentation/admin-guide/mm/ksm.rst | 41 +++++++++++++++++++++++++++-
 1 file changed, 40 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-g=
uide/mm/ksm.rst
index d2929964cd0f..ba75d628f6d7 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -20,13 +20,15 @@ content which can be replaced by a single write-prote=
cted page (which
 is automatically copied if a process later wants to update its
 content). The amount of pages that KSM daemon scans in a single pass
 and the time between the passes are configured using :ref:`sysfs
-intraface <ksm_sysfs>`
+interface <ksm_sysfs>`
=20
 KSM only merges anonymous (private) pages, never pagecache (file) pages.
 KSM's merged pages were originally locked into kernel memory, but can no=
w
 be swapped out just like other user pages (but sharing is broken when th=
ey
 are swapped back in: ksmd must rediscover their identity and merge again=
).
=20
+.. _ksm_madvise:
+
 Controlling KSM with madvise
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
=20
@@ -68,6 +70,43 @@ Applications should be considerate in their use of MAD=
V_MERGEABLE,
 restricting its use to areas likely to benefit.  KSM's scans may use a l=
ot
 of processing power: some installations will disable KSM for that reason=
.
=20
+Controlling KSM with prctl
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D
+
+KSM can be enabled for a process or a cgroup, by using the prctl(2) syst=
em
+call::
+
+	int prctl(PR_SET_MEMORY_MERGE, 1)
+
+The app may call
+
+::
+
+	int prctl(PR_SET_MEMORY_MERGE, 0)
+
+to cancel that advice and restore unshared pages: whereupon KSM
+unmerges whatever is merged for that process.  Note: this unmerging call
+may suddenly require more memory than is available - possibly failing
+with EAGAIN, but more probably arousing the Out-Of-Memory killer.
+
+The restrictions mentioned in :ref:`Controlling KSM with madvise <ksm_ma=
dvise>`'
+also apply here. Also consider the security implications of using KSM.
+
+KSM security concerns
+=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
+
+KSM has the possibility of memory side channel attacks. When individual
+VMA's have KSM enabled, the security aspect needs to be considered.
+
+An individual workload doesn't know what else is running on
+the machine, so it needs to be highly conservative about what it can
+give up for system-wide merging.
+
+However, if the system is dedicated to running multiple jobs within the
+same security domain, there is a usecase where multiple instances of the
+same job are running inside a safe shared security domain and using the
+same sensitive data.
+
 .. _ksm_sysfs:
=20
 KSM daemon sysfs interface

base-commit: 5faf25f023d8816a49e168930218ffdb75d5d853
--=20
2.34.1

