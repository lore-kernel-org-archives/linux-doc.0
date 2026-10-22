Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792687384;
	b=C/yqAm2UOkOzBlh85pXRXfZgyJrGMRj334U2I9l3XRrMxPNzchdnSUW+NLPgrzS6jM1L
	 gBqSIplPQ3JUh/LNTiCwZZT5mZldKUypqFQkfO67rdVFjvLCQxl83GMwLJdt6yOwd9UWA
	 9s3lPLpfJDMK3M+EXgJOKRx2CJZZYuzI3CzOTfGf+AEf1hS1+LUjBGuWypqD/hfCVWvcE
	 oQaQF+ZYSJbemyj7NyzQ6D2ghwjz1alx1T5XqJccspVjWRr1aHOjynwl6KsHZkE0bhq0a
	 eeeLVYpGvDKAWV2qmT7UVA2X1K3c40HS3sBkQZRkMeysfRCwrSdpI0Fwzgf9KFhjkQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792687384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
	b=iCv38JjIPaBU1fE1ZmTsSoxQFEbVYheAYcDO9uz7tZtGVjxv+sGxeuMXg6uEKWJQAohg
	 q/D5pKOzivbdd21r4k56Hk9G0Vw3DBYIH1d9AGk+Ks2xLIRHVQvWdbYOQ2WresiVvZmUR
	 QX96cYKu75ZlJ7orJhPzsyVhbyy2MOoFbIdLiiaYqDx85Y80f+z/GLb0N+4dqtrQfDgig
	 OClYQCyKkJud3unlNUqQ3g+vXXlEzeQ97YoMNbaCGkjEmg1O106zYFYwgUY4dQP6EUAfd
	 IDp5cJIfo0+/cILKW/AOXzUZP8uY6+zZpkW630AbLU2TSww7cuPQLpuklV+6JHPgCKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XHbnFoHb;
	arc=none smtp.remote-ip=209.85.219.48
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21986606A31E
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 16:42:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 21986606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=XHbnFoHb
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-91ba702cceaso954056d6.0
        for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 09:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792687378; x=1793292178; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
        b=XHbnFoHbaZMsVLw6MWmIqP2d7qgOxfCHBEepcjJ8Id9E0Eb+q5QzJCpkTQIX9gPT+R
         86fXPk5bXM8iK9x0dOBj1/E2JEn3tDHeoJ6AMdVbgJ1k1N3E3ICq/Q2MPhf+rIAxcnIF
         4+YWBGgJRMzlwe44a5LXp5z+24tXHKxJBq9xrY2xG4eX+Fk5gs/erZ8cIQv0oixJAix3
         455u4iWnpKjwepSQH8FuUSOS67fCspG4I/LkwbzlBZQUxBu3+wbUk5fmbVx/4k9mofae
         MlLjnMWqo8lm6PHNvrktYdzNb19ERFmaMkW8ZJFpc/nZn6Cvx+irDmyLf02/GTWvFBrZ
         RPsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792687378; x=1793292178;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bb9yPFVCzZYVNrPWeZ2XIQWqfvcxCLSzUADzdeC7Nqs=;
        b=M3X7BGE/krgocyiXMywZJtN2Gd/fC9frKKQCikeQyGyNBzxmiCRuTczBvsL38hTRBf
         yyOjrjWETDJbninhLqt2TkECrfWu3HzGXLdMFpjvwZH/CfNkIiLuZuk1Kb1WuHqxUiZv
         w69jW3nK3rUGNGbJ4bmskcq/YvvHn3UHCxHsdY9zzWzNWEuSiXjXg9j47jSDKtrsik2T
         Vdg3l4u8OmQmxCeD1j98O4mOiJyR6CH5sG0MyTzjYOVPx0l9e4jwz7xzdQkE40P7t8YW
         a8/IlqhMbXrHpNMgntGrLb8blLmgko2uop1lmYEcnmaJ7KgAJx7YXHbCcKg/5kxk41S7
         m1hw==
X-Forwarded-Encrypted: i=1; AKwUvBw4ooUpPLOREIbomdyEns1l9Z4H0gADyAtydnm/F7/slLo0RpwYOhzuhjohp0D+HUBLc1zTAfpDnBs=@vger.kernel.org
X-Gm-Message-State: AFq9FYJpCamimIow9sjWf3VRef9SZ1ohhN545KGZyvMQF7OEVlzY30oW
	C2U8lZA5ZvX/MR7bL5ADuutyOQN8zC9nG3q4+47uyiQFzOp5NHDefl9HinZ/TFxSglc=
