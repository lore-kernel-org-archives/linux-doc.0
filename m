Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793953670;
	b=B51SVjdr8i3y/7herKgVSI8fa97l6t7OguzIYJ4lLZ3UeyK3IvYuwsMEtvRtVOerkc22
	 zmE5TF9YnXt0uA6QY6LAQtQGRpHeUbVDsQSbRoSUGdX9hoc8neKpHgC43obE0+6tQePxU
	 4BNVKMa1j8cgr677WKUYjusINTdd5SG1r7Vvp0yvwj0+Zwk+CZHIXPlRyAI7wh4B7boZU
	 RqSytgPWSEOFgFQjZlVxD28UztMbUM8Kt+ygI2VTemvBk/kIIrEh80uZp0jvAyEsiKzcm
	 iQeC8FVrETFtvhGigFiqor9DvhXNqhzjdKFbdWn6GhTaUYDd4nXNO4hyYQjn+erGJTQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793953670;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=eFyf1J2eCmzdcygEsnj9uuRDnIkV5nwpe7sUFMbcNPA=;
	b=mnBHhMx/u/dIodx+l6A7EnIhpPwEhgLFLzu/QRwoqKJSj0MLZEswfIuXJ4X7wugOxxkT
	 4bkXkCVskNLSOwzJpufXqWOUjdcEm/PnvO/C1s1PuIWeEoFWQil+K7rj9Bo0y4O/DIsOj
	 /ofCpGV2a6auloyqcJeAGNIsE3y8sUj3ufJPkswuTcJjHZXyIsZAmNZIkLf+8ENrP1sii
	 zIrh3T0Wnl8dP5trvlwFgpI2bDIX9al96EWqINnA7bHAOdC5QMK4XqMBzmP9tgLlHc1yQ
	 7U28tISnFIZpTutyaxS6WvQ3Q7/WxniX3vcDGUavdRbuxZzyiNfAVpYeWJvoVaYM+cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A3FC606A333
	for <linux-doc@vger.kernel.org>; Fri,  6 Nov 2026 08:27:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A3FC606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-490d59c3f0aso145365f8f.1
        for <linux-doc@vger.kernel.org>; Fri, 06 Nov 2026 00:27:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793953668; x=1794558468; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=eFyf1J2eCmzdcygEsnj9uuRDnIkV5nwpe7sUFMbcNPA=;
        b=B/rSxcDlMYnthEPXsv+Dey7MmueZn3MQHpzmfFmdz1qKA5YAzHst+P9vXXtmfUjBQd
         Hdo9pdjh+loJd+rBiJmMoikQfhb0UunnrP0Elsn0wtcOJK5yGfwrv7yB5A5r1O7aEZ6N
         JKoqxQnRiR3gEpt3AYwAVsU2u4+l2q+hP33U4CSayE/Uxg/PHBIy+CSfOyKmo3a6U0hF
         CoMD+sTdwlw31W6xMku/iAxMVKl4QD+AzugLDDpHwuzMW/hxt5bfWmEDVgpP/L4oJclM
         6+zD7o/sl2wTljFv+oUaeCGHHdQWPtNEG2pghabPaWW4g0MZgOfU+JN06X9amJ35uAOt
         hiZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793953668; x=1794558468;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eFyf1J2eCmzdcygEsnj9uuRDnIkV5nwpe7sUFMbcNPA=;
        b=vZgLxcpZFuHoZE87jWVgjGtQWDNt60tMlirNKc78oNXbtAt+Zzs87n3y2njJqcUGdN
         3b1LPNtWOiDBhl5zfKXyqbizAbXdS65cL7zaFRcQaGDAnQWnK6IE3nqJ0SdJL499wBDR
         nQlukRb3OtxNhVS61ABRDm0rBvXpPMkWNmzAi0vdKYqKHLk529jbBnPFIcmltZQ/z/TW
         NlSSRNGirUFDZKwGr4EbmbSHDc7h4uV6WLmndtz8r7Nt0tVzK18XEgst7yr4yiD2fN8E
         udrz/aAd5FMckdIjwUgxTyQDf+cN6D6pXYX85bwYKDpYkU6opcvTm+jw+OuXJrZud4st
         HmEg==
X-Forwarded-Encrypted: i=1; AKwUvBxmCZiBoTbGbwPxBMcKDb9xn0BHj0zfzmQfBSIZ7TS4NaLUk0E1AqJo3NvMn6yxpt5b/OCe6VfwvmQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/xdRMFZbORBrs8B9d1sh8q2e7er/09A33lInJEe9/ZHAWVZtF5
	DaiWtGt85RK7Qh5ca/fATxvsBqQ0D4fgJbt3q6yFZKT2xyA3dEFclReSvazFgzpE03M=
