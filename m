Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794681624;
	b=eXud5xKg/o+mXAGacLxLQqEZlgZ27u1D3rDKwLOi/prGQeDwhY2awDbP30fJblDBaO2A
	 mvsF12oVBbiv9AF0xtB4WfyM/F6Ph7FsNxptm6LS4wuRvKG5M74Faqo3cXnkI26hnRyxB
	 UdFJ7hJBAC76IXPBKM8nJVGIudbVee1Qt8jI9wslHaM2ex6R8TNQavdfNp+S/4A5Z7SOI
	 zFYFU244m39E4ta4lkIvuEhXgRUsC8upaZKXg9f6WX32Xrfq6qIWxliZWrZbMAIXSDelj
	 JvES6Eh7nEnj9fdIcl61STf2Jjnz+XEELqrb2NbH3gjpccEdd6NusKzZBikMrszAUrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794681624;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:Content-Transfer-Encoding:MIME-Version;
	bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
	b=NeA65WSVLLoG7zvQcqNSoMT4pCwrrPPvoj5OrBzvIhKfE03IL+bjSLyOOYcn5kuSGOT3
	 A1yQQ/J2kRwD7m46HWnsx375iZhGoQS+hsYaDu2TUPH1KY/7DBwmNFa5yut3QYe3igTAk
	 0wAe7qsq2PtSiYeNMW7KOW1E4zQCmVQwWwCNK/0YqerBaypgtVPBjVSdSas0pA5QxgDD2
	 baKVAeT5XCqqSKBEU0ICG3I4T6iXFJG4WtgCESw4ySeAdBbjQp6VLUE+Wm47SbTw5uS3W
	 ihqutGEmocmndbTjP9DskMnNVtvHqaY7/2q4ek/tN1RaQlHYqfZ5eE7UuH4vPUa4fiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943C4606A332
	for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 18:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 943C4606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OKQvH0XB
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8b3577deeb0so1015362b3a.3
        for <linux-doc@vger.kernel.org>; Sat, 14 Nov 2026 10:40:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794681623; x=1795286423; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=OKQvH0XBu++VojD/u+INoAqGc3Ax0Cm7sYdvZeGr3L8gqCisEOw5EBV3aKep+umVWn
         an/nnKbxKy6DYbjRYvgu/fZ2SPbcgI9KPEl1Trd1mckq3R53F/E6Eaq3wvQbeeuu9l0M
         0r3nMj/ruEGEiipnr4mvv1s9NXN36nHgwxKsBDsYSprDn+XISlJ2s9UsbYlL1fZ36+YW
         A/Qnm1iUNoYEqgY3KOs/GSb9tQtZyGLrV2AnfoR1Y7B/pv/QjEJyAnpnTilMgTc+fpPP
         l+S5oKVA1wky3qlKOje4o9/IM6XIqLEcmeKmB1OmFo+lhyEmEARsV93Mfdv+LzfBQJk1
         QToA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794681623; x=1795286423;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDeoDvuqMX5CXuZ8DatSTgljbUzCp6t2qFD5+t+XaFE=;
        b=z76wgMFguvaENATG+jpJcx/KT26FnzX4G/S54qrUPb98QCZsnO1p+67C4eYFx5XDVE
         V5diU24sWTIIqgJQVPaTOL/Nxzj2ziQLUE0jcX//+EPC9JF2dkmeWA8co2lZQI3FOhJJ
         WYSVz/zIocjK3cuCMA9pytth64MqS8wXzTvtzC0GWxED0ApKc8ghg2yan3Omyr3bodPL
         vg+cISwRT+fd3PCzWf0+tcAiOnuFrMmR3MIlNZYYg9Rrl+EC4lAcDuS0U8OVRdcbgGL5
         sybj5hT7NoZXgCAAv+4oG6jwOZOuAxcfcjBEWci1utYFbRfMDR0+K9b7ntW28VeD9/qB
         qrxA==
X-Forwarded-Encrypted: i=1; AL+hErHSprFN97Y0It9GYl+NoCDbpc2HD1ATvGk6LSGnI3yAIVw9G4dq9jOC5MdDTIps+fLFG+yf7rvODfc=@vger.kernel.org
X-Gm-Message-State: APuU4Z+mfbw1iWODy4L3xsXQyimJSZAQHRQs55uvFETHYQ3UtQ+tU9MF
	cQlmRJFy4DZ6QJ3RpdkLsMTOWKtEvL0BQrrXMgqb+8SAAXUiFLLgzmRZ
