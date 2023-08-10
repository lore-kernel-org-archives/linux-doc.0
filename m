Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E462C41513
	for <linux-doc@archiver.kernel.org>; Thu, 10 Aug 2023 01:06:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229658AbjHJBGZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Aug 2023 21:06:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36178 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230391AbjHJBGZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Aug 2023 21:06:25 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D411E1982
        for <linux-doc@vger.kernel.org>; Wed,  9 Aug 2023 18:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1691629537;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=JkB4Upyz+pODWA+n3M6W8QaRx94LWEelftlH4td1its=;
        b=hrgShFmi7qM27vG1GZa8VfA/AB5h+ELCu38ShsfSDhKYFEsb5BvRYfM/XtWsG59oJTEKS+
        yC6WWFVs6Hh9tDIE+SLqIWzBaiYn0Br/X3lA4Rmy39zYP4YUGdrPktKfAKFA79p6mPlWkA
        BG6nbYvWoT4OXzjRnD7B3VvH3E7Ge0E=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-426-rpDV4a58N5GU4wcUFlu3Mg-1; Wed, 09 Aug 2023 21:05:35 -0400
X-MC-Unique: rpDV4a58N5GU4wcUFlu3Mg-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-268b931c2ceso475796a91.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Aug 2023 18:05:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691629534; x=1692234334;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JkB4Upyz+pODWA+n3M6W8QaRx94LWEelftlH4td1its=;
        b=c+JGyhLz9fXXLME2Ux8L0K8RombqJx0ZJTqyYndCNWI6w+RzrqXQeDPA94NyUrQdBN
         yS0Ns0NtCazDhEqOr+SNa3T955puteomlwAIApUvC2PUrGrotsyTsL8zmEdRc1ICEcZc
         wZeLK5ZSkPKXNyEvWLP8UYIHybBt2NukHPT7gfSsdj0y9DwXYbnxrW7Fu2ezoQB7Shhk
         yqDE8foHRNBAR8/wgROD1cT+hPRzJGs/3ra11jhb8hgmdo4XuU+/lgKkHMlqvj1pNV8W
         4BxZj/nALwUH1/u+b57DlA5TbLAGX+hrq9vSh1B0b46aNcwtrToqDhKngvM+6PXdj/i2
         KgWA==
X-Gm-Message-State: AOJu0Ywu5UYOJMhexFly55mDUuiog/7Ti24/9j4vSqL05B7fah76QmAw
        3yfLDeShjCO4DoK0/uT610FRi4jNsjmJmiDFCzeA0RejPlFD2DQ6WpJ50nHOKbUEnKJODfD9Ozu
        MpUSIt9EbS5ckgkwC8Xyk
X-Received: by 2002:a17:90a:e60f:b0:268:14d7:bc34 with SMTP id j15-20020a17090ae60f00b0026814d7bc34mr816245pjy.20.1691629534525;
        Wed, 09 Aug 2023 18:05:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHY1anU2xQoxwSHQv10Oia90ffZnFNfLoZIUz1KlWbFH/MUcU8hO1zVboPzOexpsDBlg5FojA==
X-Received: by 2002:a17:90a:e60f:b0:268:14d7:bc34 with SMTP id j15-20020a17090ae60f00b0026814d7bc34mr816230pjy.20.1691629534186;
        Wed, 09 Aug 2023 18:05:34 -0700 (PDT)
Received: from fedora19.redhat.com ([2401:d002:2d05:b10a:c9ac:2dd7:6463:bb84])
        by smtp.gmail.com with ESMTPSA id 8-20020a17090a034800b00262e485156esm2214827pjf.57.2023.08.09.18.05.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Aug 2023 18:05:33 -0700 (PDT)
From:   Ian Wienand <iwienand@redhat.com>
To:     linux-kernel@vger.kernel.org
Cc:     Minchan Kim <minchan@kernel.org>,
        Sergey Senozhatsky <senozhatsky@chromium.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        Ian Wienand <iwienand@redhat.com>
Subject: [PATCH] selftests/zram : add non-zero data
Date:   Thu, 10 Aug 2023 11:03:14 +1000
Message-ID: <20230810010313.493384-2-iwienand@redhat.com>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In diagnosing some issues with the partner test in LTP I noticed that
because this fills the device with zeros, it doesn't really activate
the compressed allocator path as it is designed to do.  This is a
"lite" version of the LTP patch that simply perturbs the zero writes to
avoid having all pages hit the same-page detection, and adds a sync so
that we're looking at a more quiescent system to get the final stats.

