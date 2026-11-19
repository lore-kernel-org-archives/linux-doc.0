Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795102473;
	b=b5UGE8EKX7A52oYkL0qdtJByxVJk3pIiz+XViVYMqiFBFcSBBtZ2SQeeSuMbnq0WVrCs
	 o7YA7GsyBem7L2J/oYFnkRcoVDFHdTwMOjELYp1QWShuD3RA/M41j2dILfDM23SSvop/7
	 dZn5zML7iFxsNAKXuMVoBKAFQ41aGBbxJBTFISTQqUOX9/KF0rAh4Ks+NdplIElK0IWZ5
	 RJ9OQDABLvUrhZ9cSTGaa+2HPDfVbpwKdWLJt6bR5FiGNAj6lTqUxrXcHuzwHZZdXQv9K
	 hWMEWN2Vb58bpdF9JfzNNUC56MlhK40MaR5G610FjUXgA1+THS/zqJFY96qxd3oySUw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795102473;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=9xtf6A+gSw+eWEULB7BZqWqCj4xTiZcT/S7MHr0Kzdw=;
	b=HutlmU51A4u6u+8DAQmiMAB8fREp9y+7pAu6D/SdT2x47RFhmex6eBuE7naBgSNlv51x
	 kcnx8muPyD4ePAsufvygS1TS2i7pI/yctKFKCoby9nHuKW0bQ0G4yytCX/4cjV11hIGRJ
	 ACfugn5+XEhuONR4o6IWfj+RZVoFRG1AYXJu5Yl/EGsTbmVh+lwjz2+jVgS9yy/eSwKKo
	 ZzW36qVlDglBCwb/w2FPGB6yj/0NKfSkTbgUumtHuuaV/bt2PSrUx47KUJ+OSyvOxUATx
	 0kMRDj+trj2Dlg5FDLrXlqTWfqOQzRSKOOB4m/ltDO9hgOJs9f7vz8GeyrWhtzBA7ug==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AndOcRjE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFA2C606A320;
	Thu, 19 Nov 2026 15:34:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BFA2C606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=AndOcRjE
