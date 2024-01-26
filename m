Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8264C8C
	for <linux-doc@vger.kernel.org>; Fri, 26 Jan 2024 00:04:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706227447; cv=none; b=H5TfraOinFqC0JZQcrcYb3jwml57IMGuk+WMbiqJv7CKoGCrQNzonOFlMt0sCeDMW8WTJs2cEJUIdCFoysJ1nB+6UDyhJ2o6aOHqokWIdzbvUb50HGrk+T/lFN9h5IMIlCk3syylN3DT+3dTFHfdGeB4jbAwXarOKI7CT9jekvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706227447; c=relaxed/simple;
	bh=7zbZOXeSYfrXL3UfSHshupsYWCGYDeTqXmv5Fpw29Yo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=coq7j2TcOFCuNn0NhDrR0g1lNlV5nkv5nWctA+/rYQNTQcKcWr4LlbB6k98lNh6FNLYj2skDZ2Rki4ebVz5j0IcCTSBUGHCsjSaCibcq8ZavBZV2GAfgxOFOaPcz4iTNdr9FZ4vtECV5iqT36mCUaX2onUiXnazbRYxR+8v2yJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=hzSBIy+T; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="hzSBIy+T"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-290ec261a61so96476a91.0
        for <linux-doc@vger.kernel.org>; Thu, 25 Jan 2024 16:04:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1706227446; x=1706832246; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nt+zkT8dWPbaYHm7q/7qevYBv8gGAY6mW3zJ10wq1SE=;
        b=hzSBIy+TjaTBgKhxctcHd2aCx2964mTXstQY0xCxO9GCw4t6HYehBs2z3M10ZNSPiO
         JTS5VUBNp7WHh2g+faO7IIqTjUsQkO8ZYXL8T2CbCHbaA7ZtuXAXSJW1GUAOTV2y/S/1
         FZoM9jnyAg3XbLgP4eI6waClnJ6djymJiehBg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706227446; x=1706832246;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nt+zkT8dWPbaYHm7q/7qevYBv8gGAY6mW3zJ10wq1SE=;
        b=t8xHrdoKkPjg/Z67Ibyzl2do8bG9J7psEPUJZcZoCQFxfKPgo57om6UdOe3JKagVmi
         B2q3ooWY31KKM0gO+UZmJDg9f5reWU3lB3l6CEBAvJKz9A8hMCUxie2Rp+EFA8ceqp7l
         LBZAPQVN4wcRhws4nc0Y4DkURHkGCLR1G7BVv+aP5SrOedtKOEXd4YKDemAWiod30AaL
         qaL8Fbb5rIBui/8tT5KkYDfmi5QARYcY8nVgWzyOZ6cAIRRvWVrRMeM5aAFay3mx8YEY
         7dqCSABIuGbWproxt4YwVsWSOPezZ5+cnfH318S9nHMLp7QZrX1XF1ZOBHU1KiOtS+43
         Q+iA==
X-Gm-Message-State: AOJu0YwzcJVTx98X3feMXZSSV4hGsixcSl95IELRlFSDX34uEVBcMheC
	TSkDKR+BrSVrPBytzMVt8u/fNBNpz/DbhgA9vsLPnwLp5fr8d9Ecf9A5dJ7OMsA=
X-Google-Smtp-Source: AGHT+IH3PGEaEJ5fzY45STg6LjF8IDS5JBxY9N4KvoaAPzzvAAbyyjdFOLiivTEHCXcPoP38TqXmVg==
X-Received: by 2002:a17:90b:d0b:b0:290:5ae2:f2a8 with SMTP id n11-20020a17090b0d0b00b002905ae2f2a8mr532493pjz.33.1706227445731;
        Thu, 25 Jan 2024 16:04:05 -0800 (PST)
Received: from fastly.com (c-24-6-151-244.hsd1.ca.comcast.net. [24.6.151.244])
        by smtp.gmail.com with ESMTPSA id sw12-20020a17090b2c8c00b0029105d49b2dsm96322pjb.20.2024.01.25.16.04.03
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 25 Jan 2024 16:04:05 -0800 (PST)
Date: Thu, 25 Jan 2024 16:04:01 -0800
From: Joe Damato <jdamato@fastly.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org,
	chuck.lever@oracle.com, jlayton@kernel.org,
	linux-api@vger.kernel.org, brauner@kernel.org, edumazet@google.com,
	davem@davemloft.net, alexander.duyck@gmail.com,
	sridhar.samudrala@intel.com, kuba@kernel.org,
	willemdebruijn.kernel@gmail.com, weiwan@google.com,
	Jonathan Corbet <corbet@lwn.net>,
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nathan Lynch <nathanl@linux.ibm.com>,
	Steve French <stfrench@microsoft.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jiri Slaby <jirislaby@kernel.org>,
	Julien Panis <jpanis@baylibre.com>, Arnd Bergmann <arnd@arndb.de>,
	Andrew Waterman <waterman@eecs.berkeley.edu>,
	Thomas Huth <thuth@redhat.com>, Palmer Dabbelt <palmer@dabbelt.com>,
	"open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
	"open list:FILESYSTEMS (VFS and infrastructure)" <linux-fsdevel@vger.kernel.org>
Subject: Re: [PATCH net-next v3 3/3] eventpoll: Add epoll ioctl for
 epoll_params
Message-ID: <20240126000400.GA1987@fastly.com>
References: <20240125225704.12781-1-jdamato@fastly.com>
 <20240125225704.12781-4-jdamato@fastly.com>
 <2024012559-appraiser-coerce-b32f@gregkh>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2024012559-appraiser-coerce-b32f@gregkh>
User-Agent: Mutt/1.5.24 (2015-08-30)

On Thu, Jan 25, 2024 at 03:20:37PM -0800, Greg Kroah-Hartman wrote:
> On Thu, Jan 25, 2024 at 10:56:59PM +0000, Joe Damato wrote:
> > --- a/fs/eventpoll.c
> > +++ b/fs/eventpoll.c
> > @@ -6,6 +6,8 @@
> >   *  Davide Libenzi <davidel@xmailserver.org>
> >   */
> >  
> > +#define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> > +
> 
> Why this addition?  You do not add any pr_*() calls in this patch at all
> that I can see.

Thanks, I've removed this for the next version. It was a remnant from a
previous version.
