Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_HIGH autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 63D7A7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Thu, 23 Aug 2018 18:31:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727412AbeHWWCc (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 23 Aug 2018 18:02:32 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:40624 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727414AbeHWWCc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Aug 2018 18:02:32 -0400
Received: by mail-pf1-f194.google.com with SMTP id s13-v6so3077851pfi.7
        for <linux-doc@vger.kernel.org>; Thu, 23 Aug 2018 11:31:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=/3CjhislnGGqU2g8MmW8SwCvogvUhECLJdE3KndpOdQ=;
        b=CUP0hyclBxjARnYZIqgC1rZExSxHVaRJ6nBohdn0WryRFx2dOKG4+LEUy+BorSCeWS
         wWlwOeE043TYImeCxzPcvt91AOUviZJA0IhMwIakRH/hYxA9eqo5dceu5NwsaTLNAggt
         clhjlutkPz95ooj0QXlPuYiwK+UM6XJyKODIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=/3CjhislnGGqU2g8MmW8SwCvogvUhECLJdE3KndpOdQ=;
        b=YUpVXeubOD/fgshMvWJQY7/84Jy8Rr9NYaY7IUW6GV/GMQHMNdDPTblObaJlhNhqZk
         axdiRO4fPBku0xVXfAXhFobwsnFUR0MWcOTGjLY1jAmJ64KA5zsq/o/YzXPWbUnStXKt
         Gh9rmHDw/Dvqy0sA1tbcMtc0PDtXRXgeBlp86/3anjDM99ib6JsjzxS/IvQcVhQcdDbv
         Hfwk6TNh8YgTPPGjkRoVHuFDBfX8RTFXkrqopy/Ye9Gd6cq+8RVojaFJqehQKUHs0ER5
         7rcBXoBxWNsrkEGQGEMY7PTJDG3e8goez/E+F+goKpPukC6wSg4y63qWaxgxT4A9M4O9
         1Qnw==
X-Gm-Message-State: APzg51D+qyzzZYoZOoV8XWetNyQkmDK+xTMypqgwnv+E/XX1+GzCGzZw
        HjopLTppp4Ph6i7f+xWteW/qnA==
X-Google-Smtp-Source: ANB0VdZHj3KxyeDaWF/JYIT1EXJYxyf6nl7xIC92Uw6WS9AEZxQdlX6W45BI+cKoEDajQY/5s4wOLA==
X-Received: by 2002:a62:cc83:: with SMTP id j3-v6mr1231705pfk.255.1535049095292;
        Thu, 23 Aug 2018 11:31:35 -0700 (PDT)
Received: from kolhar.mtv.corp.google.com ([2620:15c:202:201:356a:9de2:526a:5bc])
        by smtp.gmail.com with ESMTPSA id p11-v6sm9054225pfj.72.2018.08.23.11.31.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 23 Aug 2018 11:31:34 -0700 (PDT)
From:   Harry Cutts <hcutts@chromium.org>
To:     linux-input <linux-input@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>
Cc:     Jiri Kosina <jiri.kosina@suse.cz>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Benjamin Tissoires <benjamin.tissoires@redhat.com>,
        Harry Cutts <hcutts@chromium.org>, linux-doc@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/3] Add the `REL_WHEEL_HI_RES` event code
Date:   Thu, 23 Aug 2018 11:30:55 -0700
Message-Id: <20180823183057.247630-2-hcutts@chromium.org>
X-Mailer: git-send-email 2.18.0.1017.ga543ac7ca45-goog
In-Reply-To: <20180823183057.247630-1-hcutts@chromium.org>
References: <20180823183057.247630-1-hcutts@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This event code represents scroll reports from high-resolution wheels,
and will be used by future patches in this series. See the linux-input
"Reporting high-resolution scroll events" thread [0] for more details.

[0]: https://www.spinics.net/lists/linux-input/msg57380.html

Signed-off-by: Harry Cutts <hcutts@chromium.org>
---

 Documentation/input/event-codes.rst    | 11 ++++++++++-
 include/uapi/linux/input-event-codes.h |  1 +
 2 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/Documentation/input/event-codes.rst b/Documentation/input/event-codes.rst
index a8c0873beb95..df024cb82829 100644
--- a/Documentation/input/event-codes.rst
+++ b/Documentation/input/event-codes.rst
@@ -190,7 +190,16 @@ A few EV_REL codes have special meanings:
 * REL_WHEEL, REL_HWHEEL:
 
   - These codes are used for vertical and horizontal scroll wheels,
-    respectively.
+    respectively. The value is the number of "notches" moved on the wheel, the
+    physical size of which varies by device. For high-resolution wheels (which
+    report multiple events for each notch of movement, or do not have notches)
+    this may be an approximation based on the high-resolution scroll events.
+
+* REL_WHEEL_HI_RES:
+
+  - If a vertical scroll wheel supports high-resolution scrolling, this code
+    will be emitted in addition to REL_WHEEL. The value is the (approximate)
+    distance travelled by the user's finger, in 256ths of a millimeter.
 
 EV_ABS
 ------
diff --git a/include/uapi/linux/input-event-codes.h b/include/uapi/linux/input-event-codes.h
index 53fbae27b280..dad8d3890a3a 100644
--- a/include/uapi/linux/input-event-codes.h
+++ b/include/uapi/linux/input-event-codes.h
@@ -708,6 +708,7 @@
 #define REL_DIAL		0x07
 #define REL_WHEEL		0x08
 #define REL_MISC		0x09
+#define REL_WHEEL_HI_RES	0x0a
 #define REL_MAX			0x0f
 #define REL_CNT			(REL_MAX+1)
 
-- 
2.18.0.1017.ga543ac7ca45-goog

