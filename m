Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD645C4363A
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7496322281
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 09:52:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792352;
	bh=Gs04cG1Tye+lS5FDSHJrAW5BW11RBRgt4lDXQz69d1U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=mcEsOQnr3JIUk9mKdkboN8/53jkO4DYktTPoeXFAG8HGlHmjJU4maYKDzXHOf1qTm
	 2inqV71d4jDK1AP0W4O96I9xWmYnDqr6yTbZIjhxtc9b7kYg7v4Y2aWUmKG3kMNnFn
	 JBic7/MnPsbTuWvX6HeyCm5D2jb+GszmLlxdzd8s=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2896194AbgJ0JwS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 05:52:18 -0400
Received: from mail.kernel.org ([198.145.29.99]:42806 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896060AbgJ0Jvo (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:44 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id C7C3F241A5;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792302;
        bh=Gs04cG1Tye+lS5FDSHJrAW5BW11RBRgt4lDXQz69d1U=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=SF2PoE+qd3WV9tSHpUuacQT5ze8yeVBWS79BlCzPYFdaG5JQSFjiw9OZfj92Yx9rZ
         TwX3RpnRNBpwaw4YQyQYc5J2oT4+P6OCIyZOxTrdNJHJn44kDieXX05qCcgKMmHhLK
         s12gZfZlwUhiGy4faJf+hXepvgquqXmTPeQjKoR4=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FFW-PD; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 24/32] drm: drm_edid: remove a duplicated kernel-doc declaration
Date:   Tue, 27 Oct 2020 10:51:28 +0100
Message-Id: <9310f4074fa9d29cd3ad60684d86d0ace8dab7ae.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

It is not possible to create cross-references for duplicated
symbols. While Sphinx always detected it, on Sphinx 3 it
generates warnings like this:

	.../Documentation/gpu/drm-kms-helpers:326: ../drivers/gpu/drm/drm_edid.c:1626: WARNING: Duplicate C declaration, also defined in 'gpu/drm-kms-helpers'.
	Declaration is 'bool drm_edid_are_equal (const struct edid *edid1, const struct edid *edid2)'.

So, get rid of the duplicated kernel-doc markup.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/drm/drm_edid.h | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/include/drm/drm_edid.h b/include/drm/drm_edid.h
index b27a0e2169c8..e97daf6ffbb1 100644
--- a/include/drm/drm_edid.h
+++ b/include/drm/drm_edid.h
@@ -359,13 +359,6 @@ drm_load_edid_firmware(struct drm_connector *connector)
 }
 #endif
 
-/**
- * drm_edid_are_equal - compare two edid blobs.
- * @edid1: pointer to first blob
- * @edid2: pointer to second blob
- * This helper can be used during probing to determine if
- * edid had changed.
- */
 bool drm_edid_are_equal(const struct edid *edid1, const struct edid *edid2);
 
 int
-- 
2.26.2

