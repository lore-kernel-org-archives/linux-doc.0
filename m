Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911D3C76196
	for <linux-doc@archiver.kernel.org>; Sat,  1 Apr 2023 20:07:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229780AbjDAUHD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 1 Apr 2023 16:07:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35676 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229450AbjDAUHC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 1 Apr 2023 16:07:02 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0578EF76F
        for <linux-doc@vger.kernel.org>; Sat,  1 Apr 2023 13:07:02 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id c18so24557791ple.11
        for <linux-doc@vger.kernel.org>; Sat, 01 Apr 2023 13:07:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=isovalent.com; s=google; t=1680379621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=55VzfyOLyKrmQayXTe0Ok8WFjIJZ8kHqyvefO/NMooI=;
        b=DLJRLpPzbqyNUw3Abs2sFgLvaXGi7PRyYhglY8RJuMhT2bGzYs13qdo9vcHy8Vbayb
         yqBSVM1y/zkE24q+o5FlsaacfP9aN6BG8wUosiwARFc0lqLqvuQ1i6grWf3G/8KWHbQf
         z3qjzED4miHFq/H8fCtMv1YkaRDARVK3SXKVlmfrToTx+VFIWzCH5u+/8jPKv8C9Ulla
         6yGsfl2NxWg6ylwO8+M8rjmNYnaBZ/QurAjEFPa37ljGSwahhJRc8HNFQtKBiR+QUndY
         MoGDMhVxdRdoCOqzMlZkTIYAAc2iHTgt6uJMiZvVK07dyRtA/cbz3bYfRNiY0LIP6Q8h
         JhAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680379621;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=55VzfyOLyKrmQayXTe0Ok8WFjIJZ8kHqyvefO/NMooI=;
        b=EBwaPuvPqM2N3/fmHiMEK5jcKO4uEj3JA/7Ozhioh9DDQdTh/b/BX8RTA0ZoFBXR+9
         JD1E1tlMJ7T9xLCjfNj5kUmfaDY4/nlZLQcuL8fCpnYsLg+A4SdgJoEQ0qxvdeg0UhfW
         5FmZIndhlSfwdbEWWOpJCWM122xoqOn+trrNHx7yNtIsgsDoKe0IRuLslApaSfXzi6kI
         Qlk2vVL2UkoUwIwPfIO2wGQZv4UMk6H/PyDSgEfxIiXB+odw04o38/ZeEs6InaG8/wjq
         LKLSbx3yqsP5ssDw4j8h8XS0KGMVWryr8bFpqWW5th68oi9/Q9EZFG4fR8NE7awa2OQy
         JsjA==
X-Gm-Message-State: AAQBX9etOFeK/5gIkelKSWo3wJroyU0WacayP1JeJy8SVaxe5ok4cerV
        ioBEwvhRA4vidIn4wM/tHBerQQ==
X-Google-Smtp-Source: AKy350Yh150VuTm0LhLpmUKQjFb0pncHhOGcACN5SniiiqnWOt5ZEt7LBALpW0X3mPg826OWUDIPXg==
X-Received: by 2002:a17:90b:4c4a:b0:23b:bf03:397e with SMTP id np10-20020a17090b4c4a00b0023bbf03397emr36423906pjb.24.1680379621427;
        Sat, 01 Apr 2023 13:07:01 -0700 (PDT)
Received: from carnotaurus.. (c-73-231-147-44.hsd1.ca.comcast.net. [73.231.147.44])
        by smtp.gmail.com with ESMTPSA id x20-20020a17090300d400b0019f27fd7cecsm3715438plc.197.2023.04.01.13.06.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Apr 2023 13:07:00 -0700 (PDT)
From:   Joe Stringer <joe@isovalent.com>
To:     bpf@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        ast@kernel.org, corbet@lwn.net, martin.lau@linux.dev,
        bagasdotme@gmail.com, maxtram95@gmail.com, john.fastabend@gmail.com
Subject: [PATCH bpf-next v4 1/2] docs/bpf: Add table to describe LRU properties
Date:   Sat,  1 Apr 2023 13:06:50 -0700
Message-Id: <20230401200651.1022113-1-joe@isovalent.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Depending on the map type and flags for LRU, different properties are
global or percpu. Add a table to describe these.

Signed-off-by: Joe Stringer <joe@isovalent.com>
---
v4: Initial posting
---
 Documentation/bpf/map_hash.rst | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/Documentation/bpf/map_hash.rst b/Documentation/bpf/map_hash.rst
index 8669426264c6..45d923cd16c4 100644
--- a/Documentation/bpf/map_hash.rst
+++ b/Documentation/bpf/map_hash.rst
@@ -29,7 +29,16 @@ will automatically evict the least recently used entries when the hash
 table reaches capacity. An LRU hash maintains an internal LRU list that
 is used to select elements for eviction. This internal LRU list is
 shared across CPUs but it is possible to request a per CPU LRU list with
-the ``BPF_F_NO_COMMON_LRU`` flag when calling ``bpf_map_create``.
+the ``BPF_F_NO_COMMON_LRU`` flag when calling ``bpf_map_create``.  The
+following table outlines the properties of LRU maps depending on the a
+map type and the flags used to create the map.
+
+======================== ========================= ================================
+Flag                     ``BPF_MAP_TYPE_LRU_HASH`` ``BPF_MAP_TYPE_LRU_PERCPU_HASH``
+======================== ========================= ================================
+``BPF_F_NO_COMMON_LRU``  Per-CPU LRU, global map   Per-CPU LRU, per-cpu map
+``!BPF_F_NO_COMMON_LRU`` Global LRU, global map    Global LRU, per-cpu map
+======================== ========================= ================================
 
 Usage
 =====
-- 
2.34.1

