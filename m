Received: from mail-qk1-f169.google.com (mail-qk1-f169.google.com [209.85.222.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99C932FE59C
	for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 19:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782674292; cv=none; b=JrqerLbKXP1A+sI1yk3KDHImIYLy6rLcqUd8QoYHH7yQcNUcHTDgU/nZFBX5qg5vToYEelHIU3Qz0axdOiCSIliIw+UQy+HeOQskolC/8up/vBF2emYx63+UHlJXf/LuMFbHQMkWEUtxuaMenBgC69yJJBDcCqiiaUFuSPfOQC4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782674292; c=relaxed/simple;
	bh=n/G92GrsA9ruso1DbYIYE4AnAPuAZp/VAjINM+B7Ly0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CUFOx5J42puiWdC1P72EShMuzielejOG1hw0VBZNC4MdtsQFkMpa97ZadPBuyrqAmQfJOZaY401qk2d6/f/psS6pjVV45c6IEUbBaJrUIxh6hTo+p93irWLt34WZaFlRO6m0NDXyodqmwjk6URF+QaS+hROE5mvUJfNqLBpKb2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=Xxul7sXu; arc=none smtp.client-ip=209.85.222.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="Xxul7sXu"
Received: by mail-qk1-f169.google.com with SMTP id af79cd13be357-920fbdffa31so215965085a.3
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 12:18:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1782674287; x=1783279087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oo5Z8Yt77eV159eB51RytXZ95igPn7LmT+HtkoqhKVU=;
        b=Xxul7sXuHGHi+ll0holyF4sdpxdTJvRDQ7SnP+xGyabk8dvVpGkDlSeYwy7o3xPkIh
         tJ1nqASfQ0mKMDEnEji7qpgBMUkWQgL2GJlWhIDGRwgZwLrQcWWLYRT3V4KXlffRx7l9
         KvPXVtSvwMXFKNXOsnGK5+wM2pdezRLxt2rhe0m6Oyg5WrLUkz8dkr6hFjVdLB+ZH50o
         9p6xtkoW0Zaje1gJdK11HMu48alPaC8mLQ2b/mMvBL3EhfG732/5UwFTXA+pknJTRdpw
         EsnOikqJMpwdq3QuF8Cz8VduDFm8Sll1HxflbQ3b+58VC1TQLAhQuttrzFn1jSsusGmo
         Ca/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782674287; x=1783279087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oo5Z8Yt77eV159eB51RytXZ95igPn7LmT+HtkoqhKVU=;
        b=gYYGWN4sGObqU9dgP/op+UoI89RimJcvskcVZNRhXWo1F4omi/IlPvBjv/eOUZqwhE
         g2qrjE4yBfwy5WlKjpBl6yZ7OC0Ag50hoKSELRShbvqaP4sIm9N2drJQlrZjkc9DzYmt
         HZpsDyxSh14/uB+vTIMnVbn+rpxlgvZX+dtjPF1mxCdpmweYEtxTpZNdn5vUNvcaMYLT
         eHsS6Hcany8BpPDOcpWX8gsALDh2+g9OrpAmjKAc+Ig5tIQU14jdJVBJLbQqoyM6AAPE
         l8BJwQxQG0h7oBAl4FnjIyWsyLWTLJdmpcb/L5LyGzmigsnQNSNxbJget1y8vshSrI1c
         8QBQ==
X-Forwarded-Encrypted: i=1; AFNElJ9fivFkCNtzun39+9+Tr9YQWxAb98d1IyIyLSgvrJJupZ7rUnizURe2JX5F3m1/Wjg/bg/Lg0xGi2Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQtJezPp20SABmSQaboERk5+rbdQ/1aQV5t9Dvs8efqaK8/xMr
	h3KtNjLS7vDOqVJEQGZ6G/BtN7i91d9UI2zR95Gl3PELhl6+b8qQzB++Mv8ucM6yMQ==
X-Gm-Gg: AfdE7cnteCCEd2Tgjbc3Lcp6bCgioI0l77v5fwbiXgVEqjWS9vtczx0nme2o+1Y6OYU
	KlSJH6eQ3UPO2G5Y00lCIWnsRmUPuddie3ApxhULtw4YF1ZwMhrhIL7fRIJKiO26uXPqNCOSLEx
	wsvT5Omezjzj0QADFpKvHDksnuHonPZ0/yw0ghr0vRCN6caCyvzbzt/6VAd72zyJhzukW7SJ98W
	QjJnrmokscj8RNYrH4sybithCnIfZG6Y8M/ioBYYmqkGq9BlgDzE+9wFON/Bi0Cay24xd4IrwqH
	cutJ8vqF1y14vKnIdM+l41Zs6OMgvKuhJZuNseDhgn74B7rXPzFGarcdE210uPDTEfonUDR7PpS
	+M9ifRn42wlEAMvy+CzK0Tb8UK7iLPcPeYEkCOzfGwWygVkD3bfVFyFHcARxtEB7+3Pq9bJdwgh
	zW96My7DmstF9Tn/1bayx8odw04ILYsGk5
X-Received: by 2002:a05:620a:a0c6:20b0:92b:a2f6:d1a9 with SMTP id af79cd13be357-92ba2f6d1f0mr646592985a.44.1782674286568;
        Sun, 28 Jun 2026 12:18:06 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210:d62f:1911:f952:16ba])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926000c343bsm1872097985a.28.2026.06.28.12.18.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 12:18:05 -0700 (PDT)
