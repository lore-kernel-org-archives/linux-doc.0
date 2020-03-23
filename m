Return-Path: <SRS0=kJSq=5I=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA2A2C4332B
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 23:22:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9F02B20719
	for <linux-doc@archiver.kernel.org>; Mon, 23 Mar 2020 23:22:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KkVzm046"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727032AbgCWXWZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 23 Mar 2020 19:22:25 -0400
Received: from mail-vk1-f201.google.com ([209.85.221.201]:45488 "EHLO
        mail-vk1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725990AbgCWXWZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 23 Mar 2020 19:22:25 -0400
Received: by mail-vk1-f201.google.com with SMTP id j68so5844750vkj.12
        for <linux-doc@vger.kernel.org>; Mon, 23 Mar 2020 16:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=date:message-id:mime-version:subject:from:to:cc;
        bh=nGAFHlfBd3e/4DpEoxTJ41Z972i/CI0Z5FKhkiHor+U=;
        b=KkVzm0461yU6p8JLPw5BdoWxzunch2vLEcP54K5QZvsLM4QoavKN+hEQuBLXUZlmd8
         6y1ZQrF318g9bGJkcYAo3JjgjZwIh7/5zTFX8r7ZTNLHmekAAY+NLyZVPp/fBWEHPzI8
         F36WcYCv4PNE9M2wNe6yEni6hoT0UiB6CoCXBV+YYjezYkDJRKQLf8kFLyoJZzVnbhtf
         Az7Lh4RV8yf8M821Z8dWCJcAjiGmb4JeiM7KCafgK2JjhOTg+PBY3KtGO3gm/Fy46KUL
         kkYHU9VbxZ2TT3+qkvTSei9kIe/XRbm4ydvwomJ2LbpBP6pkJKhuYp8a/naTLHheYtFc
         U62g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
        bh=nGAFHlfBd3e/4DpEoxTJ41Z972i/CI0Z5FKhkiHor+U=;
        b=R2f9usXttjacjqrDZpTTxmB4NS3bXDbgSI+sldaVG0gOchrTMmh4seqPxVpk6IT60V
         HOUIh5NQ785kiH7y9REENuJRSQrhFrwWT5N0ffqu2uzPCNSAIrAzmNDWxTCVLKaPHQJt
         jV2LANdn7vOGP9/tU37gvVNHOHpWHFoFBpcQI994duF8R0F461cYjVThlTPGTV3dYRPq
         ywErKUqxuBEchB4Lk9p6JId1W1XWy9g276L0C77ZN475Z1cOYbnsyI8f7mQSEPZNd1QQ
         0nWoBHTEGTzy2k+UIeWeL2SLJxoZvPIraAUFZu8iew+EvQvy7wslIcU4iEvouZtw7DLp
         DXJg==
X-Gm-Message-State: ANhLgQ2TGG/KaYfwNowwGgPxyiEwYmCwfGQasHCSpZClC6RLj4Rl12Ye
        k8LrGGsSF5T/ydmuBzMNliUhrNnL3mIMWZ+cYtk=
X-Google-Smtp-Source: ADFU+vskvFj1HOnGYXk4svHJcctnmJs6/MIQ4hjyv2RxvzqHxMbJ2FfebvZdnvXto9grRKUnfRyaGkZMqTTYZmCxue4=
X-Received: by 2002:ab0:2553:: with SMTP id l19mr5446513uan.128.1585005742543;
 Mon, 23 Mar 2020 16:22:22 -0700 (PDT)
Date:   Mon, 23 Mar 2020 16:22:14 -0700
Message-Id: <20200323232214.24939-1-ndesaulniers@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.25.1.696.g5e7596f4ac-goog
Subject: [PATCH] Documentation: x86: exception-tables: document CONFIG_BUILDTIME_TABLE_SORT
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     corbet@lwn.net
Cc:     Nick Desaulniers <ndesaulniers@google.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provide more information about __ex_table sorting post link.

The exception tables and fixup tables use a commonly recurring pattern
in the kernel of storing the address of labels as date in custom ELF
sections, then finding these sections, iterating elements within them,
and possibly revisiting them or modifying the data at these addresses.

Sorting readonly arrays to minimize runtime penalties is quite clever.

Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
---
 Documentation/x86/exception-tables.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/x86/exception-tables.rst b/Documentation/x86/exception-tables.rst
index ed6d4b0cf62c..15455b2f7ba8 100644
--- a/Documentation/x86/exception-tables.rst
+++ b/Documentation/x86/exception-tables.rst
@@ -257,6 +257,9 @@ the fault, in our case the actual value is c0199ff5:
 the original assembly code: > 3:      movl $-14,%eax
 and linked in vmlinux     : > c0199ff5 <.fixup+10b5> movl   $0xfffffff2,%eax
 
+If the fixup was able to handle the exception, control flow may be returned
+to the instruction after the one that triggered the fault, ie. local label 2b.
+
 The assembly code::
 
  > .section __ex_table,"a"
@@ -344,3 +347,9 @@ pointer which points to one of:
      it as special.
 
 More functions can easily be added.
+
+CONFIG_BUILDTIME_TABLE_SORT allows the __ex_table section to be sorted post
+link of the kernel image, via a host utility scripts/sorttable. It will set the
+symbol main_extable_sort_needed to 0, avoiding sorting the __ex_table section
+at boot time. With the exception table sorted, at runtime when an exception
+occurs we can quickly lookup the __ex_table entry via binary search.
-- 
2.25.1.696.g5e7596f4ac-goog

