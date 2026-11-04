Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793821590;
	b=hwTqpGv1t0QJsu79dpUOqZdcf4vsAmV/VstcGs1NI5tjNosB/PfI+HFDejfuH5vlnm0a
	 hZYvWUxvURBnae9xtA1ze+c41BTQ3s/LTh0zqNuj/WW1S2UL9SQ6XI7jXn+/FXU+L7UIV
	 kevh1DMTD4S+Qwk7xyfOrrnR/5GJKN8rXMRtR0+oysgeobyR4fQ4k1UhFdWeNyvVUkRKH
	 3hoCUAgQsWKAZdcw1kWsN9dj4icVLqnkdp+PH8rBHSGQ3NfmzXLloXR7wG0JaieMTmjtF
	 oNf1fCrgJo5NMSdKZjWXyXGkwKh/+9E86cNZa5JGQh6Q/etEmWm1boVHC0m/UzE1B2g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793821590;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
	b=G+/3u9JoWM+Ia36JuQtSUCwVwE9ohN2p64JkpalZwyQNPnqi+j1vvabkConu3y4iT26p
	 +oaXx4Ze8rJRfxjO38Ls3iTOqRTNYvdFf734XdntCvN4DzglQKz+oVjB+MBQN0IaIq247
	 aoh4PQRbc5heDwreEJNT++RzYDeth0mvaWHk+K2QyAO+ilKHsTNoxmSdOgQraPawCZAQ4
	 jIlRTuPVmWiJqek7PQc75jtFiMUw4SUq37FsTL1ClGUJV7kVKWf84RX2TU5ltjp3IvEym
	 nONwf3gB5WTMXVP/5dIc0vLGdKbjaQ2Sq4qvs5kdqTu+lo7Lgeo5I6kfF5TaScy0E+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.160.170
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D65E60C77F7
	for <linux-doc@vger.kernel.org>; Wed,  4 Nov 2026 19:46:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4D65E60C77F7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5495d549924so10604961cf.1
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 11:46:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793821584; x=1794426384; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
        b=WRBm+GQFrwS5Zas3ZL99mrACnUfCSQ6IoeXlzzeD5KKnBqHHgtxYl2c9wviBwKfOJD
         qtN+ZFY9uOU0mlzNZCuwr0exw/fYbp1g7ho5/pM/xUO2KAdWMlMV2RV+eo8CzwSP0PK1
         MgVCvd6blq74OYN7OPzEIJ01+NGUqyNVGsk9oJ9gJnGaU9hlo5GRil1NKdsf3xy0EYAo
         KWR5bpoPTgSvX2xINyPwl/GgNSWpYL76GMZPxcwzp8e6CZ+A0tOfzm6uN9XILruejEOn
         jmRIHZ7FemA5lobw30d7bQdTmz2Zgu/15vEm4Imf92NuvMQXWpZlg1Y/yMPrwX5t4FVQ
         NW8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793821584; x=1794426384;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/iOiQOUFj+ZNXsxkV0W7K4UHGpRKtOzL2hr1OPDdR9w=;
        b=uuoXYxZyOL6iz6NvRwGGQnCUOM5sor4P8/iJPJaS3BqERf7NeFLFpJzys4Rgp1KKv2
         OkCVetqL9FPq1DLgtbKk+tzsdTFi02KT7EMmltwJqolmD5dRtIWHX5H/ayyUCthAy5uz
         89mSWX1E47zLLXrTfGH6owYxyWGf4lsTDEZ5yxKol4vAevS6vS32HDD6FAFRRJmPzRrL
         MHwZXdMQPOuIQwDK/c2QRyH09b3t3ELGP/l0TLCUlElZAzqeIEC6HWH0HZp1hlzphwmp
         bfjHch0tmyBABmVv8WsN5HzToP6mypSAxVY55rY80aOsVfcrgF51zhehtlmUGmva2PNJ
         LiWw==
X-Forwarded-Encrypted: i=1; AKwUvBwLovWC/4Zva+pyvY2ILPwjzkA0yeMLiOxPv8GJbLZ+cGHUdt9aXyt1eFJBW0SHGwcnorEbSy8H+Ds=@vger.kernel.org
X-Gm-Message-State: APuU4Z9p0Xfy+RXcxZ5ZVElj9gvDB6RBz2K/h7+GAVpVIse5ZeeT+Xbj
	/NOyTpWCHyfHUJbWzrtTAMqRYNbJNx0McOQwf/2/0rY/VKp28G2nLZux1m1zDcU0j0M=
