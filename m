Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C011C7E244
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 03:59:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932709AbeCED6s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 4 Mar 2018 22:58:48 -0500
Received: from out5-smtp.messagingengine.com ([66.111.4.29]:60475 "EHLO
        out5-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S932768AbeCED6m (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 4 Mar 2018 22:58:42 -0500
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.nyi.internal (Postfix) with ESMTP id 2323920ABF;
        Sun,  4 Mar 2018 22:58:41 -0500 (EST)
Received: from frontend1 ([10.202.2.160])
  by compute5.internal (MEProxy); Sun, 04 Mar 2018 22:58:41 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tobin.cc; h=cc
        :date:from:in-reply-to:message-id:references:subject:to
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=xhJsLzPCPpy2fb8Tk
        t2zQ+pBIbOI4rWrt0F9mMTnPJk=; b=ge6mOj/e9ovqmoxNENn7SoSM4w79qyRjn
        aWVqFA027sG5DorcY/rYJsPZVEGGwT0wL/2HYIU9+i3ntohe+41cT3cNlQ66cv6o
        qKXImBgvT9HZh0ANxwjd/Yh2g+xGV+tgk4B8yjxS1Oz66CcX7d9sYsiyk/qCyFqK
        Wx5nsRs60cSwXEKA9x4vk6g18skrAWLneFVePFBSkautNoBXCrhH4cwkEaF9Dnx+
        j9ZrYPhq+mqn7QTRnFbDV8pYuhp8LBKrjIonCxWZoWXqdhmT7HTeLUcnIdVgFp1A
        Rz/+43V4xTHcsNahxqvjphwjXbNEQ6qRksCL9qMIZEoIPriVcTOog==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:date:from:in-reply-to:message-id
        :references:subject:to:x-me-sender:x-me-sender:x-sasl-enc; s=
        fm2; bh=xhJsLzPCPpy2fb8Tkt2zQ+pBIbOI4rWrt0F9mMTnPJk=; b=BJtJVvoj
        RJihprdi7xgOp69YDsImQFsK1VL9HcoaP0cXX1nFrGyfze3CexFbAoMfCXvR4fGR
        iWYBjI3OixlEY6VkMY52mqtntwGkxDQlTebHfTMfSkgT2Q7Gcx62XXn1N4Syk+/O
        GXDITnZXcN6XNIJoXRcvEXBK+UyuLwwLvrXnIbl+wuePVtap7ztyAwnl2hE74ARI
        zgT5S9AG9uHjvqJCS+Uzttd/mcodH8foJpYSdMwbl8Y9SSbWgx8BYdPsm//cJYjd
        Yq12/xS5qIRl4EDayOpVMt4JNFWLUU93NLRTU0eqDViMb6nCYTJzCcf0rfnGXHX1
        viZZEgP7jCvkww==
X-ME-Sender: <xms:ccCcWsQ5e2TKiJm5fFAYBxORXFWDqfkIc7NY-KrMiYex8cCOpdGtsw>
Received: from localhost (ppp121-44-99-155.bras1.syd7.internode.on.net [121.44.99.155])
        by mail.messagingengine.com (Postfix) with ESMTPA id 71CB17E1F3;
        Sun,  4 Mar 2018 22:58:40 -0500 (EST)
From:   "Tobin C. Harding" <me@tobin.cc>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc:     "Tobin C. Harding" <me@tobin.cc>, Joe Perches <joe@perches.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH 2/2] docs: add Co-Developed-by docs
Date:   Mon,  5 Mar 2018 14:58:21 +1100
Message-Id: <1520222301-11874-3-git-send-email-me@tobin.cc>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1520222301-11874-1-git-send-email-me@tobin.cc>
References: <1520222301-11874-1-git-send-email-me@tobin.cc>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When Co-Developed-by tag was added, docs were only added to
Documention/process/5.Posting.rst and were not added to
Documention/process/submitting-patches.rst

Add documentation to Documention/process/submitting-patches.rst

Signed-off-by: Tobin C. Harding <me@tobin.cc>
---

The text in this patch is copied basically verbatim from
Documentation/process/submitting-patches.rst 

 Documentation/process/submitting-patches.rst | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/process/submitting-patches.rst b/Documentation/process/submitting-patches.rst
index 1ef19d3a3eee..698360641ecd 100644
--- a/Documentation/process/submitting-patches.rst
+++ b/Documentation/process/submitting-patches.rst
@@ -510,8 +510,8 @@ tracking your trees, and to people trying to troubleshoot bugs in your
 tree.
 
 
-12) When to use Acked-by: and Cc:
----------------------------------
+12) When to use Acked-by: and Cc:, and Co-Developed-by:
+-------------------------------------------------------
 
 The Signed-off-by: tag indicates that the signer was involved in the
 development of the patch, or that he/she was in the patch's delivery path.
@@ -543,6 +543,11 @@ person it names - but it should indicate that this person was copied on the
 patch.  This tag documents that potentially interested parties
 have been included in the discussion.
 
+A Co-Developed-by: states that the patch was also created by another developer
+along with the original author.  This is useful at times when multiple people
+work on a single patch.  Note, this person also needs to have a Signed-off-by:
+line in the patch as well.
+
 
 13) Using Reported-by:, Tested-by:, Reviewed-by:, Suggested-by: and Fixes:
 --------------------------------------------------------------------------
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
