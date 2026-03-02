Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EF26385500
	for <linux-doc@vger.kernel.org>; Mon,  2 Mar 2026 09:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772442563; cv=none; b=nlTcQyiku/JHu7dfeRwBkY/dlZkEeMtdb7W/grzwU0dXHcCJD+e9NdrIENbR4VjNgJQgHXDosp4PiWhjVnQFQnTTOHw8oVytI7i+3wcVMH96WeDt3wCFjYI4vJxEJi5kSpVVMrgzNXPWEiaJI8yTeQSjh3eAT7PpgPUjBGympHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772442563; c=relaxed/simple;
	bh=ilMQGVCasLEyuVKt3xmPGLbzaexBUt4hoMGNq/qop6c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GrX/NUVqTkxvVxa03Fl/idv1WwMb6rVQd02KLWbF97RIDhrZjdwmAZzcBpX/TAMh/175lDLK6BSlXqUsxkwwSGckwAQ2aBgUJRbGfWUW/QnY8NgwJIfpdYw0dGskIZYrI/heB9QAmYS7v9U1YbstR+KtY7BkSXSpA9SUY8ry1jA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=AMVKFmcg; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="AMVKFmcg"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4838c15e3cbso37009445e9.3
        for <linux-doc@vger.kernel.org>; Mon, 02 Mar 2026 01:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1772442558; x=1773047358; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ilMQGVCasLEyuVKt3xmPGLbzaexBUt4hoMGNq/qop6c=;
        b=AMVKFmcg4l39oJMarm/bn5uahr/tJ9jjFRlKIlqA9xsQAKkyq4jjrLZRY6EEKLVk8f
         xm7DzBNyWrw6PnPJnMUyxa8fDXWDkd8ikJiYnewReUGwhNSdcPaqzdkTh6nUAvU+XU2T
         xEsQjdgHgZQCq3TBUyCudQXI88B6yGIyRoc08x7bPK6sTBOhcrwOyMpJHJtf9zMxdAEE
         QMiaeRLSCNLbfbu1ATqdUGq80PwNz7MUeHUKzeoLegcsotBwwzziUtrw+eDaOcHeuN51
         U0K225TJgdXRYsu3xyaxvFsHcSPZuouu8gMh5cDO+e0FIFlHLaU7hO2qumGnjIGFVGs0
         1LDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772442558; x=1773047358;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ilMQGVCasLEyuVKt3xmPGLbzaexBUt4hoMGNq/qop6c=;
        b=WYTNO16xdzj9N/j7YMGkDHYIijwtqz4U63FKJkY/4imPCiHyTOYHXSo6rODuAaUhDP
         7+2ZpH2yGjr5qfVlix/YygMdiP9jp1CMDEcvDd+6pgkzgT+nc2GiHmdNVf1/YYmhOFFt
         phWcB6WSLj+OWCY9gske3FDxjj/bph4HZHEwH8isLL6h9yR5xfQQ0B7IpdM9lC8DUsRz
         muy+RdQYQa2KfBQponfyuPB8jCjycFmoQocCKf+v359xU43Lqh2cA2p0x2/u+MBw548V
         mhNPsufRAcVGjyWYY0FppOzTRF1db7nMuHvuI2vwp2y5SkOvFbk7eY6ukzOrEQKUZVai
         IKTA==
X-Forwarded-Encrypted: i=1; AJvYcCVrDZAmRKuXBr1tTKwoG1L2c2Gz7FPzljg5HY7OLJ6jf7flwuhr1oJVsFZHdlZwXGZaaQJrgrU3k1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXQk9DebzkS3tXO2UZcwmVslUAFQqe4NTk5u5YRl16FA9DitXu
	YftG6tOoELBC7udIQ0/HwBgLI2wIIUtgtE/PnGZg/3nxLz3VCOkwPMHtfUjiLvTOc6w=
X-Gm-Gg: ATEYQzy9QYHHKRLUm/pvqgeYEiQ3XhhJbs3nrWPrFrL/lCz5ONLX7FWWiC9BWTlVlQ2
	cQZzCK1V7rm40+tzCis0r05KLpjtBbE+TXg2fr4/Yly09Fy0qG9bdXVMf25TmsYoAUs3zzAd/f5
	OpYiQwxAjsIKUUMQdXrFlXjGWmjKlDnXj5C5a5Uj9rYkJJc3F52Pnnx4XMgPIzvr1Tt1ZaNVhGu
	KqyhpsY3Hrv348Mku2C82iGy1X7BVCjjENsATJd2tJrDV9zFkWzGCl30Y6p1xO/3MpSQP6QTra3
	ovD7SSLEFQWFu+nYsXBe+PCLN5+1zSnB/XkC7kboho8M20GXgphicFRRKZKj3FjOHo1ygqwkAaD
	An8Yr8w/QkhuYqe5opr2MIGxLA9OricjTjopkrBoZlJ+jwlx36t6p+tEtrzt6XrT5rfG2Ih4Mp3
	JnmLLeu9e8rhnVtf1q+WPL2uSeG6+/VNhKd291LmjQOHSV
X-Received: by 2002:a05:600c:3b18:b0:483:7631:befa with SMTP id 5b1f17b1804b1-483c9bc55d6mr190142375e9.5.1772442558003;
        Mon, 02 Mar 2026 01:09:18 -0800 (PST)
Received: from FV6GYCPJ69 ([140.209.217.211])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd68826asm633954365e9.0.2026.03.02.01.09.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Mar 2026 01:09:17 -0800 (PST)
Date: Mon, 2 Mar 2026 10:09:15 +0100
From: Jiri Pirko <jiri@resnulli.us>
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, donald.hunter@gmail.com, corbet@lwn.net, 
	skhan@linuxfoundation.org, saeedm@nvidia.com, leon@kernel.org, tariqt@nvidia.com, 
	mbloch@nvidia.com, przemyslaw.kitszel@intel.com, mschmidt@redhat.com, 
	andrew+netdev@lunn.ch, rostedt@goodmis.org, mhiramat@kernel.org, 
	mathieu.desnoyers@efficios.com, chuck.lever@oracle.com, matttbe@kernel.org, cjubran@nvidia.com, 
	daniel.zahka@gmail.com, linux-doc@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-trace-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2 09/10] documentation: networking: add shared
 devlink documentation
Message-ID: <wukj2sqty6p54lsedkquvija4fm3xjgit53ukomnx4pgymxpsb@pwbyampuhj6k>
References: <20260225133422.290965-1-jiri@resnulli.us>
 <20260225133422.290965-10-jiri@resnulli.us>
 <20260228150558.46f3be36@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260228150558.46f3be36@kernel.org>

Sun, Mar 01, 2026 at 12:05:58AM +0100, kuba@kernel.org wrote:
>On Wed, 25 Feb 2026 14:34:21 +0100 Jiri Pirko wrote:
>> +Shared devlink instances allow multiple physical functions (PFs) on the same
>> +chip to share an additional devlink instance for chip-wide operations. This
>> +is implemented within individual drivers alongside the individual PF devlink
>> +instances, not replacing them.
>
>Sounds like you want to preclude what was the goal in the discussion
>with Przemek you quoted - a shared instance _only_ case. We don't have
>to implement it today, but I think it's an entirely sane direction.
>So the docs should not state otherwise.

Fair enough, I can do it.
