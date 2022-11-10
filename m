Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59067C4332F
	for <linux-doc@archiver.kernel.org>; Thu, 10 Nov 2022 09:36:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229517AbiKJJgj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Nov 2022 04:36:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55452 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229953AbiKJJgi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Nov 2022 04:36:38 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E40C67F60
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 01:35:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1668072936;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=0X/RmXklChhxqc84Z0dEEMjcXwO6JfFXVJW+6wuw5f4=;
        b=V1vup68OTsrszZyOcQYcHYJVrTsTj95yXYRF73O+Kosu98PlnYZFphGsa0ZGsW6cc6EWJu
        LjO8gL2/mK70l8k9BjC0f7tSiUrh3K4N5r/HMn2yRvhONoN6ikOpFc8HXGooj8s4YIGq+f
        dGsmTqUw/ACp26atbdJ7KR46NoqyYsg=
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-455-rAUlvIgEN2S01Of4s5r0tA-1; Thu, 10 Nov 2022 04:35:35 -0500
X-MC-Unique: rAUlvIgEN2S01Of4s5r0tA-1
Received: by mail-qt1-f198.google.com with SMTP id b20-20020ac844d4000000b003a542f9de3dso970813qto.7
        for <linux-doc@vger.kernel.org>; Thu, 10 Nov 2022 01:35:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0X/RmXklChhxqc84Z0dEEMjcXwO6JfFXVJW+6wuw5f4=;
        b=Wcg+TI9ytMZszSLUgcNrNfhz1Jun/kcU2L1EEIjfjhCcmGegn60Yq1HfVm0Pem2R10
         64kmDPaSP1L2umAhPjZf7pnfKkQRcs5+D2IeQclcPumk22YebHrAkwU5duNvW8h1rUHt
         x22UgJnpZ+Kj79S9y53sJy34x+jg78JAAYXzK51aRdANVx/Zg0jMngI1lw1sh5omNPpM
         4RcVImyjAOEMlO25jT3e5lAaWqwkUD8GkwmeTwse15drJPYe97PA2mfnJ1a8bv3tGN0L
         ZJlNgDnWbL6UIJ+QMi/snXoUraNd1jcdBNf7wdyja6yKL6MNFZIu2Ecg/hAn5sIdYjoj
         A/6Q==
X-Gm-Message-State: ACrzQf2In6E66+fWNgI5y5MSmaXRC7usAI1CijYUBlggHZsDvQXlpv8t
        XQ7bdRAAiYujf+4xFJs2mrzZQf+h9sHVmWvUruqHQjBrJCPtSfOl74mQ0TJO9Q1QigMBQ+yqDfz
        YTYLsMSL278Z43ayGZqh9
X-Received: by 2002:a37:c10:0:b0:6f8:b76e:bc9 with SMTP id 16-20020a370c10000000b006f8b76e0bc9mr48667840qkm.700.1668072935134;
        Thu, 10 Nov 2022 01:35:35 -0800 (PST)
X-Google-Smtp-Source: AMsMyM5bGeq1d8GPoh9xCLIMHhJ3+fKHsXRSZGv9ZaIR5wAUia1TQjVOJnClYoyWd+plQNZ8PW8emA==
X-Received: by 2002:a37:c10:0:b0:6f8:b76e:bc9 with SMTP id 16-20020a370c10000000b006f8b76e0bc9mr48667826qkm.700.1668072934793;
        Thu, 10 Nov 2022 01:35:34 -0800 (PST)
Received: from nfvsdn-06.redhat.com (nat-pool-232-132.redhat.com. [66.187.232.132])
        by smtp.gmail.com with ESMTPSA id br7-20020a05620a460700b006bbc09af9f5sm12762258qkb.101.2022.11.10.01.35.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 01:35:34 -0800 (PST)
From:   mtahhan@redhat.com
To:     bpf@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     jbrouer@redhat.com, thoiland@redhat.com, donhunte@redhat.com,
        yhs@meta.com, Maryam Tahhan <mtahhan@redhat.com>
Subject: [PATCH bpf-next v7 1/1] doc: DEVMAPs and XDP_REDIRECT
Date:   Thu, 10 Nov 2022 05:29:50 -0500
Message-Id: <20221110102950.2633685-2-mtahhan@redhat.com>
X-Mailer: git-send-email 2.35.3
In-Reply-To: <20221110102950.2633685-1-mtahhan@redhat.com>
References: <20221110102950.2633685-1-mtahhan@redhat.com>
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

