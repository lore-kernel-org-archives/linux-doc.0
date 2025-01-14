Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FEF42309AC
	for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 11:27:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736854073; cv=none; b=OhNa9CoLFQPbriRmz58VFtsFeks6TRKWWgPY2SXdc7LfUQHyy5e6G6bPhPky803sjjquWl6WZj6TnigBvxe2j0unokesoqG7fw7V3IW0BReGrHn7Wj0mRnxAmCTTXTMg3hY8upEUlnPHEwUsGuRXE8EDaC6tgKUZOQp7GUm8V0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736854073; c=relaxed/simple;
	bh=qzv1F7wFVtGQZfLI/M84LNz+pssuzOPCwN5kUXDtkTU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EL03Qd/xLePAAueFdsg+EK9SqkSkkDkK67/ww7zJlgofKhuuUl9WqOYGXj8D17iv6uiUJeVQQ8Wl4U6yvGNukGX16co6Q/zkwqQ+MOyDiOnhel+TsvlpFTmfZ+ks0d5GvCtZwh9GxtsHDhMpCjJVSZb+fVyohjjJ5kegsROJppg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=GHSK2Ku9; arc=none smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="GHSK2Ku9"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-5d8c1950da7so9230363a12.3
        for <linux-doc@vger.kernel.org>; Tue, 14 Jan 2025 03:27:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1736854069; x=1737458869; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=qzv1F7wFVtGQZfLI/M84LNz+pssuzOPCwN5kUXDtkTU=;
        b=GHSK2Ku96NrNg1AXcETqcVbZblLiUhb0ELvN9ldUA6o/UNUm+boYCwmQBr8oLYxKM/
         iisa5GF4tfkiucUD7gR1naqzbAAaj+5YTMXltiLwT1rXE5oDslzDjbqN2fidbDcAjUxp
         /nbhKd7ytq97me0WO6ZdiUKfnMxvDTCvThkFsBQLyCvs6nAtwv0SfuotxZ3LZ0CUR0ua
         YfBxTNZIAKuspNawH5sPDddToICwAEH6Mbga1YkzXqOy+ln26E0iOZiqPHuXEo2dgTMh
         iUPccvOhkKrRgAkp1/FyBSnG8OzRn4LDWuOujsqCGk2N2hLzu71Im8FFDOb6ugNSVT1W
         TUzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736854069; x=1737458869;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qzv1F7wFVtGQZfLI/M84LNz+pssuzOPCwN5kUXDtkTU=;
        b=GeESDyvJNszC8tq86G/ureeKRSUL1x2m4MW27ZARplDaLFphT9s61BQbeudl3gfnn1
         BNbQq82VmtG30iO+DvODHhqpdOwazLEBNuYOYWrEKaFoEYNqzZEgsJ3JM+YLw48ZrbT4
         g29QG6zxmMWitj9bijtQWNmkgUxaZrGK2cqlnXgDUTbNCIt7XVfUk7caaJ9zbFSKMAaV
         PTIv0ogwj9C60hOq+eGnp4iA6ShzjP85Pl/bU5cN2Kjzw9B4RzVYhntitrEWbydznWjT
         XzWiDD/iiPGjrd02u7JdkhPp5dCubOIrz2nVY1frf2v3uWmfpyL12/qfI8fEgIjFzWHN
         Xjtw==
X-Forwarded-Encrypted: i=1; AJvYcCXp/by65LGGO3HTCuVtVj6MV5Lp4r7zOM4gpw80PU+lidrtH5vnzKXBuRWLzeQK7ckrXy4btTUnc8E=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx12q9/vJ4Hs5Y5Gh7+ztZDe2qVYP6BBb0G98cCJQyT6X0+kSD
	5Y58lurTipn23BSolj59g/Cjpg+idtA+iEl3i6r2o1sxlkEpbJwIalAYYSuw0fU=
X-Gm-Gg: ASbGncvSU30h9INAnE8Ze4ZpKCwCGJpQxqVcQuHCQ+5ZRXE98M47xevkfPF1RrqUy/0
	8eOxOJdBTozbRaw2Fe9PPqGZPnMPfM8MsVcyx9tnUtGrYqUaGItu3qloV7YJV+4R5jt1+mRWe8R
	tITT72MAZEClZ2H81/rkCFMIIMaoh7RmTQrxUWqGwi5LhxfnZZLiMmMX36+RqwfO7DmcPSbdTBe
	yM/Px72jYB2lzmFAifbj8BA8aO00D79UAp8J5+3jnuo52BK
X-Google-Smtp-Source: AGHT+IHkpOB6+6LEPaHrWYFHACEx+4G1Y0bKkva9Qoilv4G3mQbxLoysCGBGVXfN3SzMOk7JekHkvQ==
X-Received: by 2002:a17:907:97c6:b0:aaf:208:fd3f with SMTP id a640c23a62f3a-ab2ab558911mr2266993966b.13.1736854068937;
        Tue, 14 Jan 2025 03:27:48 -0800 (PST)
Received: from cloudflare.com ([2a09:bac1:5ba0:d60::49:173])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab2c905f04fsm618819566b.27.2025.01.14.03.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Jan 2025 03:27:47 -0800 (PST)
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
Subject: Re: [PATCH bpf v5 1/3] bpf: fix wrong copied_seq calculation
In-Reply-To: <20250109094402.50838-2-mrpre@163.com> (Jiayuan Chen's message of
	"Thu, 9 Jan 2025 17:43:59 +0800")
References: <20250109094402.50838-1-mrpre@163.com>
	<20250109094402.50838-2-mrpre@163.com>
Date: Tue, 14 Jan 2025 12:27:46 +0100
Message-ID: <87o709eitp.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jan 09, 2025 at 05:43 PM +08, Jiayuan Chen wrote:
> 'sk->copied_seq' was updated in the tcp_eat_skb() function when the
> action of a BPF program was SK_REDIRECT. For other actions, like SK_PASS,
> the update logic for 'sk->copied_seq' was moved to
> tcp_bpf_recvmsg_parser() to ensure the accuracy of the 'fionread' feature.
>
> It works for a single stream_verdict scenario, as it also modified
> 'sk_data_ready->sk_psock_verdict_data_ready->tcp_read_skb'
> to remove updating 'sk->copied_seq'.
>
> However, for programs where both stream_parser and stream_verdict are
> active(strparser purpose), tcp_read_sock() was used instead of
> tcp_read_skb() (sk_data_ready->strp_data_ready->tcp_read_sock)
> tcp_read_sock() now still update 'sk->copied_seq', leading to duplicated
> updates.
>
> In summary, for strparser + SK_PASS, copied_seq is redundantly calculated
> in both tcp_read_sock() and tcp_bpf_recvmsg_parser().
>
> The issue causes incorrect copied_seq calculations, which prevent
> correct data reads from the recv() interface in user-land.
>
> We do not want to add new proto_ops to implement a new version of
> tcp_read_sock, as this would introduce code complexity [1].
>
> [1]: https://lore.kernel.org/bpf/20241218053408.437295-1-mrpre@163.com
> Fixes: e5c6de5fa025 ("bpf, sockmap: Incorrectly handling copied_seq")
> Co-developed-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jakub Sitnicki <jakub@cloudflare.com>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

No need to put me down as an author.
If you want you can me with a Suggested-by.

Also, please remove my Signed-off-by.
I will review these patches, but I haven't authored them.
