Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6D4B07E679
	for <lwn-linux-doc@archive.lwn.net>; Thu,  3 May 2018 14:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751507AbeECOQn (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 3 May 2018 10:16:43 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:36847 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751283AbeECOP7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 3 May 2018 10:15:59 -0400
Received: by mail-wr0-f194.google.com with SMTP id f2-v6so5983801wrm.3
        for <linux-doc@vger.kernel.org>; Thu, 03 May 2018 07:15:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :in-reply-to:references;
        bh=M5UHAvrtR5/eJhShSI1YJ0Xmi/BIFkhr39NHkoB1ybI=;
        b=dbEUj9y/d9revilF41htY8tL8vfwOjD+LyR/3xiYiL8nDwFb2RNFx2jhSzefyIce59
         cIyLKeIWW/ckQvWDsWbeNgvU9t6S4MGX6eYo8jWEdYCAV2tfTxNF9CkCtm+4yCU+inLO
         65DK88iaqemjOrBBYUBVguEp/xBraRAi1EAUxlkhRzh2SQUp6zywAB6o3Hak2NXju22a
         LadHnLSttfkzETN1Pn4COb9e92lFiW5MK7NXaY38UjJPHfVXK3zvmwrXH2g0kz+HvXml
         LNLCtKWzJ7wMhh+1qMRqKsLk/in9sKyd3gQkQWEmnuX+mPO/beUGcFeyr4tPb4/rpvPv
         nDVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:in-reply-to:references;
        bh=M5UHAvrtR5/eJhShSI1YJ0Xmi/BIFkhr39NHkoB1ybI=;
        b=oTN24dMDnk/KlM3UN7PhgV8/RUICKOkScorEgvWuZuks+CNTFucSPqX8W3iy9uA5/e
         NNXBYEenEglqmi4A4X6lJc0as5YhxEc4DipngcF3PL98exDuEPAzydAU5ycJrELyg9r0
         dYKaZ/07HfTAkGDYuf6sxOxOkXlRLgO0fQjk0IhciPB8WrkjG3taevAg4lL4PwSDZKUa
         h+74EHVkuATbZ6jJ/mkn8JDNHGYolAAeKm2m5j2VAO6SHgUaNxKTJKwyVmIKZntznaVy
         8/rcMXx67yz+n0+u5Uf2fAQRw8B9fbJMNw79SnmDLyxKe2wCPJo8HxgGUoTklXosYlD1
         Io4g==
X-Gm-Message-State: ALQs6tCJVYkXCb9Vj5drawBmPGYhKlGpGGHyjc73enhW//ryReSy0X8r
        2atJCYrc6jCU2eTbZVO+6NbAjQ==
X-Google-Smtp-Source: AB8JxZrtgvBbu51uuNOrM930KRxctyDs8aDRqxQKJDoQnvKSatdZ45lFj+2+C4ayBT0TuQT8vva3KA==
X-Received: by 2002:adf:c3cd:: with SMTP id d13-v6mr14198496wrg.282.1525356957822;
        Thu, 03 May 2018 07:15:57 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id u20-v6sm22090298wru.33.2018.05.03.07.15.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 03 May 2018 07:15:56 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mark Rutland <mark.rutland@arm.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Andrey Konovalov <andreyknvl@google.com>,
        James Morse <james.morse@arm.com>,
        Kees Cook <keescook@chromium.org>,
        Bart Van Assche <bart.vanassche@wdc.com>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Ingo Molnar <mingo@kernel.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        "Aneesh Kumar K . V" <aneesh.kumar@linux.vnet.ibm.com>,
        Zi Yan <zi.yan@cs.rutgers.edu>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Cc:     Dmitry Vyukov <dvyukov@google.com>,
        Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Chintan Pandya <cpandya@codeaurora.org>
Subject: [PATCH v2 5/6] lib, arm64: untag addrs passed to strncpy_from_user and strnlen_user
Date:   Thu,  3 May 2018 16:15:43 +0200
Message-Id: <98e18e4ca8e40bb8e7ea8e622833ce9123207e1e.1525356769.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.17.0.441.gb46fe60e1d-goog
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
In-Reply-To: <cover.1525356769.git.andreyknvl@google.com>
References: <cover.1525356769.git.andreyknvl@google.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

strncpy_from_user and strnlen_user accept user addresses as arguments, and
do not go through the same path as copy_from_user and others, so here we
need to handle the case of tagged user addresses separately.

Untag user pointers passed to these functions.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 lib/strncpy_from_user.c | 2 ++
 lib/strnlen_user.c      | 2 ++
 2 files changed, 4 insertions(+)

diff --git a/lib/strncpy_from_user.c b/lib/strncpy_from_user.c
index b53e1b5d80f4..97467cd2bc59 100644
--- a/lib/strncpy_from_user.c
+++ b/lib/strncpy_from_user.c
@@ -106,6 +106,8 @@ long strncpy_from_user(char *dst, const char __user *src, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	src = untagged_addr(src);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)src;
 	if (likely(src_addr < max_addr)) {
diff --git a/lib/strnlen_user.c b/lib/strnlen_user.c
index 60d0bbda8f5e..8b5f56466e00 100644
--- a/lib/strnlen_user.c
+++ b/lib/strnlen_user.c
@@ -108,6 +108,8 @@ long strnlen_user(const char __user *str, long count)
 	if (unlikely(count <= 0))
 		return 0;
 
+	str = untagged_addr(str);
+
 	max_addr = user_addr_max();
 	src_addr = (unsigned long)str;
 	if (likely(src_addr < max_addr)) {
-- 
2.17.0.441.gb46fe60e1d-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
