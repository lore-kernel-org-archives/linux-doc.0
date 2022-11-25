Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A81EC4332F
	for <linux-doc@archiver.kernel.org>; Fri, 25 Nov 2022 21:01:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229787AbiKYVBK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Nov 2022 16:01:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46256 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229495AbiKYVBK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Nov 2022 16:01:10 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4120E391C6
        for <linux-doc@vger.kernel.org>; Fri, 25 Nov 2022 13:01:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=nYjHXraCbZL/s7fYzcfwWOIuq0wROGjwQAgdKH5+rdw=; b=exKDE1Ez1W+EctazE794vSodMe
        hK77riafXPch1L1lsOeKiMVxwc3Ppue8ahki8K93TY6UqsGPvLg948LwAkUXz2HiarBGX3HfdLCGc
        sehbRe955+93fzQTRc7iOlhHi2AixP5Az7Fzro/LfqwnqOQJsN02jTbtz5XU/iF9Ek0ksv2RJOjVe
        VMQjlM91V1LIIkRgNmS31o7+TAal1T/XAz9j8Omf2BQKkvTbr3+y3wGEiYmPrSXFmOY3cyvXlUt6Z
        i3QcknBoduB3o7JcaranFbMeOwXBu7ZPPEuuXKL2/fID3dWinrC330xe/ofCo+RxgFVpknIIhGkDI
        qT/9NJuQ==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1oyfop-009tZH-PU; Fri, 25 Nov 2022 21:01:08 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
        Alex Deucher <alexander.deucher@amd.com>,
        Felix Kuehling <Felix.Kuehling@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: [PATCH -next] drm/amdgpu: update docum. filename following rename
Date:   Fri, 25 Nov 2022 13:00:55 -0800
Message-Id: <20221125210055.16333-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fix documentation build errors for amdgpu: correct the filename.

Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
Error: Cannot open file ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c

WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -sphinx-version 5.3.0 -function MMU Notifier ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c' failed with return code 1
WARNING: kernel-doc '../scripts/kernel-doc -rst -enable-lineno -sphinx-version 5.3.0 -internal ../drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c' failed with return code 2

Fixes: d9483ecd327b ("drm/amdgpu: rename the files for HMM handling")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Christian König <christian.koenig@amd.com>
Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: Felix Kuehling <Felix.Kuehling@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: amd-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org
---
 Documentation/gpu/amdgpu/driver-core.rst |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff -- a/Documentation/gpu/amdgpu/driver-core.rst b/Documentation/gpu/amdgpu/driver-core.rst
--- a/Documentation/gpu/amdgpu/driver-core.rst
+++ b/Documentation/gpu/amdgpu/driver-core.rst
@@ -148,10 +148,10 @@ PRIME Buffer Sharing
 MMU Notifier
 ============
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
    :doc: MMU Notifier
 
-.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_mn.c
+.. kernel-doc:: drivers/gpu/drm/amd/amdgpu/amdgpu_hmm.c
    :internal:
 
 AMDGPU Virtual Memory
