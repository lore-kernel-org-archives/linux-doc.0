Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792571629;
	b=uWLqV99Zhlv5H6K6zGCJu0E8EkLf33Qe0KXlJcHBA9IrzRsaTnCDCnQbvjiRZr4isGX7
	 8dYEy2Q8ix1DIDF9gRjev4/nkB+engzY3apVqb0YGakLmQDNJXCshhxiBkhy6HBdjYLo9
	 4wNHW9novceOv4GC+noqoAp+sx0GTIYu5bDaE05zvFJKLA10CB4lBWRmiZv/LRM2xCHVV
	 wRQtff7BOzBCvIbe7h2YJE0Vj2N01Lj/ih0DZLoUsLNWSej+24DY6AiwTYnv9mP5j+Qi4
	 3t4NI200AdpU1cPCW7eVpZ6AxBYf9mUbA0Vbs5Opka6u76dKIn9t+7YzORIMoJHI4Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571629;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
	b=xWgdiQNRlEEm6qC4zUF7d7cr1T41jNxODKSBc1vtMIIA25VLLWSL5pMOm+kAN3ezjLEQ
	 0k0/J0aHgtfX2EAcuO1gU0niZb8wWdMAugBr1bdwJPzVrCSrKAcLEg/hSxdiIDq34KbcK
	 3ZgQg9YPXzQLrGCDxWFWd3cV3LR3XhV/8uf2HLR2Ci5CN95GXz5mOtslw3WOxKmCglRSw
	 DrkCtaIE2TaQC+9T9iaoParGp4/rSkInNDASH1DrTA/yCKV+a3WWSGEwKSFnCYCEO9qGv
	 1r1HZZaFvHsfKPO46aIBbJzMN9HVzn1x1JhYiKBhAwZ/SE4qS4QGW/2JVoSj653HS0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=resnulli.us;
	spf=none smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r1hMRlHN;
	arc=none smtp.remote-ip=209.85.208.179
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B209A606A324
	for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 08:33:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B209A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli-us.20251104.gappssmtp.com header.i=@resnulli-us.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=r1hMRlHN
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3a75f960be3so5472961fa.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 01:33:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20251104.gappssmtp.com; s=20251104; t=1792571626; x=1793176426; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
        b=r1hMRlHNKxIdoWis5K35C0U6pBm/7vNAgzUYPNgxOyTuaDmbox0SdKa3Ggu77kAXo9
         rx0sLojY9MY9eLFQIVMHli3lNQZF2pRQk1oj9UIPHdLe+glHwLaXZMBcNRKoKzrAGHCm
         RLbhUnQIZKY/yfqBWeMKXDCbkqoQKxbCGe9L2+zfRkPFrs/VO6vJRcJF9R6Lh6G4gaTz
         TGLocTMhr3rye1aGRVzJwZyy8sUY+ZPXNgASDnkSNH6lSPL7LJ5xacv81opcvCqAzqkh
         PYvYMLTGXfSCpamswAeCascR7b80RgejQnTkoh6SIcsrWyzSurXxqIr7FEhSXISWAsPj
         bDMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571626; x=1793176426;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xztp8CA2EuYwLkJWXTD7L/r6UpbaCRk0H8KiI8WbX/0=;
        b=NEs09JY/l6LQlP8mN2wDaAQzTbUShP5YcRzfdildPrEkvKUkJhzAgJEuGY3o//1dUI
         /LGUIBOfAxyyYBdvdeMWZS9UkRZYYglOXvQ2mypz6T4SuhKDJJ7SEBpJkeEPvAHVxNMx
         9ctIIGR8UGaUARknG1kfpdnOFFOA8JVFxFgFydKxgT82vYRoF6QldD2DdHtEYX2zJu2Y
         AkCNBpJzZL4BtP+WKD6O/wRL+Cc88mSs8EbFzg4J0P8EGahWQ6IikvA28CsKETDW327V
         Hz7X7lxIsG9mHW5g9o2h1ThKQofkU4uZusxU2vxwYMjA6bDLc9CI2avcOGQuko3z6oAI
         YzyA==
X-Forwarded-Encrypted: i=1; AKwUvByXxEuPKxingb8UD6drbVEy48ji/DTzw2fTm0ytIoD2bQHq3imyB9T+8xV6zBPn0WMGCY6Blv5SXuk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIeHMY6Lbtsg6u2lA7FpurD4hh+d65sybnjCsj5cOG1kLLAMIsR
	HJNLqx7QDwGxIzq04ehE6zq/AUhFXQ9nDN2FolV2Yn2ZmkEBeEaLEue3zwFjWD0cNmc=