Date: Sun, 28 Jun 2026 15:18:02 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: Nikhil Solanke <nikhilsolanke5@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <8f5bb295-fc1b-4698-8f2f-2d40fb4d9f93@rowland.harvard.edu>
References: <567e8866-4308-4e5f-819c-fe778dbf74f8@rowland.harvard.edu>
 <CAFgddhJk0EYG71fnKdio=RHC-cH+JmL-EZ7-oVD-LdHoa2TBSA@mail.gmail.com>
 <5159fd69-dddf-4073-a8e7-95fa77de0b7f@rowland.harvard.edu>
 <CAFgddhJ2HeJ=oTBX_axMJcgJq7GXH9abe+LH+x9NGekGO4BMyw@mail.gmail.com>
 <eb0dfd45-91c5-49ba-a297-b183dbc52c8c@rowland.harvard.edu>
 <CAFgddhLZ9SuOzG_6mW09j9aDkCp6TedpNkzJ6TUD+DnR3TDLKA@mail.gmail.com>
 <02060df3-b8c5-4a86-b3ab-3a28eea8a562@rowland.harvard.edu>
 <20260628165040.76fd608d.michal.pecio@gmail.com>
 <62e1fab3-1045-41f3-bc74-4c7624011619@rowland.harvard.edu>
 <20260628190201.00afdccf.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260628190201.00afdccf.michal.pecio@gmail.com>

On Sun, Jun 28, 2026 at 07:02:01PM +0200, Michal Pecio wrote:
> On Sun, 28 Jun 2026 11:48:36 -0400, Alan Stern wrote:
> > > How about "keep unrelated changes out of a stable patch", i.e. always
> > > do the delay (if any) after the first request, regardless of size?  
> > 
> > This is not an unrelated change.  Rather, it's deciding on how to behave 
> > in an entirely new control pathway -- the one where the 255-byte quirk 
> > flag is set.  The old pathway is completely unaffected.
> > 
> > I suspect no devices will have both this quirk flag and the DELAY_INIT 
> > flag set, which means the location of any delays in the new pathway 
> > won't matter at all since they will never be used.
> 
> If no devices will have both quirks then new delay added before the
> first configuration request will never execute.

Correct.

> If such devices will exist, then it probably won't matter whether the
> delay comes after or before the first request. Purpose isn't known,
> but it appears to be rate limiting configuration descriptor requests
> or delaying other requests after this function returns.

In fact, the commit that talks about the Logitech webcams does describe 
their buggy behavior to some extent.  It says that they seem to reply 
with stale video data instead of the real config information, and from 
there it's a short guess that adding a delay gives time for the video 
pipeline to drain or time out.

In addition, the fact that the delay is needed after the first request 
but before the second suggests that the data corruption only affects 
transfers longer than 9 bytes -- which the new first request would be.  
Therefore it would be appropriate to have the delay before the new first 
request.  Whether another delay would be needed before the second 
request (if there is one) is unknown.

> Either way, no known need exists to add another delay before the first
> request or alter the existing delay (or its conditions) in any way.

See the reasoning above.

> In general, I always object to code which serves no purpose because
> such code is easy to add but very hard to remove when it gets in the
> way. There are no known users, no test cases, only paranoia.
> 
> So I would keep the delay code completely unchaged.

At this point it's entirely theoretical anyway, since the devices that 
would get the new 255-byte quirk flag don't also have the DELAY_INIT 
quirk.

> And skip other random changes like error string nitpicking. Reliable
> and up to date information about how many bytes are requested,
> "expected" (what does it even mean, to somebody reading dmesg?),
> received or verified to exist can be gained from source and usbmon.

Good point.  But I dislike messages that actively produce wrong 
information.  Nikhil could get rid of the parts of the log messages you 
don't like, but he shouldn't leave them as they are.  He could even do 
that in a second patch, separate from this one.

> A stable patch is supposedly supposed to be 100 lines with context ;)

Nonsense.  An excellent stable patch is 7 lines, including context.  :-)

> I really think it could (and should) be a simple patch.
> 
> This is what I wrote a few weeks ago. It's an unconditional change
> for all devices, but it would be easy to turn it into a quirk.
> 
> 
> --- a/drivers/usb/core/config.c
> +++ b/drivers/usb/core/config.c
> @@ -938,15 +938,14 @@ int usb_get_configuration(struct usb_device *dev)
>  	if (!dev->rawdescriptors)
>  		return -ENOMEM;
>  
> -	desc = kmalloc(USB_DT_CONFIG_SIZE, GFP_KERNEL);
> +	desc = kmalloc(255, GFP_KERNEL);
>  	if (!desc)
>  		return -ENOMEM;
>  
>  	for (cfgno = 0; cfgno < ncfg; cfgno++) {
> -		/* We grab just the first descriptor so we know how long
> -		 * the whole configuration is */
> +		/* Try 255 bytes first because that's what Windows does */
>  		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
> -		    desc, USB_DT_CONFIG_SIZE);
> +		    desc, 255);
>  		if (result < 0) {
>  			dev_err(ddev, "unable to read config index %d "
>  			    "descriptor/%s: %d\n", cfgno, "start", result);
> @@ -975,8 +974,12 @@ int usb_get_configuration(struct usb_device *dev)
>  		if (dev->quirks & USB_QUIRK_DELAY_INIT)
>  			msleep(200);
>  
> -		result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
> -		    bigbuffer, length);
> +		/* Don't bother if we already have it all */
> +		if (length <= result)
> +			memcpy(bigbuffer, desc, length);
> +		else
> +			result = usb_get_descriptor(dev, USB_DT_CONFIG, cfgno,
> +					bigbuffer, length);
>  		if (result < 0) {
>  			dev_err(ddev, "unable to read config index %d "
>  			    "descriptor/%s\n", cfgno, "all");

Making this depend on a quirk flag instead of being unconditional would 
yield a patch very similar to what Nikhil has already posted.

Alan Stern
