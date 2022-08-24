Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E1B9DC32796
	for <linux-doc@archiver.kernel.org>; Wed, 24 Aug 2022 16:33:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238384AbiHXQd1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 24 Aug 2022 12:33:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53912 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239969AbiHXQbT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 24 Aug 2022 12:31:19 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C5D969C1C0
        for <linux-doc@vger.kernel.org>; Wed, 24 Aug 2022 09:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1661358677;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=UXUvPXR+b9lqF8hwT6ic9kgmL6Hea0lIAs1c1MqWYvI=;
        b=OFBG9OgerPn3otcStxdFtkdyciLFCHTK14qOMv4LqYF0mfzfOPwlakFFtf9GZEx/Ydtdjq
        CoRXfrQNAmmGRFHS7ZGBhFa4THHDCY8Bl+6l+cX2vu7RCXcjqoq+BbFEM3Z8qQgrA1inqC
        QbmSU0r+XX7st1wVbP9s+WzeVVYViqs=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-552-SCBzPGAuN0qxwGul-CpxkQ-1; Wed, 24 Aug 2022 12:31:14 -0400
X-MC-Unique: SCBzPGAuN0qxwGul-CpxkQ-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 140248039A1;
        Wed, 24 Aug 2022 16:31:14 +0000 (UTC)
Received: from t480s.redhat.com (unknown [10.39.193.5])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 9EF3840315A;
        Wed, 24 Aug 2022 16:31:10 +0000 (UTC)
From:   David Hildenbrand <david@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        kexec@lists.infradead.org, David Hildenbrand <david@redhat.com>,
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
        Dave Young <dyoung@redhat.com>
Subject: [PATCH RFC 2/2] checkpatch: warn on usage of VM_BUG_ON() and friends
Date:   Wed, 24 Aug 2022 18:31:00 +0200
Message-Id: <20220824163100.224449-3-david@redhat.com>
In-Reply-To: <20220824163100.224449-1-david@redhat.com>
References: <20220824163100.224449-1-david@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

checkpatch does not point out that VM_BUG_ON() and friends should be
avoided, however, Linus notes:

    VM_BUG_ON() has the exact same semantics as BUG_ON. It is literally
    no different, the only difference is "we can make the code smaller
    because these are less important". [1]

So let's warn on VM_BUG_ON() and friends as well. While at it, make it
clearer that the kernel really shouldn't be crashed.

Note that there are some other *_BUG_ON flavors, but they are not all
bad: for example, KVM_BUG_ON() only triggers a WARN_ON_ONCE and then
flags KVM as being buggy, so we'll not care about them for now here.

[1] https://lore.kernel.org/r/CAHk-=wg40EAZofO16Eviaj7mfqDhZ2gVEbvfsMf6gYzspRjYvw@mail.gmail.com

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 scripts/checkpatch.pl | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 79e759aac543..4c18acf17032 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -4695,12 +4695,12 @@ sub process {
 			}
 		}
 
-# avoid BUG() or BUG_ON()
-		if ($line =~ /\b(?:BUG|BUG_ON)\b/) {
+# do not use BUG(), BUG_ON(), VM_BUG_ON() and friends.
+		if ($line =~ /\b(?:BUG|BUG_ON|VM_BUG_ON|VM_BUG_ON_[A-Z]+)\b/) {
 			my $msg_level = \&WARN;
 			$msg_level = \&CHK if ($file);
 			&{$msg_level}("AVOID_BUG",
-				      "Avoid crashing the kernel - try using WARN_ON & recovery code rather than BUG() or BUG_ON()\n" . $herecurr);
+				      "Do not crash the kernel unless it is unavoidable - use WARN_ON_ONCE & recovery code (if reasonable) rather than BUG(), BUG_ON(), VM_BUG_ON(), ...\n" . $herecurr);
 		}
 
 # avoid LINUX_VERSION_CODE
-- 
2.37.1

