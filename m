Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC814014A3
	for <linux-doc@vger.kernel.org>; Tue,  2 Jun 2026 14:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780410447; cv=none; b=AQSLacovCNHd++3gj2eGOLRrL3GU55dO4BUOqpHyVeKWMDy9ZnUsMC6VxKmxkoGhkpqLYeQO1GzaS+IzwDpCqYbSmWUxdYAIdZ7HYxr6X2EtCyS+9501kZyfZBIKfasOIB//DxNLEFjE5XwYapjOUiknCHr6lEcDy6o2ZDjeVzU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780410447; c=relaxed/simple;
	bh=iUT08tpOWo4H1iSAdC58DZud+aEDvbyMcevKs0Feyvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fp0DhYFhNjgUyCYTqbuHWoo3VijwpbF+JXofiYg84r4fwrttqRIIvhh+DuUNXfpqCsacPaS9qEZTxF4HqIULCDP7O6K5EUXossUwxjTgGrEDmvKtpLWSx854Jb4Ujw6VMInMZodTZxosk1Jkifmqoqk+uabXPwzc/7b+tiinc7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=syovjOSA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="syovjOSA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4906869f0cbso107970825e9.1
        for <linux-doc@vger.kernel.org>; Tue, 02 Jun 2026 07:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780410443; x=1781015243; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=llwCw9245m15z/1KE/XxuBnoFO7VC0s0+/Pa/E5PIbw=;
        b=syovjOSAFuIey8dfdrXYavZMGfgs9M33I4JcutVRnTdSuAMsJL6v71BnF+pgQhhDsH
         q318yxP0HOwpWXu/o5ghPitk9QIKUpJp7w/D/DUdUTaKGR7UW/os3/fEj4mMqJUaa7xI
         BG95OZ03vbe+i/6j0Wm55zPEOA70M8EwQRSgxO2f/MIpEHBJYJPfyiydbMSq2tAEbtnR
         5DYWTpx4eCzqbjl++QoSxWwPJwuWtcKonfjLr8wUMVHylEFZ6mqKkSToaXaS330Sv/zH
         XofzFpUhEzIrnzQOdu3BOQSNHvX9s3W49+54HPnTfMlry0AZdbB6JdwKNNNUVBY4WIAJ
         p2TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780410443; x=1781015243;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=llwCw9245m15z/1KE/XxuBnoFO7VC0s0+/Pa/E5PIbw=;
        b=C/NRuOU4e3wDnv+/5a4BEY4J6w99HWT62ovoVKcYXy2r2OcekK3qcngoebMftO/eU7
         V/ah8uIRQTsLClMcQuSGYeFOe13EfKq0FvWc6fUAuFT7ja/3WgOQpOY+/h/aOQ1tQRZH
         fd7wFdmJ2Rvproho/HYJ/Qz4ELvtE/QqtTSL5CMjp9l/hzOsdxtbBhc2heu42oNQI4XV
         HSEm23BT1sKjJWK3K1E/VjXsOfrUtitAhnEJ/hW7jqlVVH92q8uCmezeQ6rYyr9pBZHd
         o2JtI1xQ4BqCz5cEGSEPPtZAUw52mWnp0hqH5bRYSXwPuCE6YLQ4yMVY9SsWKd/CFAbl
         dbbA==
X-Forwarded-Encrypted: i=1; AFNElJ+HTPPKgIinfdR7l3Ht+TjuB8U0OiFuJER5H9hV7PNvMoLrqFqVZP9ATIz0NPLMBvulMdbkg9WqOTY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4ik4LZNXIXbcUARa4gDM0VuDbx7d9doKDRLvEe5pUqGpMPVHd
	XOsavX4qIDUvnXxzDq0NYf3eMr7xY4iu+NBiV722W4Lqi9IU2CXue0Tuky/sed2xK/A=
X-Gm-Gg: Acq92OEEWRBhKHb5wrWwQGY2N2pqFUdQKgg17NyVc7soLC3WLNuY4XheEWHIMlTxRmL
	rjl6CtzeicA8FKyxDiZxrL14t5HbNnfB7ApZYfvxgayIuhXPU80KdkYLtlVpRB3cemv1w+nIsPU
	jFfz82QAiwJvuINz/aMrLkJXwH6T559LXsivTSZap9nC28Y4I2Qjzh5tt1VmHmQQMy0tfpRCNPx
	q8JGeIJA71bylpECSe9p9ECDoAiDVuhmyP72tstpI/2oLlJnhiwcQCP3jZTuoMgn47yBpg/N6ZT
	E9tWis+ULdGgSBe+ATCv9CMiouiDaQ6iqn2ZDhXLCS3yzaFx5eegpwKtV9oAzQkMy6ES1vUpOcW
	0Ti1vOfDGoi1Cp8elQfK85cjGOpmQbyppbhi5HkcgaLKVjZDWBiy1Oxt8asHjYDfNK+9/WLWrti
	K15JltBwCn3gmBbmYj+I5xyNC8UotCA8TjyWj5SetknO8=
