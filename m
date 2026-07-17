Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4235039022E
	for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 09:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784279440; cv=none; b=n+MIcB0iwnaLijjNRyvfPAm+9o4OhkKLdELuzCRgr3pyV54YndCtgzgjss9iAcUcHNcsOwK7vygJgmhxXAh5LH5ZcNB7v+8g1f5A9yemQzjlCUZpDe0UdE3vr6AZ7L7tKiHQFp3XB136YTCTTUEcqlHRYrFM5C5FgC/Legt0pdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784279440; c=relaxed/simple;
	bh=xqT1ch9QXSr2Sh4KWiRd5vGUh3tKkxctBsod5h5U4Tw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D7NZD1C1Yt58SMvcl6p5EQOym1zDREsZxBHYP/V1K9Yme5scadl1B760ZQf7D5dZC9HV1MdCEbbouMMIKhzlmB09ja6mJZPLxDG8mRpxsOxD4MrwIye8uSIdBAHU11fKv/6HUlAUaMEsB6V3fd77Zfsq3461WkCP2qwjzSgPxjA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=C3Hgioml; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="C3Hgioml"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-476d8e647e9so6949006f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 17 Jul 2026 02:10:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1784279435; x=1784884235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GvqX1BcEi2ll08wPBPPLJIyQRF13ih/MJcl5l+I3Gbk=;
        b=C3HgiomlMLNaItNLhcns05qMldX6Si1IsACfu0wxvmnG239Zob5VZt6TlY+oG8GvLG
         SY5Z9uWWO/yubq15a5aWBGPcFdfMIs9wKvHsfmBIZgwtdxOCeF3pv2/pqkiaKs3Fja0W
         YDywE5iKhfvby0qQTml+H0MsciaWMBhnbnMYI3QAoP4tffdHgzeficzoB2ziJpG1Ka10
         5EUmcIUzVOkVFm9zvn7s/kwOo2gY5yUdQLwn3O9Y9dKrm+Zjz9yT45Kk7YlsgMQFxs0O
         5V+YsgQin7jx61ARO4Zt3yCYXYP35PX8FNIVQ0UcLN5Yk9mkjsMCR9qB+0YfWn5bBaZZ
         MRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784279435; x=1784884235;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GvqX1BcEi2ll08wPBPPLJIyQRF13ih/MJcl5l+I3Gbk=;
        b=FYr5fUkXrFTKSLAZx6zkn+BwxRQpSdJuUTsj0eD8qxht73tnAd7WFRg0OHMS8CgWFj
         3PMSv+r39UU+jbVcTgGhZDAKJnhlo3jiaiSjgp6EmiAPyJmxcP1t+nAE7P8veUk6nBmn
         U5p0FYsl43ndgqG4foXTyeNuUSXywglXHbxrnus6V+R+jBlEv1eSG7pFuVcjJTZWcJgQ
         U09UuyQRCYkLClccLPZsPlem4M2+GhDksoI0xRVMiRbBi7zw6Y3v6SqPbyFigBLiMzzJ
         FR5JhBOoOyeGH2jk5X/eaidLkzsmZt9Ud2y6VKYfYFzwv0GNfwQHKhZw6NJi/sarnQ+U
         fDLw==
X-Forwarded-Encrypted: i=1; AHgh+Roz86UvnWNi0eWo7C80lBcCrRjqp5wxceE9coa474QtgDIfjc6LDiYrhDBJGYeWKh1PA4gPhcAjoDA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsOJ4XPssrDA7K15liYjZrfiFYk0TkrDL5jot1TzhCK3m9kQlm
	87VQVcuLIJHjGxzd5gqkITfN6N2361ynYsvigpc2qpVbw1TSvsm1sWpj4nQ/Ald+s3tdluGvqoa
	NzBYQgLM=
