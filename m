Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEB4DC433E3
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C62376198E
	for <linux-doc@archiver.kernel.org>; Mon, 29 Mar 2021 05:17:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230297AbhC2FQI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 29 Mar 2021 01:16:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36480 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229557AbhC2FPf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 29 Mar 2021 01:15:35 -0400
Received: from mail-qt1-x836.google.com (mail-qt1-x836.google.com [IPv6:2607:f8b0:4864:20::836])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A16FFC061574;
        Sun, 28 Mar 2021 22:15:34 -0700 (PDT)
Received: by mail-qt1-x836.google.com with SMTP id y2so8522162qtw.13;
        Sun, 28 Mar 2021 22:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=SETIUvdrfZWirmGYgeRhfk6v4sfx4sbLi0xj9bCzP6k=;
        b=QJEZyIY8ZflHREKrpiF4/pKP5HeMAvvEUiSbAUUBZdVimSlX3DN0m/3tVj1CH4oDhe
         vcxGWzUO4ZYhO2dvqCpgNFzKxVdG8Aj6c2dTTNeC4UNfN7UmFPQ55o/2j6ozSJwT7FRB
         qkIBoGKl7dw5F9MO4B/m8G5wGmmx0Mp/88jj7Qv9DHZe7DXJ7O/kmnCX6A2Kut/et3KM
         8ulXmwPD4LUxiJbQj58deV9IbCTdHpFXajXFXs3UvlzFSWuIC00Um28blz9wuVUbobbP
         mrrLoNu7MDn9XTs9WGxwIaE8P29ujhFn8IVeS4KM4ZVpABrcPbVbQX7fI0awg1HLZynS
         LMTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=SETIUvdrfZWirmGYgeRhfk6v4sfx4sbLi0xj9bCzP6k=;
        b=bGJGK/LihZdxApX3yOhOwz+wi/RPD0/Rnn3tnJiAb16D2QY0FZW6EbDsVyJfvFYKQV
         3qrYDrAJ+4AM+QtPkKDZnw4gmKMOmMFu5vkb4r+1YlNmzMEOT3xRabeRTBRNzCIe3VoH
         MfLKrqz7xCy3VJMvdPU18T6jgX01mwLR/+A7TP0dWwkcPELHLdRng2Q7ppzEd5nFK+Nc
         dL3C5ApFrAi4R9hOv6pObtIpRmfYVnppzyF4/Sjsc86pa+4yp44Shhlw4cmAmhFzl7XO
         raQX+vowlnfRXkKaxQt9ZqBYj/AnlEPv+k6GuRNVElqD4t3I2qToiLBxFLbue6zHXqCT
         boCg==
X-Gm-Message-State: AOAM532Jzm7SRVavuAmpFseJx5D/YyFnZneoS7WGHRCMLqkhsScpGdQi
        4xSo8PUAYEm7cE7ASG7fiII=
X-Google-Smtp-Source: ABdhPJy2xTTLJEHuFokjvvty6R0LIXBLHr5nJASw7QH4l14bTUXpGWkhsPZ3q2y1+DzRphd4/7iqsw==
X-Received: by 2002:ac8:5e8d:: with SMTP id r13mr22181398qtx.138.1616994933884;
        Sun, 28 Mar 2021 22:15:33 -0700 (PDT)
Received: from localhost.localdomain ([156.146.37.195])
        by smtp.gmail.com with ESMTPSA id z124sm12993181qke.36.2021.03.28.22.15.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Mar 2021 22:15:33 -0700 (PDT)
From:   Bhaskar Chowdhury <unixbhaskar@gmail.com>
To:     corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     Bhaskar Chowdhury <unixbhaskar@gmail.com>, rdunlap@infradead.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 03/23] w1-netlink.rst: A typo fix
Date:   Mon, 29 Mar 2021 10:42:39 +0530
Message-Id: <a49d33c6826e4bdb8a64eaad8adb736068d86181.1616992679.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.26.3
In-Reply-To: <cover.1616992679.git.unixbhaskar@gmail.com>
References: <cover.1616992679.git.unixbhaskar@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

s/strucutre/structure/

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 Documentation/w1/w1-netlink.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/w1/w1-netlink.rst b/Documentation/w1/w1-netlink.rst
index aaa13243a5e4..be4f7b82dcb4 100644
--- a/Documentation/w1/w1-netlink.rst
+++ b/Documentation/w1/w1-netlink.rst
@@ -66,7 +66,7 @@ Each connector message can include one or more w1_netlink_msg with
 zero or more attached w1_netlink_cmd messages.

 For event messages there are no w1_netlink_cmd embedded structures,
-only connector header and w1_netlink_msg strucutre with "len" field
+only connector header and w1_netlink_msg structure with "len" field
 being zero and filled type (one of event types) and id:
 either 8 bytes of slave unique id in host order,
 or master's id, which is assigned to bus master device
--
2.26.3

