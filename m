Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794885328;
	b=XMkrOsvmpLLHKZOhMSX1lczKNoP/qnXWB5mjkg/8FGgZrCi6d0jum8otZ9T55eskP7e3
	 WbCGGvkvKWt1qmi0okzG9njqw5bn2W4ODCSSFEeSw8zsVQ2Neo7KnqecdM3NVEzsYsnbp
	 9amUInw76xOCsQTxr6bOLZGKH4bOP/mjgy1gt80pPRw9Ej1dkktjA3tW8ZKV5uiBuc4Wf
	 c81P1YaaPqqR1prTJ3UUFb7fErmWUnGnc5XqCCFLfXJfrQrq2TLq/SR99xgZMh/2ykNO0
	 l/A08wJKG5yILaG1bH2ZHqT603UU9F5x5ctHDGFMGZMDT95ZO/zTZkdK2Kjb06/u+mg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794885328;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
	b=Na/JZ8w1w6unS/0afQRKH9+jWEstr8wjcTcdBYvCpOx97m7SZ+aGClAG2Hq3L5smvDdJ
	 DvydgkYtW70wfrNBUMUv/Harp6oB3KOjF4wjmn/SXnHopa3fGA1ezOl5wa00m57zE+wMK
	 mbUjzxj83bwOG6BaTNQ+ZeYyCbGOuHNyFKMq7J0yfKD45yZmCYt02EOKTRob0L52/9U2i
	 plgW4gRs9LRkubVPorjInOoWyv7j42Ffj44K393ozFuHes9IK2JGylsnrhAsEq2Z8YnNR
	 jXLaO3pFnasf1M84d7s2sJnnHCOUWcU7Ed68LtOntLIT1v9NddrfIyKj50LQ6Yz8ujg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWuE0zna;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.42
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57E44606A332
	for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2026 03:15:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57E44606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWuE0zna
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-c45551fa84eso786029966b.3
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 19:15:28 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794885327; cv=none;
        d=google.com; s=arc-20260327;
        b=WYsS75mVp64Lca1z61qk0BqL5K1ycWuSpjYQQziCeLpPxMTeuA2qX8ddGLftpFY7p/
         YJ82q4yMUk8bOglEXYxoxytb7vkmRfiI4I+Ndfaw04MpVas/UOEF6W/EQ7uNA6uach9N
         1JNyJQBAFWBa+s04ZFjEj6FU724b1odhP7F7rzakoZKwijIbd/a0CJ5gD4DxPiWyrQzj
         JYQp3BMgxb1/gWQe723Z3LZIVh39o6eidxT0cwJ0UyQAxZ0aVKpS1MXOn6Gq9yGD3/Eo
         w2sWQgD3GAJj60A+9qX/W5O/I3Dq7HSg0FybdgnYduhCI6MMT2XyaRvNzx6Qzv+mr792
         yVhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        fh=E2NxKoFZR3PS1CNbxjB3Cbs5BJ6MeJxiZ8swHLTGEAM=;
        b=ka06iK1fRIzJwoRk++A0tnmj+Hv6WpeBT3ruL81cyo54iWSYYA1x+NJ3uJiG828ZUy
         z0aReI1pYFcKFBJMmQJGMV90TmypuhaY2PX1CyY/bR91v+gXlvc4TtszPa8UKDbraM5B
         hS3132Qkh5QPejUf3/trCZA9RfeOXTgHVuhVXoTTHxxhhHxi0kwxsAVNlLuJuE9ISmSn
         w4CyxAvHLDvnraP413gYDCkznYxmlT0d9OkKx8uPLvtajGWSVRbKWVLnJc5Y6rqaJkgJ
         LAoL97WXH+roXLOVCkM7deNplt3WnNpwqpfyL801Bqj1Ne9JqdIYYAbnUBRVZpG4i7qK
         TOxA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794885327; x=1795490127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=UWuE0zna/Kej6vRfmnnkBRPiB7MtRAOmWnZDUwfDZnARnTtWa0lZ918fHjZc6mu5UO
         /2+zJyxEYftdneZsscW0DL8Fvl081Y38tQO4Pv5tUIPYfcIIYe6CjwGLqcKBSst9Gk21
         HyjrRa3A/10hlqRod0LbCztyuvg1+0RmyX0gzRFwGRR3oqb5tPu6tQU03asd4m3tC1Ly
         2jBUNoTFraXXJMf5dSQasvoZ/LajiRGFP3fxeQbTALoTqP2ZEYO+PCEtWNT6HsCG/4y2
         Qq35/dZdjfO2Tkf3aMOsAIjY43RWuC/9l+8ADKlIptRxOOPmsxJVEZSYuAL1Y41KbuEX
         BlrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794885327; x=1795490127;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kkr2HKfNrXjykOWOiy6eWo0NF9gQ7pUiMwlvAPC66AU=;
        b=0FsqqHhJv1NPY2aJRdwJ4gdwcPjwUXgC6yYjU8ZmoRSKBKJuTuf1VR+fUZNmbE/lAX
         LPJtoN8o/PNkFkXlQVMsOAdlog6nmzIZX1Z40B7W/+pxagJnAi1JdKr5aeAEvPM7m2X9
         Ebx2UWUaaChz2ic4LUVEyj/DylIgcquAsQRHBPpV4xKxl5lCSZ+wnBWJ25oO8FfOccA2
         xXAogl5zk10ephClPz07hsgkoAQZkS9EXNK717KEDj4ola99FcaXz8dlNUuiEm39N3Np
         mLScOW3Pk6IAPQH6hdDOSwn0pa/zAY4S3vL2jczXTqxY3sK9TmL4zSlm0WOOGDdIbZLX
         zvWg==
