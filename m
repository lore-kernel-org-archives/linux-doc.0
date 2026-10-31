Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793466609;
	b=laiP53a2It2cQBC1+VnYDDkLVQYzQSLD7LSWgXTziiDitp6SH+Xb4tNPaj0XXVwgmt+m
	 RNwcq1bGAuAU2xWs1jxBx7lTvzRaGdYsEdIXo11W4/UndiM20uw4oOMvzHgdbALOXYRm+
	 QjbQbptoEChCBDouX4AiYHCOVRfdWZ0JKpOLRVJp+iPom3891EzBp4Uc1ESVDexxRK1Gn
	 t5eS3yZkMQhUu7jIArkCI0CHLL8xcKQoDJZkBeKamXTn0nxJxLr+x7Ywy6a0pblvIRx8R
	 Sr7RNzfZlEoheyfLkyk5d2C0fl+OG64zcMsV5klcmb5mP3WuTVuMf4JDg4SzE/GnFfA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793466609;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
	b=cdrjhpBUDrBgixaYOexNYghagwyvaPzHLhWbGRtXOiwRi6TKOMLe5YJFglaraL8NriAw
	 1LPzExw6Mrw+VMhljIByHJFX7Pg9u8wlRGh47f6hPVOTtWkHlD0vGknyxpZII7zHlEw9Q
	 LRLchfy/gGTqTXRV8sqNSiydhgltZug7A3Ot9/oi3MLcKUAUCoMalNnnwNmRPCxl4b5qK
	 JBysFiIQM/1jj3ckDOESHRK0oDn4JXioHnkgkFYzIi6QMCnrkVxi8vMcwYSUyCMbHU1Kq
	 3xW1ST6mv+GHD+7gG4sziuMLKSislXlcnE3eBXWXYIc5H9DR6gXGdVqr+NAk7NiZiKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAlQpn7V;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68DD6606A329
	for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 17:10:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68DD6606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zAlQpn7V
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ae57dc1ea9so862112a91.2
        for <linux-doc@vger.kernel.org>; Sat, 31 Oct 2026 10:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793466609; x=1794071409; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
        b=zAlQpn7V5Yxzz3a/EooOjbQS76Q6xQ0YpJEIcGp4YzdScOrPhhAvrUur4/FQHYJqRA
         8zfHghpz6jXKETFWCpI+22lxZ4tiU8Y1Wc2I1LGCzNcA48QIfHM0NthCxotitdxVloRD
         7jW5L//FxVzW4EuToHyaxOBM6p67ZQEXBbXMiVGM13bEtgPc/LRBcWVgFZo7OtjjXbae
         x38X4P6bQH9CmqpDSl/U0Gq7hPzrHgec0DsPUl+NFmdA/2pRimxjub456nrjYLulRtoc
         kY3kMmeFOtp3fe5XwkcAgy2f09rE2oqb/7WSkbZ5wd7smSeRqi0JaRIl0JBf3GPVA6ml
         lPLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793466609; x=1794071409;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S02zFKQTw98qLAlbNryreV97fiHHWFWx7ndQG3y57t8=;
        b=S4zM8mEsIrcuO/QCbKV/uSC9g26lwC6swDjRMdMOla/jI+rEXpqqze9TE55XlObDDD
         a7L2VU9j8FRuX89PLplA0JMsM+Q/aquv4/VKj224vDq5uH0URfQAGkCU77L+DVkqJSVb
         tabCQh8jkto+X1ts2A0QAhC76foWX+5FkW/C1kqLFtk4+xCkMNCe2rzhBf7eSnVvOVE3
         EJ4tnrg5+aRpiy7+o9mS5f5UhdLc8Db4PmsMbYjt66/8iCgd+oQVpuDVL8qc+4CBFQPy
         tVOi9uCWOTUOejDpd7z+Xik80mLtD8hZogiqeGEO7TXt225QxtFGyY9T/I+x8C0JM/Sr
         X+Aw==
X-Forwarded-Encrypted: i=1; AKwUvBwhq6auFgN50h+ZhPO88kGo0vb61T0mo3nEbGLRvu+JhtpLHidgSUuqQko76BOrH8xfho2p/GMLWHo=@vger.kernel.org
X-Gm-Message-State: AFq9FYK1FvCV8p2tvpM1+5VefHydYVHGBhy5U96YMRI2YmRRqUvHfBqk
	5sixeGlqF4fXDILswS6o2KEICsb5nEFUKwugvWpo1FA5HA8RCizPJ1y6
