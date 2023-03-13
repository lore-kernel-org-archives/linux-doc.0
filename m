Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10B0DC61DA4
	for <linux-doc@archiver.kernel.org>; Mon, 13 Mar 2023 13:07:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230202AbjCMNHo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 13 Mar 2023 09:07:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35864 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230156AbjCMNHn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 13 Mar 2023 09:07:43 -0400
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4D86A059
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 06:07:40 -0700 (PDT)
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 037CE3F591
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 13:07:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1678712859;
        bh=8xKukcOEpEg45PGBEMg25CUAUUinsxoVbA7uPjUp2qI=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=kD8t3zjYzPT7vqPkXW3tCbqNeJFDCcqApeXpHCXOiXL2kv9VU7Fhf5A20Yd0xJzWU
         Ir73fejnsqI5MEEoOmoDMVOc4FxEa9glPKrtBG0AKWT9Vy+Q17Q6L069zNZ7U4g2ek
         PmwEGaQbGkLBczoNbqJWdMUHZWjC/MkHm95PuZYip5HCmFyegGZKYYsD0yZ3i/VuXF
         fn4lyrJ5YRTGeH4mAb0fU+a0HRwPg5XEtKZfNhfd3gQksgLXB/pDmRReqE4KBPTCX4
         WcBwFv2NXhzYLwLUfzctqp0epXKNgBIQ1qONWQ/l1erM8MbvG+BLXvLAlXDxVMw/EA
         zFgs0PDbs4q5w==
Received: by mail-ed1-f69.google.com with SMTP id b7-20020a056402350700b004d2a3d5cd3fso16749870edd.8
        for <linux-doc@vger.kernel.org>; Mon, 13 Mar 2023 06:07:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678712858;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8xKukcOEpEg45PGBEMg25CUAUUinsxoVbA7uPjUp2qI=;
        b=gijvaDQGzHeO98/AzjTk275EgDkK5ch+QltwDQ2GuXVCYRB5YoFt9TxSBouxbah2ip
         mKCzqgk724bV3deteoNAGWlH6+087W7X+ubijQfGvPbDt0f1cFZ3wQzr7TqEwBVZKSly
         de0+Ez0kYf0DatpKzwonYR0kU1PTDDslwzP6fE14YeWzsnocjXIgAptQQmVPYp8V1F3d
         nSeSYyM8ft26gmAfpXzqXfCZRm7KlF8w1WU3r9NIYjBezcVaBiI2nFGgXjNV5P/0Ti7X
         TmMEYULhk2kJQB7nB36utZ7AdQbxaxV6kvPncB0E2DU1D9hbakgS3Q2AkEq2rFD3EZ7H
         9iOg==
X-Gm-Message-State: AO0yUKWjLSS7X7xOKlN7P9zBaVljZX4EPytrXwkvkVvrfa/odFDbMzPf
        GfGk02JTf+nfJtqEnt+V6EyxiSaoGLtDZiP5Eu6h5YeH5PaXNLNVQVLcaf16bud29dXV3w0cWSF
        f18CFqAzzXkre3+7r5XDSi4lXFxMfyg5Q+9dzIw==
X-Received: by 2002:a17:907:1c0e:b0:8b1:78b6:4b3c with SMTP id nc14-20020a1709071c0e00b008b178b64b3cmr43238410ejc.73.1678712858726;
        Mon, 13 Mar 2023 06:07:38 -0700 (PDT)
X-Google-Smtp-Source: AK7set85ckbj0cOHjM+X8NByK8/kJwhZyXdYAuzIu2h+APwfyBAqsaXdc1vkgh3m2Q8dfPu0vaIVkA==
X-Received: by 2002:a17:907:1c0e:b0:8b1:78b6:4b3c with SMTP id nc14-20020a1709071c0e00b008b178b64b3cmr43238388ejc.73.1678712858508;
        Mon, 13 Mar 2023 06:07:38 -0700 (PDT)
Received: from amikhalitsyn.. ([2a02:8109:bd40:1414:c91d:59c1:64e:937b])
        by smtp.gmail.com with ESMTPSA id o11-20020a17090637cb00b00926f89e2213sm1711388ejc.190.2023.03.13.06.07.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Mar 2023 06:07:38 -0700 (PDT)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Christian Brauner <brauner@kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] docs: actualize file_system_type and super_operations descriptions
Date:   Mon, 13 Mar 2023 14:07:16 +0100
Message-Id: <20230313130718.253708-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current descriptions are from 2.6.* times, let's update them.

I've noticed that during my work on fuse recovery API.

v2:
- fixed commit messages according to Jonathan's advice

v3:
- removed direct kernel version specification as Eric proposed

Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

Alexander Mikhalitsyn (2):
  docs: filesystems: vfs: actualize struct file_system_type description
  docs: filesystems: vfs: actualize struct super_operations description

 Documentation/filesystems/vfs.rst | 105 ++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 19 deletions(-)

-- 
2.34.1

