Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9703D7E27F
	for <lwn-linux-doc@archive.lwn.net>; Mon,  7 May 2018 10:45:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752064AbeEGKoX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 7 May 2018 06:44:23 -0400
Received: from mail-wr0-f193.google.com ([209.85.128.193]:39374 "EHLO
        mail-wr0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752207AbeEGKoT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 May 2018 06:44:19 -0400
Received: by mail-wr0-f193.google.com with SMTP id q3-v6so28243431wrj.6
        for <linux-doc@vger.kernel.org>; Mon, 07 May 2018 03:44:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=fMK3bZ8DXYttf0uxQEWi+Q/Qkeszj88c6v7MKcLrIlU=;
        b=B59gCYWQwDROP0XMGARsta8yTq8dgzsxKUM1NpLM6FEGGsXKcfcRWGR+vQYDIdYXS+
         p3Ic7DxJhRx7bpWY3/FwzjlTPc4d9T/zA9BnvDi4fTDak+6GZRq61SGPWYQ7vKP+g+dO
         h8aPDecluSSyVlv0T7LXYH8sHUKyf3nw6dExU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=fMK3bZ8DXYttf0uxQEWi+Q/Qkeszj88c6v7MKcLrIlU=;
        b=awHNDIbIZjBswVbP9mJIEkacvOqdPhxXVkX7L7HuJpA6g69gegYA5IYGynK1oSQEUr
         OONqT2hd7jvQnASPWBTOywXZsIq9p4i2aGAG1n5mFMFCDE84SbjN3K0h7E0085RTZJ0f
         x/KH8RDuQShK2rBHmJytsSUJ2MgqBCZr180aTzcrpQ96WaCSrY4tZ7tJJPVjnbnAsmWC
         U691KcFirhRoqTN9deAZ2KBR9xPvAGhC9VoK9iOfp1hPhKTj1L+fZJuNKqK1L5U/EU3M
         sO9lpqYu6IBlOVEP/Tq+Vx7j17dafRmU1eyQbPmGQ+ciwho7eVyM9nk6rHlAt4P8XYJz
         Rz/A==
X-Gm-Message-State: ALQs6tCjR5UOrxSPv42Xo7440qZGnmqbqwNFheNcgot494gKDYeqIs88
        K1TIUgYsNDsuirCo7CKuYaSxpg==
X-Google-Smtp-Source: AB8JxZogeYrEcUnKsmeXt8zzdkFCD4xvpJZU7/iiBaO/+QNS5bJhe0vGWrRLVfFsInrxoyQSJtfe2Q==
X-Received: by 2002:adf:db0b:: with SMTP id s11-v6mr27976004wri.241.1525689857312;
        Mon, 07 May 2018 03:44:17 -0700 (PDT)
Received: from andrea.amarulasolutions.com (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id k82-v6sm7427307wmf.17.2018.05.07.03.44.15
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Mon, 07 May 2018 03:44:16 -0700 (PDT)
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc:     linux-doc@vger.kernel.org, linux-arch@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        paulmck@linux.vnet.ibm.com,
        Andrea Parri <andrea.parri@amarulasolutions.com>
Subject: [RFC PATCH v3 1/6] Documentation/features: Add script that refreshes the arch support status files in place
Date:   Mon,  7 May 2018 12:43:38 +0200
Message-Id: <1525689823-3340-2-git-send-email-andrea.parri@amarulasolutions.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
References: <1525689823-3340-1-git-send-email-andrea.parri@amarulasolutions.com>
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

[1] http://lkml.kernel.org/r/20180328122211.GA25420@andrea

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
