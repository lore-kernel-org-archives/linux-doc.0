Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792657392;
	b=C4s8MzoOxn+afcs/Z71soiuTjPi3SccI0wkg+UcB4oUC5Su9uagGrc02Ihk1MzwFgBTt
	 HBZkUDsc0kyA5p/5WKrKQpmbv+bSBK9rJ5TvYhma5/3sYgC59JH9+1gNN2tr7UImChgFn
	 R75axmi1pca4WsmNhmDCX82mBF/YQ2082Vmdn6kyazOgjC9Qfn0+yJJ8oWZaI2xjphuUv
	 bTKHJISNXjCmw1vJ0My/c4SrsxNgWt7DKQfQ1avzEKvZaQZb/0v/NIHx09gKRa87RjqpO
	 AWO/QfGr/c2lWW1UoCWzoUfNp1QFQ17G67r98uS5s0qj5e8U5DgaEoRmb7/42kVHToA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792657392;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jBzwZmEglaCeHy9uWRO0K+mSZ4Ex83WBJUpJNZMKjxY=;
	b=qkQdglRTJGY/HN6A3jet2aede6nd1GajuAaEozX5f5xCQQ9E1DaoVkVb2gEj7GO9LlnD
	 8SwVeIL7q0ZPgF3yY72d33HHAofIxI2waHS+FX1ZmGBgIt7p1Netnxb8IAS0iHcKUCZCh
	 NwXlj9A2jgTgqoVRhJVffWsSnuuPSDIqrY9NX4GDKxbDamxADZ7krwZ4gWVasxiu9sY2o
	 HOKy0XSXEwjz16fqct54vHaZBWsei/cp+S8FQ6kIhbH8Sbp1INaT4IwbV4tINnqNUILyb
	 HfiNAj04BrNB+Jl/LbKKjkFOOQT40kulsQhvXnGAYkyCPuCzO8n9cwht+PM3U85O44w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Kk9LAzae;
	arc=none smtp.remote-ip=209.85.221.50
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807C560A3815
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 08:23:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807C560A3815
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=Kk9LAzae
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-48c5358fc28so1315385f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 01:23:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1792657385; x=1793262185; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jBzwZmEglaCeHy9uWRO0K+mSZ4Ex83WBJUpJNZMKjxY=;
        b=Kk9LAzaeohWWgjO7yOkoJiNXX0TzdzSZ/V1pSBH+WZZGAMzm+UyKX9kpWlf8CnmM1V
         vKe5hMis8H/B5q06XHV9CxdwFaPMvRFdq9eypt+YDGqVZGlXQ8ZWd/tlx/D8Tgnuy1TP
         r17zRtgzxdLTGYfdyHh7OOtZups0QoOmjy/FDCWhB2kq1rkuPtD8+W0b+Tnb3gjqb2tc
         oQ3x3eTAu0kdKTQRjyq73EAs4fNfbtFPhCl1+uTRYsRNI76x/uekofEGCX+5XMFIaNtL
         zKRFbrUKqKtbuSQWq2idDCNSmN9Kom0u5oOsxJAwvJMVbEYzxaKlhJbdyt8vzzDUCX1j
         GJeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792657385; x=1793262185;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jBzwZmEglaCeHy9uWRO0K+mSZ4Ex83WBJUpJNZMKjxY=;
        b=se2yZVIRq72hkn4nqbahJ4NrLU/LyAo6IE12T6DyY93lbLGsEzt6+boo+IMcyZihZV
         hRahq4QTh0WsNMZf/0Kw77rEF3Yzo+EgrQ9BEQp7FygIDeRohU6Yr6405C0eOWVAxTDV
         w4ZCop2qfX/BLZJRoRoHWqj9FVoqVFfDqkBc2uzm6/gYNl0X2pPPDcCejb80Zq+igYYT
         CpAIk9Rqs32cBAeI4G8fdV9M9yyrwkPgoVdk6HGdX56k2CuKvA/lOeI+LLuazNBq65sw
         CVn1svoyAWY6xsaI1EJxy6JLG5SCY73YjmabLw8eNWP5ELH4zi6GpRdq1+NfGihtELVq
         UmLg==
X-Forwarded-Encrypted: i=1; AKwUvBwCJ/WMUP33hCZITGR8iGhtQDQ8EpROTKQ+aYPCOt6MICePOQyGLa1XTmRGr67lsiqRohlvWoMAyJ8=@vger.kernel.org
X-Gm-Message-State: AFq9FYL8xIk9ChkM/UNcTqvfoZS911ZarhWIusmMtM0ccL7nswMqLiI8
	NhfIB1Ymugg7Z5l8GFr71XSXIK/jN3/2K3Vzr3rHV4O3YE6e4ujyaP+bTncBLCY7QzY=
