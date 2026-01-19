Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D07364EBB
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 13:10:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768828221; cv=none; b=lQR12MxwzDDf68gq8bB1HKL+qcg1ujp7B3wo16Jaw7joS5uYoxeStYw78uRgDCZYQ1aKEvVGfqpsJ8eNyd0jfi43mVIjnZ42dql3pW/rfri+1p3WkBIpaPxQQBSgX/5tRWeHUo7TZpiKuiRFM1zfYsqFZZxcKDSTGNXUmR2SnCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768828221; c=relaxed/simple;
	bh=RbIznMFxyjtdscNIHV+mpdQT2F/p5a92VpVZkbRVgCw=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksWKkVouCoHYlbZp1kjMLcpAdyrbln7bQBiY+pznoDqTVCMyIZRR+Vavcjpa6cNNPMovdMAReLanM3A3JCTj4lrTcJtT53q8zj5/PLZAy4febgPiVOc17tEab7KQe6kmGhD+hq0g3h3JolfGGctDSvrj37ix8fjyA/rCE7O7HHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XztQSOuu; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XztQSOuu"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-88a35a00502so43371496d6.0
        for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 05:10:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768828216; x=1769433016; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=As7ad+RroQjVUHt90+2p37ZNFr3kAcDjR6210U9k6EI=;
        b=XztQSOuuNQ7SiY4+8EUkBdNz9etJRK8wNQQ5Ackw04WUt/HEg6EGhJ1i3V87lvDAaL
         HLfJCiRoONq40qKZF3/81edrGdxkvcjZ2pjSi20Qzh56KhnSc422yhr/i7Liw7f6cUOg
         zyG2wQkewsPgGu7Ndj3MBp3Rsmh7HjMlRhEZ1e2KkNwro1u2jn+rkDGA/j9H85hdi2cf
         fF7j8H4rlw1LqVWcZ4IWOlcx1PX9ymHpDVKAINdpC+Vp5x5gEpk7M4L5em2mOCq3t4vo
         UAooLkn2G94hDhgtzFGgwavP1zWRNHxH0JJgt02whRZKlftNvy+L0wOsL6QHBhSiFa8r
         BtDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768828216; x=1769433016;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=As7ad+RroQjVUHt90+2p37ZNFr3kAcDjR6210U9k6EI=;
        b=giXRfcuJLnZAa0XDz6BJJVasMoRPdjBfx0KnE6TbouISFQk01M7AIBobRikncr+fiW
         BOUz1TRCAQtI/Eqzfaqli2iVZXKIj+XePJPFNOuvYWqDqPVlQzNgDGH/aQGP5oEazNV/
         yqjbbAGT8z9RkodXmhwXtDqMHtWTs8yeJJ7YB1r52+rVun/WWXTFrWgQ0jrMedt1P5ct
         b/w4pTtDSMRFIAgDWNHxQE+sjOCuu+0i9vE0xwlWi/1n5gEdzBsunkEMLUs036eL2X0M
         J5+TkGz1cpJ7KLi4CZIClM3sxldkDpSfPEzfWfP75BQmn9FYOyc6ANr492rA7nfa+9OV
         Cxeg==
X-Forwarded-Encrypted: i=1; AJvYcCVOpfNzYhu6grhVMIvWnKK79vGT2JtWBB1KvLPyRYeFWJYNt4m2l5bEqSNLd55nLqhje+IuNJeHDUE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWDRJqQA0bnEFnpwPcZulQZPuagUySK9kIAK8iF15zGYwmU2EV
	LvtxloesbimECZaDjC9RkHQ4Q3RiRIMGhKjqFJ8Mv2uuHjft3WH+JiVE
