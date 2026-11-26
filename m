Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795713687;
	b=4F14JiNL5XcJbVsHcMdhhNEaUuFPk9cNCik+O8WDdZS76sAMiHAHqmqm5E9cb1lsxzYt
	 /dOZl7Y8C2DqJ4SrGoRt3wVIrUa+gJM4OZWWD0SdTR+mYorIXLrBDrdX5Qd+5l3/YIBd0
	 /V8vI/6Gn0JlquSafQDRON57aJNNMKBf2+x2BSRWGycI2X49XQiWiKdfmTjrjRUaal3s/
	 Ic3lEENLvFBQqm51IPBtAbz/Tlthlx09XkcyBs1Fy+g7DJdxv1YIMhhByR6Ohi264XeAf
	 mp2V2O5gkh8r695QPcTCoVHOII6zj/+Gh8B9Qv6S2/Lu9noqHNtQ5OAPB/SbPC0h8tQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795713687;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
	b=byfYbdaAhGODHRVbMP9lrbOx++9km8Re1Mc9a/BKn/v7o3xC3mDKWkcCk7JS96xsJsw8
	 sVDeqLWRZJZ2cNEYexhtU1a5B25J8KClyVYm9aCexw5HccQXXe/WewNPEeJAejLvHKpK5
	 lmcNynRpAG4nXTU2wGjO0YceLy0CD8wZe4nQn8pyg2OHGUi3AsmfKB/LFWgVi62A5NDNT
	 9Y0hoffmQvQc12y5BrDYHkXQbhD8DXoGyI9b7NjQY53/NSqWvqscuwFg6BljiPgXbk9c2
	 ygoU45PUjScs2BayuKDGhDXSLh63AQdnr7X6J9ucx1l9t9sj/KIMgTFJHzvF8TY54Zg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eAUyELCh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.49
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80825606A31C
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 17:21:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80825606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=eAUyELCh
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c516a1623d0so795023266b.2
        for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 09:21:27 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795713686; cv=none;
        d=google.com; s=arc-20260327;
        b=rmeBiJ/OWJiQpuJ+Q62I/bBBu9BsGJ3nmH7PWTeyRqifDKiNv6h0jOLD/2RCJtJ5PX
         W8j/deleMjOroE3toakuJ1GbWh6RtQ1LJXKOtkNCMJ+lJBKb2pnaeHiTElEcj53hfDcM
         Epqwp41escDrrfj4vxlvZA0VV2Ydl7gwC600iu2DKBgPvf2QviFywf9MKUYx17uOHpY/
         pB3uIcrk19qXORsbfJKLCG/WcDhW8UZU5AwoEaBZALp0uq59fGEauBvKyXDhm0x4Dkcs
         cgeubt5mjZZb1HBgiNZ6ziRG5+8ltfaK8V9ourJ0H1O1koOLuuNvRNRePCaQeNUxqdhr
         Wn8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        fh=/7X8vt2HlvIKKNxhFilXcPlI1kp5igXWRhzYnN/AuHI=;
        b=qlqDVsQUv3PldfbnOPb7qY+ueEr8bsH1axJl1fbMta3/l1D+yRWtgiQjQkfaeOvUCX
         VZdIzFW12BAbW4vkJOvfjDBh3yyArXmnTbvz04Ib92lFH39FI9LaiCuvYIIYK8m14Mny
         CZaMOXdtyD+EwJvAMl/U8Q8ea25EG+740A9zqU+iHhcXSXtKwg/hLQap4bnLH/+V2+am
         nfvFxbSqJKoeeuNNouJ6uMu3MYOqHGQvy5wb0k/3JNFCbhEbhpLejRZB7vCCDhdXULZW
         +7xx1KqiSMyAQDlI1grz+aY4CtrYo8QLqOtYH3mn+Jo6mkkT5ojSNnDAZuxua6BIdZpc
         yqBA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795713686; x=1796318486; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=eAUyELChNxN03tFWhGSn40N0o3gjWO71tl5Ghcmskz8b4PGVkssqVMVbtcP1ufdgYD
         siuET0E8+b/8ouzgAVqs2MIlCaW9vlronDx+CN5r4hENRnHoThYegScR0BXwbEXaFWVv
         vbCqNQk7tkQOJoCj6JvZkgF6A2MrU7JYcLhNOXZ1Xe1EpXiHSTAa8An0988zX+AY8Pep
         2FxXxxd9Yyf1K1seELTv3Pu/d0l8SVkab2alnZfc1y6/i2PE4nJZz1OmTUDwKwoKvPhp
         1ls0QPxv3w/sWpsW686NeXrfa9MjQEe1y8xx6d3P6ciusGwK3AyEX4jEpfF4Bn9DZiMX
         a+Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795713686; x=1796318486;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hFMU0WQIu/Khu5nkOekEsJ9G7/wupBV+7k9T9skPX/c=;
        b=NGqDY5kODniwq7b1wXInQn+S2n5PNB9HyLebFgHNpWGU4EmKKzf4R3GDgj+1DOtq2N
         tyYkgcTvLlKmc5E/TX2fZIe8ovmA4qcLpZU2K7tTsH1vKWzmGjGlL2L5RQInUquJp9LM
         BZE7Qi+agglkS1bpLFYkZ+0cXC6q75sFHNztHjzm919KeBx5109H2asaYd0ALydrkKhv
         krEc5xpzdwpwnVFlrcZ+MXLgZlW6V4wPvmh6r++hjOQ/h5Sptk2uHqNgCACKPUOviHG9
         8iBe47s5PszlT4cBsGAXWTFw9qnWI0yTwn18BOyZWb3VRaeu+sJOXxTOQEmn06Sg5eJh
         IGMg==
