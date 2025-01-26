Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0C4C74059
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 14:16:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737901013; cv=none; b=ZPzEEK18hC7UDjm+jx5Byx9gj0/q0VJKs1baz/DmTxj3S+rpLxWigHEwBVH5zkzxduIkAYW8u92Wq8WENjSv9Ek1324fO3O5x4B5aLcHw2Ves7JrQm7XoJjPRcUIxUJjFnGJIGj76Fo407GxAcjdbtyi+0bpYFGSflGnEHgY+vU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737901013; c=relaxed/simple;
	bh=Rws2a+wog/8MrdQQ3e+bdf6U7//EDWF3+LxC1t1wN/o=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=UvzqC6yoUecLMwdcJxJdGJYCWlZNMo/CskpYlcajsencflg/0dMuMLqYTNVttBPoVO004TG3lJ2AgKes5xTkMclCi3vop2C/Af2NWaz3x48pynxcD6hKXvv6luQMx5NHioNEE/IP2bRgPMB+gGtWCOlF6EPC9RbCPnRktf4PJTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=SfPLm9Rr; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="SfPLm9Rr"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aaf60d85238so603810466b.0
        for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 06:16:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737901010; x=1738505810; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=Rws2a+wog/8MrdQQ3e+bdf6U7//EDWF3+LxC1t1wN/o=;
        b=SfPLm9RrjR1fW0DBuNtzJCIgxPOzfGtZIWspdanpgbrl21jEQeKKBxWRQ4Gsl9x9Us
         35HlXiAr1Ui7rEWW39Zt/pe/i3dj7nmGGYN959ITd/GXHaKBXvbAEcvcPNionwDD89sN
         YeAvE2Pv5W/Jtnnjt/2a7kkWn/epk7D0Gl5SIABuPilLU0luaqfrzbFoiPAs1Le62i1S
         WE+c2bwBPHVEfDAHvTN6YXcK+s9/JxSwRMK8Ds6I1muwG+UrW7WN8gcUwi1ltVCZztSd
         D7ni9M00apXz4d3yRzJ7VuVCnir8RJFEg6zPkNg20crNKh91JnD4RcHkiMqiQPara91U
         daDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737901010; x=1738505810;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rws2a+wog/8MrdQQ3e+bdf6U7//EDWF3+LxC1t1wN/o=;
        b=a4RGjPXz1hEdJ3zlW6WgyU8iIzvyrYtzk9+vwLlK2Y7b3FRgIzoFx9AX7OcsgbDVyJ
         nqjVvYEVpgmkH6dvr6nAeT932BSKSNN/3xq5UqvgNcJ62zP3Hv+rbkRUb6bdv6udyG3D
         DTE54QwZjBMlHrZ4jI8vEvNWlOK54a7Mb5T/d2LiPmfBK195yGZu7ccEnZH/DT7AGbG9
         2GFJ/hWNSAdZtj0SxC0KVsTF4cLa9hgDojHUdmBiXbWwBBTBJA2A9KEgHLW75koMhap9
         d6J/apzswUWWa1+gxjg4YRWOeDLImSOuJdBqADA2W5+LLt8lcaSi5B990gee9ca+RaL4
         FuSg==
X-Forwarded-Encrypted: i=1; AJvYcCUmUd36ITC2MXoOEeuI3fW2ur2fTI/EVl3XqtnCJT9SxYuyVfJsqVJmtqi+MKCLae0UrdIzoF/VYzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuoKvTHAZLJ8je0R0v5xE6cfYn81i9w3Cn1AjhlS0dpWVvnDND
	RI6IGe1lnmzDwQAI1izXcRkJMdsoJa45ViFubhfTDk3RcKpMizvW/C9otb+cyt4=
X-Gm-Gg: ASbGncuNM1DhBZrXt69UEN20i57mwaRwQ1nrL6mMUSU3xqo5TFVbmATNlkRf4t3so72
	EnTzL/pcDTvJbhfQDB8m01pfZy5Xhdj1W878I0fBdjY4iabIpKoSBzoL54vpoVV2nr/r5I5bCfQ
	H9PM6SvOSc96Xosd1UO5BQLh/5u/d4bwKZL7DkpsaU39g21LFAdgMemaMKVH2sfPyv2kR3tRP44
	GNMnAVBs0O/15c4QyZUdxcZChIMa5WMu3x/GV74VZvtWGWpa1QeAU8SVBvULvVb7EHAaNbf6A==
