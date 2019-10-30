Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_SBL_CSS,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D049B7D90D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 Oct 2019 14:00:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726475AbfJ3OA4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 Oct 2019 10:00:56 -0400
Received: from mail-wm1-f66.google.com ([209.85.128.66]:50475 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726272AbfJ3OAz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Oct 2019 10:00:55 -0400
Received: by mail-wm1-f66.google.com with SMTP id 11so2263780wmk.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Oct 2019 07:00:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=/qusyj4e5E1kwBd+D6sr2z97hPisOxmfM6OJjfXVx6s=;
        b=SBHVF9fHE2TXLgfDkLUhEAf0gfAwCxdaENx6nMK0A7IzR5amY6Z8usOX8gGyuugsgA
         MSPfUyZZ2f5ty97VrS1EHkDOm43rq0MAIfcpj7Y392h5//7vjnQ+NItHI5FuTSvwQf78
         iq+QSf0zhTf+8xww3EMwn9g+Au0iXB+uoHCVQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:mime-version
         :content-disposition:user-agent;
        bh=/qusyj4e5E1kwBd+D6sr2z97hPisOxmfM6OJjfXVx6s=;
        b=E790npiVCOxD9PK98Bu5kDPxCSphxFX0/bSpdENtZRYIjbpV533ozOl5tuzj3hLB9x
         sczkZOXSBPGj34CY2NIx/gqNxloVHnrNSvPy6PGJxwdIrl2DExOAFdq1JRPtx3y6u2lY
         XRq0CfUrSVGnNq8s+/V5yEp8DQj7LvVTG+ODl0WeXKoJbDeRX77g4RMnaNpuXRhlnLrX
         cNlaL5d8wADSD2TqFpGdmAP8u5EjLuiZn9F0RVoj2HGZYULbO5YYPPRGaOtyDjRgtnSb
         HTFHCpYhgrZz/Z2sfp+JQkLBBtE5mDcsBOicbfYOTa30CozWn/OuNa/J3mr+I/fpcNk6
         ttZg==
X-Gm-Message-State: APjAAAWGS+Eu39pZtpq5AUDq9xhnVO3XLYZ0R2GC1UPseyZM9W2+B9XD
        fCa4MTBzQzM6jG6roYIv7VLgGMrpVTES5w==
X-Google-Smtp-Source: APXvYqyTJebcI1vem36U3pjqfakuuGMWT81ZoWzW46ZKpENhnhVtnsagq/ELuT2EQ+IsNQ+6v5ToEw==
X-Received: by 2002:a05:600c:2248:: with SMTP id a8mr9135552wmm.176.1572444053481;
        Wed, 30 Oct 2019 07:00:53 -0700 (PDT)
Received: from pure.paranoia.local ([91.217.168.176])
        by smtp.gmail.com with ESMTPSA id w22sm146010wmi.7.2019.10.30.07.00.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Oct 2019 07:00:52 -0700 (PDT)
Date:   Wed, 30 Oct 2019 10:00:50 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org
Subject: [PATCH] docs: process: Add base-commit trailer usage
Message-ID: <20191030140050.GA16353@pure.paranoia.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Patchwork-Bot: notify
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

One of the recurring complaints from both maintainers and CI system
operators is that performing git-am on received patches is difficult
without knowing the parent object in the git history on which the
patches are based. Without this information, there is a high likelihood
that git-am will fail due to conflicts, which is particularly
frustrating to CI operators.

Git versions starting with v2.9.0 are able to automatically include
base-commit information using the --base flag of git-format-patch.
Document this usage in process/submitting-patches, and add the rationale
for its inclusion, plus instructions for those not using git on where
the "base-commit:" trailer should go.

Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 Documentation/process/submitting-patches.rst | 53 +++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index fb56297f70dc..ba5e944c7a63 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -782,7 +782,58 @@ helpful, you can use the https://lkml.kernel.org/ redirector (e.g., in
 the cover email text) to link to an earlier version of the patch series.
 
 
-16) Sending ``git pull`` requests
+16) Providing base tree information
+-----------------------------------
+
+When other developers receive your patches and start the review process,
+it is often useful for them to know where in the tree history they
+should place your work. This is particularly useful for automated CI
+processes that attempt to run a series of tests in order to establish
+the quality of your submission before the maintainer starts the review.
+
+If you are using ``git format-patch`` to generate your patches, you can
+automatically include the base tree information in your submission by
+using the ``--base`` flag. The easiest and most convenient way to use
+this option is with topical branches::
+
+    $ git checkout -t -b my-topical-branch master
+    Branch 'my-topical-branch' set up to track local branch 'master'.
+    Switched to a new branch 'my-topical-branch'
+
+    [perform your edits and commits]
+
+    $ git format-patch --base=auto --cover-letter -o outgoing/ master
+    outgoing/0000-cover-letter.patch
+    outgoing/0001-First-Commit.patch
+    outgoing/...
+
+When you open ``outgoing/0000-cover-letter.patch`` for editing, you will
+notice that it will have the ``base-commit:`` trailer at the very
+bottom, which provides the reviewer and the CI tools enough information
+to properly perform ``git am`` without worrying about conflicts::
+
+    $ git checkout -b patch-review [base-commit-id]
+    Switched to a new branch 'patch-review'
+    $ git am patches.mbox
+    Applying: First Commit
+    Applying: ...
+
+Please see ``man git-format-patch`` for more information about this
+option.
+
+.. note::
+
+    The ``--base`` feature was introduced in git version 2.9.0.
+
+If you are not using git to format your patches, you can still include
+the same ``base-commit`` trailer to indicate the commit hash of the tree
+on which your work is based. You should add it either in the cover
+letter or in the first patch of the series and it should be placed
+either below the ``---`` line or at the very bottom of all other
+content, right before your email signature.
+
+
+17) Sending ``git pull`` requests
 ---------------------------------
 
 If you have a series of patches, it may be most convenient to have the

base-commit: 23fdb198ae81f47a574296dab5167c5e136a02ba
-- 
2.21.0