X-Gm-Gg: AYBFou1h/Le3fAcF61Zfgu08Y0fJqqffoXDRLZdw61fFqiURVY6GXiawTqsBc9dav7O
	GQjPKqNuCXZeYJOAA1fhtPy1ipCWbV6q0aqTYE5fnUj/UGPP0QLFWxbzH/ilrduKhx/GIf6/2df
	efM+QE/TTaUgDZ5YteznF/WST37OFTqlrHeu4FeMtOk7nQhKVuYtLRCkNqoa+whHer2jjGnFCwK
	USY7RvZ3FE3goXWlYr2uSbo7QjPQG7XI+MsnpjXyaarllI18zKPGz2GRMxCSR0HhIi2QRVQS4Ym
	CABldrmBPOuV3WAt4+OpRRoJ+Scn3HttO8pG0+l9dzoqDlDFLytb/DTSC+pd6M+7LQ/lXQj4z1+
	YTWcBeGUMmzZwPKU57u3v+4hu7PhEJvLeiWJY27tjkMVx+JHuiioBgEEpFoxl0VhQqysBGGZ0vD
	k5XBWcN4n4gF4EXdeZK3zupoHUASCT2GGpgY+ur0dhVB1+ZcgfyTZwsAzya8uIOXloqEOd13hry
	X5vWt0ARe158+5qo9DY6UC0txj3TRmwuydbjsVOxxM1/ubJWnYN5+D0BA+nr5oPKH1OqICVTpr3
	fg2vkpsyGBS4RWb7ZdpqvyplHi78bKCR4JN9uA==
X-Received: by 2002:a05:6214:6017:b0:91c:3632:fdc3 with SMTP id 6a1803df08f44-91c3632fe59mr9119646d6.3.1792687377918;
        Thu, 22 Oct 2026 09:42:57 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c37060bb5sm1460126d6.24.2026.10.22.09.42.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 09:42:57 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJvsW-0000000FUPr-2EHZ;
	Thu, 22 Oct 2026 13:42:56 -0300
Date: Thu, 22 Oct 2026 13:42:56 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org,
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de,
	ksinyuk@kernel.org, rodrigo.vivi@intel.com, cedric.xing@intel.com,
	sameo@meta.com, drdeeglaze@gmail.com,
	James.Bottomley@hansenpartnership.com, aik@amd.com,
	jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com,
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com,
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com,
	elena.reshetova@intel.com, dave.hansen@linux.intel.com,
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261022164256.GB3381610@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <yq5a7bjajaco.fsf@kernel.org>
 <atooh7uO2RauUTfY@FV6GYCPJ69>
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
In-Reply-To: <atooh7uO2RauUTfY@FV6GYCPJ69>

On Thu, Oct 22, 2026 at 05:38:22PM +0200, Jiri Pirko wrote:
> >I am using this to understand what the IDE setup flow would look like,
> >but it is unclear whether the connect flow belongs in an attestation
> >framework. I understand the desire to pass the certificate slot number
> >as part of connect, and sysfs is probably not a suitable interface for
> >that. However, is CTLV the interface we want to use for connect?
> 
> I was thinking about this and "connect" really does not belong in the
> attestation CTLV (same applies to "lock"). I was thinking about some
> parallel PCITSM CTLV instance, but that does not really click as well.
> 
> Currently I'm thinking we can maintain existing "connect" in sysfs and
> extend it with "lock" sysfs knob for Realm side. Both would create
> ctlv-attestation-spdm instance. The same spdm instance may be created
> for other non-PCI-backed device.
> 
> The proposed host flow is:
> 
>     sysfs connect: select tsmN and prepare the connection
>         -> negotiate SPDM and discover certificates
>         -> register ctlv-attestation-spdm instance in DISCOVERED state
>
>     SPDM_GET
>         -> populated certificate slots and digests
> 
>     EVIDENCE_GET(CERT_CHAIN, blob-instance=slot) /*optional*/
>         -> retrieve candidate certificate chain for appraisal
> 
>     SPDM_AUTHENTICATE(device-generation, spdm-slot=selected_slot)
>         -> authenticate the selected chain
>         -> complete backend-required session and IDE setup
> 
>     sysfs disconnect
>         -> remove the attestation instance
>         -> destroy the native connection

This made sense to me, I haven't reached all the details of SPDM, but
this is like what we discussed at LPC.

I don't know how much SPDM stuff is done at 'sysfs connect' time vs
how much is done at the first request. None of that leaks to UAPI so
it doesn't matter.

This changes things so IDE does not setup until SPDM_AUTHENTICATE,
which seems reasonable to me given all the constraints.

> The slot is therefore selected after discovery, rather than supplied to
> connect. The attestation instance represents the prepared connection; it
> does not exist beforehand as a controller for a disconnected PCI function.
> 
> This requires a staged native backend. It is not how existing automatic
> sysfs connect behaves today, and those backends would retain their
> existing behavior.

I don't know what we do with the half completed sev stuff. I would
prefer everything align to the same flow, obviously.

> ># ./ctlvctl/ctlvctl --spec-dir=./specs/ exec ctlv0 connect pci.generation=0 pci.tsm-id=0

It is pretty cool you could just make some edits to the schema and
then use them through this general tool, kinda like sysfs, but not
like sysfs.

Jason
