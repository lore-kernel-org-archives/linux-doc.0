Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF2DDC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 08:14:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230443AbiCGIPp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 03:15:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229824AbiCGIPp (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 03:15:45 -0500
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 064D95B8AB
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 00:14:52 -0800 (PST)
Received: by mail-pl1-x62f.google.com with SMTP id n15so3101515plh.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 00:14:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QIkkzYHwge85g5EjrEMJ1RxO6SrNiu3zXBscNPHWnFA=;
        b=qdLYe6jusffDmCFrMVxIy7WtXriwkcNsUS34XSdhAPF8HJGsvLK1vXMSDMkM2AbsNT
         XaMHmsp3murcf/Fdu9pc9bL4BQsRlY2ppU4IJ06Wo0vtom1q4Bbj4py4F72k3O01zILL
         wHOT0aJnouHrOF7LuDJP5SwvvE/bJgyWWYYfngTStzx1OFxY+cRS1GQ4eqD7Yz9fj1y4
         J54o31GxlpbghR151M8Sr9il2Y0sOrG9M0GArU/L00xJbRvrCk0yVuvRI5ZTFiBW3kEj
         b8jbcVI7Kx9pZZGTJvNXPJmjj6kUbUaht3jdplmz9Z2t04ZroreMksyeRu8SJv7E1aXt
         FRLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=QIkkzYHwge85g5EjrEMJ1RxO6SrNiu3zXBscNPHWnFA=;
        b=fyytmG2HqXS/SOBnNiKTlTbCvMY4797xE5HX3X2UFWJ7y9O48ecZMejglbky1UDh9s
         D89uM11OZEum0TkGGwKpaqFB9v3QYtq6m/uVwlbbehUHBdpEwPPIbOb5wAoRX0Zl+V7Z
         LLowHwtRYLP5Lspxtlt0C++jWzsAUeQoxj2PktE+6XNOLygCaZXwgdpRCGkbmiKTcXUr
         q+MFdeEKx2UGWyu6e6DQsDPBB3gXZGt1o5noaZ0xGxKXNK4iIk0NmcNNb0B10dbEqUBF
         mFBeyXovqzwYq/VDfPmZuLp+COwEGXxFSScFpqe117DEgIfkCnLbAN0nCNXEVNb4nVxY
         62TA==
X-Gm-Message-State: AOAM530J6P2dEE3kFlZ2WnN3pvRcje0klnUwFhorf3uol/c9+oLzCNGO
        tMDLtzVYOkwr3UOAKEJyfHc=
X-Google-Smtp-Source: ABdhPJw7lx0eqFwHiaGyocYMl174UDI/5/d3xJKVNeE7LoCtYLCIKEex5ceXtAoLMwpO4Rs4YKZ2Wg==
X-Received: by 2002:a17:903:1206:b0:151:7d67:2924 with SMTP id l6-20020a170903120600b001517d672924mr10933875plh.45.1646640891290;
        Mon, 07 Mar 2022 00:14:51 -0800 (PST)
Received: from localhost.localdomain ([50.7.17.55])
        by smtp.gmail.com with ESMTPSA id w17-20020a056a0014d100b004f1063290basm15426309pfu.15.2022.03.07.00.14.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 00:14:50 -0800 (PST)
From:   Yanteng Si <siyanteng01@gmail.com>
X-Google-Original-From: Yanteng Si <siyanteng@loongson.cn>
To:     corbet@lwn.net, alexs@kernel.org, seakeel@gmail.com
Cc:     Yanteng Si <siyanteng@loongson.cn>, yang.yang29@zte.com.cn,
        xu.xin16@zte.com.cn, linux-doc@vger.kernel.org,
        siyanteng01@gmail.com
Subject: [PATCH v5 0/3] Add Chinese translations for KSM documents
Date:   Mon,  7 Mar 2022 16:16:04 +0800
Message-Id: <cover.1646634928.git.siyanteng@loongson.cn>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v5:
    Add Yanteng's Signoff tag. [PATCH v5 2/3 and 3/3]

v4:
    Fix build error and build warning.

v3:
	Fix the patch '[1/3] Add Chinese translation for vm/ksm.rst'
	because its old version does not apply for the latest commit.

v2:

	According to the suggestions from Yanteng Si, Alex Shi and
	Jonathan Corbet, I have modified my patches. Here are my specific
	changelog:

	1. Remove Redundant Labels in added Documents like ``.. _ksm_sysfs:``

	   Yanteng Si said: Too many tags will cause a compilation
	   warning, because an identical one already exists for the Origin
	   document. Jonathan Corbet think so.

	2. Align with standard Chinese format on the 'original', 'translator',
	   etc.

	3. fix some translation error like “pages_unshared”, I remove  '独享'.

	   Alex Shi suggest to remove '独享'.

	4. Refactor translations/zh_CN/admin-guide/mm/index.rst.

	   Yanteng Si: Compile pass is only one of the basis for checking
	   through, we also have to check the html for any problems, as
	   far as I know, the above treatment is very ugly.

xu xin (3):
  Add Chinese translation for vm/ksm.rst
  zh_CN: Add translations for admin-guide/mm/ksm.rst
  zh_CN: Add translation for admin-guide/mm/index.rst

 .../translations/zh_CN/admin-guide/index.rst  |   2 +-
 .../zh_CN/admin-guide/mm/index.rst            |  49 ++++++
 .../translations/zh_CN/admin-guide/mm/ksm.rst | 148 ++++++++++++++++++
 Documentation/translations/zh_CN/vm/index.rst |   1 +
 Documentation/translations/zh_CN/vm/ksm.rst   |  70 +++++++++
 5 files changed, 269 insertions(+), 1 deletion(-)
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/index.rst
 create mode 100644 Documentation/translations/zh_CN/admin-guide/mm/ksm.rst
 create mode 100644 Documentation/translations/zh_CN/vm/ksm.rst

-- 
2.27.0

