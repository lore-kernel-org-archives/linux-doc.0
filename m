Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924CB27CCE7
	for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 11:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747047861; cv=none; b=cZIxQ+0pDVivBGFKQ5ut0Zx1S5E63vx+fBomT3Kf1WGgq5ahN/W+WwGdtvKzEDBbZoSmLfM51J8/yP9D01QKIsUJoHqM/RIuhH7LTf6w7DIyeMSaoVtIRKEdahMbN/zQbfqxISerGjIb3tmVu40a1RL+pvANlPX0lLoYq8tDqhQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747047861; c=relaxed/simple;
	bh=i+vwYiYS0pVOypAgoRmxtkSfZdGtVSsTRWBKtrFvEDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TKEw0JGMZ9tHNccRk5NuHqD92mGUE3tVwPmmaJ1RVuXMSKXY70owbYQZ/+rlOUQe8PwIM+1Inf2DpbFFuTIazKS1A3zdSRPb7CXccziu3r6CTVS4CeGAwHBiGec6BNNROj4bmB5m+TBPWTAfJ2pHC7JG8+SP+hYm3l2xX+gahSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us; spf=none smtp.mailfrom=resnulli.us; dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b=OvPCawOF; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=resnulli.us
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=resnulli.us
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=resnulli-us.20230601.gappssmtp.com header.i=@resnulli-us.20230601.gappssmtp.com header.b="OvPCawOF"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a0bdcd7357so2922339f8f.1
        for <linux-doc@vger.kernel.org>; Mon, 12 May 2025 04:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20230601.gappssmtp.com; s=20230601; t=1747047857; x=1747652657; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=owXIYpMV48is7ez5i1gXva+BBfYXyghjaJTpHVBLlkk=;
        b=OvPCawOFhHG+a9M1lM4eEBD55Np3qYYEPEqPpSc8GiYS/1D7+EmssOrqqHtis0Kirb
         OZG4DYFBZX8esDV8Nqf2UONTbwDBcAJkPYrdyCD13/FOdzzX8ldrRDDif7HEpgMB/olu
         LF0QKmBpCZCgi4xKfIZDdlpuO6fcwqYPjcevyQTNdqPfCxFCXqERKwx7enccMPgUrv5c
         /uzgcTK/2AObTsuhE9/fB1YswlLfNTJ5SDd0FKMEQbE4jP34EcsAlMRJEhOMp6OT4/LU
         Ld0CNbtfhUQeE2Wktan2Llf7lYMSIQf8ykBac2RQw8MaXL3jKo2JUmSo93hTVzw6V2DA
         e/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747047857; x=1747652657;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=owXIYpMV48is7ez5i1gXva+BBfYXyghjaJTpHVBLlkk=;
        b=G1xTXDZ9lP3O2KpuTEqZ3c3w11ka0N+Li9XdnhvpYjRn/DUnUoTTJDWGtCTYtmizI+
         cjqrsp0J74xod3l2PSPxUiBIvMau9nQs2yQtuelfHCWuoR/FywpF0F0c7xc+hPcldcHV
         O3OqyrAg089qtlHP+gEuSf9XDSwQ+vHoaGPDBfip/F4RwseDCRD5KUf+NhSdcV4HBJzY
         3rkR1beiMHi8GuLAxoA+MTaOMFyguOkfr6swfdN5lAcM6qwUhktNv2SRJTw61SrtRa60
         CcsjruOf//L6hm0/TG1mN26UnKuhulT9E4+L/CSaRsh2R2qiTqpRF7GHfEd9jTnmgBKD
         zbpg==
X-Forwarded-Encrypted: i=1; AJvYcCWtibKC7/+MXJwI+idabJA4pD0YroU4UWlRRHoYwjTJFuEy10i14HI8dzX67H/2LwI0QDJiNHVGcLY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzOLZIik0uLAiO6S8rMnPL87lDevtl6P0MZwr8L+9F4BUgtf//A
	k/81dNqiN3IoxnRG1LXt4rR302gsFFdT7dpibGvS1SRIJV8jS/3E/x4cjUOFkno=
