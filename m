Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33043328B7D
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 11:14:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761736445; cv=none; b=fCgTf/qDDeQA8vKuknMNIHHLzyqvCWmWZB/W5oDUCXdPAWQmkhgoNhAxFeARe/DlrHw8cpp7YD9pLMMv8YZD7HUEpwCuXSrdMz6zBzewsjlHcKBjzEkOHvz4JR0E7i+BaPA8OorweSe4HwfRpb9MdPfrBZkgXAr6KUsY794B5Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761736445; c=relaxed/simple;
	bh=dRMgEAVrbLB6t767VUoWXvx7LGiIWpYgs3DMBhXzxII=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=naZ/WwK7bHKRSITE/Thv9jF4nvPPkjbgdLPY/zBhTsvO1MoOBQKSwWe3nvSHY0uiQz5LB6hkt1fC7ClojYflbS+UFCSVfdto2uHadjEwGDqY4FYOXu+FFuSmZdGevpUVNR4tJ6SlCcwZBJobFVzKgLWMkWtUkMte61JkfQmT9tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NOGFpQ8d; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NOGFpQ8d"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-475de184058so18813105e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 04:14:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761736441; x=1762341241; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cExzyq1+DdekChO1jhj7ZSGYtphuWQrDzLW8j//bDCs=;
        b=NOGFpQ8d4deZZ8xRDB2G++xrJPmaFu1/dYtYetB8bM9MkghiLwlM1gPwy6D/ky1SRE
         zXED1ANYYpFFtkCdswuwUs6kLBF40WKGwBhnWQS189WCwPDiH2IkkMec/07Nm53xjM5P
         yetSYZFeYhm07DLrCprDWJyNfobGkuzapjtKtipSDTu0B07geeDVywsm7EhnpvRqdEjt
         CvI3sbQxo63LFh6vSGQSN06FiVwLWpVHW5SwZVKll21bQLkHKQewOHns0jNPzsJ/PwgD
         9YhmZnIXv0DSo9gCzlzUNp87aN4Fi1Ams/Anz2kDXewIhtJYFQocPHCClPzbRled3gsG
         H5Iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761736441; x=1762341241;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cExzyq1+DdekChO1jhj7ZSGYtphuWQrDzLW8j//bDCs=;
        b=ETMHIswhyeI9orlPd1+DLo4U+TjAWJ4vR3J9CZ6/Mgb0/b6tsPacww89diXYwX1jLn
         bbQPyFn//XUv4eO7DwuC38D/qZ4vAwA7tqGskT5y6M7yvcyue9vQiMdAArCxzSMoIg6z
         FNOQ2tx4FTWp3GHB6cuGIPuwi/xD3mebKReCafB7/0JbK0mmdgQu/J0YrMEr3PlGIlzY
         W20TkxQdVZkcMycZOTsrPqQUp5pbGztUGEbkA5dl78l3rrHKWhMKbTDbXx0IncnK3wBy
         bw6iVPlL6wkQHQHecrRcZcRLnXyBarxIr/TfDGbww33Ujmmzroio706mC0PHss9jT5VC
         mPyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVezSkNlkHuaTS5v99pGYK4VThkNQJNWiVKvVGJy4SUWET7Eh06IPuV6E4i9q88Q6JMwdQfGSPsnDM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+Xbrii5oKSqmUP2BWLfeEyM8AOr7BraIPdK3n5O5A8wpZxtiN
	aDWbILBidtYx5lE1UoKX9gjdz5rhn25KPj38i96R0nOH8woFfE6/h/aq
X-Gm-Gg: ASbGncsP1bBqM2JxV3in2kmtHQS1HrMEUVvT2rUXEOtbmByhIaSePTv6W+a8Y4oH9OT
	cgvqNWXy42YbHZ4rO9YVF18ruU2nGF1H4cp6FMdfi88GRXgsXKNYGfNCu0cqpW480EcAuvF54li
	2HevzE86n+lwFTrs5+rHafu21kQDKIvN3XGmLPDl58PIXX7YvEaKKVLEZAzXwzIZ3+VRen6nM+q
	brZ4qIqyeUqFHuxZwuiOAlP4fXpWphDOgWvNAHFrEbqBBibSWvLP+3JlpUxiX4AeMwoNml82Gdb
	qmOOylO8iPUwjacI51y9Ld/s7cPkNxtej8KLdMkfw/PLf3KU53HnXHOeIepJzN8/QNy2bnCorrO
	kFJpBENw44Ew2EA5c64RCmf6ijNaZB5miFStJtlfDBQolhJJ9fg==
