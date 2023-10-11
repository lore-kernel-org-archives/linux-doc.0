Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EBE51DA58
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 11:11:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="hVsCDzN0"
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 993DBBA
	for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:11:16 -0700 (PDT)
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-4075c58ac39so11053215e9.3
        for <linux-doc@vger.kernel.org>; Wed, 11 Oct 2023 04:11:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1697022675; x=1697627475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=S5GNKoDzJaHuzKJxlYhSGC/WySAPDC162s7razYkn5c=;
        b=hVsCDzN0YRLfpJ/2mKRa0JptbW02H7uwsNgSN4i7J4fO8v8Gmd6w/OYWFyv8WqwoGv
         fjuyaoSWI3dFodb0NOi3gELhxKON4D+y9yi3oo10xM07RXEqsfdDt7pn2i7n3o2ZBIVU
         Ot22K+hAZYKUvBkxDcY6sRHXJJkq2RmrX6AcZlawZYOTdeVmGtO5mXCiJE5wN6w7DNR1
         wbbAnqDveayy4LkKYvE7RvfxQaM+jTb6CPqYkSOir7xoW3lxyxClCRqqX3LdevL3WvU6
         0mLiogdLIeelDSJ+f2vtfl4djG+3BWyKPaaBla7cR8TGDAl2ZxFu/E6GADaX0+4SJWOq
         s2cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697022675; x=1697627475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=S5GNKoDzJaHuzKJxlYhSGC/WySAPDC162s7razYkn5c=;
        b=YaRo3P/BWn6SBQNoSmVMTNkLUFpj/5BuJTVnf3vuhFZUBmNElLX47DWjvvmcw+Jl6f
         cIyKdxc7KGjVxWA0+SpWsxWNpn4OkwVhXMJoPGwRJp6mkq5IW/Dk0onOIOeZoY+4Maal
         RmeF7sHNg3Lx/ACHtsLAOd5pnsN//SGsZoVq5FBEPKJAjd2IxrIkxr8cSIV92sBBRfN8
         ZIc9/04IyVPgwhsN+PqUoPZEwAOyBKHXZV7feU7ew+gV7u7S3Ql5t0G1qccXmexYXC0K
         Chj6SjZOl7k7DDLKU2rAT7dkCWZGc1+aRDE6bp8MCCKhFR/hO6/H0u4O2xZ46tgpX0l5
         L7Aw==
X-Gm-Message-State: AOJu0YzbZTRzm+ONrgFOsySEFFaMCMhowQhDFM9v4BZWl6zYr/G1hl78
	RCUQrrYf0+XtreNAFVU4QOuDUg==
X-Google-Smtp-Source: AGHT+IFMWdRjvrgTbr57qIWQAFPotfX/2bryYCgBf8xJCd9HLat6ps/im4EniVGCVudDPL3jp6V+BQ==
X-Received: by 2002:adf:a152:0:b0:32d:8942:9ff5 with SMTP id r18-20020adfa152000000b0032d89429ff5mr720660wrr.14.1697022674877;
        Wed, 11 Oct 2023 04:11:14 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g10-20020a5d698a000000b00327297abe31sm15135858wru.68.2023.10.11.04.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 04:11:14 -0700 (PDT)
Date: Wed, 11 Oct 2023 13:11:13 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: netdev@vger.kernel.org, vadim.fedorenko@linux.dev, corbet@lwn.net,
	davem@davemloft.net, kuba@kernel.org, pabeni@redhat.com,
	jesse.brandeburg@intel.com, anthony.l.nguyen@intel.com,
	linux-doc@vger.kernel.org, intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v5 0/5] dpll: add phase-offset and phase-adjust
Message-ID: <ZSaC0Qg0UwHveMcz@nanopsycho>
References: <20231011101236.23160-1-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231011101236.23160-1-arkadiusz.kubalewski@intel.com>
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_BLOCKED,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
	lindbergh.monkeyblade.net

Wed, Oct 11, 2023 at 12:12:31PM CEST, arkadiusz.kubalewski@intel.com wrote:
>Improve monitoring and control over dpll devices.
>Allow user to receive measurement of phase difference between signals
>on pin and dpll (phase-offset).
>Allow user to receive and control adjustable value of pin's signal
>phase (phase-adjust).
>
>v4->v5:
>- rebase series on top of net-next/main, fix conflict - remove redundant
>  attribute type definition in subset definition
>
>v3->v4:
>- do not increase do version of uAPI header as it is not needed (v3 did
>  not have this change)
>- fix spelling around commit messages, argument descriptions and docs
>- add missing extack errors on failure set callbacks for pin phase
>  adjust and frequency
>- remove ice check if value is already set, now redundant as checked in
>  the dpll subsystem
>
>v2->v3:
>- do not increase do version of uAPI header as it is not needed
>
>v1->v2:
>- improve handling for error case of requesting the phase adjust set
>- align handling for error case of frequency set request with the
>approach introduced for phase adjust

Again,
set-
Reviewed-by: Jiri Pirko <jiri@nvidia.com>
