Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9314230E852
	for <linux-doc@vger.kernel.org>; Fri, 20 Jun 2025 02:22:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750386174; cv=none; b=Ebyv1dvebRKxNJ7KCFxfRVI1pVibrUhv4Ctu5FNXuCVaozwff9PP7r0PuL/XAQPCQqMOf9LT2qAfBVoHqWUiyt0s6RFZIXhLrOc9DH98ryvwMOy2SkHzqrI29RCzpjmEMZ7Iuz39KuedYXaA4uovcx8QIEssNcAbbYpIp+CNC28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750386174; c=relaxed/simple;
	bh=BNKViA+SAR0e0UwRFZtcK8/8RHv1e5yWA6O8zDXWyME=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SzNbkeXQayrgPVnZe0pKctm39eaMXCljHXXafftM2r0D6IoclA7bUDPWVv72WPLEOiyklJU+fbFWEMUsx33xueHFEc605UM8P5P5MvE+k62F8nR3e2nSxNHKB8SEkRYyqXa5qVBP18NqnrveVvlrz5QEXRc4OcISdt/QmpM0CS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzKzgDab; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzKzgDab"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-23602481460so11632315ad.0
        for <linux-doc@vger.kernel.org>; Thu, 19 Jun 2025 19:22:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750386172; x=1750990972; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PrA1XgLlvhK68uDvIrbbnTXOhIt4GtSDKSjOEh3JTAY=;
        b=GzKzgDab2YsY7Gtty3cnTmNVsdyCTrsRFt8cWxST653kta/yYmTmGs+QBscs2TfdDv
         A2IxeKHobGPPBvIKMTg6nieDUW7vd3iq5pUY/o9Pt0c9MFE801O7D6wly0xZ1WItMzly
         0rIhN25szjfR1R8xb3eZFLNQzg49MWpn9PeFxZNxcazK8YkwaJxZcdX2gpDEeVAyUkeJ
         w4n+HCJIDsJo4CkQPKrFY1HAawte/8VRjX+o5YrVt9jJucab+FPO2wRrpIaaPqSihf0Z
         PA3ad1WzN3rWqE2MO+PWZ2wy45PjcfkEmpdoOBAm+BHfr6/l/xjif89F0in55oEwaBda
         RwCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750386172; x=1750990972;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PrA1XgLlvhK68uDvIrbbnTXOhIt4GtSDKSjOEh3JTAY=;
        b=UUfsYmLLRdQA4tet3C6SnGnk2WtTXT4gqG/7zsHn3iDPXByeVaygc9ZBE2ONylmEuY
         0y8pX0EIBmwuJHoO8Lqr9KuxFN8Z6kD7lEuTVPxAqUVuiSUk+4smq0H3zrbQJ2dLdtGU
         F/0yWhnmFTL2ZxL+qPbihFThN/1XIPKCRYbsfU0+iRhv5cnzNt0gkWliBGndEkL6Mzd7
         6Rgz20CeNZ207KSZMCPGXYpm49cvV5uTAv27+C/a5+zKQ+rhWD5dRu1ShKTCu+Yk/F/t
         Gg2vVnqZjWniYqQeFb0C72TMY0n3gKID2jx25pdA4DZBhdDto+bGYAPmgZ73hGoD77To
         MmAw==
X-Forwarded-Encrypted: i=1; AJvYcCUMuvWS8zF/OpsSatXK49xdDNRaqzdBd5LtP6+OML1tpxbyruVaAZYUhmxzd8Yb1Uw7GhjYTCd23To=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9Cl/5yk1ic4U5s7Jxx3igxbTDmL71or+WPDEboe3b4OKESTqR
	3GRAivHmaYxYhyzoBwUx9AXsofdowUzgdbX+AH+/7sEac1j4I6dJlxvF
