Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1695242377A
	for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 13:36:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784208975; cv=none; b=VUjwAy6SKlxk5raQslN03PbmBNJkRQ5kjYa55XFoHBPsZXK4lnCd9poJMqhqowF3iuYAzNiGJTFGTdzZTZcH4iRcx/raW37vqS798G0HaP70SfEs/bGU/dfGD+VJJA9xSU1ZG/EmvQpPsirGFT8ASfeb414x5EJdygVquudqZw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784208975; c=relaxed/simple;
	bh=Oecs3cF7VsLepHL3npOZJPC4VeDjnKqWP0cNPB4v85I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YD6ifMZZjoYXUQNax3VFO3tvbp1nIyD071Fw7rzJAXkIieO3Ngszur3SIKtDS1gn6+sVj8JTh95/jG9mzrw95RnzmtpFiTyaiNm6GV7y9im75oT7R3evb1vbYIhqu4Yw83jJAh0WrhD5Fx/Eh7ZDfIDC5Pcc2h7mQPUfJyLY+n8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=J/IUGGgA; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="J/IUGGgA"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-493b779003fso28504055e9.3
        for <linux-doc@vger.kernel.org>; Thu, 16 Jul 2026 06:36:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784208972; x=1784813772; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZxMW+cZvUWvRljOA6VXL+6atXYnie85udU5ilmsN1H0=;
        b=J/IUGGgAN/Wz3sv9JFpDR6mq/NKSkJEP94Vtfa9dKYEcmj2lcWUwDchRQvawcBeG+n
         QuPolfudPX01VWhuhfA7Kra1FvuQjPjpMmT8y9nxj9Je+qUOgzaKVnzM6ftlkrB7pfXS
         wLZ5Z5Bo4MRCfKY7f+tEJZUkhFJe6YeuPZPbYZ5NNEvXgktrzyMSv2OEYiOaiDjBTXVa
         G4Wc8KV65kte7odGZqgDo6PMEHX+pBfc0fJgYgT8t5pLgF+zwIw82ePw9iTVprnMJs1L
         6RMAOIKiy2/YnNMbnrnpX7XBzhwzCRX1KTQ8P/HEt+xqzq4oqZQMzWzZloqotf2V18KR
         miAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784208972; x=1784813772;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZxMW+cZvUWvRljOA6VXL+6atXYnie85udU5ilmsN1H0=;
        b=lcraSHBuI5a0ypiAdrIVnopa6T00vszRZgmgn4mzgvmagDhWFHxP0jmZXU0krrytli
         YBSG4YuXrwMHCwoocaK8cgF61ZOXQXa4KTPnNq0USrjLKIXhv+GlByUbhStuydKMXAWR
         MuqW47s/PeMJWRgJx7Q7Rjf9tBX/DG/xfqjkfz3nIf0eW0RumoRrdYXe0HdLgiYFNHZe
         ZvqvOlJjfM3gT1U6pxPkBGYH4rsL1/x7mlv+uZma7I4BjtO+3Ch8MPHJ4QxrrWODU9oc
         xbgEoNr6BwzxXHLrRm62bvXfES1uTzYoRKrORf39RUULW3cxq7kPw+z7PUIz6E4ExiW7
         HAhQ==
X-Forwarded-Encrypted: i=1; AHgh+RqR//S5/K2EViHMbucU9BYZpnb3GsnJWQlWxSQ1TqSSjkRKs7SR5BD094U2JZt8JVX57L4V6rBNxec=@vger.kernel.org
X-Gm-Message-State: AOJu0YyXJW0DR9PEsMCMnBnv7a1yiT0b+k+ZnD/g7ocN7e+cPhwnpA2n
	pfpICdp3d32QidE+0JMztuEhIaknmlCCaIwLuVyqOY89kkT/pP36ZQLhJKsSWJ/v63g=
X-Gm-Gg: AfdE7cnpHet8sCt4//sqzzV9LUqLyt8c5ptH+QF7NyZPbBxSNRpKOFvPwbauilhL72h
	AHBRdG15Fvl5PGLP2BaL8KR8HpQKb3RaNELXxi3aQbhr1PW7moMfHBYbzIhlPLlxLcPbBncvw3G
	u0jX2hGQPb22qU7/yaiMmPNpBpU4ANbohG83AjvKTYVhzSWEcI4xQ1b3h642OPndyY2Z4NeW8jk
	bONE5JFXl0A6MeWvtXlkRlCfH40qJGmetkme6FDup5QDdPEXYmF+5TOmmlAsxtEKxRFzA5vRoqM
	Kw5Ovm5MQ/hfaF0lQkkiYNzwIiAkKXvQ2iiNSqY69YLn7cWLFDZ6zANQ0AFFLbvllQ9INByg1v6
	W59CS/4EOQnUhGfRwcZNsCgQM5fi/mc3ayNbloyeTThMB4j3AR9SxsAFUPxMhfl42f9DiY3fV4z
	gqJLdn
X-Received: by 2002:a05:600d:644d:20b0:493:c601:3e23 with SMTP id 5b1f17b1804b1-49538992cfbmr95343205e9.5.1784208972253;
        Thu, 16 Jul 2026 06:36:12 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f464c1f84sm24902683f8f.29.2026.07.16.06.36.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 06:36:12 -0700 (PDT)
Date: Thu, 16 Jul 2026 15:36:09 +0200
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
Subject: Re: [PATCH v3 4/6] printk: deprecate boot_delay in favour of
 printk_delay
Message-ID: <aljeSRmY7K38ySmL@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-4-574547b8f71b@thegoodpenguin.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712-printkcleanup-v3-4-574547b8f71b@thegoodpenguin.co.uk>

On Sun 2026-07-12 11:20:35, Andrew Murray wrote:
> The boot_delay (BOOT_PRINTK_DELAY) kernel parameter and printk_delay sysctl
> are two distinct mechanisms for providing similar functionality which add a
> delay prior to each printed printk message.
> 
> boot_delay provides a kernel parameter for delaying printk output from
> kernel start through to boot (SYSTEM_RUNNING), whereas printk_delay is
> configurable only via sysctl and thus is only used post boot.
> 
> Let's deprecate the boot_delay feature in favour of printk_delay. In order
> to preserve functionality, we'll also extend printk_delay such that it can
> additionally configured via an early kernel parameter.
> 
> Behavior change:
> 
> The delay enabled by both "boot_delay" and "printk_delay" continues
> working even in SYSTEM_RUNNING state. It must be explicitly stopped
> by setting printk_delay=0 via sysctl.
> 
> The delay is skipped when the message is suppressed in all system
> states. It used to skipped only for the boot_delay.

s/used to skipped/used to be skipped/

> Signed-off-by: Andrew Murray <amurray@thegoodpenguin.co.uk>

The code changes look good to me. With the above typo fix:

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
