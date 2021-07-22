Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,HK_RANDOM_FROM,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A6D4AC63798
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1149D61370
	for <linux-doc@archiver.kernel.org>; Thu, 22 Jul 2021 10:04:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231881AbhGVJYD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 22 Jul 2021 05:24:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231878AbhGVJXy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 22 Jul 2021 05:23:54 -0400
Received: from mail-ej1-x629.google.com (mail-ej1-x629.google.com [IPv6:2a00:1450:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9D7C0613D5
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:04:00 -0700 (PDT)
Received: by mail-ej1-x629.google.com with SMTP id dp20so7541346ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 22 Jul 2021 03:04:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7UHu1p6xj5rCmWJit3UBIseHo1ciZm+Nd44GyA9ocE0=;
        b=QjoULmv/YbrzYPh4n9vEZ4cclkzYkHyG8HOq8+kcvM6AnIgnTxxXT88ONmbo6l2sc/
         8kh2iehQCl4lKvpKC+NsPrjMMaWh3XoAU5smitHdheQpBccRo1Uh4I+F4QWWhGcXMlkU
         DfamAmVWuzwdZQ/5g+McBUoaV6yjCdWPoJyjxO1ahPygXYGyIqItf4glRiSvUiEFL4CG
         tuQNBICYepE3vIyQvlhbzNg+zRWFJLdsXTo0yECphIdCGk4ovk//9SG20sCuaz7kvIw4
         H1ZCtele09hamtbKWeMt/6iyWK6fsxUj8UGEgmhvjAf8yR3Vv1GLViAHxMmtY/CPtkTK
         xpWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7UHu1p6xj5rCmWJit3UBIseHo1ciZm+Nd44GyA9ocE0=;
        b=toXfmqxfYVXuIrRJhW06WSTAZi2BpTCeyahmVp0Rp7ozDbTwxyYUE7n04G9DFQnq23
         soy2kG5+iuR12RoM/N25ja3GSrLEnHwT6PB+MTn8toUrkZfD6KrBAoCDNd7k15vjpJMG
         4YnaQMOlVQLjEXV9Mhaj7KeIenOjXAiyF5uKiKr22f5U9EaNh2P6FqO/8jjBNGAvRJ+c
         nQ1KMKQaifC8wCsbpkiZz5IBItcOpnGg5acHeyS+boqczizDDcDKwv/E7nM5JUuHeBZJ
         4DMkLGEAZcxBhr8F7oVEaQRwW/ecY8w9ixRDvr7QX+Q3CrFpBcVa2HVwcjVMUUYeYpr0
         Cfhg==
X-Gm-Message-State: AOAM532/F4brtU58RGg957AWau5Q6CLjjIfQ28x5tBFbE4VtUw6ayXuc
        EmC+LP74CB8/IWFomvxPvMc=
X-Google-Smtp-Source: ABdhPJx/WeTOu1me0iNYJdCyGtv30jhG70wgy54yXaKAeVabL36KVMrZkwEQQLE4TJoAVCVjsjdRxw==
X-Received: by 2002:a17:906:3c14:: with SMTP id h20mr42996519ejg.176.1626948238857;
        Thu, 22 Jul 2021 03:03:58 -0700 (PDT)
Received: from yoga-910.localhost ([82.76.66.29])
        by smtp.gmail.com with ESMTPSA id cb4sm9341749ejb.72.2021.07.22.03.03.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jul 2021 03:03:58 -0700 (PDT)
From:   Ioana Ciornei <ciorneiioana@gmail.com>
To:     Jonathan Corbet <corbet@lwn.net>, Petr Mladek <pmladek@suse.com>,
        Steven Rostedt <rostedt@goodmis.org>
Cc:     linux-doc@vger.kernel.org, Stephen Boyd <swboyd@chromium.org>,
        Maxim Levitsky <mlevitsk@redhat.com>,
        Jing Zhang <jingzhangos@google.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>
Subject: [PATCH 3/4] docs: kvm: properly format code blocks and lists
Date:   Thu, 22 Jul 2021 13:03:55 +0300
Message-Id: <20210722100356.635078-4-ciorneiioana@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210722100356.635078-1-ciorneiioana@gmail.com>
References: <20210722100356.635078-1-ciorneiioana@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Ioana Ciornei <ioana.ciornei@nxp.com>

Add a '::' so that a code block is interpreted properly and also add a
blank line before the start of a list.

Fixes: fdc09ddd4064 ("KVM: stats: Add documentation for binary statistics interface")
Signed-off-by: Ioana Ciornei <ioana.ciornei@nxp.com>
---
 Documentation/virt/kvm/api.rst | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
index 535ac0efd1b0..c8225466f379 100644
--- a/Documentation/virt/kvm/api.rst
+++ b/Documentation/virt/kvm/api.rst
@@ -5201,6 +5201,7 @@ trailing ``'\0'``, is indicated by the ``name_size`` field in the header.
 The descriptors block is only needed to be read once for the lifetime of the
 file descriptor contains a sequence of ``struct kvm_stats_desc``, each followed
 by a string of size ``name_size``.
+::
 
 	#define KVM_STATS_TYPE_SHIFT		0
 	#define KVM_STATS_TYPE_MASK		(0xF << KVM_STATS_TYPE_SHIFT)
@@ -5234,6 +5235,7 @@ by this descriptor. Its endianness is CPU native.
 The following flags are supported:
 
 Bits 0-3 of ``flags`` encode the type:
+
   * ``KVM_STATS_TYPE_CUMULATIVE``
     The statistics data is cumulative. The value of data can only be increased.
     Most of the counters used in KVM are of this type.
@@ -5252,6 +5254,7 @@ Bits 0-3 of ``flags`` encode the type:
     The corresponding ``size`` field for this type is always 1.
 
 Bits 4-7 of ``flags`` encode the unit:
+
   * ``KVM_STATS_UNIT_NONE``
     There is no unit for the value of statistics data. This usually means that
     the value is a simple counter of an event.
@@ -5266,6 +5269,7 @@ Bits 4-7 of ``flags`` encode the unit:
 
 Bits 8-11 of ``flags``, together with ``exponent``, encode the scale of the
 unit:
+
   * ``KVM_STATS_BASE_POW10``
     The scale is based on power of 10. It is used for measurement of time and
     CPU clock cycles.  For example, an exponent of -9 can be used with
-- 
2.31.1

