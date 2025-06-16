Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9CD8220F54
	for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750087129; cv=none; b=W6IEspGo2bCzVwR3t34ezJWIrvaPo1rqxNU/8ND3LZZZfmgE1S1qo5DusIJRyMJhYW9IHNvRAdII1TdPY21+eQXfyFaekV1Gkfq98pzGpDXLZX4EpcANVXfNaOaaAZ7QASry453B/37QB/AIKamfquptG9L91sla1/VdogYtLDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750087129; c=relaxed/simple;
	bh=39lxUy6Kl7N8Xdbo4R0KJwypS0sdGBPvBueU7ohtNYk=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=layDkIxV63LM8W5E4Ge6c+JecxYWQ3M4KnIsaKHM79oyOOhuhZn4bslsklIzlRLlyE9GeT1yXwdpqK0c1Abm/rdks6OBGi8QW28Zj3t5lujMaJPXEaabfbrwNgJmA9hFt8hBPLtWd6BUgCPthfpRrN9kx3FI+ekZeZ16tOAc9cY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=N3jJYFLU; arc=none smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="N3jJYFLU"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-3a4fea34e07so2636202f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Jun 2025 08:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1750087126; x=1750691926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=v0AeV7KdBnWrsBf8ShQlZdXbD7DM9wx0kl8YAmF960o=;
        b=N3jJYFLUWeo2Ti/AeuGVbfk8Qf+g3JpuLjmnUWGLXu/uNoOVwxbEE/ap39N51ZY551
         7q7rMWryUQw7YvADWUF5nlNLS05FS7JfKG/XryhaFas/BDkeE/dk/AZ4RqPr58OcZOSv
         FP9mRgEpbJtq4o0P5dfRlDcmiDtyS3k6D1lfFEL7XvLnLWZdIp9AXjK4unTPjVP5fOzb
         QaIZMBL0to/tXuMbxGg6yaf2LQ8ioHkcRf7WIRVXS1u5B//ce8byyAE+PFKg0ach0puZ
         8mo8Wn1P6W6ZlDwZZqzi1eLB/dUjByJnbBCgoqs24QenOloV61F/gUIKcuEvzh+jnX0t
         Axxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750087126; x=1750691926;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v0AeV7KdBnWrsBf8ShQlZdXbD7DM9wx0kl8YAmF960o=;
        b=n87J+a3nNh6kx/eq1SExBAV2NCOM+QH5q1wAxaZadeKX6g9/nDQ57QAsBN4sYHxjZa
         t8hHTZDm9flAP7lqCL6BzhkGVZ2iHJhQ5QUUwe6xtq+dBKg8ZylKwt65MKiwZnOjuxY4
         jBl5861IqTHYp/7Aa2kTxa+JAOhFsQfoKfY13fpgvMlCV/EqDB7AaEWI/U/JMJuw/hj8
         Z78MgTK7lrLu7+m7cKt1UrloW6jfuTldlRCku9RH4rC2RIetSw8CRpYt9uYqVUsc8woB
         sjHPIRC6AHDNamKfXb4HaxiEUf4gyJxrPx0SyH0qU4Nk2//XZWiFTZla3nACQ/+IPUrm
         fHsw==
X-Forwarded-Encrypted: i=1; AJvYcCWzJloNHsCxYOP5nnh3Srarlb+4++HZkESdYLQd8MwWIjCvAHSMOwuPDAus5SxOCS7DoRnEcg/3rNo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6yDL6zB0XD2uiKDhyygAb0YQS/YAAltJ3SMylBUKAYtIi8/Df
	f/G/axVjaho8P2bw/Cg1DlCvQlQHS/6phyEF//0pCUElddJWqzuAN/YNPNsiz5H4MVU=
X-Gm-Gg: ASbGncvzxqd/jA80xjvu6zo/u2W0pe7zPwsYTWpFSLbieFOgMdte0I8ALVLnZaZw/1m
	4A9Jh61L3i58QAGak1fItJX4yUf9RDMoojD2/W+0H/AxLokMMGx+LbJQaASQLm5/25gfRH2fvna
	BNYIfyLrTyxHCdcBfhHBljd28Oy44cVh+TIyVF2EeBb7e9k7txhO0+DBqcoY3UYQqEEOixne4xt
	mwyRIBYUgWfAUaskN41SrvZsOKGNrKL5HnE9SzbvtuAmKU8TNZmntk9qRwpi7aZSyWaQrxu3HVn
	qBD3coVKnokoSu5+ODN1jPWOVyBTm/5pVMYRK2hzrjiO6XRpK5Pk9jUzEoNS1thMcMQ=
X-Google-Smtp-Source: AGHT+IFX0ZSZPV0qrxkApKvU1oCOg6Nkng3YwhpdKQfoD8SyAL1k0kPcO80udoBw00i73oPsFxsD7g==
X-Received: by 2002:a05:6000:2c13:b0:3a4:d0dc:184d with SMTP id ffacd0b85a97d-3a5723a2d79mr8584059f8f.27.1750087126052;
        Mon, 16 Jun 2025 08:18:46 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b1bc97sm11414339f8f.68.2025.06.16.08.18.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 08:18:45 -0700 (PDT)
Date: Mon, 16 Jun 2025 18:18:42 +0300
From: Joe Damato <joe@dama.to>
To: Dave Marquardt <davemarq@linux.ibm.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net v2] Fixed typo in netdevsim documentation
Message-ID: <aFA10n519_VP3pOX@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Dave Marquardt <davemarq@linux.ibm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	netdev@vger.kernel.org, linux-doc@vger.kernel.org
References: <20250613-netdevsim-typo-fix-v2-1-d4e90aff3f2f@linux.ibm.com>
 <aFA1seeltkOQROVn@MacBook-Air.local>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFA1seeltkOQROVn@MacBook-Air.local>

On Mon, Jun 16, 2025 at 06:18:09PM +0300, Joe Damato wrote:
> On Fri, Jun 13, 2025 at 11:02:23AM -0500, Dave Marquardt wrote:
> > Fixed a typographical error in "Rate objects" section
> > 
> > Signed-off-by: Dave Marquardt <davemarq@linux.ibm.com>
> > ---
> > - Fixed typographical error in "Rate objects" section
> > - Spell checked netdevsim.rst and found no additional errors
> > -
> > ---
> >  Documentation/networking/devlink/netdevsim.rst | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> For future reference, since Breno gave a Reviewed-by for the last patch [1],

Forgot to include the link:

[1]: https://lore.kernel.org/netdev/aEr7J0UbSFhJ0Zn9@gmail.com/