X-Gm-Gg: AYBFou3YdmX+/JKonq5OHUFtOrRJOxRCZSwCuI6sF1WGxiBCzB345UYpwtrUaNWNUeB
	9fWxZJEPUKZwfupowl3K2KFO1NTonqC3c2ErVpHuRKglAbs1bNP5wpqlxUoOxpLn5BI/s7Q/BUb
	5hiWhrISq24gJ1C+0i2qQqjJN0XzuL0hjw452MyAMJdj2PKuIfOq8Qzsk3XY4p5xMISCo9cnoqj
	DIsqsFnaFdCVWrLdodtn2IaQtwU0aXLpi4vCKZlnXSR/a1XnYmZ+ScngpoNc1ixJoe9qXNN9cQm
	abg5aAbfb9sqwvD6t3DvIuSth5qdp5fmfnAaXf5fNOCG8wzWFovDx+KwS/EIoLzOBr6hXhaIH20
	p8L2CGRRZYZOoU4uoX1LNQ/Xy8RBzFUx98V+JxBfDNqkoMv0o8SOZI8wbJh7qbQLL/kToxzUNjM
	+Ia6r8ME3/jyaSbGe6k7Ga7Z1N+cSfmvrR5nR6ToYY119yCrWfiuRSw6sVm3LYoviYdzwzQWBE1
	z8+1mELkRwoF+jsppmOyOv0in3hUMfJpZSHwgWYQuRvaexN47m+jSDQ+HBqxH7oOD52XyYYyiwT
	3UZBUOM8ILbyEv8wOISQs/mKvnbxRkn6UYCMUmA9M5rO+9QQWxA0OSlI0fC6zY0N8y1F++SGYkR
	gGBhhZIjMraTHmqbRQ/mXn/UOHgiuc25Pvg==
X-Received: by 2002:a17:90b:1a8b:b0:3ac:9e76:aa76 with SMTP id 98e67ed59e1d1-3ae8970fd9dmr5106038a91.13.1793466608564;
        Sat, 31 Oct 2026 10:10:08 -0700 (PDT)
Received: from localhost ([153.61.198.255])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae845df666sm8093713a91.14.2026.10.31.10.10.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 31 Oct 2026 10:10:08 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 17:10:07 +0000
Message-Id: <DMJ6UP7FV1X1.2E7I2ILPBS34P@gmail.com>
Cc: <ihor.solodrai@linux.dev>, <almagui@kernel.org>, <martin.lau@linux.dev>,
 <yonghong.song@linux.dev>, <jolsa@kernel.org>, <rostedt@goodmis.org>,
 <mhiramat@kernel.org>, <mathieu.desnoyers@efficios.com>,
 <linux-trace-kernel@vger.kernel.org>, <nathan@kernel.org>,
 <nsc@kernel.org>, <linux-kbuild@vger.kernel.org>, <arnd@arndb.de>,
 <linux-arch@vger.kernel.org>, <x86@kernel.org>,
 <linux-doc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <abuehaze@amazon.com>, <doebel@amazon.de>, <mpohlack@amazon.de>,
 <jay.wang.upstream@gmail.com>, <martin.lau@kernel.org>, <mason@kernel.org>
Subject: Re: [PATCH bpf-next 11/13] bpf: keep module BTF until the vmlinux
 BTF is parsed
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <bot+bpf-ci@kernel.org>, <wanjay@amazon.com>, <bpf@vger.kernel.org>,
 <daniel@iogearbox.net>, <andrii@kernel.org>, <eddyz87@gmail.com>,
 <memxor@gmail.com>
In-Reply-To: <df56aa51cd704ab9a9b03d3574e6ab4c61d5e6d4cdddc17f4b0253f67cc077da@mail.kernel.org>
References: <20261031130959.23472-12-wanjay@amazon.com> <df56aa51cd704ab9a9b03d3574e6ab4c61d5e6d4cdddc17f4b0253f67cc077da@mail.kernel.org>
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

On Sat, Oct 31, 2026 at 06:55 AM bot+bpf-ci@kernel.org <bot+bpf-ci@kernel.org> wrote:
>> +/* Undo btf_parse_kept_modules() of a round that is not published */
>> +static void btf_unparse_kept_modules(void)
>> +{
> [ ... ]
>> +		btf_mod->btf->data = NULL;	/* the kept copy */
>> +		btf_put(btf_mod->btf);
>> +		btf_mod->btf = NULL;
>> +	}
>> +}
[...]
> Can a module BTF that is rolled back by btf_unparse_kept_modules() still be
> reachable through btf_idr?

Yes. It's real. The NULL deref in the inline BTF is real too.

This is quite heavy. As you can see both bots poked plenty of holes.
Five of them are in the -ENOMEM rollback of patches 10 and 11:

  where                        what goes wrong
  ---------------------------  -------------------------------------------
  btf_get_fd_by_id()           takes a ref on a BTF that is rolled back
  btf_free_rcu()               reads btf_mod->data that rmmod freed
  btf_parse_kept_modules()     -ENOMEM in the inline BTF removes its file
  bpf_struct_ops_desc_init()   -ENOMEM of ->init() becomes -EINVAL
  btf_vmlinux_data()           -ENOMEM without btf_zst repeats forever

The rollback exists because vmalloc() gives up when the task is killed.

can we run the parse from a work item, schedule_work() + flush_work() ?
A kworker gets no signals, so -ENOMEM can be final, like without the
option. Every parse then ends in smp_store_release(&btf_vmlinux), and
btf_get_fd_by_id() sleeps on btf_vmlinux_lock until that.
Then no need for the retry, btf_unparse_kept_modules(), the 2nd call
of ->init(), etc.

See my other reply.

pw-bot: cr
