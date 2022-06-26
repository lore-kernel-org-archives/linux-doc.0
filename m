Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C28A9C433EF
	for <linux-doc@archiver.kernel.org>; Sun, 26 Jun 2022 12:22:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234366AbiFZMWU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 26 Jun 2022 08:22:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54724 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234323AbiFZMWT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 26 Jun 2022 08:22:19 -0400
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6BD2E029
        for <linux-doc@vger.kernel.org>; Sun, 26 Jun 2022 05:22:17 -0700 (PDT)
Received: by mail-pf1-x430.google.com with SMTP id d17so6582780pfq.9
        for <linux-doc@vger.kernel.org>; Sun, 26 Jun 2022 05:22:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=shopee.com; s=shopee.com;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8s0lCJFkdx6j2t2rP43xmjLpZtoK4Xw50rt6eHylro=;
        b=TcsSMFXiT+5X7dU8QuzN01RUTE7suLy5ZBNWgKnS5BgQw7tF0KbDyEMDtS8d6iDDlL
         gLMGYfTEzkJ+G4xOCt5DsXHpykvxBCza2U1YxFO4SLWVn+UG+HL/nKbtwKfIjbed4hJS
         HnBm3eG5IxbnkU6idM9HhnGmg6FcwrxvCDGHl44/jMg/7DkhrNdLjuGxUH3AxeGIodN/
         ugGRZt89KGvHHv7ojZ4OKyPjGh/mtp6PdEaK3baP3Ao+M982W3Y9k7UXcDMYT3UsORys
         owhafZL5IXf3oYouN5uyIWM1GwkTZTTK+YSdILpXlvGrhjC9NL9xhDnF0JKKHBC4IhDR
         AR/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=m8s0lCJFkdx6j2t2rP43xmjLpZtoK4Xw50rt6eHylro=;
        b=7QdakC1S3uE804JgGRPd9uFhoXOy+XNTrtXMTOfP8kEPLQ0P5xWXn73HbGWYd22zRV
         PfLl1lv4kC3YDh+KknkncObF32tHMe1fhrnbKBdL1eq9021R5IMB2fbsXy2Yd7fgR5e+
         yk1YnNvbCzcY7XemCT8e5gn19yNIcBTBxT00rhshWOoy/2nsNijtQg8o91SV5/YgeysD
         MtVR3hz6gONkpQEg2R5eLjoTXJrjf2JzBQGo0RSRO6ZOVaY6R7BJOiy8u9tH9dbnqiVO
         RzhJU23KWYylClMbTDTC61UwtUSNYMdTuedEBvky70PbBnD09C/9Ib0inLSYDhUncv+E
         qB+g==
X-Gm-Message-State: AJIora90vLGBkdZUlt+t4ejXmzhE9mxWxjgzXqokxGUQbMHDBzprHLBx
        bgClCBulmH/3LwnYqEyf2L0uJQ==
X-Google-Smtp-Source: AGRyM1tWi/m0cz9tahK/IHS49io1wF+3CXC2ysFGGT/IXODghxI1AXOc4vdLl5PXbpw2Vc7CrNz2zQ==
X-Received: by 2002:a05:6a00:24c1:b0:50d:33cf:811f with SMTP id d1-20020a056a0024c100b0050d33cf811fmr9259176pfv.78.1656246137408;
        Sun, 26 Jun 2022 05:22:17 -0700 (PDT)
Received: from localhost.localdomain (bb119-74-120-80.singnet.com.sg. [119.74.120.80])
        by smtp.gmail.com with ESMTPSA id b7-20020a1709027e0700b0016a4f3ca28bsm5051994plm.274.2022.06.26.05.22.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jun 2022 05:22:16 -0700 (PDT)
From:   yizhou.tang@shopee.com
To:     siyanteng@loongson.cn, alexs@kernel.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, robin.lubin@shopee.com, huangh@sea.com,
        Tang Yizhou <yizhou.tang@shopee.com>
Subject: [PATCH 0/2] Add mutex-design Chinese translation
Date:   Sun, 26 Jun 2022 20:22:08 +0800
Message-Id: <20220626122210.56704-1-yizhou.tang@shopee.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tang Yizhou <yizhou.tang@shopee.com>

Tang Yizhou (2):
  docs/zh_CN: Show the Chinese translation of spinlocks
  docs/zh_CN: Add mutex-design Chinese translation

 .../translations/zh_CN/locking/index.rst      |   5 +-
 .../zh_CN/locking/mutex-design.rst            | 144 ++++++++++++++++++
 2 files changed, 147 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/translations/zh_CN/locking/mutex-design.rst

-- 
2.34.1

