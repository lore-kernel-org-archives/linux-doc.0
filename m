Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 12DE47DD32
	for <lwn-linux-doc@archive.lwn.net>; Sun,  8 Apr 2018 16:31:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752627AbeDHQbY (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 8 Apr 2018 12:31:24 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:51502 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752448AbeDHQbX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Apr 2018 12:31:23 -0400
Received: by mail-wm0-f68.google.com with SMTP id u189so13025420wmd.1
        for <linux-doc@vger.kernel.org>; Sun, 08 Apr 2018 09:31:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=tffkg0UCmX+aCLk6GDQFZ/6ZOVerjt9erI+txvXEuiI=;
        b=iBsaGQbJ5ZW1XVqXnS6qjvhM3Qcbz5ijn9nO2nNTa4B3ON62Vb7AdVPGphHiYwajwe
         lEs0SBz7plZJAv5PcASW3OsCiXyKhjnwSTXASWGoK+dmVWpp8L87/DqhlKKZpI/jm18w
         Q15nNhOMiJExNdV9YNaIFemqGCHoWVJLpbrs8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=tffkg0UCmX+aCLk6GDQFZ/6ZOVerjt9erI+txvXEuiI=;
        b=XO7Sr0pbXymperK6/A7nUFtc6WgRh5Ex7xZbinMDPkvPVq/soOtWLOmTcON4DAqrqY
         OKS7S+6AH4S5FCl11e5mo1Qk0oF/92LlzzUYCo7JR5Tb7mYYPupSXJly3rQiG0mzcChx
         PjVKhok9HrXs8yCurD+/0dZvMmcFO8DyoOkNgQuMVlBQ6gyTxfvShL0SFkdiyWyTbS/2
         iQghs4dz1Kp3CvCDcPz3dD10Pds86q1x+R5faL7NTzTO76ywOxqPjdRGBIkc5kaD0Cly
         yySz7nXYhP4IF4fZlBaPblGw7BLvgcS1+lJat1wTLydIaz+Q+1FteJCK7CxwRFDczOjp
         VHFA==
X-Gm-Message-State: ALQs6tAm9IOmZbTXFYZFtKwYAF3Y+TeKf3upGO8mosLDFARUYM5YDaMZ
        YQlI79Ya9EXNeP57+D7ziqkEOMDz
X-Google-Smtp-Source: AIpwx495d1Ax9nevo/H3htB8c0JdFMB8XMQq15KEhDX41DGjntR7LDVG2HaYLOaFCGFWGQbcEo24EA==
X-Received: by 10.28.241.18 with SMTP id p18mr19430848wmh.40.1523205082210;
        Sun, 08 Apr 2018 09:31:22 -0700 (PDT)
Received: from localhost.localdomain ([95.235.67.87])
        by smtp.gmail.com with ESMTPSA id 10sm5335894wrz.58.2018.04.08.09.31.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Sun, 08 Apr 2018 09:31:21 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v2 1/6] Documentation/features: Add script that refreshes the arch support status files in place
Date:   Sun,  8 Apr 2018 18:30:22 +0200
Message-Id: <1523205027-31786-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1523205027-31786-1-git-send-email-andrea.parri@amarulasolutions.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Provides the script:

	Documentation/features/scripts/features-refresh.sh

which operates on the arch-support.txt files and refreshes them in place.

This way [1],

   "[...] we soft- decouple the refreshing of the entries from the
    introduction of the features, while still making it all easy to
    keep sync and to extend."

[1] https://marc.info/?l=linux-kernel&m=152240950509781&w=2

Suggested-by: Ingo Molnar <mingo@kernel.org>
Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
Cc: Ingo Molnar <mingo@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 Documentation/features/scripts/features-refresh.sh | 98 ++++++++++++++++++++++
 1 file changed, 98 insertions(+)
 create mode 100755 Documentation/features/scripts/features-refresh.sh