Received: from ptx.office.stw.pengutronix.de (ptx.office.stw.4.pengutronix.de [10.9.0.3])
	(Authenticated sender: relay-from-ptx.office.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id A9979202284;
	Thu, 19 Nov 2026 16:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795102465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9xtf6A+gSw+eWEULB7BZqWqCj4xTiZcT/S7MHr0Kzdw=;
	b=AndOcRjEGmJgH2PpFMAyC/yGcRwlKcqkzSyTOLoW4v7FDba2x0OnE4/xduzokztck14/Qo
	zsMLAazhvve38y/3aL2R9fEGpvVkN1ATCpJV1TkyReygj3q0cZM34YY3m3k5ftsMA+TU0f
	UMlzQKrYwM/gciERsVG0dssXYFv6BBmZiqHEP8ZgvTY8jau6lVhsWou2Qeb8bYiphUJvtH
	gppHQHv4SpA4j/dnh1Fgzoy1buRHF+su+5Pofc48mo1xpRfspHMdOCMHNkXa3jAGBCznoC
	1bN9+2QaS6CyOLJJQCclz4pOJhIle4QPqHMIzgOMY1wamKRdDS1S1yve3zOtqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795102465;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9xtf6A+gSw+eWEULB7BZqWqCj4xTiZcT/S7MHr0Kzdw=;
	b=ZGOmQOZbFqGIDuVB1gM3JviZv5GDzJRLMAnlaiEAtBjbIqcNo/Dlytv5tYTtl9PjWxT7Jg
	uouKZuBZuBRCos0r2J0G5NShgcP6Js8jHehw/01xBNDLF6dPhLShRf6De8esUUXJM0o1fs
	hj9VwZaR6Ppd70dPHGo9JSyqhZVtyeAv0EoSzs4P0GDzOxPmUoJj4VuQiY3pWf+xgzg8Gb
	/EkmFX7L2qEljsZ372883XjLUuJnJONcv7K8F4E9fcdL+xPFEjMaV6apIV593gLjyjeV0B
	DM9+RKHsWfI12vZL5Hap2czT/8buMS1ZyZ7f+/lOlg1pazYDm6ISdMDidLDt1w==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795102465; a=rsa-sha256;
	cv=none;
	b=ILG6TLpalEaDCOExQka7pOUd5BFnY2jnNyKS9/l2Pby2Bw9uXw1sSRSR08KCtDiynaiKPN
	sJC24bC6sKk/Uv42DiKMOeqbv/24+ziXseC159/T/np9M7YDDCaq2SII866p9lqH9ijeFl
	prFx0Coa434kegZgKYYzL/EP9nYpMotpEaxwV/zIbWKMr4C+8w0v1iKolwUA2x0rKhk3Na
	WHXkkuv2Wb84JizTEZ3ZEIbOSbwzVdMfIjMZevIB5BxOg1H7wAisq0pjDf6q1v99XNnZt9
	sQU3s7Y3gPAT2B2SuO7dm3P/bZmfWg3ngaCX6DXIV8qUZpBnt/HjxGr1pa5DBA==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=relay-from-ptx.office.stw.pengutronix.de smtp.mailfrom=ore@pengutronix.de
Received: by ptx.office.stw.pengutronix.de (Postfix, from userid 1058)
	id 933D91BF930; Thu, 19 Nov 2026 16:34:25 +0100 (CET)
Date: Thu, 19 Nov 2026 16:34:25 +0100
From: Oleksij Rempel <o.rempel@pengutronix.de>
To: James Hilliard <james.hilliard1@gmail.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v5 2/3] ethtool: add a PHY receive byte total
Message-ID: <av8XAdXQqSRIVhY1@pengutronix.de>
References: <20261115-submit-acx00-phy-stats-v1-v5-2-ed81a7f54373@gmail.com>
 <37e4b9b8-d381-448f-a2b3-b92d7bd9033d@lunn.ch>
 <CADvTj4qh8Pvss+xEwcjshodwv-yN6haP-9aaeRXg1ydSu5ibVg@mail.gmail.com>
 <d3f2dc1c-9daf-4b5f-903b-657ae3f32647@lunn.ch>
 <CADvTj4opiu_vhat12BRzk61b7ymG+g12c2aoK+rcZHjpWZjL4Q@mail.gmail.com>
 <b84021aa-f843-4668-8172-0afcbb97c27f@lunn.ch>
 <avtHbulALsI61uVr@pengutronix.de>
 <CADvTj4ocz9_rMDbDG1xOPALNw1yx9ypXp0S59sh04wSv_YMyrg@mail.gmail.com>
 <avwPa1MTMjf53lWN@pengutronix.de>
 <CADvTj4q8Yxi3SyS+Uiue1SwwujFcAABTD3+2BsdSwS3fs89wnw@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <CADvTj4q8Yxi3SyS+Uiue1SwwujFcAABTD3+2BsdSwS3fs89wnw@mail.gmail.com>

On Tue, Nov 17, 2026 at 08:55:50AM -0700, James Hilliard wrote:
> This is Allwinner H616 EMAC1, using dwmac-sun8i/stmmac, connected to an
> AC200 PHY over RMII. The driver reports no MAC management counters.
> The CRC and length-error statistics in ethtool -S are software counters
> updated from RX descriptor status, not independent hardware counters.
[...]
> The tested length-field mismatches did produce descriptors and increment
> rx_length_errors. The accounting gap is specifically for frames discarded
> before an RX descriptor is returned, including those bad-FCS runts.

Thanks for checking this. On this board the PHY counters are the only
counters we know of that show these frames, and I see why you want them
to be as complete as possible.

With a MAC that does not count its own drops, it does not really matter
what exactly the PHY counters include. The difference between PHY and
MAC counts cannot be attributed anyway, and for debugging the deltas are
what matters, as Andrew said. So I will not insist on a particular
definition here.

For automated diagnostics, a tool would need to know what each counter
includes, on the PHY and on the MAC side. That would be nice to have,
but it is my dream for tomorrow, not something for this series.

Oleksij
