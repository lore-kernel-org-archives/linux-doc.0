Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 719D97D071
	for <lwn-linux-doc@archive.lwn.net>; Fri, 13 Jul 2018 01:31:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387931AbeGMBoE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 12 Jul 2018 21:44:04 -0400
Received: from mail-oi0-f50.google.com ([209.85.218.50]:35257 "EHLO
        mail-oi0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387923AbeGMBoE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 Jul 2018 21:44:04 -0400
Received: by mail-oi0-f50.google.com with SMTP id i12-v6so59387183oik.2
        for <linux-doc@vger.kernel.org>; Thu, 12 Jul 2018 18:31:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kent-edu.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to;
        bh=4L+FvtfAtsriWQPhgh/lj6hp7cX6qeZwB1eNp8IOFY0=;
        b=U46SYUBWXXXerapaRAP2foFnbc19pFlzwUxo5qnVpjVOTcRa8oZelc879Nvk5nBG1B
         eA5ynZ8v8XXDZS9qmIy+qgckKalNqlBhBougqL8oAKGQFc8EoTzZzgA4zl6X3hd/Jili
         D0iIgRZU5fVgo2vCZo/RSCDbWsM8gWvNsp5kDvXciKi92F+AkFT5xaWORL/uqFT+Jdl5
         RPLYOlDvQ5rtxvp7euNkBFSiJLjcILOsKRcJAueAUWVd80EoTTw4wItIEd/XMfLnj5Qp
         vvQuOwpvuBI2Cb/SXLMJhMX4CqEyRzQ8R1ps/4qmwmrCj2raR+S9PDrHsJE2EzEG2aMy
         upRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=4L+FvtfAtsriWQPhgh/lj6hp7cX6qeZwB1eNp8IOFY0=;
        b=PZ8JBmSmAPHkc/WxvfcezVCMavplX5hbKwB1rDH5QTlu0VYVIMZHub3yFl0nrTOxLr
         bLvuLuWVkSHoax0LTQPgi9LX0xjr7mzfJZL43dF8LuonUiZvw9fCP/FIoTY9ZGp3hG0O
         dcgFpEW+N5mdQ9D24yr0gSn/WquxRdAqtAvxZPKdIsotlQWkvjDKCnMl83Utgdgr/rhj
         MgmfhXO4CR4ncWUTKAAgjZIF+2jtOxMEeVHAPMaajxfexK2WdQ7UbBSTa0AwD6OjpjEa
         bXTRRfZgEeUZSUKxQJYI9IY/5JyjTsv7nPguxl70/Oz2X0R+9W3gPBtzBYkLBRQIIANe
         dabA==
X-Gm-Message-State: AOUpUlEvJglleNwcp7twKRHeL3gr7Yin+4fdFWFgfrc2ek+RLYZn41cr
        kKSj3LHu2/9F2ey5d2Dcp+tr9OdmutsipB4muiJDaIvQ
X-Google-Smtp-Source: AAOMgpfqNjmzw5FbDQgZ7hVV/bsb+zw1BsrVMcU/FT1rJHWV2CrevEoH7Wa7O5tNIhu2xb77Y/hn/x4DAmazm5dgPX8=
X-Received: by 2002:aca:c00b:: with SMTP id q11-v6mr4575598oif.330.1531445510738;
 Thu, 12 Jul 2018 18:31:50 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a9d:ce2:0:0:0:0:0 with HTTP; Thu, 12 Jul 2018 18:31:50 -0700 (PDT)
From:   "Md. Islam" <mislam4@kent.edu>
Date:   Thu, 12 Jul 2018 21:31:50 -0400
Message-ID: <CAFgPn1BPQ2jSbF7cEgdk+0hkKDEUnNmQ_bkhL0-mA_SneVmD-Q@mail.gmail.com>
Subject: [patch] printk format for u16 and u8
To:     linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

diff --git a/Documentation/printk-formats.txt b/Documentation/printk-formats.txt
index 361789d..d878079 100644
--- a/Documentation/printk-formats.txt
+++ b/Documentation/printk-formats.txt
@@ -14,6 +14,7 @@ Integer types
     If variable is of Type,        use printk format specifier:
     ------------------------------------------------------------
         int            %d or %x
+        unsigned short        %d or %x
         unsigned int        %u or %x
         long            %ld or %lx
         unsigned long        %lu or %lx
@@ -22,6 +23,8 @@ Integer types
         size_t            %zu or %zx
         ssize_t            %zd or %zx
         s32            %d or %x
+        u8            %d or %x
+        u16            %d or %x
         u32            %u or %x
         s64            %lld or %llx
         u64            %llu or %llx

Could you please let me know if it makes sense?

Thanks
Tamim
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
