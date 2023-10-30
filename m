Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6F436AB7
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 14:53:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="BhlD8sLm"
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C20CC9
	for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 07:53:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1698677635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c2oYUOapUpDMkZzVo31vssGZsL+4QeQUhvW4D3+MIuE=;
	b=BhlD8sLmv7e3LpjyPHjgzIRLVDSWPEyJyeBlIqBMGDrmOeDD/rep5lh9w4SyDswf9HbtWK
	+vF9OTgocyOTrA0VeQf336J0ekmMRP4XA8+tqQK8IybRGeaJqbot/2m8p1/fv8OXg7HTqN
	JDMu4inYZGmnscsF9tZd4VSiatGJTzs=
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-122-9zx7EpFJMGW50kf71Ky1ew-1; Mon, 30 Oct 2023 10:53:54 -0400
X-MC-Unique: 9zx7EpFJMGW50kf71Ky1ew-1
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-3af7219c67fso6730554b6e.1
        for <linux-doc@vger.kernel.org>; Mon, 30 Oct 2023 07:53:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698677633; x=1699282433;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c2oYUOapUpDMkZzVo31vssGZsL+4QeQUhvW4D3+MIuE=;
        b=efOfzm/ZWPvZFfEam3p7wz7/xKZKAGVGl+KjjyW/OmOeRfbWcPunzxLYV5oFbO9Ph+
         b95k8y2JWqNScXic5C5eeWAup4Sc6yXdLw3ln4V+u9CYUinXFDmukiplsXXC8R/lDIgF
         TJP2cF9KDFIuhp9MkUZIBVHAgvEJHKhagagEMK+O4WRTld7FY+BB1kubdLf2HQVrjFIf
         lgqkaB2zSvg6p+bT0DLVDxSQD6wPjtNnCKf1+iydz9Nfjs7EEw59J3xFOBvfYj87IMMw
         jv0Y2Qj9ezDRPX7l2qZLHOFbX6HFs4m+lQCYlfRBpj66fE/I8uZ9CBeSNMbiLs3ptuBM
         Am6A==
X-Gm-Message-State: AOJu0Yzui+XSPMqn9p8mL5MJ27a8RWcMgOtA1pHNiLfvS5SSIQrk7xRj
	yniBYaaRG22dxWgzQgimDPQA3kpYWvYCfxLT1Kc6UDhumhlFIGSmOx0XS5J0Hktq4mNHav5FvOl
	KFvv1F3sqTPp+/h7laWKb
X-Received: by 2002:a05:6808:1302:b0:3a8:436f:3fff with SMTP id y2-20020a056808130200b003a8436f3fffmr13588633oiv.26.1698677633606;
        Mon, 30 Oct 2023 07:53:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3aVQA2RHuWFbArUkHNt8LDd14jicxffwRB9S6dWBo7lMP0QDrwTGdSm2NNwUIPbcjguOwvA==
X-Received: by 2002:a05:6808:1302:b0:3a8:436f:3fff with SMTP id y2-20020a056808130200b003a8436f3fffmr13588615oiv.26.1698677633376;
        Mon, 30 Oct 2023 07:53:53 -0700 (PDT)
Received: from brian-x1 (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id m19-20020a05620a291300b007659935ce64sm3374135qkp.71.2023.10.30.07.53.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Oct 2023 07:53:52 -0700 (PDT)
Date: Mon, 30 Oct 2023 10:53:50 -0400
From: Brian Masney <bmasney@redhat.com>
To: Javier Martinez Canillas <javierm@redhat.com>
Cc: linux-kernel@vger.kernel.org, Manivannan Sadhasivam <mani@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	"Steven Rostedt (Google)" <rostedt@goodmis.org>,
	Tejun Heo <tj@kernel.org>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] regulator: core: Add option to prevent disabling unused
 regulators
Message-ID: <ZT/DfnWWYkYPzkWB@brian-x1>
References: <20231028102423.179400-1-javierm@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231028102423.179400-1-javierm@redhat.com>
User-Agent: Mutt/2.2.9 (2022-11-12)

On Sat, Oct 28, 2023 at 12:24:03PM +0200, Javier Martinez Canillas wrote:
> This may be useful for debugging and develompent purposes, when there are
> drivers that depend on regulators to be enabled but do not request them.
> 
> It is inspired from the clk_ignore_unused and pd_ignore_unused parameters,
> that are used to keep firmware-enabled clocks and power domains on even if
> these are not used by drivers.
> 
> The parameter is not expected to be used in normal cases and should not be
> needed on a platform with proper driver support.
> 
> Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>

Thanks for posting this! I've had a need for this. With Randy's feedback
addressed:

Reviewed-by: Brian Masney <bmasney@redhat.com>

