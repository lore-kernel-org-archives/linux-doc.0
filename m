Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2D0C001DF
	for <linux-doc@archiver.kernel.org>; Wed,  2 Aug 2023 16:18:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229725AbjHBQS3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 2 Aug 2023 12:18:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjHBQS2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 2 Aug 2023 12:18:28 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A757B2
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 09:18:27 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id C888061A3D
        for <linux-doc@vger.kernel.org>; Wed,  2 Aug 2023 16:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8BF36C433CA;
        Wed,  2 Aug 2023 16:18:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1690993106;
        bh=/waJYIjs/TyicoJn0gOMo+WVBz8zuS2Hff9MhcapkBI=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=FRrFOZ3JvhXQqxQNmkMd8QPUaI/ng1n2LIXZAF2P+mvrsU4oBgyjjWq+SDWm8aExK
         zl+2/+6dJNzenHxAEk4dkTl3/gj4wrHAgLz7QOJvWskRkEfW7kcOSfrJLCGgEcmdsh
         ZOhQBft0UbmhyaT7Z/u/qleyPF4vwylgbn5agqQKKBv2iqiLEcD9UsndSQQidGhhl9
         5ZG/yYq95D5zu0/hHWJh7Gad1qayh/V9+jftv2WBeRyP6b+rKQBsP0PcEjxpt+5lpw
         z87PoZsevP1DXbCy/lCJTxrvhdvCjCwKlCXM0+sKQpvgPIrTHlSMfL5NCy5PJIU26s
         7QdXQgQRwwhgQ==
From:   Jakub Kicinski <kuba@kernel.org>
To:     davem@davemloft.net
Cc:     netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
        aleksander.lobakin@intel.com, Jakub Kicinski <kuba@kernel.org>,
        hawk@kernel.org, ilias.apalodimas@linaro.org, corbet@lwn.net,
        linux-doc@vger.kernel.org,
        Michael Chan <michael.chan@broadcom.com>,
        Lorenzo Bianconi <lorenzo@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v2 1/2] docs: net: page_pool: document PP_FLAG_DMA_SYNC_DEV parameters
Date:   Wed,  2 Aug 2023 09:18:20 -0700
Message-ID: <20230802161821.3621985-2-kuba@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230802161821.3621985-1-kuba@kernel.org>
References: <20230802161821.3621985-1-kuba@kernel.org>
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
v2:
 - s/sync'/sync/ and other fixes from Randy
v1: https://lore.kernel.org/all/20230801203124.980703-1-kuba@kernel.org/

CC: hawk@kernel.org
CC: ilias.apalodimas@linaro.org
CC: corbet@lwn.net
CC: linux-doc@vger.kernel.org
CC: Michael Chan <michael.chan@broadcom.com>
CC: Lorenzo Bianconi <lorenzo@kernel.org>
CC: Randy Dunlap <rdunlap@infradead.org>
---
 Documentation/networking/page_pool.rst | 34 ++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/networking/page_pool.rst b/Documentation/networking/page_pool.rst
index 0aa850cf4447..eb96a592ec6b 100644
--- a/Documentation/networking/page_pool.rst
+++ b/Documentation/networking/page_pool.rst
@@ -109,6 +109,40 @@ a page will cause no race conditions is enough.
   caller can then report those stats to the user (perhaps via ethtool,
   debugfs, etc.). See below for an example usage of this API.
 
+DMA sync
+--------
+Driver is always responsible for syncing the pages for the CPU.
+Drivers may choose to take care of syncing for the device as well
+or set the ``PP_FLAG_DMA_SYNC_DEV`` flag to request that pages
+allocated from the page pool are already synced for the device.
+
+If ``PP_FLAG_DMA_SYNC_DEV`` is set, the driver must inform the core what portion
+of the buffer has to be synced. This allows the core to avoid syncing the entire
+page when the drivers knows that the device only accessed a portion of the page.
+
+Most drivers will reserve headroom in front of the frame. This part
+of the buffer is not touched by the device, so to avoid syncing
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
+Note that the syncing parameters are for the entire page.
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

