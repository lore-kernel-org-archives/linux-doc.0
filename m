Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E8A3CBE6D
	for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 19:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785179520; cv=none; b=R2i8QNSzLPsuQIE86H23+ra5dmzCwDg3w1Qi9xCRVWMIHM6docxyfpvcv2RTH+r6Pri2ArOQ+Jxt6nOP7gbiIrfE5ezKmWCbH0ErCGpSZdodMuqdzWsE5ZqK4jWb3/KjvzOTXb95nAPLJZi0cJkO5N29pdv9P1eHNu+ItJyh514=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785179520; c=relaxed/simple;
	bh=w6Zw+XAq7csIa/unli2ye+IWWMGO5uUs3dYLEr9E5n8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eJtDXBUrzfYpSlJdQG1YsqZ4ojdZeU8w8JZ5yMPX5ziZ9WtraQDFrMQCfJbptpFHo1Rh/+DTSvx8rNB//+mddNTqUHxyyrroUFcJIyET5sBVx++KuJxqoDrZSFqoqBUh0SkRT2Jd7Mj3hpb90KeXVce0Ylv6Rgrn1ogF0o9qsjg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VeWzs2u9; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=fIP7mm4m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VeWzs2u9";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="fIP7mm4m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785179506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=WCGz+BwFtWySUH9n8dnYvmC5KiNUSY/TFMZPl7CdAE8=;
	b=VeWzs2u9zNUdZNWgVq0H8ri+ufwajnn1Pqe+7xdH+KaCA2JS+orZkCWsYR7Vhbhj5vRkRw
	qwgrb2SNVkRRwkyqkJ7I800CoG45ntLd0LkbWdf5OYl9N+R5/Id3VZOpiT8hmnfo1mAn8k
	RqX+VbsbyO7Ta5g7OMit+5bEeGCbVng=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-417-Ezp4RBidPhOeNTM1WjqcTg-1; Mon, 27 Jul 2026 15:11:41 -0400
X-MC-Unique: Ezp4RBidPhOeNTM1WjqcTg-1
X-Mimecast-MFC-AGG-ID: Ezp4RBidPhOeNTM1WjqcTg_1785179500
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-47f5a972b0eso2467071f8f.2
        for <linux-doc@vger.kernel.org>; Mon, 27 Jul 2026 12:11:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785179500; x=1785784300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCGz+BwFtWySUH9n8dnYvmC5KiNUSY/TFMZPl7CdAE8=;
        b=fIP7mm4m1dKzL/vLU4TpG4Zpl/xIPYlYy04FGAoic0MyqZmd32+9x+wqur53iiSmaN
         0e1isBrwkc74MiKIK+DpRfXLN/Vu3jyP4PUDez3vLoTWTP0La37KeDIZDsaRhkiBO6mg
         3D22GD5gjjFoN9Kxbc/9vKnYjtVVrt+jQhk9eyhp7BGcmq20XKhK8dcbek+uSWWk8rd6
         0TmrlZY+R058LPhN9zpEy7qIY76eJ4d5Uj0JfVRgcSJMZ9BdDHivVMYPAT04guJ36E3W
         JuOvEuR8gr1nJiwAdbU2I58WBlUCOPdg5TzYb95XePR+AoQM+PPD8Pyt7MIRc+rVwxnb
         wQhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785179500; x=1785784300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCGz+BwFtWySUH9n8dnYvmC5KiNUSY/TFMZPl7CdAE8=;
        b=BuHD600kQLBxhIsfZ6F1jVBaGXGUYkm2CJptLukGm6bjacNZ3L3vwb3rDFYi60DfsP
         Xf8dW56hNzCCAKKGzA8q7zvjAADOs0CxRjb+UNYMQ/dBWwyM5rfdpzIj396kDQVb0BhA
         BBh28o7sx2zxMxvGfe7iCGLWHQGhGvcj51RzsttB3m+kRlYsUBBub7rJnHqYVNRzyem1
         XBQ1CWb99R/j/8W2n+0R3/94ObDnvAZY+1qt50A9XO4L8GtLYhIER7QiSKY0fQ6UWVyi
         RWxtMy/i6/w4+yeEukQGqTz2fw8JdHVvnoHXI02IibFrZhzfP5/s/X3JEGf0OdfkG0LA
         t1Pg==
X-Forwarded-Encrypted: i=1; AHgh+RpCvR1uZd1ydDdAfOl48R7rZ68hMdg6adAp26TbS/PiG3mPytzCC0igrocVQLTmTksbmCRpi2+G4LU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxu2BJKqrd2HeMmEvM4gO60Pv01JwlzqNvW6tCW+pJiD4Quh5mM
	tVn3zhO28GHgtIZbox7J6115U4jYlVrC1WmNGE6hqFt8rYhlwDdASk72wtpMtvxA0j3yaihfuuc
	qbJGuJdAUBD4ue1qClcs1d114KR1zU3zhsnQPVa2Bo+6OIj9GJW49GZuxty2vnA==
