Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5C89C0015E
	for <linux-doc@archiver.kernel.org>; Thu, 29 Jun 2023 22:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229812AbjF2W1z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 29 Jun 2023 18:27:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40786 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229727AbjF2W1y (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Jun 2023 18:27:54 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5401BDB
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1688077623;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=VDbi4BWy5Q8oEkG9zlvgEIfv47Q5994coBNHlb7PdZo=;
        b=EEv8KGQB6kzTzGnR0HjR5OSN9LMjFvfNNlUl9WCwGyqohnLlJ3+oXM3DhI3tIEJPRj+3q3
        4OJyPo0hdO8tmZj4Nwb7HSoB+5udmBNkgL9sipIU92ePPudrl+8oVARNjwtUtOv++YtSXN
        c6CnY41JEns18djzUBjTJcMUtfwo9rg=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-oMbR9owROVOJ9HTJEat2JQ-1; Thu, 29 Jun 2023 18:27:01 -0400
X-MC-Unique: oMbR9owROVOJ9HTJEat2JQ-1
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-3fbab56aac7so7299305e9.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Jun 2023 15:27:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688077620; x=1690669620;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDbi4BWy5Q8oEkG9zlvgEIfv47Q5994coBNHlb7PdZo=;
        b=AdFm3XyAgUKo+FZgFwuChONp0B2V83K15+U5sHKDQV5/OwGKPgie3xeVNitwsMRAoi
         qYZqZW58kuWoLBLCQ/it3o/qMOsIR2sOcwqnNbIGjRWC/5nAc8dpeX7FZNWbVzgvfGvi
         APvidnOSMuVSLw+zmUJps390yvQyNnWe0wCpIoDn2yCUD6zq55ZuFRywc8A+jbm9yZL3
         0DOIPQLCPSeJ0EctiCD3TNNlOnYD4N5IQTb90rquDZr80VbO7Pj8OfIGmopFqcEM9Mub
         OUruW7FO84QtQxYYdJ+43anerPhJTeVsI9tvTFh7Hszpvh5yVIE6TeG7ao1JA4Fhnj3J
         18Vg==
X-Gm-Message-State: AC+VfDyOvvEdF9+ec1ehvxKPcryIiDE1hQtg3luMjxZvKK2/+6FnKDIJ
        jzmHk7502is79HSsPp0kX1GAf+C3SPCW6JN2P1vVYMMy8v3xMVQ4sKvxPj96jTsDc9HDjkmp6On
        Z/Gh7Mkmkqd0AjSgLHsw9
X-Received: by 2002:a7b:cb9a:0:b0:3fb:b3aa:1c8f with SMTP id m26-20020a7bcb9a000000b003fbb3aa1c8fmr488274wmi.28.1688077620549;
        Thu, 29 Jun 2023 15:27:00 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5Ndd3L7vFi7qHW4isQQAWoA+LJmHxHVNJY3zLaWEEU9SU7d40Wpu6uroKEsbFFhbPCNMJqKg==
X-Received: by 2002:a7b:cb9a:0:b0:3fb:b3aa:1c8f with SMTP id m26-20020a7bcb9a000000b003fbb3aa1c8fmr488262wmi.28.1688077620156;
        Thu, 29 Jun 2023 15:27:00 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id u6-20020a05600c210600b003fafe32c8f6sm11217060wml.10.2023.06.29.15.26.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jun 2023 15:26:59 -0700 (PDT)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v6 00/13] [RFC] DRM GPUVA Manager & Nouveau VM_BIND UAPI
Date:   Fri, 30 Jun 2023 00:25:16 +0200
Message-ID: <20230629222651.3196-1-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch series provides a new UAPI for the Nouveau driver in order to
support Vulkan features, such as sparse bindings and sparse residency.

Furthermore, with the DRM GPUVA manager it provides a new DRM core feature to
keep track of GPU virtual address (VA) mappings in a more generic way.

The DRM GPUVA manager is indented to help drivers implement userspace-manageable
GPU VA spaces in reference to the Vulkan API. In order to achieve this goal it
serves the following purposes in this context.

    1) Provide infrastructure to track GPU VA allocations and mappings,
       making use of the maple_tree.

    2) Generically connect GPU VA mappings to their backing buffers, in
       particular DRM GEM objects.

    3) Provide a common implementation to perform more complex mapping
       operations on the GPU VA space. In particular splitting and merging
       of GPU VA mappings, e.g. for intersecting mapping requests or partial
       unmap requests.

