Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 303ECEB64D9
	for <linux-doc@archiver.kernel.org>; Tue, 20 Jun 2023 00:43:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229699AbjFTAnQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 19 Jun 2023 20:43:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbjFTAnP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 19 Jun 2023 20:43:15 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8580810C2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:42:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1687221756;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=C9apoWPgHQ+HttjrVOmvMmvBAGzRpC/qILH8eE4EO5c=;
        b=SflrllJCClIuWKYrZsEM01Q2Z0OHgt6T6f2W/3RBC+l4g0iD5I/060vtexSWkPPr/WV+2B
        GuhQquTLdahkz8cYUYWVaxnD2L3DhHwgOjtuCr1RxPYxl6542Y23IPYPstd6qFNpUjoV9Z
        yfeYdq6mfLeqq0Jh4uu5BKOZemW82hg=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-443-ESQbQOMQO0yQLef9DvQ7vg-1; Mon, 19 Jun 2023 20:42:35 -0400
X-MC-Unique: ESQbQOMQO0yQLef9DvQ7vg-1
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-982180ac15cso320276666b.2
        for <linux-doc@vger.kernel.org>; Mon, 19 Jun 2023 17:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687221754; x=1689813754;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C9apoWPgHQ+HttjrVOmvMmvBAGzRpC/qILH8eE4EO5c=;
        b=MgQx0u1KZ0KlpEOfAhkvemftGLQLdLIdizUiREx/EjRYCboDn0XnsKdxAiDgr1+Lnn
         J2TcZPQ0S6WDOZLn2O2D0bhMgkvLsqzIeXQBxlF8EJvrjZxKNlkN/y8WI4/30+wgvSSJ
         lm7h7MZh16uKv5v13zdhrNm2T1U4BVvuWWzGri0RYoyPgGdCWCGszrDdpVc0DqOsi14A
         gRW2u/W83dbpPuAyZYsRiR1/ncFoNKZWbCQMfzkDoQe1R4rCHr2EI/AM0Ptzw4iWbTKJ
         ReAQXXOLvVfC8puQHgrBxgcQiu3hToS3wMRkUOjsuq6lmQQOjhbKrY27PUrNypZH7yG1
         2IAg==
X-Gm-Message-State: AC+VfDzxWthyAw8Q4lkQE6XupuW7MNrIq3d1zeauQfSaClS4VIyxfkuD
        BU6b7w3G4vCyJqni+cuLurDNYYQLYsIyIjOKj6qVUWR1pOFRXO954H5SGE4D5np2Mx/XDph80X/
        JcCtFkqfvq0qZ5yY4bU1E
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id hp10-20020a1709073e0a00b008b17de3cfaamr11230772ejc.3.1687221754046;
        Mon, 19 Jun 2023 17:42:34 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7CuI4jncrqThsJCOY9EL8v0SHvOVlwMCpxRyLtkLTLUI18H8CeggEpcXJgjnduPuXIFRYrhA==
X-Received: by 2002:a17:907:3e0a:b0:8b1:7de3:cfaa with SMTP id hp10-20020a1709073e0a00b008b17de3cfaamr11230750ejc.3.1687221753916;
        Mon, 19 Jun 2023 17:42:33 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
        by smtp.gmail.com with ESMTPSA id c16-20020a17090603d000b00986e6a7d230sm377729eja.168.2023.06.19.17.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jun 2023 17:42:33 -0700 (PDT)
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
Subject: [PATCH drm-next v5 02/14] maple_tree: split up MA_STATE() macro
Date:   Tue, 20 Jun 2023 02:42:05 +0200
Message-Id: <20230620004217.4700-3-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Split up the MA_STATE() macro such that components using the maple tree
can easily inherit from struct ma_state and build custom tree walk
macros to hide their internals from users.

Example:

struct sample_iterator {
	struct ma_state mas;
	struct sample_mgr *mgr;
};

\#define SAMPLE_ITERATOR(name, __mgr, start)			\
	struct sample_iterator name = {				\
		.mas = MA_STATE_INIT(&(__mgr)->mt, start, 0),	\
		.mgr = __mgr,					\
	}

\#define sample_iter_for_each_range(it__, entry__, end__) \
	mas_for_each(&(it__).mas, entry__, end__)

--

struct sample *sample;
SAMPLE_ITERATOR(si, min);

sample_iter_for_each_range(&si, sample, max) {
	frob(mgr, sample);
}

Reviewed-by: Liam R. Howlett <Liam.Howlett@oracle.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 include/linux/maple_tree.h | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/include/linux/maple_tree.h b/include/linux/maple_tree.h
index 1fadb5f5978b..87d55334f1c2 100644
--- a/include/linux/maple_tree.h
+++ b/include/linux/maple_tree.h
@@ -423,8 +423,8 @@ struct ma_wr_state {
 #define MA_ERROR(err) \
 		((struct maple_enode *)(((unsigned long)err << 2) | 2UL))
 
-#define MA_STATE(name, mt, first, end)					\
-	struct ma_state name = {					\
+#define MA_STATE_INIT(mt, first, end)					\
+	{								\
 		.tree = mt,						\
 		.index = first,						\
 		.last = end,						\
@@ -435,6 +435,9 @@ struct ma_wr_state {
 		.mas_flags = 0,						\
 	}
 
+#define MA_STATE(name, mt, first, end)					\
+	struct ma_state name = MA_STATE_INIT(mt, first, end)
+
 #define MA_WR_STATE(name, ma_state, wr_entry)				\
 	struct ma_wr_state name = {					\
 		.mas = ma_state,					\
-- 
2.40.1

