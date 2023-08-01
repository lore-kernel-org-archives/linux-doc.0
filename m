Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 133B3C0015E
	for <linux-doc@archiver.kernel.org>; Tue,  1 Aug 2023 20:31:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229669AbjHAUb3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 1 Aug 2023 16:31:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229500AbjHAUb2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 1 Aug 2023 16:31:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 03FB6A1
        for <linux-doc@vger.kernel.org>; Tue,  1 Aug 2023 13:31:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 93137616EF
        for <linux-doc@vger.kernel.org>; Tue,  1 Aug 2023 20:31:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A854C433C7;
        Tue,  1 Aug 2023 20:31:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690921886;
        bh=PhNjj8pHhrfkJBVX+e/0zpFIKEyCW6RhZiTwRK6q+tM=;
        h=From:To:Cc:Subject:Date:From;
        b=iWEvRjhWQhwMn+wKmi3+6DR1/l4fUREOzBMEakO49zEGVuZiDEoRazHsc7gPpaVWf
         jDP31Z9RQdMN01EoRcWDqd+4PR2GFV32RdeQ3lzT7vzKkKlvRLxvDJvDIDVj0+Os4o
         tlo+gGEL1j3UXJMu2YOp4rDvrshmUfI79Zuk+83iuVpKgVZyDO1cC0CbnWP8K3YC6H
         6huvZzelq8qbMjVZwT5VJxTW/1372vNRw9rDQVLbouYWcnpJONUklx5seJZVH1HHY0
         GV+4m/Cu0OtTkdShP67dibVlJPvaztT1u1DKZMhH8Hpw8KH9UcRbF9y40B0nymxN+y
         WtkjATsM9ngNw==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        Jakub Kicinski <kuba@kernel.org>, hawk@kernel.org,
        ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org,
        Michael Chan <michael.chan@broadcom.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>
Subject: [PATCH net] docs: net: page_pool: document PP_FLAG_DMA_SYNC_DEV parameters
Date:   Tue,  1 Aug 2023 13:31:24 -0700
Message-ID: <20230801203124.980703-1-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Using PP_FLAG_DMA_SYNC_DEV is a bit confusing. It was perhaps
more obvious when it was introduced but the page pool use
has grown beyond XDP and beyond packet-per-page so now
making the heads and tails out of this feature is not
trivial.

Obviously making the API more user friendly would be
a better fix, but until someone steps up to do that
let's at least document what the parameters are.

Relevant discussion in the first Link.

Link: https://lore.kernel.org/all/20230731114427.0da1f73b@kernel.org/
Signed-off-by: Jakub Kicinski <kuba@kernel.org>
---
CC: hawk@kernel.org
CC: ilias.apalodimas@linaro.org
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org
CC: Michael Chan <michael.chan@broadcom.com>
CC: Lorenzo Bianconi <lorenzo@kernel.org>
---
 Documentation/networking/page_pool.rst | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
index 0aa850cf4447..7064813b3b58 100644
--- a/Documentation/networking/page_pool.rst
+++ b/Documentation/networking/page_pool.rst
@@ -109,6 +109,40 @@ a page will cause no race conditions is enough.
   caller can then report those stats to the user (perhaps via ethtool,
   debugfs, etc.). See below for an example usage of this API.
 
+DMA sync
+--------
+Driver is always responsible for sync'ing the pages for the CPU.
+Drivers may choose to take care of syncing for the device as well
+or set the ``PP_FLAG_DMA_SYNC_DEV`` flag to request that pages
+allocated from the page pool are already sync'ed for the device.
+
+If ``PP_FLAG_DMA_SYNC_DEV`` is set, the driver must inform the core what portion
+of the buffer has to be synced. This allows the core to avoid syncing the entire
+page when the drivers knows that the device only accessed a portion of the page.
+
+Most drivers will reserve a headroom in front of the frame,
+this part of the buffer is not touched by the device, so to avoid syncing
+it drivers can set the ``offset`` field in struct page_pool_params
+appropriately.
+
+For pages recycled on the XDP xmit and skb paths the page pool will
+use the ``max_len`` member of struct page_pool_params to decide how
+much of the page needs to be synced (starting at ``offset``).
+When directly freeing pages in the driver (page_pool_put_page())
+the ``dma_sync_size`` argument specifies how much of the buffer needs
+to be synced.
+
+If in doubt set ``offset`` to 0, ``max_len`` to ``PAGE_SIZE`` and
+pass -1 as ``dma_sync_size``. That combination of arguments is always
+correct.
+
+Note that the sync'ing parameters are for the entire page.
+This is important to remember when using fragments (``PP_FLAG_PAGE_FRAG``),
+where allocated buffers may be smaller than a full page.
+Unless the driver author really understands page pool internals
+it's recommended to always use ``offset = 0``, ``max_len = PAGE_SIZE``
+with fragmented page pools.
+
 Stats API and structures
 ------------------------
 If the kernel is configured with ``CONFIG_PAGE_POOL_STATS=y``, the API
-- 
2.41.0

