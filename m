Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794752676;
	b=R7KVV+pCCJWrcnVBa0sjFqe18vAc73EHeLr1iTsEg1mxK8osyYikYZTieU18XS65w8cV
	 g1meuL/zTmFNqRuHr6A5H0N3fyI5iYFigl60q/y6Zg24CwCcex1ZTKEIkwgmuAlT977d5
	 dDugpd5bphuIAVxChVWacH6kL0i4au7d3dux5C01N5oFDd/WEx9vDtQf0uzn45F2cxYbx
	 JmI5ZbrT8rH0AfRusKfYw2QtOrcbOWS2xM3iQtIS7rVtcLWCm0hIAgo+E2KwoSeYRpjCW
	 XUTvdsv+YTZY4Hz0QuAVxcjeX0ucyxWIbW+ABUmegBwcZgA16n39qLRzNW/G1Dva/0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794752676;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
	b=P2t4aKEn/7awgE+RaoNretzflpf679v/iMVHTkCx/YFZP5m62TDfnDPtuQnUuNTyD5JI
	 /f1lNGleHYOc8X6fsGIBDiYbFvUU7dUh5bYDnHSge+N+EW3U+xU8yzy3RGpwPKXR0fup0
	 TEuvEKvUc86HyDjhS8TdEd14dtMzfikaCUbFm8XYtEz906Ot90uAOALFnLQIQGlXAKstC
	 tSM83wlCeciMGLvAREE7xiv7IaszD04Oxy2VFC4yqb3meyd7iSae2Z6axPCymfJG1+qCw
	 7SCkLqJ/Lk9bStYsiKAHscMlaZfvWSL+jO20w3CeFTsrJVp5zHI+Vv0piWJoBipuvzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxVes4fN;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F315606A8A3
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 14:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F315606A8A3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=jxVes4fN
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4bb64ef5a00so4809095e9.3
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 06:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794752674; x=1795357474; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=jxVes4fNS9TSgGvlHsTT80+9II9XinvC4prossPItwxQmdIh/ly0jdC/cdyT55vVR6
         dxr87FlrY8HaEzKWL1k6AkuqQTejZzqNuP03IkWn/1QKMcHCGusJm7Uzh90VmKNatLHN
         /Ur+ln5v7C1S9XPfNu7fKUrI1pDdBwtHp9o72Tv8ddrZYc02/UP04z5Cj9qKvnMUiuBc
         AKlR1i85YUHuEqLhR+nPnOGxB8gyhi3BmtQiXq42P2XoLdScRFWDqb++9b0P9t/EHP1y
         PjbWv5kEkbF943EnXhorY4a6wJ2J69Bqn/WcjcubzUA5IRKt9NLekdoBKWqKwl/hWu6c
         NQpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794752674; x=1795357474;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7QzzvIBZ5m85jb8a3T2vbOcaHxM8nqWRH2JKBq6oOx8=;
        b=BCFNCH1lxzhgiIkrNHS2N6BXbwYwhdFvmW5dEGJ8HuKWKiIpFRueB0XLlZRkjNMfeA
         +U0lyTditlN/zAMgwuGkeQKL8x1wDIFf3kk7Gwk8q1DHxevDPLiK8liLt8SFzGngxO1H
         zKu/MLNiLjbmQLan3+s9lrO7YW7Umhapv7jivpjnm4y1nzFRZZoY959IsCBoB80Bse2s
         B6hG6fVCjZ3A5M/HsnX8BIASYHFxGcpRkTjuEKlF0tSM+tQuKO6LcuB5aZCqfaIAtrme
         qtTOxBUhKWCFnoJZ3iMQafoddTovKEKkWxvUTozLhoIuHzspHvn//GCEhRmPa/jP4HDt
         hWQA==
X-Forwarded-Encrypted: i=1; AL+hErFBSZRh0qdhsXTw1Og9ujS1t2EScsvXqA1HHy82FHzrOnmwci4K5rUMH966DFx/xxS9to3ZVAOqwkM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9myEu4HBWNZ3c+gOokuxVcrl/jfPKPdJ5qMOLMqRxzYYoD7HtA
	Ohm3qrsDIWwV5TiGGAc1kQnUmNpUUCjJX/XUV4Wj1Wjy/0DlbLz7Dxm8
X-Gm-Gg: AYBFou1uwD7r6ObBpIGudN9ivOGuF9Q5mln+WlujqcshtaAyCu6fQ+giQD0pOTOrhj+
	w4tDO1wfQwbI6jqMyRlG8eF5W2MqAZ5YnoLFgECF8Bl84oioMHR1P7DLGrtP74zz+hdkNmLlzXP
	91XRmRhWjfiMM/w3l4y5qb9NroCAbMdKzerIERImmLckj/tLw6oygAWCW7gMT/5Ia1kQKDO9zEd
	YC4Qg3wKoclOkwF3PHljZimguzeECwbfISQFifCq9kpN1TT1pXqZZUOBcv+YlSIw36D1Mt6SyLe
	ehet+IQPrSF/Gygm/WF6NeYPjtNjVuDOCtneXeX8vxwSTmpf9kzL3Ows54Ut0i2gssetRNrJeVt
	bQnF2QALzGPFf/mZpz94tgL6aOSf9+CVxk/74uue7vn3LiuSxJckDGTQFdMZYNTBipiTlHsoH6a
	pi4ei/rOoLHGAw9DMyKKRA9sJF81zDveVPPKdLgIqTN08AkanmeCz2T0erC+0Wthl2idAglqYnn
	kQxUTWvOyZje1/X0qYxewQQzbskqXHOE6dYtms9qx6Ev3XsrKiD9pPcP9sBwV1fjIVYdACMSkOO
	kvb29m9YjwgbU0KWyg+mvtaxF5YHr7rld58+clUiy147jCkqczSjO0qmxpN6e5jyGTtCqHATuDc
	ZO+hOJSqk1/E=
X-Received: by 2002:a05:600c:c0c5:b0:4a1:cef3:fb3a with SMTP id 5b1f17b1804b1-4bb55a6602amr130912825e9.9.1794752673813;
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4e2adf53sm318854915e9.15.2026.11.15.06.24.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 06:24:33 -0800 (PST)
Date: Sun, 15 Nov 2026 14:24:31 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Samuel Wu <wusamuel@google.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan
 <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Luis
 Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, Daniel
 Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Aaron
 Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>,
 Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei
 Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>,
 Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis
 <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, Nathan
 Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>,
 kernel-team@android.com, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-modules@vger.kernel.org, bpf@vger.kernel.org,
 linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 and KALLSYMS_QUERY_BY_ADDR ioctls
Message-ID: <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261113221248.3535369-11-wusamuel@google.com>
References: <20261113221248.3535369-11-wusamuel@google.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 13 Nov 2026 14:12:45 -0800
Samuel Wu <wusamuel@google.com> wrote:

> /proc/kallsyms is the primary interface for userspace to query the kernel
> symbol table. However, resolving even a handful of symbols or addresses
> requires reading and parsing the entire text file, which is often several
> megabytes and takes thousands of read() syscalls.

Separate from this, I've wondered about separating out the /proc/kallsyms
code from the code that actually handles the symbol table itself.
The two parts are pretty much separate.
IIRC it uses a static function to get the symbol type (which does most
of the work of getting the name - which it also wants) so it isn't
completely trivial.

I'm pretty sure all (well almost all) the changes will be lower down
the file than my changes and won't cause (hard) conflicts.

I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
in userspace for testing both, but had to cut the bottom off kallsyms.c
to get it to compile with a sane number of definitions.

David
