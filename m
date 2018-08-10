Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI
	autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E9AE77D00A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 10 Aug 2018 11:06:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727236AbeHJNgQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 10 Aug 2018 09:36:16 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51610 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726963AbeHJNgP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Aug 2018 09:36:15 -0400
Received: by mail-wm0-f66.google.com with SMTP id y2-v6so1476310wma.1;
        Fri, 10 Aug 2018 04:06:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=61prLLx8PBSC9bOuhiAat6924f5tgMdVSPOj58tWLO4=;
        b=Gy2qSBmQs8f0W1MTBW50bhstxld0RM1iEhzEKrSg2gXD83EiUIpHIFonEAGAa12c0Q
         8QpBA8z332JTBnY9pFNS/J/XifSbYGUrPE1GQadS6qTiY6F1mNmlbnrctNFbtSye66kv
         81S5xXLjreDTMoep3u5QzH2uISDGp5FixvV2HvMBpgYV86tDzSSW73Wv7VUoW5DW8W94
         OvT2motkBNXETCiCIgsouiiQ6us7rnEZNrTa3lHBj1kNvzDCXtxzGspnzVJqYJfznPjy
         PAoomeYgtSrZCvXtVfH61OSU7PobBbAwG3kbqirosiVju7kBFRbN6df1DfVRVAw/IqLQ
         AYug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=61prLLx8PBSC9bOuhiAat6924f5tgMdVSPOj58tWLO4=;
        b=cJsETdh/Qt/a3qC/1cqyPdQXYevzpK3hOrSqakq0FbBnf7PJqn7oZKGt1oxnCQXhcs
         uvfHqqVbH2g2O1ASdOIX8n911V+Cy2XvCA8llPcWSW4FepLjWoQNjpoczo4cqn4PBaq0
         jChOsRx1CKvBoBEIhK4LqdnbOBwPu6wDRtgdF0yceOEKbRe6jDc0XYHAYlTNEGXkSbGq
         g5+Hir/u9tcTjeRjgBlGhnMHRrQ4UPvdLASu6WJ3lVXd+q03vaCHqRRS/AGDIi1szBy5
         T8h//KTsn09YWkyJhFKol3AOdPF/JZNfE7aA4tuuypRcFUHMGOHqbYSbGfCTGjLG8ihz
         1CMQ==
X-Gm-Message-State: AOUpUlG9saE7jz0hlVWljZI0AueWy7HAgodr3I75ZN3yFy09E4fXET7h
        hN1WD67zTCRGsq9SMrvO8Hjq41colWU=
X-Google-Smtp-Source: AA+uWPz2pd7sn4+6eZ1Rs/Th32Fqy+kmpF3qecxbVGu93fRmvWWp+taHiqeSpLN3AkCX6wNMK1igGw==
X-Received: by 2002:a1c:4004:: with SMTP id n4-v6mr1157594wma.83.1533899207273;
        Fri, 10 Aug 2018 04:06:47 -0700 (PDT)
Received: from ecklm-lapos.sch.bme.hu (ecklapos.sch.bme.hu. [152.66.179.161])
        by smtp.gmail.com with ESMTPSA id s10-v6sm2487815wmd.22.2018.08.10.04.06.45
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 10 Aug 2018 04:06:46 -0700 (PDT)
From:   =?UTF-8?q?M=C3=A1t=C3=A9=20Eckl?= <ecklm94@gmail.com>
To:     netfilter-devel@vger.kernel.org
Cc:     "David S. Miller" <davem@davemloft.net>,
        Jonathan Corbet <corbet@lwn.net>,
        Florian Westphal <fw@strlen.de>,
        KOVACS Krisztian <hidden@sch.bme.hu>,
        Pablo Neira Ayuso <pablo@netfilter.org>,
        linux-doc@vger.kernel.org
Subject: [PATCH nf-next] doc: net: Add nf_tables part in tproxy.txt
Date:   Fri, 10 Aug 2018 12:58:39 +0200
Message-Id: <20180810105834.17653-1-ecklm94@gmail.com>
X-Mailer: git-send-email 2.18.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Recently, transparent proxy support has been added to nf_tables so that
this document should be updated with the new information.