Signed-off-by: Maryam Tahhan <mtahhan@redhat.com>
---
 Documentation/bpf/index.rst      |   1 +
 Documentation/bpf/map_devmap.rst | 221 +++++++++++++++++++++++++++++++
 Documentation/bpf/redirect.rst   |  81 +++++++++++
 net/core/filter.c                |   8 +-
 4 files changed, 309 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/bpf/map_devmap.rst
 create mode 100644 Documentation/bpf/redirect.rst

diff --git a/Documentation/bpf/index.rst b/Documentation/bpf/index.rst
index 1b50de1983ee..1088d44634d6 100644
--- a/Documentation/bpf/index.rst
+++ b/Documentation/bpf/index.rst
@@ -29,6 +29,7 @@ that goes into great technical depth about the BPF Architecture.
    clang-notes
    linux-notes
    other
+   redirect
 
 .. only::  subproject and html
 
diff --git a/Documentation/bpf/map_devmap.rst b/Documentation/bpf/map_devmap.rst
new file mode 100644
index 000000000000..d231e1d30836
--- /dev/null
+++ b/Documentation/bpf/map_devmap.rst
@@ -0,0 +1,221 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2022 Red Hat, Inc.
+
+=================================================
+BPF_MAP_TYPE_DEVMAP and BPF_MAP_TYPE_DEVMAP_HASH
+=================================================
+
+.. note::
+   - ``BPF_MAP_TYPE_DEVMAP`` was introduced in kernel version 4.14
+   - ``BPF_MAP_TYPE_DEVMAP_HASH`` was introduced in kernel version 5.4
+
+``BPF_MAP_TYPE_DEVMAP`` and ``BPF_MAP_TYPE_DEVMAP_HASH`` are BPF maps primarily
+used as backend maps for the XDP BPF helper call ``bpf_redirect_map()``.
+``BPF_MAP_TYPE_DEVMAP`` is backed by an array that uses the key as
+the index to lookup a reference to a net device. While ``BPF_MAP_TYPE_DEVMAP_HASH``
+is backed by a hash table that uses a key to lookup a reference to a net device.
+The user provides either <``key``/ ``ifindex``> or <``key``/ ``struct bpf_devmap_val``>
+pairs to update the maps with new net devices.
+
+.. note::
+    - The key to a hash map doesn't have to be an ``ifindex``.
+    - While ``BPF_MAP_TYPE_DEVMAP_HASH`` allows for densely packing the net devices
+      it comes at the cost of a hash of the key when performing a look up.
+
+The setup and packet enqueue/send code is shared between the two types of
+devmap; only the lookup and insertion is different.
+
+Usage
+=====
+Kernel BPF
+----------
+.. c:function::
+     long bpf_redirect_map(struct bpf_map *map, u32 key, u64 flags)
+
+Redirect the packet to the endpoint referenced by ``map`` at index ``key``.
+For ``BPF_MAP_TYPE_DEVMAP`` and ``BPF_MAP_TYPE_DEVMAP_HASH`` this map contains
+references to net devices (for forwarding packets through other ports).
+
+The lower two bits of *flags* are used as the return code if the map lookup
+fails. This is so that the return value can be one of the XDP program return
+codes up to ``XDP_TX``, as chosen by the caller. The higher bits of ``flags``
+can be set to ``BPF_F_BROADCAST`` or ``BPF_F_EXCLUDE_INGRESS`` as defined
+below.
+
+With ``BPF_F_BROADCAST`` the packet will be broadcast to all the interfaces
+in the map, with ``BPF_F_EXCLUDE_INGRESS`` the ingress interface will be excluded
+from the broadcast.
+
+.. note::
+    - The key is ignored if BPF_F_BROADCAST is set.
+    - Multicast can also be achieved using multiple DEVMAPs.
+
+This helper will return ``XDP_REDIRECT`` on success, or the value of the two
+lower bits of the ``flags`` argument if the map lookup fails.
+
+More information about redirection can be found :doc:`redirect`
+
+.. c:function::
+   void *bpf_map_lookup_elem(struct bpf_map *map, const void *key)
+
+Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
+helper.
+
+Userspace
+---------
+.. note::
+    DEVMAP entries can only be updated/deleted from user space and not
+    from an eBPF program. Trying to call these functions from a kernel eBPF
+    program will result in the program failing to load and a verifier warning.
+
+.. c:function::
+   int bpf_map_update_elem(int fd, const void *key, const void *value, __u64 flags);
+
+ Net device entries can be added or updated using the ``bpf_map_update_elem()``
+ helper. This helper replaces existing elements atomically. The ``value`` parameter
+ can be ``struct bpf_devmap_val`` or a simple ``int ifindex`` for backwards
+ compatibility.
+
+ .. code-block:: c
+
+    struct bpf_devmap_val {
+        __u32 ifindex;   /* device index */
+        union {
+            int   fd;  /* prog fd on map write */
+            __u32 id;  /* prog id on map read */
+        } bpf_prog;
+    };
+
+ The ``flags`` argument can be one of the following:
+
+  - ``BPF_ANY``: Create a new element or update an existing element.
+  - ``BPF_NOEXIST``: Create a new element only if it did not exist.
+  - ``BPF_EXIST``: Update an existing element.
+
+ DEVMAPs can associate a program with a device entry by adding a ``bpf_prog.fd``
+ to ``struct bpf_devmap_val``. Programs are run after ``XDP_REDIRECT`` and have
+ access to both Rx device and Tx device. The  program associated with the ``fd``
+ must have type XDP with expected attach type ``xdp_devmap``.
+ When a program is associated with a device index, the program is run on an
+ ``XDP_REDIRECT`` and before the buffer is added to the per-cpu queue. Examples
+ of how to attach/use xdp_devmap progs can be found in the kernel selftests:
+
+ - ``tools/testing/selftests/bpf/prog_tests/xdp_devmap_attach.c``
+ - ``tools/testing/selftests/bpf/progs/test_xdp_with_devmap_helpers.c``
+
+.. c:function::
+   int bpf_map_lookup_elem(int fd, const void *key, void *value);
+
+ Net device entries can be retrieved using the ``bpf_map_lookup_elem()``
+ helper.
+
+.. c:function::
+   int bpf_map_delete_elem(int fd, const void *key);
+
+ Net device entries can be deleted using the ``bpf_map_delete_elem()``
+ helper. This helper will return 0 on success, or negative error in case of
+ failure.
+
+Examples
+========
+
+Kernel BPF
+----------
+
+The following code snippet shows how to declare a ``BPF_MAP_TYPE_DEVMAP``
+called tx_port.
+
+.. code-block:: c
+
+    struct {
+        __uint(type, BPF_MAP_TYPE_DEVMAP);
+        __type(key, __u32);
+        __type(value, __u32);
+        __uint(max_entries, 256);
+    } tx_port SEC(".maps");
+
+The following code snippet shows how to declare a ``BPF_MAP_TYPE_DEVMAP_HASH``
+called forward_map.
+
+.. code-block:: c
+
+    struct {
+        __uint(type, BPF_MAP_TYPE_DEVMAP_HASH);
+        __type(key, __u32);
+        __type(value, struct bpf_devmap_val);
+        __uint(max_entries, 32);
+    } forward_map SEC(".maps");
+
+.. note::
+
+    The value type in the DEVMAP above is a ``struct bpf_devmap_val``
+
+The following code snippet shows a simple xdp_redirect_map program. This program
+would work with a user space program that populates the devmap ``forward_map`` based
+on ingress ifindexes. The BPF program (below) is redirecting packets using the
+ingress ``ifindex`` as the ``key``.
+
+.. code-block:: c
+
+    SEC("xdp")
+    int xdp_redirect_map_func(struct xdp_md *ctx)
+    {
+        int index = ctx->ingress_ifindex;
+
+        return bpf_redirect_map(&forward_map, index, 0);
+    }
+
+The following code snippet shows a BPF program that is broadcasting packets to
+all the interfaces in the ``tx_port`` devmap.
+
+.. code-block:: c
+
+    SEC("xdp")
+    int xdp_redirect_map_func(struct xdp_md *ctx)
+    {
+        return bpf_redirect_map(&tx_port, 0, BPF_F_BROADCAST | BPF_F_EXCLUDE_INGRESS);
+    }
+
+User space
+----------
+
+The following code snippet shows how to update a devmap called ``tx_port``.
+
+.. code-block:: c
+
+    int update_devmap(int ifindex, int redirect_ifindex)
+    {
+        int ret;
+
+        ret = bpf_map_update_elem(bpf_map__fd(tx_port), &ifindex, &redirect_ifindex, 0);
+        if (ret < 0) {
+            fprintf(stderr, "Failed to update devmap_ value: %s\n",
+                strerror(errno));
+        }
+
+        return ret;
+    }
+
+The following code snippet shows how to update a hash_devmap called ``forward_map``.
+
+.. code-block:: c
+
+    int update_devmap(int ifindex, int redirect_ifindex)
+    {
+        struct bpf_devmap_val devmap_val = { .ifindex = redirect_ifindex };
+        int ret;
+
+        ret = bpf_map_update_elem(bpf_map__fd(forward_map), &ifindex, &devmap_val, 0);
+        if (ret < 0) {
+            fprintf(stderr, "Failed to update devmap_ value: %s\n",
+                strerror(errno));
+        }
+        return ret;
+    }
+
+References
+===========
+
+- https://lwn.net/Articles/728146/
+- https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git/commit/?id=6f9d451ab1a33728adb72d7ff66a7b374d665176
+- https://elixir.bootlin.com/linux/latest/source/net/core/filter.c#L4106
diff --git a/Documentation/bpf/redirect.rst b/Documentation/bpf/redirect.rst
new file mode 100644
index 000000000000..9440a913c185
--- /dev/null
+++ b/Documentation/bpf/redirect.rst
@@ -0,0 +1,81 @@
+.. SPDX-License-Identifier: GPL-2.0-only
+.. Copyright (C) 2022 Red Hat, Inc.
+
+========
+Redirect
+========
+XDP_REDIRECT
+############
+Supported maps
+--------------
+
+XDP_REDIRECT works with the following map types:
+
+- ``BPF_MAP_TYPE_DEVMAP``
+- ``BPF_MAP_TYPE_DEVMAP_HASH``
+- ``BPF_MAP_TYPE_CPUMAP``
+- ``BPF_MAP_TYPE_XSKMAP``
+
+For more information on these maps, please see the specific map documentation.
+
+Process
+-------
+
+.. kernel-doc:: net/core/filter.c
+   :doc: xdp redirect
+
+.. note::
+    Not all drivers support transmitting frames after a redirect, and for
+    those that do, not all of them support non-linear frames. Non-linear xdp
+    bufs/frames are bufs/frames that contain more than one fragment.
+
+Debugging packet drops
+----------------------
+Silent packet drops for ``XDP_REDIRECT`` can be debugged using:
+
+- bpf_trace
+- perf_record
+
+bpf_trace
+^^^^^^^^^
+The following bpftrace command can be used to capture and count all XDP tracepoints:
+
+.. code-block:: none
+
+    sudo bpftrace -e 'tracepoint:xdp:* { @cnt[probe] = count(); }'
+    Attaching 12 probes...
+    ^C
+
+    @cnt[tracepoint:xdp:mem_connect]: 18
+    @cnt[tracepoint:xdp:mem_disconnect]: 18
+    @cnt[tracepoint:xdp:xdp_exception]: 19605
+    @cnt[tracepoint:xdp:xdp_devmap_xmit]: 1393604
+    @cnt[tracepoint:xdp:xdp_redirect]: 22292200
+
+.. note::
+    The various xdp tracepoints can be found in ``source/include/trace/events/xdp.h``
+
+The following bpftrace command can be used to extract the ``ERRNO`` being returned as
+part of the err parameter:
+
+.. code-block:: none
+
+    sudo bpftrace -e \
+    'tracepoint:xdp:xdp_redirect*_err {@redir_errno[-args->err] = count();}
+    tracepoint:xdp:xdp_devmap_xmit {@devmap_errno[-args->err] = count();}'
+
+perf record
+^^^^^^^^^^^
+The perf tool also supports recording tracepoints:
+
+.. code-block:: none
+
+    perf record -a -e xdp:xdp_redirect_err \
+        -e xdp:xdp_redirect_map_err \
+        -e xdp:xdp_exception \
+        -e xdp:xdp_devmap_xmit
+
+References
+===========
+
+- https://github.com/xdp-project/xdp-tutorial/tree/master/tracing02-xdp-monitor
diff --git a/net/core/filter.c b/net/core/filter.c
index bb0136e7a8e4..d582cb025f4c 100644
--- a/net/core/filter.c
+++ b/net/core/filter.c
@@ -4104,7 +4104,10 @@ static const struct bpf_func_proto bpf_xdp_adjust_meta_proto = {
 	.arg2_type	= ARG_ANYTHING,
 };
 
-/* XDP_REDIRECT works by a three-step process, implemented in the functions
+/**
+ * DOC: xdp redirect
+ *
+ * XDP_REDIRECT works by a three-step process, implemented in the functions
  * below:
  *
  * 1. The bpf_redirect() and bpf_redirect_map() helpers will lookup the target
@@ -4119,7 +4122,8 @@ static const struct bpf_func_proto bpf_xdp_adjust_meta_proto = {
  * 3. Before exiting its NAPI poll loop, the driver will call xdp_do_flush(),
  *    which will flush all the different bulk queues, thus completing the
  *    redirect.
- *
+ */
+/*
  * Pointers to the map entries will be kept around for this whole sequence of
  * steps, protected by RCU. However, there is no top-level rcu_read_lock() in
  * the core code; instead, the RCU protection relies on everything happening
-- 
2.35.3

