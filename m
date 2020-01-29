Return-Path: <SRS0=sBCo=3S=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA024C33CB2
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F82B20702
	for <linux-doc@archiver.kernel.org>; Wed, 29 Jan 2020 04:49:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hAyozUZj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbgA2Etf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Jan 2020 23:49:35 -0500
Received: from mail-qk1-f194.google.com ([209.85.222.194]:45610 "EHLO
        mail-qk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbgA2Etf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Jan 2020 23:49:35 -0500
Received: by mail-qk1-f194.google.com with SMTP id x1so15780594qkl.12
        for <linux-doc@vger.kernel.org>; Tue, 28 Jan 2020 20:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=fjtPyGHczMSaELCapHNSE16Wg2ojQqmt1c/4u/9C08Y=;
        b=hAyozUZjnlikYz2njE3YtjtbQGy7ezhVoK0paMq9ZP1n2hERqO70RECmM0918c2e3I
         CMYFVNR1aIRYy7qZ17YSzpQu15ZJ3nqxFC+SlWXRBvq7hnracyCHPEMAq5LYF2oAnAmp
         JGC7/tMKrrFrkPpHFdoGkjA3PWjvWkZIFmz3g9qHzni2MGqgkB3lid4VroNPKkztD3hk
         7K765G4p2DXtHHX9jNvge3sEahGpMA1mJdroKQA8ysvBF2nrVNfBtDNPbqsiudatp7EF
         CODjIy3gIfmZpcsrDCEAuNUBQLQb1HFVreLtmcgyk1l0EQ7BAsFsggGSvt5AQjHqRmJM
         lp7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=fjtPyGHczMSaELCapHNSE16Wg2ojQqmt1c/4u/9C08Y=;
        b=AOif+ocK8YiY9Px7fRPU3pvaP7jOHfL8s1UtB1aZ/UMTF4E1WDEC7sxaJn11WsdCXy
         1lif4f+rEL3kBwclofktD9a4lVBoUIGGK1W5Ld+OiVn6YXt81AQDmUpim3qSp6pC5Uxf
         F9jBy6lZCxS+al7U4PvO5nyUsL0eb6iIs93MK/5nArqqQmSZFYCkdqsMZazD0MHAThHq
         6CfUYN5hD4UfHZuVdwGKScQwQNvgMUODS4rzKbQrjfwsRi8M/9QN8diMIeH6DR7gzyvR
         bW31gzu+M5IKRtnbMDigvOPgbnGSJKz+UN6Dx37tVKsquS4qPg2pGfTcNhdz8TfBxZsT
         Z/NQ==
X-Gm-Message-State: APjAAAWWnn9MRYqFD4VtjBSOJmCasAUx0GnPaSvO7QYvdMDTybhkXxs7
        k4+eSaoqKER0GoIHWhJAmm4=
X-Google-Smtp-Source: APXvYqzCDhm4htgYhRBqje4amg/HaEET/32U5ASBXMoF9kEMEeMeNZWcdvjsv/KZUyPjDV5yTpP9ng==
X-Received: by 2002:a37:9e12:: with SMTP id h18mr25278681qke.420.1580273373759;
        Tue, 28 Jan 2020 20:49:33 -0800 (PST)
Received: from localhost.localdomain ([2804:14d:72b1:8920:a2ce:f815:f14d:bfac])
        by smtp.gmail.com with ESMTPSA id a22sm487320qtd.48.2020.01.28.20.49.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jan 2020 20:49:33 -0800 (PST)
From:   "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>
X-Google-Original-From: Daniel W. S. Almeida
To:     corbet@lwn.net, mchehab+samsung@kernel.org
Cc:     "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>,
        linux-doc@vger.kernel.org, skhan@linuxfoundation.org,
        linux-kernel-mentees@lists.linuxfoundation.org
Subject: [PATCH v2 3/5] Documentation: nfs: rpc-server-gss: convert to ReST
Date:   Wed, 29 Jan 2020 01:49:15 -0300
Message-Id: <20200129044917.566906-4-dwlsalmeida@gmail.com>
X-Mailer: git-send-email 2.25.0
In-Reply-To: <20200129044917.566906-1-dwlsalmeida@gmail.com>
References: <20200129044917.566906-1-dwlsalmeida@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: "Daniel W. S. Almeida" <dwlsalmeida@gmail.com>

Convert rpc-server-gss.txt to ReST. Content remains mostly unchanged.

Signed-off-by: Daniel W. S. Almeida <dwlsalmeida@gmail.com>
---
 Documentation/filesystems/nfs/index.rst       |  1 +
 ...{rpc-server-gss.txt => rpc-server-gss.rst} | 19 +++++++++++--------
 2 files changed, 12 insertions(+), 8 deletions(-)
 rename Documentation/filesystems/nfs/{rpc-server-gss.txt => rpc-server-gss.rst} (92%)

diff --git a/Documentation/filesystems/nfs/index.rst b/Documentation/filesystems/nfs/index.rst
index 52f4956e7770..9d5365cbe2c3 100644
--- a/Documentation/filesystems/nfs/index.rst
+++ b/Documentation/filesystems/nfs/index.rst
@@ -8,3 +8,4 @@ NFS
 
    pnfs
    rpc-cache
+   rpc-server-gss
diff --git a/Documentation/filesystems/nfs/rpc-server-gss.txt b/Documentation/filesystems/nfs/rpc-server-gss.rst
similarity index 92%
rename from Documentation/filesystems/nfs/rpc-server-gss.txt
rename to Documentation/filesystems/nfs/rpc-server-gss.rst
index 310bbbaf9080..812754576845 100644
--- a/Documentation/filesystems/nfs/rpc-server-gss.txt
+++ b/Documentation/filesystems/nfs/rpc-server-gss.rst
@@ -1,4 +1,4 @@
-
+=========================================
 rpcsec_gss support for kernel RPC servers
 =========================================
 
@@ -9,14 +9,17 @@ NFSv4.1 and higher don't require the client to act as a server for the
 purposes of authentication.)
 
 RPCGSS is specified in a few IETF documents:
