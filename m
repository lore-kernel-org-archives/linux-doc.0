Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074879;
	b=y4JiEDjpsNU10Pjzav7L+S+YKAnqIa3Z86kt2qh29uDDGcFnbftGjkPyZw4mvVhIbjWr
	 DcxH3WeGsnbS1S4nAqQNa6wczU9IPTWthhcXIYG28ibOyJuXijfzIyoRjR97IIEorGVvW
	 clyfc954hAu7849poVTlSQVdRqi3u0bxdfHYetU7wBuzwTmkJOPxKDm2GrteOvYLl9W5m
	 ilpEIFMKxpwufuPlzLdOhZFETa9raliy2VdSccObyznW2WFSc0sZ7sCdJT78VS2K817ov
	 3v0NanxIrRnbdEHgwzptQGOLWhEPt2E1crncnQzFhFzeAY+tx312ftPRZyGLjwED+bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074879;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
	b=uU6Gvs8v3snO6aypAkSfZmETUv8CmXVafz0Ll9fvrsjeBMGCTzpHve3zoMtym7sdfeSm
	 CX/rXhyamo2TD5ySvGtIPUfNKJy/UVimVFdjyNanSdTQhhr16HLVlu5Jk67+BN+x0n+ao
	 XLlDDc02VjWESBMBCs7NITOKng7l4tzSEyByEL2NEJRAfSry0yvhGHm+LiWOJOZsGB3TG
	 EES2SWICy+dCPKwFYQgpVt49mRCNqqujGhCVfd8qO0GBRU1bZaZrQV1oUhiQOmV6ejQNs
	 gVEwTALYJ4+8kkdYmEo9pU/Xek6wgiUZyoiFbHyYpN+7cfE9rHJfKcfHKsWPnTU8l9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="U+webZk/";
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57ACF606A31A
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 04:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57ACF606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=U+webZk/
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cc4aa0246b7so1530584a12.3
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793074879; x=1793679679; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
        b=U+webZk/UC0AmEh8JfGeN0MsgqZ5s35ckHlqcQZGpqM5matT9IESNMyqgLlqhn8+LU
         62r6mR2RVpK4FKHh/WYKLLfw4IkyeBL78s9aMyPY/LBrc/ElrYJXV4FSqAoO8HPIUfve
         57DIfcFTgwcH9ibOsaVbpBayQsR7iIg7tLxZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074879; x=1793679679;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
        b=X7CDcUma7BUzYOvpDp4MJsEmFQjaBdYDHIM6V9F+yHLwwcIEbuO5aQYOXOxz2WEcBd
         HCVCk9d/0Evn9LDsMGQwq6rPFu6MkV23P+67lIckG2oQdHLERb1P/PuO8uLXahbRTOGj
         fds2MIzNNF1ZmYa7tAbvSOwvQGtzxKf7R9REMyfnKxcoPyg5uigOSlJLWQEHI74iEPrC
         1BPHgmPWVe/7y7+rPDj7+ZDqqrhGMmBNT/7SaRT1TxqMPcEA0bm2ZH0pVbawnIoh/prw
         alkhq+C9Djildo+mqQcB7uybtkJO/k+pwcLNJrhpOfmXmUDySWJXVmzK89ovFVArlf4q
         J8Ww==
X-Forwarded-Encrypted: i=1; AKwUvBxsysdEvS21TlNwE422xu4cQCgly2bxvOElrlzAJhcotOeQinTUdho4QXLBLokraFenBtwI6fp/XHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYIxCiS/Ji63ixkAt6k7l1LK+0D8+LvnpCc1nxKZ7OulaOmyeNVe
	yUwDux0Gva8cXRg1RX0rlWzUmnDhQkEiqWOMWfYlD2HX2TCG1QUMjWfCfZB9YBWojFU=
