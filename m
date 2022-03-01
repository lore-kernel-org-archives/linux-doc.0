Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C9C7C433F5
	for <linux-doc@archiver.kernel.org>; Tue,  1 Mar 2022 04:21:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229848AbiCAEWZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 28 Feb 2022 23:22:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52974 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229786AbiCAEWZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 28 Feb 2022 23:22:25 -0500
Received: from mail-pf1-x42e.google.com (mail-pf1-x42e.google.com [IPv6:2607:f8b0:4864:20::42e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 42D8036B42
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:45 -0800 (PST)
Received: by mail-pf1-x42e.google.com with SMTP id x18so13034249pfh.5
        for <linux-doc@vger.kernel.org>; Mon, 28 Feb 2022 20:21:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RM5+y6my5bnvu7UBWU0IBvxxT5eON5dsbnRoTRo/yzA=;
        b=nBh6mtY+IDBX86t5UtGHWPD9naC3sOYALOU7XQATmNkPyDN6s5Ex7r+hM8Zbw+Ogrx
         NdStidN3JIH1x3pKjK6sZ0kuoYoB7IDBQk42GUA8QrBYATLCnHTWprdoV786Yf66RkQ+
         5+Ms2z/+9NPb/H3QEjzc8p0WZIiGV9gLk24QlWKpYjP4HP7v+9gJNPSCSrfNfEWT9yNa
         pjCmblTlKqNgoSvG544AMqZDbDGpOctVcnRR2PMYfSuFBl6CDit+Er/GQKNBwzVd3CJr
         /l0N0DLs8igV/qWj4Zg8vQRzo48yC3hFRJ3e3u5jYaAgydPqoxHxZFYAPAdD8h+IPdBv
         BV4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=RM5+y6my5bnvu7UBWU0IBvxxT5eON5dsbnRoTRo/yzA=;
        b=PQeBLcMLrZpKNfKQY/Y3IucKTfFG+0WCpilfTQ+7DEK6uNDG3aNEK2PeSAK+AyM5F6
         2A0HpeqWhNlEY011KH2etc8I+CkdoxVWy9JgSIS0HVt4GeuboWrKQkh/YrS4OaFAKnUh
         xu5O9DJiSWGvYt/+knjlOUkRkKc6GzpqGjqIUV9WeYre/+rEgXJa0OUa8urgXbNPvXtT
         4J8OijzhI0lfiJgF99erlE0F5T/GxbyZo+dUHe00JxAKQsX+CPpoFdjTHYlNfS+TLvZC
         KGutco3ZsH14Z3xkLsXl64xN0R8TKzLYIHoXAcZk4q6+NEq6tpzAp65RDU7X0WJnVJUf
         eFlA==
X-Gm-Message-State: AOAM531EMjhP3iKIDUh+VPQ9aIa7sr7FP5qxecoDeppD1gra+/i5Bs8r
        L4Gls56BIf/RcccCKPMcOXI=
X-Google-Smtp-Source: ABdhPJz0ODsilK6zX8eiL9E6M7e37xSi7KXomM4nvIbhvKRcZcpEtmos92Pon5a1TnpNghjXbUV8BA==
X-Received: by 2002:a05:6a00:16d3:b0:4cb:51e2:1923 with SMTP id l19-20020a056a0016d300b004cb51e21923mr25098870pfc.7.1646108504678;
        Mon, 28 Feb 2022 20:21:44 -0800 (PST)
Received: from localhost.localdomain (111-250-8-126.dynamic-ip.hinet.net. [111.250.8.126])
        by smtp.gmail.com with ESMTPSA id t41-20020a056a0013a900b004e167af0c0dsm15937178pfg.89.2022.02.28.20.21.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Feb 2022 20:21:44 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, chenhuacai@kernel.org,
        jiaxun.yang@flygoat.com, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v2 0/3] docs/zh_CN: add riscv vm-layout and peci translation
Date:   Tue,  1 Mar 2022 12:18:23 +0800
Message-Id: <cover.1646108017.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
* Pick Alexs's Reviewed-by tag. [PATCH 1/3 and 3/3 ]

v1:
* Translate .../riscv/vm-layout.rst into Chinese.
* Translate .../peci/* into Chinese.

Yanteng Si (3):
  docs/zh_CN: add riscv vm-layout translation
  docs/zh_CN: add peci index translation
  docs/zh_CN: add peci subsystem translation

 Documentation/translations/zh_CN/index.rst    |  1 +
 .../translations/zh_CN/peci/index.rst         | 26 +++++++
 .../translations/zh_CN/peci/peci.rst          | 54 +++++++++++++++
 .../translations/zh_CN/riscv/index.rst        |  1 +
 .../translations/zh_CN/riscv/vm-layout.rst    | 67 +++++++++++++++++++
 5 files changed, 149 insertions(+)
 create mode 100644 Documentation/translations/zh_CN/peci/index.rst
 create mode 100644 Documentation/translations/zh_CN/peci/peci.rst
 create mode 100644 Documentation/translations/zh_CN/riscv/vm-layout.rst

-- 
2.27.0

