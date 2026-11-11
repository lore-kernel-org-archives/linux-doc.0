Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794383630;
	b=ugPDCUovJYrc36CUB4h9npP+SvyAjBYijemFaPFcUsDKtotRPfteR6rzFFuyzQoIS6SL
	 lO5WHaUQ0ktiCGcLkrMX8ZU4wqLlwqxQ5avAg95tnb/Cj21nxFpY37z107Txcorw08z6L
	 a19T+RDG9jyKbDfP7dp/IP7TzI/P7BM+ZWk2vLRobEqnObOvR01ZrMOJ0rIPrQet+YX32
	 +eWorzQwLKsO0dBR09Zew++p6s5dGb3x6+qRHLN7D1ysm6st3Po7+GfNQSI7St93LRbVl
	 XcKN5dQbp0W1XYtVpE3lAIEVJVIvs5opV3nI8cn60gkJvDmLCYfQKUv51UxcKY9oU/g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794383630;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
	b=OBjCGDILsN+PRFiVYt6d8ocS820AvsL6N+B6DYZNDGwquUXdJRXOKGwOZbhwaDi5xPYy
	 Uz1sZATqz4bBmQkVLSeDkTAQO+Cjlc2QdRinckOsTSFpq3DBu36nEptUA57Zk6VT0FGxE
	 tYCmdBWJYAxfi1vv3l2QgrdmCTlzK8xmrwIXKuNRIggLo6x3kJJqFwHjQYmzCEmEqKm6A
	 dAtvKKoYlxzYoSt00PuArtxK4V3qRjCEx8CXRhh3U7pcIVyfaZ13t2yZghWfKtypoGjqp
	 PwbXM2DHdzE6jPnX7giHfaxI/qu7JxFFB3lPglIxkvkQLezJGdb3R0p6SfoYwoeaI2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eSrG0lFG;
	arc=none smtp.remote-ip=209.85.216.51
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37582606A32E
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 07:53:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37582606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=eSrG0lFG
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-3b08cf16decso1897784a91.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 23:53:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794383629; x=1794988429; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
        b=eSrG0lFG7ySeSzefrD8AR8ZX0qx68Br5x/TZblJhR3nl+ObylVOTerjSzmy8C4PBMi
         zQ8XaEcAQ853WdxMFYccDPa1xeiDsJZyucqlmn4WRgozQGECM/gtMifq/tBf/bSL7BIf
         7HssaeBv173YHqdkxXqCrzCGGeEn1Z0k2X2II=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794383629; x=1794988429;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SSI9syxLw5WcjFuLZ1glFarNni2XFz8U30mQtyysmWI=;
        b=wW1CgrHXm8Sa5VLND3iK/2wqdhHRZHQDhhMX3oDFO6Zlg3kMp9w0YQfQqFdR4cXDJ3
         ROvTCGDdplxi6hce51i3a/JjI3Q5upyScaj68kWnNMBaJQJoE98ZI4fgFOTCzVwASCjZ
         mrOhVzbysvAGuI4mmt4bk+Z2lSGatd6WX/zYV/N28AJ3tZBjV1lcasd483+q0NYN39b3
         W8Dm1aXXd3DmkTcB2tbebvI4+/xGR4wvf3mJ9Qt5Vy/POnSN/RN3nhFgj/VksklMbWtc
         3VkOe7vCxQXjGhxMf/hzPar4DgWcpT/SshWDH/Mr13o1HVJ+0h6xFmp0E3Aqu6Gx78gy
         dK3A==
X-Forwarded-Encrypted: i=1; AL+hErFUGji9PcKo884Wx5ShKE/sChMb+9a2r+LDxOXgtwMAISkHUbDrU+t0VtMn4WiMdBabYhcXW0B0eE0=@vger.kernel.org
X-Gm-Message-State: APuU4Z9V1oUouEzL93sOs4a9T/Yl++qJzyAv7vFEt842FMbLcYjsJ6zM
	9EtK4FzCCdS12zGYt5Z3O7hAwa9eh1e7BP+tO69UbLovCEpnQsLX4P/BU9MhmiUSjbk=
