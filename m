Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 176933FCB34
	for <linux-doc@vger.kernel.org>; Mon,  8 Jun 2026 15:26:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780932378; cv=none; b=I/3zzYSUArElRPuhfpdAkb8CTjMEAaEdSnSMpceERJHgRKnZC2krNX0afYGN/WyNMIG2SkL9q/gunvMIhe9LIa4YEra7osGy/yImDe0cRSRQuaGlkgIEuKEQzx1GDLdC2BHxHWM44jn0FRe1VxtEeYeWTL3vbLR5f0Ue+0G+xSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780932378; c=relaxed/simple;
	bh=yMX+W8TexPELxSvmpULoxgUGLRWGyyYeAcw46HTv+u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I+WvNeGoGerxMhml566dmIRu9Qh0oHxThwYaLEnpiRpCGtOLnK+ykd1Qp+P6EONq69k6NIzq/Bni6iGFarg2VvmMeM9hKic9pZD6OczLj64+AXQffvqfD36k2zTZYByQqSFeFfkH5U+XVxKYTQxcjETeC2sUayh75MSuoJ2L0Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=JjH8po4a; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="JjH8po4a"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-490acbb0f89so29469935e9.0
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 08:26:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1780932375; x=1781537175; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zEvrj3FcHgr8xXb2mLKuhtzTWtWLNi+whddxtH2ZY2w=;
        b=JjH8po4aOihq+TuTaZUpR9ZnHszDBJrl+U86C3JpS8NKbnuBX9lY3FmyW2GKUZVUS7
         QUZXoVcUBtZbo7NdINMd6/Csf/9aL0Zp4FEN0vrwxJxTrj9nQVRoMk25VpLnVDPe+A7k
         vM0Kkp5XS5q/SsCqMVM9vP2uQ0xUeOooH4h+ALtbbMXK+PLutvAJSoUYoTKb1XIAQhRu
         cUMlxDtLge7Hh+7JCS/Rc48preiRsLAWsxzt2hghudnKwjRzdG3aVqLHx94gEmTkLFvJ
         t5Pb7pHXJ+qv0dqz0nbdr73N4mFTL9+ytE97nXouwF7DHPiO3m29dqIwDvoAvu5OWAHC
         vJwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780932375; x=1781537175;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zEvrj3FcHgr8xXb2mLKuhtzTWtWLNi+whddxtH2ZY2w=;
        b=R7fL0mz+KB3ZO84xtzmc7VJCSH8MCQQH/ezZOvXiE9zUogkvXd7JBO8QO4Zl8hF0wf
         AiKqbIS84QB4BDpqcni6UvEpFnPpYPIdsmx6vJT8F2QvVW9qzOlXYaaTx4O7snTZQdmu
         r3us/wjHdehCPa9aV2vYFsS0hbM+NzDHtglBV3n6gNekzWQ6CmNBNAyQfg3gBcBlx0qX
         QIdGxv70blmB+1YvkiVzThftyFwXKkM06ftNP5lBugLfkNCvogQ2cVQo90aMPZWjeyxy
         wNF4IzNVKKKnalQqnz+6qQBkaG6Qy7za+L/SckT7iOzvuK4OhIvXnNwT4sS1MSsn9Ci8
         jmxQ==
X-Forwarded-Encrypted: i=1; AFNElJ+Z7bl7txKAL73y6pfAfQxarrHc2UaZsyYyaVOyFxDpHtwQsfE+xlnRXNXpbESNZgJqx42bkkPoDi0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX0AIiGrs0cEezDC1IJ9N115B3z6Y6+H1SfSiAA/3sWM7CfxHr
	AfFU1c5z7bI9peNqUJn8ZTzU0cIMZFUbx9VkP9TQ77/bUmaum4OLdmr81/tt5MWM59E=
X-Gm-Gg: Acq92OG9J4bvPNRI4NOqq2pUxc/duG7MjY2ys3Fi8t4tVb+Kzvx464ga5KbvAkLl2/4
	qljXn9MEvzE6/4/9G6X8CxFn+q2XGA2tmRS8qvE2IbFNqLGKsCbHw65HNBfjuPWEq9cs2rWGfWs
	USgiQdpZ04Qgh98APVTBIXT0qofKjWxgtPxGEVUPbaLIp67nHLdeVB2R8J2ekAM7ANFcYa69fqc
	LyE0cHIYahw2ueXAu7rlJ78yRN+fYDCaHD0IK2I/OfMXOZjcb7BUVa/pQPWUcrlSTT00Q26ItmM
	dxVinegNsd3AgKyJpqHu2Tg1qjjOpXNsFwLtGr89cWb46SrJVBFZ1w8GjXCPwdz+E9leInV5GlS
	SXb+f9jo048hS7bxBswKnIu2CwbfTxv/uSIM+u8umNF/f8/dk9Uh3rDYa1cqIbF+jqKOeIzZXZl
	MR42L2+otAOQXC+GvVmW71XkWdsZACYsGbYs+bXyu7tdpE5Bk=
X-Received: by 2002:a05:600d:849c:10b0:490:b58a:e6ff with SMTP id 5b1f17b1804b1-490c26e1aeemr178859365e9.22.1780932375459;
        Mon, 08 Jun 2026 08:26:15 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4601f360bd6sm57162809f8f.36.2026.06.08.08.26.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 08:26:15 -0700 (PDT)
Date: Mon, 8 Jun 2026 17:26:13 +0200
From: Petr Mladek <pmladek@suse.com>
To: Andrew Murray <amurray@thegoodpenguin.co.uk>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Russell King <linux@armlinux.org.uk>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-rt-devel@lists.linux.dev
Subject: Re: [PATCH RFC 4/4] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Message-ID: <aibfFQpK0Se-SiaT@pathway.suse.cz>
References: <20260601-deprecate_boot_delay-v1-0-c34c187142a6@thegoodpenguin.co.uk>
 <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601-deprecate_boot_delay-v1-4-c34c187142a6@thegoodpenguin.co.uk>

On Mon 2026-06-01 00:17:40, Andrew Murray wrote:
> boot_delay has been deprecated in favour of an extended printk_delay,
> let's update kernel-parameters to reflect the addition of printk_delay
> and the deprecation of boot_delay.
> 
> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

LGTM:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
