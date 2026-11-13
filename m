Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.199
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794608072;
	b=fXsFuxhsAmkMkH1thcqPjfysvwQ0obegK1iYjwcdeLo67n199qAUUWHOF1DNWf64w5R5
	 emI4kddWTcqAB58jQMEkKveO+b4oR3z6conIcOSzqzbKg1L2B0a6b5/XgWgp8Mdfihy94
	 RYhMPV/M8w4czeBd9gVQTy7QuWt9UnoGYXqO1uOnCLvOX+sHsZzEnEI9+PJyxgUuQVzUp
	 hO4iA/MgojtKgfa4be72FjNggGNbgkgoYMp38POCy8hLjfebNp/hdfN7syq3VoN0ZCQrp
	 5+21jh4cpUdN2rVShv4cAzDyltWoWWkW/Xmx6u5OVu3fEBGk+NZ2xul5bZ7FWYSbWlw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794608072;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=RQEzDvHEvvVvQ1qVVf3m8J9tQxy8VhbPqMNtOkf2W64=;
	b=RyKi4puBHriCmIqEnarArSeVUNdq2887twJ84HEVO+jwbxuhfcn7s4xUxd+D4jlwc/TT
	 /spLmG/nJ7j/5dXG5Osvhq5SrGSqOGA4d4NNpVAKxxq95SvRYRqGPOBWqu9tJhsKji9Eq
	 nC8GXwK/3chFlBCzNR8v0kO/5bLm4ovoxcfST51dDHi7q7Cw9CcdlG1vqO1zb7nlpI9wL
	 PDONG0TEi2cMg6QUESsRjMaw0I60O9BASCTVCIRHM7vPVQV63429mm7E9h5s/H6TECsHi
	 aLBGcz+dddC98ogQsJO9W6jBTbIuHqcrK7wB9di3gRJiOXYIYmjGe0GPbS38miPjC6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSTdm4cw;
	arc=none smtp.remote-ip=74.125.82.199
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10CEA606A885
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 22:14:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 10CEA606A885
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--wusamuel.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=kSTdm4cw
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33713e5e6daso1357109eec.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 14:14:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794608070; x=1795212870; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RQEzDvHEvvVvQ1qVVf3m8J9tQxy8VhbPqMNtOkf2W64=;
        b=kSTdm4cwrtwVBcbeXSEgRVdC9FYi0CsFOhzjN9w9hezdy3TgKeC/BLev8OPkk1jDHv
         3BptnIxicseeFTM8z5xNkFl1lzsMtR4VT9SPzQygsfINcbnN78Ktx1LDku/nBk/h4PSf
         QHZIwS7H8xtfdJF7jq5o/ZTbgcO3QfTYvgn3oG8J1GpywjE5KbMfTQHVdUgz6fyOP8al
         QzIB8KYUtJ0Xb/zBc1CZfIh6/WKKCdZcxs1kfSLR6gFTl5B5TCQLWU6UkHBQXlqM+j9y
         csa6/LPUdjZYTxUtb1bUlQDxKKNYLMsorIk3BKfAFc9an4dj6VXsJDp//h4YDxOR9LfF
         ZUKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794608070; x=1795212870;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQEzDvHEvvVvQ1qVVf3m8J9tQxy8VhbPqMNtOkf2W64=;
        b=jD30dZMCOl8rM79SIZ0r7SJuJLA/2Zl2lm/WMoUlDBhpZ4IJ1lW6r5ZMEaxX5Fyr6C
         3cOm5SRf7wA32u46RDdXJVWVGR8A/rx70GgZonKBhug8leVV5X/PkNLiXx7a2LuayCqT
         X+yjDfWH5h7B/uo4BrRCifSfiQzw4e8VTUwOpKTWfLA3lnXEBsUqKtafexJtMESoUAcE
         H3CPHffhaskx5AO0DEHXPzs3jKKph75QYj2+LBaNRDhcEHwDkpfyCXsC+Sdv/PDRaoTF
         zWVFSB7v2HUIijp6YDuRF4TV9WRvdufF2tt5SDq5JFYbX9V1vLduItK0GaXDCL6f/3Mr
         RisA==
X-Forwarded-Encrypted: i=1; AL+hErHRsDVNZ6+szHhj8gmmBBnIfAFCSDQmGqR+ih22xsGmvl+PSXISbQzuhStbj67f3XWMDT7imZbhpP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z/TFCMFyw64r/r36nSzMku+X1EfS9uW7pK2t0jszWbo7xx8GhsZ
	uHRx9eCrZbC+thfuEDa6uWTfAmNQO+4Mi+LagT4KBMdUgD1rDKoqkAiOXcbPIO5p66fQAnOKNhQ
	M4HC3KBn/dKDIFw==