X-Gm-Gg: AYBFou0KSqdXVbTSjtZuqtd5iICItipeKGAl5yVs5h1KYNhbx/V/QV1jcnbTwp4RF6r
	bUHfIhQNVYGU+TuF/teh66q6rmdZdRRcM7whebYz4vjXzAP7IA26Ii/CF7sG07IHtF6J3yK9MUw
	xADKoC98Yqq4sXqqivmLtUO6hF70SEk4/k0QQ2vBhassU6YDredUXctL65tA+8kLe8QHqgVqmYw
	GsgHATYsanaso4iHy1v+61b93y5S8AyZOG8BCqKsaqJuxQAZumhpJsxEfwVpIo2jyo9tnIxZJ0m
	4X+NUXaKzxwooXNNh2I3GLLkpXB872DOnAOrh1qfc5sxNbAgPUsY4MmktyZgjBvghOzaAwnSrTL
	HOynmMXFDb21XqOFXPnCPGQYFk4hLd4Cha6VdWtRwfnP1S8h++44AlLl32pLAfwgM+AiaED+0+R
	mo4d+kAE85yv+Edlq/ztA3g7QwVRbH6wKukxA0MWup9GpJRKzV+LWxSmw/OZ0BVJ/S27/4nIYg9
	pNww3oP9p6vkTmMMDKchEkhrLYMZ6xs6z2ierRwcuJgzryDP1MbiBB6bCpp9HSc2413s7nuTD8s
	FAsH/8I8wYPL9RKQVp3uu53uv57Gk8XC3xIYtq7gkz+n9x8yal6c7kovmbvznbQg7uZ/W3ttt7u
	tNft7i1B3Nv+yIbSLFRuxzbK+BlpH/uY=
X-Received: by 2002:a05:622a:98b:b0:535:be07:f31c with SMTP id d75a77b69052e-542b83f684dmr276665021cf.74.1793821583898;
        Wed, 04 Nov 2026 11:46:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b100aba28sm32315511cf.9.2026.11.04.11.46.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 11:46:23 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOgwA-0000000HIFZ-2f1S;
	Wed, 04 Nov 2026 15:46:22 -0400
Date: Wed, 4 Nov 2026 15:46:22 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jiri Pirko <jiri@resnulli.us>, linux-coco@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org,
	x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org,
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com,
	drdeeglaze@gmail.com, James.Bottomley@hansenpartnership.com,
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com,
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com,
	ankita@nvidia.com, suzuki.poulose@arm.com, kas@kernel.org,
	rick.p.edgecombe@intel.com, elena.reshetova@intel.com,
	dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <20261104194622.GC3889730@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
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
In-Reply-To: <auuDcABX27EeTApl@e129823.arm.com>

On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
> [..snip..]
> 
> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
> > +					       const struct ctlv_cursor *request,
> > +					       struct attestation_evidence_request *decoded,
> > +					       struct attestation_evidence_object_request **objects)
> > +{
> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
> > +	u32 challenge_length;
> > +
> > +	decoded->challenge =
> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
> > +	decoded->challenge_length = challenge_length;
> > +	if (challenge_length < caps->min_challenge_length ||
> > +	    challenge_length > caps->max_challenge_length)
> 
> Hmm, I'm not sure whether this check is required for
> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
> 
> for example, if the provider provides two evidence:
>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
> 
> might challenge is reuiqred for generating the token
> and this would be marked at min/max_challenge_size in evidence_cap.
> 
> However, in case of eventlog, it wouldn't require challenge.
> for example, TPM event log or CCEL event log.

Right

> Do we need some field on attestation_evidence_supported_object whether
> it requires challenge or not and applies this sanity check per the object?
> 
> Otherwise, to get eventlog, it would need to send *dummy* challenge
> always.

I wonder if we should have two interfaces here for signed and unsigned
evidence? It would be clearer for userspace then when it needs to
provide a challenge or not.

Jason
