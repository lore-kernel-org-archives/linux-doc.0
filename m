Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D1C63A9DBA
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 18:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785953621; cv=pass; b=Gj0Zd6DkfaMiFPmG5+qyHSbiYgXVUizXU0MxrRHVefjMsHwk6oho7z2Vn4XakHua/C0pGaAENRg/8/d4xky4cn6GKVSn8JjvZW3whpEwp9w2E7Xr7mr8ajg4dCLOVemm3TTn0UKq65iTR2tGt440NNyzvAv9Vmcfny7fhnvqb/M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785953621; c=relaxed/simple;
	bh=VttIK0xBzWBUBWmIkqwiW97WNyQTZbTR6HIBNbzaOsQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Ww5pGz0zpnidkSp1Q9E+xAR6LAx8hjRTt565BBQjVtfeA/YNlsvXNxn0XXZUSoA9FiBifaFsBcEPwVPbGfaZRzDfqeJVZgsz7Btu0T6lTFjNFfnI+KeBKGRAFNemcTQZxS6xT3+Fih4O3qcRdNb3Tr7PaTxTTcH5c0oqzvA4EPY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JFUn9go4; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JFUn9go4"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-47f904e80eeso1109435f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 11:13:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785953618; cv=none;
        d=google.com; s=arc-20260327;
        b=LxWT2P+CCDhAtWY4jSFI8hlU6X4G9PXsC5MeWtpEx41TG1x69hFijjfqsNkWCZNKoN
         fSi9NHohSBkYlnBn0JA6utrhANWQAmdP8oaCm1CAb8RAl3QJEtFMaTeRYPDsZsL4wpvc
         l3waZ0QJvTn0hvAKKa7rntbRyzJzyiJGLRG2cJhyC/gfw+v+pvppjWUzVr/eqeWXR98l
         xPm7mEWtZhKTtSDJVv9cuSoE6Xtc7uQQGgWRXwZo2ysKwQx152n19hSn51CSUY7EWb6F
         qBVMQw8DeYcRKc1d55jr8IPqHDMm4K7gKjS2O3ELYgavzevoKRvg3n3sb8dAubw92CvW
         KMZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VttIK0xBzWBUBWmIkqwiW97WNyQTZbTR6HIBNbzaOsQ=;
        fh=fD3yv5vkVYEpSccIgHZbPPBiJ8hx2fJ6Am8lwjF23hs=;
        b=VILCUcJ3uUK3JCU2HkWaOyPnTqGpEZM6u6r1EzEfmQ+Jg7Cz8VjggLUXdgnhsxNAm5
         Q5KXT+6bBlFOq4M95BAiFiyNN5Erhh20SCLuVL21NGFQgPNFN0vJ1CUsjkc9kD/P21Bj
         xoyLbR0x95/JxGAYKkIVRr1PMTI01KpM5zeeeR73vJJ8jzm0qOoW4K1cWZhVhV5A+63/
         tSFKin7TLpDPFhymg0WRzEwpDD3VfSV8pTmpd0+nXL5DY43nvEvyv+ZWXKaKAezbr2OO
         r/4OpKn/18YVhjQ5Xc7bZlX7nkLo+mtAysEBXjoOQS0WuUI0riwYMzqbpfQpxzySd4jx
         ubiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785953618; x=1786558418; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VttIK0xBzWBUBWmIkqwiW97WNyQTZbTR6HIBNbzaOsQ=;
        b=JFUn9go4TcZPaf/G49funvgRIK84LUNDxqUNvmBbfsvUO2RBPVESKU3nSR4z/8RDAu
         cq9zzpd0bk6BQX+tNcu3b0bxJMdTJrf4VqNZIiSVVkGLyyFfTpeQLEW6JpqJK4aCTGLH
         dEj91FszSTHoQKlyfvQE7W8PwcJchgmRyLGq/md7NMotiSzrjVWOizlnpXShHssCMsbw
         se8JKYWqZZtU86Vj3kIIb/kSQijuS4nlxxk/bFvQjab5m5o7PYEVXGJ4i5ZAxHQxMS3l
         RQDSRRgm7Qn1Ids/FjV7wktiEX6jw7EGt65/0ODmGFTwqn8YonxwJZaUXNW/BVHDta72
         5/hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785953618; x=1786558418;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VttIK0xBzWBUBWmIkqwiW97WNyQTZbTR6HIBNbzaOsQ=;
        b=mvY8yVy/GNE0u7vMEWs0GTEFD1sVVCakmWnsiUHl8lOzAvy+eXjPu66bPXDEtvXfPZ
         wDWKHrgb0f8v1gXu1PpCtJo7UCopS/TMojQZ+2hY2K/lN/ychU1jFsNdcV323tn4SFDU
         UmWJrWZH4nXKiZ5iQm7z7atNDJ7DmSIk73mkwmrGXcYZa/X9DD+xPglUKJsRsq+ql1pc
         +xRD7y4hBd9liW9A05xiJ1uMihwb3nc0BNSp3/olDkRsy0KItA+mJeMv9XNc0vEXTG9M
         BAzLBg75+aU/TScZaLee2zeMLaPRDGV9n/8yr66Wp/Ws3TtDjU1reP4l0w2S9wr/Beaq
         WUSg==
