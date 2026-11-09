Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.89
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794190515;
	b=UJ1XILl6ewm7nXDR91c10j67TRMKGINPU4NyPiuteBiYHNTPyxYpjzxT6HBVD07h9n4R
	 catMQApYi/vK1xdsrqPaDZUTNFHjvTe54lAsbM5N3tWtPdWKUAEMeohl1C7QdB+KOLqo2
	 gpMnR6JJxFjNOJxkUZxfUYe81bmS9115ch9Z29gVWyhcj/A1XoA3pv23erjNkSXj6c+ry
	 WltfSYMPxzhQGdmI5dH5nw7MgET75at0SXNZESxFs0GbxmlGTnC5eYO4Hkb3Zy3DgPGwt
	 vGGLa53+Ct1KXCWjt5z8X/fme87I92fs4krY4gn/gLjSP3+BsAInAiFW7HKOvrAy69g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794190515;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=bIloYSK3+4K/KkpgHLmr3ED9jzQvebQcrpQM//1CZGo=;
	b=f5NiHfRa/zuLuLce+vyyWxhPmjnQCzmk1+BYG710biOhVQvSL2kDjZNjjLLh1VR0BPmk
	 pmI2xNDHp3xfLqnsR8niav+xeT8QG3m/1rgo8D/AFYJeCR6HLO81R4ZgUl9zfCOsoyTLM
	 khuRo0o2DSE+5QjlGh5qyOoWBw9zdNd1Kh/xfOMIeYo8BSoWBoYfkXqr/L973p1go8ziB
	 ymJRDLDLPx/qxiLfF2Vwy+5URrhDGZ/FtZsLzcHVXHxcrSteZCmqnVAmpwpwn9iir9WKa
	 YcK4TL4YytIFYlDmG1wnQrubM+Sel3C7gQjXRv78Q6cztzmMkB1G1sTLQfFSJvoh1mw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=udR3DneT;
	arc=none smtp.remote-ip=95.215.58.89
Received: from mta1.migadu.com (out-89.mta1.migadu.com [95.215.58.89])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 919D8606A331
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 02:15:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 919D8606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=udR3DneT
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8n8V1yRl+iYZ7zK/bT1eTEsTmfpO4TUveKPsBFyRf8k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1794190512; v=1; x=1794795312;
 b=udR3DneToBEvMoaeDcHjOoMjZATEMn6ZYTkHnMud7IblzxtpDrcAC8Qo76xJE2dcfZRGkNc7
 PMXnw06ZhwxED3zp/bvHBOw7IRLleKqIuzrvnRmWGLCwnrm0ISfUpqwME2vJu/HdII9Nndywwvs
 iWcDAJKXEom5XkFNS90j2Wn0=
X-Envelope-To: linux-doc@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id e4b351546fe3877f;
	Mon, 09 Nov 2026 02:15:07 +0000
X-Mizu-Trace-ID: e4b351546fe3877f
X-Migadu-Flow: FLOW_OUT
Message-ID: <65d109ab-3dca-4521-bc1d-bb1f8810bb14@linux.dev>
Date: Mon, 9 Nov 2026 10:14:57 +0800
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH bpf-next v3 1/8] selftests/bpf: Remove sockmap update from
 bpf_iter_unix
To: Michal Luczaj <mhal@rbox.co>, Alexei Starovoitov <ast@kernel.org>,
 Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>,
 Eduard Zingerman <eddyz87@gmail.com>,
 Kumar Kartikeya Dwivedi <memxor@gmail.com>,
 Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
 Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>,
 Emil Tsalapatis <emil@etsalapatis.com>,
 Ihor Solodrai <ihor.solodrai@linux.dev>, Shuah Khan <shuah@kernel.org>,
 John Fastabend <john.fastabend@gmail.com>, Eric Dumazet
 <edumazet@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>,
 Jakub Sitnicki <jakub@cloudflare.com>, Jiayuan Chen
 <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, Stanislav Fomichev <sdf@fomichev.me>
Cc: bpf@vger.kernel.org, linux-kselftest@vger.kernel.org,
 linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20261107-sockmap-update-limit-iter-v3-0-7c0bad1ad036@rbox.co>
 <20261107-sockmap-update-limit-iter-v3-1-7c0bad1ad036@rbox.co>
From: Jiayuan Chen <jiayuan.chen@linux.dev>
In-Reply-To: <20261107-sockmap-update-limit-iter-v3-1-7c0bad1ad036@rbox.co>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit


On 11/8/26 1:58 AM, Michal Luczaj wrote:
> BPF iterator programs that can update sockmaps will be limited to
> iter/sockmap. Remove the update from the unix selftest.
>
> This reverts commit 997b8483d44c ("selftests/bpf: Extend bpf_iter_unix to
> attempt deadlocking").
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>



Reviewed-by: Jiayuan Chen <jiayuan.chen@linux.dev>


> ---
>  tools/testing/selftests/bpf/progs/bpf_iter_unix.c | 10 ----------
>  1 file changed, 10 deletions(-)
>
> diff --git a/tools/testing/selftests/bpf/progs/bpf_iter_unix.c b/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
> index 3061b148f338..90beada0386d 100644
> --- a/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
> +++ b/tools/testing/selftests/bpf/progs/bpf_iter_unix.c
> @@ -7,13 +7,6 @@
>  
>  char _license[] SEC("license") = "GPL";
>  
> -SEC(".maps") struct {
> -	__uint(type, BPF_MAP_TYPE_SOCKMAP);
> -	__uint(max_entries, 1);
> -	__type(key, __u32);
> -	__type(value, __u64);
> -} sockmap;
> -
>  static long sock_i_ino(const struct sock *sk)
>  {
>  	const struct socket *sk_socket = sk->sk_socket;
> @@ -82,8 +75,5 @@ int dump_unix(struct bpf_iter__unix *ctx)
>  
>  	BPF_SEQ_PRINTF(seq, "\n");
>  
> -	/* Test for deadlock. */
> -	bpf_map_update_elem(&sockmap, &(int){0}, sk, 0);
> -
>  	return 0;
>  }
>
