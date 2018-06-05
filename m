Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19C8B7D048
	for <lwn-linux-doc@archive.lwn.net>; Tue,  5 Jun 2018 16:45:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751748AbeFEQns (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 5 Jun 2018 12:43:48 -0400
Received: from mx2.suse.de ([195.135.220.15]:46843 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751877AbeFEQnr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 5 Jun 2018 12:43:47 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from relay2.suse.de (charybdis-ext-too.suse.de [195.135.220.254])
        by mx2.suse.de (Postfix) with ESMTP id D145AAD69;
        Tue,  5 Jun 2018 16:43:45 +0000 (UTC)
From:   Michal Suchanek <msuchanek@suse.de>
To:     Jonathan Corbet <corbet@lwn.net>,
        Michal Suchanek <msuchanek@suse.de>,
        Arnd Bergmann <arnd@arndb.de>,
        Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>, Aaron Wu <Aaron.Wu@analog.com>,
        Tony Luck <tony.luck@intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        "Steven Rostedt," <rostedt@goodmis.org>,
        Laura Abbott <lauraa@codeaurora.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Alexey Dobriyan <adobriyan@gmail.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Baoquan He <bhe@redhat.com>,
        Ilya Matveychikov <matvejchikov@gmail.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v10 2/5] Documentation/admin-guide: backslash support in kernel arguments.
Date:   Tue,  5 Jun 2018 18:43:09 +0200
Message-Id: <8ea00d3036146fc52ef8c582f2f4d5d674712be5.1528215659.git.msuchanek@suse.de>
X-Mailer: git-send-email 2.13.6
In-Reply-To: <cover.1528215659.git.msuchanek@suse.de>
References: <cover.1528215659.git.msuchanek@suse.de>
In-Reply-To: <cover.1528215659.git.msuchanek@suse.de>
References: <cover.1528215659.git.msuchanek@suse.de>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 Documentation/admin-guide/kernel-parameters.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.rst b/Documentation/admin-guide/kernel-parameters.rst
index b8d0bc07ed0a..327e76ebe37d 100644
--- a/Documentation/admin-guide/kernel-parameters.rst
+++ b/Documentation/admin-guide/kernel-parameters.rst
@@ -35,9 +35,9 @@ can also be entered as::
 
 	log-buf-len=1M print_fatal_signals=1
 
-Double-quotes can be used to protect spaces in values, e.g.::
+Double-quotes and backslashes can be used to protect spaces in values, e.g.::
 
-	param="spaces in here"
+	param="spaces in here" param2=spaces\ in\ here
 
 cpu lists:
 ----------
-- 
2.13.6

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
