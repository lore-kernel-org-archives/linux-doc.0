Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D3AF35675E
	for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 14:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789570780; cv=none; b=mtugtHa9ONlALEGO6c88q554tgN1V8+za1Jb+vM5Bg2SwjhstjpwB/g7GKMbpgjEMEaKuGfE5nB6yKWTjDTD2IOcxpVZntlO6Yhwq6ryZ/BU3TWX/hdvK4iUDun6d1uPH6j958X8AB6j0QPkPbAsoCzU/ljDdzd71Kap3CL2E7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789570780; c=relaxed/simple;
	bh=4Jl2TkRe7Npn73HaXfPcA4VVvCfEz91QC5XBElprxe4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iovbPWH9bHIXFSN/rdSWmM7IFbzVLe+rDg9BUjJcVm0adpb94mqnIgKuSR2ItoNENRIcFAotaaKGz6jpwhmb4/4bX0y6yF5KaLznCILVb51b/u96wClEAJvk2lXMgHdjOLiQOq9U21CYnnHmTV6xvawO20aupmpSjI2FdDju7LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mgTrxaY6; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mgTrxaY6"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccd5cf02so766276a91.3
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2026 07:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789570776; x=1790175576; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=3xRnvj52pHagz8sqiex+4Km8FuQRJvZZV/xhDBA7TFQ=;
        b=mgTrxaY6AZiWnAmxzZcwig+v8VuOj+GoOmPuCoYjuUhhq5IIL+2Z66c0z8BGUyNlpS
         GC0E03q1m8DB/5qMetvoQ7lBrq82C9MkIPbwq6tLTioTeM0gs2wCRe8D1abga00n8eBQ
         znI5azqw95s170A3Lu6JWplgLcGwNxrw7TYFGUhAyOPjUqAZyO78aFCeUuJAJOEv55Bt
         K7daPg6vZj6QLju39pd63nVDsSdqvfvrfYnF7nleEQAjVGcebVQYb9YSfeBZ7k68hurj
         /8rIDxaLgHq4o5iMCc9wq8Fs0If1RRvtUwp/ZViZYfo7zAcb7dRpvVjL+u6g5hZjqu78
         RfcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789570776; x=1790175576;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3xRnvj52pHagz8sqiex+4Km8FuQRJvZZV/xhDBA7TFQ=;
        b=wmLw7YawI5Re1Ge0mgFglAeeWG0WAI7BDYnDmoHESVqead4t0sw07HC/upyKpc9RoI
         ITLNdAUizE+PDmRJTsB3yR1p30J5DRHsHNXrtoFP+xTXNMbSZVqUy8OcqF4wZl937Ya0
         ey/5x3L/a2ICGpY/fMTSzxz7Ymk3ImkPy+KCq4d23b/C86KTd+bVmRb9l91FzbezMm6g
         /UGcsXcuzO6aFqnyoX3S+guLHGaLVuOXyXsmlZTO4U4x9rwrw2rgk9gcXBBJ+noFMdOB
         TEaDU483gE+r2z+wtg6b/XOxqjvA15W2BRzPeDotqT/Ej0rRc5JNRd2EEcorrMQOntbl
         F0bQ==
X-Forwarded-Encrypted: i=1; AKwUvBzX7e90EtGs6ZGddogJnxNQwHN3RnX+hxCj+CHn/09d/A9pOzRmdImENA5MC3pR3PHOp5XG6moivkM=@vger.kernel.org
X-Gm-Message-State: AFuF++nfurq3vdsMiPQbSvIdsmJ2SdS8sBfLd6ZxCqaXlAPH9ZVbL/rb
	DzFHHOL67PMW37X6Qab5D7hSU4kCOt/DsyQfh3CrEELh+3rGFaVTN9PZ
