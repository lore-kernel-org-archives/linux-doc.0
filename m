Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795037337;
	b=VDl406XR/4uTqv6F73VytTn49wkuSrsNDZ0EdQsIVEpKU/GC5MQ3sirRzBQDAIsk1YgZ
	 rKe2wMMvir4WklWrHNJLZci+GmumLOGy397rS0h0EyrbJ6Kx4J9wU1l2O5TLQypVX83ct
	 JsvQiJQqrsqW36goOcqBUEJPp9GzBBCbAKd0xptpOg02mGq7oZerQ4vGDCCqLtQT5bANU
	 f3exah65gi+/jU15+T2Gh3gI5V+pCHnI2R+iByN3D0dQNfWWn+G0ZW5OMlW00OphzW+tV
	 t58EJwJAAPVYsaPoFY3c6zz2eSokzGQ8knZeCKI1V8VXdnl6BZ9utJPtMXm42s9tKMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795037337;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
	b=J4IjBBgg1RvWucTVIrRU7TSprMisByIvneNy7S02SquOKIzWfUTTevQ2c82CDeZyYees
	 NhovN3I/uwHtgYeoJajr+6NUdbCKTV2AEE7siLLuMR7/6HF0QC8RTyNOP61Ur194NZUQo
	 bOQfvhoDTB8hYFzY6fcDRHAjSvm7vsQdxXN8JbLQOVCQ2Szp0xRvGGtKHn1GsaThEAxzF
	 1uI39qsHTVcQjUszI22yQqcggPNAy9l5zRD2w9JQ5+yQKI7xtnKDqMoQxADf9qFESyIsQ
	 x3Zfa4vt2BHO3laJQb7il6kKTyqrfugXoHh9/dZYYNET4cIOy/Dnc0HLXJxvtuhiKng==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=soleen.com;
	spf=pass smtp.mailfrom=soleen.com;
	dkim=pass header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iSvs7k6Y;
	arc=none smtp.remote-ip=209.85.217.44
Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8414760A383B
	for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 21:28:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8414760A383B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.a=rsa-sha256 header.s=google header.b=iSvs7k6Y
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-7cc53938a8fso1247707137.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Nov 2026 13:28:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1795037335; x=1795642135; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
        b=iSvs7k6YwjaxOvBDjp3PksIfFWqgtnS2UWETg9JQuN099NJd1V5afHew59ASHEXl0t
         /SbmR7llhG9ljkHTguJhDUZoA9ca9FbalTO6CTroVmSlRpekw/wR8CcnvQF4cq87YMYh
         mi/Z1Ga/fbnK6PtFPhzw9saeFY4wOdqc2zFxrrF8E1lFBGz3xnRD5chdVSgzoI8qQydz
         5SR8IQcafGMjeFyIm5Tfvk8qwjx2kTdHXGqG2MBjyKwUcrrAECkvG/utfbg2msB8Nnf7
         zSukO7U2vuN9arRWTK9eU1ldf7qlM0rRUB2bEzLnLXlx8rR0zp5zLamEzGabuhN/P/gJ
         /1jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795037335; x=1795642135;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=L1yhfvEqBP7e5XFUmbUnaIa/8XvUMLf0rUD2vnzu2NQ=;
        b=t0rANxgoeTfGgCvvFaYZke/G71ZWuBtEXHUnYLv71Xew9y8r16ZJmp2553CikZuuCm
         cPCyjQAVYucR0906gytIwLzED+u3SLKqTKluFdmMmREpecJGfEN/mthn55TjWGYarVUw
         Th2rjkLaBV9dLvpVU48vCMrTx8qXHNJY1bLhWlILvR+rUcBdM9DaDxO4f/c2LhGji1ix
         +4yFCOsteH9jpFPcUAkmiHuzRSYsMVMm6JBgILwSO4NEWfPE4VadwJaM11mp1gL30Lzn
         s71Ql8MFkjy606lTx724lMjpD5k6FhJt6KSRMIxuw3z8I9HZahumPc/uYSgohqi/wXLa
         ha8g==
