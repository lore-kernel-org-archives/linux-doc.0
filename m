Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA684136349
	for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 09:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252173; cv=none; b=RB7Alav4wW++cOWpYuexnD50i5fk5T4sPRHwikhgWMfTnZN/0DgchkdkVxfbi2KOL0CpvDNxD356Z3iqGhwQcFIGNn1u9Manh1Ha1bw3hQ2kx0rU2vWU/baU8zhyEtmSeg/qwux44TrOVIC9Nn/fVGDoc+WKAzWRf07qhVkr97w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252173; c=relaxed/simple;
	bh=X9BRM0LvviL+8wFs3cVyB9IuGOiHLgzwjeAZMfe4f9o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S1pzfEWCT+bMkXlbMuXqCiwVbPmWV02uKPPtl3dRdb0emA7ZzhmSQVRGZ5QyYjbQG+DJpEr/94NvbGAMdhkdn3IV2ithk6Pnd/4sTq/OrEuNWFdHxIJZq2bGAo/0X4V5KFLFpNkMlIhD0H55zCHkIHhYMdTyR5BkpOPUDRALcaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=A+peLNPN; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="A+peLNPN"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43edb40f357so16855715e9.0
        for <linux-doc@vger.kernel.org>; Mon, 26 May 2025 02:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1748252170; x=1748856970; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=X9BRM0LvviL+8wFs3cVyB9IuGOiHLgzwjeAZMfe4f9o=;
        b=A+peLNPNPt8pr95XxQIWNeCpXcnUWJPuGKZUIV59fEHRoCRomTw0Kj5RtuYVZi+QGG
         U1Z1Z/h+R5+6mSNn7Bh9XMlMt64FSzdG0HBzyQB6SKxEZ4keHIxXrLBwCWEiScZ5ERPY
         5JR3qwlntGoCjO2IR2ACOSc8wTMlxgTnjHcL0bb1+SH2KvFWXzI9YowEvBgm7WzeLo/p
         axWJm9Jto+wbCpWA+iSaZD3NzsEk1NqGXsTOXMXlIXu0i2CLjC4fQOXh57G0WfwlJ7m0
         81mEVjAdSvebd0d8EQMj+kxwnuRxLiKP5ZoPqg0cCc2z2c6VdA6LOoIh7SXAmLGFMrHe
         oA6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252170; x=1748856970;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X9BRM0LvviL+8wFs3cVyB9IuGOiHLgzwjeAZMfe4f9o=;
        b=u4qRh9vHazWl4fhESDJ3klSURuBO9ijPYsOvySjqdi1Xss3hR8F6f5LM5Al5AnRcxZ
         sQdqKPuyF4Pdb1zM1VVwkAAAurB07m2yxMBY7wWQBOj+h/EfvIEB4vUIGkceD3uZWyHD
         dyMEd4/X8JVu6Qt7DptOgeA/TMqXYSzKp9OreCp3k8xCzz1p/6v/cJ4QIWAaPoAoi0eu
         3aHJX+8l5UQ/XinEqKRGCvk+3rKYRWtcVbOTrZb5RUBPLnLJR7gf6wTiGajw0IiGv6ZR
         ROp9ZCKVdpnMrySdvCVvGPPLN9ObQOpwH/ElefvWVAUpGjsFjxN6n7anw9/Rbt+D98I2
         sMHw==
X-Forwarded-Encrypted: i=1; AJvYcCX9lxNb44sattjTN0Lvjkx5sctxeqifG1QhiXB9i4Gv0scP9RnAwKhxKdB4Me9HrIeKL8l899UYf2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4gKQfWy2zMpGUEBvjAW9SGfC4GK8STHt4+czlh9joZpRODq/z
	9RNpkKdIrCaq77yoyjfOmSRRukEBRoRxPeJu/nqmyO6XHjM2kM7bRL3YDbBqopSN890=
X-Gm-Gg: ASbGncuTbYczikoQ+Z+bW+EO1D+4iBVbjesyQsLWqfJZuQ0pCmvvwfS9yazW9/RM1z9
	+aof+8nTuAPGDaPpeTA9P1MGujt7/eL1cVDUg3tWGnxNYai13Yk+nebdWv6aZnpZ/oJd4bgZITe
	zITp8xk2ZcHuKxVxydeE9TJRmozq+us7ZIsIw94KfHEEItfecNPSQGa3jOSy9WuDhhx9IrCC3Yn
	AmioLVtOX8isVsCpkATHSYPe4axw151yv9bv6koxKjFwsbYBR1hwy6TmMSh5XgAcoosdqM7bliv
	s6bKEnnnkHHvnwc9AA06/mRQypRZuPIew+v00y+EL6KHRyAXhDzQhF5uVIptApCi35eRt+oVJJc
	mTCk=
X-Google-Smtp-Source: AGHT+IGDSx/uqIzjPbt/RIIG6sl81DhorcyGxspFB+QasTmVd+rJASc8gBkYSwK9BSg3kAtpjSzzEA==
X-Received: by 2002:a05:6000:2082:b0:3a3:ec58:ea98 with SMTP id ffacd0b85a97d-3a4cb45f1dbmr6352050f8f.22.1748252169629;
        Mon, 26 May 2025 02:36:09 -0700 (PDT)
Received: from jiri-mlt (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442eb8c92d9sm227117135e9.2.2025.05.26.02.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:36:09 -0700 (PDT)
Date: Mon, 26 May 2025 11:36:05 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
Cc: donald.hunter@gmail.com, kuba@kernel.org, davem@davemloft.net, 
	edumazet@google.com, pabeni@redhat.com, horms@kernel.org, vadim.fedorenko@linux.dev, 
	anthony.l.nguyen@intel.com, przemyslaw.kitszel@intel.com, andrew+netdev@lunn.ch, 
	aleksandr.loktionov@intel.com, milena.olech@intel.com, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-kernel@vger.kernel.org, intel-wired-lan@lists.osuosl.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next v4 1/3] dpll: add phase-offset-monitor feature
 to netlink spec
Message-ID: <2xdi4cs4iuvio4mm5qx3ybu2i7ceiwexjgj426uodujgza742y@t7cjhunlpbvd>
References: <20250523154224.1510987-1-arkadiusz.kubalewski@intel.com>
 <20250523154224.1510987-2-arkadiusz.kubalewski@intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250523154224.1510987-2-arkadiusz.kubalewski@intel.com>

Fri, May 23, 2025 at 05:42:22PM +0200, arkadiusz.kubalewski@intel.com wrote:
>Add enum dpll_feature_state for control over features.
>
>Add dpll device level attribute:
>DPLL_A_PHASE_OFFSET_MONITOR - to allow control over a phase offset monitor
>feature. Attribute is present and shall return current state of a feature
>(enum dpll_feature_state), if the device driver provides such capability,
>otherwie attribute shall not be present.
>
>Reviewed-by: Aleksandr Loktionov <aleksandr.loktionov@intel.com>
>Reviewed-by: Milena Olech <milena.olech@intel.com>
>Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>

Reviewed-by: Jiri Pirko <jiri@nvidia.com>
