Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6720FC43217
	for <linux-doc@archiver.kernel.org>; Tue, 22 Nov 2022 10:44:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232855AbiKVKo2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Nov 2022 05:44:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232552AbiKVKoB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Nov 2022 05:44:01 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4554824BF2
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1669113467;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0BCDlnZyGDW7YaEJ/TivOn8mKa3/ZKeFN9Ygd4zUWM8=;
        b=FHEMAEz9xpfKp8wiJfWQB9n9bHoAK0lFlMyaceCKl+7TThldd3UIyegtF5Wa5e1Jtz38CN
        3niv5pOCLf2wNzJmkKEm0RApCCQmSqx8WZjxuEun9+oINAunIFlyYFnfse89eKNZv8gKK7
        A47bmFXvvzNpY3JXIkbhHFUWzVkHkrA=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-361-p9BDHAXgPji5Uq49zDe1Ew-1; Tue, 22 Nov 2022 05:37:46 -0500
X-MC-Unique: p9BDHAXgPji5Uq49zDe1Ew-1
Received: by mail-wr1-f69.google.com with SMTP id a13-20020adfbc4d000000b00241dda05c3dso1322771wrh.17
        for <linux-doc@vger.kernel.org>; Tue, 22 Nov 2022 02:37:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0BCDlnZyGDW7YaEJ/TivOn8mKa3/ZKeFN9Ygd4zUWM8=;
        b=I9+fjvjpPVhCXH2uT/eTSUnJ2NikMl7s17axC8oXMiqh2EGq/AVIQKnreib9Oj2BS2
         bq6hnjW10Ku1i2129Xu8GypMvKs7AnnojJdp7+wZuLUtZthckwTUcWXcUU0KAtgFTN3C
         5NLDc+FfTdlMCBUAUb/C/WcDgd/tSof5LG6AwK+3pTGO9s7AIQjr5JMCNVFhga0tm8HF
         2QamMlOWtcRgkpjIVh/sROwn3WlZ/kvVnkTyG+KAA4GQQH6Jq+DMc4Ul+Uhwkb2GxXH+
         /qa1XsqSZnSFKxdzTOw+rNDoj9Q3TsQbP7MLGuZhhh3R6dCc48ljE0VdhhyIihTVzKNL
         DRzQ==
X-Gm-Message-State: ANoB5pnuNUtI91DkJOOcKFr2Sx8QQmuc/IqhlICcQ1K89uDVU4JooI2x
        wz2ebb/CcQiBCiwsP8fw2oVyXyOIDlu9MqlPQqAlJFIEsvaSd7iTvPBjZ1PTW44FPCTobSzjJCy
        PIThR4nLXjJzqBmA23Hj+
X-Received: by 2002:adf:e50b:0:b0:240:e14:cfa8 with SMTP id j11-20020adfe50b000000b002400e14cfa8mr13539376wrm.63.1669113465168;
        Tue, 22 Nov 2022 02:37:45 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5vPa2asJ16s9GJjFoLHtjoFVYznQP3lg4nEMeCfAMG3Ej1SnUt8NrUNlUuRYYX712wqaV0ag==
X-Received: by 2002:adf:e50b:0:b0:240:e14:cfa8 with SMTP id j11-20020adfe50b000000b002400e14cfa8mr13539370wrm.63.1669113464918;
        Tue, 22 Nov 2022 02:37:44 -0800 (PST)
Received: from teaching-eagle.redhat.com ([78.19.107.254])
        by smtp.gmail.com with ESMTPSA id p11-20020a05600c468b00b003c65c9a36dfsm18674438wmo.48.2022.11.22.02.37.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Nov 2022 02:37:44 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        akiyks@gmail.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v1 2/2] docs: fix sphinx warnings for devmap
Date:   Tue, 22 Nov 2022 10:37:38 +0000
Message-Id: <20221122103738.65980-3-mtahhan@redhat.com>
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
DEVMAP documentation. This is because the function name is the same for
Kernel and Userspace BPF progs but the parameters and return types
they take is what differs. This patch moves from using the ``c:function::``
directive to using the ``code-block:: c`` directive. The patches also fix
the indentation for the text associated with the "new" code block delcarations.

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
---
 Documentation/bpf/map_devmap.rst | 64 ++++++++++++++++++++------------
 1 file changed, 40 insertions(+), 24 deletions(-)