While we're here, this rewords and expands some of the mm_stat flag
docs to be a bit more explicit about what's going on.

Link: https://lore.kernel.org/ltp/20230808035641.364676-2-iwienand@redhat.com/T/#u
Signed-off-by: Ian Wienand <iwienand@redhat.com>
---
 Documentation/admin-guide/blockdev/zram.rst | 22 ++++++++++++++-------
 tools/testing/selftests/zram/zram01.sh      | 18 +++++++++++++++--
 2 files changed, 31 insertions(+), 9 deletions(-)

diff --git a/Documentation/admin-guide/blockdev/zram.rst b/Documentation/admin-guide/blockdev/zram.rst
index e4551579cb12..a39a01870f40 100644
--- a/Documentation/admin-guide/blockdev/zram.rst
+++ b/Documentation/admin-guide/blockdev/zram.rst
@@ -253,17 +253,25 @@ line of text and contains the following stats separated by whitespace:
  orig_data_size   uncompressed size of data stored in this disk.
                   Unit: bytes
  compr_data_size  compressed size of data stored in this disk
- mem_used_total   the amount of memory allocated for this disk. This
-                  includes allocator fragmentation and metadata overhead,
-                  allocated for this disk. So, allocator space efficiency
-                  can be calculated using compr_data_size and this statistic.
-                  Unit: bytes
+ mem_used_total   the amount of memory currently used by the compressed
+                  memory allocator to hold compressed data. This
+                  includes allocator fragmentation and metadata
+                  overhead.  The device space efficiency can be
+                  calculated as a ratio of the compr_data_size /
+                  mem_used_total.  Note this value may be zero;
+                  particularly if all pages are filled with identical
+                  data (see same_pages).
  mem_limit        the maximum amount of memory ZRAM can use to store
                   the compressed data
  mem_used_max     the maximum amount of memory zram has consumed to
                   store the data
- same_pages       the number of same element filled pages written to this disk.
-                  No memory is allocated for such pages.
+ same_pages       pages identified as being filled exclusivley with an
+                  identicial unsigned-long value are recorded
+                  specially by zram and thus are not stored via the
+                  compression allocator.  This avoids fragmentation
+                  and metadata overheads for common cases such as
+                  zeroed or poision data.  same_pages is the current
+                  number of pages kept in this de-duplicated form.
  pages_compacted  the number of pages freed during compaction
  huge_pages	  the number of incompressible pages
  huge_pages_since the number of incompressible pages since zram set up
diff --git a/tools/testing/selftests/zram/zram01.sh b/tools/testing/selftests/zram/zram01.sh
index 8f4affe34f3e..122625d744c2 100755
--- a/tools/testing/selftests/zram/zram01.sh
+++ b/tools/testing/selftests/zram/zram01.sh
@@ -33,16 +33,30 @@ zram_algs="lzo"
 
 zram_fill_fs()
 {
+	local page_size=$(getconf PAGE_SIZE)
 	for i in $(seq $dev_start $dev_end); do
 		echo "fill zram$i..."
 		local b=0
 		while [ true ]; do
-			dd conv=notrunc if=/dev/zero of=zram${i}/file \
+			# If we fill with all zeros, every page hits
+			# the same-page detection and never makes it
+			# to compressed backing.  Filling the first 1K
+			# of the page with (likely lowly compressible)
+			# random data ensures we hit the compression
+			# paths, but the highly compressible rest of
+			# the page also ensures we get a sufficiently
+			# high ratio to assert on below.
+			local input_file='/dev/zero'
+			if [ $(( (b * 1024) % page_size )) -eq 0 ]; then
+			    input_file='/dev/urandom'
+			fi
+			dd conv=notrunc if=${input_file} of=zram${i}/file \
 				oflag=append count=1 bs=1024 status=none \
 				> /dev/null 2>&1 || break
 			b=$(($b + 1))
 		done
-		echo "zram$i can be filled with '$b' KB"
+		echo "zram$i was filled with '$b' KB"
+		sync
 
 		local mem_used_total=`awk '{print $3}' "/sys/block/zram$i/mm_stat"`
 		local v=$((100 * 1024 * $b / $mem_used_total))
-- 
2.41.0