The new VM_BIND Nouveau UAPI build on top of the DRM GPUVA manager, itself
providing the following new interfaces.

    1) Initialize a GPU VA space via the new DRM_IOCTL_NOUVEAU_VM_INIT ioctl
       for UMDs to specify the portion of VA space managed by the kernel and
       userspace, respectively.

    2) Allocate and free a VA space region as well as bind and unbind memory
       to the GPUs VA space via the new DRM_IOCTL_NOUVEAU_VM_BIND ioctl.

    3) Execute push buffers with the new DRM_IOCTL_NOUVEAU_EXEC ioctl.

Both, DRM_IOCTL_NOUVEAU_VM_BIND and DRM_IOCTL_NOUVEAU_EXEC, make use of the DRM
scheduler to queue jobs and support asynchronous processing with DRM syncobjs
as synchronization mechanism.

By default DRM_IOCTL_NOUVEAU_VM_BIND does synchronous processing,
DRM_IOCTL_NOUVEAU_EXEC supports asynchronous processing only.

The new VM_BIND UAPI for Nouveau makes also use of drm_exec (execution context
for GEM buffers) by Christian König. Since the patch implementing drm_exec was
not yet merged into drm-next it is part of this series, as well as a small fix
for this patch, which was found while testing this series.

This patch series is also available at [1].

There is a Mesa NVK merge request by Dave Airlie [2] implementing the
corresponding userspace parts for this series.

The Vulkan CTS test suite passes the sparse binding and sparse residency test
cases for the new UAPI together with Dave's Mesa work.

There are also some test cases in the igt-gpu-tools project [3] for the new UAPI
and hence the DRM GPU VA manager. However, most of them are testing the DRM GPU
VA manager's logic through Nouveau's new UAPI and should be considered just as
helper for implementation.

However, I absolutely intend to change those test cases to proper kunit test
cases for the DRM GPUVA manager, once and if we agree on it's usefulness and
design.

[1] https://gitlab.freedesktop.org/nouvelles/kernel/-/tree/new-uapi-drm-next /
    https://gitlab.freedesktop.org/nouvelles/kernel/-/merge_requests/1
[2] https://gitlab.freedesktop.org/nouveau/mesa/-/merge_requests/150/
[3] https://gitlab.freedesktop.org/dakr/igt-gpu-tools/-/tree/wip_nouveau_vm_bind

Changes in V2:
==============
  Nouveau:
    - Reworked the Nouveau VM_BIND UAPI to avoid memory allocations in fence
      signalling critical sections. Updates to the VA space are split up in three
      separate stages, where only the 2. stage executes in a fence signalling
      critical section:

        1. update the VA space, allocate new structures and page tables
        2. (un-)map the requested memory bindings
        3. free structures and page tables

    - Separated generic job scheduler code from specific job implementations.
    - Separated the EXEC and VM_BIND implementation of the UAPI.
    - Reworked the locking parts of the nvkm/vmm RAW interface, such that
      (un-)map operations can be executed in fence signalling critical sections.

  GPUVA Manager:
    - made drm_gpuva_regions optional for users of the GPUVA manager
    - allow NULL GEMs for drm_gpuva entries
    - swichted from drm_mm to maple_tree for track drm_gpuva / drm_gpuva_region
      entries
    - provide callbacks for users to allocate custom drm_gpuva_op structures to
      allow inheritance
    - added user bits to drm_gpuva_flags
    - added a prefetch operation type in order to support generating prefetch
      operations in the same way other operations generated
    - hand the responsibility for mutual exclusion for a GEM's
      drm_gpuva list to the user; simplified corresponding (un-)link functions

  Maple Tree:
    - I added two maple tree patches to the series, one to support custom tree
      walk macros and one to hand the locking responsibility to the user of the
      GPUVA manager without pre-defined lockdep checks.

