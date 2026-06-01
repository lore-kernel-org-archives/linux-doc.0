Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 972F038F639
	for <linux-doc@vger.kernel.org>; Mon,  1 Jun 2026 09:16:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780305399; cv=none; b=CZWDOUtDMJJYASCZm7SHVynh0HEmVMpSnoq2TCgrs3kdWPeq5feCdnbZLW11A7eAIQyESxbJ7A7q4cIv9d8Kcct4FtQuC/8YWSs1cZxNYmkLMc8GvldozGNpTL335l58hKmiVhYll5xZ+epZdYLzo5te4UVwCbWqJ5pNfymUrzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780305399; c=relaxed/simple;
	bh=MAv2G3iNIINHmtBP17XT2WWmP/ezoDjjO/TPWJIsdX8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aulazHvfnT3K03scapnC9hXR2eXRH2uAf1e/+vshLMslNWxLTwzo7bTvz4zI+/1o2KpiYbcZyeJV5/QCWlXirDX2MspQnyWmxACrbSMi59wOWssjhJzFeaDz5hoeA0HhgTBkjp6ehmpL6tRYZw9eQ1CC10A96cSQKsfWwvlu274=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TtgKpihU; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TtgKpihU"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-45ef616daf6so2447145f8f.3
        for <linux-doc@vger.kernel.org>; Mon, 01 Jun 2026 02:16:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780305396; x=1780910196; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVfLkZhdjxtyOU1OcAKjYEFf7E85v5J9aWNUt/TDql4=;
        b=TtgKpihU+YKQ5DRtFlrIH9TP8b8ZFcqj0pYrTLdN8BXmdSGl9WEguhxSog3fjMky8b
         NJcMIUfUJKjOu0k9OO6cDiLyIzB1XLLaeS8J9RWnnzOECNDHyhFdJRhYIhuak7dekJrq
         +Ot5+vmjWgVqG/OpCupUnw7trEj+OmZgYGE7UTk6th9Dyg/Dy9YmCSZ61E6I9R/p0GLK
         U+Skcy5DWpDEAfZYwvmSftdjFNMB7ZOEKwwtO9uyaUGQ5hu9AkACRJ1QmpRpX8EIlvZD
         aJMRw1V0HCF4Cgx6LKj9NDdTdjSEvYcrrJu8+FzIwQTzvzLagS06LIi2Pe2BE0E4+h20
         v4cw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780305396; x=1780910196;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVfLkZhdjxtyOU1OcAKjYEFf7E85v5J9aWNUt/TDql4=;
        b=XnqV1Fakda4ufpYifExLXDSkF8XKw1PpSJ22AZyeVycgbz6OOYMnvYIjhQD6tPt0Ay
         xaHFqPeSSNlWfjXs4BA4TSqrG1dF+Yuo0K6qKPWzq5z6DFrYuWQ2cBMU3tfC3CHqQcXp
         59uZO64yhL9i1hrkuMIAGadKia8ASeRrtuEcuecYhV9EeZh5mpS+ZG+qY260723QTJCl
         +WNwOmwqfLHiaphPi/yVNw7RpAOOqncGL5V1LngB0HEQYlvCRuwcxfUeq3u0UbBXwdeU
         MBePU0XdZQvIrFrPZbklugJ6SJvGJ5ryrgn6uApEUAmiDj6AxJKTU0S8KyP/cG1sg2wi
         4i4w==
X-Forwarded-Encrypted: i=1; AFNElJ9JF47wHmP2BzcLJt7GxzWxLhFz2jmCK+YaTn4QQNT+Peq0EO+3w3jXk7bhZ4M1YWtiWsopY9Z5Gmc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxZkP8eNebBFmNFHsedkXEScMlbAtaJlJuHdOTsvlpSx8VJdu/6
	p1z2Tk5u0ZmKXfp9Od5ya45iEGn0Vy1BqiI+WtNyGPmJPhouHRdFDGCm
