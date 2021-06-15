Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CA5C49EA2
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 21:21:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 63E666128C
	for <linux-doc@archiver.kernel.org>; Tue, 15 Jun 2021 21:21:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230346AbhFOVXh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 15 Jun 2021 17:23:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231295AbhFOVXb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 15 Jun 2021 17:23:31 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 24FFAC06124A
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 14:21:26 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id x73so450150pfc.8
        for <linux-doc@vger.kernel.org>; Tue, 15 Jun 2021 14:21:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=1WsCoFrZUeCb0I6fGREpg1RRrP6pUhfJxmr65OEW+zI=;
        b=ExHsShelnJC1ZujVqA5L/hh0NvxQMBhXN2MULuE6mmK+LgF0GZw9HVc3a8QIkI3dKf
         rQcXcD7kGknLCUvv8mNZBl38OHiy9EPcaWssQ7LcN0xvLIKgsVw7ETKXgxoO9LStcKQh
         8gilmRAKZkmJOi+h73XODDh65FCzh7QUsySwg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=1WsCoFrZUeCb0I6fGREpg1RRrP6pUhfJxmr65OEW+zI=;
        b=O4O4PSK+3f9G3BRx+IxnMR6C7AlrB52ho0zb1onngm5fWIydMJAZYKzlcMWv4ctr02
         BAWXs6BG122jTIMATXlGwiEVJyjny9nHZp1vGDvTQDJ5PN4+Q8wqcakUuOWEdx3SkW43
         sy1/gvGlgg324HGzdXRHAh2TtWJG4+0nojAx/teoGHfrVpSYB2zb0Lv/osk0uaxHWXSH
         0nwCCvMqr0LTRh/r5UW2bnyqj2y+TL4zYG3TKvVmXDCzgN2fmUONkcdIu+SJ+15uK1r+
         GKbMstER2ToKU1B6A+B3jTVzAZiUK1doCZ1Lp8DQeXtXFxnFQs1YLSWM87tJHsW/5UDr
         Cj8w==
X-Gm-Message-State: AOAM532SgKBUzAtnCaJJdZu+raez//AcTE+/JgogrBpNsKoV09MDIQXV
        gTqDd7nTf7JAj+qExsUeN57sZw==
X-Google-Smtp-Source: ABdhPJwZ6dQpDmP5yqVDdThGzD8bpvZ2yTrYL5QSdc6qOqCFdVutpzCaBenqXSN3cOdGGaWGzve9vg==
X-Received: by 2002:a63:d305:: with SMTP id b5mr1507673pgg.67.1623792085651;
        Tue, 15 Jun 2021 14:21:25 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id k6sm80428pfa.215.2021.06.15.14.21.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Jun 2021 14:21:24 -0700 (PDT)
From:   Kees Cook <keescook@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     Kees Cook <keescook@chromium.org>, Christoph Hellwig <hch@lst.de>,
        Al Viro <viro@zeniv.linux.org.uk>, gmpy.liaowx@gmail.com,
        Anton Vorontsov <anton@enomsg.org>,
        Colin Cross <ccross@android.com>,
        Tony Luck <tony.luck@intel.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        linux-doc@vger.kernel.org, linux-mtd@lists.infradead.org,
        linux-block@vger.kernel.org, linux-fsdevel@vger.kernel.org
Subject: [PATCH v2 4/4] pstore/blk: Fix kerndoc and redundancy on blkdev param
Date:   Tue, 15 Jun 2021 14:21:21 -0700
Message-Id: <20210615212121.1200820-5-keescook@chromium.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20210615212121.1200820-1-keescook@chromium.org>
References: <20210615212121.1200820-1-keescook@chromium.org>
MIME-Version: 1.0
X-Patch-Hashes: v=1; h=sha256; g=40eac1b7c9cd225ba517a3879c498704663ed315; i=yTEuvN+d2QlI+CgetW2A/mnEULnwbC3Uy5kOoKgmB9Q=; m=yIDjiAw9ImVPRu6Ts4rM6ctqS+8yW+yfMUIAkNmTcxE=; p=TXx6XCuoWJyqy7rsksng3VTp82hOVpLmF4DnpkYUm+I=
X-Patch-Sig: m=pgp; i=keescook@chromium.org; s=0x0x8972F4DFDC6DC026; b=iQIzBAABCgAdFiEEpcP2jyKd1g9yPm4TiXL039xtwCYFAmDJGdAACgkQiXL039xtwCabvA//f2d ouRC3eMe4By1s5gm+kgCGLji4A5jmvfWvuteZkPHrsEAhxzfe5FDa8OXvGRvElGR/imgzjGKMCaFu 3LDUFU5/2igZpyDqhOFZas4pGIgmgNFmxdS/a0KdkXwQiTTdKe8hffEGtZtwW2v6q2MSxnh3DcIxJ iPMFxWRz7TXHJQuBmVNlOCCCVJ+lE5oZy0VMo8GlcbMZrDqQ71eMGvEW0venFXiLrHrAukJUj+OHx Ks5XzrUSZdPgVN8clVdt7+Jfrh1r+HrdTjq8CE8mmvwNL/su/1i2CH52msFFHn4MF/yn3OjNxTzfi kmqwJmlKC7bx5C+D1mpIvNav5DTupfQGafxkYtyhuQfiPGi/Lp72svaD1wTTjY7AEMG51Zqy1IsKk qPC16uxbn3VAtGEDtT3KvDocAciZdTg7EQ6MwjgznzKWO2kHQY0XqZo2/yqtzDcQyLo9HB8JGjNmr P7w4VmVmtZL0idygwnih2lzc2MpD9Buzeik3jOk57K1e6PF6+EFlIDeRTKpbO/JbuhBTRab4G9USD Km/i/73fVcgRXEIt+isU8smkNLPfEQk9RK/gzlIByu+sPQJsYqSQRQ0tfzlpy1gjTCISXkBVU/ClM ZAuaMtt9Qc07acYesdxXHuGQajsdrCjZcPmxYLzi4szH1kvQoSrwp5lMyhBkA85k=
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Remove redundant details of blkdev and fix up resulting kerndoc.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Documentation/admin-guide/pstore-blk.rst | 14 +++++++-------
 fs/pstore/blk.c                          | 24 +-----------------------
 2 files changed, 8 insertions(+), 30 deletions(-)

