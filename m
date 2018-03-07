Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 596B17E686
	for <lwn-linux-doc@archive.lwn.net>; Wed,  7 Mar 2018 21:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754547AbeCGVrY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 7 Mar 2018 16:47:24 -0500
Received: from mga03.intel.com ([134.134.136.65]:37808 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754458AbeCGVrX (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 7 Mar 2018 16:47:23 -0500
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/DHE-RSA-AES256-GCM-SHA384; 07 Mar 2018 13:47:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.47,437,1515484800"; 
   d="scan'208";a="22841928"
Received: from viggo.jf.intel.com (HELO localhost.localdomain) ([10.54.39.119])
  by orsmga007.jf.intel.com with ESMTP; 07 Mar 2018 13:47:23 -0800
Subject: [PATCH] [v2] docs: clarify security-bugs disclosure policy
To:     linux-kernel@vger.kernel.org
Cc:     Dave Hansen <dave.hansen@linux.intel.com>,
        dan.j.williams@intel.com, tglx@linutronix.de,
        gregkh@linuxfoundation.org, torvalds@linux-foundation.org,
        gnomes@lxorguk.ukuu.org.uk, aarcange@redhat.com, luto@kernel.org,
        keescook@google.com, tim.c.chen@linux.intel.com,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        linux-doc@vger.kernel.org, corbet@lwn.net, mark.rutland@arm.com
From:   Dave Hansen <dave.hansen@linux.intel.com>
Date:   Wed, 07 Mar 2018 13:46:24 -0800
Message-Id: <20180307214624.D4361772@viggo.jf.intel.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


From: Dave Hansen <dave.hansen@linux.intel.com>

I think we need to soften the language a bit.  It might scare folks
off, especially the:

	 We prefer to fully disclose the bug as soon as possible.

which is not really the case.  Linus says:

	It's not full disclosure, it's not coordinated disclosure,
	and it's not "no disclosure".  It's more like just "timely
	open fixes".

I changed a bit of the wording in here, but mostly to remove the word
"disclosure" since it seems to mean very specific things to people
that we do not mean here.

Signed-off-by: Dave Hansen <dave.hansen@linux.intel.com>
Reviewed-by: Dan Williams <dan.j.williams@intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Alan Cox <gnomes@lxorguk.ukuu.org.uk>
Cc: Andrea Arcangeli <aarcange@redhat.com>
Cc: Andy Lutomirski <luto@kernel.org>
Cc: Kees Cook <keescook@google.com>
Cc: Tim Chen <tim.c.chen@linux.intel.com>
Cc: Alexander Viro <viro@zeniv.linux.org.uk>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-doc@vger.kernel.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Mark Rutland <mark.rutland@arm.com>
---

 b/Documentation/admin-guide/security-bugs.rst |   24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff -puN Documentation/admin-guide/security-bugs.rst~embargo2 Documentation/admin-guide/security-bugs.rst
--- a/Documentation/admin-guide/security-bugs.rst~embargo2	2018-03-07 13:23:49.390228208 -0800
+++ b/Documentation/admin-guide/security-bugs.rst	2018-03-07 13:42:37.618225395 -0800
@@ -29,18 +29,20 @@ made public.
 Disclosure
 ----------
 
-The goal of the Linux kernel security team is to work with the
-bug submitter to bug resolution as well as disclosure.  We prefer
-to fully disclose the bug as soon as possible.  It is reasonable to
-delay disclosure when the bug or the fix is not yet fully understood,
-the solution is not well-tested or for vendor coordination.  However, we
-expect these delays to be short, measurable in days, not weeks or months.
-A disclosure date is negotiated by the security team working with the
-bug submitter as well as vendors.  However, the kernel security team
-holds the final say when setting a disclosure date.  The timeframe for
-disclosure is from immediate (esp. if it's already publicly known)
+The goal of the Linux kernel security team is to work with the bug
+submitter to understand and fix the bug.  We prefer to publish the fix as
+soon as possible, but try to avoid public discussion of the bug itself
+and leave that to others.
+
+Publishing the fix may be delayed when the bug or the fix is not yet
+fully understood, the solution is not well-tested or for vendor
+coordination.  However, we expect these delays to be short, measurable in
+days, not weeks or months.  A release date is negotiated by the security
+team working with the bug submitter as well as vendors.  However, the
+kernel security team holds the final say when setting a timeframe.  The
+timeframe varies from immediate (esp. if it's already publicly known bug)
 to a few weeks.  As a basic default policy, we expect report date to
-disclosure date to be on the order of 7 days.
+release date to be on the order of 7 days.
 
 Coordination
 ------------
_
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