Changes in V3:
==============
  Nouveau:
    - Reworked the Nouveau VM_BIND UAPI to do the job cleanup (including page
      table cleanup) within a workqueue rather than the job_free() callback of
      the scheduler itself. A job_free() callback can stall the execution (run()
      callback) of the next job in the queue. Since the page table cleanup
      requires to take the same locks as need to be taken for page table
      allocation, doing it directly in the job_free() callback would still
      violate the fence signalling critical path.
    - Separated Nouveau fence allocation and emit, such that we do not violate
      the fence signalling critical path in EXEC jobs.
    - Implement "regions" (for handling sparse mappings through PDEs and dual
      page tables) within Nouveau.
    - Drop the requirement for every mapping to be contained within a region.
    - Add necassary synchronization of VM_BIND job operation sequences in order
      to work around limitations in page table handling. This will be addressed
      in a future re-work of Nouveau's page table handling.
    - Fixed a couple of race conditions found through more testing. Thanks to
      Dave for consitently trying to break it. :-)

  GPUVA Manager:
    - Implement pre-allocation capabilities for tree modifications within fence
      signalling critical sections.
    - Implement accessors to to apply tree modification while walking the GPUVA
      tree in order to actually support processing of drm_gpuva_ops through
      callbacks in fence signalling critical sections rather than through
      pre-allocated operation lists.
    - Remove merging of GPUVAs; the kernel has limited to none knowlege about
      the semantics of mapping sequences. Hence, merging is purely speculative.
      It seems that gaining a significant (or at least a measurable) performance
      increase through merging is way more likely to happen when userspace is
      responsible for merging mappings up to the next larger page size if
      possible.
    - Since merging was removed, regions pretty much loose their right to exist.
      They might still be useful for handling dual page tables or similar
      mechanisms, but since Nouveau seems to be the only driver having a need
      for this for now, regions were removed from the GPUVA manager.
    - Fixed a couple of maple_tree related issues; thanks to Liam for helping me
      out.

Changes in V4:
==============
  Nouveau:
    - Refactored how specific VM_BIND and EXEC jobs are created and how their
      arguments are passed to the generic job implementation.
    - Fixed a UAF race condition where bind job ops could have been freed
      already while still waiting for a job cleanup to finish. This is due to
      in certain cases we need to wait for mappings actually being unmapped
      before creating sparse regions in the same area.
    - Re-based the code onto drm_exec v4 patch.

  GPUVA Manager:
    - Fixed a maple tree related bug when pre-allocating MA states.
      (Boris Brezillion)
    - Made struct drm_gpuva_fn_ops a const object in all occurrences.
      (Boris Brezillion)

Changes in V5:
==============
  Nouveau:
    - Link and unlink GPUVAs outside the fence signalling critical path in
      nouveau_uvmm_bind_job_submit() holding the dma-resv lock. Mutual exclusion
      of BO evicts causing mapping invalidation and regular mapping operations
      is ensured with dma-fences.

  GPUVA Manager:
    - Removed the separate GEMs GPUVA list lock. Link and unlink as well as
      iterating the GEM's GPUVA list should be protected with the GEM's dma-resv
      lock instead.
    - Renamed DRM_GPUVA_EVICTED flag to DRM_GPUVA_INVALIDATED. Mappings do not
      get eviced, they might get invalidated due to eviction.
    - Maple tree uses the 'unsinged long' type for node entries. While this
      works for GPU VA spaces larger than 32-bit on 64-bit kernel, the GPU VA
      space is limited to 32-bit on 32-bit kernels as well.
      As long as we do not have a 64-bit capable maple tree for 32-bit kernels,
      the GPU VA manager contains checks to throw warnings when GPU VA entries
      exceed the maple tree's storage capabilities.
    - Extended the Documentation and added example code as requested by Donald
      Robson.

Changes in V6
=============

  Nouveau:
    - Re-based the code onto drm_exec v5 patch.

  GPUVA Manager:
    - Switch from maple tree to RB-tree.

      It turned out that mas_preallocate() requires the maple tree not to change
      in between pre-allocating nodes with mas_preallocate() and inserting an
      entry with the help of the pre-allocated memory (mas_insert_prealloc()).

      However, considering that drivers typically implement interfaces where
      jobs to create GPU mappings can be submitted by userspace, are queued up
      by the kernel and are processed asynchronously in dma-fence signalling
      critical paths, this is a major issue. In the ioctl() used to submit a job
      we'd need to pre-allocated memory with mas_preallocate(), however,
      previously queued up jobs could concurrently alter the maple tree
      resulting in potentially insufficient pre-allocated memory for the
      currently submitted job on execution time.

      There is a detailed and still ongoing discussion about this topic one the
      -mm list [1]. So far the only solution seems to be to use GFP_ATOMIC
      and allocate memory directly in the fence signalling critical path, where
      we need it. However, I think that is not what we want to rely on.

      I think we should definitely continue in trying to find a solution on how
      to fit in the maple tree (or how to make the maple tree fit in). However,
      for now it seems to be more expedient to move on using a RB-tree.

      [1] https://lore.kernel.org/lkml/20230612203953.2093911-15-Liam.Howlett@oracle.com/

    - Provide a flag to let driver optionally provide their own lock to lock
      linking and unlinking of GPUVAs to GEM objects. The DRM GPUVA manager
      still does not take the locks itself, but rather contains lockdep checks
      on either the GEMs dma-resv lock (default) or, if
      DRM_GPUVA_MANAGER_LOCK_EXTERN is set, the driver provided lock.
      (Boris Brezillon)