X-Forwarded-Encrypted: i=1; AL+hErFIsqF4zY2zq2hjSXr09QT1jcRMUa+TSieBz21kdAuEhCrCYcXfWWEoZtGB1Zi9ny1R48/yOJrd+Es=@vger.kernel.org
X-Gm-Message-State: APuU4Z9XwgwMSwqltRAchD0+E0S3Fxw8dP/KBRMBYIo4qRoQnlcJvgMt
	AaLtkhmFrzefLPpLmNycNItB1nqrFPmYowNnYTuVvJ9gn6amUnx5+Sle4fFg7QUflh+9OfLceP8
	P4+ggbJmugFy6X6v5q2ZBVZaPIyZET5YStqgNbnQv
X-Gm-Gg: AZFdTZcTM8YbGjPgfwo4VxhzS1gIzijy7xZy5D0cnMSnDiTFnWnr/Vgfs8siFdVqzje
	fW52klWmuat494KMkJ3UiZ/V1Ynnil9nfdjUtOALbOVGjLLcQI6igBAt1tS1As9kaacuHHgAwjd
	0XSrlZYe5aib44CvMSHVmKIOLm7JfYF51/ZAlpqJz4ersFcfGHwtiGO+1vhxvIHBlNGUUK8Z22V
	hkBeDORDJdtKKVXZ6+DyK726qlq2vYp72stMCCamc5XGtpKhXmXxuYgvlM0CkhweZpatu66+GUr
	fUknrjFzfIFnVp+rvyafpMaYng8idDuPL5GmQHIphKGjYPEiil8XZ34+IneBszWkBX2+OB0Z34L
	aky6A3+nWSKHx8lsFmfgVtf9nax3zKVmakkRv/0eCNkuDjAfZrpmRsyFGf44jY+n5y49ESQ==
X-Received: by 2002:a17:907:9612:b0:c2e:2baa:a642 with SMTP id
 a640c23a62f3a-c513a8845femr1932673766b.30.1795713685324; Thu, 26 Nov 2026
 09:21:25 -0800 (PST)
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
 <20261113221248.3535369-14-wusamuel@google.com> <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
In-Reply-To: <a40ad738-cb7b-469e-b67b-353b64622dbd@suse.com>
From: Samuel Wu <wusamuel@google.com>
Date: Thu, 26 Nov 2026 09:21:13 -0800
X-Gm-Features: Aa3M54rqUPDLnBBM9ls6-9-k9q7s0wsA5-hr6KgHVGGraAEFEEYG4syBhxuXwjw
Message-ID: <CAG2Kctq7Mb=pb-SFU88eRA1cp2Qt_HJ0nADY5fET7Es-_CcCOQ@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 3/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME
 ioctl to /proc/kallsyms
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Ihor Solodrai <ihor.solodrai@linux.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, 
	David Laight <david.laight.linux@gmail.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 2:45=E2=80=AFAM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> On 11/13/26 11:12 PM, Samuel Wu wrote:
> > To find a few kernel symbols, users such as libbpf parse all of
> > /proc/kallsyms, which is several MB and text based.
> >
> > Add the KALLSYMS_QUERY_BY_NAME ioctl. It finds a symbol by exact name o=
r
> > by prefix in the entries of /proc/kallsyms, with vmlinux matches first,
> > and optionally in a single module with module_filter, or all modules by
> > default. Each call returns one match and its position; pos + 1 continue=
s
> > the search, until -ENOENT. The output returns the address, the size, an=
d
> > optional name and module buffers. A buffer that is too small gives
> > -ENAMETOOLONG and the required size.
>
> The kallsyms data in the kernel can change between two
> KALLSYMS_QUERY_BY_NAME calls, for instance, when a new module is loaded.
> Should the mechanism provide a way to detect such changes, likely by
> tracking and exposing some kind of generation number, or is it
> unnecessary?
>
> --
> Thanks,
> Petr

I'd like to keep scope of this series simpler, and I feel it's
unnecessary for now because:
- today's multiple read() of /proc/kallsyms have the same race
- vmlinux symbols are immutable (I imagine most queries come here)
- ioctl is size versioned, so a generation number can be added in
future as needed

I've documented the non-atomic behavior in the UAPI comments, so users
should know what to expect.

Thanks!
Sam
