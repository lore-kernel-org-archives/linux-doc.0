Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861F53491E1
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 14:31:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781015482; cv=none; b=dSmE5iqiSWiPpDiJCCMDB9dWex6YuMmbo8pib+bli2DfLsQWwvn90wSx0G+Hs1aNBydL4p9pCmAbaGKm4T6KQe2KcO7jM/iOurrQG/8ullrkbxCWITa/pbmsbjUXxNFGS9njE5n8uJEVauhBK3PXyKrxwQRuSDri3ijyx7jIbzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781015482; c=relaxed/simple;
	bh=/b18pfGcYG5J49852Uf/xpNRcW6fiySK2y+B7W3dtrc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=F6rGEeqUHOQlzNpfbBt/qxLS4Xp2QKR4rHjLgYhIlYQYKidgbCDqPjXL33s9Eb6YBdO3uiNA7BGE3tuFHNjI3YJ6fA6fR13u78WV7Jp/IU+v7jVBWq931iyg2JFzd6O3Fabu2qAHRwgvUIr7uoqaFG5553ZDeCPt12QTUMa/i4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=kFZ0jSap; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="kFZ0jSap"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-45ef4223be7so3026285f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 09 Jun 2026 07:31:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1781015479; x=1781620279; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XAiQptcYOlXy/icTduKx1v/eUqigIfQCIUFTgmuIVAI=;
        b=kFZ0jSapWdBGEQrsb+bsOa+LRoRBOmlN2c9Dmwsdi6XeDdAuWnLcfX+HnBjzd0GuV5
         Djvn9H9YS431GNNBRX17kUY+sMfEgpl36zfXZkCMLHJWDMdH3f6FjzlRAGHozgXhl0uA
         Ud6IY9BikGZWJqks717J2ZFBGgLrEgvyM39ewW264PXHrXcs9xjvRk8Yx1kAMk5bQLUM
         mVEvQ6CmogQEnyP6i4yhkAM1b22719ozQQjMYwh3MdnsK3/lnhuOzD12MumceSQUH1xw
         XGxXTSs99N2zatahMBlsaYoLHqsvSFZpam8Sc4hs9H4IkEHPc3fNxOG6jXs1CfxgI/K4
         fJlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781015479; x=1781620279;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XAiQptcYOlXy/icTduKx1v/eUqigIfQCIUFTgmuIVAI=;
        b=RwTLAeQrYl7SypsT8t/mhWVHHyYUv1ySvKZoVdY+fgKjvcc717c+FDSq5VfZ9YjRnZ
         a9bxUxOF/i1b2hlvN4G4vOdYs0H9o0kEG6x5FNsDl5IvSE0uJPZ6UCFehZ0xa86gwr9M
         iu+cKNrj+31ya7UsF/yTOjmkLjv0t8Hq5TkOPbp2Tg4u+p3aFvfRUedrlPfxe/zrrPBX
         DD/kC9Ld4av01900NlgLNQ7JNvjrq0d2gU8rqKedfBC0VI2X4k/ltQH6g8DDfxnVKEAh
         rlBo6vTWjj0b5lrgI/A+SAMBVCDkJK0EBsvcGVGL2DqybuVjlOfyzQdog59YtrKmq9sL
         FKQg==
X-Forwarded-Encrypted: i=1; AFNElJ8jPGoXoYe23ATyyBXg6uJc1xiT3mDp2/pNTdsehhbKW+ohV5+TkO4A6txdplGTwqB/6v8ckWgNb4A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvuXF+6jQJNQwgVhHqnlviZ966gCV3l20UeJrKsQOId9MPdXmp
	IttfOWPeZORQ37rk0387T2hgC1zvqZVn5XaJ5fWrf2GbEEmbQhfQ51C/yx3BMB8XZ4tE+s1hivt
	ras9MbLY=
X-Gm-Gg: Acq92OFusN2v2UtUBHV4BN+gwvY/ngrg5w/R8ZGmqMDX8qyAugSCWTkVKJqmuCBOHlm
	MufYDFsO/HxesjGfWyjr/9easjEDkL/8LIx+QQq0JaORXJe7Ob7sxQZYXeoqGL8g5IpV/K26KKE
	Kk7gys5gsUmd1Y+hKOM+87/H6DNPl8TU2r1J9CA5RtOmugJelY92pU/a8mHHU9bjKlasPlssL0X
	FdSEFQhOQ+cgtgCCW7rwPdQqKrHrSBSaXW7cwucWpIaIiG3g5clozXY0QCPeT8vxmrlm5WbWmWb
	26zalusCDJKihuySCZYeN3c9+ZRb+TxV6WWddETQrgPRic8XZaq8LIgLa9r9uj/JExtZDT5wq6x
	IUtkCEDrusdeYfBiU5u1lan+lekwllOk3twI8k0sHICwKXD2w47P89ChHoWWbdCnTsJdG2DDA9u
	O6MjheC2dxJ0JASokcxDGJi63zCNpo05v1693ehv7uV88=
