Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCD43257437
	for <linux-doc@vger.kernel.org>; Sat,  4 Oct 2025 23:50:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759621842; cv=none; b=nWfvQ+SLUXmlxCCpIZcmEAA8WWBdllqWXNDShEaTaIk+E96KosyaAK8W7ALQh3sOGzZKs7XnMLptvY5X2E0OvQaHJCseuCaYI4q8nEiR3c17VSVsS+zKsMbpfj6DrQuPVk5SnAgbsrCgGYAKJyC2QQFp5lV2zHQzND1b806zAFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759621842; c=relaxed/simple;
	bh=EXyB3no/ZYQZiw4k2sIVnM4eV2neGR0XKhmW6028cdM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tsf5a50Fx9ilwMffBeUdM6j6rOY0ewUc4dzW5ghmW+pjLmk99AJbz0r90YICPhG1tXhhqvuNUc1QroW82QMR5ioSoxbhUE4RH3o94SQ7GDxuwldLNpAOwqt78ygLaDVMMgYmH/CSrQPwf9oOW1/i8dZM/nVQZ2sqpK7iqyXyrlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gmr2ExC/; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gmr2ExC/"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-70ba7aa131fso37164456d6.2
        for <linux-doc@vger.kernel.org>; Sat, 04 Oct 2025 16:50:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759621840; x=1760226640; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PjU7oe93mN2yk67x3/TWExFFSzr4kO2WctOACXz9uio=;
        b=Gmr2ExC/ahizGo5cxeQXkFW86dwTO8nMHPObyB+wxLcnWNJ5HdwutrgO0Mltfvv/Wp
         3DpJQx02gbKTeEWPIPcqSZQZ8hZQyQU37b8iulUUG40wb1orggxB4lxiAmQGXdHi7VEg
         Bt/ja8gkzGcXVn510StpEomHonNZ7vA0Tyi1qKzXtntCsPDRxNApu/t0wo1+2M74qprP
         ny0gyr5oZsCrQH8lZJQUIfUnJYjMgPXtQf8/GsKY8akZeD885AmLqo514VWemvjZCD5o
         ODaUnyYMNiG7Y6AVn858kvmzM9f0IPom2W2Lwbw9Pvf0qjT7YRVevUkhPqu95vC8q4tu
         g67w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759621840; x=1760226640;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PjU7oe93mN2yk67x3/TWExFFSzr4kO2WctOACXz9uio=;
        b=SlrVeD8xuYj47jyQGcYHSb7bQTE55ALe7Pq7zslhX70oLY/xEtGU7y46n5i7LRz5Ns
         3jSWRry0QnWuQMsFzhHdM6dCUYYc8cwqWstfPDwpxuHUM/QMEAS35e2TKyaqeEmhQe3O
         wQzhkzHBO2ScChWkC1OJCMVfPRajxHX8b6zbqItgTlES5o9GiH7QnF+LAFuTuXlS6a+b
         ykIams3DS60BhzIQb27+T8H0T7nH8hmQXendpQt60HYQ6ahpvXVGAWKOkwNn3uit3wQV
         s2jR7H2U9Z+/Gg8n+niz9bisg1Dc0cy/OHUtZMgujK7NpNK9A4I06hR+VtEXAzNG4gtg
         dAgg==
X-Forwarded-Encrypted: i=1; AJvYcCVMY2oim65MTzR9q4olI7LK84m6yQRU//hwH9XnjzhdDYY3goG03XRFkPl3+Ro63o8AZGBM6MKZaDY=@vger.kernel.org
X-Gm-Message-State: AOJu0YymoUhU4R1GA+Q9cqOf6hdEFCsOeFOkouwk0N35vkgp1DoAITIL
	XL+C7MtUGFvpBq/UV61taouRwvLig/2QVeoU/7bSATXVMxeKsb2sbAMH
