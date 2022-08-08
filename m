Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B8E3C00140
	for <linux-doc@archiver.kernel.org>; Mon,  8 Aug 2022 13:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242542AbiHHN2i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Aug 2022 09:28:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243323AbiHHN2g (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Aug 2022 09:28:36 -0400
Received: from madras.collabora.co.uk (madras.collabora.co.uk [46.235.227.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5138CAE4A
        for <linux-doc@vger.kernel.org>; Mon,  8 Aug 2022 06:28:35 -0700 (PDT)
Received: from localhost.localdomain (unknown [213.194.152.135])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
        (No client certificate requested)
        (Authenticated sender: rcn)
        by madras.collabora.co.uk (Postfix) with ESMTPSA id 436066601BCE;
        Mon,  8 Aug 2022 14:28:33 +0100 (BST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
        s=mail; t=1659965313;
        bh=SUDX6NTSdXKGMATBKcPwI5q+gjVM5I5rKpwTz8OwyOg=;
        h=From:To:Cc:Subject:Date:From;
        b=HEV9qkGwrfG/sRNqPOrhq0BD/jv+YQoIHytgEP/ORtiCZKxIgylKzmrvBS2umyOdS
         KfLIZVlwb1isK3OO87Kj0MTNSNtHnKm6lp3xxGkdF9ZvwL24d9/56b3c013bIRlmJn
         LlFJNr55MtC9VQLogMQnLKqfL4EOAUm9evfEQhVAsLIvbTQDObO7obf/i0tnLLjWo1
         EFfddoi24Vw7KdUuxFrWnSqUeicM65L2/tq5SryyNJh6elFEezfl9PcgPzC9mIoAgn
         7V/8BaqOJUe6fYnbP2oZEHqPvBt5uAlitEVEj2Qv8uxrvUgNgTGMAh7JUoEdllOx1a
         57X4mQhFVdQeA==
From:   =?UTF-8?q?Ricardo=20Ca=C3=B1uelo?= <ricardo.canuelo@collabora.com>
To:     linux-doc@vger.kernel.org
Cc:     virtualization@lists.linux-foundation.org, mst@redhat.com,
        jasowang@redhat.com, kernel@collabora.com, cohuck@redhat.com,
        bagasdotme@gmail.com
Subject: [PATCH v3 0/2] docs: driver-api: virtio: virtio on Linux
Date:   Mon,  8 Aug 2022 15:27:35 +0200
Message-Id: <20220808132737.4070709-1-ricardo.canuelo@collabora.com>
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

