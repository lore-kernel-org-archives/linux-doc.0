Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFF4B423158
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410459; cv=none; b=cI16Oy3HvYyvS+kgFC4154Nbjn4yvW0I0c+ZsYVMSQQgTj3iqJPYAAKzDC1yUuMLTjhIPXp4EKZO2gYNvj2fPmfE4voEg2rvaN7hqOZvvykGvFd2b34wwFTN1OewS2o4ATcJfCAIhBMa5JvFdB9J/+Ak88qmVUi47jnQevzZdh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410459; c=relaxed/simple;
	bh=Vebm4GlJiLVnJYDjVjznOc3fuBf50TfDyVZ1u6hrZBk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OJUkW7pdkW3Rhanlx4a6acY/b0eC6+9C0CA4XK2GJf+Y9Ev2wYKMusawU35yeDkWVSwUhRa/buwGiWLvJFDt50Nx7RhgsNpr2GeNzexNZbQW+6csYJqJHFHogKPI2Eeo21XRNqIuJGxmdgIjYcsQVjcmvdcrie2k/lLm8iF0ozM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Gn/1KSMp; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Gn/1KSMp"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-490b2b037d2so6021765e9.3
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410456; x=1781015256; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k+iZ6FY03jm4PeAHyOI8fNsNwbPR2PmNKt6aEgZZmgI=;
        b=Gn/1KSMpfaPFib1BMtiNIAq5FWuujj/a+uqMvk4FPZ1k9GL29Jm5SHO6ADyjzrc/j+
         Rb/C4LiCfnUFSEjDM9KThFdK4MVVb4nqRB8xe8y6tMEOiX5NmK16IsRtet+5kSvXnxhh
         2QnEqoKGLEbnWiCM+XfSxMk6R1bOt9rJ02+qHY7e8Dzp4hwZCYIfU9dg5bZYDnFGF8KU
         riUCqbZvA6otwRzjjZh5UBFjE5AflaScTyaHplThFgOqP9m3lHNpzxMv9RBgaCsrz6Xe
         +UhjAIx/nnD/651SD1pmPyv6UsamylvSMpvMPrnKsx67LCbdR6MhrewGjjNujMfdg17j
         QAnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410456; x=1781015256;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=k+iZ6FY03jm4PeAHyOI8fNsNwbPR2PmNKt6aEgZZmgI=;
        b=XpHa2kagqjxhsfsS8bZV0QYJDe9tSDz5h8y6oEI8h6LvUNmo5NXLPUCtm+qfhjbI7+
         +gIDj1zlMcAfp79IeWC9+q+XaDT8u+frdYIINRX4ouLtTKy5WgYNGnF/YqMlfY1odgOL
         Ab5XXoGJTYiVFMT5sQyJt4Pn/6e6f9bnKypvz7u4pqC9H3JH/2C2bEJXBHiUsanPmKgU
         1eXtqqDKQAr0Qk+c9m+rxC62ivuC446j6PGl69158e8EWuazVr1Xv5m3raD0fRFGqBkP
         Fkw6QlD+2/574txE+yrG5LYntc9KhoDL4mcJfJajfL6DHYTvr8m8o1eFmEPtrIOVogzS
         xIxA==
X-Forwarded-Encrypted: i=1; AFNElJ9PTg77FprPMu3Aa3Z2gR8wBRmQrod39JSf+nW14d/FpNmUjMuybX+YAMbXchv6i1xbquKzyZd6k0U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzwkYlc74ZHM83J9hAKcJMPWd2+Nwvul+BvP8KFVntTupVNdzz9
	wLrkpQbmsv3/nFFm7LaB4KwfYIQ1lbc9JIhfLm+rs3uOzKfY0y90XBQGoUwJyD/VXXM=
X-Gm-Gg: Acq92OHl1sa43d8dsYzn+v6bc88W7dveXPPTAo6SADJQP4OUxN12wNjPEK9B9RQWmNj
	6+emSzgpOT8PzqFvloJQnFMLIlJmMjgLoqAkN08na+aCe5RCl32Y01ulQrBBEWuavANDV5D+eIj
	zSplPz2Ecitutl8dhP8mlQKREAceGReF3P0Iwu5w4lbRuHAJ6KutsrDsdqQV1AljU1s8jaxYSYr
	84hoGlD0rYfRxcLG4F10Z5Y72PRowUHGhZ9JYAuMWBsiN2oA8dwTxpNNHOg9KJ5kpnwSqZB/hPk
	DJpYBR2uUtqxSMW4ISg2y0kq0ZrGIz8og6bxwL27dropgN1W0JRsOIKiFwAmz/pwbFYP/jxHTNu
	McU3rFkg4Yn2H4QXS2L+v38w/OjjSAnlcYOiucTTrsa/+A3hAqCw3D2ZFVoOnl9yOv+M9cbIGpo
	EI2co9a6V6XPRiQgSr7cFkalUUOvI0vfjhk9jI1PIqiuI=
X-Received: by 2002:a05:600d:848a:b0:490:9d1b:f06b with SMTP id 5b1f17b1804b1-490a2943afamr206045645e9.26.1780410456096;
        Tue, 02 Jun 2026 07:27:36 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:35 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:57 +0100
