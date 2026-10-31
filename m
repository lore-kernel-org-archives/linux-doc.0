Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466188;
	b=YeOWSTV8VO2VIBW58KpRneaQ+t3h9DF5xbKCQlsu6TObHPG57HofQwmVksQk4BTMBlMm
	 pDtIgbFuHhVymvZDYingxEyxXN0ptVgPV3FbltXnV72N6wxNY83lknXX+lrJXtus9KYH6
	 WzUyYSa3MY/5gi0VyRJYAg7zooriUfwHg2tMvob67OuUN3NfxHajKLR5E99INJKOba+rw
	 sSzzEGnqWjIRmqJBMRJK+UbkphHmoeclntHp7aCices9b67b//TeIOZfR26VHzw4Wgp45
	 XmpoLsMhUwtXiBhywFDkbezH+sJlKLTdmoRu1RjFUtysnbU64PlGOHcmwXLxa0OBkwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466188;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
	b=flOsDvD5AL2QJMdXHqO152ZBdsPNJTEguAXhTW+JwBG5mWnwCqdAR5ZAfojSk16bhrGH
	 RthVnCQ8RiyX3UT84aNve3VulDEWJJWrRSwb4wXW92NwQhGIxyrjpYDsixkte/HgbPweV
	 j7nz4Nyg91Vt9zljkYmPIPf/gqU1lpWEG2jYOKN5xTrnETqpwFyYvdSTCLE37cfCNdg2G
	 BawiJNvICsJEQMglPBZYSwV4aw1R3AqKUfuJmLA1hJBOn9fkgynoML1O4fCRn86GnAqbz
	 B88gbkjWUrBIkZwST4iH4qNW7/X/SlT/WGehI/uSg2Ys77OwsT/3wQL4a5bTihQDYow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8E3v5cp;
	arc=none smtp.remote-ip=209.85.210.169
Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3C8606A320
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 17:03:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CB3C8606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=i8E3v5cp
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8a06210b29fso718804b3a.1
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 10:03:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466187; x=1794070987; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
        b=i8E3v5cpMSfAi1mqqro21Q/8Raqh769HEWZJL46CwnM2v9wK2OLVzJsAuCSE9qf3zq
         tQY50fNwQDpf+SJSRQlAgqkCXH0WUUKhP57b7/iP77Uf3WNogA/laZGasAKdFWEz783R
         toarBNdQRNtB75h9qwyX3N4XLDJa/7DPVsqKt+7a6In8nxnIlpSFdU2WiAXEmjKaF5ks
         XnZGp+AauqkTqlVVZmUVXtl4Ag0HgI6GlxH75NYUPYnvp305gsOHdLStmb2NDkg/ihGG
         sRkldpqZ/xsViTVAvbYKqxtnovFp7bSCwKkO/qhbTEhCAOOAoI1dYAM/lSLdEuekL6SG
         SZDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466187; x=1794070987;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gba0XFZ/wiG7mOW6sD/3lIcnTLkNzkhvuJnY/kVtgnw=;
        b=ZU9MszgXAs/LhoNPPYgHpdSNPIvV120ADXsqYnh07Av1PwX1AFJb3KT77fT++lypUZ
         JENY4IncYwB+zuz+B/K1JBsASwopKp71sj7vIbN17uK8hJ8Rk8+e5lVPj65C/SdxgC+Z
         Z2+GXc9wsCUhKsRhs0b/iYmwV2Z0KM0Yv/cWNVzTo01O+TR4N+vb9pjrF6NwhPlVkMYP
         zIX+Krw+CaXZuULWXcvkpsJbjYzm4cIGpru+6F8ngo/g3ToaMAluAIaFD53osYefl1B8
         mVtHelFCgsoyWSEUbPjNJdIculgCNK+zzW5EKP3rV5UE1tAH5qYI4Tw4iI0vEAUz+sTX
         ocIA==
X-Forwarded-Encrypted: i=1; AKwUvByK5KtrvHb/Xe1+rx94ETu3FUvbW4dV/lCVjOcmrZgyblQWmE9tRSQTOi9e2ZooUSaMAGmJxySnTEw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKdz5sXAKUnr0xgoRTuGtK4tf3zT6dJeZYXZQJL7FCHxdZLEd6n
	cb743lxEUQL04deUR0FNdNo0VmOaMzNG5WXpZMd40oxZhAsDuG52uLfX
