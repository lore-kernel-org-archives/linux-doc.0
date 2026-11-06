Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793981024;
	b=0xf6V6dN31Tu9K0Kxvp+PPezWTkcaOxPe7Wh1vsosoI2YvBRD08rTbnvv8kBGrpEytHQ
	 fGzTyIDFn3pMzfoUW7fxl4a3fx4WAYH/qRih1Vh5Dp9kL0Oex1kEz4Kf28HBRuqJVOdY4
	 T0GaYLQCj9kMBxejAfxhPd9QwC9xVv7YQnRTmDr5v+QUPnuERgzM+vPyvkeoUuOq8eLvX
	 MfdIqswEGyBX9sJqk0XHHjaLNfdAMo1EheweUqKVTWSwi6V0T9asHOeSwgFXtutNkYQGO
	 hS5S0YwmntT/GdVrKWDgk0nHU8HpaceZ4i2bUlYmMmATZu7RJstUhDDJfYRiLzEHj8w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793981024;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=t7whNWzXgtf5Zep3rN0eJ8AdaQGIaezCYSMAtMtMDQ4=;
	b=HYTkoYh5T89HMQopuLe7I5thlbqmzMDHtwtmhK57m9gd7i6cXEcZcBD6i9thnBG6Bxht
	 6SX7XVYfH5MkWl14lw/QXTInuiD1C71pfpxvV6KOfDBoXLOc+DFTzdym7O3fY5gn7dTrb
	 3Lfj/iAPmsM6evGH7isigE4LaA6nVZr85djL/PlrCfk1JpFKvNQbRiP9B/X9MzM16yQnj
	 U/zKyr1wEy2m5NHvM/IuopgJVnjJ7f8DhlIvIep9FgR+aJZlU9dtG4hkUMSRROV1tFBlU
	 +tn714xm07SXT105Cv5fyqH2ugjpVjI9otkInQ3bpOYNvVjC78IBexnOpMBQRuTkuYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.42
Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6CED606A32C
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 16:03:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C6CED606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so897179f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 08:03:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793981017; x=1794585817; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t7whNWzXgtf5Zep3rN0eJ8AdaQGIaezCYSMAtMtMDQ4=;
        b=PROVhtFBjiJL+M4D+pdcjRm34WNVU0Biwx7qiIHzLO+Dmg7trp46+GEqUgPKdhEbt0
         3ap1c2ItjCrGDnAhNpOzx4pOWMg27MNi/WxI0zA0O/tfV9zarjUHSb2qO730sdRsXPhm
         YQ5YDp/qnYpkHndm9k6ya2ujKHgrC56BMrPDfy+UR+DiWa0259MM5BWmuhi03/giL/Vw
         LT2ScogfcWZF41AoGkFJmBjLE3tgyE10+V9+O88PZ7pDT3dWGLSb2rsr4Mn2D9hQQarn
         8xnSNFo1XDw577NcafopStS/ls+4DqhJ/kdX/0SOLPI20rV9aiCm8PCAcsTAYx6NLW/9
         dThw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793981017; x=1794585817;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t7whNWzXgtf5Zep3rN0eJ8AdaQGIaezCYSMAtMtMDQ4=;
        b=x1uAvhN4mRZcjgHEuHssNAyupYPnVaOG6uUJhaPxFrMQI4dv7N6rQUfPDPjrpy13SX
         N9KMFQ4W74t2VV6wWPRvZl4alSkP7JM0qYMbaf4DxXlyi1HwnHz7wiqtctLpAmnb4Si8
         cYQZLwlrFYOYZX8BNWdYIr8fM0vOxUinrAv2SJ2VAV3G3K9PPoq26gxRIowO3lB8idgd
         cuFL5JawI5rhkntI4fnj2Ye1GrBzbaXW9YWfZWC93G3+0JyDsDXSw81pLqWVg3z8ywMx
         vFyU+Uiyct+JCQ0+ECaiRzU2yuPI7dVzMmFSbaEq0kv6ixbgiAMcWcJ88K0Ip7mBsqqO
         2YyQ==
X-Forwarded-Encrypted: i=1; AL+hErF1SKdfa9OLvnwXFbFsVW0GAdijOZuK9a3IdKqGkem/66J5HVk8ApXhAXs9s+l6UwRkpWbaZrasuNY=@vger.kernel.org
X-Gm-Message-State: APuU4Z98BTwxMlqH1jS5cPpOPHK0ugBjKiYBoNTl6EkhJ7thaxx5my6W
	jXa8Rz3m06JVi9WmvWQeiRkaGGhV5uTueFFujtMf0mxbJlQo8pp2Pk+XPF6uLDLdgKY=
