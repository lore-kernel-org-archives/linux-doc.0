Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333155;
	b=pmNCXtyiJLS0aKoryPprzs5oIwFwxKimxjCI2X+Rq4NPOrmNwcYmHdpCmaMxjiXQZxrK
	 T3oJDzQmQEvrkMPbm3NCEsAgTStlSF1T+Eu4LiPIn7zRcc74mSuZ57DDYfThaIuQz7sAP
	 UDSToU6bsMP60sBjI4UvorsdVp8aHCimGi5IdDMJOC015bOAfEEI9zv4JV+/3BmxEMh8M
	 1MRuzUjhujU5Qaip+uv1YUv0rs594uooK97NBaMXLAv9PvATE1C236uwoL1fWS7CfGlVF
	 QmNGqMkpiqU8ZUIcHCvVGMqX5D/9aY9on/Lk6YeiyFeflX83UnhO7uLU/8qi46j0wDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
	b=KWXlO/8tSledikKaUSZNijGT1LURAQslEv8/slCW9ctGlaZr+TvavJtus0FzFMdgNpDx
	 rmlsgDo301d0CCvFlf7jWxWWzA4rTJSI/+wHuAGDCkjwC154XLcITbsBSwNn1N4PlE/oJ
	 OQqBTaJz15fVDe4+I1DV3flvu7rYagv2IVu84f08PXwKqIh5gk4VE43eHp6pT//VvAwZ8
	 g7caLHeARzQaJqAokCV/MX0DkHWqy/XDVqe1ggUP0xCVjPU+PRmJBILv3srG6a+TCxacf
	 RknEiLTKjx2e62qEGGtvwupts2Pp2zkfHEHObkz30MY/lq04NTpQvPiiEyzDept8BHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b="cZUI88/L";
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E806F606A325
	for <linux-doc@vger.kernel.org>; Fri, 30 Oct 2026 04:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E806F606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=cZUI88/L
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so519847eec.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333154; x=1793937954; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=cZUI88/L9F1F6vaHkoJiPubaFvpBx9ZOZoFIH4WzYEl9uT8+1501kBXRQ+iQnW1rG/
         4Fw7u6pK2bhGr83aiABmILWeko3myUezgpD4yxFu1q8ofu7DAw3nd3xwaeMW+dOR7WjW
         fF2I6XSi4uBYslctXHDwkVQCwzAYXH2+VEB4ld4ijUFXCUVYiKPoDWGSOArpmY2b6MgQ
         9ZvnqUJjjMcJdZxPtAbFTkDp6O48lwLVb7JSCvyQcehPpzJbJ6jeHUnZCR3iOiOfxhs1
         cwBXgsfbLoMorO9ZFOLAr33BI+k9rnycgZilL+r2ECnd+fRbSczk3whlomOJkp24wZFS
         GQAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333154; x=1793937954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=2AUS9On7zkBsVFPDMWgwa1aOWO3dsLWtrnHR2o8v1wg4bjZjrfLAacvD/2WLZb/Fma
         HwA/wpG4aYUItWD+hYZPAN8wAJYyx/2VUrpQQVUAotyHU64UkQagKSiZhR2DM9SMrHcc
         m++kTxZn6y/HK3H6hKy8S4TTsa530Eljwwuk7rACQGkMmGefMhj1AniatTRnHb8H/A1h
         CRQ4mMBhA3RZgBCtdejoPU05Cfnw7BGHanBDPApVsMWsb1Cevxb1+Pf2xO61pDFIyKUx
         gPH6zu5oob0cC7oUotYi+qXNx3OTl9/5bpQ++eFZslQQi81AjpFqPZsTCbD7yMPA1+Hd
         ogiA==
X-Forwarded-Encrypted: i=1; AKwUvBzIAaDAR71uG8SeWolhDglzz5buhWsOzljGYjX0lfNdYXb8VDTkhutaczxiMoZZhN+DwjXR9Gwg+Hc=@vger.kernel.org
X-Gm-Message-State: AFq9FYLheC5swzBOFWO0JETD/zcppvAeZe0O/ho0hHAblMPJQPd2oHpK
	Ng+theONxe51rVZhbdb0siTqnRtlL67EO+tezEEELt72VOXIIQNYduTAyML87i3n1vw=
X-Gm-Gg: AYBFou0bZIfzqEocH3x9lS0I00e7g+XPRIxI8Id0tjPtc455TbWTSCYNgc2unnSg1o+
	/OTbcb8O8w1WPpPmwzrmq5kpR7cGbXjl9A2Y7ZFwVzL5Jpj6JRdgcv1oPlJpJcSnJVkPTZCyFrQ
	JqgBqOdAPS0ZmRnBgMLbE6IxcjS3bPmPXd+sZXj8DGaAV2GL1Y5JB0MArSrzx4vfX3weFNQfXbx
	OA3zA1AIrm9ECOLX4OAF4v9SPtb3qW3MIlqEsNte/IAb1bWH5m87dx1JXFfhi1ET0Ypuu+AFRCL
	1+ZdLSJfHwYUwROmfU1AbRsOgTopf0wvNc93jTHdwLrybQZ6nR1mNpYNG3JSNCWa3NVlyys9tpm
	3r5aQMKpAPi15zrPBVjvMncm7kAQgN9+PJTLhMj1f1udKkacdlPSWSWGAljCJS7MBz1z2EDJoXO
	2WxgPL2nB+TnGb0t/XYvT73JGdLNp8WccNVYKCI1zkQxsr4RDsCAh9LF4ii4vdCMO2UNyUAUBlT
	qgkEN6oqHAeKbg/+mWcvR+/cdYIoErKvvYjDBMoAmFYHG5CdmubDGLpohQu5TioOBfnpyKQ+d4d
	t1w+xQzxqz5wrOv/ZDer8tQPgDDzHbk=
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr1772736eec.24.1793333153319;
        Thu, 29 Oct 2026 21:05:53 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm3512579eec.15.2026.10.29.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:05:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:35:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
	Sumanth Korikkar <sumanthk@linux.ibm.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
	llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
	linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
	xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
	amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
Message-ID: <auQXnep2xKpuNJOF@vireshk-B250M-D3H>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
 <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
 <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>

On 28-10-26, 16:39, Rafael J. Wysocki (Intel) wrote:
> I'd expect the driver core to pick up the series as a whole then, so
> please feel free to add
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
