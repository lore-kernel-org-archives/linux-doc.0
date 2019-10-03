Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 986707D90F
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 Oct 2019 19:09:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733125AbfJCTJb (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 Oct 2019 15:09:31 -0400
Received: from ms.lwn.net ([45.79.88.28]:33704 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729264AbfJCTJa (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 3 Oct 2019 15:09:30 -0400
Received: from meer.lwn.net (localhost [127.0.0.1])
        by ms.lwn.net (Postfix) with ESMTPA id 05CF7300;
        Thu,  3 Oct 2019 19:09:29 +0000 (UTC)
From:   Jonathan Corbet <corbet@lwn.net>
To:     linux-doc@vger.kernel.org
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Daniel Vetter <daniel@ffwll.ch>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 0/2] docs: move the ioctl() documentation out of the top level
Date:   Thu,  3 Oct 2019 13:09:19 -0600
Message-Id: <20191003190921.5141-1-corbet@lwn.net>
X-Mailer: git-send-email 2.21.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We have a handful of ioctl() documentation that doesn't really merit a
top-level directory, especially when there are more suitable places for
it.  So:

 - Move botching-up-ioctls.rst to the process guide; it's aimed at kernel
   developers so should be where they will look.

 - Move the rest to the userspace-api book along with the rest of the
   user-space documentation.

Jonathan Corbet (2):
  docs: move botching-up-ioctls.rst to the process guide
  docs: Move the user-space ioctl() docs to userspace-api

 Documentation/index.rst                                    | 1 -
 Documentation/{ioctl => process}/botching-up-ioctls.rst    | 0
 Documentation/process/index.rst                            | 1 +
 Documentation/userspace-api/index.rst                      | 1 +
 Documentation/{ => userspace-api}/ioctl/cdrom.rst          | 0
 Documentation/{ => userspace-api}/ioctl/hdio.rst           | 0
 Documentation/{ => userspace-api}/ioctl/index.rst          | 1 -
 Documentation/{ => userspace-api}/ioctl/ioctl-decoding.rst | 0
 Documentation/{ => userspace-api}/ioctl/ioctl-number.rst   | 0
 9 files changed, 2 insertions(+), 2 deletions(-)
 rename Documentation/{ioctl => process}/botching-up-ioctls.rst (100%)
 rename Documentation/{ => userspace-api}/ioctl/cdrom.rst (100%)
 rename Documentation/{ => userspace-api}/ioctl/hdio.rst (100%)
 rename Documentation/{ => userspace-api}/ioctl/index.rst (86%)
 rename Documentation/{ => userspace-api}/ioctl/ioctl-decoding.rst (100%)
 rename Documentation/{ => userspace-api}/ioctl/ioctl-number.rst (100%)

-- 
2.21.0

