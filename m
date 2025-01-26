Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4FA14AD20
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 14:15:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737900915; cv=none; b=b+X4qghqxMCXFjMOX1Y3Ga6Y0lZQ7OzTmArSFVxe/QxAsxkCuTawT3ITLIeJWNQB352D2dRw8AO0Gfn4GCHs9KOuKzVbZoBGshEAUAwGUmk+Fj2wRa6Nfg7hkEqJC9YbhsROPtJnGinN41v7o1m8D9UBedavRfRnzdkKTXDmOzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737900915; c=relaxed/simple;
	bh=peHLr2meKF1TvUq/MZxe+1FIKfK53RpQEdIuer2wMfI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mFgo6MYCLL4DdZy+onCfBPDByg4CphV9NqL0KMO+ORENUkOV112I4PHe9bYqIe79huMisdvjs2MWJR8p8CXOJ8s9YKhaY/crK9VNVmW4lrYiFU50epTUMY/41h58odG1ZkbA8Yoty4TXHa12Qu2vuT/kwsBugj9GohSj2LKqqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=G6SkSJPM; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="G6SkSJPM"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5dc0522475eso7089598a12.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 06:15:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737900911; x=1738505711; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=peHLr2meKF1TvUq/MZxe+1FIKfK53RpQEdIuer2wMfI=;
        b=G6SkSJPM3dLFlFbSNdfUSmAxcvEE1CXMA1Ejv5vXdvyJ6uuN33bKOAPFs/3NgbXn/w
         cQx6IGOxnsdgEJ0lE0xllJN7+TKBA7gVxNOyi6EaI6DXGbtnuyv8OmdMKvT5zfkulg96
         UyPg2BHKZxQMO6UTnHD0h9yJHkJRysHtB/pyGkeHuvHFr63NjAiwUHPFTIEI+Nvw0e15
         OWY37BLu6H50/Xm4IBNFwIdXhSKR73ttlyOXfrFuBm76o6hpU2J738JGtL5N1X7MyG8S
         KwrEvcb5FxT9fvLL1DumG97wI0A6wO39zZNcJVUdJHyJp6IKqMxEy9GwSmMiCcEblrHE
         Z4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737900911; x=1738505711;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=peHLr2meKF1TvUq/MZxe+1FIKfK53RpQEdIuer2wMfI=;
        b=FXXQX4wrgRmxmJQR2UzLKiRGpEfqqHTQ0OM6U8F+OFv+n2+c61DeU7dtdmpI3zGk9k
         c87AigVpVv0IRjhQbdc7Ts1CrC/XPs5KP94qPkZX/egIXYjhpcdtLj7075wqwTNYBqJL
         hi4LuC4uKR1sZ5k17E9uSrIaEo8sAD5O/+krdxpRaJch1c+UhNZMxEAgQ2Dbkn0L2E30
         wqDEZ2Nmx5keoumiu/4WZrRf8/an7CxbkW+k6aa7dpZUsVTIGcr7Cw6OZWrUFNzPKRqL
         gkGB79sBMjPXMDyEhLD9dhgrp5WaBltbza046QYkYq3132aqfhuGuY+ddnAs1KWHl1bg
         rOVQ==
X-Forwarded-Encrypted: i=1; AJvYcCXBKOGUl8/TkpJxNQ7xzOrjhrpLwuA5dghAQgMqrBum9tcGJ/P17rE6ZvnmVA3TAjOuUCp4THkrMhg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyatFaVP2x7l9Vw6qKQY7XtT6ftF14UIdTGyJ7xchGiahcYV06n
	KAejtqzdoDD0a8YzMAxipDTMVST6/cciFTDqbig8cK01gY9vxJTRK2VJNQBo/DQ=
X-Gm-Gg: ASbGnctVXbxW1+XaTsg84JblCz9uOEuZ5lHD0ELXBEBmYFmprejH2d620+cizqu/msH
	OvcTzg/ML1Cf3v9HxEpNXdS5TPIP4ajfYFKGt5UJMqEbF/hrCg8kc7L/DV3lvu3ZDNgMPHDBKTk
	dGHHBxGMt5qJP+0H3QEEZB8eM0X/D+vBHj19zm8mMj73v+/tOY4JZz4QyZVeN4hIKH+PtSwJ+Le
	JZmaF2184rddHpTd6y2Io5tlYg0k1T4LEMKU4LboejCKRrcQcvaSTj4hOBrGarp4/6DRsA0Ow==
X-Google-Smtp-Source: AGHT+IHS+j/maW0HT7SPUukqXe3x6mcjCFkojnW+QLc+olCNf5e5LR+PCAIyPwV03Bd6SZmxxKy1SQ==
X-Received: by 2002:a05:6402:274c:b0:5d9:a85:1a59 with SMTP id 4fb4d7f45d1cf-5db7db2a0f0mr35080417a12.27.1737900911439;
        Sun, 26 Jan 2025 06:15:11 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506b:2432::39b:69])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dc186191f6sm4028191a12.13.2025.01.26.06.15.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:15:09 -0800 (PST)
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
Subject: Re: [PATCH bpf v9 5/5] selftests/bpf: add strparser test for bpf
In-Reply-To: <20250122100917.49845-6-mrpre@163.com> (Jiayuan Chen's message of
	"Wed, 22 Jan 2025 18:09:17 +0800")
References: <20250122100917.49845-1-mrpre@163.com>
	<20250122100917.49845-6-mrpre@163.com>
Date: Sun, 26 Jan 2025 15:15:06 +0100
Message-ID: <87bjvtd5lh.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 22, 2025 at 06:09 PM +08, Jiayuan Chen wrote:
> Add test cases for bpf + strparser and separated them from
> sockmap_basic, as strparser has more encapsulation and parsing
> capabilities compared to standard sockmap.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

Acked-by: Jakub Sitnicki <jakub@cloudflare.com>