Subject: [PATCH v2 15/18] perf test cs-etm: Make disassembly test use kcore
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-15-85b5ce6f55c6@linaro.org>
References: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
In-Reply-To: <20260602-james-cs-context-tracking-fix-v2-0-85b5ce6f55c6@linaro.org>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, Leo Yan <leo.yan@arm.com>, 
 Arnaldo Carvalho de Melo <acme@kernel.org>, 
 Namhyung Kim <namhyung@kernel.org>, Jiri Olsa <jolsa@kernel.org>, 
 Ian Rogers <irogers@google.com>, Amir Ayupov <aaupov@meta.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Paschalis Mpeis <Paschalis.Mpeis@arm.com>
Cc: coresight@lists.linaro.org, linux-perf-users@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>, 
 linux-doc@vger.kernel.org, James Clark <james.clark@linaro.org>
X-Mailer: b4 0.14.0

Hits in modules return empty disassembly with vmlinux as an input to
objdump. Make the disassembly test more reliable by always using kcore.
And update the comments to say that this is supported by the script.

Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/scripts/python/arm-cs-trace-disasm.py    | 20 ++++++++++----------
 tools/perf/tests/shell/test_arm_coresight_disasm.sh |  2 +-
 2 files changed, 11 insertions(+), 11 deletions(-)

diff --git a/tools/perf/scripts/python/arm-cs-trace-disasm.py b/tools/perf/scripts/python/arm-cs-trace-disasm.py
index ba208c90d631..8f6fa4a007b4 100755
--- a/tools/perf/scripts/python/arm-cs-trace-disasm.py
+++ b/tools/perf/scripts/python/arm-cs-trace-disasm.py
@@ -18,29 +18,29 @@ from perf_trace_context import perf_sample_srccode, perf_config_get
 
 # Below are some example commands for using this script.
 # Note a --kcore recording is required for accurate decode
-# due to the alternatives patching mechanism. However this
-# script only supports reading vmlinux for disassembly dump,
-# meaning that any patched instructions will appear
-# as unpatched, but the instruction ranges themselves will
-# be correct. In addition to this, source line info comes
-# from Perf, and when using kcore there is no debug info. The
-# following lists the supported features in each mode:
+# due to the alternatives patching mechanism. In addition to this,
+# source line info comes from Perf, and when using kcore there is
+# no debug info. The following lists the supported features in each mode:
 #
 # +-----------+-----------------+------------------+------------------+
 # | Recording | Accurate decode | Source line dump | Disassembly dump |
 # +-----------+-----------------+------------------+------------------+
 # | --kcore   | yes             | no               | yes              |
-# | normal    | no              | yes              | yes              |
+# | normal    | no              | yes (inaccurate) | yes (inaccurate) |
 # +-----------+-----------------+------------------+------------------+
 #
 # Output disassembly with objdump and auto detect vmlinux
-# (when running on same machine.)
+# (when running on same machine.):
 #  perf script -s scripts/python/arm-cs-trace-disasm.py -d
 #
 # Output disassembly with llvm-objdump:
 #  perf script -s scripts/python/arm-cs-trace-disasm.py \
 #		-- -d llvm-objdump-11 -k path/to/vmlinux
 #
+# Output accurate disassembly by passing kcore to script:
+#  perf script -s scripts/python/arm-cs-trace-disasm.py \
+#		-- -d -k perf.data/kcore_dir/kcore
+#
 # Output only source line and symbols:
 #  perf script -s scripts/python/arm-cs-trace-disasm.py
 
@@ -57,7 +57,7 @@ def int_arg(v):
 
 args = argparse.ArgumentParser()
 args.add_argument("-k", "--vmlinux",
-		  help="Set path to vmlinux file. Omit to autodetect if running on same machine")
+		  help="Set path to vmlinux or kcore file. Omit to autodetect if running on same machine")
 args.add_argument("-d", "--objdump", nargs="?", const=default_objdump(),
 		  help="Show disassembly. Can also be used to change the objdump path"),
 args.add_argument("-v", "--verbose", action="store_true", help="Enable debugging log")
diff --git a/tools/perf/tests/shell/test_arm_coresight_disasm.sh b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
index 0dfb4fadf531..8b5c60a09012 100755
--- a/tools/perf/tests/shell/test_arm_coresight_disasm.sh
+++ b/tools/perf/tests/shell/test_arm_coresight_disasm.sh
@@ -46,7 +46,7 @@ if [ -e /proc/kcore ]; then
 	echo "Testing kernel disassembly"
 	perf record -o ${perfdata} -e cs_etm//k --kcore -- touch $file > /dev/null 2>&1
 	perf script -i ${perfdata} -s python:${script_path} -- \
-		-d --stop-sample=30 2> /dev/null > ${file}
+		-d --stop-sample=30 -k ${perfdata}/kcore_dir/kcore 2> /dev/null > ${file}
 	grep -q -e ${branch_search} ${file}
 	echo "Found kernel branches"
 else

-- 
2.34.1