X-Received: by 2002:a05:600c:c098:b0:489:1c32:210d with SMTP id 5b1f17b1804b1-490a2923cbbmr237213885e9.15.1780410442987;
        Tue, 02 Jun 2026 07:27:22 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b0e18e1csm66771965e9.4.2026.06.02.07.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Jun 2026 07:27:22 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 02 Jun 2026 15:26:44 +0100
Subject: [PATCH v2 02/18] perf test: Add workload-ctl option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-james-cs-context-tracking-fix-v2-2-85b5ce6f55c6@linaro.org>
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

Add a --workload-ctl=fifo:ctl-fifo[,ack-fifo] option for 'perf test
-w'. When set, run_workload() opens the named FIFO, writes enable before
invoking the builtin workload, writes disable before returning, and
waits for ack responses when an ack FIFO is provided to ensure that the
workload doesn't run until the events are enabled.

This can be used to limit the scope of the recording to only the
workload execution and avoid recording Perf setup and teardown code if
Perf record is started with events disabled (-D 1).

Assisted-by: Codex:GPT-5.5
Signed-off-by: James Clark <james.clark@linaro.org>
---
 tools/perf/Documentation/perf-test.txt |   6 ++
 tools/perf/tests/builtin-test.c        | 184 ++++++++++++++++++++++++++++++++-
 2 files changed, 188 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 32da0d1fa86a..1faf30d4a7be 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -69,3 +69,9 @@ OPTIONS
 
 --list-workloads::
 	List the available workloads to use with -w/--workload.
+
+--workload-ctl=fifo:ctl-fifo[,ack-fifo]::
+	Write 'enable' to ctl-fifo before running the workload and 'disable'
+	before returning. If ack-fifo is provided, the workload runner waits for
+	an 'ack' response after each command. This scopes the recording to only
+	the workload if used with 'perf record -D 1 --control ...'.
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index f2c135891477..d5df3efdce3b 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -50,6 +50,7 @@ static bool sequential;
 static unsigned int runs_per_test = 1;
 const char *dso_to_test;
 const char *test_objdump_path = "objdump";
