Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446691;
	b=2VBbn+ROvHXHpoFqPkad1+d4kFPMNi1NGWnuhAb9NO3lslhzUO/gw06jz8mNdKBMTMMw
	 YzLkiLEGFGpyDF4jrQ+ZwuhoTcj9VEMd2P8Lr7j6Wn9jNzL/F5QI3NRw92zAW+7ZM0hLS
	 iQIOvJWANLjVXLp7MhiXrvBrdmS7i7SvRUh++CiRrckopykV6lFpOrVkGWaQPiOrJFrAF
	 IumbzhF79i9uinS1JCeF3TIIRu8liYSJspsAFnqusqbFQW4WO5SwiKgBxdQGoBx9EHlgq
	 c+n5B9a6IK28xqSYSJjYxEnJZJdBvMnntYd5obHKIjkAriMzKiC9VjFb4UYdQNLa3cQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446691;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
	b=nFepWEeqIWPG6Z9mr3oi6upvLoKa6lNh6ZCq1IX9p/+EUqI5uVh9a1LYj5EO6huFzWQR
	 iXPD3aHCmN/vvtw4HxXuRcwcOm0YX1KnPQ2ZUvt93uB6ksjzd8FOh2Nr1xPciptJ5wyID
	 T+UT65JCdiF+z1aeSBRKnqfxNsK/E314XeTB3TwvNApQGeMh8J497+usbFJMs5cXA5rp8
	 K2kvuk//EHdlzWMBoZXGAyyVR3+DXrPARwPi5mRdheKyfZjc/pn3YtJ/1L2lXxvgwJ7lI
	 c00cIWVUWYuKZlgkofQlPh8SpYIG7cdCRGhwl82pVMvfXAf0wm/yvZZWGs9t8Mp1TUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ULnOCYsQ;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAC21606A680
	for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 15:11:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAC21606A680
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ULnOCYsQ
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-92110499585so33149026d6.0
        for <linux-doc@vger.kernel.org>; Mon, 23 Nov 2026 07:11:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795446690; x=1796051490; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
        b=ULnOCYsQhWIKDt7pAFJxN5BdezB6uuwO2wH7M3H75HnvcnHu0ePPTzZKt+/E8HJbsq
         8xNQcunddG9jd5Lyy5gXDUoI6tNcqkgliwQBuS09bcwR4F/99g5XmNioCqy1g81xleyk
         LHhAxO/sQfFLnE4JLEDu/YBjhGAidQN37cDWd2dzzVWGUITLsdgtKfpXw8jO/nNEuElh
         tyEhFp/7OKJTeRItfxiGqKUkSnpdV0wQ/c4bCV2HFB7OEb8h0vw3dWK2Ty+VuV9E6Ewn
         yDkmNQkEnylRuyYGR1sqGLaQPOKxcWwfhEHqIAlHska+tD6+MsFsnDzdHU0merc4Sqat
         NOxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795446690; x=1796051490;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S6J608SnbhlVzTHO8nTfTbyQzCC0Wef9AXmftuQK8FM=;
        b=1ArAzM5t77SuNSBbtCn/2D1SFQMmnV7n3JrVqiRJcZhhcxfTxd/ypy9+5ysNlgOCxW
         gK1r5EiMK7ip3b32QNOzAhm7wy0DRtc/baEImKxGRkNgTiRSmervKFx8wQzMU05cnNVi
         uh/gP4m2Su7ZLHmwdNr/0vVnjca/ZSoqnsNg/rVtCom3dO5e7GhsO8FTlUy5f7KrRIfv
         5F52rS1oO4OZiegrasK3L5VgDwZddR24cR9sZPuyA3DZTn0OG4TkMS7bzRzGb5809Yig
         qKXjvPZyj4yQNLa5GX6l197/itQOGfeLppL4VG3buhwvsHju9ObNH2/4QJjy9Jhu34lX
         yFow==
X-Forwarded-Encrypted: i=1; AL+hErEm/+XPFFU+XNyVQXf5GwHOzfUxE/DrEL3KtU6M+h6JqE5M+mEJzZJ9BpSc5U611VtkCyUUJnucPjU=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EwVpaDhH00YcEaEGf87xk2odSFE/pqGQ9ib3x1DKCqimM4oOE
	FbSFHYSQReM36Hl4aR1FB0NkhzIyQdTXqDMpnFfRJG0AFFMD8igFRakL21qh4m2weTA=
X-Gm-Gg: AZFdTZfMMU6QVZaux/YXrZ1U53fVtWhx71xMysPiPaBNE7BnelOZLsYUL+h3/K6buFY
	Lo3UePZjLvnLan4754zM5ZG5ej04sji2dBDtPqOQpylr0iuRswMZlQ86kNgIGXYudiH6Y9mmxGy
	SltvYiqB9sftZu0d2V1HPjo6jb8TH1A4A58wh5q69G+YbhH2wBiMtUrza3c/VNB7tXuhnEl1KZQ
	Y2XXvmaHaLpOvLjLDbL3F0HhBFbmmXHuS+nnofVUvEAloKAL6QzOqRo59i7zalEac/0IsHeDZoV
	hzebDQhZcFghT3N4Vpqfe0O+xNHvk8/Qdz6VGW+oCLE9YdLwqsZjuqzuaTAM60uyhI16UqSGKHJ
	6g6cY5lQFqZl5hm7cGYmuGZLpdh8wUIHVqj3kC2u93QZ2dWyPyZNtyinNFyb4szPv/rgn/InqYn
	ppnd/xwXu0yd+SfdXQ6wuUawX4hzbw2Xp99FNFHIzvPgwrqzc4JCOstpBejfDianVcfiGjj/cXm
	ZdzEvAROtJ8xPeNygkyKwDsxX73j0d68FaLuG3yJNVEZsFnyFkJ+JsaugPB5rEpYqg4kCSSZM7r
	EjCNiYPUhSJGDTQwTZKSiBreLHexS0BPcyt4I+n9lNzGp3yR/hyK+rjjq/uk8liRgKVE96HOOuj
	Owis=
