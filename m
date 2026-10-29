Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793266379;
	b=D/HlWs856dsDP6oO69jeRIjPtj07nk2+35H8g6GeuAXuwM1NZm7BFY4EvRPj/T9xSHVk
	 YnCqYFtuRDus//k1RwSMgpDPXIQ1H4TVjvsNbSWo55JpLa6pVyC7f9iI1YoqIgRk3jKXk
	 tjeAVQVByFNxyV77qTiaeoNcvpmYUt2jc2qoZ3Q193zKdM3UHtpuBWGEJZ3B+2gF7NlBO
	 +39gU5U3UXR0xj0R9FS3tuEsk1wRSaiqe2dPC/qv9QXGiOwQ91kv0jln2BJNs3gWD11U+
	 FXnloFhi25JW02/VRXllBeGiMFutA/BXEo1CxKX0YIbYEb8NtfdIuWbYyVu4iHSXP2A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793266379;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
	b=Z77RA3azOLGd+xMR1bsF1duKhtU4vz2rLKgTVrs2Dv2l/SC6boVlm0pQNFMDXejv1Mf3
	 DAaTssn/4CkZ3+v9VfcZkltxVKvPLXXMMR7blRk7HF5L7iYlh2893DPon1Vc/C5FJO+LN
	 3UNsA3IMO7S46p7gj2V/F/TC6j1sPPii5YxowHl1eXHbXVQelHXQB9mkp0qiAjlHhM1u2
	 Pre/0T17DIxDhTs/gRA3EiKb+DVSpn5389f4kwzlhQmWIQqx1e7+HUfTY4ZGfxFQSWUo1
	 ZgcjGAjsmAEfTPwCR4m94DyA+XAawj+URV/yiV6p/oZhv8nQi+cDqiRDkOEAPbaTX8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=resnulli.us;
	spf=pass smtp.mailfrom=resnulli.us;
	dkim=pass header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=QH69CTU+;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA436606A320
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 09:32:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BA436606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=resnulli.us header.i=@resnulli.us header.a=rsa-sha256 header.s=google header.b=QH69CTU+
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso15518765e9.0
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 02:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli.us; s=google; t=1793266377; x=1793871177; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
        b=QH69CTU+mXD9r/mvEuahgml2HOKFQRQJRW8BDZn+++9cViMZQc/pcNx8tmGqUlzfst
         VGUgif0Z8D7dZmUQqjKAyfKtT49slL0aATVCJvSp8Pah7juV8r8n2umG7Hsbtw7LWYXs
         e3Lidy6xFzE4p4IJ/Ru/yw1c4e6NtsU5b+8JxoyD6sa+3d/+tTabLmRxA/oJ9qkiL1Ir
         hP8YXvceBTsFHvjt4RNrthEjgcD61ucWib5a7uANRq+iQ6GS+WgvB3ZcOP3yzxdiOdOl
         LJph8ZfuS8zWbl59DoBWEwStQfyFGxQ/qLXI6YS4TDEaxNEqX+9iCbR8qm/HQnRzaKUm
         NX2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793266377; x=1793871177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=25Xe2LGlhfjUVvHKZS8zB+EQgKUVnKIy/4iS8f7+DSY=;
        b=nPBvf27qsWXXr0P0qso2TaNmPV1Ob7jdcJs4Bf1DaCxmxKnc6g/HEk2q2rINxBDU9Q
         kmJ+Iu4PT5CN08b3smrw7J8R3yR4LonxBPqjZMSsqN8tZQDweggeHWowT2ZuffEHHQuS
         VSlofB1fRWvml4OIupVnYhpZiyp+mgOEFhDgZ/OYFwuA66JLLqjwvr2qGdYGabUXchqO
         kqfi1Zz7/BAEdWFx8yQ8khLObOlJltu2fVN/8rEaUjJ5FPHiuhpHIudG53kCTgUBd/fM
         xVy9lkca8u/yjNjQihr8WBi9jRFlrihNfvX6e8cM67KqbLPXWo74ad/gsimBz9gkuVGA
         MICg==
