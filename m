Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793144823;
	b=TG/IVJImvZJEUusFKAns1SVrJUwCIlRXMqUAYvnAg9YdIKfF5302K8DNyZy0LfEGVuO/
	 tqImn8P9rpKoW/ev1BrGGsyRerc1xMF0kg8JNgTc6BpgPkI6PlGf6zrhDAhDvHD+6dihB
	 rycO/Jb1/cWcGh27zqGrLnbtq8UKWlTRBdw7W6PnRPcQA2eEtzXNk7S6bzgQkjMhriI7w
	 i5tPAM1rO6t22qgux93MqsdCFs1gPx11hiiB8c+gspFFK2RpvgLkdX84c+dfZkHkcjKIX
	 stNHw3tb7Ls+bBn7XmIXr7sKi+UKoWYM0rIXjaRCuxPpkqpkBSf+PmZPuBFpwQcOfYQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793144823;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
	b=A3Ui8vAwbHx4SBDrvpMQOUgwDj7PmprTjIFRT2nbDRwWZBhReycV/EzvfsQH9CHvIk97
	 dulB4JwGjWz+YltB/Yq+lY3MSi8JWSRUCotcDMiHfTpTcV+K8zSbF+Uc9KOv9SslsDo7/
	 Z/KCPjJTzOVxw/eFQbp9U8WrbXFFN12ryTY0cPJZpsXhRYAvi3xE7HADYgd2koecXyhBz
	 /f3pLjnmFBISe4LQeqNUK4CuOY7OdIADgTjrXQevaVQ1Ob8Ems5F8/j888IPrAXuxDIKW
	 OUl5CiUyt1w5+EppPpfcHHYIDGmJws5W40fcqNomcJzYiCKp/YG2lybI0drhv/R0ejA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MAMauGjc;
	arc=none smtp.remote-ip=209.85.160.181
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 363CC606A31F
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 23:47:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 363CC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=MAMauGjc
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-53c4b82919fso7135981cf.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 16:47:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793144821; x=1793749621; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
        b=MAMauGjcQC5I4fdPuZtoQnkUL42Ja4RAOKAONT1AHTrTUlXxWwqX6qYADXfsEAR3/j
         hUis6BLTdqxH9lpDGbebIZ+F0qhK+3Gw5A5H3+z2NBgRxi4MH2CtjOQEt/4ZNf155hzB
         oTs4TdzanpcZpR/2BlKJXYZ5ayq9dCJ9KnWTYXDxPIGzp3UbV1x+jJ+RSlif0GRL/dJH
         j0OePIYXBil1ld6ZPKFMsFzi6F38i35BXCm6Zqet5zyQslJePMeaHITZMn+3CDTRQJk4
         QD6tYVzQJvCV1jaXUHg5KQO0GvIXtoG0gYWydzGqJE616loH3WeEVB2M4YGyBB7u1Jus
         n4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793144821; x=1793749621;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0jobZ6lKMJLYxxTCc8I8rfjGuzkz6VIrJqfxqZy7dVw=;
        b=F4kijV+OfqSmlK4K/8nkRhYv6O+Ii0orXn8pcZcy6dv6tZ/TMHl0HuMnd5ppr+peS9
         lQOjCg1jRertyBYclUu6zzMM064ZKg30w4maw+lZV9xUc076SXzo7OBw6CAnCH0xg60C
         ZO1IhQejhkQyJaqt7+R8FUlBU0CDebH/9zLy/XyqKFov8K/nhYF/eh3yVBxe2hKhsIEB
         OBGUWcSsmjy7VQm0BZbrHgyHcOPBwVhOUF/CtITIqqoWlZJanfJtsIjiPxTlS4wJea2f
         1laZvrj2oK0iFBuoLlvN9+US6xnFJi+S9t2yTHIpfl9+BNg90+5QVs0lW8IHESzejFbP
         HN4A==
X-Forwarded-Encrypted: i=1; AKwUvBxsU6awWYLJ1/l4Rh/61e9DmPINBUC2npa87/1OGp12ZqKf7fkw1wNEPjjEhAbUJSJcLjxFUDnLM20=@vger.kernel.org
X-Gm-Message-State: AFq9FYI35nEObJYBn22JrEKifqg5tLp2VcLuLx61lO5XNmXZD8pvYO9j
	2dMW7SQrTjQwAPDS5AmolJFvj+Ne7axrE2JU1Zvl1jzA5ylJpaHxHDLs7Y9+Nm/lltg=
