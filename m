Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A27FC43461
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43FFF613B3
	for <linux-doc@archiver.kernel.org>; Wed,  5 May 2021 12:10:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233605AbhEEMLJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 May 2021 08:11:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34060 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbhEEMKB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 May 2021 08:10:01 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36D4FC06134D
        for <linux-doc@vger.kernel.org>; Wed,  5 May 2021 05:07:57 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id a11so992363plh.3
        for <linux-doc@vger.kernel.org>; Wed, 05 May 2021 05:07:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CTCXnBqJzw8EdcslAsLRuIPFhCc0EkuXToVqPMY/FA8=;
        b=o6BwxizgnPbOuDGYY/aglFkacbBTnpKGAKO5gmtVW3jgRt52odwUeF96HuX20TBi6f
         SBrNU3qO7ElngrzYpb4eqAw2gfNplPz9G4F40FRU9juVZJ7fBn3wPE1RX4DBORm746jO
         sUYOdaA16G7EerRE5M0hd2KXfPQyswqfPpPg3RNX7vpwv95NMLA5K708nGPSptixkIF5
         cDmtOvuwa4tTaN+eGxTkSJYfIzw+apsNhohGvlUJgfDdJQSL0DeZzGe5f3sL+/rk980x
         aI6p1d7T+xrFNKN/BLdc5ITvatBwaEdFgG3hnXfmgKTi9jEKYT+XL0S3zBOkl6iOV6iY
         +Egg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=CTCXnBqJzw8EdcslAsLRuIPFhCc0EkuXToVqPMY/FA8=;
        b=s78GmIh5z19WjHCpdAWanBjwopy1zcSJYnnIImNNR10dB/2HzUZbUsq/J5FF0hB8sZ
         ZDLExLSD8SXvGQe9mJw+AHYKty0qFufrBIXzpjFoHTuWneu/W8iWErAOQxqks+S54pXt
         8CsQZn9+0VxX6P8JNn0jGn1/oqD8eyya2DQHMJXGLXC3ghKGnvfFH84MAyIbkHEk/BTf
         Q7JOHNHzWEeGji4e810WxB4smun3rmxLSQj59xAL0mclTeDerwIUoE7gTykt4UqgYHab
         bJakjyq6udLAKmOTjIsft8p+CTbFrlqI2PZRepETGF7uz0uqUDsVSTi65V298H25UMK9
         Frcg==
X-Gm-Message-State: AOAM5329dzzZXyhouh7SQRmR/Q/kMtesjvExNDjDUvTHx7HbC2xCoEi7
        CJVzSRj18Wh3mrW3wiqrm3g=
X-Google-Smtp-Source: ABdhPJx+tAsnOTEZitt+4R8LhT6ruZQdghffFitQhXPA6IO2U9sfcz0eViMNBdcTlSZidh9xnqh6sA==
X-Received: by 2002:a17:902:7081:b029:ed:5f:20af with SMTP id z1-20020a1709027081b02900ed005f20afmr30891943plk.60.1620216476820;
        Wed, 05 May 2021 05:07:56 -0700 (PDT)
Received: from WRT-WX9.. ([141.164.41.4])
        by smtp.gmail.com with ESMTPSA id j7sm14177959pfc.164.2021.05.05.05.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 May 2021 05:07:56 -0700 (PDT)
From:   Changbin Du <changbin.du@gmail.com>
To:     Eric Van Hensbergen <ericvh@gmail.com>,
        Latchesar Ionkov <lucho@ionkov.net>,
        Dominique Martinet <asmadeus@codewreck.org>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Changbin Du <changbin.du@gmail.com>
Subject: [PATCH 0/3] 9p: add support for root file systems
Date:   Wed,  5 May 2021 20:07:45 +0800
Message-Id: <20210505120748.8622-1-changbin.du@gmail.com>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Just like cifs and nfs, this short series enables rootfs support for 9p.
Bellow is an example which mounts v9fs with tag 'r' as rootfs in qemu
guest via virtio transport.

  $ qemu-system-x86_64 -enable-kvm -cpu host -m 1024 \
        -virtfs local,path=$rootfs_dir,mount_tag=r,security_model=passthrough,id=r \
        -kernel /path/to/linux/arch/x86/boot/bzImage -nographic \
        -append "root=/dev/v9fs v9fsroot=r,trans=virtio rw console=ttyS0 3"


Changbin Du (3):
  9p: add support for root file systems
  9p: doc: move to a new dedicated folder
  9p: doc: add v9fsroot description

 Documentation/filesystems/index.rst         |  2 +-
 Documentation/filesystems/{ => v9fs}/9p.rst |  0
 Documentation/filesystems/v9fs/index.rst    | 12 ++++
 Documentation/filesystems/v9fs/v9fsroot.rst | 52 +++++++++++++++++
 fs/9p/Kconfig                               |  6 ++
 fs/9p/Makefile                              |  1 +
 fs/9p/v9fsroot.c                            | 64 +++++++++++++++++++++
 include/linux/root_dev.h                    |  1 +
 init/do_mounts.c                            | 46 +++++++++++++++
 9 files changed, 183 insertions(+), 1 deletion(-)
 rename Documentation/filesystems/{ => v9fs}/9p.rst (100%)
 create mode 100644 Documentation/filesystems/v9fs/index.rst
 create mode 100644 Documentation/filesystems/v9fs/v9fsroot.rst
 create mode 100644 fs/9p/v9fsroot.c

-- 
2.30.2

