Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794229408;
	b=lvPTFl6PsXVHpU1Y1Rs+XdszftRf79MS1KKQriN1VdSpQ2HfzR3nmodQnaRBDqFbbHID
	 5MBVXEpA5wbtdGWpVBfzMXXFEX2e6Q9D8INfawTKanRW9tklmRxPvHWpf+xrlYTuH0sLi
	 D7012rJlfrFQiunpV2G4eAQBigS9FyiZj/TNndS0PixJ5Ou7GuS9SeNu3/Tp1CoT84wfU
	 zlXQXxN74IrsnUtVfwWcR67yQtXiLonU/RwWDFuMCeDhpRCV6ur7gATYzOS7C1Y++7EpN
	 XLzKCgsb3BVS62GCtDWKY/KqG4P/1xgYjxJi5R0/MAjTL0PZssCh26+fx5AwSbEExzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794229408;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 From:To:Cc:Subject:X-Mailer:References:In-Reply-To;
	bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
	b=jOFXvNQ95gUpkX1eiijolBc0zzv9bxkvP+JQ1U5y1rhx1ExVJFgk5ipaPhk2lDlE+fjY
	 I2wrILWh/H3qg27AmuyWLRt7PthoSMInA8HximDaACXCSIRfGAfeFccuDfC+PZNKFzV/g
	 vhVY6lRsAMV4tMSxghqqHyJuhosgdMiGu4Tahqp4Cdx7fcjJavRti+k5NK+aKVk92T8Kq
	 Q7Erv/wo7aonRTTPufBjKCq4Od/cyJOEo9FLjZJpu7siwtufc/xHL5XGGLgAEtiWirfzF
	 WvNNMuVxVdgIs2YtfN/lCMDZvh8XZ+jTC40wnKQyd8Db4kHBM1e2/1LIcgX2sAgt76Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th6NR4gp;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB564606A322
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:03:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB564606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Th6NR4gp
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-93e515769d3so84509385a.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794229407; x=1794834207; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
        b=Th6NR4gpQlycRBLRjBND2+14b1JRjtLWr70u04hTBSAFERKPkfJOkUTK3TEdNyfRL1
         EdEWi4ne5l33XwRwB0IMecrK3EHlMksJaS2H9i4GxM3NATIPc+YcuZaUQ9+Us4vYWqu0
         a7opGItIC1bBR5aL256gy45CpuBuBzS9m6EJBcNYglPbaUfm6KjU+s0vzQDbqgTEukLK
         odJRimkIhb3JTbg75cf4GygFLOX8zJGE50MS07jGUEVGREv1k3k6wsr9OKQCh/zuCr0A
         1EKAsR/Sp/3331X2ZIGFsUFaefJHCQulLSSxIfqaMlOUKO31bI9O+oU65URNeAqzzp5C
         bNeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794229407; x=1794834207;
        h=in-reply-to:references:subject:cc:to:from:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=72Pzf80vHJ6tg7h9s2yhzIcCJ8giywOh4xxajI0FVfE=;
        b=sjJZCgoWKaUtOCzaz9xWNe9+T2vqS3uMwm00u6J4I/v4TQAKShoIJzKyOJfoLVmB16
         zT/tQEaWcqzlOtPcrqbYf6TihZqv8mtgufHTZRrYDOKyTKkFyxhL0dIJrKycW8cbL/51
         DLYcfik0nO2mlyl+2T8d8C9b/jWEnOSTRNXfVPEe7xKwvtUjlEy7Sy+JIVm3NlMcI5WQ
         kpBhv9YuA2yOBeK2F9arXsSBznvbPfk2DhMxGret/lsWYzEvpsZZi1j4NhXl4JqbWr44
         HmDfrvkG1O6jRmYMlrrIvi8znam8OFazQ+05SNXgUPqMomd8bhzK056/uLi61re1Mmqa
         O0Lw==
X-Forwarded-Encrypted: i=1; AL+hErGuGxVMiM9JRj/Jbij8kO+ajyuhOojM2ftUpuFDbH0mzwtP4WUAQoHSJM1EcYrwOm6vjPCJIImkIn0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ocakLuMZScjidVbLF63GClXpFu+AVUD+NWKszV85sIJsZ3ROF
	NkwORwoVQmFnLjTE/0OWkS/qIkukmLm8nRU62G1WWDl24F/pES6hGl8f