+
  - RFC2203 v1: http://tools.ietf.org/rfc/rfc2203.txt
  - RFC5403 v2: http://tools.ietf.org/rfc/rfc5403.txt
+
 and there is a 3rd version  being proposed:
+
  - http://tools.ietf.org/id/draft-williams-rpcsecgssv3.txt
    (At draft n. 02 at the time of writing)
 
 Background
-----------
+==========
 
 The RPCGSS Authentication method describes a way to perform GSSAPI
 Authentication for NFS.  Although GSSAPI is itself completely mechanism
@@ -29,6 +32,7 @@ depends on GSSAPI extensions that are KRB5 specific.
 GSSAPI is a complex library, and implementing it completely in kernel is
 unwarranted. However GSSAPI operations are fundementally separable in 2
 parts:
+
 - initial context establishment
 - integrity/privacy protection (signing and encrypting of individual
   packets)
@@ -41,7 +45,7 @@ kernel, but leave the initial context establishment to userspace.  We
 need upcalls to request userspace to perform context establishment.
 
 NFS Server Legacy Upcall Mechanism
-----------------------------------
+==================================
 
 The classic upcall mechanism uses a custom text based upcall mechanism
 to talk to a custom daemon called rpc.svcgssd that is provide by the
@@ -62,21 +66,20 @@ groups) due to limitation on the size of the buffer that can be send
 back to the kernel (4KiB).
 
 NFS Server New RPC Upcall Mechanism
------------------------------------
+===================================
 
 The newer upcall mechanism uses RPC over a unix socket to a daemon
 called gss-proxy, implemented by a userspace program called Gssproxy.
 
-The gss_proxy RPC protocol is currently documented here:
-
-	https://fedorahosted.org/gss-proxy/wiki/ProtocolDocumentation
+The gss_proxy RPC protocol is currently documented `here
+<https://fedorahosted.org/gss-proxy/wiki/ProtocolDocumentation>`_.
 
 This upcall mechanism uses the kernel rpc client and connects to the gssproxy
 userspace program over a regular unix socket. The gssproxy protocol does not
 suffer from the size limitations of the legacy protocol.
 
 Negotiating Upcall Mechanisms
------------------------------
+=============================
 
 To provide backward compatibility, the kernel defaults to using the
 legacy mechanism.  To switch to the new mechanism, gss-proxy must bind
-- 
2.25.0

