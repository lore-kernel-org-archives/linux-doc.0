Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DC941A4F1F
	for <linux-doc@vger.kernel.org>; Fri,  1 Nov 2024 14:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730472967; cv=none; b=UMhIXtm/tX4wkTN0yF5TEzjj+pyKfLI38r+K0d8hViZlD3hgMlSWDg5wfy3ydutEYrUF4UyKXZ1K1Tx0AQty6xSLeZwTzk1RDXpnsUcpx/iVgG6zlXKhdiyAs3v0YQDD+gRzzJH6tJiwUAjkVDsnf5DvBdJ7AmcX3EUZin1DjEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730472967; c=relaxed/simple;
	bh=G08w8LMJtXnAa9vC3FM4sYMixgeFmAcZ+IpY7IqZ+uY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YXHnVckyH51A/DgHMaWUfyBrzcHea2eY+v3Baylfg5sowM9LcZkPVsec2Le2uU/lE7DLJuZZaZXSH6Bs2hB4Ca1IkKh5jr0fpnmOapru1VhaWIcaP1hHMJy3NPcBLx7mzPVzTgLk3RtMFycJukHeHXcFnSlxuZlRUCoHS+V3zoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ewAUmhFT; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ewAUmhFT"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4608dddaa35so174281cf.0
        for <linux-doc@vger.kernel.org>; Fri, 01 Nov 2024 07:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1730472965; x=1731077765; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ccy+Y36kHfW2wfpfx/1iIr3oOsrbhtg+RURg3eebIqc=;
        b=ewAUmhFTPdZhFdkmW3ol87ApD6N9oMTsD0tvR0JfWJ3TGaAiM3rIc5UTjMi5tYO2eh
         z3hBOGWxjySTCZDpjc9QbGGBRtqo4f+y0jGJtjUjUrhB4VnS+WIga2m9b0wtE80NLB9o
         B96KrczzkThtyy2CRWa5QaFuQSqqnbTIYkMvVryqM8gq3vEBn9eZ1B5/JYKRDOTqn7XE
         COJ2Qn+BiTayEldM1rPS4HeP7OOgxd6eqRLdvXkN2YVJgEOHAvZwr8rXOe9mS0P1WBps
         odkVxSqrbXnnNcUTDeVfRzcEjENR8LqDMs14Lg/pgR4do/f77ZHklpW2XQUaoql+7ztI
         Kiug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730472965; x=1731077765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ccy+Y36kHfW2wfpfx/1iIr3oOsrbhtg+RURg3eebIqc=;
        b=Z8OprKDY2Gs9NRJSX/xoZfJAMvClIONepwqmHjVUY38wRtRM4yPt0W2s8CZWnMAGNU
         wjMSyKfvxREwWJnmClfR5Vnr4nNzR8Z68t5ZdNW/sP++C5C5BbDZ5lhpZxPaNy73L8sJ
         yYWxlPM0/ZEzU+u0RmuTtMGd6GMTBVnYW1eZOoBUnOsfb5gs16W+nYcNlLGxe04amjsc
         Pv4BlJLdhEmL+12GlKF8eO/rFJDcBCEkDl3kc5HarFSlcKcoyRd4nNcs2vozcHPpnQQ/
         lb2tpvNRFE63GG9EXMq7RgP8l6667Firxfy95G+CRjljt9MTVjBuANeBU2R7VHLJ9slw
         1UdQ==
X-Forwarded-Encrypted: i=1; AJvYcCUA9lbjvzR2axj1u+jtUkYnN3UeLUsf2iCEVwkFwUSjIVWTz9X0JNKCAtz3Ki6Gekttc+Lt7SXIWsw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7o1F3LPxwrpLj7e7/Q6dh0CHdGt+kRjcLkYVYl7aZrjaitDY
	v3IOSkYSVMT3R5YshhQfjQTnrD9hBRfusvmysHOahXHtim2tinllC5YwxrQRgPBaDGBgzwNmnus
	jqMlXmfJQGz5RCCtNDapDWn3Ewhq1iY1Q3/px
