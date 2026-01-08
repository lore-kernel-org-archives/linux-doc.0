Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9041B2FB0B9
	for <linux-doc@vger.kernel.org>; Thu,  8 Jan 2026 06:14:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767852847; cv=none; b=dqbXyCBBcbu6ufM9T9gWB6sT8hXLmwozs9uRTlMba3Zym5R5yY9TIjuEnUCVC4KepqEp7+4WL+VNKr57bpO6ETCccIs5OTIQ23XYkDScG7KKkw36c31ioH0rcSxf/3DA1+NuHNpqLtLqkuWklnN5XpiqTP7RTq5ZyhQvmveytSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767852847; c=relaxed/simple;
	bh=maWf8E4/nR6r4iZkfiudPX2lmDBux7LpubjWVpgYQew=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pGBMbAvhcgQoKnrsmkBv6d7q1uJNgeoqf2UcDdEmUk7ub/YBlyxXBWkRgPZQBtyPLOY5HXw7KtmW334lfmDlArfQEd49N1qvXuizJZTr7f38OyYFDrHivY9RmHNK23E2pPqER9yRROAtTp3FZay6w7Bmev0KYKX7D/F+FLdmmb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=njqii6qC; arc=none smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="njqii6qC"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-11f42e971d6so4494579c88.0
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 22:14:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767852846; x=1768457646; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZuFRSJyxVGvc7rvYjVUrIZJ8+nTlCmoSPS+Ihaf2wKk=;
        b=njqii6qC2wAjf92Npshxj5+Z/tkI0cP/WGAzjrLJVYOSivnymNPpOZKZIjLsZVRZXp
         Ook5oB4sOn3ZJqJReZnWO3ZgPmzDY3evMeU9/Ki/9K4vRLglcQVodcuKQsdCXd7zflFP
         MXgTRqKx+NHCcca8DjXBljpa67v/Yo1CoMpIUiSPxodSwTz3/pxNnh0b/fRm2zq661XX
         OR1WAii0i5bYHNGwdTk/khC7eIykOLp7PfDUuLw4ldG18qhvYrHYapIlCN9h7Io/tt0E
         1hTu071vF2t2rFtD9Vj1OnBxJlWD0q7bY/uUPw3e6+KfKYTl5ranu6F7TCF8Jslef2Rb
         OMqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767852846; x=1768457646;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZuFRSJyxVGvc7rvYjVUrIZJ8+nTlCmoSPS+Ihaf2wKk=;
        b=oA9zDKHX4Gek08ORRtS4DpYaayr4bIF5WmQEMhbUbiSadENoX7gcage/SkPD+hWjRa
         n9f2IW0b17wvoBsNUZDjND0OdVP3vVk5gx6Ae/8Bxa55bW17iNBbGYZnmEPMv3sVO8Am
         XcTg9pDQEvSXN/wbQmByOs3YY+MbcSdqC5q8IenTnKZS/2OvsU5OvGg+5XGwBVYgN5oP
         g6dykMqbaQbbzTjpTi9pciJqwNC0fGTFdwsWLsGtMw0gxt7ncxfO/S76aMJD771ue0Mo
         7DdzQjEmCQYkwFL5b0N1/PayAuTbCjDau87SlD9RY1QpRbB+0+SitMmHvWHbSCIOBhBX
         5Gjg==
X-Forwarded-Encrypted: i=1; AJvYcCW2VPPMYtg0gSoNwrjeIAsjBviqkh0HPKNGexWbg7KlVt5LcR6eVh92IkWuQLGgzpsFNxY3U69QSFM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrCRd5URtTYSsba/9Nd+OwyttLYXorpHuqN93kgc9Bs+LEjWke
	d1Inp1DsaDUQ4XOb2q/7v6pTlBenn8cHO3ENA6gw02I1L3YU8KtBH7xi
