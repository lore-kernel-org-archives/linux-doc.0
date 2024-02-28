Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 439F033CC2
	for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 09:33:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709112785; cv=none; b=LUQQDlzCl2gDQDxLBbdf+F6RQ9nM/Y6TQ84VPIYAvIws2y3GbeeEBq6icKWq5edbaF+7XX7YsXWywmbmyzvV5QMNpa1F9znxnTp1XZ6MUScq2SUye01v809SwCUjDsh5Mvnz+stlI8iTtXyR3jzvbm9X9wQE5lRvgL73rSjOD9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709112785; c=relaxed/simple;
	bh=+vEw4yu6BEkpuISizXp9gDSi/jYKQJzYyDhQ1Lqpquo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y/f7sXqTmTLp+WP+ZvBgT/DDAfdRj5JhFL9tgFwDNG4o9oyZ5/g21M4B5KlYAOMFFgmyq5uXI6t6M1iDeIqkgzzAeD5JB5cOcCXR/DHUV8AEPrkpVdK1f+Hqj5AtLzg9NkPmy725MaqPgLhQiIRq8JkQvRUqT/d9Rj8yYUkBzsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=naRbPE7d; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="naRbPE7d"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5654ef0c61fso10510a12.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Feb 2024 01:33:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1709112783; x=1709717583; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ymxFlaSd/RjrNJLnLxB6/F9mhAatakD+Om7yj8a55aY=;
        b=naRbPE7dzObWXC8d4DtcztCTQGvfAFfdIoD2/kP3p1KRd7D25GBfFgZ02ghlsq3h2E
         bETBw4KzrLWgm3sKDopwyjsOIbM3BDOfZkT090CQrrYn/tfHbwCy/8ldnkn2bzubvjav
         wvdTQz7fU0wdvzF0dPkC1lRU9nc5030YTRZAFIvFlE+kpblfoPuDcs9kRL/H7QnqryE1
         uad2QT63g53z8EvszWzNT2Vb3gaWLVopAQHzJzy6+K2N9flWI/voIMpKJMpGZqBm8lAD
         Rif+MouBzx0fV28WWIwB8xKjQKbpTKrvUKzCdl4NgRvBV3N9YCJKewkskIXNTch8Z+3n
         lICA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709112783; x=1709717583;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ymxFlaSd/RjrNJLnLxB6/F9mhAatakD+Om7yj8a55aY=;
        b=BvkRBiGr5zqtXo8EZKxVA8E4YPnSX/stqhffrodY0jQTGcDUF7bdxm0IWQnhBdPC7o
         rQ72uznhy38qoNJDI2Kj2I0s2cu38zh3h/UIrIEk7bj9Ojaj3IzbT+Kad/qigzhpzQpM
         OvwQ7A3QixZtuDi4m37Xfv+H7iGu2zWZfQH5hEOFEYfnSrONFlf4ABhmQlNF6DQiotCK
         kCDsCdA/bxBYltnScl9TUk55+vYH/+6e9a/kJL7qUOGbGVVFwKpp6pspA3s9mMhVqfka
         1ug39S6DWGW+XO93qAqus45hJV2SXQU25FEARkH+I7C40J5WJQaE0LENHEYgnNTrnAti
         YnlA==
X-Forwarded-Encrypted: i=1; AJvYcCVlOtKejYwI66tobZeMBARlRw0jEerzxp5WLcM5zOdWx9UgUn8kpxK5pmJhm3hW1JAqDqlq9eRAHCkpKDURCsVtj8onMtNtnw/6
X-Gm-Message-State: AOJu0YzjAJxRmaXxamLGOAkA+HVVNstt6zBLtGnYEzMUTn57uD/9Wp1R
	DxcmmtIxxmhw54ktpvvuKcfEja1JkDxx0DXSZbTViN0imfzeT9IjRo5yHw9l4/NjAtj/FuVB7ZN
	HQUks0fInFVrwl3+y2y/ER84ONUEbL7Ob050a
X-Google-Smtp-Source: AGHT+IE1vhzjptOnLco79eT13kIH9gOiLX5epU1Ic/wFr3bjjDPwaQ7D/xo/TLfIQwXl4BIoxNKwwY6jIhEIlmf1qjA=
X-Received: by 2002:a50:c052:0:b0:565:4b98:758c with SMTP id
 u18-20020a50c052000000b005654b98758cmr41097edd.4.1709112782171; Wed, 28 Feb
 2024 01:33:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240226022452.20558-1-adamli@os.amperecomputing.com>
 <CANn89iLbA4_YdQrF+9Rmv2uVSb1HLhu0qXqCm923FCut1E78FA@mail.gmail.com> <bc168824-25dd-7541-1a34-38b1a3c00489@os.amperecomputing.com>
In-Reply-To: <bc168824-25dd-7541-1a34-38b1a3c00489@os.amperecomputing.com>
From: Eric Dumazet <edumazet@google.com>
Date: Wed, 28 Feb 2024 10:32:47 +0100
Message-ID: <CANn89iKFPjSQhXRcyb+EDQiH0xJG1WdWVGXXLK6iOcMpM2zKyQ@mail.gmail.com>
Subject: Re: [PATCH] net: make SK_MEMORY_PCPU_RESERV tunable
To: "Lameter, Christopher" <cl@os.amperecomputing.com>
Cc: Adam Li <adamli@os.amperecomputing.com>, corbet@lwn.net, davem@davemloft.net, 
	kuba@kernel.org, pabeni@redhat.com, willemb@google.com, 
	yangtiezhu@loongson.cn, atenart@kernel.org, kuniyu@amazon.com, 
	wuyun.abel@bytedance.com, leitao@debian.org, alexander@mihalicyn.com, 
	dhowells@redhat.com, paulmck@kernel.org, joel.granados@gmail.com, 
	urezki@gmail.com, joel@joelfernandes.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	patches@amperecomputing.com, shijie@os.amperecomputing.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 28, 2024 at 12:08=E2=80=AFAM Lameter, Christopher
<cl@os.amperecomputing.com> wrote:
>
> On Tue, 27 Feb 2024, Eric Dumazet wrote:
>
> >> sk_prot->memory_allocated points to global atomic variable:
> >> atomic_long_t tcp_memory_allocated ____cacheline_aligned_in_smp;
> >>
> >> If increasing the per-cpu cache size from 1MB to e.g. 16MB,
> >> changes to sk->sk_prot->memory_allocated can be further reduced.
> >> Performance may be improved on system with many cores.
> >
> > This looks good, do you have any performance numbers to share ?
> >
> > On a host with 384 threads, 384*16 ->  6 GB of memory.
>
> Those things also come with corresponding memories of a couple of TB...
>
> > With this kind of use, we might need a shrinker...
>
> Yes. No point of keeping the buffers around if the core stops doing
> networking. But to be done at times when there is no contention please.

I yet have to see the 'contention'  ?

I usually see one on the zone spinlock or memcg ones when
allocating/freeing pages, not on the tcp_memory_allocated atomic

We can add caches for sure, we had a giant one before my patch, and
this was a disaster really,
for workloads with millions of TCP sockets.