X-Forwarded-Encrypted: i=1; AL+hErHo9nKnZ5Ou1LtcksCG+wekBEjiTBPjLNqxKZisFYhQOY887ARMVHpc0cc/c56pf6V7pDok0rqSvwI=@vger.kernel.org
X-Gm-Message-State: APuU4Z+nq/rlEJiSebjHOGPZbmtiRtJnih3J9AR0+EG1yzBpQKWuryo+
	WHBC7IjY/4uShbIhU1mMMOvK+o/lHF78wSY+KZ6IGsYTNDe/az9DuUmclHTabMjUMrE=
X-Gm-Gg: AYBFou2AvXvDNd3VDrunN0vsYtGkz3Hpc/74g6oglMESW1h/ETYaWSGJR5BhUCBHpj7
	baPN7wuLaX+B5xnsm87eu2wXdcMpVRoflby3IWj3bXROiBFO4ADWzH5D7bVwO301ByLYPJhUikP
	HbKWBAiTOE6Ba7Y21Ldjx3SrZytHQU1rDFQp1fdww/vS/OZBH0b0tJMUGZzm+Qt63Hlp6Xa/FXH
	MAZbuhDc8doIEC1zcZFhD30wffxJTMy+BO/Yt1MM/uV6CQdQ0d8rrGA1nI+9S2LFQxJw6Quq/iD
	VH0jhY77Mv9/4+Rb2T6hy4g43TMRIO51oVfWzpFhwGdSxjV1QVEFMjKBJ7eftVOfpFz/XbY3UOD
	Z4ww3rH6YU6G/FX6XprAHIT/IjU/scHnqjU6u1hYqTn0fxyU+kRK6KVe7QtHeMHP5/OpCx3pHxU
	BPkdyI9EivMTvKa2hnG85w/dKeN8hGYmw93XMaeg2K2qKs73mL0/zXnyhRPc2hR+MZdDiArliYs
	CtZUKk6xP9spjzAVMw4MN9jm2HLkb62SqWFs/PsUPMCyBykBjyUpl1wzIOL03j7R7P+YSw2ytwD
	e27nd3vdoxPei5CLE37MBiwkfi6Xjo7OfCx3B2v3OLY6WdmD/+NcM/U5vEcvzZbx1kGC+xAFBPk
	HlhhBVcnK8aCtH6epCzq4kmCrRsWNDgIGzmrp/g7l8rMzW1ejFH9oS0ANkSpAGfnpSq8QXdCA2A
	==
X-Received: by 2002:a67:e113:0:b0:7c3:2b19:6267 with SMTP id ada2fe7eead31-7d6ba46ca11mr1512091137.32.1795037335676;
        Wed, 18 Nov 2026 13:28:55 -0800 (PST)
Received: from soleen.c.googlers.com.com (57.233.150.34.bc.googleusercontent.com. [34.150.233.57])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6b9185bc3sm2724635137.5.2026.11.18.13.28.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 13:28:54 -0800 (PST)
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: linux-kselftest@vger.kernel.org,
	rppt@kernel.org,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org,
	vipinsh@google.com,
	linux-kernel@vger.kernel.org,
	corbet@lwn.net,
	linux-api@vger.kernel.org,
	pasha.tatashin@soleen.com,
	dmatlack@google.com,
	kexec@lists.infradead.org,
	pratyush@kernel.org,
	rdunlap@infradead.org,
	graf@amazon.com
Subject: [PATCH v6 7/7] selftests: liveupdate: Test LIVEUPDATE_SESSION_FREEZE across kexec
Date: Wed, 18 Nov 2026 16:28:42 -0500
Message-ID: <20261118212845.2855249-8-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.56.1.708.g77570a6a1d-goog
In-Reply-To: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
References: <20261118212845.2855249-1-pasha.tatashin@soleen.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Extend luo_multi_session.c to exercise auto-frozen, kept-open frozen,
closed uncommitted frozen, and closed committed sessions together across
a kexec reboot, and verify that freezing an incoming session returns
-EINVAL.

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 .../selftests/liveupdate/luo_multi_session.c  | 36 ++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/liveupdate/luo_multi_session.c b/tools/testing/selftests/liveupdate/luo_multi_session.c
index aac24a5f5ce3..3b09cd63c832 100644
--- a/tools/testing/selftests/liveupdate/luo_multi_session.c
+++ b/tools/testing/selftests/liveupdate/luo_multi_session.c
@@ -15,14 +15,17 @@
 #define SESSION_EMPTY_2 "multi-test-empty-2"
 #define SESSION_FILES_1 "multi-test-files-1"
 #define SESSION_FILES_2 "multi-test-files-2"