X-Gm-Gg: AYBFou2+3kwEitsOlpcEuv07PdPUHElQDIpwzdGuIUy7cXSlUXYfpG+rcbcYrkKO7iq
	ef3K5L2lkoKV2AbuIUo6+MYKcLWnZ0LLK7Wa/BNO7Udev5ilfCaggC4Irr3XRTM6BZ6MS+LktyG
	3ZtVnsAjx+yk+m6+H2PjPV68ANslnJscrZObveogDRQZm4MB5oqidWKjJ+zIq/T/LBo+ZePAGDF
	w5vWB63GBQhUu4CPWYPQaBbL9veeRugE/XU89MkofE/p5rRMaJ0eVjpzLCIIU4JoTb2Fy9AzuMQ
	HWNh30rdUttxoTf9pR3AMwEmxRl2EZoMeFQOYHSb7QzOTgXPLg1iuglsu7zfsZ5Gq5oYHf3EOHr
	xR4M1PfyvynKku/lxyTxLhIenxzaZUTDlSGeAWPoIJKtJR1BQJTvd97J7oJ+fs7cwnvHb8p/yCl
	xMCHE4OG3/gQ4EmfELtYoXGffoHCYWwzQqyV1qSBdv9+thwb9hEi67UbAa1SwCXaxuloLeJwRoY
	GDhcYwWQX/QqBdeZ2FtJRb8C6GFGiPBWU38V77Ebz6caaREJ65mO6GzohaZZ/3BntMhY/lHU/pX
	38p2jSCivnE/blfAS9T6W1zK59pQKXD1xQ==
X-Received: by 2002:a05:620a:400b:b0:939:fde0:a71b with SMTP id af79cd13be357-947846073e3mr613394785a.0.1794229405262;
        Mon, 09 Nov 2026 05:03:25 -0800 (PST)
Received: from localhost ([2600:4040:9399:4000:e553:72e5:7d37:c7ef])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-94782d61906sm469034185a.14.2026.11.09.05.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 05:03:24 -0800 (PST)
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 09 Nov 2026 08:03:22 -0500
Message-Id: <DMQP8OMF2NZ2.3K3MJRWBNXWW@gmail.com>
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: <netdev-bot+sashiko@kernel.org>, <daniel.zahka@gmail.com>
Cc: <kuba@kernel.org>, <willemdebruijn.kernel@gmail.com>,
 <davem@davemloft.net>, <edumazet@kernel.org>, <pabeni@redhat.com>,
 <horms@kernel.org>, <corbet@lwn.net>, <skhan@linuxfoundation.org>,
 <rdunlap@infradead.org>, <donald.hunter@gmail.com>,
 <andrew+netdev@lunn.ch>, <shuah@kernel.org>, <netdev@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH net-next v3 4/5] selftests: drv-net: psp: factor out psp
 connection setup
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106-psp-v3-4-a8dd38f5a727@gmail.com>
 <179408516862.994134.13048510473902240219@kernel.org>
In-Reply-To: <179408516862.994134.13048510473902240219@kernel.org>

On Sat Nov 7, 2026 at 3:59 PM EST, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found more severe
> issue(s) in other patches of this series. This mail is only an FYI, in ca=
se
> you want to address the nit picks below when you respin.
>
> Low priority / nit picks for your consideration:
>
> - [Low] The commit message says "Here we are adding some more error
>   paths, so we just handle errors by closing the data sock".
>
> --
>
> selftests: drv-net: psp: factor out psp connection setup
>
> This commit moves the PSP connection setup and the assoc uapi calls in
> psp.py and psp_responder.c into helpers. Other tests that start with a ke=
y
> exchange can then reuse that sequence. It also makes run_session() close
> the data socket when conn_setup_psp() fails.
>
>> The caller of conn_setup_psp() not handling errors was preexisting. Here
>> we are adding some more error paths, so we just handle errors by closing
>> the data sock to make the code a bit more robust.
>
> [Severity: Low]
> This isn't a bug, but is the "adding some more error paths" part still
> accurate for v3?
>
> Before this patch, conn_setup_psp() returned -1 in three cases:
> psp_rx_assoc() returning NULL, recv() returning < 0, and psp_tx_assoc()
> returning NULL.
>
> After the patch, it fails in the same three cases:
>
>     rx_assoc() returns -1 when rsp is NULL
>     conn_setup_psp() returns -1 when recv() returns < 0
>     tx_assoc() returns -1 when tsp is NULL
>
> The v3 changelog says the per-version key length table was replaced with
> the key length from the kernel's rx-assoc reply. That table lookup looks
> like the only new way this function could fail, so the sentence may be
> left over from v1/v2.
>

Ah darn. I let local sashiko convince me it was a good idea not to
ignore the return code of conn_setup_psp(), even though it is purely a
preexisting "issue". Then, when I was writing the commit message, I
think I was looking at the code from the next patch where
handle_tx_assoc() rekey handler, has an extra check against the key
length.

If I have to respin, I'll probably drop the code chunk below entirely.
Otherwise if we can just edit the sentence:

"Here we are adding some more error paths, so we just handle errors by
closing the data sock".

so it says,

"Handle preexisting errors from conn_setup_psp(). No new error paths are
introduced."

Then it would be accurate.

> The only behaviour change is in run_session():
>
>     if (conn_setup_psp(ys, opts, data_sock)) {
>         close(data_sock);
>         data_sock =3D -1;
>     }
>
> Could the commit message give the actual reason for that change? For
> example, the existing failures can leave a half set up data socket open.

