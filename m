Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21314C41604
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5F322083B
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 14:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1601993123;
	bh=/yU7lDdXaYHcK+bMjDe7N+/1v4CnA3kWBBNj3sy6md0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=04DDoNzeQbYIC15LPOCmInBu9OQyxrzhA/DPHj94rsdJWfGbDxX7LX8SLXZUjv8I8
	 qMGlkINXWQiKC1aqPiTH4e1qil//MywkyL6vHUA6mTgOU1ay9B/jwPgAjxFtnl8M6L
	 7Pdrc2yPz/SO/yUUI9M0sNPVqIjJX/n1MoTvlJSk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726793AbgJFOFK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 10:05:10 -0400
Received: from mail.kernel.org ([198.145.29.99]:33692 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726517AbgJFOD4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 6 Oct 2020 10:03:56 -0400
Received: from mail.kernel.org (ip5f5ad5bd.dynamic.kabel-deutschland.de [95.90.213.189])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id EDB66235F8;
        Tue,  6 Oct 2020 14:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1601993035;
        bh=/yU7lDdXaYHcK+bMjDe7N+/1v4CnA3kWBBNj3sy6md0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SdDegMP0mkdehRnjZZa15TtzOWud3y76vwTrkmnZ2bRB6gPCaCBKFK5k6E6GI/oi+
         H0mlwtmMlNOxU4RMWAHBB1Qb/6AtnX3lnTizJucgimTmURHztpOedoeUuWQW3TaajP
         N0+nKdmfGSiZdjZbAlovBSZxTgzzyE8IsA0uE0Ew=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kPnZI-0019GY-TA; Tue, 06 Oct 2020 16:03:52 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Alex Deucher <alexander.deucher@amd.com>,
        Bjorn Helgaas <bhelgaas@google.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v5 45/52] docs: devices.rst: fix a C reference markup
Date:   Tue,  6 Oct 2020 16:03:42 +0200
Message-Id: <1e8e06cf23a519116a882888475d37dfc5ab49b2.1601992016.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1601992016.git.mchehab+huawei@kernel.org>
References: <cover.1601992016.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The C domain parser of Sphinx3 expects just function names
for :c:func: markups:

	./Documentation/driver-api/pm/devices.rst:413: WARNING: Unparseable C cross-reference: 'device_may_wakeup(dev)'
	Invalid C declaration: Expected end of definition. [error at 17]
	  device_may_wakeup(dev)
	  -----------------^

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/driver-api/pm/devices.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/driver-api/pm/devices.rst b/Documentation/driver-api/pm/devices.rst
index 4bda8a21f5d1..6b3bfd29fd84 100644
--- a/Documentation/driver-api/pm/devices.rst
+++ b/Documentation/driver-api/pm/devices.rst
@@ -410,7 +410,7 @@ On many platforms they will gate off one or more clock sources; sometimes they
 will also switch off power supplies or reduce voltages.  [Drivers supporting
 runtime PM may already have performed some or all of these steps.]
 
-If :c:func:`device_may_wakeup(dev)` returns ``true``, the device should be
+If :c:func:`device_may_wakeup()` returns ``true``, the device should be
 prepared for generating hardware wakeup signals to trigger a system wakeup event
 when the system is in the sleep state.  For example, :c:func:`enable_irq_wake()`
 might identify GPIO signals hooked up to a switch or other external hardware,
-- 
2.26.2

