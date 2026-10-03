Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FBB4350285
	for <linux-doc@vger.kernel.org>; Sat,  3 Oct 2026 06:32:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791009146; cv=none; b=p1MVilqIdiVHYelFMnDigg7aEj4s4ZJKusSt8Itg2OD2dahJYWAHRpGckC1SW15gDe0Mmj0P+09hh1R+c2MIilOqR4wKW4rX7XB27Mzjwb+qRUb1mtqylXvAreHH//WTTxX7u/ZpzQfnAG2NHR0D+Pzj1kGroKKqU7aFfiNs/5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791009146; c=relaxed/simple;
	bh=VuiMGsvrxoxHYIMjTtEAMKJLNMC58E+oDp1FFjB26XU=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=dyAB5+YPK9KLyhRkb6RY1+RHqA57NSetwksESYDkKQb3An4hlxWwKkG0lCvGJqXXedQyycbWBFCQ9fYpVc7QjQdFjw70uUWDCdVLdarTPHdmrAWRmmCQuowcW6A/bkSnuScafSRYsKO4HdeE6sc5+6JuQpcViBmwdlHtOOe6OO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DL3guCmC; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DL3guCmC"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396ccb652d7so85280a91.0
        for <linux-doc@vger.kernel.org>; Fri, 02 Oct 2026 23:32:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791009144; x=1791613944; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vr5KVZoPR0cul9dM0w9bT4mgxCHNEHDqUMfTuf7KfX8=;
        b=DL3guCmCAoGGad5fqQhT+5W2N60ezuvD94VtFpob8EDuN/9oZNMQlKHDpKAkIFeIqv
         cOYuDc2THo5GGGolhJh0u08uEpd/a0aW2pVhSbGM+DGfgBTDKm22DxkQ6LX2FkKiM7yS
         jJV/jTe/NGZqAqIfD6TfS+NvtBajMlBp4v/HObTFUIzWKLyviiMPwG3ZAouqLj26zAwG
         ZcJjzfa+1isefTBiR26J43dKgCqETQBDF8CPhVZde99KZyOFaecA23+M4lrbFKXIXN/C
         dkTOqRKnWejNq/nzi8KHvYZV7R7OXmRw9eMk5898z5VOh6iUMuXoiZABMloEUTphOZXz
         PHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791009144; x=1791613944;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vr5KVZoPR0cul9dM0w9bT4mgxCHNEHDqUMfTuf7KfX8=;
        b=qLVcykfapv/gcuPiHOjLEZbVGvJMnK962+SO1YTUFpyKm4/bWZxDhxZUCU+2StNWJt
         dHf0IU7jvthvFkpSfCFj+7VGTOrFtRmBC4vFYHvcVatXoxdCbYtBsvHq2Gr2lqmxhHpU
         8CiojTlBCakY7ZDr2AILo9CT3+ShWJsXtJtY40gOC5R0VJPUOp8fsP6Vu2us3dW51++r
         zLf7aPoukXDPze3xqjkGVqQp2Mmw2XXeagmcvC4DuqI2ELpnSFXMlWmdetttXAbri1en
         L1+OMJrwtofLVQg8D7YCxSidz6R/FewbWFtDsy8OkyfEFLSwwgGIpqv4EHl6qRTpQ/5g
         EEPA==
X-Forwarded-Encrypted: i=1; AKwUvByAK3tTa2INQn/Ddtzr97Rj17jTjL/1WvxcJIUJWYAGmwqR9/KpDvIi0lnI6SEQ1H/K+tmNhUkwKSk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIEJVr3WBIL5vt8UksiyQFpSzNQOfj44Rrw4uoJyUN1ayjjUNwr
	JyLnOhJ7KqQQ2g0WhliNb+ZJ/3kNYGshYx3k7dQlQgYYv+hWCYzvygai
