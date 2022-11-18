Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFA3C4332F
	for <linux-doc@archiver.kernel.org>; Sat, 19 Nov 2022 00:51:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230424AbiKSAvs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Nov 2022 19:51:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbiKSAve (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Nov 2022 19:51:34 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3F24AC6D1A
        for <linux-doc@vger.kernel.org>; Fri, 18 Nov 2022 15:51:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
        Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
        Content-Description:In-Reply-To:References;
        bh=89XXvY4dsgBt2/Us4Xyks7e7rFIbM6mgsH6+kbDSQ8o=; b=bDKgMPTN/Ug6MgjY4asNnBKafQ
        ESAj1SOgAzkm2lm2JdZMGJe5Io62qphVNB/UxMEovymCX7H04KoviT9cUmmB0HIXAflCJ6Cg1/IDo
        88ZZGGCkpWjBGn4pac/Hnd0J7/COKz+dCUTfWCpaMCFVZtlXNupnJs6LbVbLfNSz+Poj1JnRyMqqf
        g+e9NTKnteHZZLuTV/2XJiZiIalmm+ctOAtgVcFj11rREGSlXxqHznNHeKC6E8ebkXUS3CsZuppmJ
        OeLL6S2Nc6LFjkqwhbjEEr85yDCXPGlCHNOv/2F07X3gOqKrgRT8z6/PuVEWXna4xyHZXa4iqsFtz
        ur0TzehA==;
Received: from [2601:1c2:d80:3110::a2e7] (helo=casper.infradead.org)
        by casper.infradead.org with esmtpsa (Exim 4.94.2 #2 (Red Hat Linux))
        id 1owB9C-002nfy-J4; Fri, 18 Nov 2022 23:51:52 +0000
From:   Randy Dunlap <rdunlap@infradead.org>
To:     linux-doc@vger.kernel.org
Cc:     Randy Dunlap <rdunlap@infradead.org>,
        Gabriela Bittencourt <gabrielabittencourt00@gmail.com>,
        Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>,
        David Airlie <airlied@gmail.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        dri-devel@lists.freedesktop.org, Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH] drm/doc: make drm-uapi igt-tests more readable
Date:   Fri, 18 Nov 2022 15:51:37 -0800
Message-Id: <20221118235137.6859-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Correct grammar and make the use of the igt-tests more readable.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Gabriela Bittencourt <gabrielabittencourt00@gmail.com>
Cc: Rodrigo Siqueira <Rodrigo.Siqueira@amd.com>
Cc: David Airlie <airlied@gmail.com>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: Jonathan Corbet <corbet@lwn.net>
---
 Documentation/gpu/drm-uapi.rst |   12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff -- a/Documentation/gpu/drm-uapi.rst b/Documentation/gpu/drm-uapi.rst
--- a/Documentation/gpu/drm-uapi.rst
+++ b/Documentation/gpu/drm-uapi.rst
@@ -402,19 +402,19 @@ It's possible to run the IGT-tests in a
 	1. Use IGT inside a VM
 	2. Use IGT from the host machine and write the results in a shared directory.
 
-As follow, there is an example of using a VM with a shared directory with
-the host machine to run igt-tests. As an example it's used virtme::
+Following is an example of using a VM with a shared directory with
+the host machine to run igt-tests. This example uses virtme::
 
 	$ virtme-run --rwdir /path/for/shared_dir --kdir=path/for/kernel/directory --mods=auto
 
-Run the igt-tests in the guest machine, as example it's ran the 'kms_flip'
+Run the igt-tests in the guest machine. This example runs the 'kms_flip'
 tests::
 
 	$ /path/for/igt-gpu-tools/scripts/run-tests.sh -p -s -t "kms_flip.*" -v
 
-In this example, instead of build the igt_runner, Piglit is used
-(-p option); it's created html summary of the tests results and it's saved
-in the folder "igt-gpu-tools/results"; it's executed only the igt-tests
+In this example, instead of building the igt_runner, Piglit is used
+(-p option). It creates an HTML summary of the test results and saves
+them in the folder "igt-gpu-tools/results". It executes only the igt-tests
 matching the -t option.
 
 Display CRC Support
