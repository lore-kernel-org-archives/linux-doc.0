Return-Path: <SRS0=H0Zm=CE=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43783C433DF
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 13:47:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C94D22B43
	for <linux-doc@archiver.kernel.org>; Wed, 26 Aug 2020 13:47:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1598449622;
	bh=lxOWZe0NvRj5PWjS+O4R6iWxBEI7vplpD8lEw3DXrYY=;
	h=From:To:Cc:Subject:Date:List-ID:From;
	b=riHFKjXs9rcZ78vsjVf/WARDeSSaA5dZBxOUiTqgG5/M2SSH5AcsqaUs9uw2+zdmf
	 QPr2r5X8lso6ljezfVWyg6PiSUuouHZv/GQd+itir5RYXsueRUfFL3sRNUkar1ozr7
	 u7oyq4wsyumM3rWY9JtVz3m2LsxbQeNKNTk6M74M=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730413AbgHZNrA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 26 Aug 2020 09:47:00 -0400
Received: from mail.kernel.org ([198.145.29.99]:56582 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1730407AbgHZNq4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 26 Aug 2020 09:46:56 -0400
Received: from mail.kernel.org (ip5f5ad5c5.dynamic.kabel-deutschland.de [95.90.213.197])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 73B7822B40;
        Wed, 26 Aug 2020 13:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1598449615;
        bh=lxOWZe0NvRj5PWjS+O4R6iWxBEI7vplpD8lEw3DXrYY=;
        h=From:To:Cc:Subject:Date:From;
        b=yi5Zsbf4PbgL1PyjG9QhxZNEjqPAItOrubBqyZf2sduxy0HZsH8wsgBhUsYCW5Enu
         uLumJCakR0YQmjbcgx3lpH11DasIRhHMC1p3c2/orhbBGZGzRWc9Css6yO/E22e+BT
         cQHJrjdB1tfHJsT63KHv2c+tHQqOWwPLtiroU85M=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kAvlN-002L50-FY; Wed, 26 Aug 2020 15:46:53 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Frank A. Cancio Bello" <frank@generalsoftwareinc.com>,
        "Joel Fernandes (Google)" <joel@joelfernandes.org>,
        linux-spdx@vger.kernel.org,
        "Steven Rostedt (VMware)" <rostedt@goodmis.org>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH v2 0/2] use SPDX also for GFDL documents
Date:   Wed, 26 Aug 2020 15:46:50 +0200
Message-Id: <cover.1598449136.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are 438 document files that were licensed under the
free versions of GNU Free Document License.

The free versions are the one that doesn't contain invariant
parts.

The first patch adds the license files.  As newer documents
aren't supposed to use them without being dual-licensed
with GPLv2, add them under LICENSE/deprecated.

The second patch replaces a boilerplate text from 
ring-buffer-design.rst by the corresponding SPDX header.

The other documents are all under Documentation/uapi/media.

A separate patchset, to be merged via the linux-media tree
will cover those.

Mauro Carvalho Chehab (2):
  LICENSE: add GFDL deprecated licenses
  docs: trace:: use the new SPDX tag

 Documentation/trace/ring-buffer-design.rst |  26 +-
 LICENSES/deprecated/GFDL-1.1               | 355 ++++++++++++++++++
 LICENSES/deprecated/GFDL-1.2               | 397 +++++++++++++++++++++
 3 files changed, 753 insertions(+), 25 deletions(-)
 create mode 100644 LICENSES/deprecated/GFDL-1.1
 create mode 100644 LICENSES/deprecated/GFDL-1.2

-- 
2.26.2


