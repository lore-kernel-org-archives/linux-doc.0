Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0887D29D280
	for <linux-doc@vger.kernel.org>; Sat,  1 Nov 2025 09:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761990483; cv=none; b=DQhhKlF1lIV4Ncz7YmQHNauMDhVnr6ysgOMW3S7u/hX1TK+vTm0hXU+3BT20y29z1K2fUhhUuLV6Hdio1V34iwFkEeZgpz3ixoDcZ+YcoYG/dAYOXpEYBBOncVbe3aEFd03ejad0R4RAKZ+S8u2PXxlOPsUEzd1mPqlMfG7G49c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761990483; c=relaxed/simple;
	bh=GTa5PMbqingrx9UUvDQwwryRQXi1hbUYeu/uDR+oix4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hj3hoIeaADGzk7CwZ9gumtdUAnG0nk1aAyAg34Qy+gzf2ELo1gJa/fEPiGpdR+kyFffZcXt7NtrE4aSZDDpqjTG5kZjSZGDJqSZiKRPokXrT/9qfVVm9NreLNeZVcUOSIZwr+g1Chjx5E1TjBmdFNWsbbH5sOVic1C3cL0A1duY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jd4W8sSb; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jd4W8sSb"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-29524c38f4fso20069255ad.2
        for <linux-doc@vger.kernel.org>; Sat, 01 Nov 2025 02:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761990481; x=1762595281; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjjrDgD3WOpxSbQxw9z6dYOn0RSDkCVjfKdY81mup90=;
        b=Jd4W8sSbOIwUQnCojzItd/DQHSJ3ozqbsRZdBoZALQd77rwQT4g9x1uQvW62f9s6Zs
         VQU6vyUQDywSL3Sd6Ax+HGKZS89YdmlDmeeHBQDnwyteyJlnRLElWZgR5piBpUIred+D
         hRbJFQXA+P04Mzqiduh5v9xcta9PXxOcMFRb/mNA6wxn/m7uDU5G1XSumXJDF00R5ae4
         vuD4won6tIB24+N0vWVFWYnCsmbQ9kdEjPesqTg4yJm0ms8RcT85/zI4AZlgLHmrU4mX
         emGA1BiMskEc+DTgbSFeIHUiOnQIBR+ZCWtHaSDPQK6JW4XiQNCH/j0/ytNQzoFSfF3M
         YXpA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761990481; x=1762595281;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjjrDgD3WOpxSbQxw9z6dYOn0RSDkCVjfKdY81mup90=;
        b=IQrYNZ9WmQnZANrhifTebw+Y5S2VXyf8C6rau2bdy8chmAa0wzDBTueE1uqMuVPPs5
         tTb5QB9tM3222F+rh60p/+iFjaf5mZn3Yuv4dQCbPyrRM5ctlHc3zod7FaCOJ5+tXOcG
         HztSKSGmZws/76LWqeDxT/Xx6tMdwB6Tn1/CNiL5UTNZw3EEZW/HBBG+fry0Ojx0g10c
         aTpTNe+EuQnFK2dzXXYVWrhN4MFvcARJ/AuJCe/F39GdpITEFZa3gOSsCBB4k4V4SHEp
         pLUhd9xAU7+XcEPGwErOSYBl8+u3xhFOczchct00fzavkGd8bHYc+P6SQyR9un4F94Mf
         0gjQ==
X-Forwarded-Encrypted: i=1; AJvYcCXLzL/3j18V4g9HnsbdytNv21vLrB+MgZBlW8m4vKzSv7oAcVdji7HUWLyZro7/P9ruB8CtbWFPeK0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwE7bcIfgNzqon+YOMI+wDwWSK0KOjH2evhJN95hwCqoO29SKyI
	IXC6ifoJuOHS/swrINywZBnNJ0Y1qPY3AjnzPxHupIajoEhmdHDRC6Tw
