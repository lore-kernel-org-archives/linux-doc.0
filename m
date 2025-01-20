Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E088F1B043C
	for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 10:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737367993; cv=none; b=Wf+vVmCpiepm8nELD100kEU55FCq4p7poHtQGSj4E4HykWLe2QGfDwkj3sHT+JPU9VBuHNYtg5Eg2XghbHe9OdnP/POiAHKXx5PeeJ/At0gTRDNOv5WpDvtthJHQ8X9cy5i8dPStQ4CIytE0dfDXJpVaDrAV6FKbZ3FlJD24YOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737367993; c=relaxed/simple;
	bh=POeSpLXqMDnf4ncHbT7WX49tYfW9PFR0KWRj+oU7i6Y=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sxYTVQOFFRnxBSC5XFpKiN7LTykRXxoUK4k2ywkvUnjfT2Ld/WKvnAb6Q6qqN4tMkj6f9ZlaonwaaVLIdrqPYvKBgUo4h7GnDJLCAQGB8UXcIeRK9UOf0swT9stZZVb9PVbNqs+Xkv8XM1k8SDKirOmBBso3crzBNHZl/LaSlco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=IXoOHnHv; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="IXoOHnHv"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-aaeecbb7309so820140166b.0
        for <linux-doc@vger.kernel.org>; Mon, 20 Jan 2025 02:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737367990; x=1737972790; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=s+AmXtS555KTGh368N6qrcyGQOSWOD2uM0ZEZKy8e4w=;
        b=IXoOHnHvuITax+uU8uyj3FCD1+zVkSGMte6VFd9kwcZQy+03YCcP2InjSq6RKd7Npg
         hWAVjMa++UZ8MMeNiBC62klRpLf4PHfqAa0avOsNoCVzSpWCPGcoLRxCRvA6el2rDep9
         x9vCfhkZPsyq7JthqO52fkSSpIxG0inGYhr/sWPY4FOVFDpw5lJYm4YRyGF0c34hUp4m
         9Xn0ItD47XGtKu3RXXjPehu7QNwrBPeFtyxgJ8QAxzcAktboq3sq+6ogjlfc83dcKLgz
         8P2RZSVAYNyv/FSqCv0Xvk8+p49BPgx1z23/d1vpn4sPWmD/eV9dANZep41BMNKyiLUE
         oJrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737367990; x=1737972790;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+AmXtS555KTGh368N6qrcyGQOSWOD2uM0ZEZKy8e4w=;
        b=c3KHj57cdDFAzzhswRYbgTKY0vPHcSgAKjRC3CyBjdtz3sVqnPlw/GdWkyG/aGPoA1
         vuo3Z4NbDquaHVMJU+8UAhA4LrZI9VycIos4qD4RqoY8neCxQjpioq61tsTMOlX5JGAA
         TsCSk/QHZvQHkS4X9+E4othTSLNB7b5FTBjpQ2C5ta/tnWC4i72rSTxmwa9lrXAJzF8Z
         sCANLYMHFOEAM7Bhqjzqeak70URdFCs4+p5gONL+B3mJ0T4OGUNjN/sUq0uxwyKNjFoa
         pxWvsmL9B7yaP4TszubeSFDvhgawLaNLmUThWVw9Ku7fn2f7MVCFMSPHqWs+ZdRxoeh3
         kujw==
X-Forwarded-Encrypted: i=1; AJvYcCV1v6lX6TmUU7IpK/5f5qMGWVSOD5iJiE7OY4V2sNn7G7IbVwGWL9vKG/I/Xl0cKv6txOE8KCylU1U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTn9dMgSDSm6zKQi7204lM9JflhnXYJrObOmwsrwm0usC7nPS2
	6kHMytwxwRJYidtySD4ty+JGq9G6GnrzydqwF/nWbZae9qU0Aait7CbGeE0ddbM=
X-Gm-Gg: ASbGnct/HrLiLte/JvwkuniJ/qBh8J1fT2Axt7ahCy8f6DtzBNlAucXUbVlUDZlqpwG
	IzMFuvcCnwsUJwXL7/NQYbCOsNKeZiYQJxDrJQ9KvnYp4nI6XObWYeUeD3v1qWZNjniPuJU4c7P
	UgrLkIl0ZLy/8K6EqLOGbUxEz9xCDCBB19hBq22SR7PIGoASeG31GqPP8x34+vhgEASTod6cKQa
	9yEaT/Jh3/SSha726U6xK5hvj+EG7iiJzvpj4Gbk8bxYx1ikOmNUbKY2txS3MI=
