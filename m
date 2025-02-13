Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA572204C0B
	for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 17:38:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739468338; cv=none; b=EUMCKleDBFjz3NUq5+KZOFfhin6vjJXt+Roewird7aAHaqZjIwEOpOtXBwVZuYWn1GSzcGioB1DkB3E5audRVfOjGx4FTZC505adhCoDc3W/gVQZDqUtYSTvlWNEFdKtLruwPNDJ5PZ0DXVFo6gng4c7FCftxrig+/3x3x1cBrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739468338; c=relaxed/simple;
	bh=b7N+8dSPQ0OnlGTOQ+2/iyi4f6259SWAIHYoRWb24J8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S0OYEQtyp/D7PfLAxeQKJxRI+XFABM8osgvxTn3Mm83BssN1fkSnSOhlLY/qwo/W+IkH1oxcGSfIzVtC3NIL+EOKkXcg2I8ddVi7RpzeWZ7rERk/QP3yvZdxMLuSziTstGSOz/ELkGq6U3Lcd2KkjH1y14l6n4psovEvBr0avs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=ECU7WBy3; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="ECU7WBy3"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21f6d2642faso30084255ad.1
        for <linux-doc@vger.kernel.org>; Thu, 13 Feb 2025 09:38:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1739468336; x=1740073136; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oLC9kfYPwLBjTLU9fLAjv67CM2H+dgqHjhipB5hFLZc=;
        b=ECU7WBy3jbHPomLP0Xv0uYG7Q3Uwur/tm0kyRQqp1L0sCK3uTarWXuth+a+LOA4Umw
         brm3i/Kbk3Vk7W8H4zDLq4Q1KDeVz7TDOn6nyJ0Vyx+UXJHl1q8INHTYUENkFqDu5bgj
         SabyGG1Yp9h18+gTUcWsm7IM+4/kyExktlqaI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739468336; x=1740073136;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oLC9kfYPwLBjTLU9fLAjv67CM2H+dgqHjhipB5hFLZc=;
        b=HxoTYEQtL6/qBzENTYrbgn0BYHcaADrC+MD3d07/b9Cswdr+8X+C6tTHMpz7VuLBZb
         1PeaF75i+LQNz1uqDZsH1QSwGzhcshLRKFQQVddF7UFQvlz7oOFFG67Fzgokfckd0mBK
         9fzRHA7ASw505XgFYdXU92Tidxk6XJxcjlhHKs2WJaGRcFtkaieBXgLvRCHUUVAux64J
         AGp6lcAjojA982bCBwl0GEU/kPFNIaxFpbq6C83FSLuGiB3d4d0JtIUuq5chrOq9BwdU
         Q/t4l+FozRPsrOzBjqvAmY3dC87C0Ke3JN2+8XHO092fBTgrvq8dP5EIc8sTxRxA6KTV
         eRbg==
X-Forwarded-Encrypted: i=1; AJvYcCXCTf8rQ6jg4jZTGLiqoZmf1NxcuIEiQgfZA4nESqazIuOQdhjFamYBYBKidK7GIuueXaqpORlRsAI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6rrwxWUhYUfBAgAlQmuytitvxBg6LNmY004z+mY16dVJG6+g9
	lS+7NUlKkO9r2hsslcacvOKphIs48S4qGIs0sJ+pQDdOR1CE7Gp3O/ZczwgAYvc=
X-Gm-Gg: ASbGncvDWo1FSFWzDz4paXz25qvbzYvleBR0QfSg1NXy7CyRyibY3Y2Uz/zeg9Si+aL
	mqSYW40KhmtxmFxfokYSmeBQSN4gBAFupurPIp/mCMAxDSAs2K83GR1spo2mc6Npvsi1PZey2ai
	RWSkld9GJ7uiQYQRN2apzFflbBxLuRjLNCcjfApqQPZ472A/hElxokL481OaugNQsAfr5y4mZ5p
	JZtXWO3dkXDLKWHO5fhZxC7SYqMyQte/eNuxblX+LOTBd7ppNhOJewjhH3UuchGyRje+b3gMsXJ
	RWN+Fo0etlSAKRWBko1oAemGvC0k5uC5Y2mv5+an3QgxtlPRncHY7gAdBg==
X-Google-Smtp-Source: AGHT+IHKx7UoBaIYvNAKG4jbdIsvHPKTWLspdf35/yTjPBwhkv4ORzitL5INUVr5HwUTUERzhGKRNQ==
X-Received: by 2002:a05:6a00:2e1c:b0:732:1ffc:36f5 with SMTP id d2e1a72fcca58-7322c374111mr12059457b3a.5.1739468335955;
        Thu, 13 Feb 2025 09:38:55 -0800 (PST)
Received: from LQ3V64L9R2 (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7324273e4casm1588770b3a.103.2025.02.13.09.38.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 13 Feb 2025 09:38:55 -0800 (PST)
Date: Thu, 13 Feb 2025 09:38:52 -0800
From: Joe Damato <jdamato@fastly.com>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, netdev@vger.kernel.org,
	rdunlap@infradead.org, bagasdotme@gmail.com, ahmed.zaki@intel.com,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH net-next v2] documentation: networking: Add NAPI config
Message-ID: <Z64uLN63gD0nNvk_@LQ3V64L9R2>
Mail-Followup-To: Joe Damato <jdamato@fastly.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, rdunlap@infradead.org, bagasdotme@gmail.com,
	ahmed.zaki@intel.com, "David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	open list <linux-kernel@vger.kernel.org>
References: <CALALjgz_jtONSFLAhOTYFcfL2-UwDct9AxhaT4BFGOnnt2UF8A@mail.gmail.com>
 <013921c8-1fd0-410d-9034-278fc56ff8f5@redhat.com>
 <Z633ggyM-F2pfAkG@LQ3V64L9R2>
 <20250213081418.6d3966af@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250213081418.6d3966af@kernel.org>

On Thu, Feb 13, 2025 at 08:14:18AM -0800, Jakub Kicinski wrote:
> On Thu, 13 Feb 2025 05:45:38 -0800 Joe Damato wrote:
> > On Thu, Feb 13, 2025 at 12:45:01PM +0100, Paolo Abeni wrote:
> > > On 2/11/25 9:06 PM, Joe Damato wrote:  
> > > > +++ b/Documentation/networking/napi.rst
> > > > @@ -171,12 +171,43 @@ a channel as an IRQ/NAPI which services queues
> > > > of a given type. For example,  
> > > 
> > > It looks like your client mangled the patch; the above lines are
> > > corrupted (there should be no line split)
> > > 
> > > Please respin  
> > 
> > I must be missing something: I don't see the line split when looking
> > at the original email and I just tried applying the patch directly
> > from my email and it applied just fine.
> > 
> > Are you sure its not something with your client?
> > 
> > See the message on lore:
> > 
> > https://lore.kernel.org/netdev/20250211151543.645d1c57@kernel.org/T/
> 
> It's also broken on lore.
> 
> The first diff block starting with the @@ line overflows and gets
> broken into the next line. All lines within a diff block must start
> with a space, + or -. The "of a given type. For example," line breaks
> that.

I see; I think it's this oauth2 helper I've been trying to use with
my google cloud account. Arg.

I'll RESEND this and my XSK attribute thing, too, which for some
reason isn't on lore but is on other sites (like spinics).
