Return-Path: <SRS0=s6Rs=ZN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CDC60C43215
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 20:59:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A4E8820672
	for <linux-doc@archiver.kernel.org>; Thu, 21 Nov 2019 20:59:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f/yitGOm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727008AbfKUU7e (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 21 Nov 2019 15:59:34 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:43621 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbfKUU7d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 21 Nov 2019 15:59:33 -0500
Received: by mail-pg1-f193.google.com with SMTP id b1so2229141pgq.10
        for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2019 12:59:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=8Oee3vw8WRriKUoe5bSDCmHamPjslpnmApMeu92EjOg=;
        b=f/yitGOmaX1zVyf8c9dnjx1HQ0qr34w/JLsFbCb0RzFmfXL8vdk+ZDfAVW+GG2CxFr
         gPs208G9vnH8kUUxhpv4iW3DRbhVF/MU9iIgqExyDU0pW+KfXk18RsptF8ZEaIr2FJ22
         dPlXj0aJkD2/blKkCxO5n76q6ZOebV6QRErZI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8Oee3vw8WRriKUoe5bSDCmHamPjslpnmApMeu92EjOg=;
        b=XLuVsYKNIN3gEQVIcW+E2zQQ9263moTTHZkogMoCnXfcxiMUIOYFw13teHG7D3MvZG
         A3sqIxNVZYxD0Q50T1PI4n3uwh4OV/irfZmqYfanX4ZLWPN4akYt5djR4+tkU8SNJJQS
         PEdpUBi7KCSIRxyVwY3P7LozbjXIkI8FWlX97tUfb21el2aoN4eWtEjPGYI1hv8ZPnUk
         UIbDcISpStflV2Ei+0EIq72ZFXdCH9LS7Ws1ZBux6lXD5LE+8rk4sPHdrJ3m6sm1V4ap
         k9WIDvdaVwKaI0J9wjbMfw4mO02BChvtBHz9577nPUUhQIk3SfKoGs1amUv5rLOtwJHm
         cghA==
X-Gm-Message-State: APjAAAWnWGovilGy/oghJHqplANDoevec++FBpPk/nlAwk14jI3bPzQc
        f3W0M2j88P317WX39qJlpMN4SQ==
X-Google-Smtp-Source: APXvYqwL0OXmzN8/bfX694dBzdWxuxxtGXMPFhfm81eIowKKqapauOLMdkt26IfydJnmN7bOoWrzWg==
X-Received: by 2002:a62:2bc1:: with SMTP id r184mr13133526pfr.88.1574369973119;
        Thu, 21 Nov 2019 12:59:33 -0800 (PST)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id r13sm4658805pfg.3.2019.11.21.12.59.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2019 12:59:31 -0800 (PST)
From:   Kees Cook <keescook@chromium.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Kees Cook <keescook@chromium.org>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 0/3] docs, parallelism: Rearrange how jobserver reservations are made
Date:   Thu, 21 Nov 2019 12:59:26 -0800
Message-Id: <20191121205929.40371-1-keescook@chromium.org>
X-Mailer: git-send-email 2.17.1
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

v2:
    - correct comments and commit logs (rasmus)
    - handle non-parallel mode more cleanly (rasmus)
    - reserve slots 8 at a time (rasmus)
v1: https://lore.kernel.org/lkml/20191121000304.48829-1-keescook@chromium.org

Hi,

As Rasmus noted[1], there were some deficiencies in how the Make jobserver
vs sphinx parallelism logic was handled. This series attempts to address
all those problems by building a set of wrappers and fixing some of the
internal logic.

Thank you Rasmus for the suggestions (and the "jobhog" example)! :)

-Kees

[1] https://lore.kernel.org/lkml/eb25959a-9ec4-3530-2031-d9d716b40b20@rasmusvillemoes.dk

Kees Cook (3):
  docs, parallelism: Fix failure path and add comment
  docs, parallelism: Do not leak blocking mode to other readers
  docs, parallelism: Rearrange how jobserver reservations are made

 Documentation/Makefile                   |  5 +-
 Documentation/sphinx/parallel-wrapper.sh | 33 ++++++++++++
 scripts/jobserver-count                  | 58 ---------------------
 scripts/jobserver-exec                   | 66 ++++++++++++++++++++++++
 4 files changed, 101 insertions(+), 61 deletions(-)
 create mode 100644 Documentation/sphinx/parallel-wrapper.sh
 delete mode 100755 scripts/jobserver-count
 create mode 100755 scripts/jobserver-exec

-- 
2.17.1