X-Gm-Gg: AYBFou34+/gdAkp9PAtE80+hZd04xIu4CNkTaLkg5IYdb7PBWDj0D1x+rWlo0FlzIZ9
	MJlDucVTJxNKgsH2atDqZbasZK9QZelurN2/DiMpr56PlxsNvf5pHaadlb5hoPiUH+0NAmK5QBu
	iSxQjF2VjDfsgNC4F73EF/uZpTosd+okmZZw3N5FiRAFKGUrjYA+luTjZQ9E2Le3VtGswrDdFGW
	HNhIN/KFDX7weU0pVA+VSRAq3++N72czLKBKzX+GaG33KBS5VbB71VzzxUSjlFwrA9Sq+KNPrSC
	clhAafe95jwLMHdGTAOjW7w8BR54Sqwgh7UJVlqJ4Ai4esR8wrcAfThhsn1aFNQ6k9BoB59LkMb
	IJWHiH8r4bJPZolGQwAgy3dRHYjvkxB3ndMoLgbuz0CniwWBaDyXkwILmpFJbxCht94V8gLvMsu
	H3Y9a6VB8N0GApxuJ/k0WqI1KJAs2Y2X4RpxJE8ASfwSSpEinLeJ3pCm/+0n1ZhNm7W6+J6LPH2
	k4pVtppt4l0t/i8LkyOTgbt1j2yCBPgXZ7nKBxRg3l3DaPCTqHKKbSPRpLJAfMnCXJ7W1vEhc3X
	1zS0xBOQVx2R5JevjcE8fxQqgNlD18+pzHQNHpHYey3zxDeoxh37da+nFwLFMysQ7nf6fgRCi3H
	vghmro1Q/FKKF3Jn8DZJ7cXhwlzNui0+qYKU=
X-Received: by 2002:a05:6a00:2346:b0:89f:ed3b:df97 with SMTP id d2e1a72fcca58-8beb7150117mr5498543b3a.51.1794681622656;
        Sat, 14 Nov 2026 10:40:22 -0800 (PST)
Received: from localhost ([153.61.198.245])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed263649esm2256214b3a.45.2026.11.14.10.40.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 14 Nov 2026 10:40:21 -0800 (PST)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Nov 2026 18:40:20 +0000
Message-Id: <DMV5JEF4P0Z8.3K0HQK7SWX2S@gmail.com>
Cc: <davem@davemloft.net>, <edumazet@kernel.org>, <kuba@kernel.org>,
 <pabeni@redhat.com>, <horms@kernel.org>, <andrew+netdev@lunn.ch>,
 <dsahern@kernel.org>, <idosch@nvidia.com>, <ncardwell@google.com>,
 <kuniyu@google.com>, <richardbgobert@gmail.com>, <willemb@google.com>,
 <ecree.xilinx@gmail.com>, <linux-net-drivers@amd.com>, <saeedm@nvidia.com>,
 <tariqt@nvidia.com>, <mbloch@nvidia.com>, <leon@kernel.org>,
 <linux-rdma@vger.kernel.org>, <daniel@iogearbox.net>,
 <john.fastabend@gmail.com>, <sdf@fomichev.me>, <martin.lau@linux.dev>,
 <andrii@kernel.org>, <eddyz87@gmail.com>, <memxor@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <jolsa@kernel.org>,
 <emil@etsalapatis.com>, <ihor.solodrai@linux.dev>, <corbet@lwn.net>,
 <rdunlap@infradead.org>, <skhan@linuxfoundation.org>, <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-doc@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net v2 0/2] net: keep the TCP fixed-ID flags on the
 header they describe
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Julius Bairaktaris" <julius@bairaktaris.de>, <netdev@vger.kernel.org>
In-Reply-To: <cover.1794139176.git.julius@bairaktaris.de>
References: <cover.1794139176.git.julius@bairaktaris.de>
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

On Sat, Nov 14, 2026 at 10:27 AM Julius Bairaktaris <julius@bairaktaris.de> wrote:
> Patch 1 lets SKB_GSO_TCP_FIXEDID describe the innermost header again and
> replaces the inner flag with SKB_GSO_TCP_FIXEDID_OUTER, as Alexei
> suggested in review of v1. Patch 2 adds a selftest.

Thx. lgtm.