X-Gm-Gg: ASbGncsgVX1wYoWH60O/v9cnhmrlWdakFK4r96Zj+UlbpZi3Xm+1755mNDW2cH6krHH
	CkiVczb7yxgThChTkzyj37caKv+mzye5Paiq33iCc1x1yz9sgS7MVdNVkT2pQNKpfks8G1op3cP
	QwEl9AxawbWNtpU0lh+oMDlm8HUGb5BbUfh+C/u0S1NC0HCmSM5XREPDpc1/OWQM9PHOSPXgKAo
	90+OJesaTwgpPAvMMDDJIorRBH9+A22tfb//6eoRLbSOz9IeCJizt1L3Y8bc7d/Xwzua3Fdh5JB
	BB7sAkDNkgz/DOD5lGz9DkRvRpl/UporUXC/rjkIj2ta5WHveHq2Fd8ocbf98rdKGaag+VV5lLT
	4cxML33MfH4VnrrjUfknFyjCJSNmTaIW5
X-Google-Smtp-Source: AGHT+IHt6KtmDpEcGKKweKh0TJcjcFp4HoRFHcwbArajIswm0eri9Tb2+Y1mCu2ksq4RGxW3FEMBSA==
X-Received: by 2002:a5d:5989:0:b0:3a1:fc5a:76ed with SMTP id ffacd0b85a97d-3a1fc5a77c5mr7258447f8f.26.1747047856657;
        Mon, 12 May 2025 04:04:16 -0700 (PDT)
Received: from jiri-mlt.client.nvidia.com (37-48-1-197.nat.epc.tmcz.cz. [37.48.1.197])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a1f58f3afdsm12321070f8f.60.2025.05.12.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 04:04:16 -0700 (PDT)
Date: Mon, 12 May 2025 13:04:13 +0200
From: Jiri Pirko <jiri@resnulli.us>
To: Alper Ak <alperyasinak1@gmail.com>
Cc: kuba@kernel.org, davem@davemloft.net, edumazet@google.com, 
	pabeni@redhat.com, horms@kernel.org, corbet@lwn.net, netdev@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] documentation: networking: devlink: Fix a typo in
 devlink-trap.rst
Message-ID: <s73vdkwqfhzxtlqv5kqdkp3xxh72vgrkpz2l7y2755nzzyfqsi@wckiln42uwjj>
References: <20250512110028.9670-1-alperyasinak1@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250512110028.9670-1-alperyasinak1@gmail.com>

Mon, May 12, 2025 at 01:00:28PM +0200, alperyasinak1@gmail.com wrote:
>From: alperak <alperyasinak1@gmail.com>

This line actually screws-up the correct "from" taken from the email
headers. Avoid it.


>
>Fix a typo in the documentation: "errorrs" -> "errors".
>
>Signed-off-by: Alper Ak <alperyasinak1@gmail.com>
>---
> Documentation/networking/devlink/devlink-trap.rst | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/Documentation/networking/devlink/devlink-trap.rst b/Documentation/networking/devlink/devlink-trap.rst
>index 2c14dfe69b3a..5885e21e2212 100644
>--- a/Documentation/networking/devlink/devlink-trap.rst
>+++ b/Documentation/networking/devlink/devlink-trap.rst
>@@ -451,7 +451,7 @@ be added to the following table:
>    * - ``udp_parsing``
>      - ``drop``
>      - Traps packets dropped due to an error in the UDP header parsing.
>-       This packet trap could include checksum errorrs, an improper UDP
>+       This packet trap could include checksum errors, an improper UDP
>        length detected (smaller than 8 bytes) or detection of header
>        truncation.
>    * - ``tcp_parsing``
>--
>2.43.0
>
