Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6600EC7EE2A
	for <linux-doc@archiver.kernel.org>; Sun,  4 Jun 2023 19:06:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231167AbjFDTGy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 4 Jun 2023 15:06:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231389AbjFDTGx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Jun 2023 15:06:53 -0400
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com [IPv6:2607:f8b0:4864:20::42a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5217D2
        for <linux-doc@vger.kernel.org>; Sun,  4 Jun 2023 12:06:48 -0700 (PDT)
Received: by mail-pf1-x42a.google.com with SMTP id d2e1a72fcca58-65314ee05c6so1491480b3a.1
        for <linux-doc@vger.kernel.org>; Sun, 04 Jun 2023 12:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1685905608; x=1688497608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iKFRG4sLddr5jyH4jgTyfJ4yjF3tqwuDIQl2XFzUyrU=;
        b=oTCYkiFJvjVU0WBkJFOJvDisxaMyUDu3UoyebWveo08qPmVtDtkGfI1kXo4hONesQC
         IHAAllpJsMZq2/6OBOs+CTH3nArhy1fq2sZRoLNmnK0/O5mQpmjxQ9b0Q8d2fQp0lS33
         t2p/VvHC7kKk/alw/COviCugI8S6oT4k2eO7vApYOgGX2ew2vIebB+XMuZ/OGsP+bTlX
         f7AgC0iBZJ3/4NA3ElZ+RtYa0STerMw+O//AWdm+Pb/vRLjuho9JIfOmgEo3cnoNnOeT
         4C03ntM7QThZRfBJZv0Hf3Aqrceji1lYcAi0cJmZfhP4FVSx7nPlg7QZTwoxhAojLyHY
         FBdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685905608; x=1688497608;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iKFRG4sLddr5jyH4jgTyfJ4yjF3tqwuDIQl2XFzUyrU=;
        b=MYDV7zS0l81jAtwzPWTBNeqoKeBhuRgaw+PVTfYsh4dasl8ii4lxQWFSCOhNRZfHjL
         kMg/aQBWuYDRKEnNsUpmkHVt9NiWmOt/f2SQpKZ9+vh7xhGQknDZ0ZAsl2EvUFQWpiy9
         Bz3k8VUuV7/O0uyOJWo7DtkOk7CHRO4lD1NVvmn4nutxC5lhrfR1C4m1MIqqGx96Jpt/
         R6Y0aJndqoWBDYeERiMHADPR5m2xMbUKSR5Wta7xx98Msnmu+NHRYGeYGIGoP1g4nNQ1
         apoHvD3Kq25bs3pZWz1ju0Nd641q/H5gnKU6AYeXgX8rpNLcH55Epl/EjNhDU+72QK9V
         CXfw==
X-Gm-Message-State: AC+VfDzVp6hk9NNtoBd+7SGyMHHZlDXObF0Eqbm0YmaAG1xxWyBF5Dl4
        Yrh5fPtxrhxmDx/rccGp8Lk=
X-Google-Smtp-Source: ACHHUZ7cDgIjV0oILt0pZVD+r4aDxwUFJD0QMvse+QGJquJ/eroO8Pk1b3XFDfgRAeWKntRV/xdXLA==
X-Received: by 2002:a05:6a20:1450:b0:110:9b0b:71ab with SMTP id a16-20020a056a20145000b001109b0b71abmr2574568pzi.40.1685905607854;
        Sun, 04 Jun 2023 12:06:47 -0700 (PDT)
Received: from localhost.localdomain ([76.132.108.20])
        by smtp.gmail.com with ESMTPSA id m8-20020a170902db0800b001a6ed2d0ef8sm4979072plx.273.2023.06.04.12.06.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Jun 2023 12:06:47 -0700 (PDT)
From:   Russell Harmon <eatnumber1@gmail.com>
To:     bagasdotme@gmail.com
Cc:     mpatocka@redhat.com, snitzer@redhat.com, dm-devel@redhat.com,
        linux-doc@vger.kernel.org, Russell Harmon <eatnumber1@gmail.com>
Subject: [PATCH v3 4/4] Document an example of how the tunables relate in dm-integrity.
Date:   Sun,  4 Jun 2023 12:06:04 -0700
Message-Id: <20230604190604.4800-5-eatnumber1@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230604190604.4800-1-eatnumber1@gmail.com>
References: <CA+zrezTegR8jHQA3MNM6WnfFU_RP4=fiCuk6WgwJZsjZ2PYUSw@mail.gmail.com>
 <20230604190604.4800-1-eatnumber1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

For example, on a device using the default interleave_sectors of 32768, a
block_size of 512, and an internal_hash of crc32c with a tag size of 4
bytes, it will take 128 KiB of tags to track a full data area, requiring
256 sectors of metadata per data area. With the default buffer_sectors of
128, that means there will be 2 buffers per metadata area, or 2 buffers
per 16 MiB of data.

Signed-off-by: Russell Harmon <eatnumber1@gmail.com>
---
 Documentation/admin-guide/device-mapper/dm-integrity.rst | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/admin-guide/device-mapper/dm-integrity.rst b/Documentation/admin-guide/device-mapper/dm-integrity.rst
index 0241457c0027..d8a5f14d0e3c 100644
--- a/Documentation/admin-guide/device-mapper/dm-integrity.rst
+++ b/Documentation/admin-guide/device-mapper/dm-integrity.rst
@@ -213,6 +213,12 @@ table and swap the tables with suspend and resume). The other arguments
 should not be changed when reloading the target because the layout of disk
 data depend on them and the reloaded target would be non-functional.
 
+For example, on a device using the default interleave_sectors of 32768, a
+block_size of 512, and an internal_hash of crc32c with a tag size of 4
+bytes, it will take 128 KiB of tags to track a full data area, requiring
+256 sectors of metadata per data area. With the default buffer_sectors of
+128, that means there will be 2 buffers per metadata area, or 2 buffers
+per 16 MiB of data.
 
 Status line:
 
-- 
2.34.1

