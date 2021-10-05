Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F194C433EF
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 02:53:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 515F96140A
	for <linux-doc@archiver.kernel.org>; Tue,  5 Oct 2021 02:53:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231483AbhJECzO (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 4 Oct 2021 22:55:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232108AbhJECzM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 4 Oct 2021 22:55:12 -0400
Received: from bombadil.infradead.org (bombadil.infradead.org [IPv6:2607:7c80:54:e::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CBF3C061745
        for <linux-doc@vger.kernel.org>; Mon,  4 Oct 2021 19:53:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
        Content-ID:Content-Description:In-Reply-To:References;
        bh=dHO9VUU6KIilj0lSjEjuS5kklUS8u1rXgZVZwATXFzM=; b=QXLvtliynWfXMR/PiV+6HOZMjx
        0nBWYBFXB5Y2soBGHToXqbW5uh98LkNpW57bfqX9Zts2qzwcmfHOEvnxxhaXAhv76f9B6aoJyTEHo
        GOgGSbOaLwzzmNVYcrZMeBzFKca5TV+fqJiHm2hK2U4Ff7Eu+bMcwxmXAxSF0BfnxdJME/mSavCTy
        IXWwk3t2aXBRpEqs8UV527apYxrFErCoIB7sYBglSWB6OZdwKxIzY0vTZJ+hiv3bA36UQrcTqiaDo
        nAFNGE4+T9Jxr7OuUMhn/gU7qNN+huubBAbyFhHBC55OBQnrTEgdX4MMJEv/jo2XYJyk6dPcgTpy+
        HkKVJTCw==;
Received: from [2601:1c0:6280:3f0::aa0b] (helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1mXaZt-008jNR-OF; Tue, 05 Oct 2021 02:53:13 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Sam Ravnborg <sam@ravnborg.org>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>
Subject: [PATCH] DRM: delete DRM IRQ legacy midlayer docs
Date:   Mon,  4 Oct 2021 19:53:12 -0700
Message-Id: <20211005025312.20913-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
To:     unlisted-recipients:; (no To-header on input)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove documentation associated with the removal of the DRM IRQ legacy
midlayer.

Eliminates these documentation warnings:

../drivers/gpu/drm/drm_irq.c:1: warning: 'irq helpers' not found
../drivers/gpu/drm/drm_irq.c:1: warning: no structured comments found

Fixes: c1736b9008cb ("drm: IRQ midlayer is now legacy")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
---
 Documentation/gpu/drm-internals.rst |    9 ---------
 1 file changed, 9 deletions(-)

--- lnx-515-rc4.orig/Documentation/gpu/drm-internals.rst
+++ lnx-515-rc4/Documentation/gpu/drm-internals.rst
@@ -111,15 +111,6 @@ Component Helper Usage
 .. kernel-doc:: drivers/gpu/drm/drm_drv.c
    :doc: component helper usage recommendations
 
-IRQ Helper Library
-~~~~~~~~~~~~~~~~~~
-
-.. kernel-doc:: drivers/gpu/drm/drm_irq.c
-   :doc: irq helpers
-
-.. kernel-doc:: drivers/gpu/drm/drm_irq.c
-   :export:
-
 Memory Manager Initialization
 ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 