X-Gm-Gg: AYBFou2XVY1noDCKpfI2eNRCssb07QCehP3WP5Tpn/uejF4rdHtH6nplxwNeBIiO33f
	F6VfOF5pMdBy4fWrMIC0QYjbcfzUMoPiqBbALZPIo3ND2v48apPOJ69H0wEOJwZ5gvH5zTZ+uW5
	zFEQ5fcsVY8UWbh74/qr3qEkr6z0CK1w12Xf23FE+CAqvRjVHMJ6o+qwqT8x/AHd7Cv4d+29vqQ
	pMLyqq+gOA3IXQNuv2mhecqwC8u4Rzj5gklwlNrd6yWlvNTRmlw+tvXymuZNZDACtrTK9q/87jU
	6WYQHdNzLT2vQtn44tlO5F3oHgC1VUpp1ZNnFh+hbFf16cgV8cdbwMzbfPs5FGAt26CCaElAuIy
	cYnzM9BodIhZN55h0nGlLHWa2hh+R9S0INLOHckO9xznmpWkES/iNS+y7Iti1vgfqqjvi6Nu1k4
	tJQcgV/1x1UXs7krUuJ11ISH3aTAykPOPmSwcL1gC9Bdro36dxhMYINruJV4P2E/6BrGwfY0GlF
	1G/y0/+6RXa
X-Received: by 2002:a17:90b:582b:b0:39d:c3bb:98e7 with SMTP id 98e67ed59e1d1-39e1e2eb37cmr7040268a91.6.1789570775729;
        Wed, 16 Sep 2026 07:59:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1bbdfd89sm5159630a91.9.2026.09.16.07.59.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 07:59:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 16 Sep 2026 07:59:34 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	"linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Sanman Pradhan <psanman@juniper.net>,
	Senthil Muniyappan <smuniyappan@juniper.net>,
	Vaibhav Agarwal <avaibhav@juniper.net>
Subject: Re: [PATCH v2 3/3] hwmon: (pmbus/tps53679) Add support for TPS536C7
Message-ID: <7c73bd97-a3c5-4485-8f16-57b128aab7c2@roeck-us.net>
References: <20260915164823.160977-1-sanman.pradhan@hpe.com>
 <20260915164823.160977-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260915164823.160977-4-sanman.pradhan@hpe.com>

On Tue, Sep 15, 2026 at 04:48:46PM +0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> TPS536C7 is a dual-channel D-CAP+ step-down controller whose channels are
> distributed across a configurable number of phases (N+M, up to 12 total).
> Whether channel B (PMBus page 1) exists depends on the phase configuration
> register, so the page count is derived at probe time.
> 
> Factor the TPS53676 phase-map parsing into a shared helper and reuse it
> for TPS536C7. Only aggregate per-channel telemetry is exposed: leave
> info->phases[] unset so the PMBus core never programs the PHASE selector
> on every read (and because TPS536C7 can place up to 12 phases on channel
> A, exceeding PMBUS_PHASES). Report VOUT in linear format like TPS53676.
> 
> Since the core never programs PHASE, set it to 0xff on each populated
> page so READ_IOUT reports the aggregate channel current, and verify it
> (PHASE can be write-protected). Fail identification if aggregate
> selection cannot be established, since otherwise a single phase current
> could be reported as the channel total.
> 
> A configuration with no channel-A phase is rejected with -EOPNOTSUPP:
> the PMBus core models pages as the contiguous range 0..pages-1 and
> cannot represent a channel-A-absent topology.
> 
> On the tested TPS536C7 (device ID 54 49 53 6c 70 00, CAPABILITY 0xd0),
> block reads of IC_DEVICE_ID and USER_DATA_03 return -EBADMSG with PEC
> enabled, while retrying those two reads without PEC returns the expected
> 6- and 24-byte payloads. Standard byte/word telemetry keeps using PEC,
> so only those two identification reads fall back to no-PEC.
> 
> Co-developed-by: Senthil Muniyappan <smuniyappan@juniper.net>
> Co-developed-by: Vaibhav Agarwal <avaibhav@juniper.net>
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Applied.

Thanks,
Guenter
