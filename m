Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B982341F5F9
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 16:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785168840; cv=none; b=V/R+2soYi2tP5Bw3dryEbl6eA1UUhxgAf55Vg+4aD8CntAI2iJyVD4kfsirafkwLdkMO5J0j85ud1ullLaiXG03q+ihjAAPwjyfgorbEs0eGsOpQXx2bQwVmWnEJTXIaXmf7p7yN83uAVc74ULBr2r56KrGX2b4QQQJCyA7usuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785168840; c=relaxed/simple;
	bh=M6CDqdYKhpv5poRbrKy+OyIHoOpHoVrZYtaje71XpQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fjXN6KYzq8c8F2dU/UA0qDmfrwwYWEDNK00a5buNI38vq5bC/D5dv0Hr/PCjZ7ZV3BUdQt2Zoq5S+5380rQBm+anG2Y0rn2S85L+car66t6B3Z38T4XgadLxqI6zeOzo9RipH86tMLaagILQMy0EvYLifolhfPIiWiB9UVh5o1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=AGu70SUe; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="AGu70SUe"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-92f0b5ed131so206544585a.3
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 09:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1785168831; x=1785773631; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TTY+STYwMH0ZtrJAz3SmNmqE1zha3pWeJMVUMgWHQEw=;
        b=AGu70SUeQ0lJS0cR2s3M5abwIjEHjC5lOAFK2jhHedERfLqr3pF+GoyuexIg9AZnGD
         6Da7mKO1/nFUvJVyZO5dvKcPYQdmAJo4hJt3PveWjK/W/f1T8akgMa1b2FWBIBq7jv1n
         Xh7u/fajB00W/5W3VnSTSAzj+J0U4evuyI8ItVB1YuH1a4QWIUj/SNZ9fm3RUGfK0px9
         ilIYWcmBiptLkQ9vhOluZJCeGIDEnTcH7j20o9qUJBavxC3G6nO+7z3C+k7qKh5FypkJ
         Y54k0eBMwmmm8PyXmor8fM2rlzSyzK5pxe9K4faQNbh1q1mHpjL9ngv886D7ELuiYP3P
         mmZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785168831; x=1785773631;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TTY+STYwMH0ZtrJAz3SmNmqE1zha3pWeJMVUMgWHQEw=;
        b=eMZ9mFDTQrvx4iAtEb6+xFGbP4r7vD/rtkXtz8rhj5zmOzAKnuj3SegWLEblWqoTqc
         sPt8rFHMRZI+aLnIvc/DmXAnHNgGe2qsLTxQmzer9Wo5fCTpmiSojaMNz88jlsxXg9gq
         aSKRKS5hBMaor0ubA7P4wcix9dEBtrRakoTLBBlWcmsZskT2pFxc0GfHYX/RZkNYT4ZL
         Rv/wceFPV5beNzJeGGo1y8666oHWAUWUz42r1T+yLhgegrYhKFqlum06MORHnzd5XAHs
         PclonPdXGkm06oB2l0iPncnnhYfUfr3vp2QkTNfSc5aQy+QuTVEL8JJreaULn5pryYLt
         JaqA==
X-Forwarded-Encrypted: i=1; AHgh+Ro08zhk76zrpzO4y6fflvaOXboU3wnSujEiyg1DefpJZ7/Dg8QP3ovC0CEBX75CtFIHyBvy466wlXc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJOp2pmmr87kE0Fx8r0aaZ3Mp5hWbJs7ukINZ7ySgv6RvH/Yb/
	emkYudsjVIarrBCJh4MTUfBpArj4SzLon2e/zI4hAcBPDGKeSY0nf3vyQjljKpOC4w==
X-Gm-Gg: AR+sD12+h80uQr29hbeqgUXRy502HeybAWIGzNr0R6XbbMEXj6/3T0Yq868CnkfKQ8A
	zDXEUbAzA8XJKxNug/pS5m96ZK/q7BJB/LGsCsaDxen2PCBIHzfpo+PUN0I7WafpvCf7LdudZAP
	sliJqXx6zNzvahxiK02JTpl4mgyRXtsbltNt61JdrK+QfW8mti/Mdbtv6m+wuQQ9AYglb+LEQeW
	8vM+R5AXCjhaj3bcqHNsHAVVnE/m/FDUfsJk19wroBOhziscG4dyHewgxvOntgAnt+CeEldVFfu
	gnWUKWXPjHbHFWAg3P7slb+J9feUE/2+YWkyD5yZj7epjRDOYrcGJ8hDhEiV+1p9nV0HnYSWDT2
	DL9Fzb2aMTAQh7eOME0bH79tSw8jHSbE29w3pgAbn+F9xarJGQ4qdeoZwXsQNNwo+DGgluzaIN9
	j6TJGQZJsuEQfj6qmqahMGq96W9cOupJyKzC9wlc6LJjRPXQ+urSUwVr23
X-Received: by 2002:a05:620a:710b:b0:92b:6805:91b5 with SMTP id af79cd13be357-932df6e982emr906710985a.61.1785168830608;
        Mon, 27 Jul 2026 09:13:50 -0700 (PDT)
Received: from rowland.harvard.edu ([2607:fb60:1011:2006:2008:aeb7:73d7:d8ff])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-932de51a7cbsm653190885a.8.2026.07.27.09.13.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 09:13:49 -0700 (PDT)
Date: Mon, 27 Jul 2026 12:13:47 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Nikhil Solanke <nikhilsolanke5@gmail.com>
Cc: Michal Pecio <michal.pecio@gmail.com>, linux-usb@vger.kernel.org,
	gregkh@linuxfoundation.org, linux-kernel@vger.kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH 1/2] usbcore: Add quirk for 255-bytes initial config read
Message-ID: <a0db0e6d-ba94-4577-ac11-6f2d26055427@rowland.harvard.edu>
References: <20260717195336.98500-1-nikhilsolanke5@gmail.com>
 <20260717195336.98500-2-nikhilsolanke5@gmail.com>
 <20260726182946.79a4ef98.michal.pecio@gmail.com>
 <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFgddh+1Bk=CFkKYNzB=L++UejkhCEcTHp4A2JL2v+P6uBuF2w@mail.gmail.com>

On Mon, Jul 27, 2026 at 08:55:27PM +0530, Nikhil Solanke wrote:
> For the remaining comment and log message wording, I'd prefer to keep
> the current version for now unless there's a strong objection. The
> patch has already gone through several review rounds and I'd like to
> avoid extending the review cycle further over comment phrasing,
> especially since the implementation itself now seems to be in good
> shape.

I strongly agree with Michal; the comments are overly long and contain 
information that the reader doesn't need to know.  You don't have to use 
the exact wording in his suggestions, but something like it would be a 
big improvement.

Alan Stern
