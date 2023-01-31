Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 13643C38142
	for <linux-doc@archiver.kernel.org>; Tue, 31 Jan 2023 21:07:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231731AbjAaVHI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 31 Jan 2023 16:07:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39448 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231564AbjAaVHH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 31 Jan 2023 16:07:07 -0500
Received: from smtp-relay-internal-0.canonical.com (smtp-relay-internal-0.canonical.com [185.125.188.122])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D3814217
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:07:05 -0800 (PST)
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 1AFE1442FD
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 21:07:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1675199224;
        bh=MFyADogCLoHAjmWl9fQjaKPy+Q/5eurtLP5ZWAdBaH0=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=XIF5TC5D3ho3Me9RhR4WrkpWqlQG3gvZawjE8zYElaaLotDOugI1g8u5QEXEcyVw6
         /CsS7ay3rZqylC5caNfwm5Uz5JVprNgHmW6e1crcyJToPxRZRpD6b0NIpZnKNjIfvL
         7y3NH7IcBpNZmY+AF/fjYfFPMsdtHnVQOwxyg8xh0QOb2ytXhSO+VpWfvnrLfjLo94
         Z1TaOavOXVCRylA4UTagsm0F35Xqdh36ie78IIN6F5PC6GuU6NG5gsRCPs/j2PJGLI
         l2bVs6nyi7yLmdggtN3ub8xdicWWfk8swItdoCiOM2DzTsyHFSp/aBtL71qUucuP8T
         5oAmyK+3U7C3A==
Received: by mail-ej1-f71.google.com with SMTP id nc27-20020a1709071c1b00b0086dae705676so10653022ejc.12
        for <linux-doc@vger.kernel.org>; Tue, 31 Jan 2023 13:07:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MFyADogCLoHAjmWl9fQjaKPy+Q/5eurtLP5ZWAdBaH0=;
        b=k75mt6e60zMQb92yRXGczIuORVaJDvKK55TPCHQUKCK65qcrThmIuadCtJTfKlTAVr
         qyqTRKRSJyHwvvi5SgatA0rWC46V+frYoiCtA0PBSlI5dCqS5exf8gBuCAdJpJ8isGm6
         tqaCiiZZXRmHXaEsrUn/w9NW8HgFG8Kc/+8qZhg+F3aDPu0KPEx+jG8tUbsAFbz4g0CX
         azrfTV12daH8hacDoibTjPygrO385XdZ8dBzbaq6M+kcDkAkMn/BnJPnSsES5OdGxtki
         kbk7gbuuYk26ZUbQwLxGyO94kO/jnIOnFwawVIHqLTxKSeZQ5ya88jx7WL3rBRyE/O8B
         3rRQ==
X-Gm-Message-State: AO0yUKWR7X8mpnXnaw3onQoJz0DLD9n7b8tb+4B9LPAu9lIoBIFO+1kF
        QGVH/nz+WFOG7fwGfLjDHgVfMohYjrmKUYaWST0/c9/bQFaX+4gEnYPyH+hW+0DjFU+eKSdNp0x
        iUbV60lG7BqwFKT+Yn6Sx8tDDKYSrwKJ8IM//Ew==
X-Received: by 2002:a17:906:5cb:b0:87a:daee:70b8 with SMTP id t11-20020a17090605cb00b0087adaee70b8mr16493760ejt.24.1675199223799;
        Tue, 31 Jan 2023 13:07:03 -0800 (PST)
X-Google-Smtp-Source: AK7set8FEqPdFt+xqukpr8ueMlR3yyoUm6bxh6Y/DFC/MewUnyfP7TM7eEhXGfLwm9l4+bJxncaq2A==
X-Received: by 2002:a17:906:5cb:b0:87a:daee:70b8 with SMTP id t11-20020a17090605cb00b0087adaee70b8mr16493741ejt.24.1675199223490;
        Tue, 31 Jan 2023 13:07:03 -0800 (PST)
Received: from amikhalitsyn.. (ip5f5bf399.dynamic.kabel-deutschland.de. [95.91.243.153])
        by smtp.gmail.com with ESMTPSA id ja3-20020a170907988300b008818d9e0bfesm6231172ejc.117.2023.01.31.13.07.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 13:07:03 -0800 (PST)
From:   Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>
To:     corbet@lwn.net
Cc:     Alexander Mikhalitsyn <aleksandr.mikhalitsyn@canonical.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: [PATCH v2 0/2] docs: actualize file_system_type and super_operations descriptions
Date:   Tue, 31 Jan 2023 22:06:49 +0100
Message-Id: <20230131210651.715327-1-aleksandr.mikhalitsyn@canonical.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Current descriptions are from 2.6.* times, let's update them.

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

