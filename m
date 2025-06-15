Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4371916FF44
	for <linux-doc@vger.kernel.org>; Sun, 15 Jun 2025 07:37:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749973040; cv=none; b=rUQrznzkLIlzxdfUXEVDco28pYzpnX6sWiZupJqMP8SASUwgEZWOWMIUcSODQs9oDNvdg817lk/crtFCttW9F1OBZzPAwU+Xb4+LxRatyjeHQPr2xVmumw6HmuHkAb4NQUiY5QCnPq+CKK6lbaK5eASz9O4zq7Mj1Ey90kML2zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749973040; c=relaxed/simple;
	bh=gmI+OB18/aEFLmeG+0NzWDalnJ1KU2lcY+ijh5E8H5M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pT46IiJLpSNY+fkup+3vuVOg1Pk+Kj0LO21UUyYL/eMkt08flFfsjfANwMUXOcRKDnWVpG18saBypW1xCGq3JmxtenmiXICjgcAqJXd6BYgASdPtpDQkFtiPI+ue3rWOBfyPDoJN3r5FmfhOjbqxCnVRwo56AlFOjmhI5NJuvW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b=xnMDdUIK; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20230601.gappssmtp.com header.i=@dama-to.20230601.gappssmtp.com header.b="xnMDdUIK"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb46so24793135e9.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Jun 2025 00:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20230601.gappssmtp.com; s=20230601; t=1749973036; x=1750577836; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FZe8uQenlqylTmWqNC2hIY8BhxwJwY3Ls343kx6UWFQ=;
        b=xnMDdUIKJPMVG2IugNAPrWYQpsfUuBz+NiDCwuiKaSd17T15lDcS4VLBHX8j9aA/gX
         qxTXl23somu9+2UCHe0xD0GFAnc5JeETz+/n0OH12B72Dee+1Cx2TVhMPxzUuWYO58c/
         0Af6K+4yK0+RhgVFLJX6DTwv9PdymbFhWSeRwBSyNbsFbXp2rQjc/86T3SHgYJxx6hvr
         jtXz6zux1pH7G1bGva/2RR79eyJQOyaNOlsG3ApxSWKhLGzZTkRPZqrXIVAB2zqIqppQ
         S3CxE19XQJNUraberPbxmN7Ko3Z9dcxkn4lF5YxQSiDSBDgsgkwHYbyMwg0j1xkhXz+n
         R1Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749973036; x=1750577836;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FZe8uQenlqylTmWqNC2hIY8BhxwJwY3Ls343kx6UWFQ=;
        b=M9AtzUcpf2k3lkTVOxNsng46dGOxG9+SdR/KKjEVEaDToUKNEfVJXLD9JHxNtcrSQO
         KUQ+gLw5GUP7uadNBTHSfoAvY9R1C6S6Ex/QkxAN8HrTQ+zME/ujlch+NvtAiMwNa2fw
         EN6ol8lzhMBguCFGlUn304wGTf+Geut6XmowWm117ZFTET5N/75tvXj97itD4YCo1rwC
         j463p1AGBN0zv0pcAuSHfBHqrGc4KDq8TRGWgYNO05iDMTieOUlWbu/TF/IoJxwKfosN
         tXEVNawHkN35IJ5qAvv+aTEUbzH6pHq9xTdngeQEOrQo3U3zWwBoUigNrlDbdZxLDUMa
         YwLg==
X-Forwarded-Encrypted: i=1; AJvYcCWr6JQaeYmHcSOIZJOwa753N6Y5RNcaTBBHCrwTmuXQ9IrVrZcahBK37U7zsdbIfnBtN+1Lc1Owsm8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8HGZEaX/fM+ZujDPAD+V+rnQIATk047hV37BYfLytFP6WYzp9
	oUASJoHgpw13PQ42P2XWv4TVTgzsWSm7avrbd8gjOrxxZ9tHAo1lobXXk9qOIUn+HmM=
X-Gm-Gg: ASbGncv5PmV4WUQ30lGOehkT3voeqYTeIAsNh4hq/pcx1l19eAop/SqLK6+Bxj1AiR3
	3R6hQr0dWtNAdMsO98YcXx7U8nP5aQJkBLtU63sPo3MBq9i90wK59mJ5bxNOOqf1MJURcfmomK+
	QSpvbhTVwChPGghyiHlHKYxyqUZugFp3H38gaBJlfib9+tWqUei6tDzCVFT52KSugveFavgcP1a
	DDmcLswmpQ4xmDZqgnOTMtopBUEiz6dW81Z9vM7Y2ZNIuOLUMXw5CA/ik3NDevIMO8pIHLfA7ac
	FbThon9OcVdzTsab0snpmFmJj/vfL8SPb3OyvS1Vfk+DL9rlkGf7BGMCZNOoI2G1VoQ=
X-Google-Smtp-Source: AGHT+IGT3aOKYj3HxP/dNJ5wrtCJCS4jvbys/KYqEQvAxfZyw3IyNpDmpHTFfLaisw6FIEWMgIolQQ==
X-Received: by 2002:a05:600c:83cf:b0:442:f4a3:9388 with SMTP id 5b1f17b1804b1-4533cb3bd51mr47139255e9.19.1749973036451;
        Sun, 15 Jun 2025 00:37:16 -0700 (PDT)
Received: from MacBook-Air.local ([5.100.243.24])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4532e253f64sm101318935e9.27.2025.06.15.00.37.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Jun 2025 00:37:15 -0700 (PDT)
Date: Sun, 15 Jun 2025 10:37:13 +0300
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: corbet@lwn.net, workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH] docs: process: discourage pointless boilerplate kdoc
Message-ID: <aE54KSsCaTY5cxri@MacBook-Air.local>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, corbet@lwn.net,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org,
	netdev@vger.kernel.org
References: <20250614204258.61449-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250614204258.61449-1-kuba@kernel.org>

On Sat, Jun 14, 2025 at 01:42:57PM -0700, Jakub Kicinski wrote:
> It appears that folks "less versed in kernel coding" think that its
> good style to document every function, even if they have no useful
> information to pass to the future readers of the code. This used
> to be just a waste of space, but with increased kdoc format linting
> it's also a burden when refactoring the code.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/coding-style.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 

I suppose I am guilty of this ;)

Reviewed-by: Joe Damato <joe@dama.to>