Christian König (1):
  drm: execution context for GEM buffers v5

Danilo Krummrich (12):
  drm: manager to keep track of GPUs VA mappings
  drm: debugfs: provide infrastructure to dump a DRM GPU VA space
  drm/nouveau: new VM_BIND uapi interfaces
  drm/nouveau: get vmm via nouveau_cli_vmm()
  drm/nouveau: bo: initialize GEM GPU VA interface
  drm/nouveau: move usercopy helpers to nouveau_drv.h
  drm/nouveau: fence: separate fence alloc and emit
  drm/nouveau: fence: fail to emit when fence context is killed
  drm/nouveau: chan: provide nouveau_channel_kill()
  drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm
  drm/nouveau: implement new VM_BIND uAPI
  drm/nouveau: debugfs: implement DRM GPU VA debugfs

 Documentation/gpu/driver-uapi.rst             |   11 +
 Documentation/gpu/drm-mm.rst                  |   48 +
 drivers/gpu/drm/Kconfig                       |    6 +
 drivers/gpu/drm/Makefile                      |    3 +
 drivers/gpu/drm/drm_debugfs.c                 |   40 +
 drivers/gpu/drm/drm_exec.c                    |  330 +++
 drivers/gpu/drm/drm_gem.c                     |    3 +
 drivers/gpu/drm/drm_gpuva_mgr.c               | 1743 +++++++++++++++
 drivers/gpu/drm/nouveau/Kbuild                |    3 +
 drivers/gpu/drm/nouveau/Kconfig               |    2 +
 drivers/gpu/drm/nouveau/dispnv04/crtc.c       |    9 +-
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |   26 +-
 drivers/gpu/drm/nouveau/include/nvif/vmm.h    |   19 +-
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |   20 +-
 drivers/gpu/drm/nouveau/nouveau_abi16.c       |   24 +
 drivers/gpu/drm/nouveau/nouveau_abi16.h       |    1 +
 drivers/gpu/drm/nouveau/nouveau_bo.c          |  204 +-
 drivers/gpu/drm/nouveau/nouveau_bo.h          |    2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c        |   22 +-
 drivers/gpu/drm/nouveau/nouveau_chan.h        |    1 +
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |   39 +
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |    9 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c         |   27 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h         |   94 +-
 drivers/gpu/drm/nouveau/nouveau_exec.c        |  414 ++++
 drivers/gpu/drm/nouveau/nouveau_exec.h        |   54 +
 drivers/gpu/drm/nouveau/nouveau_fence.c       |   23 +-
 drivers/gpu/drm/nouveau/nouveau_fence.h       |    5 +-
 drivers/gpu/drm/nouveau/nouveau_gem.c         |   62 +-
 drivers/gpu/drm/nouveau/nouveau_mem.h         |    5 +
 drivers/gpu/drm/nouveau/nouveau_prime.c       |    2 +-
 drivers/gpu/drm/nouveau/nouveau_sched.c       |  462 ++++
 drivers/gpu/drm/nouveau/nouveau_sched.h       |  123 +
 drivers/gpu/drm/nouveau/nouveau_svm.c         |    2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 1970 +++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  107 +
 drivers/gpu/drm/nouveau/nouveau_vmm.c         |    4 +-
 drivers/gpu/drm/nouveau/nvif/vmm.c            |  100 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    |  213 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  197 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |   25 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgf100.c    |   16 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |   16 +-
 .../gpu/drm/nouveau/nvkm/subdev/mmu/vmmnv50.c |   27 +-
 include/drm/drm_debugfs.h                     |   25 +
 include/drm/drm_drv.h                         |    6 +
 include/drm/drm_exec.h                        |  120 +
 include/drm/drm_gem.h                         |   52 +
 include/drm/drm_gpuva_mgr.h                   |  756 +++++++
 include/uapi/drm/nouveau_drm.h                |  209 ++
 50 files changed, 7441 insertions(+), 240 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_exec.c
 create mode 100644 drivers/gpu/drm/drm_gpuva_mgr.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_exec.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_sched.h
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.c
 create mode 100644 drivers/gpu/drm/nouveau/nouveau_uvmm.h
 create mode 100644 include/drm/drm_exec.h
 create mode 100644 include/drm/drm_gpuva_mgr.h


base-commit: 5ff2977b19769fd24b0cfbe7cbe4d5114b6106af
-- 
2.41.0

