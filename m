Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DE11C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 30 Sep 2022 15:55:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231501AbiI3Pzk (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 30 Sep 2022 11:55:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231574AbiI3Pzi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Sep 2022 11:55:38 -0400
Received: from 10.mo550.mail-out.ovh.net (10.mo550.mail-out.ovh.net [178.32.96.102])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2CD953002
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 08:55:36 -0700 (PDT)
Received: from player157.ha.ovh.net (unknown [10.108.20.46])
        by mo550.mail-out.ovh.net (Postfix) with ESMTP id 88E7D260C7
        for <linux-doc@vger.kernel.org>; Fri, 30 Sep 2022 10:30:14 +0000 (UTC)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player157.ha.ovh.net (Postfix) with ESMTPSA id DA51A2F30295C;
        Fri, 30 Sep 2022 10:30:09 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-104R0052101a6af-e51e-47df-a03f-556930440260,
                    C05B2F2BD13FA39C9993548B485976379164E02D) smtp.auth=steve@sk2.org
X-OVh-ClientIp: 82.65.25.201
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2 0/5] Update the sysctl/fs documentation
Date:   Fri, 30 Sep 2022 12:29:32 +0200
Message-Id: <20220930102937.135841-1-steve@sk2.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 14210545676090574470
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedvfedrfeehvddgvdekucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepufhtvghphhgvnhcumfhithhtuceoshhtvghvvgesshhkvddrohhrgheqnecuggftrfgrthhtvghrnhepleegteeujeffjeefjeevhfdtudefjefgteelgedtudekleeiledvvdetudevjedtnecukfhppedtrddtrddtrddtpdekvddrieehrddvhedrvddtudenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhhouggvpehsmhhtphhouhhtpdhhvghlohepphhlrgihvghrudehjedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhnsggprhgtphhtthhopedupdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrghdpoffvtefjohhsthepmhhoheehtd
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series updates the sysctl/fs in line with similar changes
made previously to sysctl/kernel and sysctl/abi:

* add an automatically-generated table of contents,
* order the entries alphabetically,
* use consistent markup.

In addition, obsolete entries are removed, and the two aio sections
are merged.

Changes since v2:
* added a cover letter
* request review from linux-fsdevel
* fix the link to core_pattern

Stephen Kitt (5):
  docs: sysctl/fs: remove references to inode-max
  docs: sysctl/fs: remove references to dquot-max/-nr
  docs: sysctl/fs: merge the aio sections
  docs: sysctl/fs: remove references to super-max/-nr
  docs: sysctl/fs: re-order, prettify

 Documentation/admin-guide/sysctl/fs.rst     | 240 ++++++++------------
 Documentation/admin-guide/sysctl/kernel.rst |   2 +
 2 files changed, 97 insertions(+), 145 deletions(-)


base-commit: c3e0e1e23c70455916ff3472072437b3605c6cfe
-- 
2.31.1