X-Google-Smtp-Source: AGHT+IGh2i6URRWhV4v6iibwi6PKg5mIhn8IeEnLTzK+ExGgJB2BU2r7APSIyzP/bl5sdigj/wtwxQ==
X-Received: by 2002:a05:600c:5488:b0:477:10c4:b4e with SMTP id 5b1f17b1804b1-4771e1f59demr21695235e9.41.1761736441089;
        Wed, 29 Oct 2025 04:14:01 -0700 (PDT)
Received: from krava ([2a02:8308:a00c:e200::b44f])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771e235ae1sm51661495e9.17.2025.10.29.04.14.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Oct 2025 04:14:00 -0700 (PDT)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 29 Oct 2025 12:13:59 +0100
To: Donald Hunter <donald.hunter@gmail.com>
Cc: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	John Fastabend <john.fastabend@gmail.com>,
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>,
	Hao Luo <haoluo@google.com>, Jonathan Corbet <corbet@lwn.net>,
	bpf@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next v1] docs/bpf: Add missing BPF k/uprobe program
 types to docs
Message-ID: <aQH293IIz8hvobH7@krava>
References: <20251028182818.78640-1-donald.hunter@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251028182818.78640-1-donald.hunter@gmail.com>

On Tue, Oct 28, 2025 at 06:28:18PM +0000, Donald Hunter wrote:
> Update the table of program types in the libbpf docs with the missing
> k/uprobe multi and session program types.
> 
> Signed-off-by: Donald Hunter <donald.hunter@gmail.com>
> ---
>  Documentation/bpf/libbpf/program_types.rst | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/bpf/libbpf/program_types.rst b/Documentation/bpf/libbpf/program_types.rst
> index 218b020a2f81..5e7a202dce5e 100644
> --- a/Documentation/bpf/libbpf/program_types.rst
> +++ b/Documentation/bpf/libbpf/program_types.rst
> @@ -100,10 +100,26 @@ described in more detail in the footnotes.
>  |                                           |                                        | ``uretprobe.s+`` [#uprobe]_      | Yes       |
>  +                                           +                                        +----------------------------------+-----------+
>  |                                           |                                        | ``usdt+`` [#usdt]_               |           |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``usdt.s+`` [#usdt]_             | Yes       |
>  +                                           +----------------------------------------+----------------------------------+-----------+
>  |                                           | ``BPF_TRACE_KPROBE_MULTI``             | ``kprobe.multi+`` [#kpmulti]_    |           |
>  +                                           +                                        +----------------------------------+-----------+
>  |                                           |                                        | ``kretprobe.multi+`` [#kpmulti]_ |           |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``kprobe.session+`` [#kpmulti]_  |           |

hi,
uprobe/kprobe session have BPF_TRACE_UPROBE_SESSION/BPF_TRACE_KPROBE_SESSION
attach type respectively

thanks,
jirka


> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``uprobe.multi+`` [#upmul]_      |           |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``uprobe.multi.s+`` [#upmul]_    | Yes       |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``uretprobe.multi+`` [#upmul]_   |           |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``uretprobe.multi.s+`` [#upmul]_ | Yes       |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``uprobe.session+`` [#upmul]_    |           |
> ++                                           +                                        +----------------------------------+-----------+
> +|                                           |                                        | ``uprobe.session.s+`` [#upmul]_  | Yes       |
>  +-------------------------------------------+----------------------------------------+----------------------------------+-----------+
>  | ``BPF_PROG_TYPE_LIRC_MODE2``              | ``BPF_LIRC_MODE2``                     | ``lirc_mode2``                   |           |
>  +-------------------------------------------+----------------------------------------+----------------------------------+-----------+
> @@ -219,6 +235,8 @@ described in more detail in the footnotes.
>               non-negative integer.
>  .. [#ksyscall] The ``ksyscall`` attach format is ``ksyscall/<syscall>``.
>  .. [#uprobe] The ``uprobe`` attach format is ``uprobe[.s]/<path>:<function>[+<offset>]``.
> +.. [#upmul] The ``uprobe.multi`` attach format is ``uprobe.multi[.s]/<path>:<function-pattern>``
> +            where ``function-pattern`` supports ``*`` and ``?`` wildcards.
>  .. [#usdt] The ``usdt`` attach format is ``usdt/<path>:<provider>:<name>``.
>  .. [#kpmulti] The ``kprobe.multi`` attach format is ``kprobe.multi/<pattern>`` where ``pattern``
>                supports ``*`` and ``?`` wildcards. Valid characters for pattern are
> -- 
> 2.51.1
> 
