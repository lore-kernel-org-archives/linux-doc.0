Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794341582;
	b=F9cjsZGiNuHW+PVkfV0003sdGORabodU7becvQSH/thz6IMD7t0hZPLBqmmnMj9ukSYr
	 ldafES2NBSANMZwIBhl1lWgEkbB3cMTNjTPirco1J0qAkiKLjT9PqDKynsScUw6sqFzbY
	 AKhC8PobmP9D+M8pPXngaMM/h7FRQVkadBU3MIb9V2ZFsMCFgZMl03OxcMnjZxxYHryuW
	 AELxPeOpudR3R2YTNsSfvLHQGc+So4Sr4O+swnFBzComsf4JKbxB+GaouHC05S66XMXlK
	 xUxYkHGQwOlGZ/y2tx0B8dZGeYMc2MsxoZunfvkCU3LeKrNYVCpxjyq+jF/f/+l+wAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794341582;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=9n69V8b7Pe2NPaZcaKQrwJeF3R2bLATLLqxFGsyCFFI=;
	b=l0KP3fUOP0JWZsyOv7DuIHkpxTyUkc/nY3GRC+OMIZMCPI17h6/ZAlWc+NWBkNcdzwss
	 jN2OwUKn6B47jmqx08potHaO70SwqMjOeBD4y0IEvMDm8sSAnhmhn+k6RHvAxY9YMmyij
	 ta4spdY7pMEYr0taMQbZSQd+qIV5hY2DvHwj2FaH8/prvXqBkZ3tvOE2g3Z31co37oXmr
	 XzkkOEw9F4DoGogJlCxtdgCZZ1N31VxMJ0deoX3Z8cuZOLY/ukubIaRUvqzDMlD/Pc0DM
	 O/ogw8BzscEBZbZWd3JHI+Lk6z68YuDJM1JxSMzF8QpsWp5Hss3ndlrIOV6KQXZRwiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	arc=none smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82147606A323
	for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 20:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82147606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6f42095bcso3293893a12.3
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2026 12:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794341576; x=1794946376; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9n69V8b7Pe2NPaZcaKQrwJeF3R2bLATLLqxFGsyCFFI=;
        b=NE2PBex7Rs0touJTom+dyOe1TmNsfFoaHxCxKlpOG/+gHzLaP/iKyzTWgd91PFtkB+
         Ojpx36AT+I0a5WgU8/ImXtBkmp7aHrJPjUhHL616LcYqoYlLMcE8IHpHnanZ+a9ev1pn
         0gUK4G2VQU3RGuBdtcWDXKIrreS6hmZiJcoXey94hZjiL2hQPezuA5K5JuS0xaWTKYLT
         Ef8G9QtVX236KIyo3T6J5FAcY6eEtNKuA3L1m23F3i7L/vPLcVMpCYyAwLKpJbgxAh6S
         dkxHZr/4CHG7FsJjqu0CGYDhGLyR6GKrvy9lo7vHlzHTR3DMlc/4NFzM7lfrG9OqfPaL
         ucTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794341576; x=1794946376;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9n69V8b7Pe2NPaZcaKQrwJeF3R2bLATLLqxFGsyCFFI=;
        b=dGBPzddavYEzGvaNvBYXPSLZ9LJZzHBMMFZA0ZFxXzzpj8JAj1BtjIlT9BktTz4xBH
         dS3e5kcta2TSPZARk6EexJUPJk2OLsPJHqGQ7zS9jA3cun6y92DtbGPFn3NDB0J2nWSl
         t90xhlwqFfmcfE/S8nTnHCzChAK62/PCMIL5HuerZk22cyVIQ372vrJgtu3k7glFhMnS
         yewAarfEGcIR+cEoSo7uUpKpnPr2Kdlpm4Hkj9G2RoSkcyVfE49oDDCW3FDvESZHNmBO
         xUar/M+pFK7Uq0/EwWNz1xYckNBv71YMNNy1QDsQnv8atE1/9oVroqe7FuN05lE4DHJ3
         SgYQ==
X-Forwarded-Encrypted: i=1; AL+hErF7Yd86vV+roG45cl27JvsMISNrHjF4rKOhesE9xXDYhfTyWlJwl7BEenXDP4lgoodN/BqvSBs0M7Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8rKxjvyZfwMPr7RmNd7T11YCvfo9r4GlThfkPWNkUhpUPE1v1F
	lcxwglh456FHzg1tpw/xYRfRWqtIiXL2nqOGzHMNSwLlrhyQqofCPKApsZyaF0Y73k0=
