Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 7888B7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 17:53:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751337AbeCIRxn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 12:53:43 -0500
Received: from ms.lwn.net ([45.79.88.28]:50158 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751325AbeCIRxn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Mar 2018 12:53:43 -0500
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id C79572CA;
        Fri,  9 Mar 2018 17:53:42 +0000 (UTC)
Date:   Fri, 9 Mar 2018 10:53:41 -0700
From:   Jonathan Corbet <corbet@lwn.net>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     LKML <linux-kernel@vger.kernel.org>, linux-doc@vger.kernel.org
Subject: [PULL] Documentation build fix
Message-ID: <20180309105341.4700dc4a@lwn.net>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The following changes since commit
e67548254b86a4a6e1b493f041bb7fe28ee74249:

  Merge tag 'mips_fixes_4.16_4' of git://git.kernel.org/pub/scm/linux/kernel/git/jhogan/mips (2018-03-08 10:03:12 -0800)

are available in the Git repository at:

  git://git.lwn.net/linux.git tags/docs-4.16-fix

for you to fetch changes up to ff690eeed804f112242f9a0614eafdf559f9276a:

  Documentation/sphinx: Fix Directive import error (2018-03-09 10:46:14 -0700)

----------------------------------------------------------------
The Sphinx 1.7 release broke the build process for reasons that are mostly
our fault.  This is a single fix, cherry-picked from docs-next (where it
has been for a few days now), that restores docs buildability for all
supported Sphinx versions.

----------------------------------------------------------------
Matthew Wilcox (1):
      Documentation/sphinx: Fix Directive import error

 Documentation/sphinx/kerneldoc.py | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