X-Gm-Gg: ASbGnctGlxwkMYfjvEFjwZau1D50i/4CZZSET/qApcmRnb6+v1Sgl2C6QBRhSfLdVUq
	gHnaGBqoXPBQaqwKv5V+hu1fPK+69MpRVX/he/xbVebUMDGPwRQuts34BtcY6artRQJhC5WwNBJ
	3LyCt0WEiEtvWw5kC1kMDJWR2jZ4VjA5sf/Tv5gIGe4B0P5LhE8KxnxOFthPxzMhLdcDNTKGbJP
	bMNj91X8I6z2ifmJfTVNEtWwAYqOVL3ZkzTTKgB/msmSyWB35x3sgZT/T91tUo8HYuw+d0z+e4S
	r1ctokDZh9r5LsO58LLD86Sf1bfsr9ngVwG6wOnUmDRzc0S8fgbzsvJZ1PR3LDi4Aj3ZwdliM0L
	T17VMPsxQSBF5nho438VIWO7Y+NzfXlP3dmlKe7ncKedh9Xd3X99BSZ3bfdB44dwPUISURL59WU
	b+J1TdvEWFda4=
X-Google-Smtp-Source: AGHT+IG5sgTmPbr5SKGt4RZnfYGQcR5jMn0NQ+QLpl4Gj+BxopLRKO/fYUff15QKvawPU7JdQEXTEg==
X-Received: by 2002:a17:902:c408:b0:288:e46d:b32b with SMTP id d9443c01a7336-2951a3b7984mr101577005ad.17.1761990481194;
        Sat, 01 Nov 2025 02:48:01 -0700 (PDT)
Received: from archie.me ([210.87.74.117])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-295268a629csm51068175ad.30.2025.11.01.02.47.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 01 Nov 2025 02:47:59 -0700 (PDT)
Received: by archie.me (Postfix, from userid 1000)
	id BB5E841FA3A3; Sat, 01 Nov 2025 16:47:56 +0700 (WIB)
From: Bagas Sanjaya <bagasdotme@gmail.com>
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	Linux Documentation <linux-doc@vger.kernel.org>,
	Linux Networking <netdev@vger.kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Steffen Klassert <steffen.klassert@secunet.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Bagas Sanjaya <bagasdotme@gmail.com>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: [PATCH net-next v2 4/8] Documentation: xfrm_sync: Properly reindent list text
Date: Sat,  1 Nov 2025 16:47:40 +0700
Message-ID: <20251101094744.46932-5-bagasdotme@gmail.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251101094744.46932-1-bagasdotme@gmail.com>
References: <20251101094744.46932-1-bagasdotme@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5939; i=bagasdotme@gmail.com; h=from:subject; bh=GTa5PMbqingrx9UUvDQwwryRQXi1hbUYeu/uDR+oix4=; b=owGbwMvMwCX2bWenZ2ig32LG02pJDJms13Lb2I51F8/KKf0g6XPr8eqTnq26xtVGkc/tKtl/X HpYZv6go5SFQYyLQVZMkWVSIl/T6V1GIhfa1zrCzGFlAhnCwMUpABOZqsPwP8+1NHHz0blnTx3X NW2JmTazMfq0dRpPudRi8fLstLLtjAz/w8xP5nFvqP59RpNtS0Pis7zdVydEPPvfPPX5wmKtiM3 zGQA=
X-Developer-Key: i=bagasdotme@gmail.com; a=openpgp; fpr=701B806FDCA5D3A58FFB8F7D7C276C64A5E44A1D
Content-Transfer-Encoding: 8bit

List texts are currently aligned at the start of column, rather than
after the list marker. Reindent them.

Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
Tested-by: Randy Dunlap <rdunlap@infradead.org>
Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/networking/xfrm_sync.rst | 77 +++++++++++++-------------
 1 file changed, 40 insertions(+), 37 deletions(-)

diff --git a/Documentation/networking/xfrm_sync.rst b/Documentation/networking/xfrm_sync.rst
index 6246503ceab2d2..c811c3edfa571a 100644
--- a/Documentation/networking/xfrm_sync.rst
+++ b/Documentation/networking/xfrm_sync.rst
@@ -88,23 +88,23 @@ to get notified of these events.
 
 a) byte value (XFRMA_LTIME_VAL)
 
-This TLV carries the running/current counter for byte lifetime since
-last event.
+   This TLV carries the running/current counter for byte lifetime since
+   last event.
 
-b)replay value (XFRMA_REPLAY_VAL)
+b) replay value (XFRMA_REPLAY_VAL)
 
-This TLV carries the running/current counter for replay sequence since
-last event.
+   This TLV carries the running/current counter for replay sequence since
+   last event.
 
-c)replay threshold (XFRMA_REPLAY_THRESH)
+c) replay threshold (XFRMA_REPLAY_THRESH)
 
