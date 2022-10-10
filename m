Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DBB2DC433FE
	for <linux-doc@archiver.kernel.org>; Mon, 10 Oct 2022 06:44:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231303AbiJJGoU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Oct 2022 02:44:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230464AbiJJGoU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Oct 2022 02:44:20 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96349564C9
        for <linux-doc@vger.kernel.org>; Sun,  9 Oct 2022 23:44:19 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id CFF196602298;
        Mon, 10 Oct 2022 07:44:17 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1665384258;
        bh=IGSthkjGK+x+uEz78lDRCkbgYZPKC+28kY/8J767G2A=;
        h=From:To:Cc:Subject:Date:From;
        b=ZmZsg9+NVNyJ+6nVXWvZbnb4CjqTaJ32PX7siPxC4HhPZTBxVZcPPZeDpZbaSlkvI
         +Q7mS5oz5JI1Cr1bYPHhHHtYvm35ZoHcFxCczMK+VO+z/Un80JaFBJ4i4gIOaXFd6X
         g3JKRFDBZXw9vtbeEu8wH+z1DU1mPJNUcXHGvTR3PuzXPviyXjPxSOJFfLhwQc8LbW
         s5JSuRJsnvQGNA/K7FrpvDysxxooeh+0akB08Q7jnS4QDTyAC4HSzWUvfM/18hCfYq
         6MPX0xC7f365EAhAm2VlZgFNko1hG5UPdBV8dqS6/T7SnYsfUUNefKHECQ79R2/OrR
         lceqlDPYF2wnw==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     corbet@lwn.net, mst@redhat.com, cohuck@redhat.com,
        virtualization@lists.linux-foundation.org, jasowang@redhat.com,
        kernel@collabora.com
Subject: [RESEND PATCH v5 0/1] docs: driver-api: virtio: virtio on Linux
Date:   Mon, 10 Oct 2022 08:43:58 +0200
Message-Id: <20221010064359.1324353-1-ricardo.canuelo@collabora.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Basic documentation about virtio in the kernel and a small tutorial for
virtio drivers.

Tested on kernel/git/mst/vhost.git (linux-next)

Changes in v5:
  - remove already merged patch
  - grammar fixes
  - clarify some API details
  - rework example code

Changes in v4:
  - reword the intro paragraphs
  - grammar fixes

Changes in v3:
  - fix commit message in patch 1
  - minor additional fixes to virtio kerneldocs
  - use proper Sphinx markup for links to references

Changes in v2:
  - virtio spec links updated to v1.2
  - simplify virtio.rst and remove most low level parts that are
    already covered by the spec
  - split the kerneldocs fixes to a separate patch
  - remove :c:func: rst formatting

Ricardo Cañuelo (1):
  docs: driver-api: virtio: virtio on Linux

 Documentation/driver-api/index.rst            |   1 +
 Documentation/driver-api/virtio/index.rst     |  11 +
 Documentation/driver-api/virtio/virtio.rst    | 144 +++++++++++++
 .../virtio/writing_virtio_drivers.rst         | 197 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 5 files changed, 354 insertions(+)
 create mode 100644 Documentation/driver-api/virtio/index.rst
 create mode 100644 Documentation/driver-api/virtio/virtio.rst
 create mode 100644 Documentation/driver-api/virtio/writing_virtio_drivers.rst

-- 
2.25.1

