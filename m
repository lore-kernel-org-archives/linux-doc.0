Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD62118FC7B
	for <linux-doc@vger.kernel.org>; Sat, 18 Jan 2025 14:57:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737212224; cv=none; b=LnfuS1imKRLM8PF/DM2eYw+oUJUNVN2M1HOQcUzKCABdRi3BmY70JTG/I7inIwva9PJBTMUNhp6vk2HTH7P0I78B46I5by9BRpFjp1VAq1j5fOknH+FyIpuEBsDEF9DGJkerrg3ROISmcidNTwOBinM4YK31nv87hnsg/2lJ5A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737212224; c=relaxed/simple;
	bh=0NHPeW6qzDJKyKyv2LwHCzsD698hpuM+Soh5q7bWTbs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bjsJ1LyZbThNZYeYyvy1xW2vk1CR8L2R+Ung7+bsjFmb6+/O4XTDfPTUWbQlFPMhl0TSCrkagnX/fYGHkgUq1YkjGyDlMCvO4WoAIpLFhh93qYodW/Dfy98U8mS+r81pwX6t8dA0X6Kya3xql1qycpe69KXU3CJxBkEHpD0lh9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=c2+0cs6L; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="c2+0cs6L"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5d982de9547so6029047a12.2
        for <linux-doc@vger.kernel.org>; Sat, 18 Jan 2025 06:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737212220; x=1737817020; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=EocVmcdr+s+eiVI2gdxLwDypgeYEKTEqnZdPS6MtY40=;
        b=c2+0cs6L8hAmDImKIpm6CJUfE9wjeLBIBE48ER01GByH146T44N7zQbjL0CaUYiHOs
         F9SLD+hydfEw9wJsm0nobw5hk5kibrb2JcTafsICKy8IGFt3bafjIVYZUxS3XCaD5TQo
         kOh2gI939tn8A3ble18F4/iYVoXqq5X1ez84lTO7nfi7l6ZzZi3riA8qcsCiVZ1sp+Bo
         /XoEvfThEJt7/44wGpcXtO4FS4Da9K+YTkKWcRBjLubvhrod7AXAz85vi6fovhsku5/b
         td0Tgc+yeqTitxUP+c+J+hYFm5Mc5xbaxiMrXdDUmlBpzm/fFPnYJMSTasVDbzSdhgmL
         xZ/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737212220; x=1737817020;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=EocVmcdr+s+eiVI2gdxLwDypgeYEKTEqnZdPS6MtY40=;
        b=r9gvQRVKiWERcKf/dCA7PeHM+sPPQQgQ5od+lr+8y9qZBMAgvpaAQzuCnm5MnY/fat
         Qw7sxbgnpo0HcC/JNvkTdFrPSflP/E4uzjXHDvuC4b9680VlatMuvSmu7DG8e4duBSNZ
         rF0vvv0WlwkBEopNiAPdaQQVaUNwKtHsgNUXHYMwJRFFYsPAn/UGJzhbeuMKc6nKdQuU
         aJsJaya6k9PYQHFEYBOaHCOrtwUDOKgtoaylzLtaAhgpOxhtK/47N+wZ/zrPRo5LFedE
         ACj4oKme3qkU1RjqJ6SEg4TgxqgzKP1pe0ONYEzC2J5B65dNxUyrUROv0MKtUe5jA1Lu
         dbFg==
X-Forwarded-Encrypted: i=1; AJvYcCXIg6ji4Nv3ku2mI9E37+Kkzfg50bzL4gbqXJEEvN0kIC+V+rvHEDcbrCBvJmxg6fNqNlgP7loEtyI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8v9AWsrB2fwdQYr/UWWDDDl2s9W6z8RuhWrNo0itqCeFbvOeo
	tlymW42ar2cb2JU/b/Bpgy8hMX3J8qrIRqo+REUIat6hlQSmbCRAuvBp+5kbvEg=
X-Gm-Gg: ASbGncsx9WH+8PUEPEfNi6rpC66OtFZTbnL9eKcHserrBfhEOh5QvpaS9NlHMFJU9Fh
	fE9vCk4xcLSVDpYscFSsUG643keaviki8tbmMMUg7QdCryR46iaMJra3M+we3fnT1ShXc188MmB
	uL3LbaElflrG9W8joKCeAWaBR165ST0WOQiGUf1161Kx0khKjmbVVmE3U0yKCPnGGz6aGbWM/+M
	g7MoiAGbEfqCxTV1HrI57YwtXrrMD8r7Yxo7F3lBcyvILeSmsChZR4reg9pbg==
X-Google-Smtp-Source: AGHT+IESevYlMBNi2PmR28hKWZ371XolKifqyy2lHOUQAsdFLp4R497eQossqBOZ8uhDdvfVNH8xPw==
X-Received: by 2002:a17:907:3f97:b0:aa6:82e8:e89b with SMTP id a640c23a62f3a-ab38b166589mr543353366b.28.1737212220098;
        Sat, 18 Jan 2025 06:57:00 -0800 (PST)
Received: from cloudflare.com ([2a09:bac1:5ba0:d60::38a:14])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab384f2244csm350261966b.92.2025.01.18.06.56.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Jan 2025 06:56:59 -0800 (PST)
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
Subject: Re: [PATCH bpf v7 1/5] strparser: add read_sock callback
In-Reply-To: <20250116140531.108636-2-mrpre@163.com> (Jiayuan Chen's message
	of "Thu, 16 Jan 2025 22:05:27 +0800")
References: <20250116140531.108636-1-mrpre@163.com>
	<20250116140531.108636-2-mrpre@163.com>
Date: Sat, 18 Jan 2025 15:56:57 +0100
Message-ID: <87ed10dvba.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Thu, Jan 16, 2025 at 10:05 PM +08, Jiayuan Chen wrote:
> Added a new read_sock handler, allowing users to customize read operations
> instead of relying on the native socket's read_sock.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---
>  Documentation/networking/strparser.rst | 11 ++++++++++-
>  include/net/strparser.h                |  2 ++
>  net/strparser/strparser.c              | 11 +++++++++--
>  3 files changed, 21 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/networking/strparser.rst b/Documentation/networking/strparser.rst
> index 6cab1f74ae05..e41c18eee2f4 100644
> --- a/Documentation/networking/strparser.rst
> +++ b/Documentation/networking/strparser.rst
> @@ -112,7 +112,7 @@ Functions
>  Callbacks
>  =========
>  
> -There are six callbacks:
> +There are seven callbacks:
>  
>      ::
>  
> @@ -182,6 +182,15 @@ There are six callbacks:
>      the length of the message. skb->len - offset may be greater
>      then full_len since strparser does not trim the skb.
>  
> +    ::
> +
> +	int (*read_sock)(struct strparser *strp, read_descriptor_t *desc,
> +                     sk_read_actor_t recv_actor);
> +
> +    read_sock is called when the user specify it, allowing for customized
> +    read operations. If the callback is not set (NULL in strp_init) native
> +    read_sock operation of the socket is used.
> +

Could be one sentence:

        The read_sock callback is used by strparser instead of
        sock->ops->read_sock, if provided.

>      ::
>  
>  	int (*read_sock_done)(struct strparser *strp, int err);

[...]
