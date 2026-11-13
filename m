Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.71
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608065;
	b=h9NBiAvW9FMHfGswDYjvp20u7tTEd6UmeEmZ0G5k/q45WWBN6L3bAKc7dzWhB12rlJXz
	 BhB/O/bS+Bu2LnmiIMo/AZF8mVmalWd49q9k84n1pM0dK1vsaWfmfRGoIDUw4kdgYLJYr
	 5tI0ec8pwoANIh4WzgwcVtUcSIjyrAsOoxe1aIEsEYXZ1+xeSqBNBxe6saxuOATcrNko/
	 Cpp4DZSClFzcV6GM0OuShCq2OiKqb08N8s7k/ZFwlXbi588GaNJ7EptZi7lVfnnXtNVnK
	 vhHl18e/LQYBiAjH5wVutYGYQseUHQ3k+/V7vhjoym1SEX0tPC09voyvPqRbiPFjZ1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608065;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
	b=GZxA0wlD1zWTCgkAgRrn7xF4Fqhqy7320aFHSYiDri9uVHN55sU8glDSbMYmaR8I+Xjs
	 sZdUTmmQmNSQDwgHztjw+ANzRhF5MYurj3TBXVlw/P0Z6kckPpQri7PkZ0yFp8gBbKuKH
	 amGhRPuPm50chsXLN36oQcmT11ZDAID9Yr003q+3z+XwDWtMQ0xDYhhHnw5EZ+ISR6mX9
	 ANrEJcOBvNdNdVUSWgqJBMclt4dYLm4gcOWxhkhkhvCGFQWOUB0w6EpMVDfQUqo9ZKDPt
	 G0rb3SMLMRCbVu0W/F8PirLrHInX2x5rbDp0vtqcOfr2c3n0MXdLZ7rjf2042atniBQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjMOIPEu;
	arc=none smtp.remote-ip=209.85.160.71
Received: from mail-oa1-f71.google.com (mail-oa1-f71.google.com [209.85.160.71])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 927B4606A339
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:14:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 927B4606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fjMOIPEu
Received: by mail-oa1-f71.google.com with SMTP id 586e51a60fabf-4a68926c8c4so1546795fac.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:14:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608064; x=1795212864; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=fjMOIPEujQ80OPuCk/2PwfPYl4muqyhEYEkrnqU2gj6MiPamTimEwjYFMt/H/9w7Wi
         UTuuENUdduvK1Ox2OM9j6e9GAJEMPHdc53tzSSDAj1a6+ARSpQiJsqLxzv9iHK/mIhuf
         S7bDxajxb9GFPHBWxjr2+Cfgm9DIP4GdAUYAQ7eGXov/HX/WKBKO8Vtt/FaZMGUFO88G
         zMbzVQgLhL2PpkBGRoAQhEpGUZU/UEjt0UKMkpAYQ9N6m2bW/Wte6R88jCKB3aczvlkk
         m3wa2cFuDRz1ah8RH2GBQgPRgT6KSKqZSiMGkxEnsF2VUy7YKRxWdFGIaSzdaXSeadYS
         e9Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608064; x=1795212864;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VHi+ZeXinLJkVfkfboNP114V/6h0aWxNJE4DAqAGB1U=;
        b=L5yokhCplJ2hDbslGgTh3WgxTxCdBbVT32MbNAt53tZ1pJPqD5vwLrl5HGlci+vLTe
         MmQBgQxwCw9nLbN5o8Y3SxCE6pYnGRseFZbqD4LoXLt302AyvWrOqaLAuN9b1daQdMIa
         e/iO0iU4ooM2pXeTOnKWbOjjBImfQxorzYUT9ME2QvBoTXx2s7jU9og9wWR4MkYnqqM0
         og6xm2N8JBywsfACJUQCVTS5HAW+ijb99NnZmlqY8gXVcc3kc+WAsu7nwZ+F5Qs8cL0Y
         /G08HEl+64fnYukCU1Q8oh07bmjC+rVVPSd+5xhS0tDWV8aC9PFb+P6O7cnKSUiKlGeA
         ZbsQ==
X-Forwarded-Encrypted: i=1; AL+hErEDhTheEsJ6pwKsoA2I4zbCc4pYfkrYDI9kEo/71UUwXolhxsrazVDLD8OactQ0Aqxr/8q/S01HjWg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/Y6VSghrZKQ5bgyUuwtJB/zB5BgkY7S2HWbEZvfHxsekCK5b5I
	q5gv42tn5sNGn8irf+40G7w5eCen0XT2ldZWunSYnBRRYml3Hz+phxlXwZqvgUzCIWwzkvqpC3F
	LyK7rY0tH7kdAkQ==
X-Received: from ilbec7.prod.google.com ([2002:a05:6e02:4707:b0:53c:f2dd:1e17])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6808:3505:b0:536:611a:7fd9 with SMTP id 5614622812f47-56e6015e8cfmr3125630b6e.7.1794608064235;
 Fri, 13 Nov 2026 14:14:24 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:50 -0800
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.679.gc527c65306-goog
Message-ID: <20261113221248.3535369-16-wusamuel@google.com>
Subject: [PATCH bpf-next v3 5/9] docs/procfs: Document KALLSYMS_QUERY_* ioctls
 on /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, Samuel Wu <wusamuel@google.com>, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add kallsyms to the /proc file table, and a short section that refers to
the KALLSYMS_QUERY_* definitions in include/uapi/linux/fs.h.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index fa7a468e8edf..442aae9ebd9e 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     All kernel symbols (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,14 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+kallsyms
+~~~~~~~~
+
+Lists the kernel symbols of vmlinux, loaded modules, and dynamic sources such
+as BPF JIT images. The ``KALLSYMS_QUERY_BY_NAME`` and ``KALLSYMS_QUERY_BY_ADDR``
+ioctls find one symbol by name or by address without parsing the text. See
+``include/uapi/linux/fs.h`` for their structs and errors.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.679.gc527c65306-goog

