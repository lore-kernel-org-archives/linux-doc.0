Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 346E7C4332F
	for <linux-doc@archiver.kernel.org>; Sun, 13 Nov 2022 09:40:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235267AbiKMJkR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 13 Nov 2022 04:40:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229753AbiKMJkQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 13 Nov 2022 04:40:16 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB176CE1B
        for <linux-doc@vger.kernel.org>; Sun, 13 Nov 2022 01:39:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668332361;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=7aQcfARlP8kkqYFBPkiKIdeI1nmjJ0+x3xBdw4YF//Q=;
        b=CWjLkuutvefh94nzrYBZU5/Y//oVqwVkuBGiqF4opty8TVAp5mdN62NkIuIc+C3rQr0jrL
        CszSJpP+A7UBHKy87KQtKrrGplUCPjqec1yEkxsZBLJGxicS1hXkpcn78rmt8QDGngjfAF
        0phv1VWC/DdUdsiUx46Li3kLzCo9P8g=
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-606-lNwiui-APG-R-LUpXtUsFA-1; Sun, 13 Nov 2022 04:39:20 -0500
X-MC-Unique: lNwiui-APG-R-LUpXtUsFA-1
Received: by mail-qv1-f71.google.com with SMTP id l6-20020ad44446000000b004bb60364075so6811938qvt.13
        for <linux-doc@vger.kernel.org>; Sun, 13 Nov 2022 01:39:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7aQcfARlP8kkqYFBPkiKIdeI1nmjJ0+x3xBdw4YF//Q=;
        b=f4AMzScFzIqIYI7ZOAJUD64hQffEcVbdKapMG6r8O330l55tJ5TGVeQRHJkdBQTflI
         65E+yyOGjWVrD6oxuOozg7C1lmJp9oMaGcUUqIf7fGmzBT6WlCRssJb4NrjdjKT9UE62
         knFkZFEhnEY6cJCf/2SiFsrRr1pdPQn1shEYfRmnt20VJqrxyn4hcHZzq3m5nxa+8O/K
         Ls5ZISaQqPllG7E2xEUA4OFwwn7Wo9X5ZxIsI6e1f3nN69y0oWSpoizMKl7OeN81Ae9+
         MRL0kTcJ0n3mnH+Ot77ns4Hzj5fl5n7T3h7U7uKA3Pel2/q2wqQMTGPMNzEffucRPui1
         DF9A==
X-Gm-Message-State: ANoB5pklLtuLmnQpPYkoaYOcDi3gOvw9LQCb4p24ddOXWvI+goyQ5hE2
        o/OgDLdojQI0jVLM3J3A+zPQNSQZ/HxDIZNV+THv1eXWHZABVqJb0wNNzSNohO2nOgs8q04SY2K
        uq4zgCYaWLE0wA9BdcA8h
X-Received: by 2002:ac8:44a4:0:b0:3a5:3ae2:ff14 with SMTP id a4-20020ac844a4000000b003a53ae2ff14mr8114025qto.594.1668332360075;
        Sun, 13 Nov 2022 01:39:20 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4mMWgdRfQp+cXFnydxZrFlcpnHUuculWEqy7HZTQQ6S5CgdeY2JZ/iT2pPwdU0Wqi7a0BWug==
X-Received: by 2002:ac8:44a4:0:b0:3a5:3ae2:ff14 with SMTP id a4-20020ac844a4000000b003a53ae2ff14mr8114019qto.594.1668332359884;
        Sun, 13 Nov 2022 01:39:19 -0800 (PST)
Received: from nfvsdn-06.redhat.com (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id v65-20020a379344000000b006e54251993esm4462884qkd.97.2022.11.13.01.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Nov 2022 01:39:19 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v1 1/1] docs: fixup cpumap sphinx >= 3.1 warning
Date:   Sun, 13 Nov 2022 05:33:27 -0500
Message-Id: <20221113103327.3287482-1-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Fixup bpf_map_update_elem() declaration to use a single line.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
Reported-by: Akira Yokosawa <akiyks@gmail.com>
---
 Documentation/bpf/map_cpumap.rst | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/Documentation/bpf/map_cpumap.rst b/Documentation/bpf/map_cpumap.rst
index eaf57b38cafd..61a797a86342 100644
--- a/Documentation/bpf/map_cpumap.rst
+++ b/Documentation/bpf/map_cpumap.rst
@@ -48,8 +48,7 @@ Userspace
     program will result in the program failing to load and a verifier warning.
 
 .. c:function::
-    int bpf_map_update_elem(int fd, const void *key, const void *value,
-                   __u64 flags);
+    int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags);
 
  CPU entries can be added or updated using the ``bpf_map_update_elem()``
  helper. This helper replaces existing elements atomically. The ``value`` parameter
-- 
2.35.3