X-Gm-Gg: AfdE7cnnS2F5j8oogDfEmsn8FHmitqYe54tbLUw4w4dbs1ld48KcvhtdbB6YFqfmUTV
	2M8O0bn3nugdT3Zwe/K1sRG/YTZLPh62wG7N2rFiNjhpmeobIFo+TJGhnXS/WjkeFzaewcw4Fdh
	j0jW5KufXEQ99Eyz1ht/CDgcT8s8I3oB+9X6y1zYxv9lsiyYzMFYzkRpdmE1zQx0N7M8pdjdtKB
	e8BPboVGd7fHmaSGF7EcRR4bFByLScrJEl93CV5SgdK3RM2+TJccXOx1E4AudvbsTyRQOyET2Iq
	9fu0NbF1/qTsu0MVOIjrGSNJ9wFqlz8LY4DP6zdYYuiseEzHSSTFH7qdJ7ws4aTVV2cYhrimjKv
	Arl2u3b49KjG6bCMXRXKkWprPTcaf+ddol8c3ke75DASgekukcqS62FSKtQEM2w5pKcGdUBStn0
	AMhGzK
X-Received: by 2002:a05:6000:41c2:b0:45e:f8d0:d22c with SMTP id ffacd0b85a97d-47f62316912mr2385289f8f.25.1784279435367;
        Fri, 17 Jul 2026 02:10:35 -0700 (PDT)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f63e519f4sm2116892f8f.14.2026.07.17.02.10.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 02:10:34 -0700 (PDT)
Date: Fri, 17 Jul 2026 11:10:32 +0200
From: Petr Mladek <pmladek@suse.com>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Andrew Murray <amurray@thegoodpenguin.co.uk>,
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
Subject: Re: [PATCH v3 6/6] Documentation/kernel-parameters: add/update
 printk_delay/boot_delay
Message-ID: <alnxiCmOWrdV5YjW@pathway.suse.cz>
References: <20260712-printkcleanup-v3-0-574547b8f71b@thegoodpenguin.co.uk>
 <20260712-printkcleanup-v3-6-574547b8f71b@thegoodpenguin.co.uk>
 <20260714175131.1edfc880@gandalf.local.home>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714175131.1edfc880@gandalf.local.home>

On Tue 2026-07-14 17:51:31, Steven Rostedt wrote:
> On Sun, 12 Jul 2026 11:20:37 +0100
> Andrew Murray <amurray@thegoodpenguin.co.uk> wrote:
> 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index 2884103b93bca7b76cd3a93946276074cf62d0a1..1118feda87b1b04543b1da0bd52c090b1fddaeac 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -650,11 +650,19 @@ Kernel parameters
> >  			See Documentation/block/cmdline-partition.rst
> >  
> >  	boot_delay=	[KNL,EARLY]
> > -			Milliseconds to delay each printk during boot.
> > -			Only works if GENERIC_CALIBRATE_DELAY is enabled,
> > -			and you may also have to specify "lpj=".  Boot_delay
> > -			values larger than 10 seconds (10000) are assumed
> > -			erroneous and ignored.
> > +			Milliseconds to delay each printk during and post boot.
> > +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> > +			is enabled.
> > +
> > +			Once booted the delay can be removed or adjusted via
> > +			the printk_delay sysctl.
> > +
> > +			Please note that you may also have to specify "lpj=".
> > +			Boot_delay values larger than 10 seconds (10000) are
> > +			assumed erroneous and ignored.
> > +
> > +			This will soon be deprecated, please use printk_delay
> > +			instead.
> >  			Format: integer
> >  
> >  	bootconfig	[KNL,EARLY]
> > @@ -5468,6 +5476,19 @@ Kernel parameters
> >  	printk.time=	Show timing data prefixed to each printk message line
> >  			Format: <bool>  (1/Y/y=enable, 0/N/n=disable)
> >  
> > +	printk_delay=	[KNL,EARLY]
> > +			Milliseconds to delay each printk during and post boot.
> > +			Boot time delays only work if GENERIC_CALIBRATE_DELAY
> > +			is enabled.
> > +
> > +			Once booted the delay can be removed or adjusted via
> > +			the printk_delay sysctl.
> > +
> > +			Please note that you may also have to specify "lpj=".
> > +			printk_delay values larger than 10 seconds (10000) are
> > +			assumed erroneous and ignored.
> > +			Format: integer
> > +
> 
> The two parameters descriptions are identical. They should show something
> different. Is it just that the "boot_delay" name is getting deprecated?

Good point. We could remove all the details from the boot_delay
comment. Instead, we could say that it an obsolete alias to
printk_delay, will soon be drecated, ...

Best Regards,
Petr