X-Gm-Gg: AYBFou1j6yQtcdMljoSpWKOTxJZSwoo9o8mvG+ql+LfCtzZclfe4I7JfBJDmtpffKt3
	FJFSo/fIR6Aji6fvBXBQcaYszT5yoY0Spc4We8pjGJZg9hlS830b12LZLk5JQQ4BNiGch+byM75
	Z+FMEUsUBLQ0sjEhJT6A+xIFLsnN9nRFNKi38JvRbPZk4xRxsd1axvlEMOwtQ9LDhWJ0TKb/28E
	zc8Po8BSZ+m7sMnZxDEE6S5S3Z1gFSxwzN7QxCa6QuRvb+iLJyijpZzw3/z3VhoOQqFTR31+EJU
	w58NXiSleNVknBAfk76lgX0nmFkV52xlagvqX2as0aMk3FR3DaO0n0t9CqUIjo7wdZ9JFW1KmSZ
	obXkTWk2q9ORUzoRvPpT0ggKJnywtWnXqcH8OSdiQzZ0f1+QGKoydhAyjRkEbCy3DLFjiXPb81j
	jn8BtncsqqV342rjFwuGgNxMzlk0qwsL9hGeueTjYWUEMvzWu/XouM55EdPr0JbZZs3QewXgvbw
	VM9XmlZJUKTA2RMMM6lFQuNNFyRCS31tuySPu0iCFexcQNJIo8oEddK8TEHaA6HHf/UlRHm7pb0
	v6/SnbY7Fliz+FkU5zOBuTPkaOKt1hYsuvQScUl4oXeILjKdc1UaPPYWAMLvlr8rZFPiz1LdKzs
	7Zx1HSFAOOC0d3edZhnmUcOdEZJ/sgTFKGVgS8hBB97oN21MMilzPttU=
X-Received: by 2002:a05:6a21:b91:b0:3e8:e974:e45a with SMTP id adf61e73a8af0-3e928e26581mr4547143637.63.1793466186813;
        Sat, 31 Oct 2026 10:03:06 -0700 (PDT)
Received: from localhost ([153.61.198.246])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8aadad94a8esm817264b3a.55.2026.10.31.10.03.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:03:05 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:03:04 +0000
Message-Id: <DMJ6PAVGV9ND.29T5161F064JL@gmail.com>
Cc: "Ihor Solodrai" <ihor.solodrai@linux.dev>, "Alan Maguire"
 <almagui@kernel.org>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Yonghong
 Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>, "Steven
 Rostedt" <rostedt@goodmis.org>, "Masami Hiramatsu" <mhiramat@kernel.org>,
 "Mathieu Desnoyers" <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, "Nathan Chancellor"
 <nathan@kernel.org>, "Nicolas Schier" <nsc@kernel.org>,
 <linux-kbuild@vger.kernel.org>, "Arnd Bergmann" <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Hazem Mohamed
 Abuelfotoh" <abuehaze@amazon.com>, "Bjoern Doebel" <doebel@amazon.de>,
 "Martin Pohlack" <mpohlack@amazon.de>, <jay.wang.upstream@gmail.com>
Subject: Re: [PATCH bpf-next 03/13] bpf: check CAP_SYS_ADMIN before looking
 up bpffs delegation names
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Jay Wang" <wanjay@amazon.com>, <bpf@vger.kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Eduard
 Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>
In-Reply-To: <20261031130959.23472-4-wanjay@amazon.com>
References: <20261031130959.23472-1-wanjay@amazon.com> <20261031130959.23472-4-wanjay@amazon.com>
Content-Transfer-Encoding: 8bit
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Sat, Oct 31, 2026 at 06:09 AM Jay Wang <wanjay@amazon.com> wrote:
> That is free today because the vmlinux BTF is parsed at boot.  Once it
> is parsed on first use (CONFIG_DEBUG_INFO_BTF_LAZY, later in this
> series), it would let any user make the kernel parse it and keep it
> parsed until reboot, which is what the option is meant to avoid on
> systems that do not use BTF.

Any user can do that without this mount.
/sys/kernel/btf/vmlinux is 0444. With patch 9 one read() decompresses
5.5 MB into vmalloc_user() memory that is never freed.
The parse is the other 2 MB.
After the first use the kernel has what every BTF=y kernel has today.
There is nothing to guard.

> Check the capability first.  An unprivileged caller could only ever set
> an empty mask; such a no-op delegate option, and a malformed value,
> now fail with EPERM as well instead of being accepted or failing with
> EINVAL.  Privileged callers are not affected.

That changes what user space sees, with or without the option.
Drop this patch.
