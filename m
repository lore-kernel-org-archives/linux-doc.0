Return-Path: <SRS0=PdnY=D6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AE713C55179
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 52CEF208C3
	for <linux-doc@archiver.kernel.org>; Fri, 23 Oct 2020 16:35:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603470949;
	bh=xUBveSpOXkrTaBEHzdMPtg2mgvuAaTeP6EgUdqrKFA0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=FRUQ4MgYhbEiM2dOmnws78TGrNUMVnVVJyIAhNdeN/c20j79CGASvs0UtNqE7886j
	 5kh4H6AZxCVDuiQGDSVgINlQ+1x4hBmwxkX07w+GxL2V5szS2DY5/mWWx3vd6FfKIK
	 wdjxovPVhMIQecvaLzqV0MH2PP+ACGpFQQ+uMqnY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1750838AbgJWQfi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Oct 2020 12:35:38 -0400
Received: from mail.kernel.org ([198.145.29.99]:33724 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751864AbgJWQdv (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 23 Oct 2020 12:33:51 -0400
Received: from mail.kernel.org (ip5f5ad5a3.dynamic.kabel-deutschland.de [95.90.213.163])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id A77B8246D3;
        Fri, 23 Oct 2020 16:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603470828;
        bh=xUBveSpOXkrTaBEHzdMPtg2mgvuAaTeP6EgUdqrKFA0=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YDYspFzkGPMhh/sAN2/n1XmjfK+HlFfFYRkQ5RMqWppKt/REi4MrVLw1XS6rUo1Dm
         KsLXr54kGLos11vLz1WX2l3kG2BDMtSDGzy06z7p89bKUf9tVbYtTvaHKxxPUjfRU7
         1rT3CVgLcXUmV82rOiJqFLBscOhholeG7KaihC6g=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kW00g-002AxQ-Gv; Fri, 23 Oct 2020 18:33:46 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Cezary Rojewski <cezary.rojewski@intel.com>,
        Eric Dumazet <edumazet@google.com>, NeilBrown <neilb@suse.com>,
        Pavel Begunkov <asml.silence@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 46/56] list: fix a typo at the kernel-doc markup
Date:   Fri, 23 Oct 2020 18:33:33 +0200
Message-Id: <5c710f3b33c4572b5065a4f1e085c5d09dc04c7d.1603469755.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603469755.git.mchehab+huawei@kernel.org>
References: <cover.1603469755.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

hlist_add_behing -> hlist_add_behind

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/list.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/list.h b/include/linux/list.h
index a18c87b63376..f72a7a778722 100644
--- a/include/linux/list.h
+++ b/include/linux/list.h
@@ -901,7 +901,7 @@ static inline void hlist_add_before(struct hlist_node *n,
 }
 
 /**
- * hlist_add_behing - add a new entry after the one specified
+ * hlist_add_behind - add a new entry after the one specified
  * @n: new entry to be added
  * @prev: hlist node to add it after, which must be non-NULL
  */
-- 
2.26.2