diff --git a/Documentation/bpf/map_devmap.rst b/Documentation/bpf/map_devmap.rst
index f64da348dbfe..cdb7c484c425 100644
--- a/Documentation/bpf/map_devmap.rst
+++ b/Documentation/bpf/map_devmap.rst
@@ -29,8 +29,11 @@ Usage
 =====
 Kernel BPF
 ----------
-.. c:function::
-     long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+bpf_redirect_map()
+^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
+    long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
 
 Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
 For ``BPF_MAP_TYPE_DEVMAP`` and ``BPF_MAP_TYPE_DEVMAP_HASH`` this map contains
@@ -56,7 +59,10 @@ lower bits of the ``flags`` argument if the map lookup fails.
 
 More information about redirection can be found :doc:`redirect`
 
-.. c:function::
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
    void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
 
 Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
@@ -69,13 +75,16 @@ Userspace
     from an eBPF program. Trying to call these functions from a kernel eBPF
     program will result in the program failing to load and a verifier warning.
 
-.. c:function::
+bpf_map_update_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
+
    int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags);
 
- Net device entries can be added or updated using the ``bpf_map_update_elem()``
- helper. This helper replaces existing elements atomically. The ``value`` parameter
- can be ``struct bpf_devmap_val`` or a simple ``int ifindex`` for backwards
- compatibility.
+Net device entries can be added or updated using the ``bpf_map_update_elem()``
+helper. This helper replaces existing elements atomically. The ``value`` parameter
+can be ``struct bpf_devmap_val`` or a simple ``int ifindex`` for backwards
+compatibility.
 
  .. code-block:: c
 
@@ -87,35 +96,42 @@ Userspace
         } bpf_prog;
     };
 
- The ``flags`` argument can be one of the following:
-
+The ``flags`` argument can be one of the following:
   - ``BPF_ANY``: Create a new element or update an existing element.
   - ``BPF_NOEXIST``: Create a new element only if it did not exist.
   - ``BPF_EXIST``: Update an existing element.
 
- DEVMAPs can associate a program with a device entry by adding a ``bpf_prog.fd``
- to ``struct bpf_devmap_val``. Programs are run after ``XDP_REDIRECT`` and have
- access to both Rx device and Tx device. The  program associated with the ``fd``
- must have type XDP with expected attach type ``xdp_devmap``.
- When a program is associated with a device index, the program is run on an
- ``XDP_REDIRECT`` and before the buffer is added to the per-cpu queue. Examples
- of how to attach/use xdp_devmap progs can be found in the kernel selftests:
+DEVMAPs can associate a program with a device entry by adding a ``bpf_prog.fd``
+to ``struct bpf_devmap_val``. Programs are run after ``XDP_REDIRECT`` and have
+access to both Rx device and Tx device. The  program associated with the ``fd``
+must have type XDP with expected attach type ``xdp_devmap``.
+When a program is associated with a device index, the program is run on an
+``XDP_REDIRECT`` and before the buffer is added to the per-cpu queue. Examples
+of how to attach/use xdp_devmap progs can be found in the kernel selftests:
 
- - ``tools/testing/selftests/bpf/prog_tests/xdp_devmap_attach.c``
- - ``tools/testing/selftests/bpf/progs/test_xdp_with_devmap_helpers.c``
+- ``tools/testing/selftests/bpf/prog_tests/xdp_devmap_attach.c``
+- ``tools/testing/selftests/bpf/progs/test_xdp_with_devmap_helpers.c``
+
+bpf_map_lookup_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
 
 .. c:function::
    int bpf_map_lookup_elem(int fd, const void *key, void *value);
 
- Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
- helper.
+Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
+helper.
+
+bpf_map_delete_elem()
+^^^^^^^^^^^^^^^^^^^^^
+.. code-block:: c
 
 .. c:function::
    int bpf_map_delete_elem(int fd, const void *key);
 
- Net device entries can be deleted using the ``bpf_map_delete_elem()``
- helper. This helper will return 0 on success, or negative error in case of
- failure.
+Net device entries can be deleted using the ``bpf_map_delete_elem()``
+helper. This helper will return 0 on success, or negative error in case of
+failure.
 
 Examples
 ========
-- 
2.34.1

