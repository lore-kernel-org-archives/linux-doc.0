Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DF081AC44E
	for <linux-doc@vger.kernel.org>; Thu,  4 Jul 2024 11:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720093457; cv=none; b=VVN37g3HLdih2qng+1I4aAdORc6eFaU04njNPaV5LqODQ+nWd0ofrJJc+9vh7qHGavt7NkNwnHLpz3Bxp8WWHyPiUKTAtiHsE9j86fUnEG+nuTvw2sQNHQiwCad19ZeMbhvWMhMmbDOkjco3JTtyHwG6vpzNbqakPelDfIbWpQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720093457; c=relaxed/simple;
	bh=DsedHeJsS/amdZVpKFJyVeLkOMNQa+PMTWNkWl1ltVg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cbc3uMW3TDTaBcNbfdU0zdaoPNIFsPz5N7BhnszO0/+yW/tVS4Z5Ad/s3MeFFOkGJQLHwiBl05k7f6kHelg5bKkbYizrGvtu98LBoED5ZEJpc5rAGiZHmm/G17HYyrw2Bcwdv121d4tx/TmUPBlpt149gLQfT7JE2pZZSIeabzs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=XHunqudP; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="XHunqudP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-3679f806223so281688f8f.0
        for <linux-doc@vger.kernel.org>; Thu, 04 Jul 2024 04:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1720093453; x=1720698253; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=lD0PPZ24LDJ5fGIwXYEdiOvdE6uwqRXg1JRtKinTRe4=;
        b=XHunqudP/7g/rGD0xQyyRcYkJVzISGl6QC6/yqNZj6Mes7HDBRk4iRArO52D96CCB4
         uI4N8yKbrSMjcfv4C6pRJzhYyjRcRRNCAiFFfDQJAptIbroKCQMcGNzVWg/5Lbtn0QgE
         w5cU7XLemDMWgfldtunLL9cTuUaL9+qxmkBwL+XZDNeRHO2E+cXpqWrOvJ/kItgMw2U+
         Pb/OpK66PRy29h62V14IuFMbC3egj7lfZ6ZzijBBpjcvG0mta3Bw6xBTBt1fJpFSEG4Y
         F1fnJM7ThJFkCvCRJ5R/utaFT8ySspbpF+dhi6NcWS6HAS7sDZwQTYp/h0DWJdUers/S
         q7IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720093453; x=1720698253;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lD0PPZ24LDJ5fGIwXYEdiOvdE6uwqRXg1JRtKinTRe4=;
        b=SuwvLAgSi1ckNfvRrNd+/ccatVH7QrPjiZmxM5QIRhA3TBw7U5NiVn1aJ7InQq4cBT
         lLxnjWcV/5YbGCJpiiPtZ1kmAp5ULxgyObxw+u619Kfu3x7Ipibr5c9/vtVbbwZyFQ81
         t4UJnyPRPOBINjuBk/trnwJ9OvKPKXnsru0gki7xhoIQFpS56R7dTOhXyZvF3BLzW5Nq
         b7E5/0h12VG9XVpy0Y9Qm1USYTMLoiJq6Hq3nqXk7K+fiNkwh7FOyPF48tVoLrUklHJb
         wchwCyaxXNCLuYjDDqkVDUUBKHtZb3gVWP3Pj8748qyXPjm5iqrtlcuwWf/y0h98hLQR
         FqDg==
X-Forwarded-Encrypted: i=1; AJvYcCVRCCm5yHbRnvRAlXPWGEdoS99XbuqjT6oQyQ1HCUBGCoiH9RZKypG4tv7gtHfmU/JQQKSjDL5yY3GETfHqN90msX0/43RBuXaG
X-Gm-Message-State: AOJu0YyvN3WMlrbOXJf4h39kaXFzA9tWV3MpkvoZO3g8ZKDcKB8MWvYL
	3t9G+u5HKLCcD+aY6vz/bsCTB4e+78h8bNU2QIXtHsOniml74ajq4Ljfv1vr1BY=
X-Google-Smtp-Source: AGHT+IGNLj31HSnKP8eMBVVDQWkUG1T6Sz0uQgf58SIcESsrCGl4BgnlWeQWQYBK7LzNx7BMg/xfeA==
X-Received: by 2002:a5d:58f7:0:b0:366:df35:b64f with SMTP id ffacd0b85a97d-3679f6c4ee3mr1144700f8f.4.1720093453629;
        Thu, 04 Jul 2024 04:44:13 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fb33901426sm12164205ad.91.2024.07.04.04.44.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Jul 2024 04:44:13 -0700 (PDT)
Date: Thu, 4 Jul 2024 13:44:03 +0200
From: Petr Mladek <pmladek@suse.com>
To: Tony Lindgren <tony.lindgren@linux.intel.com>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	John Ogness <john.ogness@linutronix.de>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Ilpo =?iso-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	linux-serial@vger.kernel.org, Dhruva Gole <d-gole@ti.com>,
	Sebastian Reichel <sre@kernel.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] printk: Add
 match_devname_and_update_preferred_console()
Message-ID: <ZoaLA5IVTnh0E0QI@pathway.suse.cz>
References: <20240703100615.118762-1-tony.lindgren@linux.intel.com>
 <20240703100615.118762-2-tony.lindgren@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240703100615.118762-2-tony.lindgren@linux.intel.com>

On Wed 2024-07-03 13:06:08, Tony Lindgren wrote:
> Let's add match_devname_and_update_preferred_console() for driver
> subsystems to call during init when the console is ready, and it's
> character device name is known. For now, we use it only for the serial
> layer to allow console=DEVNAME:0.0 style hardware based addressing for
> consoles.
> 
> The earlier attempt on doing this caused a regression with the kernel
> command line console order as it added calling __add_preferred_console()
> again later on during init. A better approach was suggested by Petr where
> we add the deferred console to the console_cmdline[] and update it later
> on when the console is ready.
> 
> Suggested-by: Petr Mladek <pmladek@suse.com>
> Co-developed-by: Petr Mladek <pmladek@suse.com>
> Signed-off-by: Tony Lindgren <tony.lindgren@linux.intel.com>

Reviewed-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