X-Gm-Gg: AYBFou01Bbb01fbtDJHfP+2h+OQLDMzEQOmp3mlkNyvuO9Zslq3PiusXd7UWUKjFL1w
	8Fr8PGobp3oX1R9fDSnA/nzgvYmlNn0MOkwgSQeYHrjz85Og+UW68rdNa6M0fo4P8VBsYQRmhes
	rFwinqJrIz4v8wjR4a3HMNyG5DbiezlZSmKTH5hegdbD1JCx2CadLw6UXHoxWtGID3OssPmkusW
	hnSIOd36E/CFh2s9l+W1hrfpsfqWIWGWGMMCQyk6WXpmOT6ViWCuKA9jAFSvsLm2Hk/8q+OYIvx
	YCxY+1WuKxg2yUp/yOwhWXyeTX8EWCkf2cuuOSsNBRX13v5su77hp4DXq1Mfg65B0V9e8TrnSF/
	reWA2FiOqcHWiEWY5CqhAouT5beweXPZyalTDP3AdtJbxm9X/hN3jpPIJt43+j2OKACNFKZNp6B
	8/5L2UMMDmPC2pIZl0YUMzmBwMS5YagyvqRIvpfQp8Fq8+Cf9tICx9Pb8cnyHP2iMqe21yK0Vz3
	XejWL3OUn45t5rnj7s3Y82qfxdhkT0NAICb/48ZIJMrbHRQF0fS8Iq5605Fcn2sdW2OWZFM0QQw
	a2XTGgw0l6snQUGpnyB0gxZ8XGqGkUUZZLuI
X-Received: by 2002:a05:6000:46d0:b0:490:b23b:802d with SMTP id ffacd0b85a97d-4927740356amr3723333f8f.37.1793981016857;
        Fri, 06 Nov 2026 08:03:36 -0800 (PST)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d7701b51sm4353763f8f.37.2026.11.06.08.03.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 08:03:36 -0800 (PST)
Date: Fri, 6 Nov 2026 17:03:32 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com, aneesh.kumar@kernel.org
Subject: Re: [PATCH RFC 17/20] attestation: Add CTLV operation handling
Message-ID: <au34wXtIqii-hfFI@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
 <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
 <auy7IM0_S2tv7EZX@FV6GYCPJ69>
 <au2WdWFOYbPEv0Uj@e129823.arm.com>
 <au3i-0eDzJZaWukx@FV6GYCPJ69>
 <au3mAsQrh0GniXJo@e129823.arm.com>
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
In-Reply-To: <au3mAsQrh0GniXJo@e129823.arm.com>