X-Gm-Gg: AR+sD13WFnnO4zapWULzhRdyfk0tloaPq0xyGZu/0nKaR3T/Zqwi1X05OijW9Co9P41
	YKqwqDOv0+cLBRLGmMaAe67oSlMwruqS3brghiBXFouHeRrznJIRULpX3B+EeNfTMheOKeJmI91
	NZltPNR2pZ0Xwct9hLLruEMCtYZ3uZ6wYmgBIsEmpUF0H/UW8yCCEMY3APjeKPE/j6nWzRspdAc
	AIucFhTSghdel29ETJMzSTdBAj+PtVRodglpm4n+lofgcodCxDDqqYCrM9tgKx6KrkTX1PRvjUT
	nnfxb/BFfsfKV7XkjZPQ3tECmA/2KT5Ndl/B7zbgK6kSeUUnR7fCZQr1ukaSOH3fbPLmkQCE1M2
	71zEioTdLjM1fpYGr0I5FNA==
X-Received: by 2002:a05:6000:61e:b0:47e:4379:a4fd with SMTP id ffacd0b85a97d-47fafa50cb5mr459977f8f.19.1785179500293;
        Mon, 27 Jul 2026 12:11:40 -0700 (PDT)
X-Received: by 2002:a05:6000:61e:b0:47e:4379:a4fd with SMTP id ffacd0b85a97d-47fafa50cb5mr459953f8f.19.1785179499787;
        Mon, 27 Jul 2026 12:11:39 -0700 (PDT)
Received: from redhat.com (IGLD-80-230-28-14.inter.net.il. [80.230.28.14])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47f85c531afsm56615929f8f.24.2026.07.27.12.11.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 12:11:39 -0700 (PDT)
Date: Mon, 27 Jul 2026 15:11:36 -0400
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Simon Schippers <simon.schippers@tu-dortmund.de>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
	Jason Wang <jasowangio@gmail.com>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	netdev@vger.kernel.org, Simon Horman <horms@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Tim Gebauer <tim.gebauer@tu-dortmund.de>,
	Brett Sheffield <brett@librecast.net>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, Jakub Kicinski <kuba@kernel.org>
Subject: Re: [PATCH net v3] tun/tap & vhost-net: make qdisc backpressure
 opt-in via IFF_BACKPRESSURE
Message-ID: <20260727150842-mutt-send-email-mst@kernel.org>
References: <20260714092506-mutt-send-email-mst@kernel.org>
 <5016ae84-7049-4a5f-91c9-ba0047b06ee3@tu-dortmund.de>
 <5089fc5e-2fb8-41fb-9aab-42b22cc2c201@tu-dortmund.de>
 <20260721105853-mutt-send-email-mst@kernel.org>
 <20260721100715.5b43412d@kernel.org>
 <20260722020611-mutt-send-email-mst@kernel.org>
 <8814700c-7549-4d12-b657-c990dfeec14f@tu-dortmund.de>
 <20260722040722-mutt-send-email-mst@kernel.org>
 <20260722072631.21b57e1e@kernel.org>
 <a8dadd41-e2c5-4a6b-bb93-77c3d5eb6342@tu-dortmund.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8dadd41-e2c5-4a6b-bb93-77c3d5eb6342@tu-dortmund.de>

On Mon, Jul 27, 2026 at 03:57:51PM +0200, Simon Schippers wrote:
> On 7/22/26 16:26, Jakub Kicinski wrote:
> > On Wed, 22 Jul 2026 04:09:25 -0400 Michael S. Tsirkin wrote:
> >>> Would be great if you could do the revert.
> >>> I don't want to mess it up. :P
> >>>
> >>> For the re-apply:
> >>> I can post a v13 to net-next soon with the flag included
> >>> into the existing commits.
> >>> Or would you rather take v12 plus this opt-in commit as-is?
> >>>
> >>> Thanks!  
> >>
> >> jacub if the revert goes into next what is the process to
> >> target a patch on top of it for net-next? Thanks!
> > 
> > misheal, revert will be merged to net and reach net-next on Thu after
> > the downstream PR, at which point you can post the net-next patch.
> 
> Hi Michael, do you have this on your radar?
> 
> Thanks!

Yes but I have some urgent fires in other projects to put out first.

I don't have anything at all smarter than git revert + some testing in
mind. If you want this to make progress faster, you can easily
do it and post and I will ack.

-- 
MST

