Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795654191;
	b=EmjstwAeqCzRSI3IPldcGx8f5Lm5Z5PPSsoXthF6nmjO4qIjtnl2mB2iWIKPtNQ/9YWh
	 55Dtxdy15s7CbI2eMSDeDlHEEc80z45QUP+lTtG+E3Ca98U0Q7zngiUL+zhphHl4qNUKn
	 20x6ZjTbZcHj+pWfhc0SjmX9LFlON3GQmN6f4j8VDnvaGpwgKJ7IBOp8RsMi3DsmIcRLn
	 RZMIv/06RNC6T14+Jq0oYmfXJe9MRDrVVbh8gpeectW5XPZSB4ZkbUZH1ZH//d//PL7T+
	 3iAshiBGBcVhbyLGJ+BW37E6b2z0ob7Bretl4amR42oQMl0Z+xMzntZJMf7SX5M4wdA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795654191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
	b=DxsDmvivQvVl2aAEhYRaZ+bEhEHOnkxYvCZMSTqb87/xNKeAz0cVNfrRNJTQa7rGLUw4
	 vbVhoAfyoxgCy0PbbkrNpZAHpNG6waF23wBmFNTvnG09D7rh0bzYGWRqcqZEITi53L/2G
	 +MIZmSJbaLNIrfNIfplaENOQaILKMAV0IIOf6vYzITh7SilfTBvUGnRWU+GFh5pzjJSwk
	 kShYtqxT3/6Mj6dK+3UtWX8ZF2ldZ3OlpwSNKbQ2R4ONtqnpna20mvK2FIMTu2I4dD1pT
	 RHS7SlyAvdPq+lrlDtz0W9IuTKtI4HIt4oj+qpm+RfiUQ85O/Y/At3/mGzKEJXIob0A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TD3ha0rn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.44
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4ACDB606A323
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 00:49:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4ACDB606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=TD3ha0rn
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-c4322d310e7so110004566b.0
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 16:49:51 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795654190; cv=none;
        d=google.com; s=arc-20260327;
        b=CdqcU65T6VvIvEp/HqOiWsT7W7pU+tfYlrRNO7oJNxF3tz3YduLNgAl0tTH2J88U3U
         zuVFTXbCGTGtjjgvwKYPeyXsvscfhzlxdwc7BrUNtSnNHVUmE+7ddDLUFXMEPjbkPX93
         h+SRYMq33DsES9YeiguSJU7i68w8ixu9pOPY418HQg+kipmErsnrGuHvSLoiAFGuinmN
         8U+jH1QNKsBL22RD1bXcpDVuzk7U2PvOLtf62dNX5edjb/wDsDKGQovLRFY1rUTKVesq
         r68JG9wrVDl8qkT2NbYoKnuP/iiOA+c8t9SIG4nXtlUtlQhIP+AGKN3Ih37jY/VExjhT
         VPgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        fh=bPVxejWSS4LQl7oJHMP2Bn7OgV/z9o8jUHXpB6T/rpI=;
        b=GLzuinytzBycmRFo0hjl8x1e0wS3GVJ6JeruHypXam5jNLsw8lVglIw1tCCj3EOpIQ
         RMht/D/HCwdrjT/ZZof+iVAkeautqKuvY4IqKYqV2V+VwAjVWvHygQ1XtaSF2oAWVFYo
         xtL5XXs++0EUmRRbCb6doiik7/5/eaSFpXcdPbHPOMO/P7bgWlT+X0MpPr/e1px+s6Ud
         MHn5mskFNViJ2U2R032LgAKGRz/NthsisNKH0G3Q6rMmJhoAVutLzkFO4zwVtB/z1fCt
         JsLwVeuI9C91Xf6HTDnHx5/5tG8FpL55Cm5N7G0LAFb98p3lwQS+Xpwt4iD+dLlwfwa3
         VMHw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795654190; x=1796258990; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=TD3ha0rnSCMzB6EDdCanCIo2aztnTVsAWrsh8HrG5Y/aRrFlN2ndLBXw880f1YHLZ/
         QSfxPbJeIna1/g4lWyiIQwpwJD12i4G3TGAPhErD+7VvOdvbXoNFUGW/sZDUdcKc+k/U
         fLW/extCpKtDduL/D3vHzyoVyDpb/98nn+tR+abZco9jsGFWEFngZqgt6TnMkhRshp4B
         KnHYS7XEZFGjKsHdNaQA1fEyq68/xePBost3IMRVEVegEsUL5tFkIeCHeASNeG2SkZb3
         JP9uGCT2U7VP0g68JLBP9wLuAWo5qxzvzbWaRKXYpp5AAo+d01ZiPGTRjL3TT/PoWk+S
         RpiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795654190; x=1796258990;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=V3xdrz/ADvfzRdkROHvxiyJcnHZIhgxNZVfYGWmlfhc=;
        b=v6r2RNxcwCtgbfwiYZS5FtGkyyEKRfXFt2908K+koFTF/E40b0w6FCJshnHBXvOC5p
         PEmps3SznN+nN+5jFIaIBEPzHQwYo+ZQYHARdCTZtmCzbE8FdEHGQQuHD/0kWg4dJBdH
         DD6Z1VdCvhfTJhagSyyqwGxuOSz3fkgLZQGYjbeIHEzxtx0yLH9KEFmhhSm3rMRTjoDN
         EfmaiH5ifngZnkID/j8qAqGCXAFjYgOMNIbQkQcZ953drV6/RCDI8EdyElsu8XsD9Am6
         BDm9GwVKisaMX05R4id4PFNPrfTypeWcjQw4gXMzjA7zv4Cfb90d3ulvjEdkxK9O//+B
         pBgQ==
