Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4D9F67DD32
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Apr 2018 16:57:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752390AbeDCQ4j (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Apr 2018 12:56:39 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:52584 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752668AbeDCQ4e (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Apr 2018 12:56:34 -0400
Received: by mail-wm0-f66.google.com with SMTP id g8so11175034wmd.2
        for <linux-doc@vger.kernel.org>; Tue, 03 Apr 2018 09:56:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=rxtnUI3p1GsBtqRp2B3JxIfOOkXoEl068vMKrmiCCxI=;
        b=dQ6a9gJCYxhdgR6A7+8XVUle+yr/6xsLKKsSc5yZnkX5yah01298MkXORGVzIJbtCV
         XSrXBcFlbRFg8SCv444jW49Oe/4yZq/tGjcx7vb9d7teN3t7CF4ag5Wmbm5Q0rsCxMfp
         JsaTICXOrWuA2BYuhvNvdkSZozChy5eNvOKLg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=rxtnUI3p1GsBtqRp2B3JxIfOOkXoEl068vMKrmiCCxI=;
        b=qgkMf74b6OORM8EJ6rk1Syr45iTGA3L59aui+AXSG2PX5NU1pHdModR+4DXxxMkeut
         /eWKhSlP/0Pbbm1iQShJ7xB6ipmUUKnw0yxVH46v6M7idEvjnr4gCGmpPJYD4mxorWva
         B1Ui5WEocMSCnP3eAO9eb2HIu9XYDcFH7000hlS6V9MBGCmXTvbFZkkrrFIHGhWChOtd
         yZ8Xb1Y/Asq2bIVsS3IEL45/ZfFtKbO4T9oRNMdKzaaIuKKcgyMPr4NKZZ+VI+5WMsgV
         ougN21ekOA1JcBUyFCqzU4I0q13PdJ61GEw/+lpdUkNrUzv7ctuSK+xJX/jm1NXi7+Lr
         99IQ==
X-Gm-Message-State: ALQs6tAb5trkMcRBUbdyG04KUk9EOyMg+YZ/C1vRStuj7vxBBPQNvTvL
        UGMJGlgOPIKA493aOwPuklCvBg==
X-Google-Smtp-Source: AIpwx49U8t8FjuihOieQAQWuNCthzem0orfX/5v+9q+GCdeeFopfK20J+YjkooIiN/QZT2Y+5vl20A==
X-Received: by 10.28.124.13 with SMTP id x13mr4329891wmc.71.1522774593624;
        Tue, 03 Apr 2018 09:56:33 -0700 (PDT)
Received: from localhost.localdomain ([213.209.242.222])
        by smtp.gmail.com with ESMTPSA id 135sm1653885wmv.12.2018.04.03.09.56.32
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Tue, 03 Apr 2018 09:56:33 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-arch@vger.kernel.org,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [PATCH 1/3] Documentation/features: Add script that refreshes the arch support status files in place
Date:   Tue,  3 Apr 2018 18:55:49 +0200
Message-Id: <1522774551-9503-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1522774551-9503-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
---
 Documentation/features/scripts/features-refresh.sh | 55 ++++++++++++++++++++++
 1 file changed, 55 insertions(+)
 create mode 100755 Documentation/features/scripts/features-refresh.sh

diff --git a/Documentation/features/scripts/features-refresh.sh b/Documentation/features/scripts/features-refresh.sh
new file mode 100755
index 0000000000000..ae3e9d5d3f262
--- /dev/null
+++ b/Documentation/features/scripts/features-refresh.sh
@@ -0,0 +1,55 @@
+#
+# Small script that refreshes the kernel feature support status in place.
+#
+
+for F_FILE in Documentation/features/*/*/arch-support.txt; do
+	K=$(grep "^#         Kconfig:" "$F_FILE" | cut -c26-)
+	K_VALID="false" # K is 'valid' iff there exists a Kconfig file
+			# (for some arch) containing K.
+
+	for ARCH_DIR in arch/*/; do
+		K_FILES=$(find $ARCH_DIR -name "Kconfig*")
+
+		K_GREP=$(grep "$K" $K_FILES)
+		if [ ! -z "$K_GREP" ]; then
+			K_VALID="true"
+			break
+		fi
+	done
+
+	if [ "$K_VALID" = "false" ]; then
+		printf "WARNING: '%s' is not a valid Kconfig\n" "$K"
+	fi
+
+	T_FILE="$F_FILE.tmp"
+
+	grep "^#" $F_FILE > $T_FILE
+	echo "    -----------------------" >> $T_FILE
+	echo "    |         arch |status|" >> $T_FILE
+	echo "    -----------------------" >> $T_FILE
+
+	for ARCH_DIR in arch/*/; do
+		ARCH=$(echo $ARCH_DIR | sed -e 's/arch//g' | sed -e 's/\///g')
+		K_FILES=$(find $ARCH_DIR -name "Kconfig*")
+
+		K_GREP=$(grep "$K" $K_FILES)
+		if [ ! -z "$K_GREP" ]; then
+			# K is 'supported by a given arch', if there exists
+			# a Kconfig file for this arch containing K.
+			printf "    |%12s: |  ok  |\n" "$ARCH" >> $T_FILE
+		else
+			# ... Otherwise: Keep the original status (if any);
+			# default to "not yet supported".
+			S=$(grep -v "^#" "$F_FILE" | grep " $ARCH:")
+			if [ ! -z "$S" ]; then
+				echo "$S" >> $T_FILE
+			else
+				printf "    |%12s: | TODO |\n" "$ARCH" \
+					>> $T_FILE
+			fi
+		fi
+	done
+
+	echo "    -----------------------" >> $T_FILE
+	mv $T_FILE $F_FILE
+done
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