X-Forwarded-Encrypted: i=1; AKwUvBwqN5EdbdNRVUiU4UUb8NrH6/nPL7OgluRypDOQYL6QTz0dnId7d10Jvfdd0FZ4vhcZlb3eTSSqrfA=@vger.kernel.org
X-Gm-Message-State: AFq9FYLiYXERV2sBdefUvegd/laxBsjLtzK/bG5j8VRz3xYWRrB6wSOn
	hG7dUTBrI8MAi2g2YrslZeXPkUQhh/5HYhAHCTicfzCTQnBdZTeunsy9NXWIG8lfb7M=
X-Gm-Gg: AYBFou29YtwTJcDARv5iXTVOwfk4kXSg+3QZhQ0k/N/v/G4KzQZTY+d2ItqLbAY0QEe
	oOl8gQfJlWQf+Ac4A9Jy3Oq+2TvGWoeekrJXcPXRkASIbjMZgG14G9OGZJkyL3chrb+TGtSOBh0
	HaGR9SgfdKuT8I2c7fFxHF8P/+uz6fZd1rBQrxvbmWGUkZO8uf9kRjhPl4PQzRn0Yk+be4x7Pvl
	Eb7DujOpGLTnBv6TDRjQ8oKIxjuem1+yCBWcKu2JxrEBt9HAoHn9IUYE9vWFPvj6SGgMbCxVspJ
	1MGwadDYWDZieYSkUIiTg6Tz17NmyvbAOWwTSahTynYr79Q3P80rGgUAQSB8uCL4e+8h89g3TcJ
	P0pqOmLf81EhgKPSDFSoxUajQjVFlmG/8zrxfiH8T9QVF+XcSIF6/RWQaBtLfUs+8XioW4q4b5t
	dqfA1mjQlJSWvAOLAyHjEc7+ss3C/PfO/R86zLxsrzUALlrdfGanEuePceWxdvr4gmAY6nSVDr5
	OMgDhJxzYOE4DMmfQKss7PLSkscVErKkQCaqNSMSUmF090vM1RxZQv+r5rutmp9yWkoLnaAW4Bt
	Zxy4wvDNStAq/oTCLwjgGNDoBWOQiYEG92YEuQ==
X-Received: by 2002:a05:600c:1909:b0:4a2:1e1:d55 with SMTP id 5b1f17b1804b1-4a9675dc5cfmr104826795e9.28.1793266376792;
        Thu, 29 Oct 2026 02:32:56 -0700 (PDT)
Received: from localhost ([208.127.45.21])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa80285b2dsm52889635e9.13.2026.10.29.02.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 02:32:56 -0700 (PDT)
Date: Thu, 29 Oct 2026 10:32:51 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: Dave Jiang <dave.jiang@intel.com>, linux-coco@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-api@vger.kernel.org, x86@kernel.org, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, david.quigley@intel.com, lukas@wunner.de, ksinyuk@kernel.org, 
	rodrigo.vivi@intel.com, cedric.xing@intel.com, sameo@meta.com, drdeeglaze@gmail.com, 
	James.Bottomley@hansenpartnership.com, aik@amd.com, jpiotrowski@nvidia.com, qinkun@google.com, 
	pgonda@google.com, jic23@kernel.org, alistair.francis@wdc.com, ankita@nvidia.com, 
	suzuki.poulose@arm.com, kas@kernel.org, rick.p.edgecombe@intel.com, 
	elena.reshetova@intel.com, dave.hansen@linux.intel.com, 
	sathyanarayanan.kuppuswamy@linux.intel.com, peter.fang@intel.com
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <auMSPNNXZv1f43v7@FV6GYCPJ69>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
 <20261027234658.GL1685504@ziepe.ca>
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
In-Reply-To: <20261027234658.GL1685504@ziepe.ca>

Wed, Oct 28, 2026 at 12:46:58AM +0100, jgg@ziepe.ca wrote:
>On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:
>

[..]

>
>> >> 6. tdx_attestation_test's discovery_and_construction_fields expects an
>> >>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
>> >>    directly, which gives 3. In a real TDX guest it fails with
>> >>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
>> > 
>> > I would have naively guessed this should inherent from some SPDM family?
>> 
>> The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
>> no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
>> directly, so I think the test's 4 is what's stale. Jiri would know for sure.
>
>I think TDX report/quote/rtmrs should be a different familiy from TDX device
>assignment SPDM. They are completely different things.

correct:
1) ctlv-attestation-tdx
2) ctlv-attestation-spdm

The spdm instance is backed by particular implementation/transport.