X-Gm-Gg: AYBFou0ZJamwR+UfVFL5lHxeD+YmNwuzwMy87fexIkTeDywhiqJj8f106u7h7EcbXOu
	PHNo0Y0zmqELJjVodW4t6g1QdT0u+UumJEdxeWhjz95JYl8mmW5ChjICkPAiyq0ngIEkuO94SGI
	P2xVpRIJYmzgCtWTmaJZFzrqfObAqRvwEf/+cTshgXQiJypwfEi9BWUqZiuF72BisbKf0YWrBoc
	rzM5kix5dVwXiH3iMxyBC3AY7yPnhi7rksTArGPEhPNyJ0y2Q+16el5K2jLWgvVzp7mDgQbRyxs
	UGIZYQLTAXUCV5zVyH9xlLD5jZWM3EFi9WOwUjpuihjhsaAVff0efl5NJK3JyzXEAxlaY0CXRvU
	0apcNSRQ+iOkgeDhzsO05ffga3dnDz/Kjca1ZDyquJaAVw70Xhupih7qA8L3ocf140mySj28Vww
	6633AxMtwLXxpeZixx1GG6a3qJaqZzPcGQN6Dg0h5N9B5gvBMgDdMcHGbhwpkER9Y0lOg/L/yxx
	vf/UduL1zUOveFSCzjKiKUnIvl/bqCgUXwXnyZPSP+UdqtxyjNkDkLLPiMRFzBGbVk=
X-Received: by 2002:a2e:be10:0:b0:3a6:692d:b7ed with SMTP id 38308e7fff4ca-3ac441af820mr4315381fa.20.1792571625331;
        Wed, 21 Oct 2026 01:33:45 -0700 (PDT)
Received: from localhost ([140.209.217.212])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3ac43772cb3sm4553341fa.16.2026.10.21.01.33.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:33:44 -0700 (PDT)
Date: Wed, 21 Oct 2026 10:33:42 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Dionna Glaze <drdeeglaze@gmail.com>, 
	Jarkko Sakkinen <jarkko@kernel.org>, linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, linux-doc@vger.kernel.org, 
	david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, rodrigo.vivi@intel.com, 
	cedric.xing@intel.com, sameo@meta.com, James.Bottomley@hansenpartnership.com, 
	aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, pgonda@google.com, 
	jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, roberto.sassu@huawei.com, 
	zohar@linux.ibm.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <ath4vwt7KGyDXKVJ@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261016234354.GA664420@nvidia.com>
 <CANwfdvXFLJpC4Bc1PwRoUUP20fu2K8b+FHZ1JLLFXAikC-cBaw@mail.gmail.com>
 <20261017203407.GM13920@nvidia.com>
 <atPgqROZZxnihYfC@kernel.org>
 <20261017231007.GP13920@nvidia.com>
 <CANwfdvVJRv6++MJ8OCUnHSR_5nVD8Yv6eTmYxxqfzxEk0sNfpA@mail.gmail.com>
 <atX9fugGUsI0hGcA@FV6GYCPJ69>
 <CANwfdvUhuQ6L+w+91iDZD=diMmaJ6_2ZsFKkcoiKWOmPMC1oKg@mail.gmail.com>
 <20261019225658.GS13920@nvidia.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261019225658.GS13920@nvidia.com>

Tue, Oct 20, 2026 at 12:56:58AM +0200, jgg@nvidia.com wrote:
>On Mon, Oct 19, 2026 at 09:10:31AM -0700, Dionna Glaze wrote:
>> On Mon, Oct 19, 2026 at 5:08 AM Jiri Pirko <jiri@resnulli.us> wrote:
>> >
>> > Yeah, I was thinking about this and went back and forth. In the end, the
>> > only reason for leaving it unbounded is to allow multiple independent
>> > users of the same register. For example, IMA and systemd could share a
>> > TDX RTMR. The systemd side would read the journal through the
>> > attestation device and the IMA side through securityfs, but both are
>> > views of the same journal. If one side truncated it, the other could no
>> > longer replay the RTMR. Isn't this the valid usecase? Do you see how to
>> > resolve this?
>> >
>> 
>> Bright minds have spent a significant amount of time working on this.
>> 
>> +Roberto Sassu, +Mimi Zohar
>> IMA logs and systemd logs are both system level concerns that are
>> relevant to the OS construction, not individual users,
>> so I would just say to reroute IMA to use ctlv using a kernel config
>> setting, then make systemd the new system manager of the holistic log.
>> The securityfs log contents can simply say, "log managed by ctlv" in
>> this setting, in the form of the template identifier.
>> For policy violations, only the 0... extend needs to go to ctlv.
>> IMA can still keep its violation log as a ring buffer when it's not a
>> 1-to-1 violation to extension
>> https://www.youtube.com/watch?v=gyYUYbdiN_4
>
>I think for now we should not include a new dynamic log here, the uAPI
>around this Jiri drafted can remain a future step. I don't want to
>open complicated discussions about new functionality at this
>stage. The whole CTLV idea in general is a big enough thing to bite
>off for this series.

Okay, dropping the log from this set.

[..]
