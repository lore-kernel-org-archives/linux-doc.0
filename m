Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F6B5C6FA82
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 11:35:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230207AbiIWLfi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 07:35:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232186AbiIWLfW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 07:35:22 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A09A9B6009
        for <linux-doc@vger.kernel.org>; Fri, 23 Sep 2022 04:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1663932916;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=zm4C72SW81Cbx3tNeB9UTn3z5INQ0ekYL1eCBmS/H58=;
        b=Ghcs5a0Va4cvX8oWheKfA1SFHpjLWEMMPRyfvyKNaeVcVN9qQ/Q92xyHWwazsX2qNTcZas
        ucacUUazVfsSha0ouFIju/BtLd4ueZi7n4K2y+Uk3ZhqLEXauZU8kq/K7Vd8qGBDOrduo4
        ITh/kJdDS/sf1a7u01Fe7rnQ2Cl6NLY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-225-q_Vg4V3iMAWbmNFQHcW4Cw-1; Fri, 23 Sep 2022 07:34:43 -0400
X-MC-Unique: q_Vg4V3iMAWbmNFQHcW4Cw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5AAA7811E67;
        Fri, 23 Sep 2022 11:34:42 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.192.189])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 55027492B06;
        Fri, 23 Sep 2022 11:34:38 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        David Hildenbrand <david@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        David Laight <David.Laight@ACULAB.COM>,
        Jonathan Corbet <corbet@lwn.net>,
        Andy Whitcroft <apw@canonical.com>,
        Joe Perches <joe@perches.com>,
        Dwaipayan Ray <dwaipayanray1@gmail.com>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        Baoquan He <bhe@redhat.com>, Vivek Goyal <vgoyal@redhat.com>,
        Dave Young <dyoung@redhat.com>,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Akira Yokosawa <akiyks@gmail.com>,
        Kalle Valo <kvalo@kernel.org>, "Daniel K ." <daniel@cluded.net>
Subject: [PATCH v2 2/2] checkpatch: warn on usage of VM_BUG_ON() and other BUG variants
Date:   Fri, 23 Sep 2022 13:34:25 +0200
Message-Id: <20220923113426.52871-3-david@redhat.com>
In-Reply-To: <20220923113426.52871-1-david@redhat.com>
References: <20220923113426.52871-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

checkpatch does not point out that VM_BUG_ON() and friends should be
avoided, however, Linus notes:

    VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
    no different, the only difference is "we can make the code smaller
    because these are less important". [1]

So let's warn on VM_BUG_ON() and other BUG variants as well. While at it,
make it clearer that the kernel really shouldn't be crashed.

As there are some subsystem BUG macros that actually don't end up crashing
the kernel -- for example, KVM_BUG_ON() -- exclude these manually.

[1] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 79e759aac543..5ca0039f216a 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4695,12 +4695,12 @@ sub process {
 			}
 		}
 
-# avoid BUG() or BUG_ON()
-		if ($line =~ /\b(?:BUG|BUG_ON)\b/) {
+# do not use BUG() or variants
+		if ($line =~ /\b(?!AA_|BUILD_|DCCP_|IDA_|KVM_|RWLOCK_|snd_|SPIN_)(?:[a-zA-Z_]*_)?BUG(?:_ON)?(?:_[A-Z_]+)?\s*\(/) {
 			my $msg_level = \&WARN;
 			$msg_level = \&CHK if ($file);
 			&{$msg_level}("AVOID_BUG",
-				      "Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()\n" . $herecurr);
+				      "Do not crash the kernel unless it is absolutely unavoidable--use WARN_ON_ONCE() plus recovery code (if feasible) instead of BUG() or variants\n" . $herecurr);
 		}
 
 # avoid LINUX_VERSION_CODE
-- 
2.37.3

