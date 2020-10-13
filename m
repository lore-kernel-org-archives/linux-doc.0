Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6721C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:55:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4FF982080A
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:55:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590151;
	bh=w9XTQzW+lIXOGTToFt4mfhe3JwT7CZ5RMQX3rwQsPcg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=cemq6edqwnNtIQJ07RLsPqLGSdZlWERHe4n3Okmc76/18Kr7KLdLexzNz4ljlO42J
	 DZtR4sVatUKGiDB8z5pk3a2+QSuSaTXoicyYteQA0Wjj0Fe17DV6FesZi/DxIA09wn
	 NkQM4VLho2QgL4JUS0YvCGJI4LfnxFZFi9WaPdoA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727262AbgJMLzU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:55:20 -0400
Received: from mail.kernel.org ([198.145.29.99]:58138 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727725AbgJMLzE (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:55:04 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 81877225AA;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=w9XTQzW+lIXOGTToFt4mfhe3JwT7CZ5RMQX3rwQsPcg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R4IWZBdLav79IFemdL5iBoB+pe/8Bls7d6ryKfKYMs4tZ4qRLFWbc/3z/owILMWZb
         TPu5pbIgIYrpX2K42t0aLEU2JjklkK0IttwBsqRh1kkdQE7K/r0z/CdpUh5mptat4B
         3DLE3ye6twHTaLmFm/9Cs8Iyxx/yqJHpN13oFyXE=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CW9-G0; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Andrzej Hajda <a.hajda@samsung.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Mark Brown <broonie@kernel.org>, linux-kernel@vger.kernel.org
Subject: [PATCH v6 63/80] drivers: core: fix kernel-doc markup for dev_err_probe()
Date:   Tue, 13 Oct 2020 13:54:18 +0200
Message-Id: <e0d6c52c64e11e80514551720f88726581b88141.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are two literal blocks there. Fix the markups, in order
to produce the right html output and solve those warnings:

	./drivers/base/core.c:4218: WARNING: Unexpected indentation.
	./drivers/base/core.c:4222: WARNING: Definition list ends without a blank line; unexpected unindent.
	./drivers/base/core.c:4223: WARNING: Block quote ends without a blank line; unexpected unindent.

Fixes: a787e5400a1c ("driver core: add device probe log helper")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/base/core.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index bb5806a2bd4c..eb5cb88bf194 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -4211,13 +4211,16 @@ define_dev_printk_level(_dev_info, KERN_INFO);
  * -EPROBE_DEFER and propagate error upwards.
  * In case of -EPROBE_DEFER it sets also defer probe reason, which can be
  * checked later by reading devices_deferred debugfs attribute.
- * It replaces code sequence:
+ * It replaces code sequence::
+ *
  * 	if (err != -EPROBE_DEFER)
  * 		dev_err(dev, ...);
  * 	else
  * 		dev_dbg(dev, ...);
  * 	return err;
- * with
+ *
+ * with::
+ *
  * 	return dev_err_probe(dev, err, ...);
  *
  * Returns @err.
-- 
2.26.2