X-Gm-Gg: AYBFou1FCXqAxxm9/01jFq0IfrX4KI1LhIEg2RHWbvEOfGsSm2xx+2cYwZMJ8kqVc0t
	voRx5IA1kf1Prpez7ZPB4R3kOQYzfyQtuhtqMlCAOcc12pCpkzt3ZkGj8JkrUPGauPMRbTE9Gw/
	7eZ9FgDaAc5qMugW/KmnnCdTuT0Pj+432bVxofGVMDu6O2893KbUnkhu0XkETvBiQ9nc2woUCnC
	fr9caD+MV3iJJPwCsF9ogNZ4HFXjzezSeZHpXHxkdWV0F3DroJ4rarh6y88KavSsJsUPg63rLva
	JNObt5HvLEm8BqQTJDFAqQiiEbccr/AUun1oO1SdzxVen9VbQ/KM6ii2npRPINkgIYYCUIewhpI
	RZjt21KvHfn/o+NpBd8T+XloqVrhXMikrCPRYc/jdikcgPK2EnhxCbNhYXmcNMszMSq1RLBxlfi
	2yvRLxhqjkNoVR3iNzDGM9IIafFFbwe9X++5R4aDvXu9BnhT4oJEd/q0m/maz4rVhMHVbeMxibl
	dGx+agh4z+vah/qolNT10yUhhSlLH+WWvjF5L/otMruG9fZM/z9i7S6rc7H+gY96AA99OK5ZaEt
	qzjKmGsxA3SvYLsiAfNIVXMPG8Q5K/Y1aoRZjPLWUxqMicpNOOmazL1S9bgdSoXSbyVNEePj1z9
	nFBuyGKiWPJQ=
X-Received: by 2002:a05:622a:342:b0:532:8ed7:534 with SMTP id d75a77b69052e-53fcb7f9e76mr15856551cf.37.1793144820933;
        Tue, 27 Oct 2026 16:47:00 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c47a69129sm114200426d6.4.2026.10.27.16.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 16:47:00 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xLqsc-0000000BHke-3ly0;
	Tue, 27 Oct 2026 20:46:58 -0300
Date: Tue, 27 Oct 2026 20:46:58 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Dave Jiang <dave.jiang@intel.com>
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
Subject: Re: [PATCH RFC 00/20] attestation: Add a common subsystem and TDX
 support
Message-ID: <20261027234658.GL1685504@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <592d643f-e97d-4de8-9a87-e47d57dc8457@intel.com>
 <20261027193629.GK1685504@ziepe.ca>
 <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>
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
In-Reply-To: <5f33aeed-a20d-4881-9ccf-a69bc308d348@intel.com>

On Tue, Oct 27, 2026 at 04:09:19PM -0700, Dave Jiang wrote:

> There are two issues for TDX Connect. One, the device info is collected at
> SPDM connect (TDH.SPDM.CONNECT), not at lock. TDH.TDI.BIND only returns the
> interface report. So the measurements a TD sees at lock can be from well
> before the lock. To get measurements taken after the bind, the TD has to
> ask the VMM for a recollection with its own nonce.

IMHO measurements taken before lock must never be made visible through
this interface, it defeats the security property of evidence within
the locked session. I would expect the guest kernel TDX driver to
prevent this.
 
> Second, a device may take a runtime firmware update of equal or higher SVN
> while its TDIs stay locked, unless the lock sets NO_FW_UPDATE. The
> TD isn't

Sure, any of the live update things are not really relevant, the
evidence can change asynchronously and without notification, so we can
just ignore the issue. If the guest opts into live update then it can
only rely on things like min svn.

> > I'm a bit puzzled by this optional challenge concept, I haven't tried
> > to read SPDM spec yet, but it really has a way to omit the challenge
> > from the reply? It doesn't just replace it with 0 or something?
> 
> SPDM puts the requester's nonce in the GET_MEASUREMENTS request, and only when
> the request asks for a signature. The MEASUREMENTS response always carries the
> responder's own nonce, and the signature covers the request too. An unsigned
> request has no nonce and gets an unsigned response.

Returning an unsigned collection seems like an interesting use case,
but why would you want to do that in the first place?

> The empty challenge in my provider means something else though: don't
> recollect, return the evidence collected earlier. So it's less "omit the
> nonce" and more "no new collection". Maybe that's better as an explicit flag
> than an empty challenge?

I'm not sure 'no new collection' is an especially useful thing. Since
the kernel won't be validating the signature you still need to pass
the expected nonce from the prior collection back to userspace so it
can check it.

Is there some specific use case for this?

> >> 6. tdx_attestation_test's discovery_and_construction_fields expects an
> >>    inheritance chain of 4, but the TDX family inherits ctlv-attestation
> >>    directly, which gives 3. In a real TDX guest it fails with
> >>    "Expected 4 (4) == ctlv_chain_len(self->dev) (3)".
> > 
> > I would have naively guessed this should inherent from some SPDM family?
> 
> The TDX family is the TD's own attestation (TD report, Quote and RTMRs), with
> no device or SPDM in it. In wip_attestation_all_1 it inherits ctlv-attestation
> directly, so I think the test's 4 is what's stale. Jiri would know for sure.

I think TDX report/quote/rtmrs should be a different familiy from TDX device
assignment SPDM. They are completely different things.

Jason
