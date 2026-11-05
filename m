Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793881978;
	b=0En4z24qvxA01UaeHEHYzqJ9aeEeJvQ5ZIqM31JxyGNwCxmqAziMvNjjEOaHaS/WfCD3
	 u2VITvhMnqVsrQtkGG8FHbd1Mdgx7hsivjcHw6RfacF3wVhxoYslbW08D7SP21iAs1gMs
	 mlqIkqcomEEYRtzri/Q+YVOnEdAcF0iqMDQKzW0vQwHAvgm03Hpn0tz70lLF4r9r2A1nZ
	 YF2JgxL3AFXM+FlaMXd1ml33es2AFjFzgE/GjefOVgsWAACRnTPMYWLAUn0XjjluGuTXN
	 fihHy1hEpgZHIX3ChsDnNe/dUby9rRxmI69YKj4rO8iou025pIVwZQwQ5Uqg4kxHH1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793881978;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
	b=RiEeckGDRWhi9KTxDqIFaK5aBg1qhWRsQfiyvk40G0+IRW/IPV55pOQgqnQN/8iFl4+q
	 aebjPyECgGy9+Z1xsj4h9Hr6uxPMy8FiEiU9VbHVIMC4+EZyq6YUp0tBUSHB9UM0V6r56
	 sKBtTfy2UXBCcmNbyEAT/Qaeciy54IJjeSVY66xlFbdkUOxP8hGrkOav4eFJkSkyMDun0
	 nTaMU1REsQpWa/4s+YnnpGwNKHcU+T9Nk25y1EZVMO/5qqrcXBNSbgWpZDT/OPCTR8iaG
	 RDkNqp5mOdYrsV5nDLfbnRd2MakRiPZn5SnTX+ULvEnpJ5Vj2KM1+iqHuf33i1ahkvw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=cCtFJSjX;
	arc=none smtp.remote-ip=209.85.167.45
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BC61606A32C
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 12:32:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BC61606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=cCtFJSjX
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5be3ed646a5so2291382e87.1
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2026 04:32:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793881975; x=1794486775; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
        b=cCtFJSjXtpRSezyNE06wb3mNCryoz4ZPMqTXXg9EyTCJZDz7c1Wwg43Xnz2iDZHF9h
         uoCWVLQ8jvnyNWaRYluSpDmCHcdouiOJqpYN9KBvHh7ma3RwL36T1cBdawdpqOMfO/a1
         D1maF55YHx7FUilZtWynmISNmN56ev+z3BACC8vviL7dY4cTVG/suNv+f41imfxIare+
         C+bWcbedtAvtUrVKoW0m4EHeVcV77/6F/wIkQEtfvtcI0MozKYY2HozTWAUqXlxvcYfr
         NNTPhbfo1Y4AwQsaGifksj17DoQg1AoaBDPOa/kjNoLrOyT0vE5GD0k95/0RPFy4NjWV
         +K1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793881975; x=1794486775;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RcJPtti5GFvFEoOYZYt06D/AhFo3icPnTOuzdt+NBsE=;
        b=pMD00Qu29puG9rYDTWaRTcOrPupAYYKXUvCaNnIMQuHk3QhN7w7AVI+bZ3ZN7Hmk8Z
         VSX2W4MXtcFl4XaXEtvDFLhlJn2H9sjU0BIsQ1/lJC6bNHzkWUMiPk+xM75XXLJ0Cgov
         4uVY0Kvon7qep2tw4CTSaZcD0vnDwnSQYMgOngHdkWd+qefRZOBWOKcXde0VLxIcoDfs
         fpJgFBPAnaDHL87hbwnidz/YfL23T79n+j7r/QSIE+/xprVxnoofpaxYexdLnRH9PKh6
         b3Y3QcKEBBbPXYhaCoU2i/qd21rHBSEfpdCywo+QL0668yjAaQngwPkFYPlxzuSy0KAj
         8w4A==
X-Forwarded-Encrypted: i=1; AKwUvBz67pfyegquXo+QhxQujlxxPROvbetWzojxTmBagJxoiqc1modVcaZs+dkc5VaKoYKwENFwJUiW30o=@vger.kernel.org
X-Gm-Message-State: APuU4Z+P8hJ6g0yhBhHnoH1n+RNle+f1zUJisolRCOF7gAMxMCdPdHXK
	AL7yneaSI9GthRT/ZFAlIDwSLOmyWQB0K/8zhR/KCToOc1OpT++ihJc643RoKrCxm7E=