X-Gm-Gg: AYBFou0opeAoUbkWO8zrrF9KjIKHgTKOpDFNNG1MGd6+dXVtm5SaKXtKoQkOUuDRLH3
	ei7k1Ku0FXYBQ8wwbCJhVKGfJqqMlq22+7O+jROkvwxcuO2rQbhNcen4CmyCse/AQgX/uwSejTv
	MyUaBz0VcOlswbSzSDT+yPgbhQiGziznb5dcaUVKEE6TwBRPp1VWu4UTVJwLh7OJ4zRnf5pW49s
	3xE1/bKJNtXLov8Baj5aajpHANTsXFB6qQ8IZBnPYzVk1KgpSWIBGEQEMS3nyuqg4JalJaEWMGc
	Ndu3uSwprGpGe9T1dCLNOLivNzaMTeifGGJ1bVeOZXff16Y7DSZgDMqxP3ROw2OuuYYQVppy3ef
	tL9oW4bqfiRRZ82ltCi8oqvV6psMDXn1+USZ7mhp6zbxrhMG4rgXc2Fshx/BFAhLl9PaBcyihjN
	eQpWh9+H11pooaDxe5VuccfnZ4mmiSGBy9VRyjWjTV7hV7YazOnwWpdbAkfkXo9iYxjnxU1oEzd
	AzsYZJRJda/c9L8WkemYcUniZgurDMlEnOTt8h/iBir1u6C3fl/XsA35rjysuE9QGetT84fp+SN
	W1bImOcMAOblJ/lIHf8JA7rEoryip9zzxHPrc2KLg4yN3pUysP7vHuoIFpeRCsUsN1A9JPFFQjZ
	YeNryxj6BAHwamV5aBSHU7kTYaZqti50c573m+2+4+Eer
X-Received: by 2002:a17:90b:2d86:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3adeae6d79amr6903972a91.19.1793074878569;
        Mon, 26 Oct 2026 21:21:18 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427bf1sm1790327a91.6.2026.10.26.21.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:21:17 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:21:14 +0800
From: Chris Down <chris@chrisdown.name>
To: Omar Sandoval <osandov@osandov.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auAmuqZyUodq3iqk@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

/proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
memory. That's a pretty large read primitive for anyone who obtains
CAP_SYS_RAWIO (and it also gives away the KASLR layout).

For this reason on some hosts we want to turn /proc/kcore off. However,
on a kernel built with CONFIG_PROC_KCORE=y the only ways to block it
today are lockdown=confidentiality (which also disables many other
things we perhaps don't want to disable), or LSM. That's annoying,
because on the majority of hosts we do want it on for things like
drgn/crash, so today we build two separate kernels.

Let's add a "kcore=" boot parameter so that this can be disabled at
boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..d8acce2878ab 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2915,6 +2915,12 @@ Kernel parameters
 			parameter KASAN will print report only for the first
 			invalid access.
 
+	kcore=		[KNL,EARLY]
+			Enable or disable /proc/kcore on kernels built with
+			CONFIG_PROC_KCORE=y.
+			Format: <bool>
+			Default: on
+
 	keep_bootcon	[KNL,EARLY]
 			Do not unregister boot console at start. This is only
 			useful for debugging when something happens in the window
diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 390547b992ac..6a29a3e0ed92 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __initdata = true;
 
 /*
  * Returns > 0 for RAM pages, 0 for non-RAM pages, < 0 on error
@@ -720,8 +721,19 @@ static void __init add_modules_range(void)
 }
 #endif
 
+static int __init parse_kcore(char *str)
+{
+	return kstrtobool(str, &kcore_enabled);
+}
+early_param("kcore", parse_kcore);
+
 static int __init proc_kcore_init(void)
 {
+	if (!kcore_enabled) {
+		pr_info("/proc/kcore disabled on command line\n");
+		return 0;
+	}
+
 	proc_root_kcore = proc_create("kcore", S_IRUSR, NULL, &kcore_proc_ops);
 	if (!proc_root_kcore) {
 		pr_err("couldn't create /proc/kcore\n");

base-commit: 01146870c415f6ff70a469fb7ceb962a3f2c8c52
-- 
2.54.0

