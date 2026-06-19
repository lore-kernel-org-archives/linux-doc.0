Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA06E33F8BC
	for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781860534; cv=none; b=JVVll4KOb+omz/X+DfHz/MQF/uctB6AWEvxEhxHup9nOLhCNZwCnsRsKWq91m227MaxXG7J3Ax4PtCY1XYFHyI2dd5tna1VOUGc1Vzzh+/p+AV0h3WwqM8fXdA7dEq63v9051XFQ3APuBnYI13vzLp95zeB5dJeoEoRSQQ79Ras=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781860534; c=relaxed/simple;
	bh=ToYjuqrLUN40Tdb6VL9Do4hGOmu/TUx1TU/0PRrGPcg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T94zepLthH/tjJUeOQJK2Gzn0ouBlYZHgq6ETwEJ6u1pgWRvKKCGRQIuJXNbKB7+0nElIi1geXOeBb8FmZSctGMZvom+9uNnE/RFMSWddsdkIlHnXkzK/m4AaxpWYLoOBBa4uDM1tun1+Qn8CYFRvBJjTH7lGSPI34+tT/qkL68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azX3E7vx; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azX3E7vx"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-462342ac290so2150968f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 19 Jun 2026 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781860530; x=1782465330; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=redxzYQzLRKG52vJq98WS9ectvhmVOA5UgA7NvGPOFo=;
        b=azX3E7vxPgvinqhnJ9TQ8WHMkfJG4OpMnr8/v35JKnWuUBbj/ZjLaTKoGMmrT1SOdd
         A2X2Npe4X1mIL31Qz0kaKCYqlMgf2sTMqEkhUDHkV1C7pXMmyMqtSTB4xoJZ3QdeIg7Q
         tvKXGOc4fwNuO2mAmbSM5Ng8XpsjZvjsr6mmdE5B4pebi/BUjOCB1hbytW95o3rH0pa5
         FKxNKfnQaMBK65biiCRyZWN5Gy9QK9E8uZDFrM4N49dtqxLDUXmQrvcXvSHGDqgDfXbq
         1iL1mOcRB9/pblLXfJAoBKMespZ90CkqrwNlfqUCXwsuzSjX7UHJ2SgDlix/Xw30r9G7
         3FYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781860530; x=1782465330;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=redxzYQzLRKG52vJq98WS9ectvhmVOA5UgA7NvGPOFo=;
        b=I/6WW8N7TLP1aJY6l0S5jC/OXVG424ncsOh5u9B7iRj/L6L/saT0OsSA9NemqqRUFx
         Tq4KOofgEHPjU2HEQqESp7rOilcm0i4JkU9jlXkbDyZwMPxL98IAoQnfrRG4/7NVludx
         bwFlFZPp7Ei3GnqeIFcvA9B3NuxAuKFSfBjLxvZfwJjFiEACVew7MJKu+3E4wCoNcRmW
         zOp3wX70cx4ZPy57uUXIIbV8Z4BTrC+Jf3sVOQrlIQHWKUwC2T/xGMAiwxbtQmUvgiSE
         WYoycMWJvYXFjZ8cxa0mQDCqK9QjH7pu5/opGpLT1P20v0RGySrxMf+Yjpwk8DK8EhJY
         77rQ==
X-Forwarded-Encrypted: i=1; AFNElJ8n9Bu81dp8565+i217PV/9UFIjDoz9Qb+CIhSCYDDadlgjDXj+mYXArl4kK7MCFr7/3x3xvZ1sxNg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+viGzAhM97BEf+qIeMOi20vDz4nq0BiyO5JsisWAz+P2iMSpb
	QFIv1piC9HhAurYVnNo0uyk1Wcv5GvaJ9f9v0wCIp2M3C4UUPZTGYntp