Fri, Nov 06, 2026 at 03:36:50PM +0100, yeoreum.yun@arm.com wrote:
>> Fri, Nov 06, 2026 at 09:57:25AM +0100, yeoreum.yun@arm.com wrote:
>> >On Fri, Nov 06, 2026 at 09:27:42AM +0100, Jiri Pirko wrote:
>> >> Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>> >> >On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> >> >> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >> >> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> >> >> [..snip..]
>> >> >> >> 
>> >> >> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> >> >> > +					       const struct ctlv_cursor *request,
>> >> >> >> > +					       struct attestation_evidence_request *decoded,
>> >> >> >> > +					       struct attestation_evidence_object_request **objects)
>> >> >> >> > +{
>> >> >> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> >> >> > +	u32 challenge_length;
>> >> >> >> > +
>> >> >> >> > +	decoded->challenge =
>> >> >> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> >> >> > +	decoded->challenge_length = challenge_length;
>> >> >> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> >> >> > +	    challenge_length > caps->max_challenge_length)
>> >> >> >> 
>> >> >> >> Hmm, I'm not sure whether this check is required for
>> >> >> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> >> >> 
>> >> >> >> for example, if the provider provides two evidence:
>> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >> >> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> >> >> 
>> >> >> >> might challenge is reuiqred for generating the token
>> >> >> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> >> >> 
>> >> >> >> However, in case of eventlog, it wouldn't require challenge.
>> >> >> >> for example, TPM event log or CCEL event log.
>> >> >> >
>> >> >> >Right
>> >> >> >
>> >> >> >> Do we need some field on attestation_evidence_supported_object whether
>> >> >> >> it requires challenge or not and applies this sanity check per the object?
>> >> >> >> 
>> >> >> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> >> >> always.
>> >> >> >
>> >> >> >I wonder if we should have two interfaces here for signed and unsigned
>> >> >> >evidence? It would be clearer for userspace then when it needs to
>> >> >> >provide a challenge or not.
>> >> >> 
>> >> >> Isn't the challenge field provided/not-provided enough?
>> >> >> 
>> >> >> Currently on the introspection side, device-get op would provide
>> >> >> challenge-lengths array:
>> >> >> 
>> >> >>         evidence?:
>> >> >>           challenge-lengths[8]:
>> >> >>             length?: uint(..4096)
>> >> >>             min-length?: uint(..4096)
>> >> >>             max-length?: uint(..4096)
>> >> >>  	  objects[16]:
>> >> >>             blob-class: evidence-blob-class
>> >> >>             max-length: uint
>> >> >>             blob-instance?: uint(..u32-max)
>> >> >> 
>> >> >> I think it would make sense to have challenge-lengths array per object:
>> >> >> 
>> >> >>  	  objects[16]:
>> >> >>             blob-class: evidence-blob-class
>> >> >>             max-length: uint
>> >> >>             blob-instance?: uint(..u32-max)
>> >> >>             challenge-lengths[8]:
>> >> >>               length?: uint(..4096)
>> >> >>               min-length?: uint(..4096)
>> >> >>               max-length?: uint(..4096)
>> >> >> 
>> >> >> Then the unsigned object would just simply have challenge-lengths empty?
>> >> >
>> >> >This looks good to me. :)
>> >> 
>> >> The challenge is one of several open points that all depend on what an
>> >> evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
>> >> "primary", "raw" and the format strings. Here is my proposal to settle
>> >> these together:
>> >> 
>> >> The model:
>> >> 
>> >> 1. device-get lists each object with an id, a class (signed, event-log,
>> >>    cert-chain or auxiliary), the formats it may come in, its max-length
>> >>    and, for signed objects only, challenge-lengths.
>> >> 2. evidence-get names objects by id, as MR ops name MRs, each with its
>> >>    output blob. It carries a challenge exactly when it names a signed
>> >>    object, and the challenge has to fit each of them.
>> >> 3. The reply gives each object's format, length and, where the TCB
>> >>    vouches for it, the TCB's digest. The output is always {label, data}.
>> >> 4. A signed object is made by the call, over the challenge, and never
>> >>    reused. The rest are read as they stand.
>> >> 
>> >> This settles following issues discussed during this patchset review:
>> >> 
>> >> 1. One op, not two. Per-object challenge-lengths tell userspace when to
>> >>    pass a challenge, and one call returns the signed object with the log
>> >>    and certificates needed to check it.
>> >> 2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
>> >>    /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
>> >> 3. TDX's Quote object lists the legacy and the DICE format. The provider
>> >>    labels what the host returned and fails on a Quote it cannot label.
>> >> 4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
>> >>    spdm-measurements and tdisp-report become formats, and signature
>> >>    goes, as a signed object carries its own.
>> >> 5. "raw" goes with the representation attr. The TCB digest is a reply
>> >>    field, so a blob always holds the object's own bytes.
>> >> 
>> >> Formats become an enum each provider family defines, instead of free
>> >> strings. I'm still unsure if format should be entirely provider-specific
>> >> and defined as "extension", or it should be somehow mixture of common
>> >> and provider-specific. Looks there is not really much common
>> >> anyway, so I lean towards provider-specific only. So far I have:
>> >
>> >Overall, This is plausible for me with some small question.
>> >
>> >> 
>> >> ======  ============  ==========  =========  ===========================
>> >> Family  Format        Class       Challenge  Bytes
>> >> ======  ============  ==========  =========  ===========================
>> >[...]
>> >> tpm     ek-cert       cert-chain  none       EK certificate from NV
>> >
>> >Just a thought, but how are we planning to retrieve
>> >the NV index for EK certificate?
>> >
>> >As far as I know, TPM NV storage doesn't support labeling.
>> >
>> >Should I assume that the NV index would be specified as part of the
>> >challenge to retrieve the certificate from TPM NV storage?
>> 
>> evidence-get allows to accept mr-selection as part of the request
>> alongside the challenge.
>
>Sorry. Could you explain a little bit detail for this?.
>AFAIU, this is to get the EK certificate from TPM non-volatile storage.
>But, I don't know why *EK* certificate get would be relevant for
>*mr selection*.  AFAIK, the TPM_Quote will be used AK not a EK.

You are right, my mistake. I misunderstood the question.

mr-selection selects PCRs for Quote, or an extend-NV measurement
register for NV Certify.

An NV-resident EK certificate is retrieved using NV_Read. I think
blob-instance is a good fit. For TPM certificate objects, it could
identify the certificate's NV index.



>
>Also, AFAIK, mr_selection is meaningful when the evidence_accept is
>supported.

These are independent. mr-selection chooses the measurements included
in evidence. EVIDENCE_ACCEPT authorizes a subsequent native transition.
The TPM provider can quote selected PCRs without supporting acceptance.


>
>What is the relation-ship between mr-selecation and getting the TPM's
>EK certificate getting from NV storage?
>
>-- 
>Sincerely,
>Yeoreum Yun
