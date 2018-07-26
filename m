Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A77F67D085
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Jul 2018 05:03:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728896AbeGZGRi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Jul 2018 02:17:38 -0400
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:42611 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726421AbeGZGRh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Jul 2018 02:17:37 -0400
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 0E84A21F2F;
        Thu, 26 Jul 2018 01:02:37 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute5.internal (MEProxy); Thu, 26 Jul 2018 01:02:37 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=YusceDq1vA63PDdN1
        MDIT3i/yzWwzqAiKS7VVu6bSGs=; b=OYGRZawh5kdjM1ci133sFUw8Xq6DQMhhG
        fVQsbCZnovxlY87ZlMuQs32owdq9t/QXynrsILNjZ7u7wfXuo++bhTtG9lcg7wPF
        LNkVI51pMMta8UfuKkNp0Sba0jFK9EWmygyI528/k1RbmsbS4f4eaK3tn9mcNjZx
        Q3Vv+cnXzl+2fXwZdh96VjrtDqAmXlecM+KiFkA4G1jDRPjcBJ5WiXijMUoEStz+
        qVITnu7ds5HbqCuzldV8x42Brrp0slm9KP+v7bi4gwuQyBlCk8PLsIxD5FPZrcSt
        kJhGMJK/nNd+AaeZKDJbUb/nsNkMH+6qhzl1BUP2EUw/LcLKuz0Qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm3; bh=YusceDq1vA63PDdN1MDIT3i/yzWwzqAiKS7VVu6bSGs=; b=lL1mMviN
        NgHmJJYkd2UOfOYRmbn4qm4dyLlqWajEJsZIItyszvG0yJ+8+VL9qNvoPMFmieKM
        JF6aZjMxabr/TkZ9+p/CsMwdLmz4nJjeGLU4kTJ+O5aA3uemp6mPSYhrQmOz6G46
        4JF4Lo/kNOdNNdMXea8dNw787TegeOhnrfxM0tRgMuXZ/hwK/PQd/gTUArCsV60s
        x8jRmjztTgX1yW11sUs+/pun/+E2HP0PkiRDulfVtsT+tAMobV/BbMtkoGVvIneB
        Q4iGCU4ZIKiFY/lLCQWN6EZa5BtMcBTD9yvKqvrfyWYrlmqNW5MSMcsCNB52YkEr
        h3vlIL7rSgsjhw==
X-ME-Proxy: <xmx:7FVZWzXyOUVvK3Pjid6BurzJHrP6lQtm-UlmkjpgDpjT9BFQqoPDGw>
    <xmx:7FVZWwqNJbU32E39k6CtvrXUNIIDqbLf8t15a_UPXFeExltEq4cRzQ>
    <xmx:7FVZW8ZOEnph_qG3c8IUCOmNhpAdplgOP-wR0ghDOg1QT8ztFES56w>
    <xmx:7FVZW8APSDTeQX-K_YNQpZw9GSHiawOCw66OQhXBPRlzPD5_9K4ZIQ>
    <xmx:7FVZW_HLZcHT0kmisUzC-EzJa0lTtFnj_8kmOi78NgSt42lbUFt9dg>
    <xmx:7FVZW1axZTotO3LqUTJpcm8xvcMuGp7o7fiJGTxjuXu1Qgol_DGgaQ>
X-ME-Sender: <xms:7FVZW9dPE3Z2vsayFB3LZBW9Iz-F8CFucNPcIcxubXcaVJybH-Clug>
Received: from localhost (ppp121-44-239-245.bras2.syd2.internode.on.net [121.44.239.245])
        by mail.messagingengine.com (Postfix) with ESMTPA id 2A1EB10255;
        Thu, 26 Jul 2018 01:02:35 -0400 (EDT)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     "David S. Miller" <davem@davemloft.net>
Cc:     "Tobin C. Harding" <me@tobin.cc>, Jonathan Corbet <corbet@lwn.net>,
        Edward Cree <ecree@solarflare.com>,
        Alexei Starovoitov <ast@kernel.org>,
        Daniel Borkmann <daniel@iogearbox.net>,
        linux-doc@vger.kernel.org, netdev@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 net-next 1/3] docs: Add rest label the_canonical_patch_format
Date:   Thu, 26 Jul 2018 15:02:24 +1000
Message-Id: <20180726050226.1980-2-me@tobin.cc>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20180726050226.1980-1-me@tobin.cc>
References: <20180726050226.1980-1-me@tobin.cc>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In preparation to convert Documentation/network/netdev-FAQ.rst to
restructured text format.  We would like to be able to reference 'the
canonical patch format' section.

Add rest label: 'the_canonical_patch_format'.

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---
 Documentation/process/submitting-patches.rst | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 908bb55be407..c0917107b90a 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -611,6 +611,7 @@ which stable kernel versions should receive your fix. This is the preferred
 method for indicating a bug fixed by the patch. See :ref:`describe_changes`
 for more details.
 
+.. _the_canonical_patch_format:
 
 14) The canonical patch format
 ------------------------------
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
