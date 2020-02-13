Return-Path: <SRS0=/07d=4B=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0432BC3B189
	for <linux-doc@archiver.kernel.org>; Thu, 13 Feb 2020 17:57:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D5B21206DB
	for <linux-doc@archiver.kernel.org>; Thu, 13 Feb 2020 17:57:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727683AbgBMR5m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 13 Feb 2020 12:57:42 -0500
Received: from 2.mo177.mail-out.ovh.net ([178.33.109.80]:41369 "EHLO
        2.mo177.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726282AbgBMR5m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 13 Feb 2020 12:57:42 -0500
X-Greylist: delayed 524 seconds by postgrey-1.27 at vger.kernel.org; Thu, 13 Feb 2020 12:57:42 EST
Received: from player715.ha.ovh.net (unknown [10.108.54.141])
        by mo177.mail-out.ovh.net (Postfix) with ESMTP id D51741223A2
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2020 18:48:56 +0100 (CET)
Received: from sk2.org (cre33-1_migr-88-122-126-116.fbx.proxad.net [88.122.126.116])
        (Authenticated sender: steve@sk2.org)
        by player715.ha.ovh.net (Postfix) with ESMTPSA id 865B7F2A671A;
        Thu, 13 Feb 2020 17:48:45 +0000 (UTC)
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH 4/6] docs: add missing IPC documentation in sysctl/kernel.rst
Date:   Thu, 13 Feb 2020 18:46:59 +0100
Message-Id: <20200213174701.3200366-5-steve@sk2.org>
X-Mailer: git-send-email 2.24.1
In-Reply-To: <20200213174701.3200366-1-steve@sk2.org>
References: <20200213174701.3200366-1-steve@sk2.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 10090314967056797061
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgedugedrieekgddutdeiucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucfkpheptddrtddrtddrtddpkeekrdduvddvrdduvdeirdduudeinecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrjeduhedrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds short descriptions of msgmax, msgmnb, msgmni, and shmmni,
which were previously listed in kernel.rst but not described.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
 Documentation/admin-guide/sysctl/kernel.rst | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 9221366901af..29a712e24610 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -413,6 +413,15 @@ to false.  Generally used with the `kexec_load_disabled`_ toggle.
 msgmax, msgmnb, and msgmni
 ==========================
 
+``msgmax`` is the maximum size of an IPC message, in bytes. 8192 by
+default (``MSGMAX``).
+
+``msgmnb`` is the maximum size of an IPC queue, in bytes. 16384 by
+default (``MSGMNB``).
+
+``msgmni`` is the maximum number of IPC queues. 32000 by default
+(``MSGMNI``).
+
 
 msg_next_id, sem_next_id, and shm_next_id (System V IPC)
 ========================================================
@@ -961,6 +970,9 @@ kernel.  This value defaults to ``SHMMAX``.
 shmmni
 ======
 
+This value determines the maximum number of shared memory segments.
+4096 by default (``SHMMNI``).
+
 
 shm_rmid_forced
 ===============
-- 
2.24.1