- Nft commands are added as alternatives to iptables ones.
- The link for a patched iptables is removed as it is already part of
  the mainline iptables implementation (and the link is dead).
- tcprdr is added as an example implementation of a transparent proxy

Cc: "David S. Miller" <davem@davemloft.net>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Florian Westphal <fw@strlen.de>
Cc: KOVACS Krisztian <hidden@sch.bme.hu>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: linux-doc@vger.kernel.org
Signed-off-by: Máté Eckl <ecklm94@gmail.com>
---
The patches that introduced the mentioned support are the following in the
linux-next tree:
 - 554ced0a6e29 netfilter: nf_tables: add support for native socket matching
 - 4ed8eb6570a4 netfilter: nf_tables: Add native tproxy support


 Documentation/networking/tproxy.txt | 34 +++++++++++++++++++++++------
 1 file changed, 27 insertions(+), 7 deletions(-)

diff --git a/Documentation/networking/tproxy.txt b/Documentation/networking/tproxy.txt
index ec11429e1d42..b9a188823d9f 100644
--- a/Documentation/networking/tproxy.txt
+++ b/Documentation/networking/tproxy.txt
@@ -5,19 +5,28 @@ This feature adds Linux 2.2-like transparent proxy support to current kernels.
 To use it, enable the socket match and the TPROXY target in your kernel config.
 You will need policy routing too, so be sure to enable that as well.
 
+From Linux 4.18 transparent proxy support is also available in nf_tables.
 
 1. Making non-local sockets work
 ================================
 
 The idea is that you identify packets with destination address matching a local
-socket on your box, set the packet mark to a certain value, and then match on that
-value using policy routing to have those packets delivered locally:
+socket on your box, set the packet mark to a certain value:
 
 # iptables -t mangle -N DIVERT
 # iptables -t mangle -A PREROUTING -p tcp -m socket -j DIVERT
 # iptables -t mangle -A DIVERT -j MARK --set-mark 1
 # iptables -t mangle -A DIVERT -j ACCEPT
 
+Alternatively you can do this in nft with the following commands:
+
+# nft add table filter
+# nft add chain filter divert "{ type filter hook prerouting priority -150; }"
+# nft add rule filter divert meta l4proto tcp socket transparent 1 meta mark set 1 accept
+
+And then match on that value using policy routing to have those packets
+delivered locally:
+
 # ip rule add fwmark 1 lookup 100
 # ip route add local 0.0.0.0/0 dev lo table 100
 
@@ -57,17 +66,28 @@ add rules like this to the iptables ruleset above:
 # iptables -t mangle -A PREROUTING -p tcp --dport 80 -j TPROXY \
   --tproxy-mark 0x1/0x1 --on-port 50080
 
+Or the following rule to nft:
+
+# nft add rule filter divert tcp dport 80 tproxy to :50080 meta mark set 1 accept
+
 Note that for this to work you'll have to modify the proxy to enable (SOL_IP,
 IP_TRANSPARENT) for the listening socket.
 
+As an example implementation, tcprdr is available here:
+https://git.breakpoint.cc/cgit/fw/tcprdr.git/
+This tool is written by Florian Westphal and it was used for testing during the
+nf_tables implementation.
 
-3. Iptables extensions
-======================
+3. Iptables and nf_tables extensions
+====================================
 
-To use tproxy you'll need to have the 'socket' and 'TPROXY' modules
-compiled for iptables. A patched version of iptables is available
-here: http://git.balabit.hu/?p=bazsi/iptables-tproxy.git
+To use tproxy you'll need to have the following modules compiled for iptables:
+ - NETFILTER_XT_MATCH_SOCKET
+ - NETFILTER_XT_TARGET_TPROXY
 
+Or the floowing modules for nf_tables:
+ - NFT_SOCKET
+ - NFT_TPROXY
 
 4. Application support
 ======================
-- 
ecklm

