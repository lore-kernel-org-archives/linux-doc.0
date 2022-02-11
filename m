Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32DF6C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Feb 2022 16:18:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351129AbiBKQSq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Feb 2022 11:18:46 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:46580 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238817AbiBKQSp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Feb 2022 11:18:45 -0500
Received: from mail-yb1-xb49.google.com (mail-yb1-xb49.google.com [IPv6:2607:f8b0:4864:20::b49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CD19D2E6
        for <linux-doc@vger.kernel.org>; Fri, 11 Feb 2022 08:18:43 -0800 (PST)
Received: by mail-yb1-xb49.google.com with SMTP id v134-20020a25618c000000b00620dc86b9d6so12357963ybb.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Feb 2022 08:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=yZLJCK7E+jF9SMNP1+4R/zXh1+xClGhVRWVCTVgc4sc=;
        b=XMgJm0JnHLSh1BoAQZ0wKW1tqDREm4lLvo1GgrQbJjxOht9DuV2ml/M55v/YYYtwG0
         EiX+KPa11IXCkHxfjDJ+jqjtozMdXO8Np1xzeO0YafmBD2TU0JlinyFCVvLW1rCwcCdZ
         /67a9xCpHLDF2di7B26fW8eJ3s0rX9wB1nI24kFBk8sgAKm4tMtoVZMf/yF+8MHFUzmC
         QNdvprMkp7K7VXtvF+nMffFYcUR4zeTM22B4QkFSF1Qw8M748l+D1HGKINDyJL+qVrEZ
         7Hxo0m9piTC3QY0bjNEgwJt9fVXLWzIOFBU2gNAs/Btn+n7fz9/GKQAbXBpP767W1iWa
         t4eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc
         :content-transfer-encoding;
        bh=yZLJCK7E+jF9SMNP1+4R/zXh1+xClGhVRWVCTVgc4sc=;
        b=pZKoRuzsPkeddjz7mR5ib22jcT+XvC5r2SCOxcqh4h1gfjWP5gry6S59dEsWyLmU7n
         O7hTSrdHBrqyzMNaXjadf6wGms2MQNPAHzTr3Hmqkfv44QAEa9koV7E4Bog/r1cULuci
         uKZn97cJRPV1JwRkxGn/TTcmUJRXV2+TamqyyeMjqToflm3/M5RdY0FvJKlPmpPeRGWd
         C8xaV/Th3+fJQHP3WVv7g9kr+szqTtqfbRzEnlMFSxEoTXisqVzqGrOrYaPgErAxzJsG
         ixJW/sv6lGKThKgohNQCWQadWiVQbUE9ZXa95c0cMsI68+LnfsEXrjxJaUYZMPwmhPl3
         PbXw==
X-Gm-Message-State: AOAM532gEBubgH9z8z99tjibjiCSkaBsCxmMuaEwoVz8PXEMAVkS0NFr
        i/uz80aBAqEuWASLUYWFZlUPMDHWHqZBU28=
X-Google-Smtp-Source: ABdhPJzhF/L162IKZGA2v1vfeqRBtKk+kc26yO7jRh6AAqTqVZtjKGL2w7yvYf60mUisa/RM+m5bcl0vC/4rWsw=
X-Received: from tj2.c.googlers.com ([fda3:e722:ac3:cc00:20:ed76:c0a8:187])
 (user=tjmercier job=sendgmr) by 2002:a5b:c6:: with SMTP id
 d6mr1955239ybp.273.1644596323025; Fri, 11 Feb 2022 08:18:43 -0800 (PST)
Date:   Fri, 11 Feb 2022 16:18:23 +0000
Message-Id: <20220211161831.3493782-1-tjmercier@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.35.1.265.g69c8d7142f-goog
Subject: [RFC v2 0/6] Proposal for a GPU cgroup controller
From:   "T.J. Mercier" <tjmercier@google.com>
To:     Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "=?UTF-8?q?Arve=20Hj=C3=B8nnev=C3=A5g?=" <arve@android.com>,
        Todd Kjos <tkjos@android.com>,
        Martijn Coenen <maco@android.com>,
        Joel Fernandes <joel@joelfernandes.org>,
        Christian Brauner <brauner@kernel.org>,
        Hridya Valsaraju <hridya@google.com>,
        Suren Baghdasaryan <surenb@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        "=?UTF-8?q?Christian=20K=C3=B6nig?=" <christian.koenig@amd.com>,
        Benjamin Gaignard <benjamin.gaignard@linaro.org>,
        Liam Mark <lmark@codeaurora.org>,
        Laura Abbott <labbott@redhat.com>,
        Brian Starkey <Brian.Starkey@arm.com>,
        John Stultz <john.stultz@linaro.org>,
        Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>
Cc:     kaleshsingh@google.com, Kenny.Ho@amd.com,
        "T.J. Mercier" <tjmercier@google.com>,
        dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linaro-mm-sig@lists.linaro.org, cgroups@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series revisits the proposal for a GPU cgroup controller to
track and limit memory allocations by various device/allocator
subsystems. The patch series also contains a simple prototype to
illustrate how Android intends to implement DMA-BUF allocator
attribution using the GPU cgroup controller. The prototype does not
include resource limit enforcements.

Changelog:

v2:
See the previous revision of this change submitted by Hridya Valsaraju
at: https://lore.kernel.org/all/20220115010622.3185921-1-hridya@google.com/

Move dma-buf cgroup charge transfer from a dma_buf_op defined by every
heap to a single dma-buf function for all heaps per Daniel Vetter and
Christian K=C3=B6nig. Pointers to struct gpucg and struct gpucg_device
tracking the current associations were added to the dma_buf struct to
achieve this.

Fix incorrect Kconfig help section indentation per Randy Dunlap.

History of the GPU cgroup controller
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
The GPU/DRM cgroup controller came into being when a consensus[1]
was reached that the resources it tracked were unsuitable to be integrated
into memcg. Originally, the proposed controller was specific to the DRM
subsystem and was intended to track GEM buffers and GPU-specific
resources[2]. In order to help establish a unified memory accounting model
for all GPU and all related subsystems, Daniel Vetter put forth a
suggestion to move it out of the DRM subsystem so that it can be used by
other DMA-BUF exporters as well[3]. This RFC proposes an interface that
does the same.

[1]: https://patchwork.kernel.org/project/dri-devel/cover/20190501140438.95=
06-1-brian.welty@intel.com/#22624705
[2]: https://lore.kernel.org/amd-gfx/20210126214626.16260-1-brian.welty@int=
el.com/
[3]: https://lore.kernel.org/amd-gfx/YCVOl8%2F87bqRSQei@phenom.ffwll.local/

T.J. Mercier (6):
  gpu: rfc: Proposal for a GPU cgroup controller
  cgroup: gpu: Add a cgroup controller for allocator attribution of GPU
    memory
  dmabuf: Use the GPU cgroup charge/uncharge APIs
  dmabuf: heaps: export system_heap buffers with GPU cgroup charging
  dmabuf: Add gpu cgroup charge transfer function
  android: binder: Add a buffer flag to relinquish ownership of fds

 Documentation/gpu/rfc/gpu-cgroup.rst | 195 +++++++++++++++++
 Documentation/gpu/rfc/index.rst      |   4 +
 drivers/android/binder.c             |  26 +++
 drivers/dma-buf/dma-buf.c            | 100 +++++++++
 drivers/dma-buf/dma-heap.c           |  27 +++
 drivers/dma-buf/heaps/system_heap.c  |   3 +
 include/linux/cgroup_gpu.h           | 127 +++++++++++
 include/linux/cgroup_subsys.h        |   4 +
 include/linux/dma-buf.h              |  22 +-
 include/linux/dma-heap.h             |  11 +
 include/uapi/linux/android/binder.h  |   1 +
 init/Kconfig                         |   7 +
 kernel/cgroup/Makefile               |   1 +
 kernel/cgroup/gpu.c                  | 304 +++++++++++++++++++++++++++
 14 files changed, 830 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/gpu/rfc/gpu-cgroup.rst
 create mode 100644 include/linux/cgroup_gpu.h
 create mode 100644 kernel/cgroup/gpu.c

--=20
2.35.1.265.g69c8d7142f-goog

