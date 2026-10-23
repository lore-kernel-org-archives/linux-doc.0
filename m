Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792714659;
	b=A8knhQgBbrZarxf0hU2hji3wV5Ia0S3y3V1Y187u3yAV+AwLhnim3eabRglWH6a4IBDr
	 LFaNL6PSSIvkK/YZ2ORbGx0/4sCfe1obnEoIYBD3DXx8jV/v++rGO9XtBwBXYzkPX3OYB
	 V06Z2AXuajPH+PN53fwq3WwNKhkREegf0DiZV1HAxY+QEBG9NjdpsulFGtYuqzfzOn7ia
	 gkbcr0aEjOoWKAZTtSfbshvJRiheZih6cLERmqtyVWEKbMBoq8DGDudDT9wUKAywXGpE3
	 z0g0QcYM5Lczj8OrUSJ5zMw17R7SYVsdcy1U9OIiJYcyTyrpKfOSIya03IdQQ5KWyUg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792714659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
	b=Ox+SBiymJEYxBiUebURpwPD0kULNkg0k0t6E3aFpUNEoiqeFoQtwLgaFg++LpZehjx0T
	 nN9PFrXeDna6Mmd7c5NLChxPmTZTkxrnhHIz5TnzNVvgAXCfQoh2nekXOM1xAAonWwL7l
	 1qp5KZtHX3E3R94l+Yj+jzY8ZvWyxn9uQIojnLe8N/lg3jrt8z/ABUQTnN+LDlA4WxmVM
	 5XcgTFc+8aXUTuuzwLGtbKft6F7iOIHGSqI6/AdtZ2uxm5tgTc2rJ+q5z9VbgTfwW57k9
	 Fp4X7n62t6xX5wcayL6d6U78rfxEJvemDrxC8XfUGm4lL0SyOA3f0eGMFsoKWPel2cg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sqYqHqN8;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E081606A319
	for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 00:17:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7E081606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=sqYqHqN8
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so592014eec.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 17:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792714651; x=1793319451; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=sqYqHqN8b2C9rJCdSIP5pixpXsTX2920yN1d7s2o/SmV4SPD2hmw6YaJEz3yDvYtKA
         iSPMoTZBdLnSRU20QVbyo97PcqwC3mfoFnT6y6ewBev7vqiAKdtisl9PYS3ylTJbV8Nd
         SF/3YFB7sPEcIuuiBBK6CPmB8u4BmtVrr/3ql6+jzgDSDSbJMsfS7KMwL2mHf/3+JFpR
         m/PeyE/0IrROwKBm7BMII7pz1si4KeVS0wby68xzfFfXqmcqa49Lcxe1UQPEw2GHzsfn
         b1Pnyv5Zi57Jh1uZqx5b8M+FhLwsFGdHA8X/oDvRvpdEuRU8NcdDjTxNVNGg8QkCjZD1
         b1Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792714651; x=1793319451;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FGFVdcUD4uteaXAQypaWTmH+/zCVpgMAi79JFzYNdNI=;
        b=f7pe38ED3bgkdo6N/euTfABJJWbhnYTjGt6qeTlQSTJ6H1SOFFgdTKpJleaTp/Bd8c
         Owg2RpjIWWExfzmjJk7uwiY1n30McdEGH7PyCnwAOROEHN9VybSf1UazoNTHu2cj4RRi
         Acou8Dr/J3zfH5DQRFJLrA9OtOzOhiP4skIsLl4b2ErBxi3/NXu2MLz4kkB7tedapHVT
         jL+Wwcy+838A0PCB0GkOLvp9h2GzEsGtLUfH/9k4+tHPAjc6UmfWRIHVgimh0G8ARxi1
         Oyk2XEdVcGXAyxBVlfPK7xus05jr4mMLeE7dmTSn7qXmpHTiXO8HAYSJov+OYzsN6ueZ
         j14Q==
X-Forwarded-Encrypted: i=1; AKwUvBwZVy4o6sDHsxCqXBzVyTtEkuIyUtG5SI9Iv6zZwS1NWko3JY6lL6/5DF5I+bX/f6G7MdDBmOxjZJQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYLeu9hl5OZ6tCq2E8Hf49TnwX8d2LY3wQSBwERqIDv8x0DYvwZv
	aPyPtHEn3m6guBy+WrY7A/UpCFOQdzeuO6D97Ewc10SUTG+eckjxhoClKxsfT3WoKUxxK3WoKTv
	I4f2coaLnWTNFxQ==
X-Received: from dycuf12.prod.google.com ([2002:a05:7300:10c:b0:35a:6ed3:3ee9])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:693c:83c3:10b0:367:185e:867a with SMTP id 5a478bee46e88-369d98e5b8cmr933601eec.38.1792714650260;
 Thu, 22 Oct 2026 17:17:30 -0700 (PDT)
Date: Thu, 22 Oct 2026 17:16:04 -0700
In-Reply-To: <20261023001603.560210-8-wusamuel@google.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261023001603.560210-8-wusamuel@google.com>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023001603.560210-11-wusamuel@google.com>
Subject: [PATCH bpf-next v2 3/6] docs/procfs: Document KALLSYMS_QUERY ioctl on /proc/kallsyms
From: Samuel Wu <wusamuel@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>
Cc: Samuel Wu <wusamuel@google.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Document the existence of the KALLSYMS_QUERY ioctl() in the section
describing the /proc/kallsyms file. Refer the user to the UAPI header
for low-level details of this programmatic interface. Add a "kallsyms"
row to the /proc file table.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 Documentation/filesystems/proc.rst | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/filesystems/proc.rst b/Documentation/filesystems/proc.rst
index c102b62023cd..a0e2fe14a01a 100644
--- a/Documentation/filesystems/proc.rst
+++ b/Documentation/filesystems/proc.rst
@@ -761,6 +761,7 @@ files are there, and which are missing.
  ioports      I/O port usage
  irq 	      Masks for irq to cpu affinity			(2.4)(smp?)
  isapnp       ISA PnP (Plug&Play) Info				(2.4)
+ kallsyms     Kernel symbol table with dynamic queries (see text)
  kcore        Kernel core image (can be ELF or A.OUT(deprecated in 2.4))
  kmsg         Kernel messages
  ksyms        Kernel symbol table
@@ -1368,6 +1369,20 @@ Provides counts of softirq handlers serviced since boot time, for each CPU.
     HRTIMER:         0          0          0          0
 	RCU:      1678       1769       2178       2250
 
+
+kallsyms
+~~~~~~~~
+
+The /proc/kallsyms file lists all symbols in vmlinux and loaded modules.
+
+In addition to sequential text reading, /proc/kallsyms provides an ioctl()-based
+API (`KALLSYMS_QUERY`) for querying specific symbols and addresses. This
+interface is binary and is meant for efficient extraction of data without
+parsing the entire text file. `struct kallsyms_query`, defined in the
+linux/fs.h UAPI header, serves as the input/output argument to the
+`KALLSYMS_QUERY` ioctl() command. See comments in the linux/fs.h UAPI header
+for details on query semantics, supported flags, and return values.
+
 1.3 Networking info in /proc/net
 --------------------------------
 
-- 
2.56.0.257.gf7497c7d27-goog

