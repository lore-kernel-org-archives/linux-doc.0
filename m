Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794855068;
	b=kbzn5Dboe6vLhElqA0vdUu1X3VC2eANajXJwiJeZDodN7hI5o4RDjTT9/PgB9lL/zuRX
	 0ErdVzTHmAXFM37QY1heS8XWKvfUFQWPXinrdfHXTPmLAZopl+xsNFk+uQbpCW7Lf/rRx
	 Zo9B3UD/4UTInvVRoj1kBwtPyHC+30Dm1eCNfo84QbEoxdFPn4MNUs2RmtwhWuTz/o2oh
	 wnAvu8Xczuff1KODfaLdUoP33QYWKr1/B7sB1KbnVqXC+60HzwoAYlmr+loQ4yjfZwCzu
	 /yKcCZDFWPEjxe+C2waeRl6IMbBxg76elb1FqDCojTgd0rqjjKzc9tOu2F4hWUStXAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794855068;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:In-Reply-To:References:User-Agent:Date:Message-ID:
	 MIME-Version:Content-Type;
	bh=QSsoBs++E1Zy9/EZXTnsibMmrB7qsgpC/C817yrdOkM=;
	b=Tv/h2CsIi4J18WTjCHJWaUNyJYO/BtpTCQfb37JoxEjVq/VcjyaCwU0xrVmqLh+txLjo
	 rYqFsdW13sIGhoIvPKcimH5l60Tk8qqu7VfA1wEE9ZhEGX29gJmZqKydFhbbuIc3rw7uN
	 yOi2m9D7mwwq8qNvQeL0ZclGTZLcQUTqo2rq1OlEYd+Yum5w0f5d4BiKiDD9FRsGU19rn
	 +wZf2rbZR+/TZnK2zoWbNn3vpv8v/xG3nyTtEOj8ijRqIIeH8M2bsxpCDWEt3t49ucFH1
	 iimX55jthvdmvVuWdIpEZ8Z1ZNglIDBFyAcrEUFSaPaTshJYAnXwYvcKTDBujbl9Lnw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cloudflare.com;
	spf=pass smtp.mailfrom=cloudflare.com;
	dkim=pass header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=R2nzstyH;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80C79606A329
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 18:51:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80C79606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.a=rsa-sha256 header.s=google09082023 header.b=R2nzstyH
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso26546325e9.0
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 10:51:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1794855067; x=1795459867; darn=vger.kernel.org;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=QSsoBs++E1Zy9/EZXTnsibMmrB7qsgpC/C817yrdOkM=;
        b=R2nzstyHPvDSLsixsYcF+z62ybrB5a+AataWUm13bOnj5D6xUz1phe1zPL+6DzlMLu
         UFoD0bpj3iyp1BwBilkdbaFyTxLiudKNKwVGiRaMP/uCjDqChc2HKqM9rfLy0jNhnnJZ
         15ud/3kdUj5Wo6BkIVNMKmX6lktEST8V4/m21oPFb4+E+a8pMZgpK/3tGguWhYevHF5J
         W9HghqDBIPKw3OaWJ1hFi5tHjyjo7V3FznW1wfuI8/eM3cRT08flsJ2YaEFcMHAcEHxs
         qjOu5ky8ZxY21+2BxgrZabnbKJt0fIwIIrjuovfef+8H8/gGZ2r/00/saIRTE108nJ1G
         oSVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794855067; x=1795459867;
        h=content-type:mime-version:message-id:date:user-agent:references
         :in-reply-to:subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=QSsoBs++E1Zy9/EZXTnsibMmrB7qsgpC/C817yrdOkM=;
        b=HH8Jt0hiAct+TgAJe053EvWhUo7MxyrMji/rqoudxW471EYj4wQ5V7+N7+5SybbA44
         zygs6Ki9XEsZIeuQ0LiyxsZjTwyFrzgk9/myQRSFyDlReDkB3y0MIoDrRKutOp50FpJU
         8cQjwbObC3yfYnCmE6fhsrZsP4dtzTPYnZofJX7XKcjUm3GmDTIZdS1udadFwddr3Ame
         Ais8/VRTtKKsSwwAuUYtAa8Ysko5JVaBUqatyWX2cEwTT31mCiZxHbAdT/yHsFr3yPP0
         yjsnMl6m72KXnrrw19Ox6imKhgbFuimZ8ZCL0ezskwYDSpL09mMaQyy+zHXLaLChpfKy
         5RLQ==
