Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FF44A02
	for <linux-doc@vger.kernel.org>; Mon,  6 Apr 2026 18:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775499000; cv=none; b=RU5AOaBuWrEeloebqpX/8UB/gGNhey8hkpIbaxu1lccmYgTZ/XX81+opYNAA13wd0uyKqHTLcLCsDHeIDwResRH9nBC6Wqm540WpC2MXP3DU5g6X9AZNW3YvryDQBE1ZUovhy0A6Yl+uuQ+6Kfh2Cj1v9P4RKy3BR+6JW1aP+T4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775499000; c=relaxed/simple;
	bh=y87UGnEvy+KkqoyI9K6D3ZSqtPHNEV6mFem3Govbx0Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=adbFOYwPUnsSjixfDPTEoGDQ+HP14dyFK7PzeVVM+VEnETZwhqlxzXgqSUKde2Tavi96IErw5O0dK9VfJVjiOeOIuionmLlzAiAE60TrPUk8uu42P0zo+ahoBDBJRJSvltflOQJKCfsf9rgnOx02/OOG2EaWoiWcfIitezH8UW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to; spf=none smtp.mailfrom=dama.to; dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b=w2Z4HDhg; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dama.to
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dama.to
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dama-to.20251104.gappssmtp.com header.i=@dama-to.20251104.gappssmtp.com header.b="w2Z4HDhg"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2b25cf1b5f0so26781835ad.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Apr 2026 11:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dama-to.20251104.gappssmtp.com; s=20251104; t=1775498998; x=1776103798; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KjRd2j/guPJEuyJ4mogcE8ofw18KOTulc7ao1ZGMUDs=;
        b=w2Z4HDhg1PJezTM7L4d7GIEQbA8nG1NcyAPPCtZXohOlyTaLw5WjEWbPxALTWJwdDJ
         dDha5Qxm7e6NSZGTmPLGi80ylGWh8iiBv/k8FpGYJcjMSYVoHE+Qkn6dvmSLpAQzZ/2o
         nXQ/4qAehKwWvukRxvMS71ksHiSlHVsnskXtKq0ASykSnr2uzc1QxRvhH2uM/Kjp+KaS
         EPPZt9uoNJrLvyJflz1pa6DDmejP/EFFDqaVPAhpM9dJ9GJWEcejPNtiDrpSxPSNoJgd
         nQH1769THVuM30r1Jz+p6+lgz6q3BFKg09iglaJcO4Zz3rz0TpE1mWFofryc74LlTYB8
         hnHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775498998; x=1776103798;
        h=in-reply-to:content-disposition:mime-version:references
         :mail-followup-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KjRd2j/guPJEuyJ4mogcE8ofw18KOTulc7ao1ZGMUDs=;
        b=rsFjq1u8oziJxL/HGSE+fln0GgKWHcZTahDLlwm5tVpKy1Gib7PXPnp1oYIu7BgorJ
         xKoRP/BAJNX7nm/ZA57tmpTn7I7yuDpQty/lQXFrlT+RqawbAtG4/Fh0sQypbQmd4v/a
         KW8TQgTa8uclwUFERyFTl/jQHwBup2GV+rJY+Rpmozp/ZZGf7nZUobIxYBcCGf0yAFNI
         JT6Deip+Ig5RRPDnOooHPn5+LED0gt1S9D3WYseL/wYn11YsxjO3fHDGL+ohEUwwctqC
         dbVsJonJAa4WjzS8kSGk+nEpYlRLjhqNPSa5QPE3dpSQBQl0YBCC4p29PCaRtvsXiQ+S
         3Jng==
X-Forwarded-Encrypted: i=1; AJvYcCWFBcPTcuzwLATu3mT6bU/b+wBIZQAffCJ2XKBoYn+Ix2ITYxfrzOAKAe27My7xCubBF2BVmLSfjy4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwX4NYaE8uCja66MEwVA3x2yDlcHj0EmaCH66VNfblew5SFB6Xq
	QevvR/VeAgnlOfaXO4OaR7b7t4vELOCCAOLiQYCh4tB6TxL97enKQRag9RwnkPYYgzE=
X-Gm-Gg: AeBDieumMnoFny7TA7EQOcR1lmMmSro42FbhPq9dI5mczhSMN05Ei7ZQmxZ6eW4sDFY
	PdndNrH7xQcZDjJ9RCntZOJKYAp3Nnm6Z1gbaeY/dhc2O5pfcT3jzQHSVpL6mqW6JsfqLetk1os
	Nye0oPAoeJMa72T9NYi6lfOXE3ItmfLYzNtstpq2CqsVEPbqJZtTz+r/TAY6NobYtmJbMhNBJSB
	fXqFiGEhKgKETuliAagWxoPkgqJYno6PMdl3YJ3InSs4uG+J0sSB+NrqviHqPXttUlEyDD4qz4O
	zBDJKwwMEGrzE63NVkdT7iYwQXYb9cLWgK+nRPg76QKaAlZ8yuQ/nTBa93owOAW/Z2Xu2zqry2n
	9lwiXeOtwxefhjeqTlOFf44rguhM0WvFkZHrME2w5y9nYfVD/JQdb6y3sNPna1Eif4bEIg15hX/
	xgcOg=
X-Received: by 2002:a17:903:240a:b0:2b0:c90f:449d with SMTP id d9443c01a7336-2b2816e7071mr138195105ad.19.1775498997925;
        Mon, 06 Apr 2026 11:09:57 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:8::])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b274757fa7sm143694175ad.21.2026.04.06.11.09.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Apr 2026 11:09:57 -0700 (PDT)
Date: Mon, 6 Apr 2026 11:09:56 -0700
From: Joe Damato <joe@dama.to>
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org, edumazet@google.com,
	pabeni@redhat.com, andrew+netdev@lunn.ch, horms@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	workflows@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH net-next] docs: netdev: improve wording of reviewer
 guidance
Message-ID: <adP29EHk6Rgt2y7W@devvm20253.cco0.facebook.com>
Mail-Followup-To: Joe Damato <joe@dama.to>,
	Jakub Kicinski <kuba@kernel.org>, davem@davemloft.net,
	netdev@vger.kernel.org, edumazet@google.com, pabeni@redhat.com,
	andrew+netdev@lunn.ch, horms@kernel.org, corbet@lwn.net,
	skhan@linuxfoundation.org, workflows@vger.kernel.org,
	linux-doc@vger.kernel.org
References: <20260406175334.3153451-1-kuba@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260406175334.3153451-1-kuba@kernel.org>

On Mon, Apr 06, 2026 at 10:53:34AM -0700, Jakub Kicinski wrote:
> Reword the reviewer guidance based on behavior we see on the list.
> Steer folks:
>  - towards sending tags
>  - away from process issues.
> 
> Signed-off-by: Jakub Kicinski <kuba@kernel.org>
> ---
> CC: corbet@lwn.net
> CC: skhan@linuxfoundation.org
> CC: workflows@vger.kernel.org
> CC: linux-doc@vger.kernel.org
> ---
>  Documentation/process/maintainer-netdev.rst | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 

Reviewed-by: Joe Damato <joe@dama.to>