X-Gm-Gg: AYBFou3slGvmo06YyrG0uSMwqdhnxX0OfJFG1rq/PCRJtyG3zMrM+HA2UpZjJ+fCjBT
	88k0U2i5i+djeOumqRISjoDvHBVxri1+zH/yyv+7hS20m7BNmM91oNOQHAJ9u0q4CwpptLqt330
	QT9cWgrYHPkJhDeO+x0JP1jlk0xf32NuhP/psykTvgg8cXsjeu3a4X4vAxKIypKt96vEKX4jK4I
	KfWE/5jZBX4G/daHb2TDhRwI4q/rlBagAHQlXRKmpAbh/HllsqxvfbGQBNdS65SWwwChl+Ha92i
	D12Aj+Ec33fBWGkoawnDgEL8sITL+UMuGygx5GRTb5saPaVuPJ/R6ZlS0U7gYeEJkbUkhnugQWP
	t2mHmbW7A67sLW/zyCCuvCgTH8PskjtHwufMPdcKKhGcLBngMZjQy+6xGuh2EUZ0WuSdRzpGcfB
	HcOCq6T4QnHMcPz2s1Gg9uN1Z4JxHaHVZuTlotXFvg1R6pGLwu8jwdWjBGtvi96ZyiF+WpXxyVi
	33Q5yDfjFTq1wEz8Klig1M0TEIvBLoAYEpaMO5xFUnfDLiY3RRBJXytJRVQt4mQnAz0iaL8aUJw
	emT00oAyng03t+h0zxFDtH/g0bUdOrK4nUMwk2U=
X-Received: by 2002:a05:6512:3056:b0:5bf:b96b:2c75 with SMTP id 2adb3069b0e04-5bfd957c416mr7135190e87.37.1793881975197;
        Thu, 05 Nov 2026 04:32:55 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bff38ab170sm875824e87.16.2026.11.05.04.32.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 04:32:54 -0800 (PST)
Date: Thu, 5 Nov 2026 13:32:49 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <aux01NUd85PabtZu@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
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
In-Reply-To: <20261104194622.GC3889730@ziepe.ca>

Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> [..snip..]
>> 
>> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> > +					       const struct ctlv_cursor *request,
>> > +					       struct attestation_evidence_request *decoded,
>> > +					       struct attestation_evidence_object_request **objects)
>> > +{
>> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> > +	u32 challenge_length;
>> > +
>> > +	decoded->challenge =
>> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> > +	decoded->challenge_length = challenge_length;
>> > +	if (challenge_length < caps->min_challenge_length ||
>> > +	    challenge_length > caps->max_challenge_length)
>> 
>> Hmm, I'm not sure whether this check is required for
>> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> 
>> for example, if the provider provides two evidence:
>>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> 
>> might challenge is reuiqred for generating the token
>> and this would be marked at min/max_challenge_size in evidence_cap.
>> 
>> However, in case of eventlog, it wouldn't require challenge.
>> for example, TPM event log or CCEL event log.
>
>Right
>
>> Do we need some field on attestation_evidence_supported_object whether
>> it requires challenge or not and applies this sanity check per the object?
>> 
>> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> always.
>
>I wonder if we should have two interfaces here for signed and unsigned
>evidence? It would be clearer for userspace then when it needs to
>provide a challenge or not.

Isn't the challenge field provided/not-provided enough?

Currently on the introspection side, device-get op would provide
challenge-lengths array:

        evidence?:
          challenge-lengths[8]:
            length?: uint(..4096)
            min-length?: uint(..4096)
            max-length?: uint(..4096)
 	  objects[16]:
            blob-class: evidence-blob-class
            max-length: uint
            blob-instance?: uint(..u32-max)

I think it would make sense to have challenge-lengths array per object:

 	  objects[16]:
            blob-class: evidence-blob-class
            max-length: uint
            blob-instance?: uint(..u32-max)
            challenge-lengths[8]:
              length?: uint(..4096)
              min-length?: uint(..4096)
              max-length?: uint(..4096)

Then the unsigned object would just simply have challenge-lengths empty?
