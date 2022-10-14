Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25471C4332F
	for <linux-doc@archiver.kernel.org>; Fri, 14 Oct 2022 17:11:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231261AbiJNRLG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 14 Oct 2022 13:11:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231260AbiJNRLC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 14 Oct 2022 13:11:02 -0400
Received: from mail-pl1-x64a.google.com (mail-pl1-x64a.google.com [IPv6:2607:f8b0:4864:20::64a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CEAE11D5579
        for <linux-doc@vger.kernel.org>; Fri, 14 Oct 2022 10:10:54 -0700 (PDT)
Received: by mail-pl1-x64a.google.com with SMTP id e10-20020a17090301ca00b00183d123e2a5so3596493plh.14
        for <linux-doc@vger.kernel.org>; Fri, 14 Oct 2022 10:10:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ap2GLZvM/h5WRSh6U8yqJEQTu6U3qmUyyLz0cSVPc=;
        b=EHXIjcEVaP7GqJu7+/7iwMQnBTtvMzb0JNHXjKS/ZxLiViC57AmLU08ZKnjpnGCP3S
         YgBZrJcXF0nYt6Oj8HeoePeKbFrCOcPGOd2U0bXoD9U57xmAD1ElzzgboS9ngHKQ6sm3
         73I+Qo3dmVEV/XMEkXmIZrGDSCYB+hcsKmHvu+LxfAlrWEe9PzzhujoJVskKUavQDINh
         lpLlENpfUFYBCNdnKtl8qLYecLygj0ue1C/qrZvwaKcPjndqm0v+0ulPPgte2XmrpXF6
         wfyrFIazoOr/rsFFudAktPdpwATeRmQhaqS6rqXaSYU8F4vAiamH6zZzcxbAPFwaksk5
         t9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v9ap2GLZvM/h5WRSh6U8yqJEQTu6U3qmUyyLz0cSVPc=;
        b=U+KZ7Nn4ilDDj3uyLKzbb9FMs94XqYHaMIdt17a/XuPjN33MeoHYjw6X1RTWxv5v6J
         vFAagMUUKSL/8dvp+4DLO7nUPcGE0QmhNThq3GvXeu6HSCbJs5ooEXkWP90DOv8O+w/p
         Ycgbzsitz61hr861wcOBmRPasrUAjwUuVSwNR+Um5G149gREoyLhUSrRDPTuIiUyK0ny
         idDPPi11z8mltM/CMMsD9ZaOAT2XYOdOFaLV1Q7mKe1hdqYageKIiXCEqISOGgFvj4IL
         jnUr0qqQHgOcsqwrzW8vP001RM1Vx+nZ6MaAvICjASfgN0hZz6xWlBVgXTIijtf7i4dd
         9nTQ==
X-Gm-Message-State: ACrzQf1pQcBQqDyC+Ow0qzz228lFrWfBNJJGmXpZ5kjrqXSPY13/UCLi
        TArDQQZhXLOu0E5gxXMH4E7QeIPQgTCieib6keI=
X-Google-Smtp-Source: AMsMyM4YzRBXmzyhCa/4pBcn2mG0C8gX42INaXx++KNjjHjH35AjvdUI0Z61ht5TLtZm4/EMlCQbZM29Psqw2nv0hHA=
X-Received: from ndesaulniers-desktop.svl.corp.google.com ([2620:0:100e:712:ff3e:881c:4c2c:b8c9])
 (user=ndesaulniers job=sendgmr) by 2002:a62:1744:0:b0:562:4e9b:3e0c with SMTP
 id 65-20020a621744000000b005624e9b3e0cmr6202729pfx.63.1665767452872; Fri, 14
 Oct 2022 10:10:52 -0700 (PDT)
Date:   Fri, 14 Oct 2022 10:10:40 -0700
In-Reply-To: <Y0mSVQCQer7fEKgu@kroah.com>
Mime-Version: 1.0
References: <Y0mSVQCQer7fEKgu@kroah.com>
X-Developer-Key: i=ndesaulniers@google.com; a=ed25519; pk=UIrHvErwpgNbhCkRZAYSX0CFd/XFEwqX3D0xqtqjNug=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1665767440; l=2239;
 i=ndesaulniers@google.com; s=20220923; h=from:subject; bh=kVkxjDQc5kjwHf3srGXAwtiAks3feBD+FzGTuZwcG7s=;
 b=xBNfNpF27rA58YIkIpHdFJ8sCZIZsRqpxhp19dqNIfQZGlYiV1zD8vSBeuNSlVsyMVwkwB4BqEkh
 8b6o41b2BqirH9MpbAfxx9PHV7mtZTw0Rn5RAqE/2zrNXGHNS2Rt
X-Mailer: git-send-email 2.38.0.413.g74048e4d9e-goog
Message-ID: <20221014171040.849726-1-ndesaulniers@google.com>
Subject: [PATCH v2] Documentation: process: replace outdated LTS table w/ link
From:   Nick Desaulniers <ndesaulniers@google.com>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        stable@vger.kernel.org, Ben Hutchings <ben@decadent.org.uk>,
        Sasha Levin <sashal@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Tyler Hicks <code@tyhicks.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The existing table was a bit outdated.

3.16 was EOL in 2020.
4.4 was EOL in 2022.

5.10 is new in 2020.
5.15 is new in 2021.

We'll see if 6.1 becomes LTS in 2022.

Rather than keep this table updated, it does duplicate information from
multiple kernel.org pages. Make one less duplication site that needs to
be updated and simply refer to the kernel.org page on releases.

Suggested-by: Tyler Hicks <code@tyhicks.com>
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Nick Desaulniers <ndesaulniers@google.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
Changes v1 -> v2:
* Rather than update table, use a link as per Tyler and Bagas.
* Carry forward GKH's SB tag.

 Documentation/process/2.Process.rst | 15 ++++-----------
 1 file changed, 4 insertions(+), 11 deletions(-)

diff --git a/Documentation/process/2.Process.rst b/Documentation/process/2.Process.rst
index e05fb1b8f8b6..6a919cffcbfd 100644
--- a/Documentation/process/2.Process.rst
+++ b/Documentation/process/2.Process.rst
@@ -126,17 +126,10 @@ than one development cycle past their initial release. So, for example, the
 5.2.21 was the final stable update of the 5.2 release.
 
 Some kernels are designated "long term" kernels; they will receive support
-for a longer period.  As of this writing, the current long term kernels
-and their maintainers are:
-
-	======  ================================	=======================
-	3.16	Ben Hutchings				(very long-term kernel)
-	4.4	Greg Kroah-Hartman & Sasha Levin	(very long-term kernel)
-	4.9	Greg Kroah-Hartman & Sasha Levin
-	4.14	Greg Kroah-Hartman & Sasha Levin
-	4.19	Greg Kroah-Hartman & Sasha Levin
-	5.4	Greg Kroah-Hartman & Sasha Levin
-	======  ================================	=======================
+for a longer period.  Please refer to the following link for the list of active
+long term kernel versions and their maintainers:
+
+	https://www.kernel.org/category/releases.html
 
 The selection of a kernel for long-term support is purely a matter of a
 maintainer having the need and the time to maintain that release.  There

base-commit: 9c9155a3509a2ebdb06d77c7a621e9685c802eac
-- 
2.38.0.413.g74048e4d9e-goog

