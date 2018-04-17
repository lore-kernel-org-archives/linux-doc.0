Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1509E7E279
	for <lwn-linux-doc@archive.lwn.net>; Tue, 17 Apr 2018 16:31:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755356AbeDQQIO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 17 Apr 2018 12:08:14 -0400
Received: from mail-pf0-f195.google.com ([209.85.192.195]:40969 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753178AbeDQQIM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Apr 2018 12:08:12 -0400
Received: by mail-pf0-f195.google.com with SMTP id a2so12372684pff.8
        for <linux-doc@vger.kernel.org>; Tue, 17 Apr 2018 09:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tuybmXnIw8o7e0ZlNrxSj711s4fTF2uNswv5BobIx2Y=;
        b=TnKmKCyad/md1QlRGp+G7TsqxgvfjdNiP3MhtxZpoYHCQSLydkBXKa76wBby4nZSs9
         XnhbBCZxtuna3GnmJKZVrJPg+2psu/dZnrPfGD/agSoCpNewL7jXmlKnXyJB/1nv3LIX
         jtm0phRSPB080X13iew5kLfDtDULVJIvW0sV0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tuybmXnIw8o7e0ZlNrxSj711s4fTF2uNswv5BobIx2Y=;
        b=uZFnWmBpr1NyXah+Vee/Dia8R7jITV9mxDSIe2W6zqDVTvooruLea5ZsrbHq8y/dXa
         wN6AgAWptjz708uJstyoVzWobbi2VBGkaZBq8I1KBJEQWhvIekkp9XrHcrIi2VDwGunl
         xX+3PZgA/l0GqeAsPwrtnqf/eZ93grtu70uJdMySzMtwHESoP8rUsWmkqSDTgbee27Mr
         Td+NtNGggS6LZIFuHCdkS7e7jsukRA4r4+qqjuJaQc/4dXXJEmegjhcpsWOQBYglEfqE
         94lKqu0mbuLgeTf1IPDlnn0kiDZdlzJ3wpWvYfdARV81QUJJmSSLqmFItrvvX3bSfF9b
         P3aQ==
X-Gm-Message-State: ALQs6tATjPdFoehek5UrwhFoZE88x6zW10K6y4vZJQa1cAbCEUfG/wce
        Nk9dxkNmctP4ZIu3Xl8kykvD7Q==
X-Google-Smtp-Source: AIpwx49jyew33+6ZEAnRxz9OkVnV+mQNWUklogs9LL3b1lRBckay1y29EKGpbWRLe+OJ8vbhdN+mwA==
X-Received: by 10.99.125.75 with SMTP id m11mr2242105pgn.391.1523981291258;
        Tue, 17 Apr 2018 09:08:11 -0700 (PDT)
Received: from xps15.cg.shawcable.net (S0106002369de4dac.cg.shawcable.net. [68.147.8.254])
        by smtp.gmail.com with ESMTPSA id r81sm34829878pfj.79.2018.04.17.09.08.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 17 Apr 2018 09:08:10 -0700 (PDT)
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     linux-arm-kernel@lists.infradead.org, corbet@lwn.net
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        rdunlap@infradead.org, Ben.Gainey@arm.com
Subject: [PATCH v2 1/3] coresight: Remove obsolete reference to "owner" in CoreSight descriptor
Date:   Tue, 17 Apr 2018 10:08:05 -0600
Message-Id: <1523981287-15370-2-git-send-email-mathieu.poirier@linaro.org>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
References: <1523981287-15370-1-git-send-email-mathieu.poirier@linaro.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Field "owner" of struct coresight_desc has been removed a while back but
the documentation was not updated to reflect the changes.

Signed-off-by: Mathieu Poirier <mathieu.poirier@linaro.org>
---
 Documentation/trace/coresight.txt | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/Documentation/trace/coresight.txt b/Documentation/trace/coresight.txt
index 6f0120c3a4f1..710c75b6c73f 100644
--- a/Documentation/trace/coresight.txt
+++ b/Documentation/trace/coresight.txt
@@ -187,9 +187,6 @@ that can be performed on them (see "struct coresight_ops").  The
 specific to that component only.  "Implementation defined" customisations are
 expected to be accessed and controlled using those entries.
 
-Last but not least, "struct module *owner" is expected to be set to reflect
-the information carried in "THIS_MODULE".
-
 How to use the tracer modules
 -----------------------------
 
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
