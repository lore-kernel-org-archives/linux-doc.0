Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC9130B528
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 12:30:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764937834; cv=none; b=DBI1cN1wbu96vgTSBoVg4ZdmLINzW67I+E6PefBmOmxE73Bo1aVIfMvlGlyYGfvqeFfebGWJZf5OS0i2pRh7JHBheY9+EiqYSX+kWLMzD8cNoVNHObG2PfMKp1b8ARqFFnFebj4Y8I5FcrlOf713Ft0Ys9pSxHHnxdg52zGW4MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764937834; c=relaxed/simple;
	bh=4mbe29jPvHe5+nxFoC4URBIJzmlwrissieRk78dV2aQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S84kgSinNSBYWQ283MAsD5jMazE7h9CcmlhnOv0CFEcvYJU0ys7T18sebjDNTn9iVPaq9Yw+iyc1PkkSdnwS9bb7ZtTGcYxIX1w1B2v2V6uPmJ22qzivO2wmJycXTzP0+PkW7jGn+1fmBXZmLg8M57yac95zWW+8VKFglRtWQO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HDb7a5Nd; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HDb7a5Nd"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-b98a619f020so1517500a12.2
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 04:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764937831; x=1765542631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WvQc9yTuqlOjoJmvorMP2zm/sODzUXr4OMWqekW9i3c=;
        b=HDb7a5NdQPrq7SBcHgaY7Ut/amnvBvFJVI9UMEcrrbHhEUQrh/G23Lv0bfcy96hZGJ
         yU2hYbmwAUdZi+9HEOEkdN72ZX0lJ6jzayPfozh1kOaPL0Vtb+f63MRME4JD9s2cfCcl
         mC+eWendet8nH0fQkoeXQAYglSnpsGJW9UHb5CmDS8GgOHCeTYtGMoaUjg/jC7OJEcAs
         LYbmvt62fvKu0wck5+T6SG3GnYcabVMPF5nSBOxj7XT0pE8d0Ztj9wjtbn6O9lPqLumr
         yJoP/yhc3kHw1BB2PmSaOh8PjWwhHxNauygRNFQ5FekSDIsji4dZzWUXeab85HuZ6ieE
         4oGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764937831; x=1765542631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WvQc9yTuqlOjoJmvorMP2zm/sODzUXr4OMWqekW9i3c=;
        b=DTq7AiNzz/NDnRlbfok/7CP5AQmyrdL7UlaZHYuNzKAWH/3Fl4KWzzehbt38MoU9M1
         X7NyWk3bchP21O9w3rbM0Hlm7BRASW6zztnO/aFYuOYfqL5in9CeSh3HRCtKmWjwQ+k4
         iw3MCl4r8gK0vgopzaZb/0/CRXwkQRRu7frSbexrqHrbf1bZnvSloMVOSodVqKoTazEc
         836RRnWD3NpRFhDb+UTETyt5Q0IVb4kfuuyrylr031K+yZlqjFsnulR+lSz+XKvx4hio
         CKXm8tmPkSF5z//Cue/Hz7upcrCUfWD/H3VRfLQpKXjhEROyGfQ9gjnLoez2KjlUpTN3
         3lQg==
X-Forwarded-Encrypted: i=1; AJvYcCW+TNFCeGcX4WbRgpwZRwpMLDgVYHwoq6n6yiNFiyb9FwU893boFXf/qsSyo5XIeWUt8bf17g/g0Ho=@vger.kernel.org
X-Gm-Message-State: AOJu0YxLpj0Zp06wAGmqXMgr5yP70eSC3xi4+Si+4Qpqi3lsws0+/hNt
	jVK1LToXVrCScjTDq1f+4feBGzi9mKNOyIbnhV587tU5Xqfa3f5tIRkk
