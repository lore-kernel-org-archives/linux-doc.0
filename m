Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE6F225A64C
	for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 14:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737900229; cv=none; b=UmwKymhuiQeYe4oRwTv62889hyJK/wXG9rgdtkh7IJ7mDkY8qzTi/ToOj/nO3eVJLKvYja9il1i3dltsqpo+Mvntmnx6NQCryYROkRBSbcPVAKSSUbVD5LZ4joiTFk/L1ShpOQM8xSJUx3J8dWzSJyiIUzsC/+OsayuiWMm7jMs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737900229; c=relaxed/simple;
	bh=J9zlLkMNuptz1MrLYOUQcIFDBpe9clffCABrxF07OvA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=HsqwmeOA5s/hjYszIRBIvwUmMHxNN0xoBmAkN0oIRZJWsgHJP5yHtm3wBHDoGHDSvYTR4+zI23hw6iQphKdt/LxWu+DzgDGCU+bAdMS7pHkwfIlbAMwzBlj8VY2cThdYwa6C+0Vk8aL6KNQQk1L47nQEFADNQcey+6gpEMK7zqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=NOXEi7oE; arc=none smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="NOXEi7oE"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-ab633d9582aso638073266b.1
        for <linux-doc@vger.kernel.org>; Sun, 26 Jan 2025 06:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1737900225; x=1738505025; darn=vger.kernel.org;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=J9zlLkMNuptz1MrLYOUQcIFDBpe9clffCABrxF07OvA=;
        b=NOXEi7oEIz1DHEHbZnl0lmKWa5axJwlKmut6toFhcB/MtSjjok3ntn4uOp3eTeIPJp
         HXGf8wEqc7t2DUipWeqENeUXClrx7f4DW7Y//bynu8CRsV4YbPABBy4XmPHak2j53Onj
         d6RgB0wfrSON3QcgzcfQruvvc9ocgssiWVUgaSxn7selra6P5efPRg12vHP3CZR9dSog
         MBxAFIBEAcLoTQSYXtMnHJS8Mr6uGRJfha5u3HiJTPrBXJJd/BOtrlj15YRUTlv0P70V
         4Op2WHuO2dGl4A65BwLsGvZerqN9q5P5L8WACG2YSxWiZuNBCfr3f7ReWjR/H/46kfza
         2uOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737900225; x=1738505025;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J9zlLkMNuptz1MrLYOUQcIFDBpe9clffCABrxF07OvA=;
        b=nB4s0sSXEuYZ1b4Trh89wRxu2DMJ/4c98z2ezLTtwM8bLsrG/pGozMzNFm1o8m5oUK
         T05L+glwDHaxwWW2ra6qnsitdNPv1qb39/lNH7xTUviYoeXZwzyK85jdvhdGrqxjH24G
         0OTQ25ja+hgNtGoyNa6iohoRR+7mG3VU5MLmyDPrQ5tuhRe8d4X02N89kdm6lpWeFVr1
         w8CYFSMOhWgIA4gjPcYptGNl8M0vfHSITNkTD9PjeTVqjttuwxNWs3cL0awYgb7Op7i5
         QU72fKI2o5Qe+H2TbsEVs2mUTi/jbIpOyPTdnLv4XWp2ySEThkVBFiDlaoVmRBDWMScU
         x+NQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnM9yaeHaoNMxtdFJoE5PoYou90YLZSlK5tAMCABSeVejBMf7QeUTWzYkrKHpqVoGa1EpHcAU22qs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9xG0uOOxbY2nOabSBY3p+DQXZlaFt/fTErTgFQAN0wxnQIlgu
	5Pt6iQSWUWcqU/KjfHwq9tf/Mp9FrRktd3CvmA06Z0xSpa7bpBvU071p0tVfGyA=
X-Gm-Gg: ASbGnctuCpIVXIV1VLJTiHDWvqX3wpc/q5vPRpPrj6vQizZ3zJgDQiN7iMAPt1MgRy2
	TOyPY9OuAf2e3Av06KDe01svpRwx+IJWmWOf8eHiC0yLyUwAcNDtPJJtQBLKX/DOk5eyU0o1r7r
	kfxuwl6XQNKGINhhPjfBYvAfSBTlUjD/SRMMct1qCMU1vHP7WfJFo60X6gQYlHxoC8dXOJEIDVN
	d/OfcuvRyXnAsxNHRGX3Qs5IXNUXMpOvhVjyR2cKgzT7/5IzKoIW7wN+vQ/OX/KkSwj2VeUbw==
X-Google-Smtp-Source: AGHT+IGWs6TCgafm7EZsQWtNb77Wb6bDxT3YATHBRWhxGzfd6txwT/XuznzYq9+S9m2UEGIDSMl2sg==
X-Received: by 2002:a17:907:3606:b0:aab:dc3e:1c84 with SMTP id a640c23a62f3a-ab38b274a03mr3048962066b.17.1737900224947;
        Sun, 26 Jan 2025 06:03:44 -0800 (PST)
Received: from cloudflare.com ([2a09:bac5:506b:2432::39b:69])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab675e67836sm430235966b.66.2025.01.26.06.03.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Jan 2025 06:03:44 -0800 (PST)
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
Subject: Re: [PATCH bpf v9 1/5] strparser: add read_sock callback
In-Reply-To: <20250122100917.49845-2-mrpre@163.com> (Jiayuan Chen's message of
	"Wed, 22 Jan 2025 18:09:13 +0800")
References: <20250122100917.49845-1-mrpre@163.com>
	<20250122100917.49845-2-mrpre@163.com>
Date: Sun, 26 Jan 2025 15:03:43 +0100
Message-ID: <87v7u1d64g.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, Jan 22, 2025 at 06:09 PM +08, Jiayuan Chen wrote:
> Added a new read_sock handler, allowing users to customize read operations
> instead of relying on the native socket's read_sock.
>
> Signed-off-by: Jiayuan Chen <mrpre@163.com>
> ---

Reviewed-by: Jakub Sitnicki <jakub@cloudflare.com>
