Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801473;
	b=VLBXTBsumgsCbqNA9m5U4Zp4ZQWGeC2i1Lmju9vBw1W3vGwhKe/lvp7puS04AEpHPRZU
	 smhWuu0/82QtGXVn+kGwtUwFak6azlQ2LMsf8VURgG4fbbDGNa1Q3/EOZHjr/+rfk+xxQ
	 gfp574W1ibUAFyS64cGYOkbc5X06b+jZSACAUYQKT6V1VtmaaBu6JuKIfiGtI7YI8KqsO
	 hih2XjeaQbAxYIJefiFMQaTRCPQoYnZYXMVg43Gr9B5rpFn9hWhxYsxvAqrqQAo1gkagl
	 ce2bzSnZSrWG15IPCDbwinGRZyojIpV7eMzqss7BQxKnUXbfloAolebvARttWKFxh+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801473;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
	b=dvrPmsVHTvJBwqDMVgQpTdfgogEyEwcWf/01lha0j8seA7roOj0NWzCs2jDZb+eIYWxm
	 xWr20zHDTyvjQtJ1rUSXu1I8UjW7UQluJ8JV/5PWZfSQMl9NE6Kmhv0K9TZEicA/rXjNb
	 iuGLOcYYtfOPYeJrWnFVtOaj81yGX4ouryzXIBYOMkQhQgass8zT2uey1ZVkm5lEmMKlL
	 fd1m5cOETHq40Xz9SmsgGAzh93AfrqoWIG9UnNfLyMD80vLmi9VfzyJuswXQ4Eonmtdjo
	 an+CSt8jR/2Im3Z8ZdWDmuPpzSFxFyh16cgx1v8Ao0an9mCUyaPlOh5ApCsY0oGXFLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pXUuGH1T;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F44C606A32C
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 03:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F44C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pXUuGH1T
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-3791619605cso5852948eec.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 19:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794801472; x=1795406272; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
        b=pXUuGH1T9exwQcrwhbSZrLclSn0IWrK+PCRBc/KdKoTlWFPxdjgreeQ1+APKhspKwS
         HmqF1BZdKZR9OP7azT5beKtMmat/vhp6olqwbUZeGf5u/1b39oKZbvVK9EqEv5J8rQID
         24wNYBs8s+ihpD/hp4t8V0NvT5OMsgDTX4FQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801472; x=1795406272;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
        b=LuW3lHvd7dfH29XWTRWNZq7/43s1bvmXVvYWEn32sTiaMQs9wpn5CjOMQ0AuueSZpa
         cVBK0UTSQrjp7bBjSrvsEcazuxPapsQ8Zzlk7vqV1MC0y/TjHInlDWydNB4NTAmOZ8y9
         /WO8MZG83WOc8LsQxMlvq0rXWKCwjyhXpSTIj0gUwPyNb9695WrNVZtU0Hvq0lRv+Wtt
         h1Xyf+oE9F3/WZacjR3xVo69ntCRjTdfFqij74KsiCuUurq4dFuEQVwTFJgHKiR64sUy
         Jpm0k4K0wq5wcP73dii2zcxXprNJO5RIw0gqgowasSAqlsgwSj+3iDXdDpsKzGqw9hUf
         JJ0w==
X-Forwarded-Encrypted: i=1; AL+hErFoXdTYft6reGB/zYbZSDRh4jMjDmE/i7ec63wJnS59QJu1KiLEBTyUJJkG9r0Rjq5vVL981lRWlYA=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Oom/vw5oFTiUKMxc64I6spn0nRW5rNvSar2ShZM/FblMIpmcD
	1Bz5/V7HEQIz5N0l2OZ2iB+JJ6Nmir5CXBvG+fM31RyTy+sXbJ9PHOLFex2Nso5SBHM=