X-Gm-Gg: ASbGncuRmK43ZhepQq2xPhgq2B9o1nWchuecLNWan1JrD/8S432Kb3++vyH80IKUq0k
	9cBGktremmVQNBEW7+TkXgmcbxWV3zWx8OuJnnbmSDJqSnAqxoRU6H2XCtsGDAGqtCFF6x+jccq
	zTGSEOERzVCmlznc3+Gfk4s2elMOovwgyEYddtRq+isdthwKjQ6HPQjhERR2Iw+4eEqgP2ul6v2
	39yYfulotYZDwH4MmqTmDWpZutuCRkYnOjEE5mqCGtUgNt69poDdBKW4WsT5nwTAcLNxfJuoy6B
	cUdMCLbmXY6JsXUQ+h+A7RIDgMk3EERvFk4jAu2L7x5qhuyE4xWJVgRRkApK1aXlzOktnIO3mYw
	XLoRHUzID/JWIH5FTSXqZdetejlRjQO0l1V/QitdD5zzmwjJnwywO0K6lftTeZpNly3T4rlYmfI
	Cg5xaOyFA1cAHqi74=
X-Google-Smtp-Source: AGHT+IEUWXDZx+IAlNDV8Mu+BE5kMa9E4iKCTAQ71zUHKPBS5QeBaFqes3mcBdLmYCHeSFsI3jGX4w==
X-Received: by 2002:a05:6214:230f:b0:796:bfca:9c68 with SMTP id 6a1803df08f44-879dc77b87bmr86391786d6.3.1759621839475;
        Sat, 04 Oct 2025 16:50:39 -0700 (PDT)
