Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65A2444AB69
	for <linux-doc@vger.kernel.org>; Tue,  4 Aug 2026 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785840995; cv=none; b=hgCShW5Y50bPpbON48Tgz4+AJHebnwKc0YAWxo93yTSzrKFNNXxUdxsVR5P2XIQTirTs9GxNgCNWtMZsIEves2iV3VWpBUoIdgEN5vNTVqsaXAAGnmNl8xDdgELcrxYsBOhkFmhgy1+D47hb4OgtPOikacO8s4D9yXJcYz3Yt+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785840995; c=relaxed/simple;
	bh=tfG0Z0jIMdFAG9oiaWmU0MahhS2UILJuEyqDEjU+XCs=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aCwu+UklxWBVHFf6FDFr8CFaDTl/i32Ntr/xj7g59J5emZnpR4qivVOo7FQhk1NCWR8HmitAn12BkJ5tcZWdyf0kC84nu+9Zs6883dmoKxBZRJ8AeWKaUu7QRgZZ9xkf9KyK/Wk4VvS1MyAUmqbwShe0MP9oAz2110FzS/dFwOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sVfumHet; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sVfumHet"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-c15c42a45adso114401666b.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Aug 2026 03:56:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785840989; x=1786445789; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=nk3LyOamE4sB1BfHbMoeJeRq5q4+Y+ZWeLxrJz2kYbU=;
        b=sVfumHetN7651IkP+3C9kpo/k/exwbhkjEiqofVtSngoRgVzkP6xVz8P2zQcKjeuFz
         zp+QUrR+htWI09pd5pt2v2iIs4lXNAlLgZO0g8b9MApJXSQM/4yPu2wy9Juw5yZT0Szj
         w6KHPGcLw/fEu/F4ebMT6myDC8HHZHASRVFWnxWNoZNRJWEf0LbxNB578YNN/GZMMGw2
         +BWaNSg/gBGEWf3VD4xfhSAwqivvJpVcNRFlbSYboChOLg2YVsT7QdyCWSqXTxzGpin2
         8m6gAbzIK3TxdP/m4dQc4C2Deo3r+uhBXqRIIXgaE1O2UOWbpu6GSzvlqhXTU30kVGJX
         rG4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785840989; x=1786445789;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nk3LyOamE4sB1BfHbMoeJeRq5q4+Y+ZWeLxrJz2kYbU=;
        b=iFUS7kMiy1Pqu2KhTHUU0QiqPwJx6xDsi1iktlIBB8d5Q55qmUfxfTdTR6XPYHx+dC
         TBtx0HrHjCeXf1bFNdYcQzTZrB34VOLuji6NjYDWkerMtQP25eesjveJbJO1FuAq4xgD
         GtqIMTO03pQmGqsASvG4JwoM/lwANmejntJL73pZzTaLLsKGyN5V3DkuHTXODZOms5CN
         S3Jbq5LUyj4N2NDmYJzgp3/lrz2G3Z+nbRXqXGstupFgRHf3DualNSmctx52EJzmoj+/
         W7bUPFlqmWC+Wjomd4hhNR7dMlCajdgtPRzcP4DOMJTACvFqogQk4WAASe2TKLCi7WGE
         PoAg==
X-Forwarded-Encrypted: i=1; AHgh+RrxucIChc4ierGfzIRbCc9v2CCeQ+z9qHJjWx/EvMlphW6kKWZqfokCkD6mKuzQFLGzl3AwShL/peY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKtFr+N4TS1AEhXsBsVFLaxcXZaBHJOS69x2lRWHNRTTDU/Hiz
	Tk7l0A3ZIhP1OmcZ8kp8YVyGsGYEyJEuoDrVF5WgzYygX2Mb7pisZtZe
X-Gm-Gg: AR+sD13jtx3wY/QLzSJaZEH1Fw/WsKLNDnESapjBfS9Xhi3gp8FxGUzF2W6Ij6CQqXv
	DvF3tOT4LxZQAwP0PaNC4fWCjADSoRBBkxhwD2N3Q4hvgisgk3CIUtIBYZiSPKcUNQ4Ci7hgUmd
	Oet+B3u490Q+uLSnpiFGJSNpqBxjLwmxteTaYW0i8o2cWtGYEvx1PqqpyyH7H6y6PO8EgP1oNzG
	oDNhFc+ixSc+13Ftbz+G0uiP4d9V2vkeq75Y8rkkDWXe5Ce8DxdwYpHpZ3guUivtxMW/b/aJ4q9
	OZvSBk2fZrt6U22FDMcQyI8sumkVbQnLf5ugufLJkQj1QEDGM3dbxRi09KTJ/lLbKPs75Akf1TS
	DDblpw4YMifdkRvmrXyHRdn98DNPL89GtxuGOTSDhKu9saBzNg4Chn/9bOqhSEgUPKNzhTumh8R
	LGE3uxvyZX/sRzLlZr4cEZLAKY9XUD1aCE8QB7ily9uZ2SnJtYMUQyVejfRFU9iDhwOQ0oL2xXu
	6InzcTVXKEv44oMRDB1NfOkDYWeLiqPZOOuMSKRrAXjwWWDal0tf4BGQUU00OaD
X-Received: by 2002:a17:907:3e07:b0:c12:3cbf:9f6d with SMTP id a640c23a62f3a-c20244fb9a5mr341232766b.1.1785840988759;
        Tue, 04 Aug 2026 03:56:28 -0700 (PDT)
Received: from RDEALENC-L01.ad.analog.com (24.206.116.103.netskope-rdns.com. [24.206.116.103])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd3c9e5adsm657578066b.23.2026.08.04.03.56.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Aug 2026 03:56:28 -0700 (PDT)
From: Rodrigo Alencar <455.rodrigo.alencar@gmail.com>
X-Google-Original-From: Rodrigo Alencar <rodrigo.alencar@analog.com>
Date: Tue, 4 Aug 2026 11:56:26 +0100
To: Jonathan Cameron <jic23@kernel.org>, 
	Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-hardening@vger.kernel.org, 
	Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Kees Cook <kees@kernel.org>, 
	"Gustavo A. R. Silva" <gustavoars@kernel.org>, Conor Dooley <conor.dooley@microchip.com>, 
	Johan Hovold <johan@kernel.org>
Subject: Re: [PATCH v10 00/17] AD9910 Direct Digital Synthesizer
Message-ID: <q2t53ly3vl73kmu3ehvntnj75pxl2smntctcuxzjuaguihqwju@adzts2ezpg5x>
References: <20260729-ad9910-iio-driver-v10-0-aa1f6167729e@analog.com>
 <20260802010959.25f9f4df@jic23-huawei>
 <20260802015846.2be354ec@jic23-huawei>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260802015846.2be354ec@jic23-huawei>

On 02/08/26 01:58, Jonathan Cameron wrote:
> On Sun, 2 Aug 2026 01:09:59 +0100
> Jonathan Cameron <jic23@kernel.org> wrote:
> 
> > On Wed, 29 Jul 2026 09:25:27 +0100
> > Rodrigo Alencar via B4 Relay <devnull+rodrigo.alencar.analog.com@kernel.org> wrote:
> > 
> > > This patch series adds support for the Analog Devices AD9910 DDS.
> > >   
> > Series applied with that small Kconfig help tweak and a bit of fuzz
> > around the new channel type due to the flow sensor I merged earlier today.

Thanks! Let me know if you need a v11, I suppose We are going to wait on the
mul_u64_add_u64_div_u64() fix anyways.

> And dropped again :( See patch 11 reply.

-- 
Kind regards,

Rodrigo Alencar