X-Google-Smtp-Source: AGHT+IEtEozd4ZbHmZSXMJeEU/z3POYgpvsYmnTf9qF0iv5ALo2LKCWSk1rqIWjzzlS5YtECkNssNQ==
X-Received: by 2002:a17:907:969f:b0:aae:8495:e064 with SMTP id a640c23a62f3a-ab38b44e119mr3607839866b.40.1737901010016;
        Sun, 26 Jan 2025 06:16:50 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506b:2432::39b:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e8ae96sm424145466b.80.2025.01.26.06.16.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:16:49 -0800 (PST)
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
  sdf@fomichev.me,  kpsingh@kernel.org,  linux-doc@vger.kernel.org,
  linux-kselftest@vger.kernel.org
Subject: Re: [PATCH bpf v9 0/5] bpf: fix wrong copied_seq calculation and
 add tests
In-Reply-To: <20250122100917.49845-1-mrpre@163.com> (Jiayuan Chen's message of
	"Wed, 22 Jan 2025 18:09:12 +0800")
References: <20250122100917.49845-1-mrpre@163.com>
Date: Sun, 26 Jan 2025 15:16:47 +0100
Message-ID: <877c6hd5io.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 22, 2025 at 06:09 PM +08, Jiayuan Chen wrote:
> A previous commit described in this topic
> http://lore.kernel.org/bpf/20230523025618.113937-9-john.fastabend@gmail.com
> directly updated 'sk->copied_seq' in the tcp_eat_skb() function when the
> action of a BPF program was SK_REDIRECT. For other actions, like SK_PASS,
> the update logic for 'sk->copied_seq' was moved to
> tcp_bpf_recvmsg_parser() to ensure the accuracy of the 'fionread' feature.
>
> That commit works for a single stream_verdict scenario, as it also
> modified 'sk_data_ready->sk_psock_verdict_data_ready->tcp_read_skb'
> to remove updating 'sk->copied_seq'.
>
> However, for programs where both stream_parser and stream_verdict are
> active (strparser purpose), tcp_read_sock() was used instead of
> tcp_read_skb() (sk_data_ready->strp_data_ready->tcp_read_sock).
> tcp_read_sock() now still updates 'sk->copied_seq', leading to duplicated
> updates.
>
> In summary, for strparser + SK_PASS, copied_seq is redundantly calculated
> in both tcp_read_sock() and tcp_bpf_recvmsg_parser().
>
> The issue causes incorrect copied_seq calculations, which prevent
> correct data reads from the recv() interface in user-land.
>
> Also we added test cases for bpf + strparser and separated them from
> sockmap_basic, as strparser has more encapsulation and parsing
> capabilities compared to sockmap.
>
> ---
> V8 -> v9
> https://lore.kernel.org/bpf/20250121050707.55523-1-mrpre@163.com/
> Fixed some issues suggested by Jakub Sitnicki.
>
> V7 -> V8
> https://lore.kernel.org/bpf/20250116140531.108636-1-mrpre@163.com/
> Avoid using add read_sock to psock. (Jakub Sitnicki)
> Avoid using warpper function to check whether strparser is supported.
>
> V3 -> V7:
> https://lore.kernel.org/bpf/20250109094402.50838-1-mrpre@163.com/
> https://lore.kernel.org/bpf/20241218053408.437295-1-mrpre@163.com/
> Avoid introducing new proto_ops. (Jakub Sitnicki).
> Add more edge test cases for strparser + bpf.
> Fix patchwork fail of test cases code.
> Fix psock fetch without rcu lock.
> Move code of modifying to tcp_bpf.c.
>
> V1 -> V3:
> https://lore.kernel.org/bpf/20241209152740.281125-1-mrpre@163.com/
> Fix patchwork fail by adding Fixes tag.
> Save skb data offset for ENOMEM. (John Fastabend)
> ---

Thanks for addressing all feedback, Jiayuan. Series LGTM.
Feel free to carry my tags if there is another iteration.

-jkbs