diff --git a/Documentation/features/scripts/features-refresh.sh b/Documentation/features/scripts/features-refresh.sh
new file mode 100755
index 0000000000000..9e72d38a0720e
--- /dev/null
+++ b/Documentation/features/scripts/features-refresh.sh
@@ -0,0 +1,98 @@
+#
+# Small script that refreshes the kernel feature support status in place.
+#
+
+for F_FILE in Documentation/features/*/*/arch-support.txt; do
+	F=$(grep "^#         Kconfig:" "$F_FILE" | cut -c26-)
+
+	#
+	# Each feature F is identified by a pair (O, K), where 'O' can
+	# be either the empty string (for 'nop') or "not" (the logical
+	# negation operator '!'); other operators are not supported.
+	#
+	O=""
+	K=$F
+	if [[ "$F" == !* ]]; then
+		O="not"
+		K=$(echo $F | sed -e 's/^!//g')
+	fi
+
+	#
+	# F := (O, K) is 'valid' iff there is a Kconfig file (for some
+	# arch) which contains K.
+	#
+	# Notice that this definition entails an 'asymmetry' between
+	# the case 'O = ""' and the case 'O = "not"'. E.g., F may be
+	# _invalid_ if:
+	#
+	# [case 'O = ""']
+	#   1) no arch provides support for F,
+	#   2) K does not exist (e.g., it was renamed/mis-typed);
+	#
+	# [case 'O = "not"']
+	#   3) all archs provide support for F,
+	#   4) as in (2).
+	#
+	# The rationale for adopting this definition (and, thus, for
+	# keeping the asymmetry) is:
+	#
+	#       We want to be able to 'detect' (2) (or (4)).
+	#
+	# (1) and (3) may further warn the developers about the fact
+	# that K can be removed.
+	#
+	F_VALID="false"
+	for ARCH_DIR in arch/*/; do
+		K_FILES=$(find $ARCH_DIR -name "Kconfig*")
+		K_GREP=$(grep "$K" $K_FILES)
+		if [ ! -z "$K_GREP" ]; then
+			F_VALID="true"
+			break
+		fi
+	done
+	if [ "$F_VALID" = "false" ]; then
+		printf "WARNING: '%s' is not a valid Kconfig\n" "$F"
+	fi
+
+	T_FILE="$F_FILE.tmp"
+	grep "^#" $F_FILE > $T_FILE
+	echo "    -----------------------" >> $T_FILE
+	echo "    |         arch |status|" >> $T_FILE
+	echo "    -----------------------" >> $T_FILE
+	for ARCH_DIR in arch/*/; do
+		ARCH=$(echo $ARCH_DIR | sed -e 's/arch//g' | sed -e 's/\///g')
+		K_FILES=$(find $ARCH_DIR -name "Kconfig*")
+		K_GREP=$(grep "$K" $K_FILES)
+		#
+		# Arch support status values for (O, K) are updated according
+		# to the following rules.
+		#
+		#   - ("", K) is 'supported by a given arch', if there is a
+		#     Kconfig file for that arch which contains K;
+		#
+		#   - ("not", K) is 'supported by a given arch', if there is
+		#     no Kconfig file for that arch which contains K;
+		#
+		#   - otherwise: preserve the previous status value (if any),
+		#                default to 'not yet supported'.
+		#
+		# Notice that, according these rules, invalid features may be
+		# updated/modified.
+		#
+		if [ "$O" = "" ] && [ ! -z "$K_GREP" ]; then
+			printf "    |%12s: |  ok  |\n" "$ARCH" >> $T_FILE
+		elif [ "$O" = "not" ] && [ -z "$K_GREP" ]; then
+			printf "    |%12s: |  ok  |\n" "$ARCH" >> $T_FILE
+		else
+			S=$(grep -v "^#" "$F_FILE" | grep " $ARCH:")
+			if [ ! -z "$S" ]; then
+				echo "$S" >> $T_FILE
+			else
+				printf "    |%12s: | TODO |\n" "$ARCH" \
+					>> $T_FILE
+			fi
+		fi
+	done
+	echo "    -----------------------" >> $T_FILE
+	mv $T_FILE $F_FILE
+done
-- 
2.7.4

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
