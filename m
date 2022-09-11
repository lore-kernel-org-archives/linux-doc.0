Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09CD2C6FA8A
	for <linux-doc@archiver.kernel.org>; Sun, 11 Sep 2022 09:59:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229978AbiIKJ7n (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Sep 2022 05:59:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229992AbiIKJ7j (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Sep 2022 05:59:39 -0400
Received: from mail-qk1-x72c.google.com (mail-qk1-x72c.google.com [IPv6:2607:f8b0:4864:20::72c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 714B71151
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 02:59:29 -0700 (PDT)
Received: by mail-qk1-x72c.google.com with SMTP id d17so3448765qko.13
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 02:59:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date;
        bh=05QawunNkBTDZNRfoCgb3ddj6vEbyg8mxMOwfq8BU7w=;
        b=FITg0qC1SJ9aTWSShCLy+0XEwLiqqzm16acwEyJX+XAOfrkrL3gQKFBN6iNFjhoHZG
         EYZSqPwq89StyoiXOzPi38OdVfen6Kch8+/0qdeqz32WP9rIf/YfnNlK9jiEjdznFivN
         AWmO7rucIghTBighws2gKH3KXmkj8HoMUlZFBEiOrRJ3AiTCYs9aOifMWtWN6LwtdZ9Q
         gvQ28/d6rSLqSZWi9KMMqD5dqriCMSBexYGH4bchWXrRUAM6shbXX1zRtugVZ+iidlYX
         OtB+AesCotlHvIHNl28PHVO62PQklu7/96OO8IaLxQocXyu9UWL4GRPuzYDaYlM5l80F
         PvLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date;
        bh=05QawunNkBTDZNRfoCgb3ddj6vEbyg8mxMOwfq8BU7w=;
        b=4xBrzR5Sc/MQgHqr2UAUj7syFrUye7hLMWmiciVT5C6LoAp8dJ7TnE27XHzNCDrK1B
         TFDLdEZ7Kq5DB7G7Cm9+HWUsqj77IYaQVrfJfKGh5DE+FPvXkAF94EAv/JNufgW982hV
         4jHLXFoI5XugXaMJqQH0YbQFtcAFBI9d3Qif4ePIzk8XsMleshg9//ZYgdMow/MRKo30
         mxCLqGuTYBUW4P22RVZ8kJ7gp5NKeVd4h6rOPof6qHF+gYuett/C+Q7N/U44ve5cIgqZ
         U8h8HfwKoNZ7F+Xpr14Mr5RZg8y42AXb3v23uPH+FZsYsOnUuTjVRiGKvJukV9IEYEgk
         nJbA==
X-Gm-Message-State: ACgBeo3GIX1bGpw+ORlUZ7R+PrzG0aYL2a8wGPQzGTZ1FENBF1sbiQA7
        WS0lLEM27hy65ibJQ25WoC2YEkDyJpI8mvRktwSjjQ==
X-Google-Smtp-Source: AA6agR71DltUgDiY2jCMkxrf+AZs/phfKSzHNt2mi1NjERR2m+qoQs1XuGvQYq7t2EcHdQja6Z5EDA==
X-Received: by 2002:a05:620a:144b:b0:6cd:5fc9:372 with SMTP id i11-20020a05620a144b00b006cd5fc90372mr7364483qkl.452.1662890368474;
        Sun, 11 Sep 2022 02:59:28 -0700 (PDT)
Received: from soleen.c.googlers.com.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id y29-20020a37f61d000000b006cbd60c14c9sm4625233qkj.35.2022.09.11.02.59.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 02:59:27 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com
Subject: [PATCH 0/3] page table check default to warn instead of panic
Date:   Sun, 11 Sep 2022 09:59:20 +0000
Message-Id: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Pasha Tatashin <tatashin@google.com>

Page table check when detects errors panics the kernel. Let instead,
print a warning, and panic only when specifically requested via kernel
parameter:

	page_table_check=panic

The discussion about using panic vs. warn is here:
https://lore.kernel.org/linux-mm/20220902232732.12358-1-rick.p.edgecombe@intel.com

Pasha Tatashin (2):
  mm/page_table_check: Do WARN_ON instead of BUG_ON by default
  doc/vm: add information about page_table_check=panic

Rick Edgecombe (1):
  mm/page_table_check: Check writable zero page in page table check

 Documentation/mm/page_table_check.rst | 16 ++++----
 mm/page_table_check.c                 | 53 ++++++++++++++++++++-------
 2 files changed, 49 insertions(+), 20 deletions(-)

-- 
2.37.2.789.g6183377224-goog

