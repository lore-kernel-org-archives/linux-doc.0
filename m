Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15D2FC07E9A
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 17:38:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D4CEE613C5
	for <linux-doc@archiver.kernel.org>; Wed, 14 Jul 2021 17:38:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhGNRk5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 13:40:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48424 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229553AbhGNRk5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 13:40:57 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BBA42C061760
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 10:38:04 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id p14-20020a17090ad30eb02901731c776526so4318247pju.4
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 10:38:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AkN/g8848yQUrVMq0VBpWbOyu8YJObYWSKkoyUzYfiU=;
        b=eMg6FmyNsO6+/sMtxzHj9WXua3i1vPIdUzNZ4lZdQJyej/FRHSIF1ML3Mc0G5cDLWx
         tGwv3//qdXYSpJRjVqTg7jtj4aiFsmzWU90DtlM9Y5q+P+1yJ2rBkswf7mJD6Xo76FEk
         rKQ27JxibdftdRE8B5pWmFRcMUOs3YMz2Cegk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AkN/g8848yQUrVMq0VBpWbOyu8YJObYWSKkoyUzYfiU=;
        b=QE0aEprOGEVJAhcTqqt05hmcEMnRECuZhyjwXsK3t2OC5yErO0ZDkQIqgjjVjV1Heq
         9QsdKcE4IzrCJraGBtBcxoX6Nu9fgJH7/lz+Hw3RrBdqY9KlRRa8VM5vgAtiPP2W6tAl
         hk8CCeP3NN3QslJDRzUvdlTHEeTwd5uEVi7JJta4qO+OYop2UjMkNrTAP1/NTbQa7Zd9
         c5DERUd4loGxp4/CKHkBD+VE5XKYSx+fVEA35A2u9hUNPL6KWdOTRUtBSbNCjqP+5uN8
         Kirij5sVyxW0clkSPVFtzrgk1L+bWDSrubrxSn7nVwEyEMvADaDcF5itxWSMtXefqf3O
         7fxA==
X-Gm-Message-State: AOAM533Mfhjkzjrv8p8LLYwPEXacyI1qukl14wba1uEwXDdxqMaS5psA
        xdsvbPjwgOQoknbfgMHDAlCkmQ==
X-Google-Smtp-Source: ABdhPJwEcCE08Sj3IeUY5ZlR8wzGioKVy8YsVZg+ovQUa2cTdgQKHOv/52is24ZM2pDu/8rkeVCVdQ==
X-Received: by 2002:a17:90a:6a43:: with SMTP id d3mr4872708pjm.15.1626284283944;
        Wed, 14 Jul 2021 10:38:03 -0700 (PDT)
Received: from dev-yzhong.dev.purestorage.com ([192.30.188.252])
        by smtp.googlemail.com with ESMTPSA id d8sm3855074pgu.49.2021.07.14.10.38.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 Jul 2021 10:38:03 -0700 (PDT)
From:   Yuanyuan Zhong <yzhong@purestorage.com>
To:     elver@google.com
Cc:     akpm@linux-foundation.org, corbet@lwn.net, dvyukov@google.com,
        glider@google.com, joern@purestorage.com,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH mm v2] kfence: show cpu and timestamp in alloc/free info
Date:   Wed, 14 Jul 2021 11:37:55 -0600
Message-Id: <20210714173755.1083-1-yzhong@purestorage.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210714082145.2709233-1-elver@google.com>
References: <20210714082145.2709233-1-elver@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +	/* Timestamp matches printk timestamp format. */
> +	seq_con_printf(seq, "%s by task %d on cpu %d at %lu.%06lus:\n",
> +		       show_alloc ? "allocated" : "freed", meta->alloc_track.pid,
> +		       meta->alloc_track.cpu, (unsigned long)ts_sec, rem_nsec / 1000);

s/meta->alloc_track\./track->/
