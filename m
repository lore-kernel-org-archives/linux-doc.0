Return-Path: <SRS0=C3TA=EC=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE07C388F9
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 643722225C
	for <linux-doc@archiver.kernel.org>; Tue, 27 Oct 2020 10:01:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603792892;
	bh=ppYXc1SyiVUG6HC91sBcDKQyygwJrjPrTKcIg1JBVhY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=o8s4GmBNXtrbpAnaptCYhUetgClDy2c/IJSlgZiWn1DbihRuwhyqpWH2tyA5Sp7iq
	 vCIBTqF/WWiLqdOjYZ46GcCXGFkBGKEUyl1W+o6Wbz5wI9Y9a6RwJGJpeL/q0dN3YU
	 GV47QspqXl/oZ5jO2V/loUfaGLeD3AfuyJXYE11U=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2436498AbgJ0KB1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Oct 2020 06:01:27 -0400
Received: from mail.kernel.org ([198.145.29.99]:42812 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2896057AbgJ0Jvn (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 27 Oct 2020 05:51:43 -0400
Received: from mail.kernel.org (ip5f5ad5af.dynamic.kabel-deutschland.de [95.90.213.175])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id DE11B24640;
        Tue, 27 Oct 2020 09:51:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603792302;
        bh=ppYXc1SyiVUG6HC91sBcDKQyygwJrjPrTKcIg1JBVhY=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=I4ymQy4aWAVQ7XX9nEW8ufis5YQ2RLRmitilicmXVRGqcD7sR4lN1UnrvoNe3BYQN
         HSDNvRa/R8puxKDiZeV2pbwJVAIdyN2volHsHWQGa0K3uLyTOC9F+kkY0gMJVBKDh8
         oEF6PIOaU8uh5EXzE35TNdn63BD876IgwDa+EZsY=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kXLdj-003FFa-Q6; Tue, 27 Oct 2020 10:51:39 +0100
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Gerd Hoffmann <kraxel@redhat.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 25/32] drm: kernel-doc: add description for a new function parameter
Date:   Tue, 27 Oct 2020 10:51:29 +0100
Message-Id: <9366f48e6e9c3ec2f31a3e68452a2b23a1089fce.1603791716.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1603791716.git.mchehab+huawei@kernel.org>
References: <cover.1603791716.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

As reported by "make htmldocs":

	./drivers/gpu/drm/drm_prime.c:808: warning: Function parameter or member 'dev' not described in 'drm_prime_pages_to_sg'

Add a description for the new parameter.

Fixes: 707d561f77b5 ("drm: allow limiting the scatter list size.")
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 drivers/gpu/drm/drm_prime.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/drm_prime.c b/drivers/gpu/drm/drm_prime.c
index d6808f678db5..9f955f2010c2 100644
--- a/drivers/gpu/drm/drm_prime.c
+++ b/drivers/gpu/drm/drm_prime.c
@@ -794,6 +794,7 @@ static const struct dma_buf_ops drm_gem_prime_dmabuf_ops =  {
 
 /**
  * drm_prime_pages_to_sg - converts a page array into an sg list
+ * @dev: DRM device
  * @pages: pointer to the array of page pointers to convert
  * @nr_pages: length of the page vector
  *
-- 
2.26.2