X-Gm-Gg: ASbGncu5pARdV2i1AdHerr2ywzTQN4SKiFl5pQ2wdlQgJOZPdtb7PbhmjvNw+6vH8go
	YkWzvPdrGTpItXtjXs5136/u3HyOBnztDOT95UyVP1e7zevMNWLz1VLN4QTXNwhKbJJ5bU1eleU
	obEIqAkBfSsjQsgrpaLoF6upgwR/+xT58W/m5fCDh9GTWoepBUu03VI47x4yH58QXL6sZx1iEnz
	653wfFItlmsc0p1VO3oDyP29/Z7WsdcEngzmQ3jowmBE1kUDOBQjzjmbela7JwkZSA1HvQZRrEx
	gW2jF4ag6uNB7FElPb4mfpVjHM1uuD4rmC7E7lTXcARZb/seIWNGHo4Oe6vHQQoEOdT88Ie2siF
	URanfM8NuUnyle+pBTLV87+Mut7wLQW4LLQiddQC1MLQPH50eflduv/UaADtqcmxgvu0/hDQo1l
	CN0WR/A9NwLbX3qz+M7n4m
X-Google-Smtp-Source: AGHT+IG1w6AqAdjpiEW7wjkCwb9maP3V0YHpY8O2ibmOVgIoRsAmTpquVm5wmuPOFlElSwJ0pIUg/g==
X-Received: by 2002:a05:693c:2c09:b0:2a4:3594:72d5 with SMTP id 5a478bee46e88-2ab92d545d2mr7178256eec.4.1764937830922;
        Fri, 05 Dec 2025 04:30:30 -0800 (PST)
Received: from localhost ([2804:30c:2712:fd00:9579:9ff6:e506:6147])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-2aba8395d99sm20637786eec.1.2025.12.05.04.30.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Dec 2025 04:30:30 -0800 (PST)
Date: Fri, 5 Dec 2025 09:32:04 -0300
From: Marcelo Schmitt <marcelo.schmitt1@gmail.com>
To: Tomas Melin <tomas.melin@vaisala.com>
Cc: Marcelo Schmitt <marcelo.schmitt@analog.com>, linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, jic23@kernel.org, nuno.sa@analog.com,
	dlechner@baylibre.com, andy@kernel.org,
	Michael.Hennerich@analog.com, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, corbet@lwn.net
Subject: Re: [PATCH v3 3/3] Docs: iio: Add AD4134
Message-ID: <aTLQxIGc5jMgQnnx@debian-BULLSEYE-live-builder-AMD64>
References: <cover.1764708608.git.marcelo.schmitt@analog.com>
 <69b230190abb4cd76ad9eb25e2bde51caaa23d9a.1764708608.git.marcelo.schmitt@analog.com>
 <19d5c51d-41f3-446a-aced-5be2fe6ec0d2@vaisala.com>
 <aTGpgEFew2vP1CTG@debian-BULLSEYE-live-builder-AMD64>
 <49465e36-882c-41c2-a8bb-3c2e87bcdfd7@vaisala.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <49465e36-882c-41c2-a8bb-3c2e87bcdfd7@vaisala.com>

On 12/05, Tomas Melin wrote:
> Hi,
> 
> On 04/12/2025 17:32, Marcelo Schmitt wrote:
> > On 12/03, Tomas Melin wrote:
> >> Hi,
> >>
> >> On 02/12/2025 22:55, Marcelo Schmitt wrote:
> >>> Add initial documentation for the ad4134 IIO driver.
> >>
> >> I wonder is there some information in here that is not readily available
> >> in the device datasheet? After all, isn't idea with this file to
> >> document peculiarities that are not easily found elsewhere?
> > 
> > You are correct, these docs are mostly from data sheet info.
> > The main idea of having the doc is to make clear what peripheral connection
> > schema is currently supported.
> > Because AD4134 is both flexible and somewhat extensible in the way it can be
> > connected to the host, we could have different wiring configurations, for
> > example
> 
> Thanks for your explanation. My humble opinion is that it would be
> enough to mention in the commit message for the driver being added, or
> in the device-tree bindings that basic I/O mode is only configuration
> that is currently supported.

Okay, I'll drop the docs from v4.

Thanks,
Marcelo
