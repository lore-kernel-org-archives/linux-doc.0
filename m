Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0C5D47D912
	for <lwn-linux-doc@archive.lwn.net>; Fri, 11 Oct 2019 03:42:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726028AbfJKDme (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 10 Oct 2019 23:42:34 -0400
Received: from trent.utfs.org ([94.185.90.103]:51652 "EHLO trent.utfs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726009AbfJKDme (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Oct 2019 23:42:34 -0400
X-Greylist: delayed 372 seconds by postgrey-1.27 at vger.kernel.org; Thu, 10 Oct 2019 23:42:33 EDT
Received: from localhost (localhost [IPv6:::1])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        by trent.utfs.org (Postfix) with ESMTPS id C7D7B5FD09;
        Fri, 11 Oct 2019 05:36:16 +0200 (CEST)
Date:   Thu, 10 Oct 2019 20:36:16 -0700 (PDT)
From:   Christian Kujau <lists@nerdbynature.de>
To:     Micah Morton <mortonm@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [TYPO] SafeSetID.rst: Remove spurious '???' characters
Message-ID: <alpine.DEB.2.21.99999.352.1910102033050.30236@trent.utfs.org>
User-Agent: Alpine 2.21.99999 (DEB 352 2019-06-22)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While reading SafeSetID.rst I stumbled across those things. This patch 
removes these spurious '???' characters.
    
Signed-off-by: Christian Kujau <lists@nerdbynature.de>

diff --git a/Documentation/admin-guide/LSM/SafeSetID.rst b/Documentation/admin-guide/LSM/SafeSetID.rst
index 212434ef65ad..7bff07ce4fdd 100644
--- a/Documentation/admin-guide/LSM/SafeSetID.rst
+++ b/Documentation/admin-guide/LSM/SafeSetID.rst
@@ -56,7 +56,7 @@ setid capabilities from the application completely and refactor the process
 spawning semantics in the application (e.g. by using a privileged helper program
 to do process spawning and UID/GID transitions). Unfortunately, there are a
 number of semantics around process spawning that would be affected by this, such
-as fork() calls where the program doesn???t immediately call exec() after the
+as fork() calls where the program doesn't immediately call exec() after the
 fork(), parent processes specifying custom environment variables or command line
 args for spawned child processes, or inheritance of file handles across a
 fork()/exec(). Because of this, as solution that uses a privileged helper in
@@ -72,7 +72,7 @@ own user namespace, and only approved UIDs/GIDs could be mapped back to the
 initial system user namespace, affectively preventing privilege escalation.
 Unfortunately, it is not generally feasible to use user namespaces in isolation,
 without pairing them with other namespace types, which is not always an option.
-Linux checks for capabilities based off of the user namespace that ???owns??? some
+Linux checks for capabilities based off of the user namespace that "owns" some
 entity. For example, Linux has the notion that network namespaces are owned by
 the user namespace in which they were created. A consequence of this is that
 capability checks for access to a given network namespace are done by checking

-- 
BOFH excuse #451:

astropneumatic oscillations in the water-cooling