X-Forwarded-Encrypted: i=1; AHgh+RrMPiVzFTo1erZ4JtKSOC/fMfv/PVQ5OfZvdguuRG6OS2J0UhyPYMR2Ycnjfpa3dAROfyoKm7kmOpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW3KLputC62zVoONtkbpMUb9blspUC7Aiq0OCTwiuD48P30OuY
	KGI1UUrWChEg+MBBfdNpRR2a3p2NBMhFnXzT3guKUinbfGUBvUobe8ayLFv1tRXsb4jwhpWHDcn
	Y+EbgKpFSZ9A9almDb8FqCNnHM6myODc=
X-Gm-Gg: AR+sD127YPWyIg+NzETrosQXrQw1oaF9gvPTFthYJ/7bd7l/UwCXaM1yTVEUg9+2ENk
	a0i+pfuc7BJYHoBBTe4GegO3LtFJDXFSJN+2Bi5UVHtpxPxZ5QS+dI9npuhXbFA/kI0DlnaiuWk
	HeYEB9CriZWYiXY+P4ZYY+4AVCCtStNBzFXiuVdiF9+oBH7cjMvieRsVhyX4S4MOFcprxepMrK9
	PugL0FdFSalPZnygacWCdXomwiOq+7E7ZOcD5mtzdt6sJ7m9FXwROkMCtJCLENHfyMhq5DjAXz5
	djbaK0CW52yAQYSdkSbGDFNmTsZcJc44wiIBGxxrYiIZqhAUF4eu59n1uaoVJDQr/YckvxD06DD
	h9xcHDzEW0cds
X-Received: by 2002:a05:600c:1d23:b0:499:51b8:d649 with SMTP id
 5b1f17b1804b1-49951b8d652mr45542765e9.3.1785953618093; Wed, 05 Aug 2026
 11:13:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <amufiuAaZbuDdKkQ@cmpxchg.org> <20260731071900.38942-1-jiahao.kernel@gmail.com>
 <amy8gAN33W4QsM5R@cmpxchg.org> <6e16a760-d84d-98e1-433e-3233a9dd2236@gmail.com>
 <94d74382-2e2c-8f8e-35e6-1ecafdcc445f@gmail.com>
In-Reply-To: <94d74382-2e2c-8f8e-35e6-1ecafdcc445f@gmail.com>
From: Nhat Pham <nphamcs@gmail.com>
Date: Wed, 5 Aug 2026 11:13:25 -0700
X-Gm-Features: AUfX_mz21OIvgUV13HlTkmRouDqof-qc0oL4x2fG4bWuvZaziIySVbUWkVknIP4
Message-ID: <CAKEwX=OuXHCV1G67AgJa+S42O0S+u+CGyOKcg9HqJ_6Pu_=5hg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] mm/zswap: Support batch writeback in shrink_memcg()
To: Hao Jia <jiahao.kernel@gmail.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>, yosry@kernel.org, akpm@linux-foundation.org, 
	chengming.zhou@linux.dev, jiahao1@lixiang.com, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, mhocko@kernel.org, 
	mkoutny@suse.com, muchun.song@linux.dev, roman.gushchin@linux.dev, 
	shakeel.butt@linux.dev, stable@vger.kernel.org, tj@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 11:21=E2=80=AFPM Hao Jia <jiahao.kernel@gmail.com> w=
rote:
>
>
>
> On 2026/8/1 08:31, Hao Jia wrote:
> >
> >
> > On one hand, this avoids scanning the same entry multiple times within =
a
> > single pass. Since the second-chance algorithm rotates referenced
> > entries to the tail of the LRU, entries on nodes with a large number of
> > zswap entries require at least two shrink_memcg() calls to be written
> > back, whereas entries on nodes with fewer entries might get written bac=
k
> > in a single shrink_memcg() call instead. On the other hand, we also

Same thing happens if you have more entries, no? Say you have 64
entries and 96 entries in node 1 and node 2, respectively. Then you
need to go to round 3 to reclaim an entry in node 1, and round 4 for
node 2. What's special about 1/2 rounds vs 3/4 rounds?

I think it's probably fine to just pass SWAP_CLUSTER_MAX as nr_to_walk
- we're applying equal amount of reclaim pressure to 2 nodes. Without
prior information, seems like a reasonable strategy to me. I think
what you did is already a pretty big improvements to status quo - we
can always add more fine tuning on top of it later if needs be.

> > avoid spinning repeatedly on entries that fail writeback.

SWAP_CLUSTER_MAX is 32, so I assume it's not going to spin for a
terribly long amount of time?
