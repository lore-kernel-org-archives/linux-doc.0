Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29510C05027
	for <linux-doc@archiver.kernel.org>; Tue, 14 Feb 2023 13:04:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232560AbjBNNEF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 14 Feb 2023 08:04:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47336 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232563AbjBNNED (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 14 Feb 2023 08:04:03 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E8C023C7C
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 05:03:55 -0800 (PST)
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id C76713F5E6
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 13:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1676379833;
        bh=ER4dQa+Ne4oEZinMWzIbnrWzPZzboegkxcHl8Z+0/Vc=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=pW80dIyfC8jOxvImmED+bB3+Mdg/o2HH1h2kaQ5kqBJq9TR6YOycnxSMDzfGYvtcC
         bxHLPaLZOs0wns6ND0KPM/s26eGN92c/pU6yUpcGZNsLH79c+G1nIXCtFB4jmOqP3s
         W16Q3b2C65vAyfEQ8CbnjEhqL3xvKkeELfoaYlYE+0LvnTM93oerQyKPulG+4+aUAF
         g0w8aDZeb4hIzM7LI4v4ou2vZFPq3CGQUzCMZRELJTyGYqIKOwizHuW6AUXRUBWFKI
         bdzKLST1Mp4HwOYVjfqmgjAjN5chBc6+OZxxAlXgXdvgly5L5YbIXBqmF/JOtK3t3G
         1UEK8dJPWxbGA==
Received: by mail-ej1-f70.google.com with SMTP id d14-20020a170906c20e00b00889f989d8deso9984525ejz.15
        for <linux-doc@vger.kernel.org>; Tue, 14 Feb 2023 05:03:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ER4dQa+Ne4oEZinMWzIbnrWzPZzboegkxcHl8Z+0/Vc=;
        b=pGBL+7gJWsOdXzkfD3przmcagYvWQvHWXzPK7YDvBNSQUAG8FjVZLVUkm6Os3/zs17
         Yj5g0y/mJNjPJl7J4FAPxQDdChGxToy85R2zuh6WBYL401gcLxu57ag6Fx1RFjWgEv2J
         g0MBicOl2f/FDAXNFwm8gufTVJgI/U9OvUC1bAaqkDTjZiavU3xStlnpDS1tHL4x91pX
         iaF9THKsbIzLLniVOQ/zIaDTr/OXiAuwRdwCETJuXWD4Rh9rP4WJa4rn3Jw9Jk1A80HY
         jtGgC2mV31WW2WIDbuhcGPqNg+/6RUPOKCQZGBKcx/ZZya6uL/JPxJ/AClt36Y/Oc0pT
         GZxQ==
X-Gm-Message-State: AO0yUKU5bY2dBJQuIrGPRYSOO76GN8WGlNBBUHuLqFrhjuHDYY51namK
        wxDmxUlcpgepr5h1GVPUys0WzsK5LRs3eafsPfGkGJ8KiaAZ6x3yFThHEB1UGbbX5p9X++NQSqO
        M4mz40dDydQDH6Qb1UM/TBvtWfm51jkR++weiTg==
X-Received: by 2002:a17:906:7c07:b0:8af:54d2:2088 with SMTP id t7-20020a1709067c0700b008af54d22088mr3170041ejo.37.1676379833253;
        Tue, 14 Feb 2023 05:03:53 -0800 (PST)
X-Google-Smtp-Source: AK7set9XZQwa7n90RxceqgMze3niR3fTNljuVE5NAHzPUMo/sqArbdvFoSGH3ByP6e/2m7qLKS75fw==
X-Received: by 2002:a17:906:7c07:b0:8af:54d2:2088 with SMTP id t7-20020a1709067c0700b008af54d22088mr3170027ejo.37.1676379833115;
        Tue, 14 Feb 2023 05:03:53 -0800 (PST)
Received: from amikhalitsyn.. ([2a02:8109:bd40:1414:c85e:daf1:c7bb:28dc])
        by smtp.gmail.com with ESMTPSA id b9-20020a170906194900b0088478517830sm8209790eje.83.2023.02.14.05.03.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Feb 2023 05:03:52 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Miklos Szeredi <mszeredi@redhat.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v3 0/2] docs: actualize file_system_type and super_operations descriptions
Date:   Tue, 14 Feb 2023 14:02:38 +0100
Message-Id: <20230214130240.166885-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current descriptions are from 2.6.* times, let's update them.

Cc: Eric Biggers <ebiggers@kernel.org>
Cc: Miklos Szeredi <mszeredi@redhat.com>
Cc: Al Viro <viro@zeniv.linux.org.uk>
Cc: linux-fsdevel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

Alexander Mikhalitsyn (2):
  docs: filesystems: vfs: actualize struct file_system_type description
  docs: filesystems: vfs: actualize struct super_operations description

 Documentation/filesystems/vfs.rst | 105 ++++++++++++++++++++++++------
 1 file changed, 86 insertions(+), 19 deletions(-)

-- 
2.34.1

