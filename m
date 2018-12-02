Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A16AB7D089
	for <lwn-linux-doc@archive.lwn.net>; Sun,  2 Dec 2018 09:50:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725790AbeLBJuD (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 2 Dec 2018 04:50:03 -0500
Received: from laurent.telenet-ops.be ([195.130.137.89]:45670 "EHLO
        laurent.telenet-ops.be" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725777AbeLBJuD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 2 Dec 2018 04:50:03 -0500
Received: from ramsan ([84.194.111.163])
        by laurent.telenet-ops.be with bizsmtp
        id 6xpy1z0083XaVaC01xpy3m; Sun, 02 Dec 2018 10:49:59 +0100
Received: from rox.of.borg ([192.168.97.57])
        by ramsan with esmtp (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gTONy-0003vg-Jx; Sun, 02 Dec 2018 10:49:58 +0100
Received: from geert by rox.of.borg with local (Exim 4.90_1)
        (envelope-from <geert@linux-m68k.org>)
        id 1gTO7c-00012d-GU; Sun, 02 Dec 2018 10:33:04 +0100
From:   Geert Uytterhoeven <geert@linux-m68k.org>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Frank Rowand <frowand.list@gmail.com>,
        Arnaldo Carvalho de Melo <acme@kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@iki.fi>,
        Bart Van Assche <bvanassche@acm.org>,
        Pavel Machek <pavel@ucw.cz>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH v3] code-of-conduct: Remove explicit list of discrimination factors
Date:   Sun,  2 Dec 2018 10:32:57 +0100
Message-Id: <20181202093257.3918-1-geert@linux-m68k.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Providing an explicit list of discrimination factors may give the false
impression that discrimination based on other unlisted factors would be
allowed.

Furthermore, this list is already overly long, polarizing,
politically-laden, and reinstating the concept of human races.
None of these is related to the goals of the Linux kernel project.

Avoid any ambiguity or political undertone by removing the list, to
ensure "a harassment-free experience for everyone", period.

Fixes: 8a104f8b5867c682 ("Code of Conduct: Let's revamp it.")
Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Frank Rowand <frowand.list@gmail.com>
Acked-by: Arnaldo Carvalho de Melo <acme@kernel.org>
Acked-by: Tomi Valkeinen <tomi.valkeinen@iki.fi>
Acked-by: Bart Van Assche <bvanassche@acm.org>
Acked-by: Pavel Machek <pavel@ucw.cz>
---
v3:
  - Add 2 Acked-bys,
  - Add more rationale to the patch description.

v2:
  - Add 3 Acked-bys.
---
 Documentation/process/code-of-conduct.rst | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/Documentation/process/code-of-conduct.rst b/Documentation/process/code-of-conduct.rst
index be50294aebd5db37..4379cce85faa804d 100644
--- a/Documentation/process/code-of-conduct.rst
+++ b/Documentation/process/code-of-conduct.rst
@@ -8,10 +8,7 @@ Our Pledge
 
 In the interest of fostering an open and welcoming environment, we as
 contributors and maintainers pledge to making participation in our project and
-our community a harassment-free experience for everyone, regardless of age, body
-size, disability, ethnicity, sex characteristics, gender identity and
-expression, level of experience, education, socio-economic status, nationality,
-personal appearance, race, religion, or sexual identity and orientation.
+our community a harassment-free experience for everyone.
 
 Our Standards
 =============
-- 
2.17.1