X-Received: by 2002:a05:6214:4108:b0:921:266f:50ff with SMTP id 6a1803df08f44-92134b3f207mr208575596d6.52.1795446689538;
        Mon, 23 Nov 2026 07:11:29 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b50besm106533186d6.9.2026.11.23.07.11.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:11:29 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVVhY-00000000ro7-1hOk;
	Mon, 23 Nov 2026 11:11:28 -0400
Date: Mon, 23 Nov 2026 11:11:28 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: Yeoreum Yun <yeoreum.yun@arm.com>, Jiri Pirko <jiri@resnulli.us>,
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
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com,
	zohar@linux.ibm.com, aneesh.kumar@kernel.org, dave.jiang@intel.com,
	nik.borisov@suse.com, sergii.dmytruk@3mdeb.com
Subject: Re: [PATCH RFC v2 9/9] attestation: Add the TDX family implementation
Message-ID: <20261123151128.GD179082@ziepe.ca>
References: <20261113160838.2512652-1-jiri@resnulli.us>
 <20261113160838.2512652-10-jiri@resnulli.us>
 <awQCrnD5CtEhKRWz@e129823.arm.com>
 <awQz1P6iXYrL8lv0@kernel.org>
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
In-Reply-To: <awQz1P6iXYrL8lv0@kernel.org>

On Mon, Nov 23, 2026 at 02:38:44PM +0200, Jarkko Sakkinen wrote:
> On Mon, Nov 23, 2026 at 09:09:02AM +0000, Yeoreum Yun wrote:
> > Hi Jiri,
> > 
> > [...]
> > 
> > > +static void __iomem *tdx_attestation_log_map(size_t *length)
> > > +{
> > > +	struct acpi_table_header *header;
> > > +	struct acpi_table_ccel *ccel;
> > > +	void __iomem *log = NULL;
> > > +
> > > +	if (ACPI_FAILURE(acpi_get_table(ACPI_SIG_CCEL, 0, &header)))
> > > +		return NULL;
> > > +	ccel = container_of(header, struct acpi_table_ccel, header);
> > > +	if (header->length >= sizeof(*ccel) && ccel->log_area_start_address &&
> > > +	    ccel->log_area_minimum_length &&
> > > +	    ccel->log_area_minimum_length <= UINT_MAX)
> > > +		log = acpi_os_map_iomem(ccel->log_area_start_address,
> > > +					ccel->log_area_minimum_length);
> > > +	if (log)
> > > +		*length = ccel->log_area_minimum_length;
> > > +	acpi_put_table(header);
> > > +	return log;
> > > +}
> > > +
> > 
> > I think we don't need to dump log area with the log_area_minimum_length
> > since the area would include none-event otherwise, pre-exist tool (i.e.
> > tpm2_eventlog) reports error for them like:
> > 
> >   ...
> >   - EventNum: 21
> >     PCRIndex: 2
> >     EventType: EV_EFI_ACTION
> >     DigestCount: 1
> >     Digests:
> >     - AlgorithmId: sha256
> >       Digest: "b54f7542cbd872a81a9d9dea839b2b8d747c7ebd5ea6615c40f42f44a6dbeba0"
> >     EventSize: 40
> >     Event: |-
> >       Exit Boot Services Returned with Success
> >   ERROR: corrupted log, insufficient size for event header: 3
> >   ERROR: failed to parse tpm2 eventlog
> >   ERROR: Unable to run tpm2_eventlog
> > 
> > 
> > So, what about export *real size* of eventlog like
> > tpm2_calc_event_log_size()?
> 
> Nothing in the patch (neither commit message nor any comment in code)
> says that TDX attestion registers share the same format as TPM2 even
> log.

It comes from the UEFI spec's definition of CCEL:

 38.1 Virtual Platform CC Event Log

 If a virtual firmware with confidential computing (CC) capability
 supports measurement and an event is created, virtual firmware should
 report the event log with the same data structure in TCG Platform
 Firmware Profile (PFP) specification with
 EFI_TCG2_EVENT_LOG_FORMAT_TCG_2 format. The index created by the
 virtual firmware in the event log should be the index for the
 confidential computing (CC) measurement register. It is CC vendor
 specific.

It makes sense that the kernel would size it correctly.

> As per the function, perhaps tpm2_calc_event_log_size() should be
> relocated to lib and have non-TPM name like firmware_event_log_size()
> or something.

Probably under drivers/attestation since that is where all the TCG
formatted logs should end up. It should be 'tcg_event_log_size()' or
something. Maybe a tiny module for it like we would have done in lib/

Jason
