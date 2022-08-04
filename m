Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0BFFC19F2C
	for <linux-doc@archiver.kernel.org>; Thu,  4 Aug 2022 10:59:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238438AbiHDK7g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 4 Aug 2022 06:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48208 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231440AbiHDK7e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 4 Aug 2022 06:59:34 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [IPv6:2a00:1098:0:82:1000:25:2eeb:e5ab])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0F681CB26
        for <linux-doc@vger.kernel.org>; Thu,  4 Aug 2022 03:59:33 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 4226066017FE;
        Thu,  4 Aug 2022 11:59:31 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659610771;
        bh=gyorcD6t+hcnTKyxLrLWKuNsPkfd8aiFSo6fHZC/mJc=;
        h=From:To:Cc:Subject:Date:From;
        b=h6xTURdSSyAbpz8OCGp38LJGkEg4CfkR5AO7oHnEPO6qUQjsXb5GnQ6z9u70lHkuV
         cD5QZtjOjBeUwTMscWsktQhAF7ZE0+TFG/gLNr/Aq4op8h5otkgEqhNPsmSoKPtvVX
         IT2pNYSHx1kXb2A7HoUO1PFWU0zpzHLutgYLZMp5ZxJgHgHkC8oZgwswYCeQSt0ev0
         re8CfNXRi0OgHBcRC5vhSJ5nU93oAIDUztQGkxxL+CYBOd9+MjsJrmQ8CUV6Hcb7U8
         pqqUIcS1RjhUTy7HLlOYb2Sw4qA9PiOQQQXlS8RMYDqMfV6i/S2MlfA4Vhm7kBHn8J
         GqFZDHwC8OPDw==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com,
        bagasdotme@gmail.com
Subject: [PATCH v2 0/2] docs: driver-api: virtio: virtio on Linux
Date:   Thu,  4 Aug 2022 12:59:12 +0200
Message-Id: <20220804105914.3707389-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Basic documentation about virtio in the kernel and a small tutorial for
virtio drivers.

Tested on linux-next (next-20220802)

Changes in v2:
  - virtio spec links updated to v1.2
  - simplify virtio.rst and remove most low level parts that are
    already covered by the spec
  - split the kerneldocs fixes to a separate patch
  - remove :c:func: rst formatting

Ricardo Cañuelo (2):
  virtio: kerneldocs fixes and enhancements
  docs: driver-api: virtio: virtio on Linux

 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/virtio/index.rst     |  11 +
 Documentation/driver-api/virtio/virtio.rst    | 151 ++++++++++++++
 .../virtio/writing_virtio_drivers.rst         | 189 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 drivers/virtio/virtio_ring.c                  |   8 +
 include/linux/virtio.h                        |   6 +-
 include/linux/virtio_config.h                 |   6 +-
 include/uapi/linux/virtio_ring.h              |  16 +-
 9 files changed, 378 insertions(+), 11 deletions(-)
 create mode 100644 Documentation/driver-api/virtio/index.rst
 create mode 100644 Documentation/driver-api/virtio/virtio.rst
 create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst

-- 
2.25.1