X-Gm-Gg: AfdE7cnkTcPXUOTzL9Jm7e1n6UQT/7xlBEUBEygYTBSWh6+5oCnJ41dv7BJC4U/ZTqR
	e3NYV1hyywUtDtiiWnfped/H19NjOyuso7myzJBYQ5h62ZsN5BO+GH3JcppC8Ddcj08uFZVcN9V
	1Y/zc6mwFkqiNtNvpvNl5IfbCuSFqObMYeLmjBGCH6Upueet2hTUXSxnkEo0cslob+y4gb8fWgl
	XGB+tevAirtSAChjNZdA3fiqnJZAG27E1uVWRgCzFLVxqn1YZ0CsXvE/WkohlSrhcS9Z/rcWIHK
	Y2yBWdAhhs4CSLgAZtdJAhlJtmifQIcfd/NXv2FNb4eJy/OnB69a9rLF3Ku6T4TxsZns3dnyqjY
	AAW0Qj5GrZ4wUI0Ihr6MKRU5FB6D5zrPk+udb9mmTihXbzTgjiglUEsTBz+AZFzN9Qjv1JhTucY
	ygyshl
X-Received: by 2002:a05:6000:605:b0:45e:ec27:b4b0 with SMTP id ffacd0b85a97d-4656c792222mr2571640f8f.18.1781860530015;
        Fri, 19 Jun 2026 02:15:30 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-46508a04c15sm6484050f8f.3.2026.06.19.02.15.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jun 2026 02:15:29 -0700 (PDT)
Date: Fri, 19 Jun 2026 10:16:31 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
Cc: rodrigo.alencar@analog.com, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-hardening@vger.kernel.org, Lars-Peter Clausen <lars@metafoo.de>, 
	Michael Hennerich <Michael.Hennerich@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>
Subject: Re: [PATCH v6 06/16] iio: core: create local
 __iio_chan_prefix_emit() for reuse
Message-ID: <ajUIRHZZOKgdyGu4@nsa>
References: <20260618-ad9910-iio-driver-v6-0-79125ffbe430@analog.com>
 <20260618-ad9910-iio-driver-v6-6-79125ffbe430@analog.com>
 <ajQGTQ1_qcOwfzne@nsa>
 <x3aijvc4buo7aqbchikuoyyrgiq3afidtkla37h2rg4tvfdbc3@h42qp3estg2s>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <x3aijvc4buo7aqbchikuoyyrgiq3afidtkla37h2rg4tvfdbc3@h42qp3estg2s>

