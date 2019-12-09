Return-Path: <SRS0=5fBo=Z7=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF3D9C43603
	for <linux-doc@archiver.kernel.org>; Mon,  9 Dec 2019 19:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AB9B9205ED
	for <linux-doc@archiver.kernel.org>; Mon,  9 Dec 2019 19:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1575919575;
	bh=vKXK4QhyVVNTGbBbpI1Ti9xOKNIE2l9LJRFmCIuCZzQ=;
	h=Date:From:To:Cc:Subject:List-ID:From;
	b=dC8cUJ0W1ARnYSlOHeR5u6rCPlpORJZ2jBm7XNfaGSk3DVkzAWbBf5Eou2Q9d/2NW
	 cR5ZGpcygu0aO5m3brWyKqS9fSAIVskSlOY5jzf2AghzcS4G61oZLkDTXc0T0ZJOsi
	 8Zlis6WtA4LSryVoUhqBGoAODRWf+An5+NysKWKw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726342AbfLIT0P (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 9 Dec 2019 14:26:15 -0500
Received: from mail-qv1-f68.google.com ([209.85.219.68]:41351 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726265AbfLIT0P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 9 Dec 2019 14:26:15 -0500
Received: by mail-qv1-f68.google.com with SMTP id b18so3107053qvo.8
        for <linux-doc@vger.kernel.org>; Mon, 09 Dec 2019 11:26:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=date:from:to:cc:subject:message-id:mail-followup-to:mime-version
         :content-disposition:user-agent;
        bh=yBuY/HQDLN08U5PjyBTUFpPrKWO0oCKxcJE5Z+gbvYU=;
        b=h8XuHGCBMygAql7reXHqmyOyk34ckR20sXYdRMiI8kml7anJEpqd/t80FCwb99phpv
         9hhSzGjTQqDzd2FgMjR7gVmJk+kSNInJFpO69c3B1KpAJ42+wq4um2P3LA3BvxlCmvSX
         chaeMgVMX6E07ZbY/8Axrf5Gzll//4l1MlCZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id
         :mail-followup-to:mime-version:content-disposition:user-agent;
        bh=yBuY/HQDLN08U5PjyBTUFpPrKWO0oCKxcJE5Z+gbvYU=;
        b=AhGVkIv7JMYNPl/pulEK9UiMt57FDEsWmRU4uAQrgHEcAd19bH5Npx+d/9CEUVTYos
         g72jwXjm9FSC0Fm9bhBXRgu2gLX2e1/Uord0EhoiMxmq2X4FNuyvoXRw4acKPDflvbAT
         ReUnXaWPtfE4MBXTXhghnm9X/pxNfEq3YRImci11chyIVbK1m3c/xpOg2E/S8uRoY/1L
         wO2e+p7HCpgBOdgULCNQ3OkFvakVxU7P7NEDzd7ljQ6zy+qSIx/zvGGX0MZW7AOfzP74
         2fgGtFCyF/9kkCAEru0ilFw/93Uid2WAOVyd4TxErQUIJJMf5RPSpNfn8GzCCADi9SSI
         dIRQ==
X-Gm-Message-State: APjAAAWwpNpYvQse+vvkPnZbv2STMLCP2CLYnMiw172SJdmHV3kRPpWC
        +VKktepMcZ+WeR+WpQE5p7fvyQ==
X-Google-Smtp-Source: APXvYqyM34f6xupywhbCW90OeeSkgfemJqFNsPpcQ+aQnrcyp5aQIflFp1LJAId5Uogt9Jy9Zo9kCQ==
X-Received: by 2002:a0c:c190:: with SMTP id n16mr22763195qvh.174.1575919574132;
        Mon, 09 Dec 2019 11:26:14 -0800 (PST)
Received: from chatter.i7.local (107-179-243-71.cpe.teksavvy.com. [107.179.243.71])
        by smtp.gmail.com with ESMTPSA id 40sm175200qtc.95.2019.12.09.11.26.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Dec 2019 11:26:13 -0800 (PST)
Date:   Mon, 9 Dec 2019 14:26:11 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     corbet@lwn.net
Cc:     tglx@linutronix.de, linux-doc@vger.kernel.org, greg@kroah.com
Subject: [PATCH] Process: provide hardware-security list details
Message-ID: <20191209192611.GA1688548@chatter.i7.local>
Mail-Followup-To: corbet@lwn.net, tglx@linutronix.de,
        linux-doc@vger.kernel.org, greg@kroah.com
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
X-Patchwork-Bot: notify
User-Agent: Mutt/1.12.1 (2019-06-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fill in "..." stubs with proper links to the mailing lists's encryption
keys and service description URLs. Similarly, fix wording to specify
that multiple members of Linux Foundation's IT team have access to
internal kernel.org infrastructure, and that all of them have similar
confidentiality obligations as the IT team director.

Signed-off-by: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
---
 .../process/embargoed-hardware-issues.rst     | 23 +++++++++++--------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/Documentation/process/embargoed-hardware-issues.rst b/Documentation/process/embargoed-hardware-issues.rst
index 799580acc8de..3d17de7e5aeb 100644
--- a/Documentation/process/embargoed-hardware-issues.rst
+++ b/Documentation/process/embargoed-hardware-issues.rst
@@ -36,7 +36,10 @@ issue according to our documented process.
 The list is encrypted and email to the list can be sent by either PGP or
 S/MIME encrypted and must be signed with the reporter's PGP key or S/MIME
 certificate. The list's PGP key and S/MIME certificate are available from
-https://www.kernel.org/....
+the following URLs:
+
+  - PGP: https://www.kernel.org/static/files/hardware-security.asc
+  - S/MIME: https://www.kernel.org/static/files/hardware-security.crt
 
 While hardware security issues are often handled by the affected hardware
 vendor, we welcome contact from researchers or individuals who have
@@ -55,14 +58,14 @@ Operation of mailing-lists
 ^^^^^^^^^^^^^^^^^^^^^^^^^^
 
 The encrypted mailing-lists which are used in our process are hosted on
-Linux Foundation's IT infrastructure. By providing this service Linux
-Foundation's director of IT Infrastructure security technically has the
-ability to access the embargoed information, but is obliged to
-confidentiality by his employment contract. Linux Foundation's director of
-IT Infrastructure security is also responsible for the kernel.org
-infrastructure.
-
-The Linux Foundation's current director of IT Infrastructure security is
+Linux Foundation's IT infrastructure. By providing this service, members
+of Linux Foundation's IT operations personnel technically have the
+ability to access the embargoed information, but are obliged to
+confidentiality by their employment contract. Linux Foundation IT
+personnel are also responsible for operating and managing the rest of
+kernel.org infrastructure.
+
+The Linux Foundation's current director of IT Project infrastructure is
 Konstantin Ryabitsev.
 
 
@@ -274,7 +277,7 @@ software decrypts the email and re-encrypts it individually for each
 subscriber with the subscriber's PGP key or S/MIME certificate. Details
 about the mailing-list software and the setup which is used to ensure the
 security of the lists and protection of the data can be found here:
-https://www.kernel.org/....
+https://korg.wiki.kernel.org/userdoc/remail.
 
 List keys
 ^^^^^^^^^

base-commit: e42617b825f8073569da76dc4510bfa019b1c35a
-- 
2.23.0

