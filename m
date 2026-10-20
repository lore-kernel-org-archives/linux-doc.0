Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500924;
	b=Zlvc+8/UyExQybh595JFbETDExMOdGxc39DZlHbMu7iuTBMqoAmNxU2rOdFpZiLWfMuW
	 +um9GgMx6UgqOVmZAxV9HAAzH59+13D8meIdAS51HHQDsOP2a79GteT7sSqzb1U8ws5C6
	 +kP2XMi5XPK6QsMnRYUwtNViCvPLIksOF9m1HTaB1pfFOM2UUEqtlOG92lNPpG/f1AoEl
	 pnDHiF5B7LE4CqbbuiJ1m3hWuA4wIBj+yE1uhuWaUH81Pf/3NZQuwuQVp8Rl0CjN3MH7I
	 am5SGOxv5/LL2DwYu+H7Jy9L98Fwizm9+LlZHmM2jgCvd2zdaJvhhwnxK/ej67fAA6w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XQOUTOVFh8JzZI9kzVmkfR5g5tplHfGAGARfyUUcUvk=;
	b=fmdoCxtXUJhhHLpONwBAIOE0lPi3dPHzQX8U0BoHVJhotEWaJ9GWfGOenthDzZn4YZdc
	 H6t6vO9+eBxORqwHQStvUBjIuNgx/+WCbzkeZEieza4q3z/WZBwuQLuGa/v7w22jO19qS
	 tH/feGD7bvUMcs2J52D2x8RqcVmB35W6z4/+3quUuXmE6xNtvcdEIaviG6qo42cW8jt1R
	 GwbxEwupaVm7lH1HFRf6Fs3PtRxlT39j0oyeeuz1ZijbfTPETCWIzKgV2NEV3dn6O1e+Y
	 1/U7D17sXfaVuQtvFxv0Awn0lNzfPeGtTfkCrsYxqiKcclmwlEcxeNf8NwE0RoQBxSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AwG15E1Z;
	arc=none smtp.remote-ip=209.85.219.44
Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F08C7606A31E
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 12:55:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F08C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=AwG15E1Z
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-91befbcad6dso39653756d6.3
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 05:55:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792500922; x=1793105722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQOUTOVFh8JzZI9kzVmkfR5g5tplHfGAGARfyUUcUvk=;
        b=AwG15E1ZRPKZS56zseZDToB2Qd9YJbTawLLcr9h1GLur1yCKOphB9CZeYoOaDMSbVa
         RrPlrw5eMLSbJOuslxyszTx4NmEnv744KuWIwG3DizDX0uWRbErpkLwFCuAWB+o9DRFg
         UDL4ypgxiss5CkG9v/9yYGF/Wsp/f2dCLf4e6CR3fB+jtf8r2d9o3+KYLDv1ozPWgId0
         qwRZmFOw7C/Ek9a3K6UDlQQsnDrTtjosSM7fZhX5JREOkWrFCKLppw8Pmb/qLty56lpP
         ZYj8Ee583y70a0njyljl7Z1GKpSK+nqzpOa7hK8N2VSD0I3LKpuHkedfhTxNE2H7j0za
         9QeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500922; x=1793105722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQOUTOVFh8JzZI9kzVmkfR5g5tplHfGAGARfyUUcUvk=;
        b=2j4E+kD+aTET7r4An1y1+e5AwOTFbnVQjCQ4rxhMY1i9HtAdKENV8wFeDT7wQpGxKL
         ZRY5AtzUXpU72as7CwKAHO980iiNXK43hjAMgFscwxscgFJsD5g14f4T7vn1xv0vToM2
         sBhZMnN23H5SYheC3wWl3155kWWPPrAjXIl9gae3YQ27/DhAbO+9jM1hkSMT0CobSZQ7
         U+cyPppLL9LVbmx8zn3/mIzcOZMXSpq5/W17TKT17UCL4vWLzRkEdwjKMCfu6cbeBow4
         XyAQXLe//bt55tQrr6cqJKUDGl6+RZmc0rXxJkH/hAlwtugH79JS7KvZZDUDpn97LG61
         xLxw==
X-Forwarded-Encrypted: i=1; AKwUvBxeUnAohHhfq/QDGIdyDgEHnG5wcbw/hkhJr547vWqABy9bGlC/pUbcilDQZKX4MUm6gEzTv6VwtDY=@vger.kernel.org
X-Gm-Message-State: AFq9FYIpu5iQxUJzYCb3oEjTD7Z1XZ2i7+JyuINXVIL6+OUqI5iHo7zW
	z9JhtmT0UAvUY1hc/Hqp6/iDI+dNhmR/9s8PSoL0iqu7Rreq1k3czrwDFvGALYUqwWI=
