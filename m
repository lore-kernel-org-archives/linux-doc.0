Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E3B23F291
	for <linux-doc@vger.kernel.org>; Wed,  5 Mar 2025 11:48:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741175320; cv=none; b=M0Vydwcx409q315TJfvGPqIGFttv7/StpYOZqPL5ww23PJnl8PED9jPGBpJGxxdNe/iwxeBIc3IFm9CB42yOflGVcL1RxZCtF3frMQHqMT2d3Vc4h55jTkN4fJo0hj1676cku3BgUDWaDP8jmptRRPr8w+M/MrAxpwoMaKSnUS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741175320; c=relaxed/simple;
	bh=Q21NDekGBNQTIfKbTKns37l4fTuwmkz/QevP9S3vm50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K1BzIGYCpUFttiiWjUvkjEzGMPmhSwPnDl5Qntq89yh2D5fS+C7T1GFlhPAoiWa6xW7LO4zGp1YpeRJRM4hzeMnzyClB7Y+glJhbJMJ3b0zJpc/QLjW1GLaxFJBTVLnAlH6xdP6fSE5Tn2RdYQBkLn8jHlBVecB+YKzpk31mwX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=Uovnawnc; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="Uovnawnc"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43bccfa7b89so13377545e9.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Mar 2025 03:48:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1741175317; x=1741780117; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AjEwmig9AGzAF/y06SLaWwIs3RII9NjSOkKtK2LhVm4=;
        b=UovnawncvM49TaeC0cgH0TQWg57wNy7LbL9GLz92hJUWJytoA09KUmLFP/BVluyf++
         bifGjXmYU+LszaB1OpXNpB2NmP1rV+oviwPCP43cV3uaQjPcFS6V4s+MmixwBTFiEVTl
         zceVGyrZZhV2V7kXoTqoWnFt/Uuj7XemNcYXIloe4QJy6U0h2UZocUaf0hD91aW3qMKg
         V2RgEsdLlbrnjJrWZyEQ9moKjvqV9t5fRi/Tl0+mzWnoAD9gh23nrt/T2ZdWFuXGjMiS
         pMji/rgrGxQHJQhNMWDZ07Enad0IkR03MlR84IBBbCzU4qRm0celFFQKZYZBlNKj0W7k
         raUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741175317; x=1741780117;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AjEwmig9AGzAF/y06SLaWwIs3RII9NjSOkKtK2LhVm4=;
        b=hUXokUznp3MgUDkA2UelD3Sg8bKOoMN91zc64pt2OesFT8+2TE36dXYZ5M2YbdE5p7
         9kCp9SvRB+lVxEqYICytCVrQ0kG6xCehc7QNbVmeuZwVYaUvwA5uI+RspDqG43uOoz2U
         DJVrkuCPEcAZLoTmrzqW5RkW78Adx6ehaftvGt+3rqtpfApAaIy27OgL4+xxHS2C1KV8
         C/4sXmsesZkQVkEGMEmG41sYxpr9jLjPerCHSP05ZW3w2EdtiDl2/Et5SEbRTpABuD8l
         Jq9X7xKLq6d9th7g3EqTMxICiwXoAiUscq1Aua4I1hwLDTqDhXWQGDsgLS5UPWYTVLKc
         CQdg==
X-Forwarded-Encrypted: i=1; AJvYcCVDnc/8XwhoPYQwroxaVG0tc56l5PJJ+LfsWsperUFnoFIr4jLjMUerL3KsoHHAaaFPF1Dl5lxK/mg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRM18xZnZaUZI9HH8R4kWfa05kX54KJeUMLqNksVva8PlKtkMq
	VqzZtIvhbjzhplZ0nsnYfT9NWKD7CyUFqeOtdZGAxvCHXdRFBMzEoEuEQ39j4gc=
X-Gm-Gg: ASbGnctEk6mL/3HoPubbB4hJOXHFJ2xAwWEnzQo1wBXVsEQRzSrDQC+lcwYHgW2WxXQ
	WqIhnxa6lVdFPz+lwLE2BJdOO7NIk69x2dZhCi/BrjgwAPkltRrSEria2yF9CxVGoy5sNN6jURx
	D0TREzDxumYB3BXeUgZ+RlQwtRO40Jy3vo8rxJ9xkNH4VkX+4ie27HGOXxN3//KIZRvNHhRfKuk
	VSvmEtzypcb2zxktmkwLb0WdrniSnjXOIZiI7asQD+qmwmHZIku3SIGifc/VgNW4neBXV9JrVZz
	bw/ZB3WBkFoutRKg858Yid044MAqxWQCkW/B53XGTpcRw1wErjr+/ShGb5N0DQs7nooDSmxu