X-Gm-Gg: AYBFou0JvseG0RUCWhQBFfK0ro9+IqlkZXUZCiBvgs7dAT0EHUiDq1x7cK/DxWsMMav
	HUAHY3kbKwvjJdGkm3438fwA8EbEmGylfv8RAle6dGzk0FSXSh/sYUS127qccyBuD8nPbMKyYLs
	rr23BLLbgrTcMxKNN50MF0fYT8ov+/vDMYRXi1epPz5dw/a8OmcvL9KiHtYUdErcE4j6AwBj8g0
	iJEebciPI1NIqBdg5EYRUqCPWaHUXc/nxGjL2Iior5qB48ACgozQWOU/xr8m5KtHGEScbSsBQMQ
	kCjcGRHJ3EXRYITH/+P9x1dKWw2MdoUA3Ejz5PHVQRtce+pccEy4Ut0RJqabBe87B1SxzM17tJc
	OzifAvbnwAL3dINrD4m5hLt2m/UvzSMe31OMlhJKGifGXOGFBQdHtwBCTZilV1KI/nFeSpwrdlr
	hFkrUw07cbpNzw819eebLUuO0gp90dhrWPN46rZxIRWMtIqHk1K6mdYfjx+TGRWnCe8hAE0EPgU
	lWbH3qHAwC89djOOp0jOoYa07e1FQQ6GkRG+c7TiBP7k89rN8IUV6SNATt9SCEzt3D7Bad+oZJR
	//TMxIvPG5bxQA==
X-Received: by 2002:a17:90a:1650:b0:3a0:7261:d58e with SMTP id 98e67ed59e1d1-3a6e622a50cmr2049092a91.22.1791009143685;
        Fri, 02 Oct 2026 23:32:23 -0700 (PDT)
Received: from localhost ([153.61.198.249])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a78d6b5c3dsm1823004a91.13.2026.10.02.23.32.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 Oct 2026 23:32:22 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 06:32:21 +0000
Message-Id: <DLUZR540Z45R.3RTC4COS2IW2V@gmail.com>
Cc: "Jonathan Corbet" <corbet@lwn.net>, "Andrew Morton"
 <akpm@linux-foundation.org>, "David Gow" <david@davidgow.net>, "Petr
 Mladek" <pmladek@suse.com>, "Sergey Senozhatsky"
 <senozhatsky@chromium.org>, "Shuvam Pandey" <shuvampandey1@gmail.com>,
 "Steven Rostedt" <rostedt@goodmis.org>, =?utf-8?q?G=C3=BCnther_Noack?=
 <gnoack@google.com>, "Matthew Wilcox (Oracle)" <willy@infradead.org>,
 =?utf-8?q?Micka=C3=ABl_Sala=C3=BCn?= <mic@digikod.net>, "Andy Shevchenko"
 <andriy.shevchenko@linux.intel.com>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Mathieu Desnoyers"
 <mathieu.desnoyers@efficios.com>, "Jiri Kosina" <jikos@kernel.org>, "Daniel
 Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>,
 "Eduard Zingerman" <eddyz87@gmail.com>, "Kumar Kartikeya Dwivedi"
 <memxor@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu"
 <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa"
 <jolsa@kernel.org>, "Emil Tsalapatis" <emil@etsalapatis.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Christophe Leroy (CS GROUP)"
 <chleroy@kernel.org>, =?utf-8?q?Uwe_Kleine-K=C3=B6nig?=
 <u.kleine-koenig@baylibre.com>, "Madhavan Srinivasan"
 <maddy@linux.ibm.com>, "Michael Ellerman" <mpe@ellerman.id.au>, "Nicholas
 Piggin" <npiggin@gmail.com>, "Shivaprasad G Bhat" <sbhat@linux.ibm.com>,
 "Thorsten Blum" <blum@kernel.org>, "Alison Schofield"
 <alison.schofield@intel.com>, "Dave Jiang" <dave.jiang@intel.com>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Guangshuo Li"
 <lgs201920130244@gmail.com>, "Ira Weiny" <iweiny@kernel.org>,
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "Vishal
 Verma" <vishal.l.verma@intel.com>, "Randy Dunlap" <rdunlap@infradead.org>,
 "Shuah Khan" <skhan@linuxfoundation.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>, <linux-security-module@vger.kernel.org>,
 <linux-trace-kernel@vger.kernel.org>, <linuxppc-dev@lists.ozlabs.org>,
 <nvdimm@lists.linux.dev>, <linux-doc@vger.kernel.org>,
 <linux-hardening@vger.kernel.org>
Subject: Re: [PATCH v4 00/11] seq_buf: Add seq_buf_strlen()
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Kees Cook" <kees@kernel.org>, "Bill Wendling" <morbo@google.com>
In-Reply-To: <20261003035906.too.263-kees@kernel.org>
References: <20261003035906.too.263-kees@kernel.org>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 02, 2026 at 08:59 PM Kees Cook <kees@kernel.org> wrote:
>   seq_buf: Add seq_buf_terminate()
>   bpf: Remove dead newline stripping from format_disasm_line()

For bpf bits:
Acked-by: Alexei Starovoitov <ast@kernel.org>