diff --git a/Documentation/admin-guide/pstore-blk.rst b/Documentation/admin-guide/pstore-blk.rst
index 49d8149f8d32..2d22ead9520e 100644
--- a/Documentation/admin-guide/pstore-blk.rst
+++ b/Documentation/admin-guide/pstore-blk.rst
@@ -45,15 +45,18 @@ blkdev
 The block device to use. Most of the time, it is a partition of block device.
 It's required for pstore/blk. It is also used for MTD device.
 
-It accepts the following variants for block device:
+When pstore/blk is built as a module, "blkdev" accepts the following variants:
 
-1. <hex_major><hex_minor> device number in hexadecimal represents itself; no
-   leading 0x, for example b302.
-#. /dev/<disk_name> represents the device number of disk
+1. /dev/<disk_name> represents the device number of disk
 #. /dev/<disk_name><decimal> represents the device number of partition - device
    number of disk plus the partition number
 #. /dev/<disk_name>p<decimal> - same as the above; this form is used when disk
    name of partitioned disk ends with a digit.
+
+When pstore/blk is built into the kernel, "blkdev" accepts the following variants:
+
+#. <hex_major><hex_minor> device number in hexadecimal representation,
+   with no leading 0x, for example b302.
 #. PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF represents the unique id of
    a partition if the partition table provides it. The UUID may be either an
    EFI/GPT UUID, or refer to an MSDOS partition using the format SSSSSSSS-PP,
@@ -227,8 +230,5 @@ For developer reference, here are all the important structures and APIs:
 .. kernel-doc:: include/linux/pstore_zone.h
    :internal:
 
-.. kernel-doc:: fs/pstore/blk.c
-   :internal:
-
 .. kernel-doc:: include/linux/pstore_blk.h
    :internal:
diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index e5ed118683b1..ccfb11ee4d50 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -58,29 +58,7 @@ MODULE_PARM_DESC(best_effort, "use best effort to write (i.e. do not require sto
 
 /*
  * blkdev - the block device to use for pstore storage
- *
- * Usually, this will be a partition of a block device.
- *
- * blkdev accepts the following variants, when built as a module:
- * 1) /dev/<disk_name> represents the device number of disk
- * 2) /dev/<disk_name><decimal> represents the device number
- *    of partition - device number of disk plus the partition number
- * 3) /dev/<disk_name>p<decimal> - same as the above, that form is
- *    used when disk name of partitioned disk ends on a digit.
- *
- * blkdev accepts the following variants when built into the kernel:
- * 1) <hex_major><hex_minor> device number in hexadecimal representation,
- *    with no leading 0x, for example b302.
- * 2) PARTUUID=00112233-4455-6677-8899-AABBCCDDEEFF representing the
- *    unique id of a partition if the partition table provides it.
- *    The UUID may be either an EFI/GPT UUID, or refer to an MSDOS
- *    partition using the format SSSSSSSS-PP, where SSSSSSSS is a zero-
- *    filled hex representation of the 32-bit "NT disk signature", and PP
- *    is a zero-filled hex representation of the 1-based partition number.
- * 3) PARTUUID=<UUID>/PARTNROFF=<int> to select a partition in relation to
- *    a partition with a known unique id.
- * 4) <major>:<minor> major and minor number of the device separated by
- *    a colon.
+ * See Documentation/admin-guide/pstore-blk.rst for details.
  */
 static char blkdev[80] = CONFIG_PSTORE_BLK_BLKDEV;
 module_param_string(blkdev, blkdev, 80, 0400);
-- 
2.25.1