X-Gm-Gg: AYBFou3e8UogJ0ErzuKcxXPmodd2o9Efi/3Rgqaw86Uqabp80duJvmeeZNBg8ysg45n
	zFZphmRJDUj8/QrJLC1P7+hnYxsAbjkvBn7HBOkShN2J1hXst5A6kQ0pCRxzJaiLgtBndwgUSTJ
	nrTqW7HJdoqXNtL/fuCGTr5aFJxIr8oaYfCRvIh8B+XACcM2ISOK8tQMWBnBx7wwGls8W/dZrFY
	ShGTT4rLBNHHMCSj5nZIUodLxPRQysscyCGy5oxzbyGHZvesxgAU73CJGhYtYHchxjJgPQJlmJR
	RPTTLnZn1tWxvOb1fPI1+XF8bXCYrs8XZvuSdqRPP+J716D4gu521UvZq4qXaDNaw7TK0umxlSs
	1lJwjONMs0Zb2iT5SCzRZ62PnakL2r+hp0fzi9mJHb15bouctD03+9ngMrZtHz6zOEVhZYhuwEK
	w3V0vJEDqpUbeOReIJmXOLcTMJTOU8GiiPMwyGxsW2HjH/bZ4mz9CKSpKUrnw19hLPTAdZOw6TX
	U1s7Fb8weDkWpgmxm9RSWpnG6H3MQJ/U3ZiWRo2rHXRRfaNr5GDTqPz8yaYgYc1sxgIiP1f1dGH
	8zr4aNvldpODyHV+dopEURoEJ+druXVWm4x3atHzG3+t9cjTYDDDQgdDIRwLhQI6980p6mELQeF
	Df4juzBXEIUe6Wm0SYY9StZoOykbglQH7957grk/Vgs0HoCwPTX+iMJrzGZg4Nand/b93LxtR4l
	HzwMizSLUOnmV1sWxiZpTkT216ky6i6clNIr6pG02JruSgjmoCjdriUtp+ZzgXYpc6
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr8377652eec.15.1794801472427;
        Sun, 15 Nov 2026 19:57:52 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm29451214eec.29.2026.11.15.19.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:57:51 -0800 (PST)
Date: Sun, 15 Nov 2026 19:57:48 -0800
Message-ID: <a8474f0e2d0ef5ea9d53aa6649c7e9c9ea6f15c2.1794800574.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2] proc/kcore: allow disabling /proc/kcore at boot
To: Omar Sandoval <osandov@osandov.com>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    linux-debuggers@vger.kernel.org,
    linux-fsdevel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
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
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

/proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
memory. That's a pretty large read primitive for anyone who obtains
CAP_SYS_RAWIO (and it also gives away the KASLR layout).

For this reason on some hosts we want to turn /proc/kcore off. In terms
of what it can read, /proc/kcore isn't any more concerning than other
ways to read kernel memory, like BPF with CAP_BPF and CAP_PERFMON. The
distinction is that a process with CAP_SYS_RAWIO doesn't necessarily
have CAP_BPF and CAP_PERFMON, because CAP_SYS_RAWIO may be needed for
hardware access without necessarily wanting to grant general RAM access.
CONFIG_STRICT_DEVMEM already makes that possible for /dev/mem, but
/proc/kcore gives the same capability to do general purpose RAM reading
anyway.

However, on a kernel built with CONFIG_PROC_KCORE=y the only ways to
block it today are lockdown=confidentiality (which also disables many
other things we perhaps don't want to disable, like kprobes and
bpf_probe_read_kernel()), or an LSM. That's annoying, because on the
majority of hosts we do want it on for things like drgn/crash, so today
we build two separate kernels.

Let's add a "kcore=" boot parameter so that this can be disabled at
boot, which lets us preserve those choices while using the same kernel
image.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
v1 at https://lore.kernel.org/r/auAmuqZyUodq3iqk@chrisdown.name

v2: Give more justification in changelog (Omar)

 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..b4c43d2cae03 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2902,6 +2902,12 @@ Kernel parameters
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
index 3264c99bd68a..4251a9ef868b 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __initdata = true;
 
 /*
  * Returns > 0 for RAM pages, 0 for non-RAM pages, < 0 on error
@@ -722,8 +723,19 @@ static void __init add_modules_range(void)
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

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