-This TLV carries the threshold being used by the kernel to trigger events
-when the replay sequence is exceeded.
+   This TLV carries the threshold being used by the kernel to trigger events
+   when the replay sequence is exceeded.
 
 d) expiry timer (XFRMA_ETIMER_THRESH)
 
-This is a timer value in milliseconds which is used as the nagle
-value to rate limit the events.
+   This is a timer value in milliseconds which is used as the nagle
+   value to rate limit the events.
 
 3) Default configurations for the parameters:
 ---------------------------------------------
@@ -121,12 +121,14 @@ in case they are not specified.
 the two sysctls/proc entries are:
 
 a) /proc/sys/net/core/sysctl_xfrm_aevent_etime
-used to provide default values for the XFRMA_ETIMER_THRESH in incremental
-units of time of 100ms. The default is 10 (1 second)
+
+   Used to provide default values for the XFRMA_ETIMER_THRESH in incremental
+   units of time of 100ms. The default is 10 (1 second)
 
 b) /proc/sys/net/core/sysctl_xfrm_aevent_rseqth
-used to provide default values for XFRMA_REPLAY_THRESH parameter
-in incremental packet count. The default is two packets.
+
+   Used to provide default values for XFRMA_REPLAY_THRESH parameter
+   in incremental packet count. The default is two packets.
 
 4) Message types
 ----------------
@@ -134,42 +136,43 @@ in incremental packet count. The default is two packets.
 a) XFRM_MSG_GETAE issued by user-->kernel.
    XFRM_MSG_GETAE does not carry any TLVs.
 
-The response is a XFRM_MSG_NEWAE which is formatted based on what
-XFRM_MSG_GETAE queried for.
+   The response is a XFRM_MSG_NEWAE which is formatted based on what
+   XFRM_MSG_GETAE queried for.
 
-The response will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
-* if XFRM_AE_RTHR flag is set, then XFRMA_REPLAY_THRESH is also retrieved
-* if XFRM_AE_ETHR flag is set, then XFRMA_ETIMER_THRESH is also retrieved
+   The response will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
+
+     * if XFRM_AE_RTHR flag is set, then XFRMA_REPLAY_THRESH is also retrieved
+     * if XFRM_AE_ETHR flag is set, then XFRMA_ETIMER_THRESH is also retrieved
 
 b) XFRM_MSG_NEWAE is issued by either user space to configure
    or kernel to announce events or respond to a XFRM_MSG_GETAE.
 
-i) user --> kernel to configure a specific SA.
+   i) user --> kernel to configure a specific SA.
 
-any of the values or threshold parameters can be updated by passing the
-appropriate TLV.
+      any of the values or threshold parameters can be updated by passing the
+      appropriate TLV.
 
-A response is issued back to the sender in user space to indicate success
-or failure.
+      A response is issued back to the sender in user space to indicate success
+      or failure.
 
-In the case of success, additionally an event with
-XFRM_MSG_NEWAE is also issued to any listeners as described in iii).
+      In the case of success, additionally an event with
+      XFRM_MSG_NEWAE is also issued to any listeners as described in iii).
 
-ii) kernel->user direction as a response to XFRM_MSG_GETAE
+   ii) kernel->user direction as a response to XFRM_MSG_GETAE
 
-The response will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
+       The response will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
 
-The threshold TLVs will be included if explicitly requested in
-the XFRM_MSG_GETAE message.
+       The threshold TLVs will be included if explicitly requested in
+       the XFRM_MSG_GETAE message.
 
-iii) kernel->user to report as event if someone sets any values or
-     thresholds for an SA using XFRM_MSG_NEWAE (as described in #i above).
-     In such a case XFRM_AE_CU flag is set to inform the user that
-     the change happened as a result of an update.
-     The message will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
+   iii) kernel->user to report as event if someone sets any values or
+        thresholds for an SA using XFRM_MSG_NEWAE (as described in #i above).
+        In such a case XFRM_AE_CU flag is set to inform the user that
+        the change happened as a result of an update.
+        The message will always have XFRMA_LTIME_VAL and XFRMA_REPLAY_VAL TLVs.
 
-iv) kernel->user to report event when replay threshold or a timeout
-    is exceeded.
+   iv) kernel->user to report event when replay threshold or a timeout
+       is exceeded.
 
 In such a case either XFRM_AE_CR (replay exceeded) or XFRM_AE_CE (timeout
 happened) is set to inform the user what happened.
-- 
An old man doll... just what I always wanted! - Clara

