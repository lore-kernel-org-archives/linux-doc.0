Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3B3A33471F
	for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 16:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757521396; cv=none; b=le+xMLIxWYDdrYPgKWPuwBSO+DgW2I3SMmmF8TDdwFOlUKRSR0ZNSiAOU1QYAVPypkmF8y7dyGvZTe5ZdlIpEuw1yUUMoe80uS1JhdAZvNrJKmUBaajkBI7z3+HBMrt1NyxqmQWzXh8R4oa7nOeF6VAV1OhzwjI4SQbnfd5duXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757521396; c=relaxed/simple;
	bh=QV4qaVeduj/yREU+BcPgw7XZ6y4Ontzbperd5ZjM2FQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skuJHpNeZj+bNOkbt8ZY8elpCyMNo+UyxoRegvqK+xm5aChB61T2SVT73G0dnGUp/HY9aQuMM8gu9fyvG/2sdn9BnQBDCWLaFOIQAxZNAuJmZ3HzDtO9PfOEZNyKKifiycmQqZ0q08ZYfbluXI5VIUiapFKkoUTO6s+akF3THUM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=cizFS0WC; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="cizFS0WC"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-726549f81bdso64616376d6.3
        for <linux-doc@vger.kernel.org>; Wed, 10 Sep 2025 09:23:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1757521392; x=1758126192; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6FwkMlW01VIxUYcm4CJlAUCNZh7Z+O+5WtmWOGwJI3A=;
        b=cizFS0WC8vRAcl0sPHOePwmP9NRrSK0I0cSA0sybqtf6Kk+TwyRYi5NoV9j5By68vX
         txqZjDzCNnLLtjUFgNbLZgMm2PIEjb3diY59e9Rv2MxBfEphYCDYW8MJWJd/Yvco04io
         asuKnCZBaDDJmwvrjjT+CLujnF7ef/g7piEI57c/hvpjvo1XIYz/xQ/MhiBFBhthL4JW
         y6OzRvwKT7STEOcg+M1UZj0/9eKXrcws622boCjDTg2QZkviUxWDyaW0lTu4mZU+l/St
         CYe1jb5r7dMSwcwy5Hbp9dF6KWf+TKAlk/WbJ2r7vHd6ks5+t/6u8rbwR1jJMJjRjM+o
         I8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757521392; x=1758126192;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6FwkMlW01VIxUYcm4CJlAUCNZh7Z+O+5WtmWOGwJI3A=;
        b=DLDmQuqumDnTv0Ak/0tB8AV5/x5dpyBDVU6xg9pKVSKscEqsKe1mUQ0G6LtYDACFBf
         xVOxSkL3n5ejR2YhSIxNsz27knIFWmQNBM5GKbwhJfcD7yuEdfbMyXwspI8YIn1P/ajf
         MqmzndxDJN2sYvtjULGZFw4Lyw4UHhLXA4tc15MY7QEP8Yc/twnT1mcEFKew78ul8Jnq
         P8FfTnq7g8bXGZ65sx71x1J1QGh1n9dineUjpz5G/Y8F2HGeFc4dr9Eg7pnre2FyReJ9
         w5ZM5gFWWCQp48syOqxiasGanlZ9i+dHY7AfbNNo6VuUc15sN4wa/1navM4OaJuhFEfc
         05ow==
X-Forwarded-Encrypted: i=1; AJvYcCWHhvuSIvjDcsiMS5/zQ7cvsMKZ/+AX0QGD78LHELObtKQAnvYriaqQ8ERWRCMozFxu2hN3xQcDa9A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz70S+amg0pnxoh/Xg7urosIOoz+KaBpubLVbcu0E3mWIeor4HJ
	IrzBmhVVyz1kA5rOLPtkfUJ129YkQUZAzJHHaxubRaBloECY1ISmkYr67E2ntCASzFc=