X-Gm-Gg: Acq92OFXYg5w8pfE0FPc+bgDW+EOzhY7FJfu3EoVMYT4EqMB8aFhqpRZDEYAlNJBUdc
	hnPb+LPJXX8WXkrmPg1+uIC0dHhDH7eF+X0CJHckh41cU9L+YN0V/ok1B7d3dMpWBtvLjzzcVZu
	0h05KWVsimO6aakCW3zK5B93SXGSOr8zh/VnbUx9tqtGxB+Vbwadaulv+xbi/ZBmPyOFulCp25v
	r2wM6QGqjCInOME4bPJD/NqF3iGvFf0dgvExpLaqELmBL5fbwVnqKoJZp09AUqmF9rDEFmmzaaO
	NYgEYf7x+YAMwhgi0ZLKZxPas7Gg8xh2qKG7i6oeyrUv53mYdcFeHmNe6P+pLKedK5uBnJ8rmk/
	poMx8gkge8my9O7VWuCUjlt1uFF4BALKDiNrYeNwupiI38rUFnpR5LmXFo+WmGc5bG2xaTQr7fR
	4DFGh0ypDFYw7lR2z5GkXfNuJqPL5Zp7S/R2fM
X-Received: by 2002:a05:600c:190b:b0:48f:f64c:c2fe with SMTP id 5b1f17b1804b1-490a298f29amr176335025e9.22.1780305395689;
        Mon, 01 Jun 2026 02:16:35 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4909d6eb4acsm231582545e9.9.2026.06.01.02.16.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 01 Jun 2026 02:16:35 -0700 (PDT)
Date: Mon, 1 Jun 2026 10:17:33 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>
Cc: ciprian.regus@analog.com, 
	Parthiban Veerasooran <parthiban.veerasooran@microchip.com>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Heiner Kallweit <hkallweit1@gmail.com>, Russell King <linux@armlinux.org.uk>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH net-next v2 10/10] net: ethernet: adi: Add a driver for
 the ADIN1140 MACPHY
Message-ID: <ah1NRk7Xu-ItYbgb@nsa>
References: <20260527-adin1140-driver-v2-0-37e5c8d4e0a0@analog.com>
 <20260527-adin1140-driver-v2-10-37e5c8d4e0a0@analog.com>
 <ahlY8WSRO_HPmGtK@nsa>
 <a272f9ae-1958-456f-b177-7c966694c047@lunn.ch>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a272f9ae-1958-456f-b177-7c966694c047@lunn.ch>

On Fri, May 29, 2026 at 03:03:58PM +0200, Andrew Lunn wrote:
> Hi Nuno
> 
> > > +static void adin1140_stats_work(struct work_struct *work)
> > > +{
> > > +	struct delayed_work *dwork = to_delayed_work(work);
> > > +	u64 stat_buff[ADIN1140_STATS_CNT] = {};
> > > +	struct adin1140_priv *priv;
> > > +	u32 reg_val;
> > > +	int ret;
> > > +	u32 i;
> > > +
> > > +	priv = container_of(dwork, struct adin1140_priv, stats_work);
> > > +
> > > +	for (i = 0; i < ARRAY_SIZE(adin1140_stat_regs); i++) {
> > > +		ret = oa_tc6_read_register(priv->tc6, adin1140_stat_regs[i],
> > > +					   &reg_val);
> > > +		if (ret)
> > > +			break;
> > > +
> > > +		stat_buff[i] = reg_val;
> > > +	}
> > > +
> > > +	spin_lock(&priv->stat_lock);
> > 
> > Maybe consider using scoped_guard() and similar for other places?
> > Marginal win though so up to you.
> 
> Please trim the text when replying so just the needed context is
> provided. It is easy to miss comments when you need to repeatedly page
> down, page down, page down to find something.
> 

Sorry, I trimmed a bit but I guess not enough.

> > > +	ret = register_netdev(netdev);
> > > +	if (ret) {
> > > +		dev_err(&spi->dev, "Failed to register netdev (%d)", ret);
> > 
> > If we go to devm, this could be return dev_err_probe().
> 
> dev_err_probe() is not really about devm, but handling EPROBE_DEFFER,
> and not issues an error message when it is not wanted. I don't think

I know. I mixed a bit. I related it to devm because then we don't need
the error handling and then we can just do `return dev_err_probe()`.

> register_netdev() can return EPROBE_DEFFER, so it probably does not
> apply here.
>

And the above is a bit why I still like dev_err_probe() even if
EPROBE_DEFFER is not to be handled. I like that we can just return
rather than:

dev_err()
return ret;

Also it unifies error logs with the same style (for printing error
codes).

- Nuno Sá

>     Andrew