X-Forwarded-Encrypted: i=1; AL+hErF6zLHa9+2+fdiRN3Lt1PGG+FoS3p5taXjz/LN8y3LcOGGsnE+qOAYEEr/iujGkNgYJc3Fu5bLP7/M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+cp6CDWYCe64a5F+CZUafDoRtUas9H+sL0o6mVfo4Qodsv+mso
	f9PWmFJIOFCVm5/ot3iW1K6GMH7EUqoUmbNHOC82lqVlxoDw1uE8QoHFN2w8j8ebmDg=
X-Gm-Gg: AYBFou12QlxSfz0gI4ebv64yBhPncR0vkV7/I2MggrPXR1OzW7N/Ff7TGCENCdDWAoO
	45i68CFRBjFetJc61RQvoDv7m5xdA+325efTAV9rb4GWntvGmRmtDVZVUwc63njMFjjDgEHfkqr
	KKZoNf9c6W+tYrW0IHnoFg2sgQ9EEKCbV25UlSwcuCuFuSoux1o1jecUwpEjOuq4L0bHUa44Cdf
	BsXDnS/2+e6Tdl2jc5jHOUCWSP3OsWknHuWlVdbb5NwpicYSto6RUYHU9jjNSFMVIc8VjwFefyi
	xNZtg1yZQsG5o0it6tQsui7/kT7a+dQMIRy42WVlq7B9uI3JdNlo9SKYzuMCyPSkIQVaxukmmcK
	U8AOd0yPRnEoNeguoxbFfRB4SFPalymgla5c3xqBs1udiuhqBYMk3U/KYGo/rT7KqDcyN5kFg+H
	M6aRSiDH78dVPk6lVeKr1Gz0p2SYqaIPEktpFsP4DTd8g044rBQWkNDPY2JtoOORIBN+HrZRHtP
	bJii2fwr847ytRp/gMHOroJJZui/jitgAzLd2LDLmk3nvftPW0lOnNrcqmROmxpcbWM3ZWYXbxn
	ulqVaw1sGbRBNAoejyg=
X-Received: by 2002:a05:600c:4e56:b0:4bb:7292:b871 with SMTP id 5b1f17b1804b1-4bb7292bf16mr87467245e9.14.1794855066970;
        Mon, 16 Nov 2026 10:51:06 -0800 (PST)
Received: from cloudflare.com ([2a09:bac6:314f:191::28:17b])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm10795765e9.8.2026.11.16.10.51.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 10:51:06 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Ahmad Wicaksono <supersonix03@gmail.com>
Cc: bpf@vger.kernel.org,  rhkrqnwk98@gmail.com,  ast@kernel.org,
  daniel@iogearbox.net,  andrii@kernel.org,  eddyz87@gmail.com,
  memxor@gmail.com,  martin.lau@linux.dev,  song@kernel.org,
  yonghong.song@linux.dev,  jolsa@kernel.org,  john.fastabend@gmail.com,
  corbet@lwn.net,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf-next 1/2] Documentation/bpf: Update sockmap docs for
 mutation restrictions
In-Reply-To: <20261114170117.196552-2-supersonix03@gmail.com> (Ahmad
	Wicaksono's message of "Sun, 15 Nov 2026 00:01:16 +0700")
References: <20261114170117.196552-1-supersonix03@gmail.com>
	<20261114170117.196552-2-supersonix03@gmail.com>
User-Agent: mu4e 1.14.1; emacs 30.2
Date: Mon, 16 Nov 2026 19:51:05 +0100
Message-ID: <87ecckr4o6.fsf@cloudflare.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

On Sun, Nov 15, 2026 at 12:01 AM +07, Ahmad Wicaksono wrote:
> Commit be39165224d0 ("bpf, sockmap: Disallow update and delete from tc,
> xdp, socket_filter and flow_dissector") dropped those program types from
> may_update_sockmap(), so tc, tc act, XDP, socket_filter and
> flow_dissector programs can no longer call bpf_map_update_elem() or
> bpf_map_delete_elem() on a sockmap or sockhash; the verifier now rejects
> them at load time with "cannot update sockmap in this context". The
> kernel-side sections of map_sockmap.rst did not mention this at all.
>
> Record which program types may still mutate these maps, and note that
> sock_ops programs may delete entries but have to use
> bpf_sock_map_update() or bpf_sock_hash_update() to add them.
>
> Also drop the reference to
> tools/testing/selftests/bpf/progs/test_sockmap_update.c and its link
> target. That file was removed by commit 5de7a6eaed89 ("selftests/bpf:
> Drop tc/xdp/flow_dissector/socket_filter sockmap mutation tests").
>
> Signed-off-by: Ahmad Wicaksono <supersonix03@gmail.com>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
