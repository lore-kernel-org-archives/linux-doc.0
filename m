Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E51ED7D90D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 17 Oct 2019 07:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388490AbfJQHrK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 17 Oct 2019 03:47:10 -0400
Received: from mx2.suse.de ([195.135.220.15]:48238 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387489AbfJQHrK (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 17 Oct 2019 03:47:10 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id EE7A1B58D;
        Thu, 17 Oct 2019 07:47:08 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch
Cc:     corbet@lwn.net, dri-devel@lists.freedesktop.org,
        linux-doc@vger.kernel.org, Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 0/1] DRM fbconv helpers for converting fbdev drivers
Date:   Thu, 17 Oct 2019 09:47:04 +0200
Message-Id: <20191017074705.9140-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

I rebased v2 of this patchset onto v5.3 and uploaded the result
into the git repo at

  https://gitlab.freedesktop.org/tzimmermann/linux/tree/fbconv

I'll keep the helpers updated for new Linux releases from time to
time. The attached patch adds a new item to the TODO list that refers
to the external tree and documentation.

v3:
	* replace patchset in favor of TODO item that refers to
	  external tree
v2:
	* rename to fbconv helpers
	* rewrite as helper library
	* switch over to simple KMS helpers
	* switch over to SHMEM
	* add documentation

Thomas Zimmermann (1):
  drm: Add TODO item for fbdev driver conversion

 Documentation/gpu/todo.rst | 27 +++++++++++++++++++++++++++
 1 file changed, 27 insertions(+)

--
2.23.0