X-Received: from dycnl13.prod.google.com ([2002:a05:7300:d10d:b0:36d:461b:fa1f])
 (user=wusamuel job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:fd0d:b0:36a:1f:9b74 with SMTP id 5a478bee46e88-37967ed53d3mr4702535eec.27.1794608069745;
 Fri, 13 Nov 2026 14:14:29 -0800 (PST)
Date: Fri, 13 Nov 2026 14:12:51 -0800
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
Message-ID: <20261113221248.3535369-17-wusamuel@google.com>
Subject: [PATCH bpf-next v3 6/9] tools: Copy KALLSYMS_QUERY_* definitions to linux/fs.h
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

Copy the KALLSYMS_QUERY_* definitions from include/uapi/linux/fs.h for
the proc selftests.

Signed-off-by: Samuel Wu <wusamuel@google.com>
---
 tools/include/uapi/linux/fs.h | 56 +++++++++++++++++++++++++++++++++++
 1 file changed, 56 insertions(+)

diff --git a/tools/include/uapi/linux/fs.h b/tools/include/uapi/linux/fs.h
index f0a26309b6d5..286e82c61189 100644
--- a/tools/include/uapi/linux/fs.h
+++ b/tools/include/uapi/linux/fs.h
@@ -567,4 +567,60 @@ struct procmap_query {
 	__u64 build_id_addr;		/* in */
 };
 
+/* /proc/kallsyms ioctls. -EPERM if the opener cannot see kernel addresses. */
+#define KALLSYMS_QUERY_BY_NAME	_IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL_MAGIC, 48, 0)
+#define KALLSYMS_QUERY_BY_ADDR	_IOC(_IOC_READ | _IOC_WRITE, PROCFS_IOCTL_MAGIC, 49, 0)
+
+enum kallsyms_query_flags {
+	/* Match query_name as a prefix. */
+	KALLSYMS_QUERY_NAME_PREFIX = 0x01,
+};
+
+/*
+ * Symbol returned by a query. Each buffer pointer and its *_len must both be
+ * set or both be 0. When set, the kernel sets *_len to the string size
+ * including the NUL, even if the buffer is too small and the ioctl fails with
+ * -ENAMETOOLONG. The module name of a vmlinux symbol is "".
+ */
+struct kallsyms_query_sym {
+	__u64 sym_addr;		/* out - start address */
+	__u64 sym_size;		/* out - bytes to next symbol, 0 if unknown */
+	__u64 sym_name;		/* in - user ptr to name buffer, or 0 */
+	__u64 sym_name_len;	/* in/out - buffer size / string size */
+	__u64 sym_module;	/* in - user ptr to module name buffer, or 0 */
+	__u64 sym_module_len;	/* in/out - buffer size / string size */
+};
+
+/*
+ * Find a symbol by exact name, or by prefix with KALLSYMS_QUERY_NAME_PREFIX,
+ * in the entries of /proc/kallsyms, except undefined module symbols. vmlinux
+ * matches come first. A module_filter of "vmlinux" selects the core kernel.
+ *
+ * Each call returns one match and sets pos to its position, even on
+ * -ENAMETOOLONG. Start with pos 0 and use pos + 1 for the next match, until
+ * -ENOENT. Use pos only with the same query. Matches can be skipped or
+ * repeated if symbols change between calls.
+ */
+struct kallsyms_query_by_name {
+	__u64 size;		/* in - sizeof(struct kallsyms_query_by_name) */
+	__u64 query_flags;	/* in - enum kallsyms_query_flags */
+	__u64 query_name;	/* in - user ptr to name or prefix */
+	__u64 module_filter;	/* in - user ptr to loaded module name, or 0 */
+	__u64 pos;		/* in/out - start position / match position */
+	__u64 sym;		/* in - user ptr to struct kallsyms_query_sym */
+	__u64 sym_struct_size;	/* in - sizeof(struct kallsyms_query_sym) */
+};
+
+/*
+ * Find the /proc/kallsyms entry that covers query_addr, or return -ENOENT.
+ * ftrace trampolines and kprobe pages are not resolved yet.
+ */
+struct kallsyms_query_by_addr {
+	__u64 size;		/* in - sizeof(struct kallsyms_query_by_addr) */
+	__u64 query_flags;	/* in - must be 0 */
+	__u64 query_addr;	/* in - kernel address */
+	__u64 sym;		/* in - user ptr to struct kallsyms_query_sym */
+	__u64 sym_struct_size;	/* in - sizeof(struct kallsyms_query_sym) */
+};
+
 #endif /* _UAPI_LINUX_FS_H */
-- 
2.56.0.679.gc527c65306-goog

