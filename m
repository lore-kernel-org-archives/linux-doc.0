Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 541D9C27C76
	for <linux-doc@archiver.kernel.org>; Wed, 25 Jan 2023 15:44:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235388AbjAYPob (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Jan 2023 10:44:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234955AbjAYPob (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jan 2023 10:44:31 -0500
Received: from mail-io1-xd35.google.com (mail-io1-xd35.google.com [IPv6:2607:f8b0:4864:20::d35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2C5C38EAE
        for <linux-doc@vger.kernel.org>; Wed, 25 Jan 2023 07:44:29 -0800 (PST)
Received: by mail-io1-xd35.google.com with SMTP id y69so8627124iof.3
        for <linux-doc@vger.kernel.org>; Wed, 25 Jan 2023 07:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3zF1nYdKBjRQNQSWjt/QvwgoiL4FcKiQgDKfvefh5Z8=;
        b=Xq0G9QW1eILGpknhueDfUZxU3Vcfc4JINwjduEYSlKIw1cIpuuTo9IVyEfG4aFXmPS
         9Cs3RRUzxtwJqM+beezdyLy00B9tIOQFz76B4LdrspIjjG3Tzpl/YaTOOFHy9naOsLlk
         +O3HPAOsckxiJcPS0/Jm8i9u9WtktHAnz3Gwo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3zF1nYdKBjRQNQSWjt/QvwgoiL4FcKiQgDKfvefh5Z8=;
        b=c/etBhtctL3SUgZD+aLD02qoPn2KuPggBGbNZT1cSp5exwXz5HM+lT6SB9iPgZVmcz
         MdUGCkqAGPDvXT8eZYxFbKK4e1VVzav7ANhhNQvbivv+oA7j1QmUyEnv0L4Y+naM9DWi
         /nFMLxeRXd7sJ0ty1crwfDmQeG47wTi+V/F7GV4oX3CSDryo6m7Gd6ZVBzsFvZ9+TaXG
         7lS1KlAl+lV1BVh/pTB02i7PeWdOsjqCwJ5k0N13vIxqC+DHsAiJ4r/+uDOdGP3sDXco
         NXXZIW3+BytWHWyfbyz/qxFdVa7wOT7DwTIE+UTFLwC7dvVgNfvAysp8xvpRyN2U4b5Q
         TS+g==
X-Gm-Message-State: AFqh2kq7l7D3kfUwVnzKNpvxi9O379M9ijzPylrgI3YXUlrKjIR5DlUc
        bn0ohLSK+oGZ1sK+jT3Modg8jQ==
X-Google-Smtp-Source: AMrXdXvSoZjz+RcbcmDhSg50QYw/IRuVEj7ADoH6P/0KOBHR5dcHSsPckWtdih/XI8Lr1rB2CZhzLA==
X-Received: by 2002:a5d:9e4d:0:b0:707:6808:45c0 with SMTP id i13-20020a5d9e4d000000b00707680845c0mr3770282ioi.1.1674661468519;
        Wed, 25 Jan 2023 07:44:28 -0800 (PST)
Received: from shuah-tx13.internal ([38.15.45.1])
        by smtp.gmail.com with ESMTPSA id a4-20020a056602148400b00704d3db650bsm1538032iow.46.2023.01.25.07.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 07:44:27 -0800 (PST)
From:   Shuah Khan <skhan@linuxfoundation.org>
To:     corbet@lwn.net
Cc:     Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] docs: leds: fix the following docu build warning
Date:   Wed, 25 Jan 2023 08:44:26 -0700
Message-Id: <20230125154426.12464-1-skhan@linuxfoundation.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add leds-qcom-lpg to Documentation/leds/index.rst to fix the following
doc build warning.

Documentation/leds/leds-qcom-lpg.rst: WARNING: document isn't included in any toctree

Signed-off-by: Shuah Khan <skhan@linuxfoundation.org>
---
 Documentation/leds/index.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/leds/index.rst b/Documentation/leds/index.rst
index e5d63b940045..b9ca081fac71 100644
--- a/Documentation/leds/index.rst
+++ b/Documentation/leds/index.rst
@@ -26,3 +26,4 @@ LEDs
    leds-lp55xx
    leds-mlxcpld
    leds-sc27xx
+   leds-qcom-lpg
-- 
2.34.1

