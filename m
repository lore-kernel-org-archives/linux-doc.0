Return-Path: <SRS0=GARK=DU=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC82DC43457
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7BEDD20870
	for <linux-doc@archiver.kernel.org>; Tue, 13 Oct 2020 11:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602590192;
	bh=gUMKHRsSkag9sGYAdZZcK6zac528ogHWJuf9idLgph4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:List-ID:From;
	b=yrOuyfaMNcFZX/4YvsdlmWj0JV7Xt4Q11lxbMI8EMXctnnZrnxpdbRvSieeWNGncj
	 nVHtNRVG1WwKI1svDxIcrAfA28zT4fgdo6Y827loH/FAEC2ivCgvjtltzP6Zw22N9Z
	 3BL5RqPGobNtSV8nY3+/KEAS9s8p6pCoWaf/na8A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728027AbgJML4b (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 13 Oct 2020 07:56:31 -0400
Received: from mail.kernel.org ([198.145.29.99]:57316 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727672AbgJMLyt (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 13 Oct 2020 07:54:49 -0400
Received: from mail.kernel.org (ip5f5ad5b2.dynamic.kabel-deutschland.de [95.90.213.178])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 57E6A22516;
        Tue, 13 Oct 2020 11:54:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602590081;
        bh=gUMKHRsSkag9sGYAdZZcK6zac528ogHWJuf9idLgph4=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=KygGyN5/T/VrOraBm9PVX/Rew/iopn7Ge74qXc2IS9X36R3B5T7AoXF9wDdcTYG/q
         pXoOreXxcuis3tkGscWMyqLyYG4TBYONi9K1CRP+hVC473hAtVkN5M5CswuOWw0DKP
         +/sNdjAT4ptzAWD7ssN4Sj1KK4j/hzVCb+vDq2bo=
Received: from mchehab by mail.kernel.org with local (Exim 4.94)
        (envelope-from <mchehab@kernel.org>)
        id 1kSIt5-006CVj-80; Tue, 13 Oct 2020 13:54:39 +0200
From:   Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        "Jonathan Corbet" <corbet@lwn.net>,
        Chunyan Zhang <chunyan.zhang@unisoc.com>,
        Oleg Nesterov <oleg@redhat.com>,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Vincenzo Frascino <vincenzo.frascino@arm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH v6 54/80] math64.h: kernel-docs: Convert some markups into normal comments
Date:   Tue, 13 Oct 2020 13:54:09 +0200
Message-Id: <e9369abdb1bd5b43f86d93d7542805c2898cb5aa.1602589096.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <cover.1602589096.git.mchehab+huawei@kernel.org>
References: <cover.1602589096.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There are several functions at math64.h that are also
defined at div64.c. As both are included at kernel-api.rst,
Sphinx 3.x complains about symbol duplication:

	./lib/math/div64.c:73: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'div_s64_rem'.
	./lib/math/div64.c:104: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'div64_u64_rem'.
	./lib/math/div64.c:144: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'div64_u64'.
	./lib/math/div64.c:172: WARNING: Duplicate C declaration, also defined in 'core-api/kernel-api'.
	Declaration is 'div64_s64'.

In order to avoid Sphinx warnings about duplication, change the kernel-doc
markups to just comments at math64.h.

Reviewed-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 include/linux/math64.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 3381d9e33c4e..66deb1fdc2ef 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -28,7 +28,7 @@ static inline u64 div_u64_rem(u64 dividend, u32 divisor, u32 *remainder)
 	return dividend / divisor;
 }
 
-/**
+/*
  * div_s64_rem - signed 64bit divide with 32bit divisor with remainder
  * @dividend: signed 64bit dividend
  * @divisor: signed 32bit divisor
@@ -42,7 +42,7 @@ static inline s64 div_s64_rem(s64 dividend, s32 divisor, s32 *remainder)
 	return dividend / divisor;
 }
 
-/**
+/*
  * div64_u64_rem - unsigned 64bit divide with 64bit divisor and remainder
  * @dividend: unsigned 64bit dividend
  * @divisor: unsigned 64bit divisor
@@ -56,7 +56,7 @@ static inline u64 div64_u64_rem(u64 dividend, u64 divisor, u64 *remainder)
 	return dividend / divisor;
 }
 
-/**
+/*
  * div64_u64 - unsigned 64bit divide with 64bit divisor
  * @dividend: unsigned 64bit dividend
  * @divisor: unsigned 64bit divisor
@@ -68,7 +68,7 @@ static inline u64 div64_u64(u64 dividend, u64 divisor)
 	return dividend / divisor;
 }
 
-/**
+/*
  * div64_s64 - signed 64bit divide with 64bit divisor
  * @dividend: signed 64bit dividend
  * @divisor: signed 64bit divisor
-- 
2.26.2

