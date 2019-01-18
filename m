Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2AF527D161
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 Jan 2019 13:38:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727371AbfARNia (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 Jan 2019 08:38:30 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:53778 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727020AbfARNia (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jan 2019 08:38:30 -0500
Received: by mail-wm1-f68.google.com with SMTP id d15so4529717wmb.3
        for <linux-doc@vger.kernel.org>; Fri, 18 Jan 2019 05:38:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=VgAxxxrE6pIe5JTLS0o6AyfzRnkrf0ffQkkxm2skhIs=;
        b=j+JGx/ZIPUcCEFjierqfypF1xaMc/u05Jz3z4kO2rueBKroWLfktm2dbE6fyi44N9l
         whhY6cgkyHPMJ9d0oBQsY6R8kZaGFvsb7QgHPd7zuWcL+AxrSrzULVmz8sElN8+NR3vz
         q9mIG+CW2L5HQAy+/ESKR9VtAiWToF/1IQnUvS1MXHaIpIJHAUfTU70cTXJ9FE+FVNkk
         eTH+BzBmRNnC6gibDbCbD1f4kAChh+JWnLUHUS1OWL/h0JmBqn/8pcsbdEG3hCsETVRC
         OXbA57xfWoLRahTr4CN4kRNIeMXfF3QQSApqgm/RkAk+7+xnY4WIJ/OxmPZe0WZRjxhy
         Q6DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=VgAxxxrE6pIe5JTLS0o6AyfzRnkrf0ffQkkxm2skhIs=;
        b=a/9c8wC+eG67on3AYWJWUXSck8oRSkpBHw7u3hEMBrk4BhHIldOgcm77vSJFRJHJJE
         UtMiMM/TB6hB1uPpghjmB4hKhfANjQDbSbrEXnQTDtEChox5SxSBVxPGbFi0hzIGPcCM
         Wjp9HyXLEEQDmhFHU7+p5eVBSL9C+Cswe8ct5XlzCjqqgBwDmBJNuZSryaPDv8MtaPQP
         aFFBIIzaI2MU8PXAzTylwAEyDtYhaabMjFxeTl5wXdbAOW/+e+ykuqjQ41GSQyBqb99F
         SH3Z2xLoFhNDHrTSICzZqKrPNszR4EAFK66+5IR4wHdaPrHy5wfo9LaHk5iQ81dT/kXo
         POzg==
X-Gm-Message-State: AJcUukdfm2pvqALrQScltorXeak4D5hXt/dMGN3aiNUNE9TUdfcw8JcX
        +tbIkjxO+avNoluW3Gk7MDt/+A==
X-Google-Smtp-Source: ALg8bN4nyD2T6zQMNgtL4W8BL1pVd0S3wpHD2PAgGqsQj2Jddccq+pQoiit13O0Qe7Uu62vSOHCN/A==
X-Received: by 2002:a1c:f71a:: with SMTP id v26mr14743094wmh.131.1547818708127;
        Fri, 18 Jan 2019 05:38:28 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id b7sm77748826wrs.47.2019.01.18.05.38.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 05:38:27 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH] Documentation: DMA-API: fix two typos
Date:   Fri, 18 Jan 2019 13:38:22 +0000
Message-Id: <1547818702-40035-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch fixes two typos, a missing "e" and dma-api/driver_filter was
incorrectly typed dma-api/driver-filter.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
 Documentation/DMA-API.txt | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index 78114ee63057..bd009f3069f8 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -531,7 +531,7 @@ that simply cannot make consistent memory.
 		       dma_addr_t dma_handle, unsigned long attrs)
 
 Free memory allocated by the dma_alloc_attrs().  All parameters common
-parameters must identical to those otherwise passed to dma_fre_coherent,
+parameters must identical to those otherwise passed to dma_free_coherent,
 and the attrs argument must be identical to the attrs passed to
 dma_alloc_attrs().
 
@@ -720,7 +720,7 @@ dma-api/num_free_entries	The current number of free dma_debug_entries
 dma-api/nr_total_entries	The total number of dma_debug_entries in the
 				allocator, both free and used.
 
-dma-api/driver-filter		You can write a name of a driver into this file
+dma-api/driver_filter		You can write a name of a driver into this file
 				to limit the debug output to requests from that
 				particular driver. Write an empty string to
 				that file to disable the filter and see
-- 
2.19.2