X-Forwarded-Encrypted: i=1; AL+hErH/NMOZP5NOJqPZ4HKEhJJMlGiOIKUwk/BWL+CFAxoQUx0NjC0ARDZ83aaD7ywian0FODTmm3bOot4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+03IfAQo0B1d5xPLSeybZ7197GZ9RG83+GKHaDLttIyQlYKNao
	d0SY3vAyUF663+UfYuRPvYEeQgdaSQzf+dAwjSvWT9v9BLXuXSljZxjO7Kmw5wmXWQTqDIdagDf
	8rqMvumURyoYgx4hIvuaeQKpoiIi779f5Iooplbwg
X-Gm-Gg: AZFdTZdpVqf1263uDNai+Rhf2D0Y/x3o5UGsdS8mLXy5f6MEct3Ds1F/J26UvdB93JS
	Iu7GFuq80dP7TfdHj0Lgmai0UGRnTRQTMuTOhcf4fSpF1qEewzjLGmJ5DMuuSnGjN4NnHMWKOux
	S/jPRK3dCauzn+MZmx+kEKOveoCB/ccaJZpsSvNMby/4Zy2IWQH8f9RTzyBcaK9BUPmhvoC6GcJ
	hXlxQUAX7ucoueHBQ+QSIg8oGNZmLhwQ++eUGS+qnyoP+Y5nu7L9R97BGqjW87NnqX20oPhzeFu
	EOYFnfUzIQsr1MtfsX4U81dygO4TBGrql2FOZsxVgpMunXAFwe83ogx/fcqetP9SVr3tFJajh2i
	bV4BeBxmFz1whPkgFf/EONKd+/PHpvQZeilHAavafFtX3UT2y8HiC8nMzQJOTHzxR2uM=
X-Received: by 2002:a17:907:e11a:b0:c3f:98d4:dfe2 with SMTP id
 a640c23a62f3a-c513aac21bemr1112327466b.18.1795654189395; Wed, 25 Nov 2026
 16:49:49 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com>
 <20261113221248.3535369-15-wusamuel@google.com> <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
In-Reply-To: <CAEf4BzbdGw4=yWxFqdFuz1U7RBSFqh7baJX=SpBNJJqnaW5P_Q@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Wed, 25 Nov 2026 16:49:38 -0800
X-Gm-Features: Aa3M54ol7ULgIQ7PyJ4MZUA4jeAQllgic7NBQxD7ZgZ6wx9FC8B6-VKox80ApLQ
Message-ID: <CAG2Kctr9Bg+4uz+cKWw79S6qFRPtW_PRDt0rFY73F6WpauXG9g@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 4/9] kallsyms: Add KALLSYMS_QUERY_BY_ADDR
 ioctl to /proc/kallsyms
To: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Ihor Solodrai <ihor.solodrai@linux.dev>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Petr Mladek <pmladek@suse.com>, David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

[...]

> > +/*
> > + * Find the /proc/kallsyms entry that covers query_addr, or return -ENOENT.
> > + * ftrace trampolines and kprobe pages are not resolved yet.
> > + */
> > +struct kallsyms_query_by_addr {
> > +       __u64 size;             /* in - sizeof(struct kallsyms_query_by_addr) */
> > +       __u64 query_flags;      /* in - must be 0 */
> > +       __u64 query_addr;       /* in - kernel address */
> > +       __u64 sym;              /* in - user ptr to struct kallsyms_query_sym */
> > +       __u64 sym_struct_size;  /* in - sizeof(struct kallsyms_query_sym) */
>
> nit: same as in previous patch, I'd keep "sym_size". But hey,
> "sym_len" is even better and follow same naming as with sym's
> name/module, no?

Ack
[...]

> > +       return kallsyms_copy_sym_to_user(karg.sym, karg.sym_struct_size, &ksym,
> > +                                        &m);
>
> nit: if it fits under 100 characters, please try to keep code in
> single-line form as much as possible

Ack
[...]
