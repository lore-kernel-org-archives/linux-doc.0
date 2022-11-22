Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87543C4332F
	for <linux-doc@archiver.kernel.org>; Tue, 22 Nov 2022 10:44:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232080AbiKVKoY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Nov 2022 05:44:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232586AbiKVKn6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Nov 2022 05:43:58 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BCA5823EAD
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669113466;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=s+4gJYDnQvTuS/31lYB/e4/AodAkPbxTauMPJtMr03Q=;
        b=cpimy1dbiOCVxjVdSEZbvd1tNwEV1ctnoSa9vTDIDXVnealqZNlL0ne37U0OJFmiw32fOf
        xQLp2u3PXAR4gyZQG7Hl9yZbINsn3VdhtA28fxFxM6Tosta6CiN92U8UAnmVZgtuRQGif+
        zxTj7PBifX7xuQ8pMwhpR7ErXHYqftI=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-595-qXg7XEzIMZG0vyE1i1TCXA-1; Tue, 22 Nov 2022 05:37:44 -0500
X-MC-Unique: qXg7XEzIMZG0vyE1i1TCXA-1
Received: by mail-wm1-f69.google.com with SMTP id 187-20020a1c02c4000000b003d016c210f7so4796150wmc.6
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:44 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=s+4gJYDnQvTuS/31lYB/e4/AodAkPbxTauMPJtMr03Q=;
        b=4IuYUqJm19Y3e6/htfluu1Z9qz9ra/f+UjcTIvsxhukMONJfCRuDhUuDYsRg7Mlum9
         mlhxN1SfxnoIjskmYu7sZuwhmp8EVz9NwwHN4oAci7xs+dWZ8x3r+GFQrXC94BLjKlhY
         QgfJwxzldZEoFtZW967T5SO4SqOqu6q6R8QZ9lPjvKKD1V53UX2tpNU1YpUu/gE1CQ8x
         qdHgMdYchUiSHSjfuhaeZacR4nZJORzKxegDJiU+Ru6FwQ6HOFQY0NIQgLSeRDR/7d2A
         stkcZlU2ed7MoOVyi1AcrMHcnsWbrsMXFll3kRjmgX/7jEzPi3MEOqsplc8QwJxHHEde
         zh8A==
X-Gm-Message-State: ANoB5pnxusveL1NkBsce2rJ1lDnGETkTqQZrBDGqJS49tYgVt9z0Qhky
        EZNlOk8MEIVwa7iVFQGT6cdhWhHad/OZBrRiKitjKoijqK8YuluWx0o2abNxMzVaLmuV7kRe+D0
        z+jdGHWXYPV8Lojh2opVN
X-Received: by 2002:a05:600c:4f92:b0:3cf:e87a:8068 with SMTP id n18-20020a05600c4f9200b003cfe87a8068mr9603564wmq.3.1669113463632;
        Tue, 22 Nov 2022 02:37:43 -0800 (PST)
X-Google-Smtp-Source: AA0mqf4Ab8h51KNcYx1KMRerv4pVPNWsPhdy90oxEI7wCRvozraqNMuP3TQujOLw162yul2tIKLrjQ==
X-Received: by 2002:a05:600c:4f92:b0:3cf:e87a:8068 with SMTP id n18-20020a05600c4f9200b003cfe87a8068mr9603540wmq.3.1669113463345;
        Tue, 22 Nov 2022 02:37:43 -0800 (PST)
Received: from teaching-eagle.redhat.com ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003c65c9a36dfsm18674438wmo.48.2022.11.22.02.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:37:42 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v1 1/2] docs: fix sphinx warnings for cpumap
Date:   Tue, 22 Nov 2022 10:37:37 +0000
Message-Id: <20221122103738.65980-2-mtahhan@redhat.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20221122103738.65980-1-mtahhan@redhat.com>
References: <20221122103738.65980-1-mtahhan@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maryam Tahhan <mtahhan@redhat.com>

Sphinx version >=3.3 warns about duplicate function delcarations in the
CPUMAP documentation. This is because the function name is the same for
Kernel and Userspace BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
---
 Documentation/bpf/map_cpumap.rst | 48 ++++++++++++++++++++------------
 1 file changed, 30 insertions(+), 18 deletions(-)

diff --git a/Documentation/bpf/map_cpumap.rst b/Documentation/bpf/map_cpumap.rst
index 61a797a86342..e8d9f7abf26a 100644
--- a/Documentation/bpf/map_cpumap.rst
+++ b/Documentation/bpf/map_cpumap.rst
@@ -30,15 +30,18 @@ Usage
 
 Kernel BPF
 ----------
-.. c:function::
+bpf_redirect_map()
+^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
      long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
 
- Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
- For ``BPF_MAP_TYPE_CPUMAP`` this map contains references to CPUs.
+Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
+For ``BPF_MAP_TYPE_CPUMAP`` this map contains references to CPUs.
 
- The lower two bits of ``flags`` are used as the return code if the map lookup
- fails. This is so that the return value can be one of the XDP program return
- codes up to ``XDP_TX``, as chosen by the caller.
+The lower two bits of ``flags`` are used as the return code if the map lookup
+fails. This is so that the return value can be one of the XDP program return
+codes up to ``XDP_TX``, as chosen by the caller.
 
 Userspace
 ---------
@@ -47,12 +50,15 @@ Userspace
     from an eBPF program. Trying to call these functions from a kernel eBPF
     program will result in the program failing to load and a verifier warning.
 
-.. c:function::
+bpf_map_update_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
     int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags);
 
- CPU entries can be added or updated using the ``bpf_map_update_elem()``
- helper. This helper replaces existing elements atomically. The ``value`` parameter
- can be ``struct bpf_cpumap_val``.
+CPU entries can be added or updated using the ``bpf_map_update_elem()``
+helper. This helper replaces existing elements atomically. The ``value`` parameter
+can be ``struct bpf_cpumap_val``.
 
  .. code-block:: c
 
@@ -64,23 +70,29 @@ Userspace
         } bpf_prog;
     };
 
- The flags argument can be one of the following:
+The flags argument can be one of the following:
   - BPF_ANY: Create a new element or update an existing element.
   - BPF_NOEXIST: Create a new element only if it did not exist.
   - BPF_EXIST: Update an existing element.
 
-.. c:function::
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
     int bpf_map_lookup_elem(int fd, const void *key, void *value);
 
- CPU entries can be retrieved using the ``bpf_map_lookup_elem()``
- helper.
+CPU entries can be retrieved using the ``bpf_map_lookup_elem()``
+helper.
+
+bpf_map_delete_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
 
-.. c:function::
     int bpf_map_delete_elem(int fd, const void *key);
 
- CPU entries can be deleted using the ``bpf_map_delete_elem()``
- helper. This helper will return 0 on success, or negative error in case of
- failure.
+CPU entries can be deleted using the ``bpf_map_delete_elem()``
+helper. This helper will return 0 on success, or negative error in case of
+failure.
 
 Examples
 ========
-- 
2.34.1