X-Gm-Gg: AYBFou01p1CnTlVJC1TFASgQhOiXyvMxqtoKKkYwe5RNmSEj/smq967ZAebUASWPk3X
	Pf0LMtHi/3pPzEd829uw4I4sAMl2Ingxx+Phbv1JrlKaoycJVU044x3+6vsk85/eT/yuLpvUqyG
	5vcfLz6+2CxrAiJrp9fDhmGwiZVExg+fm3oH3B00G1iXDSmzQ/HnfAU4CwZJWCGDvz3a8vUyJkF
	GXv1aZ/ia/qkMYnDkhr6MxDnpqKSr9LuTZ7HC1uu3a1J1GfC+1WPkqQySzPA3t89a6adJWDo6XZ
	cYPZdP/NbGf1nGuikk7nzZzkoI1UIRLubNeAkMm6bhFiINKN720YYF46zdsSjPSCMqrDPNu/sq0
	WSKBwTNQLCSxomx3qLv6FI4WiiiJeAhBlTDeVt4qwyg0RxUyxonwGm0KLaFaMe0OFJuzrXcVq6W
	GAPXMMEyM2ayv+Ljy9whriNErEEuxClQOIAxCQ9HsHQh+degbSaEBNJcc+vCgO4y3aK/1pfpEbv
	i26BQjQ+1xxHf8OqxW41hakbyw7EoM30miN4f9dNBTAI6cPSglG37m7
X-Received: by 2002:a05:6214:626:b0:917:8752:8214 with SMTP id 6a1803df08f44-91bdec2e198mr180120836d6.1.1792500921889;
        Tue, 20 Oct 2026 05:55:21 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c03da5b4asm26796476d6.0.2026.10.20.05.55.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 05:55:21 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJ9NA-0000000CTFP-3VJ7;
	Tue, 20 Oct 2026 09:55:20 -0300
Date: Tue, 20 Oct 2026 09:55:20 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Jiri Pirko <jiri@resnulli.us>
Cc: linux-coco@lists.linux.dev, linux-kernel@vger.kernel.org,
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
Subject: Re: [PATCH RFC 03/20] ctlv: Add the root family specification and
 generated files
Message-ID: <20261020125520.GN14213@ziepe.ca>
References: <20261015145053.3664509-1-jiri@resnulli.us>
 <20261015145053.3664509-4-jiri@resnulli.us>
 <179245258505.58760.6060356114682279013.b4-review@b4>
 <atdeH3nA_gkLwPLM@FV6GYCPJ69>
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
In-Reply-To: <atdeH3nA_gkLwPLM@FV6GYCPJ69>

On Tue, Oct 20, 2026 at 02:28:55PM +0200, Jiri Pirko wrote:
> Tue, Oct 20, 2026 at 01:29:45AM +0200, jgg@nvidia.com wrote:
> >> [ ... 238 lines skipped ... ]
> >> --- /dev/null
> >> +++ b/Documentation/ctlv/families.yaml
> >> @@ -0,0 +1,13 @@
> >> +# SPDX-License-Identifier: ((GPL-2.0 WITH Linux-syscall-note) OR BSD-3-Clause)
> >> +%YAML 1.2
> >> +---
> >> +# Append-only registry of CTLV family names, indexed by family ID: the entry at
> >> +# index N has family ID N, up to 65535. The root family owns ID 0 and heads the
> >> +# list, and every other entry comes after the entry of the family it inherits.
> >> +# An entry may be marked deprecated, but never reordered, removed, renamed or
> >> +# reused, its position being its wire identity. Every entry must have a
> >> +# specification in specs/<name>.yaml, and is added by the change that adds the
> >> +# implementation. Fixtures under tools/ctlv/tests/ are not registered.
> >> +
> >> +families:
> >> +  - ctlv
> >
> >I see where you are coming from with this, but it is going to be
> >problematic from a global kernel perspective. Given CTLV is imagined
> >as a general tool for any subsystem we cannot control the tree that
> >things merge through. It will not be like netdev where there is one
> >authoritative tree with a linear history.
> >
> >So if Bob and Jane maintainers both add their own subsystems by the
> >time it gets to Linus the IDs will get scrambled, and bisection will
> >be lost. 
> >
> >Either changes to this file must be strictly done in a single tree
> >with shared branches (which is going to be a bit hard process wise)
> >
> >Or we need to put the ID #s here and have some simple process to
> >coordinate them during the development process. Since new families are
> >probably rare it shouldn't be a big deal
> 
> Exactly. Collision is not very likely. Explicit ID or implicit, scramble
> would still happen. And in that case it is resolvable.

I think because of process if it is kept like this we will have to
merge 'dead code' to reserve spots for people doing new work..

But at a minimum this comment above needs a big fat warning not to
change this file without consulting with XYZ to coordinate merging.

Jason
