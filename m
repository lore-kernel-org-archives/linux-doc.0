Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794070646;
	b=rpIk+Jq7e96F8ifWCPLzdEbFjCDQh705wijjhm4FWxpcDPtVgiS3pm6sqWU94AdUiElb
	 zocHQ2af9Cn5lYhvVwfi3iBRIJ71usMH711sBh7GgQ+14XcJoAwvGph8WSN2eKI+RGcVj
	 5wgwiGH8gj/FzeIH62TYQMsvZC9+Mgwsv7p3OXBvaRXRO1fv/Ti5bvL3axN84SY/6Du82
	 SujHh/04LXrGpAHE8f33k7n5cVkVqYmNAYFGoWbQ+mBBfShdAP8BpuFJtcFNDrvN2O4M5
	 5wxc11/EaK7vxxobXGHj3cD0iTGjZkGRrUID47UCOJ4GsZpr0qKZG8MLa0cm26yZS8A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794070646;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer;
	bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
	b=cWoDBKngmgNeLBVVVtZ7bbQ4aXg28kvYB31YIP3SF0dAg4K2ib1CYx6Fzvx3l77g/w57
	 xWw9L8y2zXFNTdBLU2on0qNfCM4l0PPZk8wSeS0FLLWM02+kFCvtVpTVCrvpg5ERdif10
	 4fL8TFk6YZp46ewNhI/y6bNgiSrmaoDulNA1EmcuOuTyNRN25fYFV3QNHwk+EY5z63VjS
	 KHFMBEfGvzPlP4RoKGB/r1RrHACju7zT3s+Qg4kznIGG3DiZq7lz8nNVlSdftGp4VOOa9
	 lEH6rqdmgym35ooq4/a08oP1L4dExnBCRFHDQ113EPupeu97/kdB5C2qqQDgp9p/lvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf9aMnGZ;
	arc=none smtp.remote-ip=74.125.82.53
Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96ED2606A32E
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 16:57:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96ED2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Vf9aMnGZ
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1a3c08d6928so2896790c88.0
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 08:57:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794070646; x=1794675446; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
        b=Vf9aMnGZ/fWhaWd+BfyuaAn71YYiA2n74dfBULzE/aGwLjp8yB6/k7O4/jnA/yZPm2
         gV3otOYoSUp02Fm5NHftU919RIR68nN/zT1gaUjUH1/Nz/rQyqdk43ke4eBPM399RFAp
         fxZwlZGyJCe1lWVaGiAAB+Qzoe5/vZDzHxzU/mZ+oU5yDPm/Cye6Q6Yfp/F4qvGUgl5V
         DXZ3agQp2n98TfzXXMw7pY+5kuv3SbZksdQ45/iD5ka6LHUqgulggOAfqRZprjq0FShf
         xcaw1iPnYzE6C8frfdC6R2WsAL96+LJduExq0bGHMQlIheOqfHgVYg20vabyOWJgv2Yy
         YGMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794070646; x=1794675446;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hzXak3ntRziJwCOaF83EBVAeXCmgVGHqVypHFRPQte4=;
        b=ZG7NWI43pP+3yf6vQjsP89yVrQsl2IMiIoUVK+8fekJFLcASAvNFl/ujhCxEt5ilpn
         UduWEeQGnp2GoR2TILPdWR3obCLVO68+pSWyKRO2hNeWga0LLkVkSuNb3mZr1i3gW9oB
         l2PB0jGtfRPN/XiKZn8uFlGSXEx/TIxddXDbC8c1t/HSX8Jj2LvBm1A4vunEEqgGSRC5
         51FzYZlyZAfgug8CcF2cILlBDFSWhIlEwQ/APdty/8cjpP8W0kNNxW2Yjd/UN4r6w8TX
         d/miLC795eTOSG5PTgnNUlsN2CKzHnpD0JN7YcSia+ZNZw+UR5kM1oILoHLgcqB/Q0BG
         15ug==
X-Forwarded-Encrypted: i=1; AKwUvBwWCwBGFEWQ8stz4VB8O6hhpzao12eL0CsGaciW1DII4wgrUx9PTgKYoyByxZ4BfDHD5/hsECYZm6k=@vger.kernel.org
X-Gm-Message-State: APuU4Z9g4gr2AehNs2DXXGB2P8Mh2kDUy2zkGJ1TkRzcqCTZ+YO4ocJO
	3SQHL6IueUpN4cUsw4RID+3Fa+1dAh9MyMtqNH5g/z++oiZ5i8oy/neX
X-Gm-Gg: AYBFou18ys8le20RsYyR/CSuClLxade7CDC5XsepeG0QVTBd0En1vMJEfWR2QSm9c2m
	E38ZSEskLN9mjZuhahpcNyqP/pPTk9iNlPJmllsv/zFaSIsus1twgYn2/lifYSHa7ive5ojDlUo
	zb6DyeyZbWhVlQBF3VekoYprDMrKbob6rpUxTMzLlr8iv/tuu1kI8/vs44N4FPFA/djA+m9vTDL
	N14m+8tmyyQxlQVBxbiY1GyNdNENveZUaZKENxr9m/cuyj2IQIbZyfqLQCMcR5XynXG4tjA9QaY
	yJHgl8Ih1nLaZsph1Ef9xWxmRIKw/EKbGt7aSj8u8UkbdikoqFm8sxESaHxdf0rftELLgtRPbBe
	PMlpF9BQENj3JGlOINOZOtUDz/1/55BmbQ1Cbeyd9eTlGm/j2wdzk6SeRLM39aZwwlM+/K2LcU2
	8dMGkNcP8kBBJbShqF+uvSsiQaJ99WQojs0GxgY4NxpgBbVKOTFCd0EyyTcvuBzh5zMmLbOrQ2w
	NllEhs6GXrSAEOK8Kf1HAyBWmeH+YehwKpBl5dEcWnh1nl1CSQ8uZQLYwXofrHHgKmBl1zuwCOL
	tr+NyWDWvnWRiNgbAg+EbBam