X-Gm-Gg: AYBFou33HSOFw72f5K6b8CL90gwmE6syoonxtNrT9JFGC0wEV/z/4NAnV+H63TiBC6t
	XujyqzB157o01XGswhNex8JsMoJnrKLqSpuALDybfZbut7e4QxQ8/+lm7plP0fpH8riyCZafGwj
	Ple0ln1P91XwexLhIPwUn+LPQ5OuvYcdgMSi4dHyQcqVKWbtmU76kYHIBSlvIchuY/7zc8LXt/r
	OEfUf5nQnBKfRCPk5elJ6iX2STwypsWL+x/6SosXtrQgZ3cSjms72QHRCCLxWLPgoYbnZhZ/9Ci
	6u+WARDbsBWllSN408BQ6W5+0Ula5QnHbtbpNXPY6FWNfiKyp6xffq1rLtIttA6IE5br53vdKCW
	9fh57Ok/9uKH8uxSe8Q0Iz0CKV7Nl6ybME6DsC4+kA4ZxECHBlftAntcLnrRYHWl0FVkziA7C0R
	h4XONQFuwexiDLzLd2jG0SVFB1c9KcfRXzoDBqEs5oHvQPZz0TJoNlESGey+yZ1C/WOzbdD6LAa
	MZYuB5I23rN1xTAd3UpdAzd2saQY3ziAh9db1pUgA3EdI2DwK3tjKVC8q1lg3OJeDjjIDM+5l8k
	gB4X5J0SthUiMHlEvhmJgL+u8uQdK8k2fpfRK8y/jbZQmQE=
X-Received: by 2002:a05:6402:1d4b:b0:6b5:8777:bb2 with SMTP id 4fb4d7f45d1cf-6b777347cbbmr302363a12.1.1794341575905;
        Tue, 10 Nov 2026 12:12:55 -0800 (PST)
Received: from L9JK9NPFH9 ([2a09:bac6:37ad:1e5a::306:6])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b757823737sm1592520a12.3.2026.11.10.12.12.52
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 10 Nov 2026 12:12:54 -0800 (PST)
From: Tianyi Gao <tianyi@cloudflare.com>
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Stephen Hemminger <stephen@networkplumber.org>,
	netdev@vger.kernel.org,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S. Miller" <davem@davemloft.net>,
	Simon Horman <horms@kernel.org>,
	David Keogh <dkeogh@amazon.com>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	David Woodhouse <dwmw2@infradead.org>,
	Dragos Tatulea <dtatulea@nvidia.com>,
	Nimrod Oren <noren@nvidia.com>,
	Alasdair McWilliam <alasdair@mcwilliam.dev>,
	Maciej Fijalkowski <maciej.fijalkowski@intel.com>,
	Stanislav Fomichev <sdf@fomichev.me>,
	Magnus Karlsson <magnus.karlsson@intel.com>,
	David Ahern <dsahern@kernel.org>,
	Ido Schimmel <idosch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Shuah Khan <shuah@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Breno Leitao <leitao@debian.org>,
	=?UTF-8?B?QXNiasO4cm4gU2xvdGggVMO4bm5lc2Vu?= <ast@fiberby.net>,
	Danielle Ratson <danieller@nvidia.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	bpf@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	kernel-team@cloudflare.com,
	nh-open-source@amazon.com
Subject: Re: [PATCH net-next 1/8] net: add tx_extra_headroom and LL_ALLOC_SPACE()
Date: Tue, 10 Nov 2026 20:12:50 +0000
Message-ID: <20261110201250.95225-1-tianyi@cloudflare.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <willemdebruijn.kernel.935b9bf7f1a1@gmail.com>
References: <cover.1794020868.git.tianyi@cloudflare.com> <e90e748e0aefa7cbe1c2b31b8c7902ccf135c3f2.1794020868.git.tianyi@cloudflare.com> <willemdebruijn.kernel.1d64e7848503b@gmail.com> <20261107182526.69543-1-tianyi@cloudflare.com> <willemdebruijn.kernel.2c6a653eb65fa@gmail.com> <20261108190831.3f991a13@phoenix.local> <20261109154909.32748-1-tianyi@cloudflare.com> <willemdebruijn.kernel.935b9bf7f1a1@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

Hi Willem,

On Tue, 10 Nov 2026 11:23:09 -0500, Willem de Bruijn wrote:
> I have some hope that if there is sufficient reason, this backlinking
> to the originating netdev (or socket?) can eventually be addressed as
> well. Rather than work around it.
>
> The skb_orphan and iif issues are well know. But not set in stone.

Thank you for the suggestion. I looked at what backlinking would take.

For the socket, ip_rcv_core() orphans the skb, and after that skb->sk
holds the receiving socket, for tproxy and early demux. Keeping the
sender's socket there would break that assumption.

For the netdev, skb_iif is the last receiving device, not the
allocating one. So keeping the origin needs new state in the skb,
such as an skb extension.

Even with a backlink, the kernel still needs to know when to adjust
tx_extra_headroom of the originating netdev. This brings back
auto-tuning, with the problems from my earlier reply.

Taking a step back, IMHO it is more natural to set the extra headroom
indication on the netdev that the skb is allocated for, than to have
other devices raise it through a backlink, which can get messy.

For v2, I would prefer the narrow VETH_INFO_TX_EXTRA_HEADROOM UAPI,
following what has been done for IFLA_NETKIT_HEADROOM. I will put it
in the last two patches, so the rest of the series can be taken
without it if you prefer.

Thanks,
Tianyi