X-Gm-Gg: AYBFou3QjR6pvWWfGOEdAqQZzbF/B0YVtWfg4JbhOuKggUDD2/NpmdDswgSDlf5z+R0
	xNZGSGewpeDD/b5wLBZIMWUbldh+rxn34+TtRksuAF/aDJKdHHa88BhwH4lKHBf2eOF7zLqCRXi
	bIxC+YCOPMNMT+zkOcVtbva8KeyckLwY27wIEqr1XBNvsaWlc48P6ozSBAkCRz7INTKE7u3crR9
	kxrV4gWqaaNqY3Zm2GX1s5HTFxZCLREezXS1AA3R77myH9yxiyB/qNpSk5b9TRB2WPXuHQNgXLT
	VSsMNuM7BuH51ZTmS275Dx0rd848/PZkiyDRKCNTEUu9l0HsGhnkkySZpnlEMISaWuu0VIv/lIp
	J649Uq4NE4tl7Zv5778+WBDn2+WJYTwXB4ceeY9vsCwn0fIoexUt1FW9E/dpSa8RRIOaAqtyJiQ
	J5EiD18fel87NSSGc+egqYyUcQme6HKlj11vnmwNU7b8SE3ARNTfJhXc5WJLe+Fcw/CWhpYYvzw
	Rq0AodqNXZumjfIFSZwxQuTMwob4/olNS0+q5d8qeO55WUbzFdCtBUX10LpuvXN6aV1cT/eTftS
	KqvLL0E8zQ==
X-Received: by 2002:a05:6000:490f:b0:48e:23e1:35ec with SMTP id ffacd0b85a97d-48e264db0b6mr9339116f8f.47.1792657384555;
        Thu, 22 Oct 2026 01:23:04 -0700 (PDT)
Received: from localhost ([128.77.52.125])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254ef1casm8493784f8f.7.2026.10.22.01.23.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 01:23:02 -0700 (PDT)
Date: Thu, 22 Oct 2026 10:22:55 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 13/20] Documentation: ctlv: Describe how to write a
 family
Message-ID: <atnGniIHxIV-vzVC@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-14-jiri@resnulli.us>
 <179245258505.58760.3972297562218204862.b4-review@b4>
 <atjEgLYpgbZNzfkZ@FV6GYCPJ69>
 <20261021144951.GR3008132@nvidia.com>
 <atjiW8bnqDZ8zb5t@FV6GYCPJ69>
 <20261021164857.GT3008132@nvidia.com>
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
In-Reply-To: <20261021164857.GT3008132@nvidia.com>

Wed, Oct 21, 2026 at 06:48:57PM +0200, jgg@nvidia.com wrote:
>On Wed, Oct 21, 2026 at 06:24:12PM +0200, Jiri Pirko wrote:
>> >I haven't got that far in the patches, but I think it would be good to
>> >spend more time here explaining the fundamentals of how the extension
>> >mechanism is expected to be used..
>> >
>> >It looks like RDMA to me where you have some 'common' and some
>> >'driver' parts but at this point in the docs it isn't clear how that
>> >is reached. Like does each driver gets its own family? What is a
>> 
>> Depends on the consumer/subsystem. But esentially yes. That is what I'm
>> doing for "attestation". This patchset introduces ctlv-attestation-tdx.
>> Next we will have ctlv-attestation-tpm, ctlv-attestation-firme,
>> ctlv-attestation-armcca ctlv-attestation-spdm and others.
>
>Hmm one of the things iommufd does is to have several different
>drivers active at once within the same FD. There is only one char dev
>for the whole system and the VMM would operate all the hardware
>through it.
>
>So in that model individual calls are marked with the driver's
>identity when any driver specific data is passed.
>
>I guess that doesn't quite work in this model with multiple-families?

Nope.

>
>But it does work well here, and matches what rdma and fwctl did as
>well. So maybe iommufd is weird.

Well, one CTLV chardev is always backed by one device. I think this 1:1
mapping is clear in the device model. Iommufd indeed looks weird in this
matter.


>
>> >> >What about userspace, it "knows" somehow what to do?
>> >> 
>> >> Userspace sees the family chain. It also has ability to do introspection
>> >> seeing right away which op supports with attrs in which nests.
>> >
>> >I was hoping the introspection would not be essential to use the
>> >interface..
>> 
>> Depends on the user/subsystem. Either families_dump op could be used of
>> udev uvevents that also carry family inheritance chain:
>>     CTLV_FAMILY=ctlv-attestation-tdx
>>     CTLV_COMPATIBLE_0=ctlv
>>     CTLV_COMPATIBLE_1=ctlv-attestation
>>     CTLV_COMPATIBLE_2=ctlv-attestation-tdx
>>     CTLV_COMPATIBLE_N=3
>
>I wouldn't try to link it to udev either, by the time some userspace
>uses the cdev the udev information is gone, and may be unreachable
>from inside a container or similar..

This just gives possibility for udev to work properly. Depends on
the user/usecase if it's going to be used or not. Not sure what you mean
by "udev information is gone". Udev might use these uevent info to do
aliases, similar to dev/disk/by-*


>
>So there should probably be documentation in the subsystem how
>userspace should learn the driver family via introspection.

Okay.

>
>Jason