X-Received: by 2002:a05:7022:5f07:b0:1af:16c4:d06b with SMTP id a92af1059eb24-1b25d31e658mr6932727c88.10.1794070645481;
        Sat, 07 Nov 2026 08:57:25 -0800 (PST)
Received: from [127.0.1.1] ([23.254.208.9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b25e4b4aa7sm15456126c88.13.2026.11.07.08.57.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 07 Nov 2026 08:57:25 -0800 (PST)
From: Qiliang Yuan <odys.yuan@gmail.com>
Date: Sat, 07 Nov 2026 11:57:02 -0500
Subject: [PATCH v3 3/4] selftests/mm: move waiting for KSM full scans into
 a helper
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-3-16d5ce8b5fd6@gmail.com>
References: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
In-Reply-To: <20261107-bug-mm-ksm-smart-scan-align-skips-v3-0-16d5ce8b5fd6@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
 David Hildenbrand <david@kernel.org>, Xu Xin <xu.xin@linux.dev>, 
 Chengming Zhou <chengming.zhou@linux.dev>, Stefan Roesch <shr@devkernel.io>, 
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
 Shuah Khan <shuah@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, linux-doc@vger.kernel.org, 
 Qiliang Yuan <odys.yuan@gmail.com>
X-Mailer: b4 0.13.0

ksm_start() enables ksmd and then polls full_scans until two more full
scans have completed, so that any merging that can happen has happened.

There is no helper to wait for a number of full scans while ksmd is
already running, so a test that needs one has to copy that loop.

Move the loop into ksm_wait_full_scans() and make ksm_start() call it
after enabling ksmd. The count is now read after ksmd starts rather than
before, which can only make ksm_start() wait longer.

Signed-off-by: Qiliang Yuan <odys.yuan@gmail.com>
---
 tools/testing/selftests/mm/vm_util.c | 31 ++++++++++++++++++-------------
 tools/testing/selftests/mm/vm_util.h |  1 +
 2 files changed, 19 insertions(+), 13 deletions(-)

diff --git a/tools/testing/selftests/mm/vm_util.c b/tools/testing/selftests/mm/vm_util.c
index 515031b8283da..1c2bac54696dd 100644
--- a/tools/testing/selftests/mm/vm_util.c
+++ b/tools/testing/selftests/mm/vm_util.c
@@ -984,33 +984,38 @@ int ksm_use_zero_pages(void)
 	return ret == 1 ? 0 : -errno;
 }
 
+int ksm_wait_full_scans(long nr)
+{
+	long start_scans, end_scans;
+
+	start_scans = ksm_get_full_scans();
+	if (start_scans < 0)
+		return start_scans;
+	do {
+		end_scans = ksm_get_full_scans();
+		if (end_scans < 0)
+			return end_scans;
+	} while (end_scans < start_scans + nr);
+
+	return 0;
+}
+
 int ksm_start(void)
 {
 	int ksm_fd;
 	ssize_t ret;
-	long start_scans, end_scans;
 
 	ksm_fd = open("/sys/kernel/mm/ksm/run", O_RDWR);
 	if (ksm_fd < 0)
 		return -errno;
 
-	/* Wait for two full scans such that any possible merging happened. */
-	start_scans = ksm_get_full_scans();
-	if (start_scans < 0) {
-		close(ksm_fd);
-		return start_scans;
-	}
 	ret = write(ksm_fd, "1", 1);
 	close(ksm_fd);
 	if (ret != 1)
 		return -errno;
-	do {
-		end_scans = ksm_get_full_scans();
-		if (end_scans < 0)
-			return end_scans;
-	} while (end_scans < start_scans + 2);
 
-	return 0;
+	/* Wait for two full scans such that any possible merging happened. */
+	return ksm_wait_full_scans(2);
 }
 
 int ksm_stop(void)
diff --git a/tools/testing/selftests/mm/vm_util.h b/tools/testing/selftests/mm/vm_util.h
index b5d59729d4327..7e00030077d2f 100644
--- a/tools/testing/selftests/mm/vm_util.h
+++ b/tools/testing/selftests/mm/vm_util.h
@@ -162,6 +162,7 @@ void *sys_mremap(void *old_address, unsigned long old_size,
 long ksm_get_self_zero_pages(void);
 long ksm_get_self_merging_pages(void);
 long ksm_get_full_scans(void);
+int ksm_wait_full_scans(long nr);
 int ksm_use_zero_pages(void);
 int ksm_start(void);
 int ksm_stop(void);

-- 
2.43.0

