Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9843EC4332F
	for <linux-doc@archiver.kernel.org>; Wed,  9 Feb 2022 04:07:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245710AbiBIEH3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Feb 2022 23:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347753AbiBIEGS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Feb 2022 23:06:18 -0500
Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0C72C061578;
        Tue,  8 Feb 2022 20:06:15 -0800 (PST)
Received: by codeconstruct.com.au (Postfix, from userid 10000)
        id 1FE1F202A0; Wed,  9 Feb 2022 12:06:11 +0800 (AWST)
From:   Jeremy Kerr <jk@codeconstruct.com.au>
To:     netdev@vger.kernel.org
Cc:     Matt Johnston <matt@codeconstruct.com.au>,
        "David S. Miller" <davem@davemloft.net>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ingo Molnar <mingo@redhat.com>, linux-doc@vger.kernel.org
Subject: [PATCH net-next v2 3/5] mctp: Add helper for address match checking
Date:   Wed,  9 Feb 2022 12:05:55 +0800
Message-Id: <20220209040557.391197-4-jk@codeconstruct.com.au>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220209040557.391197-1-jk@codeconstruct.com.au>
References: <20220209040557.391197-1-jk@codeconstruct.com.au>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, we have a couple of paths that check that an EID matches, or
the match value is MCTP_ADDR_ANY.

Rather than open coding this, add a little helper.

Signed-off-by: Jeremy Kerr <jk@codeconstruct.com.au>
---
 include/net/mctp.h | 5 +++++
 net/mctp/route.c   | 8 +++-----
 2 files changed, 8 insertions(+), 5 deletions(-)

diff --git a/include/net/mctp.h b/include/net/mctp.h
index 7e35ec79b909..706d329dd8e8 100644
--- a/include/net/mctp.h
+++ b/include/net/mctp.h
@@ -45,6 +45,11 @@ static inline bool mctp_address_ok(mctp_eid_t eid)
 	return eid >= 8 && eid < 255;
 }
 
+static inline bool mctp_address_matches(mctp_eid_t match, mctp_eid_t eid)
+{
+	return match == eid || match == MCTP_ADDR_ANY;
+}
+
 static inline struct mctp_hdr *mctp_hdr(struct sk_buff *skb)
 {
 	return (struct mctp_hdr *)skb_network_header(skb);
diff --git a/net/mctp/route.c b/net/mctp/route.c
index 8d9f4ff3e285..654467a7aeae 100644
--- a/net/mctp/route.c
+++ b/net/mctp/route.c
@@ -64,8 +64,7 @@ static struct mctp_sock *mctp_lookup_bind(struct net *net, struct sk_buff *skb)
 		if (msk->bind_type != type)
 			continue;
 
-		if (msk->bind_addr != MCTP_ADDR_ANY &&
-		    msk->bind_addr != mh->dest)
+		if (!mctp_address_matches(msk->bind_addr, mh->dest))
 			continue;
 
 		return msk;
@@ -616,9 +615,8 @@ static struct mctp_sk_key *mctp_alloc_local_tag(struct mctp_sock *msk,
 		if (tmp->tag & MCTP_HDR_FLAG_TO)
 			continue;
 
-		if (!((tmp->peer_addr == daddr ||
-		       tmp->peer_addr == MCTP_ADDR_ANY) &&
-		       tmp->local_addr == saddr))
+		if (!(mctp_address_matches(tmp->peer_addr, daddr) &&
+		      tmp->local_addr == saddr))
 			continue;
 
 		spin_lock(&tmp->lock);
-- 
2.34.1

