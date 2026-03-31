Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 290CD2ECEAE
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 12:32:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774960349; cv=none; b=q4Yd6mHlxArN9Bp7BXSMFJ+vOff1plZ99laZKTWh4WMQzEeWiwle7HW5jMtjdw8QunSVh2xpCTxPOc8nQ1QIzVEPcwB7bgjbmFPui0TXvRpakUyMEePMhiRmXIRVdlbiMt2GUjZ3QMt6B15zKIb+cXvJesST2Mf12xpTLlw/KwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774960349; c=relaxed/simple;
	bh=cNAikEHCkZVbXV9L7P9K7rSvtd8mDS7n8ChYvIbvV5E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OT8kUPlIbGVIF19mQfMNGRir25Gf727VXUgbb9Ktn4FpbcwR4Oq16GL6FbmeBG9rKkSag6Hb0GTk0pbrMAsNHkkYFdGaBVGnhbzR2FyE5gSw+pYTANzovdX/OC0D0qo4xGGXkwVSPOk9ijpG1ohNIn56dCFsVyYtH0IHDw0DvIw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=bYbq5O53; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=PApz+8B8; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="bYbq5O53";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="PApz+8B8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774960347;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=cgrfduhaMhaQEbDK1fgbyKqHENYWUFIoiUzS0pqdh9Y=;
	b=bYbq5O538ljMpHCFHWBSNIff4MLZgHQ8Vxz7fqlDZZxAyhhrU44ycNNdp/Y6Rq9m7NUohh
	F83geqTZAi0OngAsG7LfOO8FESxeMjqlfiPe+UMv6P38S/9axDPX3CxG7x4Wg0Usaafy/7
	Tv0V5Ob9nvcmdIcU46H7mH0crwnosjg=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-508-9xrjGfaQO--nFPnLZlc8Hw-1; Tue, 31 Mar 2026 08:32:23 -0400
X-MC-Unique: 9xrjGfaQO--nFPnLZlc8Hw-1
X-Mimecast-MFC-AGG-ID: 9xrjGfaQO--nFPnLZlc8Hw_1774960343
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-43d03065782so1097459f8f.0
        for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 05:32:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1774960342; x=1775565142; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=cgrfduhaMhaQEbDK1fgbyKqHENYWUFIoiUzS0pqdh9Y=;
        b=PApz+8B8eGQWBkV4lX35SgtPd2F9o/hAs5zQPdM/21IN0BvZ1EIeyIRpyCKx3B/qPN
         6T7WBJpMk9R1Hc/ebJYiXRVRkFcjD8VvhwEJp//cyoJKtyvLtkJh5uM6OWHyz+SgvMF+
         uObZyTlHDkdaeMarbCSyYhua8kQhY2Hf+JUXESDpwDds3K3TOE5gi1VOB9B+TEmiR877
         zw+9HH97RsIc9srE3NPl/4DW7gHYxC5V12ZxOTTxbtM8nSN/cZcCf6hhH6gYXFbDnzNj
         NH/ug7Ea4zRA/8tRxqpfxZl2hyFiP/7bfrX09oT4KgUWVpEiyhLR3n3KjN9JCVZ+mEgQ
         o8bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774960342; x=1775565142;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cgrfduhaMhaQEbDK1fgbyKqHENYWUFIoiUzS0pqdh9Y=;
        b=b8Sou39YJgfodGuKD9w7bP3goUPBJRdmbWTF7At3P7+tmLkmX2Si/jllZWaRL8x/kd
         RbgK2ZXr/Oo1cy2K6sh9MnH5vs8iwKY4WDCBkB67kkr543QBjOaZxqwLR9EVra4OchH3
         dokOL5oPURZotgfuPIJoi60TPCL9rFJv4qR68Sih2or02L90XhbujKRVpHT1tl2A9d+V
         aq+Vepf0J/GKZs9cpnxrBA2IC5UrmUsUG1miqkIIWSy67eEQNeB2C9eZ58wKWmvFA0ku
         TGCLOzC6HCKZFctxY3YgbFGzRlCmANROzcp1fks6it3nENXNX7NNMohhCzKnu9Y/2lT9
         gm+g==