On Thu, Jun 18, 2026 at 05:14:19PM +0100, Rodrigo Alencar wrote:
> On 18/06/26 16:06, Nuno Sá wrote:
> > On Thu, Jun 18, 2026 at 02:27:22PM +0100, Rodrigo Alencar via B4 Relay wrote:
> > > From: Rodrigo Alencar <rodrigo.alencar@analog.com>
> > > 
> > > Move logic to create a channel prefix for naming attribute files into a
> > > separate __iio_chan_prefix_emit() function for reuse.
> 
> ...
> 
> > > +static int __iio_chan_prefix_emit(const struct iio_chan_spec *chan,
> > > +				  enum iio_shared_by shared_by,
> > > +				  char *buf, size_t len)
> > > +{
> > > +	const char *dir = iio_direction[chan->output];
> > > +	const char *type = iio_chan_type_name_spec[chan->type];
> > > +	int n = 0;
> > > +
> > > +	switch (shared_by) {
> > > +	case IIO_SHARED_BY_ALL:
> > > +		buf[0] = '\0'; /* empty channel prefix */
> > > +		break;
> > > +	case IIO_SHARED_BY_DIR:
> > > +		n = scnprintf(buf, len, "%s", dir);
> > > +		break;
> > > +	case IIO_SHARED_BY_TYPE:
> > > +		n = scnprintf(buf, len, "%s_%s", dir, type);
> > > +		if (chan->differential)
> > > +			n += scnprintf(buf + n, len - n, "-%s", type);
> > > +		break;
> > > +	case IIO_SEPARATE:
> > > +		if (chan->indexed) {
> > > +			n = scnprintf(buf, len, "%s_%s%d", dir, type,
> > > +				      chan->channel);
> > > +			if (chan->differential)
> > > +				n += scnprintf(buf + n, len - n, "-%s%d", type,
> > > +					       chan->channel2);
> > > +		} else {
> > > +			if (chan->differential) {
> > > +				WARN(1, "Differential channels must be indexed\n");
> > > +				return -EINVAL;
> > > +			}
> > > +			n = scnprintf(buf, len, "%s_%s", dir, type);
> > > +		}
> > > +
> > > +		if (chan->modified) {
> > > +			if (chan->differential) {
> > > +				WARN(1, "Differential channels can not have modifier\n");
> > > +				return -EINVAL;
> > 
> > WARN() looks too much to me. dev_error() as we're treating it as such. I
> > guess you don't want to pass struct device but not really an issue IMHO.
> 
> __iio_device_attr_init() also used WARN(), probably because it didnt have
> access to a dev pointer. It would not be a problem to add an extra param.

Hmm, fair enough. Maybe a chance to change it. Not sure how others feel
about it.

>  
> > 
> > > +			}
> > > +			n += scnprintf(buf + n, len - n, "_%s",
> > > +				       iio_modifier_names[chan->channel2]);
> > > +		}
> > > +
> > > +		if (chan->extend_name)
> > > +			n += scnprintf(buf + n, len - n, "_%s", chan->extend_name);
> > > +		break;
> > > +	}
> > > +
> > > +	if (n > 0 && n < len - 1) { /* prefix termination if not empty */
> > > +		buf[n++] = '_';
> > > +		buf[n] = '\0';
> > > +	}
> > > +
> > 
> > Can't we handle the above in the caller on kasprintf()? Then we could
> > simplify and return in place.
> 
> I felt like doing this here would get a cleaner logic in the caller, which
> would have to add the '_' conditionally.
> 

I think it makes things more clear in the caller given we return n
anyways but I don't feel strong about it.

- Nuno Sá

> > 
> > > +	return n;
> > > +}
> > > +
> > >  /**
> > >   * iio_device_id() - query the unique ID for the device
> > >   * @indio_dev:		Device structure whose ID is being queried
> > > @@ -1100,106 +1159,19 @@ int __iio_device_attr_init(struct device_attribute *dev_attr,
> > >  						size_t len),
> > >  			   enum iio_shared_by shared_by)
> > >  {
> > > -	int ret = 0;
> > > -	char *name = NULL;
> > > -	char *full_postfix;
> > > +	char prefix[NAME_MAX + 1];
> > > +	int ret;
> > >  
> > >  	sysfs_attr_init(&dev_attr->attr);
> > >  
> > > -	/* Build up postfix of <extend_name>_<modifier>_postfix */
> > > -	if (chan->modified && (shared_by == IIO_SEPARATE)) {
> > > -		if (chan->extend_name)
> > > -			full_postfix = kasprintf(GFP_KERNEL, "%s_%s_%s",
> > > -						 iio_modifier_names[chan->channel2],
> > > -						 chan->extend_name,
> > > -						 postfix);
> > > -		else
> > > -			full_postfix = kasprintf(GFP_KERNEL, "%s_%s",
> > > -						 iio_modifier_names[chan->channel2],
> > > -						 postfix);
> > > -	} else {
> > > -		if (chan->extend_name == NULL || shared_by != IIO_SEPARATE)
> > > -			full_postfix = kstrdup(postfix, GFP_KERNEL);
> > > -		else
> > > -			full_postfix = kasprintf(GFP_KERNEL,
> > > -						 "%s_%s",
> > > -						 chan->extend_name,
> > > -						 postfix);
> > > -	}
> > > -	if (full_postfix == NULL)
> > > +	ret = __iio_chan_prefix_emit(chan, shared_by, prefix, sizeof(prefix));
> > > +	if (ret < 0)
> > > +		return ret;
> > > +
> > > +	dev_attr->attr.name = kasprintf(GFP_KERNEL, "%s%s", prefix, postfix);
> > > +	if (!dev_attr->attr.name)
> > >  		return -ENOMEM;
> > 
> > I don't oppose the change. Looks like a nice cleanup. But bear in mind
> > this very sensible as any subtle mistake means ABI breakage.
> 
> Yes! I tried to be careful... this is dangerous stuff!
> 
> -- 
> Kind regards,
> 
> Rodrigo Alencar
