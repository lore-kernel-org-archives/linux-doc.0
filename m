Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 41FD8C64EC4
	for <linux-doc@archiver.kernel.org>; Fri, 17 Feb 2023 13:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229585AbjBQNpm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 17 Feb 2023 08:45:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39776 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229669AbjBQNpZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 17 Feb 2023 08:45:25 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52733126C5
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:44:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1676641483;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=ysk0aOdzp2igGOtHeZoTd2E71aY9qQ/NU2yUGbV3q7I=;
        b=PMCDPjjTA/rrNGC4Vylab7IVxFwRiyFhD8G72minNrGtbNkC3/7L1zKz41lIALSi7RaCJF
        V88vnFD2EJdvIo8nsmfj4TXP4dj9BytB9FjNLzSHF+s/hS6X0Hkcxs+b/RdH0JFTxySc+e
        ZufSTYlUEtWXTZeOcSVQAZOC0N1ui7o=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-137-g6AAgwzwMTmMWfZ1PWln0A-1; Fri, 17 Feb 2023 08:44:42 -0500
X-MC-Unique: g6AAgwzwMTmMWfZ1PWln0A-1
Received: by mail-ed1-f69.google.com with SMTP id b16-20020a056402351000b004ace77022ebso1899931edd.8
        for <linux-doc@vger.kernel.org>; Fri, 17 Feb 2023 05:44:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ysk0aOdzp2igGOtHeZoTd2E71aY9qQ/NU2yUGbV3q7I=;
        b=0rdh5AFIPPI+S7WmjdvuGNH/Q4pPIUz9Sh0m3GahM6qyb+9K2aweSMHsTz6c+DgbAX
         CDyqH4NH4dEn2QcndruRkmi4fwgshpZeXLbPQLWg9pR0AOYeEK/hVHYNb9WNplVJZpsc
         KMgKJtaXvrLzsLT5m+AmQUK9J8Zfw/ssfYURyAwfdyBPdCGGybZlE64+rtkmj3W3Ufyc
         EvdXWI5dLk4x4h3QyhfTY9elB5kJlI5p0g9afisKWLGwANrrzSpRADBFEFPATY7pLpiL
         gKuFcTkHwOrLYrhfrkuf3Igb7J1/q6RmX20nr4zdcwf0OZXF3KJX2dJUjhbni+F+HBhu
         w9IQ==
X-Gm-Message-State: AO0yUKWpEvMS5tsjHT+eKgg4DH+Gg4h++vwhoMsmzzBNUZbCeRYawHHB
        SS76yVyhAH1igr8OWLsoyP4kiHvlbw+KXjtB3/RmMF/mo6Rtm4z+7LTX5OUiiwi9n5Nnc4jY2An
        qukQ3SONR1j0D+b1/Rvm0
X-Received: by 2002:a17:907:d309:b0:8b1:2dda:b60d with SMTP id vg9-20020a170907d30900b008b12ddab60dmr5401604ejc.20.1676641481150;
        Fri, 17 Feb 2023 05:44:41 -0800 (PST)
X-Google-Smtp-Source: AK7set+xPQs4iBYRE3EkYeswx89ncoFpP13u/wl+vaRpLe0EqlVsAKT/Yi78czFv33gb2ohWXHgOKA==
X-Received: by 2002:a17:907:d309:b0:8b1:2dda:b60d with SMTP id vg9-20020a170907d30900b008b12ddab60dmr5401592ejc.20.1676641481019;
        Fri, 17 Feb 2023 05:44:41 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id r10-20020a1709063d6a00b00882f9130eafsm2167138ejf.26.2023.02.17.05.44.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Feb 2023 05:44:40 -0800 (PST)
From:   Danilo Krummrich <dakr@redhat.com>
To:     airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
        mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
        bskeggs@redhat.com, Liam.Howlett@oracle.com,
        matthew.brost@intel.com, boris.brezillon@collabora.com,
        alexdeucher@gmail.com, ogabbay@kernel.org, bagasdotme@gmail.com,
        willy@infradead.org, jason@jlekstrand.net
Cc:     dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
        linux-doc@vger.kernel.org, linux-mm@kvack.org,
        linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@redhat.com>
Subject: [PATCH drm-next v2 03/16] maple_tree: split up MA_STATE() macro
Date:   Fri, 17 Feb 2023 14:44:09 +0100
Message-Id: <20230217134422.14116-4-dakr@redhat.com>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230217134422.14116-1-dakr@redhat.com>
References: <20230217134422.14116-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Split up the MA_STATE() macro such that components using the maple tree
can easily inherit from struct ma_state and build custom tree walk
macros to hide their internals from users.

Example:

struct sample_iter {
	struct ma_state mas;
	struct sample_mgr *mgr;
	struct sample_entry *entry;
};

\#define SAMPLE_ITER(name, __mgr) \
	struct sample_iter name = { \
		.mas = __MA_STATE(&(__mgr)->mt, 0, 0),
		.mgr = __mgr,
		.entry = NULL,
	}

\#define sample_iter_for_each_range(it__, start__, end__) \
	for ((it__).mas.index = start__, (it__).entry = mas_find(&(it__).mas, end__ - 1); \
	     (it__).entry; (it__).entry = mas_find(&(it__).mas, end__ - 1))

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index e594db58a0f1..ca04c900e51a 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -424,8 +424,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define __MA_STATE(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.alloc = NULL,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = __MA_STATE(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.39.1