X-Gm-Gg: AYBFou09obwBzM3gatpbwi6QHec+I6O5UBL3avH6I9ORfgQJY26LL3BA2yig1ktvDre
	9VBGUEXQ9cw0YZ4k2uoi2gnMu9EPEf0wfD7MVVDx590rN0Hy96RoemqOmED/dFztIe+Xn+z4dhq
	quL0cBbFGAol8cQw0pvYtABjzdZzig/q2vsTLGgg1MdRR/mTmYQpRH115EolUlWWjVp2yLapB/y
	mylW9qNR5oDyDXFgpbOHoCqDwxoJ1BZgtVFo33GUztMXUX7Ub+9DCPblyWG3mpfhBJzOtL3bjr3
	BE1KvbQSqxchTg9CvnFncJ1LI9AG1ugKqRA7WKnw0s1rk3EmzcZ5liw8FoAg1r8EGfDGiZDHXce
	KeMUR18vPdwwwk9Xa5hHEbbjAjeoMFBC6lbSlJ4ufH7IPd7hNZq/Ntb6wQvIcccm3aw/XQEHNnN
	2GzytbyoC17ldt7riqvcqdAeFA3ukvlpIwQSEDM0yjBB+fM1UMKR5HblQtkQSE940BeZJ+pkmVY
	vPFfvxVpQYrjBsVFPp54YAodraF+ItXtI+GnyMJKhP3B6SNtwAaCzdbbgx3V80fL2p9yD+BZae3
	hxIU80REMJRgQaXQ3bIFDZtdyyZIbpSP/vbpYnP02Nd34LSVkvpiPDbalcOd
X-Received: by 2002:a05:600c:3e0e:b0:4a2:150f:1605 with SMTP id 5b1f17b1804b1-4b6dfba908bmr27264855e9.24.1793953667539;
        Fri, 06 Nov 2026 00:27:47 -0800 (PST)
Received: from localhost ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b73ee651b7sm16201965e9.0.2026.11.06.00.27.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:27:46 -0800 (PST)
Date: Fri, 6 Nov 2026 09:27:42 +0100
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
Message-ID: <auy7IM0_S2tv7EZX@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-18-jiri@resnulli.us>
 <auuDcABX27EeTApl@e129823.arm.com>
 <20261104194622.GC3889730@ziepe.ca>
 <aux01NUd85PabtZu@FV6GYCPJ69>
 <auyKE2sGqtfjk4v5@e129823.arm.com>
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
In-Reply-To: <auyKE2sGqtfjk4v5@e129823.arm.com>

Thu, Nov 05, 2026 at 02:52:19PM +0100, yeoreum.yun@arm.com wrote:
>On Thu, Nov 05, 2026 at 01:32:49PM +0100, Jiri Pirko wrote:
>> Wed, Nov 04, 2026 at 08:46:22PM +0100, jgg@ziepe.ca wrote:
>> >On Wed, Nov 04, 2026 at 07:11:44PM +0000, Yeoreum Yun wrote:
>> >> [..snip..]
>> >> 
>> >> > +static int attestation_evidence_request_decode(struct attestation *att, struct ctlv_op_ctx *ctx,
>> >> > +					       const struct ctlv_cursor *request,
>> >> > +					       struct attestation_evidence_request *decoded,
>> >> > +					       struct attestation_evidence_object_request **objects)
>> >> > +{
>> >> > +	const struct attestation_evidence_caps *caps = att->provider->evidence_caps;
>> >> > +	u32 challenge_length;
>> >> > +
>> >> > +	decoded->challenge =
>> >> > +		ctlv_attestation_evidence_get_evidence_challenge_get(request, &challenge_length);
>> >> > +	decoded->challenge_length = challenge_length;
>> >> > +	if (challenge_length < caps->min_challenge_length ||
>> >> > +	    challenge_length > caps->max_challenge_length)
>> >> 
>> >> Hmm, I'm not sure whether this check is required for
>> >> ATTESTATION_EVIDENCE_BLOB_EVENT_LOG blob type.
>> >> 
>> >> for example, if the provider provides two evidence:
>> >>   - ATTESTATION_EVIDENCE_BLOB_PRIMARY (might attestation token)
>> >>   - ATTESTATION_EVIDENCE_BLOB_EVENT_LOG
>> >> 
>> >> might challenge is reuiqred for generating the token
>> >> and this would be marked at min/max_challenge_size in evidence_cap.
>> >> 
>> >> However, in case of eventlog, it wouldn't require challenge.
>> >> for example, TPM event log or CCEL event log.
>> >
>> >Right
>> >
>> >> Do we need some field on attestation_evidence_supported_object whether
>> >> it requires challenge or not and applies this sanity check per the object?
>> >> 
>> >> Otherwise, to get eventlog, it would need to send *dummy* challenge
>> >> always.
>> >
>> >I wonder if we should have two interfaces here for signed and unsigned
>> >evidence? It would be clearer for userspace then when it needs to
>> >provide a challenge or not.
>> 
>> Isn't the challenge field provided/not-provided enough?
>> 
>> Currently on the introspection side, device-get op would provide
>> challenge-lengths array:
>> 
>>         evidence?:
>>           challenge-lengths[8]:
>>             length?: uint(..4096)
>>             min-length?: uint(..4096)
>>             max-length?: uint(..4096)
>>  	  objects[16]:
>>             blob-class: evidence-blob-class
>>             max-length: uint
>>             blob-instance?: uint(..u32-max)
>> 
>> I think it would make sense to have challenge-lengths array per object:
>> 
>>  	  objects[16]:
>>             blob-class: evidence-blob-class
>>             max-length: uint
>>             blob-instance?: uint(..u32-max)
>>             challenge-lengths[8]:
>>               length?: uint(..4096)
>>               min-length?: uint(..4096)
>>               max-length?: uint(..4096)
>> 
>> Then the unsigned object would just simply have challenge-lengths empty?
>
>This looks good to me. :)

