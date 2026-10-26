Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974108;
	b=0Jiaaa/zSWFitpyDw+N9TWS2NvR1LnJcrulyOkkBtJsKz5g7rcE+6p9n16xUPm7vDoIr
	 GRurf3zHhe7ekfGx5Mpeh8Nv/0PdXWZuf6+Xodbgz/rfiX1vP7Z3fg1xZikS1sMzUiqFN
	 fsq15nMCst6BJAnyq7gOVKt3QGo12mtW+fC38byu3kRwugz+63n0VPODvIIVJK0voR4q4
	 D1rTcZ5Yc+l8CPf6OvTOvVpJ77NKnSX+rEVvF8D3BINp3LQPucbruZVvLsILkfif6wYFR
	 zBn198pKbsd0gAtEItMzEkzxsXANAhvQxpZfTK5AHVSp8BDzVs0JW7acSnj2lbPNPzw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974108;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
	b=E2TvUjTk2gpzBezQCznGFntzVKBWOvhEJuGWg2QPWovuMg5bLWjJjpzRERYtTyNdjYb/
	 ztWojVUZNFR+lnx8uV0mUAWg0aDik6EGjZDAShonI/krW2RWX318S8W7kS/4MXOj7onga
	 qD8D0WjM0LcuSrKPE9CnIzy5RPfXzr1qpMl+xWWgYfa2u856xm21tfjMnfuUWUFjLSObi
	 Eby4JHten867DeOlaWoEqxPiIoAN9lI3/E7pVC4RCCTvBSORM1uKgTlghAMjGB2nI2GJI
	 LfZFJfdW6F/sxRbw3nJ9TJR5LkCcEmasVZ2FNncITTUkWs+I8tx/B3BiM0+XP/FNOvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaWCDMoZ;
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EE1F606A31A
	for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2026 00:21:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EE1F606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=PaWCDMoZ
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ac91ac8924so1259705a91.1
        for <linux-doc@vger.kernel.org>; Sun, 25 Oct 2026 17:21:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974108; x=1793578908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
        b=PaWCDMoZw3yyRXDbrZSfczHaQ70JsNzuYgXW5+vKreMrNfKI/R1/pd7t9uJN9wydW1
         NFhsvXTxkU3uJgQxascjIiJomFOFD7q+nqJ/3/wMUCoYxhQ7E5hnOBut+N1Mio8Q5Rlm
         7/zajJYrpMuLKsmFUqztordEMNVM6rm+iQyIo4DxEh881mIvq+e3q08DFPYzIUIdJ4C0
         vDXil6cWPkdSLKlOeNhfKKyyvNbtm63VL4tH4n+JAL7Vgqm1eoQA9SyqG4mtPEhdYnHx
         wvOoNpdd1Ct3X6Emj1HTHX+FWL0I+IRY4DvA0MhSEV3HRfxJUCkfWIBcbR4D700wMH61
         yaHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974108; x=1793578908;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=pKcKgfb8CvKyXWoirq734eSIdlRSGIIBpTLfxYawV4M=;
        b=PJAfrowwqWm8F05z8Ojtv2VJ37urxxKiJ31PVeSrIFbQnduXM9OW8iibUNzFh41xpH
         VxMj+J/g+VPpMfM3OpaLl5PYTNCP16dbs3sr9Ufgpy71aRQ2NSiuU4Pqm3Ql9p9GrtBl
         qXVpGvSVrHgCYVOrwTuUx7ykk+Y/cjusprUDd02Fjjt4VHXAGdNENs0MxcC3483oKSRM
         3P80N3yxhpy45fKqIBeqED4mjO75Gq9Bxe0teeLWMAw+8tAu9cRhjvdsLpkaNzLUnJ3Y
         TdID3olYfCufm82upr2SPvsp0O6X/tTfxpwW2nMm7XeLpwqyhGCKDRcyY1XRv0ESkMcj
         veRQ==
X-Forwarded-Encrypted: i=1; AKwUvBwfOH253SBwmlIbG4qo/OzixdaT6fZ3vgHDJd/T+7z7V3AT2L7X6kSeULYShssjspFu63m3F8bl3gw=@vger.kernel.org
X-Gm-Message-State: AFq9FYKHK1vK6tV0UI8NXce8yaXJYC5nYwbdViS+CUOckVHTNj0zKtSX
	R5w8SeX+HacAWpEhzZs4tzSW3vYhUo7yEnQVatfvvUquSUYfFw07MjgV
X-Gm-Gg: AYBFou0wVMbLyfk/r1jCmNYwdlOe8ru4OWIPA+IZvQBcCov70uMw9ZeIRQ1Zfw0Mslz
	Gktgvls6G1RYxiUl51wBzCqJFfPQdPxq/52nerwGI1VuIO+8r4JLcIduuXd4lVEw9m7oh5wgl47
	KqQae6fjv0G58dJFTVJg5ZPlf98vxo7slwI+F2jjCe8wxGKlPQeDiSe/wvICyVY0cwiT/z/1FrQ
	8C15wpJlIYnmaWNIlxMaXorDaHMjwnNwuqhaI5ZsUqy1Qs8q4uPxv0exgnH1dilwVf7MEWy1/8i
	93Si69pSZL+W35Avsc5Igjdao5bRUy+dtq2M68MAZneu1+mZB1zQCOPmbBf+Xxx4TuqLGFrXjc7
	mwDXFNo5UKKp1XDyrotDJB9vGSqjnV2r3I+/QawIXStOBgG8KS3aZhC1bwm1RLLNfWAVCyUpdJN
	a9h5qkNk62tkzuURjFd36bXqlzgHWfGoZg2mP/6QweyeBCbixah4+9sLLFOVBGws2N9VujW7trN
	XHDKswxnocooeHnZ35mCSOsSuOzPollZtjL7V9sySEfgibcb8C+coGuvK4/AuIh43FT1JS+u3Bv
	OBUhrXNLV1+PBm0=
X-Received: by 2002:a17:90b:1b0e:b0:398:c3ca:1ebc with SMTP id 98e67ed59e1d1-3adea89942bmr4456329a91.18.1792974107750;
        Sun, 25 Oct 2026 17:21:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe6af0dsm6015077a91.5.2026.10.25.17.21.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:21:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:21:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: hsyemail2@gmail.com
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/2] hwmon: (lm75) Add support for Nuvoton NCT7715
Message-ID: <94bac7e7-9ec2-436e-9612-7e0e62d8e66b@roeck-us.net>
References: <20260918084042.19541-1-syhuang3@nuvoton.com>
 <20260918084042.19541-3-syhuang3@nuvoton.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260918084042.19541-3-syhuang3@nuvoton.com>

On Fri, Sep 18, 2026 at 04:40:41PM +0800, hsyemail2@gmail.com wrote:
> From: Sheng-Yuan Huang <syhuang3@nuvoton.com>
> 
> The Nuvoton NCT7715 is compatible with the LM75 temperature and
> limit register layout. Its 16-bit configuration register shares the
> TMP112 configuration layout.
> 
> Signed-off-by: Sheng-Yuan Huang <syhuang3@nuvoton.com>

Applied.

Thanks,
Guenter