X-Gm-Gg: ASbGnctUsH4Z8130+hXv6mc8F/WxJLEpvNt8Rw1aQLsNpuTGoGl6vyIfjmD/cOQk554
	bAQMXrrqXM9mi93pZbAOefY8RwaZXD+Mm7QNCv+b9ZJWMNvtv8Y6UMdajfjUglFr5rCKetDIZ7X
	3kcbtQkfta68UPg9lB8hrpSeFjg1tCzqn565e6uLkiavm/2hGY+wsUkJY40YOoaD53e8DC0htx3
	nl6COjKosuCxOUgDRsXlAZw24td/f0dhV0ncQIsVf//IZsb9BKL6ug8QSmxMP/B0GH4z9N5iqXq
	CoSnW6xcYTKfRNFR2nF6p76mui+zcIzWYc55dJ+9xgD3S0X0gfFG9NaBBknP/Q7YzUsjSkx50g5
	raA6o8cA9WvhM87BAXOJDnfULnIcAy/+a
X-Google-Smtp-Source: AGHT+IErShXQOaH/K6D+18eYYGCK5oKLpDGpQMSKohyyMwH+JhXp0R2ljf+2wntSebkiSgcXd7ed7A==
X-Received: by 2002:a17:902:ef0b:b0:234:cf24:3be8 with SMTP id d9443c01a7336-237d999177bmr13983675ad.28.1750386171791;
        Thu, 19 Jun 2025 19:22:51 -0700 (PDT)
Received: from [10.0.2.15] (KD106167137155.ppp-bb.dion.ne.jp. [106.167.137.155])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8700ab7sm5788615ad.224.2025.06.19.19.22.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jun 2025 19:22:51 -0700 (PDT)
Message-ID: <03285fe4-61f5-429f-9535-5c826536d4b7@gmail.com>
Date: Fri, 20 Jun 2025 11:22:48 +0900
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: docs: sphinx: avoid using the deprecated node.set_class()
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org,
 Akira Yokosawa <akiyks@gmail.com>
References: <87wm97fmn3.fsf@trenco.lwn.net>
Content-Language: en-US
From: Akira Yokosawa <akiyks@gmail.com>
In-Reply-To: <87wm97fmn3.fsf@trenco.lwn.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Jon,

On Thu, 19 Jun 2025 15:26:56 -0600, Jonathan Corbet wrote:
> Docutils emits a deprecation warning when the set_class() element method is
> used; that warning disappears into the ether, but it also causes a crash
> with docutils 0.19 when combined with certain versions of Sphinx.

To be accurate, I'd rather say:
                                                but it also causes a crash
  with docutils 0.19 when combined with any version of Sphinx whose
  requirement accepts it.

> 
> Avoid the deprecated function and just append directly to the "classes"
> attribute like the documentation says instead.

Nice!  This is the kind of fix I wish I could have come up with by myself.

Tested OK against debian:12's Sphinx 5.3.0, as well as Sphinx 3.4.3 of
debian:11 and almalinux:9, Sphinx 4.2.0 of Ubuntu 22.04 and other recent
distro Sphinx packages.

> 
> Reported-by: Akira Yokosawa <akiyks@gmail.com>

Closes: https://lore.kernel.org/de7bae91-3200-481f-9db2-c0dc382c91dd@gmail.com/

> Fixes: d6d1df92c25f ("docs: automarkup: Mark up undocumented entities too")
> Signed-off-by: Jonathan Corbet <corbet@lwn.net>

Tested-by: Akira Yokosawa <akiyks@gmail.com>

> ---
> TODO for the future: figure out where the warning is going
>
>  Documentation/sphinx/automarkup.py | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
> index e67eb8e19c22..563033f764bb 100644
> --- a/Documentation/sphinx/automarkup.py
> +++ b/Documentation/sphinx/automarkup.py
> @@ -240,7 +240,7 @@ def add_and_resolve_xref(app, docname, domain, reftype, target, contnode=None):
>      # mark it as a broken xref
>      #
>      if contnode:
> -        contnode.set_class("broken_xref")
> +        contnode['classes'].append("broken_xref")
>      return contnode
>  
>  #

