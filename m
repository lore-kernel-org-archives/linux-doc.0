Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E72941D62E
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 13:01:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784206915; cv=none; b=uWx+f8Xpz1/5JQeub0qGVsMmkX6lZpiCQ/tJRZ7Yq11vcd42Uk6crceacbNZaf5zPdKFEWS9/8zEjVSjpTPfnBqSattefT6zweaHblSj1+Z2R90hbGynk9mTv92FhcBzzVLlCeVc4KPgWN+xc6cfEsmy8gUuazUhQOEa5N3/PLs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784206915; c=relaxed/simple;
	bh=hEAm3YmviD8vfyxeIlYhDFGhYvXOT9Fr2VwVTcL7UCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EPCcJiAfn1MF4HlBVyGsCWPSvfR90ll5twwuJ5P56t7gdV7Z8drB/hCvPG1jlV6jFArLiplWAlZWPyIfuX8rdoVUlq72tqj4DA0fzG/LdLaZFGKh1L8dWADwZ5VKeqx4KSTx6oGUbCrek3lU+MQQeiNgkP7qMOsY7ARH9ywRl0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=PbxoAvSo; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="PbxoAvSo"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-474560436c3so2436525f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 06:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784206910; x=1784811710; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GMRGU9D7jUOPRMQdlhC2i0jxS0Sdmf0wGcAUKJ73Z08=;
        b=PbxoAvSoocktvlCsvio7TMts+608RwnZefUgso+SMnFW1yPw6e7XWd6gTS+JSdUibl
         KdbLIxtWCKInKw4fisQvf5CrWvYpaVIIdUlngIZGR4i4upxxCC2qnprEJaANIfTbZFHJ
         LNJ3xZk3Bw7t9llREGY2cnmWtyXQoqBahAdyT6He+e0/yAyA/tYtle253ygeaBx3M4/j
         z0CqFyR9sqtvfMFLjyiLL73uEFrGjTNWsuK1mrXyC1Qek/qYpNdqcZRI3yN+UczjYBoD
         3ZvxdaPs1aLsCtmHOohOj1f4+HWbMxXiI1+JpvjuSSuRzQht9J8UuS1olwEYbIGsMtvV
         B3Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784206910; x=1784811710;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GMRGU9D7jUOPRMQdlhC2i0jxS0Sdmf0wGcAUKJ73Z08=;
        b=JaTJ/BJ1HMzd5J4DmKaptcc0/0Uvx3QNi+RrDc66bXmw7LKC2LuATGXJIGtjkbLTUG
         oXxZJAO07aiLAifL8Jw/yQ9Vu55tpp7UfXbRlvClo5Cr3kp7qGu65LLTvYRBp2qzargz
         5zE/d5bBKQOYIX7ykeszt9iNY4cmQImmcwjRtOmZndeeaIubE28CL3+/DNYc7/ukEv2n
         sbnl2oy9BAaWbLLgxwsquRNDuXbj8mv6PD2z3D0K48oZ9SLrd5z0zrOgFD0FAo0XPLwC
         g8EPeYfU3/jb3wPoflkRbeUxh15ZNc2GeaZxIYABA3WuNyuj3ejLMzbdjmkgumO+E7s7
         ptMA==
X-Forwarded-Encrypted: i=1; AHgh+RoTTbf4LeD1+aGjEVO6+WL7PILUt56yEjmFKWCghtHT1B1w52yHuESscVt+udo/dB7JhOO7KmsEDdM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxH+yW7I3IUuH02IbfPiUhWmlhiQCc85itBMdKcHIdHn0jTxRk
	imX/kmwrOn/sHL1m/cE6rfAYQdnkh+Hd2uiZJ+yjNLyHJSbyDZNoj0VAAzU9NLxZ7Rg=
X-Gm-Gg: AfdE7cnZHUrYW1qJzozAlfwAxRJ7eVcj+gfqWRg/+ae3NDTT2HFO2yFXoSqyYXACxZr
	aOjt5LgCVBE6dLFRuOuwPrumzHW+SOYUYIRyq+gpufgeZS0jRxB+KokPXqNR6gzp+Dk1UAikmMo
	SPfeJmxXTxJc3knCKsplIKTXwzAVW5jWSMRTBhMsNPk6qwroMUXYSGIcwmWZCPymjtxosDVRh0p
	4hq0eQfsfIR/Yw/IVbcuDBZSGH4VJVBNNx/cPWp6uX3FB5PjgALV5ixjah/2TiE1/zkayuwrJPn
	zbDMxsGvNXY49EjkrpuzQZVbz2AEGnuhwJjwobKbhOigxxFCnyqm4aym24jn/pYBTOQqVFcdCpv
	P90qYJfJ82JsZUBvC5zMuOQgNly9a7Y1mMH/MdICJUPpq+Yn7hf/Ul/raopLAhgOV6PPZwE+DGS
	GxJJFi
X-Received: by 2002:a05:6000:24c6:b0:47e:1d9a:1123 with SMTP id ffacd0b85a97d-47f2dcb604fmr25617566f8f.3.1784206909702;
        Thu, 16 Jul 2026 06:01:49 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f4634e0d9sm23377950f8f.2.2026.07.16.06.01.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:01:49 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:01:46 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH v3 1/6] printk: sysctl: use unsigned int for printk_delay
Message-ID: <aljWOsuEfks9mYql@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-1-574547b8f71b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-1-574547b8f71b@thegoodpenguin.co.uk>

On Sun 2026-07-12 11:20:32, Andrew Murray wrote:
> As the printk_delay sysctl represents a duration in milliseconds,
> let's set its type to be unsigned int.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

Makes sense:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
