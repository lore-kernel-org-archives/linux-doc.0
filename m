Return-Path: <SRS0=LtJm=CT=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BE6D9C43461
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 10:29:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BF2C206BE
	for <linux-doc@archiver.kernel.org>; Thu, 10 Sep 2020 10:29:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599733740;
	bh=x/7gYkn2yHT8rflIjSvPH4TI116EMEWS/QMZ1d2QV4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=CdSx0UkUufD5dhZoKuePLHu7SxWSb1yz061oNFJ5S8xtw+c1Wx3bCAo2/hjBEUs2J
	 Eu+g0dxO2N/s0Y+rAkOCC9LlTDn4RpAFn6G3wlUPXhh7ltH+9bvGNwkDFs7Iw0b2jf
	 lyEfe2FU6qK2s5kMAOsRy35tLqCEKNwdyhiZXbY8=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730952AbgIJK0o (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Sep 2020 06:26:44 -0400
Received: from mail.kernel.org ([198.145.29.99]:35468 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729275AbgIJKYN (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 10 Sep 2020 06:24:13 -0400
Received: from mail.kernel.org (ip5f5ad5ac.dynamic.kabel-deutschland.de [95.90.213.172])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 7EA0921941;
        Thu, 10 Sep 2020 10:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1599733450;
        bh=x/7gYkn2yHT8rflIjSvPH4TI116EMEWS/QMZ1d2QV4k=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=uTMD2EmV8hXUSoEGUzneKnZdgP6zxrQFUfsTnFgLgrtgdQf2ptKqvFRkQ6C6CaaAL
         QLMLtMRy9fRI27CWkMKQWrpLO+MPN2jNvgJorZMzJ8ADTXMBsBcE7rGb1URM+p8Yab
         4Sh/SqJgkn733zieoViNorGJXhAReetb75fijoUg=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kGJkO-00EINq-Eu; Thu, 10 Sep 2020 12:24:08 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        linux-kernel@vger.kernel.org
Subject: [PATCH 06/14] nl80211: docs: add a description for s1g_cap parameter
Date:   Thu, 10 Sep 2020 12:23:59 +0200
Message-Id: <8e8d8bd7de0d971e24f90c646fce0ac3bcb0d753.1599732764.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1599732764.git.mchehab+huawei@kernel.org>
References: <cover.1599732764.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Changeset df78a0c0b67d ("nl80211: S1G band and channel definitions")
added a new parameter, but didn't add the corresponding kernel-doc
markup, as repoted when doing "make htmldocs":

	./include/net/cfg80211.h:471: warning: Function parameter or member 's1g_cap' not described in 'ieee80211_supported_band'

Add a documentation for it.

Fixes: df78a0c0b67d ("nl80211: S1G band and channel definitions")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/net/cfg80211.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/net/cfg80211.h b/include/net/cfg80211.h
index c9bce9bba511..8f34c1489056 100644
--- a/include/net/cfg80211.h
+++ b/include/net/cfg80211.h
@@ -449,6 +449,7 @@ struct ieee80211_sta_s1g_cap {
  * @n_bitrates: Number of bitrates in @bitrates
  * @ht_cap: HT capabilities in this band
  * @vht_cap: VHT capabilities in this band
+ * @s1g_cap: S1G capabilities in this band
  * @edmg_cap: EDMG capabilities in this band
  * @n_iftype_data: number of iftype data entries
  * @iftype_data: interface type data entries.  Note that the bits in
-- 
2.26.2

