Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 518D87E3DB
	for <lwn-linux-doc@archive.lwn.net>; Tue,  7 Aug 2018 19:12:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732639AbeHGVTY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 7 Aug 2018 17:19:24 -0400
Received: from isolus.tardis.ed.ac.uk ([193.62.81.50]:60176 "EHLO
        isolus.tardis.ed.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389881AbeHGVNG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Aug 2018 17:13:06 -0400
X-Greylist: delayed 557 seconds by postgrey-1.27 at vger.kernel.org; Tue, 07 Aug 2018 17:13:05 EDT
Received: by isolus.tardis.ed.ac.uk (Postfix, from userid 110)
        id 56AAE320270; Tue,  7 Aug 2018 19:48:06 +0100 (BST)
Received: from [127.0.0.1] (fox [127.0.0.1]) 
        by isolus.tardis.ed.ac.uk (Postfix) with ESMTPSA id DE24532021B;
        Tue,  7 Aug 2018 19:48:03 +0100 (BST)
From:   Fox Foster <fox@tardis.ed.ac.uk>
To:     linux-doc@vger.kernel.org
Cc:     Fox Foster <fox@tardis.ed.ac.uk>, Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH] Remove gendered language from management style documentation
Date:   Tue,  7 Aug 2018 19:47:51 +0100
Message-Id: <20180807184751.28039-1-fox@tardis.ed.ac.uk>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This small commit replaces gendered pronouns for neutral ones.

Signed-off-by: Fox Foster <fox@tardis.ed.ac.uk>
---
 Documentation/process/management-style.rst | 25 +++++++++++-----------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/Documentation/process/management-style.rst b/Documentation/process/management-style.rst
index 45595fd8a66b..85ef8ca8f639 100644
--- a/Documentation/process/management-style.rst
+++ b/Documentation/process/management-style.rst
@@ -105,7 +105,7 @@ to admit that you are stupid when you haven't **yet** done the really
 stupid thing.
 
 Then, when it really does turn out to be stupid, people just roll their
-eyes and say "Oops, he did it again".
+eyes and say "Oops, not again".
 
 This preemptive admission of incompetence might also make the people who
 actually do the work also think twice about whether it's worth doing or
@@ -172,10 +172,10 @@ To solve this problem, you really only have two options:
    might even be amused.
 
 The option of being unfailingly polite really doesn't exist. Nobody will
-trust somebody who is so clearly hiding his true character.
+trust somebody who is so clearly hiding their true character.
 
 .. [#f2] Paul Simon sang "Fifty Ways to Leave Your Lover", because quite
-  frankly, "A Million Ways to Tell a Developer He Is a D*ckhead" doesn't
+  frankly, "A Million Ways to Tell a Developer They're a D*ckhead" doesn't
   scan nearly as well.  But I'm sure he thought about it.
 
 
@@ -219,15 +219,16 @@ Things will go wrong, and people want somebody to blame. Tag, you're it.
 
 It's not actually that hard to accept the blame, especially if people
 kind of realize that it wasn't **all** your fault.  Which brings us to the
-best way of taking the blame: do it for another guy. You'll feel good
-for taking the fall, he'll feel good about not getting blamed, and the
-guy who lost his whole 36GB porn-collection because of your incompetence
-will grudgingly admit that you at least didn't try to weasel out of it.
-
-Then make the developer who really screwed up (if you can find him) know
-**in_private** that he screwed up.  Not just so he can avoid it in the
-future, but so that he knows he owes you one.  And, perhaps even more
-importantly, he's also likely the person who can fix it.  Because, let's
+best way of taking the blame: do it for someone else. You'll feel good
+for taking the fall, they'll feel good about not getting blamed, and the
+person who lost their whole 36GB porn-collection because of your
+incompetence will grudgingly admit that you at least didn't try to weasel
+out of it.
+
+Then make the developer who really screwed up (if you can find them) know
+**in_private** that they screwed up.  Not just so they can avoid it in the
+future, but so that they know they owe you one.  And, perhaps even more
+importantly, they're also likely the person who can fix it.  Because, let's
 face it, it sure ain't you.
 
 Taking the blame is also why you get to be manager in the first place.
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
