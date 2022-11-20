Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CE4BC4332F
	for <linux-doc@archiver.kernel.org>; Sun, 20 Nov 2022 22:07:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229526AbiKTWHM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 20 Nov 2022 17:07:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55542 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229622AbiKTWHL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 20 Nov 2022 17:07:11 -0500
Received: from mail-wr1-x431.google.com (mail-wr1-x431.google.com [IPv6:2a00:1450:4864:20::431])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A7CF14D02
        for <linux-doc@vger.kernel.org>; Sun, 20 Nov 2022 14:07:11 -0800 (PST)
Received: by mail-wr1-x431.google.com with SMTP id x17so3868194wrn.6
        for <linux-doc@vger.kernel.org>; Sun, 20 Nov 2022 14:07:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=s05YZT0JZG/jvJWi4biTOKOgGR54aElpRXX2lZLeKGA=;
        b=hwFm7vCGFN6McnxxoT6FFUgohP4JAjHvzuK8gn17gfCh6cMltLZs4XQcfLM52GqHXZ
         c8Zbq9E6tTGv4NgINofbL9SC1H3Io34FwXMKvps8RtG3MK3x6G82fWkHEMZXMqVSk61W
         0qQskG+0Dr9J7LOwrIDTBfL2lVvoBgULHVMViKrWaCkO1rtKorNHJq6hlDWjuEgls2ta
         Gb4F07qyErt87JuRjiAvMDZM9BS9ATM9PTFQkOOrBoXRuypG9Brgjrtn6SuGweqigM8l
         NOp7Jw/vXanoUBhQGjozWzYigDdABqUtZndpTnsBiTbWJ5DqoeBNT+66R8Jw3Koi/Tm1
         PTKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s05YZT0JZG/jvJWi4biTOKOgGR54aElpRXX2lZLeKGA=;
        b=tBDLb2rLrPQnU+t6nZ/6lpuy7HH5Q8/aHrnznZ4xseaIeN3mMYM6zk2KGO49UxtqgC
         xz43135C6jO0Bir8HHwL/RHMMM7VA6+l4RjZ2hqxFeGheBADW5BXBJn/W8L21NWCEpMn
         i8CRhZwM7QHvqfHOePpdxq7QAGEuIHLp3BWiOLdfKvNdol2NzP7R3O6tPBOWrkVNbWzH
         GewtgMZk7bMK34FpEyqjvVW2TO7pl46o+oIM+eCHtnH9wOUI2z8SzCeuXxMqAzHxlg1v
         frZvw28v2xMxPySlv6tWo5ssOZPMWnl49PsvKnOVQIHOlsO6172e+4QOCZ+jgdDC+NLA
         WBkw==
X-Gm-Message-State: ANoB5pnADpHpKLpwBM/aG5MrQUgrj3B50xMFE1FIyRj82dQd38o6T4Ad
        MkOZ0MTWRKomg602G0xlKpg=
X-Google-Smtp-Source: AA0mqf6C8kbODMGd77wkp8tAdFgaZheUbEAKCqVVwxaSzVRgnrG07zE8yVyXZNpNC4sWaqPzf9Wu3g==
X-Received: by 2002:adf:eb92:0:b0:236:80a8:485e with SMTP id t18-20020adfeb92000000b0023680a8485emr2535164wrn.362.1668982029658;
        Sun, 20 Nov 2022 14:07:09 -0800 (PST)
Received: from niros.localdomain ([176.231.147.83])
        by smtp.gmail.com with ESMTPSA id z3-20020a5d6543000000b002356c051b9csm9508295wrv.66.2022.11.20.14.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Nov 2022 14:07:08 -0800 (PST)
From:   Nir Levy <bhr166@gmail.com>
To:     grantseltzer@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org
Cc:     bhr166@gmail.com
Subject: [PATCH] Documentation: networking: Update generic_netlink_howto URL
Date:   Mon, 21 Nov 2022 00:06:30 +0200
Message-Id: <20221120220630.7443-1-bhr166@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The documentation refers to invalid web page under www.linuxfoundation.org
The patch refers to a working URL under wiki.linuxfoundation.org

Signed-off-by: Nir Levy <bhr166@gmail.com>
---
 Documentation/networking/generic_netlink.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/networking/generic_netlink.rst b/Documentation/networking/generic_netlink.rst
index 59e04ccf80c1..d960dbd7e80e 100644
--- a/Documentation/networking/generic_netlink.rst
+++ b/Documentation/networking/generic_netlink.rst
@@ -6,4 +6,4 @@ Generic Netlink
 
 A wiki document on how to use Generic Netlink can be found here:
 
- * http://www.linuxfoundation.org/collaborate/workgroups/networking/generic_netlink_howto
+ * https://wiki.linuxfoundation.org/networking/generic_netlink_howto
-- 
2.34.1

