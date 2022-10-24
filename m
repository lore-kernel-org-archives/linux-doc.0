Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71AAEECAAA1
	for <linux-doc@archiver.kernel.org>; Mon, 24 Oct 2022 17:41:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230405AbiJXRlf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 24 Oct 2022 13:41:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55312 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233942AbiJXRk7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 24 Oct 2022 13:40:59 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E53A5144E2D
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 09:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1666628049;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7yug/hLUQCw7qYq1gKwXHE2PBRB1KoHvO1djMcyNbXQ=;
        b=EdimM0u+n/PuLMQiJeGTuB8nvYPh6JVsItQnfOs7QgIz9e3HbnjkbJNYsOpIMUxBH3Ozdd
        vIIAOpABxA+2OUcDii6Onr1JHIMddf29ukH1JTAZNiHgGNQfIIcirlWSpptYWqvEclESns
        2YLGZtBeqYKnt86p4U4w4roP9ydO6hc=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-580-Zmd4tcYOMl67naSzwho6OA-1; Mon, 24 Oct 2022 07:48:39 -0400
X-MC-Unique: Zmd4tcYOMl67naSzwho6OA-1
Received: by mail-qv1-f72.google.com with SMTP id e13-20020ad450cd000000b004bb49d98da4so3930744qvq.9
        for <linux-doc@vger.kernel.org>; Mon, 24 Oct 2022 04:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7yug/hLUQCw7qYq1gKwXHE2PBRB1KoHvO1djMcyNbXQ=;
        b=XbJw3sSoz0mO5TRRJ2XqNGns12R4AeIVHjn91c38Kp5h29h4K5bRbEPE8fXEy3sFeE
         Fma+L8AGjNPYAnVISclPwyvYrO80vnlqQZsO00QgXn5MTo/8pmbLRGZixsIkBS/2gDAa
         vOS9ti2rxYXlWxs2PZZEL7U3B+bbmzOo5yu2d/lhYpfZhjtWzigg6UUeT9U+roblrWUT
         YDajX7Nx40t7JjkiLpkezdpUfeYTCnGepzGYVkI3N3j1qCoJM4+4Gq/MlTs1rOPdvVjR
         tdv1zGr/RV4dWuax6Os6sn4Jr+np/H9fX/LGRb9r8fJGQ+Aw2WOFMF8xYP4fbIQO0Shi
         WRhw==
X-Gm-Message-State: ACrzQf1LpqzeWzYTqwk3NxtUs2cx5VaNjJRt3wiMqBH0KjBB7oNuJmuy
        9QsHt7Mw1eYmZ2uvNd1CNL+DvVnRHs2UzSBrBJ6metXKlZMhDOvERxxp+3HHX1z66KpbfoNjp0Z
        GFW6V9eiXkIdbPoxo0ZGx
X-Received: by 2002:a05:622a:1015:b0:39c:be69:bf2d with SMTP id d21-20020a05622a101500b0039cbe69bf2dmr27865540qte.85.1666612119361;
        Mon, 24 Oct 2022 04:48:39 -0700 (PDT)
X-Google-Smtp-Source: AMsMyM4+ASXME3U+PSmVa7jxRPX3J3GOgBErk2ndsbpTfCWuYTw+fxoM9+sZu/lt7RYI7zXlyo9vNA==
X-Received: by 2002:a05:622a:1015:b0:39c:be69:bf2d with SMTP id d21-20020a05622a101500b0039cbe69bf2dmr27865531qte.85.1666612119158;
        Mon, 24 Oct 2022 04:48:39 -0700 (PDT)
Received: from nfvsdn-06.testing.baremetal.edge-sites.net (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id m15-20020a05620a13af00b006ee949b8051sm14653564qki.51.2022.10.24.04.48.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Oct 2022 04:48:38 -0700 (PDT)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v5 0/1] doc: DEVMAPs and XDP_REDIRECT
Date:   Mon, 24 Oct 2022 08:43:40 -0400
Message-Id: <20221024124341.2157865-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Add documentation for BPF_MAP_TYPE_DEVMAP and
BPF_MAP_TYPE_DEVMAP_HASH including kernel version
introduced, usage and examples.

Add documentation that describes XDP_REDIRECT.

v4->v5:
- Remove unused 'index' variable in example.

v3->v4:
- Prepend supported map section for XDP_REDIRECT documentation.

v2->v3:
- Fixed indentations in usage section to exclude non note text.
- Replace links to selftest with actual paths.

v1->v2:
- Separate xdp_redirect documentation to its own file.
- Clean up and simplify examples and usage function descriptions.

Maryam Tahhan (1):
  doc: DEVMAPs and XDP_REDIRECT

 Documentation/bpf/index.rst      |   1 +
 Documentation/bpf/map_devmap.rst | 203 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  45 +++++++
 3 files changed, 249 insertions(+)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

-- 
2.35.3

