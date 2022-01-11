Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00019C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 11 Jan 2022 02:15:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346533AbiAKCP2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 10 Jan 2022 21:15:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244058AbiAKCP1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 10 Jan 2022 21:15:27 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C57CC06173F
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:15:27 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id b1-20020a17090a990100b001b14bd47532so3238419pjp.0
        for <linux-doc@vger.kernel.org>; Mon, 10 Jan 2022 18:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8DM0KLW78nPo3teW5XW0dIylnPoQE6kQkroZ5LA3oI=;
        b=VJBvkuuekI00o2icSyPdxxHId0HDBrCENSohmD9Qk+elfPD79BDaIfTQl+coned1Fh
         dvxc9FS2296nMEiYJo9Cwh2P6Anot0mnuC3Rd5IH65DA69YMb8eOWdamlcWtKjmd4abZ
         6rHmRSRgYuB3LJWbx3IJBLjKajPB+3LU8gD8+bgtpIlnPr6p73E1SdTaXgXzrWx8euWS
         7XMjN7WMoYpKkzT9GYrAoGLkE9jSB38lC46AhsjMd1ROiu9Gutho9+aYSnh9yI+toMLl
         D3V1qGTa93EsmhcnmpfRlcnQ7JsnTPlYiwHkIeM2ZYhVnFzktK3TcTIUH+RzQ/ivkJEf
         I6Rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=s8DM0KLW78nPo3teW5XW0dIylnPoQE6kQkroZ5LA3oI=;
        b=Lfr+naSdQ+q+o4bjj+lZgT514HXBCi3pBAdDzR+eFuFHSK37+47knsaeBuU6/xaQfq
         ESwsRTzUTBpYH8yzATXj4e7lWtQZacE+TqIXhXcjWBoq7alcL0Qqb83HpSNjNHsuKzUH
         qHy3bJdUutEnfnD3rbyjScZaxUZ1w0oHJtoTjP9w3Ebiz3Sh1krWn29G36BiTqkFfTVR
         Dhpf4antOHufjYJ1K91kty3MODMty+u0wmh55bgf3nnXa9+Ev4F/FZp5ux6EpBHmrXO0
         4sULw9hkh7VKn73n6LtqQs4vd34yAdllDfOeWfuI31uIujigmlPZGb0VBVL7tyt6wGsF
         FwHA==
X-Gm-Message-State: AOAM5301WMIWkHp2+GxZtNeD6vcDz0lVIzhTlWYV7z33m9CUqGblAtmC
        1pWLXndzeaoO71V2vdV09U0=
X-Google-Smtp-Source: ABdhPJx+5KgQ4LpyYBGOc2+xxN+TkqjL9UNzhW9PY9cICjevSUUdGLEHp6Nd2PpZ5dxieX5iuQDmjw==
X-Received: by 2002:a63:6e86:: with SMTP id j128mr2212071pgc.6.1641867326963;
        Mon, 10 Jan 2022 18:15:26 -0800 (PST)
Received: from wironout4.netvigator.com (pcd454075.netvigator.com. [203.218.244.75])
        by smtp.gmail.com with ESMTPSA id k3sm308914pjt.39.2022.01.10.18.15.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Jan 2022 18:15:26 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, tangyizhou@huawei.com,
        chenhuacai@kernel.org, jiaxun.yang@flygoat.com,
        linux-doc@vger.kernel.org, siyanteng01@gmail.com
Subject: [PATCH v3 0/3] docs/zh_CN: add active_mm and balance translation
Date:   Tue, 11 Jan 2022 10:13:13 +0800
Message-Id: <cover.1641866889.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v3:
* Pick Alex's Reviewed-by tag.
* Pick Yizhou's Reviewed-by tag.

v2:
* Modified some words under Yizhou advices.

v1:
* add vm into zh_CN/index.
* Translate active_mm and balance into Chinese.

Yanteng Si (3):
  docs/zh_CN: add vm/index translation
  docs_zh_CN: add active_mm translation
  docs/zh_CN: add balance translation

 Documentation/translations/zh_CN/index.rst    |  2 +-
 .../translations/zh_CN/vm/active_mm.rst       | 85 +++++++++++++++++++
 .../translations/zh_CN/vm/balance.rst         | 81 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst | 52 ++++++++++++
 4 files changed, 219 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/vm/active_mm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/balance.rst
 create mode 100644 Documentation/translations/zh_CN/vm/index.rst

-- 
2.27.0

