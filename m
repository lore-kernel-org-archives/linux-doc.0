Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BBD323AE66
	for <linux-doc@vger.kernel.org>; Mon,  3 Nov 2025 13:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762176097; cv=none; b=Mc6TfJXzSJtA6vKOQq6vutZsE5YszFYpopA8zS0XC3VkSvAX7fcDgNRyAi2vPSxK6iAJJEvhcxNC66HVpVavqWXNReMqQ9UqG9TuScW40YFeVD2umUVbo8smJsc9hUPydF1uyZhIPQi195ireaVCJdhY+FaEqgoD8c1DnUTBqek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762176097; c=relaxed/simple;
	bh=mKY1DHsdAgjlaB/x4mbWgVNH2LRMMJSrnESEyMRaP0U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GT7nJvi3cbqYhamioo/0+QwkStehz4NpT12vxe3yHb90pa3enzlwAHGyDlOIbGL7ytq+0QRh2PSlibhS2VF4BstHuWlSEC3VVgA3EicCuoirL43spyGu+CCPc41SX0rIr/XJKxjymvTuo5ecFJ2uDSTGv20X9dlj+tVn01HlozI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IaoltB7x; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IaoltB7x"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-793021f348fso3468988b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 05:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762176095; x=1762780895; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FSag3litSbjBkSWJUIOjnh1lwhzQTpa6XW5JSh0K4dY=;
        b=IaoltB7x8uypSvtIHIoIFKaXiWG13IEiIw90H9tS06Zk9/k4Vmj7Nk8wfraIZM86Y7
         iGhazBzVpeBdPZ+c45iO6Q6M24wLkqC0z4tNi7tjpHEKT55mKWfq9TvHhrfZCbx4se+8
         xGvFKxbTS+yWfum5ll564hRAJY+8DEfl+4svPor6yAPx+ioA6IiJ1ybSKAIwXEEivFkS
         5Ft199RPuwJCZRA4cCb2o4akZE9gICXnBG3eCe3+nLTaqDlWO6bQjFYcjuene4YVl/pH
         BCTl6CFQn2TxELpTVqFLGKUuBoFjjw7dFMOhcWkF0J213nkaBr0ViyG42M0CSNYBexUi
         8SVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762176095; x=1762780895;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FSag3litSbjBkSWJUIOjnh1lwhzQTpa6XW5JSh0K4dY=;
        b=IH/GrqWb7Cpp2IsCvnj5+XpbG7Cp1DyyLcIUAR/XXUZjEZt5ixAvVW2+m040EHjCis
         4N09ggKSHwz4cJkCExlZpabKmXNuFMTmqB5tLp/knuUBoibx8cWqusPQ7BFvkrQszYT3
         bUYDVgpGVKqNSjLf+wZ6WtZYWd86WespecO5UElO1wqiITJcsKdwdO3JCpnLyMnUx21n
         RSoHja9rqumzQNcSeq3gVZuCCj0D3ZgmQxEkSfeez9BVWUv9aCUING9ZdgyuW6OHgudw
         LcyqJqM6qwgiIzEcZ15AyXb5VvBHUIxmDWtEJ+6tQY9vTx1Ao5mAV/ee0NLIJwotc4US
         pX3Q==
X-Forwarded-Encrypted: i=1; AJvYcCXBIjz1NiLxOP/JVuaXWvEt+xJeynMociA5nOPtB7iC8CGCMty3ZhGhByhVmZE5HyVmkIGnOKT4T7E=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJmUqkc+KsrKD6ACM9N993uqJ8WDemiveC/Wr3tp3FL46W0VsH
	v6KLEjyf0JQk43BKz902Jc+tUH2otLOoqvLsEOpS64n6OAk4LyntnnJT
X-Gm-Gg: ASbGncu72Ap0CpiZ9iO3XWp63H1dTuwykJrh97Uvi14U+rtmreNh0OdXVqqZJ9n1r++
	oiI1lgRZuKzqWMu88O+2tjVnZN4Yw4uxPrVXRiGpnfh2N/sZjUofknwDK7XY5haUOH+PWzHCp33
	Br8fYgRvaGSkDjyH7T99EvnrKMcNJuvhA399p2gXnqZ+wgjTVqe0a48KKGuxO4EurTMa6elY0+n
	57YBbMnEZEfbS7ZnYcTzYQ9CstNYhD0biHoeLPvd53LLLuDFK45UuzjUdD1jsGj729eTdMuaMsi
	wWuDIdQrIzLyZh4hgm51v8LlnF8nQDIsPOPv60/FsQybMTkgIxKXoxREZU4l5ptSVOmDPx7U9Vu
	J6ovnE0BqYaL/V31zVwTxTOXQbm5NqN5pGaKaiaG2pNGCctpkmbbidJ/NWILh9MOSppd9ublQ4Y
	KIqhWNRZn/+g==
X-Google-Smtp-Source: AGHT+IFRncy0SSf8FZC7TBGl7F23Zl2/7vOrV2SDaFdUpzfHPQjkN9PubvOPWwLZzJO6qqiOOmXSSw==
X-Received: by 2002:a05:6a00:816:b0:7ab:2fd6:5d42 with SMTP id d2e1a72fcca58-7ab2fd65efbmr3773456b3a.16.1762176095236;
        Mon, 03 Nov 2025 05:21:35 -0800 (PST)