The challenge is one of several open points that all depend on what an
evidence object is: Rick's TDREPORT, legacy versus DICE Quotes,
"primary", "raw" and the format strings. Here is my proposal to settle
these together:

The model:

1. device-get lists each object with an id, a class (signed, event-log,
   cert-chain or auxiliary), the formats it may come in, its max-length
   and, for signed objects only, challenge-lengths.
2. evidence-get names objects by id, as MR ops name MRs, each with its
   output blob. It carries a challenge exactly when it names a signed
   object, and the challenge has to fit each of them.
3. The reply gives each object's format, length and, where the TCB
   vouches for it, the TCB's digest. The output is always {label, data}.
4. A signed object is made by the call, over the challenge, and never
   reused. The rest are read as they stand.

This settles following issues discussed during this patchset review:

1. One op, not two. Per-object challenge-lengths tell userspace when to
   pass a challenge, and one call returns the signed object with the log
   and certificates needed to check it.
2. TDX's TDREPORT goes: it is MAC'd for the platform, not signed.
   /dev/tdx_guest keeps TDX_CMD_GET_REPORT0.
3. TDX's Quote object lists the legacy and the DICE format. The provider
   labels what the host returned and fails on a Quote it cannot label.
4. "primary" becomes "signed", manifest joins auxiliary, spdm-vca,
   spdm-measurements and tdisp-report become formats, and signature
   goes, as a signed object carries its own.
5. "raw" goes with the representation attr. The TCB digest is a reply
   field, so a blob always holds the object's own bytes.

Formats become an enum each provider family defines, instead of free
strings. I'm still unsure if format should be entirely provider-specific
and defined as "extension", or it should be somehow mixture of common
and provider-specific. Looks there is not really much common
anyway, so I lean towards provider-specific only. So far I have:

======  ============  ==========  =========  ===========================
Family  Format        Class       Challenge  Bytes
======  ============  ==========  =========  ===========================
tdx     quote         signed      64         Intel TDX DCAP Quote
tdx     quote-dice    signed      64         DICE-based TDX Quote
tdx     ccel          event-log   none       ACPI CCEL log area, a TCG
                                             crypto-agile event log
spdm    cert-chain    cert-chain  none       SPDM certificate chain,
                                             instance = slot 0-7
spdm    vca           auxiliary   none       SPDM version, capabilities
                                             and algorithms transcript
spdm    measurements  signed      32         SPDM GET_MEASUREMENTS
                                             response
spdm    tdisp-report  auxiliary   none       TDISP interface report
tpm     quote         signed      varies     TPM2_Quote's attestation
                                             structure and signature
tpm     event-log     event-log   none       TCG PC Client crypto-agile
                                             event log
tpm     ek-cert       cert-chain  none       EK certificate from NV
armcca  token         signed      64         CCA attestation token,
                                             platform and realm parts
armcca  event-log     event-log   none       Realm firmware log, if any
snp     report        signed      64         SNP attestation report
snp     cert-table    cert-chain  none       VCEK or VLEK, ASK and ARK
======  ============  ==========  =========  ===========================

Did I miss something that would break us here?

CTLV layout draft:

    device-get reply, caps.evidence:
      objects[16]:
        id: uint(..15)
        class: evidence-class
        # The reply says which one was written.
        formats[4]: evidence-format
        max-length: uint
        # Signed objects only, entries as today.
        challenge-lengths[8]?: ...
        # Descriptive, such as an SPDM slot.
        instance?: uint(..u32-max)
        # When the TCB vouches for the object with a digest.
        tcb-digest-algo?: hash-algo

    evidence-get request:
      # Required exactly when a signed object is named.
      challenge?: binary(1..4K)
      objects[16]:
        id: uint(..15)
        data: blob(out, va memfd dma-buf)
      # selection, privlevel, service and options as now.

    evidence-get reply:
      # In request order.
      objects[16]:
        format: evidence-format
        length: uint
        tcb-digest?:
          hash-algo: hash-algo
          data: binary(16..64)
      # The generations as now.

Makes sense?