Received: from seokw-960QHA.mynetworksettings.com ([2600:4041:4491:2000:dd54:e5ff:d4b7:cf43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-878bdf5383fsm76180216d6.56.2025.10.04.16.50.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Oct 2025 16:50:39 -0700 (PDT)
From: Ryan Chung <seokwoo.chung130@gmail.com>
To: rostedt@goodmis.org,
	mhiramat@kernel.org
Cc: mathieu.desnoyers@efficios.com,
	shuah@kernel.org,
	hca@linux.ibm.com,
	corbet@lwn.net,
	linux-trace-kernel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-doc@vger.kernel.org,
	seokwoo.chung130@gmail.com
Subject: [PATCH v3 4/5] selftests/ftrace: dynevent: add reject cases for list/:entry/:exit
Date: Sun,  5 Oct 2025 08:46:58 +0900
Message-ID: <20251004235001.133111-5-seokwoo.chung130@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251004235001.133111-1-seokwoo.chung130@gmail.com>
References: <20251004235001.133111-1-seokwoo.chung130@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Signed-off-by: Ryan Chung <seokwoo.chung130@gmail.com>
---
 .../test.d/dynevent/add_remove_fprobe.tc      | 121 ++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_fprobe.tc b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_fprobe.tc
index 2506f464811b..d5761d31217c 100644
--- a/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_fprobe.tc
+++ b/tools/testing/selftests/ftrace/test.d/dynevent/add_remove_fprobe.tc
@@ -2,6 +2,8 @@
 # SPDX-License-Identifier: GPL-2.0
 # description: Generic dynamic event - add/remove fprobe events
 # requires: dynamic_events "f[:[<group>/][<event>]] <func-name>[%return] [<args>]":README
+# Note: list-style specs and :entry/:exit may be unavailable on older kernels.
+# These tests auto-skip at runtime if the list form is rejected by tracefs.
 
 echo 0 > events/enable
 echo > dynamic_events
@@ -89,4 +91,123 @@ if [ $cnt -ne $ocnt ]; then
 	exit_fail
 fi
 
+# ---- New accept cases for list syntax with :entry/:exit and !-exclusions ----
+if echo "f:test/__list_check $PLACE,$PLACE3" >> dynamic_events 2> /dev/null; then
+	# Clean the probe added by the guard
+	echo "-:test/__list_check" >> dynamic_events
+
+	# List default (entry) with exclusion, explicit group/event
+	echo "f:test/list_entry $PLACE,!$PLACE2,$PLACE3" >> dynamic_events
+	grep -q "test/list_entry" dynamic_events
+	test -d events/test/list_entry
+
+	echo 1 > events/test/list_entry/enable
+	# Should attach to PLACE and PLACE3, but not PLACE2
+	grep -q "$PLACE" enabled_functions
+	grep -q "$PLACE3" enabled_functions
+	! grep -q "$PLACE2" enabled_functions
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $((ocnt + 2)) ]; then
+		exit_fail
+	fi
+
+	# Disable and remove; count should be back to baseline
+	echo 0 > events/test/list_entry/enable
+	echo "-:test/list_entry" >> dynamic_events
+	! grep -q "test/list_entry" dynamic_events
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $ocnt ]; then
+		exit_fail
+	fi
+
+	# List with explicit :entry suffix (same behavior as default)
+	echo "f:test/list_entry_exp $PLACE,!$PLACE2,$PLACE3:entry" >> dynamic_events
+	grep -q "test/list_entry_exp" dynamic_events
+	test -d events/test/list_entry_exp
+
+	echo 1 > events/test/list_entry_exp/enable
+	grep -q "$PLACE" enabled_functions
+	grep -q "$PLACE3" enabled_functions
+	! grep -q "$PLACE2" enabled_functions
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $((ocnt + 2)) ]; then
+		exit_fail
+	fi
+
+	echo 0 > events/test/list_entry_exp/enable
+	echo "-:test/list_entry_exp" >> dynamic_events
+	! grep -q "test/list_entry_exp" dynamic_events
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $ocnt ]; then
+		exit_fail
+	fi
+
+	# List with :exit suffix across the same set
+	echo "f:test/list_exit $PLACE,!$PLACE2,$PLACE3:exit" >> dynamic_events
+	grep -q "test/list_exit" dynamic_events
+	test -d events/test/list_exit
+
+	echo 1 > events/test/list_exit/enable
+	# On return probes, enabled_functions still reflects attached functions.
+	grep -q "$PLACE" enabled_functions
+	grep -q "$PLACE3" enabled_functions
+	! grep -q "$PLACE2" enabled_functions
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $((ocnt + 2)) ]; then
+		exit_fail
+	fi
+
+	echo 0 > events/test/list_exit/enable
+	echo "-:test/list_exit" >> dynamic_events
+	! grep -q "test/list_exit" dynamic_events
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $ocnt ]; then
+		exit_fail
+	fi
+
+	# Enabling entry and exit together does not double-count functions
+	echo "f:test/list_both_e $PLACE,!$PLACE2,$PLACE3" >> dynamic_events
+	echo "f:test/list_both_x $PLACE,!$PLACE2,$PLACE3:exit" >> dynamic_events
+	grep -q "test/list_both_e" dynamic_events
+	grep -q "test/list_both_x" dynamic_events
+	test -d events/test/list_both_e
+	test -d events/test/list_both_x
+
+	echo 1 > events/test/list_both_e/enable
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $((ocnt + 2)) ]; then
+		exit_fail
+	fi
+
+	# Enabling :exit for the same set should keep the count the same
+	echo 1 > events/test/list_both_x/enable
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $((ocnt + 2)) ]; then
+		exit_fail
+	fi
+
+	# Disable one; count should remain (the other still holds the attach)
+	echo 0 > events/test/list_both_e/enable
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $((ocnt + 2)) ]; then
+		exit_fail
+	fi
+
+	# Disable the other; count returns to baseline
+	echo 0 > events/test/list_both_x/enable
+	cnt=`cat enabled_functions | wc -l`
+	if [ $cnt -ne $ocnt ]; then
+		exit_fail
+	fi
+
+	# Remove both definitions
+	echo "-:test/list_both_e" >> dynamic_events
+	echo "-:test/list_both_x" >> dynamic_events
+	! grep -q "test/list_both_e" dynamic_events
+	! grep -q "test/list_both_x" dynamic_events
+else
+	# List-form not supported; skip silently
+	:
+fi
+
 clear_trace
-- 
2.43.0