X-Gm-Gg: ASbGncs4j/VJxqBeHgN7LKucMI+LBuf+3WytFLfmi/FvtdYT1+5gryho4UTAzBKTz3a
	IR0+lGVOuVoGOEjbn603ZIJePWoWubup4NM8Bb79SzuqeyC9MlNs+5ivP0J6rLnSpLZdVE3yOMv
	Hr3jVrstOcLQHn1ewxEofpKMufV4aWkfMD4vW7btei5md0J8/Sj3rWWMo4iXgu4+3MHzpOPq4sB
	12nLvWjajmaCEud6lMFoPzLP2/HlwyG/V3uegKL8gUqL8nGjkQKbF4IkBNPu8bKwJQdAKl58r/J
	k6VtKTINwC9FtSQy3zrjit83JUKOY45ofP/P+UnGDvb7+FpiOmPM0zc6UdrFOVOGnwfAGzIZn1M
	eqaz7crEcRdGuKSJGbVVkw1hpek/UF8WXU48m5TVngEwCpFztKTY2IKHqjQ0yD9P+UXRQ
X-Google-Smtp-Source: AGHT+IHPGap2dCYWlJBOrKoIpqhzx0hg0+yPsTujjfLJBGMgHZWbcQURT6fJPbtpQWPkXIn9zn4B6A==
X-Received: by 2002:a05:6214:ca8:b0:747:b0b8:307 with SMTP id 6a1803df08f44-747b0b805a2mr108386976d6.26.1757521392357;
        Wed, 10 Sep 2025 09:23:12 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-47-55-120-4.dhcp-dynamic.fibreop.ns.bellaliant.net. [47.55.120.4])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-721cf6d6cffsm150161886d6.54.2025.09.10.09.23.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 09:23:11 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1uwNbC-00000003tad-1XQm;
	Wed, 10 Sep 2025 13:23:10 -0300
Date: Wed, 10 Sep 2025 13:23:10 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Stanislav Fomichev <stfomichev@gmail.com>
Cc: Tariq Toukan <tariqt@nvidia.com>, Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Jiri Pirko <jiri@resnulli.us>, Jonathan Corbet <corbet@lwn.net>,
	Leon Romanovsky <leon@kernel.org>,
	Saeed Mahameed <saeedm@nvidia.com>, Mark Bloch <mbloch@nvidia.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org,
	Gal Pressman <gal@nvidia.com>, Cosmin Ratiu <cratiu@nvidia.com>,
	Dragos Tatulea <dtatulea@nvidia.com>, Jiri Pirko <jiri@nvidia.com>
Subject: Re: [PATCH net-next 10/10] net/mlx5e: Use the 'num_doorbells'
 devlink param
Message-ID: <20250910162310.GF882933@ziepe.ca>
References: <1757499891-596641-1-git-send-email-tariqt@nvidia.com>
 <1757499891-596641-11-git-send-email-tariqt@nvidia.com>
 <aMGkaDoZpmOWUA_L@mini-arch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aMGkaDoZpmOWUA_L@mini-arch>

On Wed, Sep 10, 2025 at 09:16:40AM -0700, Stanislav Fomichev wrote:

> > +   * - ``num_doorbells``
> > +     - driverinit
> > +     - This controls the number of channel doorbells used by the netdev. In all
> > +       cases, an additional doorbell is allocated and used for non-channel
> > +       communication (e.g. for PTP, HWS, etc.). Supported values are:
> > +       - 0: No channel-specific doorbells, use the global one for everything.
> > +       - [1, max_num_channels]: Spread netdev channels equally across these
> > +         doorbells.
> 
> Do you have any guidance on this number? Why would the user want
> `num_doorbells < num_doorbells` vs `num_doorbells == num_channels`?

I expect it to be common that most deployment should continue to use
the historical value of num_doorbells = 0.

Certain systems with troubled CPUs will need to increase this, I don't
know if we yet fully understand what values these CPUs will need.

Nor do I think I'm permitted to say what CPUs are troubled :\

> IOW, why not allocate the same number of doorbells as the number of
> channels and do it unconditionally without devlink param? Are extra
> doorbells causing any overhead in the non-contended case?

It has a cost that should be minimized to not harm the current
majority of users.

Jason