X-Forwarded-Encrypted: i=1; AL+hErFCJ+19226BF74gYr3/8ojLd2dCYsy4umpAdBW4BfL2wd0Qb7IVKAoHQPFBK+JDuCGAzvGAzK499yQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z93O8KfTR+rfQvu80PrulqgWRA4+eiQltpo0gSdQnM68WO5y+jE
	jgj+Jgb0rgyDxAsegcSaJMmVaNVh51YUoJ4siVebKxFuOxDybGbck75nuIZDXSnRG267zfsV+bC
	XvR8yaRvOS0lHP4+yBeCc3cnWcuhjf+E3PItJf0gq
X-Gm-Gg: AYBFou3GDp6M8U12QggIYUeQeEsMe+5XPGpCGDNWoTAR8EgRx8JRXjmd4fo+zU9V567
	ngc8H3L944Xua8WUNhPdyn8ZmhBHRr3La5ymzP89Ex4k/X+Og2cP6pyJ7f01zzQEbY5U16dzXr1
	YtQg8Mgc9W54tC1Oztrj+xVhAuKVw4QK1bMbleRXJdKqljv58dZs0PkCR4zIxmQXvMMGYKDRGhZ
	m02XUe4xxFZOam6rxXqjjgYZmgz+WmZ1BtA5THnNJsamed9LdhYd30Cs8dQC856uom4kInaTHBY
	850gudVRVW0Vs50gWhJIuv+Nv53Ql5Awc/75Yr4KgLuxT+wrAj9Nn+qFcEFuEeCLBAhFmJmj1Ye
	Lmr7y6p1IGUU+QnpWF+RL/oSeeK4hWvwz6GlFmSftq7fcQuVvrD0wgLcK0VEsCEaEHYBPEuc=
X-Received: by 2002:a17:907:60d3:b0:c31:8441:35ff with SMTP id
 a640c23a62f3a-c50968355eemr1101863766b.48.1794885326369; Mon, 16 Nov 2026
 19:15:26 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113221248.3535369-11-wusamuel@google.com> <20261115142431.1587690a@pumpkin>
In-Reply-To: <20261115142431.1587690a@pumpkin>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 16 Nov 2026 19:15:11 -0800
X-Gm-Features: AclHuK-iBEn00_VVuz6qjGQnwYZ5FRJ6bny3VEMRskBOJf02b9BDmwbxXueDduo
Message-ID: <CAG2KctpP7QH=tdSB=op703rA=CtjQKAXqOen8JEHg1ygy9sgyg@mail.gmail.com>
Subject: Re: [PATCH bpf-next v3 0/9] kallsyms: Add KALLSYMS_QUERY_BY_NAME and
 KALLSYMS_QUERY_BY_ADDR ioctls
To: David Laight <david.laight.linux@gmail.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
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
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Petr Mladek <pmladek@suse.com>, kernel-team@android.com, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-modules@vger.kernel.org, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Nov 15, 2026 at 6:24=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri, 13 Nov 2026 14:12:45 -0800
> Samuel Wu <wusamuel@google.com> wrote:
>
> > /proc/kallsyms is the primary interface for userspace to query the kern=
el
> > symbol table. However, resolving even a handful of symbols or addresses
> > requires reading and parsing the entire text file, which is often sever=
al
> > megabytes and takes thousands of read() syscalls.
>
> Separate from this, I've wondered about separating out the /proc/kallsyms
> code from the code that actually handles the symbol table itself.
> The two parts are pretty much separate.
> IIRC it uses a static function to get the symbol type (which does most
> of the work of getting the name - which it also wants) so it isn't
> completely trivial.
>
> I'm pretty sure all (well almost all) the changes will be lower down
> the file than my changes and won't cause (hard) conflicts.
>
> I've been compiling kernel/kallsyms.c and kernel_kallsyms_selftests.c
> in userspace for testing both, but had to cut the bottom off kallsyms.c
> to get it to compile with a sane number of definitions.
>
> David

You mean separating the core symbol code (top of file) from the procfs
interface (bottom of file) into two separate files, right? If so,
seems reasonable to me, especially since the file is approaching 1000
lines even before our changes.

And agree, even with both our patches, most functions can remain
static in their new homes.