X-Gm-Gg: AYBFou16ZBBOZ8nSnh2+N48bxO/JalGFqGNQem4HsR/eUYbWTYlv5PjWTEOZolgogy8
	AmfyOfD/eoxJodN4Rc5KRjwSKykpzjRcGA1WqQ906KziUIna1igcnTbdFy74WowR1zpIlhGCya1
	ojFaWv4F+L3HASDsi1Nndwq+FVFMBiyEfWC5jQXRT/wff4dmWQ1DfqczLKcNlA50tSKk+SowMP1
	OflQyWL5v87fnyQrXoZ44qkNeXBSThKPEiJFtxJ1dG+Gn1r3ojj7k353C07dDN3y4el/m5WuV9t
	6/D4LDDMyfhDm2AeTdAjsu7zv9Vi1ZLiiSycPIylMsFG2kvzuEAn45G2JtWRRRKKdrqXqvYREPZ
	VGOQ6eHgHo40oA3TgrerkUc7V0/U0rXtFEJoOiDtsl6zwiJ2J+sjzSU3WBSmam89yIrmnsHh+JD
	IWewWHSrzAckbKO4roHd0wjswTfFSPp3AC6RLdoMi8YYItTHWXfN3zRhcOKNk02rKHHFK1YvK4U
	bJj3TIySScCmMWAaY7iPyTTeT6BaoU/yufeSEdMRBWn84IOTA73L5W4NypdPYQd71VpkBZ8pBdU
	Sx0rhIKEPik43dWFY2J0NibrAQEbLqRMyW4Av42viQEI0HlrJzXI/37gxOOmRFm42e3FKc9MCRQ
	goiLGCa4HYEuvjyGnw1bjXndB5lwV1XcYsE/XbDGRQF3sCUqH+o4UWI7MkpG/cEzSTxLNpwr0Sh
	Skn4ArYYhXs47J9S0cmR5JvvhOiZMGUdTiW5Nxw1hkhwR9VvWDCpIU
X-Received: by 2002:a17:90b:5483:b0:3ac:80dc:f419 with SMTP id 98e67ed59e1d1-3b182fb308emr1835511a91.25.1794383629583;
        Tue, 10 Nov 2026 23:53:49 -0800 (PST)
Received: from localhost ([199.201.64.8])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b17da4cd8csm3404966a91.2.2026.11.10.23.53.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Nov 2026 23:53:49 -0800 (PST)
Date: Tue, 10 Nov 2026 23:53:45 -0800
From: Chris Down <chris@chrisdown.name>
To: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>
Cc: Alexander Graf <graf@amazon.com>, Baoquan He <baoquan.he@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH 9/9] selftests/liveupdate: Check handover revival, sequence
 and memory stats
Message-ID: <738fbfd19034ce495de9b22c705a7815a236907d.1794383544.git.chris@chrisdown.name>
References: <cover.1794383544.git.chris@chrisdown.name>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1794383544.git.chris@chrisdown.name>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Extend the handover stats test to cover the new files. On the first
boot, kho_incoming/state should be none, liveupdate_num 0, and both KHO
sizes 0. After the kexec, the handover should be revived and
liveupdate_num should be 1.

restored_size should grow by at least a page each time a memfd is
retrieved or dropped. The memfd in the unclaimed session is retrieved
last, once everything else is done.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 .../selftests/liveupdate/luo_handover_stats.c | 74 +++++++++++++++++--
 1 file changed, 67 insertions(+), 7 deletions(-)

diff --git a/tools/testing/selftests/liveupdate/luo_handover_stats.c b/tools/testing/selftests/liveupdate/luo_handover_stats.c
index f18df79dda55..2863630b823e 100644
--- a/tools/testing/selftests/liveupdate/luo_handover_stats.c
+++ b/tools/testing/selftests/liveupdate/luo_handover_stats.c
@@ -10,6 +10,7 @@
 #include <libliveupdate.h>
 
 #define INCOMING_DIR "/sys/class/misc/liveupdate/incoming/"
+#define KHO_INCOMING_DIR "/sys/kernel/kexec/kho_incoming/"
 
 #define SESSION_CLAIMED "stats-claimed"
 #define SESSION_UNCLAIMED "stats-unclaimed"
@@ -28,13 +29,13 @@
 /* The first open starts deserialization. */
 static char state_before_open[16];
 
-static void read_incoming(const char *name, char *buf, size_t len)
+static void read_sysfs(const char *dir, const char *name, char *buf, size_t len)
 {
 	char path[128];
 	ssize_t n;
 	int fd;
 
-	snprintf(path, sizeof(path), INCOMING_DIR "%s", name);
+	snprintf(path, sizeof(path), "%s%s", dir, name);
 	fd = open(path, O_RDONLY);
 	if (fd < 0)
 		fail_exit("open %s", path);
@@ -54,6 +55,11 @@ static void read_incoming(const char *name, char *buf, size_t len)
 		buf[n - 1] = '\0';
 }
 
+static void read_incoming(const char *name, char *buf, size_t len)
+{
+	read_sysfs(INCOMING_DIR, name, buf, len);
+}
+
 static void expect_state(const char *state, const char *expected)
 {
 	if (strcmp(state, expected))
@@ -61,13 +67,13 @@ static void expect_state(const char *state, const char *expected)
 				   expected);
 }
 
