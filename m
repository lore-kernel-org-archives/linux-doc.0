Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3F7A17D072
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Jul 2018 18:19:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932184AbeGHSTT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Jul 2018 14:19:19 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:51543 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932121AbeGHSTS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Jul 2018 14:19:18 -0400
Received: by mail-wm0-f65.google.com with SMTP id s12-v6so19016293wmc.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Jul 2018 11:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:openpgp:autocrypt:cc:subject:message-id:date:user-agent
         :mime-version:content-language:content-transfer-encoding;
        bh=EFANwacazJ/wQ8z9tYgpPX4G1vu3jyeTRcPeKCSHaaI=;
        b=Y/EhGYceJNPe99zy8M9k928fmHsDTr13DkUDZmJCaFcuNWhY2xFBpIN2LUXqmAU/Qp
         rSIL4c5Tis+XeC3cu6FxgSMXY8wv8H6Q5XoW5/KEX/nh0Y8zGF5/aeR4HGVgEs5LVHIj
         7D6kjIC3CBiLvGCPvmKPXoGDKhUugGoWcDYXZx/8dcMDgv7Wv7LBNWGuq1x420zHcpnG
         wNCJB2/3K1XDnKG0OxD7doX6TY+RdRlrb/+m8AdpE9CsmH7sCSSl/e+F709R+0MIWT2A
         5oWxR8HDItUftBe3g4AqqmXgTgR/+dY8ilCM6sOxYMd4OGmx1LyEgN2BMMF5L3s0+onj
         ul+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:from:openpgp:autocrypt:cc:subject:message-id
         :date:user-agent:mime-version:content-language
         :content-transfer-encoding;
        bh=EFANwacazJ/wQ8z9tYgpPX4G1vu3jyeTRcPeKCSHaaI=;
        b=OrlM6R0OjDH2DYawu1XsC2X5Dr7yaBnKZNa2SQwjlrPEn7j1gyhKaZGt2JBzcnz2Wk
         aTyQYfbsXaeR9w9YfgkDVvNrLN4D7j/fy1hp4rWk1S0SCHDEUrB0wpp8SLuw5DeuXb4p
         ea1Ozvdn1xveb0EZa01dNrbMnfo2Z/VSPlMZ/V18QCaDO4i+RVk/jiSesbeBXTWEflfN
         gu+Hm8XfchRxeCX+7Gkir1P4b8bojH1jiMLiz8q12Bnwyf0ooEgtaShIcl8PGFXH6dWS
         3yLd7tAMRb44bZi5KPhFuvVFLXu8cUf0JPB9vyRfU/JKytGZC4ZD5klUoKvykqIB6CE+
         Wsig==
X-Gm-Message-State: APt69E0LGoKyDhwjOGTml/8W6V1JqLOKgDu9u2/0qrj/kE9A9OtMdTGF
        Y3X4T9dI26/5fpjs/jrNdUA=
X-Google-Smtp-Source: AAOMgpevwwE2Urm4rPFjF5XJIWzJErH39Jni108l2iI7AOtH1d84gXx0ZAgQ6oaxN8gYozSf+xiYNw==
X-Received: by 2002:a1c:1182:: with SMTP id 124-v6mr10399391wmr.75.1531073957036;
        Sun, 08 Jul 2018 11:19:17 -0700 (PDT)
Received: from ?IPv6:2001:660:3203:402::a51? ([2001:660:3203:402::a51])
        by smtp.gmail.com with ESMTPSA id b7-v6sm16343144wme.39.2018.07.08.11.19.16
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Jul 2018 11:19:16 -0700 (PDT)
To:     corbet@lwn.net
From:   Yohan Pipereau <yohan.pipereau@gmail.com>
Openpgp: preference=signencrypt
Autocrypt: addr=yohan.pipereau@gmail.com; prefer-encrypt=mutual; keydata=
 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
 UqPUsoY=
Cc:     linux-doc@vger.kernel.org,
        Yohan Pipereau <yohan.pipereau@gmail.com>
Subject: [PATCH] Documentation : Update relay function types
Message-ID: <d8f47b2d-dd39-ba65-8c4e-149718aea5bf@gmail.com>
Date:   Sun, 8 Jul 2018 20:19:32 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: fr-classic
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch updates two callback functions provided as an example in
relay API documentation : subbuf_start and create_buf_file_handler.

These functions were using older and incorrect types causing an
"initialization from incompatible pointer type".

diffstat for this patch is:
 relay.txt |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)


Signed-off-by: Yohan Pipereau <yohan.pipereau@gmail.com>
---

diff --git a/Documentation/filesystems/relay.txt
b/Documentation/filesystems/relay.txt
index 33e2f3694733..cd709a94d054 100644
--- a/Documentation/filesystems/relay.txt
+++ b/Documentation/filesystems/relay.txt
@@ -222,7 +222,7 @@ using debugfs:
  */
 static struct dentry *create_buf_file_handler(const char *filename,
                                               struct dentry *parent,
-                                              int mode,
+                                              umode_t mode,
                                               struct rchan_buf *buf,
                                               int *is_global)
 {
@@ -375,7 +375,7 @@ would be very similar:
 static int subbuf_start(struct rchan_buf *buf,
                         void *subbuf,
 			void *prev_subbuf,
-			unsigned int prev_padding)
+			size_t prev_padding)
 {
 	if (prev_subbuf)
 		*((unsigned *)prev_subbuf) = prev_padding;
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