X-Gm-Gg: ASbGncvhM//Dj+ou0Oe+M0c6F4HMG6cNHvyuytvyBELjJEw1F3LVUNuA9woTNFCGke+
	neG2932TFrHhO0pK0tKQGGsUdtqMhcRM=
X-Google-Smtp-Source: AGHT+IF00UWkqt4znVPLzeUZimdQfCe7Xr8KZzMNIgyj1roW3uHRVXOdasFyJRnjjsoE2545UrngIkf4oV3O0aKfFQg=
X-Received: by 2002:ac8:7f93:0:b0:460:4a62:4ff3 with SMTP id
 d75a77b69052e-462ad2d9308mr5942321cf.23.1730472964716; Fri, 01 Nov 2024
 07:56:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241022162359.2713094-1-ap420073@gmail.com> <20241022162359.2713094-4-ap420073@gmail.com>
In-Reply-To: <20241022162359.2713094-4-ap420073@gmail.com>
From: Mina Almasry <almasrymina@google.com>
Date: Fri, 1 Nov 2024 07:55:52 -0700
Message-ID: <CAHS8izOSuPj66UiZ=pDn2Bin_C6_6b5ya0AxiRkuv0apKcU0fA@mail.gmail.com>
Subject: Re: [PATCH net-next v4 3/8] net: ethtool: add support for configuring header-data-split-thresh
To: Taehee Yoo <ap420073@gmail.com>
Cc: davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com, 
	edumazet@google.com, donald.hunter@gmail.com, corbet@lwn.net, 
	michael.chan@broadcom.com, andrew+netdev@lunn.ch, hawk@kernel.org, 
	ilias.apalodimas@linaro.org, ast@kernel.org, daniel@iogearbox.net, 
	john.fastabend@gmail.com, dw@davidwei.uk, sdf@fomichev.me, 
	asml.silence@gmail.com, brett.creeley@amd.com, linux-doc@vger.kernel.org, 
	netdev@vger.kernel.org, kory.maincent@bootlin.com, 
	maxime.chevallier@bootlin.com, danieller@nvidia.com, hengqi@linux.alibaba.com, 
	ecree.xilinx@gmail.com, przemyslaw.kitszel@intel.com, hkallweit1@gmail.com, 
	ahmed.zaki@intel.com, rrameshbabu@nvidia.com, idosch@nvidia.com, 
	jiri@resnulli.us, bigeasy@linutronix.de, lorenzo@kernel.org, 
	jdamato@fastly.com, aleksander.lobakin@intel.com, kaiyuanz@google.com, 
	willemb@google.com, daniel.zahka@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 22, 2024 at 9:24=E2=80=AFAM Taehee Yoo <ap420073@gmail.com> wro=
te:
>
> The header-data-split-thresh option configures the threshold value of
> the header-data-split.
> If a received packet size is larger than this threshold value, a packet
> will be split into header and payload.
> The header indicates TCP and UDP header, but it depends on driver spec.
> The bnxt_en driver supports HDS(Header-Data-Split) configuration at
> FW level, affecting TCP and UDP too.
> So, If header-data-split-thresh is set, it affects UDP and TCP packets.
>
> Example:
>    # ethtool -G <interface name> header-data-split-thresh <value>
>
>    # ethtool -G enp14s0f0np0 tcp-data-split on header-data-split-thresh 2=
56
>    # ethtool -g enp14s0f0np0
>    Ring parameters for enp14s0f0np0:
>    Pre-set maximums:
>    ...
>    Header data split thresh:  256
>    Current hardware settings:
>    ...
>    TCP data split:         on
>    Header data split thresh:  256

This is a nit, feel free to ignore, but I wonder if we should call it
'Data split thresh' instead of 'Header data split threshold'.

It was a bit weird for me to refer to the feature as tcp-data-split,
but the threshold as hds_threshold which i guess is short for header
split threshold. Aligning the names to 'TCP data split [threshold]'
would be nice I think.

--=20
Thanks,
Mina