-static unsigned long long read_number(const char *name)
+static unsigned long long read_number(const char *dir, const char *name)
 {
 	unsigned long long val = 0;
 	char buf[32];
 	char *p;
 
-	read_incoming(name, buf, sizeof(buf));
+	read_sysfs(dir, name, buf, sizeof(buf));
 	for (p = buf; *p >= '0' && *p <= '9'; p++) {
 		if (val > (ULLONG_MAX - (*p - '0')) / 10)
 			break;
@@ -75,19 +81,45 @@ static unsigned long long read_number(const char *name)
 	}
 	if (p == buf || *p)
 		ksft_exit_fail_msg("%s%s reads '%s', not a 64-bit unsigned number\n",
-				   INCOMING_DIR, name, buf);
+				   dir, name, buf);
 	return val;
 }
 
 static void expect_count(const char *name, unsigned long long expected)
 {
-	unsigned long long val = read_number(name);
+	unsigned long long val = read_number(INCOMING_DIR, name);
 
 	if (val != expected)
 		ksft_exit_fail_msg("%s is %llu, expected %llu\n", name, val,
 				   expected);
 }
 
+static void expect_kho_state(const char *expected)
+{
+	char state[16];
+
+	read_sysfs(KHO_INCOMING_DIR, "state", state, sizeof(state));
+	if (strcmp(state, expected))
+		ksft_exit_fail_msg("kho_incoming/state is '%s', expected '%s'\n",
+				   state, expected);
+}
+
+static unsigned long long kho_size(const char *name)
+{
+	return read_number(KHO_INCOMING_DIR, name);
+}
+
+static unsigned long long expect_more_restored(unsigned long long prev)
+{
+	unsigned long long restored = kho_size("restored_size");
+
+	if (restored < prev + getpagesize() ||
+	    restored > kho_size("preserved_size"))
+		ksft_exit_fail_msg("restored_size went from %llu to %llu\n",
+				   prev, restored);
+	return restored;
+}
+
 static void expect_counts(long retrieved, long dropped)
 {
 	char state[16];
@@ -111,6 +143,10 @@ static void run_stage_1(int luo_fd)
 	expect_state(state_before_open, "none");
 	expect_count("sessions", 0);
 	expect_count("files", 0);
+	expect_count("liveupdate_num", 0);
+	expect_kho_state("none");
+	if (kho_size("preserved_size") || kho_size("restored_size"))
+		ksft_exit_fail_msg("KHO sizes aren't 0 on a cold boot\n");
 
 	create_state_file(luo_fd, STATE_SESSION_NAME, STATE_MEMFD_TOKEN, 2);
 
@@ -144,11 +180,16 @@ static void run_stage_1(int luo_fd)
 
 static void run_stage_2(int luo_fd, int state_session_fd)
 {
-	int claimed_fd, mfd, stage;
+	int claimed_fd, unclaimed_fd, mfd, stage;
+	unsigned long long restored;
 
 	ksft_print_msg("[STAGE 2] Checking state before and after the first open...\n");
 	expect_state(state_before_open, "pending");
 	expect_counts(0, 0);
+	expect_count("liveupdate_num", 1);
+	expect_kho_state("revived");
+	if (!kho_size("preserved_size"))
+		ksft_exit_fail_msg("kho_incoming/preserved_size is 0\n");
 
 	restore_and_read_stage(state_session_fd, STATE_MEMFD_TOKEN, &stage);
 	if (stage != 2)
@@ -163,6 +204,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (claimed_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_CLAIMED);
 
+	restored = kho_size("restored_size");
 	mfd = restore_and_verify_memfd(claimed_fd, MFD_RETRIEVED_TOKEN,
 				       MFD_RETRIEVED_DATA);
 	if (mfd < 0)
@@ -170,6 +212,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  MFD_RETRIEVED_TOKEN);
 	close(mfd);
 	expect_counts(2, 0);
+	restored = expect_more_restored(restored);
 
 	ksft_print_msg("[STAGE 2] Finishing '%s'...\n", SESSION_CLAIMED);
 	if (luo_session_finish(claimed_fd) < 0)
@@ -177,6 +220,7 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	close(claimed_fd);
 
 	expect_counts(2, 1);
+	expect_more_restored(restored);
 
 	ksft_print_msg("[STAGE 2] Finishing the state session...\n");
 	if (luo_session_finish(state_session_fd) < 0)
@@ -185,6 +229,22 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 
 	/* Finishing the state session must not drop anything. */
 	expect_counts(2, 1);
+	restored = kho_size("restored_size");
+
+	ksft_print_msg("[STAGE 2] Retrieving the memfd in '%s'...\n",
+		       SESSION_UNCLAIMED);
+	unclaimed_fd = luo_retrieve_session(luo_fd, SESSION_UNCLAIMED);
+	if (unclaimed_fd < 0)
+		fail_exit("luo_retrieve_session for '%s'", SESSION_UNCLAIMED);
+	mfd = restore_and_verify_memfd(unclaimed_fd, MFD_UNCLAIMED_TOKEN,
+				       MFD_UNCLAIMED_DATA);
+	if (mfd < 0)
+		fail_exit("restore_and_verify_memfd for token %#x",
+			  MFD_UNCLAIMED_TOKEN);
+	close(mfd);
+	close(unclaimed_fd);
+	expect_counts(3, 1);
+	expect_more_restored(restored);
 
 	ksft_print_msg("\n--- HANDOVER STATS TEST PASSED ---\n");
 }
-- 
2.54.0