+#define SESSION_CLOSED "multi-test-closed"
 
 #define MFD1_TOKEN 0x1001
 #define MFD2_TOKEN 0x2002
 #define MFD3_TOKEN 0x3003
+#define MFD_CLOSED_TOKEN 0x4004
 
 #define MFD1_DATA "Data for session files 1"
 #define MFD2_DATA "First file for session files 2"
 #define MFD3_DATA "Second file for session files 2"
+#define MFD_CLOSED_DATA "Closed session data"
 
 #define STATE_SESSION_NAME "kexec_multi_state"
 #define STATE_MEMFD_TOKEN 998
@@ -30,7 +33,7 @@
 /* Stage 1: Executed before the kexec reboot. */
 static void run_stage_1(int luo_fd)
 {
-	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd;
+	int s_empty1_fd, s_empty2_fd, s_files1_fd, s_files2_fd, s_closed_fd;
 
 	ksft_print_msg("[STAGE 1] Starting pre-kexec setup for multi-session test...\n");
 
@@ -57,6 +60,8 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD1_TOKEN);
 	}
+	if (luo_session_freeze(s_files1_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_1);
 
 	ksft_print_msg("[STAGE 1] Creating session '%s' with two memfds...\n",
 		       SESSION_FILES_2);
@@ -72,6 +77,25 @@ static void run_stage_1(int luo_fd)
 		fail_exit("create_and_preserve_memfd for token %#x",
 			  MFD3_TOKEN);
 	}
+	if (luo_session_freeze(s_files2_fd,
+			       LIVEUPDATE_SESSION_FREEZE_COMMIT) < 0) {
+		fail_exit("luo_session_freeze for '%s'", SESSION_FILES_2);
+	}
+	close(s_files2_fd);
+
+	ksft_print_msg("[STAGE 1] Creating frozen uncommitted session '%s' and closing FD...\n",
+		       SESSION_CLOSED);
+	s_closed_fd = luo_create_session(luo_fd, SESSION_CLOSED);
+	if (s_closed_fd < 0)
+		fail_exit("luo_create_session for '%s'", SESSION_CLOSED);
+	if (create_and_preserve_memfd(s_closed_fd, MFD_CLOSED_TOKEN,
+				      MFD_CLOSED_DATA) < 0) {
+		fail_exit("create_and_preserve_memfd for token %#x",
+			  MFD_CLOSED_TOKEN);
+	}
+	if (luo_session_freeze(s_closed_fd, 0) < 0)
+		fail_exit("luo_session_freeze for '%s'", SESSION_CLOSED);
+	close(s_closed_fd);
 
 	close(luo_fd);
 	daemonize_and_wait();
@@ -91,6 +115,13 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 			  stage);
 	}
 
+	ksft_print_msg("[STAGE 2] Verifying closed uncommitted session '%s' was not preserved...\n",
+		       SESSION_CLOSED);
+	if (luo_retrieve_session(luo_fd, SESSION_CLOSED) != -ENOENT) {
+		fail_exit("Expected -ENOENT for closed uncommitted session '%s'",
+			  SESSION_CLOSED);
+	}
+
 	ksft_print_msg("[STAGE 2] Retrieving all sessions...\n");
 	s_empty1_fd = luo_retrieve_session(luo_fd, SESSION_EMPTY_1);
 	if (s_empty1_fd < 0)
@@ -108,6 +139,9 @@ static void run_stage_2(int luo_fd, int state_session_fd)
 	if (s_files2_fd < 0)
 		fail_exit("luo_retrieve_session for '%s'", SESSION_FILES_2);
 
+	if (luo_session_freeze(s_files2_fd, 0) != -EINVAL)
+		fail_exit("luo_session_freeze on incoming session did not return -EINVAL");
+
 	ksft_print_msg("[STAGE 2] Verifying contents of session '%s'...\n",
 		       SESSION_FILES_1);
 	mfd1 = restore_and_verify_memfd(s_files1_fd, MFD1_TOKEN, MFD1_DATA);
-- 
2.56.1.708.g77570a6a1d-goog