X-Google-Smtp-Source: AGHT+IG3sxDHUYpin9r1buo9Oh2Jpo9gAgFq3g/a7WzAvcrq0JBMicje/huYwTSgfgvyeKZ4VF6qOw==
X-Received: by 2002:a17:907:7faa:b0:a9e:b150:a99d with SMTP id a640c23a62f3a-ab38b1b45aamr1198652366b.5.1737367990090;
        Mon, 20 Jan 2025 02:13:10 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506f:2387::38a:15])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f224casm589585666b.87.2025.01.20.02.13.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jan 2025 02:13:09 -0800 (PST)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: Jiayuan Chen <mrpre@163.com>
Cc: bpf@vger.kernel.org,  john.fastabend@gmail.com,  netdev@vger.kernel.org,
  martin.lau@linux.dev,  ast@kernel.org,  edumazet@google.com,
  davem@davemloft.net,  dsahern@kernel.org,  kuba@kernel.org,
  pabeni@redhat.com,  linux-kernel@vger.kernel.org,  song@kernel.org,
  andrii@kernel.org,  mhal@rbox.co,  yonghong.song@linux.dev,
  daniel@iogearbox.net,  xiyou.wangcong@gmail.com,  horms@kernel.org,
  corbet@lwn.net,  eddyz87@gmail.com,  cong.wang@bytedance.com,
  shuah@kernel.org,  mykolal@fb.com,  jolsa@kernel.org,  haoluo@google.com,
  sdf@fomichev.me,  kpsingh@kernel.org,  linux-doc@vger.kernel.org
Subject: Re: [PATCH bpf v7 2/5] bpf: fix wrong copied_seq calculation
In-Reply-To: <j5piuelz2xt65bn42bxufmk4nmigvzjotbygwd5tin7t6cvrsj@gpon5o7px7tu>
	(Jiayuan Chen's message of "Mon, 20 Jan 2025 11:35:37 +0800")
References: <20250116140531.108636-1-mrpre@163.com>
	<20250116140531.108636-3-mrpre@163.com>
	<87ikqcdvm9.fsf@cloudflare.com>
	<4uacr7khoalvlshkybaq4lqu55muax5adsrnqkulc6hgeuzaeg@eakft72epszp>
	<j5piuelz2xt65bn42bxufmk4nmigvzjotbygwd5tin7t6cvrsj@gpon5o7px7tu>
Date: Mon, 20 Jan 2025 11:13:08 +0100
Message-ID: <87a5bliyiz.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Mon, Jan 20, 2025 at 11:35 AM +08, Jiayuan Chen wrote:
> On Sat, Jan 18, 2025 at 11:29:04PM +0800, Jiayuan Chen wrote:
>> On Sat, Jan 18, 2025 at 03:50:22PM +0100, Jakub Sitnicki wrote:
>> > On Thu, Jan 16, 2025 at 10:05 PM +08, Jiayuan Chen wrote:
>> > > 'sk->copied_seq' was updated in the tcp_eat_skb() function when the
>> > > action of a BPF program was SK_REDIRECT. For other actions, like SK_PASS,
>> > > +}
>> > > +#endif /* CONFIG_BPF_STREAM_PARSER */
>> > > +
>> > >  int tcp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore)
>> > >  {
>> > >  	int family = sk->sk_family == AF_INET6 ? TCP_BPF_IPV6 : TCP_BPF_IPV4;
>> > > @@ -681,6 +722,12 @@ int tcp_bpf_update_proto(struct sock *sk, struct sk_psock *psock, bool restore)
>> > >  
>> > >  	/* Pairs with lockless read in sk_clone_lock() */
>> > >  	sock_replace_proto(sk, &tcp_bpf_prots[family][config]);
>> > > +#if IS_ENABLED(CONFIG_BPF_STREAM_PARSER)
>> > > +	if (psock->progs.stream_parser && psock->progs.stream_verdict) {
>> > > +		psock->copied_seq = tcp_sk(sk)->copied_seq;
>> > > +		psock->read_sock = tcp_bpf_strp_read_sock;
>> > 
>> > Just directly set psock->strp.cb.read_sock to tcp_bpf_strp_read_sock.
>> > Then we don't need this intermediate psock->read_sock callback, which
>> > doesn't do anything useful.
>> >
>> Ok, I will do this.
>> (BTW, I intended to avoid bringing "struct strparser" into tcp_bpf.c so I
>> added a wrapper function instead in skmsg.c without calling it directly) 
>> 
> I find that tcp_bpf_update_proto is called before sk_psock_init_strp. Any
> assignment of psock->cb.strp will be overwritten in sk_psock_init_strp.

Or just don't set ->read_sock in strp_init.
It's being reset only because you made it so in patch 1 :-)