X-Gm-Gg: AY/fxX6aX1jhwKVGZTnUy3RR8PHQYjO3M7ZXz2xLFACxi2l3NuiLYiIOuh0OmPf1zIw
	XJHy58NTS6uoVkjRtmvB0o3MqVg6f5IDLlQqjnRyXMrUKxwgacF9Qqrle4PSAoM14FZVsYoKhtw
	baE1Hcu1CBzTYTY3698LuaWztt+V/3p2PcZbS//bxs6s0oVFp1ueZW7LigOY4CPQdumG/2dsfB9
	UNNkVnYWBwYdaUMbbBJtjAn43Ap7zBELC52yxphXDFgSYIUmbFKSzy7OW5Fj01pEiG47E9T/K7u
	BkqXuhqGNaIz2uV0/1X6ZTZ4KBWLIiL3n37LKF6blMmWXt5XagogAv9EsbyDwoYQKbsoXPPYiwQ
	2mtYF1WhJffkcOIoR8lIxyncx8HccZ4JumDybKlv62urRm5uK6KK746OQqpgBPpUI8mHwwebN+D
	ITAdNBC7WtFYB/AtDxdmGICv6fmn9cVk6IRh4=
X-Google-Smtp-Source: AGHT+IHr+qha1eOTfp4wLQhnqwmJ68KneYOC7GXQfwKel51U3gavmvexU6VxrRyZtU0m6yrWXG1P3w==
X-Received: by 2002:a53:e239:0:b0:63f:ba88:e8e9 with SMTP id 956f58d0204a3-64716bd5e88mr3638566d50.43.1767847054268;
        Wed, 07 Jan 2026 20:37:34 -0800 (PST)
Received: from devvm11784.nha0.facebook.com ([2a03:2880:25ff:53::])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-790aa6a4d00sm25981107b3.41.2026.01.07.20.37.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 20:37:33 -0800 (PST)
Date: Wed, 7 Jan 2026 20:37:32 -0800
From: Bobby Eshleman <bobbyeshleman@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Willem de Bruijn <willemb@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	David Ahern <dsahern@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Lunn <andrew+netdev@lunn.ch>, Shuah Khan <shuah@kernel.org>,
	Donald Hunter <donald.hunter@gmail.com>,
	Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org,
	Stanislav Fomichev <sdf@fomichev.me>, asml.silence@gmail.com,
	matttbe@kernel.org, skhawaja@google.com,
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v8 0/5] net: devmem: improve cpu cost of RX
 token management
Message-ID: <aV80jCHD9PGaOr87@devvm11784.nha0.facebook.com>
References: <20260107-scratch-bobbyeshleman-devmem-tcp-token-upstream-v8-0-92c968631496@meta.com>
 <20260107193013.0984ab97@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260107193013.0984ab97@kernel.org>

On Wed, Jan 07, 2026 at 07:30:13PM -0800, Jakub Kicinski wrote:
> On Wed, 07 Jan 2026 16:57:34 -0800 Bobby Eshleman wrote:
> > This series improves the CPU cost of RX token management by adding an
> > attribute to NETDEV_CMD_BIND_RX that configures sockets using the
> > binding to avoid the xarray allocator and instead use a per-binding niov
> > array and a uref field in niov.
> 
> net/ipv4/tcp.c:2600:41: error: implicit declaration of function ‘net_devmem_dmabuf_binding_get’; did you mean ‘net_devmem_dmabuf_binding_put’? [-Wimplicit-function-declaration]
>  2600 |                                         net_devmem_dmabuf_binding_get(binding);
>       |                                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>       |                                         net_devmem_dmabuf_binding_put
> -- 
> pw-bot: cr

I see that net_devmem_dmabuf_binding_get() is lacking a
stub for CONFIG_NET_DEVMEM=n ...

Just curious how pw works... is this a randconfig catch? I ask because
all of the build targets pass for this series (build_allmodconfig_warn,
build_clang, etc.. locally and on patchwork.kernel.org), and if there is
a config that pw uses that I'm missing in my local checks I'd like to
add it.

Best,
Bobby