X-Google-Smtp-Source: AGHT+IEXNFWx3dw1pIcEsbwbpOTPx3uvL6lGE1yf0XdlpTePB7sGcvwk+nr4zOCYvvAGQZ42wSzpcg==
X-Received: by 2002:a05:6000:156d:b0:391:22e2:cce1 with SMTP id ffacd0b85a97d-39122e2d0c7mr1428279f8f.42.1741175317004;
        Wed, 05 Mar 2025 03:48:37 -0800 (PST)
Received: from jiri-mlt.client.nvidia.com ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd4353003sm15541105e9.28.2025.03.05.03.48.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 03:48:36 -0800 (PST)
Date: Wed, 5 Mar 2025 12:48:33 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Tariq Toukan <tariqt@nvidia.com>, 
	"David S. Miller" <davem@davemloft.net>, Paolo Abeni <pabeni@redhat.com>, 
	Eric Dumazet <edumazet@google.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	Jiri Pirko <jiri@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>, 
	Carolina Jubran <cjubran@nvidia.com>, Gal Pressman <gal@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Donald Hunter <donald.hunter@gmail.com>, Jonathan Corbet <corbet@lwn.net>, 
	Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org
Subject: Re: [PATCH net-next 03/10] devlink: Serialize access to rate domains
Message-ID: <qygqjbhvk5ycigyxcojzakllelokkos3rgpolhpebmfiqzsajp@jxle4qz4ajxz>
References: <ieeem2dc5mifpj2t45wnruzxmo4cp35mbvrnsgkebsqpmxj5ib@hn7gphf6io7x>
 <20250218182130.757cc582@kernel.org>
 <qaznnl77zg24zh72axtv7vhbfdbxnzmr73bqr7qir5wu2r6n52@ob25uqzyxytm>
 <20250225174005.189f048d@kernel.org>
 <wgbtvsogtf4wgxyz7q4i6etcvlvk6oi3xyckie2f7mwb3gyrl4@m7ybivypoojl>
 <20250226185310.42305482@kernel.org>
 <kmjgcuyao7a7zb2u4554rj724ucpd2xqmf5yru4spdqim7zafk@2ry67hbehjgx>
 <20250303140623.5df9f990@kernel.org>
 <ytupptfmds5nptspek6qvraotyzrky3gzjhzkuvt7magplva4f@dpusiuluch3a>
 <20250304160412.50e5b6b8@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250304160412.50e5b6b8@kernel.org>

Wed, Mar 05, 2025 at 01:04:12AM +0100, kuba@kernel.org wrote:
>On Tue, 4 Mar 2025 14:11:40 +0100 Jiri Pirko wrote:
>> Mon, Mar 03, 2025 at 11:06:23PM +0100, kuba@kernel.org wrote:
>> >On Thu, 27 Feb 2025 13:22:25 +0100 Jiri Pirko wrote:  
>> >> Depends. On normal host sr-iov, no. On smartnic where you have PF in
>> >> host, yes.  
>> >
>> >Yet another "great choice" in mlx5 other drivers have foreseen
>> >problems with and avoided.  
>> 
>> What do you mean? How else to model it? Do you suggest having PF devlink
>> port for the PF that instantiates? That would sound like Uroboros to me.
>
>I reckon it was always more obvious to those of us working on
>NPU-derived devices, to which a PCIe port is just a PCIe port,
>with no PCIe<>MAC "pipeline" to speak of.
>
>The reason why having the "PF port" is a good idea is exactly
>why we're having this conversation. If you don't you'll assign
>to the global scope attributes which are really just port attributes.

Well, we have devlink port for uplink for this purpose. Why isn't that
enough?


>
>> >> Looks like pretty much all current NICs are multi-PFs, aren't they?  
>> >
>> >Not in a way which requires cross-port state sharing, no.
>> >You should know this.  
>> 
>> This is not about cross-port state sharing. This is about per-PF
>> configuration. What am I missing?
>
>Maybe we lost the thread of the conversation.. :)
>I'm looking at the next patch in this series and it says:
>
>  devlink: Introduce shared rate domains
>
>  The underlying idea is modeling a piece of hardware which:
>  1. Exposes multiple functions as separate devlink objects.
>  2. Is capable of instantiating a transmit scheduling tree spanning
>     multiple functions.
>
>  Modeling this requires devlink rate nodes with parents across other
>  devlink objects.
>
>Are these domains are not cross port?

Sure. Cross PF even. What I suggest is, if we have devlink instance of
which these 2 PFs are nested, we have this "domain" explicitly defined
and we don't need any other construct.
