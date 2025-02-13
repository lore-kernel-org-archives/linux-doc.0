Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E1F227EAF
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 13:45:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739454344; cv=none; b=AuJAp3m8kVMHyYZAAHe1FaGpBEWg7T9pVDD5mc1YlR7i7u1vBWCyOHtkdhoZFKFga90UXSdMb2XzXOQF3kX6tdCm+sp4pQeYUMPbqC8UuJVrVsP1iY18PfVXIrtgt/0mZXUO6Z35QkPPBytGImx8HaZl4e5c8tRKrMt0ssIHumY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739454344; c=relaxed/simple;
	bh=JqQGz/Rf5LV/UyFhhwLvg8wPoS0Ss8A3I+uVWgQQo5w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ovUvLYU+IQqvNx/6wFnCo5U9Rs7yU96gJTN+/3XD70TvMKeaMCFIJI4ODV1nTQFDrjur2uY6tdqDdZnMt2urW9ks4CvJ3D/PlsLl1Il3zg85Rn0BIvvNDwzxAYpkWkm/ga9THcrgStstCggg171O4L8mgnKDG0mg4qwiEGAZW3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=O1UWIXHE; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="O1UWIXHE"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-220e6028214so3868865ad.0
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 05:45:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739454342; x=1740059142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RZfMY5Ky6JWO9rAJooFwnfwAFBDZ9Iv+5bt9evH/dRU=;
        b=O1UWIXHEKbeC/PxRpLLmgkzBm1k6JwJ2hHxPImqG6Z9mkd7UMEdhPn/GPw3oOp9Xpl
         ANo2Lv0GkybX96+PfFPxJe7vTooPmgNZsZIZuMbidqT0Q6SX7ldu5XVUgi91o6atNusN
         WIs68Wuvx1itUb4f4+tBPwyp+mZcO+VO5iqjc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739454342; x=1740059142;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RZfMY5Ky6JWO9rAJooFwnfwAFBDZ9Iv+5bt9evH/dRU=;
        b=oESdtaDSvZICy4dwqH6iWk4+YxupfTfZSpaC71EF3lBXISZmX6E6WG17MH3NM5ienl
         pfM8w9W+hVyblRIOmhz3H+V66g4ZSLvoXs40uVIbo0h3K7xeIpfpi2C2/nUVfgtr/yiB
         2wAmH+c2mhjHX/H7XchKY/7NEvE7qzGseDrf8gKldgkTg245gd4xAUXZQfiMaABeqp+A
         f7M4x8u1pap2NbGY4z4NfVdHc4njB/GA1N7X7OivUt0uNNcW1QoeNdcokpjG0TXvDwiY
         DcxQ7LCpLLkEMq5VniJbO4mB7pUc5uwjnRha/huV8B1lApyqf+dilRT+EQnDmKQ+kngb
         Waew==
X-Forwarded-Encrypted: i=1; AJvYcCVisVWTWuj4Hud3le+DMuzR8apJocFXKzMq3uH3tpIGYi5Gnu29oQTcoItRJTwErKWU8WOPc8ew130=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAMJc8s7FGnF8nTPg4f8yvwCSilSFDTv6knO3a/kYq7nYhIvhV
	CxY+BiGgaeZso9tpez4ExRQDX4QZx4EtBbH8ddjviFHbWGbDISFzHhupu2ICZEA=
X-Gm-Gg: ASbGncvXbozBmXwxi0iA0vgHbcBR6BO7V2+Y/TVi3GocEmWoAP7eFU0CVnvdBjsp0Ul
	N7b/ABj0U0MsddLDA0qWaaZ80sEUypRlU5QJMB0B3th9bN6qwuM3Tjb6STaNfDHKwS/tI6MnHxz
	BeXgabodOfznCbQ2csKG+GwnLakmPI26UOBwcbCF5hy/+2xI9Wuz6U+9MeR6rT3NXEQNV1d9UVD
	uSdmllx9cYWpFEJ34z9UAGMLn9lgv7Vw/iK06ZHBOExxA9ICkaz8PdB1MsSC/RYSY5LFe9RhHEv
	3X8g3pFj/qQYpFKjt5px3u5mHcqxfYh1iVKHYJiA6jJfOicmzIji7+aHUA==
X-Google-Smtp-Source: AGHT+IGVQHRnaEC8fyg/uKj0MoWqj7Qq9SDAczdTFT9cAow0d4in9EcMOYDk7qf/rAYnjSF0QhPwSA==
X-Received: by 2002:a17:903:238b:b0:21f:3e2d:7d2e with SMTP id d9443c01a7336-220bdf4ec11mr105120495ad.27.1739454341404;
        Thu, 13 Feb 2025 05:45:41 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d5590770sm12359555ad.231.2025.02.13.05.45.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 05:45:40 -0800 (PST)
Date: Thu, 13 Feb 2025 05:45:38 -0800
From: Joe Damato <jdamato@fastly.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: netdev@vger.kernel.org, kuba@kernel.org, rdunlap@infradead.org,
	bagasdotme@gmail.com, ahmed.zaki@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] documentation: networking: Add NAPI config
Message-ID: <Z633ggyM-F2pfAkG@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	kuba@kernel.org, rdunlap@infradead.org, bagasdotme@gmail.com,
	ahmed.zaki@intel.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <CALALjgz_jtONSFLAhOTYFcfL2-UwDct9AxhaT4BFGOnnt2UF8A@mail.gmail.com>
 <013921c8-1fd0-410d-9034-278fc56ff8f5@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <013921c8-1fd0-410d-9034-278fc56ff8f5@redhat.com>

On Thu, Feb 13, 2025 at 12:45:01PM +0100, Paolo Abeni wrote:
> On 2/11/25 9:06 PM, Joe Damato wrote:
> > Document the existence of persistent per-NAPI configuration space and
> > the API that drivers can opt into.
> > 
> > Update stale documentation which suggested that NAPI IDs cannot be
> > queried from userspace.
> > 
> > Signed-off-by: Joe Damato <jdamato@fastly.com>
> > ---
> >  v2:
> >    - Reword the Persistent Napi config section using some suggestions
> >      from Jakub.
> > 
> >  Documentation/networking/napi.rst | 33 ++++++++++++++++++++++++++++++-
> >  1 file changed, 32 insertions(+), 1 deletion(-)
> > 
> > diff --git a/Documentation/networking/napi.rst
> > b/Documentation/networking/napi.rst
> > index f970a2be271a..d0e3953cae6a 100644
> > --- a/Documentation/networking/napi.rst
> > +++ b/Documentation/networking/napi.rst
> > @@ -171,12 +171,43 @@ a channel as an IRQ/NAPI which services queues
> > of a given type. For example,
> 
> It looks like your client mangled the patch; the above lines are
> corrupted (there should be no line split)
> 
> Please respin

I must be missing something: I don't see the line split when looking
at the original email and I just tried applying the patch directly
from my email and it applied just fine.

Are you sure its not something with your client?

See the message on lore:

https://lore.kernel.org/netdev/20250211151543.645d1c57@kernel.org/T/