X-Received: by 2002:a05:6000:2888:b0:460:3233:beec with SMTP id ffacd0b85a97d-460566db54fmr4205631f8f.40.1781015478791;
        Tue, 09 Jun 2026 07:31:18 -0700 (PDT)
Received: from ho-tower-lan.lan ([185.48.77.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f3444fesm62738388f8f.20.2026.06.09.07.31.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 07:31:18 -0700 (PDT)
From: James Clark <james.clark@linaro.org>
Date: Tue, 09 Jun 2026 15:30:55 +0100
Subject: [PATCH v4 02/19] perf test: Add workload-ctl option
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-james-cs-context-tracking-fix-v4-2-44f9fb9e5c42@linaro.org>
References: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
In-Reply-To: <20260609-james-cs-context-tracking-fix-v4-0-44f9fb9e5c42@linaro.org>
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
 tools/perf/Documentation/perf-test.txt |  12 +++
 tools/perf/tests/builtin-test.c        | 184 ++++++++++++++++++++++++++++++++-
 2 files changed, 194 insertions(+), 2 deletions(-)

diff --git a/tools/perf/Documentation/perf-test.txt b/tools/perf/Documentation/perf-test.txt
index 32da0d1fa86a..2f4a91f5b9dc 100644
--- a/tools/perf/Documentation/perf-test.txt
+++ b/tools/perf/Documentation/perf-test.txt
@@ -69,3 +69,15 @@ OPTIONS
 
 --list-workloads::
 	List the available workloads to use with -w/--workload.
+
+--record-ctl=fifo:ctl-fifo[,ack-fifo]::
+	This option is used to communicate with a perf record session in order
+	to control the recording scope to only the workload and avoid recording
+	setup and teardown code. When specifying this option, the same FIFO path
+	must be specified in the record session via:
+
+	  perf record -D -1 --control=fifo:ctl-fifo[,ack-fifo] ...
+
+	Perf test sends 'enable' and 'disable' commands through ctl-fifo to
+	control event recording. If 'ack-fifo' is provided, the workload runner
+	waits for an 'ack' response after each command.
diff --git a/tools/perf/tests/builtin-test.c b/tools/perf/tests/builtin-test.c
index b64fc2204f22..86ea427eb0aa 100644
--- a/tools/perf/tests/builtin-test.c
+++ b/tools/perf/tests/builtin-test.c
@@ -56,6 +56,7 @@ static unsigned int runs_per_test = 1;
 static unsigned int failure_snippet_lines = 10;
 const char *dso_to_test;
 const char *test_objdump_path = "objdump";
+static const char *workload_control;
 
 /*
  * List of architecture specific tests. Not a weak symbol as the array length is
@@ -168,6 +169,11 @@ static struct test_workload *workloads[] = {
 #endif
 };
 
+struct workload_control {
+	int ctl_fd;
+	int ack_fd;
+};
+
 #define workloads__for_each(workload) \
 	for (unsigned i = 0; i < ARRAY_SIZE(workloads) && ({ workload = workloads[i]; 1; }); i++)
 
@@ -1387,13 +1393,185 @@ static int workloads__fprintf_list(FILE *fp)
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
@@ -1486,6 +1664,8 @@ int cmd_test(int argc, const char **argv)
 	OPT_UINTEGER('r', "runs-per-test", &runs_per_test,
 		     "Run each test the given number of times, default 1"),
 	OPT_STRING('w', "workload", &workload, "work", "workload to run for testing, use '--list-workloads' to list the available ones."),
+	OPT_STRING(0, "record-ctl", &workload_control, "fifo:ctl-fifo[,ack-fifo]",
+		   "Write enable to the fifo just before running the workload and disable after, with optional ack from ack-fifo"),
 	OPT_BOOLEAN(0, "list-workloads", &list_workloads, "List the available builtin workloads to use with -w/--workload"),
 	OPT_STRING(0, "dso", &dso_to_test, "dso", "dso to test"),
 	OPT_STRING(0, "objdump", &test_objdump_path, "path",

-- 
2.34.1

