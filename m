Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 21A837DE78
	for <lwn-linux-doc@archive.lwn.net>; Fri, 27 Apr 2018 15:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932730AbeD0Pvv (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 27 Apr 2018 11:51:51 -0400
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34161 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757560AbeD0Pvt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 27 Apr 2018 11:51:49 -0400
Received: by mail-wr0-f196.google.com with SMTP id p18-v6so2236474wrm.1;
        Fri, 27 Apr 2018 08:51:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=54mh5aEK8c1j4oeqxxcWr6zpGHOjUDcDkz0uw1Q4xLA=;
        b=u9rApoF+bvAOGakXIkeAyoFM67Q3zTZcGIq+ovHa3g1nv2xoQ2JYy0nSqAumHtitP6
         knIoOO4XcwZO5V1StM+DChX5XXA2zu7EdtWXRFVCeqHN6PnOz5FG62hvPP+Qk3lJ1XoK
         pSRi3ekZUju3cP2+mlFRJThJzaZIc8W861HI/gsRL0fYQ0y85MxmvrQBy9k6ZvjM7gzk
         CAlyWnVTea5wpH2LFr0eQgYXokePVG16jHv31yQDZO7Rx1bwffUwOXLVkA2/BaY/Xyub
         o/1E9nV0kZy84KBIkY6oaXw0jCrZjIIWY5jKaAfgWfoAmf3epZOyJIK3Pu4fixQNNygQ
         MmXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=54mh5aEK8c1j4oeqxxcWr6zpGHOjUDcDkz0uw1Q4xLA=;
        b=bWdJ+ndTsZAcHa/5v4eI13KVc5iTga4XaOS4ZgRCA2ApbSkbsf9WGjR5Iyne/C2JX9
         /oetpcrba1PnH3+XVvTmH7wyRHksTkK5BuQ8SbBHXF5ZYisiZJ5TSCIa5Yt89etIB8PG
         HrZbe9Flw4pRs61FRjIG7c3jetz9KciaSgfiLq9kLqZKbVfnru9mBsZypXvoz9D702dW
         gNjSHtTkibN3QcGQMSipMqvbhTCVXPONlZsC0U3XhmtmOYlFFQriXITkLH+s6Tu+Zg5L
         Jc+hnozsZNm6/Mu1upfcnN1ldYNUcVq11PwGiTlR/fCr1tYjNbOjK0LYbeTEMZ3Vq7LX
         0K2Q==
X-Gm-Message-State: ALQs6tDZIpbeN59Xuv6C4/iQCr7DboPpCQBiUKS5aYAKqNIHHP/b2Gzs
        BkRA0kEEWngy6YRwgBYO+yw=
X-Google-Smtp-Source: AB8JxZrCv9FkP3Gm/rRe7Kqi+AsoEhDrLEyFAFQi5ezg7d18qOCqIr79VuL6EZ9TIhTbftb172jAIg==
X-Received: by 2002:adf:a281:: with SMTP id s1-v6mr2483562wra.176.1524844308502;
        Fri, 27 Apr 2018 08:51:48 -0700 (PDT)
Received: from localhost.localdomain ([192.135.27.140])
        by smtp.gmail.com with ESMTPSA id 42-v6sm2570429wrx.24.2018.04.27.08.51.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 27 Apr 2018 08:51:47 -0700 (PDT)
From:   Ahmed Abdelsalam <amsalam20@gmail.com>
To:     davem@davemloft.net, linux-doc@vger.kernel.org,
        netdev@vger.kernel.org
Cc:     Ahmed Abdelsalam <amsalam20@gmail.com>
Subject: [net-next v2] ipv6: sr: Add documentation for seg_flowlabel sysctl
Date:   Fri, 27 Apr 2018 17:51:48 +0200
Message-Id: <1524844308-2891-1-git-send-email-amsalam20@gmail.com>
X-Mailer: git-send-email 2.1.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This patch adds a documentation for seg_flowlabel sysctl into
Documentation/networking/ip-sysctl.txt

Signed-off-by: Ahmed Abdelsalam <amsalam20@gmail.com>
---
 Documentation/networking/ip-sysctl.txt | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/networking/ip-sysctl.txt b/Documentation/networking/ip-sysctl.txt
index 5dc1a04..7c14747 100644
--- a/Documentation/networking/ip-sysctl.txt
+++ b/Documentation/networking/ip-sysctl.txt
@@ -1428,6 +1428,19 @@ ip6frag_low_thresh - INTEGER
 ip6frag_time - INTEGER
 	Time in seconds to keep an IPv6 fragment in memory.
 
+IPv6 Segment Routing:
+
+seg6_flowlabel - INTEGER
+	Controls the behaviour of computing the flowlabel of outer
+	IPv6 header in case of SR T.encaps
+
+	-1 set flowlabel to zero.
+	0 copy flowlabel from Inner packet in case of Inner IPv6
+		(Set flowlabel to 0 in case IPv4/L2)
+	1 Compute the flowlabel using seg6_make_flowlabel()
+
+	Default is 0.
+
 conf/default/*:
 	Change the interface-specific default settings.
 
-- 
2.1.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