+static const char *workload_control;
 
 /*
  * List of architecture specific tests. Not a weak symbol as the array length is
@@ -161,6 +162,11 @@ static struct test_workload *workloads[] = {
 #endif
 };
 
+struct workload_control {
+	int ctl_fd;
+	int ack_fd;
+};
+
 #define workloads__for_each(workload) \
 	for (unsigned i = 0; i < ARRAY_SIZE(workloads) && ({ workload = workloads[i]; 1; }); i++)
 
@@ -711,13 +717,185 @@ static int workloads__fprintf_list(FILE *fp)
 	return printed;
 }
 
+static int perf_control_open_fifo(struct workload_control *ctl, const char *str)
+{
+	char *s, *p;
+	int ret;
+
+	if (strncmp(str, "fifo:", 5))
+		return -EINVAL;
+
+	str += 5;
+	if (!*str || *str == ',')
+		return -EINVAL;
+
+	s = strdup(str);
+	if (!s)
+		return -ENOMEM;
+
+	p = strchr(s, ',');
+	if (p)
+		*p = '\0';
+
+	ctl->ctl_fd = open(s, O_WRONLY | O_CLOEXEC);
+	if (ctl->ctl_fd < 0) {
+		ret = -errno;
+		pr_err("Failed to open workload control FIFO '%s': %m\n", s);
+		free(s);
+		return ret;
+	}
+
+	if (p && *++p) {
+		ctl->ack_fd = open(p, O_RDONLY | O_CLOEXEC);
+		if (ctl->ack_fd < 0) {
+			ret = -errno;
+			pr_err("Failed to open workload control ack FIFO '%s': %m\n", p);
+			close(ctl->ctl_fd);
+			ctl->ctl_fd = -1;
+			free(s);
+			return ret;
+		}
+	}
+
+	free(s);
+	return 0;
+}
+
+static int perf_control_open(struct workload_control *ctl)
+{
+	int ret;
+
+	if (!workload_control)
+		return 0;
+
+	ret = perf_control_open_fifo(ctl, workload_control);
+
+	if (ret == -EINVAL) {
+		pr_err("Unsupported workload control spec '%s', expected fifo:ctl-fifo[,ack-fifo]\n",
+			workload_control);
+	}
+
+	return ret;
+}
+
+static void perf_control_close(struct workload_control *ctl)
+{
+	if (ctl->ctl_fd >= 0) {
+		close(ctl->ctl_fd);
+		ctl->ctl_fd = -1;
+	}
+	if (ctl->ack_fd >= 0) {
+		close(ctl->ack_fd);
+		ctl->ack_fd = -1;
+	}
+}
+
+static int perf_control_write_cmd(int fd, const char *cmd)
+{
+	size_t len = strlen(cmd);
+	ssize_t ret;
+
+	while (len) {
+		ret = write(fd, cmd, len);
+		if (ret < 0) {
+			if (errno == EINTR)
+				continue;
+			pr_err("Failed to write perf control command '%s': %m\n", cmd);
+			return -1;
+		}
+
+		if (!ret) {
+			pr_err("Failed to write perf control command '%s': short write\n", cmd);
+			return -1;
+		}
+
+		cmd += ret;
+		len -= ret;
+	}
+
+	return 0;
+}
+
+static int perf_control_read_ack(int fd)
+{
+	char buf[16];
+	ssize_t ret;
+
+	do {
+		ret = read(fd, buf, sizeof(buf) - 1);
+	} while (ret < 0 && errno == EINTR);
+
+	if (ret < 0) {
+		pr_err("Failed to read perf control ack: %m\n");
+		return -1;
+	}
+
+	if (!ret) {
+		pr_err("Unexpected EOF while reading perf control ack\n");
+		return -1;
+	}
+
+	buf[ret] = '\0';
+	for (ssize_t i = 0; i < ret; i++) {
+		if (buf[i] == '\n' || buf[i] == '\0') {
+			buf[i] = '\0';
+			break;
+		}
+	}
+
+	if (strcmp(buf, "ack")) {
+		pr_err("Unexpected perf control ack: %s\n", buf);
+		return -1;
+	}
+
+	return 0;
+}
+
+static int perf_control_send(struct workload_control *ctl, const char *cmd)
+{
+	if (ctl->ctl_fd < 0)
+		return 0;
+
+	if (perf_control_write_cmd(ctl->ctl_fd, cmd))
+		return -1;
+
+	if (ctl->ack_fd >= 0 && perf_control_read_ack(ctl->ack_fd))
+		return -1;
+
+	return 0;
+}
+
 static int run_workload(const char *work, int argc, const char **argv)
 {
 	struct test_workload *twl;
 
 	workloads__for_each(twl) {
-		if (!strcmp(twl->name, work))
-			return twl->func(argc, argv);
+		struct workload_control ctl = {
+			.ctl_fd = -1,
+			.ack_fd = -1,
+		};
+		int control_ret, ret;
+
+		if (strcmp(twl->name, work))
+			continue;
+
+		ret = perf_control_open(&ctl);
+		if (ret)
+			return ret;
+
+		if (perf_control_send(&ctl, "enable\n")) {
+			perf_control_close(&ctl);
+			return -1;
+		}
+
+		ret = twl->func(argc, argv);
+
+		control_ret = perf_control_send(&ctl, "disable\n");
+		perf_control_close(&ctl);
+		if (control_ret)
+			return -1;
+
+		return ret;
 	}
 
 	pr_info("No workload found: %s\n", work);
@@ -799,6 +977,8 @@ int cmd_test(int argc, const char **argv)
 	OPT_UINTEGER('r', "runs-per-test", &runs_per_test,
 		     "Run each test the given number of times, default 1"),
 	OPT_STRING('w', "workload", &workload, "work", "workload to run for testing, use '--list-workloads' to list the available ones."),
+	OPT_STRING(0, "workload-ctl", &workload_control, "fifo:ctl-fifo[,ack-fifo]",
+		   "Write enable to the fifo just before running the workload and disable after, with optional ack from ack-fifo"),
 	OPT_BOOLEAN(0, "list-workloads", &list_workloads, "List the available builtin workloads to use with -w/--workload"),
 	OPT_STRING(0, "dso", &dso_to_test, "dso", "dso to test"),
 	OPT_STRING(0, "objdump", &test_objdump_path, "path",

-- 
2.34.1

