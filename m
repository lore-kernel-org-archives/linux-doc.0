Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACB1B2BE7AD
	for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 19:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758311548; cv=none; b=rptIA64t/rBeWJubeo8dMSwQ1PeXcClXH18Hrj/3b65x2NmrbcEpEf2+XzLVbrilo2vgJ4kjYftX1JKgAsh/+/oGWpAkDA2ubp8W3jQZ+HrZdpDsv7ulupo50SrbxNsD+OBZjMYaGDCCjcLIuj1zqujom7PzuS2wr+Y5j7hYJAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758311548; c=relaxed/simple;
	bh=7BNN/+6O9B5eINKNRJxGqr5Cq/Dm4JwptewHXdKQIbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NGFEm0+pOvOFxC1eKZ7IRs/gCk5HsvSSbHEpzl7bnlYpxegEgZJiNbSC8ewtbO71vEy70eanEifX7N4t/veVl9L3tCZMirI1AP6OkBBbr/Pd2s9AizWDSoOSBvy+TkEMV5Wp8UrhNac2hClbDtIYRlzmuySXdMy2Bki+BLjMY1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XguB15u1; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XguB15u1"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-267fac63459so22935285ad.1
        for <linux-doc@vger.kernel.org>; Fri, 19 Sep 2025 12:52:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758311546; x=1758916346; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0ksb2nXkV2vduJHijEyrj53A5/36Sjs0B083iUbWv3U=;
        b=XguB15u1tXiIdmYjedxVhyM0Oa7/Wenq1kXtTjBgdhq/bitlSZyFGKX4Q+UgFqfJ9k
         MXTA3uOZdFl82hdGRXb+JNjwMkjVgkE3YtHOtHezpbTGHnctwgO9P0osXw3dFFAHoiHu
         NIWXkzN2pnbupFhgxgCdLB45xSUP8EJ7DZHm1+y+k4BY3C2CRSnCCyHY/P5jPjbs5p9P
         qhQrexH7god+RJR+uKGX3dbaxy8Fr6+/Cu6Y6lQiXAo3wlxlZc5goWZgvIem9FnO4poO
         I1zzUASdin2Nf+kuav1c/tnQQQnGf1RVZnNC2T7pIC5TTM21Q7Uj0viPZk0waPADzcxW
         lqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758311546; x=1758916346;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0ksb2nXkV2vduJHijEyrj53A5/36Sjs0B083iUbWv3U=;
        b=N4d6NvDVRTWJ8UAdZdcY/pycIsgBpiDxi5QIQJON+euo2PaMxGez3m4SmF8jt+QgA7
         YO0z8/wtQnMJCogAy383oe/NkQsXhUwj6+ccvPSBI0iAmUcdUeA5Dw1p31PSM5VXQyUd
         3yoS3IDaiCIYsrjzL7CYurnJ79hHvXPb878oSUzCn6qaJKy1q4yFf+ywjuXYl/D+nkbE
         SRnSZC2b9AUclhXBLxRvKn/eZzgeAgqw8eEtGPnHgnctxt3Dt9fEQslgH1DkKcui02V6
         PulkOzcFGs1pa2GcJw0Lt6i/K8732VOvR43v2ufzT1WvjCeLpgWi+D3oiLDPK9tqMQD4
         fong==
X-Forwarded-Encrypted: i=1; AJvYcCWX0+1x7A6AFP8G3tjepzW0Yc9oMOXCTs90IyYGv8mcgSrtx3gZogu/qVLnqbgNU5NlGnTyihgZHqQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJYRq49ykiyxG/7Jhoq3XNZkaXUkDNd62kSkzQCi6bzg+aBVBl
	kenCPbiyRq5QTvGHThKDoS8vImTqDTs9zqnNH1mBVhG+upYfGTKr3IfQ
