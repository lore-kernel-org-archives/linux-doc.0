Return-Path: <SRS0=dhoL=7A=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80DA2C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 18 May 2020 15:38:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FA4C2065F
	for <linux-doc@archiver.kernel.org>; Mon, 18 May 2020 15:38:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728199AbgERPil (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 18 May 2020 11:38:41 -0400
Received: from 1.mo2.mail-out.ovh.net ([46.105.63.121]:36909 "EHLO
        1.mo2.mail-out.ovh.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726958AbgERPik (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 18 May 2020 11:38:40 -0400
X-Greylist: delayed 1802 seconds by postgrey-1.27 at vger.kernel.org; Mon, 18 May 2020 11:38:40 EDT
Received: from player692.ha.ovh.net (unknown [10.108.54.36])
        by mo2.mail-out.ovh.net (Postfix) with ESMTP id BB9721D5E48
        for <linux-doc@vger.kernel.org>; Mon, 18 May 2020 16:59:01 +0200 (CEST)
Received: from sk2.org (82-65-25-201.subs.proxad.net [82.65.25.201])
        (Authenticated sender: steve@sk2.org)
        by player692.ha.ovh.net (Postfix) with ESMTPSA id 42F39125A01F8;
        Mon, 18 May 2020 14:58:58 +0000 (UTC)
Authentication-Results: garm.ovh; auth=pass (GARM-99G003ec7d000f-9e2f-4878-b4b2-bb7f6857284c,684EF6CDF7F8D64881578A2CD861565D4C1A1A2F) smtp.auth=steve@sk2.org
From:   Stephen Kitt <steve@sk2.org>
To:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org
Cc:     linux-kernel@vger.kernel.org, Stephen Kitt <steve@sk2.org>
Subject: [PATCH v2] docs: sysctl/kernel: document ngroups_max
Date:   Mon, 18 May 2020 16:58:36 +0200
Message-Id: <20200518145836.15816-1-steve@sk2.org>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Ovh-Tracer-Id: 11724277205499989381
X-VR-SPAMSTATE: OK
X-VR-SPAMSCORE: -100
X-VR-SPAMCAUSE: gggruggvucftvghtrhhoucdtuddrgeduhedruddthedgkedvucetufdoteggodetrfdotffvucfrrhhofhhilhgvmecuqfggjfdpvefjgfevmfevgfenuceurghilhhouhhtmecuhedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurhephffvufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefuthgvphhhvghnucfmihhtthcuoehsthgvvhgvsehskhdvrdhorhhgqeenucggtffrrghtthgvrhhnpeetgedugfelkeeikeetgeegteevfeeufeetuefgudeiiedthfehtdeffeekvdeffeenucfkpheptddrtddrtddrtddpkedvrdeihedrvdehrddvtddunecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmohguvgepshhmthhpqdhouhhtpdhhvghlohepphhlrgihvghrieelvddrhhgrrdhovhhhrdhnvghtpdhinhgvtheptddrtddrtddrtddpmhgrihhlfhhrohhmpehsthgvvhgvsehskhdvrdhorhhgpdhrtghpthhtoheplhhinhhugidqughotgesvhhgvghrrdhkvghrnhgvlhdrohhrgh
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This is a read-only export of NGROUPS_MAX.

Signed-off-by: Stephen Kitt <steve@sk2.org>
---
Changes since v1:
  - drop changes to kernel/sysctl.c

 Documentation/admin-guide/sysctl/kernel.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 0d427fd10941..5f12ee07665c 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -459,6 +459,15 @@ Notes:
      successful IPC object allocation. If an IPC object allocation syscall
      fails, it is undefined if the value remains unmodified or is reset to -1.
 
+
+ngroups_max
+===========
+
+Maximum number of supplementary groups, _i.e._ the maximum size which
+``setgroups`` will accept. Exports ``NGROUPS_MAX`` from the kernel.
+
+
+
 nmi_watchdog
 ============
 

base-commit: 1ae7efb388540adc1653a51a3bc3b2c9cef5ec1a
-- 
2.20.1

