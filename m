Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED875C433F5
	for <linux-doc@archiver.kernel.org>; Mon,  3 Oct 2022 16:13:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229708AbiJCQNh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 3 Oct 2022 12:13:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53300 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229725AbiJCQNf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 3 Oct 2022 12:13:35 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A6D7E32061
        for <linux-doc@vger.kernel.org>; Mon,  3 Oct 2022 09:13:34 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id ay36so7349490wmb.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Oct 2022 09:13:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
        bh=7dQXLQGjmAcl/xcPVLsk1EjIAQGW9LYFw0dKgGXUj4M=;
        b=b2R3jRKx+U+3OqygRYsWqU7FHxxsZAJlQ90cBgHYqLYttQM/MNQJGP5ihX+D/zm1jY
         XCwzZvpjXgUSIu3ISJxgnr0GgPSG7UbWUWoAu927D0izLhr99o0ALAsojigTA5eyhKJK
         ml9/oje5dYmEz9CZDvHlG+wMvU3DsDiqpXOVk0yexebGy/HpcknMfg+Rr9Q9Tpmyar+Q
         vjrD5YdoBHvFZr81/ssVsx478RM3vxc/KQAoFvlRIqYlOhwBcx2IuYGh7poYcFt3/xFL
         rdoTgrS44peaBZ2yy0qJH373+kvn1JPJjv3apL/e38xqjE7xlHHLCdelz89Y6lR2noV/
         GPhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=7dQXLQGjmAcl/xcPVLsk1EjIAQGW9LYFw0dKgGXUj4M=;
        b=WK6sqJsM3vYpHIv8g4/U93OugRkaBCGKJ7JWFa0VdhvBPUAmc0WxkEzZfKEnLwe1j+
         yInve3U7Eoju1A1cUxpxu3shfBXY/Y7TnIoXu+2UbkVuNIdEDJYT5JHa6O05gJq0sgs3
         beDu8LD0Ep7MZ+KN8AqzWQRj0qOS2G4FqYuMbakX8Z3GvKS6zBqSLBTjftckpuyN4y8p
         Te7JyOwPkWq2QLpWVNrgH7qw+LRTJVvPIOTI3aoTL45FXqEQuUahc2QKvp6Ek5NYigIv
         lLUZ3LJKf/VYGv34gSmLJFk98lFhCThnYNo6N+Hu4u9Q4DH+jfNvzLk2SC0Fpdvtt2TT
         gVWA==
X-Gm-Message-State: ACrzQf2nQIKq3+A8viVFjz9QFATi00s7wXcX4HdBCowEqiVx3Hwml8Pl
        0rMJSaDIXotsMOI+F/qs7WIq/Q==
X-Google-Smtp-Source: AMsMyM47DVIIhlKgvmYj/r0Y7oHp7KVO/2q6/YOFDYvztqyixbC3rZnvTR+boBsjLDsifmwqGUVA5w==
X-Received: by 2002:a05:600c:1d8f:b0:3b4:90c1:e23a with SMTP id p15-20020a05600c1d8f00b003b490c1e23amr7381633wms.122.1664813613265;
        Mon, 03 Oct 2022 09:13:33 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie. [188.141.3.169])
        by smtp.gmail.com with ESMTPSA id v129-20020a1cac87000000b003a845621c5bsm12111335wme.34.2022.10.03.09.13.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Oct 2022 09:13:32 -0700 (PDT)
From:   Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To:     corbet@lwn.net, linux@leemhuis.info,
        konstantin@linuxfoundation.org, krzysztof.kozlowski@linaro.org,
        linux-doc@vger.kernel.org, joe@perches.com
Cc:     linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Subject: [PATCH v4 1/2] get_maintainer: Print maintainer for S: Supported
Date:   Mon,  3 Oct 2022 17:13:28 +0100
Message-Id: <20221003161329.431107-2-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.37.3
In-Reply-To: <20221003161329.431107-1-bryan.odonoghue@linaro.org>
References: <20221003161329.431107-1-bryan.odonoghue@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Throughout the documentation we make reference to maintainers as the people
who ought to be mailed when sending patches.

Right now get_maintainer.pl returns "supporter" for maintained files which
are denoted "S: Supported".

Update get_maintainer to output "maintainer" for "S: Supported" the
differentiation between paid (v) non-paid maintainers doesn't impact who
needs to be mailed for patch submissions.

Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 scripts/get_maintainer.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/get_maintainer.pl b/scripts/get_maintainer.pl
index ab123b498fd9b..7a8d2961d948d 100755
--- a/scripts/get_maintainer.pl
+++ b/scripts/get_maintainer.pl
@@ -1283,7 +1283,7 @@ sub get_maintainer_role {
 
     $role = lc($role);
     if      ($role eq "supported") {
-	$role = "supporter";
+	$role = "maintainer";
     } elsif ($role eq "maintained") {
 	$role = "maintainer";
     } elsif ($role eq "odd fixes") {
-- 
2.37.3