X-Forwarded-Encrypted: i=1; AJvYcCVsPhtcW0XPSQuZ5Y+019BDQyA7zjFb3tmh0QN2CXbiH7RKUUxwYtRnDDfqsKX//bPhdEYyyE+j+2Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDvIyWpScZs8GFTr1ZSUU55oEWLnmLc9YmZxOKpqfXGyuU8fNF
	XOFWWhh0VTBv9sShT8rNUKBFCKetNKzZAR7FncAE2r0/wgmdlFACikMBKKxJsW+tZW3aoNlVRr6
	ts8M4IbtVHXcjBel60gP3YCgGfrJ5QUoPuG/CRoTRh5gHVCYCqICnWTNEzGzssA==
X-Gm-Gg: ATEYQzzRPvKM7wIrYOLmsWj48U+xiQN7DtGwbxBU++eq8V0dLDdb+MvMaJ9eGnVaL0s
	WwWpr51XdcYv2Er+T2s+JoIyVhfObxABLlja0+hwIf1Rpc4kV+Lk9LSlavwmqPgpHC1hAI7dhqS
	laOajS2uWe8QmvIePN4BKqUa4xVTh7BWTg7Ri/xRHU7pogkRkipCcGYehglO76LoK5hBV+BxsxV
	FnDEMdjsNICO7zCAck/gI/UaRDNwh6RVVxF8xBHiNXjMDgL7VJ8iTa7x+JhuCJ2RZgkSH6i+DaH
	lMVWneftT4845O1ipo7Gl5/h68p4lKSUgIeTKADMVN6v2XvLR9NTtJqtEaKUw3yGyTKV3B8lvCl
	CyD4A1ohyBMGtPXRY8zYk6/ai3WQChQ/mIylUfC1BvMBgiSSrCiI=
X-Received: by 2002:a05:6000:2011:b0:43c:f3c9:3815 with SMTP id ffacd0b85a97d-43cf3c93863mr20177973f8f.3.1774960342501;
        Tue, 31 Mar 2026 05:32:22 -0700 (PDT)
X-Received: by 2002:a05:6000:2011:b0:43c:f3c9:3815 with SMTP id ffacd0b85a97d-43cf3c93863mr20177899f8f.3.1774960341966;
        Tue, 31 Mar 2026 05:32:21 -0700 (PDT)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.82.96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43cf257b72dsm27221882f8f.34.2026.03.31.05.32.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 05:32:20 -0700 (PDT)
Date: Tue, 31 Mar 2026 14:32:18 +0200
From: Juri Lelli <juri.lelli@redhat.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: linux-kernel@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>,
	Nam Cao <namcao@linutronix.de>, Juri Lelli <jlelli@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	linux-trace-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Tomas Glozar <tglozar@redhat.com>,
	Clark Williams <williams@redhat.com>,
	John Kacur <jkacur@redhat.com>
Subject: Re: [PATCH v8 12/12] rv: Add nomiss deadline monitor
Message-ID: <acu-0lUkjGMQbsZ1@jlelli-thinkpadt14gen4.remote.csb>
References: <20260330111010.153663-1-gmonaco@redhat.com>
 <20260330111010.153663-13-gmonaco@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260330111010.153663-13-gmonaco@redhat.com>

Hello,

On 30/03/26 13:10, Gabriele Monaco wrote:
> Add the deadline monitors collection to validate the deadline scheduler,
> both for deadline tasks and servers.
> 
> The currently implemented monitors are:
> * nomiss:
>     validate dl entities run to completion before their deadiline
> 
> Reviewed-by: Nam Cao <namcao@linutronix.de>
> Signed-off-by: Gabriele Monaco <gmonaco@redhat.com>

Looks good to me.

Reviewed-by: Juri Lelli <juri.lelli@redhat.com>

Best,
Juri

