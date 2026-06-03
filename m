Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4947235F192
	for <linux-doc@vger.kernel.org>; Wed,  3 Jun 2026 10:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780481847; cv=none; b=s7gGpGlMinGvt7nue+xSlYceGtH5cwV+O4y4Zf8IBM/+F/rfB1yMlUJsDwBtcc5sUw6tWvHihtFHW/TXh6N6ZRWUSyaCLXeliQAdlUUsT/2fIqFldAlfxhrYr3PO8XvQ9X4Y2TMwFIMQz3gigrkAd+9nGN5zL/GSZZ/K2SBs/ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780481847; c=relaxed/simple;
	bh=aR1osBtg8+dXgkU8gRUvP5gNGrwRuwN2bVKWjW+bwQM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hYc1/uKbu/JDO7UT+d/vZM6mq0CY3bjO4jbtr6nzNb/1aG/cEu3imlniRH4LCNqoLJQsU5OMqPAfCaUuFLTapawdHMnxFOOpDObBIcEfRBl0xvT8S6l60+LR9NketUQmKS8CFWhCZe+nhSwYYGc10GLllghZMJ/wr74gVc3cl60=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=OxC3VMbP; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="OxC3VMbP"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-490aaeabdb4so20452315e9.1
        for <linux-doc@vger.kernel.org>; Wed, 03 Jun 2026 03:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1780481844; x=1781086644; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LYNGLIkJZMjRjHk0hF9NSWbns9QHjdminA/Y/0E/C8I=;
        b=OxC3VMbPggN8D7Yu+AaHpOXTyB+kUpz1vaDZg2hjKHsNywfV0FlNgppYStF05SgCQq
         cc5Qx2OPRWt5ir6zV6xBRdtcWnLCtNrKeEw50gag4v2KIgNg/WdqNrEq33Ju0+9BPjPk
         9JtcgiICc8BiCi+BauXwB66xjrYnCgeApROGPj3J3rlx1gpftTB9BXRB8uD0fjDj8hD2
         cO+USv11uEa5UvpoYR8+17j/bonnPfVdGhv108kc0fvJk9pdlPtPVHr2Isow2fKtKrIa
         xtxWUUzid+YUc7Tz0WQ4yIB1OQ/OUa47coAj/BLk69I2RSnG7qGYXyKQF1lzVdanD8ZE
         dBGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780481844; x=1781086644;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=LYNGLIkJZMjRjHk0hF9NSWbns9QHjdminA/Y/0E/C8I=;
        b=hZgeJDeBf+oyr7sXyYbowizc4lcW5PWlifEuZdbvpR/IcpFknNtG6080yO+L5Witfn
         xQUwkzQl6qys1Uvjls1wTIrjAwLJieHmKPNCnsBMw6GedEAdutpFd9QlVv7VCI8isy84
         SLdHq51wLwuWZG3SkvrYKgQ1njkGUkYCdk0AID9k/dXFsiLJsH+rWZVpPGLhDB2x8G/k
         Rnte9s2CapR3INEjmsiQAznR3WPuLsyO0iotatfBI73UdgyOLyu7F82F4EmRHx/aCS/V
         BHw/qaw8j5KRdEOyWXELgCtar8hGQlYeBda7mxYpIkaRRXEEN5kyxL6+TDo61q1okeKv
         V3kw==
X-Forwarded-Encrypted: i=1; AFNElJ9s+CIPGyZio6yskPzMvW8Bjo5LOZ4g4QMcbXjDRDVclQHMCPVCM3itoLQxfIbP/Me8AVDmX6+L/UI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz/j4YSPfOCX7jeuTRJMKxy19PwHJ0O9RvLXphKZfxQPQPb818X
	SjlED/Y8ns/g+9GRPlA6Y2mO4CU4nRZg4R8xokriUtXDXDUNu7g77caHU/nGoyuCB1o=
X-Gm-Gg: Acq92OER3ObYTcZjGyobFZF4qTRV1joSiUptPnhHIgtFCv1Ja9WuC6L2UCHa6KLRzpZ
	tK5ZNITprpd7LPuq7ETScryUm5pI00QfIq+LRHqJ5vz5XKvCOxPCcEHYdL+cZ6De6ZGMjnHpvGH
	meZBjQGVjRrMdXNKbKhSXsA1ZGR2j9SURqLYs/5zh4nJ6OTgE4g6ETE4BVfkXGxU2sZpWuZ1KJA
	q57FYj7xFP8z2kSIqUBQZTBS/AugCTmJgIFlcEDQM4sLBebT97gTDFU8xrxzJ45uFtZEqvFJRy2
	8yn4jaEpe2PbjCD5fFDySFteCIHJLi1e9e4QekcjjH0tCaXJhvk73qUQRDea2pbxeo0w5u+tLmq
	c6flwWHSUbcMmMlEGu6OsnsZLrllcPBj14MccMCiZCBNf5E2G2+6t+lb9upSRopU4X+I0a2ggMi
	BRtG3V0c2XEAf7SDj+l4te+s4atc0wmKoV+TtD4DzkQL0=
X-Received: by 2002:a05:600c:4f50:b0:488:d6eb:e63c with SMTP id 5b1f17b1804b1-490b5ea32a4mr51625575e9.15.1780481843826;
        Wed, 03 Jun 2026 03:17:23 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490b63d8205sm38681875e9.11.2026.06.03.03.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Jun 2026 03:17:23 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Wed, 03 Jun 2026 11:17:06 +0100
Subject: [PATCH v3 02/19] perf test: Add workload-ctl option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260603-james-cs-context-tracking-fix-v3-2-c392945d9ed5@linaro.org>
References: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
In-Reply-To: <20260603-james-cs-context-tracking-fix-v3-0-c392945d9ed5@linaro.org>
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
index f2c135891477..a9e67d7da700 100644
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
+			pr_err("Failed to write perf control command: %m\n");
+			return -1;
+		}
+
+		if (!ret) {
+			pr_err("Failed to write perf control command: short write\n");
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

