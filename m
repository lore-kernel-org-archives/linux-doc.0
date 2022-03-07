Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C960C433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:16:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232119AbiCGIQz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:16:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35314 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233521AbiCGIQx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:16:53 -0500
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59A3F6210A
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:16:00 -0800 (PST)
Received: by mail-pl1-x635.google.com with SMTP id 9so13087424pll.6
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:16:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0ZMUrv34tV8PS4Kq4fLEe6nBEc/9QMQ5811rbb5c0g=;
        b=OqhP72O5YuuGgA3o/XUqg0GAHytzMFb9Hu7ffewXpZe/1bwB7PnTYtmSU13Kl+3qZQ
         ZrJEJPkyFWHODnvN71nuldKA6zyN5c9dsEh9VheFNN3m6zWo2+q2N7lvuuafp/P0Zr5T
         +F40aZikFMj9tO99l7UU+pJDgQWodvgP/CmkoJ/7URrXkH/YwN5FRCOlPvDxl1Tpu/il
         g51gW7hQInbFGdaiFWzGJY0Snp7Ees5CBrZddUQtLm5Zf7Ms7sOb2EepwwGUCZ7iNqty
         zoFGoSvjwCHsW8kvFb03adNtuRwKQrqkZhmdxcGZd4ans+zHu9stJwu/Hqw92eUDGbLd
         0YFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=R0ZMUrv34tV8PS4Kq4fLEe6nBEc/9QMQ5811rbb5c0g=;
        b=Z6yMp+iBfVHTLuSMh58DtHbJeW7l+n6N1EhBtRtm4KZAw4tE79I259/jlEABOCIx+z
         obblVs6kU1VG3YL6Wxnrlc/dVgts3zLo7kAJPOM6RCgWyE435zNJP3O6WDf0rTWg0FP+
         EWj/ZR6oNOtMu9jFVFxnE0+4gD6HI8gAjWqoNqzh+AJBZAvf65ATvJDMRLZjMy4ORyT7
         pY1LP8RL3ppIN3tnjMyzjCidBkPeExuVUFgSu/i93gd4KWLdxL53QZLOFVon8AbMEOFo
         Z2/GP4W6kfAB/hHf/7No5JLtsr6hYJ3esZJrzc7bbWrUTxnnHCJ28X4Qav8BTKiuhShG
         drnA==
X-Gm-Message-State: AOAM533ToAkffNzW5Jq4e4jZf9YQjUmvo2jR9Of4yCNzJOUOl9lOtjn2
        lloF6Y4H18kyIzGFeUpva3M=
X-Google-Smtp-Source: ABdhPJwDrdwBVzUaO2P5o5oyQoxIK8T0ddvhieoJ+ceyOKo5ezxd1TsxDXncgjo31zTTnGnBObT2GQ==
X-Received: by 2002:a17:902:9887:b0:151:6e1c:7082 with SMTP id s7-20020a170902988700b001516e1c7082mr10836791plp.162.1646640959913;
        Mon, 07 Mar 2022 00:15:59 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id p34-20020a056a000a2200b004cd49fc15e5sm14940280pfh.59.2022.03.07.00.15.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:15:59 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v3 0/5] docs/zh_CN: add admin-guide damon translation
Date:   Mon,  7 Mar 2022 16:17:14 +0800
Message-Id: <cover.1646640696.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


v3:
*Build test in next-20220304.

v2:
* Pick Alexs Reviewed-by tag. [PATCH 1-3/5]
* Fix a build warning.(introduce from usage.rst)

v1:
* Translate .../admin-guide/mm/damon/* into Chinese
* note my patch thread is based on
<https://lore.kernel.org/linux-doc/20220212080024.1684590-1-xu.xin16@zte.com.cn/T/#t>

Chengming Zhou (1):
  kselftest/vm: override TARGETS from arguments

Stephen Rothwell (1):
  Add linux-next specific files for 20220304

xu xin (3):
  Add Chinese translation for vm/ksm.rst
  zh_CN: Add translations for admin-guide/mm/ksm.rst
  zh_CN: Add translation for admin-guide/mm/index.rst

-- 
2.27.0