X-Gm-Gg: AY/fxX5go15wYtflYtqK5voTzy9ZJo+x8qg92S5dEc26bx53avaxwYO+8ePwGvV3KoI
	9uS5dp9Ma6rsEecLmzLRJAIEQXmqH3XxyVbwLQuQzHch5UasXZ+y/9koIwc9oG8zLvMxp9T3Acj
	qbL51FA7zBaAo08519Dvic+CyWDIrSPGxwzSpUFCn4kxoBQsNiRID0HrLh27yt5/mTh+nk57e2s
	v/LBhUzDv/3DMqog7jMtGRQy3iE25B1qxUnUm6VyHP0LjOmHz8kIzj4y4oE5Sx1dpcR3m/Hvg9U
	jhJlno6fhZ0gt/GdR5IJ3SKnqro64J7PW2Sv7oAIdsLYBdzVAKxt7TJaxP76YQ72tdr8dZFf1YN
	jVwFXiZ63ef7KFthuwpFA6XuToNdyaqDfETxZw9gZWIL1EVFSjMX9zgT/kQ0A2vz6QkT8Gptute
	Ikf/++X7EPJHLe1s2rAGdk7cT1pv2rYu7Fjbcv4wGBh11oItP8dv5Uu3M79L2CfC4/38IIftNFN
	fDF
X-Received: by 2002:ac8:7dc3:0:b0:502:9f6b:a3b3 with SMTP id d75a77b69052e-502a1e60bbamr148654691cf.37.1768828216161;
        Mon, 19 Jan 2026 05:10:16 -0800 (PST)
Received: from RDEALENC-L01.ad.analog.com ([24.206.116.131])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71ad820sm774437585a.10.2026.01.19.05.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jan 2026 05:10:15 -0800 (PST)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rdealenc@rdealenc-l01.ad.analog.com>
Date: Mon, 19 Jan 2026 13:10:09 +0000
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: rodrigo.alencar@analog.com, linux-kernel@vger.kernel.org, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, linux-doc@vger.kernel.org, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Subject: Re: [PATCH v4 3/7] iio: frequency: adf41513: driver implementation
Message-ID: <fv4kgfxqgzrw2yaq3vv5g5douyer4ocqk5nloi5iwxc2aueby2@vswsu4jxz6xh>
References: <20260116-adf41513-iio-driver-v4-0-dbb7d6782217@analog.com>
 <20260116-adf41513-iio-driver-v4-3-dbb7d6782217@analog.com>
 <20260116192916.436d24c9@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260116192916.436d24c9@jic23-huawei>

On 26/01/16 07:29PM, Jonathan Cameron wrote:
> On Fri, 16 Jan 2026 14:32:22 +0000
> Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
>

...
 
> > +
> > +	cp_resistance = ADF41513_DEFAULT_R_SET;
> > +	device_property_read_u32(dev, "adi,charge-pump-resistor-ohms", &cp_resistance);
> > +	if (cp_resistance < ADF41513_MIN_R_SET || cp_resistance > ADF41513_MAX_R_SET)
> > +		return dev_err_probe(dev, -ERANGE, "R_SET %u Ohms out of range\n", cp_resistance);
> > +
> > +	st->data.charge_pump_voltage_mv = ADF41513_DEFAULT_CP_VOLTAGE_mV;
> 
> This leaves some odd corner cases.
> If DT defines cp_resistance but not cp_current then we ignore the cp_resitance.
> If you want to insist it is either both or nothing, that needs enforcing in the dt-binding.
> I think I slightly prefer this option..
> 
> Alternative is define a default current such that the maths works to give the DEFAULT_CP_VOLTAGE_mV
> if both properties use defaults and use that here + document in the dt-binding as the default
> for this property.   That may mean if only one property is set we reject the pair and fail
> to probe.  You have comment about valid combinations in the dt-binding so that's fine.

Understood. I suppose the following in the dt-binding would be enough:

dependencies:
  adi,charge-pump-resistor-ohms: ["adi,charge-pump-current-microamp"]

as current can be defined alone (it would use the default resistor value).

Kind regards,

Rodrigo Alencar
