Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85804C27C76
	for <linux-doc@archiver.kernel.org>; Sat, 21 Jan 2023 14:31:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229831AbjAUObe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 21 Jan 2023 09:31:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60380 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229814AbjAUObd (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 21 Jan 2023 09:31:33 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF91C392B6
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 06:31:32 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id q5so2492939wrv.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Jan 2023 06:31:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rarW0C3V0LVCbRSxn5OZzPRQcVqqpTUYjlstsxkGCnQ=;
        b=XsCu29i8Z1oc6uq5sN0yrMDgSjJpECZK4tV/ZSWpv7Uv/K2PEwE5UMbv20VjjgyxlY
         vg8bhcorENStwyLLUyjey9dNr++wfIekEVSst6gupetTukZG9rMpYTpYHfbIHuk66jam
         iKAWboGyzIl6Ep6fEHRYZXEmB+YB3H0ucf7nvQKEWidcjOusrcuCYpG6FtbisyPCE8Gc
         gWBRQ8HqXvNuHuNu5A6i/9gh7TNaC+jl+3hEqOHUdIDAypMszBN08bnuRVw0l6qhzGDP
         dfEjDWnOY0WCx9R8ODnSCGEPQ3dGmxqMEcp64N7ymD7xgAyUanO++dHng7c2mD6BN2qh
         xG8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rarW0C3V0LVCbRSxn5OZzPRQcVqqpTUYjlstsxkGCnQ=;
        b=SXpHx9Rm2tQExfD+rWpJW1SlJdqZ587kwcjEg3gupbqJtkOZmhuZ8JWgm5JgHE8Qei
         egbgntPiVuA5bhNnpbBs3r4qOG9/fzW8gtyKWiRhM3lNH0jwEruDwNJAgFZH+sRT16N5
         V7goeoWQwAYBlPPUrXsmChZ92OjfQqVRAEvwwQzeJNKE5MiDPpzxqwkFxakOWVNVLLcN
         vvBZcvHt6tGP7AXJL23tvgJhFEXJn/Ypx/xaeOmTBmgSL3qdEkQ0nuNcSg0mdGWaY5Sw
         OdOu93U7ldtVy3Z1BfSjUO4PE+6Zs8fIIChdNKI3OZWOfeFlVa4OePBzlaAtrmvlU3mK
         A0yg==
X-Gm-Message-State: AFqh2koTYQRnFLn9ZiuungRzzs+gGhtXwgZSbrGxeYawZLVpJfEo4F8+
        kx5hc95PBH2yFGqv/Npo/JqEZQ==
X-Google-Smtp-Source: AMrXdXvFZMIUXANWl+eYIekkOFr+wSSWg8hb1mKA3uO8qLOhdES9+Kt8xsHL6GIfJpTslkJ2YxykPw==
X-Received: by 2002:a5d:4d4b:0:b0:2be:9945:8112 with SMTP id a11-20020a5d4d4b000000b002be99458112mr4332624wru.41.1674311491377;
        Sat, 21 Jan 2023 06:31:31 -0800 (PST)
Received: from P-ASN-ECS-830T8C3.mpl.intranet (89-159-1-53.rev.numericable.fr. [89.159.1.53])
        by smtp.gmail.com with ESMTPSA id p8-20020a5d4588000000b002bdfb97e029sm16314604wrq.19.2023.01.21.06.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jan 2023 06:31:31 -0800 (PST)
From:   Yoann Congal <yoann.congal@smile.fr>
To:     linux-trace-kernel@vger.kernel.org
Cc:     Yoann Congal <yoann.congal@smile.fr>,
        Steven Rostedt <rostedt@goodmis.org>,
        Masami Hiramatsu <mhiramat@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org
Subject: [PATCH v2 3/3] Documentation: kprobetrace: Split paragraphs
Date:   Sat, 21 Jan 2023 15:31:10 +0100
Message-Id: <20230121143110.1706962-3-yoann.congal@smile.fr>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230121142242.1706081-1-yoann.congal@smile.fr>
References: <20230121143110.1706962-1-yoann.congal@smile.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add an empty line to force the output to split paragraphs like it is
splitin the REST source.

Signed-off-by: Yoann Congal <yoann.congal@smile.fr>
---
 Documentation/trace/kprobetrace.rst | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/trace/kprobetrace.rst b/Documentation/trace/kprobetrace.rst
index ad18c2fdbd153..99251bcdeb13d 100644
--- a/Documentation/trace/kprobetrace.rst
+++ b/Documentation/trace/kprobetrace.rst
@@ -74,12 +74,14 @@ respectively. 'x' prefix implies it is unsigned. Traced arguments are shown
 in decimal ('s' and 'u') or hexadecimal ('x'). Without type casting, 'x32'
 or 'x64' is used depends on the architecture (e.g. x86-32 uses x32, and
 x86-64 uses x64).
+
 These value types can be an array. To record array data, you can add '[N]'
 (where N is a fixed number, less than 64) to the base type.
 E.g. 'x16[4]' means an array of x16 (2-bytes hex) with 4 elements.
 Note that the array can be applied to memory type fetchargs, you can not
 apply it to registers/stack-entries etc. (for example, '$stack1:x8[8]' is
 wrong, but '+8($stack):x8[8]' is OK.)
+
 String type is a special type, which fetches a "null-terminated" string from
 kernel space. This means it will fail and store NULL if the string container
 has been paged out. "ustring" type is an alternative of string for user-space.
-- 
2.30.2