X-Gm-Gg: ASbGncuqaEU8Vweh8nPbIM5Uo9zs5vEc2wfWD/DEDcVtkN40x2Jmb036Qaa6hfaP6QR
	Q1wjv3XFw9kv0Cd2Q7zeF693SUuu5M2cSJFtTFx4KdygJ1cCZgmutRjpe3+FmVyqz8pxdblL8CS
	H5i5YAzwoCdS/J6+kDhi8qVBiVN0wUtuPMnFAAoH2wiDLEgBFuXE4RBl7LkqixpukipIo7VbfVA
	mpcdCDz/KNSfjsJAnRbrAABKDiqOi9DZaZ9I86+0AAjE7IUeXvFy0RbDG9QPcAIeacHqjwgaBUM
	RObik+jB/+B2SEvFg7ix8zofOMct2dW50qFGxFtveMuvVB8ochdEx6r42tDFVyK1A10Ew4V7IQh
	UrFAD6I44DY6qDYrkOwBTmbM3woneF8k=
X-Google-Smtp-Source: AGHT+IHYbvRT0GxDchBu+SAI5IC3ONMAwpARuUEl29/WtzEddjc5bnwSs5bvc5dFwtpfoAvT/5aEWA==
X-Received: by 2002:a17:902:fc45:b0:269:4752:e26a with SMTP id d9443c01a7336-269ba57fa03mr73047415ad.57.1758311545931;
        Fri, 19 Sep 2025 12:52:25 -0700 (PDT)
Received: from localhost ([2804:30c:b65:6a00:ceaa:2ed0:e81e:8f51])
        by smtp.gmail.com with UTF8SMTPSA id d9443c01a7336-26cbd206904sm21775175ad.0.2025.09.19.12.52.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 12:52:25 -0700 (PDT)
Date: Fri, 19 Sep 2025 16:53:09 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Conor Dooley <conor@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v2 2/8] dt-bindings: iio: adc: adi,ad4030: Reference
 spi-peripheral-props
Message-ID: <aM20pbc2XAYq88BN@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1758214628.git.marcelo.schmitt@analog.com>
 <5c1c448e3e731fc013e1e3b3fdcbc31f806d41fe.1758214628.git.marcelo.schmitt@analog.com>
 <f7d7f400-cc43-41d9-bc97-39d308363f14@baylibre.com>
 <20250919-paramount-headstand-c9b5d4d03c58@spud>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250919-paramount-headstand-c9b5d4d03c58@spud>

On 09/19, Conor Dooley wrote:
> On Thu, Sep 18, 2025 at 02:39:01PM -0500, David Lechner wrote:
> > On 9/18/25 12:38 PM, Marcelo Schmitt wrote:
> > > AD4030 and similar devices all connect to the system as SPI peripherals.
> > > Reference spi-peripheral-props so common SPI peripheral can be used from
> > > ad4030 dt-binding.
> > > 
> > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > ---
> > >  Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml | 2 ++
...
> > > @@ -20,6 +20,8 @@ description: |
> > >    * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-24_ad4632-24.pdf
> > >    * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-16-4632-16.pdf
> > >  
> > > +$ref: /schemas/spi/spi-peripheral-props.yaml#
> > 
> > I think this is already referenced for all child nodes of a SPI
> > controller because of pattern matching of:
> > 
> > patternProperties:
> >   "^.*@[0-9a-f]+$":
> >     type: object
> >     $ref: spi-peripheral-props.yaml
> > 
> > in Documentation/devicetree/bindings/spi/spi-controller.yaml
> > 
> > So perhaps not strictly necessary?
> > 
> > Would be curious to know if there is some difference.
> 
> I think it's good form if you're actually referencing the properties. I
> don't know if it actually makes a difference in the end result of
> dtbs_check but it may in terms of making sure properties in this binding
> are properly typed when it is tested against. In this case, it appears
> you're only looking at uint32 properties so it mightn't have any impact.
> Rob would know for sure.
> 

There's no difference, at least on dt_binding_check output.
Initial idea was to allow using properties from spi-peripheral-props.yaml, but
they are already available through the pattern in spi-controller.yaml.
If the noise doesn't worth it, I don't mind dropping this patch.

Thanks,
Marcelo