Received: from localhost ([2804:30c:1653:6900:3b53:af9d:48d6:f107])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-7a7db197340sm11355094b3a.44.2025.11.03.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 05:21:34 -0800 (PST)
Date: Mon, 3 Nov 2025 10:22:49 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Nuno =?iso-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
	Marcelo Schmitt <marcelo.schmitt@analog.com>,
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	michael.hennerich@analog.com, nuno.sa@analog.com,
	eblanc@baylibre.com, dlechner@baylibre.com, andy@kernel.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net
Subject: Re: [PATCH v6 8/8] iio: adc: ad4030: Support common-mode channels
 with SPI offloading
Message-ID: <aQisqe5EWARTwpQq@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1760984107.git.marcelo.schmitt@analog.com>
 <3fadbf22973098c4be9e5f0edd8c22b8b9b18ca6.1760984107.git.marcelo.schmitt@analog.com>
 <20251027140423.61d96e88@jic23-huawei>
 <aQJY7XizVWbE68ll@debian-BULLSEYE-live-builder-AMD64>
 <ca6760182b4662c96df6204bae903d8affa6a8e3.camel@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ca6760182b4662c96df6204bae903d8affa6a8e3.camel@gmail.com>

On 10/30, Nuno Sá wrote:
> On Wed, 2025-10-29 at 15:11 -0300, Marcelo Schmitt wrote:
> > On 10/27, Jonathan Cameron wrote:
> > > On Mon, 20 Oct 2025 16:15:39 -0300
> > > Marcelo Schmitt <marcelo.schmitt@analog.com> wrote:
> > > 
> > > > AD4030 and similar devices can read common-mode voltage together with
> > > > ADC sample data. When enabled, common-mode voltage data is provided in a
> > > > separate IIO channel since it measures something other than the primary
> > > > ADC input signal and requires separate scaling to convert to voltage
> > > > units. The initial SPI offload support patch for AD4030 only provided
> > > > differential channels. Now, extend the AD4030 driver to also provide
> > > > common-mode IIO channels when setup with SPI offloading capability.
> > > > 
> > > > Signed-off-by: Marcelo Schmitt <marcelo.schmitt@analog.com>
> > > > ---
> > > > New patch.
> > > > I hope this works for ADCs with two channels. It's not clear if works as
> > > > expected with current HDL and single-channel ADCs (like ADAQ4216).
> > > > 
> > > > The ad4630_fmc HDL project was designed for ADCs with two channels and
> > > > always streams two data channels to DMA (even when the ADC has only one
> > > > physical channel). Though, if the ADC has only one physical channel, the
> > > > data that would come from the second ADC channel comes in as noise and
> > > > would have to be discarded. Because of that, when using single-channel
> > > > ADCs, the ADC driver would need to use a special DMA buffer to filter out
> > > > half of the data that reaches DMA memory. With that, the ADC sample data
> > > > could be delivered to user space without any noise being added to the IIO
> > > > buffer. I have implemented a prototype of such specialized buffer
> > > > (industrialio-buffer-dmaengine-filtered), but it is awful and only worked
> > > > with CONFIG_IIO_DMA_BUF_MMAP_LEGACY (only present in ADI Linux tree). Usual
> > > > differential channel data is also affected by the extra 0xFFFFFFFF data
> > > > pushed to DMA. Though, for the differential channel, it's easier to see it
> > > > shall work for two-channel ADCs (the sine wave appears "filled" in
> > > > iio-oscilloscope).
> > > > 
> > > > So, I sign this, but don't guarantee it to work.
> > > 
> > > So what's the path to resolve this?  Waiting on HDL changes or not support
> > > those devices until we have a clean solution?
> > 
> > Waiting for HDL to get updated I'd say.
> 
> Agree. We kind of control the IP here so why should we do awful tricks in
> SW right :)? At the very least I would expect hdl to be capable to discard the
> data in HW.
> 
> > 
> > > 
> > > Also, just to check, is this only an issue with the additional stuff this
> > > patch adds or do we have a problem with SPI offload in general (+ this
> > > IP) and those single channel devices?
> > 
> > IMO, one solution would be to update the HDL project for AD4630 and similar ADCs
> > to not send data from channel 2 to DMA memory when single-channel ADCs are
> > connected. Another possibility would be to intercept and filter out the extra
> > data before pushing it to user space. My first attempt of doing that didn't
> > work out with upstream kernel but I may revisit that.
> 
> I'm also confused. Is this also an issue with the current series without common mode?
> 
> If I'm getting things right, one channel ADCs pretty much do not work right now with
> spi offload?

Yes, that's correct. It kind of works for single-channel ADCs, but half of the
data we see in user space is valid and the other half is not. For two-channel
ADCs, everything should be fine.

> 
> If the above is correct I would just not support it for 1 channel ADCs.

Currently, it's just one part that is single-channel (AD4030). If patches 6 and
7 were accepted, it would be 3 single-channel parts supported. I can add an `if`
somewhere to check the number of channel, but it will eventually have to be
removed when HDL gets fixed.

Or, if HDL can't be fixed, then we'll need the `if` now and something else
latter to filter out extra data before pushing to IIO buffers as mentioned
above. Though, this scenario seems odd to me as I think the HDL wouldn't be 100%
compatible with single-channel AD4030-like parts. We would be writing code to
support AD4030 _and_ a peculiar data stream from this specific HDL project?

My suggestion is to apply all patches except patch 8. IMHO, SPI offload
single-channel ADC support is broken due to HDL IP data stream not being
compatible with single-channel parts. That's not a Linux driver issue.
Patch 8 (common-mode for single-channel) may be fine, but I haven't been able
to validate that since I only have remote access to a single-channel ADC that
has already required a buffer work around to test.
